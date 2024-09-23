@implementation PKInstallmentPlanProgressCollectionViewCell

- (PKInstallmentPlanProgressCollectionViewCell)initWithFrame:(CGRect)a3
{
  PKInstallmentPlanProgressCollectionViewCell *v3;
  PKInstallmentPlanProgressCollectionViewCell *v4;
  void *v5;
  UILabel *v6;
  UILabel *leadingTitleLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  NSString *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *leadingAmountLabel;
  UILabel *v16;
  void *v17;
  double v18;
  void *v19;
  UILabel *v20;
  UILabel *trailingTitleLabel;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  UILabel *trailingAmountLabel;
  UILabel *v28;
  void *v29;
  PKProgressBar *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  PKProgressBar *progressBar;
  PKProgressBar *v37;
  void *v38;
  PKProgressBar *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  UIImageView *completeCheckmark;
  UIImageView *v45;
  void *v46;
  uint64_t v47;
  UILabel *completeLabel;
  UILabel *v49;
  void *v50;
  UILabel *v51;
  void *v52;
  UILabel *v53;
  UILabel *detailLabel;
  UILabel *v55;
  void *v56;
  UILabel *v57;
  void *v58;
  void *v60;
  NSString *v61;
  objc_super v62;

  v62.receiver = self;
  v62.super_class = (Class)PKInstallmentPlanProgressCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v62, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKInstallmentPlanProgressCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    leadingTitleLabel = v4->_leadingTitleLabel;
    v4->_leadingTitleLabel = v6;

    -[UILabel setNumberOfLines:](v4->_leadingTitleLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_leadingTitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v8 = v4->_leadingTitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    v10 = v4->_leadingTitleLabel;
    v11 = (NSString *)*MEMORY[0x1E0DC4B10];
    v12 = (void *)*MEMORY[0x1E0DC48F8];
    v61 = (NSString *)*MEMORY[0x1E0DC4B10];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48F8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v13);

    -[UILabel setAccessibilityIdentifier:](v4->_leadingTitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    objc_msgSend(v5, "addSubview:", v4->_leadingTitleLabel);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    leadingAmountLabel = v4->_leadingAmountLabel;
    v4->_leadingAmountLabel = v14;

    -[UILabel setNumberOfLines:](v4->_leadingAmountLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_leadingAmountLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v16 = v4->_leadingAmountLabel;
    v60 = (void *)*MEMORY[0x1E0DC13A8];
    v17 = (void *)*MEMORY[0x1E0DC4B58];
    v18 = *MEMORY[0x1E0DC1420];
    PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B58], v12, 2, 0, *MEMORY[0x1E0DC1420]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16, "setFont:", v19);

    -[UILabel setAccessibilityIdentifier:](v4->_leadingAmountLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    objc_msgSend(v5, "addSubview:", v4->_leadingAmountLabel);
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    trailingTitleLabel = v4->_trailingTitleLabel;
    v4->_trailingTitleLabel = v20;

    -[UILabel setNumberOfLines:](v4->_trailingTitleLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_trailingTitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v22 = v4->_trailingTitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    v24 = v4->_trailingTitleLabel;
    PKFontForDefaultDesign(v11, (NSString *)v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v24, "setFont:", v25);

    -[UILabel setAccessibilityIdentifier:](v4->_trailingTitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FF0]);
    objc_msgSend(v5, "addSubview:", v4->_trailingTitleLabel);
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    trailingAmountLabel = v4->_trailingAmountLabel;
    v4->_trailingAmountLabel = v26;

    -[UILabel setNumberOfLines:](v4->_trailingAmountLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_trailingAmountLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v28 = v4->_trailingAmountLabel;
    PKFontForDesign(v60, v17, v12, 2, 0, v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v28, "setFont:", v29);

    -[UILabel setAccessibilityIdentifier:](v4->_trailingAmountLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE8]);
    objc_msgSend(v5, "addSubview:", v4->_trailingAmountLabel);
    v30 = [PKProgressBar alloc];
    v31 = *MEMORY[0x1E0C9D648];
    v32 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v33 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v34 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v35 = -[PKProgressBar initWithFrame:](v30, "initWithFrame:", *MEMORY[0x1E0C9D648], v32, v33, v34);
    progressBar = v4->_progressBar;
    v4->_progressBar = (PKProgressBar *)v35;

    v37 = v4->_progressBar;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.22745098, 0.725490196, 0.42745098, 1.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProgressBar setGradientStartColor:](v37, "setGradientStartColor:", v38);

    v39 = v4->_progressBar;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.643137255, 0.901960784, 0.42745098, 1.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProgressBar setGradientEndColor:](v39, "setGradientEndColor:", v40);

    objc_msgSend(v5, "addSubview:", v4->_progressBar);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "imageWithRenderingMode:", 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v42);
    completeCheckmark = v4->_completeCheckmark;
    v4->_completeCheckmark = (UIImageView *)v43;

    v45 = v4->_completeCheckmark;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v45, "setTintColor:", v46);

    -[UIImageView setHidden:](v4->_completeCheckmark, "setHidden:", 1);
    objc_msgSend(v5, "addSubview:", v4->_completeCheckmark);
    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v31, v32, v33, v34);
    completeLabel = v4->_completeLabel;
    v4->_completeLabel = (UILabel *)v47;

    v49 = v4->_completeLabel;
    PKFontForDesign(v60, (void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC4918], 2, 0, v18);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v49, "setFont:", v50);

    v51 = v4->_completeLabel;
    PKLocalizedBeekmanString(CFSTR("INSTALLMENT_COMPLETE"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v51, "setText:", v52);

    -[UILabel setNumberOfLines:](v4->_completeLabel, "setNumberOfLines:", 1);
    -[UILabel setHidden:](v4->_completeLabel, "setHidden:", 1);
    -[UILabel setAccessibilityIdentifier:](v4->_completeLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67A20]);
    objc_msgSend(v5, "addSubview:", v4->_completeLabel);
    v53 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v53;

    v55 = v4->_detailLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v55, "setTextColor:", v56);

    v57 = v4->_detailLabel;
    PKFontForDefaultDesign(v61, (NSString *)v12);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v57, "setFont:", v58);

    -[UILabel setNumberOfLines:](v4->_detailLabel, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_detailLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
    objc_msgSend(v5, "addSubview:", v4->_detailLabel);
    -[PKInstallmentPlanProgressCollectionViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C80]);

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  width = a3.width;
  -[PKDashboardCollectionViewCell horizontalInset](self, "horizontalInset", a3.width, a3.height);
  v6 = v5;
  if (self->_leadingTitle)
  {
    -[UILabel font](self->_leadingTitleLabel, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_bodyLeading");
    PKFloatCeilToPixel();
    v9 = v8;

  }
  else
  {
    PKFloatCeilToPixel();
    v9 = v10;
  }
  if (self->_leadingAmount)
  {
    -[UILabel font](self->_leadingAmountLabel, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_bodyLeading");
    PKFloatCeilToPixel();
    v13 = v12;

  }
  else
  {
    PKFloatCeilToPixel();
    v13 = v14;
  }
  if (self->_complete)
  {
    -[UILabel font](self->_completeLabel, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_bodyLeading");
    PKFloatCeilToPixel();
    v17 = v16;

  }
  else
  {
    PKFloatCeilToPixel();
    v17 = v18;
  }
  v19 = width + v6 * -2.0;
  -[UILabel text](self->_detailLabel, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_detailLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v19 + -32.0, 1.79769313e308);
    v22 = v21;
  }
  else
  {
    v22 = 0.0;
  }

  v23 = v9 + v13 + v17 + v22 + dbl_19DF16870[v22 > 0.0];
  v24 = v19;
  result.height = v23;
  result.width = v24;
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
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRectEdge v17;
  CGRectEdge v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  UILabel *leadingTitleLabel;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  double v36;
  CGFloat v37;
  void *completeLabel;
  double x;
  double y;
  double width;
  double height;
  void *v43;
  CGRect *p_remainder;
  _QWORD rect[5];
  CGRect v46;
  CGRect v47;
  CGRect slice;
  CGRect v49;
  CGRect remainder;
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v51.receiver = self;
  v51.super_class = (Class)PKInstallmentPlanProgressCollectionViewCell;
  -[PKDashboardCollectionViewCell layoutSubviews](&v51, sel_layoutSubviews);
  -[PKInstallmentPlanProgressCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = -[PKInstallmentPlanProgressCollectionViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v13 = v5 + 16.0;
  v14 = v7 + 16.0;
  v15 = v9 + -32.0;
  remainder.origin.x = v13;
  remainder.origin.y = v14;
  v16 = v11 + -32.0;
  remainder.size.width = v15;
  remainder.size.height = v16;
  memset(&v49, 0, sizeof(v49));
  if (v12)
    v17 = CGRectMaxXEdge;
  else
    v17 = CGRectMinXEdge;
  if (v12)
    v18 = CGRectMinXEdge;
  else
    v18 = CGRectMaxXEdge;
  memset(&slice, 0, sizeof(slice));
  memset(&v47, 0, sizeof(v47));
  v52.origin.x = v13;
  v52.origin.y = v14;
  v52.size.width = v15;
  v52.size.height = v16;
  CGRectGetWidth(v52);
  PKFloatRoundToPixel();
  v20 = v19;
  v53.origin.x = v13;
  v53.origin.y = v14;
  v53.size.width = v15;
  v53.size.height = v16;
  CGRectDivide(v53, &slice, &remainder, v20, v17);
  CGRectDivide(remainder, &v49, &remainder, v20, v18);
  -[UILabel sizeThatFits:](self->_leadingTitleLabel, "sizeThatFits:", slice.size.width, slice.size.height);
  v22 = v21;
  -[UILabel sizeThatFits:](self->_leadingAmountLabel, "sizeThatFits:", slice.size.width, slice.size.height);
  v24 = v23;
  v25 = v22 + v23 + 5.0;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  slice.origin.x = v26;
  slice.origin.y = v27;
  slice.size.width = v28;
  slice.size.height = v29;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v49.origin.x = v30;
  v49.origin.y = v31;
  leadingTitleLabel = self->_leadingTitleLabel;
  v49.size.width = v33;
  v49.size.height = v34;
  -[UILabel setFrame:](leadingTitleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width + -16.0, v22);
  -[UILabel setFrame:](self->_leadingAmountLabel, "setFrame:", slice.origin.x, v22 + slice.origin.y + 5.0, slice.size.width + -16.0, v24);
  -[UILabel setFrame:](self->_trailingTitleLabel, "setFrame:", v49.origin.x, v49.origin.y, v49.size.width, v22);
  -[UILabel setFrame:](self->_trailingAmountLabel, "setFrame:", v49.origin.x, v22 + v49.origin.y + 5.0, v49.size.width, v24);
  v54.origin.x = v13;
  v54.origin.y = v14;
  v54.size.width = v15;
  v54.size.height = v16;
  CGRectDivide(v54, &v47, &remainder, v25 + 10.0, CGRectMinYEdge);
  if (self->_complete)
  {
    -[UILabel font](self->_completeLabel, "font");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "_bodyLeading");
    v37 = v36;

    CGRectDivide(remainder, &v47, &remainder, v37, CGRectMinYEdge);
    memset(&v46, 0, sizeof(v46));
    memset(&rect[1], 0, 32);
    CGRectDivide(v47, &v46, &v47, v37, v17);
    CGRectDivide(v47, &v47, (CGRect *)&rect[1], 5.0, v17);
    -[UIImageView setFrame:](self->_completeCheckmark, "setFrame:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
    completeLabel = self->_completeLabel;
    x = *(double *)&rect[1];
    y = *(double *)&rect[2];
    width = *(double *)&rect[3];
    height = *(double *)&rect[4];
  }
  else
  {
    CGRectDivide(remainder, &v47, &remainder, 20.0, CGRectMinYEdge);
    completeLabel = self->_progressBar;
    x = v47.origin.x;
    y = v47.origin.y;
    width = v47.size.width;
    height = v47.size.height;
  }
  objc_msgSend(completeLabel, "setFrame:", x, y, width, height);
  -[UILabel text](self->_detailLabel, "text");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    p_remainder = &remainder;
    CGRectDivide(remainder, &v47, &remainder, 10.0, CGRectMinYEdge);
  }
  else
  {
    p_remainder = (CGRect *)MEMORY[0x1E0C9D648];
  }
  -[UILabel setFrame:](self->_detailLabel, "setFrame:", p_remainder->origin.x, p_remainder->origin.y, p_remainder->size.width, p_remainder->size.height);
}

- (void)setLeadingTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *leadingTitle;
  NSString *v10;

  v4 = a3;
  v5 = self->_leadingTitle;
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
    leadingTitle = self->_leadingTitle;
    self->_leadingTitle = v8;

    -[UILabel setText:](self->_leadingTitleLabel, "setText:", self->_leadingTitle);
    -[PKInstallmentPlanProgressCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setLeadingAmount:(id)a3
{
  PKCurrencyAmount **p_leadingAmount;
  UILabel *leadingAmountLabel;
  void *v7;
  id v8;

  p_leadingAmount = &self->_leadingAmount;
  v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_leadingAmount, a3);
    leadingAmountLabel = self->_leadingAmountLabel;
    -[PKCurrencyAmount formattedStringValue](*p_leadingAmount, "formattedStringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](leadingAmountLabel, "setText:", v7);

    -[PKInstallmentPlanProgressCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTrailingTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *trailingTitle;
  NSString *v10;

  v4 = a3;
  v5 = self->_trailingTitle;
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
    trailingTitle = self->_trailingTitle;
    self->_trailingTitle = v8;

    -[UILabel setText:](self->_trailingTitleLabel, "setText:", self->_trailingTitle);
    -[PKInstallmentPlanProgressCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setTrailingAmount:(id)a3
{
  PKCurrencyAmount **p_trailingAmount;
  UILabel *trailingAmountLabel;
  void *v7;
  id v8;

  p_trailingAmount = &self->_trailingAmount;
  v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_trailingAmount, a3);
    trailingAmountLabel = self->_trailingAmountLabel;
    -[PKCurrencyAmount formattedStringValue](*p_trailingAmount, "formattedStringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](trailingAmountLabel, "setText:", v7);

    -[PKInstallmentPlanProgressCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSubtitleText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *subtitleText;
  NSString *v10;

  v4 = a3;
  v5 = self->_subtitleText;
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
    subtitleText = self->_subtitleText;
    self->_subtitleText = v8;

    -[UILabel setText:](self->_detailLabel, "setText:", self->_subtitleText);
    -[PKInstallmentPlanProgressCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setProgressAmount:(double)a3
{
  -[PKProgressBar setProgress:](self->_progressBar, "setProgress:", a3);
}

- (double)progressAmount
{
  double result;

  -[PKProgressBar progress](self->_progressBar, "progress");
  return result;
}

- (void)setComplete:(BOOL)a3
{
  if (((!self->_complete ^ a3) & 1) == 0)
  {
    self->_complete = a3;
    -[UIImageView setHidden:](self->_completeCheckmark, "setHidden:", !a3);
    -[UILabel setHidden:](self->_completeLabel, "setHidden:", !self->_complete);
    -[PKProgressBar setHidden:](self->_progressBar, "setHidden:", self->_complete);
    -[PKInstallmentPlanProgressCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)leadingTitle
{
  return self->_leadingTitle;
}

- (NSString)trailingTitle
{
  return self->_trailingTitle;
}

- (PKCurrencyAmount)leadingAmount
{
  return self->_leadingAmount;
}

- (PKCurrencyAmount)trailingAmount
{
  return self->_trailingAmount;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_trailingAmount, 0);
  objc_storeStrong((id *)&self->_leadingAmount, 0);
  objc_storeStrong((id *)&self->_trailingTitle, 0);
  objc_storeStrong((id *)&self->_leadingTitle, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_completeLabel, 0);
  objc_storeStrong((id *)&self->_completeCheckmark, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_trailingAmountLabel, 0);
  objc_storeStrong((id *)&self->_trailingTitleLabel, 0);
  objc_storeStrong((id *)&self->_leadingAmountLabel, 0);
  objc_storeStrong((id *)&self->_leadingTitleLabel, 0);
}

@end
