<?php

$navn 		= $_POST["navn"];
$epost		= $_POST["epost"];
$kommentarer= $_POST["kommentarer"];


								$mail_body =	"Kontakt ! <br /><br />";

								$mail_body .= 	'Navn - ' . $navn . '<br />';
								$mail_body .= 	'E-post - ' . $epost . '<br />';
								$mail_body .= 	'Hva kan vi hjelpe deg med? - ' . $kommentarer . '<br />';

								$mail_body .=	"<br /><br />Ski Hundepensjonat";

//echo $mail_body;


								$from		= "webmaster@skihundepensjonat.no";
//								$to			= "joinburakc@gmail.com";
								$to			= "post@skihundepensjonat.no";
								$subject	= "Kontakt";
								$body 		= $mail_body;


								$headers = "From: " . $from . "\r\n";
								$headers .= "Reply-To: ". 'webmaster@skihundepensjonat.no' . "\r\n";
								$headers .= "MIME-Version: 1.0\r\n";
								$headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
						
								if(mail($to,$subject,$body,$headers))
								{
									echo '<script type="text/javascript">window.parent.location="/";</script>';
								}
								else 
								{
									$error_msg='<p align="center"><strong>Det er et midlertidig problem med e-postserveren, vennligst prøv igjen.</strong></p>';
									echo $error_msg;
								}
?>
