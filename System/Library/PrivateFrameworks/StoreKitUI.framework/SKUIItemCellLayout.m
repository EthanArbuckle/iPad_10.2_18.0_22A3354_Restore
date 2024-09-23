@implementation SKUIItemCellLayout

- (void)dealloc
{
  objc_super v3;

  -[SKUIItemOfferButton removeTarget:action:forControlEvents:](self->_itemOfferButton, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[SKUIItemOfferButton setDelegate:](self->_itemOfferButton, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIItemCellLayout;
  -[SKUIItemCellLayout dealloc](&v3, sel_dealloc);
}

- (BOOL)displaysItemOfferButton
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIItemCellLayout displaysItemOfferButton].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return !self->_hidesItemOfferButton;
}

- (UIImage)iconImage
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIItemCellLayout iconImage].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUICellImageView image](self->_iconImageView, "image");
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)itemOfferNoticeString
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIItemCellLayout itemOfferNoticeString].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_itemOfferNoticeLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)resetLayout
{
  OUTLINED_FUNCTION_1();
}

- (void)setDisplaysItemOfferButton:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemCellLayout setDisplaysItemOfferButton:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_hidesItemOfferButton == v3)
  {
    self->_hidesItemOfferButton = !v3;
    -[SKUIItemCellLayout _reloadItemOfferButton:](self, "_reloadItemOfferButton:", 0);
  }
}

- (void)setIconImage:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  SKUICellImageView *iconImageView;
  SKUICellImageView *v15;
  SKUICellImageView *v16;
  SKUICellImageView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  SKUICellImageView *v29;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemCellLayout setIconImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUICellImageView image](self->_iconImageView, "image");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v4)
  {
    iconImageView = self->_iconImageView;
    if (!v4)
    {
      -[SKUICellImageView removeFromSuperview](iconImageView, "removeFromSuperview");
      v29 = self->_iconImageView;
      self->_iconImageView = 0;

      goto LABEL_15;
    }
    if (!iconImageView)
    {
      v15 = objc_alloc_init(SKUICellImageView);
      v16 = self->_iconImageView;
      self->_iconImageView = v15;

      v17 = self->_iconImageView;
      -[SKUICellLayout parentCellView](self, "parentCellView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "backgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUICellImageView setBackgroundColor:](v17, "setBackgroundColor:", v19);

      -[SKUICellImageView setHidden:](self->_iconImageView, "setHidden:", -[SKUIItemCellLayout isIconImageHidden](self, "isIconImageHidden"));
      -[SKUICellLayout contentView](self, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "insertSubview:atIndex:", self->_iconImageView, 0);

      iconImageView = self->_iconImageView;
    }
    -[SKUICellImageView image](iconImageView, "image");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v23 = v22;
    v25 = v24;

    -[SKUICellImageView setImage:](self->_iconImageView, "setImage:", v4);
    objc_msgSend(v4, "size");
    if (v23 != v27 || v25 != v26)
    {
      -[SKUICellImageView sizeToFit](self->_iconImageView, "sizeToFit");
LABEL_15:
      -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setIconImageHidden:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemCellLayout setIconImageHidden:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_iconImageHidden != v3)
  {
    self->_iconImageHidden = v3;
    -[SKUICellImageView setHidden:](self->_iconImageView, "setHidden:", v3);
  }
}

- (void)setItemOffer:(id)a3
{
  SKUIItemOffer *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (SKUIItemOffer *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIItemCellLayout setItemOffer:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_itemOffer == v5)
  {
    -[SKUIItemCellLayout _reloadItemOfferVisibility](self, "_reloadItemOfferVisibility");
  }
  else
  {
    objc_storeStrong((id *)&self->_itemOffer, a3);
    -[SKUIItemCellLayout _reloadItemOfferButton:](self, "_reloadItemOfferButton:", 0);
  }

}

