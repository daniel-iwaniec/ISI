import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;

public class XML extends HttpServlet {
    public XML() {
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
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("logged") != null && (boolean) session.getAttribute("logged")) {
            request.setAttribute("userSession", session);
        }

        Part filePart = request.getPart("file");
        InputStream filecontent = filePart.getInputStream();
        String xml = filecontent.toString();

        request.setAttribute("xml", xml);
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/form.jsp");
        dispatcher.forward(request, response);
    }
}
