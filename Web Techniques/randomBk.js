// Get the element with id "randomBackground"
const randomBackgroundElement = document.getElementById("randomBackground");
// Get the element with id "normalBackground"
const normalBackgroundElement = document.getElementById("normalBackground");


// Function to generate a random color
function getRandomColor() {
    const letters = "0123456789ABCDEF";
    let color = "#";
    for (let i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

// Function to change the background color
function changeBackgroundColor() {
    const randomColor = getRandomColor();
    document.body.style.backgroundColor = randomColor;
}

// Function to change the background color to the normal color
function changeToNormalColor() {
    document.body.style.backgroundColor = "var(--lavender)"; // Replace "white" with your desired normal color
}



// Add click event listener to the element
randomBackgroundElement.addEventListener("click", changeBackgroundColor);

// Add click event listener to the element
normalBackgroundElement.addEventListener("click", changeToNormalColor);