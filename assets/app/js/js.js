$(function () {
    var form = $('form#signin');

    var nameError = form.find('#name-error');
    var surnameError = form.find('#surname-error');
    var ageError = form.find('#age-error');
    var emailError = form.find('#email-error');

    nameError.hide();
    surnameError.hide();
    ageError.hide();
    emailError.hide();

    var successBox = $('#signin-success');
    successBox.hide();

    form.on('submit', function (event) {
        event.preventDefault();

        var name = form.find('input#name').val();
        var surname = form.find('input#surname').val();
        var age = form.find('input#age').val();
        var email = form.find('input#email').val();

        var isNameError = false;
        var isSurnameError = false;
        var isAgeError = false;
        var isEmailError = false;

        if (name == '') {
            isNameError = true;
            nameError.parent().addClass('has-error');
            nameError.text('Podaj imię!');
            nameError.show(500);
        }
        if (name.length < 3 && name.length > 50) {
            isNameError = true;
            nameError.parent().addClass('has-error');
            nameError.text('Imię musi zawierać conajmniej 3 znaki i nie więcej niż 50 znaków!');
            nameError.show(500);
        }
        if (!isNameError) {
            nameError.parent().removeClass('has-error');
            nameError.hide(500, function () {
                nameError.text('');
            });
        }

        if (surname == '') {
            isSurnameError = true;
            surnameError.parent().addClass('has-error');
            surnameError.text('Podaj nazwisko!');
            surnameError.show(500);
        }
        if (surname.length < 3 && surname.length > 50) {
            isSurnameError = true;
            surnameError.parent().addClass('has-error');
            surnameError.text('Nazwisko musi zawierać conajmniej 3 znaki i nie więcej niż 50 znaków!');
            surnameError.show(500);
        }
        if (!isSurnameError) {
            surnameError.parent().removeClass('has-error');
            surnameError.hide(500, function () {
                surnameError.text('');
            });
        }

        if (age == '') {
            isAgeError = true;
            ageError.parent().addClass('has-error');
            ageError.text('Podaj wiek!');
            ageError.show(500);
        }
        if (!$.isNumeric(age) || age <= 0) {
            isAgeError = true;
            ageError.parent().addClass('has-error');
            ageError.text('Wiek musi być liczbą');
            ageError.show(500);
        }
        if (!isAgeError) {
            ageError.parent().removeClass('has-error');
            ageError.hide(500, function () {
                ageError.text('');
            });
        }

        if (email == '') {
            isEmailError = true;
            emailError.parent().addClass('has-error');
            emailError.text('Podaj email!');
            emailError.show(500);
        }
        if (!/^([a-zA-Z0-9_.+-])+@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email)) {
            isEmailError = true;
            emailError.parent().addClass('has-error');
            emailError.text('Adres email nie jest prawidłowy!');
            emailError.show(500);
        }
        if (!isEmailError) {
            emailError.parent().removeClass('has-error');
            emailError.hide(500, function () {
                emailError.text('');
            });
        }

        if (!isNameError && !isSurnameError && !isAgeError && !isEmailError) {
            form.hide(500);
            successBox.show(500);
            successBox.text('Pomyślnie zarejestrowano.');
        }
    });
});
