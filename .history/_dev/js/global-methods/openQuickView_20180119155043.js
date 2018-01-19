export default function() {
  $(document).on("click", "[data-link-action='quickview']", event => {
    console.log(event.target);
    this.$nextTick(function() {
      this.themeLoaderShow = true;
    });

    let data = {
      action: "quickview",
      id_product: event.target.dataset.idProduct,
      id_product_attribute: event.target.dataset.idProductAttribute
    };
    $.post(prestashop.urls.pages.product, data, null, "json")
      .then(resp => {
        console.log(resp);
        // $('body').append(resp.quickview_html)
        // let productModal = $(`#quickview-modal-${resp.product.id}-${resp.product.id_product_attribute}`)
        // productModal.modal('show')
        // productConfig(productModal)

        // productModal.on('shown.bs.modal', function () {
        //   createProductThumbnails($('.quickview'))
        // })

        // productModal.on('hidden.bs.modal', function () {
        //   productModal.remove()
        // })

        this.$nextTick(function() {
          this.modules.productPageData = resp.product;
          this.themeLoaderShow = false;

          console.log(this.modules.productPageData);
        });
      })
      .fail(resp => {
        prestashop.emit("handleError", {
          eventType: "clickQuickView",
          resp: resp
        });
      });
  });
}
