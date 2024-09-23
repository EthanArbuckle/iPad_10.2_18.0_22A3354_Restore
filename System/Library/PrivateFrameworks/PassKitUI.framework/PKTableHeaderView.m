@implementation PKTableHeaderView

- (PKTableHeaderView)initWithFrame:(CGRect)a3
{
  PKTableHeaderView *v3;
  PKTableHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKTableHeaderView;
  v3 = -[PKTableHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_maximumHeight = 1.79769313e308;
    -[PKTableHeaderView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);
  }
  return v4;
}

- (void)setActionTitle:(id)a3
{
  -[UIButton pkui_updateConfigurationWithTitle:](self->_actionButton, "pkui_updateConfigurationWithTitle:", a3);
}

- (void)setPassSnapshotUsingDefaultSize:(id)a3 animated:(BOOL)a4 needsCorners:(BOOL)a5
{
  -[PKTableHeaderView setPassSnapshot:withSize:animated:needsCorners:](self, "setPassSnapshot:withSize:animated:needsCorners:", a3, a4, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)setPassSnapshot:(id)a3 withSize:(CGSize)a4 animated:(BOOL)a5 needsCorners:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  double height;
  double width;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;

  v6 = a6;
  v7 = a5;
  height = a4.height;
  width = a4.width;
  v16 = a3;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v16, "size");
    PKFloatRoundToPixel();
    width = v12;
    PKFloatRoundToPixel();
    height = v13;
  }
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_imageView, "setAccessibilityIgnoresInvertColors:", 1);
  -[PKTableHeaderView setImageViewImage:withSize:animated:](self, "setImageViewImage:withSize:animated:", v16, v7, width, height);
  if (v6)
  {
    -[UIImageView layer](self->_imageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v15, "CGColor");
    PKPaymentStyleApplyCorners();

  }
}

- (void)setImageViewImage:(id)a3 withSize:(CGSize)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  id v9;
  UIImageView *imageView;
  UIImageView *v11;
  UIImageView *v12;
  UIImageView *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  PKTableHeaderView *v19;
  id v20;

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  imageView = self->_imageView;
  if (!imageView)
  {
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v12 = self->_imageView;
    self->_imageView = v11;

    -[PKTableHeaderView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  -[UIImageView setFrame:](imageView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
  if (v5)
  {
    v13 = self->_imageView;
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __57__PKTableHeaderView_setImageViewImage_withSize_animated___block_invoke;
    v18 = &unk_1E3E61388;
    v19 = self;
    v20 = v9;
    objc_msgSend(v14, "transitionWithView:duration:options:animations:completion:", v13, 5242880, &v15, 0, 0.300000012);

  }
  else
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", v9);
  }
  -[PKTableHeaderView _updateImageView](self, "_updateImageView", v15, v16, v17, v18, v19);

}

uint64_t __57__PKTableHeaderView_setImageViewImage_withSize_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setImage:", *(_QWORD *)(a1 + 40));
}

- (void)setImageView:(id)a3
{
  UIImageView *v5;
  UIImageView **p_imageView;
  UIImageView *imageView;
  UIImageView *v8;

  v5 = (UIImageView *)a3;
  p_imageView = &self->_imageView;
  imageView = self->_imageView;
  if (imageView != v5)
  {
    v8 = v5;
    -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageView, a3);
    -[UIImageView setContentMode:](*p_imageView, "setContentMode:", 1);
    -[PKTableHeaderView addSubview:](self, "addSubview:", *p_imageView);
    -[PKTableHeaderView _updateImageView](self, "_updateImageView");
    v5 = v8;
  }

}

- (void)_updateImageView
{
  CGSize *p_originalImageViewSize;
  CGFloat v4;
  CGFloat v5;

  p_originalImageViewSize = &self->_originalImageViewSize;
  -[UIImageView frame](self->_imageView, "frame");
  p_originalImageViewSize->width = v4;
  p_originalImageViewSize->height = v5;
  -[PKTableHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAccessoryViewsDisabled:(BOOL)a3
{
  self->_accessoryViewsDisabled = a3;
  -[PKTableHeaderView _updateAccessoryViews](self, "_updateAccessoryViews");
  -[PKTableHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (UIFont)titleFont
{
  UIFont *titleFont;

  titleFont = self->_titleFont;
  if (titleFont)
    return titleFont;
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AE8], (void *)*MEMORY[0x1E0DC48C8], 2, 0);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIFont)subtitleFont
{
  UIFont *subtitleFont;

  subtitleFont = self->_subtitleFont;
  if (subtitleFont)
    return subtitleFont;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48C8]);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
  -[PKTableHeaderView _updateFonts](self, "_updateFonts");
}

