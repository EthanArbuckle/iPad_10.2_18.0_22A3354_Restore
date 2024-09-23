@implementation SKUIEditorialLockupCollectionViewCell

- (SKUIEditorialLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIEditorialLockupCollectionViewCell *v8;
  SKUIEditorialLockupCellLayout *v9;
  SKUIEditorialLockupCellLayout *layout;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorialLockupCollectionViewCell initWithFrame:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIEditorialLockupCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = -[SKUICellLayout initWithCollectionViewCell:]([SKUIEditorialLockupCellLayout alloc], "initWithCollectionViewCell:", v8);
    layout = v8->_layout;
    v8->_layout = v9;

  }
  return v8;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  SKUIItemOffer *v15;
  SKUIEditorialLockupCellLayout *layout;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  -[SKUIEditorialLockupCellLayout lockupCellLayout](self->_layout, "lockupCellLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "categoryName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCategoryString:", v9);

  SKUILockupItemCountString(v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItemCountString:", v10);

  objc_msgSend(v8, "setNumberOfUserRatings:", objc_msgSend(v6, "numberOfUserRatings"));
  objc_msgSend(v6, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v11);

  objc_msgSend(v6, "userRating");
  *(float *)&v13 = v12 / 5.0;
  objc_msgSend(v8, "setUserRating:", v13);
  if (!v6)
  {
    -[SKUIEditorialLockupCellLayout setItemOffer:](self->_layout, "setItemOffer:", 0);
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v6, "itemKind") != 12)
  {
    if (!configureForItem_clientContext__sViewOffer_1)
    {
      v15 = [SKUIItemOffer alloc];
      if (v7)
        objc_msgSend(v7, "localizedStringForKey:", CFSTR("VIEW_BUTTON"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("VIEW_BUTTON"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SKUIItemOffer initWithButtonText:](v15, "initWithButtonText:", v19);
      v21 = (void *)configureForItem_clientContext__sViewOffer_1;
      configureForItem_clientContext__sViewOffer_1 = v20;

    }
    -[SKUIEditorialLockupCellLayout setItemOffer:](self->_layout, "setItemOffer:");
    -[SKUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUniversal:", 0);

    goto LABEL_14;
  }
  if (objc_msgSend(v6, "hasInAppPurchases"))
  {
    objc_msgSend(v7, "valueForConfigurationKey:", CFSTR("inappnote"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  layout = self->_layout;
  objc_msgSend(v6, "primaryItemOffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIEditorialLockupCellLayout setItemOffer:](layout, "setItemOffer:", v17);

  -[SKUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUniversal:", SKUIItemDeviceFamilyIsUniversal(objc_msgSend(v6, "deviceFamilies")));

LABEL_15:
  -[SKUIEditorialLockupCellLayout setItemOfferNoticeString:](self->_layout, "setItemOfferNoticeString:", v14);
  v23.receiver = self;
  v23.super_class = (Class)SKUIEditorialLockupCollectionViewCell;
  -[SKUIItemCollectionViewCell configureForItem:clientContext:](&v23, sel_configureForItem_clientContext_, v6, v7);

}

- (SKUIEditorialLockupCellLayout)layout
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
  v1 = "-[SKUIEditorialLockupCollectionViewCell initWithFrame:]";
}

@end
