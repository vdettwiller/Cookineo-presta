{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='product_miniature_item'}
  <article class="product-miniature js-product-miniature w-100" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container">
     <div class="left-block col-sm-12 col-md-4"> <!-- Début Colonne de gauche (img)-->
      {block name='product_thumbnail'}
        <a href="{$product.url}" class="thumbnail product-thumbnail">
          <img class="img-responsive tailleImg mt-1"
            src = "{$product.cover.bySize.home_default.url}"
            alt = "{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
            data-full-size-image-url = "{$product.cover.large.url}"
          >
        </a>
      {/block}
      </div><!-- Fin Colonne de gauche (img)-->

     <div class="center-block col-sm-12 col-md-4"><!-- Début Colonne du milieu (description)-->
      <div class="product-description">
        {block name='product_name'}
          <h1 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h1>
        {/block}

        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping">
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                <span class="regular-price">{$product.regular_price}</span>
               

              {hook h='displayProductPriceBlock' product=$product type="before_price"}

             
              <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
              <span itemprop="price" class="price">{$product.price}</span>
              {if $product.discount_type === 'percentage'}
                <!-- <span class="discount-percentage discount-product">{$product.discount_percentage}</span>-->
                {elseif $product.discount_type === 'amount'}
                 <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                {/if}
              {/if}

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

              {hook h='displayProductPriceBlock' product=$product type='weight'}
            </div>
          {/if}
        {/block}

        {block name='product_reviews'}
          {hook h='displayProductListReviews' product=$product}
        {/block}
      </div>
      </div><!-- Fin Colonne du milieu (description)-->
      
    <div class="right-block col-sm-12 col-md-4"><!-- Début Colonne droit (Btn)-->
       <form action="{$urls.pages.cart}" method="post">
   		<input type="hidden" name="token" value="{$static_token}">
   		<input type="hidden" value="{$product.id_product}" name="id_product">
  		 <input type="number" class="input-group form-control" name="qty" value="1">
  		 
  		 
  		<button data-button-action="add-to-cart" class="btn btn-primary">{l s='Add to cart' d='Shop.Theme.Actions'}</button>
  		
  		
		</form>
	</div><!-- Fin Colonne droit (Btn)-->

     <!-- {block name='product_flags'}
        <ul class="product-flags">
          {foreach from=$product.flags item=flag}
            <li class="product-flag {$flag.type}">{$flag.label}</li>
          {/foreach}
        </ul>
      {/block}-->

      

    </div>
  </article>
{/block}
