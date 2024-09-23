@implementation SKUIProductPageCopyrightView

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
  UILabel *copyrightLabel;
  void *v16;
  void *v17;
  void *v18;

  v5 = (SKUIColorScheme *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIProductPageCopyrightView setColorScheme:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    copyrightLabel = self->_copyrightLabel;
    -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[SKUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIColorWithAlpha(v17, 0.3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](copyrightLabel, "setTextColor:", v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](copyrightLabel, "setTextColor:", v17);
    }

  }
}

- (NSString)copyrightString
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
        -[SKUIProductPageCopyrightView copyrightString].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_copyrightLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setCopyrightString:(id)a3
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
  char v14;
  UILabel *copyrightLabel;
  UILabel *v16;
  UILabel *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductPageCopyrightView setCopyrightString:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UILabel text](self->_copyrightLabel, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", v4);

  if ((v14 & 1) == 0)
  {
    copyrightLabel = self->_copyrightLabel;
    if (v4)
    {
      if (!copyrightLabel)
      {
        v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v17 = self->_copyrightLabel;
        self->_copyrightLabel = v16;

        v18 = self->_copyrightLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v18, "setFont:", v19);

        -[UILabel setNumberOfLines:](self->_copyrightLabel, "setNumberOfLines:", 0);
        v20 = self->_copyrightLabel;
        -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          -[SKUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          SKUIColorWithAlpha(v22, 0.3);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v20, "setTextColor:", v23);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILabel setTextColor:](v20, "setTextColor:", v22);
        }

        -[SKUIProductPageCopyrightView addSubview:](self, "addSubview:", self->_copyrightLabel);
        copyrightLabel = self->_copyrightLabel;
      }
      -[UILabel setText:](copyrightLabel, "setText:", v4);
    }
    else
    {
      -[UILabel removeFromSuperview](copyrightLabel, "removeFromSuperview");
      v24 = self->_copyrightLabel;
      self->_copyrightLabel = 0;

    }
  }

}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIProductPageCopyrightView sizeThatFits:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  -[UILabel sizeThatFits:](self->_copyrightLabel, "sizeThatFits:", width, height);
  v15 = v14 + 32.0;
  v16 = width;
  result.height = v15;
  result.width = v16;
  return result;
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_copyrightLabel, 0);
}

- (void)setColorScheme:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)copyrightString
{
  OUTLINED_FUNCTION_1();
}

- (void)setCopyrightString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
