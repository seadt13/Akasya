/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.akasya;

/**
 *
 * @author sedat
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.mycompany.akasya.User;

/**
 *
 * @author sedat
 */
public class db {
    User newUser=new User();
// public void AddUser(String name, String email,String password,String phone) {
//        String sql = "INSERT INTO `Users`(`ID`, `Name`, `Email`, `Password`, `Phone`) VALUES (NULL, '"+name+"', '"+email+"', '"+password+"', '"+phone+"')";
//        System.out.println("sql = " + sql);
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection con = DriverManager.getConnection(
//                    "jdbc:mysql://app.sobiad.com:3306/grup2", "grup2", "grup2");
//            Statement stmt = con.createStatement();
//            stmt.execute(sql);
//            con.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    public boolean addUser() {
        String sql = "INSERT INTO `Users`(`ID`, `Name`, `Email`, `Password`, `Phone`) VALUES (NULL, '"+newUser.name+"', '"+newUser.email+"', '"+newUser.password+"', '"+newUser.phone+"')";
        
        if(!checkUser(newUser.getEmail(), newUser.getPassword())){
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://app.sobiad.com:3306/grup2", "grup2", "grup2");
                Statement stmt = con.createStatement();
                stmt.execute(sql);
                con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
            return true;
        }
        else
            return false;
    }
     public void AddDriver(String name, String email,String password,String phone,String plate) {
        String sql = "INSERT INTO `Drivers`(`ID`, `Name`, `Email`, `Password`, `Phone`, `Plate`) VALUES (NULL, '"+name+"', '"+email+"', '"+password+"', '"+phone+"', '"+plate+"')";
        System.out.println("sql = " + sql);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://app.sobiad.com:3306/grup2", "grup2", "grup2");
            Statement stmt = con.createStatement();
            stmt.execute(sql);
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
     public boolean checkUser(String email, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://app.sobiad.com:3306/grup2", "grup2", "grup2");
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM `Users` WHERE `Email` LIKE '" + email + "' AND `Password` LIKE '" + password + "' ";
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
