using pruebatecnica.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pruebatecnica.Views.Administrador
{
    public partial class DetalleCiudad : System.Web.UI.Page
    {
        CIUDADESController Ciudades = new CIUDADESController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                list_info.DataSource = Ciudades.MostrarDetalleCiudad(Session["idCiudad"].ToString());
                list_info.DataBind();


               

            }


        }
    }
}