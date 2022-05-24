using pruebatecnica.Controllers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pruebatecnica.Views.Administrador
{
    public partial class ConsultaGiro : System.Web.UI.Page
    {
        CIUDADESController Ciudades = new CIUDADESController();
        DataTable aux;
        public DataRow dato;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                TraerCiudades();
                


            }
        }

        public void TraerCiudades()
        {

            list_info.DataSource = Ciudades.MostrarlistaCiudades();
            list_info.DataBind();



        }


       

        public void DetalleCiudad(object sender, CommandEventArgs e)
        {
            if (e.CommandName.Equals("asignar"))
            {



                string idCiudad = (e.CommandArgument.ToString());
                Session["idCiudad"] = idCiudad;

                aux = Ciudades.MostrarNombreCiudad(idCiudad);
                if (aux.Rows.Count > 0)
                {


                    dato = aux.Rows[0];

                    Session["NombreCiudad"] = dato["nombre"].ToString();
                    



                }


                Response.Redirect("~/Views/Administrador/DetalleCiudad.aspx");



            }


        }
    }
}