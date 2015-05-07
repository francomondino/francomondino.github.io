<?php
require 'vendor/autoload.php';
use Mailgun\Mailgun;
//Your credentials
$mg = new Mailgun("api:key-4d243d879dd01bc89ec98a217cf23652");
$domain = "fm.stefanomondino.com";

$name = $_POST["name"];
$email = $_POST["email"];
$message = $_POST["message"];
$from = $name .' <'.$email.'>'

if ($name == NULL || $email == NULL || $message == NULL) {
  echo "All field are mandatory. Please fill them all";
}
else {
//Customise the email - self explanatory
$mg->sendMessage($domain, array(
'from'=>$from,
'to'=> 'stefano.mondino.dev@gmail.com',
'subject' => 'Info about francomondino.it',
'text' => $message
    )
)
echo "Thank you! Your message was sent. I'll get in touch as soon as possible.";
}
?>
