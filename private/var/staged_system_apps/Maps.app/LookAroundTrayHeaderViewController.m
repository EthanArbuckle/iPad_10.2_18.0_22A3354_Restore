@implementation LookAroundTrayHeaderViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LookAroundTrayHeaderViewController;
  -[LookAroundTrayHeaderViewController viewDidLoad](&v3, "viewDidLoad");
  -[LookAroundTrayHeaderViewController _setupViews](self, "_setupViews");
  -[LookAroundTrayHeaderViewController _setupConstraints](self, "_setupConstraints");
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "copy");
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

}

- (NSString)subtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "copy");
  -[UILabel setText:](self->_subtitleLabel, "setText:", v4);

}

- (void)trayHeaderDidReceiveTap:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController delegate](self, "delegate", a3));
  objc_msgSend(v3, "trayHeaderDidReceiveTap");

}

- (void)_setupViews
{
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *titleLabel;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *subtitleLabel;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
  -[UILabel setText:](self->_titleLabel, "setText:", CFSTR(" "));
  LODWORD(v9) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  LODWORD(v10) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_titleLabel, &stru_1011C60B0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v12);

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("LookAroundTrayHeaderTitle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self, "view"));
  objc_msgSend(v13, "addSubview:", self->_titleLabel);

  v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v14;

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 2);
  -[UILabel setText:](self->_subtitleLabel, "setText:", CFSTR(" "));
  LODWORD(v16) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v16);
  LODWORD(v17) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_subtitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v17);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_subtitleLabel, &stru_1011C6090);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_subtitleLabel, "setBackgroundColor:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v19);

  -[UILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("LookAroundTrayHeaderSubtitle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self, "view"));
  objc_msgSend(v20, "addSubview:", self->_subtitleLabel);

  v22 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "trayHeaderDidReceiveTap:");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self, "view"));
  objc_msgSend(v21, "addGestureRecognizer:", v22);

}

- (void)_setupConstraints
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[7];

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 16.0));
  v33[0] = v29;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, -16.0));
  v33[1] = v25;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v21, &stru_1011C60B0, 35.0));
  v33[2] = v20;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_subtitleLabel, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 16.0));
  v33[3] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_subtitleLabel, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v13, -16.0));
  v33[4] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_subtitleLabel, "firstBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v6, &stru_1011C6090, 21.0));
  v33[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTrayHeaderViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_subtitleLabel, "lastBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 21.0));
  v33[6] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (TrayHeaderDelegate)delegate
{
  return (TrayHeaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
