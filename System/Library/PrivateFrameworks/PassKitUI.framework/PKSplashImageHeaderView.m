@implementation PKSplashImageHeaderView

- (PKSplashImageHeaderView)initWithFrame:(CGRect)a3
{
  PKSplashImageHeaderView *v3;
  UIView *v4;
  UIView *fallbackColorView;
  UIImageView *v6;
  UIImageView *backgroundImageView;
  UIImageView *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  CAGradientLayer *gradientLayer;
  CAGradientLayer *v14;
  void *v15;
  CAGradientLayer *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  UIImageView *v24;
  UIImageView *iconImageView;
  UIImageView *v26;
  void *v27;
  UILabel *v28;
  UILabel *primaryLabel;
  UILabel *v30;
  void *v31;
  uint64_t v32;
  UILabel *v33;
  void *v34;
  void *v35;
  UILabel *v36;
  UILabel *secondaryLabel;
  UILabel *v38;
  void *v39;
  UILabel *v40;
  void *v41;
  UILabel *v42;
  UILabel *attributionLabel;
  UILabel *v44;
  void *v45;
  UILabel *v46;
  void *v47;
  int v49;
  objc_super v50;
  _QWORD v51[5];

  v51[4] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)PKSplashImageHeaderView;
  v3 = -[PKSplashImageHeaderView initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    fallbackColorView = v3->_fallbackColorView;
    v3->_fallbackColorView = v4;

    -[PKSplashImageHeaderView addSubview:](v3, "addSubview:", v3->_fallbackColorView);
    v49 = -[PKSplashImageHeaderView _shouldReverseLayoutDirection](v3, "_shouldReverseLayoutDirection");
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = v6;

    v8 = v3->_backgroundImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[UIImageView setContentMode:](v3->_backgroundImageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v3->_backgroundImageView, "setClipsToBounds:", 1);
    -[UIImageView layer](v3->_backgroundImageView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 0;
    objc_msgSend(v10, "setOpacity:", v11);

    -[PKSplashImageHeaderView addSubview:](v3, "addSubview:", v3->_backgroundImageView);
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v12 = objc_claimAutoreleasedReturnValue();
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = (CAGradientLayer *)v12;

    v14 = v3->_gradientLayer;
    PKLayerNullActions();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setActions:](v14, "setActions:", v15);

    -[CAGradientLayer setHidden:](v3->_gradientLayer, "setHidden:", 1);
    -[CAGradientLayer setType:](v3->_gradientLayer, "setType:", *MEMORY[0x1E0CD2F48]);
    v16 = v3->_gradientLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v51[0] = objc_msgSend(v17, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.05);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v51[1] = objc_msgSend(v18, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.15);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v51[2] = objc_msgSend(v19, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.8);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v51[3] = objc_msgSend(v20, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](v16, "setColors:", v21);

    -[CAGradientLayer setLocations:](v3->_gradientLayer, "setLocations:", &unk_1E3FAEAE8);
    v22 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSublayer:", v3->_gradientLayer);

    -[PKSplashImageHeaderView addSubview:](v3, "addSubview:", v22);
    v24 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v24;

    v26 = v3->_iconImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v26, "setBackgroundColor:", v27);

    -[UIImageView _setContinuousCornerRadius:](v3->_iconImageView, "_setContinuousCornerRadius:", 8.0);
    -[UIImageView setClipsToBounds:](v3->_iconImageView, "setClipsToBounds:", 1);
    -[UIImageView setContentMode:](v3->_iconImageView, "setContentMode:", 1);
    -[PKSplashImageHeaderView addSubview:](v3, "addSubview:", v3->_iconImageView);
    v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primaryLabel = v3->_primaryLabel;
    v3->_primaryLabel = v28;

    v30 = v3->_primaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v30, "setTextColor:", v31);

    if (v49)
      v32 = 0;
    else
      v32 = 2;
    -[UILabel setTextAlignment:](v3->_primaryLabel, "setTextAlignment:", v32);
    -[UILabel setNumberOfLines:](v3->_primaryLabel, "setNumberOfLines:", 2);
    v33 = v3->_primaryLabel;
    v34 = (void *)*MEMORY[0x1E0DC48F8];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC48F8], 32770, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v33, "setFont:", v35);

    -[UILabel setAccessibilityIdentifier:](v3->_primaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
    -[PKSplashImageHeaderView addSubview:](v3, "addSubview:", v3->_primaryLabel);
    v36 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryLabel = v3->_secondaryLabel;
    v3->_secondaryLabel = v36;

    -[UILabel setTextAlignment:](v3->_secondaryLabel, "setTextAlignment:", v32);
    -[UILabel setNumberOfLines:](v3->_secondaryLabel, "setNumberOfLines:", 1);
    v38 = v3->_secondaryLabel;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], v34, 2, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v38, "setFont:", v39);

    v40 = v3->_secondaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v40, "setTextColor:", v41);

    -[UILabel setAccessibilityIdentifier:](v3->_secondaryLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
    -[PKSplashImageHeaderView addSubview:](v3, "addSubview:", v3->_secondaryLabel);
    v42 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    attributionLabel = v3->_attributionLabel;
    v3->_attributionLabel = v42;

    -[UILabel setNumberOfLines:](v3->_attributionLabel, "setNumberOfLines:", 1);
    v44 = v3->_attributionLabel;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A98], (NSString *)*MEMORY[0x1E0DC4918]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v44, "setFont:", v45);

    -[UILabel setTextAlignment:](v3->_attributionLabel, "setTextAlignment:", 1);
    v46 = v3->_attributionLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v46, "setTextColor:", v47);

    -[UILabel setAccessibilityIdentifier:](v3->_attributionLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AE8]);
    -[PKSplashImageHeaderView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C48]);

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  PKFloatRoundToPixel();
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CAGradientLayer *gradientLayer;
  CGRectEdge v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  float v30;
  float v31;
  float v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  UILabel *v46;
  UILabel *primaryLabel;
  double v48;
  CGFloat v49;
  CGFloat v50;
  UILabel *v51;
  CGFloat MinY;
  double v53;
  CGFloat v54;
  UILabel *secondaryLabel;
  CGFloat v56;
  CGFloat v57;
  float v58;
  float v59;
  CGFloat v60;
  CGRect slice;
  CGRect remainder;
  objc_super v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v63.receiver = self;
  v63.super_class = (Class)PKSplashImageHeaderView;
  -[PKSplashImageHeaderView layoutSubviews](&v63, sel_layoutSubviews);
  -[PKSplashImageHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  memset(&slice, 0, sizeof(slice));
  -[UIView setFrame:](self->_fallbackColorView, "setFrame:", v3);
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v4, v6, v8, v10);
  gradientLayer = self->_gradientLayer;
  -[UIImageView bounds](self->_backgroundImageView, "bounds");
  -[CAGradientLayer setFrame:](gradientLayer, "setFrame:");
  if (-[PKSplashImageHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v13 = CGRectMaxXEdge;
  else
    v13 = CGRectMinXEdge;
  v14 = v6 + 0.0;
  v15 = v8 + -32.0;
  remainder.origin.x = v4 + 16.0;
  remainder.origin.y = v6 + 0.0;
  remainder.size.width = v8 + -32.0;
  remainder.size.height = v10 + -16.0;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  v64.origin.x = v4 + 16.0;
  v64.origin.y = v14;
  v64.size.width = v15;
  v64.size.height = v10 + -16.0;
  CGRectDivide(v64, &slice, &remainder, 89.0, v13);
  -[UILabel superview](self->_attributionLabel, "superview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel sizeThatFits:](self->_primaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v26 = v25;
  -[UILabel font](self->_primaryLabel, "font");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lineHeight");
  v29 = v28;

  if (v24)
  {
    v56 = v17;
    v57 = v19;
    v60 = v26;
    v30 = v26;
    v31 = ceilf(v30);
    v32 = v29;
    v58 = ceilf(v32);
    v59 = v31;
    -[UILabel sizeThatFits:](self->_attributionLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v34 = v33;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    -[UILabel font](self->_secondaryLabel, "font");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "descender");
    v45 = v44;

    -[UILabel setFrame:](self->_attributionLabel, "setFrame:", v36, v38 - v45, v40, v42);
    CGRectDivide(remainder, &slice, &remainder, v34 + v45, CGRectMaxYEdge);
    if (v59 <= v58)
    {
      v67.origin.x = v56;
      v67.origin.y = v57;
      v67.size.width = v21;
      v67.size.height = v23;
      MinY = CGRectGetMinY(v67);
      CGRectDivide(remainder, &slice, &remainder, MinY, CGRectMinYEdge);
      -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
      v54 = v53;
      secondaryLabel = self->_secondaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](secondaryLabel, "setFrame:");
      CGRectDivide(remainder, &slice, &remainder, v54, CGRectMinYEdge);
      primaryLabel = self->_primaryLabel;
    }
    else
    {
      v46 = self->_primaryLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](v46, "setFrame:");
      CGRectDivide(remainder, &slice, &remainder, v60, CGRectMaxYEdge);
      -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
      primaryLabel = self->_secondaryLabel;
    }
    PKContentAlignmentMake();
  }
  else
  {
    -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    v49 = v48;
    v65.origin.x = v17;
    v65.origin.y = v19;
    v65.size.width = v21;
    v65.size.height = v23;
    CGRectGetMinY(v65);
    v66.origin.x = v17;
    v66.origin.y = v19;
    v66.size.width = v21;
    v66.size.height = v23;
    CGRectGetHeight(v66);
    PKFloatRoundToPixel();
    CGRectDivide(remainder, &slice, &remainder, v50, CGRectMinYEdge);
    v51 = self->_secondaryLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v51, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, v49, CGRectMinYEdge);
    primaryLabel = self->_primaryLabel;
    PKContentAlignmentMake();
  }
  PKSizeAlignedInRect();
  -[UILabel setFrame:](primaryLabel, "setFrame:");
}