- (void)setSubtitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFont, a3);
  -[PKTableHeaderView _updateFonts](self, "_updateFonts");
}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  double v9;
  UILabel *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_titleLabel;
    self->_titleLabel = v5;

    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    LODWORD(v9) = 1036831949;
    objc_msgSend(v8, "setHyphenationFactor:", v9);
    objc_msgSend(v8, "setLineBreakMode:", 4);
    objc_msgSend(v8, "setAlignment:", 1);
    v10 = self->_titleLabel;
    v11 = *MEMORY[0x1E0DC1178];
    v18[0] = v8;
    v12 = *MEMORY[0x1E0DC1138];
    v17[0] = v11;
    v17[1] = v12;
    -[PKTableHeaderView titleFont](self, "titleFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    v17[2] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel _setDefaultAttributes:](v10, "_setDefaultAttributes:", v15);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setMinimumScaleFactor:](self->_titleLabel, "setMinimumScaleFactor:", 0.5);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[PKTableHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
    -[PKTableHeaderView _updateAccessoryViews](self, "_updateAccessoryViews");

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (UILabel)subtitleLabel
{
  UILabel *subtitleLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;

  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_subtitleLabel;
    self->_subtitleLabel = v5;

    v7 = self->_subtitleLabel;
    -[PKTableHeaderView subtitleFont](self, "subtitleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
    -[UILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    -[PKTableHeaderView addSubview:](self, "addSubview:", self->_subtitleLabel);
    subtitleLabel = self->_subtitleLabel;
  }
  return subtitleLabel;
}

- (id)actionButton
{
  UIButton *actionButton;
  void *v4;
  void *v5;
  void *v6;
  UIButton *v7;
  UIButton *v8;

  actionButton = self->_actionButton;
  if (!actionButton)
  {
    v4 = (void *)MEMORY[0x1E0DC3520];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pkui_plainConfigurationWithTitle:font:", 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v6, 0);
    v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v8 = self->_actionButton;
    self->_actionButton = v7;

    -[UIButton setAccessibilityIdentifier:](self->_actionButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67830]);
    -[PKTableHeaderView addSubview:](self, "addSubview:", self->_actionButton);

    actionButton = self->_actionButton;
  }
  return actionButton;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKTableHeaderView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  PKSizeCeilToPixel();
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double maximumHeight;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKTableHeaderView _layoutWithBounds:imageHeightAdjustment:](self, "_layoutWithBounds:imageHeightAdjustment:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
  maximumHeight = self->_maximumHeight;
  if (v9 > maximumHeight)
    -[PKTableHeaderView _layoutWithBounds:imageHeightAdjustment:](self, "_layoutWithBounds:imageHeightAdjustment:", x, y, width, height, maximumHeight - v9);
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 imageHeightAdjustment:(double)a4
{
  CGFloat height;
  double width;
  double y;
  CGFloat x;
  double topPadding;
  unint64_t v11;
  void *v12;
  void *v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MaxY;
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
  double v50;
  double v51;
  double MaxX;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  unint64_t style;
  double v61;
  double v62;
  void *v63;
  _BOOL4 shouldReserveSubtitleHeight;
  UILabel *subtitleLabel;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  double v81;
  double bottomPadding;
  double v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  double v94;
  CGSize result;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  topPadding = self->_topPadding;
  if (topPadding <= 0.0)
  {
    v94 = a3.origin.y;
    if (self->_style != 1)
      goto LABEL_6;
    v11 = PKUIGetMinScreenWidthType();
    topPadding = 52.0;
    if (v11 > 0xA)
      topPadding = 121.0;
  }
  v94 = y + topPadding;
LABEL_6:
  -[UIImageView image](self->_imageView, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = self->_originalImageViewSize.height;
  v90 = width;
  v91 = y;
  v92 = height;
  v93 = x;
  if (v12)
  {
    objc_msgSend(v12, "size");
    v17 = fmin(self->_originalImageViewSize.width / v15, self->_originalImageViewSize.height / v16);
    objc_msgSend(v13, "scale");
    objc_msgSend(v13, "alignmentRectInsets");
    v19 = v18;
    v21 = v20;
    PKFloatRoundToPixelWithScale();
    v23 = v22;
    PKFloatRoundToPixelWithScale();
    v24 = v17 * v19;
    v87 = v17 * v21;
    v88 = v25;
    if (a4 == 0.0)
    {
      v26 = v90;
    }
    else
    {
      v96.origin.x = v93;
      v26 = v90;
      v96.origin.y = v91;
      v96.size.width = v90;
      v96.size.height = v92;
      CGRectGetWidth(v96);
      PKSizeScaleAspectFit();
    }
    v30 = v26;
    UIRectCenteredXInRect();
    v27 = v31;
    v28 = v32;
    v29 = v33;
    v14 = v34;
    if (!self->_isTemplateLayout)
      -[UIImageView setFrame:](self->_imageView, "setFrame:", v31 - v24, v32 - v23, v33 - (-v88 - v24), v34 - (-v87 - v23));
    y = v91;
    width = v30;
  }
  else
  {
    v27 = 0.0;
    v28 = v94;
    v29 = self->_originalImageViewSize.width;
  }
  if (self->_imageView)
  {
    v97.origin.x = v27;
    v97.origin.y = v28;
    v97.size.width = v29;
    v97.size.height = v14;
    MaxY = CGRectGetMaxY(v97) + 25.0;
  }
  else
  {
    if (self->_style == 1)
      goto LABEL_19;
    v98.origin.x = v27;
    v98.origin.y = v28;
    v98.size.width = v29;
    v98.size.height = v14;
    MaxY = CGRectGetMaxY(v98);
  }
  v94 = MaxY;
LABEL_19:
  -[UIActivityIndicatorView frame](self->_activityIndicator, "frame");
  v37 = v36;
  -[UILabel frame](self->_titleLabel, "frame");
  if (PKUIGetMinScreenWidthType())
    v38 = 24.0;
  else
    v38 = 16.0;
  -[LAUICheckmarkLayer frame](self->_checkmarkLayer, "frame");
  -[LAUICheckmarkLayer aspectSize](self->_checkmarkLayer, "aspectSize");
  PKSizeScaleAspectFit();
  v89 = width + v38 * -2.0;
  v40 = v89 + -10.0 + fmax(v37, v39) * -2.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v40, 1.79769313e308);
  v42 = v41;
  v99.size.width = width;
  v44 = fmin(v43, v40);
  v99.size.height = v92;
  v99.origin.x = v93;
  v99.origin.y = y;
  v45 = floor(CGRectGetMidX(v99) + v44 * -0.5);
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v45, v94, v44, v42);
  UIRectCenteredYInRect();
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v100.origin.x = v45;
  v100.origin.y = v94;
  v100.size.width = v44;
  v100.size.height = v42;
  MaxX = CGRectGetMaxX(v100);
  if (!self->_isTemplateLayout)
    -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", MaxX + 10.0, v47, v49, v51);
  UIRectCenteredYInRect();
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v101.origin.x = v45;
  v101.origin.y = v94;
  v101.size.width = v44;
  v101.size.height = v42;
  v59 = CGRectGetMaxX(v101);
  if (!self->_isTemplateLayout)
    -[LAUICheckmarkLayer setFrame:](self->_checkmarkLayer, "setFrame:", v59 + 10.0, v54, v56, v58);
  style = self->_style;
  v61 = 0.0;
  if (style <= 2)
    v61 = dbl_19DF17BC0[style];
  v102.origin.x = v45;
  v102.origin.y = v94;
  v102.size.width = v44;
  v102.size.height = v42;
  v62 = CGRectGetMaxY(v102);
  -[UILabel frame](self->_subtitleLabel, "frame");
  -[UILabel text](self->_subtitleLabel, "text");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v63, "length"))
  {

LABEL_32:
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v89, 1.79769313e308);
    goto LABEL_35;
  }
  shouldReserveSubtitleHeight = self->_shouldReserveSubtitleHeight;

  if (!shouldReserveSubtitleHeight)
    goto LABEL_32;
  subtitleLabel = self->_subtitleLabel;
  PKLocalizedString(CFSTR(" "));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](subtitleLabel, "setText:", v66);

  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v89, 1.79769313e308);
  -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
