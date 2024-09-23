@implementation PKStackedLeadingTrailingLabelCell

- (void)setLeadingPrimaryText:(id)a3
{
  id v5;
  NSString **p_leadingPrimaryText;
  NSString *leadingPrimaryText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  UILabel *leadingPrimaryLabel;
  id v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  uint64_t v19;
  UILabel *v20;
  NSString *v21;

  v5 = a3;
  p_leadingPrimaryText = &self->_leadingPrimaryText;
  leadingPrimaryText = self->_leadingPrimaryText;
  v21 = (NSString *)v5;
  v8 = leadingPrimaryText;
  if (v8 == v21)
  {

  }
  else
  {
    if (v21 && v8)
    {
      v9 = -[NSString isEqualToString:](v21, "isEqualToString:", v8);

      v10 = v21;
      if (v9)
        goto LABEL_17;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_leadingPrimaryText, a3);
    v11 = -[NSString length](*p_leadingPrimaryText, "length");
    leadingPrimaryLabel = self->_leadingPrimaryLabel;
    if (v11)
    {
      if (!leadingPrimaryLabel)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC3990]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v15 = self->_leadingPrimaryLabel;
        self->_leadingPrimaryLabel = v14;

        v16 = self->_leadingPrimaryLabel;
        PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48D0], 0x8000, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v16, "setFont:", v17);

        -[UILabel setNumberOfLines:](self->_leadingPrimaryLabel, "setNumberOfLines:", 0);
        v18 = self->_leadingPrimaryLabel;
        if (-[PKStackedLeadingTrailingLabelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v19 = 2;
        else
          v19 = 0;
        -[UILabel setTextAlignment:](v18, "setTextAlignment:", v19);
        -[PKStackedLeadingTrailingLabelCell addSubview:](self, "addSubview:", self->_leadingPrimaryLabel);
      }
    }
    else
    {
      -[UILabel removeFromSuperview](leadingPrimaryLabel, "removeFromSuperview");
      v20 = self->_leadingPrimaryLabel;
      self->_leadingPrimaryLabel = 0;

    }
    -[UILabel setText:](self->_leadingPrimaryLabel, "setText:", *p_leadingPrimaryText);
    -[UILabel setAccessibilityIdentifier:](self->_leadingPrimaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[PKStackedLeadingTrailingLabelCell setNeedsLayout](self, "setNeedsLayout");
  }
  v10 = v21;
LABEL_17:

}

- (void)setLeadingSecondaryText:(id)a3
{
  id v5;
  NSString **p_leadingSecondaryText;
  NSString *leadingSecondaryText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  UILabel *leadingSecondaryLabel;
  id v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  uint64_t v19;
  UILabel *v20;
  NSString *v21;

  v5 = a3;
  p_leadingSecondaryText = &self->_leadingSecondaryText;
  leadingSecondaryText = self->_leadingSecondaryText;
  v21 = (NSString *)v5;
  v8 = leadingSecondaryText;
  if (v8 == v21)
  {

  }
  else
  {
    if (v21 && v8)
    {
      v9 = -[NSString isEqualToString:](v21, "isEqualToString:", v8);

      v10 = v21;
      if (v9)
        goto LABEL_17;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_leadingSecondaryText, a3);
    v11 = -[NSString length](*p_leadingSecondaryText, "length");
    leadingSecondaryLabel = self->_leadingSecondaryLabel;
    if (v11)
    {
      if (!leadingSecondaryLabel)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC3990]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v15 = self->_leadingSecondaryLabel;
        self->_leadingSecondaryLabel = v14;

        v16 = self->_leadingSecondaryLabel;
        PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48D0], 32770, 0, *MEMORY[0x1E0DC1420]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v16, "setFont:", v17);

        -[UILabel setNumberOfLines:](self->_leadingSecondaryLabel, "setNumberOfLines:", 0);
        v18 = self->_leadingSecondaryLabel;
        if (-[PKStackedLeadingTrailingLabelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v19 = 2;
        else
          v19 = 0;
        -[UILabel setTextAlignment:](v18, "setTextAlignment:", v19);
        -[PKStackedLeadingTrailingLabelCell addSubview:](self, "addSubview:", self->_leadingSecondaryLabel);
      }
    }
    else
    {
      -[UILabel removeFromSuperview](leadingSecondaryLabel, "removeFromSuperview");
      v20 = self->_leadingSecondaryLabel;
      self->_leadingSecondaryLabel = 0;

    }
    -[UILabel setText:](self->_leadingSecondaryLabel, "setText:", *p_leadingSecondaryText);
    -[UILabel setAccessibilityIdentifier:](self->_leadingSecondaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    -[PKStackedLeadingTrailingLabelCell setNeedsLayout](self, "setNeedsLayout");
  }
  v10 = v21;
