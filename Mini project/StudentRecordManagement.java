/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ADMIN
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class StudentRecordManagement{

    static final String URL =
            "jdbc:mysql://localhost:3306/student_db";
    static final String USER = "root";
    static final String PASSWORD = "Root";

    static Scanner sc = new Scanner(System.in);

    public static Connection connect() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void addStudent() {
        String sql = "INSERT INTO students VALUES (?, ?, ?, ?, ?)";

        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sql)) {

            System.out.print("Enter student ID: ");
            int id = Integer.parseInt(sc.nextLine());

            System.out.print("Enter student name: ");
            String name = sc.nextLine();

            System.out.print("Enter email: ");
            String email = sc.nextLine();

            System.out.print("Enter course: ");
            String course = sc.nextLine();

            System.out.print("Enter semester: ");
            int semester = Integer.parseInt(sc.nextLine());

            if (id <= 0 || semester <= 0 || name.trim().isEmpty()) {
                System.out.println("Invalid input.");
                return;
            }

            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, course);
            ps.setInt(5, semester);

            ps.executeUpdate();
            System.out.println("Student added successfully!");

        } catch (NumberFormatException e) {
            System.out.println("ID and semester must be numbers.");
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
        }
    }

    public static void viewStudents() {
        String sql = "SELECT * FROM students";

        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            System.out.println("\n--- Student Records ---");

            boolean found = false;

            while (rs.next()) {
                found = true;
                System.out.println(
                    "ID: " + rs.getInt("student_id")
                    + " | Name: " + rs.getString("student_name")
                    + " | Email: " + rs.getString("email")
                    + " | Course: " + rs.getString("course")
                    + " | Semester: " + rs.getInt("semester")
                );
            }

            if (!found) {
                System.out.println("No student records found.");
            }

        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
        }
    }

    public static void updateStudent() {
        String sql = "UPDATE students SET student_name=?, email=?, "
                   + "course=?, semester=? WHERE student_id=?";

        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sql)) {

            System.out.print("Enter student ID to update: ");
            int id = Integer.parseInt(sc.nextLine());

            System.out.print("Enter new name: ");
            String name = sc.nextLine();

            System.out.print("Enter new email: ");
            String email = sc.nextLine();

            System.out.print("Enter new course: ");
            String course = sc.nextLine();

            System.out.print("Enter new semester: ");
            int semester = Integer.parseInt(sc.nextLine());

            if (id <= 0 || semester <= 0 || name.trim().isEmpty()) {
                System.out.println("Invalid input.");
                return;
            }

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, course);
            ps.setInt(4, semester);
            ps.setInt(5, id);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                System.out.println("Student updated successfully!");
            } else {
                System.out.println("Student ID not found.");
            }

        } catch (NumberFormatException e) {
            System.out.println("ID and semester must be numbers.");
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
        }
    }

    public static void deleteStudent() {
        String sql = "DELETE FROM students WHERE student_id=?";

        try (Connection con = connect();
             PreparedStatement ps = con.prepareStatement(sql)) {

            System.out.print("Enter student ID to delete: ");
            int id = Integer.parseInt(sc.nextLine());

            if (id <= 0) {
                System.out.println("Invalid student ID.");
                return;
            }

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                System.out.println("Student deleted successfully!");
            } else {
                System.out.println("Student ID not found.");
            }

        } catch (NumberFormatException e) {
            System.out.println("Student ID must be a number.");
        } catch (SQLException e) {
            System.out.println("Database error: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        while (true) {
            System.out.println("\n===== STUDENT RECORD MANAGEMENT =====");
            System.out.println("1. Add Student");
            System.out.println("2. View Students");
            System.out.println("3. Update Student");
            System.out.println("4. Delete Student");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");

            String choice = sc.nextLine();

            switch (choice) {
                case "1":
                    addStudent();
                    break;
                case "2":
                    viewStudents();
                    break;
                case "3":
                    updateStudent();
                    break;
                case "4":
                    deleteStudent();
                    break;
                case "5":
                    System.out.println("Thank you for using the application!");
                    sc.close();
                    return;
                default:
                    System.out.println("Invalid choice. Try again.");
            }
        }
    }
}
    

