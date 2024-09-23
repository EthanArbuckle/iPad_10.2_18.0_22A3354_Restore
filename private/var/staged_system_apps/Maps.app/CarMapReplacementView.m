@implementation CarMapReplacementView

- (BOOL)shouldShowReasons
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  if (!self->_label)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  if (objc_msgSend(v2, "isInternalInstall"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("CarInternalShowDeactivationReasons"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_label)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("CarInternalShowDeactivationReasons"));

  }
  v4.receiver = self;
  v4.super_class = (Class)CarMapReplacementView;
  -[CarMapReplacementView dealloc](&v4, "dealloc");
}

- (CarMapReplacementView)initWithFrame:(CGRect)a3
{
  CarMapReplacementView *v3;
  CarMapReplacementView *v4;
  void *v5;
  unsigned int v6;
  UILabel *v7;
  UILabel *label;
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
  objc_super v31;
  _QWORD v32[6];

  v31.receiver = self;
  v31.super_class = (Class)CarMapReplacementView;
  v3 = -[CarMapReplacementView initWithFrame:](&v31, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CarMapReplacementView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CarMapReplacementView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    v6 = objc_msgSend(v5, "isInternalInstall");

    if (v6)
    {
      v7 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      label = v4->_label;
      v4->_label = v7;

      -[UILabel setAccessibilityIdentifier:](v4->_label, "setAccessibilityIdentifier:", CFSTR("ReasonLabel"));
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
      -[UILabel setFont:](v4->_label, "setFont:", v9);

      -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 0);
      -[CarMapReplacementView addSubview:](v4, "addSubview:", v4->_label);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_label, "topAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapReplacementView topAnchor](v4, "topAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v29, 1.0));
      v32[0] = v28;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_label, "leadingAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapReplacementView leadingAnchor](v4, "leadingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v26, 1.0));
      v32[1] = v25;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapReplacementView bottomAnchor](v4, "bottomAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_label, "bottomAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v23, 1.0));
      v32[2] = v22;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapReplacementView trailingAnchor](v4, "trailingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_label, "trailingAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v10, 1.0));
      v32[3] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v4->_label, "centerXAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapReplacementView centerXAnchor](v4, "centerXAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
      v32[4] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_label, "centerYAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarMapReplacementView centerYAnchor](v4, "centerYAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
      v32[5] = v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 6));

      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);
      -[UILabel setHidden:](v4->_label, "setHidden:", -[CarMapReplacementView shouldShowReasons](v4, "shouldShowReasons") ^ 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v18, "addObserver:forKeyPath:options:context:", v4, CFSTR("CarInternalShowDeactivationReasons"), 1, 0);

    }
  }
  return v4;
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_label, "setTextColor:", a3);
}

- (void)setReasonStrings:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Internal Only]\nInactive because:\n%@"), v4));
    -[UILabel setText:](self->_label, "setText:", v5);

  }
  else
  {
    -[UILabel setText:](self->_label, "setText:", CFSTR("[Internal Only]\nInactive with no reasons"));
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("CarInternalShowDeactivationReasons")))
  {
    -[UILabel setHidden:](self->_label, "setHidden:", -[CarMapReplacementView shouldShowReasons](self, "shouldShowReasons") ^ 1);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CarMapReplacementView;
    -[CarMapReplacementView observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
