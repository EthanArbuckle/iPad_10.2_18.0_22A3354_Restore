@implementation SKUIProductPageInAppPurchaseTableCell

- (NSString)indexString
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
        -[SKUIProductPageInAppPurchaseTableCell indexString].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_indexLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)priceString
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
        -[SKUIProductPageInAppPurchaseTableCell priceString].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_priceLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)productName
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
        -[SKUIProductPageInAppPurchaseTableCell productName].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_nameLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
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
  UILabel *indexLabel;
  void *v16;
  void *v17;
  UILabel *priceLabel;
  void *v19;
  void *v20;
  UILabel *nameLabel;
  void *v22;
  void *v23;

  v5 = (SKUIColorScheme *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIProductPageInAppPurchaseTableCell setColorScheme:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    indexLabel = self->_indexLabel;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[UILabel setTextColor:](indexLabel, "setTextColor:", v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](indexLabel, "setTextColor:", v17);

    }
    priceLabel = self->_priceLabel;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[UILabel setTextColor:](priceLabel, "setTextColor:", v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](priceLabel, "setTextColor:", v20);

    }
    nameLabel = self->_nameLabel;
    -[SKUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[UILabel setTextColor:](nameLabel, "setTextColor:", v22);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](nameLabel, "setTextColor:", v23);

    }
  }

}

- (void)setIndexString:(id)a3
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
  UILabel *indexLabel;
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
  void *v27;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductPageInAppPurchaseTableCell setIndexString:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIProductPageInAppPurchaseTableCell indexString](self, "indexString");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 != v4 && (objc_msgSend(v13, "isEqualToString:", v4) & 1) == 0)
  {
    v15 = objc_msgSend(v4, "length");
    indexLabel = self->_indexLabel;
    if (v15)
    {
      if (!indexLabel)
      {
        v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v18 = self->_indexLabel;
        self->_indexLabel = v17;

        v19 = self->_indexLabel;
        -[SKUIProductPageInAppPurchaseTableCell backgroundColor](self, "backgroundColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

        v21 = self->_indexLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v21, "setFont:", v22);

        -[UILabel setTextAlignment:](self->_indexLabel, "setTextAlignment:", 1);
        v23 = self->_indexLabel;
        -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          -[UILabel setTextColor:](v23, "setTextColor:", v24);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v23, "setTextColor:", v26);

        }
        -[SKUIProductPageInAppPurchaseTableCell contentView](self, "contentView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addSubview:", self->_indexLabel);

        indexLabel = self->_indexLabel;
      }
      -[UILabel setText:](indexLabel, "setText:", v4);
    }
    else
    {
      -[UILabel removeFromSuperview](indexLabel, "removeFromSuperview");
      v25 = self->_indexLabel;
      self->_indexLabel = 0;

    }
    -[SKUIProductPageInAppPurchaseTableCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPriceString:(id)a3
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
  UILabel *priceLabel;
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
  void *v27;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductPageInAppPurchaseTableCell setPriceString:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIProductPageInAppPurchaseTableCell priceString](self, "priceString");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 != v4 && (objc_msgSend(v13, "isEqualToString:", v4) & 1) == 0)
  {
    v15 = objc_msgSend(v4, "length");
    priceLabel = self->_priceLabel;
    if (v15)
    {
      if (!priceLabel)
      {
        v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v18 = self->_priceLabel;
        self->_priceLabel = v17;

        v19 = self->_priceLabel;
        -[SKUIProductPageInAppPurchaseTableCell backgroundColor](self, "backgroundColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

        v21 = self->_priceLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v21, "setFont:", v22);

        v23 = self->_priceLabel;
        -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          -[UILabel setTextColor:](v23, "setTextColor:", v24);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v23, "setTextColor:", v26);

        }
        -[SKUIProductPageInAppPurchaseTableCell contentView](self, "contentView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addSubview:", self->_priceLabel);

        priceLabel = self->_priceLabel;
      }
      -[UILabel setText:](priceLabel, "setText:", v4);
      -[UILabel sizeToFit](self->_priceLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](priceLabel, "removeFromSuperview");
      v25 = self->_priceLabel;
      self->_priceLabel = 0;

    }
    -[SKUIProductPageInAppPurchaseTableCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setProductName:(id)a3
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
  UILabel *nameLabel;
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
  void *v27;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductPageInAppPurchaseTableCell setProductName:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIProductPageInAppPurchaseTableCell productName](self, "productName");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 != v4 && (objc_msgSend(v13, "isEqualToString:", v4) & 1) == 0)
  {
    v15 = objc_msgSend(v4, "length");
    nameLabel = self->_nameLabel;
    if (v15)
    {
      if (!nameLabel)
      {
        v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v18 = self->_nameLabel;
        self->_nameLabel = v17;

        v19 = self->_nameLabel;
        -[SKUIProductPageInAppPurchaseTableCell backgroundColor](self, "backgroundColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v19, "setBackgroundColor:", v20);

        v21 = self->_nameLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 14.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v21, "setFont:", v22);

        v23 = self->_nameLabel;
        -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
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
        -[SKUIProductPageInAppPurchaseTableCell contentView](self, "contentView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addSubview:", self->_nameLabel);

        nameLabel = self->_nameLabel;
      }
      -[UILabel setText:](nameLabel, "setText:", v4);
    }
    else
    {
      -[UILabel removeFromSuperview](nameLabel, "removeFromSuperview");
      v25 = self->_nameLabel;
      self->_nameLabel = 0;

    }
    -[SKUIProductPageInAppPurchaseTableCell setNeedsLayout](self, "setNeedsLayout");
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
        -[SKUIProductPageInAppPurchaseTableCell setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UILabel setBackgroundColor:](self->_indexLabel, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_nameLabel, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_priceLabel, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductPageInAppPurchaseTableCell;
  -[SKUIProductPageInAppPurchaseTableCell setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v4)
      -[SKUIProductPageInAppPurchaseTableCell setHighlighted:animated:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v4)
      -[SKUIProductPageInAppPurchaseTableCell setSelected:animated:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
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

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_indexLabel, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

- (void)indexString
{
  OUTLINED_FUNCTION_1();
}

- (void)priceString
{
  OUTLINED_FUNCTION_1();
}

- (void)productName
{
  OUTLINED_FUNCTION_1();
}

- (void)setColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setIndexString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setPriceString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setProductName:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setHighlighted:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setSelected:(uint64_t)a3 animated:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
