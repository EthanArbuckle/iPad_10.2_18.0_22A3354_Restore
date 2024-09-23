@implementation CarRoutePlanningAdvisoryLabel

- (CarRoutePlanningAdvisoryLabel)initWithFrame:(CGRect)a3
{
  CarRoutePlanningAdvisoryLabel *v3;
  CarRoutePlanningAdvisoryLabel *v4;
  uint64_t v5;
  CarDynamicBlurView *blurView;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double y;
  double width;
  double height;
  UILabel *v15;
  UILabel *label;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CarCardRoundedButton *v23;
  CarCardRoundedButton *viewButton;
  void *v25;
  void *v26;
  CarCardRoundedButton *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  NSLayoutConstraint *buttonWidthConstraint;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
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
  objc_super v62;
  _QWORD v63[8];

  v62.receiver = self;
  v62.super_class = (Class)CarRoutePlanningAdvisoryLabel;
  v3 = -[CarRoutePlanningAdvisoryLabel initWithFrame:](&v62, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CarRoutePlanningAdvisoryLabel setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CarRoutePlanningAdvisoryLabel"));
    v5 = objc_claimAutoreleasedReturnValue(-[CarRoutePlanningAdvisoryLabel _mapsCar_injectBlurView](v4, "_mapsCar_injectBlurView"));
    blurView = v4->_blurView;
    v4->_blurView = (CarDynamicBlurView *)v5;

    -[CarDynamicBlurView _setCornerRadius:continuous:maskedCorners:](v4->_blurView, "_setCornerRadius:continuous:maskedCorners:", 1, 15, 9.0);
    LODWORD(v7) = 1144750080;
    -[CarRoutePlanningAdvisoryLabel setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    LODWORD(v8) = 1132068864;
    -[CarRoutePlanningAdvisoryLabel setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    LODWORD(v9) = 1148846080;
    -[CarRoutePlanningAdvisoryLabel setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v9);
    LODWORD(v10) = 1132068864;
    -[CarRoutePlanningAdvisoryLabel setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 0, v10);
    v11 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v15 = (UILabel *)objc_msgSend(v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    label = v4->_label;
    v4->_label = v15;

    -[UILabel setAccessibilityIdentifier:](v4->_label, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
    -[UILabel setFont:](v4->_label, "setFont:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_label, "setTextColor:", v18);

    -[UILabel setTextAlignment:](v4->_label, "setTextAlignment:", 4);
    LODWORD(v19) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_label, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    LODWORD(v20) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_label, "setContentCompressionResistancePriority:forAxis:", 0, v20);
    LODWORD(v21) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_label, "setContentHuggingPriority:forAxis:", 1, v21);
    LODWORD(v22) = 1132068864;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_label, "setContentHuggingPriority:forAxis:", 0, v22);
    -[CarRoutePlanningAdvisoryLabel addSubview:](v4, "addSubview:", v4->_label);
    v23 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    viewButton = v4->_viewButton;
    v4->_viewButton = v23;

    -[CarCardRoundedButton setAccessibilityIdentifier:](v4->_viewButton, "setAccessibilityIdentifier:", CFSTR("MoreButton"));
    -[CarCardRoundedButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_viewButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton titleLabel](v4->_viewButton, "titleLabel"));
    objc_msgSend(v26, "setFont:", v25);

    v27 = v4->_viewButton;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("More button [advisory]"), CFSTR("localized string not found"), 0));
    -[CarCardRoundedButton setTitle:forState:](v27, "setTitle:forState:", v29, 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CarFocusableButton setNonFocusedBackgroundColor:](v4->_viewButton, "setNonFocusedBackgroundColor:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    -[CarFocusableButton setNonFocusedTintColor:](v4->_viewButton, "setNonFocusedTintColor:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    -[CarFocusableButton setFocusedBackgroundColor:](v4->_viewButton, "setFocusedBackgroundColor:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    -[CarFocusableButton setFocusedTintColor:](v4->_viewButton, "setFocusedTintColor:", v33);

    -[CarCardRoundedButton setHidden:](v4->_viewButton, "setHidden:", 1);
    -[CarCardRoundedButton setUserInteractionEnabled:](v4->_viewButton, "setUserInteractionEnabled:", 1);
    -[CarCardRoundedButton addTarget:action:forControlEvents:](v4->_viewButton, "addTarget:action:forControlEvents:", v4, "_displayClickableAdvisories", 64);
    LODWORD(v34) = 1148846080;
    -[CarCardRoundedButton setContentCompressionResistancePriority:forAxis:](v4->_viewButton, "setContentCompressionResistancePriority:forAxis:", 0, v34);
    LODWORD(v35) = 1144750080;
    -[CarCardRoundedButton setContentCompressionResistancePriority:forAxis:](v4->_viewButton, "setContentCompressionResistancePriority:forAxis:", 1, v35);
    -[CarRoutePlanningAdvisoryLabel addSubview:](v4, "addSubview:", v4->_viewButton);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton widthAnchor](v4->_viewButton, "widthAnchor"));
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToConstant:", 0.0));
    buttonWidthConstraint = v4->_buttonWidthConstraint;
    v4->_buttonWidthConstraint = (NSLayoutConstraint *)v37;

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_label, "leadingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningAdvisoryLabel leadingAnchor](v4, "leadingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, 10.0));
    v63[0] = v59;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_label, "firstBaselineAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningAdvisoryLabel topAnchor](v4, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, 20.0));
    v63[1] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v4->_label, "lastBaselineAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningAdvisoryLabel bottomAnchor](v4, "bottomAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, -11.0));
    v63[2] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_label, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton leadingAnchor](v4->_viewButton, "leadingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -5.0));
    v63[3] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningAdvisoryLabel trailingAnchor](v4, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton trailingAnchor](v4->_viewButton, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v39, 5.0));
    v63[4] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton topAnchor](v4->_viewButton, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningAdvisoryLabel topAnchor](v4, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, 5.0));
    v63[5] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardRoundedButton bottomAnchor](v4->_viewButton, "bottomAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningAdvisoryLabel bottomAnchor](v4, "bottomAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, -5.0));
    v63[6] = v46;
    v63[7] = v4->_buttonWidthConstraint;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 8));
    -[CarRoutePlanningAdvisoryLabel addConstraints:](v4, "addConstraints:", v47);

  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarRoutePlanningAdvisoryLabel;
  -[CarRoutePlanningAdvisoryLabel layoutSubviews](&v3, "layoutSubviews");
  -[CarRoutePlanningAdvisoryLabel refreshClickability](self, "refreshClickability");
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;

  if (self->_text != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    text = self->_text;
    self->_text = v4;

    -[UILabel setText:](self->_label, "setText:", self->_text);
  }
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarRoutePlanningAdvisoryLabel;
  -[CarRoutePlanningAdvisoryLabel didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningAdvisoryLabel window](self, "window"));

  if (v3)
    -[CarRoutePlanningAdvisoryLabel _mapsCar_updateShadow](self, "_mapsCar_updateShadow");
}

