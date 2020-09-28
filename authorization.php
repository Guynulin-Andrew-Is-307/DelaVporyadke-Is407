<?php

$errors_keys = [];
$errors = [];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
         $errors['email'] = 'Email должен быть корректным';
        }

    if (count($errors)) {
        $errors_keys = array_keys($errors);
    }else{

        // header("Location: /");

    }
}

$page_content = include_template('form_authorization.php',
[	'errors_keys' => $errors_keys,
	'errors' => $errors
]);

