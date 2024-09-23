@implementation SKUIProductPageTableHeaderView

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
        -[SKUIProductPageTableHeaderView setContentInsets:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
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
    -[SKUIProductPageTableHeaderView setNeedsLayout](self, "setNeedsLayout", v16);
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
  void *v23;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductPageTableHeaderView setTitle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIProductPageTableHeaderView title](self, "title");
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
        -[SKUIProductPageTableHeaderView backgroundColor](self, "backgroundColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v18, "setBackgroundColor:", v19);

        v20 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 17.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v20, "setFont:", v21);

        v22 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v22, "setTextColor:", v23);

        -[SKUIProductPageTableHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setHidden:](titleLabel, "setHidden:", 0);
      -[UILabel setText:](self->_titleLabel, "setText:", v4);
      -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
      -[SKUIProductPageTableHeaderView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[UILabel setHidden:](titleLabel, "setHidden:", 1);
    }
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
        -[SKUIProductPageTableHeaderView title].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_titleLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
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
        -[SKUIProductPageTableHeaderView setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductPageTableHeaderView;
  -[SKUIProductPageTableHeaderView setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
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
  double v14;
  double v15;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIProductPageTableHeaderView sizeThatFits:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  -[UILabel frame](self->_titleLabel, "frame");
  v13 = v12 + self->_contentInsets.bottom + self->_contentInsets.top;
  v15 = v14 + self->_contentInsets.left + self->_contentInsets.right;
  result.height = v13;
  result.width = v15;
  return result;
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
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)setContentInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
