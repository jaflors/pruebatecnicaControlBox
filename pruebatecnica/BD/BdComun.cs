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


        private string stringConnection = ConfigurationManager.ConnectionStrings["conexion_sql"].ConnectionString;
        
       

        public SqlConnection ConexionSQL()
        {
            SqlConnection Connection = new SqlConnection(stringConnection);

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

        

        


        

       
       

       

        //    jhjbhj//////////////////////////////////////////////////////////////////////

        public DataTable Query(string procedure, Parameter[] pameters)
        {
            DataTable data = new DataTable();
            SqlConnection mySqlConnection = ConexionSQL();
            SqlCommand mySqlCommand = new SqlCommand();
            mySqlCommand.CommandText = procedure;
            mySqlCommand.CommandType = CommandType.StoredProcedure;

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