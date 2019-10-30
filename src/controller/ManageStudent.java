package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDao;

/**
 * Servlet implementation class ManageStudent
 */
@WebServlet("/managestudent.do")
public class ManageStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageStudent() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String option = request.getParameter("option").trim();
		String id = request.getParameter("id").trim();
		StudentDao sDao = new StudentDao();
		switch (option) {
		case "D":
				try {
					sDao.delete(sDao.find(Long.parseLong(id)));
					request.setAttribute("deleted", true);
				}catch(Exception ex) {
					ex.printStackTrace();
					request.setAttribute("deleted", false);
				}
			break;

		default:
			break;
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
