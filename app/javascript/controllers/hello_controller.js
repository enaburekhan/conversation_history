import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Replace the inner HTML with the content of the hidden element
    const content = document.querySelector('#hello-content').innerHTML;
    this.element.innerHTML = content;
  }
}
