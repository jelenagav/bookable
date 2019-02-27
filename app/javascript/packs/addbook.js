var current_fs, next_fs, previous_fs;
var left, opacity, scale;
var animating;

const form = document.getElementById("msform")

if(msform) {
  const nextbuttons = msform.querySelectorAll(".next")
  const progressbar = msform.querySelector("#progressbar")

  nextbuttons.forEach ((next) => {
    next.addEventListener('click', (event) => {
      const active = msform.querySelector("fieldset.active");
      active.classList.toggle("active")
      active.nextElementSibling.classList.toggle("active")
      const activeprogress = progressbar.querySelector("li.active");
      activeprogress.classList.toggle("active")
      activeprogress.nextElementSibling.classList.toggle("active")

    })
  })


  // $(".next").click(function() {
  //     if (animating) return false;
  //     animating = true;

  //     current_fs = $(this).parent();
  //     next_fs = $(this)
  //       .parent()
  //       .next();
}
// $("#progressbar li")
//         .eq($("fieldset").index(next_fs))
//         .addClass("active");
//      next_fs.show();
//    }



