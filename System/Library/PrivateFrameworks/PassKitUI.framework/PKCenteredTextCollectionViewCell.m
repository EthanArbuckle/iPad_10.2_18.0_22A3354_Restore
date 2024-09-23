@implementation PKCenteredTextCollectionViewCell

- (PKCenteredTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKCenteredTextCollectionViewCell *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *titleLabel;
  void *v11;
  uint64_t v12;
  UILabel *subtitleLabel;
  UILabel *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKCenteredTextCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    -[PKCenteredTextCollectionViewCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v3->_titleLabel);

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v12;

    v14 = v3->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v3->_subtitleLabel, "setTextAlignment:", 1);
    -[PKCenteredTextCollectionViewCell contentView](v3, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v3->_subtitleLabel);

  }
  return v3;
}

- (void)resetFonts
{
  void *v3;
  uint64_t v4;
  UILabel *titleLabel;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  UILabel *subtitleLabel;
  void *v11;

  -[UILabel text](self->_subtitleLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  titleLabel = self->_titleLabel;
  v6 = (NSString *)*MEMORY[0x1E0DC48D0];
  if (v4)
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B60], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](titleLabel, "setFont:", v7);

    v8 = (NSString *)*MEMORY[0x1E0DC4A88];
  }
  else
  {
    v8 = (NSString *)*MEMORY[0x1E0DC4A88];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](titleLabel, "setFont:", v9);

  }
  subtitleLabel = self->_subtitleLabel;
  PKFontForDefaultDesign(v8, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](subtitleLabel, "setFont:", v11);

  -[PKCenteredTextCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  UILabel *titleLabel;
  UILabel *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UILabel *subtitleLabel;
  uint64_t v27;
  CGRect remainder;
  CGRect slice;
  objc_super v30;
  CGRect v31;

  v30.receiver = self;
  v30.super_class = (Class)PKCenteredTextCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v30, sel_layoutSubviews);
  -[PKCenteredTextCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9 + -32.0, v11);
  v13 = v12;
  -[UILabel text](self->_subtitleLabel, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v9 + -32.0, v11);
    v27 = v15;
    v17 = v16;
  }
  else
  {
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v27 = *MEMORY[0x1E0C9D820];
  }

  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v5;
  remainder.origin.y = v7;
  remainder.size.width = v9;
  remainder.size.height = v11;
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  CGRectDivide(v31, &slice, &remainder, 16.0, CGRectMinXEdge);
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMaxXEdge);
  PKFloatCeilToPixel();
  v19 = v18;
  CGRectDivide(remainder, &slice, &remainder, v18, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v19, CGRectMaxYEdge);
  CGRectDivide(remainder, &slice, &remainder, v13, CGRectMinYEdge);
  titleLabel = self->_titleLabel;
  PKSizeAlignedInRect();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  if (v17 <= 0.0)
  {
    subtitleLabel = self->_subtitleLabel;
    v22 = *MEMORY[0x1E0C9D648];
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, v17, CGRectMinYEdge);
    v21 = self->_subtitleLabel;
    PKSizeAlignedInRect();
    subtitleLabel = v21;
  }
  -[UILabel setFrame:](subtitleLabel, "setFrame:", v22, v23, v24, v25, v27);
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = objc_msgSend(v8, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[UILabel setText:](self->_titleLabel, "setText:", v8);
    -[PKCenteredTextCollectionViewCell resetFonts](self, "resetFonts");
    -[PKCenteredTextCollectionViewCell updateTitleTextColor](self, "updateTitleTextColor");
    -[PKCenteredTextCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[UILabel text](self->_subtitleLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = objc_msgSend(v8, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[UILabel setText:](self->_subtitleLabel, "setText:", v8);
    -[PKCenteredTextCollectionViewCell resetFonts](self, "resetFonts");
    -[PKCenteredTextCollectionViewCell updateTitleTextColor](self, "updateTitleTextColor");
    -[PKCenteredTextCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)updateTitleTextColor
{
  void *v3;
  uint64_t v4;
  UILabel *titleLabel;
  id v6;

  -[UILabel text](self->_subtitleLabel, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  titleLabel = self->_titleLabel;
  if (v4)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](titleLabel, "setTextColor:", v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKCenteredTextCollectionViewCell;
  -[PKCenteredTextCollectionViewCell traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PKCenteredTextCollectionViewCell traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
        -[PKCenteredTextCollectionViewCell resetFonts](self, "resetFonts");
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
