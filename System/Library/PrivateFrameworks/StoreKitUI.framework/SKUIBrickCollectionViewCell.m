@implementation SKUIBrickCollectionViewCell

- (SKUICountdown)countdown
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
        -[SKUIBrickCollectionViewCell countdown].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[SKUICountdownView countdown](self->_countdownView, "countdown");
  return (SKUICountdown *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIImage)itemImage
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIBrickCollectionViewCell itemImage].cold.1();
  }
  -[UIImageView image](self->_itemImageView, "image");
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setAccessibilityLabel:(id)a3
{
  NSString *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  NSString *accessibilityLabel;

  v4 = (NSString *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBrickCollectionViewCell setAccessibilityLabel:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_accessibilityLabel != v4)
  {
    v13 = (NSString *)-[NSString copy](v4, "copy");
    accessibilityLabel = self->_accessibilityLabel;
    self->_accessibilityLabel = v13;

    -[UIImageView setAccessibilityLabel:](self->_itemImageView, "setAccessibilityLabel:", self->_accessibilityLabel);
  }

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
  UIColor **p_titleColor;
  UIColor *titleColor;
  UILabel *titleLabel;
  void *v17;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBrickCollectionViewCell setColoringWithColorScheme:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "primaryTextColor");
  v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
  p_titleColor = &self->_titleColor;
  titleColor = self->_titleColor;
  if (v13 != titleColor && (-[UIColor isEqual:](titleColor, "isEqual:", v13) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, v13);
    titleLabel = self->_titleLabel;
    if (*p_titleColor)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v17);

    }
  }

}

