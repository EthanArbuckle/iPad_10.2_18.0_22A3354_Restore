@implementation SKUIBrickGridCollectionViewCell

- (void)applyEditorialLayout:(id)a3 orientation:(int64_t)a4
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
  UIView *editorialContainerView;
  UIView *v16;
  UIView *v17;
  UIView *v18;
  void *v19;
  void *v20;
  SKUIEditorialCellLayout *v21;
  SKUIEditorialCellLayout *editorialCellLayout;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIBrickGridCollectionViewCell applyEditorialLayout:orientation:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  editorialContainerView = self->_editorialContainerView;
  if (v6)
  {
    if (!editorialContainerView)
    {
      v16 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v17 = self->_editorialContainerView;
      self->_editorialContainerView = v16;

      v18 = self->_editorialContainerView;
      -[SKUIBrickGridCollectionViewCell backgroundColor](self, "backgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

      -[SKUIBrickGridCollectionViewCell contentView](self, "contentView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", self->_editorialContainerView);

      -[SKUIBrickGridCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    }
    if (!self->_editorialCellLayout)
    {
      v21 = -[SKUIEditorialCellLayout initWithParentView:]([SKUIEditorialCellLayout alloc], "initWithParentView:", self->_editorialContainerView);
      editorialCellLayout = self->_editorialCellLayout;
      self->_editorialCellLayout = v21;

      -[SKUIEditorialCellLayout setContentInset:](self->_editorialCellLayout, "setContentInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    }
    -[UIView setHidden:](self->_editorialContainerView, "setHidden:", 0);
  }
  else
  {
    -[UIView setHidden:](editorialContainerView, "setHidden:", 1);
  }
  -[SKUIEditorialCellLayout applyEditorialLayout:withOrientation:expanded:](self->_editorialCellLayout, "applyEditorialLayout:withOrientation:expanded:", v6, a4, 1);

}

- (UIImage)brickImage
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
        -[SKUIBrickGridCollectionViewCell brickImage].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UIImageView image](self->_brickImageView, "image");
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
        -[SKUIBrickGridCollectionViewCell setAccessibilityLabel:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_accessibilityLabel != v4)
  {
    v13 = (NSString *)-[NSString copy](v4, "copy");
    accessibilityLabel = self->_accessibilityLabel;
    self->_accessibilityLabel = v13;

    -[UIImageView setAccessibilityLabel:](self->_brickImageView, "setAccessibilityLabel:", v4);
  }

}

- (void)setBrickImage:(id)a3
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
  UIImageView *brickImageView;
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
        -[SKUIBrickGridCollectionViewCell setBrickImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIBrickGridCollectionViewCell brickImage](self, "brickImage");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v4)
  {
    brickImageView = self->_brickImageView;
    if (v4)
    {
      if (!brickImageView)
      {
        v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v16 = self->_brickImageView;
        self->_brickImageView = v15;

        -[UIImageView setAccessibilityLabel:](self->_brickImageView, "setAccessibilityLabel:", self->_accessibilityLabel);
        v17 = self->_brickImageView;
        -[SKUIBrickGridCollectionViewCell backgroundColor](self, "backgroundColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v17, "setBackgroundColor:", v18);

        -[SKUIBrickGridCollectionViewCell contentView](self, "contentView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSubview:", self->_brickImageView);

        -[SKUIBrickGridCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
        brickImageView = self->_brickImageView;
      }
      -[UIImageView setImage:](brickImageView, "setImage:", v4);
      -[UIImageView sizeToFit](self->_brickImageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](brickImageView, "removeFromSuperview");
      v20 = self->_brickImageView;
      self->_brickImageView = 0;

    }
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

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIBrickGridCollectionViewCell setColoringWithColorScheme:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIEditorialCellLayout setColoringWithColorScheme:](self->_editorialCellLayout, "setColoringWithColorScheme:", v4);

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
        -[SKUIBrickGridCollectionViewCell setContentInsets:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
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
    -[SKUIBrickGridCollectionViewCell setNeedsLayout](self, "setNeedsLayout", v16);
  }
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
        -[SKUIBrickGridCollectionViewCell setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UIImageView setBackgroundColor:](self->_brickImageView, "setBackgroundColor:", v4);
  -[SKUIEditorialCellLayout setBackgroundColor:](self->_editorialCellLayout, "setBackgroundColor:", v4);
  -[UIView setBackgroundColor:](self->_editorialContainerView, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIBrickGridCollectionViewCell;
  -[SKUIBrickGridCollectionViewCell setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialContainerView, 0);
  objc_storeStrong((id *)&self->_editorialCellLayout, 0);
  objc_storeStrong((id *)&self->_brickImageView, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

- (void)applyEditorialLayout:(uint64_t)a3 orientation:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)brickImage
{
  OUTLINED_FUNCTION_1();
}

- (void)setAccessibilityLabel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setBrickImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
