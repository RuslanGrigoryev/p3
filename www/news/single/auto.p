@singleNews[]
^connect[$connect_string]{ 
	$q[select]

	$q[$q id, date, header, prebody, body, photo]

   $news[^table::sql{
   $q
   from 
      news  
   where 
      id = ^form:id.int(0)
   }]
   ^if($news){ 
      ^news.menu{ 
         <h3>$news.header</h3>
         <em class="date">$news.date</em>
         <img src="$news.photo" alt="Photo" width="100" height="100" />
         <p class="prebody">
         ^untaint{$news.prebody}
         </p>
         <p class="body">
         ^untaint{$news.body}
         </p>
      }[<br />] 
   }{ 
      <strong>Новостей не найдено.</strong>
   } 
}