<?php

$show_complete_tasks = 0; //Показ выполненных здч
$errors = [];
if (isset($_GET['show_completed'])) {
    $show_complete_tasks = intval($_GET['show_completed']);
}

if (isset($_GET['project'])) {
    $prjnm = esc($_GET['project']);
    $idprj = get_id_from_project($con, $user_id, $prjnm);

    if($idprj!==null){
        $taskz = get_tasks_from_id($con, $user_id, $idprj);
        if(count($taskz) === 0){$errors['Список задач пуст'] = 'добавьте свою первую задачу!';};
    }else{
        http_response_code(404);
        $errors['Ошибка 404'] = 'Проект не найден';
        $taskz = [];
    }
}else{
    $taskz = get_tasks($con, $user_id);
    if(count($taskz) === 0){$errors['Список задач пуст'] = 'добавьте свою первую задачу!';};
}



$page_content = include_template('main.php',
[

    'user_id' => $user_id,
    'projectz' => $projectz,
    'taskz' => $taskz,
    'errors' => $errors,
    'show_complete_tasks' => $show_complete_tasks
]);


