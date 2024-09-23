@implementation SKUIItemBrowseTableViewCell

- (SKUIItemBrowseTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUIItemBrowseTableViewCell *v7;
  SKUIItemBrowseCellLayout *v8;
  SKUIItemBrowseCellLayout *layout;
  objc_super v11;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIItemBrowseTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIItemBrowseTableViewCell;
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
  SKUIItemBrowseCellLayout *v12;
  void *v13;
  void *v14;
  SKUIItemBrowseCellLayout *v15;
  void *v16;
  SKUIItemBrowseCellLayout *v17;
  float v18;
  void *v19;
  uint64_t v20;
  SKUIItemBrowseCellLayout *v21;
  void *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  layout = self->_layout;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a5 + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemBrowseCellLayout setIndexNumberString:](layout, "setIndexNumberString:", v11);

  v12 = self->_layout;
  objc_msgSend(v8, "primaryItemOffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemCellLayout setItemOffer:](v12, "setItemOffer:", v13);

  -[SKUIItemCellLayout itemOfferButton](self->_layout, "itemOfferButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUniversal:", SKUIItemDeviceFamilyIsUniversal(objc_msgSend(v8, "deviceFamilies")));

  -[SKUIItemBrowseCellLayout setNumberOfUserRatings:](self->_layout, "setNumberOfUserRatings:", objc_msgSend(v8, "numberOfUserRatings"));
  v15 = self->_layout;
  objc_msgSend(v8, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemBrowseCellLayout setTitle:](v15, "setTitle:", v16);

  v17 = self->_layout;
  objc_msgSend(v8, "userRating");
  -[SKUIItemBrowseCellLayout setUserRating:](v17, "setUserRating:", (float)(v18 / 5.0));
  if (objc_msgSend(v8, "hasInAppPurchases"))
  {
    objc_msgSend(v9, "valueForConfigurationKey:", CFSTR("inappnote"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  -[SKUIItemCellLayout setItemOfferNoticeString:](self->_layout, "setItemOfferNoticeString:", v19);
  v20 = objc_msgSend(v8, "itemKind");
  v21 = self->_layout;
  if (v20 == 17)
    SKUILockupItemCountString(v8, v9);
  else
    objc_msgSend(v8, "categoryName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemBrowseCellLayout setSubtitle:](v21, "setSubtitle:", v22);

  v23.receiver = self;
  v23.super_class = (Class)SKUIItemBrowseTableViewCell;
  -[SKUIItemTableViewCell configureForItem:clientContext:rowIndex:](&v23, sel_configureForItem_clientContext_rowIndex_, v8, v9, a5);

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
  v1 = "-[SKUIItemBrowseTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
