import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Index extends HttpServlet {
    public Index() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/form.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String age = request.getParameter("age");
        String email = request.getParameter("email");

        Map<String, String> errors = new HashMap<>();
        if (name.length() == 0) {
            errors.put("name", "Podaj imię!");
        } else if (name.length() < 3) {
            errors.put("name", "Imię musi zawierać conajmniej 3 znaki!");
        } else if (name.length() > 50) {
            errors.put("name", "Imię może zawierać tylko 50 znaków!");
        }

        if (surname.length() == 0) {
            errors.put("surname", "Podaj nazwisko!");
        } else if (surname.length() < 3) {
            errors.put("surname", "Nazwisko musi zawierać conajmniej 3 znaki!");
        } else if (surname.length() > 50) {
            errors.put("surname", "Nazwisko może zawierać tylko 50 znaków!");
        }

        if (age.length() == 0) {
            errors.put("age", "Podaj wiek!");
        } else if (!age.matches("^[1-9][0-9]{0,2}$") || Integer.parseInt(age) < 1 || Integer.parseInt(age) > 150) {
            errors.put("age", "Wiek nie jest prawidłowy!");
        }

        if (email.length() == 0) {
            errors.put("email", "Podaj email!");
        } else if (!email.matches("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9]{2,4}$")) {
            errors.put("email", "Adres email nie jest prawidłowy!");
        }

        Boolean success = true;
        if (!errors.isEmpty()) {
            success = false;
        }

        request.setAttribute("errors", errors);
        request.setAttribute("success", success);
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/form.jsp");
        dispatcher.forward(request, response);
    }
}
