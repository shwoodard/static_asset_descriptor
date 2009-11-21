(function ($) {
    $.extend(jQuery, {
        _ajax: jQuery.ajax,
        
        ajax : function(options, evtSourceElem) {
            options = options || {};
            var originalOptions = $.extend({}, options);
            var sourceElemHtml, loading, evtSourceElemClone;
            
            if (evtSourceElem) {
                evtSourceElemClone = $(evtSourceElem).clone();
                loading = $('<img src="/images/ajax-loader.gif" alt="loading" />');
                evtSourceElem.replaceWith(loading);
            }
            
            this._ajax($.extend(options, {
                success: function (resp) {
                    if (evtSourceElem) {
                        $(loading).replaceWith(evtSourceElemClone);
                    }
                    
                    if (typeof resp === 'object' && resp.redirect_to && !resp.form_dom) {
                        if (resp.redirect_to === -1) {
                            window.location.href = window.location.href;
                        } else {
                            window.location.href = resp.redirect_to;
                        }
                    }

                    if (originalOptions.success) {
                        originalOptions.success.call(resp, resp);
                    }
                }
            }));
        }
    });
    
    $(document).ready(function () {
        $('.delete, .put').live('click', function (evt) {
			evt.preventDefault();

			var isPut = $(this).hasClass('put');
			var expectJson = $(this).hasClass('expect_json');
			var doConfirm = $(this).hasClass('confirm');
			var el = $(this);
			
			if (doConfirm && !confirm('Are your sure?')) {
			    return;
			}
			
			var options = {
				type: isPut ? 'post' : 'delete',
				url: el.attr('href'),
				success: function (resp) {
					el.trigger( (isPut ? 'put' : 'delete') + 'complete', resp);
				}
			};
			if (isPut) {
				options.data = {
					authenticity_token: $(this).attr('rel'),
					_method: 'put'
				};
			}
			
			if (expectJson) {
			    options.dataType = 'json';
			}
			
			$.ajax(options, el);
		});
		
		$('a.dialog').live('click', function (evt) {
		    evt.preventDefault();
		    var self = $(this);
				var title = self.attr('rel');
		    $.ajax({
		        url: self.attr('href'),
		        success: function (resp) {
		            var dialogDom = $(resp);
		            
		            dialogDom.dialog({
		                width: 'auto',
						title: title || '',
		                modal: true,
		                open: function () {
		                    self.trigger('dialog.open');
		                    dialogDom.find('.close_win').click(function (evt) {
		                        evt.preventDefault();
		                        self.trigger('dialog.close');
		                        dialogDom.dialog('close');
		                    });
		                    
		                    var form = dialogDom[0].tagName === 'FORM' ? dialogDom : dialogDom.find('form');
		                    
		                    if (form) {
    		                    form.bind('form.submitsuccess', function(evt, resp) {
    		                        self.trigger('dialog.form.submitsuccess', resp);
    		                        self.trigger('dialog.close');
    		                        dialogDom.dialog('close');
    		                    });
                                form.form();
                            }
    		            }
		            });
		        },
		        dataType: 'html'
		    });
		});
		
        // $.Jookie.Initialise("tz_offset", -1);
        // $.Jookie.Set("tz_offset", "tz_offset", (new Date()).getTimezoneOffset());
    });
})(jQuery);
