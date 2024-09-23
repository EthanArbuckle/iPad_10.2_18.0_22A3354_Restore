@implementation NavSignFooterView

- (NavSignFooterView)initWithFrame:(CGRect)a3
{
  NavSignFooterView *v3;
  NavSignFooterView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *leftGrabber;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *rightGrabber;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UILayoutGuide *v21;
  UILayoutGuide *contentAreaGuide;
  UIButton *v23;
  UIButton *endButton;
  UIButton *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  objc_super v76;
  _QWORD v77[16];

  v76.receiver = self;
  v76.super_class = (Class)NavSignFooterView;
  v3 = -[NavSignFooterView initWithFrame:](&v76, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NavSignFooterView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView layer](v4, "layer"));
    objc_msgSend(v8, "setMasksToBounds:", 1);

    v9 = objc_opt_new(UIView);
    leftGrabber = v4->_leftGrabber;
    v4->_leftGrabber = v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_leftGrabber, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_colorFromHexString:](UIColor, "_maps_colorFromHexString:", CFSTR("606063FF")));
    -[UIView setBackgroundColor:](v4->_leftGrabber, "setBackgroundColor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_leftGrabber, "layer"));
    objc_msgSend(v12, "setCornerRadius:", 2.0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_leftGrabber, "layer"));
    objc_msgSend(v13, "setAnchorPoint:", 1.0, 0.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_leftGrabber, "layer"));
    objc_msgSend(v14, "setMaskedCorners:", 5);

    -[UIView setAccessibilityIdentifier:](v4->_leftGrabber, "setAccessibilityIdentifier:", CFSTR("LeftGrabber"));
    -[NavSignFooterView addSubview:](v4, "addSubview:", v4->_leftGrabber);
    v15 = objc_opt_new(UIView);
    rightGrabber = v4->_rightGrabber;
    v4->_rightGrabber = v15;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_rightGrabber, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_colorFromHexString:](UIColor, "_maps_colorFromHexString:", CFSTR("606063FF")));
    -[UIView setBackgroundColor:](v4->_rightGrabber, "setBackgroundColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_rightGrabber, "layer"));
    objc_msgSend(v18, "setCornerRadius:", 2.0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_rightGrabber, "layer"));
    objc_msgSend(v19, "setAnchorPoint:", 0.0, 0.0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v4->_rightGrabber, "layer"));
    objc_msgSend(v20, "setMaskedCorners:", 10);

    -[UIView setAccessibilityIdentifier:](v4->_rightGrabber, "setAccessibilityIdentifier:", CFSTR("RightGrabber"));
    -[NavSignFooterView addSubview:](v4, "addSubview:", v4->_rightGrabber);
    v21 = objc_opt_new(UILayoutGuide);
    contentAreaGuide = v4->_contentAreaGuide;
    v4->_contentAreaGuide = v21;

    -[NavSignFooterView addLayoutGuide:](v4, "addLayoutGuide:", v4->_contentAreaGuide);
    v23 = objc_opt_new(UIButton);
    endButton = v4->_endButton;
    v4->_endButton = v23;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_endButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = v4->_endButton;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("[NavTray] End Title"), CFSTR("localized string not found"), 0));
    -[UIButton setTitle:forState:](v25, "setTitle:forState:", v27, 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[UIButton setBackgroundColor:](v4->_endButton, "setBackgroundColor:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v4->_endButton, "layer"));
    objc_msgSend(v29, "setCornerRadius:", 10.0);

    -[UIButton setAlpha:](v4->_endButton, "setAlpha:", 0.0);
    -[NavSignFooterView _updateEndButtonFont](v4, "_updateEndButtonFont");
    -[UIButton setAccessibilityIdentifier:](v4->_endButton, "setAccessibilityIdentifier:", CFSTR("EndButton"));
    -[NavSignFooterView addSubview:](v4, "addSubview:", v4->_endButton);
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v4->_leftGrabber, "centerXAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView centerXAnchor](v4, "centerXAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
    v77[0] = v73;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_leftGrabber, "topAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView topAnchor](v4, "topAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, 16.0));
    v77[1] = v70;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v4->_leftGrabber, "heightAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToConstant:", 4.0));
    v77[2] = v68;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v4->_leftGrabber, "widthAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToConstant:", 20.0));
    v77[3] = v66;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v4->_rightGrabber, "centerXAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView centerXAnchor](v4, "centerXAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
    v77[4] = v63;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4->_rightGrabber, "topAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView topAnchor](v4, "topAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 16.0));
    v77[5] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v4->_rightGrabber, "heightAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToConstant:", 4.0));
    v77[6] = v58;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v4->_rightGrabber, "widthAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToConstant:", 20.0));
    v77[7] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v4->_contentAreaGuide, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView leadingAnchor](v4, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
    v77[8] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v4->_contentAreaGuide, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView trailingAnchor](v4, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
    v77[9] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v4->_contentAreaGuide, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView topAnchor](v4, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v77[10] = v47;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v4->_contentAreaGuide, "bottomAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView safeAreaLayoutGuide](v4, "safeAreaLayoutGuide"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
    v77[11] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v4->_endButton, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView leadingAnchor](v4, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, 16.0));
    v77[12] = v40;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v4->_endButton, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView trailingAnchor](v4, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -16.0));
    v77[13] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](v4->_endButton, "centerYAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v4->_contentAreaGuide, "centerYAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
    v77[14] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v4->_endButton, "heightAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToConstant:", 54.0));
    v77[15] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 16));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v38);

    -[NavSignFooterView _updateGrabber](v4, "_updateGrabber");
  }
  return v4;
}

