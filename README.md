# Hello

This is a basic wordpress vagrant vm for use in my blog series on Chef Solo

## Use
Run *setup_cookbooks.sh* to get the prerequisite chef solo cookbooks pulled down locally, then 

	vagrant up

to start building a vm with a base wordpress installation. 

## Then what?
Add a few posts for fun, then you can 

	vagrant ssh

in and run */var/_shared/blog_backup.sh* to create a gzipped tarball of the entire blog, ready for restoring using my other vm :)