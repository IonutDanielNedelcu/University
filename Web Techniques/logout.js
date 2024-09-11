window.onload = function() {

    // Adăugare de acțiune pentru butonul de delogare
    const logoutButton = document.getElementById('logoutRef');   
    logoutButton.addEventListener('click', logoutUser);

    function logoutUser() {
        localStorage.removeItem('username');
        window.location.href = '/index.html';
    }

};