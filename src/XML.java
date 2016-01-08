import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import org.w3c.dom.*;
import org.xml.sax.SAXException;
import javax.xml.parsers.*;

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
        InputStream inputStream = filePart.getInputStream();

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        Document document;
        try {
            builder = factory.newDocumentBuilder();
            document = builder.parse(inputStream);

            request.setAttribute("xml", document);
            RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/form.jsp");
            dispatcher.forward(request, response);
        } catch (ParserConfigurationException | SAXException e) {
            e.printStackTrace();
        }
    }
}
