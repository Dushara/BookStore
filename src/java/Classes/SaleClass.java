/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Indunil
 */
public class SaleClass {

    private int s_ID;
    private String u_Name;
    private String s_Date;
    private int u_ID;
    private int s_Qty;
    private int s_Amount;
    private int b_ID;
    private String b_Title;

    /**
     * @return the s_ID
     */
    public int getS_ID() {
        return s_ID;
    }

    /**
     * @param s_ID the s_ID to set
     */
    public void setS_ID(int s_ID) {
        this.s_ID = s_ID;
    }

    public int getB_ID() {
        return b_ID;
    }

    public void setB_ID(int b_ID) {
        this.b_ID = b_ID;
    }

    public String getB_Title() {
        return b_Title;
    }

    public void setB_Title(String b_Title) {
        this.b_Title = b_Title;
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
     * @return the s_Date
     */
    public String getS_Date() {
        return s_Date;
    }

    /**
     * @param s_Date the s_Date to set
     */
    public void setS_Date(String s_Date) {
        this.s_Date = s_Date;
    }

    /**
     * @return the u_ID
     */
    public int getU_ID() {
        return u_ID;
    }

    /**
     * @param u_ID the u_ID to set
     */
    public void setU_ID(int u_ID) {
        this.u_ID = u_ID;
    }

    /**
     * @return the s_Qty
     */
    public int getS_Qty() {
        return s_Qty;
    }

    /**
     * @param s_Qty the s_Qty to set
     */
    public void setS_Qty(int s_Qty) {
        this.s_Qty = s_Qty;
    }

    /**
     * @return the s_Amount
     */
    public int getS_Amount() {
        return s_Amount;
    }

    /**
     * @param s_Amount the s_Amount to set
     */
    public void setS_Amount(int s_Amount) {
        this.s_Amount = s_Amount;
    }
    
    public ArrayList Orders() throws SQLException {
        ArrayList arrayList = new ArrayList();
        DbClass db = new DbClass();
        try {
            db.getConnection();

            String query;
            query = "SELECT * FROM sale ORDER BY s_Date";

            com.mysql.jdbc.Statement stmt = (com.mysql.jdbc.Statement) db.conn.createStatement();

            ResultSet rs = stmt.executeQuery(query);

//            ResultSetMetaData metadata = rs.getMetaData();
//            int numberOfColumns = metadata.getColumnCount();
            while (rs.next()) {
                SaleClass sale=new SaleClass();
                BookClass book=new BookClass();
                UserClass user=new UserClass();
                
                sale.setS_Amount(rs.getInt("s_Amount"));
                sale.setS_Date(rs.getString("s_Date").substring(0,8));
                sale.setS_ID(rs.getInt("s_ID"));
                sale.setU_Name(rs.getString("u_Name"));
                sale.setS_Qty(rs.getInt("s_Qty"));
                sale.setB_ID(rs.getInt("b_ID"));
                
                book.getBookName(b_ID);
                sale.setB_Title(book.getB_Title());
                
                arrayList.add(sale);
            }

            db.endConnection();
        } catch (Exception ex) {

        } finally {
            if (db.conn != null) {
                db.endConnection();
            }
        }

        return arrayList;
    }

    public void shiftOrder(int orderID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
