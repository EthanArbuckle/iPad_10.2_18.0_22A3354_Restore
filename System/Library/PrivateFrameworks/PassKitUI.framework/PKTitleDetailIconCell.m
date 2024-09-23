@implementation PKTitleDetailIconCell

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTitleDetailIconCell;
  -[PKTitleDetailIconCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKTitleDetailIconCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKTitleDetailIconCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKTitleDetailIconCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRectEdge v11;
  UIImage *icon;
  uint64_t v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  UIImage *v18;
  CGSize v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGSize v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGPoint v33;
  CGSize v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  CGSize v45;
  CGPoint v46;
  CGRect v47;
  CGRect v48;
  CGRect slice;
  CGRect remainder;
  CGRect v51;
  CGSize result;
  CGRect v53;

  width = a3.size.width;
  v7 = a3.origin.x + 12.0;
  v8 = a3.origin.y + 12.0;
  v9 = a3.size.width + -24.0;
  v10 = a3.size.height + -24.0;
  if (-[PKTitleDetailIconCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v11 = CGRectMaxXEdge;
  else
    v11 = CGRectMinXEdge;
  memset(&v51, 0, sizeof(v51));
  remainder.origin.x = v7;
  remainder.origin.y = v8;
  remainder.size.width = width + -24.0;
  remainder.size.height = v10;
  icon = self->_icon;
  v13 = MEMORY[0x1E0C9D648];
  if (icon)
  {
    -[UIImage size](icon, "size");
    v15 = v14;
    v17 = v16;
    v18 = self->_icon;
    v19 = *(CGSize *)(v13 + 16);
    slice.origin = *(CGPoint *)v13;
    slice.size = v19;
    if (v18)
    {
      v53.origin.x = v7;
      v53.origin.y = v8;
      v53.size.width = width + -24.0;
      v53.size.height = v10;
      CGRectDivide(v53, &slice, &remainder, v15, v11);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      slice.origin.x = v20;
      slice.origin.y = v21;
      slice.size.width = v22;
      slice.size.height = v23;
      CGRectDivide(remainder, &v51, &remainder, 10.0, v11);
      CGRectDivide(remainder, &v51, &remainder, self->_additionalIconPadding, v11);
      v9 = remainder.size.width;
    }
  }
  else
  {
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v24 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    slice.size = v24;
  }
  if (self->_titleText)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, v10);
    v26 = v25;
    v28 = v27;
  }
  else
  {
    v26 = *MEMORY[0x1E0C9D820];
    v28 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  if (self->_detailText)
  {
    -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v9, v10);
    v30 = v29;
    v32 = v31;
  }
  else
  {
    v30 = *MEMORY[0x1E0C9D820];
    v32 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v33 = *(CGPoint *)v13;
  v34 = *(CGSize *)(v13 + 16);
  v48.origin = *(CGPoint *)v13;
  v48.size = v34;
  if (v26 > 0.0)
  {
    v45 = v34;
    v46 = v33;
    CGRectDivide(remainder, &v48, &remainder, v28, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v48.origin.x = v35;
    v48.origin.y = v36;
    v34 = v45;
    v33 = v46;
    v48.size.width = v37;
    v48.size.height = v38;
  }
  v47.origin = v33;
  v47.size = v34;
  if (v30 > 0.0)
  {
    CGRectDivide(remainder, &v47, &remainder, v32, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v47.origin.x = v39;
    v47.origin.y = v40;
    v47.size.width = v41;
    v47.size.height = v42;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
    -[UIImageView setFrame:](self->_iconView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  v43 = fmax(v17, v28 + v32) + 0.0 + 24.0;
  v44 = width;
  result.height = v43;
  result.width = v44;
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
    -[PKTitleDetailIconCell _configureView](self, "_configureView");
  }
LABEL_9:

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
    -[PKTitleDetailIconCell _configureView](self, "_configureView");
  }
LABEL_9:

}

- (void)setTitleFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    -[PKTitleDetailIconCell _configureView](self, "_configureView");
  }

}

- (void)setDetailFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailFont, a3);
    -[PKTitleDetailIconCell _configureView](self, "_configureView");
  }

}

- (void)setTitleTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    -[PKTitleDetailIconCell _configureView](self, "_configureView");
  }

}

- (void)setDetailTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_detailTextColor, a3);
    -[PKTitleDetailIconCell _configureView](self, "_configureView");
  }

}

- (void)setIcon:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_icon != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    -[PKTitleDetailIconCell _configureView](self, "_configureView");
    v5 = v6;
  }

}

