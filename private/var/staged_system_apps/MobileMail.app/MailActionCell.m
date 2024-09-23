@implementation MailActionCell

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MailActionCellIdentifier");
}

- (MailActionCell)initWithFrame:(CGRect)a3
{
  MailActionCell *v3;
  MailActionCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MFMessageDisplayMetrics *v10;
  MFMessageDisplayMetrics *displayMetrics;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)MailActionCell;
  v3 = -[MailActionCell initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MailActionCell setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell contentView](v4, "contentView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
    objc_msgSend(v7, "setCornerRadius:", 10.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    objc_msgSend(v9, "setCornerCurve:", kCACornerCurveContinuous);

    v10 = objc_opt_new(MFMessageDisplayMetrics);
    displayMetrics = v4->_displayMetrics;
    v4->_displayMetrics = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 18));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect _effectForBlurEffect:vibrancyStyle:](UIVibrancyEffect, "_effectForBlurEffect:vibrancyStyle:", v12, 112));
    v14 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v13);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentView"));
    objc_msgSend(v16, "setBackgroundColor:", v15);

    objc_msgSend(v14, "setClipsToBounds:", 1);
    -[MailActionCell setVisualEffectView:](v4, "setVisualEffectView:", v14);
    objc_msgSend(v5, "addSubview:", v14);
    objc_msgSend(v14, "mf_pinToView:usingLayoutMargins:", v5, 0);
    v17 = objc_alloc_init((Class)UIView);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "setClipsToBounds:", 1);
    -[MailActionCell setFillView:](v4, "setFillView:", v17);
    -[MailActionCell _updateFillView](v4, "_updateFillView");
    objc_msgSend(v5, "addSubview:", v17);
    objc_msgSend(v17, "mf_pinToView:usingLayoutMargins:", v5, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](v4, "titleLabel"));
    -[MailActionCell _updateTitleLabelTextColor](v4, "_updateTitleLabelTextColor");
    if (v18)
      objc_msgSend(v5, "addSubview:", v18);
    v19 = objc_alloc_init((Class)UIImageView);
    objc_msgSend(v19, "setContentMode:", 4);
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v19, "setContentMode:", 4);
    -[MailActionCell setImageView:](v4, "setImageView:", v19);
    objc_msgSend(v5, "addSubview:", v19);
    -[MailActionCell _updateImageViewSymbolConfiguration](v4, "_updateImageViewSymbolConfiguration");
    -[MailActionCell configureConstraints](v4, "configureConstraints");

  }
  return v4;
}

- (void)configureConstraints
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = (id)objc_claimAutoreleasedReturnValue(-[MailActionCell contentView](self, "contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layoutMarginsGuide"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, 8.0));
    objc_msgSend(v3, "addObject:", v9);

  }
  -[MailActionCell _updateDynamicConstraints](self, "_updateDynamicConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell dynamicConstraints](self, "dynamicConstraints"));
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell imageView](self, "imageView"));
  v12 = v11;
  if (v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:constant:", v14, 16.0));
    objc_msgSend(v3, "addObject:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -28.0));
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerYAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  objc_msgSend(v3, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "widthAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 40.0));
  objc_msgSend(v3, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "heightAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToConstant:", 40.0));
  objc_msgSend(v3, "addObject:", v25);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);
}

- (void)setCardAction:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((-[MFCardAction isEqual:](self->_cardAction, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)&self->_cardAction, a3);
  if (-[MailActionCell isHorizontalActionCell](self, "isHorizontalActionCell"))
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shortTitle"));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell _temporaryTrimmingTitle:](self, "_temporaryTrimmingTitle:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v9, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell imageView](self, "imageView"));
  objc_msgSend(v11, "setImage:", v10);

  -[MailActionCell _updateImageViewTintColor](self, "_updateImageViewTintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessibilityIdentifer"));
  -[MailActionCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v12);

}

- (id)_temporaryTrimmingTitle:(id)a3
{
  __CFString *v3;
  const __CFString *v4;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ef_stringByTrimmingWhitespaceAndNewlineCharacters"));
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("Notify Me…")) & 1) != 0)
  {
    v4 = CFSTR("Notify Me of Replies");
LABEL_5:

    v3 = (__CFString *)v4;
    return v3;
  }
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("Move Message…")))
  {
    v4 = CFSTR("Move Message");
    goto LABEL_5;
  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailActionCell;
  -[MailActionCell prepareForReuse](&v9, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "setText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v5, "setContents:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell imageView](self, "imageView"));
  objc_msgSend(v6, "setImage:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell imageView](self, "imageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v8, "setContents:", 0);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  if (-[MailActionCell isHighlighted](self, "isHighlighted") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contents"));

    v10.receiver = self;
    v10.super_class = (Class)MailActionCell;
    -[MailActionCell setHighlighted:](&v10, "setHighlighted:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    objc_msgSend(v9, "setContents:", v7);

    -[MailActionCell _updateFillView](self, "_updateFillView");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  if (-[MailActionCell isSelected](self, "isSelected") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contents"));

    v10.receiver = self;
    v10.super_class = (Class)MailActionCell;
    -[MailActionCell setSelected:](&v10, "setSelected:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    objc_msgSend(v9, "setContents:", v7);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  int IsAccessibilityCategory;
  void *v8;
  NSString *v9;
  int v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MailActionCell;
  -[MailActionCell traitCollectionDidChange:](&v13, "traitCollectionDidChange:", v4);
  -[MailActionCell _updateFillView](self, "_updateFillView");
  -[MailActionCell _updateImageViewTintColor](self, "_updateImageViewTintColor");
  -[MailActionCell _updateImageViewSymbolConfiguration](self, "_updateImageViewSymbolConfiguration");
  -[MailActionCell _updateTitleLabelTextColor](self, "_updateTitleLabelTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell dynamicConstraints](self, "dynamicConstraints"));

  if (v5)
  {
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell traitCollection](self, "traitCollection"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferredContentSizeCategory"));
    v10 = UIContentSizeCategoryIsAccessibilityCategory(v9);

    if (IsAccessibilityCategory != v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell dynamicConstraints](self, "dynamicConstraints"));
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v11);

      -[MailActionCell _updateDynamicConstraints](self, "_updateDynamicConstraints");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell dynamicConstraints](self, "dynamicConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

    }
  }

}

- (BOOL)isHorizontalActionCell
{
  return 0;
}

- (void)_updateDynamicConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
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
  id v18;

  v18 = (id)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
  if (v18)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell contentView](self, "contentView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell traitCollection](self, "traitCollection"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

    if (IsAccessibilityCategory)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 15.0));
      objc_msgSend(v3, "addObject:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 15.0));
      objc_msgSend(v3, "addObject:", v13);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell displayMetrics](self, "displayMetrics"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstBaselineAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
      objc_msgSend(v11, "topToFirstBaselineSpacingInMailActionCardVerticalGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15));
      objc_msgSend(v3, "addObject:", v16);

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastBaselineAnchor"));
      objc_msgSend(v11, "bottomToLastBaselineInMailActionCardVerticalGroup");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13));
      objc_msgSend(v3, "addObject:", v17);

    }
    -[MailActionCell setDynamicConstraints:](self, "setDynamicConstraints:", v3);

  }
}

