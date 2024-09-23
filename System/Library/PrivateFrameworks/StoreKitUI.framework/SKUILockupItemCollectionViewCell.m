@implementation SKUILockupItemCollectionViewCell

- (SKUILockupItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUILockupItemCollectionViewCell *v8;
  SKUILockupItemCellLayout *v9;
  SKUILockupItemCellLayout *layout;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupItemCollectionViewCell initWithFrame:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUILockupItemCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = -[SKUILockupItemCellLayout initWithCollectionViewCell:]([SKUILockupItemCellLayout alloc], "initWithCollectionViewCell:", v8);
    layout = v8->_layout;
    v8->_layout = v9;

  }
  return v8;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SKUILockupItemCellLayout *layout;
  void *v9;
  SKUILockupItemCellLayout *v10;
  void *v11;
  SKUILockupItemCellLayout *v12;
  void *v13;
  SKUILockupItemCellLayout *v14;
  void *v15;
  SKUILockupItemCellLayout *v16;
  float v17;
  double v18;
  SKUILockupItemCellLayout *v19;
  void *v20;
  SKUILockupItemCellLayout *v21;
  void *v22;
  void *v23;
  void *v24;
  SKUIItemOffer *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  layout = self->_layout;
  objc_msgSend(v6, "artistName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupItemCellLayout setArtistName:](layout, "setArtistName:", v9);

  v10 = self->_layout;
  objc_msgSend(v6, "categoryName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupItemCellLayout setCategoryString:](v10, "setCategoryString:", v11);

  v12 = self->_layout;
  SKUILockupItemCountString(v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupItemCellLayout setItemCountString:](v12, "setItemCountString:", v13);

  -[SKUILockupItemCellLayout setNumberOfUserRatings:](self->_layout, "setNumberOfUserRatings:", objc_msgSend(v6, "numberOfUserRatings"));
  v14 = self->_layout;
  objc_msgSend(v6, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupItemCellLayout setTitle:](v14, "setTitle:", v15);

  v16 = self->_layout;
  objc_msgSend(v6, "userRating");
  *(float *)&v18 = v17 / 5.0;
  -[SKUILockupItemCellLayout setUserRating:](v16, "setUserRating:", v18);
  v19 = self->_layout;
  objc_msgSend(v6, "editorialBadge");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupItemCellLayout setEditorialBadgeString:](v19, "setEditorialBadgeString:", v20);

  if (objc_msgSend(v6, "itemKind") == 12)
  {
    v21 = self->_layout;
    objc_msgSend(v6, "primaryItemOffer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIItemCellLayout setItemOffer:](v21, "setItemOffer:", v22);

    -[SKUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setUniversal:", SKUIItemDeviceFamilyIsUniversal(objc_msgSend(v6, "deviceFamilies")));

    if (objc_msgSend(v6, "hasInAppPurchases"))
    {
      objc_msgSend(v7, "valueForConfigurationKey:", CFSTR("inappnote"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    -[SKUIItemCellLayout setItemOfferNoticeString:](self->_layout, "setItemOfferNoticeString:", v24);
  }
  else
  {
    if (v6 && !configureForItem_clientContext__sViewOffer)
    {
      v25 = [SKUIItemOffer alloc];
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:", CFSTR("VIEW_BUTTON"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("VIEW_BUTTON"), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SKUIItemOffer initWithButtonText:](v25, "initWithButtonText:", v26);
      v28 = (void *)configureForItem_clientContext__sViewOffer;
      configureForItem_clientContext__sViewOffer = v27;

    }
    -[SKUIItemCellLayout setItemOffer:](self->_layout, "setItemOffer:");
    -[SKUIItemCellLayout setItemOfferNoticeString:](self->_layout, "setItemOfferNoticeString:", 0);
    -[SKUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUniversal:", 0);
  }

  v29.receiver = self;
  v29.super_class = (Class)SKUILockupItemCollectionViewCell;
  -[SKUIItemCollectionViewCell configureForItem:clientContext:](&v29, sel_configureForItem_clientContext_, v6, v7);

}

- (SKUILockupItemCellLayout)layout
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
  v1 = "-[SKUILockupItemCollectionViewCell initWithFrame:]";
}

@end
