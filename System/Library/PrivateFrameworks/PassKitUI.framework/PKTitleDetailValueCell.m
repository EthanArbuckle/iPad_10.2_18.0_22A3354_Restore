@implementation PKTitleDetailValueCell

- (PKTitleDetailValueCell)initWithSize:(CGSize)a3
{
  return -[PKTitleDetailValueCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKTitleDetailValueCell)initWithFrame:(CGRect)a3
{
  PKTitleDetailValueCell *v3;
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  UIFont *defaultTitleFont;
  uint64_t v8;
  UIFont *defaultDetailFont;
  uint64_t v10;
  UIFont *defaultValueFont;
  uint64_t v12;
  UIColor *defaultDetailColor;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKTitleDetailValueCell;
  v3 = -[PKTitleDetailValueCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSString *)*MEMORY[0x1E0DC4A88];
    v5 = (NSString *)*MEMORY[0x1E0DC48D0];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    defaultTitleFont = v3->_defaultTitleFont;
    v3->_defaultTitleFont = (UIFont *)v6;

    PKFontForDefaultDesign(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    defaultDetailFont = v3->_defaultDetailFont;
    v3->_defaultDetailFont = (UIFont *)v8;

    PKFontForDefaultDesign(v4, v5);
    v10 = objc_claimAutoreleasedReturnValue();
    defaultValueFont = v3->_defaultValueFont;
    v3->_defaultValueFont = (UIFont *)v10;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = objc_claimAutoreleasedReturnValue();
    defaultDetailColor = v3->_defaultDetailColor;
    v3->_defaultDetailColor = (UIColor *)v12;

    -[PKTitleDetailValueCell _resetValues](v3, "_resetValues");
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTitleDetailValueCell;
  -[PKTitleDetailValueCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKTitleDetailValueCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKTitleDetailValueCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKTitleDetailValueCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double verticalMargin;
  double horizontalMargin;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRectEdge v12;
  UIImageView *checkmarkView;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat width;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v42;

  verticalMargin = self->_verticalMargin;
  horizontalMargin = self->_horizontalMargin;
  v8 = a3.origin.x + horizontalMargin;
  v9 = a3.origin.y + verticalMargin;
  v10 = a3.size.width - (horizontalMargin + horizontalMargin);
  v37 = verticalMargin + verticalMargin;
  width = a3.size.width;
  v11 = a3.size.height - (verticalMargin + verticalMargin);
  if (-[PKTitleDetailValueCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v12 = CGRectMaxXEdge;
  else
    v12 = CGRectMinXEdge;
  remainder.origin.x = v8;
  remainder.origin.y = v9;
  remainder.size.width = v10;
  remainder.size.height = v11;
  checkmarkView = self->_checkmarkView;
  if (checkmarkView)
  {
    -[UIImageView frame](checkmarkView, "frame");
    -[UIImageView sizeThatFits:](self->_checkmarkView, "sizeThatFits:", v10, v11);
    v15 = v14;
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D820];
  }
  memset(&slice, 0, sizeof(slice));
  if (v15 <= 0.0)
    v16 = 0.0;
  else
    v16 = 11.0;
  -[PKTitleDetailValueTextView frame](self->_textView, "frame");
  -[PKTitleDetailValueTextView sizeThatFits:](self->_textView, "sizeThatFits:", v10 - v15 - v16, 1.79769313e308);
  v18 = v17;
  v42.origin.x = v8;
  v42.origin.y = v9;
  v42.size.width = v10;
  v42.size.height = v11;
  CGRectDivide(v42, &slice, &remainder, v18, v12);
  PKSizeAlignedInRect();
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  CGRectDivide(remainder, &slice, &remainder, v16, v12);
  CGRectDivide(remainder, &slice, &remainder, v15, v12);
  PKSizeAlignedInRect();
  v31 = v30;
  if (!a4)
  {
    v32 = v27;
    v33 = v28;
    v34 = v29;
    -[PKTitleDetailValueTextView setFrame:](self->_textView, "setFrame:", v20, v22, v24, v26);
    -[UIImageView setFrame:](self->_checkmarkView, "setFrame:", v32, v33, v34, v31);
  }
  v35 = v37 + fmax(v31, v26) + 0.0;
  v36 = width;
  result.height = v35;
  result.width = v36;
  return result;
}

- (void)setTitleText:(id)a3
{
  id v5;
  NSString *titleText;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  titleText = self->_titleText;
  v9 = (NSString *)v5;
  v7 = titleText;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_titleText, a3);
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }
LABEL_9:

}

- (void)setTitleFont:(id)a3
{
  UIFont **p_titleFont;
  UIFont *defaultTitleFont;
  id v7;

  p_titleFont = &self->_titleFont;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    defaultTitleFont = *p_titleFont;
    if (!*p_titleFont)
      defaultTitleFont = self->_defaultTitleFont;
    objc_storeStrong((id *)&self->_titleFont, defaultTitleFont);
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }

}

- (void)setTitleColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, a3);
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }

}

