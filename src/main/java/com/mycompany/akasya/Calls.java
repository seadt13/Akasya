/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.akasya;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author sedat
 */
public class Calls {
    int ID;
    String clientName;
    String location;
    

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
    
    public void callTaxi(String name, String location, String dt) {
        String sql = "INSERT INTO `Calls`(`ID`, `ClientsName`, `Location`, `Datetime`) VALUES(NULL, '"+name+"', '"+location+"', '"+dt+"')";
        System.out.println("sql = " + sql);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://app.sobiad.com:3306/grup2?useUnicode=yes&characterEncoding=UTF-8", "grup2", "grup2");
            Statement stmt = con.createStatement();
            stmt.execute(sql);
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void addDriver(String dname, int id) {
        String sql = "UPDATE Calls SET DriversName='"+dname+"' WHERE ID="+id;
        System.out.println("sql = " + sql);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://app.sobiad.com:3306/grup2?useUnicode=yes&characterEncoding=UTF-8", "grup2", "grup2");
            Statement stmt = con.createStatement();
            stmt.execute(sql);
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

