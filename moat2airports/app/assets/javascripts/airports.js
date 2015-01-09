# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
//$(document).ready(function(){

var engine = new Bloodhound({
  name: 'typeaheads',
  remote: {"url":"/airports/autocomplete?q=%QUERY"},
  datumTokenizer: function(d) {
    return Bloodhound.tokenizers.whitespace(d);
  },
  queryTokenizer: Bloodhound.tokenizers.whitespace
});
engine.initialize();

$('.typeahead').typeahead(
    {
        highlight: true, 
    },
    {
        source: engine.ttAdapter()
    }
);

//});
