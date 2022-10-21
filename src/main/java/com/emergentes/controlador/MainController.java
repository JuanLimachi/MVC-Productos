package com.emergentes.controlador;

import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //  Verificar si la coleccion de "Producto" ya existe en el objeto session
        HttpSession ses = request.getSession();
        if(ses.getAttribute("listPro") == null){
            //  Crear la coleccion y almacenarla en el objeto session
            ArrayList<Producto> listAux = new ArrayList<Producto>();
            //  Colocar listAux como atributo de session
            ses.setAttribute("listPro", listAux);
        }
        ArrayList<Producto> almacen = (ArrayList<Producto>)ses.getAttribute("listPro");
        
        String op = request.getParameter("op");
        String opcion = (op != null) ? op : "view";
        
        //  Creamos un objeto para almacenar los registros
        Producto pro = new Producto();
        int id, pos;
        
        switch(opcion){
            case "nuevo":   //  Insertar nuevo registro
                request.setAttribute("miProducto", pro);
                request.getRequestDispatcher("NuevoEditar.jsp").forward(request, response);
                break;
            case "editar":  //  Modificar registro
                id = Integer.parseInt(request.getParameter("id"));
                pos = BuscarIndice(request, id);
                pro = almacen.get(pos);
                request.setAttribute("miProducto", pro);
                request.getRequestDispatcher("NuevoEditar.jsp").forward(request, response);
                break;
            case "eliminar":    //  Eliminar registro
                id = Integer.parseInt(request.getParameter("id"));
                pos = BuscarIndice(request, id);
                almacen.remove(pos);
                response.sendRedirect("index.jsp");
                break;
            case "view":
                response.sendRedirect("index.jsp");
                break;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        ArrayList<Producto> almacen = (ArrayList<Producto>)ses.getAttribute("listPro");
        
        Producto pro = new Producto();
        
        pro.setId(Integer.parseInt(request.getParameter("id")));
        pro.setDescripcion(request.getParameter("descripcion"));
        pro.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
        pro.setPrecio(Double.parseDouble(request.getParameter("precio")));
        
        int idtem = pro.getId();
        
        if(idtem == 0){
            pro.setId(UltimoId(request));
            almacen.add(pro);
        } else {
            almacen.set(BuscarIndice(request, idtem), pro);
        }
        response.sendRedirect("index.jsp");
    }
    
    private int UltimoId(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Producto> almacen = (ArrayList<Producto>)ses.getAttribute("listPro");
        
        int idAux = 0;
        for(Producto item : almacen){
            idAux = item.getId();
        }
        
        return idAux + 1;
    }
    
    private int BuscarIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Producto> almacen = (ArrayList<Producto>)ses.getAttribute("listPro");
        
        int i = 0;
        if(almacen.size() > 0){
            while(i < almacen.size()){
                if(almacen.get(i).getId() == id){
                    break;
                } else {
                    i++;
                }
            }
        }
        return i;
    }
}