LABEL_17:

}

- (void)setTrailingPrimaryText:(id)a3
{
  id v5;
  NSString **p_trailingPrimaryText;
  NSString *trailingPrimaryText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  UILabel *trailingPrimaryLabel;
  id v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  uint64_t v19;
  UILabel *v20;
  NSString *v21;

  v5 = a3;
  p_trailingPrimaryText = &self->_trailingPrimaryText;
  trailingPrimaryText = self->_trailingPrimaryText;
  v21 = (NSString *)v5;
  v8 = trailingPrimaryText;
  if (v8 == v21)
  {

  }
  else
  {
    if (v21 && v8)
    {
      v9 = -[NSString isEqualToString:](v21, "isEqualToString:", v8);

      v10 = v21;
      if (v9)
        goto LABEL_17;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_trailingPrimaryText, a3);
    v11 = -[NSString length](*p_trailingPrimaryText, "length");
    trailingPrimaryLabel = self->_trailingPrimaryLabel;
    if (v11)
    {
      if (!trailingPrimaryLabel)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC3990]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v15 = self->_trailingPrimaryLabel;
        self->_trailingPrimaryLabel = v14;

        v16 = self->_trailingPrimaryLabel;
        PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48D0], 0x8000, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v16, "setFont:", v17);

        -[UILabel setNumberOfLines:](self->_trailingPrimaryLabel, "setNumberOfLines:", 0);
        v18 = self->_trailingPrimaryLabel;
        if (-[PKStackedLeadingTrailingLabelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v19 = 0;
        else
          v19 = 2;
        -[UILabel setTextAlignment:](v18, "setTextAlignment:", v19);
        -[PKStackedLeadingTrailingLabelCell addSubview:](self, "addSubview:", self->_trailingPrimaryLabel);
      }
    }
    else
    {
      -[UILabel removeFromSuperview](trailingPrimaryLabel, "removeFromSuperview");
      v20 = self->_trailingPrimaryLabel;
      self->_trailingPrimaryLabel = 0;

    }
    -[UILabel setText:](self->_trailingPrimaryLabel, "setText:", *p_trailingPrimaryText);
    -[UILabel setAccessibilityIdentifier:](self->_trailingPrimaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FF0]);
    -[PKStackedLeadingTrailingLabelCell setNeedsLayout](self, "setNeedsLayout");
  }
  v10 = v21;
LABEL_17:

}

- (void)setTrailingSecondaryText:(id)a3
{
  id v5;
  NSString **p_trailingSecondaryText;
  NSString *trailingSecondaryText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  UILabel *trailingSecondaryLabel;
  id v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  uint64_t v19;
  UILabel *v20;
  NSString *v21;

  v5 = a3;
  p_trailingSecondaryText = &self->_trailingSecondaryText;
  trailingSecondaryText = self->_trailingSecondaryText;
  v21 = (NSString *)v5;
  v8 = trailingSecondaryText;
  if (v8 == v21)
  {

  }
  else
  {
    if (v21 && v8)
    {
      v9 = -[NSString isEqualToString:](v21, "isEqualToString:", v8);

      v10 = v21;
      if (v9)
        goto LABEL_17;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_trailingSecondaryText, a3);
    v11 = -[NSString length](*p_trailingSecondaryText, "length");
    trailingSecondaryLabel = self->_trailingSecondaryLabel;
    if (v11)
    {
      if (!trailingSecondaryLabel)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC3990]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v15 = self->_trailingSecondaryLabel;
        self->_trailingSecondaryLabel = v14;

        v16 = self->_trailingSecondaryLabel;
        PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48D0], 32770, 0, *MEMORY[0x1E0DC1420]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v16, "setFont:", v17);

        -[UILabel setNumberOfLines:](self->_trailingSecondaryLabel, "setNumberOfLines:", 0);
        v18 = self->_trailingSecondaryLabel;
        if (-[PKStackedLeadingTrailingLabelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v19 = 0;
        else
          v19 = 2;
        -[UILabel setTextAlignment:](v18, "setTextAlignment:", v19);
        -[PKStackedLeadingTrailingLabelCell addSubview:](self, "addSubview:", self->_trailingSecondaryLabel);
      }
    }
    else
    {
      -[UILabel removeFromSuperview](trailingSecondaryLabel, "removeFromSuperview");
      v20 = self->_trailingSecondaryLabel;
      self->_trailingSecondaryLabel = 0;

    }
    -[UILabel setText:](self->_trailingSecondaryLabel, "setText:", *p_trailingSecondaryText);
    -[UILabel setAccessibilityIdentifier:](self->_trailingSecondaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67FE8]);
    -[PKStackedLeadingTrailingLabelCell setNeedsLayout](self, "setNeedsLayout");
  }
  v10 = v21;
