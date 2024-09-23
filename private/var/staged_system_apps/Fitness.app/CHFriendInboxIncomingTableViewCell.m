@implementation CHFriendInboxIncomingTableViewCell

- (void)_setupCell
{
  void *v3;
  UIView *v4;
  UIView *insetContentView;
  void *v6;
  UIImageView *v7;
  UIImageView *avatarImageView;
  UILabel *v9;
  UILabel *friendName;
  UIButton *v11;
  UIButton *declineButton;
  UIButton *v13;
  void *v14;
  void *v15;
  UIButton *v16;
  void *v17;
  UIButton *v18;
  UIButton *acceptButton;
  UIButton *v20;
  void *v21;
  void *v22;
  UIButton *v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[CHFriendInboxIncomingTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[CHFriendInboxIncomingTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
  v4 = (UIView *)objc_alloc_init((Class)UIView);
  insetContentView = self->_insetContentView;
  self->_insetContentView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_insetContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxIncomingTableViewCell contentView](self, "contentView"));
  objc_msgSend(v6, "addSubview:", self->_insetContentView);

  v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  avatarImageView = self->_avatarImageView;
  self->_avatarImageView = v7;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_avatarImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_insetContentView, "addSubview:", self->_avatarImageView);
  v9 = (UILabel *)objc_alloc_init((Class)UILabel);
  friendName = self->_friendName;
  self->_friendName = v9;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_friendName, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_insetContentView, "addSubview:", self->_friendName);
  v11 = (UIButton *)objc_alloc_init((Class)UIButton);
  declineButton = self->_declineButton;
  self->_declineButton = v11;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_declineButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = self->_declineButton;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SHARING_INVITE_DECLINE"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[UIButton setTitle:forState:](v13, "setTitle:forState:", v15, 0);

  v16 = self->_declineButton;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UIButton _setFont:](v16, "_setFont:", v17);

  -[UIButton addTarget:action:forControlEvents:](self->_declineButton, "addTarget:action:forControlEvents:", self, "_highlighted", 4095);
  -[UIButton addTarget:action:forControlEvents:](self->_declineButton, "addTarget:action:forControlEvents:", self, "_declinePressed", 64);
  -[UIView addSubview:](self->_insetContentView, "addSubview:", self->_declineButton);
  v18 = (UIButton *)objc_alloc_init((Class)UIButton);
  acceptButton = self->_acceptButton;
  self->_acceptButton = v18;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_acceptButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = self->_acceptButton;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SHARING_INVITE_ACCEPT"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[UIButton setTitle:forState:](v20, "setTitle:forState:", v22, 0);

  v23 = self->_acceptButton;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UIButton _setFont:](v23, "_setFont:", v24);

  -[UIButton addTarget:action:forControlEvents:](self->_acceptButton, "addTarget:action:forControlEvents:", self, "_acceptPressed", 64);
  -[UIButton addTarget:action:forControlEvents:](self->_acceptButton, "addTarget:action:forControlEvents:", self, "_highlighted", 4095);
  -[UIView addSubview:](self->_insetContentView, "addSubview:", self->_acceptButton);
}

- (CHFriendInboxIncomingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHFriendInboxIncomingTableViewCell *v4;
  CHFriendInboxIncomingTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHFriendInboxIncomingTableViewCell;
  v4 = -[CHFriendInboxIncomingTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[CHFriendInboxIncomingTableViewCell _setupCell](v4, "_setupCell");
  return v5;
}

- (CHFriendInboxIncomingTableViewCell)initWithFrame:(CGRect)a3
{
  CHFriendInboxIncomingTableViewCell *v3;
  CHFriendInboxIncomingTableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHFriendInboxIncomingTableViewCell;
  v3 = -[CHFriendInboxIncomingTableViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CHFriendInboxIncomingTableViewCell _setupCell](v3, "_setupCell");
  return v4;
}

- (void)_declinePressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHFriendInboxIncomingTableViewCell delegate](self, "delegate"));
  objc_msgSend(v3, "incomingTableViewCellDidTapIgnore:", self);

}

- (void)_acceptPressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CHFriendInboxIncomingTableViewCell delegate](self, "delegate"));
  objc_msgSend(v3, "incomingTableViewCellDidTapAccept:", self);

}

+ (double)preferredHeight
{
  return UITableViewAutomaticDimension;
}

