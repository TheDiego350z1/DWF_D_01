<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lista de Empleados</title>
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
    </style>
</head>
<body>
<h1>Lista de Empleados</h1>
<a href="agregarEmpleado.jsp">Agregar Nuevo Empleado</a>
<table>
    <tr>
        <th>ID</th>
        <th>DUI</th>
        <th>Nombre</th>
        <th>Usuario</th>
        <th>Teléfono</th>
        <th>Correo</th>
        <th>Fecha de Nacimiento</th>
        <th>Acciones</th>
    </tr>
    <c:forEach var="emp" items="${empleados}">
        <tr>
            <td>${emp.idEmpleado}</td>
            <td>${emp.numeroDui}</td>
            <td>${emp.nombrePersona}</td>
            <td>${emp.usuario}</td>
            <td>${emp.numeroTelefono}</td>
            <td>${emp.correoInstitucional}</td>
            <td>${emp.fechaNacimiento}</td>
            <td>
                <a href="editarEmpleado.jsp?id=${emp.idEmpleado}">Editar</a> |
                <a href="empleado?action=delete&id=${emp.idEmpleado}" onclick="return confirm('¿Seguro que quieres eliminar este empleado?')">Eliminar</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
