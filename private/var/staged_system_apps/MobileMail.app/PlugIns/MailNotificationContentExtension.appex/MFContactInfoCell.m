@implementation MFContactInfoCell

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MFContactInfoCellIdentifier");
}

- (MFContactInfoCell)initWithFrame:(CGRect)a3
{
  MFContactInfoCell *v3;
  MFAvatarView *v4;
  MFAvatarView *avatarView;
  UILabel *v6;
  UILabel *contactLabel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  void *v48;
  void *v49;
  id v50;
  objc_super v51;
  _QWORD v52[9];

  v51.receiver = self;
  v51.super_class = (Class)MFContactInfoCell;
  v3 = -[MFContactInfoCell initWithFrame:](&v51, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[MFAvatarView initWithFrame:]([MFAvatarView alloc], "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
    avatarView = v3->_avatarView;
    v3->_avatarView = v4;

    -[MFAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v3->_avatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    contactLabel = v3->_contactLabel;
    v3->_contactLabel = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v3->_contactLabel, "setFont:", v8);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_contactLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFContactInfoCell contentView](v3, "contentView"));
    objc_msgSend(v9, "addSubview:", v3->_avatarView);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFContactInfoCell contentView](v3, "contentView"));
    objc_msgSend(v10, "addSubview:", v3->_contactLabel);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFContactInfoCell contentView](v3, "contentView"));
    objc_msgSend(v12, "setBackgroundColor:", v11);

    v13 = objc_alloc((Class)UIImageView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphExpandContact));
    v50 = objc_msgSend(v13, "initWithImage:", v14);

    objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    objc_msgSend(v50, "setTintColor:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFContactInfoCell contentView](v3, "contentView"));
    objc_msgSend(v16, "addSubview:", v50);

    -[MFContactInfoCell setChevronView:](v3, "setChevronView:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView leadingAnchor](v3->_avatarView, "leadingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MFContactInfoCell contentView](v3, "contentView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", 20.0));
    v52[0] = v41;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView bottomAnchor](v3->_avatarView, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MFContactInfoCell contentView](v3, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", -20.0));
    v52[1] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView widthAnchor](v3->_avatarView, "widthAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToConstant:", 32.0));
    v52[2] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView heightAnchor](v3->_avatarView, "heightAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:", 32.0));
    v52[3] = v34;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView topAnchor](v3->_avatarView, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MFContactInfoCell contentView](v3, "contentView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", 20.0));
    v52[4] = v31;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_contactLabel, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView trailingAnchor](v3->_avatarView, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", 20.0));
    v52[5] = v29;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v3->_contactLabel, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MFContactInfoCell contentView](v3, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "centerYAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:"));
    v52[6] = v26;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v3->_chevronView, "centerYAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFContactInfoCell contentView](v3, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v18));
    v52[7] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v3->_chevronView, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFContactInfoCell contentView](v3, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, -20.0));
    v52[8] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 9));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

  }
  return v3;
}

- (MFAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UILabel)contactLabel
{
  return self->_contactLabel;
}

- (void)setContactLabel:(id)a3
{
  objc_storeStrong((id *)&self->_contactLabel, a3);
}

- (UIImageView)chevronView
{
  return self->_chevronView;
}

- (void)setChevronView:(id)a3
{
  objc_storeStrong((id *)&self->_chevronView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_contactLabel, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
