@implementation MapViewModeGridButtonView

- (MapViewModeGridButtonView)initWithFrame:(CGRect)a3
{
  MapViewModeGridButtonView *v3;
  MapViewModeGridButtonView *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIButton *primaryButton;
  UIVisualEffectView *v9;
  UIVisualEffectView *titleBlurView;
  id v11;
  double y;
  double width;
  double height;
  UIStackView *v15;
  UIStackView *titleStackView;
  void *v17;
  UILabel *v18;
  UILabel *titleLabel;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_super v64;
  _QWORD v65[12];

  v64.receiver = self;
  v64.super_class = (Class)MapViewModeGridButtonView;
  v3 = -[MapViewModeGridButtonView initWithFrame:](&v64, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView layer](v3, "layer"));
    objc_msgSend(v5, "setCornerRadius:", 10.0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView layer](v4, "layer"));
    objc_msgSend(v6, "setMasksToBounds:", 1);

    v7 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    primaryButton = v4->_primaryButton;
    v4->_primaryButton = (UIButton *)v7;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_primaryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v4->_primaryButton, "addTarget:action:forControlEvents:", v4, "_primaryButtonTapped:", 0x2000);
    -[MapViewModeGridButtonView addSubview:](v4, "addSubview:", v4->_primaryButton);
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 8));
    v9 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v63);
    titleBlurView = v4->_titleBlurView;
    v4->_titleBlurView = v9;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleBlurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView setAccessibilityIdentifier:](v4->_titleBlurView, "setAccessibilityIdentifier:", CFSTR("TitleBlurView"));
    -[MapViewModeGridButtonView addSubview:](v4, "addSubview:", v4->_titleBlurView);
    v11 = objc_alloc((Class)UIStackView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v15 = (UIStackView *)objc_msgSend(v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleStackView = v4->_titleStackView;
    v4->_titleStackView = v15;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v4->_titleStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v4->_titleStackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v4->_titleStackView, "setAlignment:", 2);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v4->_titleStackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView setDirectionalLayoutMargins:](v4->_titleStackView, "setDirectionalLayoutMargins:", 10.0, 12.0, 10.0, 12.0);
    -[UIStackView setSpacing:](v4->_titleStackView, "setSpacing:", 8.0);
    -[UIStackView setAccessibilityIdentifier:](v4->_titleStackView, "setAccessibilityIdentifier:", CFSTR("TitleStackView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4->_titleBlurView, "contentView"));
    objc_msgSend(v17, "addSubview:", v4->_titleStackView);

    v18 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v20);

    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setMinimumScaleFactor:](v4->_titleLabel, "setMinimumScaleFactor:", 0.5);
    -[UILabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[UIStackView addArrangedSubview:](v4->_titleStackView, "addArrangedSubview:", v4->_titleLabel);
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v4->_primaryButton, "topAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView topAnchor](v4, "topAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
    v65[0] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v4->_primaryButton, "leadingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView leadingAnchor](v4, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
    v65[1] = v57;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v4->_primaryButton, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView trailingAnchor](v4, "trailingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
    v65[2] = v54;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v4->_primaryButton, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView bottomAnchor](v4, "bottomAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
    v65[3] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v4->_titleBlurView, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView topAnchor](v4, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:", v49));
    v65[4] = v48;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](v4->_titleBlurView, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView leadingAnchor](v4, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
    v65[5] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](v4->_titleBlurView, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView trailingAnchor](v4, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
    v65[6] = v42;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v4->_titleBlurView, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView bottomAnchor](v4, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v65[7] = v39;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v4->_titleStackView, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4->_titleBlurView, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    v65[8] = v35;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v4->_titleStackView, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4->_titleBlurView, "contentView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
    v65[9] = v31;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v4->_titleStackView, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4->_titleBlurView, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
    v65[10] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v4->_titleStackView, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v4->_titleBlurView, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v27));
    v65[11] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 12));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

    -[MapViewModeGridButtonView _updateFonts](v4, "_updateFonts");
    -[MapViewModeGridButtonView _updateBorder](v4, "_updateBorder");

  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  UIButton *v6;
  UIButton *v7;
  UIButton *primaryButton;
  UIButton *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MapViewModeGridButtonView;
  v5 = -[MapViewModeGridButtonView hitTest:withEvent:](&v11, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (UIButton *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  primaryButton = v6;
  if (v6 != self->_overflowButton)
  {
    if (!v6)
    {
      v9 = 0;
      goto LABEL_6;
    }
    primaryButton = self->_primaryButton;
  }
  v9 = primaryButton;
LABEL_6:

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapViewModeGridButtonView;
  -[MapViewModeGridButtonView traitCollectionDidChange:](&v16, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v8 = sub_1002A8950(v6, v7);

  if (v8)
    -[MapViewModeGridButtonView _updateFonts](self, "_updateFonts");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView traitCollection](self, "traitCollection"));
  objc_msgSend(v9, "displayScale");
  v11 = v10;
  objc_msgSend(v4, "displayScale");
  if (v11 == v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView traitCollection](self, "traitCollection"));
    v14 = objc_msgSend(v13, "userInterfaceStyle");
    v15 = objc_msgSend(v4, "userInterfaceStyle");

    if (v14 == v15)
      goto LABEL_8;
  }
  else
  {

  }
  -[MapViewModeGridButtonView _updateBorder](self, "_updateBorder");
