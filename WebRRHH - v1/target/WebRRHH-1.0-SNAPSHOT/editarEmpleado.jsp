<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="com.recursoshumanos.webrrhh.modelo.Empleado" %>
<%
    Empleado empleado = (Empleado) request.getAttribute("empleado");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Editar Empleado</title>
</head>
<body>
<h2>Editar Empleado</h2>
<form action="empleado" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="idEmpleado" value="<%= empleado.getIdEmpleado() %>">
    <label>DUI:</label>
    <input type="text" name="numeroDui" value="<%= empleado.getNumeroDui() %>" required><br>
    <label>Nombre:</label>
    <input type="text" name="nombrePersona" value="<%= empleado.getNombrePersona() %>" required><br>
    <label>Usuario:</label>
    <input type="text" name="usuario" value="<%= empleado.getUsuario() %>" required><br>
    <label>Teléfono:</label>
    <input type="text" name="numeroTelefono" value="<%= empleado.getNumeroTelefono() %>" required><br>
    <label>Correo Institucional:</label>
    <input type="email" name="correoInstitucional" value="<%= empleado.getCorreoInstitucional() %>" required><br>
    <label>Fecha Nacimiento:</label>
    <input type="date" name="fechaNacimiento" value="<%= empleado.getFechaNacimiento() %>" required><br>
    <button type="submit">Actualizar</button>
</form>
<br>
<a href="empleado">Volver a la lista</a>
</body>
</html>
