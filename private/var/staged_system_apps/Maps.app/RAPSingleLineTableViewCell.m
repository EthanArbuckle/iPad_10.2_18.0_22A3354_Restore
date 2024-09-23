@implementation RAPSingleLineTableViewCell

- (RAPSingleLineTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPSingleLineTableViewCell *v4;
  RAPSingleLineTableViewCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  UILabel *v9;
  UILabel *textLabel;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RAPSingleLineTableViewCell;
  v4 = -[RAPSingleLineTableViewCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[RAPSingleLineTableViewCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    textLabel = v5->_textLabel;
    v5->_textLabel = v9;

    -[RAPSingleLineTableViewCell _setupSubviews](v5, "_setupSubviews");
    -[RAPSingleLineTableViewCell _setupConstraints](v5, "_setupConstraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v5, "_contentSizeChanged", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v5;
}

- (void)_setupSubviews
{
  void *v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_textLabel, "setNumberOfLines:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_textLabel, "setAccessibilityIdentifier:", CFSTR("TextLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSingleLineTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "addSubview:", self->_textLabel);

  -[RAPSingleLineTableViewCell _updateFonts](self, "_updateFonts");
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *topToFirstBaselineConstraint;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *lastBaselineToBottomConstraint;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  void *v21;
  _QWORD v22[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSingleLineTableViewCell contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_textLabel, "firstBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_textLabel, "font"));
  objc_msgSend(v6, "_scaledValueForValue:", 33.0);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5));
  topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
  self->_topToFirstBaselineConstraint = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_textLabel, "lastBaselineAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_textLabel, "font"));
  objc_msgSend(v11, "_scaledValueForValue:", -22.0);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10));
  lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
  self->_lastBaselineToBottomConstraint = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_textLabel, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 15.0));
  v22[0] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_textLabel, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -15.0));
  v20 = self->_topToFirstBaselineConstraint;
  v22[1] = v19;
  v22[2] = v20;
  v22[3] = self->_lastBaselineToBottomConstraint;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (void)_contentSizeChanged
{
  -[RAPSingleLineTableViewCell _updateFonts](self, "_updateFonts");
  -[RAPSingleLineTableViewCell _updateConstraints](self, "_updateConstraints");
}

- (void)_updateFonts
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UILabel setFont:](self->_textLabel, "setFont:", v3);

}

- (void)_updateConstraints
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_textLabel, "font"));
  objc_msgSend(v3, "_scaledValueForValue:", 33.0);
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_textLabel, "font"));
  objc_msgSend(v4, "_scaledValueForValue:", -22.0);
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");

}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("RAPSingleLineTableViewCell");
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
}

@end
