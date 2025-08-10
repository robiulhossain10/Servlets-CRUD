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
                    request.setAttribute("message", "✅ Customer added successfully!");
                    request.getRequestDispatcher("message.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid balance format.");
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
                }
                break;
            case "/updateCustomer":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    name = request.getParameter("name").trim();
                    email = request.getParameter("email").trim();
                    double balance = Double.parseDouble(request.getParameter("balance"));

                    Customer customer = new Customer(id, name, email, balance);
                    dao.updateCustomer(customer);

                    request.setAttribute("message", "✅ Customer info updated successfully!");
                    request.setAttribute("customer", customer); // Directly pass updated object
                    request.getRequestDispatcher("update.jsp").forward(request, response);

                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "❌ Something went wrong: " + e.getMessage());
                    request.getRequestDispatcher("update.jsp").forward(request, response);
                }
                break;

            case "/deleteCustomer":
                String deleteIdStr = request.getParameter("id");

                try {
                    int deleteId = Integer.parseInt(deleteIdStr);
                    dao.deleteCustomer(deleteId);
                    
                    request.setAttribute("message", "✅ Customer info Deleted successfully!");
                    request.setAttribute("deleteId", deleteId); // Directly pass updated object
                    request.getRequestDispatcher("delete.jsp").forward(request, response);
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
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Unknown GET action: " + path);
        }
    }
}
