  level 17 | user - bandit16 | password - kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx

Hint for password of bandit17
The credentials for the next level can be retrieved by submitting the password of the current level to a port on localhost in the range 31000 to 32000. First find out which of these ports have a server listening on them. Then find out which of those speak SSL/TLS and which don’t. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it.
to check for servers
nmap -sV localhost -p 31000-32000
to connect to server
openssl s_client -connect localhost:31790
ncat --ssl localhost 31790

RSA Private Key for user bandit17
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----

created a file named key and pasted the above RSA key
Logged onto bandit 17 using ssh -i key bandit17@bandit.labs.overthewire.org -p 2220

level 18 | user - bandit17 | password - rsa key

Hint for password of bandit18

There are 2 files in the homedirectory: passwords.old and passwords.new. The password for the next level is in passwords.new and is the only line that has been changed between passwords.old and passwords.new

NOTE: if you have solved this level and see ‘Byebye!’ when trying to log into bandit18, this is related to the next level, bandit19

used diff passwords.new passwords.old
got the line which is changed between new and old.


level 19 | user - bandit18 | password - x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO

Hint for password of bandit19
The password for the next level is stored in a file readme in the homedirectory. Unfortunately, someone has modified .bashrc to log you out when you log in with SSH.

opened a bash termonal using
ssh bandit18@bandit.labs.overthewire.org -p 2220 /bin/bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 bash -l also works

opened the readme file using cat readme

level20 | user - bandit19 | password - cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8

Hint for password of bandit20
To gain access to the next level, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.

./bandit20-do cat /etc/bandit_pass/bandit20

level21  | user - bandit20 | password - 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO

Hint for password of bandit21
There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for the next level (bandit21).

This one was tricky.
what i learnt was that i can set up connection from one instance to another.
so i set cat /etc/bandit_pass/bandit20 | nc -l -p 1234 on one session to connect with this user.
executed binary on another session using ./suconnect.
then received password on first session terminal

level22  | user - bandit21 | password - EeoULMCra2q0dSkYj561DX7s1CpBuOBt

Hint for password of bandit22
A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

used ls -al ../../etc/cron.d/ to display files. used cat cronjob_bandit22 to display the script name and location.
used cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv to get the password tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q.

level23  | user - bandit22 | password - tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q

Hint for password of bandit23
A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

used ls -al ../../etc/cron.d/ to display files. used cat cronjob_bandit23 to display the script name and location.
this was the output
myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

cat /etc/bandit_pass/$myname > /tmp/$mytarget
myname = bandit23. using this, got the name of file. mytarget = echo I am user bandit23 | md5sum | cut -d ' ' -f 1
used cat /tmp/8ca319486bfbbc3663ea0fbe81326349 to get the password 0Zf11ioIjMVN551jX3CmStKLYqjk54Ga.

level24  | user - bandit23 | password - 0Zf11ioIjMVN551jX3CmStKLYqjk54Ga 

