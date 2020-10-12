<?php

$show_complete_tasks = 0; //Показ выполненных здч
$show_completed = '';
$currentproject = '';

$currentparam = isset($_GET['ParamSelect'])? esc($_GET['ParamSelect']) : 'AllTask' ;
$errors = [];
if (isset($_GET['show_completed'])) {
    $show_complete_tasks = intval($_GET['show_completed']);
    $show_completed = 'show_completed='.$show_complete_tasks.'&';   
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if(isset($_POST['SearchByTasks'])){
        $taskz = get_tasks_from_search($con, $user_id, $_POST['SearchByTasks']);
    }
}elseif (isset($_GET['project'])) {
    $currentproject = esc($_GET['project']);
    $idprj = get_id_from_project($con, $user_id, $currentproject);

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

$urlnavigationOfParam = "/index.php?".(isset($_GET['project']) ? 'project='.$currentproject."&" : '').$show_completed."ParamSelect=" ;
$urlnavigationOfProject = "/index.php?".(isset($_GET['ParamSelect']) ? 'ParamSelect='.$currentparam."&" : '').$show_completed.'project=';

$page_content = include_template('main.php',
[
    'user_id' => $user_id,
    'projectz' => $projectz,
    'taskz' => $taskz,
    'errors' => $errors,
    'show_complete_tasks' => $show_complete_tasks,
    'urlnavigationOfParam' => $urlnavigationOfParam,
    'urlnavigationOfProject' => $urlnavigationOfProject,
    'currentproject' => $currentproject,
    'currentparam' => $currentparam
]);


