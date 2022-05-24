using pruebatecnica.BD;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace pruebatecnica.Models
{
    public class CIUDADES
    {
		readonly BdComun conn = new BdComun();
		public int id_ciudad { get; set; }
		public string nombre { get; set; }
		public int id_pais { get; set; }

        public CIUDADES()
        {
        }

        public CIUDADES(int id_ciudad_, string nombre_, int id_pais_)
		{
			this.id_ciudad = id_ciudad_;
			this.nombre = nombre_;
			this.id_pais = id_pais_;
		}

		public DataTable Mostrar()
		{
			return conn.Query("Mostrar_Cuidades", null);
		}

		public DataTable BuscarNombreCiudad(string IdCiudad)
		{

			Parameter[] para = new Parameter[1];
			para[0] = new Parameter("@p_IdCiudad", IdCiudad);

			return conn.Query("MostrarNombreCiudad", para);


		}
		public DataTable BuscarDetalleCiudad(string IdCiudad)
		{

			Parameter[] para = new Parameter[1];
			para[0] = new Parameter("p_IdCiudad", IdCiudad);

			return conn.Query("Mostrar_Detale", para);


		}


	}
}