using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace pruebatecnica.BD
{
    public class BdComun
    {
        private string cadenaSQL = string.Empty;
        public SqlConnection conexion;


        public BdComun()
        {




            cadenaSQL = "Server=(localdb)\\mssqllocaldb;Database=Giros;Trusted_Connection=True;MultipleActiveResultSets=true";


            conexion = new SqlConnection(cadenaSQL);


        }

        public string GetCadenaSQL()
        {
            return cadenaSQL;
        }











        public SqlConnection ConexionSQL()
        {
            SqlConnection Connection = new SqlConnection(cadenaSQL);

            try
            {
                Connection.Open();

            }
            catch (Exception exc)
            {
                throw new Exception("No se realizó la conexión a la base de pameters: " + exc.Message);
            }

            return Connection;
        }



        // consulta en el backend
        public DataTable EjecutarConsulta(string sentencia, CommandType TipoComando)
        {
            SqlDataAdapter adaptador = new SqlDataAdapter
            {
                SelectCommand = new SqlCommand(sentencia, conexion)
            };
            adaptador.SelectCommand.CommandType = TipoComando;

            DataSet resultado = new DataSet();
            adaptador.Fill(resultado);

            return resultado.Tables[0];
        }



        // insert por procedure
        public bool Transaction(Transaction[] list)
        {
            bool state = false;
            _ = new SqlConnection();
            SqlCommand cmd = null;
            SqlConnection conn = ConexionSQL();

            SqlTransaction Transa = conn.BeginTransaction();

            try
            {
                for (int i = 0; i < list.Length; i++)
                {
                    if (list[i] == null) continue;

                    cmd = new SqlCommand(list[i].Procedure, conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    foreach (Parameter obj in list[i].Parameters)
                    {

                        cmd.Parameters.AddWithValue(obj.Name, obj.Value);

                    }
                    cmd.Transaction = Transa;
                    cmd.ExecuteNonQuery();
                }
                Transa.Commit();
                conn.Close();
                conn.Dispose();
                Transa.Dispose();
                state = true;
            }
            catch (Exception e)
            {

                Transa.Rollback();
                conn.Close();
                conn.Dispose();
                state = false;
                throw new Exception("Sentencia SQL de consulta inválida: " + e.Message);
            }
            finally
            {
                if (cmd != null)
                {
                    cmd.Dispose();
                }
            }
            return state;
        }

        //  Consultas por procedure//////////////////////////////////////////////////////////////////////

        public DataTable Query(string procedure, Parameter[] pameters)
        {
            DataTable data = new DataTable();
            SqlConnection mySqlConnection = ConexionSQL();
            SqlCommand mySqlCommand = new SqlCommand
            {
                CommandText = procedure,
                CommandType = CommandType.StoredProcedure
            };

            if (pameters != null)
            {
                for (int i = 0; i < pameters.Length; i++)
                {
                    mySqlCommand.Parameters.AddWithValue(pameters[i].Name, pameters[i].Value);
                }
            }

            mySqlCommand.Connection = mySqlConnection;

            try
            {
                SqlDataAdapter da = new SqlDataAdapter(mySqlCommand);
                da.Fill(data);
                return data;
            }
            catch (Exception exc)
            {
                throw new Exception("Sentencia SQL de consulta inválida: " + exc.Message);
            }
            finally
            {
                mySqlConnection.Close();
                mySqlConnection.Dispose();
            }
        }


    }
}