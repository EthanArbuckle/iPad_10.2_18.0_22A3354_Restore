@implementation PKDashboardTextCollectionViewCell

- (PKDashboardTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKDashboardTextCollectionViewCell *v3;
  PKDashboardTextCollectionViewCell *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UIImageView *iconImageView;
  uint64_t v13;
  UILabel *titleLabel;
  UILabel *v15;
  void *v16;
  uint64_t v17;
  UIImageView *titleImageView;
  UIImageView *v19;
  void *v20;
  uint64_t v21;
  UILabel *subtitleLabel;
  UILabel *v23;
  void *v24;
  uint64_t v25;
  UIImageView *subtitleImageView;
  UIImageView *v27;
  void *v28;
  uint64_t v29;
  UIImageView *accessoryImageView;
  UIImageView *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  UIImageView *disclosureView;
  UIImageView *v37;
  void *v38;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)PKDashboardTextCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKDashboardTextCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v13;

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 0);
    v15 = v4->_titleLabel;
    -[PKDashboardTextCollectionViewCell _defaultTitleColor](v4, "_defaultTitleColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
    titleImageView = v4->_titleImageView;
    v4->_titleImageView = (UIImageView *)v17;

    v19 = v4->_titleImageView;
    -[PKDashboardTextCollectionViewCell _defaultTitleColor](v4, "_defaultTitleColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v19, "setTintColor:", v20);

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v21;

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_subtitleLabel, "setLineBreakMode:", 0);
    v23 = v4->_subtitleLabel;
    -[PKDashboardTextCollectionViewCell _defaultSubtitleColor](v4, "_defaultSubtitleColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v23, "setTextColor:", v24);

    -[UILabel setAccessibilityIdentifier:](v4->_subtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
    subtitleImageView = v4->_subtitleImageView;
    v4->_subtitleImageView = (UIImageView *)v25;

    v27 = v4->_subtitleImageView;
    -[PKDashboardTextCollectionViewCell _defaultSubtitleColor](v4, "_defaultSubtitleColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v27, "setTintColor:", v28);

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
    accessoryImageView = v4->_accessoryImageView;
    v4->_accessoryImageView = (UIImageView *)v29;

    v31 = v4->_accessoryImageView;
    -[PKDashboardTextCollectionViewCell _defaultAccessoryColor](v4, "_defaultAccessoryColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v31, "setTintColor:", v32);

    -[PKDashboardTextCollectionViewCell _setFonts](v4, "_setFonts");
    objc_msgSend(v5, "addSubview:", v4->_iconImageView);
    objc_msgSend(v5, "addSubview:", v4->_titleLabel);
    objc_msgSend(v5, "addSubview:", v4->_titleImageView);
    objc_msgSend(v5, "addSubview:", v4->_subtitleLabel);
    objc_msgSend(v5, "addSubview:", v4->_subtitleImageView);
    objc_msgSend(v5, "addSubview:", v4->_accessoryImageView);
    v33 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIChevronImage();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "initWithImage:", v34);
    disclosureView = v4->_disclosureView;
    v4->_disclosureView = (UIImageView *)v35;

    -[UIImageView setContentMode:](v4->_disclosureView, "setContentMode:", 1);
    v37 = v4->_disclosureView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v37, "setTintColor:", v38);

    objc_msgSend(v5, "addSubview:", v4->_disclosureView);
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  int64_t textLayoutStyle;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  double v35;
  CGSize result;

  width = a3.width;
  v5 = 0.0;
  v6 = 0.0;
  if (!self->_hideDisclosure)
  {
    -[UIImageView bounds](self->_disclosureView, "bounds", a3.width, a3.height);
    a3.width = 16.0;
    v6 = v7 + 16.0;
  }
  if (self->_iconImage)
  {
    -[UIImageView image](self->_iconImageView, "image", a3.width, a3.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v5 = v9 + 10.0;

  }
  if (self->_accessoryImage)
  {
    -[UIImageView image](self->_accessoryImageView, "image", a3.width, a3.height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v12 = v11 + 16.0;

  }
  else
  {
    v12 = 0.0;
  }
  v13 = width + -32.0 - v5 - v6 - v12 + -32.0;
  -[UILabel pkui_sizeThatFits:](self->_titleLabel, "pkui_sizeThatFits:", v13, 1.79769313e308);
  v15 = v14;
  if (self->_titleImage)
  {
    -[UIImageView image](self->_titleImageView, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "pkui_alignmentSizeThatFits:maximumScale:", v13, 1.79769313e308, 1.0);
      v18 = v35;
    }
    else
    {
      v18 = 0.0;
    }

  }
  else
  {
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[UILabel pkui_sizeThatFits:](self->_subtitleLabel, "pkui_sizeThatFits:", v13, 1.79769313e308);
  v20 = v19;
  if (self->_subtitleImage)
  {
    -[UIImageView image](self->_subtitleImageView, "image");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "pkui_alignmentSizeThatFits:maximumScale:", v13, 1.79769313e308, 1.0);
      v23 = *((double *)&v31 + 1);
    }
    else
    {
      v34 = 0;
      v32 = 0u;
      v33 = 0u;
      v31 = 0u;
      v23 = 0.0;
    }

  }
  else
  {
    v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  textLayoutStyle = self->_textLayoutStyle;
  if (textLayoutStyle == 1)
  {
    if (v15 <= v18)
      v28 = v18;
    else
      v28 = v15;
    v26 = v28 + 32.0;
    if (v20 <= v23)
      v27 = v23;
    else
      v27 = v20;
    goto LABEL_32;
  }
  v25 = 0.0;
  if (!textLayoutStyle)
  {
    if (v15 <= v18)
      v26 = v18;
    else
      v26 = v15;
    v27 = 32.0;
LABEL_32:
    v25 = v26 + v27;
  }
  -[PKDashboardTextCollectionViewCell _maxWidthForTransactionCellInWidth:](self, "_maxWidthForTransactionCellInWidth:", width, v31, v32, v33, v34);
  v30 = v25;
  result.height = v30;
  result.width = v29;
  return result;
}

- (void)layoutSubviews
{
  int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  CGRectEdge v14;
  CGRectEdge v15;
  UIImageView *disclosureView;
  double *v17;
  CGFloat v18;
  UIImageView *accessoryImageView;
  void *v20;
  CGFloat v21;
  UIImageView *v22;
  UIImageView *iconImageView;
  void *v24;
  CGFloat v25;
  UIImageView *v26;
  int64_t textLayoutStyle;
  void *v28;
  CGFloat v29;
  UIImageView *subtitleImageView;
  void *v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UIImageView *v37;
  UILabel *subtitleLabel;
  CGFloat v39;
  UILabel *v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  UIImageView *titleImageView;
  double v48;
  double v49;
  double v50;
  double v51;
  UIImageView *v52;
  CGRect v53;
  CGRect remainder;
  objc_super v55;

  v55.receiver = self;
  v55.super_class = (Class)PKDashboardTextCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v55, sel_layoutSubviews);
  v3 = -[PKDashboardTextCollectionViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKDashboardTextCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v3 == 0;
  if (v3)
    v14 = CGRectMaxXEdge;
  else
    v14 = CGRectMinXEdge;
  memset(&v53, 0, sizeof(v53));
  remainder.origin.x = v6 + 16.0;
  remainder.origin.y = v8 + 16.0;
  remainder.size.width = v10 + -32.0;
  remainder.size.height = v12 + -32.0;
  if (v13)
    v15 = CGRectMaxXEdge;
  else
    v15 = CGRectMinXEdge;
  disclosureView = self->_disclosureView;
  v17 = (double *)MEMORY[0x1E0C9D648];
  if (self->_hideDisclosure)
  {
    -[UIImageView setFrame:](disclosureView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  else
  {
    -[UIImageView sizeThatFits:](disclosureView, "sizeThatFits:");
    CGRectDivide(remainder, &v53, &remainder, v18, v15);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size);
    CGRectDivide(remainder, &v53, &remainder, 16.0, v15);
  }
  accessoryImageView = self->_accessoryImageView;
  if (self->_accessoryImage)
  {
    -[UIImageView image](accessoryImageView, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "size");

    PKSizeAspectFit();
    CGRectDivide(remainder, &v53, &remainder, v21, v15);
    v22 = self->_accessoryImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](v22, "setFrame:");
    CGRectDivide(remainder, &v53, &remainder, 16.0, v15);
  }
  else
  {
    -[UIImageView setFrame:](accessoryImageView, "setFrame:", *v17, v17[1], v17[2], v17[3]);
  }
  iconImageView = self->_iconImageView;
  if (self->_iconImage)
  {
    -[UIImageView image](iconImageView, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "size");

    PKSizeAspectFit();
    CGRectDivide(remainder, &v53, &remainder, v25, v14);
    v26 = self->_iconImageView;
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](v26, "setFrame:");
    CGRectDivide(remainder, &v53, &remainder, 10.0, v14);
  }
  else
  {
    -[UIImageView setFrame:](iconImageView, "setFrame:", *v17, v17[1], v17[2], v17[3]);
  }
  textLayoutStyle = self->_textLayoutStyle;
  if (textLayoutStyle == 1)
  {
    if (self->_subtitleImage)
    {
      -[UIImageView image](self->_subtitleImageView, "image");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "size");

      PKSizeAspectFit();
      CGRectDivide(remainder, &v53, &remainder, v32, CGRectMaxYEdge);
      -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", *v17, v17[1], v17[2], v17[3]);
      subtitleImageView = self->_subtitleImageView;
      PKContentAlignmentMake();
      goto LABEL_22;
    }
    subtitleLabel = self->_subtitleLabel;
    if (self->_subtitle)
    {
      -[UILabel pkui_sizeThatFits:](subtitleLabel, "pkui_sizeThatFits:", remainder.size.width, 1.79769313e308);
      CGRectDivide(remainder, &v53, &remainder, v41, CGRectMaxYEdge);
      v40 = self->_subtitleLabel;
      goto LABEL_27;
    }
LABEL_28:
    v42 = *v17;
    v43 = v17[1];
    v44 = v17[2];
    v45 = v17[3];
    -[UILabel setFrame:](subtitleLabel, "setFrame:", *v17, v43, v44, v45, *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size);
    v37 = self->_subtitleImageView;
    v33 = v42;
    v34 = v43;
    v35 = v44;
    v36 = v45;
    goto LABEL_29;
  }
  if (textLayoutStyle)
    goto LABEL_30;
  if (!self->_subtitleImage)
  {
    subtitleLabel = self->_subtitleLabel;
    if (self->_subtitle)
    {
      -[UILabel pkui_sizeThatFits:](subtitleLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
      CGRectDivide(remainder, &v53, &remainder, v39, v15);
      v40 = self->_subtitleLabel;
LABEL_27:
      -[UILabel setFrame:](v40, "setFrame:", *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size, *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size);
      v37 = self->_subtitleImageView;
      v33 = *v17;
      v34 = v17[1];
      v35 = v17[2];
      v36 = v17[3];
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  -[UIImageView image](self->_subtitleImageView, "image");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "size");

  PKSizeAspectFit();
  CGRectDivide(remainder, &v53, &remainder, v29, v15);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", *v17, v17[1], v17[2], v17[3]);
  subtitleImageView = self->_subtitleImageView;
LABEL_22:
  PKSizeAlignedInRect();
  v37 = subtitleImageView;
LABEL_29:
  -[UIImageView setFrame:](v37, "setFrame:", v33, v34, v35, v36, *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size);
LABEL_30:
  if (self->_titleImage)
  {
    -[UIImageView image](self->_titleImageView, "image");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "size");

    PKSizeAspectFit();
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", *v17, v17[1], v17[2], v17[3]);
    titleImageView = self->_titleImageView;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v52 = titleImageView;
  }
  else
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    v52 = self->_titleImageView;
    v48 = *v17;
    v49 = v17[1];
    v50 = v17[2];
    v51 = v17[3];
  }
  -[UIImageView setFrame:](v52, "setFrame:", v48, v49, v50, v51, *(_OWORD *)&v53.origin, *(_OWORD *)&v53.size);
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
    -[PKDashboardTextCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setTitleImage:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleImage, a3);
    -[PKDashboardTextCollectionViewCell _setTitleImageAfterApplyingSymbolConfiguration](self, "_setTitleImageAfterApplyingSymbolConfiguration");
    -[PKDashboardTextCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

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
    -[PKDashboardTextCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setSubtitleImage:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_subtitleImage, a3);
    -[PKDashboardTextCollectionViewCell _setSubtitleImageAfterApplyingSymbolConfiguration](self, "_setSubtitleImageAfterApplyingSymbolConfiguration");
    -[PKDashboardTextCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAccessoryImage:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_accessoryImage, a3);
    -[PKDashboardTextCollectionViewCell _setAccessoryImageAfterApplyingSymbolConfiguration](self, "_setAccessoryImageAfterApplyingSymbolConfiguration");
    -[PKDashboardTextCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitleColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) != 0)
  {
    -[PKDashboardTextCollectionViewCell _defaultTitleColor](self, "_defaultTitleColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);
    -[UIImageView setTintColor:](self->_titleImageView, "setTintColor:", v5);

  }
  else
  {
    objc_storeStrong((id *)&self->_titleColor, a3);
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);
    -[UIImageView setTintColor:](self->_titleImageView, "setTintColor:", v6);
  }

}

- (void)setSubtitleColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_subtitleColor, a3);
    if (v6)
    {
      -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:");
      -[UIImageView setTintColor:](self->_subtitleImageView, "setTintColor:", v6);
    }
    else
    {
      -[PKDashboardTextCollectionViewCell _defaultSubtitleColor](self, "_defaultSubtitleColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v5);
      -[UIImageView setTintColor:](self->_subtitleImageView, "setTintColor:", v5);

    }
  }

}

