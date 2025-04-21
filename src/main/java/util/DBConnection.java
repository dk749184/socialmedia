package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static DBConnection instance;
    private Connection connection = null;
//    private String url = ;
//    private String username = ;
//    private String password = ;

    private DBConnection() throws SQLException {
    	try {
    	      Class.forName("com.mysql.cj.jdbc.Driver");//      Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    	    this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dk", "root", "@#Deepak74");
    	} catch (ClassNotFoundException | SQLException ex) {
    	    System.out.println("Database Connection Creation Failed: " + ex.getMessage());
    	    throw new SQLException("Failed to create DB connection", ex); // Prevent null conn
    	}
    }

    public Connection getConnection() {
        return connection;
    }

    public static DBConnection getInstance() throws SQLException {
        if (instance == null) {
            instance = new DBConnection();
        } else if (instance.getConnection().isClosed()) {
            instance = new DBConnection();
        }

        return instance;
    }
}
