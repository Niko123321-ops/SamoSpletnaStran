<?php
    include_once 'header.php';
?>

<h1>Registracija</h1>

<form action="user_add.php" method="post">
                                        First name: <input type="text" name="ime" placeholder="First name" required="required" />
                                        <br>
                                        Last name: <input type="text" name="priimek" placeholder="Last name" required="required" />
                                        <br>
                                        E-mail: <input type="email" name="email" placeholder="E-mail" required="required" />
                                        <br>
                                        Password: <input type="password" name="pass1" placeholder="Password" required="required" />
                                        <br>
                                        Confirm Password: <input type="password" name="pass2" placeholder="Confirm password" required="required" />
                                        <br>
										<input type="submit" value="Register" />
									
								</form>
                                
<?php
    include_once 'footer.php';
?>
