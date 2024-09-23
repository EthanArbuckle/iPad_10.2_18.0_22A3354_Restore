@implementation LoadingModeView

- (void)updateTheme
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LoadingModeView;
  -[MapsThemeView updateTheme](&v4, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView theme](self, "theme"));
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_activityView, "setActivityIndicatorViewStyle:", objc_msgSend(v3, "activityIndicatorStyle"));

}

- (LoadingModeView)initWithTitle:(id)a3
{
  return -[LoadingModeView initWithTitle:axis:](self, "initWithTitle:axis:", a3, 1);
}

- (LoadingModeView)initWithTitle:(id)a3 axis:(int64_t)a4
{
  id v6;
  void *v7;
  LoadingModeView *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  id v13;
  UIView *v14;
  UIView *contentView;
  UIActivityIndicatorView *v16;
  UIActivityIndicatorView *activityView;
  UILabel *v18;
  UILabel *titleLabel;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "bounds");
  v22.receiver = self;
  v22.super_class = (Class)LoadingModeView;
  v8 = -[LoadingModeView initWithFrame:](&v22, "initWithFrame:");

  if (v8)
  {
    -[LoadingModeView _setHostsLayoutEngine:](v8, "_setHostsLayoutEngine:", 1);
    -[LoadingModeView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[LoadingModeView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[LoadingModeView setClipsToBounds:](v8, "setClipsToBounds:", 1);
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[LoadingModeView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v12);

    v8->_axis = a4;
    v13 = objc_alloc((Class)UIView);
    -[LoadingModeView bounds](v8, "bounds");
    v14 = (UIView *)objc_msgSend(v13, "initWithFrame:");
    contentView = v8->_contentView;
    v8->_contentView = v14;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAccessibilityIdentifier:](v8->_contentView, "setAccessibilityIdentifier:", CFSTR("LoadingModeContentView"));
    -[LoadingModeView addSubview:](v8, "addSubview:", v8->_contentView);
    v16 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    activityView = v8->_activityView;
    v8->_activityView = v16;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v8->_activityView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setAccessibilityIdentifier:](v8->_activityView, "setAccessibilityIdentifier:", CFSTR("LoadingModeActivityView"));
    -[UIView addSubview:](v8->_contentView, "addSubview:", v8->_activityView);
    -[UIActivityIndicatorView startAnimating](v8->_activityView, "startAnimating");
    v18 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v18;

    -[UILabel setText:](v8->_titleLabel, "setText:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v8->_titleLabel, "setTextColor:", v20);

    -[UILabel setAccessibilityIdentifier:](v8->_titleLabel, "setAccessibilityIdentifier:", CFSTR("LoadingModeTitle"));
    if (a4 == 1)
    {
      -[UILabel setNumberOfLines:](v8->_titleLabel, "setNumberOfLines:", 0);
      -[UILabel setTextAlignment:](v8->_titleLabel, "setTextAlignment:", 1);
    }
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v8->_titleLabel, &stru_1011DCA60);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v8->_contentView, "addSubview:", v8->_titleLabel);
    -[LoadingModeView setupConstraints](v8, "setupConstraints");
  }

  return v8;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (double)bottomInset
{
  double result;

  -[NSLayoutConstraint constant](self->_bottomContentConstraint, "constant");
  return result;
}

- (void)setBottomInset:(double)a3
{
  double v5;

  -[NSLayoutConstraint constant](self->_bottomContentConstraint, "constant");
  if (v5 != a3)
  {
    -[NSLayoutConstraint setConstant:](self->_bottomContentConstraint, "setConstant:", a3);
    -[LoadingModeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setupConstraints
{
  int64_t axis;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *v7;
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
  NSLayoutConstraint *v24;
  NSLayoutConstraint *bottomContentConstraint;
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
  _QWORD v57[11];
  _QWORD v58[10];

  axis = self->_axis;
  if (axis == 1)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView bottomAnchor](self, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
    v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v23));
    bottomContentConstraint = self->_bottomContentConstraint;
    self->_bottomContentConstraint = v24;

    v57[0] = self->_bottomContentConstraint;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView topAnchor](self, "topAnchor"));
    v56 = v26;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:", v55));
    v57[1] = v54;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView leadingAnchor](self, "leadingAnchor"));
    v53 = v27;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v52, 16.0));
    v57[2] = v51;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView trailingAnchor](self, "trailingAnchor"));
    v50 = v28;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v49, -16.0));
    v57[3] = v48;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_contentView, "centerYAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView centerYAnchor](self, "centerYAnchor"));
    v47 = v29;
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v46));
    v57[4] = v45;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView topAnchor](self->_activityView, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
    v44 = v30;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v43));
    v57[5] = v42;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView bottomAnchor](self->_activityView, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_titleLabel, "topAnchor"));
    v41 = v31;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v40, -5.0));
    v57[6] = v39;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
    v38 = v32;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v37));
    v57[7] = v36;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](self->_activityView, "centerXAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_contentView, "centerXAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v57[8] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v57[9] = v20;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
    v57[10] = v35;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 11));

  }
  else
  {
    if (axis)
    {
      v21 = 0;
      goto LABEL_7;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView bottomAnchor](self, "bottomAnchor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentView, "bottomAnchor"));
    v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
    v7 = self->_bottomContentConstraint;
    self->_bottomContentConstraint = v6;

    v58[0] = self->_bottomContentConstraint;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentView, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView topAnchor](self, "topAnchor"));
    v56 = v8;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v55));
    v58[1] = v54;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView leadingAnchor](self, "leadingAnchor"));
    v53 = v9;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v52));
    v58[2] = v51;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView trailingAnchor](self, "trailingAnchor"));
    v50 = v10;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:", v49));
    v58[3] = v48;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_contentView, "centerXAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView centerXAnchor](self, "centerXAnchor"));
    v47 = v11;
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v46));
    v58[4] = v45;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView leadingAnchor](self->_activityView, "leadingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentView, "leadingAnchor"));
    v44 = v12;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v43));
    v58[5] = v42;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView trailingAnchor](self->_activityView, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
    v41 = v13;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v40, -5.0));
    v58[6] = v39;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentView, "trailingAnchor"));
    v38 = v14;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v37));
    v58[7] = v36;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](self->_activityView, "centerYAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_contentView, "centerYAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v58[8] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_titleLabel, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_contentView, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v58[9] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 10));
  }

LABEL_7:
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (void)setTitleFont:(id)a3
{
  -[UILabel setFont:](self->_titleLabel, "setFont:", a3);
}

- (void)setTitleColor:(id)a3
{
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", a3);
}

- (void)startAnimating
{
  -[UIActivityIndicatorView setHidden:](self->_activityView, "setHidden:", 0);
  -[UIActivityIndicatorView startAnimating](self->_activityView, "startAnimating");
}

- (void)stopAnimating
{
  -[UIActivityIndicatorView stopAnimating](self->_activityView, "stopAnimating");
}

- (double)fittingHeight
{
  double v2;

  -[LoadingModeView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomContentConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
}

@end
