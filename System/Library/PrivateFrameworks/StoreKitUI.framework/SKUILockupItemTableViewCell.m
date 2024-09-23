@implementation SKUILockupItemTableViewCell

- (SKUILockupItemTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUILockupItemTableViewCell *v7;
  SKUILockupItemCellLayout *v8;
  SKUILockupItemCellLayout *layout;
  objc_super v11;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupItemTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUILockupItemTableViewCell;
  v7 = -[SKUITableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = -[SKUILockupItemCellLayout initWithTableViewCell:]([SKUILockupItemCellLayout alloc], "initWithTableViewCell:", v7);
    layout = v7->_layout;
    v7->_layout = v8;

  }
  return v7;
}

- (void)configureForItem:(id)a3 clientContext:(id)a4 rowIndex:(int64_t)a5
{
  SKUILockupItemCellLayout *layout;
  id v9;
  id v10;
  void *v11;
  SKUILockupItemCellLayout *v12;
  void *v13;
  SKUILockupItemCellLayout *v14;
  void *v15;
  SKUILockupItemCellLayout *v16;
  void *v17;
  SKUILockupItemCellLayout *v18;
  objc_super v19;

  layout = self->_layout;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "categoryName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupItemCellLayout setCategoryString:](layout, "setCategoryString:", v11);

  v12 = self->_layout;
  SKUILockupItemCountString(v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupItemCellLayout setItemCountString:](v12, "setItemCountString:", v13);

  v14 = self->_layout;
  objc_msgSend(v10, "primaryItemOffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIItemCellLayout setItemOffer:](v14, "setItemOffer:", v15);

  -[SKUILockupItemCellLayout setNumberOfUserRatings:](self->_layout, "setNumberOfUserRatings:", objc_msgSend(v10, "numberOfUserRatings"));
  v16 = self->_layout;
  objc_msgSend(v10, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupItemCellLayout setTitle:](v16, "setTitle:", v17);

  v18 = self->_layout;
  objc_msgSend(v10, "userRating");
  -[SKUILockupItemCellLayout setUserRating:](v18, "setUserRating:");
  v19.receiver = self;
  v19.super_class = (Class)SKUILockupItemTableViewCell;
  -[SKUIItemTableViewCell configureForItem:clientContext:rowIndex:](&v19, sel_configureForItem_clientContext_rowIndex_, v10, v9, a5);

}

- (SKUILockupItemCellLayout)layout
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
  v1 = "-[SKUILockupItemTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