- (void)setItemOfferButtonAppearance:(id)a3
{
  SKUIItemOfferButtonAppearance *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (SKUIItemOfferButtonAppearance *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIItemCellLayout setItemOfferButtonAppearance:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if (self->_itemOfferButtonAppearance != v5)
  {
    objc_storeStrong((id *)&self->_itemOfferButtonAppearance, a3);
    -[SKUIItemOfferButton setColoringWithAppearance:](self->_itemOfferButton, "setColoringWithAppearance:", self->_itemOfferButtonAppearance);
  }

}

- (void)setItemOfferNoticeString:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  UILabel *itemOfferNoticeLabel;
  UILabel *v15;
  UILabel *v16;
  UILabel *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  void *v22;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemCellLayout setItemOfferNoticeString:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UILabel text](self->_itemOfferNoticeLabel, "text");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v4)
  {
    itemOfferNoticeLabel = self->_itemOfferNoticeLabel;
    if (v4)
    {
      if (!itemOfferNoticeLabel)
      {
        v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v16 = self->_itemOfferNoticeLabel;
        self->_itemOfferNoticeLabel = v15;

        v17 = self->_itemOfferNoticeLabel;
        -[SKUICellLayout parentCellView](self, "parentCellView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "backgroundColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v19);

        v20 = self->_itemOfferNoticeLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 7.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v20, "setFont:", v21);

        -[UILabel setNumberOfLines:](self->_itemOfferNoticeLabel, "setNumberOfLines:", 3);
        -[UILabel setTextAlignment:](self->_itemOfferNoticeLabel, "setTextAlignment:", 1);
        -[SKUICellLayout contentView](self, "contentView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSubview:", self->_itemOfferNoticeLabel);

        itemOfferNoticeLabel = self->_itemOfferNoticeLabel;
      }
      -[UILabel setText:](itemOfferNoticeLabel, "setText:", v4);
      -[UILabel setHidden:](self->_itemOfferNoticeLabel, "setHidden:", -[SKUIItemCellLayout _canShowItemOfferNotice](self, "_canShowItemOfferNotice") ^ 1);
      -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UILabel setHidden:](itemOfferNoticeLabel, "setHidden:", 1);
      -[UILabel setText:](self->_itemOfferNoticeLabel, "setText:", 0);
    }
  }

}

- (void)setItemState:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemCellLayout setItemState:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIItemCellLayout setItemState:animated:](self, "setItemState:animated:", v4, 0);

}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SKUIItemState *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKUIItemState *v15;
  SKUIItemState *itemState;

  v4 = a4;
  v6 = (SKUIItemState *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIItemCellLayout setItemState:animated:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  if (self->_itemState == v6)
  {
    -[SKUIItemCellLayout _reloadItemOfferVisibility](self, "_reloadItemOfferVisibility");
  }
  else
  {
    v15 = (SKUIItemState *)-[SKUIItemState copy](v6, "copy");
    itemState = self->_itemState;
    self->_itemState = v15;

    -[SKUIItemCellLayout _reloadItemOfferButton:](self, "_reloadItemOfferButton:", v4);
  }

}

- (void)setRestricted:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemCellLayout setRestricted:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_restricted != v3)
  {
    self->_restricted = v3;
    -[SKUIItemCellLayout _reloadItemOfferButton:](self, "_reloadItemOfferButton:", 0);
  }
}

- (void)prepareForReuse
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemCellLayout setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUICellImageView setBackgroundColor:](self->_iconImageView, "setBackgroundColor:", v4);
  -[SKUIItemOfferButton setBackgroundColor:](self->_itemOfferButton, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_itemOfferNoticeLabel, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIItemCellLayout;
  -[SKUICellLayout setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIItemCellLayout itemOfferButtonWillAnimateTransition:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  -[UILabel setHidden:](self->_itemOfferNoticeLabel, "setHidden:", -[SKUIItemCellLayout _canShowItemOfferNotice](self, "_canShowItemOfferNotice") ^ 1);
  -[SKUIItemCellLayout layoutForItemOfferChange](self, "layoutForItemOfferChange");
}

- (void)_cancelItemOfferConfirmationAction:(id)a3
{
  -[SKUIItemOfferButton setShowingConfirmation:animated:](self->_itemOfferButton, "setShowingConfirmation:animated:", 0, 1);
}

- (void)_itemOfferConfirmAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v10 = 0;
  v11 = 0;
  -[SKUIItemCellLayout _getParentTableView:collectionView:](self, "_getParentTableView:collectionView:", &v11, &v10);
  v4 = v11;
  v5 = v10;
  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SKUICellLayout parentCellView](self, "parentCellView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemTableView:didConfirmItemOfferForTableViewCell:", v4, v7);

  }
  objc_msgSend(v5, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SKUIItemCellLayout _parentCollectionViewCell](self, "_parentCollectionViewCell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemCollectionView:didConfirmItemOfferForCell:", v5, v9);

  }
}

