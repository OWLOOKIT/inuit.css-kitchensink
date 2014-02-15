/* jshint jquery:true */
/* Author: Dave Rupert
 * *  License: WTFPL
 * ----------------------*/

(function($){
	'use strict';

	$.fn.dataCodeBlock = function(options){

		var defaults = {
			processHTML: null,
			postProcessHTML: null,
			postAppendCode: null,
		};

		var config = $.extend(defaults, options);

		// Yoinked from Prototype.js
		var escapeHTML = function( code ) {
			return code.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
		};
		return $('[data-codeblock]').each(function(){
			var target = $(this).data('codeblock');
			var html = $(this).clone().removeAttr('data-codeblock')[0].outerHTML;
			if(config.processHTML) {
				html = config.processHTML(html);
			}
			var codeblock = $('<pre><code>');
			codeblock.find('code').append( escapeHTML(html) );
			if(target) {
				$(target).append(codeblock);
			} else {
				$(this).after(codeblock);
			}
			if(config.postAppendCode) {
				config.postAppendCode.call(target, html);
			}
		});
	};
	// Self Execute!!
	$.fn.dataCodeBlock({
		processHTML: function(html){
			return html.replace(/(\w)+-demo(\s)?/g, '');
		},
		postAppendCode: function(html){
			var $thisCodeBlock = $(this);
			var btn =
				'<button class="btn btn-demo js-copy btn--small btn--hard codeblock__btn">' +
					'<span class="codeblock__text js-copy__text">Copy</span>' +
				'</button>';
			$thisCodeBlock.append(btn);
			$thisCodeBlock.find('.js-copy').attr('data-clipboard-text', html);
		}
	});

	var client = new ZeroClipboard( $('.js-copy'), {
		  moviePath: '/js/zeroclipboard/ZeroClipboard.swf'
	} );

	client.on('complete', function(){

		var $thisCopyButton = $(this);

		$thisCopyButton.find('.js-copy__text')
			.text('Copied!')
			.addClass('is-active');

		setTimeout(function(){
			$thisCopyButton.find('.js-copy__text')
				.text('Copy')
				.removeClass('is-active');
		}, 500);
	});

})(jQuery);