- (void)setPrimaryText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *primaryText;
  NSString *v10;

  v4 = a3;
  v5 = self->_primaryText;
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
    primaryText = self->_primaryText;
    self->_primaryText = v8;

    -[UILabel setText:](self->_primaryLabel, "setText:", self->_primaryText);
    -[PKSplashImageHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setSecondaryText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *secondaryText;
  UILabel *secondaryLabel;
  void *v11;
  NSString *v12;

  v4 = a3;
  v5 = self->_secondaryText;
  v6 = (NSString *)v4;
  v12 = v6;
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
    v8 = (NSString *)-[NSString copy](v12, "copy");
    secondaryText = self->_secondaryText;
    self->_secondaryText = v8;

    secondaryLabel = self->_secondaryLabel;
    -[NSString pk_uppercaseStringForPreferredLocale](self->_secondaryText, "pk_uppercaseStringForPreferredLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](secondaryLabel, "setText:", v11);

    -[PKSplashImageHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setIconImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_iconImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_iconImage, a3);
    -[UIImageView setImage:](self->_iconImageView, "setImage:", self->_iconImage);
    v5 = v6;
  }

}

- (void)setBackgroundImage:(id)a3
{
  -[PKSplashImageHeaderView setBackgroundImage:animated:](self, "setBackgroundImage:animated:", a3, 0);
}

