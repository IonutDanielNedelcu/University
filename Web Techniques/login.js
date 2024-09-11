document.getElementById("login-form").addEventListener("submit", function(e) {
    e.preventDefault();

    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    fetch("users.json")
        .then((response) => response.json())
        .then((users) => {
            const userExists = users.some(
                (user) => user.username === username && user.password === password);
            if(userExists) {
                localStorage.setItem("username", username);
                alert("Authentication successful! Redirecting to the main page...");
                setTimeout(function() {
                    window.location.href = "/_indexL.html";
                }, 500);
            }
            else {
                window.location.href = "/404.html";
            }
        })
        .catch((error) => {
            console.error("Error at connecting to the userlist", error);
        });

    fetch("/login", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    })
    .then(res => res.json())
    .then(data => {
        if (data.error) {
            alert(data.error);
        } else {
            window.location.href = "/dashboard";
        }
    })
    .catch(err => console.error(err));
});