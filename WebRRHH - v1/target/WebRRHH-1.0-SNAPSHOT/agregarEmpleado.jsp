<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Agregar Empleado</title>
</head>
<body>
<h2>Agregar Nuevo Empleado</h2>
<form action="empleado" method="post">
    <input type="hidden" name="action" value="add">
    <label>DUI:</label>
    <input type="text" name="numeroDui" required><br>
    <label>Nombre:</label>
    <input type="text" name="nombrePersona" required><br>
    <label>Usuario:</label>
    <input type="text" name="usuario" required><br>
    <label>Teléfono:</label>
    <input type="text" name="numeroTelefono" required><br>
    <label>Correo Institucional:</label>
    <input type="email" name="correoInstitucional" required><br>
    <label>Fecha Nacimiento:</label>
    <input type="date" name="fechaNacimiento" required><br>
    <button type="submit">Guardar</button>
</form>
<br>
<a href="empleado">Volver a la lista</a>
</body>
</html>

