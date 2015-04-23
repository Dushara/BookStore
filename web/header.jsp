<%-- 
    Document   : header
    Created on : Apr 12, 2015, 9:43:37 PM
    Author     : Indunil
--%>

<%@page import="Classes.CartClass"%>
<%@page import="Classes.NotificationsClass"%>
<%@page import="Classes.MessagesClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Bootstrap</title>

        <!-- Bootstrap CSS-->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">

        <!--aditional CSS imports-->
        <!-- IF online useage required
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        Remove this comment tag-->
        <!--aditional CSS imports end-->

        <!--internal CSS-->

        <!--internal CSS end-->

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>  

        <!--aditional JS imports-->
        <!-- IF online useage required
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        Remove this comment tag-->
        <!--aditional JS imports end-->

        <!--internal JS-->

        <!--internal JS end-->          
    </head>

    <body class="container-fluid">

        <%!
            String username;
            int message;
            int notification;
            int cart;
        %>

        <%
            if (session.getAttribute("Login") != null && session.getAttribute("Login").toString() == "True") {
                if (session.getAttribute("Username") != null) {
                    username = session.getAttribute("Username").toString();
                }
            }
        %>

        <%
            //get new messages
            MessagesClass m = new MessagesClass();
            m.setU_Name(username);
            message = m.unreadedMessagesCount();

            //get new notifications
            NotificationsClass n = new NotificationsClass();
            n.setU_Name(username);
            notification = n.unreadedNotificationCount();

            //get no. of cart items
            CartClass c = new CartClass();
            c.setU_Name(username);
            cart = c.noOfItems();
        %>

        <!--also "container" class can be used-->
        <div class="row">

            <nav class="navbar navbar-default" style="margin: 2px;">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" style="font-family:calibri; color:Black;" href="Home.jsp">
                            <span class="glyphicon glyphicon-home"></span>
                            Orchid Store
                        </a>
                    </div>

                    <!--navbar collapse-->

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                        <!--Search start-->
                        <form class="navbar-form navbar-left center-block" role="search" action="SearchBook" method="GET">
                            <div class="form-group">
                                <input name="Search" type="text" class="form-control" placeholder="Search" required="" autofocus>          						
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <span class="glyphicon glyphicon-search"></span>
                                Search Books
                            </button>  							
                        </form>
                        <!--Search end-->      							

                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <!--notifications btn-->
                                <form action="ChkMessage" method="GET">
                                    <button type="submit" class="btn btn-danger navbar-btn btn-block" style="border-radius:0px;">
                                        <span class="glyphicon glyphicon-envelope"></span>
                                        Messages
                                        <span class="badge"><%= message%></span>
                                    </button>
                                </form>
                                <!--notifications btn end-->
                            </li>

                            <li>
                                <!--messages btn-->
                                <form action="ChkNotification" method="GET">
                                    <button type="submit" class="btn btn-warning navbar-btn btn-block" style="border-radius:0px;">
                                        <span class="glyphicon glyphicon-bullhorn"></span>
                                        Notifications
                                        <span class="badge"><%= notification%></span>
                                    </button>
                                </form>
                                <!--messages btn end-->
                            </li>

                            <li>
                                <!--shopping cart btn-->
                                <form action="ChkCart" method="GET">
                                    <button type="submit" class="btn btn-info navbar-btn btn-block" style="border-radius:0px;">
                                        <span class="glyphicon glyphicon-shopping-cart"></span>
                                        Shopping Cart
                                        <span class="badge"><%= cart%></span>
                                    </button>
                                </form>
                                <!--shopping cart btn end-->
                            </li>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    Account 
                                    <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
                                </a>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="MyProfile">
                                            <span class="glyphicon glyphicon-user"></span>
                                            Profile
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="SignOut">
                                            <span class="glyphicon glyphicon-off"></span>
                                            Log Out
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                    <!--navbar collapse end-->
                </div>
            </nav>            

        </div>
    </body>
</html>
