// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var SeeAndSays = (module) => {

  const reset = (element) => {
    $(".center").removeClass("center")
    $(element).click(module.highlight)
  }
  module.highlight = (event) => {
    const element = $(event.target);
    [element, element.parent(), $("table")].forEach((ele) => ele.addClass("center"))
    element.prop('onclick',null).off('click');
    const audio = document.getElementById(element.text())
    setTimeout(() => audio.play(), 1000)
    setTimeout(() => reset(element), 5000)
  }

  return module;
}({})

$(() => {
  $("td").on("click", SeeAndSays.highlight)
})