LABEL_8:

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapViewModeGridButtonView;
  -[MapViewModeGridButtonView layoutSubviews](&v3, "layoutSubviews");
  -[MapViewModeGridButtonView _updateImage](self, "_updateImage");
}

+ (id)_maximumContentSizeCategory
{
  return UIContentSizeCategoryAccessibilityExtraLarge;
}

- (void)setViewModel:(id)a3
{
  MapViewModeGridButtonViewModel *v5;
  MapViewModeGridButtonViewModel *v6;
  unsigned __int8 v7;
  MapViewModeGridButtonViewModel *v8;

  v5 = (MapViewModeGridButtonViewModel *)a3;
  v6 = v5;
  if (self->_viewModel != v5)
  {
    v8 = v5;
    v7 = -[MapViewModeGridButtonViewModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModel, a3);
      -[MapViewModeGridButtonView _updateFromModel](self, "_updateFromModel");
      v6 = v8;
    }
  }

}

- (void)_updateFromModel
{
  float v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *overflowButton;
  UIButton *v13;
  UIButton *v14;
  void *v15;
  double v16;
  UIButton *v17;
  void *v18;
  UIButton *v19;
  void *v20;

  if (-[MapViewModeGridButtonViewModel enabled](self->_viewModel, "enabled"))
    v3 = 1.0;
  else
    v3 = 0.4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_primaryButton, "layer"));
  *(float *)&v5 = v3;
  objc_msgSend(v4, "setOpacity:", v5);

  -[UIButton setEnabled:](self->_primaryButton, "setEnabled:", -[MapViewModeGridButtonViewModel enabled](self->_viewModel, "enabled"));
  -[UIButton setSelected:](self->_primaryButton, "setSelected:", -[MapViewModeGridButtonViewModel selected](self->_viewModel, "selected"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_titleLabel, "layer"));
  *(float *)&v7 = v3;
  objc_msgSend(v6, "setOpacity:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel title](self->_viewModel, "title"));
  -[UILabel setText:](self->_titleLabel, "setText:", v8);

  -[MapViewModeGridButtonView _updateImage](self, "_updateImage");
  -[MapViewModeGridButtonView _updateBorder](self, "_updateBorder");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel axIdentifierForView](self->_viewModel, "axIdentifierForView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("Button")));
  -[MapViewModeGridButtonView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel overflowMenu](self->_viewModel, "overflowMenu"));
  overflowButton = self->_overflowButton;
  if (v11)
  {
    if (!overflowButton)
    {
      v13 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      v14 = self->_overflowButton;
      self->_overflowButton = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[UIButton setTintColor:](self->_overflowButton, "setTintColor:", v15);

      -[UIButton _setTouchInsets:](self->_overflowButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
      -[UIButton setShowsMenuAsPrimaryAction:](self->_overflowButton, "setShowsMenuAsPrimaryAction:", 1);
      LODWORD(v16) = 1144750080;
      -[UIButton setContentHuggingPriority:forAxis:](self->_overflowButton, "setContentHuggingPriority:forAxis:", 0, v16);
      v17 = self->_overflowButton;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("ellipsis.circle.fill")));
      -[UIButton setImage:forState:](v17, "setImage:forState:", v18, 0);

      -[UIButton setAccessibilityIdentifier:](self->_overflowButton, "setAccessibilityIdentifier:", CFSTR("OverflowButton"));
      -[UIStackView addArrangedSubview:](self->_titleStackView, "addArrangedSubview:", self->_overflowButton);
      -[MapViewModeGridButtonView _updateFonts](self, "_updateFonts");
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel overflowMenu](self->_viewModel, "overflowMenu"));
    -[UIButton setMenu:](self->_overflowButton, "setMenu:", v20);

  }
  else if (overflowButton)
  {
    -[UIButton removeFromSuperview](overflowButton, "removeFromSuperview");
    v19 = self->_overflowButton;
    self->_overflowButton = 0;

  }
}

