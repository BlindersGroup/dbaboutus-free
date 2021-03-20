{*
* 2007-2020 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2020 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{extends file='page.tpl'}

{block name='hook_extra'}
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "BreadcrumbList",
        "itemListElement": [
            {foreach from=$breadcrumb.links item=path name=breadcrumb}
            {
                "@type": "ListItem",
                "position": {$smarty.foreach.breadcrumb.iteration|escape:'htmlall':'UTF-8'},
                "name": "{$path.title|escape:'htmlall':'UTF-8'}",
                "item": "{$path.url|escape:'htmlall':'UTF-8'}"
            }{if not $smarty.foreach.breadcrumb.last},{/if}
            {/foreach}
        ]
    }
    </script>
    {if $premium == 1}
        {include file='module:dbaboutus/premium/ritch_snnipets.tpl'}
    {/if}
{/block}

{include file='module:dbaboutus/views/templates/front/_partials/breadcrumb.tpl'}

{block name="content_wrapper"}
    <div id="content-wrapper" class="center-column">
        <div class="author_shortinfo">
            <div class="img_author"><img src="{$path_img|escape:'htmlall':'UTF-8'}{$author.id_dbaboutus_author|escape:'htmlall':'UTF-8'}.jpg" alt="{$author.name|escape:'htmlall':'UTF-8'}"></div>
            <div class="short_info_author">
                <div class="nameandrrss">
                    <h1 class="name">{$author.name|escape:'htmlall':'UTF-8'}</h1>
                    <ul>
                        {if !empty($author.linkedin)}
                            <li><a href="{$author.linkedin|escape:'htmlall':'UTF-8'}" rel="me" target="_blank"><img src="{$path_img|escape:'htmlall':'UTF-8'}../icons/linkedin.png"></a></li>
                        {/if}
                        {if !empty($author.twitter)}
                            <li><a href="{$author.twitter|escape:'htmlall':'UTF-8'}" rel="me" target="_blank"><img src="{$path_img|escape:'htmlall':'UTF-8'}../icons/twitter.png"></a></li>
                        {/if}
                        {if !empty($author.facebook)}
                            <li><a href="{$author.facebook|escape:'htmlall':'UTF-8'}" rel="me" target="_blank"><img src="{$path_img|escape:'htmlall':'UTF-8'}../icons/facebook.png"></a></li>
                        {/if}
                        {if !empty($author.instagram)}
                            <li><a href="{$author.instagram|escape:'htmlall':'UTF-8'}" rel="me" target="_blank"><img src="{$path_img|escape:'htmlall':'UTF-8'}../icons/instagram.png"></a></li>
                        {/if}
                        {if !empty($author.youtube)}
                            <li><a href="{$author.youtube|escape:'htmlall':'UTF-8'}" rel="me" target="_blank"><img src="{$path_img|escape:'htmlall':'UTF-8'}../icons/youtube.png"></a></li>
                        {/if}
                        {if !empty($author.web)}
                            <li><a href="{$author.web|escape:'htmlall':'UTF-8'}" rel="me" target="_blank"><img src="{$path_img|escape:'htmlall':'UTF-8'}../icons/web.png"></a></li>
                        {/if}
                    </ul>
                </div>
                <div class="work">
                    <span>{$author.profession|escape:'htmlall':'UTF-8'}</span>
                    {if !empty($author.number)}<span class="colegiado">{l s='Nº colegiado' mod='dbaboutus'} {$author.number|escape:'htmlall':'UTF-8'}</span>{/if}
                </div>
                {if !empty($tag) || count($total_opiniones) > 0}
                    <div class="additional">
                        {if !empty($tag)}
                            <span class="label"><svg viewBox="0 0 24 24" id="verified" xmlns="http://www.w3.org/2000/svg"><path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4zm-2 16l-4-4 1.41-1.41L10 14.17l6.59-6.59L18 9l-8 8z"></path></svg> {$tag|escape:'htmlall':'UTF-8'}</span>
                        {/if}
                        {if !empty($total_opiniones) && count($total_opiniones) > 0}
                            {if $c_active == true}{include file='module:dbaboutus/views/templates/front/_partials/comment_mini.tpl'}{/if}
                        {/if}
                    </div>
                {/if}
                <div class="short_description">
                    {$author.short_desc nofilter}
                </div>
            </div>
        </div>

        <div class="author_content row">
            <div class="col-md-{if $posts_more_read|count > 0}8{else}12{/if}">
                <div class="body_author row">
                    {if $specialities|count > 1}
                    <div class="specialties">
                        <h2 class="title">{l s='Especialidades' mod='dbaboutus'}</h2>
                        <ul class="tags">
                            {foreach from=$specialities item=spec}
                                <li>{$spec.name|escape:'htmlall':'UTF-8'}</li>
                            {/foreach}
                        </ul>
                    </div>
                    {/if}

                    <div class="large_descripion">
                        {$author.large_desc nofilter}
                    </div>

                    {if !empty($author.views)}
                    <div class="block_views">
                        <h2 class="title">{l s='Me has podido ver en:' mod='dbaboutus'}</h2>
                        {$author.views nofilter}
                    </div>
                    {/if}
                </div>

                {if $posts|count > 0}
                    <h2 class="title">{l s='Últimos posts' mod='dbaboutus'}</h2>
                    <div class="row posts_author">
                        {foreach from=$posts item=post}
                            <div class="col-md-6">
                                {include file='module:dbblog/views/templates/front/_partials/post_mini.tpl'}
                            </div>
                        {/foreach}
                    </div>
                {/if}

                {if $c_active == true}{include file='module:dbaboutus/views/templates/front/_partials/comments.tpl'}{/if}

                </div>

                {if $posts_more_read|count > 0}
                    <div class="col-md-4">
                        <div class="db_more_views_sidebar --card-blog">
                            <span class="db_title_h4 bck_title">{l s='Artículos más leidos' mod='dbaboutus'}</span>
                            <ul class="post_list_sidebar">
                                {foreach from=$posts_more_read item=post}
                                    <li>
                                        <a href="{$post.url|escape:'htmlall':'UTF-8'}">
                                            <img src="{$post.img|escape:'htmlall':'UTF-8'}" alt="{$post.title|escape:'htmlall':'UTF-8'}">
                                        </a>
                                        <div class="title">
                                            <a href="{$post.url|escape:'htmlall':'UTF-8'}">{$post.title|escape:'htmlall':'UTF-8'}</a>
                                            <div class="post-meta">
                                                <span class="updated"><img class="visibilidad" src="{_MODULE_DIR_}dbblog/views/img/icons/visibilidad.svg" alt="{l s='Visualizaciones' mod='dbaboutus'}"> {if isset($post.views)}{$post.views|escape:'htmlall':'UTF-8'}{else}0{/if}</span> | <a href="{$post.url_category|escape:'htmlall':'UTF-8'}">{$post.title_category|escape:'htmlall':'UTF-8'}</a>
                                            </div>
                                        </div>
                                        </a>
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>
                {/if}

        </div>

    </div>
{/block}