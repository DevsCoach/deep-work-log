import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    url: String,
  };

  save() {
    const form = this.element.querySelector("form");

    fetch(this.urlValue, {
      method: "PATCH",
      headers: {
        "X-CSRF-TOKEN": this.csrfToken(),
      },
      body: new FormData(form),
    })
      .then((response) => {})
      .catch((error) => console.error("Error autosaving:", error));
  }

  csrfToken() {
    return document.head.querySelector(`meta[name="csrf-token"]`).content;
  }
}
