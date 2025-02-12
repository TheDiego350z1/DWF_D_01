package com.recursoshumanos.webrrhh.dao;

import com.recursoshumanos.webrrhh.db.DatabaseConnection;
import com.recursoshumanos.webrrhh.modelo.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {
    public List<Empleado> obtenerEmpleados() {
        List<Empleado> lista = new ArrayList<>();
        String sql = "SELECT * FROM empleados";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Empleado emp = new Empleado(
                        rs.getInt("idEmpleado"),
                        rs.getString("numeroDui"),
                        rs.getString("nombrePersona"),
                        rs.getString("usuario"),
                        rs.getString("numeroTelefono"),
                        rs.getString("correoInstitucional"),
                        rs.getString("fechaNacimiento")
                );
                lista.add(emp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public void agregarEmpleado(Empleado emp) {
        String sql = "INSERT INTO empleados (numeroDui, nombrePersona, usuario, numeroTelefono, correoInstitucional, fechaNacimiento) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, emp.getNumeroDui());
            ps.setString(2, emp.getNombrePersona());
            ps.setString(3, emp.getUsuario());
            ps.setString(4, emp.getNumeroTelefono());
            ps.setString(5, emp.getCorreoInstitucional());
            ps.setString(6, emp.getFechaNacimiento());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Empleado obtenerEmpleadoPorId(int id) {
        String sql = "SELECT * FROM empleados WHERE idEmpleado = ?";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Empleado(
                        rs.getInt("idEmpleado"),
                        rs.getString("numeroDui"),
                        rs.getString("nombrePersona"),
                        rs.getString("usuario"),
                        rs.getString("numeroTelefono"),
                        rs.getString("correoInstitucional"),
                        rs.getString("fechaNacimiento")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void actualizarEmpleado(Empleado emp) {
        String sql = "UPDATE empleados SET numeroDui=?, nombrePersona=?, usuario=?, numeroTelefono=?, correoInstitucional=?, fechaNacimiento=? WHERE idEmpleado=?";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, emp.getNumeroDui());
            ps.setString(2, emp.getNombrePersona());
            ps.setString(3, emp.getUsuario());
            ps.setString(4, emp.getNumeroTelefono());
            ps.setString(5, emp.getCorreoInstitucional());
            ps.setString(6, emp.getFechaNacimiento());
            ps.setInt(7, emp.getIdEmpleado());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminarEmpleado(int id) {
        String sql = "DELETE FROM empleados WHERE idEmpleado=?";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
