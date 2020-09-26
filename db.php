<?php

//Получение проекта
function get_project($con, $user_id) {
    $sql = "SELECT ID, Name, Author, (SELECT COUNT(*) FROM `task` WHERE `Project` = `project`.ID) AS `Quantity`  FROM `project` WHERE `Author` = ?";
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, 'i', intval($user_id));
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    $projectz  = mysqli_fetch_all($res, MYSQLI_ASSOC);
    return $projectz;
}

//Получение задач
function get_tasks($con, $user_id) {
    $sql = "SELECT * FROM `task` WHERE `Author` = ? ORDER BY ID DESC";
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, 'i', intval($user_id));
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    $taskz = mysqli_fetch_all($res, MYSQLI_ASSOC);
    return $taskz;
}

//Получение id проекта по его названию
function get_id_from_project($con, $user_id, $prjnm) {
    $sql = "SELECT ID FROM `project` WHERE `Author` = ? AND `Name` = ?";
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, 'is', intval($user_id), strval($prjnm));
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    $idprj = mysqli_fetch_assoc($res);
    return $idprj['ID'] ?? null;

}

//Получение задач по id проекта
function get_tasks_from_id($con, $user_id, $idprj) {
    $sql =  "SELECT * FROM `task` WHERE `Author` = ? AND `Project` = ? ORDER BY ID DESC";
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, 'ii', intval($user_id), intval($idprj));
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    $taskz = mysqli_fetch_all($res, MYSQLI_ASSOC);
    return $taskz;
}

//Проверка реальности ид проекта
function get_try_project_from_id($con, $user_id, $idprj) {
    $sql = "SELECT EXISTS(SELECT * FROM `project` WHERE `Author` = ? AND `ID` = ?) AS `EXIST`";
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, 'ii', intval($user_id), intval($idprj));
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    $idprj = mysqli_fetch_assoc($res);
    return $idprj['EXIST'] !== 0 ? true : false;
}

//add задач
function addTask($con, $name, $file = null, $date_c = null, $user_id, $proj) {
    $sql = "INSERT INTO `task` ( `Completed`, `Name`, `File`, `DateOfCompletion`, `Author`, `Project`) VALUES ( 0, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, 'sssii', $name, $file, $date_c, $user_id, $proj);
    mysqli_stmt_execute($stmt);
}



