using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pruebatecnica.Models
{
    public class GIROS
    {

		public int GIR_GIRO_ID { get; set; }
		public string GIR_RECIBO { get; set; }
		public int GIR_CIUDAD_ID { get; set; }

		public GIROS(int GIR_GIRO_ID_, string GIR_RECIBO_, int GIR_CIUDAD_ID_)
		{
			this.GIR_GIRO_ID = GIR_GIRO_ID_;
			this.GIR_RECIBO = GIR_RECIBO_;
			this.GIR_CIUDAD_ID = GIR_CIUDAD_ID_;
		}



	}
}