+ (id)preferredFontForHorizontalTitle
{
  return +[_MailActionCellTitleLabel preferredFontForHorizontalTitle](_MailActionCellTitleLabel, "preferredFontForHorizontalTitle");
}

+ (double)approximateHeightForAccessibilityContentSizeCategory
{
  void *v4;
  NSString *v5;
  BOOL IsAccessibilityCategory;
  void *v7;
  double v8;
  double v9;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (!IsAccessibilityCategory)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MailActionCell.m"), 244, CFSTR("Unexpectedly attempted to calculate approximate height for non-accessibility text sizes"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_MailActionCellTitleLabel preferredFontForDefaultTitle](_MailActionCellTitleLabel, "preferredFontForDefaultTitle"));
  objc_msgSend(v7, "lineHeight");
  v9 = v8 + 30.0;

  return v9;
}

- (void)setUseActionSheetStyle:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_useActionSheetStyle != a3)
  {
    v3 = a3;
    self->_useActionSheetStyle = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
    objc_msgSend(v4, "setUseActionSheetStyle:", v3);

  }
}

- (_MailActionCellTitleLabel)titleLabel
{
  _MailActionCellTitleLabel *titleLabel;
  _MailActionCellTitleLabel *v4;
  void *v5;
  _MailActionCellTitleLabel *v6;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = objc_alloc_init(_MailActionCellTitleLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[_MailActionCellTitleLabel setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[_MailActionCellTitleLabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MailActionCellTitleLabel setLineBreakMode:](v4, "setLineBreakMode:", 0);
    -[_MailActionCellTitleLabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
    -[_MailActionCellTitleLabel setIsHorizontalTitle:](v4, "setIsHorizontalTitle:", -[MailActionCell isHorizontalActionCell](self, "isHorizontalActionCell"));
    v6 = self->_titleLabel;
    self->_titleLabel = v4;

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (void)_updateTitleLabelTextColor
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MailActionCell traitCollection](self, "traitCollection"));
  if (objc_msgSend(v6, "userInterfaceStyle") == (id)2)
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)_updateImageViewSymbolConfiguration
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MailActionCell imageView](self, "imageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_symbolConfigurationForView:](UIImage, "mf_symbolConfigurationForView:", 18));
  objc_msgSend(v3, "setPreferredSymbolConfiguration:", v2);

}

- (void)_updateImageViewTintColor
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell cardAction](self, "cardAction"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tintColor"));

  if (v8)
  {
    v4 = 0;
    v5 = v8;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell traitCollection](self, "traitCollection"));
    if (objc_msgSend(v3, "userInterfaceStyle") == (id)1)
    {
      v4 = 0;
      v5 = 0;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      v4 = 1;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell imageView](self, "imageView"));
  objc_msgSend(v6, "setTintColor:", v5);

  if (v4)
  v7 = v8;
  if (!v8)
  {

    v7 = 0;
  }

}

- (void)_updateFillView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[MailActionCell fillView](self, "fillView"));
  if (-[MailActionCell isHighlighted](self, "isHighlighted"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellDefaultSelectionTintColor](UIColor, "tableCellDefaultSelectionTintColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:", 0.6));
    objc_msgSend(v9, "setBackgroundColor:", v4);

    objc_msgSend(v9, "setAlpha:", 1.0);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v9, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionCell traitCollection](self, "traitCollection"));
    v7 = objc_msgSend(v6, "userInterfaceStyle");
    v8 = 0.27;
    if (v7 != (id)2)
      v8 = 0.0;
    objc_msgSend(v9, "setAlpha:", v8);

  }
}

- (MFCardAction)cardAction
{
  return self->_cardAction;
}

- (BOOL)useActionSheetStyle
{
  return self->_useActionSheetStyle;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (UIView)fillView
{
  return self->_fillView;
}

- (void)setFillView:(id)a3
{
  objc_storeStrong((id *)&self->_fillView, a3);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicConstraints, a3);
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void)setDisplayMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_displayMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_fillView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_cardAction, 0);
}

@end