- (void)setAccessoryColor:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    if (v6)
    {
      objc_storeStrong((id *)&self->_accessoryColor, a3);
      -[UIImageView setTintColor:](self->_accessoryImageView, "setTintColor:", v6);
    }
    else
    {
      -[PKDashboardTextCollectionViewCell _defaultAccessoryColor](self, "_defaultAccessoryColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](self->_accessoryImageView, "setTintColor:", v5);

    }
  }

}

- (void)setHideDisclosure:(BOOL)a3
{
  if (((!self->_hideDisclosure ^ a3) & 1) == 0)
  {
    self->_hideDisclosure = a3;
    -[UIImageView setHidden:](self->_disclosureView, "setHidden:");
    -[PKDashboardTextCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTextLayoutStyle:(int64_t)a3
{
  if (self->_textLayoutStyle != a3)
  {
    self->_textLayoutStyle = a3;
    -[PKDashboardTextCollectionViewCell _setFonts](self, "_setFonts");
    -[PKDashboardTextCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIconImage:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_iconImage, a3);
    -[PKDashboardTextCollectionViewCell _setIconImageAfterApplyingSymbolConfiguration](self, "_setIconImageAfterApplyingSymbolConfiguration");
    -[PKDashboardTextCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
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
  void *v3;
  id v4;

  -[PKDashboardTextCollectionViewCell _titleFont](self, "_titleFont");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDashboardTextCollectionViewCell _subtitleFont](self, "_subtitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);
  -[PKDashboardTextCollectionViewCell _setTitleImageAfterApplyingSymbolConfiguration](self, "_setTitleImageAfterApplyingSymbolConfiguration");
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v3);
  -[PKDashboardTextCollectionViewCell _setSubtitleImageAfterApplyingSymbolConfiguration](self, "_setSubtitleImageAfterApplyingSymbolConfiguration");
  -[PKDashboardTextCollectionViewCell _setIconImageAfterApplyingSymbolConfiguration](self, "_setIconImageAfterApplyingSymbolConfiguration");
  -[PKDashboardTextCollectionViewCell _setAccessoryImageAfterApplyingSymbolConfiguration](self, "_setAccessoryImageAfterApplyingSymbolConfiguration");

}

- (id)_titleFont
{
  int64_t textLayoutStyle;

  textLayoutStyle = self->_textLayoutStyle;
  if (textLayoutStyle == 1)
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AD0], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
    self = (PKDashboardTextCollectionViewCell *)objc_claimAutoreleasedReturnValue();
  }
  else if (!textLayoutStyle)
  {
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
    self = (PKDashboardTextCollectionViewCell *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_subtitleFont
{
  int64_t textLayoutStyle;
  NSString *v3;
  NSString **v4;

  textLayoutStyle = self->_textLayoutStyle;
  if (!textLayoutStyle)
  {
    v3 = 0;
    v4 = (NSString **)MEMORY[0x1E0DC4A88];
    goto LABEL_5;
  }
  if (textLayoutStyle == 1)
  {
    v3 = (NSString *)*MEMORY[0x1E0DC48D0];
    v4 = (NSString **)MEMORY[0x1E0DC4A90];
LABEL_5:
    PKFontForDefaultDesign(*v4, v3);
    self = (PKDashboardTextCollectionViewCell *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_defaultTitleColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (id)_defaultSubtitleColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (id)_defaultAccessoryColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (void)_setTitleImageAfterApplyingSymbolConfiguration
{
  void *v3;
  void *v4;
  UIImageView *titleImageView;
  void *v6;
  id v7;

  if (self->_titleImage)
  {
    v3 = (void *)MEMORY[0x1E0DC3888];
    -[UILabel font](self->_titleLabel, "font");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configurationWithFont:scale:", v4, -1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    titleImageView = self->_titleImageView;
    -[UIImage imageByApplyingSymbolConfiguration:](self->_titleImage, "imageByApplyingSymbolConfiguration:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](titleImageView, "setImage:", v6);

  }
  else
  {
    -[UIImageView setImage:](self->_titleImageView, "setImage:", 0);
  }
}

- (void)_setSubtitleImageAfterApplyingSymbolConfiguration
{
  void *v3;
  void *v4;
  UIImageView *subtitleImageView;
  void *v6;
  id v7;

  if (self->_subtitleImage)
  {
    v3 = (void *)MEMORY[0x1E0DC3888];
    -[UILabel font](self->_subtitleLabel, "font");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configurationWithFont:scale:", v4, -1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    subtitleImageView = self->_subtitleImageView;
    -[UIImage imageByApplyingSymbolConfiguration:](self->_subtitleImage, "imageByApplyingSymbolConfiguration:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](subtitleImageView, "setImage:", v6);

  }
  else
  {
    -[UIImageView setImage:](self->_subtitleImageView, "setImage:", 0);
  }
}

- (void)_setIconImageAfterApplyingSymbolConfiguration
{
  void *v3;
  UIImage *iconImage;
  void *v5;
  void *v6;
  void *v7;
  UIImageView *iconImageView;
  void *v9;
  id v10;

  if (self->_iconImage)
  {
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v10, -1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    iconImage = self->_iconImage;
    -[UILabel textColor](self->_titleLabel, "textColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage imageWithTintColor:](iconImage, "imageWithTintColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithRenderingMode:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    iconImageView = self->_iconImageView;
    objc_msgSend(v7, "imageByApplyingSymbolConfiguration:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](iconImageView, "setImage:", v9);

  }
  else
  {
    -[UIImageView setImage:](self->_iconImageView, "setImage:", 0);
  }
}

- (void)_setAccessoryImageAfterApplyingSymbolConfiguration
{
  void *v3;
  UIImageView *accessoryImageView;
  void *v5;
  id v6;

  if (self->_accessoryImage)
  {
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AD0], (void *)*MEMORY[0x1E0DC48D0], 2, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v6, 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    accessoryImageView = self->_accessoryImageView;
    -[UIImage imageByApplyingSymbolConfiguration:](self->_accessoryImage, "imageByApplyingSymbolConfiguration:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](accessoryImageView, "setImage:", v5);

  }
  else
  {
    -[UIImageView setImage:](self->_accessoryImageView, "setImage:", 0);
  }
}

- (int64_t)textLayoutStyle
{
  return self->_textLayoutStyle;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)subtitleImage
{
  return self->_subtitleImage;
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (UIImage)accessoryImage
{
  return self->_accessoryImage;
}

- (UIColor)accessoryColor
{
  return self->_accessoryColor;
}

- (BOOL)hideDisclosure
{
  return self->_hideDisclosure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryColor, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_subtitleImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_subtitleImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
