@CLASS
gArticle

@loadsidebarLeft[]
^MAIN:dbconnect{ 
   $messages[^table::sql{select id, date, header, prebody, position, photo from news where position = "left"}] 
}