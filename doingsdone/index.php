<?php

$user_id = intval(1);
// показывать или нет выполненные задачи
$show_complete_tasks = rand(0, 1);

$con = mysqli_connect("localhost", "root", "", "schema");
if(!$con){
	print("Error connected: " . mysqli_connect_error());
}else{

mysqli_set_charset($con, "utf8");

$sql = "SELECT * FROM `проект` WHERE `Автор` = ".$user_id;
$result = mysqli_query($con, $sql);
$projectz = mysqli_fetch_all($result, MYSQLI_ASSOC);


$sql = "SELECT * FROM `задача` WHERE `Автор` = ".$user_id;
$result = mysqli_query($con, $sql);
$taskz = mysqli_fetch_all($result, MYSQLI_ASSOC);


//ВАЖНО:  ФИЛЬТРАЦИИ добавлена В ШАБЛОНАХ, а также уровне бизнес плана, так как написано добавить только измененые файлы, то было добавлено, чтобы проверить!
function esc($str) {
	$text = htmlspecialchars($str);
	return $text;
}


//Подсчет задач
function ret_cout_t($mas, $prj){
	$cp = 0;
	foreach ($mas as $key => $ts){
	 if($ts['Категория'] === $prj){$cp++;};
	};
	return $cp;
};

require_once("helpers.php");

$page_content = include_template('main.php', ['projectz' => $projectz,'taskz' => $taskz, 'show_complete_tasks' => $show_complete_tasks]);

$layout_content = include_template('layout.php', [
'content' => $page_content,
'title' => 'Дела в порядке'
]);
print($layout_content);
}


?>