- (void)setDetailText:(id)a3
{
  id v5;
  NSString *detailText;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  detailText = self->_detailText;
  v9 = (NSString *)v5;
  v7 = detailText;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_detailText, a3);
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }
LABEL_9:

}

- (void)setDetailIcon:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailIcon, a3);
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }

}

- (void)setDetailFont:(id)a3
{
  UIFont **p_detailFont;
  UIFont *defaultDetailFont;
  id v7;

  p_detailFont = &self->_detailFont;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailFont, a3);
    defaultDetailFont = *p_detailFont;
    if (!*p_detailFont)
      defaultDetailFont = self->_defaultDetailFont;
    objc_storeStrong((id *)&self->_detailFont, defaultDetailFont);
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }

}

- (void)setDetailColor:(id)a3
{
  UIColor **p_detailColor;
  UIColor *defaultDetailColor;
  id v7;

  p_detailColor = &self->_detailColor;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailColor, a3);
    defaultDetailColor = *p_detailColor;
    if (!*p_detailColor)
      defaultDetailColor = self->_defaultDetailColor;
    objc_storeStrong((id *)&self->_detailColor, defaultDetailColor);
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }

}

- (void)setValueText:(id)a3
{
  id v5;
  NSString *valueText;
  NSString *v7;
  BOOL v8;
  NSString *v9;

  v5 = a3;
  valueText = self->_valueText;
  v9 = (NSString *)v5;
  v7 = valueText;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSString isEqualToString:](v9, "isEqualToString:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_valueText, a3);
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }
LABEL_9:

}

- (void)setValueFont:(id)a3
{
  UIFont **p_valueFont;
  UIFont *defaultValueFont;
  id v7;

  p_valueFont = &self->_valueFont;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueFont, a3);
    defaultValueFont = *p_valueFont;
    if (!*p_valueFont)
      defaultValueFont = self->_defaultValueFont;
    objc_storeStrong((id *)&self->_valueFont, defaultValueFont);
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }

}

- (void)setValueColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_valueColor, a3);
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }

}

- (void)setAccessory:(unint64_t)a3
{
  if (self->_accessory != a3)
  {
    self->_accessory = a3;
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }
}

