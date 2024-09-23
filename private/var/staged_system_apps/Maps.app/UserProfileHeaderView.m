@implementation UserProfileHeaderView

- (UserProfileHeaderView)initWithFrame:(CGRect)a3
{
  UserProfileHeaderView *v3;
  UserProfileHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UserProfileHeaderView;
  v3 = -[UserProfileHeaderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UserProfileHeaderView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("UserProfileHeader"));
    -[UserProfileHeaderView _setupViews](v4, "_setupViews");
    -[UserProfileHeaderView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupViews
{
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *userNameLabel;
  uint64_t v9;
  id *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *userEmailLabel;
  void *v18;
  id v19;
  UILabel *v20;
  void *v21;
  UIStackView *v22;
  UIStackView *userInfoLabelsStackView;
  UIImageView *v24;
  UIImageView *userImageView;
  void *v26;
  _QWORD v27[2];

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  userNameLabel = self->_userNameLabel;
  self->_userNameLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_userNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = sub_1002A8AA0(self);
  v10 = (id *)&UIFontTextStyleTitle3;
  if (v9 != 5)
    v10 = (id *)&UIFontTextStyleTitle2;
  v11 = *v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", 2));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v13, 0.0));
  -[UILabel setFont:](self->_userNameLabel, "setFont:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_userNameLabel, "setTextColor:", v15);

  -[UILabel setAccessibilityIdentifier:](self->_userNameLabel, "setAccessibilityIdentifier:", CFSTR("UserNameLabel"));
  v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  userEmailLabel = self->_userEmailLabel;
  self->_userEmailLabel = v16;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_userEmailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setLineBreakMode:](self->_userEmailLabel, "setLineBreakMode:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_userEmailLabel, "setFont:", v18);

  -[UILabel setAccessibilityIdentifier:](self->_userEmailLabel, "setAccessibilityIdentifier:", CFSTR("UserEmailButton"));
  v19 = objc_alloc((Class)UIStackView);
  v20 = self->_userEmailLabel;
  v27[0] = self->_userNameLabel;
  v27[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
  v22 = (UIStackView *)objc_msgSend(v19, "initWithArrangedSubviews:", v21);
  userInfoLabelsStackView = self->_userInfoLabelsStackView;
  self->_userInfoLabelsStackView = v22;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_userInfoLabelsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_userInfoLabelsStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_userInfoStackView, "setAlignment:", 1);
  -[UIStackView setSpacing:](self->_userInfoLabelsStackView, "setSpacing:", 0.0);
  -[UIStackView setAccessibilityIdentifier:](self->_userInfoLabelsStackView, "setAccessibilityIdentifier:", CFSTR("UserInfoLabelsStack"));
  v24 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  userImageView = self->_userImageView;
  self->_userImageView = v24;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_userImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[UIImageView setTintColor:](self->_userImageView, "setTintColor:", v26);

  -[UIImageView setAccessibilityIdentifier:](self->_userImageView, "setAccessibilityIdentifier:", CFSTR("UserImageView"));
  -[UserProfileHeaderView addSubview:](self, "addSubview:", self->_userImageView);
  -[UserProfileHeaderView addSubview:](self, "addSubview:", self->_userInfoLabelsStackView);

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
  _QWORD v30[9];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_userImageView, "widthAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToConstant:", 48.0));
  v30[0] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_userImageView, "heightAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_userImageView, "widthAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v30[1] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_userImageView, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileHeaderView topAnchor](self, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 16.0));
  v30[2] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_userImageView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileHeaderView leadingAnchor](self, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 24.0));
  v30[3] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_userImageView, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_userInfoLabelsStackView, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, -10.0));
  v30[4] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_userInfoLabelsStackView, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileHeaderView topAnchor](self, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, 16.0));
  v30[5] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_userInfoLabelsStackView, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_userImageView, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 10.0));
  v30[6] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_userInfoLabelsStackView, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileHeaderView trailingAnchor](self, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -0.0));
  v30[7] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_userInfoLabelsStackView, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileHeaderView bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -16.0));
  v30[8] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)headerViewLinkTapped:(id)a3
{
  UserProfileHeaderViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector(WeakRetained, "headerViewLinkTapped:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "headerViewLinkTapped:", self);

  }
}

- (void)setUserName:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_userName != v5)
  {
    objc_storeStrong((id *)&self->_userName, a3);
    -[UILabel setText:](self->_userNameLabel, "setText:", v5);
  }

}

- (void)setUserEmail:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_userEmail != v5)
  {
    objc_storeStrong((id *)&self->_userEmail, a3);
    -[UILabel setText:](self->_userEmailLabel, "setText:", v5);
    -[UserProfileHeaderView _adjustEmailButtonState](self, "_adjustEmailButtonState");
  }

}

- (void)setUserIcon:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_userIcon != v5)
  {
    objc_storeStrong((id *)&self->_userIcon, a3);
    -[UIImageView setImage:](self->_userImageView, "setImage:", v5);
  }

}

- (void)_adjustEmailButtonState
{
  void *v3;
  unsigned int v4;
  UILabel *userEmailLabel;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "headerViewLinkTapped:");
  objc_msgSend(v8, "setNumberOfTapsRequired:", 1);
  -[UILabel addGestureRecognizer:](self->_userEmailLabel, "addGestureRecognizer:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  v4 = objc_msgSend(v3, "loggedIn");

  userEmailLabel = self->_userEmailLabel;
  if (v4)
  {
    -[UILabel setUserInteractionEnabled:](userEmailLabel, "setUserInteractionEnabled:", 0);
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  }
  else
  {
    -[UILabel setUserInteractionEnabled:](userEmailLabel, "setUserInteractionEnabled:", 1);
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  }
  v7 = (void *)v6;
  -[UILabel setTextColor:](self->_userEmailLabel, "setTextColor:", v6);

}

- (void)_updateFonts
{
  uint64_t v3;
  const UIFontTextStyle *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = sub_1002A8AA0(self);
  v4 = &UIFontTextStyleTitle3;
  if (v3 != 5)
    v4 = &UIFontTextStyleTitle2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", *v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6, 0.0));
  -[UILabel setFont:](self->_userNameLabel, "setFont:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_userEmailLabel, "setFont:", v8);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UserProfileHeaderView;
  v4 = a3;
  -[UserProfileHeaderView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UserProfileHeaderView traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = UIContentSizeCategoryCompareToCategory(v6, v7);
  if (v8)
    -[UserProfileHeaderView _updateFonts](self, "_updateFonts");
}

- (NSString)userName
{
  return self->_userName;
}

- (NSString)userEmail
{
  return self->_userEmail;
}

- (UIImage)userIcon
{
  return self->_userIcon;
}

- (UIImageView)userImageView
{
  return self->_userImageView;
}

- (UserProfileHeaderViewDelegate)delegate
{
  return (UserProfileHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userImageView, 0);
  objc_storeStrong((id *)&self->_userIcon, 0);
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_userInfoStackView, 0);
  objc_storeStrong((id *)&self->_userInfoLabelsStackView, 0);
  objc_storeStrong((id *)&self->_userEmailLabel, 0);
  objc_storeStrong((id *)&self->_userNameLabel, 0);
}

@end
