@implementation BKInfoHUD

- (BKInfoHUD)initWithFrame:(CGRect)a3
{
  BKInfoHUD *v3;
  BKInfoHUD *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKInfoHUD;
  v3 = -[BKInfoHUD initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = v3;
  if (v3)
  {
    -[BKInfoHUD constructViews](v3, "constructViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v6 = -[BKInfoHUD registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (self->_textLabel)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD _compositingFilterToUse](self, "_compositingFilterToUse"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_textLabel, "layer"));
    objc_msgSend(v9, "setCompositingFilter:", v8);

  }
  if (self->_iconImageView)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD _compositingFilterToUse](self, "_compositingFilterToUse"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_iconImageView, "layer"));
    objc_msgSend(v12, "setCompositingFilter:", v11);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD currentSymbolName](self, "currentSymbolName"));
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD currentSymbolName](self, "currentSymbolName"));
    -[BKInfoHUD setIconSymbol:](self, "setIconSymbol:", v15);

  }
}

- (void)setInfoText:(id)a3
{
  UILabel *textLabel;
  id v5;

  textLabel = self->_textLabel;
  v5 = a3;
  -[UILabel setText:](textLabel, "setText:", v5);
  -[UILabel setAccessibilityValue:](self->_textLabel, "setAccessibilityValue:", v5);

  -[BKInfoHUD setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (id)infoText
{
  return -[UILabel text](self->_textLabel, "text");
}

- (void)forceReflowText
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_textLabel, "text"));
  -[UILabel setText:](self->_textLabel, "setText:", &stru_1C3088);
  -[UILabel setText:](self->_textLabel, "setText:", v3);
  -[BKInfoHUD setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)setIconSymbol:(id)a3
{
  void *v4;
  void *v5;
  UIImageView *iconImageView;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[BKInfoHUD setCurrentSymbolName:](self, "setCurrentSymbolName:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 15.0, UIFontWeightSemibold));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleHeadline));
  iconImageView = self->_iconImageView;
  if (v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scaledFontForFont:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v10, v8));
    -[UIImageView setImage:](iconImageView, "setImage:", v9);

  }
  else
  {
    -[UIImageView setImage:](iconImageView, "setImage:", 0);
  }
  -[BKInfoHUD _updateImageAndTextConstraints](self, "_updateImageAndTextConstraints");
  -[BKInfoHUD setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)updateLabelFont
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
  objc_msgSend(v5, "_scaledValueForValue:", 15.0);
  if (self->_usesMonospacedDigitFont)
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  v4 = (void *)v3;
  -[UILabel setFont:](self->_textLabel, "setFont:", v3);

}

- (id)_compositingFilterToUse
{
  void *v2;
  char *v3;
  id *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD traitCollection](self, "traitCollection"));
  v3 = (char *)objc_msgSend(v2, "userInterfaceStyle");
  v4 = (id *)&kCAFilterPlusL;
  if (v3 != (_BYTE *)&dword_0 + 2)
    v4 = (id *)&kCAFilterPlusD;
  v5 = *v4;

  return v5;
}

- (void)constructViews
{
  void *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *backgroundView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIImageView *v20;
  UIImageView *iconImageView;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  UIImageView *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  UILabel *v37;
  UILabel *textLabel;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  UITapGestureRecognizer *v54;
  UITapGestureRecognizer *tapGestureRecognizer;

  if (!self->_backgroundView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 7));
    v4 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v3);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    -[UIVisualEffectView setContentMode:](self->_backgroundView, "setContentMode:", 0);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_backgroundView, "layer"));
    objc_msgSend(v6, "setCornerRadius:", 8.0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_backgroundView, "layer"));
    objc_msgSend(v7, "setMasksToBounds:", 1);

    -[BKInfoHUD insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backgroundView, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerXAnchor](self->_backgroundView, "centerXAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD centerXAnchor](self, "centerXAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
    objc_msgSend(v10, "setActive:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerYAnchor](self->_backgroundView, "centerYAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD centerYAnchor](self, "centerYAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    objc_msgSend(v13, "setActive:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView widthAnchor](self->_backgroundView, "widthAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD widthAnchor](self, "widthAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    objc_msgSend(v16, "setActive:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](self->_backgroundView, "heightAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD heightAnchor](self, "heightAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    objc_msgSend(v19, "setActive:", 1);

  }
  if (!self->_iconImageView)
  {
    v20 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    iconImageView = self->_iconImageView;
    self->_iconImageView = v20;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
    -[UIImageView setTintColor:](self->_iconImageView, "setTintColor:", v22);

    v23 = AEBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Toggle page chooser"), &stru_1C3088, 0));
    -[UIImageView setAccessibilityLabel:](self->_iconImageView, "setAccessibilityLabel:", v25);

    v26 = self->_iconImageView;
    v27 = (unint64_t)-[UIImageView accessibilityTraits](v26, "accessibilityTraits");
    -[UIImageView setAccessibilityTraits:](v26, "setAccessibilityTraits:", UIAccessibilityTraitButton | v27);
    -[UIImageView setIsAccessibilityElement:](self->_iconImageView, "setIsAccessibilityElement:", 1);
    -[UIImageView setOpaque:](self->_iconImageView, "setOpaque:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD _compositingFilterToUse](self, "_compositingFilterToUse"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_iconImageView, "layer"));
    objc_msgSend(v30, "setCompositingFilter:", v29);

    -[BKInfoHUD addSubview:](self, "addSubview:", self->_iconImageView);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_iconImageView, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_backgroundView, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -12.0));
    objc_msgSend(v33, "setActive:", 1);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerYAnchor](self->_backgroundView, "centerYAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
    objc_msgSend(v36, "setActive:", 1);

  }
  if (!self->_textLabel)
  {
    v37 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    textLabel = self->_textLabel;
    self->_textLabel = v37;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BKInfoHUD updateLabelFont](self, "updateLabelFont");
    if (-[BKInfoHUD isInterfaceRTL](self, "isInterfaceRTL"))
      v39 = 0;
    else
      v39 = 2;
    -[UILabel setTextAlignment:](self->_textLabel, "setTextAlignment:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
    -[UILabel setTextColor:](self->_textLabel, "setTextColor:", v40);

    -[UILabel setOpaque:](self->_textLabel, "setOpaque:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD _compositingFilterToUse](self, "_compositingFilterToUse"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", v41));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_textLabel, "layer"));
    objc_msgSend(v43, "setCompositingFilter:", v42);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_textLabel, "setBackgroundColor:", v44);

    v45 = AEBundle();
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Page"), &stru_1C3088, 0));
    -[UILabel setAccessibilityLabel:](self->_textLabel, "setAccessibilityLabel:", v47);

    -[UILabel setLineBreakMode:](self->_textLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", 0);
    -[BKInfoHUD addSubview:](self, "addSubview:", self->_textLabel);
    -[BKInfoHUD _updateImageAndTextConstraints](self, "_updateImageAndTextConstraints");
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_textLabel, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_backgroundView, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v49));
    objc_msgSend(v50, "setActive:", 1);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_textLabel, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_backgroundView, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));
    objc_msgSend(v53, "setActive:", 1);

  }
  v54 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapGestureHandler:");
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v54;

  -[UITapGestureRecognizer setCancelsTouchesInView:](self->_tapGestureRecognizer, "setCancelsTouchesInView:", 1);
  -[BKInfoHUD addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
}