- (void)setCountdown:(id)a3
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
  SKUICountdownView *countdownView;
  SKUICountdownView *v15;
  SKUICountdownView *v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBrickCollectionViewCell setCountdown:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUICountdownView countdown](self->_countdownView, "countdown");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v4)
  {
    -[SKUICountdownView removeFromSuperview](self->_countdownView, "removeFromSuperview");
    countdownView = self->_countdownView;
    self->_countdownView = 0;

    if (v4)
    {
      v15 = -[SKUICountdownView initWithCountdown:clientContext:]([SKUICountdownView alloc], "initWithCountdown:clientContext:", v4, self->_clientContext);
      v16 = self->_countdownView;
      self->_countdownView = v15;

      -[SKUICountdownView sizeToFit](self->_countdownView, "sizeToFit");
      -[SKUIBrickCollectionViewCell addSubview:](self, "addSubview:", self->_countdownView);
      -[SKUIBrickCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setHighlighted:(BOOL)a3
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
  objc_super v13;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBrickCollectionViewCell setHighlighted:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIBrickCollectionViewCell;
  -[SKUIBrickCollectionViewCell setHighlighted:](&v13, sel_setHighlighted_, v3);
  -[SKUIBrickCollectionViewCell _reloadHighlight](self, "_reloadHighlight");
}

- (void)setSelected:(BOOL)a3
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
  objc_super v13;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBrickCollectionViewCell setSelected:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIBrickCollectionViewCell;
  -[SKUIBrickCollectionViewCell setSelected:](&v13, sel_setSelected_, v3);
  -[SKUIBrickCollectionViewCell _reloadHighlight](self, "_reloadHighlight");
}

- (void)setItemImage:(id)a3
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
  UIImageView *itemImageView;
  UIImageView *v15;
  UIImageView *v16;
  UIImageView *v17;
  void *v18;
  void *v19;
  UIImageView *v20;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBrickCollectionViewCell setItemImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UIImageView image](self->_itemImageView, "image");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v4)
  {
    itemImageView = self->_itemImageView;
    if (v4)
    {
      if (!itemImageView)
      {
        v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v16 = self->_itemImageView;
        self->_itemImageView = v15;

        -[UIImageView setAccessibilityLabel:](self->_itemImageView, "setAccessibilityLabel:", self->_accessibilityLabel);
        v17 = self->_itemImageView;
        -[SKUIBrickCollectionViewCell backgroundColor](self, "backgroundColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v17, "setBackgroundColor:", v18);

        -[UIImageView setHidden:](self->_itemImageView, "setHidden:", -[SKUIBrickCollectionViewCell isItemImageHidden](self, "isItemImageHidden"));
        -[SKUIBrickCollectionViewCell contentView](self, "contentView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSubview:", self->_itemImageView);

        itemImageView = self->_itemImageView;
      }
      -[UIImageView setImage:](itemImageView, "setImage:", v4);
      -[UIImageView sizeToFit](self->_itemImageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](itemImageView, "removeFromSuperview");
      v20 = self->_itemImageView;
      self->_itemImageView = 0;

    }
    -[SKUIBrickCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setItemImageHidden:(BOOL)a3
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
        -[SKUIBrickCollectionViewCell setItemImageHidden:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_itemImageHidden != v3)
  {
    self->_itemImageHidden = v3;
    -[UIImageView setHidden:](self->_itemImageView, "setHidden:", v3);
  }
}

- (void)setItemImageInsets:(UIEdgeInsets)a3
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
        -[SKUIBrickCollectionViewCell setItemImageInsets:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = self->_itemImageInsets.top;
  if (self->_itemImageInsets.left != left
    || v16 != top
    || self->_itemImageInsets.right != right
    || self->_itemImageInsets.bottom != bottom)
  {
    self->_itemImageInsets.top = top;
    self->_itemImageInsets.left = left;
    self->_itemImageInsets.bottom = bottom;
    self->_itemImageInsets.right = right;
    -[SKUIBrickCollectionViewCell setNeedsLayout](self, "setNeedsLayout", v16);
  }
}

- (void)setTitle:(id)a3
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
  UILabel *titleLabel;
  UILabel *v15;
  UILabel *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  UILabel *v22;
  void *v23;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBrickCollectionViewCell setTitle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIBrickCollectionViewCell title](self, "title");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v4 && (objc_msgSend(v4, "isEqualToString:", v13) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v4)
    {
      if (!titleLabel)
      {
        v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v16 = self->_titleLabel;
        self->_titleLabel = v15;

        v17 = self->_titleLabel;
        -[SKUIBrickCollectionViewCell backgroundColor](self, "backgroundColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

        v19 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v19, "setFont:", v20);

        v21 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v21, "setTextColor:", v23);

        }
        -[SKUIBrickCollectionViewCell addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:", v4);
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v22 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SKUIBrickCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
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
        -[SKUIBrickCollectionViewCell title].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_titleLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
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
        -[SKUIBrickCollectionViewCell setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UIImageView setBackgroundColor:](self->_itemImageView, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIBrickCollectionViewCell;
  -[SKUIBrickCollectionViewCell setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)_reloadHighlight
{
  UIImageView *v3;
  UIImageView *overlayImageView;
  UIImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  UIImageView *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];

  if ((-[SKUIBrickCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[SKUIBrickCollectionViewCell isSelected](self, "isSelected"))
  {
    if (!self->_overlayImageView)
    {
      v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      overlayImageView = self->_overlayImageView;
      self->_overlayImageView = v3;

      v5 = self->_overlayImageView;
      -[SKUIBrickCollectionViewCell backgroundColor](self, "backgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v5, "setBackgroundColor:", v6);

      -[SKUIBrickCollectionViewCell contentView](self, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_overlayImageView);

      -[SKUIBrickCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    }
    -[SKUICountdownView backgroundImage](self->_countdownView, "backgroundImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[UIImageView image](self->_itemImageView, "image");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v10;

    v11 = self->_overlayImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_flatImageWithColor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v11, "setImage:", v13);

    -[UIImageView setAlpha:](self->_overlayImageView, "setAlpha:", 0.3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__SKUIBrickCollectionViewCell__reloadHighlight__block_invoke;
    v15[3] = &unk_1E739FD38;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v15);
    -[UIImageView setAlpha:](self->_overlayImageView, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

uint64_t __47__SKUIBrickCollectionViewCell__reloadHighlight__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeOverlay");
}

- (void)_removeOverlay
{
  double v3;
  UIImageView *overlayImageView;

  -[UIImageView alpha](self->_overlayImageView, "alpha");
  if (v3 == 0.0)
  {
    -[UIImageView removeFromSuperview](self->_overlayImageView, "removeFromSuperview");
    overlayImageView = self->_overlayImageView;
    self->_overlayImageView = 0;

  }
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (BOOL)isItemImageHidden
{
  return self->_itemImageHidden;
}

- (UIEdgeInsets)itemImageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_itemImageInsets.top;
  left = self->_itemImageInsets.left;
  bottom = self->_itemImageInsets.bottom;
  right = self->_itemImageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)itemImageView
{
  return &self->_itemImageView->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_itemImageView, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

- (void)countdown
{
  OUTLINED_FUNCTION_1();
}

- (void)itemImage
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBrickCollectionViewCell itemImage]";
  OUTLINED_FUNCTION_1();
}

- (void)setAccessibilityLabel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setColoringWithColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setCountdown:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setHighlighted:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setSelected:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setItemImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setItemImageHidden:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setItemImageInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setTitle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)title
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