- (void)setAlwaysClickable:(BOOL)a3
{
  if (self->_alwaysClickable != a3)
  {
    self->_alwaysClickable = a3;
    -[CarRoutePlanningAdvisoryLabel refreshClickability](self, "refreshClickability");
  }
}

- (void)refreshClickability
{
  uint64_t v3;

  if (self->_alwaysClickable)
    v3 = 0;
  else
    v3 = -[UILabel isTextTruncated](self->_label, "isTextTruncated") ^ 1;
  -[CarRoutePlanningAdvisoryLabel shouldHideDetailButton:](self, "shouldHideDetailButton:", v3);
}

- (void)shouldHideDetailButton:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  id WeakRetained;

  v3 = a3;
  v5 = -[CarCardRoundedButton isHidden](self->_viewButton, "isHidden");
  -[CarCardRoundedButton setHidden:](self->_viewButton, "setHidden:", v3);
  -[NSLayoutConstraint setActive:](self->_buttonWidthConstraint, "setActive:", v3);
  if (v5 != v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "clickabilityChanged");

  }
}

- (void)_displayClickableAdvisories
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningAdvisoryLabel delegate](self, "delegate"));
  objc_msgSend(v2, "displayAdvisories");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarRoutePlanningAdvisoryLabel;
  v4 = a3;
  -[CarRoutePlanningAdvisoryLabel traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRoutePlanningAdvisoryLabel traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[CarRoutePlanningAdvisoryLabel _mapsCar_updateShadow](self, "_mapsCar_updateShadow");
}

- (NSString)text
{
  return self->_text;
}

- (CarCardRoundedButton)viewButton
{
  return self->_viewButton;
}

- (void)setViewButton:(id)a3
{
  objc_storeStrong((id *)&self->_viewButton, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)alwaysClickable
{
  return self->_alwaysClickable;
}

- (CarRoutePlanningAdvisoryLabelDelegate)delegate
{
  return (CarRoutePlanningAdvisoryLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_viewButton, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_buttonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
