package com.methods.bank.servletsjsp.resources;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class CustomersServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();
        CustomerDAO dao = new CustomerDAO();

        switch (path) {
            case "/addCustomer":
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String balanceStr = request.getParameter("balance");

                try {
                    double balance = Double.parseDouble(balanceStr);
                    Customer customer = new Customer(name, email, balance);
                    dao.addCustomer(customer);
                    response.setContentType("text/html");
                    response.getWriter().println("<h2>Customer added successfully!</h2>");
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid balance format.");
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
                }
                break;

            case "/updateCustomer":
                String idStr = request.getParameter("id");
                String newBalanceStr = request.getParameter("balance");

                try {
                    int id = Integer.parseInt(idStr);
                    double newBalance = Double.parseDouble(newBalanceStr);
                    dao.updateCustomerBalance(id, newBalance);
                    response.setContentType("text/html");
                    response.getWriter().println("<h2>Customer balance updated successfully!</h2>");
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input format.");
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
                }
                break;

            case "/deleteCustomer":
                String deleteIdStr = request.getParameter("id");

                try {
                    int deleteId = Integer.parseInt(deleteIdStr);
                    dao.deleteCustomer(deleteId);
                    response.setContentType("text/html");
                    response.getWriter().println("<h2>Customer deleted successfully!</h2>");
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
                }
                break;

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Unknown POST action: " + path);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if ("/listCustomers".equals(path)) {
    try {
        CustomerDAO dao = new CustomerDAO();
        List<Customer> customers = dao.getAllCustomers();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("listCustomers.jsp").forward(request, response);
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
    }
}

    }
}