- (void)setFriend:(id)a3
{
  ASFriend **p_friend;
  id v6;
  void *v7;
  void *v8;

  p_friend = &self->_friend;
  objc_storeStrong((id *)&self->_friend, a3);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASFriend fullName](*p_friend, "fullName"));
  -[UILabel setText:](self->_friendName, "setText:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CHActivitySharingAvatarProvider fetchAvatarImageForFriend:diameter:](CHActivitySharingAvatarProvider, "fetchAvatarImageForFriend:diameter:", v6, 30.0));
  -[UIImageView setImage:](self->_avatarImageView, "setImage:", v8);

  -[CHFriendInboxIncomingTableViewCell _addLayoutConstraints](self, "_addLayoutConstraints");
  -[CHFriendInboxIncomingTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_isVerticalCell
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  sub_100032C10();
  v4 = v3;
  v6 = v5;
  -[UILabel systemLayoutSizeFittingSize:](self->_friendName, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  v8 = v7;
  -[UIButton systemLayoutSizeFittingSize:](self->_declineButton, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  v10 = v9;
  -[UIButton systemLayoutSizeFittingSize:](self->_acceptButton, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  v12 = v11;
  -[UIImageView systemLayoutSizeFittingSize:](self->_avatarImageView, "systemLayoutSizeFittingSize:", 1.79769313e308, 1.79769313e308);
  v14 = v6 + v12 + v10 + v4 + 16.0 + v13 + 3.0 + 20.0 + 20.0 + 16.0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v15, "bounds");
  v17 = v16 - v14;

  return v8 > v17;
}

- (void)_addLayoutConstraints
{
  uint64_t v3;
  void *v4;
  NSArray *v5;
  NSArray *activeConstraints;
  id v7;

  if (self->_activeConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  if (-[CHFriendInboxIncomingTableViewCell _isVerticalCell](self, "_isVerticalCell"))
    v3 = objc_claimAutoreleasedReturnValue(-[CHFriendInboxIncomingTableViewCell _verticalConstraints](self, "_verticalConstraints"));
  else
    v3 = objc_claimAutoreleasedReturnValue(-[CHFriendInboxIncomingTableViewCell _horizontalConstraints](self, "_horizontalConstraints"));
  v7 = (id)v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxIncomingTableViewCell _commonConstraints](self, "_commonConstraints"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v7));
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v5;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_activeConstraints);
}

- (id)_commonConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  id v19;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[9];

  v3 = sub_100032C10();
  v5 = v4;
  v7 = v6;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_insetContentView, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxIncomingTableViewCell contentView](self, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, v3));
  v39[0] = v35;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_insetContentView, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxIncomingTableViewCell contentView](self, "contentView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, v5));
  v39[1] = v31;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_insetContentView, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxIncomingTableViewCell contentView](self, "contentView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, v7));
  v39[2] = v27;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_insetContentView, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendInboxIncomingTableViewCell contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, v7));
  v39[3] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_avatarImageView, "widthAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToConstant:", 30.0));
  v39[4] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_avatarImageView, "heightAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", 30.0));
  v39[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_avatarImageView, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_insetContentView, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 3.0));
  v39[6] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_friendName, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_avatarImageView, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 20.0));
  v39[7] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_friendName, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_insetContentView, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 5.0));
  v39[8] = v17;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 9));

  return v19;
}

- (id)_verticalConstraints
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
  id v14;
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
  void *v30;
  void *v31;
  _QWORD v32[9];

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_avatarImageView, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_insetContentView, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 20.0));
  v32[0] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_avatarImageView, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_insetContentView, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, -20.0));
  v32[1] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_declineButton, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_friendName, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v32[2] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_declineButton, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_friendName, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v32[3] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_acceptButton, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_declineButton, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v32[4] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_acceptButton, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_declineButton, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v15, -5.0));
  v32[5] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_acceptButton, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_insetContentView, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, -5.0));
  v32[6] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_acceptButton, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_declineButton, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v32[7] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_acceptButton, "widthAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_declineButton, "widthAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v32[8] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 9));

  return v14;
}

- (id)_horizontalConstraints
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
  _QWORD v26[7];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_avatarImageView, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_insetContentView, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 5.0));
  v26[0] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_avatarImageView, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_insetContentView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 5.0));
  v26[1] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_avatarImageView, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_avatarImageView, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v26[2] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_declineButton, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_friendName, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v26[3] = v14;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_acceptButton, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_declineButton, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 24.0));
  v26[4] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_acceptButton, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_insetContentView, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -5.0));
  v26[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_acceptButton, "centerYAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_friendName, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v26[6] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 7));

  return v12;
}

- (void)setAcceptTintColor:(id)a3
{
  -[CHFriendInboxIncomingTableViewCell _setTintColor:forButton:](self, "_setTintColor:forButton:", a3, self->_acceptButton);
}

- (void)setIgnoreTintColor:(id)a3
{
  -[CHFriendInboxIncomingTableViewCell _setTintColor:forButton:](self, "_setTintColor:forButton:", a3, self->_declineButton);
}

- (void)_setTintColor:(id)a3 forButton:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "setTitleColor:forState:", v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.3));

  objc_msgSend(v5, "setTitleColor:forState:", v7, 1);
}

- (CHFriendInboxIncomingTableViewCellDelegate)delegate
{
  return (CHFriendInboxIncomingTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ASFriend)friend
{
  return self->_friend;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friend, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_declineButton, 0);
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_storeStrong((id *)&self->_friendName, 0);
  objc_storeStrong((id *)&self->_insetContentView, 0);
}

@end
