# ISI

Laboratoria z przedmiotu *inżynieria systemów informacyjnych*.

## Instalacja backendu

Do uruchomienia backendu wymagany jest [**Apache Tomcat**](http://tomcat.apache.org/whichversion.html).

Plik [**src/Index.java**](src/Index.java) zawiera serwlet.

## Instalacja frontendu

Do uruchomienia frontendu wymagany jest [**node.js**](https://nodejs.org/en/download/).

```
$ cd /sciezka/do/projektu
$ npm install
$ npm install bower -g
$ npm install grunt-cli -g
$ bower install
$ grunt
```

Plik [**web/jsp/form.jsp**](web/jsp/form.jsp) zawiera widok formularza.

## Różnica pomiędzy laboratium nr 1 a nr 2

Jako, że już w *labolatorium nr 1* zostały użyte animacje, w *laboratium nr 2* zostało dodane:

- zamykanie błędu po kliknięciu na niego (zaimplementowane za pomocą **animate()**),
- zmiana koloru nagłówka po wypełnieniu formularza (zaimplementowane za pomocą **css()**).

## Autorzy

- [Daniel Iwaniec](https://github.com/ghutix)
- [Artur Kałuża](https://github.com/arturro2828)

## Licencja

Projekt udostępniony na licencji **MIT**. [Zobacz pełen plik licencji](LICENSE).
