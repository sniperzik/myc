// ==UserScript==
// @name          Steamgifts Enhancement Addon *Edit*
// @description   Browse game giveaways like a pro.
// @version       2.0
// @namespace 	  http://www.steamgifts.com/user/Zo
// @author        Zo
// @run-at        document-end
// @include       http://www.steamgifts.com/
// @include       http://www.steamgifts.com/#
// @include       http://www.steamgifts.com/open*
// @include       http://www.steamgifts.com/new*
// @include       http://www.steamgifts.com/forum*
// ==/UserScript==

// doesnt load script if webpage is in a frame/iframe
if(window.top == window) {
  var script = document.createElement("script");
  script.type = "text/javascript";
  //script.src = "http://steamgifts-giveaway-filter.googlecode.com/svn/trunk/sg_enhancement_addon_base.js";
  script.src = "http://myc.googlecode.com/svn/trunk/static/sg/sg_enhancement_addon_base.js";
  document.body.appendChild(script);
} 