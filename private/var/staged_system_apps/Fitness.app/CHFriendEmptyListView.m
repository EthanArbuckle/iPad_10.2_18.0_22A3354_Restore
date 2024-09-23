@implementation CHFriendEmptyListView

- (CHFriendEmptyListView)initWithOutgoingInvites:(unint64_t)a3
{
  double y;
  double width;
  double height;
  CHFriendEmptyListView *v7;
  UILabel *v8;
  UILabel *titleLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *descriptionLabel;
  void *v16;
  void *v17;
  void *v18;
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
  void *v48;
  void *v49;
  objc_super v50;
  _QWORD v51[9];

  v50.receiver = self;
  v50.super_class = (Class)CHFriendEmptyListView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[CHFriendEmptyListView initWithFrame:](&v50, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v7)
  {
    v8 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v7->titleLabel;
    v7->titleLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SHARING_SETUP_TITLE"), &stru_1007AE1D0, CFSTR("Localizable")));
    -[UILabel setText:](v7->titleLabel, "setText:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v7->titleLabel, "setTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle1));
    -[UILabel setFont:](v7->titleLabel, "setFont:", v13);

    -[UILabel setNumberOfLines:](v7->titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v7->titleLabel, "setTextAlignment:", 1);
    -[CHFriendEmptyListView addSubview:](v7, "addSubview:", v7->titleLabel);
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    descriptionLabel = v7->descriptionLabel;
    v7->descriptionLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendEmptyListView _descriptionForOutgoingInvites:](v7, "_descriptionForOutgoingInvites:", a3));
    -[UILabel setText:](v7->descriptionLabel, "setText:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v7->descriptionLabel, "setTextColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v7->descriptionLabel, "setFont:", v18);

    -[UILabel setNumberOfLines:](v7->descriptionLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v7->descriptionLabel, "setTextAlignment:", 1);
    -[CHFriendEmptyListView addSubview:](v7, "addSubview:", v7->descriptionLabel);
    v19 = objc_alloc_init((Class)UILayoutGuide);
    -[CHFriendEmptyListView addLayoutGuide:](v7, "addLayoutGuide:", v19);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v7->titleLabel, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v51[0] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendEmptyListView centerYAnchor](v7, "centerYAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
    v51[1] = v44;
    v40 = v19;
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "heightAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v7->titleLabel, "heightAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
    v51[2] = v41;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v7->titleLabel, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendEmptyListView leadingAnchor](v7, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 8.0));
    v51[3] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v7->titleLabel, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendEmptyListView trailingAnchor](v7, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, -8.0));
    v51[4] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v7->titleLabel, "centerYAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
    v51[5] = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v7->descriptionLabel, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v7->titleLabel, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v20, 10.0));
    v51[6] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v7->descriptionLabel, "widthAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendEmptyListView widthAnchor](v7, "widthAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:multiplier:", v23, 0.75));
    v51[7] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v7->descriptionLabel, "centerXAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CHFriendEmptyListView centerXAnchor](v7, "centerXAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    v51[8] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 9));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  }
  return v7;
}

- (void)updateOutgoingInvites:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CHFriendEmptyListView _descriptionForOutgoingInvites:](self, "_descriptionForOutgoingInvites:", a3));
  -[UILabel setText:](self->descriptionLabel, "setText:", v4);

}

- (id)_descriptionForOutgoingInvites:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (a3)
    v6 = CFSTR("SHARING_LIST_PENDING");
  else
    v6 = CFSTR("SHARING_LIST_EMPTY");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1007AE1D0, CFSTR("Localizable")));

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->descriptionLabel, 0);
  objc_storeStrong((id *)&self->titleLabel, 0);
}

@end
