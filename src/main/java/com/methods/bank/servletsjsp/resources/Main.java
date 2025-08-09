
package com.methods.bank.servletsjsp.resources;


import java.util.List;

public class Main {
    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();

        try {
            // Create
            Customer c1 = new Customer(0, "Zilan Hossain", "robis@example.com", 10000);
            dao.addCustomer(c1);
            System.out.println("Added customer");

            // Read
            List<Customer> customers = dao.getAllCustomers();
            customers.forEach(System.out::println);

            // Update
            dao.updateCustomerBalance(1, 15000);
            System.out.println("Updated balance for customer id=1");

            // Delete
            dao.deleteCustomer(1);
            System.out.println("Deleted customer with id=1");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

