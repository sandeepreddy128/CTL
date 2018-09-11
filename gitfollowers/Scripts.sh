
#!/bin/bash

echo Enter the GitHub username


#input the username through command
read username


#checking for the followers of a given GitHub login
curl https://api.github.com/users/$username/followers > a.json



#filtering the  five login_id's from all the follower Id's
cat a.json | grep -m 5 "login" > userfollowers.json



#jq is a sed for JSON
jq -c '.[]' userfollowers.json | while read login; do
    curl https://api.github.com/users/$login/followers > b.json

cat b.json | grep -m 5 "login" > userfollowers2.json
done




jq -c '.[]' userfollowers2.json | while read login; do
    curl https://api.github.com/users/$login/followers > c.json

cat c.json | grep -m 5 "login\|id" > userfollowers3.json
done





