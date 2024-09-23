@implementation FocusBannerView

- (FocusBannerView)initWithDelegate:(id)a3
{
  FocusBannerView *v4;
  FocusBannerView *v5;
  UIView *v6;
  UIView *topSeparatorView;
  void *v8;
  id v9;
  void *v10;
  UIImageView *v11;
  UIImageView *focusIconView;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  UILabel *v18;
  UILabel *focusFilterStateDescriptionLabel;
  void *v20;
  void *v21;
  uint64_t v22;
  UIButton *focusFilterToggleButton;
  double v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  UIStackView *v29;
  UIStackView *stackView;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  id obj;
  _QWORD v63[4];
  id v64;
  id location;
  objc_super v66;
  _QWORD v67[8];
  _QWORD v68[3];

  obj = a3;
  v66.receiver = self;
  v66.super_class = (Class)FocusBannerView;
  v4 = -[FocusBannerView initWithFrame:](&v66, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_delegate, obj);
    v5->_focusFilterEnabled = 1;
    v6 = (UIView *)objc_alloc_init((Class)UIView);
    topSeparatorView = v5->_topSeparatorView;
    v5->_topSeparatorView = v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_topSeparatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[UIView setBackgroundColor:](v5->_topSeparatorView, "setBackgroundColor:", v8);

    v9 = objc_alloc((Class)UIImageView);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphFocusCircle));
    v11 = (UIImageView *)objc_msgSend(v9, "initWithImage:", v10);
    focusIconView = v5->_focusIconView;
    v5->_focusIconView = v11;

    -[UIImageView setContentMode:](v5->_focusIconView, "setContentMode:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v13));
    -[UIImageView setPreferredSymbolConfiguration:](v5->_focusIconView, "setPreferredSymbolConfiguration:", v14);

    LODWORD(v15) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_focusIconView, "setContentCompressionResistancePriority:forAxis:", 0, v15);
    LODWORD(v16) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_focusIconView, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    LODWORD(v17) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v5->_focusIconView, "setContentHuggingPriority:forAxis:", 0, v17);
    v18 = (UILabel *)objc_alloc_init((Class)UILabel);
    focusFilterStateDescriptionLabel = v5->_focusFilterStateDescriptionLabel;
    v5->_focusFilterStateDescriptionLabel = v18;

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_focusFilterStateDescriptionLabel, "setAdjustsFontForContentSizeCategory:", 1);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView _focusButtonConfiguration](v5, "_focusButtonConfiguration"));
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1000A4988;
    v63[3] = &unk_10051D178;
    objc_copyWeak(&v64, &location);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v63));
    v22 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v20, v21));
    focusFilterToggleButton = v5->_focusFilterToggleButton;
    v5->_focusFilterToggleButton = (UIButton *)v22;

    LODWORD(v24) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v5->_focusFilterToggleButton, "setContentCompressionResistancePriority:forAxis:", 0, v24);
    LODWORD(v25) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v5->_focusFilterToggleButton, "setContentHuggingPriority:forAxis:", 0, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v5->_focusFilterToggleButton, "titleLabel"));
    objc_msgSend(v26, "setNumberOfLines:", 1);

    v27 = objc_alloc((Class)UIStackView);
    v68[0] = v5->_focusIconView;
    v68[1] = v5->_focusFilterStateDescriptionLabel;
    v68[2] = v5->_focusFilterToggleButton;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 3));
    v29 = (UIStackView *)objc_msgSend(v27, "initWithArrangedSubviews:", v28);
    stackView = v5->_stackView;
    v5->_stackView = v29;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v5->_stackView, "setSpacing:", 5.0);
    -[UIStackView setAlignment:](v5->_stackView, "setAlignment:", 3);
    -[FocusBannerView addSubview:](v5, "addSubview:", v5->_topSeparatorView);
    -[FocusBannerView addSubview:](v5, "addSubview:", v5->_stackView);
    -[FocusBannerView _updateTitleAndImage](v5, "_updateTitleAndImage");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v31, "scale");
    v33 = v32;

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v5->_topSeparatorView, "heightAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:", 1.0 / v33));
    v67[0] = v47;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5->_topSeparatorView, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView topAnchor](v5, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:"));
    v67[1] = v46;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5->_topSeparatorView, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView focusFilterStateDescriptionLabel](v5, "focusFilterStateDescriptionLabel"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:"));
    v67[2] = v53;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5->_topSeparatorView, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView trailingAnchor](v5, "trailingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:"));
    v67[3] = v52;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v5->_stackView, "leadingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView layoutMarginsGuide](v5, "layoutMarginsGuide"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:"));
    v67[4] = v50;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v5->_stackView, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView layoutMarginsGuide](v5, "layoutMarginsGuide"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:"));
    v67[5] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v5->_stackView, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView topAnchor](v5, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, 11.0));
    v67[6] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v5->_stackView, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView bottomAnchor](v5, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, -11.0));
    v67[7] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

    objc_destroyWeak(&v64);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)setFocusFilterEnabled:(BOOL)a3
{
  if (self->_focusFilterEnabled != a3)
  {
    self->_focusFilterEnabled = a3;
    -[FocusBannerView _updateTitleAndImage](self, "_updateTitleAndImage");
  }
}

