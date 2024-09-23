@implementation BlurredBackgroundLabel

- (BlurredBackgroundLabel)initWithFrame:(CGRect)a3
{
  BlurredBackgroundLabel *v3;
  BlurredBackgroundLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BlurredBackgroundLabel;
  v3 = -[BlurredBackgroundLabel initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[BlurredBackgroundLabel _sharedInit](v3, "_sharedInit");
  return v4;
}

- (BlurredBackgroundLabel)init
{
  BlurredBackgroundLabel *v2;
  BlurredBackgroundLabel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BlurredBackgroundLabel;
  v2 = -[BlurredBackgroundLabel init](&v5, "init");
  v3 = v2;
  if (v2)
    -[BlurredBackgroundLabel _sharedInit](v2, "_sharedInit");
  return v3;
}

- (void)_sharedInit
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[BlurredBackgroundLabel setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[BlurredBackgroundLabel _setupSubviews](self, "_setupSubviews");
  -[BlurredBackgroundLabel _setupConstraints](self, "_setupConstraints");
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *backgroundEffectView;
  UILabel *v7;
  UILabel *label;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  id v13;

  v3 = objc_alloc((Class)UIVisualEffectView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 6));
  v5 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:", v4);
  backgroundEffectView = self->_backgroundEffectView;
  self->_backgroundEffectView = v5;

  v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  label = self->_label;
  self->_label = v7;

  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_label, "setAdjustsFontSizeToFitWidth:", 1);
  v9 = self->_label;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager mapDescriptionView](RAPFontManager, "mapDescriptionView"));
  -[UILabel setFont:](v9, "setFont:", v10);

  v11 = self->_label;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](v11, "setTextColor:", v12);

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  -[BlurredBackgroundLabel addSubview:](self, "addSubview:", self->_backgroundEffectView);
  v13 = (id)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_backgroundEffectView, "contentView"));
  objc_msgSend(v13, "addSubview:", self->_label);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *topToFirstBaselineConstraint;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *lastBaselineToBottomConstraint;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
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
  _QWORD v33[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_label, "firstBaselineAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_backgroundEffectView, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label, "font"));
  objc_msgSend(v5, "_scaledValueForValue:", 25.0);
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4));
  topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
  self->_topToFirstBaselineConstraint = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_backgroundEffectView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_label, "lastBaselineAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label, "font"));
  objc_msgSend(v10, "_scaledValueForValue:", 15.0);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9));
  lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
  self->_lastBaselineToBottomConstraint = v11;

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_backgroundEffectView, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BlurredBackgroundLabel leadingAnchor](self, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v33[0] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_backgroundEffectView, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BlurredBackgroundLabel trailingAnchor](self, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v33[1] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](self->_backgroundEffectView, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BlurredBackgroundLabel topAnchor](self, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v33[2] = v24;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](self->_backgroundEffectView, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BlurredBackgroundLabel bottomAnchor](self, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v33[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_label, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](self->_backgroundEffectView, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 5.0));
  v33[4] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_label, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](self->_backgroundEffectView, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -5.0));
  v22 = self->_topToFirstBaselineConstraint;
  v33[5] = v21;
  v33[6] = v22;
  v33[7] = self->_lastBaselineToBottomConstraint;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

}

- (void)setText:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, a3);
    -[UILabel setText:](self->_label, "setText:", v5);
    -[BlurredBackgroundLabel setAccessibilityLabel:](self, "setAccessibilityLabel:", v5);
  }

}

- (void)setGroupName:(id)a3
{
  NSString **p_groupName;
  id v6;

  p_groupName = &self->_groupName;
  v6 = a3;
  if (!-[NSString isEqualToString:](*p_groupName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_groupName, a3);
    -[UIVisualEffectView _setGroupName:](self->_backgroundEffectView, "_setGroupName:", *p_groupName);
  }

}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager mapDescriptionView](RAPFontManager, "mapDescriptionView"));
  -[UILabel setFont:](self->_label, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label, "font"));
  objc_msgSend(v4, "_scaledValueForValue:", 25.0);
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label, "font"));
  objc_msgSend(v5, "_scaledValueForValue:", 15.0);
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");

}

- (NSString)text
{
  return self->_text;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
}

@end
