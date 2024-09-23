@implementation RAPTwoLinesMenuTableViewCell

- (RAPTwoLinesMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPTwoLinesMenuTableViewCell *v4;
  RAPTwoLinesMenuTableViewCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RAPTwoLinesMenuTableViewCell;
  v4 = -[RAPTwoLinesMenuTableViewCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[RAPTwoLinesMenuTableViewCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    -[RAPTwoLinesMenuTableViewCell _setupSubviews](v5, "_setupSubviews");
    -[RAPTwoLinesMenuTableViewCell _setupConstraints](v5, "_setupConstraints");
    -[RAPTwoLinesMenuTableViewCell setAccessoryType:](v5, "setAccessoryType:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, "_contentSizeChanged", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v5;
}

- (void)_setupSubviews
{
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *mainTitleLabel;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *secondTitleLabel;
  void *v13;
  void *v14;
  UIImageView *v15;
  UIImageView *leftImageView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  mainTitleLabel = self->_mainTitleLabel;
  self->_mainTitleLabel = v7;

  -[UILabel setAccessibilityIdentifier:](self->_mainTitleLabel, "setAccessibilityIdentifier:", CFSTR("MainTitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_mainTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_mainTitleLabel, "setNumberOfLines:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UILabel setFont:](self->_mainTitleLabel, "setFont:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_mainTitleLabel, "setTextColor:", v10);

  v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  secondTitleLabel = self->_secondTitleLabel;
  self->_secondTitleLabel = v11;

  -[UILabel setAccessibilityIdentifier:](self->_secondTitleLabel, "setAccessibilityIdentifier:", CFSTR("SecondTitleLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_secondTitleLabel, "setNumberOfLines:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system13Adaptive](UIFont, "system13Adaptive"));
  -[UILabel setFont:](self->_secondTitleLabel, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_secondTitleLabel, "setTextColor:", v14);

  v15 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  leftImageView = self->_leftImageView;
  self->_leftImageView = v15;

  -[UIImageView setAccessibilityIdentifier:](self->_leftImageView, "setAccessibilityIdentifier:", CFSTR("LeftImageView"));
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_leftImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_leftImageView, "setContentMode:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 26.0));
  -[UIImageView setPreferredSymbolConfiguration:](self->_leftImageView, "setPreferredSymbolConfiguration:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayColor](UIColor, "systemLightGrayColor"));
  -[UIImageView setTintColor:](self->_leftImageView, "setTintColor:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTwoLinesMenuTableViewCell contentView](self, "contentView"));
  objc_msgSend(v19, "addSubview:", self->_mainTitleLabel);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTwoLinesMenuTableViewCell contentView](self, "contentView"));
  objc_msgSend(v20, "addSubview:", self->_secondTitleLabel);

  v21 = (id)objc_claimAutoreleasedReturnValue(-[RAPTwoLinesMenuTableViewCell contentView](self, "contentView"));
  objc_msgSend(v21, "addSubview:", self->_leftImageView);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *topToTitleConstraint;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *titleToSubtitleConstraint;
  void *v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *subtitleToBottomConstraint;
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
  NSLayoutConstraint *v29;
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
  _QWORD v46[11];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTwoLinesMenuTableViewCell contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_mainTitleLabel, "firstBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_mainTitleLabel, "font"));
  objc_msgSend(v6, "_mapkit_scaledValueForValue:", 29.0);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5));
  topToTitleConstraint = self->_topToTitleConstraint;
  self->_topToTitleConstraint = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_mainTitleLabel, "lastBaselineAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_secondTitleLabel, "firstBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_mainTitleLabel, "font"));
  objc_msgSend(v11, "_mapkit_scaledValueForValue:", -19.0);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10));
  titleToSubtitleConstraint = self->_titleToSubtitleConstraint;
  self->_titleToSubtitleConstraint = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_secondTitleLabel, "lastBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_secondTitleLabel, "font"));
  objc_msgSend(v16, "_mapkit_scaledValueForValue:", -16.0);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15));
  subtitleToBottomConstraint = self->_subtitleToBottomConstraint;
  self->_subtitleToBottomConstraint = v17;

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_leftImageView, "widthAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToConstant:", 26.0));
  v46[0] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_leftImageView, "heightAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_leftImageView, "widthAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v46[1] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_leftImageView, "centerYAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerYAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v46[2] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_leftImageView, "leadingAnchor"));
  v37 = v3;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 15.0));
  v46[3] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_mainTitleLabel, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_leftImageView, "trailingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, 15.0));
  v46[4] = v31;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_mainTitleLabel, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -15.0));
  v22 = self->_topToTitleConstraint;
  v46[5] = v21;
  v46[6] = v22;
  v46[7] = self->_titleToSubtitleConstraint;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_secondTitleLabel, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_mainTitleLabel, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  v46[8] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_secondTitleLabel, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_mainTitleLabel, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  v29 = self->_subtitleToBottomConstraint;
  v46[9] = v28;
  v46[10] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

}

- (void)setViewModel:(id)a3
{
  RAPTwoLinesViewModel *v5;
  RAPTwoLinesViewModel *v6;

  v5 = (RAPTwoLinesViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[RAPTwoLinesMenuTableViewCell _updateContent](self, "_updateContent");
    v5 = v6;
  }

}

- (void)_updateContent
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTwoLinesViewModel image](self->_viewModel, "image"));
  -[UIImageView setImage:](self->_leftImageView, "setImage:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTwoLinesViewModel title](self->_viewModel, "title"));
  -[UILabel setText:](self->_mainTitleLabel, "setText:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPTwoLinesViewModel subtitle](self->_viewModel, "subtitle"));
  -[UILabel setText:](self->_secondTitleLabel, "setText:", v5);

}

- (void)_contentSizeChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UILabel setFont:](self->_mainTitleLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system13Adaptive](UIFont, "system13Adaptive"));
  -[UILabel setFont:](self->_secondTitleLabel, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_mainTitleLabel, "font"));
  objc_msgSend(v5, "_mapkit_scaledValueForValue:", 29.0);
  -[NSLayoutConstraint setConstant:](self->_topToTitleConstraint, "setConstant:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_mainTitleLabel, "font"));
  objc_msgSend(v6, "_mapkit_scaledValueForValue:", -19.0);
  -[NSLayoutConstraint setConstant:](self->_titleToSubtitleConstraint, "setConstant:");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_secondTitleLabel, "font"));
  objc_msgSend(v7, "_mapkit_scaledValueForValue:", -16.0);
  -[NSLayoutConstraint setConstant:](self->_subtitleToBottomConstraint, "setConstant:");

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPTwoLinesMenuTableViewCell;
  -[RAPTwoLinesMenuTableViewCell prepareForReuse](&v5, "prepareForReuse");
  -[UIImageView _setContinuousCornerRadius:](self->_leftImageView, "_setContinuousCornerRadius:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIImageView setBackgroundColor:](self->_leftImageView, "setBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIImageView setTintColor:](self->_leftImageView, "setTintColor:", v4);

}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("RAPTwoLinesMenuTableViewCell");
}

- (RAPTwoLinesViewModel)viewModel
{
  return self->_viewModel;
}

- (UIImageView)leftImageView
{
  return self->_leftImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_subtitleToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleToSubtitleConstraint, 0);
  objc_storeStrong((id *)&self->_topToTitleConstraint, 0);
  objc_storeStrong((id *)&self->_secondTitleLabel, 0);
  objc_storeStrong((id *)&self->_mainTitleLabel, 0);
}

@end
