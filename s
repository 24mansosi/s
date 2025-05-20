(function() {
  let autoClicking = false;
  let minDelay = 300;   // ms
  let maxDelay = 1200;  // ms

  function randomDelay(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  function simulateClick() {
    if (!autoClicking) return;

    const evt = new MouseEvent('click', {
      bubbles: true,
      cancelable: true,
      view: window
    });
    document.elementFromPoint(window.innerWidth / 2, window.innerHeight / 2)?.dispatchEvent(evt);

    const nextDelay = randomDelay(minDelay, maxDelay);
    setTimeout(simulateClick, nextDelay);
  }

  // Toggle with "T"
  document.addEventListener('keydown', (e) => {
    if (e.key.toLowerCase() === 't') {
      autoClicking = !autoClicking;
      console.log(`AutoClicker ${autoClicking ? 'started' : 'stopped'}`);
      if (autoClicking) simulateClick();
    }
  });

  console.log('🎯 Smart AutoClicker loaded. Press "T" to toggle.');
})();
