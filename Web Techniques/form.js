window.onload = function () {
    const value = document.querySelector("#budgetVal");
    const input = document.querySelector("#budgetForm");
    value.textContent = input.value;
    input.addEventListener("input", (event) => {
      value.textContent = event.target.value;
    });
    
}; 

document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('form');
    const submitButton = document.querySelector('button[type="submit"]');

    // Functie pentru validarea email-ului folosind o expresie regulată
    function validateEmail(email) {
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
    }

    form.addEventListener('submit', function (event) {
        event.preventDefault();

        // Validare inputuri
        const username = document.querySelector('#name').value.trim();
        const email = document.querySelector('#email').value.trim();
        const phone = document.querySelector('#phone').value.trim();
        const product = document.querySelector('#product').value.trim();
        const date = document.querySelector('#date').value.trim();
        const budget = document.querySelector('#budgetForm').value.trim();
        const message = document.querySelector('#message').value.trim();

        if (username === '' || email === '' || phone === '' || product === ''
        || date === '' || budget === '') {
            alert('All fields are required! (except the last one)');
            return;
        }

        if (!validateEmail(email)) {
            alert('The email is not valid!');
            return;
        }

        // Salvăm datele în localStorage
        const formData = {
            username: username,
            email: email,
            phone: phone,
            product: product,
            date: date,
            budget: budget,
            message: message,
            timestamp: new Date().toLocaleString()
        };
        let formCollection = JSON.parse(localStorage.getItem('formCollection')) || [];
        formCollection.push(formData);
        localStorage.setItem('formCollection', JSON.stringify(formCollection));

        // Afisăm un mesaj de mulțumire și schimbăm culoarea fundalului
        alert('Thank you for submitting the form!');
        window.location.href = "/form.html";

        // Resetăm formularul după 2 secunde și reactivăm butonul de submit
        setTimeout(function () {
            form.reset();
            submitButton.disabled = false;
        }, 2000);
    });

    const unsubmitButton = document.createElement('button');
    unsubmitButton.textContent = 'Unsubmit';
    unsubmitButton.classList.add('unsubmitBttn');
    form.appendChild(unsubmitButton);
    unsubmitButton.style.display = 'none';

    unsubmitButton.addEventListener('click', function () {
        localStorage.removeItem('formCollection');
        alert('Form data has been cleared!');
        detailsButton.remove();
        window.location.href = "/form.html";
    });

    //  afișarea detaliilor formularului
    const detailsButton = document.createElement('button');
    detailsButton.textContent = 'See form details';
    detailsButton.classList.add('detailsBttn');
    const section = document.getElementById('formSection');
    section.appendChild(detailsButton);
    detailsButton.style.display = 'none'; // hide the button initially

    // Verificăm dacă există date introduse în formular
    const formCollection = JSON.parse(localStorage.getItem('formCollection'));
    if (formCollection && formCollection.length > 0) {
        unsubmitButton.style.display = 'flex'; // show the button if there are form details
        detailsButton.style.display = 'block'; // show the button if there are form details
    }

    detailsButton.addEventListener('click', function (event) {
        event.stopPropagation();
        if (formCollection && formCollection.length > 0) {
            alert('Form details:\n' + formCollection.map((formData, index) =>
                `Form ${index + 1}:\nName: ${formData.username}\nEmail: ${formData.email}\nPhone: ${formData.phone}\nProduct: ${formData.product}\nBudget: ${formData.budget}\nAppointment date: ${formData.date}\nMessage: ${formData.message}\nSent: ${formData.timestamp}`
            ).join('\n\n'));
        } else {
            alert('There is no data to show!');
        }
    });
});