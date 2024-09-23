@implementation VUIMenuSectionHeaderCollectionViewCell

- (void)setTitle:(id)a3
{
  NSString **p_title;
  VUITextLayout *v6;
  void *v7;
  VUILabel *v8;
  VUILabel *titleLabel;
  void *v10;
  id v11;

  p_title = &self->_title;
  v11 = a3;
  if (!-[NSString isEqualToString:](*p_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[VUILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    if (*p_title)
    {
      v6 = objc_alloc_init(VUITextLayout);
      -[VUITextLayout setTextStyle:](v6, "setTextStyle:", 19);
      -[VUITextLayout setFontWeight:](v6, "setFontWeight:", 10);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUITextLayout setColor:](v6, "setColor:", v7);

      -[VUITextLayout setAlignment:](v6, "setAlignment:", 1);
      -[VUITextLayout setNumberOfLines:](v6, "setNumberOfLines:", 1);
      +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", *p_title, v6, 0);
      v8 = (VUILabel *)objc_claimAutoreleasedReturnValue();
      titleLabel = self->_titleLabel;
      self->_titleLabel = v8;

      -[VUIMenuSectionHeaderCollectionViewCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_titleLabel);

    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIMenuSectionHeaderCollectionViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)VUIMenuSectionHeaderCollectionViewCell;
  -[VUIMenuSectionHeaderCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[VUIMenuSectionHeaderCollectionViewCell bounds](self, "bounds");
  Width = CGRectGetWidth(v5);
  -[VUIMenuSectionHeaderCollectionViewCell bounds](self, "bounds");
  -[VUIMenuSectionHeaderCollectionViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v6));
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  _BOOL4 v4;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  v4 = a4;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding", a3.width, a3.height);
  v8 = v7;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - (v7 + v9), 1.79769313e308);
  v11 = v10;
  v13 = v12;
  -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", 50.0);
  v15 = v14;
  -[VUILabel bottomMarginWithBaselineMargin:](self->_titleLabel, "bottomMarginWithBaselineMargin:", 16.0);
  v17 = v16;
  if (!v4)
  {
    v18 = v13;
    if (-[VUIMenuSectionHeaderCollectionViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    {
      -[VUIMenuSectionHeaderCollectionViewCell bounds](self, "bounds");
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      v8 = v20;
      v11 = v21;
      v18 = v22;
    }
    else
    {
      v19 = v15;
    }
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v8, v19, v11, v18);
  }
  v23 = v13 + v15 + 0.0 + v17;
  v24 = width;
  result.height = v23;
  result.width = v24;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
