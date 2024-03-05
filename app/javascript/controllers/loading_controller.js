import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["swap"];

  swapToLoading(event) {
    const newDiv = this.buildLoader();
    this.element.append(newDiv);

    event.target.classList.add("hidden");
  }

  buildLoader() {
    const width = this.swapTarget.offsetWidth;
    const height = this.swapTarget.offsetHeight;
    const newDiv = document.createElement("div");

    newDiv.style.height = height + "px";
    newDiv.classList.add("skeleton");

    return newDiv;
  }
}
