<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Producto"%>
<%
    ArrayList<Producto> almacen= (ArrayList<Producto>)session.getAttribute("listPro");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .tabla tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            th, td {
                padding-top: 10px;
                padding-bottom: 10px;
                padding-left: 15px;
                padding-right: 15px;
            } 
        </style>
    </head>
    <body style="text-align: center">
        <h1 style="margin: 40px auto 0px auto;">PRODUCTOS</h1>
        <fieldset style="width:50%; margin: 20px auto 0px auto;" >
            <div style="text-align: left; margin: 10px auto">
                <a href="MainController?op=nuevo"><b>NUEVO</b></a>
            </div>
            <div class="tabla">
                <table border="1" style="margin: 10px auto;">
                    <tr>
                        <th>ID</th>
                        <th>DESCRIPCI&Oacute;N</th>
                        <th>CANTIDAD</th>
                        <th>PRECIO</th>
                    </tr>
                    <%
                        if(almacen != null){
                            for(Producto item : almacen){                                
                    %>
                    <tr>
                        <td><%= item.getId() %></td>
                        <td><%= item.getDescripcion() %></td>
                        <td><%= item.getCantidad() %></td>
                        <td><%= item.getPrecio() %></td>
                        <td><a href="MainController?op=editar&id=<%= item.getId() %>">EDITAR</a></td>
                        <td><a href="MainController?op=eliminar&id=<%= item.getId() %>"
                               onclick='return confirm("¿Estas seguro de eliminar el producto \"<%= item.getDescripcion() %>\" ?")'>ELIMINAR</a></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </table>
            </div>
        </fieldset>
    </body>
</html>