- (void)setHorizontalMargin:(double)a3
{
  if (self->_horizontalMargin != a3)
  {
    if (a3 == 0.0)
      a3 = 16.0;
    self->_horizontalMargin = a3;
    -[PKTitleDetailValueCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVerticalMargin:(double)a3
{
  if (self->_verticalMargin != a3)
  {
    if (a3 == 0.0)
      a3 = 16.0;
    self->_verticalMargin = a3;
    -[PKTitleDetailValueCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLabelPadding:(double)a3
{
  if (self->_labelPadding != a3)
  {
    if (a3 == 0.0)
      a3 = 0.0;
    self->_labelPadding = a3;
    -[PKTitleDetailValueCell _configureView](self, "_configureView");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  UIColor *v8;
  UIColor *backgroundColor;
  UIColor *v10;
  void *v11;
  UIColor *v12;
  _QWORD v13[5];
  UIColor *v14;
  objc_super v15;

  v3 = a3;
  if ((-[PKTitleDetailValueCell isHighlighted](self, "isHighlighted") & 1) == 0 && !self->_backgroundColor)
  {
    -[PKTitleDetailValueCell backgroundConfiguration](self, "backgroundConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[PKTitleDetailValueCell backgroundColor](self, "backgroundColor");
      v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v8;

  }
  v15.receiver = self;
  v15.super_class = (Class)PKTitleDetailValueCell;
  -[PKTitleDetailValueCell setHighlighted:](&v15, sel_setHighlighted_, v3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v10 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = self->_backgroundColor;
  }
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__PKTitleDetailValueCell_setHighlighted___block_invoke;
  v13[3] = &unk_1E3E61388;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v13, 0);

}

uint64_t __41__PKTitleDetailValueCell_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (void)_configureView
{
  PKTitleDetailValueTextView *textView;
  PKTitleDetailValueTextView *v4;
  PKTitleDetailValueTextView *v5;
  void *v6;
  PKTitleDetailValueTextView *v7;
  void *v8;
  PKTitleDetailValueTextView *v9;
  void *v10;
  unint64_t accessory;
  BOOL v12;
  unint64_t v13;
  id v14;
  void *v15;
  UIImageView *v16;
  UIImageView *checkmarkView;
  UIImageView *v18;
  void *v19;
  UIImageView *v20;
  id v21;

  -[PKTitleDetailValueCell contentView](self, "contentView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  if (!textView)
  {
    v4 = objc_alloc_init(PKTitleDetailValueTextView);
    v5 = self->_textView;
    self->_textView = v4;

    objc_msgSend(v21, "addSubview:", self->_textView);
    textView = self->_textView;
  }
  -[NSString pk_attributedString](self->_titleText, "pk_attributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTitleDetailValueTextView setPrimaryText:](textView, "setPrimaryText:", v6);

  -[PKTitleDetailValueTextView setPrimaryFont:](self->_textView, "setPrimaryFont:", self->_titleFont);
  -[PKTitleDetailValueTextView setPrimaryTextColor:](self->_textView, "setPrimaryTextColor:", self->_titleColor);
  v7 = self->_textView;
  -[NSString pk_attributedString](self->_detailText, "pk_attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTitleDetailValueTextView setSecondaryText:](v7, "setSecondaryText:", v8);

  -[PKTitleDetailValueTextView setSecondaryFont:](self->_textView, "setSecondaryFont:", self->_detailFont);
  -[PKTitleDetailValueTextView setSecondaryIcon:](self->_textView, "setSecondaryIcon:", self->_detailIcon);
  -[PKTitleDetailValueTextView setSecondaryTextColor:](self->_textView, "setSecondaryTextColor:", self->_detailColor);
  v9 = self->_textView;
  if (self->_valueText)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_valueText);
    -[PKTitleDetailValueTextView setAmountText:](v9, "setAmountText:", v10);

  }
  else
  {
    -[PKTitleDetailValueTextView setAmountText:](self->_textView, "setAmountText:", 0);
  }
  -[PKTitleDetailValueTextView setAmountFont:](self->_textView, "setAmountFont:", self->_valueFont);
  -[PKTitleDetailValueTextView setAmountTextColor:](self->_textView, "setAmountTextColor:", self->_valueColor);
  -[PKTitleDetailValueTextView setLabelPadding:](self->_textView, "setLabelPadding:", self->_labelPadding);
  -[PKTitleDetailValueTextView setAccessory:](self->_textView, "setAccessory:", self->_accessory == 1);
  accessory = self->_accessory;
  v12 = accessory >= 2;
  v13 = accessory - 2;
  if (v12)
  {
    if (v13 <= 1)
    {
      -[UIImageView removeFromSuperview](self->_checkmarkView, "removeFromSuperview");
      v14 = objc_alloc(MEMORY[0x1E0DC3890]);
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (UIImageView *)objc_msgSend(v14, "initWithImage:", v15);
      checkmarkView = self->_checkmarkView;
      self->_checkmarkView = v16;

      v18 = self->_checkmarkView;
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v18, "setTintColor:", v19);

      -[UIImageView setHidden:](self->_checkmarkView, "setHidden:", self->_accessory == 3);
      objc_msgSend(v21, "addSubview:", self->_checkmarkView);
    }
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_checkmarkView, "removeFromSuperview");
    v20 = self->_checkmarkView;
    self->_checkmarkView = 0;

  }
  -[PKTitleDetailValueCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_resetValues
{
  objc_storeStrong((id *)&self->_titleFont, self->_defaultTitleFont);
  objc_storeStrong((id *)&self->_detailFont, self->_defaultDetailFont);
  objc_storeStrong((id *)&self->_valueFont, self->_defaultValueFont);
  objc_storeStrong((id *)&self->_detailColor, self->_defaultDetailColor);
  self->_verticalMargin = 16.0;
  self->_horizontalMargin = 16.0;
  self->_labelPadding = 0.0;
}

- (void)prepareForReuse
{
  NSString *titleText;
  NSString *detailText;
  NSString *valueText;
  UIColor *backgroundColor;
  PKTitleDetailValueTextView *textView;
  UIImageView *checkmarkView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKTitleDetailValueCell;
  -[PKTitleDetailValueCell prepareForReuse](&v9, sel_prepareForReuse);
  titleText = self->_titleText;
  self->_titleText = 0;

  detailText = self->_detailText;
  self->_detailText = 0;

  valueText = self->_valueText;
  self->_valueText = 0;

  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = 0;

  self->_accessory = 0;
  -[PKTitleDetailValueCell _resetValues](self, "_resetValues");
  -[PKTitleDetailValueTextView removeFromSuperview](self->_textView, "removeFromSuperview");
  textView = self->_textView;
  self->_textView = 0;

  -[UIImageView removeFromSuperview](self->_checkmarkView, "removeFromSuperview");
  checkmarkView = self->_checkmarkView;
  self->_checkmarkView = 0;

}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIImage)detailIcon
{
  return self->_detailIcon;
}

- (UIFont)detailFont
{
  return self->_detailFont;
}

- (UIColor)detailColor
{
  return self->_detailColor;
}

- (NSString)valueText
{
  return self->_valueText;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (UIColor)valueColor
{
  return self->_valueColor;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (double)horizontalMargin
{
  return self->_horizontalMargin;
}

- (double)verticalMargin
{
  return self->_verticalMargin;
}

- (double)labelPadding
{
  return self->_labelPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueColor, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_valueText, 0);
  objc_storeStrong((id *)&self->_detailColor, 0);
  objc_storeStrong((id *)&self->_detailFont, 0);
  objc_storeStrong((id *)&self->_detailIcon, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_defaultDetailColor, 0);
  objc_storeStrong((id *)&self->_defaultValueFont, 0);
  objc_storeStrong((id *)&self->_defaultDetailFont, 0);
  objc_storeStrong((id *)&self->_defaultTitleFont, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
