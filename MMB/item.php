<?php
    include_once 'header.php';
    include_once 'database.php';

    $item_id=(int) $_GET['id'];

    if($_SESSION == NULL)
{
        $_SESSION['user_id'] = 5;
        $_SESSION['tip'] = 0;
        $_SESSION['first_name'] = 'Anonymous';
}

    $user_id = $_SESSION['user_id'];
?>

<?php

$query221 = "SELECT * FROM hifi_zvocniki hf WHERE (id = $item_id)AND(uporabnik_id = $user_id)AND(uporabnik_id != 5)";
$result221 = mysqli_query($link, $query221);

    if (mysqli_num_rows($result221)!=0)
    {

        ?>
        <div align="middle">
            <a class="button" href="item_edit.php?id=<?php echo "$item_id"; ?>">EDIT</a>
        </div>
        <br>
        <div align="middle">
            <a class="button" href="item_del.php?id=<?php echo "$item_id"; ?>" onclick="return confirm('U, SURE?');">DELETE</a>
        </div>
        <br>
        <br>

        <?php
    }




?>

<?php

    $query1 = "SELECT * FROM hifi_zvocniki hf WHERE id = $item_id";
    $result1 = mysqli_query($link, $query1);

	$query = "SELECT * FROM hifi_zvocniki hf INNER JOIN uporabniki u ON u.id = hf.uporabnik_id WHERE hf.id = $item_id AND u.id = hf.uporabnik_id";
    $result = mysqli_query($link, $query);
		
		//Tole je bi "moralo" delati, prejšna koda bi tudi morala.
        echo '<h1>';
		while($row = mysqli_fetch_array($result1))
		{
        echo $row['ime'];
		}
        echo '</h1>';
        echo 'Posted by: ';
		
        while($row2 = mysqli_fetch_array($result1))
		{
        echo $row2['u.ime'];
		}
?>
<br>
<?php

    $query = "SELECT hf.id, hf.opis, hf.ime, hf.slika FROM hifi_zvocniki hf WHERE hf.id = $item_id";
    $result = mysqli_query($link, $query);

    while($row = mysqli_fetch_array($result))
    {
        echo '<img src=';
        echo $row['slika'];
        echo " max-width='0' alt='No image...'>";
        echo '<br>';
        echo $row['opis'];

        echo '<br>';
        echo '<br>';
    }
?>

<br>
    <h2>Comments</h2>
<br>
<?php

    $query = "SELECT * FROM ocene o INNER JOIN hifi_zvocniki hf ON o.hifi_zvocniki_id=hf.id WHERE hf.id = $item_id";
    $result = mysqli_query($link, $query);

    while($row = mysqli_fetch_array($result))
    {
        echo '<br>';
        echo "<div style='border: thin solid black'>";
        echo "User ID: ";
        echo $row['uporabnik_id'];
        echo '<br>';
        echo "Comment: ";
        echo $row['prednosti'];
        echo '</div>';
    }
?>


<?php


 
        ?>
        <br>
            <form action="ocena_insert.php" method="post">
                <label>Comment</label>
                <?php
                echo "<input type='hidden' name='id' value= $item_id>";
                ?>
                <textarea name="comment" rows="10" cols="30"></textarea>
                <br>
                <input type="submit" value="Comment" />
            </form>

        <?php


?>

<?php
    include_once 'footer.php';
?>