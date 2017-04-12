<?php
	$ip= $_REQUEST["ip"];
	echo $ip;
	$file = fopen("ip.txt", "w") or die("Unable to open file!");
	$txt = $ip;
	fwrite($file, $txt);
	fclose($file);

	$output=shell_exec("/var/www/html/Chiusurastupida.sh 2>&1");
	print_r($output);

	sleep(3);

	$output2=shell_exec("/var/www/html/TerminaliPhp 2>&1");
	print_r($output2);
	echo exec('whoami');
 ?>
