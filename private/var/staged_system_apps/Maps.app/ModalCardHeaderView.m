@implementation ModalCardHeaderView

- (ModalCardHeaderView)initWithFrame:(CGRect)a3
{
  void *v4;
  ModalCardHeaderView *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  v5 = -[ModalCardHeaderView initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (ModalCardHeaderView)initWithCoder:(id)a3
{
  void *v4;
  ModalCardHeaderView *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "defaultModalCardHeaderConfiguration", a3));
  v5 = -[ModalCardHeaderView initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (ModalCardHeaderView)initWithConfiguration:(id)a3
{
  id v5;
  ModalCardHeaderView *v6;
  ModalCardHeaderView *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ModalCardHeaderView;
  v6 = -[ModalCardHeaderView initWithFrame:](&v12, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[ModalCardHeaderView _customInit](v7, "_customInit");
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[ModalCardHeaderView setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v10);

  }
  return v7;
}

- (void)_setMask:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "capInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[ModalCardHeaderView _setCornerRadius:](self, "_setCornerRadius:");
  -[ModalCardHeaderView setClipsToBounds:](self, "setClipsToBounds:", 1);
  v19 = (id)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView layer](self, "layer"));
  v17 = objc_retainAutorelease(v4);
  v18 = objc_msgSend(v17, "CGImage");

  objc_msgSend(v19, "setCornerContents:", v18);
  objc_msgSend(v19, "setCornerContentsCenter:", v12 / v6, v10 / v8, (v6 - v12 - v16) / v6, (v8 - v10 - v14) / v8);

}

+ (id)createModalBarButtonItem
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != (id)5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", v3));
  objc_msgSend(v4, "setPointerInteractionEnabled:", 1);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (MKApplicationLayoutDirectionIsRightToLeft(objc_msgSend(v4, "setTitleColorProvider:", &stru_1011BE7C0)))
    v5 = 2;
  else
    v5 = 1;
  objc_msgSend(v4, "setContentHorizontalAlignment:", v5);
  return v4;
}

- (void)_customInit
{
  void *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  MapsThemeButton *v7;
  MapsThemeButton *leadingButton;
  MapsThemeButton *v9;
  MapsThemeButton *trailingButton;
  unsigned __int8 v11;
  id v12;
  MapsThemeButton *v13;
  void *v14;
  UIStackView *v15;
  UILabel *v16;
  UIStackView *stackView;
  double v18;
  double v19;
  double v20;
  HairlineView *v21;
  HairlineView *bottomHairline;
  _QWORD v23[2];
  _QWORD v24[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[ModalCardHeaderView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
  if (!-[ModalCardHeaderConfiguration leadingAlignedTitle](self->_configuration, "leadingAlignedTitle"))
  {
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    v7 = (MapsThemeButton *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderView createModalBarButtonItem](ModalCardHeaderView, "createModalBarButtonItem"));
    leadingButton = self->_leadingButton;
    self->_leadingButton = v7;

    -[MapsThemeButton setAccessibilityIdentifier:](self->_leadingButton, "setAccessibilityIdentifier:", CFSTR("LeadingButton"));
  }
  v9 = (MapsThemeButton *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderView createModalBarButtonItem](ModalCardHeaderView, "createModalBarButtonItem"));
  trailingButton = self->_trailingButton;
  self->_trailingButton = v9;

  -[MapsThemeButton _setTouchInsets:](self->_trailingButton, "_setTouchInsets:", -15.0, -15.0, -15.0, -15.0);
  -[MapsThemeButton setAccessibilityIdentifier:](self->_trailingButton, "setAccessibilityIdentifier:", CFSTR("TrailingButton"));
  v11 = -[ModalCardHeaderConfiguration leadingAlignedTitle](self->_configuration, "leadingAlignedTitle");
  v12 = objc_alloc((Class)UIStackView);
  if ((v11 & 1) != 0)
  {
    v13 = self->_trailingButton;
    v23[0] = self->_titleLabel;
    v23[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
    v15 = (UIStackView *)objc_msgSend(v12, "initWithArrangedSubviews:", v14);
  }
  else
  {
    v16 = self->_titleLabel;
    v24[0] = self->_leadingButton;
    v24[1] = v16;
    v24[2] = self->_trailingButton;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 3));
    v15 = (UIStackView *)objc_msgSend(v12, "initWithArrangedSubviews:", v14);
  }
  stackView = self->_stackView;
  self->_stackView = v15;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 0);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 15.0);
  -[ModalCardHeaderView addSubview:](self, "addSubview:", self->_stackView);
  -[ModalCardHeaderConfiguration hairlineLeadingInset](self->_configuration, "hairlineLeadingInset");
  v19 = v18;
  -[ModalCardHeaderConfiguration hairlineTrailingInset](self->_configuration, "hairlineTrailingInset");
  v21 = (HairlineView *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView _maps_addHairlineAtBottomWithLeadingMargin:trailingMargin:](self, "_maps_addHairlineAtBottomWithLeadingMargin:trailingMargin:", v19, v20));
  bottomHairline = self->_bottomHairline;
  self->_bottomHairline = v21;

  -[ModalCardHeaderView _updateSizeForCurrentConfiguration](self, "_updateSizeForCurrentConfiguration");
  -[ModalCardHeaderView _setupInitialConstraints](self, "_setupInitialConstraints");
}

- (void)setUseAdaptiveFont:(BOOL)a3
{
  if (self->_useAdaptiveFont != a3)
  {
    self->_useAdaptiveFont = a3;
    -[ModalCardHeaderView _updateSizeForCurrentConfiguration](self, "_updateSizeForCurrentConfiguration");
  }
}