- (void)setAdditionalIconPadding:(double)a3
{
  if (self->_additionalIconPadding != a3)
  {
    self->_additionalIconPadding = a3;
    -[PKTitleDetailIconCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCenterTitleText:(BOOL)a3
{
  if (self->_centerTitleText != a3)
  {
    self->_centerTitleText = a3;
    -[PKTitleDetailIconCell _configureView](self, "_configureView");
  }
}

- (void)setCenterDetailText:(BOOL)a3
{
  if (self->_centerDetailText != a3)
  {
    self->_centerDetailText = a3;
    -[PKTitleDetailIconCell _configureView](self, "_configureView");
  }
}

- (void)_configureView
{
  int v3;
  UILabel *titleLabel;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  UILabel *detailLabel;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  UIImage *icon;
  UIImageView *iconView;
  UIImageView *v24;
  UIImageView *v25;
  UIImageView *v26;
  id v27;

  -[PKTitleDetailIconCell contentView](self, "contentView");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PKTitleDetailIconCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  titleLabel = self->_titleLabel;
  if (self->_titleText)
  {
    if (!titleLabel)
    {
      v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v6 = self->_titleLabel;
      self->_titleLabel = v5;

      -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
      objc_msgSend(v27, "addSubview:", self->_titleLabel);
      titleLabel = self->_titleLabel;
    }
    if (self->_titleFont)
    {
      -[UILabel setFont:](titleLabel, "setFont:");
    }
    else
    {
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](titleLabel, "setFont:", v8);

    }
    v9 = self->_titleLabel;
    if (self->_titleTextColor)
    {
      -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v9, "setTextColor:", v10);

    }
    -[UILabel setText:](self->_titleLabel, "setText:", self->_titleText);
    v11 = 2;
    if (!v3)
      v11 = 0;
    if (self->_centerTitleText)
      v12 = 1;
    else
      v12 = v11;
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v12);
    -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  }
  else
  {
    -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
    v7 = self->_titleLabel;
    self->_titleLabel = 0;

  }
  detailLabel = self->_detailLabel;
  if (self->_detailText)
  {
    if (!detailLabel)
    {
      v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v15 = self->_detailLabel;
      self->_detailLabel = v14;

      -[UILabel setNumberOfLines:](self->_detailLabel, "setNumberOfLines:", 0);
      objc_msgSend(v27, "addSubview:", self->_detailLabel);
      detailLabel = self->_detailLabel;
    }
    if (self->_detailFont)
    {
      -[UILabel setFont:](detailLabel, "setFont:");
    }
    else
    {
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48D0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](detailLabel, "setFont:", v17);

    }
    v18 = self->_detailLabel;
    if (self->_detailTextColor)
    {
      -[UILabel setTextColor:](self->_detailLabel, "setTextColor:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v18, "setTextColor:", v19);

    }
    -[UILabel setText:](self->_detailLabel, "setText:", self->_detailText);
    v20 = 2;
    if (!v3)
      v20 = 0;
    if (self->_centerDetailText)
      v21 = 1;
    else
      v21 = v20;
    -[UILabel setTextAlignment:](self->_detailLabel, "setTextAlignment:", v21);
    -[UILabel setAccessibilityIdentifier:](self->_detailLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
  }
  else
  {
    -[UILabel removeFromSuperview](self->_detailLabel, "removeFromSuperview");
    v16 = self->_detailLabel;
    self->_detailLabel = 0;

  }
  icon = self->_icon;
  iconView = self->_iconView;
  if (icon)
  {
    if (!iconView)
    {
      v24 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v25 = self->_iconView;
      self->_iconView = v24;

      objc_msgSend(v27, "addSubview:", self->_iconView);
      iconView = self->_iconView;
      icon = self->_icon;
    }
    -[UIImageView setImage:](iconView, "setImage:", icon);
  }
  else
  {
    -[UIImageView removeFromSuperview](iconView, "removeFromSuperview");
    v26 = self->_iconView;
    self->_iconView = 0;

  }
  -[PKTitleDetailIconCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)prepareForReuse
{
  UILabel *titleLabel;
  UILabel *detailLabel;
  NSString *titleText;
  NSString *detailText;
  UIImage *icon;
  UIColor *titleTextColor;
  UIColor *detailTextColor;
  UIFont *titleFont;
  UIFont *detailFont;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKTitleDetailIconCell;
  -[PKTitleDetailIconCell prepareForReuse](&v12, sel_prepareForReuse);
  -[UILabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_detailLabel, "removeFromSuperview");
  -[UIImageView removeFromSuperview](self->_iconView, "removeFromSuperview");
  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

  detailLabel = self->_detailLabel;
  self->_detailLabel = 0;

  titleText = self->_titleText;
  self->_titleText = 0;

  detailText = self->_detailText;
  self->_detailText = 0;

  icon = self->_icon;
  self->_icon = 0;

  titleTextColor = self->_titleTextColor;
  self->_titleTextColor = 0;

  detailTextColor = self->_detailTextColor;
  self->_detailTextColor = 0;

  titleFont = self->_titleFont;
  self->_titleFont = 0;

  detailFont = self->_detailFont;
  self->_detailFont = 0;

  self->_additionalIconPadding = 0.0;
  self->_centerTitleText = 0;
  self->_centerDetailText = 0;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIImage)icon
{
  return self->_icon;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)detailFont
{
  return self->_detailFont;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)detailTextColor
{
  return self->_detailTextColor;
}

- (BOOL)centerTitleText
{
  return self->_centerTitleText;
}

- (BOOL)centerDetailText
{
  return self->_centerDetailText;
}

- (double)additionalIconPadding
{
  return self->_additionalIconPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_detailFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
