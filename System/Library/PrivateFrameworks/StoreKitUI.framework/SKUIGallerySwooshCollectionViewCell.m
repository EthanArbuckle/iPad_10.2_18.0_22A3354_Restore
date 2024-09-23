@implementation SKUIGallerySwooshCollectionViewCell

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
        -[SKUIGallerySwooshCollectionViewCell setColoringWithColorScheme:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "primaryTextColor");
  v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
  p_titleColor = &self->_titleColor;
  titleColor = self->_titleColor;
  if (titleColor != v13 && (-[UIColor isEqual:](titleColor, "isEqual:", v13) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, v13);
    titleLabel = self->_titleLabel;
    if (*p_titleColor)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.235294118, 1.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v17);

    }
  }

}

- (void)setContentChildView:(id)a3
{
  UIView *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIView **p_contentChildView;
  UIView *v15;
  void *v16;

  v5 = (UIView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIGallerySwooshCollectionViewCell setContentChildView:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  p_contentChildView = &self->_contentChildView;
  v15 = v5;
  if (self->_contentChildView != v5)
  {
    if (-[UIView isDescendantOfView:](self->_contentChildView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_contentChildView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentChildView, a3);
    -[SKUIGallerySwooshCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v15 = *p_contentChildView;
  }
  if (v15 && !-[UIView isDescendantOfView:](v15, "isDescendantOfView:", self))
  {
    -[SKUIGallerySwooshCollectionViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", *p_contentChildView);
    -[SKUIGallerySwooshCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

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
  void *v14;
  UILabel *titleLabel;
  UILabel *v16;
  UILabel *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  UILabel *v23;
  void *v24;
  void *v25;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGallerySwooshCollectionViewCell setTitle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UILabel text](self->_titleLabel, "text");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 != v4 && (objc_msgSend(v13, "isEqualToString:", v4) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v4)
    {
      if (!titleLabel)
      {
        v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v17 = self->_titleLabel;
        self->_titleLabel = v16;

        v18 = self->_titleLabel;
        -[SKUIGallerySwooshCollectionViewCell backgroundColor](self, "backgroundColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v18, "setBackgroundColor:", v19);

        v20 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v20, "setFont:", v21);

        v22 = self->_titleLabel;
        if (self->_titleColor)
        {
          -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.235294118, 1.0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v22, "setTextColor:", v24);

        }
        -[SKUIGallerySwooshCollectionViewCell contentView](self, "contentView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addSubview:", self->_titleLabel);

        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:", v4);
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v23 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SKUIGallerySwooshCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
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
        -[SKUIGallerySwooshCollectionViewCell title].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_titleLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (UIView)contentChildView
{
  return self->_contentChildView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_contentChildView, 0);
}

- (void)setColoringWithColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setContentChildView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

@end
