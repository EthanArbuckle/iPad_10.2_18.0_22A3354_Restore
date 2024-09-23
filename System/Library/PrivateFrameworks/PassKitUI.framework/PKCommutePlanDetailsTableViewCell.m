@implementation PKCommutePlanDetailsTableViewCell

- (PKCommutePlanDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[PKCommutePlanDetailsTableViewCell initWithStyle:reuseIdentifier:passDetailViewStyle:](self, "initWithStyle:reuseIdentifier:passDetailViewStyle:", a3, a4, 0);
}

- (PKCommutePlanDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 passDetailViewStyle:(int64_t)a5
{
  PKCommutePlanDetailsTableViewCell *v6;
  PKCommutePlanDetailsTableViewCell *v7;
  void *v8;
  UILabel *v9;
  UILabel *primaryLabel;
  UILabel *v11;
  NSString *v12;
  void *v13;
  UILabel *v14;
  UILabel *secondaryLabel;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PKCommutePlanDetailsTableViewCell;
  v6 = -[PKCommutePlanDetailsTableViewCell initWithStyle:reuseIdentifier:](&v24, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v7 = v6;
  if (v6)
  {
    -[PKCommutePlanDetailsTableViewCell contentView](v6, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primaryLabel = v7->_primaryLabel;
    v7->_primaryLabel = v9;

    -[UILabel setNumberOfLines:](v7->_primaryLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v7->_primaryLabel, "setLineBreakMode:", 0);
    v11 = v7->_primaryLabel;
    v12 = (NSString *)*MEMORY[0x1E0DC4938];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4938]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v13);

    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryLabel = v7->_secondaryLabel;
    v7->_secondaryLabel = v14;

    -[UILabel setNumberOfLines:](v7->_secondaryLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v7->_secondaryLabel, "setLineBreakMode:", 0);
    v16 = v7->_secondaryLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16, "setFont:", v17);

    v18 = v7->_primaryLabel;
    if (a5 == 2)
    {
      PKBridgeAppearanceGetAppearanceSpecifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v18, "setTextColor:", v20);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v18, "setTextColor:", v21);

      v22 = v7->_secondaryLabel;
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v22, "setTextColor:", v19);
    }

    objc_msgSend(v8, "addSubview:", v7->_primaryLabel);
    objc_msgSend(v8, "addSubview:", v7->_secondaryLabel);

  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCommutePlanDetailsTableViewCell;
  -[PKCommutePlanDetailsTableViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKCommutePlanDetailsTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKCommutePlanDetailsTableViewCell _layoutWithBounds:](self, "_layoutWithBounds:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_templateLayout = 1;
  -[PKCommutePlanDetailsTableViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, 1.79769313e308);
  self->_templateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)prepareForReuse
{
  NSString *primaryText;
  NSString *secondaryText;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCommutePlanDetailsTableViewCell;
  -[PKCommutePlanDetailsTableViewCell prepareForReuse](&v5, sel_prepareForReuse);
  primaryText = self->_primaryText;
  self->_primaryText = 0;

  secondaryText = self->_secondaryText;
  self->_secondaryText = 0;

}

- (void)setPrimaryText:(id)a3
{
  id v4;
  NSString *primaryText;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  primaryText = self->_primaryText;
  v10 = (NSString *)v4;
  v6 = primaryText;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSString isEqualToString:](v10, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_primaryText;
    self->_primaryText = v8;

    -[UILabel setText:](self->_primaryLabel, "setText:", self->_primaryText);
    -[PKCommutePlanDetailsTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setSecondaryText:(id)a3
{
  id v4;
  NSString *secondaryText;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = a3;
  secondaryText = self->_secondaryText;
  v10 = (NSString *)v4;
  v6 = secondaryText;
  if (v6 == v10)
  {

  }
  else
  {
    if (v10 && v6)
    {
      v7 = -[NSString isEqualToString:](v10, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    v9 = self->_secondaryText;
    self->_secondaryText = v8;

    -[UILabel setText:](self->_secondaryLabel, "setText:", self->_secondaryText);
    -[PKCommutePlanDetailsTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  UILabel *primaryLabel;
  CGFloat v15;
  double v16;
  float v17;
  double v18;
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
  memset(&slice, 0, sizeof(slice));
  -[UITableViewCell pkui_effectiveLayoutMargins](self, "pkui_effectiveLayoutMargins");
  v10 = width - (v8 + v9);
  remainder.origin.x = x + v8;
  remainder.origin.y = y + 10.0;
  remainder.size.width = v10;
  remainder.size.height = height + -20.0;
  -[PKCommutePlanDetailsTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_primaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v10, height + -20.0);
  v12 = v11;
  v27.origin.x = remainder.origin.x;
  v27.origin.y = y + 10.0;
  v27.size.width = v10;
  v27.size.height = height + -20.0;
  CGRectDivide(v27, &slice, &remainder, v12, CGRectMinYEdge);
  v22 = slice.origin.y;
  v23 = slice.origin.x;
  v20 = slice.size.height;
  v21 = slice.size.width;
  CGRectDivide(remainder, &slice, &remainder, 4.0, CGRectMinYEdge);
  v13 = v12 + 4.0 + 20.0;
  if (PKStringIsBlank(self->_secondaryText))
  {
    if (!self->_templateLayout)
    {
      primaryLabel = self->_primaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](primaryLabel, "setFrame:");
    }
  }
  else
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_secondaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    v16 = v15;
    CGRectDivide(remainder, &slice, &remainder, v15, CGRectMinYEdge);
    if (!self->_templateLayout)
    {
      -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v23, v22, v21, v20);
      -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    }
    v13 = v13 + v16;
  }
  v17 = v13;
  v18 = ceilf(v17);
  v19 = width;
  result.height = v18;
  result.width = v19;
  return result;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
