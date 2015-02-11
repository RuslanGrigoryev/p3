$(function() {

	$('#getNews').on('click', function(e) {
		e.preventDefault();

		$.ajax({
		  url: "../adm/ajax/ajax.html",
		  type: "json"
		}).done(function(data) {

			console.log(data);
			var data2 = JSON.parse(data)
			console.log(data2);
			$('.b-news').html(data2.header);
			$('.messages').html(data2.body)

		});

	});

});