document.addEventListener("DOMContentLoaded", () => {
    const usernameDisplay = document.getElementById("user-name");
    const loggedInUser = localStorage.getItem("username");
    if(loggedInUser) {
        usernameDisplay.textContent = ', '+loggedInUser;
    }
    else {
        window.location.href = "/index.html";
    }

    document.getElementById("logout-ref").addEventListener("click", () => {
        localStorage.clear();
        window.location.href = "/index.html";
    });
});