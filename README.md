# Jesse's SESYNC Training 

This is Jesse's SESYNC Training and her goals are:

- Figure out how to have one way (pull, repull, etc.) communication with git hub, that's then pushed to other places (internal or github)

- Figure out how to make pretty visualizations of things over time and space

- Ponder collaborative processes for the division and how to implement them

While logged in to GitHub, use the "+" icon in the upper right to create a new repository. Give it a name but leave the repo empty -- don't even check the box to add a README. Next, we'll change the remote url of this local clone to replace the current origin (SESYNC-ci/handouts) with your brand new repo. To do so, from a shell with working directory set to a path inside your local clone, enter:

    git remote set-url origin https://github.com/%user%/%repo%.git
	
Replace `%user%` with your user name on GitHub and `%repo%` with the name of your new GitHub repo. Now just push the commits on all branches up to your origin:

    git push origin --all
   
You are now able to commit and push any changes you make locally to your own repo on GitHub.
