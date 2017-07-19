{include file='header.tpl'}

<P>
<div class="odl_container">
	<div class="odl_editform">{if $error}<b>{$error}</b><hr>{/if}</div>
	<div class="main-content">
      {if ($cat_id != 0) && ($cat_desc <> "")}{$odl_lang.ODL_DESC}<br />{$cat_desc}{/if}
      {if $googletop}{$googleAd}{/if}
      {if $categories}
      <h3>{$odl_lang.ODL_CATS}</h3></td>
      <table border="0" width="100%" class="tbody" cellspacing="1" cellpadding="1">
      <tr>
         <td width="100%">
         <table border="0" width="97%" cellspacing="3" cellpadding="3"><tr> 
         {foreach from=$categories name=categories item=cat key=cats}
            <td valign="top" width="50%">
                  <img src="{$odl_images}/images/folder.gif">&nbsp;<b>{$cat.cat_link}</b>({$cat.c_links})<br>
                  {if $subcategories}
                     <table border="0"><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;
                     {foreach from=$subcategories item=sub key=subs name=subcount}
                        {if $sub.c_parent==$cat.c_id}
                           {if $sub.c_no<4}
                              {$sub.c_path}
                           {else}.{/if}
                        {/if}
                     {foreachelse}
                     {$odl_lang.ODL_NOTFOUND}
                     {/foreach}
                     </td></tr></table>
               {/if}
            </td>
            {if $smarty.foreach.categories.iteration is div by 2}
            </tr><tr>
            {elseif not $smarty.foreach.categories.last}
               <td>&nbsp;</td>
            {/if}
         {/foreach}
         </tr></table>
         </td>
      </tr>
      </table>
      {else}
      <BR />
      {/if}
      {if $links}
       <h3>Links</h3>
       {foreach from=$links item=item key=key}
        <div class="viewlink">
         <table border=0>
	 <tr>
	 <td valign="top" width=20><a href="{$item.url}" style="background: url({$odl_images}/images/camera.gif) no-repeat left top;" class="previewlink" target=_blank>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
	 <td><b><a href="{$item.url}" target=_blank>{$item.title}</a></b>&nbsp;<span class ="smallTxt">{$odl_lang.ODL_ADDED}{$item.date}</span><br/>{if $item.description <> ""}{$item.description}{/if}</td>
	 </tr>
	 <tr>
	 <td></td>
	 <td><br><img src="{$odl_images}/images/favourite.gif"><a href="javascript:addbookmark('{$item.url}','{$item.title}');"><font color="#840000">{$odl_lang.ODL_ADDFOVOURITE}</font></a>&nbsp;&nbsp;&nbsp;<img src="{$odl_images}/images/refer.gif">{$item.sendlink}&nbsp;&nbsp;&nbsp;{$item.rank_txt}&nbsp;&nbsp;&nbsp;<img src="{$odl_images}/images/{$item.rank_img}"></td>
	 </tr>
         </table>
         </div>
        {/foreach}
      {/if}
      
{include file='footer.tpl'}