- (void)_showItemOfferConfirmationAction:(id)a3
{
  void *v4;

  -[SKUIItemOfferButton superview](self->_itemOfferButton, "superview", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", self->_itemOfferButton);

  -[SKUIItemOfferButton setShowingConfirmation:animated:](self->_itemOfferButton, "setShowingConfirmation:animated:", 1, 1);
}

- (BOOL)_canShowItemOfferNotice
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;

  -[UILabel text](self->_itemOfferNoticeLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
LABEL_4:
    LOBYTE(v5) = 0;
    return v5;
  }
  v5 = -[SKUIItemCellLayout displaysItemOfferButton](self, "displaysItemOfferButton");
  if (v5)
  {
    if (!-[SKUIItemCellLayout isRestricted](self, "isRestricted"))
    {
      -[SKUIItemCellLayout itemState](self, "itemState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "state");

      LOBYTE(v5) = (v7 & 0xFFFFFFFFFFFFFFEFLL) == 0;
      return v5;
    }
    goto LABEL_4;
  }
  return v5;
}

- (void)_getParentTableView:(id *)a3 collectionView:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  -[SKUICellLayout parentCellView](self, "parentCellView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = 0;
        v9 = v7;
      }
      else
      {
        objc_opt_class();
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v8 = v7;
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_7;
      }
      v12 = v7;
      v10 = v8;
      v11 = v9;
LABEL_7:
      objc_msgSend(v7, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11 && !v10)
      {
        v7 = v13;
        if (v13)
          continue;
      }
      goto LABEL_12;
    }
  }
  v10 = 0;
  v11 = 0;
  v13 = 0;
LABEL_12:
  if (a4)
    *a4 = objc_retainAutorelease(v10);
  if (a3)
    *a3 = objc_retainAutorelease(v11);

}

