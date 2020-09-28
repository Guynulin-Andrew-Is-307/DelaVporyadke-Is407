<?php
require_once("connection.php");

if(!$con){
	print("Error connected: " . mysqli_connect_error());
}else{


	require_once("db.php");
	require_once("helpers.php");

	// session_start();
	// // ini_set('session.cookie_lifetime', 86400);
	// // ini_set('session.gc_maxlifetime', 86400);

	// if (isset($_SESSION['username'])) {
	//  // print($_SESSION['username']);
	// }
	// $_SESSION['username'] = "Вася";

	// // 	strtotime($date)

	// 	$name = "visitcount";
	// $value = 1;
	// $expire = strtotime(time()); //"Mon, 25-Jan-2027 10:00:00 GMT";
	// $path = "/";
	// setcookie($name, $value, $expire, $path);

	// // 	Set-Cookie: gifs_fav=14,34,52,98; expires="Mon, 25-Jan-2027 10:03:02 GMT"; path=/;

	// 	if (isset($_COOKIE['visitcount'])) {
	//  		// print($_COOKIE['visitcount']);
	// 	}

	// // if (isset($_COOKIE['visit_count'])) {
	// //  unset($_COOKIE['visit_count']);
	// //  setcookie($name, '', time() - 3600, '/');
	// // }


	$user_id = null;

	$title = 'Дела в порядке';
	$bodybackground = '';
	if(isset($user_id)){
		$projectz = get_project($con, $user_id);
		if (isset($_GET['addTask'])) {
		    require_once ('add.php');
			$title = 'Добавление задачи - Дела в порядке';
		}else{
	        require_once("smain.php");
		}

		$header_side = include_template('header_side.php', [
			'user_name' => get_username($con, $user_id)
		]);
		$footer_button = include_template('footer_button.php');
		
	}else{
		$header_side = include_template('unk_header_side.php');
		$footer_button = '';
		if (isset($_GET['Authorization'])) {
		    require_once ('authorization.php');
			$title = 'Авторизация - Дела в порядке';
		}elseif (isset($_GET['Register'])){
	        require_once("register.php");
	        $title = 'Регистрация - Дела в порядке';
		}else {
			$page_content = include_template('guest.php');
			$bodybackground = 'class="body-background"';
		}
	};


	$layout_content = include_template('layout.php', [
		'content' => $page_content,
		'title' => $title,

		'header_side' => $header_side,
		'footer_button' => $footer_button,
		'bodybackground' => $bodybackground
	]);
	print($layout_content);
}

