@implementation PKSimplePrimaryButtonCellView

- (PKSimplePrimaryButtonCellView)init
{
  return -[PKSimplePrimaryButtonCellView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (PKSimplePrimaryButtonCellView)initWithFrame:(CGRect)a3
{
  PKSimplePrimaryButtonCellView *v3;
  PKSimplePrimaryButtonCellView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSimplePrimaryButtonCellView;
  v3 = -[PKSimplePrimaryButtonCellView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_topPadding = 0.0;
    v3->_isTemplateLayout = 0;
    v3->_deferUpdateCounter = 0;
    v3->_animated = 0;
    -[PKSimplePrimaryButtonCellView _setupViews](v3, "_setupViews");
  }
  return v4;
}

- (int64_t)viewType
{
  return 2;
}

- (BOOL)enableDisclosure
{
  return 0;
}

- (void)prepareForReuse
{
  -[UILabel setText:](self->_titleView, "setText:", 0);
}

- (void)_setupViews
{
  id v3;
  UILabel *v4;
  UILabel *titleView;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView pkui_setMaskType:](self, "pkui_setMaskType:", 3);
  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  titleView = self->_titleView;
  self->_titleView = v4;

  -[PKSimplePrimaryButtonCellView addSubview:](self, "addSubview:", self->_titleView);
  -[PKSimplePrimaryButtonCellView setBackgroundColor:](self, "setBackgroundColor:", v6);

}

- (id)_titleFont
{
  void *v3;
  double v4;

  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AD0], (NSString *)*MEMORY[0x1E0DC48D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  PKFloatRoundToPixel();
  self->_topPadding = v4;
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKSimplePrimaryButtonCellView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSimplePrimaryButtonCellView;
  -[PKSimplePrimaryButtonCellView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKSimplePrimaryButtonCellView bounds](self, "bounds");
  -[PKSimplePrimaryButtonCellView _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height;
  double width;
  double y;
  double x;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  double v11;
  double v12;
  double v13;
  UILabel *titleView;
  void *v15;
  int64_t v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect slice;
  CGRect remainder;
  CGSize result;
  CGRect v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKSimplePrimaryButtonCellView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  v11 = x + 10.0;
  v12 = y + 0.0;
  v23 = width;
  v13 = width + -20.0;
  remainder.origin.x = v11;
  remainder.origin.y = v12;
  remainder.size.width = width + -20.0;
  remainder.size.height = height;
  titleView = self->_titleView;
  -[PKSimplePrimaryButtonCellView _titleFont](self, "_titleFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleView, "setFont:", v15);

  v16 = 4;
  if (IsAccessibilityCategory)
    v16 = 0;
  self->_titleLineBreakMode = v16;
  -[UILabel setNumberOfLines:](self->_titleView, "setNumberOfLines:", !IsAccessibilityCategory);
  memset(&slice, 0, sizeof(slice));
  -[UILabel setTextAlignment:](self->_titleView, "setTextAlignment:", 1);
  -[UILabel sizeThatFits:](self->_titleView, "sizeThatFits:", width + -20.0, 1.79769313e308);
  v18 = v17;
  v27.origin.x = v11;
  v27.origin.y = v12;
  v27.size.width = v13;
  v27.size.height = height;
  CGRectDivide(v27, &slice, &remainder, self->_topPadding + 10.0, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v18, CGRectMinYEdge);
  PKFloatRoundToPixel();
  v20 = v19;
  if (!self->_isTemplateLayout)
  {
    PKRectRoundToPixel();
    -[UILabel setFrame:](self->_titleView, "setFrame:");
  }
  v21 = v23;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *title;
  NSString *v10;
  NSString *v11;

  v4 = a3;
  v5 = self->_title;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

    title = v11;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v10 = v8;
    title = self->_title;
    self->_title = v10;
  }

  v8 = v11;
LABEL_10:

}

- (void)setPass:(id)a3
{
  PKPaymentPass **p_pass;
  id v5;

  p_pass = &self->_pass;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_pass, a3);

}

- (void)setTitleColor:(id)a3
{
  UIColor **p_titleColor;
  id v5;

  p_titleColor = &self->_titleColor;
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
    objc_storeStrong((id *)p_titleColor, a3);

}

- (void)setTitleLineBreakMode:(int64_t)a3
{
  if (self->_titleLineBreakMode != a3)
    self->_titleLineBreakMode = a3;
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  -[PKSimplePrimaryButtonCellView layoutIfNeeded](self, "layoutIfNeeded");
  self->_animated = 0;
}

- (void)beginUpdates
{
  ++self->_deferUpdateCounter;
}

- (void)endUpdates:(BOOL)a3
{
  unint64_t v3;

  v3 = self->_deferUpdateCounter - 1;
  self->_deferUpdateCounter = v3;
  if (!v3)
    -[PKSimplePrimaryButtonCellView _updateContent:](self, "_updateContent:", a3);
}

- (void)_updateContent:(BOOL)a3
{
  _BOOL4 v3;
  UILabel *titleView;
  NSString *title;
  UIColor *titleColor;
  void *v8;
  int64_t titleLineBreakMode;
  UILabel *v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  float v16;
  double v17;
  void *v18;
  id v19;
  double v20;

  if (!self->_deferUpdateCounter)
  {
    v3 = a3;
    titleView = self->_titleView;
    title = self->_title;
    titleColor = self->_titleColor;
    v8 = titleColor;
    if (!titleColor)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    titleLineBreakMode = self->_titleLineBreakMode;
    v10 = titleView;
    if (v10)
      v11 = v8 == 0;
    else
      v11 = 1;
    if (!v11)
    {
      if (!titleLineBreakMode)
        titleLineBreakMode = 4;
      v12 = v8;
      -[UILabel setText:](v10, "setText:", title);
      -[UILabel setTextColor:](v10, "setTextColor:", v12);

      -[UILabel setLineBreakMode:](v10, "setLineBreakMode:", titleLineBreakMode);
      if (v3)
      {
        -[UILabel layer](v10, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (title)
          v15 = 1.0;
        else
          v15 = 0.0;
        objc_msgSend(v13, "opacity");
        v17 = v16;
        if (v15 != v16)
        {
          objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v17, v15);
          v19 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v18);

          LODWORD(v20) = 0;
          if (title)
            *(float *)&v20 = 1.0;
          objc_msgSend(v14, "setOpacity:", v20);
        }

      }
    }

    if (!titleColor)
    -[PKSimplePrimaryButtonCellView setNeedsLayout](self, "setNeedsLayout");
    if (v3)
      -[PKSimplePrimaryButtonCellView layoutIfNeededAnimated:](self, "layoutIfNeededAnimated:", 1);
  }
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
