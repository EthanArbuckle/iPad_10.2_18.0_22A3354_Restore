@implementation PKProvisioningProgressView

- (PKProvisioningProgressView)init
{
  PKProvisioningProgressView *v2;
  PKProvisioningProgressView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKProvisioningProgressView;
  v2 = -[PKProvisioningProgressView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PKProvisioningProgressView createViews](v2, "createViews");
  return v3;
}

- (void)createViews
{
  UIScrollView *v3;
  UIScrollView *scrollView;
  UITextView *v5;
  UITextView *primaryLabel;
  UITextView *v7;
  void *v8;
  UILabel *v9;
  UILabel *secondaryLabel;
  UILabel *v11;
  NSString *v12;
  NSString *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  UIProgressView *v17;
  UIProgressView *progressView;
  UILabel *v19;
  UILabel *progressLabel;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  id v25;

  PKUIGetMinScreenWidthType();
  -[PKProvisioningProgressView layoutMargins](self, "layoutMargins");
  -[PKProvisioningProgressView setLayoutMargins:](self, "setLayoutMargins:");
  v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[PKProvisioningProgressView addSubview:](self, "addSubview:", self->_scrollView);
  objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = (UITextView *)objc_claimAutoreleasedReturnValue();
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v5;

  -[UITextView setTextAlignment:](self->_primaryLabel, "setTextAlignment:", 1);
  v7 = self->_primaryLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](v7, "setTextColor:", v8);

  -[UITextView setSelectable:](self->_primaryLabel, "setSelectable:", 1);
  -[UITextView textContainer](self->_primaryLabel, "textContainer");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setMaximumNumberOfLines:", 0);
  objc_msgSend(v25, "setLineBreakMode:", 4);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_primaryLabel);
  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v9;

  v11 = self->_secondaryLabel;
  v12 = (NSString *)*MEMORY[0x1E0DC4A88];
  v13 = (NSString *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v11, "setFont:", v14);

  -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  v15 = self->_secondaryLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v15, "setTextColor:", v16);

  -[UILabel setTextAlignment:](self->_secondaryLabel, "setTextAlignment:", 1);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_secondaryLabel);
  v17 = (UIProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B98]), "initWithProgressViewStyle:", 0);
  progressView = self->_progressView;
  self->_progressView = v17;

  -[PKProvisioningProgressView addSubview:](self, "addSubview:", self->_progressView);
  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  progressLabel = self->_progressLabel;
  self->_progressLabel = v19;

  v21 = self->_progressLabel;
  PKFontForDefaultDesign(v12, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v21, "setFont:", v22);

  -[UILabel setNumberOfLines:](self->_progressLabel, "setNumberOfLines:", 1);
  -[UILabel setTextAlignment:](self->_progressLabel, "setTextAlignment:", 1);
  v23 = self->_progressLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v23, "setTextColor:", v24);

  -[PKProvisioningProgressView addSubview:](self, "addSubview:", self->_progressLabel);
}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView *headerView;
  UIView *v7;

  v5 = (UIView *)a3;
  headerView = self->_headerView;
  v7 = v5;
  if (headerView != v5)
  {
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    if (self->_headerView)
    {
      -[UIScrollView addSubview:](self->_scrollView, "addSubview:");
      -[PKProvisioningProgressView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setPrimaryText:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4);

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setLineBreakMode:", 0);
  objc_msgSend(v7, "setAlignment:", 1);
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B48], (void *)*MEMORY[0x1E0DC48C8], 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v8, 0, v5);
  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v7, 0, v5);
  v9 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAttribute:value:range:", v9, v10, 0, v5);

  -[UITextView setAttributedText:](self->_primaryLabel, "setAttributedText:", v11);
}

- (void)setShowingCheckmark:(BOOL)a3
{
  -[PKProvisioningProgressView setShowingCheckmark:animated:](self, "setShowingCheckmark:animated:", a3, 0);
}