- (double)minimumHeight
{
  return 30.0;
}

- (double)maximumHeight
{
  double v2;

  -[NavSignFooterView bottomPadding](self, "bottomPadding");
  return v2 + 66.0;
}

- (double)currentHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[NavSignFooterView minimumHeight](self, "minimumHeight");
  v4 = v3;
  -[NavSignFooterView layoutProgress](self, "layoutProgress");
  v6 = 1.0 - v5;
  -[NavSignFooterView maximumHeight](self, "maximumHeight");
  v8 = v7;
  -[NavSignFooterView layoutProgress](self, "layoutProgress");
  return v8 * v9 + v4 * v6;
}

- (void)setLayoutProgress:(double)a3
{
  double v3;

  v3 = fmin(fmax(a3, 0.0), 1.0);
  if (vabdd_f64(self->_layoutProgress, v3) > 2.22044605e-16)
  {
    self->_layoutProgress = v3;
    -[NavSignFooterView _updateGrabber](self, "_updateGrabber");
  }
}

- (void)_updateGrabber
{
  CGFloat v3;
  UIView *leftGrabber;
  UIView *rightGrabber;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v3 = self->_layoutProgress * 0.318309886 + 0.0;
  CGAffineTransformMakeRotation(&v9, -v3);
  leftGrabber = self->_leftGrabber;
  v8 = v9;
  -[UIView setTransform:](leftGrabber, "setTransform:", &v8);
  CGAffineTransformMakeRotation(&v7, v3);
  rightGrabber = self->_rightGrabber;
  v6 = v7;
  -[UIView setTransform:](rightGrabber, "setTransform:", &v6);
}

- (void)setShouldShowEndButton:(BOOL)a3
{
  double v3;

  if (self->_shouldShowEndButton != a3)
  {
    self->_shouldShowEndButton = a3;
    v3 = 0.0;
    if (a3)
      v3 = 1.0;
    -[UIButton setAlpha:](self->_endButton, "setAlpha:", v3);
  }
}

- (void)_updateEndButtonFont
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryExtraExtraExtraLarge));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle3, v4, UIFontWeightBold));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_endButton, "titleLabel"));
  objc_msgSend(v5, "setFont:", v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  unsigned int v12;
  double v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavSignFooterView;
  -[NavSignFooterView traitCollectionDidChange:](&v14, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v8 = sub_1002A8950(v6, v7);

  if (v8)
    -[NavSignFooterView _updateEndButtonFont](self, "_updateEndButtonFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView traitCollection](self, "traitCollection"));
  v10 = sub_1002A8A0C(v4, v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignFooterView traitCollection](self, "traitCollection"));
    v12 = objc_msgSend(v11, "isLuminanceReduced");

    if (v12)
      v13 = 0.300000012;
    else
      v13 = 1.0;
    -[UIView setAlpha:](self->_rightGrabber, "setAlpha:", v13);
    -[UIView setAlpha:](self->_leftGrabber, "setAlpha:", v13);
  }

}

- (double)layoutProgress
{
  return self->_layoutProgress;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (UIButton)endButton
{
  return self->_endButton;
}

- (BOOL)shouldShowEndButton
{
  return self->_shouldShowEndButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_contentAreaGuide, 0);
  objc_storeStrong((id *)&self->_rightGrabber, 0);
  objc_storeStrong((id *)&self->_leftGrabber, 0);
}

@end
