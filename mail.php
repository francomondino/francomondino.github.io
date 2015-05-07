<?php



$name = $_POST["name"];
$email = $_POST["email"];
$message = $_POST["message"];
$from = $name .' <'.$email.'>'


if ($name == NULL || $email == NULL || $message == NULL) {
  echo "All field are mandatory. Please fill them all";
}
else {
  echo "Thank you! Your message was sent. I'll get in touch as soon as possible.";
}
?>