LABEL_35:
  v67 = v61 + v62;
  UIRectCenteredXInRect();
  v71 = v68;
  v72 = v69;
  v73 = v70;
  if (!self->_isTemplateLayout)
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v68, v67, v69, v70);
  v103.origin.x = v71;
  v103.origin.y = v67;
  v103.size.width = v72;
  v103.size.height = v73;
  v74 = CGRectGetMaxY(v103) + 10.0;
  -[UIButton frame](self->_actionButton, "frame");
  UIRectCenteredXInRect();
  v78 = v75;
  v79 = v76;
  v80 = v77;
  if (!self->_isTemplateLayout)
    -[UIButton setFrame:](self->_actionButton, "setFrame:", v75, v74, v76, v77);
  v104.origin.x = v78;
  v104.origin.y = v74;
  v104.size.width = v79;
  v104.size.height = v80;
  v81 = CGRectGetMaxY(v104);
  bottomPadding = self->_bottomPadding;
  if (bottomPadding <= 0.0)
    bottomPadding = -0.0;
  v83 = v81 + bottomPadding;
  v105.origin.x = v93;
  v105.origin.y = v91;
  v105.size.width = v90;
  v105.size.height = v92;
  v84 = CGRectGetWidth(v105);

  v85 = v84;
  v86 = v83;
  result.height = v86;
  result.width = v85;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTableHeaderView;
  -[PKTableHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKTableHeaderView bounds](self, "bounds");
  -[PKTableHeaderView _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTableHeaderView;
  -[PKTableHeaderView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[PKTableHeaderView _updateCheckmarkColor](self, "_updateCheckmarkColor");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKTableHeaderView;
  -[PKTableHeaderView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[PKTableHeaderView _updateCheckmarkColor](self, "_updateCheckmarkColor");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTableHeaderView;
  -[PKTableHeaderView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[PKTableHeaderView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[PKTableHeaderView _updateFonts](self, "_updateFonts");
  }

}

- (BOOL)_hasAccessibilityLargeText
{
  NSString *v2;
  BOOL IsAccessibilityCategory;

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (void)_updateFonts
{
  UILabel *titleLabel;
  void *v4;
  UILabel *subtitleLabel;
  void *v6;
  UIButton *actionButton;
  id v8;

  titleLabel = self->_titleLabel;
  -[PKTableHeaderView titleFont](self, "titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](titleLabel, "setFont:", v4);

  subtitleLabel = self->_subtitleLabel;
  -[PKTableHeaderView subtitleFont](self, "subtitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](subtitleLabel, "setFont:", v6);

  actionButton = self->_actionButton;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48C8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton pkui_updateConfigurationWithFont:](actionButton, "pkui_updateConfigurationWithFont:", v8);

}

- (void)_updateAccessoryViews
{
  _BOOL4 accessoryViewsDisabled;
  UIActivityIndicatorView *activityIndicator;
  UIActivityIndicatorView *v5;
  LAUICheckmarkLayer *checkmarkLayer;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *v8;
  LAUICheckmarkLayer *v9;
  LAUICheckmarkLayer *v10;
  void *v11;

  accessoryViewsDisabled = self->_accessoryViewsDisabled;
  activityIndicator = self->_activityIndicator;
  if (accessoryViewsDisabled)
  {
    -[UIActivityIndicatorView removeFromSuperview](activityIndicator, "removeFromSuperview");
    v5 = self->_activityIndicator;
    self->_activityIndicator = 0;

    -[LAUICheckmarkLayer removeFromSuperlayer](self->_checkmarkLayer, "removeFromSuperlayer");
    checkmarkLayer = self->_checkmarkLayer;
    self->_checkmarkLayer = 0;

  }
  else
  {
    if (!activityIndicator)
    {
      v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      v8 = self->_activityIndicator;
      self->_activityIndicator = v7;

      -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
      -[UIActivityIndicatorView sizeToFit](self->_activityIndicator, "sizeToFit");
      -[PKTableHeaderView addSubview:](self, "addSubview:", self->_activityIndicator);
    }
    if (!self->_checkmarkLayer)
    {
      v9 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E0D44440]);
      v10 = self->_checkmarkLayer;
      self->_checkmarkLayer = v9;

      -[LAUICheckmarkLayer setLineWidthScale:](self->_checkmarkLayer, "setLineWidthScale:", 1.4);
      -[LAUICheckmarkLayer setRevealed:animated:](self->_checkmarkLayer, "setRevealed:animated:", 0, 0);
      -[PKTableHeaderView layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSublayer:", self->_checkmarkLayer);

      -[PKTableHeaderView _updateCheckmarkColor](self, "_updateCheckmarkColor");
    }
  }
}

- (void)_updateCheckmarkColor
{
  void *v3;
  _QWORD v4[5];

  -[PKTableHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__PKTableHeaderView__updateCheckmarkColor__block_invoke;
  v4[3] = &unk_1E3E612E8;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

}

void __42__PKTableHeaderView__updateCheckmarkColor__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[67];
  objc_msgSend(v1, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setColor:animated:", objc_msgSend(v3, "CGColor"), 0);

}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

- (BOOL)accessoryViewsDisabled
{
  return self->_accessoryViewsDisabled;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)shouldReserveSubtitleHeight
{
  return self->_shouldReserveSubtitleHeight;
}

- (void)setShouldReserveSubtitleHeight:(BOOL)a3
{
  self->_shouldReserveSubtitleHeight = a3;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (LAUICheckmarkLayer)checkmarkLayer
{
  return self->_checkmarkLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
