@implementation RAPCategorySearchTableViewCell

- (RAPCategorySearchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPCategorySearchTableViewCell *v4;
  RAPCategorySearchTableViewCell *v5;
  id v6;
  double y;
  double width;
  double height;
  UIImageView *v10;
  UIImageView *checkmarkImageView;
  UILabel *v12;
  UILabel *categoryLabel;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RAPCategorySearchTableViewCell;
  v4 = -[RAPCategorySearchTableViewCell initWithStyle:reuseIdentifier:](&v16, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_checked = 0;
    v6 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UIImageView *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    checkmarkImageView = v5->_checkmarkImageView;
    v5->_checkmarkImageView = v10;

    v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    categoryLabel = v5->_categoryLabel;
    v5->_categoryLabel = v12;

    -[RAPCategorySearchTableViewCell _setupSubviews](v5, "_setupSubviews");
    -[RAPCategorySearchTableViewCell _setupConstraints](v5, "_setupConstraints");
    -[RAPCategorySearchTableViewCell _updateCheckmarkImageView](v5, "_updateCheckmarkImageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v5;
}

- (void)_setupSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_checkmarkImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_categoryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setClipsToBounds:](self->_checkmarkImageView, "setClipsToBounds:", 1);
  -[UIImageView _setContinuousCornerRadius:](self->_checkmarkImageView, "_setContinuousCornerRadius:", 10.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "nativeScale");
  v5 = 2.0 / v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_checkmarkImageView, "layer"));
  objc_msgSend(v6, "setBorderWidth:", v5);

  -[UIImageView setContentMode:](self->_checkmarkImageView, "setContentMode:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
  -[UIImageView setPreferredSymbolConfiguration:](self->_checkmarkImageView, "setPreferredSymbolConfiguration:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UILabel setFont:](self->_categoryLabel, "setFont:", v8);

  -[UILabel setNumberOfLines:](self->_categoryLabel, "setNumberOfLines:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCategorySearchTableViewCell contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", self->_checkmarkImageView);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCategorySearchTableViewCell contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", self->_categoryLabel);

  -[RAPCategorySearchTableViewCell _updateCheckmarkImageView](self, "_updateCheckmarkImageView");
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *topLayoutConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *bottomLayoutConstraint;
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
  void *v25;
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
  _QWORD v37[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_categoryLabel, "firstBaselineAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCategorySearchTableViewCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_categoryLabel, "font"));
  objc_msgSend(v6, "_scaledValueForValue:", 33.0);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5));
  topLayoutConstraint = self->_topLayoutConstraint;
  self->_topLayoutConstraint = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_categoryLabel, "lastBaselineAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCategorySearchTableViewCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_categoryLabel, "font"));
  objc_msgSend(v12, "_scaledValueForValue:", -22.0);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11));
  bottomLayoutConstraint = self->_bottomLayoutConstraint;
  self->_bottomLayoutConstraint = v13;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_checkmarkImageView, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCategorySearchTableViewCell contentView](self, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 17.0));
  v37[0] = v33;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_checkmarkImageView, "centerYAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCategorySearchTableViewCell contentView](self, "contentView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerYAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v37[1] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_checkmarkImageView, "widthAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToConstant:", 20.0));
  v37[2] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_checkmarkImageView, "heightAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_checkmarkImageView, "widthAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v15));
  v37[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_checkmarkImageView, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_categoryLabel, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -14.0));
  v37[4] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_categoryLabel, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCategorySearchTableViewCell contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, -15.0));
  v24 = self->_topLayoutConstraint;
  v37[5] = v23;
  v37[6] = v24;
  v37[7] = self->_bottomLayoutConstraint;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

}

- (void)setDisplayText:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_displayText != v5)
  {
    objc_storeStrong((id *)&self->_displayText, a3);
    -[UILabel setText:](self->_categoryLabel, "setText:", v5);
  }

}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    self->_checked = a3;
    -[RAPCategorySearchTableViewCell _updateCheckmarkImageView](self, "_updateCheckmarkImageView");
  }
}

- (void)_updateCheckmarkImageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (self->_checked)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle.fill")));
    -[UIImageView setImage:](self->_checkmarkImageView, "setImage:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIImageView setTintColor:](self->_checkmarkImageView, "setTintColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  }
  else
  {
    -[UIImageView setImage:](self->_checkmarkImageView, "setImage:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIImageView setBackgroundColor:](self->_checkmarkImageView, "setBackgroundColor:", v6);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  }
  v9 = objc_retainAutorelease(v5);
  v7 = objc_msgSend(v9, "CGColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_checkmarkImageView, "layer"));
  objc_msgSend(v8, "setBorderColor:", v7);

}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UILabel setFont:](self->_categoryLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_categoryLabel, "font"));
  objc_msgSend(v4, "_scaledValueForValue:", 33.0);
  -[NSLayoutConstraint setConstant:](self->_topLayoutConstraint, "setConstant:");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_categoryLabel, "font"));
  objc_msgSend(v5, "_scaledValueForValue:", -22.0);
  -[NSLayoutConstraint setConstant:](self->_bottomLayoutConstraint, "setConstant:");

}

+ (NSString)identifier
{
  return (NSString *)CFSTR("RAPCategorySearchTableViewCell");
}

- (NSString)displayText
{
  return self->_displayText;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_bottomLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_topLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
}

@end
