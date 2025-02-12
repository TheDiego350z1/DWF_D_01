<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="com.recursoshumanos.webrrhh.modelo.Empleado" %>
<%
    Empleado empleado = (Empleado) request.getAttribute("empleado");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Eliminar Empleado</title>
</head>
<body>
<h2>Eliminar Empleado</h2>
<p>¿Estás seguro de que deseas eliminar a <strong><%= empleado.getNombrePersona() %></strong> con DUI <strong><%= empleado.getNumeroDui() %></strong>?</p>
<form action="empleado" method="get">
    <input type="hidden" name="action" value="delete">
    <input type="hidden" name="id" value="<%= empleado.getIdEmpleado() %>">
    <button type="submit">Eliminar</button>
</form>
<br>
<a href="empleado">Cancelar</a>
</body>
</html>

