using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pruebatecnica.Models
{
    public class PAISES
    {
		public int id_pais { get; set; }
		public string nombre { get; set; }

		public PAISES(int id_pais_, string nombre_)
		{
			this.id_pais = id_pais_;
			this.nombre = nombre_;
		}


	}
}