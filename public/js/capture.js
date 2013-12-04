  function hasGetUserMedia() {
    // Note: Opera is unprefixed.
    return !!(navigator.getUserMedia || navigator.webkitGetUserMedia ||
    navigator.mozGetUserMedia || navigator.msGetUserMedia);
    }
    if (hasGetUserMedia()) {
    // Good to go!
    } else {
    alert('getUserMedia() is not supported in your browser');
  }

  function grabImage(someCanvas) {
    return someCanvas.toDataURL('image/jpeg', 0.9).split(',')[1];
  }

  window.addEventListener("DOMContentLoaded", function () {
    // Grab elements, create settings, etc.
    var canvas = document.getElementById("canvas"),
        context = canvas.getContext("2d"),
        video = document.getElementById("video"),
        videoObj = { "video": true },
        errBack = function (error) {
            console.log("Video capture error: ", error.code);
        };
 
    if (navigator.getUserMedia) { // Standard
        navigator.getUserMedia(videoObj, function (stream) {
            video.src = stream;
            video.play();
        }, errBack);
    } else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
        navigator.webkitGetUserMedia(videoObj, function (stream) {
            video.src = window.webkitURL.createObjectURL(stream);
            video.play();
        }, errBack);
    }
 
    // Trigger photo take
    document.getElementById("snap").addEventListener("click", function () {
        context.drawImage(video, 0, 0, 640, 480);
        var blob = grabImage(canvas);
        
        var formData = new FormData();
        formData.append("someFilename", blob);
        
        // var request = new XMLHttpRequest();
        // // request.onload = completeRequest;

        // request.open("POST", "/");
        // request.send(formData);
        $.ajax({
          url: "/someface/submit",
          type: "POST",
          data: '{ "image": "' + blob + '" }',
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: function () {
              console.log('Image Uploaded!!');
          },
        })
    });

  }, false);