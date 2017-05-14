// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
const SeeAndSays = (module) => {
  const reset = (cell) => {
    setTimeout(() => {
      $(".center").removeClass("center")
      $(cell).click(module.highlight)
    }, 5000)
  }

  const findElements = (target) => {
    var cell, displayTag;

    if(target.is("td")){
      cell = target;
      displayTag = target.children().first();
    } else {
      displayTag = target;
      cell = target.parent();
    }

    return {cell, displayTag};
  }

  const playAudio = (displayTag) => {
    const audio = $("#player");
    audio.attr('src', displayTag.data("audioSrc"))
    setTimeout(() => audio[0].play(), 1500)
  }

  module.animate = (target) => {
    const {cell, displayTag} = findElements($(target));

    [cell, cell.parent(), $("table")].forEach((ele) => ele.addClass("center"))
    cell.prop('onclick',null).off('click');

    playAudio(displayTag)

    reset(cell)
  }

  module.highlight = (event) => {
    module.animate(event.target);
  }

  return module;
}({})

const SlideShow = (module) => {
  let turnedOff = true;

  const turnOn = () => {
    $("#slideShow").text("Turn Off SlideShow")
    turnedOff = false;
    scheduleNext(-1, 100)
    $("td").prop('onclick',null).off('click');
  }

  const turnOff = () => {
    $("#slideShow").text("Turn On SlideShow")
    turnedOff = true;
    $("td").on("click", SeeAndSays.highlight)
  }

  const scheduleNext = (currentIndex, timeOut = 10000) => {
    if(turnedOff)
      return;

    let nextIndex;
    while((nextIndex = (Math.floor(Math.random() * 4))) == currentIndex);

    setTimeout(() => {
      SeeAndSays.animate($("td")[nextIndex])
      scheduleNext(nextIndex)
    }, timeOut)
  }

  module.toggle = () => {
    turnedOff ? turnOn() : turnOff()

    return false;
  }

  return module;
}({})

$(() => {
  $("td").on("click", SeeAndSays.highlight)
  $("#slideShow").on("click", SlideShow.toggle)
})
