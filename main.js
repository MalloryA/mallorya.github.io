"use strict";

const attachCopyButtons = () => {
	for (const element of document.querySelectorAll("pre, code, kbd")) {
		if (element.dataset.nocopy) {
			continue
		}

		const copyText = element.textContent
		const copyButton = document.createElement("button")
		copyButton.classList.add("copy")
		copyButton.innerText = "copy"
		copyButton.addEventListener("click", () => {
			navigator.clipboard.writeText(copyText)
		})
		element.appendChild(copyButton)
	}
}

window.addEventListener("DOMContentLoaded", () => {
	attachCopyButtons()
})
