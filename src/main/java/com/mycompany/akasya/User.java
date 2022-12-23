/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.akasya;

import java.sql.*;

/**
 *
 * @author sedat
 */
public class User {
    int ID;
    String name;
    String password;
    String email;
    String phone;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public boolean AddUser() {
        String sql = "INSERT INTO `Users`(`ID`, `Name`, `Email`, `Password`, `Phone`) VALUES (NULL, '"+this.name+"', '"+this.email+"', '"+this.password+"', '"+this.phone+"')";
        
        if(!CheckUser(this.getEmail(), this.getPassword())){
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://app.sobiad.com:3306/grup2?useUnicode=yes&characterEncoding=UTF-8", "grup2", "grup2");
                Statement stmt = con.createStatement();
                stmt.execute(sql);
                con.close();
            } catch (Exception e) {
                System.out.println("Bir hatayla karşılaşıldı \n"+e);
            }
            return true;
        }
        else
            return false;
    }
    public boolean CheckUser(String email, String pass) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://app.sobiad.com:3306/grup2?useUnicode=yes&characterEncoding=UTF-8", "grup2", "grup2");
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM `Users` WHERE `Email` LIKE '" + email + "' AND `Password` LIKE '" + pass + "' ";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                return true;
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
