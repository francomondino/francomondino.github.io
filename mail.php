<?php



$name = $_POST["name"];
$email = $_POST["email"];
$message = $_POST["message"];
$from = 'From: '.$name .' <'.$email.'>';


if ($name == NULL || $email == NULL || $message == NULL) {
  echo "All field are mandatory. Please fill them all";
}
else {

  $headers = $from;
  $to = 'mail@francomondino.it';
  $subject = 'Message sent from francomondino.it - '.$name.' wants to ask you something.';

  //mail($to, $subject, $message, $headers);

  echo "Thank you! Your message was sent. I'll get in touch as soon as possible.";
}
?>
