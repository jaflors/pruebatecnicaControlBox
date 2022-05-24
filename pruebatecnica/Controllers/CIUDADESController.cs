using pruebatecnica.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace pruebatecnica.Controllers
{
    public class CIUDADESController
    {
        public CIUDADES Ciudad = new CIUDADES();
        public CIUDADESController()
        {
            Ciudad = new CIUDADES();

        }

        public DataTable MostrarNombreCiudad(string id)
        {
            return Ciudad.BuscarNombreCiudad(id);
        }
        public DataTable MostrarDetalleCiudad(string id)
        {
            return Ciudad.BuscarDetalleCiudad(id);
        }

        public DataTable MostrarlistaCiudades( )
        {
            return Ciudad.Mostrar();
        }

    }
}