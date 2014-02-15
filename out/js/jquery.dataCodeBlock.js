/* jshint jquery:true */
/* Author: Dave Rupert
 * *  License: WTFPL
 * ----------------------*/

(function($){
	'use strict';

	$.fn.dataCodeBlock = function(options){

		var defaults = {
			processHTML: null
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
		});
	};
	// Self Execute!!
	$.fn.dataCodeBlock({
		processHTML: function(html){
			return html.replace(/btn-demo(\s)?/, '');
		}
	});
})(jQuery);
