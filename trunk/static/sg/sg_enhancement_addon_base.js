(function($) {
// chrome/opera hack;
var unsafeWindow = this['unsafeWindow'] || window;

// check if already loaded
if(unsafeWindow.gafIsLoaded) return false;
unsafeWindow.gafIsLoaded = true;

// doesnt load on search page
if(window.location.href.indexOf("search/") > -1 ) return false;

// fades background and shows+centre the popup
unsafeWindow.gafPopupShow = function() {
	$("#gafPopup").css({
				"top": document.documentElement.clientHeight / 2 - 200,
				"left": document.documentElement.clientWidth / 2 - 200
				}); 
	$('#gafPopup').show('slow');
	$('#gafPopupBackground').fadeIn('slow');
}

// hide popup and background
unsafeWindow.gafPopupHide = function() {
  $('#gafOverlay').remove();
	$('#gafPopup').hide('slow');
	$('#gafPopupBackground').fadeOut('slow');
}

// function is called everytime there is a change to textarea for the filter
// and contents mirrored in the cookie
unsafeWindow.gafFormUpdate = function() {
	unsafeWindow.localStorage.gafFilter = $('#gafFilterInput').val();
  unsafeWindow.gafFilter = $('#gafFilterInput').val().split(',');
}

// called then ignore button is pressed
// * adds name of the game to the filter and updates the cookie
// * hides all giveaways for the same game
// * slide up animantion
unsafeWindow.gafIgnore = function(elm) {
  var node = elm.parentNode.parentNode.parentNode.parentNode;
  $(elm).hide();
	$('#gafFilterInput').append(',' + $(node).find('.title').find('a').html());
	unsafeWindow.gafFormUpdate();
	unsafeWindow.gafApplyFilter($('.post'));
  unsafeWindow.gafLoadingCheck();
}

// removes giveaway matching the filter
unsafeWindow.gafApplyFilter = function(gafs) {
  if($.trim($('input[name=gafSearch]').val()) != "") {
    var match_pat = new RegExp($.trim($('input[name=gafSearch]').val()).replace(/[-[\]{}()+?.,\\^$|#\s]/g, '\\$&'),'i');
    $(gafs).find('.title a').each(function(k,e) {
      if($(e).text().match(match_pat)) {
        $(e).parent().parent().parent().stop(true,true).slideDown();
      } else {
        $(e).parent().parent().parent().stop(true,true).slideUp();        
      }
    });
    
    setTimeout(unsafeWindow.gafLoadingCheck, 1000);
    return false;  
  }

  // show all giveaways
  if(unsafeWindow.gafFilterState == 0)
  {
    $('.post').stop(true,true).slideDown();
    return false;
  }
  // show only group giveaways
  if(unsafeWindow.gafFilterState == 3) {
    $('.post').each(function(k,e) {
      e = $(e);
      if(e.find('.group_only').text().indexOf("Group") == -1) {
        e.stop(true,true).slideUp();
      } else {
        e.stop(true,true).slideDown();        
      }
    });
    
    setTimeout(unsafeWindow.gafLoadingCheck, 1000);
    return false;
  }
  // show only contributor giveaways
  if(unsafeWindow.gafFilterState == 5) {
    $('.post').each(function(k,e) {
      e = $(e);
      if(e.find('.contributor_only').text().indexOf("Contributor") == -1) {
        e.stop(true,true).slideUp();
      } else {
        e.stop(true,true).slideDown();        
      }
    });
    
    setTimeout(unsafeWindow.gafLoadingCheck, 1000);
    return false;
  }
  // show only the one you have points for
  if(unsafeWindow.gafFilterState == 4) {
    var p = $('#navigation li a.arrow').slice(1,2).text().match(/(\d+)P/);
    if(!p) return false;
    if(p[1] < 1) return false;

    p = p[1];
    
    $(gafs).find('.title span').each(function(k,e) {
      var s = e.innerHTML.match(/(\d+)P/);
      e = $(e).parent().parent().parent();
      if(s && parseInt(s[1]) <= p) {
        if( !e.is(':visible') ) e.stop(true,true).slideDown();
      } else if(s) {
        if( e.is(':visible') ) e.stop(true,true).slideUp();
      }
    });
    
    setTimeout(unsafeWindow.gafLoadingCheck, 1000);
  }

  var gaflist = $.unique(unsafeWindow.gafFilter.concat(unsafeWindow.gafSyncFilter).sort());
  var gafstr;
  var match = false;
   
  for(i = 0; i < gafs.length; i++) {
  	var elm = $(gafs[i]).find('a')[0];
  	match = false;
    $(gafs[i]).find('.description').attr('style','');
  
    for(j = 0; j < gaflist.length; j++) {
        gafstr = $.trim(gaflist[j]).toLowerCase().replace(/&/g,'&amp;');
        if(gafstr == "") continue;
        
        // check if we are parsing a highlight entry
        var highlight = false;
        if(gafstr.match(/^\d+\. /)) {
          highlight = true;
          gafstr = gafstr.replace(/^\d+\. /,'');
        }

        var pat = new RegExp('^'+gafstr.replace(/[-[\]{}()+?.,\\^$|#\s]/g, '\\$&').replace(/\*/g,'.*')+'$');
        
        if(highlight) {
          // if element doenst match continue with next one
          if(!elm.innerHTML.toLowerCase().match(pat)) continue;
          // else highlight the element and make it visible
          $(gafs[i]).find('.description').css({background: '#aaFFa8'});
          if( !$(gafs[i]).is(':visible') && unsafeWindow.gafFilterState != 4) $(gafs[i]).stop(true,true).slideDown();

          match = true;
          break;
        }
        else if(elm.innerHTML.toLowerCase().match(pat)) {
          if( $(gafs[i]).is(':visible') ) $(gafs[i]).stop(true,true).slideUp();

          match = true;
          break;
        }
  	}
  	
  	if(unsafeWindow.gafFilterState != 4) {
    	if(match == false && unsafeWindow.gafFilterState == 2) { $(gafs[i]).stop(true,true).slideUp(); }
    	else if(match == false && unsafeWindow.gafFilterState != 2) { $(gafs[i]).stop(true,true).slideDown(); }
  	}
  }
}

// add ignore buttons to all giveaways :)
unsafeWindow.gafAddIgnoreButton = function(elms) {
  var gafs = $(elms).find('a');
  
  for(i = 0; i < gafs.length; i++) {
  	if(gafs[i].href.match(/\/giveaway.*?entries$/))
  	{
  		$(gafs[i].parentNode.parentNode).append("<span style='margin-right: 10px;'><a href='#' name='gafbutton' onclick='javascript: gafIgnore(this); return false'>Ignore</a></span>")
  	}
  }
}

// function is called by iframe onLoad
// filters new giveaways and adds them to the current page for endless scroll
unsafeWindow.gafPageLoaded = function() {
    if(window.location.href.match(/forum/)) {
      if(unsafeWindow.gafHrefPart.length > 5) {
        if(unsafeWindow.gafReverse) {
          $('#gafWindow').contents().find('.parent_container').reverse().insertAfter($('.parent_container').last());
        }
        else {
          $('#gafWindow').contents().find('.parent_container').insertAfter($('.parent_container').last());        
        }
        
        // restore click functionallity
        // code taken from SG, credit: CG
        $('.delete_comment').click(function(){
					$("input[name='delete_comment_id']").val($(this).parent().attr("rel"));
					$('#delete_comment').submit();
					return false;
				});
        $('.comment_reply .edit_comment').click(function(){
					$(this).parent().parent().parent().children('.user_body').hide();
					$(this).parent().parent().parent().children('.user_edit').show();
					return false;
				});
				$('.comment_reply .reply_link a').click(function(){
					id=$(this).attr('rel');
					depth=parseInt($(this).attr('class'))+1;
					$("#comment_form #parent_id").val(id);
					$("span.title").html("Add a reply");
					$("span.cancel").show();
					$("#comment_form").insertAfter('.comment#' + id);
					$("#comment_form").addClass('border_container');
					return false;
				});
				$('#comment_form span.cancel a').click(function(){
					$("#comment_form #parent_id").val(0);
					$("span.title").html("Add a comment");
					$("span.cancel").hide();
					$("#comment_form").insertAfter('#comment_location');
					$("#comment_form").removeClass('border_container');
					return false;
				});
        $('.cancel_edit_comment').click(function(){
					$(this).parent().parent().parent().parent().children('.user_body').show();
					$(this).parent().parent().parent().parent().children('.user_edit').hide();
					return false;
				});					
      }
      else {
        $('#gafWindow').contents().find('.row a').each(function(key,obj) {
              if($(obj).attr('href').match(/^\/forum/)) {
                var newURL = $(obj).attr('href') + "/page/31337";
                $(obj).attr('href',newURL);
              }
            });
        $('#gafWindow').contents().find('.row').appendTo('.discussions');
        $('.row').css({padding: $('#gafSlider').slider("value") + "px 0"});
      }
    }
    else
    {
			// remove Contributor links from loaded elements
			$('#gafWindow').contents().find("div.post span.new:contains('Contributor')").parent().parent().parent().remove();
      // get all giveaways
      var elms = $('#gafWindow').contents().find('div.post');

      
      // update points from endless scroll page load
      var p = $('#gafWindow').contents()
              .find('#navigation li a.arrow').slice(1,2).text().match(/(\d+)P/);
      if(p && parseInt(p[1]) != NaN) {
        unsafeWindow.gafSetPoints(p[1]);
      }
      
      // new page refresh
      if(unsafeWindow.gafLoadingNew) {
        var codebase = {};
        var celms = $('.post').slice(0,15);
        var code = celms.first().find('.title a').attr('href').match(/way\/([a-z0-9]{4,6})\//i)[1];
        var i = 0;
        
        for(; i < 10; i++) {
          if($(elms[i]).find('.title a').attr('href').match(/way\/([a-z0-9]{4,6})\//i)[1] == code) break;
        }
        
        if(i > 0) {
          $('div.pagination:first').after(elms.slice(0,i).hide().css({padding:unsafeWindow.gafPadding+'px 0'}));
          unsafeWindow.gafAddIgnoreButton(elms.slice(0,i));
          unsafeWindow.gafApplyFilter(elms.slice(0,i));
        }
        
        celms.each(function(k,v) {
          codebase[ $(v).find('.title a').attr('href').match(/way\/([a-z0-9]{4,6})\//i)[1] ] = k;
        });
        
        elms.slice(i,20).each(function(k,v) {
          var test = codebase[ $(v).find('.title a').attr('href').match(/way\/([a-z0-9]{4,6})\//i)[1] ];
          if(test != undefined) {
            $(celms[test]).find('.time_remaining').html('').append($(v).find('.time_remaining').html());
            $(celms[test]).find('.entries span').slice(0,2).remove();
            $(celms[test]).find('.entries').prepend($(v).find('.entries span').slice(0,2));
          }
        });
        
        unsafeWindow.gafLoadingNew = false;
      }
      else {            
        unsafeWindow.gafAddIgnoreButton(elms);
        
        if(elms.length > 0)
        { 
          if($('div.post').length > 0) { $('div.post').last().after(elms); }
          else { $('div.pagination:first').after(elms); }
        }
        
        $('div.post').css({padding: $('#gafSlider').slider("value") + "px 0"});
        unsafeWindow.gafApplyFilter(elms.hide());
      }
      unsafeWindow.gafAddOverlay();
    }
    
    if( (!unsafeWindow.gafReverse && unsafeWindow.gafPage == unsafeWindow.gafMaxPage)
            || (unsafeWindow.gafReverse && unsafeWindow.gafPage == 1) ) {
      $('#gafLoading').html("<p>You've reached the end.</p>");
  
      if(unsafeWindow.gafShowSettings && $('.post').length == 0) {
        $('#gafLoading').html("<p>There seem to be no giveaways matching your settings.</p>");
      }
    }
    unsafeWindow.gafLoading = false;
    unsafeWindow.gafLoadingCheck();
}

// function runs when gafLoading is in veiw
unsafeWindow.gafLoadNextPage = function() {
  if(!unsafeWindow.gafLoading
     && ( (!unsafeWindow.gafReverse && unsafeWindow.gafPage < unsafeWindow.gafMaxPage)
          || (unsafeWindow.gafReverse && unsafeWindow.gafPage > 1) )){
          
    unsafeWindow.gafLoading = true;
    unsafeWindow.gafPage += (unsafeWindow.gafReverse) ? -1 : 1;
    
    if(window.location.href.match(/forum/)) {
      if(unsafeWindow.gafHrefPart.length > 5) {
        if(unsafeWindow.gafReverse) {
          $('#gafWindow').attr('src',window.location.href.replace(/\d+$/,unsafeWindow.gafPage));
        } 
        else {
          $('#gafWindow').attr('src',window.location.href + '/page/' + unsafeWindow.gafPage);
        }
      }
      else {
        $('#gafWindow').attr('src','http://www.steamgifts.com/forum/page/' + unsafeWindow.gafPage);
      }
    }
    else if(window.location.href.match(/new$/)) {
      $('#gafWindow').attr('src','http://www.steamgifts.com/new/page/' + unsafeWindow.gafPage);
    }
    else {
      $('#gafWindow').attr('src','http://www.steamgifts.com/open/page/' + unsafeWindow.gafPage);
    }
  }
}
 
// credit for code goes to creators to the reddit enchancement suit
// check if obj in the view
unsafeWindow.gafElementInSight = function(obj) {
    var top = obj.offsetTop;
		var left = obj.offsetLeft;
		var width = obj.offsetWidth / 4;
		var height = obj.offsetHeight / 4;
		while(obj.offsetParent) {
			obj = obj.offsetParent;
			top += obj.offsetTop;
			left += obj.offsetLeft;
		}
		return top >= window.pageYOffset &&
			left >= window.pageXOffset &&
			(top + height) <= (window.pageYOffset + window.innerHeight) &&
			(left + width) <= (window.pageXOffset + window.innerWidth);
}

// creates a filter array using the sync games
unsafeWindow.gafSync = function() {
  // get list from the sync page
  $.get('http://www.steamgifts.com/sync', function(data) {
      // update the syncfilter array
      $(data.match(/\"code\">(.*?)<\//g)).each(function(k,v) {
          unsafeWindow.gafSyncFilter.push(v.replace(/\"code\">/g,'').replace(/<\//g,''));
        });
        
      unsafeWindow.gafSyncFilter = $.grep(unsafeWindow.gafSyncFilter, function(a) { return !a.match(/^<a /) });
      // filter out giveaways using the new list        
      unsafeWindow.gafApplyFilter($('.post'));
      // check if we got the loading element in sight
      unsafeWindow.gafLoadingCheck();
    });
}
// check if gafLoading is in sight
unsafeWindow.gafLoadingCheck = function() {
    if(unsafeWindow.gafElementInSight( document.getElementById('gafLoading') ) ) { // || unsafeWindow.gafPage < 3) {
      setTimeout(unsafeWindow.gafLoadNextPage, 1);
    }
}

// refresh if on /new page
unsafeWindow.gafRefreshCheck = function() { 
  if(!unsafeWindow.gafLoading) {
    unsafeWindow.gafLoading = true;
    unsafeWindow.gafLoadingNew = true;
    $('#gafWindow').attr('src','http://www.steamgifts.com/new/page/1');  
  }
   
  setTimeout(unsafeWindow.gafRefreshCheck, 1000 * 90);
}

// toggle endless scroll on various pages
unsafeWindow.gafToggleScroll = function(obj) {
  if(obj.innerHTML == "on") {
    obj.innerHTML = 'off';
    
    if(window.location.href.match(/\/forum/)) {
      if(unsafeWindow.gafHrefPart.length > 5) { unsafeWindow.gafOptions = unsafeWindow.gafOptions.replace(/D/g,''); }
      else { unsafeWindow.gafOptions = unsafeWindow.gafOptions.replace(/F/g,''); }
    }
    else { unsafeWindow.gafOptions = unsafeWindow.gafOptions.replace(/G/g,''); }
  }
  else {
    obj.innerHTML = 'on';

    if(window.location.href.match(/\/forum/)) {
      if(unsafeWindow.gafHrefPart.length > 5) { unsafeWindow.gafOptions += 'D'; }
      else { unsafeWindow.gafOptions += 'F'; }
    }
    else { unsafeWindow.gafOptions += 'G'; }
  }

	document.cookie = "gafOptions=" + unsafeWindow.gafOptions + "; expires=Fri, 27 Jul 2030 02:47:11 UTC; path=/";
  
  if(!window.location.href.match(/page\/31337$/)
      && window.location.href.match(/page\/\d+$/)
      && !unsafeWindow.gafReverse  ) {
      window.location.href = window.location.href.replace(/\/page\/\d+/,'');
  }
  else {
      if(obj.innerHTML == 'on' && unsafeWindow.gafReverse) {
        window.location.href = window.location.href.replace(/\/page\/\d+/,'') + '/page/31337';
      }
      else {
        window.location.href = window.location.href;
      }
  }
}

// toggle reverse order
unsafeWindow.gafToggleRev = function(obj) {
  if(obj.innerHTML.match(/newest/)) {
    obj.innerHTML = 'oldest first';
    unsafeWindow.gafOptions = unsafeWindow.gafOptions.replace(/R/g,'');
    unsafeWindow.gafReverse = false;
  }
  else {
    obj.innerHTML = 'newest first';
    unsafeWindow.gafOptions += 'R';
    unsafeWindow.gafReverse = true;
  }

	document.cookie = "gafOptions=" + unsafeWindow.gafOptions + "; expires=Fri, 27 Jul 2030 02:47:11 UTC; path=/";
  
  if(unsafeWindow.gafScrollOn && unsafeWindow.gafReverse) {
      window.location.href = window.location.href.replace(/\/page\/\d+/,'');
  }
  else if(unsafeWindow.gafScrollOn) {
      window.location.href = window.location.href + '/page/31337';
  }
  else {
      $('.parent_container').reverse().appendTo('.comment_container');
  }
}
unsafeWindow.gafHideFeatured  = function(obj) {
  if(unsafeWindow.gafFeaturedHidden) {
    unsafeWindow.gafOptions = unsafeWindow.gafOptions.replace(/Z/g,'');
    $(this).attr('checked',false);
    unsafeWindow.gafFeaturedHidden = false;
    $('.featured').slideDown();
  } else {
    unsafeWindow.gafOptions += "Z";
    $(this).attr('checked',true);
    unsafeWindow.gafFeaturedHidden = true;
    $('.featured').slideUp();   
  }
  document.cookie = "gafOptions=" + unsafeWindow.gafOptions + "; expires=Fri, 27 Jul 2030 02:47:11 UTC; path=/";
}

unsafeWindow.gafSyncToggle = function(obj) {
  if(unsafeWindow.gafSyncState) {
    unsafeWindow.gafOptions = unsafeWindow.gafOptions.replace(/S/g,'');
    $(this).attr('checked',false);
    unsafeWindow.gafSyncState = false;
  } else {
    unsafeWindow.gafOptions += "S";
    $(this).attr('checked',true);
    unsafeWindow.gafSyncState = true;
    
    if(unsafeWindow.gafSyncFilter.length < 1) unsafeWindow.gafSync();  
  }
  
  document.cookie = "gafOptions=" + unsafeWindow.gafOptions + "; expires=Fri, 27 Jul 2030 02:47:11 UTC; path=/";
}

// rearrange page to fit in 500px window
unsafeWindow.gafOverlayLoaded = function(obj) {
  $('#gafPopupBackground').fadeIn('slow');
  var e = $(obj).contents();
  
  // update points from the overlay page
  var p = e.find('#navigation li a.arrow').slice(1,2).text().match(/(\d+)P/);
  if(p && parseInt(p[1]) != NaN) {
    unsafeWindow.gafSetPoints(p[1]);
  }
  
  e.find('.footer,.featured .left').remove();
  e.find('.bg_gradient .content').first().remove();
  e.find('.content').css({width:'500px'});
  e.find('.bg_gradient').css({'background-position':'center center'});
  e.find('.body_container').css({width:'400px'});
  e.find('.parent_container').css({padding:0}).find('.comment.parent').css({padding:'5px'});                                 
  e.find('.featured').css({padding:0}).find('.right').css({'padding-top':'5px'});
  e.find('body').css({'min-width':0,width:'510px'});
  e.find('#comment_form').prependTo(e.find('.wrapper').css({padding:0})).find('.body_container').attr('style','')
  
  var env = $('#gafOverlay iframe').contents().find('#comment_form');
  
  $('<input type="submit" value="Comment and Enter" />')
  .appendTo(env.find('.comment_reply')).click(function() {
  $.post($('#gafOverlay iframe').attr('src'),
         $('#gafOverlay iframe').contents().find('#form_enter_giveaway').serialize(),
         function(data) {
          env.find('form')
          .append('<input type="hidden" name="submit_comment" value="1" />').submit();
         });

    return false;
  });
  
  env.find('.comment_reply input:first').attr("value","Submit");
  
  if(!$(obj).hasClass('gafMoved')) {
    $(obj).addClass('gafMoved');
    var x = $(obj).parent().css('left').match(/(\d+)/)[1];
    var y = $(obj).parent().css('top').match(/(\d+)/)[1];
    $(obj).parent().css({left: (x - 530) + "px",top:y - 100});
    $(obj).css({width:'530px',height:'400px'}).parent().find('img').hide();
  }
}

unsafeWindow.gafAddOverlay = function() {
  $('.post .right').each(function(k,v) {
    v = $(v);
    if(v.find('div').length > 0) return; 

    v.find('img').css({float:'right'})
    
    $('<div>Quick View</div>').css({opacity:0,'font-size':'20px',color:"#000",'font-size':'25px','background-color':'#ccc',float:'left',position:'absolute',width:'144',height:'29px','padding':'20px','font-weight':'bold',cursor:'pointer','text-align':'center'})
    .mouseleave(function() { $(this).stop(true,true).animate({opacity:'0'},1000); })
    .mouseover(function() { $(this).stop(true,true).animate({opacity:'0.75'},100); })
    .appendTo(v)
    .click(function() {
      if($('#gafOverlay').length > 0) return false;
      $('body').append("<div style='z-index:25;position:absolute;box-shadow:0 0 3px #000;padding:4px;background-color:#F9F9FB;border-radius:5px' id='gafOverlay'><iframe style='width:1px;height:1px;border:0' onload='javascript:gafOverlayLoaded(this);' src='"+$(this).parent().find('a').attr('href')+"'></iframe><img src='data:image/gif;base64,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' /></div>");
      var elm = $(this)[0];
      $('#gafOverlay').css({
        top: (elm.offsetTop + 15) + 'px',
        left: (elm.offsetLeft - 20) + 'px'
        });
      return false;
    });
  });
}

unsafeWindow.gafPutLoading = function() {
      $('.pagination:last').html("<div id='gafLoading' style='text-align: center;'><img src='data:image/gif;base64,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' /><p>Gremlins are fetching more stuff. Please standby...</p></div>");
}

unsafeWindow.gafSetPoints = function(pts) {
  var e = $('#navigation li a.arrow').slice(1,2);
  var a = e.text().match(/(\d+)P/);
  if(a.length)
  {
    var p = a[1];
          
    var y = Math.round(Math.random()*60)-50;
    var x = Math.round(Math.random()*40)-20;
    var total = pts - p;
    
    $('#nav,#navigation').each(function(k,v) {
        v = $(v).find('li a.arrow').slice(1,2).text('Account ('+pts+'P)');
    });
    
    if(total == 0) return;

    $('<div>'+((total >= 0)?'+'+String(total):total)+'</div>')
    .appendTo('body')
    .css({position:'fixed',
          top:'0px',
          left: ($('#navigation li a.arrow').slice(1,2)[0].offsetLeft - 50) + "px",
          'font-size':'20px',
          'font-weight':'bold',
          'text-shadow':'#666 0px 0px 6px',
          color:(total >= 0) ? '#77FF73' : 'red',
          'z-index':55 })
    .show().animate({top:60+x,left:'+='+y},350)
    .delay(300).animate({fontSize:'60px',top:'-=10',left:'-=20'},100)
    .delay(100).fadeOut(300,function(){ $(this).remove(); });
  } 
}

unsafeWindow.gafUpdateViews = function() {
  var v = ['All', 'Filtered', 'Wishlist Only', 'Groups only', 'Limit by points', 'Contributor Only']

  if($('#gafViewLinks').length == 0) {
    $('.pagination:first').prepend("<div style='float: right;' id='gafViewLinks'></div>");
  }
  
  var elm = $('#gafViewLinks');
  elm.html('');
  
  for(var i = 0; i < v.length; i++) {
    if(i > 0) elm.append(' | ');
    if(i != unsafeWindow.gafFilterState) elm.append("<a style='color:#347DB5;' class='vid"+i+"' href='#'>" + v[i] + "</a>");
    else elm.append(v[i]);    
  }
}

// main code
unsafeWindow.gafFilter = [];
unsafeWindow.gafSyncFilter = [];

// flags for options
// G - giveaway endless scroll turned on
// F - forum endless scroll turned on
// D - dicussion endless scroll
// R - reverse order of comments
// S - ignore sync games
unsafeWindow.gafOptions = "GFDR";
unsafeWindow.gafPadding = 25;

var $ = unsafeWindow.jQuery;
$.fn.reverse = [].reverse;

// add popup elements
$('body').append("<div id='gafPopupBackground' style='position:fixed;display:none;top:0;left:0;height:100%;width:100%;background:#000000;z-index:20;opacity: 0.4;' onClick='javascript: gafPopupHide();'></div><div id='gafPopup' style='position:fixed;float:left;left:50%;top:50%;background:#FFFFFF;display:none;border:1px solid #cccccc;z-index:21;padding:8px;height:295px;width:408px;border-radius: 10px 10px 10px 10px;box-shadow: 0 0 20px #000000;'><h1 style='color: #347DB5;font-size: 22px;'>Giveaway Filter</h1><p style='color: #4F565A;font-size: 12px;'>Enter the games you want filtered out from the giveaway list separated by commas. (eg 'Portal 2, Half-Life 2') <b>/Save by clicking on the background/</b></p><textarea id='gafFilterInput' style='width:400px;height:200px;' onchange='javascript:gafFormUpdate();'></textarea><p style='color: #4F565A;font-size: 12px;'><input type='checkbox' value='tiny gremlin' id='gafSyncCBox' onchange='javascript:gafSyncToggle();'> Ignore games in my sync library. (Update sync page <a href='http://www.steamgifts.com/sync'>here</a>)</p><p style='color: #4F565A;font-size: 12px;'><input type='checkbox' value='medium gremlin' id='gafHideFeatCBox' onchange='javascript:gafHideFeatured();'> Check this box if you want to hide featured giveaway.</p></div>");

// read cookie        
var i,j,val='',c=document.cookie.split(";");

for (i=0;i<c.length;i++) {
  var testStr = $.trim(c[i].substr(0,c[i].indexOf("=")));
  if(testStr == "gafOptions") {
	  unsafeWindow.gafOptions = c[i].substr(c[i].indexOf("=")+1);
  }
  else if (testStr == "gafPadding") {
    unsafeWindow.gafPadding = c[i].substr(c[i].indexOf("=")+1);
  }
}

if(unsafeWindow.localStorage.gafFilter) {
  $('#gafFilterInput').text(unsafeWindow.localStorage.gafFilter)
  unsafeWindow.gafFilter = unsafeWindow.localStorage.gafFilter.split(",");
}
unsafeWindow.gafLoading = false;
unsafeWindow.gafLoadingNew = false;
unsafeWindow.gafPage = 1;
unsafeWindow.gafMaxPage = 1;
unsafeWindow.gafPerPage = 15;
unsafeWindow.gafFloatMenuOn = false;
unsafeWindow.gafScrollOn = true;
unsafeWindow.gafShowESS = true;
unsafeWindow.gafReverse = false;

unsafeWindow.gafShowSettings = true;
unsafeWindow.gafShowReverse = false;
unsafeWindow.gafRepReverse = false;
unsafeWindow.gafSyncState = false;
unsafeWindow.gafFeaturedHidden = false;
unsafeWindow.gafFilterState = 1;

unsafeWindow.gafHrefPart = window.location.href.split('/');

switch(unsafeWindow.gafHrefPart[3]) {
  case "forum":
	 if(unsafeWindow.gafHrefPart[4] == "replies"){
		unsafeWindow.gafScrollOn = false;
		unsafeWindow.gafShowSettings = false;
		unsafeWindow.gafShowESS = false;
		break;
	 }
	
      if(unsafeWindow.gafHrefPart.length > 5) {
        if( unsafeWindow.gafOptions.match('R')
            || window.location.href.match(/page\/31337$/)) { unsafeWindow.gafReverse = true; }
        if( !unsafeWindow.gafOptions.match('D') ) { unsafeWindow.gafScrollOn = false; }        
        
        unsafeWindow.gafPerPage = 40;
        unsafeWindow.gafShowReverse = true;
      }
      else {
        if( !unsafeWindow.gafOptions.match('F') ) { unsafeWindow.gafScrollOn = false; }
        if( unsafeWindow.gafOptions.match('R') ) { unsafeWindow.gafRepReverse = true; }
        
        unsafeWindow.gafPerPage = 30;
      }
      unsafeWindow.gafShowSettings = false;
      break;
  case "new":
      setTimeout(unsafeWindow.gafRefreshCheck, 1000 * 60);
  case "":
  case "open":
//      if(Math.random() <= 0.04) {
//        $('.bg_gradient').css({'background-image':'url(http://i.imgur.com/B03BB.jpg)','background-position':'85% 100%','background-color':'#26303a'});
//      }
      if( !unsafeWindow.gafOptions.match('G') ) { unsafeWindow.gafScrollOn = false; }
      if( unsafeWindow.gafOptions.match('S') ) {
        unsafeWindow.gafSyncState = true;
        $('#gafSyncCBox').attr('checked',true);
        unsafeWindow.gafSync();
      }
      if( unsafeWindow.gafOptions.match('Z') ) {
        unsafeWindow.gafFeaturedHidden = true;
        $('#gafHideFeatCBox').attr('checked',true);                
      }
      unsafeWindow.gafReverse = false;
    break;
}
// remove giveaways and add ignore buttons
if(unsafeWindow.gafShowSettings) {  
  val = $('.post');
  unsafeWindow.gafApplyFilter(val);  
  unsafeWindow.gafAddIgnoreButton(val);
      
  $('.sub_navigation h1').html("<a id='gafMenu' href='javascript: gafPopupShow()'>[Giveaway Filter Settings]</a>");

  unsafeWindow.gafAddOverlay();
  
}

// get rows per page, total rows, and calculate max page
unsafeWindow.gafMaxPage = Math.ceil($('.results').first().text().match(/(\d+) result/)[1] / unsafeWindow.gafPerPage);
unsafeWindow.gafPage = (unsafeWindow.gafReverse) ? unsafeWindow.gafMaxPage : 1;


// move the comment box at the top for less frustration
$('.discussions').after($('#comment_form'));

// endless scroll settings on page
if(unsafeWindow.gafShowESS) $('.results:first').html("Endless scrolling is <a style='color:#347DB5;' href='javascript:void(0);' onclick='javascript:gafToggleScroll(this);' >"+((unsafeWindow.gafScrollOn)?'on':'off')+"</a>");

if(unsafeWindow.gafShowSettings) {
  unsafeWindow.gafUpdateViews(); 
  $('#gafViewLinks a').live('click', function() {
      
      unsafeWindow.gafFilterState = $(this).attr('class').match(/vid(\d+)/)[1];
      if(unsafeWindow.gafFilterState >= 6 || unsafeWindow.gafFilterState < 0) unsafeWindow.gafFilterState = 0;
      
      unsafeWindow.gafUpdateViews();
      unsafeWindow.gafApplyFilter($('.post'));
      setTimeout(unsafeWindow.gafLoadingCheck, 1000);
      return false;
    }
  );
  
  $('.sub_navigation h1').append(' Search:<input type="text" name="gafSearch" /> <input type="button" name="gafSearchClear" value="Clear">');
  $('input[name=gafSearchClear]').click(function() { 
    $('input[name=gafSearch]').val(''); 
    unsafeWindow.gafApplyFilter($('.post')); });
  $('input[name=gafSearch]').keyup(function() { 
    clearTimeout(unsafeWindow.gafssssssss);
    unsafeWindow.gafssssssss = setTimeout("gafApplyFilter($('.post'));",400);
   });
}

// reverse order settings on page
if(unsafeWindow.gafShowReverse && unsafeWindow.gafShowESS) {
  $('.results:first').append(" and order <a style='color:#347DB5;' href='javascript:void(0);' onclick='javascript:gafToggleRev(this);' >"+((unsafeWindow.gafReverse)?'newest first':'oldest first')+"</a>");
}
else if(unsafeWindow.gafShowESS) {
  $('.results:first').append("<div id='gafSlider' style='margin-top:5px'></div>");
  $('#gafSlider').slider({
      min:0,max:25,animate:true,value: unsafeWindow.gafPadding,
      slide: function(event, ui) {
        $('.post,.row').css({padding:ui.value+'px 0'});
      },
      stop: function(event, ui) {
        unsafeWindow.gafPadding = ui.value;
        document.cookie = "gafPadding=" + ui.value + "; expires=Fri, 27 Jul 2030 02:47:11 UTC; path=/";
      }
      
  });
  
  $('.post,.row').css({padding: unsafeWindow.gafPadding +'px 0'});
}

if(unsafeWindow.gafScrollOn) {
  // endless scrolling elements and adjustments
  $('.numbers').remove()

  // turn off scrolling if there is only one page  
  if(unsafeWindow.gafMaxPage == 1) {
    unsafeWindow.gafScrollOn = false;
    $('.pagination:last').html("<div style='text-align: center;'><p>You've reached the end.</p></div>");
  }
  else {
    unsafeWindow.gafPutLoading();
  }
  
  $('body').append("<iframe id='gafWindow' style='display: none' src='about:blank' onload='javascript: gafPageLoaded();'></iframe>");
}


// reverse order
if(unsafeWindow.gafReverse) {
  $('.parent_container').reverse().appendTo('.comment_container');
}

// fix urls for discussions in the forum page for reverse order
if(unsafeWindow.gafRepReverse) {
  $('.row a').each(function(key,obj) {
      if($(obj).attr('href').match(/^\/forum/)) {
        var newURL = $(obj).attr('href') + "/page/31337";
        $(obj).attr('href',newURL);
      }
    });
}
  
  // replicate nagivation bar to use as float menu
  $('body').prepend('<style>#gafMenuWrapper .left {width:512px;float:left;}#gafMenuWrapper .left .logo{height:40px;width:154px;display:block;background-image: url(/img/logo_new.png);background-repeat: no-repeat;background-position:center center;}#gafMenuWrapper .left .search{float:right;width:338px;height:25px;margin-top:6px;background-color:#fff;-moz-border-radius:20px;border-radius:20px;background-color:#fff;}#gafMenuWrapper .left .search.disabled{background-color:transparent;border:1px solid #4c7b9b;}#gafMenuWrapper .left .search .input input{float:left;padding:0 10px;background-color:transparent;border:none;color:#5c7689;font-size:11px;outline:none;line-height:25px;height:25px;width:263px;}#gafMenuWrapper .left .search .icon{float:right;height:25px;background-image: url(/img/search_icon.png);background-repeat: no-repeat;background-position:right center;display:block;opacity:0.6;width:35px;}#gafMenuWrapper .left .search .icon.loading{background-image: url(/img/search_loading_tmp.gif);}#gafMenuWrapper .left ol{list-style-type:none;position:fixed;}#gafMenuWrapper .left ol>li{float:left;height:50px;}#gafMenuWrapper .left ol li a.arrow{background-image: url(/img/navigation_dropdown_arrow.png);background-repeat: no-repeat;background-position:right center;padding-right:37px;}#gafMenuWrapper .left ol li a.arrow:hover{background-image: url(/img/navigation_dropdown_arrow_hover.png);}#gafMenuWrapper .left ol li.open a.arrow{background-image: url(/img/navigation_dropdown_arrow_click.png);}#gafMenuWrapper .left ol li.open{background-color:#fff;border-radius:5px 5px 0 0;}#gafMenuWrapper .left ol li>a{font-weight:bold;padding:5px 15px;text-decoration:none;display:block;font-size:11px;color:#c3dbed;}#gafMenuWrapper .left ol li.open>a{padding-top:7px;}#gafMenuWrapper .left ol li a:hover{color:#d5dfe6;}#gafMenuWrapper .left ol li.selected a, #gafMenuWrapper .left ol li.selected a:hover{color:#fff;}#gafMenuWrapper .right {float:right;width: 400px;}#gafMenuWrapper .right .banner{width:468px;height:60px;}#gafMenuWrapper .left ol li.open a{color:#434343;}#gafMenuWrapper .left .relative-dropdown{float:left;position:relative;z-index:9999;}#gafMenuWrapper .left .absolute-dropdown{top:29px;position:absolute;width:150px;padding:5px;background-color:#fff;border-radius:0 5px 5px 5px;display:none;box-shadow:5px 5px 4px rgba(0, 0, 0, 0.1), 3px 3px 2px rgba(0, 0, 0, 0.1), 2px 2px 1px rgba(0, 0, 0, 0.1);}#gafMenuWrapper .left .absolute-dropdown ul{list-style-type:none;}#gafMenuWrapper .left .absolute-dropdown ul li a{display:block;padding:5px 10px;font-weight:bold;font-size:11px;color:#6d7c87;text-shadow:none;border:1px solid transparent;border-radius:4px;}#gafMenuWrapper .left .absolute-dropdown ul li a:hover{color:#ff2800;border:1px solid #ffdad3;}</style');
  $('.bg_gradient .content:first').prepend('<div id="nav" class="gafNav"><div style="margin:0 auto;width:1000px;" id="gafMenuWrapper"><div class="left"><div></div></div>');
  $('.gafNav').attr('style','display:none;overflow:hidden;box-shadow:0 0 8px #000000;z-index:55;background:#25303A url(http://www.steamgifts.com/img/background_clean.png) no-repeat;background-position: center -60px;position:fixed;left:0px;height:62px;width:100%;');
  $('.gafNav').css({padding:0});
  $('#gafMenuWrapper .left').append($('div#navigation').last().find('.logo,ol').clone());
  $('.gafNav ol').hide();
  $('.gafNav .search').remove();
  
  $("#gafMenuWrapper li a.arrow").unbind('click').click(function() {
					$(this).parent().siblings().removeClass('open');
					$(this).parent().siblings().children('.relative-dropdown').children('.absolute-dropdown').hide();
					$(this).parent().addClass('open');
					$(this).siblings('.relative-dropdown').children('.absolute-dropdown').show();
					return false;
				});
  $("#gafMenuWrapper .left ol>li").mouseleave(function() {
    $('#gafMenuWrapper .left ol li').removeClass('open');
    $('#gafMenuWrapper .left ol li .absolute-dropdown').hide();  // Le4IM
    }); 
  //$('#gafMenuWrapper').append("<div class='right' style='text-align:center;padding-top:6px'><a href='http://steamcommunity.com/groups/SGFund'><img src='http://i.imgur.com/QSXEz.png' /></a></div>")
    
  $(window).bind('scroll', function() {
      if(unsafeWindow.gafScrollOn) { unsafeWindow.gafLoadingCheck(); }
  		
  		if(!unsafeWindow.gafFloatMenuOn && window.pageYOffset > 150) {
  		  unsafeWindow.gafFloatMenuOn = true;
  		  $('.gafNav').slideDown(function() {
          $('.gafNav ol').show();
          });
      }
      else if(unsafeWindow.gafFloatMenuOn && window.pageYOffset < 150) {
        $('.gafNav ol').hide();
  		  $('.gafNav').slideUp();
  		  unsafeWindow.gafFloatMenuOn = false;
      }
  });
  
  if(!unsafeWindow.gafFloatMenuOn && window.pageYOffset > 150) {
  		  unsafeWindow.gafFloatMenuOn = true;
  		  $('.gafNav').stop(true,true).slideDown('slow',function() {
            $('.gafNav ol').show();
          });
  }
  // check if fetured is hidden
  if(unsafeWindow.gafFeaturedHidden) $('.featured').slideUp();
  
  // if first page is empty, start loading next page
  unsafeWindow.gafLoadingCheck();
})(jQuery)
