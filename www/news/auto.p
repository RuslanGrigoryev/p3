@calendar[] 
$calendar_locale[ 
   $.month_names[ 
         $.1[Январь] 
         $.2[Февраль] 
         $.3[Март] 
         $.4[Апрель] 
         $.5[Май] 
         $.6[Июнь] 
         $.7[Июль] 
         $.8[Август] 
         $.9[Сентябрь] 
         $.10[Октябрь] 
         $.11[Ноябрь] 
         $.12[Декабрь] 
   ] 
   $.day_names[ 
         $.0[пн] 
         $.1[вт] 
         $.2[ср] 
         $.3[чт] 
         $.4[пт] 
         $.5[сб] 
         $.6[вс] 
   ] 
   $.day_colors[ 
         $.0[#000000] 
         $.1[#000000] 
         $.2[#000000] 
         $.3[#000000] 
         $.4[#000000] 
         $.5[#800000] 
         $.6[#800000] 
   ] 
] 
$now[^date::now[]] 
$days[^date:calendar[rus]($now.year;$now.month)] 
<center> 
<table bgcolor="#000000" cellspacing="1"> 
   <tr> 
      <td bgcolor="#FFFFFF" colspan="7" align="center"> 
         <b>$calendar_locale.month_names.[$now.month]</b> 
      </td> 
   </tr> 
   <tr> 
      ^for[week_day](0;6){ 
         <td width="14%" align="center" bgcolor="#A2D0F2"> 
            <font color="$calendar_locale.day_colors.$week_day"> 
               $calendar_locale.day_names.$week_day 
            </font> 
         </td> 
      } 
   </tr> 
^days.menu{ 
   <tr> 
      ^for[week_day](0;6){ 
         ^if($days.$week_day){ 
            ^if($days.$week_day==$now.day){ 
            <td align="center" bgcolor="#FFFF00"> 
               <font color="$calendar_locale.day_colors.$week_day"> 
               <b>$days.$week_day</b> 
               </font> 
            </td> 
            }{          
            <td align="center" bgcolor="#FFFFFF"> 
               <font color="$calendar_locale.day_colors.$week_day"> 
               $days.$week_day 
               </font> 
            </td> 
            } 
         }{ 
            <td bgcolor="#DFDFDF">&nbsp</td>    
         } 
      } 
   </tr> 
} 
</table> 
</center> 