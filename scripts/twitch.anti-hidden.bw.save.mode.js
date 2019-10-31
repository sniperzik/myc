// ==UserScript==
// @name         twitch anti-hidden bw save mode
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://www.twitch.tv/*
// @match        https://player.twitch.tv/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    Object.defineProperty(document, "hidden", { value : false});
    
})();
