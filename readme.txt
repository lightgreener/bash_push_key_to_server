Remote login into all local network server

1, Create rsa and rsa_pub files for certain user
	- Conditional: if user exists or not
	- Does this user have rsa and rsa_pub files

2, Conditional : expect installation

3, Conditional : how many server can be connect by this user (ping command)
	- while loop
	- if so, copy id to this server by expect

4, Check

because installation and add new user should be create by root. But we should use certain user to push his rsa
file to other servers. So we need to create another script.
	- First: root which install all relative application and check user who exists or not
	- Second: certain user do the rest job 
     	- Check: using certain user to login the server
     (main reason is that switch user is very hard to do in a script if you want non-interact) 
	
