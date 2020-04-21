"use scrict";

let game = [], name, nameShort, latestVersion, downloadLink, changelogLink;

//fetch("./settings.json")
fetch("https://myc.lv/settings.json")
	.then(function(resp) {
		return resp.json();
	})
	.then(function(data) {
		//console.log(data);
		game = data.game;
		name = data.name;
		nameShort = data.nameShort;
		latestVersion = data.latestVersion;
		downloadLink = data.downloadLink;
		changelogLink = data.changelogLink;
	});