- (void)_updateImage
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;

  v29 = (id)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel image](self->_viewModel, "image"));
  v3 = objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel wideImage](self->_viewModel, "wideImage"));
  if (!v3)
    goto LABEL_14;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel image](self->_viewModel, "image"));
  objc_msgSend(v5, "size");
  if (v6 == 0.0)
  {
LABEL_12:

    goto LABEL_13;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel wideImage](self->_viewModel, "wideImage"));
  objc_msgSend(v7, "size");
  if (v8 == 0.0)
  {

    goto LABEL_12;
  }
  -[UIButton bounds](self->_primaryButton, "bounds");
  v10 = v9;

  if (v10 != 0.0)
  {
    -[UIButton bounds](self->_primaryButton, "bounds");
    v12 = v11;
    -[UIButton bounds](self->_primaryButton, "bounds");
    v14 = v12 / v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel image](self->_viewModel, "image"));
    objc_msgSend(v15, "size");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel image](self->_viewModel, "image"));
    objc_msgSend(v18, "size");
    v20 = v17 / v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel wideImage](self->_viewModel, "wideImage"));
    objc_msgSend(v21, "size");
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel wideImage](self->_viewModel, "wideImage"));
    objc_msgSend(v24, "size");
    v26 = v23 / v25;

    v27 = v26 - v14;
    if (v26 - v14 < 0.0)
      v27 = -(v26 - v14);
    v28 = v20 - v14;
    if (v20 - v14 < 0.0)
      v28 = -(v20 - v14);
    if (v27 < v28)
    {
      v4 = v29;
      v29 = (id)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel wideImage](self->_viewModel, "wideImage"));
LABEL_13:

    }
  }
LABEL_14:
  -[UIButton setBackgroundImage:forState:](self->_primaryButton, "setBackgroundImage:forState:", v29, 0);

}

- (void)_updateFonts
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend((id)objc_opt_class(self), "_maximumContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", UIContentSizeCategoryLarge, v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15CompatibleWithTraitCollection:](UIFont, "system15CompatibleWithTraitCollection:", v9));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17CompatibleWithTraitCollection:](UIFont, "system17CompatibleWithTraitCollection:", v9));
  objc_msgSend(v7, "pointSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:"));
  -[UIButton setPreferredSymbolConfiguration:forImageInState:](self->_overflowButton, "setPreferredSymbolConfiguration:forImageInState:", v8, 0);

}

- (void)_updateBorder
{
  void *v3;
  id v4;
  id v5;
  MapViewModeGridButtonView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  if (-[MapViewModeGridButtonViewModel selected](self->_viewModel, "selected"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView layer](self, "layer"));
    objc_msgSend(v3, "setBorderWidth:", 2.0);

    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor")));
    v4 = objc_msgSend(v18, "CGColor");
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView layer](self, "layer"));
    objc_msgSend(v5, "setBorderColor:", v4);
  }
  else
  {
    v6 = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView window](v6, "window"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screen"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView window](v6, "window"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "screen"));
      objc_msgSend(v10, "nativeScale");
      v12 = v11;

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v9, "nativeScale");
      v12 = v13;
    }

    if (v12 <= 0.0)
      v14 = 1.0;
    else
      v14 = 1.0 / v12;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView layer](v6, "layer"));
    objc_msgSend(v15, "setBorderWidth:", v14);

    v18 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "colorWithAlphaComponent:", 0.05)));
    v16 = objc_msgSend(v5, "CGColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonView layer](v6, "layer"));
    objc_msgSend(v17, "setBorderColor:", v16);

  }
}

- (void)_primaryButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MapViewModeGridButtonViewModel delegate](self->_viewModel, "delegate", a3));
  objc_msgSend(v4, "mapViewModeButtonViewTapped:", self);

}

- (MapViewModeGridButtonViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_overflowButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_titleBlurView, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
}

@end
