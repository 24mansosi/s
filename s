let cps = 5; // Clicks per second
let clicking = false;
let clickInterval;

function startClicking() {
  if (clicking) return;
  clicking = true;
  clickInterval = setInterval(() => {
    let evt = new MouseEvent("click", {
      bubbles: true,
      cancelable: true,
      view: window,
    });
    document.elementFromPoint(window.innerWidth / 2, window.innerHeight / 2)?.dispatchEvent(evt);
  }, 1000 / cps);
  console.log("AutoClicker started at " + cps + " CPS");
}

function stopClicking() {
  clearInterval(clickInterval);
  clicking = false;
  console.log("AutoClicker stopped");
}

document.addEventListener("keydown", (e) => {
  if (e.key.toLowerCase() === "t") {
    clicking ? stopClicking() : startClicking();
  }
});
