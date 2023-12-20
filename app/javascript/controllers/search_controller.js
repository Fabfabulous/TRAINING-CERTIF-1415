import { Controller } from "@hotwired/stimulus";


// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log("Connected");
  }

  filterVehicles(event) {
    const url = `${this.formTarget.action}?query=${event.currentTarget.value}`;
    console.log(url);

    // fetch(url, {
    //   headers: {
    //     Accept: "text/plain",
    //   },
    // })
    //   .then((res) => res.text())
    //   .then((data) => {
    //     console.log(data);
    //     this.vehiclesTarget.innerHTML = data;
    //   });
  }
}