- (void)_updateImageAndTextConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_textLabel, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_backgroundView, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 12.0));
  objc_msgSend(v5, "setActive:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD textLabelTrailingAnchor](self, "textLabelTrailingAnchor"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_textLabel, "trailingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_iconImageView, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
    -[BKInfoHUD setTextLabelTrailingAnchor:](self, "setTextLabelTrailingAnchor:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD iconImageViewWidthAnchor](self, "iconImageViewWidthAnchor"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconImageView, 7, 0, 0, 0, 1.0, 0.0));
    -[BKInfoHUD setIconImageViewWidthAnchor:](self, "setIconImageViewWidthAnchor:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_iconImageView, "image"));
  if (v12)
    v13 = -5.0;
  else
    v13 = 0.0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD textLabelTrailingAnchor](self, "textLabelTrailingAnchor"));
  objc_msgSend(v14, "setConstant:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_iconImageView, "image"));
  objc_msgSend(v15, "size");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD iconImageViewWidthAnchor](self, "iconImageViewWidthAnchor"));
  objc_msgSend(v18, "setConstant:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD textLabelTrailingAnchor](self, "textLabelTrailingAnchor"));
  objc_msgSend(v19, "setActive:", 1);

  v20 = (id)objc_claimAutoreleasedReturnValue(-[BKInfoHUD iconImageViewWidthAnchor](self, "iconImageViewWidthAnchor"));
  objc_msgSend(v20, "setActive:", 1);

}

- (void)tapGestureHandler:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "infoHUDTapped:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKInfoHUD delegate](self, "delegate"));
    objc_msgSend(v6, "infoHUDTapped:", self);

  }
}

- (void)setUsesMonospacedDigitFont:(BOOL)a3
{
  if (self->_usesMonospacedDigitFont != a3)
  {
    self->_usesMonospacedDigitFont = a3;
    -[BKInfoHUD updateLabelFont](self, "updateLabelFont");
  }
}

- (BOOL)isInterfaceRTL
{
  return (char *)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[BKInfoHUD semanticContentAttribute](self, "semanticContentAttribute")) == (char *)&dword_0 + 1;
}

- (id)accessibilityLabel
{
  return -[UILabel accessibilityLabel](self->_textLabel, "accessibilityLabel");
}

- (id)accessibilityValue
{
  return -[UILabel accessibilityValue](self->_textLabel, "accessibilityValue");
}

- (id)accessibilityHint
{
  unsigned int v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = -[BKInfoHUD isUserInteractionEnabled](self, "isUserInteractionEnabled");
  v3 = AEBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
    v6 = CFSTR("Double tap to toggle page chooser");
  else
    v6 = CFSTR("Double tap to turn page");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1C3088, 0));

  return v7;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  char v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "infoHUDTapped:");
  if ((v4 & 1) != 0)
  {
    v5 = -[BKInfoHUD isUserInteractionEnabled](self, "isUserInteractionEnabled");

    if (!v5)
    {
      v4 = 0;
      return v4 & 1;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKInfoHUD delegate](self, "delegate"));
    objc_msgSend(v3, "infoHUDTapped:", self);
  }

  return v4 & 1;
}

- (BOOL)usesMonospacedDigitFont
{
  return self->_usesMonospacedDigitFont;
}

- (BKInfoHUDDelegate)delegate
{
  return (BKInfoHUDDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (NSLayoutConstraint)textLabelTrailingAnchor
{
  return self->_textLabelTrailingAnchor;
}

- (void)setTextLabelTrailingAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_textLabelTrailingAnchor, a3);
}

- (NSLayoutConstraint)iconImageViewWidthAnchor
{
  return self->_iconImageViewWidthAnchor;
}

- (void)setIconImageViewWidthAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageViewWidthAnchor, a3);
}

- (NSString)currentSymbolName
{
  return self->_currentSymbolName;
}

- (void)setCurrentSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSymbolName, 0);
  objc_storeStrong((id *)&self->_iconImageViewWidthAnchor, 0);
  objc_storeStrong((id *)&self->_textLabelTrailingAnchor, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
