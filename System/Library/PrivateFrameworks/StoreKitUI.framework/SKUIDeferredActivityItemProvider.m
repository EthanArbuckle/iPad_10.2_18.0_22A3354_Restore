@implementation SKUIDeferredActivityItemProvider

+ (id)placeholderItem
{
  return &stru_1E73A9FB0;
}

- (SKUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4 placeholderItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIDeferredActivityItemProvider *v11;
  void *v12;
  id itemProvider;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:placeholderItem:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIDeferredActivityItemProvider;
  v11 = -[UIActivityItemProvider initWithPlaceholderItem:](&v15, sel_initWithPlaceholderItem_, v10);
  if (v11)
  {
    v12 = _Block_copy(v8);
    itemProvider = v11->_itemProvider;
    v11->_itemProvider = v12;

    objc_storeStrong((id *)&v11->_clientContext, a4);
  }

  return v11;
}

- (SKUIDeferredActivityItemProvider)initWithProductPageItem:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  SKUIDeferredActivityItemProvider *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__SKUIDeferredActivityItemProvider_initWithProductPageItem_clientContext___block_invoke;
  v12[3] = &unk_1E73A6130;
  v13 = v6;
  v7 = v6;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "placeholderItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SKUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:placeholderItem:](self, "initWithProductPageItemProvider:clientContext:placeholderItem:", v12, v8, v9);

  return v10;
}

id __74__SKUIDeferredActivityItemProvider_initWithProductPageItem_clientContext___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (SKUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SKUIDeferredActivityItemProvider *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "placeholderItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SKUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:placeholderItem:](self, "initWithProductPageItemProvider:clientContext:placeholderItem:", v7, v6, v8);

  return v9;
}

- (SKUIProductPageItem)productPageItem
{
  void (**productPageItem)(void *, SEL);
  SKUIProductPageItem *v4;
  SKUIProductPageItem *v5;

  productPageItem = (void (**)(void *, SEL))self->_productPageItem;
  if (!productPageItem)
  {
    productPageItem = (void (**)(void *, SEL))self->_itemProvider;
    if (productPageItem)
    {
      productPageItem[2](productPageItem, a2);
      v4 = (SKUIProductPageItem *)objc_claimAutoreleasedReturnValue();
      v5 = self->_productPageItem;
      self->_productPageItem = v4;

      productPageItem = (void (**)(void *, SEL))self->_productPageItem;
    }
  }
  return (SKUIProductPageItem *)productPageItem;
}

- (SKUIClientContext)clientContext
{
  return (SKUIClientContext *)objc_getProperty(self, a2, 280, 1);
}

- (void)setClientContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (id)itemProvider
{
  return objc_getProperty(self, a2, 288, 1);
}

- (void)setItemProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_productPageItem, 0);
}

- (void)initWithProductPageItemProvider:clientContext:placeholderItem:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:placeholderItem:]";
}

@end