LABEL_17:

}

- (void)setDetailText:(id)a3
{
  id v5;
  NSString **p_detailText;
  NSString *detailText;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  uint64_t v11;
  UILabel *detailLabel;
  id v13;
  UILabel *v14;
  UILabel *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  uint64_t v21;
  UILabel *v22;
  NSString *v23;

  v5 = a3;
  p_detailText = &self->_detailText;
  detailText = self->_detailText;
  v23 = (NSString *)v5;
  v8 = detailText;
  if (v8 == v23)
  {

  }
  else
  {
    if (v23 && v8)
    {
      v9 = -[NSString isEqualToString:](v23, "isEqualToString:", v8);

      v10 = v23;
      if (v9)
        goto LABEL_17;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_detailText, a3);
    v11 = -[NSString length](*p_detailText, "length");
    detailLabel = self->_detailLabel;
    if (v11)
    {
      if (!detailLabel)
      {
        v13 = objc_alloc(MEMORY[0x1E0DC3990]);
        v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v15 = self->_detailLabel;
        self->_detailLabel = v14;

        v16 = self->_detailLabel;
        PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48D0], 0x8000, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v16, "setFont:", v17);

        v18 = self->_detailLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v18, "setTextColor:", v19);

        -[UILabel setNumberOfLines:](self->_detailLabel, "setNumberOfLines:", 0);
        v20 = self->_detailLabel;
        if (-[PKStackedLeadingTrailingLabelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v21 = 2;
        else
          v21 = 0;
        -[UILabel setTextAlignment:](v20, "setTextAlignment:", v21);
        -[PKStackedLeadingTrailingLabelCell addSubview:](self, "addSubview:", self->_detailLabel);
      }
    }
    else
    {
      -[UILabel removeFromSuperview](detailLabel, "removeFromSuperview");
      v22 = self->_detailLabel;
      self->_detailLabel = 0;

    }
    -[UILabel setText:](self->_detailLabel, "setText:", *p_detailText);
    -[UILabel setAccessibilityIdentifier:](self->_detailLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
    -[PKStackedLeadingTrailingLabelCell setNeedsLayout](self, "setNeedsLayout");
  }
  v10 = v23;
LABEL_17:

}

