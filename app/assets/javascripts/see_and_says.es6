// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var SeeAndSays = (module) => {

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

  module.highlight = (event) => {
    const {cell, displayTag} = findElements($(event.target));

    [cell, cell.parent(), $("table")].forEach((ele) => ele.addClass("center"))
    cell.prop('onclick',null).off('click');

    playAudio(displayTag)

    reset(cell)
  }

  module.scheduleNext = (currentIndex, timeOut = 10000) => {
    var nextIndex;
    while((nextIndex = (Math.floor(Math.random() * 4))) == currentIndex);

    setTimeout(() => {
      $($("td")[nextIndex]).trigger("click")
      module.scheduleNext(nextIndex)
    }, timeOut)
  }

  return module;
}({})

$(() => {
  $("td").on("click", SeeAndSays.highlight)
  SeeAndSays.scheduleNext(-1, 1000)
})
