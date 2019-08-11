$(function(){
  $('#open_menu').('click',function(){
    $('#menu').addclass('shown')
  });

  $('.post_article').on('click',function(){
    window.location.href = "/articles/#{article.id}";
  });
});;