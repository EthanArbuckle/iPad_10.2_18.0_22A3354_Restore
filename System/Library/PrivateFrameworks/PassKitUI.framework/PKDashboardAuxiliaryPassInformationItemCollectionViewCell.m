@implementation PKDashboardAuxiliaryPassInformationItemCollectionViewCell

- (PKDashboardAuxiliaryPassInformationItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKDashboardAuxiliaryPassInformationItemCollectionViewCell *v3;
  PKDashboardAuxiliaryPassInformationItemCollectionViewCell *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UILabel *titleLabel;
  UILabel *v13;
  void *v14;
  uint64_t v15;
  UILabel *subtitleLabel;
  UILabel *v17;
  void *v18;
  uint64_t v19;
  UILabel *subtitle2Label;
  UILabel *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  UIImageView *disclosureView;
  UIImageView *v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PKDashboardAuxiliaryPassInformationItemCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v11;

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0);
    v13 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v15;

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_subtitleLabel, "setLineBreakMode:", 0);
    v17 = v4->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    subtitle2Label = v4->_subtitle2Label;
    v4->_subtitle2Label = (UILabel *)v19;

    -[UILabel setNumberOfLines:](v4->_subtitle2Label, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_subtitle2Label, "setLineBreakMode:", 0);
    v21 = v4->_subtitle2Label;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v21, "setTextColor:", v22);

    -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell _setFonts](v4, "_setFonts");
    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    objc_msgSend(v5, "addSubview:", v4->_subtitleLabel);
    objc_msgSend(v5, "addSubview:", v4->_subtitle2Label);
    v23 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIChevronImage();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithImage:", v24);
    disclosureView = v4->_disclosureView;
    v4->_disclosureView = (UIImageView *)v25;

    -[UIImageView setContentMode:](v4->_disclosureView, "setContentMode:", 1);
    v27 = v4->_disclosureView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v27, "setTintColor:", v28);

    objc_msgSend(v5, "addSubview:", v4->_disclosureView);
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKDashboardAuxiliaryPassInformationItemCollectionViewCell;
  -[PKDashboardCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell _setTitle:](self, "_setTitle:", 0);
  -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell setSubtitle:](self, "setSubtitle:", 0);
  -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell setSubtitle2:](self, "setSubtitle2:", 0);
  -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell setHideDisclosure:](self, "setHideDisclosure:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDashboardAuxiliaryPassInformationItemCollectionViewCell;
  -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v7, (UIContentSizeCategory)v8))
    {

LABEL_6:
      -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell _setFonts](self, "_setFonts");
      goto LABEL_7;
    }
    v9 = objc_msgSend(v4, "legibilityWeight");
    v10 = objc_msgSend(v6, "legibilityWeight");

    if (v9 != v10)
      goto LABEL_6;
  }
