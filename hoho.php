<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "university";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
$rows_per_page=5;
$query;
$page=htmlspecialchars($_POST['page']);
$start=($page-1)*$rows_per_page;

if($_POST["substr"]!='' )
{  $substr=$_POST["substr"];
    $substr=str_replace(' ','',$substr);
    $query1="SELECT course_name,course_description,department_name,professor_name 
    from Course C,Professor P,Department D 
    where D.department_id=C.department_id 
    AND C.professor_id=P.professor_id
    AND C.professor_id=P.professor_id
AND (UPPER(REPLACE(course_name,' ','')) like UPPER('%$substr%')
OR UPPER(REPLACE(course_description,' ','')) like UPPER('%$substr%')
OR UPPER(REPLACE(department_name,' ','')) like UPPER('%$substr%')
OR UPPER(REPLACE(professor_name,' ','')) like UPPER('%$substr%')) ";
    $result1=mysqli_query($conn,$query1);
    $Number_of_rows=mysqli_num_rows($result1);
    $query="SELECT course_name,course_description,department_name,professor_name 
from Course C,Professor P,Department D 
where D.department_id=C.department_id 
AND C.professor_id=P.professor_id
AND (UPPER(REPLACE(course_name,' ','')) like UPPER('%$substr%')
OR UPPER(REPLACE(course_description,' ','')) like UPPER('%$substr%')
OR UPPER(REPLACE(department_name,' ','')) like UPPER('%$substr%')
OR UPPER(REPLACE(professor_name,' ','')) like UPPER('%$substr%'))
  ORDER By course_id LIMIT $start,5 ";

}
else
{$query1="SELECT * FROM Course ";
    $result1=mysqli_query($conn,$query1);
    $Number_of_rows=mysqli_num_rows($result1);
    $query="SELECT course_name,course_description,department_name,professor_name from Course C,Professor P,Department D where D.department_id=C.department_id AND C.professor_id=P.professor_id  ORDER By course_id LIMIT $start,5 ";
}

$result=mysqli_query($conn,$query);
$output='';
$output.='
<table class="pure-table-odd">
<tr>

<td>Course_name</td>
<td>Course_Description</td>
<td>Department_Name</td>
<td>Professor_Named</td>
</tr>
<br/>';

 while($row=mysqli_fetch_array($result))
 {  
     $output.='
     <tr>
    
     <td>'.$row["course_name"].'</td>
     <td>'.$row["course_description"].'</td>
     <td>'.$row["department_name"].'</td>
     <td>'.$row["professor_name"].'</td>
     </tr>
     </br>
     ';
     
 }
 $output.='</table>';
 $output .= '

<div align="center">
  
';

$total_links = ceil($Number_of_rows/$rows_per_page);
$previous_link = '';
$next_link = '';
$page_link = '';


if($total_links>0)
{
    if($total_links > 4)
    {
      if($page < 5)
      {
        for($count = 1; $count <= 5; $count++)
        {
          $page_array[] = $count;
        }
        $page_array[] = '...';
        $page_array[] = $total_links;
      }
      else
      {
        $end_limit = $total_links - 5;
        if($page > $end_limit)
        {if($end_limit>1){
          $page_array[] = 1;
          $page_array[] = '...';}
          for($count = $end_limit; $count <= $total_links; $count++)
          {
            $page_array[] = $count;
          }
        }
        else
        {
          $page_array[] = 1;
          $page_array[] = '...';
          for($count = $page - 1; $count <= $page + 1; $count++)
          {
            $page_array[] = $count;
          }
          $page_array[] = '...';
          $page_array[] = $total_links;
        }
      }
    }
    else
    {
      for($count = 1; $count <= $total_links; $count++)
      {
        $page_array[] = $count;
      }
    }
    
    for($count = 0; $count < count($page_array); $count++)
    {
      if($page== $page_array[$count])
      {
        $page_link .= '
      
          <a class="page-link" href="javascript:void(0)" id="'.$page_array[$count].'"  onclick="getPage(this.id)">Current</a>
     
        ';
    
        $previous_id = $page_array[$count] - 1;
        if($previous_id > 0)
        {
          $previous_link = '<a class="page-link" href="javascript:void(0)" id="'.$previous_id.'"  onclick="getPage(this.id)">Previous</a>';
        }
        $next_id = $page_array[$count] + 1;
        if($next_id <=$total_links)
        {
        
          $next_link = '<a class="page-link" href="javascript:void(0)" id="'.$next_id.'"onclick="getPage(this.id)">Next</a>';
        }
    }
      
      else
      {
        if($page_array[$count] == '...')
        {
          $page_link .= '
         
              <a class="page-link" >...</a>
         
          ';
        }
        else
        {
          $page_link .= '
          <a class="page-link" href="javascript:void(0)" id="'.$page_array[$count].'">'.$page_array[$count].'</a>
          ';
        }
      }
    }
    
    $output .= $previous_link . $page_link . $next_link;
    $output .= '


</div>
';
}
else{
$output='';
    $output.='<h2>No Result</h2>';
}


echo $output;

?>