<?php
    include_once 'header.php';
    include_once 'database.php';

    $item_id=(int) $_GET['id'];

    $sql = "SELECT * FROM hifi_zvocniki WHERE id = '$item_id'";
    $result = mysqli_query($link, $sql);

    while($row = mysqli_fetch_array($result))
    {
        $ime = $row['ime'];
        $opis = $row['opis'];
    }

?>


<h1>Edit meme!</h1>
<form action="item_save.php?id=<?php echo "$item_id"; ?>" method="post" enctype="multipart/form-data">
    <label>Name</label>
    <input type="text" name="ime" value = <?php echo $ime; ?> />
    <br>
    <label>Spice</label>
    <textarea name="comment" rows="10" cols="30"><?php echo $opis; ?></textarea>
    <br>
    <br>
<input type="submit" value="Uredi" />
</form>


<?php
    include_once 'footer.php';
?>