- (void)setShowingCheckmark:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  LAUICheckmarkLayer *v6;
  LAUICheckmarkLayer *checkmarkLayer;
  LAUICheckmarkLayer *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  LAUICheckmarkLayer *v14;

  if (self->_showingCheckmark != a3)
  {
    self->_showingCheckmark = a3;
    if (a3)
    {
      v5 = a4;
      v6 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E0D44440]);
      checkmarkLayer = self->_checkmarkLayer;
      self->_checkmarkLayer = v6;

      -[LAUICheckmarkLayer setLineWidthScale:](self->_checkmarkLayer, "setLineWidthScale:", 1.4);
      -[LAUICheckmarkLayer setRevealed:animated:](self->_checkmarkLayer, "setRevealed:animated:", 1, v5);
      v8 = self->_checkmarkLayer;
      v9 = *MEMORY[0x1E0C9D538];
      v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      -[LAUICheckmarkLayer aspectSize](v8, "aspectSize");
      PKSizeScaleAspectFit();
      -[LAUICheckmarkLayer setFrame:](v8, "setFrame:", v9, v10, v11, v12);
      -[PKProvisioningProgressView _updateCheckmarkColor](self, "_updateCheckmarkColor");
      -[UIScrollView layer](self->_scrollView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSublayer:", self->_checkmarkLayer);

      -[PKProvisioningProgressView setNeedsLayout](self, "setNeedsLayout");
    }
    else
    {
      -[LAUICheckmarkLayer removeFromSuperlayer](self->_checkmarkLayer, "removeFromSuperlayer", a3, a4);
      v14 = self->_checkmarkLayer;
      self->_checkmarkLayer = 0;

    }
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKProvisioningProgressView;
  -[PKProvisioningProgressView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKProvisioningProgressView bounds](self, "bounds");
  -[PKProvisioningProgressView _layoutWithBounds:applyLayout:](self, "_layoutWithBounds:applyLayout:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKProvisioningProgressView _layoutWithBounds:applyLayout:](self, "_layoutWithBounds:applyLayout:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 applyLayout:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  UIView *headerView;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  LAUICheckmarkLayer *checkmarkLayer;
  void *v32;
  void *v33;
  UITextView *primaryLabel;
  void *v35;
  void *v36;
  UITextView *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double rect1;
  CGSize result;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  rect1 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKProvisioningProgressView layoutMargins](self, "layoutMargins");
  v69 = v10;
  v12 = width - (v10 + v11);
  -[UIProgressView frame](self->_progressView, "frame");
  v14 = v13;
  v15 = v12;
  -[UILabel sizeThatFits:](self->_progressLabel, "sizeThatFits:", v12);
  v17 = v16;
  v72.origin.x = x;
  v72.origin.y = y;
  v72.size.width = width;
  v72.size.height = height;
  v18 = CGRectGetMaxY(v72) - v17 - v14 + -50.0 + -13.0 + -10.0;
  if (v4)
  {
    -[UIScrollView frame](self->_scrollView, "frame");
    v76.origin.x = v19;
    v76.origin.y = v20;
    v76.size.width = v21;
    v76.size.height = v22;
    v73.origin.x = x;
    v73.origin.y = y;
    v73.size.width = rect1;
    v73.size.height = height;
    if (!CGRectEqualToRect(v73, v76))
      -[UIScrollView setFrame:](self->_scrollView, "setFrame:", x, y, rect1, v18);
  }
  headerView = self->_headerView;
  v24 = 0.0;
  v25 = v15;
  if (headerView)
  {
    -[UIView sizeThatFits:](headerView, "sizeThatFits:", rect1, 1.79769313e308);
    PKSizeRoundToPixel();
    v24 = v26 + 10.0;
    if (v4)
      -[UIView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), rect1, v26);
  }
  v27 = x + v69;
  -[UITextView sizeThatFits:](self->_primaryLabel, "sizeThatFits:", v15 + -52.0, 1.79769313e308);
  if (v4)
  {
    v29 = v28;
    -[UITextView setFrame:](self->_primaryLabel, "setFrame:", v27 + 26.0, v24, v15 + -52.0, v28);
    v30 = v24 + v29 + 5.0;
    checkmarkLayer = self->_checkmarkLayer;
    if (checkmarkLayer)
    {
      v68 = v24 + v29 + 5.0;
      -[LAUICheckmarkLayer frame](checkmarkLayer, "frame");
      -[UITextView layoutManager](self->_primaryLabel, "layoutManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView textContainer](self->_primaryLabel, "textContainer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "ensureLayoutForTextContainer:", v33);

      primaryLabel = self->_primaryLabel;
      -[UITextView endOfDocument](primaryLabel, "endOfDocument");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView positionFromPosition:offset:](primaryLabel, "positionFromPosition:offset:", v35, -1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = self->_primaryLabel;
      -[UITextView endOfDocument](v37, "endOfDocument");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView textRangeFromPosition:toPosition:](v37, "textRangeFromPosition:toPosition:", v36, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      -[UITextView firstRectForRange:](self->_primaryLabel, "firstRectForRange:", v39);
      -[PKProvisioningProgressView convertRect:fromView:](self, "convertRect:fromView:", self->_primaryLabel);
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v48 = -[PKProvisioningProgressView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      v49 = v41;
      v50 = v43;
      v51 = v45;
      v52 = v47;
      if (v48)
        CGRectGetMinX(*(CGRect *)&v49);
      else
        CGRectGetMaxX(*(CGRect *)&v49);
      UIRectCenteredYInRect();
      -[LAUICheckmarkLayer setFrame:](self->_checkmarkLayer, "setFrame:");

      v30 = v68;
    }
    -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", v25, 1.79769313e308);
    v54 = v53;
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v27, v30, v25, v53);
    v74.origin.x = v27;
    v74.origin.y = v30;
    v74.size.width = v25;
    v74.size.height = v54;
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", rect1, CGRectGetMaxY(v74));
  }
  else
  {
    -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", v15, 1.79769313e308);
  }
  PKFloatRoundToPixel();
  UIRectCenteredXInRect();
  v59 = v55;
  v60 = v56;
  v61 = v57;
  v62 = v58;
  if (v4)
  {
    -[UIProgressView setFrame:](self->_progressView, "setFrame:", v55, v56, v57, v58);
    v75.origin.x = v59;
    v75.origin.y = v60;
    v75.size.width = v61;
    v75.size.height = v62;
    v63 = CGRectGetMaxY(v75) + 13.0;
    v64 = v25;
    v65 = v17;
    -[UILabel setFrame:](self->_progressLabel, "setFrame:", v27, v63, v64, v17);
  }
  else
  {
    v63 = CGRectGetMaxY(*(CGRect *)&v55) + 13.0;
    v65 = v17;
  }
  v66 = v65 + v63;
  v67 = rect1;
  result.height = v66;
  result.width = v67;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKProvisioningProgressView;
  -[PKProvisioningProgressView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PKProvisioningProgressView _updateCheckmarkColor](self, "_updateCheckmarkColor");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKProvisioningProgressView;
  -[PKProvisioningProgressView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKProvisioningProgressView _updateCheckmarkColor](self, "_updateCheckmarkColor");
}

- (void)_updateCheckmarkColor
{
  void *v3;
  _QWORD v4[5];

  -[PKProvisioningProgressView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PKProvisioningProgressView__updateCheckmarkColor__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __51__PKProvisioningProgressView__updateCheckmarkColor__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[60];
  objc_msgSend(v1, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setColor:animated:", objc_msgSend(v3, "CGColor"), 0);

}

- (UIView)headerView
{
  return self->_headerView;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (UITextView)primaryLabel
{
  return self->_primaryLabel;
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (UILabel)progressLabel
{
  return self->_progressLabel;
}

- (BOOL)isShowingCheckmark
{
  return self->_showingCheckmark;
}

- (LAUICheckmarkLayer)checkmarkLayer
{
  return self->_checkmarkLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
