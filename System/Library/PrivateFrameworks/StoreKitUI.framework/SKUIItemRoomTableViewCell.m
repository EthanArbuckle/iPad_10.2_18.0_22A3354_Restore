@implementation SKUIItemRoomTableViewCell

- (SKUIItemRoomTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUIItemRoomTableViewCell *v7;
  SKUIItemBrowseCellLayout *v8;
  SKUIItemBrowseCellLayout *layout;
  objc_super v11;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItemRoomTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIItemRoomTableViewCell;
  v7 = -[SKUITableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = -[SKUIItemBrowseCellLayout initWithTableViewCell:]([SKUIItemBrowseCellLayout alloc], "initWithTableViewCell:", v7);
    layout = v7->_layout;
    v7->_layout = v8;

  }
  return v7;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4 rowIndex:(int64_t)a5
{
  id v8;
  id v9;
  SKUIItemBrowseCellLayout *layout;
  void *v11;
  void *v12;
  SKUIItemBrowseCellLayout *v13;
  void *v14;
  SKUIItemBrowseCellLayout *v15;
  float v16;
  void *v17;
  uint64_t v18;
  SKUIItemBrowseCellLayout *v19;
  void *v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  layout = self->_layout;
  objc_msgSend(v8, "primaryItemOffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemCellLayout setItemOffer:](layout, "setItemOffer:", v11);

  -[SKUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUniversal:", SKUIItemDeviceFamilyIsUniversal(objc_msgSend(v8, "deviceFamilies")));

  -[SKUIItemBrowseCellLayout setNumberOfUserRatings:](self->_layout, "setNumberOfUserRatings:", objc_msgSend(v8, "numberOfUserRatings"));
  v13 = self->_layout;
  objc_msgSend(v8, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemBrowseCellLayout setTitle:](v13, "setTitle:", v14);

  v15 = self->_layout;
  objc_msgSend(v8, "userRating");
  -[SKUIItemBrowseCellLayout setUserRating:](v15, "setUserRating:", (float)(v16 / 5.0));
  if (objc_msgSend(v8, "hasInAppPurchases"))
  {
    objc_msgSend(v9, "valueForConfigurationKey:", CFSTR("inappnote"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  -[SKUIItemCellLayout setItemOfferNoticeString:](self->_layout, "setItemOfferNoticeString:", v17);
  v18 = objc_msgSend(v8, "itemKind");
  v19 = self->_layout;
  if (v18 == 17)
    SKUILockupItemCountString(v8, v9);
  else
    objc_msgSend(v8, "categoryName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemBrowseCellLayout setSubtitle:](v19, "setSubtitle:", v20);

  v21.receiver = self;
  v21.super_class = (Class)SKUIItemRoomTableViewCell;
  -[SKUIItemTableViewCell configureForItem:clientContext:rowIndex:](&v21, sel_configureForItem_clientContext_rowIndex_, v8, v9, a5);

}

- (SKUIItemBrowseCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIItemRoomTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