- (void)_updateTitleAndImage
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  if (-[FocusBannerView isFocusFilterEnabled](self, "isFocusFilterEnabled"))
  {
    v3 = _EFLocalizedString(CFSTR("Filtered by Focus"), &unk_10059D2A0, &unk_10059D2A8);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor mailFocusBannerTitleColor](UIColor, "mailFocusBannerTitleColor"));
  }
  else
  {
    v6 = _EFLocalizedString(CFSTR("Focus Filter Off"), &unk_10059D2A0, &unk_10059D2A8);
    v4 = objc_claimAutoreleasedReturnValue(v6);
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  }
  v7 = (void *)v5;
  v18 = (id)v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView focusFilterStateDescriptionLabel](self, "focusFilterStateDescriptionLabel"));
  objc_msgSend(v8, "setText:", v18);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView focusFilterStateDescriptionLabel](self, "focusFilterStateDescriptionLabel"));
  objc_msgSend(v10, "setFont:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView focusFilterStateDescriptionLabel](self, "focusFilterStateDescriptionLabel"));
  objc_msgSend(v11, "setTextColor:", v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView focusFilterStateDescriptionLabel](self, "focusFilterStateDescriptionLabel"));
  objc_msgSend(v12, "setLargeContentTitle:", v18);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView _focusButtonConfiguration](self, "_focusButtonConfiguration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView focusFilterToggleButton](self, "focusFilterToggleButton"));
  objc_msgSend(v14, "setConfiguration:", v13);

  if (-[FocusBannerView isFocusFilterEnabled](self, "isFocusFilterEnabled"))
    v15 = objc_claimAutoreleasedReturnValue(+[UIColor systemIndigoColor](UIColor, "systemIndigoColor"));
  else
    v15 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v16 = (void *)v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView focusIconView](self, "focusIconView"));
  objc_msgSend(v17, "setTintColor:", v16);

}

- (void)_focusFilterToggleButtonSelected
{
  id v3;

  -[FocusBannerView setFocusFilterEnabled:](self, "setFocusFilterEnabled:", -[FocusBannerView isFocusFilterEnabled](self, "isFocusFilterEnabled") ^ 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[FocusBannerView delegate](self, "delegate"));
  objc_msgSend(v3, "focusBannerView:stateDidChange:", self, -[FocusBannerView isFocusFilterEnabled](self, "isFocusFilterEnabled"));

}

- (double)preferredHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView focusFilterStateDescriptionLabel](self, "focusFilterStateDescriptionLabel"));
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3 + 11.0 + 11.0;

  return v4;
}

- (id)_focusButtonConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSAttributedStringKey v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FocusBannerView focusFilterToggleButton](self, "focusFilterToggleButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  v7 = v6;

  if (-[FocusBannerView isFocusFilterEnabled](self, "isFocusFilterEnabled"))
    v8 = CFSTR("Turn Off");
  else
    v8 = CFSTR("Turn On");
  v9 = _EFLocalizedString(v8, &unk_10059D2A0, &unk_10059D2A8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailFocusBannerTitleColor](UIColor, "mailFocusBannerTitleColor"));
  objc_msgSend(v7, "setBaseForegroundColor:", v11);

  v12 = objc_alloc((Class)NSAttributedString);
  v17 = NSFontAttributeName;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleSubheadline, UIFontWeightMedium));
  v18 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v15 = objc_msgSend(v12, "initWithString:attributes:", v10, v14);
  objc_msgSend(v7, "setAttributedTitle:", v15);

  objc_msgSend(v7, "setTitleLineBreakMode:", 4);
  objc_msgSend(v7, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);

  return v7;
}

- (FocusBannerViewDelegate)delegate
{
  return (FocusBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isFocusFilterEnabled
{
  return self->_focusFilterEnabled;
}

- (UIImageView)focusIconView
{
  return self->_focusIconView;
}

- (void)setFocusIconView:(id)a3
{
  objc_storeStrong((id *)&self->_focusIconView, a3);
}

- (UILabel)focusFilterStateDescriptionLabel
{
  return self->_focusFilterStateDescriptionLabel;
}

- (void)setFocusFilterStateDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_focusFilterStateDescriptionLabel, a3);
}

- (UIButton)focusFilterToggleButton
{
  return self->_focusFilterToggleButton;
}

- (void)setFocusFilterToggleButton:(id)a3
{
  objc_storeStrong((id *)&self->_focusFilterToggleButton, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void)setTopSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_topSeparatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_focusFilterToggleButton, 0);
  objc_storeStrong((id *)&self->_focusFilterStateDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_focusIconView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
