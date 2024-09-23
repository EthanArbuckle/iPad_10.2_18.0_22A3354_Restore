@implementation WFKnownNetworkListTableViewCell

- (WFKnownNetworkListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFKnownNetworkListTableViewCell *v4;
  UIImageView *v5;
  UIImageView *lockImageView;
  void *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *networkNameLabel;
  UILabel *v19;
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
  double v35;
  double v36;
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
  uint64_t v48;
  NSLayoutConstraint *normalLeadingConstraints;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSLayoutConstraint *extraLeadingConstraints;
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)WFKnownNetworkListTableViewCell;
  v4 = -[WFKnownNetworkListTableViewCell initWithStyle:reuseIdentifier:](&v56, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    lockImageView = v4->_lockImageView;
    v4->_lockImageView = v5;

    +[WFImageCache sharedImageCache](WFImageCache, "sharedImageCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:", CFSTR("Lock"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v4->_lockImageView, "setImage:", v9);

    v10 = v4->_lockImageView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v10, "setTintColor:", v11);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_lockImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFKnownNetworkListTableViewCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_lockImageView);

    -[UIImageView trailingAnchor](v4->_lockImageView, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFKnownNetworkListTableViewCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    v17 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    networkNameLabel = v4->_networkNameLabel;
    v4->_networkNameLabel = v17;

    -[UILabel setNumberOfLines:](v4->_networkNameLabel, "setNumberOfLines:", 0);
    v19 = v4->_networkNameLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "defaultTextColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTintColor:](v19, "setTintColor:", v20);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_networkNameLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_networkNameLabel, "setFont:", v21);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_networkNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFKnownNetworkListTableViewCell contentView](v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v4->_networkNameLabel);

    -[UIImageView centerYAnchor](v4->_lockImageView, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFKnownNetworkListTableViewCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[UILabel centerYAnchor](v4->_networkNameLabel, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFKnownNetworkListTableViewCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    -[UILabel trailingAnchor](v4->_networkNameLabel, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v4->_lockImageView, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    -[UILabel font](v4->_networkNameLabel, "font");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_bodyLeading");
    v36 = v35 + -8.0;

    -[UILabel topAnchor](v4->_networkNameLabel, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFKnownNetworkListTableViewCell contentView](v4, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    -[UILabel bottomAnchor](v4->_networkNameLabel, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFKnownNetworkListTableViewCell contentView](v4, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v43, -v36);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

    -[UILabel leadingAnchor](v4->_networkNameLabel, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFKnownNetworkListTableViewCell contentView](v4, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47, 10.0);
    v48 = objc_claimAutoreleasedReturnValue();
    normalLeadingConstraints = v4->_normalLeadingConstraints;
    v4->_normalLeadingConstraints = (NSLayoutConstraint *)v48;

    -[NSLayoutConstraint setActive:](v4->_normalLeadingConstraints, "setActive:", 1);
    v4->_showLock = 1;
    -[UILabel leadingAnchor](v4->_networkNameLabel, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFKnownNetworkListTableViewCell contentView](v4, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, 50.0);
    v53 = objc_claimAutoreleasedReturnValue();
    extraLeadingConstraints = v4->_extraLeadingConstraints;
    v4->_extraLeadingConstraints = (NSLayoutConstraint *)v53;

  }
  return v4;
}

- (void)setNetworkName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFKnownNetworkListTableViewCell networkNameLabel](self, "networkNameLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setShowLock:(BOOL)a3
{
  -[UIImageView setHidden:](self->_lockImageView, "setHidden:", !a3);
}

- (void)setHasLeadingPadding:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[NSLayoutConstraint setActive:](self->_extraLeadingConstraints, "setActive:");
  -[NSLayoutConstraint setActive:](self->_normalLeadingConstraints, "setActive:", !v3);
  -[WFKnownNetworkListTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)networkName
{
  return self->_networkName;
}

- (BOOL)showLock
{
  return self->_showLock;
}

- (BOOL)hasLeadingPadding
{
  return self->_hasLeadingPadding;
}

- (UILabel)networkNameLabel
{
  return self->_networkNameLabel;
}

- (void)setNetworkNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_networkNameLabel, a3);
}

- (UIImageView)lockImageView
{
  return self->_lockImageView;
}

- (void)setLockImageView:(id)a3
{
  objc_storeStrong((id *)&self->_lockImageView, a3);
}

- (NSLayoutConstraint)extraLeadingConstraints
{
  return self->_extraLeadingConstraints;
}

- (void)setExtraLeadingConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_extraLeadingConstraints, a3);
}

- (NSLayoutConstraint)normalLeadingConstraints
{
  return self->_normalLeadingConstraints;
}

- (void)setNormalLeadingConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_normalLeadingConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalLeadingConstraints, 0);
  objc_storeStrong((id *)&self->_extraLeadingConstraints, 0);
  objc_storeStrong((id *)&self->_lockImageView, 0);
  objc_storeStrong((id *)&self->_networkNameLabel, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

@end
