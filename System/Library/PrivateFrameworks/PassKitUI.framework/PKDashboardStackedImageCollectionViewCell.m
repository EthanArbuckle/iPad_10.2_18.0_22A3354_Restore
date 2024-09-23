@implementation PKDashboardStackedImageCollectionViewCell

- (PKDashboardStackedImageCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKDashboardStackedImageCollectionViewCell *v3;
  PKDashboardStackedImageCollectionViewCell *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UIImageView *iconImageView;
  void *v13;
  id v14;
  uint64_t v15;
  UILabel *titleLabel;
  UILabel *v17;
  void *v18;
  uint64_t v19;
  UILabel *subtitleLabel;
  UILabel *v21;
  NSString *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  uint64_t v26;
  UILabel *tertiaryLabel;
  UILabel *v28;
  void *v29;
  UILabel *v30;
  void *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)PKDashboardStackedImageCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKDashboardStackedImageCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v11;

    -[UIImageView _setContinuousCornerRadius:](v4->_iconImageView, "_setContinuousCornerRadius:", 8.0);
    -[UIImageView setClipsToBounds:](v4->_iconImageView, "setClipsToBounds:", 1);
    -[UIImageView setContentMode:](v4->_iconImageView, "setContentMode:", 1);
    -[UIImageView layer](v4->_iconImageView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "setBorderColor:", objc_msgSend(v14, "CGColor"));

    objc_msgSend(v13, "setBorderWidth:", PKUIPixelLength());
    objc_msgSend(v5, "addSubview:", v4->_iconImageView);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v15;

    v17 = v4->_titleLabel;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], 0, 2, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v18);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v19;

    v21 = v4->_subtitleLabel;
    v22 = (NSString *)*MEMORY[0x1E0DC4B10];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v21, "setFont:", v23);

    v24 = v4->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v24, "setTextColor:", v25);

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 1);
    objc_msgSend(v5, "addSubview:", v4->_subtitleLabel);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    tertiaryLabel = v4->_tertiaryLabel;
    v4->_tertiaryLabel = (UILabel *)v26;

    v28 = v4->_tertiaryLabel;
    PKFontForDefaultDesign(v22, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v28, "setFont:", v29);

    v30 = v4->_tertiaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v30, "setTextColor:", v31);

    -[UILabel setNumberOfLines:](v4->_tertiaryLabel, "setNumberOfLines:", 2);
    -[UILabel setTextAlignment:](v4->_tertiaryLabel, "setTextAlignment:", 1);
    objc_msgSend(v5, "addSubview:", v4->_tertiaryLabel);

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PKDashboardStackedImageCollectionViewCell _maxWidthForTransactionCellInWidth:](self, "_maxWidthForTransactionCellInWidth:", a3.width, a3.height);
  v5 = v4;
  -[PKDashboardStackedImageCollectionViewCell _contentHeightWithWidth:](self, "_contentHeightWithWidth:", v4 + -32.0);
  v7 = fmax(v6 + 32.0, 200.0);
  v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)_contentHeightWithWidth:(double)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;

  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, a3, 1.79769313e308);
  v6 = v5 + 86.0;
  -[UILabel text](self->_subtitleLabel, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, a3, 1.79769313e308);
    v6 = v6 + v8 + 3.0;
  }
  -[UILabel text](self->_tertiaryLabel, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, a3, 1.79769313e308);
    return v6 + v10 + 3.0;
  }
  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double x;
  double y;
  double width;
  double height;
  double v16;
  double v17;
  CGFloat v18;
  UIImageView *iconImageView;
  CGFloat v20;
  UILabel *titleLabel;
  void *v22;
  CGFloat v23;
  UILabel *subtitleLabel;
  double v25;
  double v26;
  double v27;
  double v28;
  UILabel *v29;
  void *v30;
  CGFloat v31;
  UILabel *tertiaryLabel;
  double v33;
  double v34;
  double v35;
  double v36;
  UILabel *v37;
  CGRect v38;
  CGRect remainder;
  objc_super v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v40.receiver = self;
  v40.super_class = (Class)PKDashboardStackedImageCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v40, sel_layoutSubviews);
  -[PKDashboardStackedImageCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  x = v5 + 16.0;
  y = v7 + 16.0;
  width = v9 + -32.0;
  remainder.origin.x = x;
  remainder.origin.y = y;
  height = v11 + -32.0;
  remainder.size.width = width;
  remainder.size.height = height;
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  -[PKDashboardStackedImageCollectionViewCell _contentHeightWithWidth:](self, "_contentHeightWithWidth:", CGRectGetWidth(v41), (unsigned __int128)0, (unsigned __int128)0);
  v17 = v16;
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  if (v17 < CGRectGetHeight(v42))
  {
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    CGRectGetHeight(v43);
    PKFloatRoundToPixel();
    CGRectDivide(remainder, &v38, &remainder, v18, CGRectMinYEdge);
    x = remainder.origin.x;
    y = remainder.origin.y;
    width = remainder.size.width;
    height = remainder.size.height;
  }
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  CGRectDivide(v44, &v38, &remainder, 70.0, CGRectMinYEdge);
  iconImageView = self->_iconImageView;
  -[UIImage size](self->_icon, "size");
  PKSizeAspectFit();
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](iconImageView, "setFrame:");
  CGRectDivide(remainder, &v38, &remainder, 16.0, CGRectMinYEdge);
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v38, &remainder, v20, CGRectMinYEdge);
  titleLabel = self->_titleLabel;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  -[UILabel text](self->_subtitleLabel, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    CGRectDivide(remainder, &v38, &remainder, 3.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    CGRectDivide(remainder, &v38, &remainder, v23, CGRectMinYEdge);
    subtitleLabel = self->_subtitleLabel;
    PKSizeAlignedInRect();
    v29 = subtitleLabel;
  }
  else
  {
    v29 = self->_subtitleLabel;
    v25 = *MEMORY[0x1E0C9D648];
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  -[UILabel setFrame:](v29, "setFrame:", v25, v26, v27, v28);
  -[UILabel text](self->_tertiaryLabel, "text");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    CGRectDivide(remainder, &v38, &remainder, 3.0, CGRectMinYEdge);
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_tertiaryLabel, "pkui_sizeThatFits:forceWordWrap:", 1, remainder.size.width, remainder.size.height);
    CGRectDivide(remainder, &v38, &remainder, v31, CGRectMinYEdge);
    tertiaryLabel = self->_tertiaryLabel;
    PKSizeAlignedInRect();
    v37 = tertiaryLabel;
  }
  else
  {
    v37 = self->_tertiaryLabel;
    v33 = *MEMORY[0x1E0C9D648];
    v34 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v35 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v36 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  -[UILabel setFrame:](v37, "setFrame:", v33, v34, v35, v36);
}

- (void)setIcon:(id)a3
{
  UIImage **p_icon;
  id v6;

  p_icon = &self->_icon;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    -[UIImageView setImage:](self->_iconImageView, "setImage:", *p_icon);
    -[PKDashboardStackedImageCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

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

  v4 = a3;
  v5 = self->_title;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    title = self->_title;
    self->_title = v8;

    -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
    -[PKDashboardStackedImageCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setSubtitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *subtitle;
  NSString *v10;

  v4 = a3;
  v5 = self->_subtitle;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    subtitle = self->_subtitle;
    self->_subtitle = v8;

    -[UILabel setText:](self->_subtitleLabel, "setText:", self->_subtitle);
    -[PKDashboardStackedImageCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setTertiaryText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *tertiaryText;
  NSString *v10;

  v4 = a3;
  v5 = self->_tertiaryText;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    tertiaryText = self->_tertiaryText;
    self->_tertiaryText = v8;

    -[UILabel setText:](self->_tertiaryLabel, "setText:", self->_tertiaryText);
    -[PKDashboardStackedImageCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (double)_maxWidthForTransactionCellInWidth:(double)a3
{
  double v4;

  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
  return a3 + v4 * -2.0;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
