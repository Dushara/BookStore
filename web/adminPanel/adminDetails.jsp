<%-- 
    Document   : adminDetails
    Created on : Apr 17, 2015, 10:04:13 PM
    Author     : Chami
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Classes.UserClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css"/>

        <%--Bootsrap CSS files--%>
        <link rel="stylesheet" href="http://localhost:8080/BookStore/adminPanel/css/bootstrap.css"/>
        <link rel="stylesheet" href="http://localhost:8080/BookStore/adminPanel/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="http://localhost:8080/BookStore/adminPanel/css/bootstrapValidator.css"/>

        <%--Bootsrap jS files--%>
        <script type="text/javascript" src="http://localhost:8080/BookStore/adminPanel/js/jquery.min.js"></script>
        <script type="text/javascript" src="http://localhost:8080/BookStore/adminPanel/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="http://localhost:8080/BookStore/adminPanel/js/bootstrapValidator.js"></script>

        <%-- my css files --%>
        <link href="http://localhost:8080/BookStore/adminPanel/css/startPage.css" rel="stylesheet">
        <link href="http://localhost:8080/BookStore/adminPanel/css/form.css" rel="stylesheet">
        <title>Admin Panel</title>
    </head>
    <body>
        <div class="container" style="background-color:#F5F5F0">
            <%@include file="HeaderFiles/admiinHeader.jsp"%>           
            <div class="row">
                <%--left side navigation--%>
                <div class="col-lg-2">
                    <ul class="nav nav-pills nav-stacked ">
                        <li role="presentation" class="text_box" style="padding: 0px; text-align: left;">Admin</li>
                        <li>
                            <div id="topmenu">
                                 <ul class="nav nav-pills nav-stacked topmenu">
                                    <li role="presentation" class="active"><a href="#">Admin Details</a></li>
                                    <li role="presentation"><a href=""><font style="color: orange">Add Admin</font></a></li>
                                    <li>&nbsp;</li>
                                    <li>&nbsp;</li>
                                    <li>&nbsp;</li>
                                </ul>
                            </div>
                        </li>
                    </ul>  
                </div>
                <div class="col-lg-1">&nbsp;</div>
                <%--left side navigation end--%>

                
                <div class="col-lg-9">
                    <label><h3>Admins</h3></label>
                    <div class="row">
                    <div class="col-lg-9">
                        
                    <%! ResultSet result;%>
                    <%! String adminDetails;%>
                    <%! String adminLevel;%>
                    
                    <%
                        UserClass admin = new UserClass();
                        result = admin.gteAllAdmins();
                        while(result.next()){
                            if("L1".equalsIgnoreCase(result.getString("admin_Level"))){
                                adminDetails="Have authority to add, modify and remove admins."
                                        + "<br> Have authority to add, modify and remove books, authors and suppliers."
                                        + "<br> Have authority to add books copies."
                                        + "<br> Have authority to manage clients and orders.";
                                adminLevel="Level 1 admin";
                            }else if("L2".equalsIgnoreCase(result.getString("admin_Level"))){
                                adminDetails="Have authority to add, modify and remove books, authors and suppliers."
                                        + "<br>Have authority to add books copies."
                                        + "<br>Have authority to manage clients and orders.";
                                adminLevel="Level 2 admin";
                            }else if("L3".equalsIgnoreCase(result.getString("admin_Level"))){
                                adminDetails="Have authority to only add books, authors and suppliers."
                                        + "<br>Have authority to add books copies."
                                        + "<br>Have authority to manage clients and orders.";
                                adminLevel="Level 3 admin";
                            }
                           %>
                           <form 
                           <table border="0">
                               <tbody>
                                   <tr>
                                       <td><h4><strong><%=result.getString("u_Name")%></strong><small>&nbsp; <%=adminLevel%></small></h4></td>
                                   </tr>
                                   <tr>
                                       <td><%=adminDetails%></td>
                                   </tr>
                                   <tr>
                               <div class="row">
                                   <td>
                                   <div class="col-lg-8"></div>
                                   <div class="col-lg-2">
                                   <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modify">Modify</button>
                                   </div>
                                   <div class="col-lg-2">
                                   <button type="button" class="btn btn-default" data-toggle="modal" data-target="#remove">Remove</button>
                                   </div>
                                   </td>
                               </div>
                                       
                                   </tr>
                               </tbody>
                           </table>
                                   <img src="http://localhost:8080/BookStore/adminPanel/Images/Orthers/orange line.png"width="100%" alt="Responsive image">
                                   <br><br>

                           <%
                        }
                        %>
                    </div>
                    </div>
                </div>
            </div>
            <div class="row">
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
            </div>
            <div class="row">
                &nbsp;
            </div>
            <div class="row" >
                <ol class="breadcrumb" style="background-color:#FF9933">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Library</a></li>
                    <li class="active">Data</li>
                </ol>
            </div> 
        </div>
    </body>
</html>