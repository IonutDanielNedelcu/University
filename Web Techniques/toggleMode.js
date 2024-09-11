// Functie pentru a seta tema
function setTheme(theme) {
    const htmlElement = document.documentElement;
    htmlElement.setAttribute('data-theme', theme);
    localStorage.setItem('theme', theme);
}

// Functie pentru a comuta tema
function toggleTheme() {
    const currentTheme = localStorage.getItem('theme') || 'light';
    const newTheme = currentTheme === 'light' ? 'dark' : 'light';
    setTheme(newTheme);
}

// Seteaza tema la incarcare
document.addEventListener('DOMContentLoaded', () => {
    const savedTheme = localStorage.getItem('theme') || 'light';
    setTheme(savedTheme);
    
    // Adauga event listener pentru buton
    document.getElementById('toggleDark').addEventListener('click', toggleTheme);
});