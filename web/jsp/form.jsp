<%@ page import="java.util.Map" %>
<%@ page import="org.w3c.dom.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<% HttpSession userSession = (HttpSession) request.getAttribute("userSession"); %>
<% Document xml = (Document) request.getAttribute("xml"); %>
<% Boolean success = (Boolean) request.getAttribute("success"); %>
<% Boolean loginSuccess = (Boolean) request.getAttribute("loginSuccess"); %>
<% Map<String, String> errors = (Map<String, String>) request.getAttribute("errors"); %>

<!doctype html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Daniel Iwaniec, Artur Kałuża">

    <title>ISI Formularz</title>

    <link href="assets/app.min.css" rel="stylesheet">
    <script src="assets/app.min.js"></script>
</head>

<body>
<main class="container">

    <% if (userSession != null && (boolean) userSession.getAttribute("logged")) { %>
    <h2 id="form-signin-heading">XML</h2>

    <% if (loginSuccess != null && loginSuccess) { %>
    <div id="signin-success" class="alert alert-success" role="alert">Pomyślnie zalogowano</div>
    <% } %>

    <% if (xml == null) { %>
    <form id="xml" class="form-xml" action="/xml" method="post" enctype="multipart/form-data">
        <div id="file-wrapper">
            <label for="file" class="sr-only">Plik XML</label>
            <input type="file"
                   id="file"
                   name="file"
                   class="form-control form-register-control"
                   placeholder="Plik XML"
                   value="${param.file}">

            <% if (errors != null && errors.get("file") != null && errors.get("file").length() > 0) { %>
            <div id="name-error" class="alert alert-danger" role="alert"><%= errors.get("file") %>
            </div>
            <% } else { %>
            <div id="name-error" class="alert alert-danger alert-hide" role="alert"></div>
            <% } %>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Wyślij</button>
    </form>
    <%}%>

    <% if (xml != null) { %>
    <div class="well">
        <%
            NodeList cds = xml.getElementsByTagName("cd");
            for (int i = 0; i < cds.getLength(); i++) {
                Node nodeCd = cds.item(i);
                if (nodeCd.getNodeType() == Node.ELEMENT_NODE) {
                    Element cd = (Element) nodeCd;
                    out.print("<p>");
                    out.print("<i>Title : " + cd.getElementsByTagName("title").item(0).getTextContent() + "</i><br>");
                    out.print("<b>Artist: " + cd.getElementsByTagName("artist").item(0).getTextContent() + "</b><br>");
                    out.print("Country: " + cd.getElementsByTagName("country").item(0).getTextContent() + "<br>");
                    out.print("Company: " + cd.getElementsByTagName("company").item(0).getTextContent() + "<br>");
                    out.print("Price: " + cd.getElementsByTagName("price").item(0).getTextContent() + "<br>");
                    out.print("Year: " + cd.getElementsByTagName("year").item(0).getTextContent() + "<br>");
                    out.print("</p>");
                }
            }
        %>
    </div>
    <% } %>

    <a href="/logout"><button class="btn btn-lg btn-block" type="button">Wyloguj</button></a>

    <% } else {%>
    <h2 id="form-signin-heading">Rejestracja</h2>

    <% if (success != null && success) { %>
    <div id="signin-success" class="alert alert-success" role="alert">Pomyślnie zarejestrowano</div>
    <div class="well">
        <dl class="dl">
            <dt>Imię</dt>
            <dd>${param.name}</dd>
            <dt>Nazwisko</dt>
            <dd>${param.surname}</dd>
            <dt>Wiek</dt>
            <dd>${param.age}</dd>
            <dt>Adres email</dt>
            <dd>${param.email}</dd>
        </dl>
    </div>
    <% } else { %>
    <form id="signin" class="form-signin" action="/" method="post">
        <div id="name-wrapper">
            <label for="name" class="sr-only">Imię</label>
            <input type="text"
                   id="name"
                   name="name"
                   class="form-control form-register-control"
                   placeholder="Imię"
                   autofocus
                   value="${param.name}">

            <% if (errors != null && errors.get("name") != null && errors.get("name").length() > 0) { %>
            <div id="name-error" class="alert alert-danger" role="alert"><%= errors.get("name") %>
            </div>
            <% } else { %>
            <div id="name-error" class="alert alert-danger alert-hide" role="alert"></div>
            <% } %>
        </div>

        <div id="surname-wrapper">
            <label for="surname" class="sr-only">Nazwisko</label>
            <input type="text"
                   id="surname"
                   name="surname"
                   class="form-control form-register-control"
                   placeholder="Nazwisko"
                   value="${param.surname}">

            <% if (errors != null && errors.get("surname") != null && errors.get("surname").length() > 0) { %>
            <div id="surname-error" class="alert alert-danger" role="alert"><%= errors.get("surname") %>
            </div>
            <% } else { %>
            <div id="surname-error" class="alert alert-danger alert-hide" role="alert"></div>
            <% } %>
        </div>

        <div id="age-wrapper">
            <label for="age" class="sr-only">Wiek</label>
            <input type="text"
                   id="age"
                   name="age"
                   class="form-control form-register-control"
                   placeholder="Wiek"
                   value="${param.age}">

            <% if (errors != null && errors.get("age") != null && errors.get("age").length() > 0) { %>
            <div id="age-error" class="alert alert-danger" role="alert"><%= errors.get("age") %>
            </div>
            <% } else { %>
            <div id="age-error" class="alert alert-danger alert-hide" role="alert"></div>
            <% } %>
        </div>

        <div id="email-wrapper">
            <label for="email" class="sr-only">Adres email</label>
            <input type="text"
                   id="email"
                   name="email"
                   class="form-control form-register-control"
                   placeholder="Adres email"
                   value="${param.email}">

            <% if (errors != null && errors.get("email") != null && errors.get("email").length() > 0) { %>
            <div id="email-error" class="alert alert-danger" role="alert"><%= errors.get("email") %>
            </div>
            <% } else { %>
            <div id="email-error" class="alert alert-danger alert-hide" role="alert"></div>
            <% } %>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Wyślij</button>
    </form>
    <% } %>

    <h2 id="form-signin-heading">Logowanie</h2>

    <% if (loginSuccess != null && !loginSuccess) { %>
    <div id="password-error" class="alert alert-danger" role="alert">Niepoprawne logowanie.</div>
    <% } %>

    <form class="form-login" action="/login" method="post">
        <div id="login-wrapper">
            <label for="login" class="sr-only">Login</label>
            <input type="text"
                   id="login"
                   name="login"
                   class="form-control form-register-control"
                   placeholder="Login"
                   value="${param.login}">
        </div>

        <div id="password-wrapper">
            <label for="password" class="sr-only">Hasło</label>
            <input type="text"
                   id="password"
                   name="password"
                   class="form-control form-register-control"
                   placeholder="Hasło"
                   value="${param.password}">
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Wyślij</button>
    </form>
    <% } %>
</main>
</body>
</html>