LABEL_7:

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
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
  CGSize result;

  width = a3.width;
  v5 = a3.width + -32.0;
  v6 = 0.0;
  if (!self->_hideDisclosure)
  {
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v5, 1.79769313e308);
    v6 = v7 + 16.0;
  }
  v8 = v5 - v6;
  -[UILabel pkui_sizeThatFits:](self->_titleLabel, "pkui_sizeThatFits:", v8, 1.79769313e308);
  v10 = v9;
  -[UILabel pkui_sizeThatFits:](self->_subtitleLabel, "pkui_sizeThatFits:", v8, 1.79769313e308);
  v12 = v11;
  -[UILabel pkui_sizeThatFits:](self->_subtitle2Label, "pkui_sizeThatFits:", v8, 1.79769313e308);
  if (!self->_subtitle2)
    v13 = 0.0;
  v14 = v10 + 32.0 + v12 + v13;
  -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell _maxWidthForTransactionCellInWidth:](self, "_maxWidthForTransactionCellInWidth:", width);
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRectEdge v16;
  double v17;
  double v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect *v23;
  double v24;
  double v25;
  UILabel *titleLabel;
  CGRect *v27;
  CGFloat v28;
  double v29;
  double v30;
  UILabel *subtitleLabel;
  CGRect *v32;
  CGFloat v33;
  double v34;
  double v35;
  UILabel *subtitle2Label;
  CGRect *v37;
  CGFloat v38;
  double v39;
  double v40;
  CGRect v41;
  CGRect remainder;
  objc_super v43;
  CGRect v44;
  CGRect v45;

  v43.receiver = self;
  v43.super_class = (Class)PKDashboardAuxiliaryPassInformationItemCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v43, sel_layoutSubviews);
  -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  memset(&v41, 0, sizeof(v41));
  v12 = v5 + 16.0;
  v13 = v7 + 16.0;
  v14 = v9 + -32.0;
  remainder.origin.x = v12;
  remainder.origin.y = v13;
  v15 = v11 + -32.0;
  remainder.size.width = v14;
  remainder.size.height = v15;
  if (-[PKDashboardAuxiliaryPassInformationItemCollectionViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v16 = CGRectMinXEdge;
  else
    v16 = CGRectMaxXEdge;
  if (self->_hideDisclosure)
  {
    v17 = *MEMORY[0x1E0C9D820];
  }
  else
  {
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v14, v15);
    v17 = v18;
  }
  if (v17 > 0.0)
  {
    v44.origin.x = v12;
    v44.origin.y = v13;
    v44.size.width = v14;
    v44.size.height = v15;
    CGRectDivide(v44, &v41, &remainder, v17, v16);
    x = remainder.origin.x;
    y = remainder.origin.y;
    width = remainder.size.width;
    height = remainder.size.height;
    remainder = v41;
    if (self->_hideDisclosure)
    {
      v23 = (CGRect *)MEMORY[0x1E0C9D648];
      v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    }
    else
    {
      v23 = &v41;
      CGRectDivide(remainder, &v41, &remainder, v17, v16);
      v24 = v41.origin.y;
      v25 = v41.size.width;
    }
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", v23->origin.x, v24, v25, v23->size.height);
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    CGRectDivide(v45, &v41, &remainder, 16.0, v16);
  }
  titleLabel = self->_titleLabel;
  if (self->_title)
  {
    -[UILabel pkui_sizeThatFits:](titleLabel, "pkui_sizeThatFits:", remainder.size.width, 1.79769313e308);
    v27 = &v41;
    CGRectDivide(remainder, &v41, &remainder, v28, CGRectMinYEdge);
    titleLabel = self->_titleLabel;
    v29 = v41.origin.y;
    v30 = v41.size.width;
  }
  else
  {
    v27 = (CGRect *)MEMORY[0x1E0C9D648];
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v30 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  }
  -[UILabel setFrame:](titleLabel, "setFrame:", v27->origin.x, v29, v30, v27->size.height);
  subtitleLabel = self->_subtitleLabel;
  if (self->_subtitle)
  {
    -[UILabel pkui_sizeThatFits:](subtitleLabel, "pkui_sizeThatFits:", remainder.size.width, 1.79769313e308);
    v32 = &v41;
    CGRectDivide(remainder, &v41, &remainder, v33, CGRectMinYEdge);
    subtitleLabel = self->_subtitleLabel;
    v34 = v41.origin.y;
    v35 = v41.size.width;
  }
  else
  {
    v32 = (CGRect *)MEMORY[0x1E0C9D648];
    v34 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v35 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  }
  -[UILabel setFrame:](subtitleLabel, "setFrame:", v32->origin.x, v34, v35, v32->size.height);
  subtitle2Label = self->_subtitle2Label;
  if (self->_subtitle2)
  {
    -[UILabel pkui_sizeThatFits:](subtitle2Label, "pkui_sizeThatFits:", remainder.size.width, 1.79769313e308);
    v37 = &v41;
    CGRectDivide(remainder, &v41, &remainder, v38, CGRectMinYEdge);
    subtitle2Label = self->_subtitle2Label;
    v39 = v41.origin.y;
    v40 = v41.size.width;
  }
  else
  {
    v37 = (CGRect *)MEMORY[0x1E0C9D648];
    v39 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v40 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  }
  -[UILabel setFrame:](subtitle2Label, "setFrame:", v37->origin.x, v39, v40, v37->size.height);
}

- (void)_setTitle:(id)a3
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
    -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
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
    -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setSubtitle2:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *subtitle2;
  NSString *v10;

  v4 = a3;
  v5 = self->_subtitle2;
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
    subtitle2 = self->_subtitle2;
    self->_subtitle2 = v8;

    -[UILabel setText:](self->_subtitle2Label, "setText:", self->_subtitle2);
    -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setHideDisclosure:(BOOL)a3
{
  if (((!self->_hideDisclosure ^ a3) & 1) == 0)
  {
    self->_hideDisclosure = a3;
    -[UIImageView setHidden:](self->_disclosureView, "setHidden:");
    -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)_maxWidthForTransactionCellInWidth:(double)a3
{
  double v4;

  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset");
  return a3 + v4 * -2.0;
}

- (void)_setFonts
{
  UILabel *titleLabel;
  NSString *v4;
  void *v5;
  UILabel *subtitleLabel;
  NSString *v7;
  void *v8;
  UILabel *subtitle2Label;
  id v10;

  titleLabel = self->_titleLabel;
  v4 = (NSString *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AD0], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v5);

  subtitleLabel = self->_subtitleLabel;
  v7 = (NSString *)*MEMORY[0x1E0DC4A90];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A90], v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](subtitleLabel, "setFont:", v8);

  subtitle2Label = self->_subtitle2Label;
  PKFontForDefaultDesign(v7, v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](subtitle2Label, "setFont:", v10);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)subtitle2
{
  return self->_subtitle2;
}

- (BOOL)hideDisclosure
{
  return self->_hideDisclosure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle2, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_subtitle2Label, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
