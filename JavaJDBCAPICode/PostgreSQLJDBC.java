import java.sql.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import java.math.BigDecimal;

import java.util.Scanner;

public class PostgreSQLJDBC 
{
	public static void main(String args[]) 
	{
		Connection c = null;
		try
		{
			// Load Postgresql Driver class
			Class.forName("org.postgresql.Driver");
			// Using Driver class connect to databased on localhost, port=5432, database=postgres, user=postgres, password=postgres. If cannot connect then exception will be generated (try-catch block)
			c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres", "postgres");
			System.out.println("Opened database successfully");
			
			// Create instance of this class to call other methods
			PostgreSQLJDBC p = new PostgreSQLJDBC();
			p.setSearchPath(c);
			
			// Call method createCompanyTable to Create Company Table
			//c.setAutoCommit(false);
			//p.createCompanyTable(c);
			//p.insertCompanyTable(c);
			//c.setAutoCommit(true);
			
			// Call method queryEmployeeTable to Create Run SELECT Query in Employee Table
			//p.queryEmployeeTable(c);

			// Call method updEmployeeTable to Create Run UPDATE Query in Employee Table
			//p.updEmployeeTable(c);
			
			// Call method is_same_dept to call function (stored procedure) and read return value
			p.is_same_dept(c);
			
			c.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			System.err.println(e.getClass().getName()+": "+e.getMessage());
			System.exit(0);
		}
	}
	
	void setSearchPath(Connection c)
	{
		Statement stmt = null;
		try
		{
			stmt = c.createStatement();
			String sql = "SET search_path TO company;";
			stmt.executeUpdate(sql);
			stmt.close();
			System.out.println("Changed Search Path successfully");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			System.err.println(e.getClass().getName()+": "+e.getMessage());
			System.exit(0);
		}
	}
	
	void createCompanyTable(Connection c)
	{
		Statement stmt = null;
		try
		{
			stmt = c.createStatement();
			String sql = "CREATE TABLE COMPANY " +
			"(ID INT PRIMARY KEY     NOT NULL," +
			" NAME           VARCHAR(50)    NOT NULL, " +
			" AGE            INT     NOT NULL, " +
			" ADDRESS        VARCHAR(100), " +
			" SALARY         NUMERIC(9,2))";
			stmt.executeUpdate(sql);
			stmt.close();
			System.out.println("Table created successfully");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			System.err.println(e.getClass().getName()+": "+e.getMessage());
			System.exit(0);
		}
	}


	void insertCompanyTable(Connection c)
	{
		PreparedStatement stmt = null;
		String sql = "INSERT INTO company.COMPANY VALUES (?, ?, ?, ?, ?)";
		try
		{
			Scanner in = new Scanner(System.in);

			stmt = c.prepareStatement(sql);
			stmt.setInt(1, 10);

			System.out.println("Enter company name:");
			String s = in.nextLine();
			System.out.println("You entered string "+s);
			stmt.setString(2, s);
			stmt.setInt(3, 5);
			stmt.setString(4, "My Address");
			stmt.setBigDecimal(5, new BigDecimal(500000));
			
			//int a = in.nextInt();
			//System.out.println("You entered integer "+a);
		
			int affectedRows = stmt.executeUpdate();
			stmt.close();
			System.out.println("Table Inserted successfully: Rows Affected: " + affectedRows);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			System.err.println(e.getClass().getName()+": "+e.getMessage());
			System.exit(0);
		}
	}
	
	void queryEmployeeTable(Connection c)
	{
		Statement stmt = null;
		try
		{
			stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT e.ssn AS essn, e.fname AS efname, e.salary AS esalary, e.superssn 	AS sssn, s.fname AS sfname, s.salary AS ssalary " + 
			" FROM company.employee AS e JOIN company.employee AS s ON (e.superssn=s.ssn) WHERE e.dno=4");
			
			while(rs.next())
			{
				// Datatype mapping and functions to use with JDBC is found at https://www.tutorialspoint.com/jdbc/jdbc-data-types.htm
				String essn, sssn, efname, sfname;
				BigDecimal esalary, ssalary;
				// Employee Infor
				essn = rs.getString("essn");
				efname = rs.getString("efname");
				esalary = rs.getBigDecimal("esalary");
				// Supervisor Infor
				//sssn = rs.getString("sssn");
				//sfname = rs.getString("sfname");
				//ssalary = rs.getBigDecimal("ssalary");
				sssn = rs.getString(4);
				sfname = rs.getString(5);
				ssalary = rs.getBigDecimal(6);
				
				System.out.println("EmployeeInfo: ID-" + essn + ", Name-" + efname + ", Salary:" + esalary + " SupervisorInfo: ID-" + sssn + ", Name-" + sfname + ", Salary:" + ssalary);
			}
			
			stmt.close();
			System.out.println("Table Queried successfully");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			System.err.println(e.getClass().getName()+": "+e.getMessage());
			System.exit(0);
		}

   }
   
   	void updEmployeeTable(Connection c)
	{
		PreparedStatement stmt = null;
		String sql = "UPDATE company.employee SET salary = ? WHERE ssn = ?";
		try
		{
			stmt = c.prepareStatement(sql);
			stmt.setBigDecimal(1, new BigDecimal(47000));
			stmt.setBigDecimal(2, new BigDecimal(987654321));
			int affectedRows = stmt.executeUpdate();
			stmt.close();
			System.out.println("Table Updated successfully: Rows Updated: " + affectedRows);

		}
		catch (Exception e) 
		{
			e.printStackTrace();
			System.err.println(e.getClass().getName()+": "+e.getMessage());
			System.exit(0);
		}
	}

   	void is_same_dept(Connection c)
	{
		CallableStatement stmt = null;
		try
		{
			BigDecimal eno = new BigDecimal(999887777);
			//short pno = 10;
			short pno = 1;
			String sql = "{? = call company.is_same_dept (?,?)}";
			stmt = c.prepareCall(sql);
			stmt.registerOutParameter(1, java.sql.Types.BOOLEAN);
			stmt.setShort(2, pno);
			stmt.setBigDecimal(3, eno);
			
			stmt.execute();
			
			// Datatype mapping and functions to use with JDBC is found at https://www.tutorialspoint.com/jdbc/jdbc-data-types.htm
			boolean retval;
			retval = stmt.getBoolean(1);
			if (retval == true)
				System.out.println("Employee No: " + eno + " and Project No: " + pno + " are from same dept");
			else
				System.out.println("Employee No: " + eno + " and Project No: " + pno + " are in different dept");
			stmt.close();
			System.out.println("Function Called successfully");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			System.err.println(e.getClass().getName()+": "+e.getMessage());
			System.exit(0);
		}
	}

}