- (id)_parentCollectionViewCell
{
  void *v2;
  uint64_t v3;

  -[SKUICellLayout parentCellView](self, "parentCellView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)_reloadItemOfferButton:(BOOL)a3
{
  _BOOL8 v4;
  SKUIItemOfferButton *itemOfferButton;
  SKUIItemOfferButton *v6;
  SKUIItemOfferButton *v7;
  SKUIItemOfferButton *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  SKUIItemOfferButton *v14;
  SKUIItemOffer *itemOffer;
  void *v16;
  _BOOL4 v17;

  if (!self->_itemOffer
    || self->_hidesItemOfferButton
    || (v4 = a3, -[SKUIItemCellLayout isRestricted](self, "isRestricted")))
  {
    -[SKUIItemOfferButton setHidden:](self->_itemOfferButton, "setHidden:", 1);
  }
  else
  {
    itemOfferButton = self->_itemOfferButton;
    if (!itemOfferButton)
    {
      +[SKUIItemOfferButton itemOfferButtonWithAppearance:](SKUIItemOfferButton, "itemOfferButtonWithAppearance:", self->_itemOfferButtonAppearance);
      v6 = (SKUIItemOfferButton *)objc_claimAutoreleasedReturnValue();
      v7 = self->_itemOfferButton;
      self->_itemOfferButton = v6;

      -[SKUIItemOfferButton addTarget:action:forControlEvents:](self->_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__cancelItemOfferConfirmationAction_, 0x10000);
      -[SKUIItemOfferButton addTarget:action:forControlEvents:](self->_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__itemOfferConfirmAction_, 0x20000);
      -[SKUIItemOfferButton addTarget:action:forControlEvents:](self->_itemOfferButton, "addTarget:action:forControlEvents:", self, sel__showItemOfferConfirmationAction_, 0x40000);
      v8 = self->_itemOfferButton;
      -[SKUICellLayout parentCellView](self, "parentCellView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemOfferButton setBackgroundColor:](v8, "setBackgroundColor:", v10);

      LODWORD(v11) = -0.5;
      -[SKUIItemOfferButton setCharge:](self->_itemOfferButton, "setCharge:", v11);
      -[SKUIItemOfferButton setDelegate:](self->_itemOfferButton, "setDelegate:", self);
      -[SKUICellLayout contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_itemOfferButton);

      itemOfferButton = self->_itemOfferButton;
    }
    -[SKUIItemOfferButton setHidden:](itemOfferButton, "setHidden:", 0);
    -[SKUIItemCellLayout itemState](self, "itemState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_itemOfferButton;
    itemOffer = self->_itemOffer;
    -[SKUICellLayout clientContext](self, "clientContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SKUIItemOfferButton setValuesUsingItemOffer:itemState:clientContext:animated:](v14, "setValuesUsingItemOffer:itemState:clientContext:animated:", itemOffer, v13, v16, v4);

    if (v17)
    {
      -[SKUIItemOfferButton sizeToFit](self->_itemOfferButton, "sizeToFit");
      -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
    }

  }
  -[UILabel setHidden:](self->_itemOfferNoticeLabel, "setHidden:", -[SKUIItemCellLayout _canShowItemOfferNotice](self, "_canShowItemOfferNotice") ^ 1);
}

- (void)_reloadItemOfferVisibility
{
  _BOOL8 v3;

  v3 = !self->_itemOffer || self->_hidesItemOfferButton || -[SKUIItemCellLayout isRestricted](self, "isRestricted");
  -[SKUIItemOfferButton setHidden:](self->_itemOfferButton, "setHidden:", v3);
  -[UILabel setHidden:](self->_itemOfferNoticeLabel, "setHidden:", -[SKUIItemCellLayout _canShowItemOfferNotice](self, "_canShowItemOfferNotice") ^ 1);
}

- (BOOL)_useCloudButtonForItemState:(id)a3
{
  return (objc_msgSend(a3, "state") & 0x2F) == 8;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)isIconImageHidden
{
  return self->_iconImageHidden;
}

- (UIView)iconImageView
{
  return &self->_iconImageView->super.super;
}

- (SKUIItemOffer)itemOffer
{
  return self->_itemOffer;
}

- (SKUIItemOfferButton)itemOfferButton
{
  return self->_itemOfferButton;
}

- (SKUIItemOfferButtonAppearance)itemOfferButtonAppearance
{
  return self->_itemOfferButtonAppearance;
}

- (UILabel)itemOfferNoticeLabel
{
  return self->_itemOfferNoticeLabel;
}

- (SKUIItemState)itemState
{
  return self->_itemState;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (UIView)removeControlView
{
  return self->_removeControlView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeControlView, 0);
  objc_storeStrong((id *)&self->_itemState, 0);
  objc_storeStrong((id *)&self->_itemOfferNoticeLabel, 0);
  objc_storeStrong((id *)&self->_itemOfferButtonAppearance, 0);
  objc_storeStrong((id *)&self->_itemOfferButton, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

- (void)displaysItemOfferButton
{
  OUTLINED_FUNCTION_1();
}

- (void)iconImage
{
  OUTLINED_FUNCTION_1();
}

- (void)itemOfferNoticeString
{
  OUTLINED_FUNCTION_1();
}

- (void)setDisplaysItemOfferButton:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setIconImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setIconImageHidden:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setItemOffer:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setItemOfferButtonAppearance:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setItemOfferNoticeString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setItemState:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setItemState:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setRestricted:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)itemOfferButtonWillAnimateTransition:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
