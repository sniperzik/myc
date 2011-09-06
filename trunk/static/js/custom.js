$(document).ready(function() {

	/* Default hover
	$('.button,.otherbutton,.changelogbutton,.screenshotsbutton,.videobutton,.donatebutton').append('<span class="hover"></span>').each(function () {
		var $span = $('> span.hover', this).css('opacity', 0);
		$(this).hover(function () {
			$span.stop().fadeTo(500, 1);
		}, function () {
	$span.stop().fadeTo(500, 0);
		});
	});		
	*/
	
	/* Default fix for hover with fancy box
	$("a.inline").fancybox().hover(function() {
	$(this).click();
	});
	*/
	
	/* hover */		
	$('.button,.otherbutton,.changelogbutton,.screenshotsbutton,.videobutton,.donatebutton').append('<span class="hover"></span>').each(function () {
		var $span = $('> span.hover', this).css('opacity', 0);
		$(this).fancybox().hover(function () {
			$span.stop().fadeTo(500, 1);
		}, function () {
	$span.stop().fadeTo(500, 0);
		});
	});
	
	/* Fancybox */
	$("#screens").click(function() {
		$.fancybox([
			'http://myc.googlecode.com/files/proofaw.png',
			'http://myc.googlecode.com/files/1.jpg',
			'http://myc.googlecode.com/files/2.jpg',
			'http://myc.googlecode.com/files/3.jpg',
			'http://myc.googlecode.com/files/4.jpg',
			'http://myc.googlecode.com/files/5.jpg',
			'http://myc.googlecode.com/files/6.jpg',
			'http://myc.googlecode.com/files/7.jpg',
			'http://myc.googlecode.com/files/8.jpg'
		],{
			'padding'			: 0,
			'transitionIn'		: 'elastic',
			'transitionOut'		: 'elastic',
			'type'              : 'image',
			'changeFade'        : 0
		});
	});
	
	$("#changelog").fancybox({
		'width'				: '35%',
		'height'			: '75%',
		'autoScale'			: false,
		'transitionIn'		: 'elastic',
		'transitionOut'		: 'elastic',
		'type'				: 'iframe'
	});

	$("#video").fancybox({
		'width'				: 576,
		'height'			: 365,
		'padding'			: 0,
		'autoScale'			: false,
		'transitionIn'		: 'elastic',
		'transitionOut'		: 'elastic',
		'type'				: 'iframe'
	});
});