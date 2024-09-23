@implementation PKPaymentPassActionWidgetButton

- (PKPaymentPassActionWidgetButton)initWithWidgetViewStyle:(unint64_t)a3
{
  PKPaymentPassActionWidgetButton *v3;
  PKPaymentPassActionWidgetButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPassActionWidgetButton;
  v3 = -[PKPaymentPassActionWidgetButton initWithFrame:](&v10, sel_initWithFrame_, a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    -[PKPaymentPassActionWidgetButton titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextAlignment:", 1);
    objc_msgSend(v5, "setLineBreakMode:", 5);
    -[PKPaymentPassActionWidgetButton _applyStyles](v4, "_applyStyles");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassActionWidgetButton setTitleColor:forState:](v4, "setTitleColor:forState:", v6, 0);
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassActionWidgetButton setTitleColor:forState:](v4, "setTitleColor:forState:", v7, 2);

    -[PKPaymentPassActionWidgetButton setTintColor:](v4, "setTintColor:", v6);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassActionWidgetButton setBackgroundColor:](v4, "setBackgroundColor:", v8);

    -[PKPaymentPassActionWidgetButton _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 10.0);
    -[PKPaymentPassActionWidgetButton setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67830]);

  }
  return v4;
}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGRectEdge v17;
  void *v18;
  double v19;
  double v20;
  CGRect slice;
  CGRect remainder;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)PKPaymentPassActionWidgetButton;
  -[PKPaymentPassActionWidgetButton layoutSubviews](&v23, sel_layoutSubviews);
  -[PKPaymentPassActionWidgetButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  remainder.origin.x = v3;
  remainder.origin.y = v5;
  remainder.size.width = v7;
  remainder.size.height = v9;
  memset(&slice, 0, sizeof(slice));
  -[PKPaymentPassActionWidgetButton imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassActionWidgetButton titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "sizeThatFits:", v8, v10);
  if (self->_usesAccessibilityLayout)
  {
    remainder.origin.x = v4 + 16.0;
    remainder.origin.y = v6 + 0.0;
    remainder.size.width = v8 + -32.0;
    remainder.size.height = v10;
    if (-[PKPaymentPassActionWidgetButton _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v17 = CGRectMaxXEdge;
    else
      v17 = CGRectMinXEdge;
    CGRectDivide(remainder, &slice, &remainder, v14, v17);
    PKSizeAlignedInRect();
    objc_msgSend(v11, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, 10.0, v17);
  }
  else
  {
    objc_msgSend(v12, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lineHeight");
    PKFloatRoundToPixel();
    v20 = v19;

    v24.origin.x = v4 + 0.0;
    v24.origin.y = v6 + v20;
    remainder.origin.x = v4 + 0.0;
    remainder.origin.y = v6 + v20;
    v24.size.height = v10 - (v20 + v20);
    remainder.size.width = v8;
    remainder.size.height = v24.size.height;
    v24.size.width = v8;
    CGRectDivide(v24, &slice, &remainder, v16, CGRectMinYEdge);
    PKSizeAlignedInRect();
    objc_msgSend(v11, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, 2.0, CGRectMinYEdge);
  }
  PKSizeAlignedInRect();
  objc_msgSend(v12, "setFrame:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "widgetHeightWithAccessibilityLayout:", self->_usesAccessibilityLayout);
  v7 = v6;
  if (self->_usesAccessibilityLayout)
  {
    v8 = width;
    v9 = v7;
  }
  else
  {
    -[PKPaymentPassActionWidgetButton titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeThatFits:", 1.79769313e308, height);

    -[PKPaymentPassActionWidgetButton imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeThatFits:", width, height);

    PKSizeRoundToPixel();
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPassActionWidgetButton;
  v4 = a3;
  -[PKPaymentPassActionWidgetButton traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PKPaymentPassActionWidgetButton traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "isEqualToString:", v6);
  if ((v4 & 1) == 0)
    -[PKPaymentPassActionWidgetButton _applyStyles](self, "_applyStyles");

}

+ (double)glyphImageHeight:(BOOL)a3
{
  NSString **v3;
  void *v4;
  double v5;
  double v6;

  v3 = (NSString **)MEMORY[0x1E0DC4AA0];
  if (a3)
    v3 = (NSString **)MEMORY[0x1E0DC4B10];
  PKFontForDefaultDesign(*v3, (NSString *)*MEMORY[0x1E0DC48B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  PKFloatRoundToPixel();
  v6 = fmin(v5, 28.0);

  return v6;
}

+ (double)widgetHeightWithAccessibilityLayout:(BOOL)a3
{
  _BOOL8 v3;
  NSString **v4;
  void *v5;
  double result;

  v3 = a3;
  v4 = (NSString **)MEMORY[0x1E0DC4AA0];
  if (a3)
    v4 = (NSString **)MEMORY[0x1E0DC4B10];
  PKFontForDefaultDesign(*v4, (NSString *)*MEMORY[0x1E0DC48B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");

  objc_msgSend((id)objc_opt_class(), "glyphImageHeight:", v3);
  PKFloatRoundToPixel();
  return result;
}

- (void)_applyStyles
{
  NSString **v3;
  void *v4;
  id v5;

  -[PKPaymentPassActionWidgetButton titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_usesAccessibilityLayout)
    v3 = (NSString **)MEMORY[0x1E0DC4B10];
  else
    v3 = (NSString **)MEMORY[0x1E0DC4AA0];
  PKFontForDefaultDesign(*v3, (NSString *)*MEMORY[0x1E0DC48B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

}

- (void)setUsesAccessibilityLayout:(BOOL)a3
{
  if (((!self->_usesAccessibilityLayout ^ a3) & 1) == 0)
  {
    self->_usesAccessibilityLayout = a3;
    -[PKPaymentPassActionWidgetButton _applyStyles](self, "_applyStyles");
    -[PKPaymentPassActionWidgetButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPassActionWidgetButton;
  -[PKPaymentPassActionWidgetButton setHighlighted:](&v6, sel_setHighlighted_);
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentPassActionWidgetButton setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (PKPaymentPassActionBundle)actionBundle
{
  return self->_actionBundle;
}

- (void)setActionBundle:(id)a3
{
  objc_storeStrong((id *)&self->_actionBundle, a3);
}

- (BOOL)usesAccessibilityLayout
{
  return self->_usesAccessibilityLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBundle, 0);
}

@end
