import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    countdownTo: String,
  };

  static targets = ["clock"];

  connect() {
    if (!this.hasCountdownToValue) {
      return;
    }

    const future = new Date(this.countdownToValue);

    this.interval = setInterval(() => {
      const now = new Date().getTime();
      const distance = future.getTime() - now;

      if (distance < 0) {
        clearInterval(interval);
        this.clockTarget.innerText = "00:00:00";
        return;
      }

      const value = this.formatTime(Math.floor(distance / 1000));
      this.clockTarget.innerText = value;
      document.title = value;
    }, 1000);
  }

  formatTime(timeInSeconds) {
    const hours = Math.floor(timeInSeconds / 3600);
    const minutes = Math.floor((timeInSeconds % 3600) / 60);
    const seconds = timeInSeconds % 60;

    return [hours, minutes, seconds]
      .map((val) => (val < 10 ? `0${val}` : val))
      .join(":");
  }

  disconnect() {
    clearInterval(this.interval);
  }
}
