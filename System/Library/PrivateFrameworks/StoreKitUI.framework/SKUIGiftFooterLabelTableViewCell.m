@implementation SKUIGiftFooterLabelTableViewCell

- (NSString)footerLabel
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
        -[SKUIGiftFooterLabelTableViewCell footerLabel].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_footerLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setFooterLabel:(id)a3
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
  UILabel *footerLabel;
  UILabel *v15;
  UILabel *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
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
        -[SKUIGiftFooterLabelTableViewCell setFooterLabel:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIGiftFooterLabelTableViewCell footerLabel](self, "footerLabel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v4 && (objc_msgSend(v4, "isEqualToString:", v13) & 1) == 0)
  {
    footerLabel = self->_footerLabel;
    if (v4)
    {
      if (!footerLabel)
      {
        v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v16 = self->_footerLabel;
        self->_footerLabel = v15;

        v17 = self->_footerLabel;
        -[SKUIGiftFooterLabelTableViewCell backgroundColor](self, "backgroundColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

        v19 = self->_footerLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 15.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v19, "setFont:", v20);

        -[UILabel setNumberOfLines:](self->_footerLabel, "setNumberOfLines:", 2);
        -[UILabel setTextAlignment:](self->_footerLabel, "setTextAlignment:", 1);
        v21 = self->_footerLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v21, "setTextColor:", v22);

        -[SKUIGiftFooterLabelTableViewCell contentView](self, "contentView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addSubview:", self->_footerLabel);

        footerLabel = self->_footerLabel;
      }
      -[UILabel setText:](footerLabel, "setText:", v4);
    }
    else
    {
      -[UILabel removeFromSuperview](footerLabel, "removeFromSuperview");
      v24 = self->_footerLabel;
      self->_footerLabel = 0;

    }
    -[SKUIGiftFooterLabelTableViewCell setNeedsLayout](self, "setNeedsLayout");
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
        -[SKUIGiftFooterLabelTableViewCell setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UILabel setBackgroundColor:](self->_footerLabel, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIGiftFooterLabelTableViewCell;
  -[SKUIGiftFooterLabelTableViewCell setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGiftFooterLabelTableViewCell sizeThatFits:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UILabel sizeThatFits:](self->_footerLabel, "sizeThatFits:", width + -30.0, 1.79769313e308);
  v15 = v14 + 6.0;
  result.height = v15;
  result.width = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerLabel, 0);
}

- (void)footerLabel
{
  OUTLINED_FUNCTION_1();
}

- (void)setFooterLabel:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
