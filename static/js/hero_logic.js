document.addEventListener("DOMContentLoaded", () => {
    const slides = document.getElementById('slides');
    const totalSlides = slides.children.length;
    let index = 0;
    console.log(totalSlides)

    setInterval(() => {
        console.log("s")

        index = (index + 1) % totalSlides;
        slides.style.transform = `translateX(-${index * 100}%)`;
    }, 5000); // change every 5s
})