- (void)setBackgroundImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIImage *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  UIImage *v13;

  v4 = a4;
  v7 = (UIImage *)a3;
  if (self->_backgroundImage != v7)
  {
    v13 = v7;
    objc_storeStrong((id *)&self->_backgroundImage, a3);
    -[UIImageView setImage:](self->_backgroundImageView, "setImage:", v13);
    -[UIImageView layer](self->_backgroundImageView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "opacity");
    if (v4 && *(float *)&v9 != 1.0)
    {
      v10 = *(float *)&v9;
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v10, 1.0);
      v12 = (id)objc_msgSend(v8, "pkui_addAdditiveAnimation:", v11);

    }
    LODWORD(v9) = 1.0;
    objc_msgSend(v8, "setOpacity:", v9);

    v7 = v13;
  }

}

- (void)setFallbackColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_fallbackColor != v5)
  {
    objc_storeStrong((id *)&self->_fallbackColor, a3);
    -[UIView setBackgroundColor:](self->_fallbackColorView, "setBackgroundColor:", v5);
  }

}

- (void)setShowsGradientOverlay:(BOOL)a3
{
  if (((!self->_showsGradientOverlay ^ a3) & 1) == 0)
  {
    self->_showsGradientOverlay = a3;
    -[CAGradientLayer setHidden:](self->_gradientLayer, "setHidden:", !a3);
  }
}

- (void)setAttributionProviderName:(id)a3
{
  id v4;
  NSString *attributionProviderName;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSString *v11;

  v4 = a3;
  attributionProviderName = self->_attributionProviderName;
  v11 = (NSString *)v4;
  v6 = attributionProviderName;
  if (v6 != v11)
  {
    if (v11 && v6)
    {
      v7 = -[NSString isEqualToString:](v11, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_14;
    }
    else
    {

      if (!v11)
      {
        -[UILabel removeFromSuperview](self->_attributionLabel, "removeFromSuperview");
LABEL_12:
        -[PKSplashImageHeaderView setNeedsLayout](self, "setNeedsLayout");
        goto LABEL_13;
      }
    }
    -[UILabel superview](self->_attributionLabel, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      -[PKSplashImageHeaderView addSubview:](self, "addSubview:", self->_attributionLabel);
    PKLocalizedFeatureString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_attributionLabel, "setText:", v10, v11);

    goto LABEL_12;
  }

LABEL_13:
  v8 = v11;
LABEL_14:

}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (BOOL)showsGradientOverlay
{
  return self->_showsGradientOverlay;
}

- (UIColor)fallbackColor
{
  return self->_fallbackColor;
}

- (NSString)attributionProviderName
{
  return self->_attributionProviderName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionProviderName, 0);
  objc_storeStrong((id *)&self->_fallbackColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_fallbackColorView, 0);
}

@end
