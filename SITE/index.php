<html>
     <head>
</head>
    <body>
    <button>Вход</button>
    <button>Новая заметка</button>
    <button>Отправить сообщение</button>
    <button>Добавить фото</button>
    <a href="ifform.php" ><button>Статистика</button></a>
    <button>Администрация</button>
    <button>Выход</button> 
    <br>
    <?php require_once("MySiteDB.php"); ?>
    
    <?php
$query = "SELECT * FROM notes";
$select_note = mysqli_query($link, $query);
while ($note = mysqli_fetch_array($select_note)){

    echo $note['id'], "<br>";
    ?>

    <a href="comments.php?note=<?php echo $note['author_id']; ?>">
    <?php echo $note ['title'], "<br>";?></a>
    
    <?php
     echo $note ['created'], "<br>";
    echo $note ['article'], "<br>";
    }
?>

    <p>
        <b> 
                <i>
                    Рад приветствовать вас<br>
                    на  страницах моего сайта, посвященного путешествия.
                </i>    
        </b>
    </p>









</body>    
</html>    