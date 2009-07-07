-------------------------------------------------------------------------
-                    Ruby REST Code Signing Sample                      -
-------------------------------------------------------------------------
This test will take your Access Key ID and Secret Key, assemble and make 
 REST requests to the Alexa Web Information Service (AWIS).

Required packages:
	- This sample was built using Ruby 1.8.4
	- Ruby must be compiled with REXML
	- Requires OpenSSL

Steps:
1. Sign up for an Amazon Web Services account at http://aws.amazon.com
   (Note that you must have a valid credit card)
2. Get your Access Key ID and Secret Access Key
3. Sign up for the Alexa Web Information Service at http://aws.amazon.com/awis
4. Uncompress the zip file into a working directory
5. Run
	ruby urlinfo.rb


If you are getting "Not Authorized" messages, you probably have one of the
following problems:

1. Your access key or secret key were not entered properly.  Please re-check
that they are correct.

2. You did not sign up for AWIS at http://aws.amazon.com/awis
(After you have your keys, you must still separately sign up for AWIS)

3. Your credit card was not authorized.  You must use a valid credit card
or your requests will not be authorized.

If you are getting "Request Expired" messages, please check that the time
is properly set on your computer.
