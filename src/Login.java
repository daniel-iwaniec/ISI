import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Login extends HttpServlet {
    public Login() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("logged") != null && (boolean) session.getAttribute("logged")) {
            request.setAttribute("userSession", session);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/form.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("logged") != null && (boolean) session.getAttribute("logged")) {
            request.setAttribute("userSession", session);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/form.jsp");
            dispatcher.forward(request, response);
        }

        Boolean loginSuccess = false;
        if (login.equals("admin") && password.equals("admin")) {
            loginSuccess = true;
            session = request.getSession();
            session.setAttribute("logged", true);
            request.setAttribute("userSession", session);
        }

        request.setAttribute("loginSuccess", loginSuccess);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/form.jsp");
        dispatcher.forward(request, response);
    }
}
