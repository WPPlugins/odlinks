		<BR />
      <BR />
      {if $new_links}
         <h3>{$odl_lang.ODL_LAST} {$linksNum} {$odl_lang.ODL_POSTED}</h3>
         <table>
         {foreach from=$new_links item=item key=key}
            <tr><td width=20><a href="{$item.url}" style="background: url({$odl_images}/images/camera.gif) no-repeat left top;" class="previewlink" target=_blank>&nbsp;&nbsp;&nbsp;&nbsp;</a></td><td><a href="{$item.url}" target=_blank>{$item.title}</a>&nbsp;
            <span class="smallTxt">({$item.category}&nbsp;[{$item.date}])</span><br /></td></tr>
         {/foreach}
         </table>
      {/if}
      <BR />
      {if $googlebtn}<div class="odl_googleAd">{$odl_googleAd}</div>{/if}
      <h3>{$odl_lang.ODL_LEGEND}</h3>
      <span class ="smallTxt">{$odl_lang.ODL_CATEGORIES} {$categories_total}, {$odl_lang.ODL_LINKS} {$links_total}</span>

		{$rssLink}

	</div><!--main-content-->
</div><!--odl_container-->