@implementation SKUILockupSwooshCollectionViewCell

- (SKUILockupSwooshCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUILockupSwooshCollectionViewCell *v8;
  SKUILockupSwooshCellLayout *v9;
  SKUILockupSwooshCellLayout *layout;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupSwooshCollectionViewCell initWithFrame:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUILockupSwooshCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = -[SKUILockupSwooshCellLayout initWithCollectionViewCell:]([SKUILockupSwooshCellLayout alloc], "initWithCollectionViewCell:", v8);
    layout = v8->_layout;
    v8->_layout = v9;

    -[SKUIItemCellLayout setDisplaysItemOfferButton:](v8->_layout, "setDisplaysItemOfferButton:", 0);
  }
  return v8;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SKUILockupSwooshCellLayout *layout;
  void *v9;
  SKUILockupSwooshCellLayout *v10;
  void *v11;
  SKUILockupSwooshCellLayout *v12;
  void *v13;
  SKUILockupSwooshCellLayout *v14;
  void *v15;
  void *v16;
  void *v17;
  SKUIItemOffer *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  layout = self->_layout;
  objc_msgSend(v6, "artistName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupSwooshCellLayout setArtistName:](layout, "setArtistName:", v9);

  v10 = self->_layout;
  objc_msgSend(v6, "categoryName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupSwooshCellLayout setCategory:](v10, "setCategory:", v11);

  v12 = self->_layout;
  SKUILockupItemCountString(v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupSwooshCellLayout setItemCountString:](v12, "setItemCountString:", v13);

  v14 = self->_layout;
  objc_msgSend(v6, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupSwooshCellLayout setTitle:](v14, "setTitle:", v15);

  objc_msgSend(v6, "primaryItemOffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!SKUIItemKindIsSoftwareKind(objc_msgSend(v6, "itemKind")))
  {
    v17 = (void *)configureForItem_clientContext__sViewOffer_0;
    if (!configureForItem_clientContext__sViewOffer_0)
    {
      v18 = [SKUIItemOffer alloc];
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:", CFSTR("VIEW_BUTTON"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("VIEW_BUTTON"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SKUIItemOffer initWithButtonText:](v18, "initWithButtonText:", v19);
      v21 = (void *)configureForItem_clientContext__sViewOffer_0;
      configureForItem_clientContext__sViewOffer_0 = v20;

      v17 = (void *)configureForItem_clientContext__sViewOffer_0;
    }
    v22 = v17;

    v16 = v22;
  }
  -[SKUILockupSwooshCellLayout setItemOffer:](self->_layout, "setItemOffer:", v16);
  v23.receiver = self;
  v23.super_class = (Class)SKUILockupSwooshCollectionViewCell;
  -[SKUIItemCollectionViewCell configureForItem:clientContext:](&v23, sel_configureForItem_clientContext_, v6, v7);

}

- (SKUILockupSwooshCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILockupSwooshCollectionViewCell initWithFrame:]";
}

@end
