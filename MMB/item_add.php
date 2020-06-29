<?php
    include_once 'header.php';
    include_once 'database.php';
?>
<h1>MAKE YOU MEME!</h1>
<form action="item_insert.php" method="post" enctype="multipart/form-data">
    <label>Name</label>
    <input type="text" name="ime" />
    <br>
    <label>Juice info</label>
    <textarea name="comment" rows="10" cols="30"></textarea>
    <br>
    <label>Picture</label>
    <input type="file" class="form-control" name="fileToUpload" id="fileToUpload">
    <br>
    <br>
<input type="submit" value="Post" />
</form>


<?php
    include_once 'footer.php';
?>