package com.recursoshumanos.webrrhh.controlador;

import com.recursoshumanos.webrrhh.dao.EmpleadoDAO;
import com.recursoshumanos.webrrhh.modelo.Empleado;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/empleado")
public class EmpleadoServlet extends HttpServlet {
    private final EmpleadoDAO empleadoDAO = new EmpleadoDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        List<Empleado> empleados = empleadoDAO.obtenerEmpleados();
        request.setAttribute("empleados", empleados);
        request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String numeroDui = request.getParameter("numeroDui");
            String nombrePersona = request.getParameter("nombrePersona");
            String usuario = request.getParameter("usuario");
            String numeroTelefono = request.getParameter("numeroTelefono");
            String correoInstitucional = request.getParameter("correoInstitucional");
            String fechaNacimiento = request.getParameter("fechaNacimiento");

            Empleado nuevoEmpleado = new Empleado(0, numeroDui, nombrePersona, usuario, numeroTelefono, correoInstitucional, fechaNacimiento);
            empleadoDAO.agregarEmpleado(nuevoEmpleado);
            response.sendRedirect("empleado");
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("idEmpleado"));
            String numeroDui = request.getParameter("numeroDui");
            String nombrePersona = request.getParameter("nombrePersona");
            String usuario = request.getParameter("usuario");
            String numeroTelefono = request.getParameter("numeroTelefono");
            String correoInstitucional = request.getParameter("correoInstitucional");
            String fechaNacimiento = request.getParameter("fechaNacimiento");

            Empleado empleadoActualizado = new Empleado(id, numeroDui, nombrePersona, usuario, numeroTelefono, correoInstitucional, fechaNacimiento);
            empleadoDAO.actualizarEmpleado(empleadoActualizado);
            response.sendRedirect("empleado");
        }
    }
}
