<%@page import="com.emergentes.modelo.Producto"%>
<%
    Producto item = (Producto)request.getAttribute("miProducto");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="text-align: center">
        <h1 style="margin: 40px auto 0px auto;"><%= (item.getId() == 0)? "NUEVO PRODUCTO" : "EDITAR PRODUCTO"%></h1>
        <fieldset style="width:50%; margin: 20px auto 0px auto;" >
            <form action="MainController" method="post">
                <input type="hidden" name="id" value="<%= item.getId() %>">
                <table style="margin: 10px auto;">
                    <tr>
                        <td>DESCRIPCIÓN</td>
                    </tr>
                    <tr>
                        <td>
                            <input style="text-align: center" type="text" name="descripcion" value="<%= item.getDescripcion()%>">
                        </td>
                    </tr>
                    <tr>
                        <td>CANTIDAD</td>
                    </tr>
                    <tr>
                        <td>
                            <input style="text-align: center" type="text" name="cantidad" value="<%= item.getCantidad()%>">
                        </td>
                    </tr>
                    <tr>
                        <td>PRECIO</td>
                    </tr>
                    <tr>
                        <td>
                            <input style="text-align: center" type="text" name="precio" value="<%= item.getPrecio()%>">
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 20px">
                            <input type="submit" value="ENVIAR">
                        </td>
                    </tr>
                </table>
            </form>
        </fieldset>
    </body>
</html>
