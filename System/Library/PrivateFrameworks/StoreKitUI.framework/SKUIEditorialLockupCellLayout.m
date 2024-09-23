@implementation SKUIEditorialLockupCellLayout

+ (double)editorialWidthForCellWidth:(double)a3 lockupStyle:(SKUILockupStyle *)a4
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUIEditorialLockupCellLayout editorialWidthForCellWidth:lockupStyle:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  if (!SKUILockupLayoutStyleIsHorizontal(a4->layoutStyle))
  {
    v15 = SKUILockupImageSizeForLockupSize(a4->artworkSize, 12);
    objc_msgSend(a1, "_imagePaddingForArtworkSize:", a4->artworkSize);
    return a3 - (v15 + v16) + -15.0;
  }
  return a3;
}

- (void)applyEditorialLayout:(id)a3 withOrientation:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIEditorialLockupCellLayout applyEditorialLayout:withOrientation:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(v6, "bodyTextLayoutForOrientation:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "linkLayoutForOrientation:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleTextLayoutForOrientation:", a4);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v15 || v16 || v17)
  {
    -[SKUIEditorialLockupCellLayout _editorialContainerView](self, "_editorialContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 0);

  }
  else
  {
    -[UIView setHidden:](self->_editorialContainerView, "setHidden:", 1);
  }
  -[SKUIEditorialLockupCellLayout _editorialCellLayout](self, "_editorialCellLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "applyEditorialLayout:withOrientation:expanded:", v6, a4, 1);

  objc_msgSend(v6, "layoutHeightForOrientation:expanded:", a4, 1);
  self->_editorialHeight = v21;
  -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");

}

- (SKUILockupItemCellLayout)lockupCellLayout
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEditorialLockupCellLayout lockupCellLayout].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIEditorialLockupCellLayout _lockupView](self, "_lockupView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKUILockupItemCellLayout *)v12;
}

