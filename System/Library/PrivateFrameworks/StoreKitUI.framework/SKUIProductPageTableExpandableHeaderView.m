@implementation SKUIProductPageTableExpandableHeaderView

- (NSString)actionString
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
        -[SKUIProductPageTableExpandableHeaderView actionString].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_actionLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)bottomBorderColor
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
        -[SKUIProductPageTableExpandableHeaderView bottomBorderColor].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UIView backgroundColor](self->_bottomBorderView, "backgroundColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setActionString:(id)a3
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
  uint64_t v15;
  UILabel *actionLabel;
  UILabel *v17;
  UILabel *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductPageTableExpandableHeaderView setActionString:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIProductPageTableExpandableHeaderView actionString](self, "actionString");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 != v4 && (objc_msgSend(v13, "isEqualToString:", v4) & 1) == 0)
  {
    v15 = objc_msgSend(v4, "length");
    actionLabel = self->_actionLabel;
    if (v15)
    {
      if (!actionLabel)
      {
        v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v18 = self->_actionLabel;
        self->_actionLabel = v17;

        v19 = self->_actionLabel;
        -[SKUIProductPageTableExpandableHeaderView backgroundColor](self, "backgroundColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

        v21 = self->_actionLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v21, "setFont:", v22);

        v23 = self->_actionLabel;
        -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          -[UILabel setTextColor:](v23, "setTextColor:", v24);
        }
        else
        {
          -[SKUIProductPageTableExpandableHeaderView tintColor](self, "tintColor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v23, "setTextColor:", v26);

        }
        -[SKUIProductPageTableExpandableHeaderView addSubview:](self, "addSubview:", self->_actionLabel);
        actionLabel = self->_actionLabel;
      }
      -[UILabel setText:](actionLabel, "setText:", v4);
      -[UILabel sizeToFit](self->_actionLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](actionLabel, "removeFromSuperview");
      v25 = self->_actionLabel;
      self->_actionLabel = 0;

    }
    -[SKUIProductPageTableExpandableHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setBottomBorderColor:(id)a3
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
  UIView *bottomBorderView;
  UIView *v14;
  UIView *v15;
  UIView *v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductPageTableExpandableHeaderView setBottomBorderColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  bottomBorderView = self->_bottomBorderView;
  if (v4)
  {
    if (!bottomBorderView)
    {
      v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v15 = self->_bottomBorderView;
      self->_bottomBorderView = v14;

      -[SKUIProductPageTableExpandableHeaderView addSubview:](self, "addSubview:", self->_bottomBorderView);
      bottomBorderView = self->_bottomBorderView;
    }
    -[UIView setBackgroundColor:](bottomBorderView, "setBackgroundColor:", v4);
  }
  else
  {
    -[UIView removeFromSuperview](bottomBorderView, "removeFromSuperview");
    v16 = self->_bottomBorderView;
    self->_bottomBorderView = 0;

  }
}

- (void)setColorScheme:(id)a3
{
  SKUIColorScheme *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIColorScheme **p_colorScheme;
  UILabel *actionLabel;
  void *v16;
  void *v17;
  UILabel *titleLabel;
  void *v19;
  void *v20;

  v5 = (SKUIColorScheme *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIProductPageTableExpandableHeaderView setColorScheme:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    actionLabel = self->_actionLabel;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[UILabel setTextColor:](actionLabel, "setTextColor:", v16);
    }
    else
    {
      -[SKUIProductPageTableExpandableHeaderView tintColor](self, "tintColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](actionLabel, "setTextColor:", v17);

    }
    titleLabel = self->_titleLabel;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](titleLabel, "setTextColor:", v20);

    }
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
  uint64_t v15;
  UILabel *titleLabel;
  UILabel *v17;
  UILabel *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductPageTableExpandableHeaderView setTitle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIProductPageTableExpandableHeaderView title](self, "title");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 != v4 && (objc_msgSend(v13, "isEqualToString:", v4) & 1) == 0)
  {
    v15 = objc_msgSend(v4, "length");
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v18 = self->_titleLabel;
        self->_titleLabel = v17;

        v19 = self->_titleLabel;
        -[SKUIProductPageTableExpandableHeaderView backgroundColor](self, "backgroundColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

        v21 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v21, "setFont:", v22);

        v23 = self->_titleLabel;
        -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          -[UILabel setTextColor:](v23, "setTextColor:", v24);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v23, "setTextColor:", v26);

        }
        -[SKUIProductPageTableExpandableHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:", v4);
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v25 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SKUIProductPageTableExpandableHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTopBorderColor:(id)a3
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
  UIView *topBorderView;
  UIView *v14;
  UIView *v15;
  UIView *v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductPageTableExpandableHeaderView setTopBorderColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  topBorderView = self->_topBorderView;
  if (v4)
  {
    if (!topBorderView)
    {
      v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v15 = self->_topBorderView;
      self->_topBorderView = v14;

      -[SKUIProductPageTableExpandableHeaderView addSubview:](self, "addSubview:", self->_topBorderView);
      topBorderView = self->_topBorderView;
    }
    -[UIView setBackgroundColor:](topBorderView, "setBackgroundColor:", v4);
  }
  else
  {
    -[UIView removeFromSuperview](topBorderView, "removeFromSuperview");
    v16 = self->_topBorderView;
    self->_topBorderView = 0;

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
        -[SKUIProductPageTableExpandableHeaderView title].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_titleLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)topBorderColor
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
        -[SKUIProductPageTableExpandableHeaderView topBorderColor].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UIView backgroundColor](self->_topBorderView, "backgroundColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
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
        -[SKUIProductPageTableExpandableHeaderView setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UILabel setBackgroundColor:](self->_actionLabel, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductPageTableExpandableHeaderView;
  -[SKUIProductPageTableExpandableHeaderView setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIProductPageTableExpandableHeaderView sizeThatFits:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = 44.0;
  v13 = width;
  result.height = v12;
  result.width = v13;
  return result;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
  objc_storeStrong((id *)&self->_actionLabel, 0);
}

- (void)actionString
{
  OUTLINED_FUNCTION_1();
}

- (void)bottomBorderColor
{
  OUTLINED_FUNCTION_1();
}

- (void)setActionString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setBottomBorderColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setTitle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setTopBorderColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)title
{
  OUTLINED_FUNCTION_1();
}

- (void)topBorderColor
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
