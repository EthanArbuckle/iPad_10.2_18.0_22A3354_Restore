@implementation CHRecipientTableViewCell

- (CHRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHRecipientTableViewCell *v4;
  CHRecipientTableViewCell *v5;
  void *v6;
  void *v7;
  CNAvatarViewController *v8;
  CNAvatarViewController *avatarViewController;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CHRecipientTableViewCell;
  v4 = -[CHRecipientTableViewCell initWithStyle:reuseIdentifier:](&v14, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell _autocompleteSharedContactStore](v4, "_autocompleteSharedContactStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNAvatarViewControllerSettings settingsWithContactStore:threeDTouchEnabled:](CNAvatarViewControllerSettings, "settingsWithContactStore:threeDTouchEnabled:", v6, 0));
    v8 = (CNAvatarViewController *)objc_msgSend(objc_alloc((Class)CNAvatarViewController), "initWithSettings:", v7);
    avatarViewController = v5->_avatarViewController;
    v5->_avatarViewController = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNAvatarViewController view](v5->_avatarViewController, "view"));
    -[CHRecipientTableViewCell _requireIntrinsicSizeForView:](v5, "_requireIntrinsicSizeForView:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell containerView](v5, "containerView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CNAvatarViewController view](v5->_avatarViewController, "view"));
    objc_msgSend(v11, "insertArrangedSubview:atIndex:", v12, 0);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CHRecipientTableViewCell;
  -[CHRecipientTableViewCell layoutSubviews](&v19, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v10, "setFrame:", 65.0, v5, v7, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v18, "setFrame:", 65.0, v13, v15, v17);

}

+ (id)identifier
{
  return CFSTR("CHRecipientTableViewCell");
}

- (void)setRecipient:(id)a3
{
  CNComposeRecipient *v4;
  CNComposeRecipient *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = (CNComposeRecipient *)a3;
  v5 = v4;
  if (self->_recipient != v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipient displayString](v4, "displayString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v7, "setText:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v9, "setTextColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell textLabel](self, "textLabel"));
    objc_msgSend(v10, "setMaximumContentSizeCategory:", UIContentSizeCategoryExtraLarge);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipient displayString](v5, "displayString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipient address](v5, "address"));
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if ((v13 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipient address](v5, "address"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell detailTextLabel](self, "detailTextLabel"));
      objc_msgSend(v15, "setText:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell detailTextLabel](self, "detailTextLabel"));
      objc_msgSend(v17, "setTextColor:", v16);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell detailTextLabel](self, "detailTextLabel"));
      objc_msgSend(v18, "setMaximumContentSizeCategory:", UIContentSizeCategoryExtraLarge);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CNComposeRecipient contact](v5, "contact"));
    v20 = v19;
    if (v19)
      v21 = v19;
    else
      v21 = (id)objc_claimAutoreleasedReturnValue(-[CHRecipientTableViewCell _emptyContact](self, "_emptyContact"));
    v22 = v21;

    v24 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    -[CNAvatarViewController setContacts:](self->_avatarViewController, "setContacts:", v23);

  }
}

+ (Class)containerViewClass
{
  return (Class)objc_opt_class(NUIContainerStackView, a2);
}

- (void)_requireIntrinsicSizeForView:(id)a3
{
  double v3;
  double v4;
  id v5;

  v5 = a3;
  LODWORD(v3) = 1148846080;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 0, v3);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 0, v4);

}

- (id)_autocompleteSharedContactStore
{
  if (qword_10083E108 != -1)
    dispatch_once(&qword_10083E108, &stru_10077A238);
  return (id)qword_10083E100;
}

- (id)_emptyContact
{
  if (qword_10083E118 != -1)
    dispatch_once(&qword_10083E118, &stru_10077A258);
  return (id)qword_10083E110;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