- (void)setColoringWithColorScheme:(id)a3
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
  UIColor *v13;
  UIColor *offerNoticeTextColor;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorialLockupCellLayout setColoringWithColorScheme:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "primaryTextColor");
  v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
  offerNoticeTextColor = self->_offerNoticeTextColor;
  self->_offerNoticeTextColor = v13;

  -[SKUIItemCellLayout itemOfferNoticeLabel](self, "itemOfferNoticeLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (self->_offerNoticeTextColor)
  {
    objc_msgSend(v15, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v17);

  }
  -[SKUIEditorialLockupCellLayout _editorialCellLayout](self, "_editorialCellLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setColoringWithColorScheme:", v4);

  -[SKUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setColoringWithColorScheme:", v4);

}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIEditorialLockupCellLayout setContentInsets:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = self->_contentInsets.top;
  if (self->_contentInsets.left != left
    || v16 != top
    || self->_contentInsets.right != right
    || self->_contentInsets.bottom != bottom)
  {
    self->_contentInsets.top = top;
    self->_contentInsets.left = left;
    self->_contentInsets.bottom = bottom;
    self->_contentInsets.right = right;
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout", v16);
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  SKUILockupItemCellLayout *lockupLayout;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SKUILockupItemCellLayout *v19;
  void *v20;
  SKUILockupItemCellLayout *v21;
  void *v22;
  objc_super v23;
  objc_super v24;
  objc_super v25;
  objc_super v26;
  objc_super v27;
  objc_super v28;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorialLockupCellLayout setLayoutStyle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[SKUILockupItemCellLayout setLayoutStyle:](self->_lockupLayout, "setLayoutStyle:", a3);
    v13 = -[SKUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial");
    lockupLayout = self->_lockupLayout;
    if (v13)
    {
      -[SKUIItemCellLayout itemOffer](self->_lockupLayout, "itemOffer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28.receiver = self;
      v28.super_class = (Class)SKUIEditorialLockupCellLayout;
      -[SKUIItemCellLayout setItemOffer:](&v28, sel_setItemOffer_, v15);

      -[SKUIItemCellLayout itemOfferNoticeString](self->_lockupLayout, "itemOfferNoticeString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27.receiver = self;
      v27.super_class = (Class)SKUIEditorialLockupCellLayout;
      -[SKUIItemCellLayout setItemOfferNoticeString:](&v27, sel_setItemOfferNoticeString_, v16);

      -[SKUIItemCellLayout itemState](self->_lockupLayout, "itemState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26.receiver = self;
      v26.super_class = (Class)SKUIEditorialLockupCellLayout;
      -[SKUIItemCellLayout setItemState:](&v26, sel_setItemState_, v17);

      -[SKUIItemCellLayout setItemOffer:](self->_lockupLayout, "setItemOffer:", 0);
      -[SKUIItemCellLayout setItemOfferNoticeString:](self->_lockupLayout, "setItemOfferNoticeString:", 0);
      -[SKUIItemCellLayout setItemState:](self->_lockupLayout, "setItemState:", 0);
    }
    else
    {
      -[SKUIEditorialLockupCellLayout itemOffer](self, "itemOffer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemCellLayout setItemOffer:](lockupLayout, "setItemOffer:", v18);

      v19 = self->_lockupLayout;
      -[SKUIEditorialLockupCellLayout itemOfferNoticeString](self, "itemOfferNoticeString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemCellLayout setItemOfferNoticeString:](v19, "setItemOfferNoticeString:", v20);

      v21 = self->_lockupLayout;
      -[SKUIEditorialLockupCellLayout itemState](self, "itemState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIItemCellLayout setItemState:](v21, "setItemState:", v22);

      v25.receiver = self;
      v25.super_class = (Class)SKUIEditorialLockupCellLayout;
      -[SKUIItemCellLayout setItemOffer:](&v25, sel_setItemOffer_, 0);
      v24.receiver = self;
      v24.super_class = (Class)SKUIEditorialLockupCellLayout;
      -[SKUIItemCellLayout setItemOfferNoticeString:](&v24, sel_setItemOfferNoticeString_, 0);
      v23.receiver = self;
      v23.super_class = (Class)SKUIEditorialLockupCellLayout;
      -[SKUIItemCellLayout setItemState:](&v23, sel_setItemState_, 0);
    }
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVisibleFields:(unint64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorialLockupCellLayout setVisibleFields:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_visibleFields != a3)
  {
    self->_visibleFields = a3;
    -[SKUILockupItemCellLayout setVisibleFields:](self->_lockupLayout, "setVisibleFields:", a3);
    -[SKUICellLayout setNeedsLayout](self, "setNeedsLayout");
  }
}

- (SKUITextBoxView)textBoxView
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEditorialLockupCellLayout textBoxView].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIEditorialLockupCellLayout _editorialCellLayout](self, "_editorialCellLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textBoxView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKUITextBoxView *)v12;
}

- (void)layoutSubviews
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
        -[SKUIEditorialLockupCellLayout setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIEditorialCellLayout setBackgroundColor:](self->_editorialCellLayout, "setBackgroundColor:", v4);
  -[UIView setBackgroundColor:](self->_editorialContainerView, "setBackgroundColor:", v4);
  -[SKUICellLayoutView setBackgroundColor:](self->_lockupView, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIEditorialLockupCellLayout;
  -[SKUIItemCellLayout setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (id)iconImage
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
        -[SKUIEditorialLockupCellLayout iconImage].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIItemCellLayout iconImage](self->_lockupLayout, "iconImage");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)iconImageView
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
        -[SKUIEditorialLockupCellLayout iconImageView].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUIItemCellLayout iconImageView](self->_lockupLayout, "iconImageView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isIconImageHidden
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
        -[SKUIEditorialLockupCellLayout isIconImageHidden].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return -[SKUIItemCellLayout isIconImageHidden](self->_lockupLayout, "isIconImageHidden");
}

- (id)itemOffer
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEditorialLockupCellLayout itemOffer].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  if (-[SKUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial"))
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIEditorialLockupCellLayout;
    -[SKUIItemCellLayout itemOffer](&v13, sel_itemOffer);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKUIItemCellLayout itemOffer](self->_lockupLayout, "itemOffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)itemOfferNoticeString
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEditorialLockupCellLayout itemOfferNoticeString].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  if (-[SKUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial"))
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIEditorialLockupCellLayout;
    -[SKUIItemCellLayout itemOfferNoticeString](&v13, sel_itemOfferNoticeString);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKUIItemCellLayout itemOfferNoticeString](self->_lockupLayout, "itemOfferNoticeString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)itemState
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEditorialLockupCellLayout itemState].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  if (SKUILockupLayoutStyleIsHorizontal(self->_layoutStyle))
  {
    -[SKUIItemCellLayout itemState](self->_lockupLayout, "itemState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIEditorialLockupCellLayout;
    -[SKUIItemCellLayout itemState](&v13, sel_itemState);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (void)layoutForItemOfferChange
{
  OUTLINED_FUNCTION_1();
}

- (void)setClientContext:(id)a3
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
        -[SKUIEditorialLockupCellLayout setClientContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUILockupItemCellLayout setClientContext:](self->_lockupLayout, "setClientContext:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIEditorialLockupCellLayout;
  -[SKUICellLayout setClientContext:](&v13, sel_setClientContext_, v4);

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
  void *v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorialLockupCellLayout setIconImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIconImage:", v4);

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
  void *v13;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorialLockupCellLayout setIconImageHidden:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIconImageHidden:", v3);

}

- (void)setItemOffer:(id)a3
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
  void *v13;
  objc_super v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorialLockupCellLayout setItemOffer:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (-[SKUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial"))
  {
    v14.receiver = self;
    v14.super_class = (Class)SKUIEditorialLockupCellLayout;
    -[SKUIItemCellLayout setItemOffer:](&v14, sel_setItemOffer_, v4);
  }
  else
  {
    -[SKUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItemOffer:", v4);

  }
}

- (void)setItemOfferButtonAppearance:(id)a3
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
  void *v13;
  objc_super v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorialLockupCellLayout setItemOfferButtonAppearance:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setItemOfferButtonAppearance:", v4);

  v14.receiver = self;
  v14.super_class = (Class)SKUIEditorialLockupCellLayout;
  -[SKUIItemCellLayout setItemOfferButtonAppearance:](&v14, sel_setItemOfferButtonAppearance_, v4);

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
  void *v13;
  objc_super v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorialLockupCellLayout setItemOfferNoticeString:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (-[SKUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial"))
  {
    v14.receiver = self;
    v14.super_class = (Class)SKUIEditorialLockupCellLayout;
    -[SKUIItemCellLayout setItemOfferNoticeString:](&v14, sel_setItemOfferNoticeString_, v4);
  }
  else
  {
    -[SKUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItemOfferNoticeString:", v4);

  }
}

- (void)setItemState:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v4 = a4;
  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIEditorialLockupCellLayout setItemState:animated:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  if (-[SKUIEditorialLockupCellLayout _showsItemOfferUnderEditorial](self, "_showsItemOfferUnderEditorial"))
  {
    v16.receiver = self;
    v16.super_class = (Class)SKUIEditorialLockupCellLayout;
    -[SKUIItemCellLayout setItemState:animated:](&v16, sel_setItemState_animated_, v6, v4);
  }
  else
  {
    -[SKUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setItemState:animated:", v6, v4);

  }
}

- (void)setRestricted:(BOOL)a3
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
  void *v13;
  objc_super v14;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEditorialLockupCellLayout setRestricted:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIEditorialLockupCellLayout lockupCellLayout](self, "lockupCellLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRestricted:", v3);

  v14.receiver = self;
  v14.super_class = (Class)SKUIEditorialLockupCellLayout;
  -[SKUIItemCellLayout setRestricted:](&v14, sel_setRestricted_, v3);
}

- (id)_editorialCellLayout
{
  SKUIEditorialCellLayout *editorialCellLayout;
  SKUIEditorialCellLayout *v4;
  void *v5;
  SKUIEditorialCellLayout *v6;
  SKUIEditorialCellLayout *v7;
  SKUIEditorialCellLayout *v8;
  void *v9;
  void *v10;

  editorialCellLayout = self->_editorialCellLayout;
  if (!editorialCellLayout)
  {
    v4 = [SKUIEditorialCellLayout alloc];
    -[SKUIEditorialLockupCellLayout _editorialContainerView](self, "_editorialContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SKUIEditorialCellLayout initWithParentView:](v4, "initWithParentView:", v5);
    v7 = self->_editorialCellLayout;
    self->_editorialCellLayout = v6;

    v8 = self->_editorialCellLayout;
    -[SKUICellLayout parentCellView](self, "parentCellView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIEditorialCellLayout setBackgroundColor:](v8, "setBackgroundColor:", v10);

    -[SKUIEditorialCellLayout setContentInset:](self->_editorialCellLayout, "setContentInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    editorialCellLayout = self->_editorialCellLayout;
  }
  return editorialCellLayout;
}

- (id)_editorialContainerView
{
  UIView *editorialContainerView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;

  editorialContainerView = self->_editorialContainerView;
  if (!editorialContainerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_editorialContainerView;
    self->_editorialContainerView = v4;

    v6 = self->_editorialContainerView;
    -[SKUICellLayout parentCellView](self, "parentCellView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v8);

    -[SKUICellLayout contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_editorialContainerView);

    editorialContainerView = self->_editorialContainerView;
  }
  return editorialContainerView;
}

+ (double)_imagePaddingForArtworkSize:(int64_t)a3
{
  double result;

  result = 10.0;
  if ((unint64_t)(a3 - 3) < 3)
    return 15.0;
  return result;
}

- (BOOL)_isItemOfferButtonHidden
{
  BOOL v3;
  void *v4;
  objc_super v6;

  if (!-[SKUIItemCellLayout displaysItemOfferButton](self, "displaysItemOfferButton")
    || (-[SKUIEditorialLockupCellLayout visibleFields](self, "visibleFields") & 4) == 0)
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIEditorialLockupCellLayout;
  -[SKUIItemCellLayout itemOffer](&v6, sel_itemOffer);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v3 = -[SKUIItemCellLayout isRestricted](self, "isRestricted");
  else
    v3 = 1;

  return v3;
}

- (id)_lockupView
{
  SKUICellLayoutView *lockupView;
  SKUICellLayoutView *v4;
  SKUICellLayoutView *v5;
  SKUILockupItemCellLayout *v6;
  SKUILockupItemCellLayout *lockupLayout;
  SKUILockupItemCellLayout *v8;
  void *v9;
  SKUICellLayoutView *v10;
  void *v11;
  void *v12;
  void *v13;

  lockupView = self->_lockupView;
  if (!lockupView)
  {
    v4 = objc_alloc_init(SKUICellLayoutView);
    v5 = self->_lockupView;
    self->_lockupView = v4;

    v6 = -[SKUILockupItemCellLayout initWithParentView:]([SKUILockupItemCellLayout alloc], "initWithParentView:", self->_lockupView);
    lockupLayout = self->_lockupLayout;
    self->_lockupLayout = v6;

    v8 = self->_lockupLayout;
    -[SKUICellLayout clientContext](self, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUILockupItemCellLayout setClientContext:](v8, "setClientContext:", v9);

    -[SKUILockupItemCellLayout setLayoutStyle:](self->_lockupLayout, "setLayoutStyle:", self->_layoutStyle);
    -[SKUILockupItemCellLayout setVisibleFields:](self->_lockupLayout, "setVisibleFields:", self->_visibleFields);
    -[SKUICellLayoutView setLayout:](self->_lockupView, "setLayout:", self->_lockupLayout);
    v10 = self->_lockupView;
    -[SKUICellLayout parentCellView](self, "parentCellView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICellLayoutView setBackgroundColor:](v10, "setBackgroundColor:", v12);

    -[SKUICellLayout contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_lockupView);

    lockupView = self->_lockupView;
  }
  return lockupView;
}

- (BOOL)_showsItemOfferUnderEditorial
{
  return self->_layoutStyle == 3;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (unint64_t)visibleFields
{
  return self->_visibleFields;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textBoxView, 0);
  objc_storeStrong((id *)&self->_offerNoticeTextColor, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_lockupLayout, 0);
  objc_storeStrong((id *)&self->_editorialContainerView, 0);
  objc_storeStrong((id *)&self->_editorialCellLayout, 0);
}

+ (void)editorialWidthForCellWidth:(uint64_t)a3 lockupStyle:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)applyEditorialLayout:(uint64_t)a3 withOrientation:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)lockupCellLayout
{
  OUTLINED_FUNCTION_1();
}

- (void)setColoringWithColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setContentInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setLayoutStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setVisibleFields:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)textBoxView
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)iconImage
{
  OUTLINED_FUNCTION_1();
}

- (void)iconImageView
{
  OUTLINED_FUNCTION_1();
}

- (void)isIconImageHidden
{
  OUTLINED_FUNCTION_1();
}

- (void)itemOffer
{
  OUTLINED_FUNCTION_1();
}

- (void)itemOfferNoticeString
{
  OUTLINED_FUNCTION_1();
}

- (void)itemState
{
  OUTLINED_FUNCTION_1();
}

- (void)setClientContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

- (void)setItemState:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setRestricted:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
