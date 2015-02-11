@newsList[]
<h2>Полный список новостей</h2>

@allNews[]
^connect[$connect_string]{ 
   $news[^table::sql{select 
      id,
      date,
      header
   from 
      news
   }] 
   ^if($news){ 
      ^news.menu{ 
         <h3><a href="/news/single/?id=$news.id">$news.header</a></h3>
         <em class="date">$news.date</em>
      }[<br />] 
   }{ 
      <strong>Новостей не найдено.</strong>
   } 
}
