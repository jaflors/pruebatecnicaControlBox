<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="ConsultaGiro.aspx.cs" Inherits="pruebatecnica.Views.Administrador.ConsultaGiro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <form runat="server">
                    <div class="x_title">
                        <h2>Consultar Giros<small>Users</small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>




                    <div class="x_content">

                        <table id="datatable" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>id_ciudad</th>
                                    <th>CIUDAD</th>
                                    <th>PAIS</th>
                                    <th>Acción </th>



                                </tr>
                            </thead>


                            <tbody>

                                <asp:ListView runat="server" ID="list_info">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("id_ciudad")%> </td>
                                            <td><%#Eval("CIUDAD")%> </td>
                                            <td><%#Eval("PAIS")%> </td>
                                            <td>



                                                <asp:LinkButton CommandArgument='<%#Eval("id_ciudad")%>' CssClass="btn btn-info btn-xs" OnCommand="DetalleCiudad" runat="server" CommandName="asignar"><i class="fa fa-pencil"></i>
                                             IR</asp:LinkButton>





                                            </td>



                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>

                            </tbody>
                        </table>

                    </div>
                </form>
            </div>

        </div>
    </div>







</asp:Content>
