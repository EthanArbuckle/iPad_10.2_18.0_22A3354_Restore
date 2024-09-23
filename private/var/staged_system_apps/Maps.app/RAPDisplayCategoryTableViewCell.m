@implementation RAPDisplayCategoryTableViewCell

- (void)_configureTokenView
{
  void *v3;
  UIView *v4;
  UIView *tokenView;
  void *v6;
  UILabel *v7;
  UILabel *tokenLabel;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *firstBaselineConstraint;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *lastBaselineConstraint;
  NSLayoutConstraint *v21;
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
  _QWORD v43[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDisplayCategoryTableViewCell contentView](self, "contentView"));
  v4 = (UIView *)objc_alloc_init((Class)UIView);
  tokenView = self->_tokenView;
  self->_tokenView = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[UIView setBackgroundColor:](self->_tokenView, "setBackgroundColor:", v6);

  v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  tokenLabel = self->_tokenLabel;
  self->_tokenLabel = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[UILabel setTextColor:](self->_tokenLabel, "setTextColor:", v9);

  -[UILabel setNumberOfLines:](self->_tokenLabel, "setNumberOfLines:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UILabel setFont:](self->_tokenLabel, "setFont:", v10);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_tokenLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UIView addSubview:](self->_tokenView, "addSubview:", self->_tokenLabel);
  objc_msgSend(v3, "addSubview:", self->_tokenView);
  -[UIView _setContinuousCornerRadius:](self->_tokenView, "_setContinuousCornerRadius:", 10.0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_tokenLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_tokenView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_tokenLabel, "firstBaselineAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_tokenView, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_tokenLabel, "font"));
  objc_msgSend(v13, "_scaledValueForValue:", 24.0);
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12));
  firstBaselineConstraint = self->_firstBaselineConstraint;
  self->_firstBaselineConstraint = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_tokenLabel, "lastBaselineAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_tokenView, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_tokenLabel, "font"));
  objc_msgSend(v18, "_scaledValueForValue:", -12.0);
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17));
  lastBaselineConstraint = self->_lastBaselineConstraint;
  self->_lastBaselineConstraint = v19;

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_tokenView, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_tokenLabel, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, -15.0));
  v43[0] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_tokenView, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_tokenLabel, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 15.0));
  v21 = self->_firstBaselineConstraint;
  v43[1] = v37;
  v43[2] = v21;
  v43[3] = self->_lastBaselineConstraint;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_tokenView, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, -15.0));
  v43[4] = v33;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_tokenView, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCancellableTableViewCell leadingAnchorForAccessoryView](self, "leadingAnchorForAccessoryView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:constant:", v23, -15.0));
  v43[5] = v24;
  v25 = v3;
  v34 = v3;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_tokenView, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -10.0));
  v43[6] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_tokenView, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 9.0));
  v43[7] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 8));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);
}

- (RAPDisplayCategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 itemKind:(int64_t)a5
{
  RAPDisplayCategoryTableViewCell *v5;
  RAPDisplayCategoryTableViewCell *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RAPDisplayCategoryTableViewCell;
  v5 = -[RAPCancellableTableViewCell initWithStyle:reuseIdentifier:itemKind:](&v9, "initWithStyle:reuseIdentifier:itemKind:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[RAPDisplayCategoryTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    -[RAPDisplayCategoryTableViewCell _configureTokenView](v6, "_configureTokenView");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v6;
}

- (void)setCategoryText:(id)a3
{
  NSString **p_categoryText;
  id v6;

  p_categoryText = &self->_categoryText;
  v6 = a3;
  if (!-[NSString isEqualToString:](*p_categoryText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_categoryText, a3);
    -[UILabel setText:](self->_tokenLabel, "setText:", *p_categoryText);
  }

}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UILabel setFont:](self->_tokenLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_tokenLabel, "font"));
  objc_msgSend(v4, "_scaledValueForValue:", 24.0);
  -[NSLayoutConstraint setConstant:](self->_firstBaselineConstraint, "setConstant:");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_tokenLabel, "font"));
  objc_msgSend(v5, "_scaledValueForValue:", -12.0);
  -[NSLayoutConstraint setConstant:](self->_lastBaselineConstraint, "setConstant:");

}

- (NSString)categoryText
{
  return self->_categoryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryText, 0);
  objc_storeStrong((id *)&self->_lastBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_firstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_tokenLabel, 0);
  objc_storeStrong((id *)&self->_tokenView, 0);
}

@end
