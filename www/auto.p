@auto[] 
#source/client charsets 
$request:charset[UTF-8] 
$response:charset[UTF-8] 
$response:content-type[ 
   $.value[text/html] 
   $.charset[$response:charset] 
] 
$connect_string[mysql://root@localhost/p3test] 

##############################################
##############################################

@page[] 
^header[] 
^body[] 
^footer[]

##############################################
##############################################

@header[] 
<!DOCTYPE html>
<html> 
<head> 
<title>Тестовый сайт Parser3</title> 
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/style.css">
</head> 
<body bgcolor="#FAEBD7"> 
<table class="table table-bordered table-hover" width="100%" border="0" bgcolor="#000000" cellspacing="1"> 
   <tr  bgcolor="#FFFFFF" height="60"> 
      <td align="center"> 
         <font size="+2"> <b>^greeting[]</b></font> 
      </td> 
   </tr> 
</table> 
<br /> 

##############################################
##############################################

@navigation[]
$sections[^table::load[/sections.cfg]]
<table width="100%" border="1"> 
   <tr  bgcolor="#CFCFCF"> 
   ^sections.menu{ 
      ^navigation_cell[]  
   } 
   </tr> 
</table>

##############################################
##############################################

@navigation_cell[] 
$cell_width[^eval(100\$sections)%]
^if($sections.uri eq $request:uri){
	<td width="$cell_width" align="center" bgcolor="#A2D0F2">  
	   <nobr>$sections.name</nobr> 
	</td> 
}{
	<td width="$cell_width" align="center">  
	   <a href="$sections.uri"><nobr>$sections.name</nobr></a> 
	</td> 
}

##############################################
##############################################

@footer[] 
<table width="100%" border="0" bgcolor="#000000" cellspacing="0"> 
   <tr> 
      <td></td> 
   </tr> 
</table> 
$now[^date::now[]] 
<font size="-3"> 
<center>Powered by Parser3<br />1997-$now.year</center> 
</font>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script> 
<script src="/js/script.js"></script>
</body> 
</html>

##############################################
##############################################

@body[] 
^navigation[] 
<table width="100%" height="65%" border="0" bgcolor="#000000" cellspacing="1"> 
   <tr  bgcolor="#ffffff" height="100%"> 
      <td width="25%" valign="top" bgcolor="#EFEFEF"> 
         ^sidebarLeft[]
      </td> 
      <td width="50%" valign="top"> 
         ^body_main[] 
      </td> 
      <td width="25%" valign="top" class="sidebar">
         ^sidebarRight[]
      </td>
   </tr> 
</table> 
<br /> 

##############################################
##############################################

@greeting[] 
Добро пожаловать! 

##############################################
##############################################

@sidebarLeft[]
^connect[$connect_string]{ 
   $news[^table::sql{select 
      id,
      date,
      header,
      prebody,
      position,
      photo   
   from 
      news  
   where 
      position = 'left' 
   }] 
   ^if($news){ 
      ^news.menu{ 
         <h3><a href="/news/single/?id=$news.id">$news.header</a></h3>
         <em class="date">$news.date</em>
         <p class="alignC">
         <img src="$news.photo" alt="Photo"  width="100" height="100"/></p>
         <p class="prebody">
         ^untaint{$news.prebody}
         </p>
      }[<br />] 
   }{ 
      <strong>Новостей не найдено.</strong>
   } 
} 

##############################################
##############################################

@body_main[] 
Основное содержание 

##############################################
##############################################

@sidebarRight[]
^connect[$connect_string]{ 
   $news[^table::sql{select 
      id,
      date,
      header,
      prebody,
      position,
      photo 
   from 
      news  
   where 
      position = 'right' 
   }] 
   ^if($news){ 
      ^news.menu{ 
         <h3><a href="/news/single/?id=$news.id">$news.header</a></h3>
         <em class="date">$news.date</em>
         <img src="$news.photo" alt="Photo" width="100" height="100" />
         <p class="prebody">
         ^untaint{$news.prebody}
         </p>
      }[<br />] 
   }{ 
      <strong>Новостей не найдено.</strong>
   } 
}