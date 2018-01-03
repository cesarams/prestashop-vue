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
<div class="product-add-to-cart">
  {if !$configuration.is_catalog}

    <div class="d-flex">
      {block name='product_quantity'}
        <div class="product-quantity d-inline-flex">
          <label class="mr-2 mb-0" for="quantity_wanted">{l s='Quantity' d='Shop.Theme.Catalog'}</label>
          <input
            class="form-control mr-2"
            type="number"
            name="qty"
            id="quantity_wanted"
            value="{$product.quantity_wanted}"
            class="input-group"
            min="{$product.minimal_quantity}"
          >
        </div>
      {/block}

      <button class="add-to-cart btn btn-dark" type="submit" name="add" data-button-action="add-to-cart" {if !$product.add_to_cart_url}disabled{/if}>
        {l s='Add to cart' d='Shop.Theme.Actions'}
      </button>
    </div>

    {block name='product_minimal_quantity'}
      <p class="product-minimal-quantity">
      {if $product.minimal_quantity > 1}
          {l
            s='The minimum purchase order quantity for the product is %quantity%.'
            d='Shop.Theme.Checkout'
            sprintf=['%quantity%' => $product.minimal_quantity]
          }
      {/if}
      </p>
    {/block}
  {/if}
</div>