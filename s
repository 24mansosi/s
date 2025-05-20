ModAPI.require("player"); // Require player module

var AutoClickMod = {
  active: false,            // Is autoclicker running?
  nextClickTick: 0,         // Tick count until next click
  minDelay: 10,             // Min ticks between clicks (10 = ~0.5 sec if 20 TPS)
  maxDelay: 25,             // Max ticks between clicks
  toggleKey: "R",           // Key to toggle autoclicker
};

function randomDelay(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// Toggle autoclicker with key
ModAPI.addEventListener("keydown", (event) => {
  if (event.key.toUpperCase() === AutoClickMod.toggleKey) {
    AutoClickMod.active = !AutoClickMod.active;
    ModAPI.print("AutoClicker " + (AutoClickMod.active ? "enabled" : "disabled"));
    AutoClickMod.nextClickTick = 0; // reset delay
  }
});

// Update every game tick
ModAPI.addEventListener("update", () => {
  if (!AutoClickMod.active) return;

  if (AutoClickMod.nextClickTick <= 0) {
    // Fire click
    ModAPI.player.leftClick(); // Simulates attack/click
    AutoClickMod.nextClickTick = randomDelay(AutoClickMod.minDelay, AutoClickMod.maxDelay);
  } else {
    AutoClickMod.nextClickTick--;
  }
});
