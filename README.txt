=== Open Links Directory ===

name: Open Directory Links (ODLinks) Wordpress plugins version 1.1.1-a
Contributors: Mohammad Forgani
Donate link: http://www.forgani.com/
Tags: websitedirectory, opendirectory, directoryproject, linkdirectory, linksdirectory, openproject, dmoz, classifieds, websitesubmitting, website, odlinks
Requires at least: 2.6
Tested up to: 2.6
Stable tag: 0.6

open links directory is a plugin that provides you an Open Directory Project the same as the DMOZ.org

== Description ==

Links-Open Directory is a Wordpress plugin 
The plugin will help you to start a profitable link directory the same as the DMOZ.org directory.

This plugin is under active development. If you experience problems, please first make sure you have the latest version installed. 
Feature requests, bug reports and comments can be submitted [here](http://www.forgani.com/root/opendirectorylinks/).


== Installation ==

1. Unzip the downloaded package and upload the odlinks folder into your Wordpress plugins folder
2. Log into your WordPress admin panel
3. Go to Plugins and "Activate" the plugin
4. "OD-Links Admin" will now be displayed in your Options section under Manage.
5. For first step instructions, go to Options "ODLINKS Settings"

Once you submit the Settings page of ODLinks it will set off the process of installing its tables and setting up its default settings.

6. Go to create and modify your Categories and Sub Categories under "ODLINKS Structure"

You will need to make the Smarty cache folders writeable (chmod 777):

* odlinks/includes/Smarty/cache
* odlinks/includes/Smarty/templates_c


== Frequently Asked Questions ==

Where to customize font and background colors?

You may modify the style sheet odlinks.css in wp-content/plugins/odlinks/themes/default/css/ folder in any way you wish to sets the background color of the layout area or fonts


== Screenshots ==

demo: http://forgani.com/index.php?pagename=odlinks


== History ==


== Changelog ==

Changelog:

Changes 1.1.1-a - Jan 20/01/2010
- implemented english language file

Changes 1.1-a - Jan 19/01/2010
- update the search process and templates

Changes 1.0.2-a - Oct 25/10/2009
- Fixed bug with auto-install on wordpress 2.8.5

Changes 1.0.1-a - Mar 17/03/2009
- Implement the search function.

Changes 1.0.0-a - Jan 25/01/2009
- It covers changes between WordPress Version 2.6 and Version 2.7

Changes Nov 12/2008 version v. 07
- implement the banned list
- added google pagerank


Changes Nov 12/2008 version v. 05
- implement the bookmark & sent to his friend’s button
- edit/move categories

- implement the conformation code (captcha)

Changes Oct 10/2008
- admin email notification
- include the Google AdSense 

To support Permalink structure:

An example for htaccess code to redirect to odlinks
You need an .htaccess file. The file will be create/modify by wordpress via the Permalink/mod-rewrite option. 

Please edit the .htaccess file in the root folder of your Wordpress.
You use the default .htaccess file and modify the file as follow:
The redirect should look something like this

RewriteRule !(classified|odlinks)/ /index.php [L]
RewriteRule ^odlinks/([^/\(\)]*)/?([^/\(\)]*)/?([^/\(\)]*)/? /index.php?pagename=odlinks&_action=$1&id=$2&parent=$3 [QSA,L,R,NS]


== To Do ==


have fun
Regards from Isfahan ;-)
Mohammad Forgani, Oh Jung-Su
oct. 23/2008
