<?php
/**
 * wordpress plugin odLins V1.2
 * RSS Feeds
 * Author Website : http://www.forgani.com
*/

if(preg_match('#' . basename(__FILE__) . '#', $_SERVER['PHP_SELF'])) { 
	die('You are not allowed to call this page directly.'); 
}

ob_start();

$pageinfo = odlinksget_pageinfo();

# Get Data
$start=0;
$sql="SELECT * FROM {$table_prefix}odlinks l, {$table_prefix}odcategories c WHERE l.l_c_id = c.c_id AND l.l_hide='visible' ORDER BY l.l_date DESC, l.l_title DESC LIMIT ".($start).", ".($odlinkssettings['odlinks_last_links_num']);

$posts = $wpdb->get_results($sql);

# Define Channel Elements
$rssTitle=get_bloginfo('name').' - '.__("open directory links");
$rssLink = get_bloginfo('wpurl'). "/?page_id=". $pageinfo["ID"]. "&_action=odlfeed";
$atomLink= $rssLink;
$rssDescription=get_bloginfo('description');
$rssGenerator=__('odlinks Version ') . '1.1';
$rssItem=array();
	
if($posts) {
	foreach($posts as $post){
		# Define Item Elements
		$item = new stdClass;
		$item->title=$post->l_title;
		$item->pubDate=@date($odlinkssettings['date_format'], $post->l_date); 
		$item->category=$post->c_title;
		$item->post=$post->l_description;
		$item->guid=odlRssLink(array("name"=>$ad->l_title, "id"=>$post->lists_id, "parent"=>$post->l_c_id));
		$rssItem[]=$item;
	}
}

if (empty($wp)) {
    require_once('wp-config.php');
    wp('feed=rss2');
}

$contents = '<?xml version="1.0" encoding="' .  get_settings('blog_charset') . '"?>';
$contents .= '<rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/" ' .  do_action('rss2_ns') . '>';
$contents .= '<channel><title>'.  odlRssFilter($rssTitle) . ' (wordpress odlinks plugin)</title>';
$contents .= '<link>' . ODL_PLUGIN_URL . '/includes/Smarty/cache/odlinks.xml</link>';
$contents .= '<description>' . odlRssFilter($rssDescription) .'</description>';
$contents .= "<generator>" . odlRssFilter($rssGenerator) ."</generator>\n";
$contents .= "<language>" .  get_option('rss_language') . "</language>\n";
$contents .= '<pubDate>' .  date("D, d-M-Y") . '00:00:00 UTC</pubDate>';
echo $contents;

$filename = ODL_PLUGIN_DIR . '/includes/Smarty/cache/odlinks.xml';
$fp = fopen($filename, 'w');

fwrite($fp, $contents);
?>
<?php do_action('rss2_head'); ?>
<?php foreach($rssItem as $item): ?>
<?php ob_start(); start_wp();?>
	<item>
		<title><?php echo odlRssFilter($item->title); ?></title>
		<link><?php echo $item->guid ?></link>
		<category><?php echo odlRssFilter($item->category) ?></category>
		<guid isPermaLink="true"><?php echo odlRssFilter($item->guid) ?></guid>
		<!-- dc:creator><?php //the_author() ?></dc:creator -->
		<description>[CDATA[<?php echo odlRssFilter($item->post) ?>]]</description>
		<pubDate><?php echo odlRssFilter($item->pubDate) ?></pubDate>
	</item>
<?php
	$contents = ob_get_clean();
   fwrite($fp, $contents);
?>
<?php endforeach; ?>
<?php ob_start(); ?>
</channel>
</rss>
<?php
	$contents = ob_get_clean();
	fwrite($fp, $contents);
?>