@implementation CarplayTableViewHeaderContentView

+ (double)height
{
  return 44.0;
}

- (void)_createAndAddSeparatorView
{
  UIView *v3;
  UIView *separator;
  void *v5;

  v3 = objc_opt_new(UIView);
  separator = self->_separator;
  self->_separator = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  -[UIView setBackgroundColor:](self->_separator, "setBackgroundColor:", v5);

  -[CarplayTableViewHeaderContentView addSubview:](self, "addSubview:", self->_separator);
}

- (void)_createAndAddTitleView
{
  UILabel *v3;
  UILabel *label;
  void *v5;
  void *v6;
  double v7;

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  label = self->_label;
  self->_label = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_label, "setTextColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView _labelFont](self, "_labelFont"));
  -[UILabel setFont:](self->_label, "setFont:", v6);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1144733696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_label, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  -[CarplayTableViewHeaderContentView addSubview:](self, "addSubview:", self->_label);
}

- (void)_createFocusImageView
{
  UIImageView *v3;
  UIImageView *focusImageView;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("moon.fill")));
  v3 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
  focusImageView = self->_focusImageView;
  self->_focusImageView = v3;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_focusImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemIndigoColor](UIColor, "systemIndigoColor"));
  -[UIImageView setTintColor:](self->_focusImageView, "setTintColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleTitle1));
  -[UIImageView setPreferredSymbolConfiguration:](self->_focusImageView, "setPreferredSymbolConfiguration:", v6);

}

- (void)setAnyCalendarsHiddenByFocus:(BOOL)a3
{
  -[CarplayTableViewHeaderContentView _setAnyCalendarsHiddenByFocus:forceUpdate:](self, "_setAnyCalendarsHiddenByFocus:forceUpdate:", a3, 0);
}

- (void)_setAnyCalendarsHiddenByFocus:(BOOL)a3 forceUpdate:(BOOL)a4
{
  _BOOL4 v5;
  NSMutableArray *focusImageViewConstraints;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  if (self->_anyCalendarsHiddenByFocus != a3 || a4)
  {
    v5 = a3;
    self->_anyCalendarsHiddenByFocus = a3;
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_focusImageViewConstraints, a4);
    -[NSMutableArray removeAllObjects](self->_focusImageViewConstraints, "removeAllObjects");
    if (v5)
    {
      -[CarplayTableViewHeaderContentView addSubview:](self, "addSubview:", self->_focusImageView);
      focusImageViewConstraints = self->_focusImageViewConstraints;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_focusImageView, "leadingAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_label, "trailingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v9, 1.0));
      -[NSMutableArray addObject:](focusImageViewConstraints, "addObject:", v10);

      v11 = self->_focusImageViewConstraints;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_focusImageView, "trailingAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView trailingAnchor](self, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
      -[NSMutableArray addObject:](v11, "addObject:", v14);

      v15 = self->_focusImageViewConstraints;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView firstBaselineAnchor](self->_focusImageView, "firstBaselineAnchor"));
      v17 = objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_label, "firstBaselineAnchor"));
    }
    else
    {
      -[UIImageView removeFromSuperview](self->_focusImageView, "removeFromSuperview");
      v15 = self->_focusImageViewConstraints;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_label, "trailingAnchor"));
      v17 = objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView trailingAnchor](self, "trailingAnchor"));
    }
    v18 = (void *)v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    -[NSMutableArray addObject:](v15, "addObject:", v19);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_focusImageViewConstraints);
  }
}

- (CarplayTableViewHeaderContentView)init
{
  CarplayTableViewHeaderContentView *v2;
  uint64_t v3;
  NSMutableArray *focusImageViewConstraints;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  objc_super v26;
  _QWORD v27[7];

  v26.receiver = self;
  v26.super_class = (Class)CarplayTableViewHeaderContentView;
  v2 = -[CarplayTableViewHeaderContentView init](&v26, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    focusImageViewConstraints = v2->_focusImageViewConstraints;
    v2->_focusImageViewConstraints = (NSMutableArray *)v3;

    -[CarplayTableViewHeaderContentView _createAndAddSeparatorView](v2, "_createAndAddSeparatorView");
    -[CarplayTableViewHeaderContentView _createAndAddTitleView](v2, "_createAndAddTitleView");
    -[CarplayTableViewHeaderContentView _createFocusImageView](v2, "_createFocusImageView");
    -[CarplayTableViewHeaderContentView _setAnyCalendarsHiddenByFocus:forceUpdate:](v2, "_setAnyCalendarsHiddenByFocus:forceUpdate:", 0, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v2->_separator, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView leadingAnchor](v2, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
    v27[0] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v2->_separator, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView trailingAnchor](v2, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
    v27[1] = v20;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v2->_separator, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView topAnchor](v2, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
    v27[2] = v17;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v2->_separator, "heightAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", 1.0));
    v27[3] = v15;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v2->_label, "leadingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView leadingAnchor](v2, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
    v27[4] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v2->_label, "firstBaselineAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v2->_separator, "bottomAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 32.0));
    v27[5] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayTableViewHeaderContentView heightAnchor](v2, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 44.0));
    v27[6] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  }
  return v2;
}

- (id)_labelFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 0.0));
  return v4;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (BOOL)anyCalendarsHiddenByFocus
{
  return self->_anyCalendarsHiddenByFocus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_focusImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_focusImageView, 0);
}

@end
