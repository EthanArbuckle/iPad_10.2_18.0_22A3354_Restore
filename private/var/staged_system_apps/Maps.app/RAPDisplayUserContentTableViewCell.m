@implementation RAPDisplayUserContentTableViewCell

- (RAPDisplayUserContentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPDisplayUserContentTableViewCell *v4;
  RAPDisplayUserContentTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RAPDisplayUserContentTableViewCell;
  v4 = -[RAPDisplayUserContentTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[RAPDisplayUserContentTableViewCell _configureViews](v4, "_configureViews");
    -[RAPDisplayUserContentTableViewCell _retrieveUserInformation](v5, "_retrieveUserInformation");
  }
  return v5;
}

- (void)_configureViews
{
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *userNameLabel;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *userEmailLabel;
  void *v13;
  void *v14;
  id v15;
  UILabel *v16;
  void *v17;
  UIStackView *v18;
  UIStackView *labelsStackView;
  UIImageView *v20;
  UIImageView *userImageView;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[8];
  _QWORD v49[2];

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  userNameLabel = self->_userNameLabel;
  self->_userNameLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_userNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_userNameLabel, "setNumberOfLines:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager userInfoTableViewCellPrimaryLabelFont](RAPFontManager, "userInfoTableViewCellPrimaryLabelFont"));
  -[UILabel setFont:](self->_userNameLabel, "setFont:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_userNameLabel, "setTextColor:", v10);

  v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  userEmailLabel = self->_userEmailLabel;
  self->_userEmailLabel = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_userEmailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_userEmailLabel, "setNumberOfLines:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager userInfoTableViewCellSecondaryLabelFont](RAPFontManager, "userInfoTableViewCellSecondaryLabelFont"));
  -[UILabel setFont:](self->_userEmailLabel, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_userEmailLabel, "setTextColor:", v14);

  v15 = objc_alloc((Class)UIStackView);
  v16 = self->_userEmailLabel;
  v49[0] = self->_userNameLabel;
  v49[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 2));
  v18 = (UIStackView *)objc_msgSend(v15, "initWithArrangedSubviews:", v17);
  labelsStackView = self->_labelsStackView;
  self->_labelsStackView = v18;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_labelsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_labelsStackView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_labelsStackView, "setSpacing:", 0.0);
  v20 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  userImageView = self->_userImageView;
  self->_userImageView = v20;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_userImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDisplayUserContentTableViewCell contentView](self, "contentView"));
  objc_msgSend(v22, "addSubview:", self->_labelsStackView);
  objc_msgSend(v22, "addSubview:", self->_userImageView);
  if (sub_1002A8AA0(self) == 5)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    objc_msgSend(v22, "setBackgroundColor:", v23);

  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_userImageView, "widthAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToConstant:", 36.0));
  v48[0] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_userImageView, "heightAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_userImageView, "widthAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v48[1] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_userImageView, "centerYAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerYAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v48[2] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_userImageView, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 15.0));
  v48[3] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_labelsStackView, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_userImageView, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 6.0));
  v48[4] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_labelsStackView, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:constant:", v32, -15.0));
  v48[5] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_labelsStackView, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:constant:", v26, 15.0));
  v48[6] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_labelsStackView, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -15.0));
  v48[7] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

  -[RAPDisplayUserContentTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
}

- (void)_retrieveUserInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[GEOUserAccountInfo primaryICloudAccount](GEOUserAccountInfo, "primaryICloudAccount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userName"));
    -[UILabel setText:](self->_userNameLabel, "setText:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userEmail"));
    -[UILabel setText:](self->_userEmailLabel, "setText:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userIcon"));
    -[UIImageView setImage:](self->_userImageView, "setImage:", v6);

  }
}

- (void)setNameString:(id)a3
{
  -[UILabel setText:](self->_userNameLabel, "setText:", a3);
}

- (NSString)nameString
{
  return -[UILabel text](self->_userNameLabel, "text");
}

- (void)setEmailString:(id)a3
{
  -[UILabel setText:](self->_userEmailLabel, "setText:", a3);
}

- (NSString)emailString
{
  return -[UILabel text](self->_userEmailLabel, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_userImageView, 0);
  objc_storeStrong((id *)&self->_userEmailLabel, 0);
  objc_storeStrong((id *)&self->_userNameLabel, 0);
}

@end