- (void)setShowProgressBar:(BOOL)a3
{
  if (self->_showProgressBar != a3)
  {
    self->_showProgressBar = a3;
    -[PKStackedLeadingTrailingLabelCell _updateProgressBar](self, "_updateProgressBar");
    -[PKStackedLeadingTrailingLabelCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setProgress:(double)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    -[PKStackedLeadingTrailingLabelCell _updateProgressBar](self, "_updateProgressBar");
    -[PKStackedLeadingTrailingLabelCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setProgressBarStartColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressBarStartColor, a3);
    -[PKStackedLeadingTrailingLabelCell _updateProgressBar](self, "_updateProgressBar");
    -[PKStackedLeadingTrailingLabelCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setProgressBarEndColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_progressBarEndColor, a3);
    -[PKStackedLeadingTrailingLabelCell _updateProgressBar](self, "_updateProgressBar");
    -[PKStackedLeadingTrailingLabelCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateProgressBar
{
  _BOOL4 showProgressBar;
  PKProgressBar *progressBar;
  PKProgressBar *v5;
  PKProgressBar *v6;
  PKProgressBar *v7;

  showProgressBar = self->_showProgressBar;
  progressBar = self->_progressBar;
  if (showProgressBar)
  {
    if (!progressBar)
    {
      v5 = objc_alloc_init(PKProgressBar);
      v6 = self->_progressBar;
      self->_progressBar = v5;

      -[PKStackedLeadingTrailingLabelCell addSubview:](self, "addSubview:", self->_progressBar);
      progressBar = self->_progressBar;
    }
    -[PKProgressBar setProgress:](progressBar, "setProgress:", self->_progress);
    -[PKProgressBar setCornerRadius:](self->_progressBar, "setCornerRadius:", 4.0);
    -[PKProgressBar setGradientStartColor:](self->_progressBar, "setGradientStartColor:", self->_progressBarStartColor);
    -[PKProgressBar setGradientEndColor:](self->_progressBar, "setGradientEndColor:", self->_progressBarEndColor);
  }
  else
  {
    -[PKProgressBar removeFromSuperview](progressBar, "removeFromSuperview");
    v7 = self->_progressBar;
    self->_progressBar = 0;

  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKStackedLeadingTrailingLabelCell;
  -[PKStackedLeadingTrailingLabelCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKStackedLeadingTrailingLabelCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKStackedLeadingTrailingLabelCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKStackedLeadingTrailingLabelCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double *v15;
  CGSize v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGRect remainder;
  CGRect slice;
  CGSize result;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = PKTableViewCellTextInset();
  v11 = x + v10;
  v12 = y + 15.0;
  v49 = width;
  v13 = width - (v10 + PKTableViewCellTextInset());
  v14 = height + -30.0;
  -[PKStackedLeadingTrailingLabelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v15 = (double *)MEMORY[0x1E0C9D648];
  v16 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.size = v16;
  remainder.origin.x = v11;
  remainder.origin.y = v12;
  remainder.size.width = v13;
  remainder.size.height = height + -30.0;
  -[UILabel sizeThatFits:](self->_leadingPrimaryLabel, "sizeThatFits:", v13, 3.40282347e38);
  v18 = v17;
  -[UILabel sizeThatFits:](self->_trailingPrimaryLabel, "sizeThatFits:", v13, 3.40282347e38);
  v20 = v19;
  -[UILabel sizeThatFits:](self->_leadingSecondaryLabel, "sizeThatFits:", v13, 3.40282347e38);
  v22 = v21;
  -[UILabel sizeThatFits:](self->_trailingSecondaryLabel, "sizeThatFits:", v13, 3.40282347e38);
  v24 = v22 + v23;
  if (v18 + v20 <= v13 && v24 <= v13)
    -[PKStackedLeadingTrailingLabelCell _layoutLabelsSideBySide:allocated:unallocated:isTemplateLayout:](self, "_layoutLabelsSideBySide:allocated:unallocated:isTemplateLayout:", &slice, &remainder, v4, v11, v12, v13, v14);
  else
    -[PKStackedLeadingTrailingLabelCell _layoutLabelsStacked:allocated:unallocated:isTemplateLayout:](self, "_layoutLabelsStacked:allocated:unallocated:isTemplateLayout:", &slice, &remainder, v4, v11, v12, v13, v14);
  v27 = v26 + 0.0;
  if (self->_showProgressBar)
  {
    if (self->_leadingPrimaryText
      || self->_leadingSecondaryText
      || self->_trailingPrimaryText
      || self->_trailingSecondaryText)
    {
      CGRectDivide(remainder, &slice, &remainder, 12.0, CGRectMinYEdge);
      v27 = v27 + 12.0;
    }
    v27 = v27 + 20.0;
    CGRectDivide(remainder, &slice, &remainder, 20.0, CGRectMinYEdge);
    PKSizeAlignedInRect();
    v47 = v29;
    v48 = v28;
    v31 = v30;
    v33 = v32;
  }
  else
  {
    v31 = v15[2];
    v47 = v15[1];
    v48 = *v15;
    v33 = v15[3];
  }
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v13, 3.40282347e38);
  v35 = v34;
  if (v36 > 0.0 && self->_showProgressBar)
  {
    CGRectDivide(remainder, &slice, &remainder, 12.0, CGRectMinYEdge);
    v27 = v27 + 12.0;
  }
  CGRectDivide(remainder, &slice, &remainder, v35, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  if (!v4)
  {
    v41 = v37;
    v42 = v38;
    v43 = v39;
    v44 = v40;
    -[PKProgressBar setFrame:](self->_progressBar, "setFrame:", v48, v47, v31, v33);
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v41, v42, v43, v44);
  }
  v45 = v35 + v27 + 15.0 + 15.0;
  v46 = v49;
  result.height = v45;
  result.width = v46;
  return result;
}

- (double)_layoutLabelsSideBySide:(CGRect)a3 allocated:(CGRect *)a4 unallocated:(CGRect *)a5 isTemplateLayout:(BOOL)a6
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  CGRectEdge v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGSize size;
  CGSize v51;
  double v53;
  double v54;
  CGRect v55;
  CGRect v56;
  CGRect remainder;
  CGRect slice;
  CGRect v59;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PKStackedLeadingTrailingLabelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v15 = CGRectMinXEdge;
  else
    v15 = CGRectMaxXEdge;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  -[UILabel sizeThatFits:](self->_leadingPrimaryLabel, "sizeThatFits:", width, 3.40282347e38);
  v17 = v16;
  -[UILabel sizeThatFits:](self->_trailingPrimaryLabel, "sizeThatFits:", width, 3.40282347e38);
  v19 = v18;
  v21 = fmax(v17, v20);
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  CGRectDivide(v59, &slice, &remainder, v21, CGRectMinYEdge);
  memset(&v56, 0, sizeof(v56));
  CGRectDivide(slice, &v56, &slice, v19, v15);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v56.origin.x = v22;
  v56.origin.y = v23;
  v56.size.width = v24;
  v56.size.height = v25;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v53 = v27;
  v54 = v26;
  v29 = v28;
  v31 = v30;
  -[UILabel sizeThatFits:](self->_leadingSecondaryLabel, "sizeThatFits:", width, 3.40282347e38);
  v33 = v32;
  -[UILabel sizeThatFits:](self->_trailingSecondaryLabel, "sizeThatFits:", width, 3.40282347e38);
  v35 = v34;
  v37 = fmax(v33, v36);
  CGRectDivide(remainder, &slice, &remainder, v37, CGRectMinYEdge);
  memset(&v55, 0, sizeof(v55));
  CGRectDivide(slice, &v55, &slice, v35, v15);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v55.origin.x = v38;
  v55.origin.y = v39;
  v55.size.width = v40;
  v55.size.height = v41;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  if (!a6)
  {
    v46 = v42;
    v47 = v43;
    v48 = v44;
    v49 = v45;
    -[UILabel setFrame:](self->_leadingPrimaryLabel, "setFrame:", v54, v53, v29, v31);
    -[UILabel setFrame:](self->_trailingPrimaryLabel, "setFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
    -[UILabel setFrame:](self->_leadingSecondaryLabel, "setFrame:", v46, v47, v48, v49);
    -[UILabel setFrame:](self->_trailingSecondaryLabel, "setFrame:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
  }
  if (a4)
  {
    size = slice.size;
    a4->origin = slice.origin;
    a4->size = size;
  }
  if (a5)
  {
    v51 = remainder.size;
    a5->origin = remainder.origin;
    a5->size = v51;
  }
  return v21 + 0.0 + v37;
}

- (double)_layoutLabelsStacked:(CGRect)a3 allocated:(CGRect *)a4 unallocated:(CGRect *)a5 isTemplateLayout:(BOOL)a6
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGSize size;
  CGSize v44;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGRect remainder;
  CGRect slice;
  CGRect v56;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKStackedLeadingTrailingLabelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = x;
  remainder.origin.y = y;
  remainder.size.width = width;
  remainder.size.height = height;
  -[UILabel sizeThatFits:](self->_leadingPrimaryLabel, "sizeThatFits:", width, 3.40282347e38);
  v15 = v14;
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  CGRectDivide(v56, &slice, &remainder, v15, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v51 = v17;
  v52 = v16;
  v50 = v18;
  v53 = v19;
  -[UILabel sizeThatFits:](self->_leadingSecondaryLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v20, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v48 = v22;
  v49 = v21;
  v47 = v23;
  v25 = v24;
  CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_trailingPrimaryLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v26, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v46 = v27;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  -[UILabel sizeThatFits:](self->_trailingSecondaryLabel, "sizeThatFits:", width, 3.40282347e38);
  CGRectDivide(remainder, &slice, &remainder, v34, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  if (!a6)
  {
    v39 = v35;
    v40 = v36;
    v41 = v37;
    v42 = v38;
    -[UILabel setFrame:](self->_leadingPrimaryLabel, "setFrame:", v52, v51, v50, v53);
    -[UILabel setFrame:](self->_trailingPrimaryLabel, "setFrame:", v46, v29, v31, v33);
    -[UILabel setFrame:](self->_leadingSecondaryLabel, "setFrame:", v49, v48, v47, v25);
    -[UILabel setFrame:](self->_trailingSecondaryLabel, "setFrame:", v39, v40, v41, v42);
  }
  if (a4)
  {
    size = slice.size;
    a4->origin = slice.origin;
    a4->size = size;
  }
  if (a5)
  {
    v44 = remainder.size;
    a5->origin = remainder.origin;
    a5->size = v44;
  }
  return v25 + v53 + 0.0 + v25 + 10.0 + v33;
}

- (void)prepareForReuse
{
  UILabel *leadingPrimaryLabel;
  NSString *leadingPrimaryText;
  UILabel *trailingPrimaryLabel;
  NSString *trailingPrimaryText;
  UILabel *leadingSecondaryLabel;
  NSString *leadingSecondaryText;
  UILabel *trailingSecondaryLabel;
  NSString *trailingSecondaryText;
  UILabel *detailLabel;
  NSString *detailText;
  PKProgressBar *progressBar;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKStackedLeadingTrailingLabelCell;
  -[PKStackedLeadingTrailingLabelCell prepareForReuse](&v14, sel_prepareForReuse);
  -[UILabel removeFromSuperview](self->_leadingPrimaryLabel, "removeFromSuperview");
  leadingPrimaryLabel = self->_leadingPrimaryLabel;
  self->_leadingPrimaryLabel = 0;

  leadingPrimaryText = self->_leadingPrimaryText;
  self->_leadingPrimaryText = 0;

  -[UILabel removeFromSuperview](self->_trailingPrimaryLabel, "removeFromSuperview");
  trailingPrimaryLabel = self->_trailingPrimaryLabel;
  self->_trailingPrimaryLabel = 0;

  trailingPrimaryText = self->_trailingPrimaryText;
  self->_trailingPrimaryText = 0;

  -[UILabel removeFromSuperview](self->_leadingSecondaryLabel, "removeFromSuperview");
  leadingSecondaryLabel = self->_leadingSecondaryLabel;
  self->_leadingSecondaryLabel = 0;

  leadingSecondaryText = self->_leadingSecondaryText;
  self->_leadingSecondaryText = 0;

  -[UILabel removeFromSuperview](self->_trailingSecondaryLabel, "removeFromSuperview");
  trailingSecondaryLabel = self->_trailingSecondaryLabel;
  self->_trailingSecondaryLabel = 0;

  trailingSecondaryText = self->_trailingSecondaryText;
  self->_trailingSecondaryText = 0;

  -[UILabel removeFromSuperview](self->_detailLabel, "removeFromSuperview");
  detailLabel = self->_detailLabel;
  self->_detailLabel = 0;

  detailText = self->_detailText;
  self->_detailText = 0;

  -[PKProgressBar removeFromSuperview](self->_progressBar, "removeFromSuperview");
  progressBar = self->_progressBar;
  self->_progressBar = 0;

  self->_progress = 0.0;
  self->_showProgressBar = 0;
}

- (NSString)leadingPrimaryText
{
  return self->_leadingPrimaryText;
}

- (NSString)leadingSecondaryText
{
  return self->_leadingSecondaryText;
}

- (NSString)trailingPrimaryText
{
  return self->_trailingPrimaryText;
}

- (NSString)trailingSecondaryText
{
  return self->_trailingSecondaryText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (BOOL)showProgressBar
{
  return self->_showProgressBar;
}

- (double)progress
{
  return self->_progress;
}

- (UIColor)progressBarStartColor
{
  return self->_progressBarStartColor;
}

- (UIColor)progressBarEndColor
{
  return self->_progressBarEndColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBarEndColor, 0);
  objc_storeStrong((id *)&self->_progressBarStartColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_trailingSecondaryText, 0);
  objc_storeStrong((id *)&self->_trailingPrimaryText, 0);
  objc_storeStrong((id *)&self->_leadingSecondaryText, 0);
  objc_storeStrong((id *)&self->_leadingPrimaryText, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_trailingSecondaryLabel, 0);
  objc_storeStrong((id *)&self->_trailingPrimaryLabel, 0);
  objc_storeStrong((id *)&self->_leadingSecondaryLabel, 0);
  objc_storeStrong((id *)&self->_leadingPrimaryLabel, 0);
}

@end
