<?php
require_once("connection.php");

if(!$con){
	print("Error connected: " . mysqli_connect_error());
}else{
	require_once("db.php");
	require_once("helpers.php");

	$user_id = intval(1);
	$projectz = get_project($con, $user_id);

	if (isset($_GET['addTask'])) {

	    require_once ('add.php');
		$title = 'Добавление задачи - Дела в порядке';

	}else{
        require_once("smain.php");

		$title = 'Дела в порядке';
	}

	$layout_content = include_template('layout.php', [
		'content' => $page_content,
		'title' => $title
	]);

	print($layout_content);
}

