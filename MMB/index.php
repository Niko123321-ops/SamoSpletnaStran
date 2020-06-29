<?php
    include_once 'header.php';
    include_once 'database.php';

    if(isset($_SESSION['user_id']))
    {

        if($_SESSION['user_id'] == 5)
        {
            header("location:logout.php");
        }
    }
?>

<h1 align="middle">MEME ME BOIS!</h1>

<br>
<br>
<div align="middle">
    <a class="button" href="item_add.php">ADD YOUR POST</a>
</div>
<br>

<div align="middle">
<?php

    $query = "SELECT hf.id, hf.ime, hf.slika FROM hifi_zvocniki hf";
    $result = mysqli_query($link, $query);

    while($row = mysqli_fetch_array($result))
        {
           

			echo "<div style='border: thin solid black'>";
            echo $row['ime'];
            echo '<br>';
            echo '<a href="item.php?id='.$row['id'].'">';
            echo '<img src=';
            echo $row['slika'];
            echo " max-width='450' alt='No image...'>";
            echo '</a>';
            echo '<br>';

            $query1 = 'SELECT * FROM ocene o INNER JOIN hifi_zvocniki hf ON o.hifi_zvocniki_id=hf.id WHERE (o.hifi_zvocniki_id = "'.$row['id'].'")  ORDER BY datum DESC LIMIT 3';
            $result1 = mysqli_query($link, $query1);

            echo "<div style='border-top: thin solid black'>Last 3 Comments: <br>";

            while($row2 = mysqli_fetch_array($result1))
            {
                echo $row2['prednosti'];
                echo "<br>";
            }

            echo "</div>";
			echo "</div>";
            echo '<br>';
            echo '<br>';
            echo '<br>';
        }

?>
</div>

<?php
    include_once 'footer.php';
?>