- (void)setConfiguration:(id)a3
{
  ModalCardHeaderConfiguration *v5;
  ModalCardHeaderConfiguration *v6;

  v5 = (ModalCardHeaderConfiguration *)a3;
  if (self->_configuration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_configuration, a3);
    -[ModalCardHeaderView _createConstraintsSpecificToConfiguration](self, "_createConstraintsSpecificToConfiguration");
    -[ModalCardHeaderView _updateSizeForCurrentConfiguration](self, "_updateSizeForCurrentConfiguration");
    v5 = v6;
  }

}

- (void)_updateSizeForCurrentConfiguration
{
  UILabel *titleLabel;
  _BOOL4 useAdaptiveFont;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  titleLabel = self->_titleLabel;
  useAdaptiveFont = self->_useAdaptiveFont;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView configuration](self, "configuration"));
  v6 = v5;
  if (useAdaptiveFont)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "adaptiveTitleFontProvider"));
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView configuration](self, "configuration"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "titleFontProvider"));
      +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", titleLabel, v9);

      v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleFontProvider"));
  }
  v10 = (void *)v7;
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", titleLabel, v7);
LABEL_6:

  if (-[ModalCardHeaderConfiguration leadingAlignedTitle](self->_configuration, "leadingAlignedTitle"))
    goto LABEL_13;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](self->_leadingButton, "titleLabel"));
  v12 = self->_useAdaptiveFont;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView configuration](self, "configuration"));
  v14 = v13;
  if (!v12)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingButtonFontProvider"));
    goto LABEL_11;
  }
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "adaptiveLeadingButtonFontProvider"));
  if (v15)
  {
LABEL_11:
    v18 = (void *)v15;
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v11, v15);
    goto LABEL_12;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView configuration](self, "configuration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingButtonFontProvider"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v11, v17);

  v18 = 0;
LABEL_12:

LABEL_13:
  v26 = (id)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](self->_trailingButton, "titleLabel"));
  v19 = self->_useAdaptiveFont;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView configuration](self, "configuration"));
  v21 = v20;
  if (!v19)
  {
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingButtonFontProvider"));
    goto LABEL_17;
  }
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "adaptiveTrailingButtonFontProvider"));
  if (v22)
  {
LABEL_17:
    v25 = (void *)v22;
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v26, v22);
    goto LABEL_18;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView configuration](self, "configuration"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingButtonFontProvider"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v26, v24);

  v25 = 0;
LABEL_18:

}

- (void)_setupInitialConstraints
{
  double v2;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  LODWORD(v2) = 1132068864;
  -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v2);
  LODWORD(v4) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v4);
  LODWORD(v5) = 1148829696;
  -[MapsThemeButton setContentCompressionResistancePriority:forAxis:](self->_leadingButton, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  -[MapsThemeButton setContentHuggingPriority:forAxis:](self->_leadingButton, "setContentHuggingPriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148829696;
  -[MapsThemeButton setContentCompressionResistancePriority:forAxis:](self->_trailingButton, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  LODWORD(v8) = 1148846080;
  -[MapsThemeButton setContentHuggingPriority:forAxis:](self->_trailingButton, "setContentHuggingPriority:forAxis:", 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_stackView, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 16.0));
  v18[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_stackView, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, -16.0));
  v18[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  -[ModalCardHeaderView _createConstraintsSpecificToConfiguration](self, "_createConstraintsSpecificToConfiguration");
}

- (void)_createConstraintsSpecificToConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *titleBaselineToBottomConstraint;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *topToTitleBaselineConstraint;
  NSLayoutConstraint *v18;
  void *v19;
  _QWORD v20[2];

  -[NSLayoutConstraint setActive:](self->_titleBaselineToBottomConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_topToTitleBaselineConstraint, "setActive:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomAnchor](self, "bottomAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView configuration](self, "configuration"));
  objc_msgSend(v5, "baselineToBottomDistance");
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4));
  titleBaselineToBottomConstraint = self->_titleBaselineToBottomConstraint;
  self->_titleBaselineToBottomConstraint = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView topAnchor](self, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView configuration](self, "configuration"));
  objc_msgSend(v11, "topToTitleBaselineUnscaledDistance");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView configuration](self, "configuration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "baselineDistanceFontProvider"));
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v10, v15, v13));
  topToTitleBaselineConstraint = self->_topToTitleBaselineConstraint;
  self->_topToTitleBaselineConstraint = v16;

  v18 = self->_topToTitleBaselineConstraint;
  v20[0] = self->_titleBaselineToBottomConstraint;
  v20[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setScrollViewOffset:(double)a3
{
  double v3;
  id v4;

  self->_scrollViewOffset = a3;
  v3 = a3 / 10.0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomHairline](self, "bottomHairline"));
  objc_msgSend(v4, "setAlpha:", v3);

}

- (ModalCardHeaderConfiguration)configuration
{
  return self->_configuration;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (MapsThemeButton)leadingButton
{
  return self->_leadingButton;
}

- (MapsThemeButton)trailingButton
{
  return self->_trailingButton;
}

- (HairlineView)bottomHairline
{
  return self->_bottomHairline;
}

- (double)scrollViewOffset
{
  return self->_scrollViewOffset;
}

- (BOOL)useAdaptiveFont
{
  return self->_useAdaptiveFont;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToTitleBaselineConstraint, 0);
}

@end
