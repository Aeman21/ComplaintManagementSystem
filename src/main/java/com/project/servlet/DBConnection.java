package com.project.servlet;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static Connection con;

    public static Connection getConnection() throws Exception {
        if(con == null || con.isClosed()) {
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:XE", // adjust SID if needed
                    "system", // your Oracle username
                    "Ayman2157" // your Oracle password
                );
            } catch(Exception e) {
                e.printStackTrace();
                throw e;
            }
        }
        return con;
    }
}
