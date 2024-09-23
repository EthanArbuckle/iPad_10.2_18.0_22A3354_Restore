@implementation MFMessageInfoHeaderSectionView

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MFMessageInfoHeaderSectionViewIdentifier");
}

- (MFMessageInfoHeaderSectionView)initWithFrame:(CGRect)a3
{
  MFMessageInfoHeaderSectionView *v3;
  MFMessageInfoHeaderSectionView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UILabel *v9;
  UILabel *seeAllButton;
  uint64_t v11;
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
  objc_super v24;
  _QWORD v25[2];

  v24.receiver = self;
  v24.super_class = (Class)MFMessageInfoHeaderSectionView;
  v3 = -[MFMessageInfoHeaderSectionView initWithFrame:](&v24, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoHeaderSectionView defaultContentConfiguration](v3, "defaultContentConfiguration"));
    if (_os_feature_enabled_impl("Mail", "AttachmentsSharedWithYou"))
      v6 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textProperties"));
    objc_msgSend(v8, "setFont:", v7);

    -[MFMessageInfoHeaderSectionView setContentConfiguration:](v4, "setContentConfiguration:", v5);
    v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    seeAllButton = v4->_seeAllButton;
    v4->_seeAllButton = v9;

    v11 = _EFLocalizedString(CFSTR("See All"), &unk_100043890, &unk_100043898);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[UILabel setText:](v4->_seeAllButton, "setText:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UILabel setTextColor:](v4->_seeAllButton, "setTextColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
    -[UILabel setFont:](v4->_seeAllButton, "setFont:", v14);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_seeAllButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setUserInteractionEnabled:](v4->_seeAllButton, "setUserInteractionEnabled:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoHeaderSectionView contentView](v4, "contentView"));
    objc_msgSend(v15, "addSubview:", v4->_seeAllButton);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_seeAllButton, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoHeaderSectionView trailingAnchor](v4, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -15.0));
    v25[0] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_seeAllButton, "centerYAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageInfoHeaderSectionView centerYAnchor](v4, "centerYAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
    v25[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

  }
  return v4;
}

- (UILabel)seeAllButton
{
  return self->_seeAllButton;
}

- (void)setSeeAllButton:(id)a3
{
  objc_storeStrong((id *)&self->_seeAllButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seeAllButton, 0);
}

@end
