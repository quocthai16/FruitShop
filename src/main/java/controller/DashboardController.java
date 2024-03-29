/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import dao.OrderDAO;
import dao.UserDAO;

/**
 *
 * @author Duong Quoc Thai CE171563
 */
public class DashboardController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO ud = new UserDAO();
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String isAdmin = session.getAttribute("isAdmin").toString();
        if (isAdmin == null || !isAdmin.equals("1")) {
            request.getRequestDispatcher("home").forward(request, response);

        } else {
            OrderDAO od = new OrderDAO();
            int numberOfOrders = od.getAllOrder().size();
            int numberOfCustomers = ud.countItemsInCart();
            int total = 0;
            for (Order order : od.getAllOrder()) {
                total+=(int)order.getAmount();
            }
            for (int i = 1; i <= 12; i++) {
                if(od.getTotalAmountEachMonth(i)>0){
                    request.setAttribute("totalMoneyMonth"+i, od.getTotalAmountEachMonth(i));
                }else{
                    request.setAttribute("totalMoneyMonth"+i, 0);
                }
                
            }
            session.setAttribute("total", total);
            session.setAttribute("numberOfOrders", numberOfOrders);
            session.setAttribute("numberOfCustomer", numberOfCustomers);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
