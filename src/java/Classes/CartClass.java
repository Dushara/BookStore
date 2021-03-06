/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import com.mysql.jdbc.Statement;
import java.sql.ResultSet;

/**
 *
 * @author Indunil
 */
public class CartClass {
    
    private int c_ID;
    private String u_Name;
    private int B_ID;
    private int c_Qty;
    
    //DbClass object
    private DbClass db = new DbClass();

    /**
     * @return the c_ID
     */
    public int getC_ID() {
        return c_ID;
    }

    /**
     * @param c_ID the c_ID to set
     */
    public void setC_ID(int c_ID) {
        this.c_ID = c_ID;
    }

    /**
     * @return the u_Name
     */
    public String getU_Name() {
        return u_Name;
    }

    /**
     * @param u_Name the u_Name to set
     */
    public void setU_Name(String u_Name) {
        this.u_Name = u_Name;
    }

    /**
     * @return the B_ID
     */
    public int getB_ID() {
        return B_ID;
    }

    /**
     * @param B_ID the B_ID to set
     */
    public void setB_ID(int B_ID) {
        this.B_ID = B_ID;
    }

    /**
     * @return the c_Qty
     */
    public int getC_Qty() {
        return c_Qty;
    }

    /**
     * @param c_Qty the c_Qty to set
     */
    public void setC_Qty(int c_Qty) {
        this.c_Qty = c_Qty;
    }
    
    //methods
    
    public int noOfItems(){
        int items=0;
        
        try {
            db.getConnection();

            String query;
            query = "SELECT COUNT(*) FROM cart WHERE u_Name='" + getU_Name() + "'";

            Statement stmt = (Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                items = rs.getInt("COUNT(*)");
            }
            db.endConnection();

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }
        
        return items; 
    }
}
