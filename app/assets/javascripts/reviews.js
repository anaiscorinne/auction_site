$(document).on("page:change", function() {
  console.log("hey")
	$(".js-review-button").on("click", showReview)
})
 function showReview(event) {
 	event.preventDefault();
 	userId = $(event.currentTarget).data("user-id")
 	productId = $(event.currentTarget).data("product-id")
 	reviewId = $(this).data("review-id")
 	title = $("#review_title").val()
 	description = $("#review_description").val()
 	currentUserId = $(this).data("current-user-id")
 	$.ajax({
 		url: `/users/${userId}/products/${productId}/reviews`,
 		type: "POST",
 		data: {review: {title:title, description:description}}, 
 		success: function(response) {
 			console.log(response)
 			var html
 			if (Number(currentUserId) === Number(userId)) {
 				html = `
				<li class="animated shake"><h5>${title}</h5>
				<p>${description}</p>
				<a href="#">edit my review</a>
				</li>
				<hr>
 			`}
 			else {
 				console.log(currentUserId)
 				console.log(userId)

 				html = `
				<li class="animated shake"><h5>${title}</h5>
				<p>${description}</p></li>
				<hr>
 			`}
 			
 			$('.js-product-comments').append(html)
 			$('#review_title').val("")
 			$('#review_description').val("")

 		},
 		error: function(errormsg) {
 			console.log(errormsg);
 			alert("The comment could not be posted!");
 		}
 	})
 }