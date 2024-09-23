@implementation VUIAppInstallLockup

- (VUIAppInstallLockup)initWithFrame:(CGRect)a3
{
  VUIAppInstallLockup *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *nameLabel;
  UILabel *v11;
  void *v12;
  uint64_t v13;
  UILabel *subtitleLabel;
  UILabel *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  UILabel *iAPLabel;
  UILabel *v21;
  void *v22;
  uint64_t v23;
  UILabel *ageRatingLabel;
  UILabel *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)VUIAppInstallLockup;
  v3 = -[VUIAppInstallLockup initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = (UILabel *)v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_nameLabel, "setNumberOfLines:", 1);
    v11 = v3->_nameLabel;
    objc_msgSend(CFSTR("UIA.TV.Text."), "stringByAppendingString:", CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", v12);

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 1);
    v15 = v3->_subtitleLabel;
    objc_msgSend(CFSTR("UIA.TV.Text."), "stringByAppendingString:", CFSTR("subtitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", v16);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    if (v18 == 2)
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
      iAPLabel = v3->_iAPLabel;
      v3->_iAPLabel = (UILabel *)v19;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_iAPLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setNumberOfLines:](v3->_iAPLabel, "setNumberOfLines:", 1);
      v21 = v3->_iAPLabel;
      objc_msgSend(CFSTR("UIA.TV.Text."), "stringByAppendingString:", CFSTR("inAppPurchases"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAccessibilityIdentifier:](v21, "setAccessibilityIdentifier:", v22);

      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
      ageRatingLabel = v3->_ageRatingLabel;
      v3->_ageRatingLabel = (UILabel *)v23;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_ageRatingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setNumberOfLines:](v3->_ageRatingLabel, "setNumberOfLines:", 1);
      v25 = v3->_ageRatingLabel;
      objc_msgSend(CFSTR("UIA.TV.Text."), "stringByAppendingString:", CFSTR("ageRating"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAccessibilityIdentifier:](v25, "setAccessibilityIdentifier:", v26);

      -[VUIAppInstallLockup _layoutForTvos](v3, "_layoutForTvos");
    }
    else
    {
      -[VUIAppInstallLockup _layoutForIos](v3, "_layoutForIos");
    }
    -[VUIAppInstallLockup _configureLabels](v3, "_configureLabels");
  }
  return v3;
}

- (void)_layoutForTvos
{
  id v3;
  void *v4;
  UIStackView *v5;
  UIStackView *nameAndRatingStack;
  id v7;
  UILabel *ageRatingLabel;
  void *v9;
  UIStackView *v10;
  UIStackView *metadataStackView;
  VUIAppInstallView *v12;
  VUIAppInstallView *v13;
  VUIAppInstallView *iconView;
  double v15;
  double v16;
  id v17;
  UIStackView *v18;
  void *v19;
  UIStackView *v20;
  UIStackView *containerStack;
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
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v36[0] = self->_nameLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIStackView *)objc_msgSend(v3, "initWithArrangedSubviews:", v4);
  nameAndRatingStack = self->_nameAndRatingStack;
  self->_nameAndRatingStack = v5;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_nameAndRatingStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](self->_nameAndRatingStack, "setSpacing:", 1.17549435e-38);
  -[UIStackView setAxis:](self->_nameAndRatingStack, "setAxis:", 0);
  -[UIStackView setAlignment:](self->_nameAndRatingStack, "setAlignment:", 3);
  v7 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  ageRatingLabel = self->_ageRatingLabel;
  v35[0] = self->_nameAndRatingStack;
  v35[1] = ageRatingLabel;
  v35[2] = self->_iAPLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (UIStackView *)objc_msgSend(v7, "initWithArrangedSubviews:", v9);
  metadataStackView = self->_metadataStackView;
  self->_metadataStackView = v10;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_metadataStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setCustomSpacing:afterView:](self->_metadataStackView, "setCustomSpacing:afterView:", self->_nameAndRatingStack, 8.0);
  -[UIStackView setCustomSpacing:afterView:](self->_metadataStackView, "setCustomSpacing:afterView:", self->_ageRatingLabel, 4.0);
  -[UIStackView setAxis:](self->_metadataStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_metadataStackView, "setAlignment:", 1);
  v12 = [VUIAppInstallView alloc];
  v13 = -[VUIAppInstallView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  iconView = self->_iconView;
  self->_iconView = v13;

  -[VUIAppInstallView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v15) = 1148846080;
  -[VUIAppInstallView setContentCompressionResistancePriority:forAxis:](self->_iconView, "setContentCompressionResistancePriority:forAxis:", 1, v15);
  LODWORD(v16) = 1148846080;
  -[VUIAppInstallView setContentCompressionResistancePriority:forAxis:](self->_iconView, "setContentCompressionResistancePriority:forAxis:", 0, v16);
  -[VUIAppInstallView setAccessibilityIdentifier:](self->_iconView, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Image.appIcon"));
  v17 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v18 = self->_metadataStackView;
  v34[0] = self->_iconView;
  v34[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (UIStackView *)objc_msgSend(v17, "initWithArrangedSubviews:", v19);
  containerStack = self->_containerStack;
  self->_containerStack = v20;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](self->_containerStack, "setSpacing:", 40.0);
  -[UIStackView setAxis:](self->_containerStack, "setAxis:", 0);
  -[UIStackView setAlignment:](self->_containerStack, "setAlignment:", 3);
  -[VUIAppInstallLockup addSubview:](self, "addSubview:", self->_containerStack);
  -[UIStackView leadingAnchor](self->_containerStack, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallLockup leadingAnchor](self, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[UIStackView trailingAnchor](self->_containerStack, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallLockup trailingAnchor](self, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[UIStackView topAnchor](self->_containerStack, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallLockup topAnchor](self, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[UIStackView bottomAnchor](self->_containerStack, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallLockup bottomAnchor](self, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

}

- (void)_layoutForIos
{
  id v3;
  void *v4;
  UIStackView *v5;
  UIStackView *nameAndRatingStack;
  VUIUIStackView *v7;
  UILabel *subtitleLabel;
  void *v9;
  UIStackView *v10;
  UIStackView *metadataStackView;
  UIStackView *v12;
  VUIAppInstallView *v13;
  VUIAppInstallView *v14;
  VUIAppInstallView *iconView;
  double v16;
  double v17;
  VUIUIStackView *v18;
  UIStackView *v19;
  void *v20;
  UIStackView *v21;
  UIStackView *containerStack;
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
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v37[0] = self->_nameLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIStackView *)objc_msgSend(v3, "initWithArrangedSubviews:", v4);
  nameAndRatingStack = self->_nameAndRatingStack;
  self->_nameAndRatingStack = v5;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_nameAndRatingStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](self->_nameAndRatingStack, "setSpacing:", 1.17549435e-38);
  -[UIStackView setAxis:](self->_nameAndRatingStack, "setAxis:", 0);
  -[UIStackView setAlignment:](self->_nameAndRatingStack, "setAlignment:", 3);
  v7 = [VUIUIStackView alloc];
  subtitleLabel = self->_subtitleLabel;
  v36[0] = self->_nameAndRatingStack;
  v36[1] = subtitleLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VUIUIStackView initWithArrangedSubviews:](v7, "initWithArrangedSubviews:", v9);

  -[UIStackView setAxisFollowsDeviceOrientation:](v10, "setAxisFollowsDeviceOrientation:", 0);
  -[UIStackView setAlignmentFollowsDeviceOrientation:](v10, "setAlignmentFollowsDeviceOrientation:", 1);
  metadataStackView = self->_metadataStackView;
  self->_metadataStackView = v10;
  v12 = v10;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_metadataStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setCustomSpacing:afterView:](self->_metadataStackView, "setCustomSpacing:afterView:", self->_nameAndRatingStack, 2.0);
  -[UIStackView setAxis:](self->_metadataStackView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_metadataStackView, "setAlignment:", 3);
  v13 = [VUIAppInstallView alloc];
  v14 = -[VUIAppInstallView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  iconView = self->_iconView;
  self->_iconView = v14;

  -[VUIAppInstallView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v16) = 1148846080;
  -[VUIAppInstallView setContentCompressionResistancePriority:forAxis:](self->_iconView, "setContentCompressionResistancePriority:forAxis:", 1, v16);
  LODWORD(v17) = 1148846080;
  -[VUIAppInstallView setContentCompressionResistancePriority:forAxis:](self->_iconView, "setContentCompressionResistancePriority:forAxis:", 0, v17);
  -[VUIAppInstallView setAccessibilityIdentifier:](self->_iconView, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Image.appIcon"));
  v18 = [VUIUIStackView alloc];
  v19 = self->_metadataStackView;
  v35[0] = self->_iconView;
  v35[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[VUIUIStackView initWithArrangedSubviews:](v18, "initWithArrangedSubviews:", v20);
  containerStack = self->_containerStack;
  self->_containerStack = v21;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](self->_containerStack, "setSpacing:", 1.17549435e-38);
  -[UIStackView setCustomSpacing:afterView:](self->_containerStack, "setCustomSpacing:afterView:", self->_iconView, 20.0);
  -[UIStackView setAxis:](self->_containerStack, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_containerStack, "setAlignment:", 3);
  -[VUIAppInstallLockup addSubview:](self, "addSubview:", self->_containerStack);
  -[UIStackView leadingAnchor](self->_containerStack, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallLockup leadingAnchor](self, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[UIStackView trailingAnchor](self->_containerStack, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallLockup trailingAnchor](self, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[UIStackView topAnchor](self->_containerStack, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallLockup topAnchor](self, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[UIStackView bottomAnchor](self->_containerStack, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIAppInstallLockup bottomAnchor](self, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

}

- (void)setIcon:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_icon, a3);
  v5 = a3;
  -[VUIAppInstallView setAppIcon:](self->_iconView, "setAppIcon:", v5);

}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

  -[UILabel setText:](self->_nameLabel, "setText:", v6);
}

- (void)setAgeRating:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *ageRating;
  void *v7;
  void *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  if (self->_ageRating != v4)
  {
    v9 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    ageRating = self->_ageRating;
    self->_ageRating = v5;

    -[VUIAppInstallLockup ageRatingBadge](self, "ageRatingBadge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[VUIAppInstallLockup ageRatingBadge](self, "ageRatingBadge");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", self->_ageRating);
    }
    else
    {
      -[VUIAppInstallLockup ageRatingLabel](self, "ageRatingLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", self->_ageRating);
    }

    v4 = v9;
  }

}

- (void)setIAP:(id)a3
{
  NSString *v4;
  NSString *iAP;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  iAP = self->_iAP;
  self->_iAP = v4;

  -[UILabel setText:](self->_iAPLabel, "setText:", v6);
}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  NSString *subtitle;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  subtitle = self->_subtitle;
  self->_subtitle = v4;

  -[UILabel setText:](self->_subtitleLabel, "setText:", v6);
}

- (VUIAppInstallView)installView
{
  return self->_iconView;
}

- (BOOL)canBecomeFocused
{
  return self->_canFocus;
}

- (VUITextBadge)ageRatingBadge
{
  VUITextBadge *ageRatingBadge;

  ageRatingBadge = self->_ageRatingBadge;
  if (!ageRatingBadge)
  {
    -[VUIAppInstallLockup _configureAgeRatingBadge](self, "_configureAgeRatingBadge");
    ageRatingBadge = self->_ageRatingBadge;
  }
  return ageRatingBadge;
}

- (void)_configureAgeRatingBadge
{
  VUITextBadge *v3;
  NSString *ageRating;
  void *v5;
  VUITextBadge *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VUITextBadge *ageRatingBadge;
  VUITextBadge *v12;
  void *v13;
  VUITextBadge *v14;

  v3 = [VUITextBadge alloc];
  ageRating = self->_ageRating;
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VUITextBadge initWithTitle:tintColor:fontSize:cornerRadius:](v3, "initWithTitle:tintColor:fontSize:cornerRadius:", ageRating, v5, 14.0, 4.0);

  -[VUITextBadge setBadgeStyle:](v6, "setBadgeStyle:", 1);
  -[VUITextBadge setStrokeSize:](v6, "setStrokeSize:", 0.5);
  -[VUITextBadge setBadgeInsets:](v6, "setBadgeInsets:", 1.0, 5.0, 1.0, 5.0);
  -[VUITextBadge setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VUITextBadge heightAnchor](v6, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 20.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[VUITextBadge widthAnchor](v6, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 34.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  ageRatingBadge = self->_ageRatingBadge;
  self->_ageRatingBadge = v6;
  v14 = v6;

  v12 = self->_ageRatingBadge;
  objc_msgSend(CFSTR("UIA.TV.Text."), "stringByAppendingString:", CFSTR("ageRating"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUITextBadge setAccessibilityIdentifier:](v12, "setAccessibilityIdentifier:", v13);

  -[UIStackView addArrangedSubview:](self->_nameAndRatingStack, "addArrangedSubview:", self->_ageRatingBadge);
}

- (void)_configureLabels
{
  void *v3;
  uint64_t v4;
  UILabel *nameLabel;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *ageRatingLabel;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *iAPLabel;
  uint64_t v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *subtitleLabel;
  void *v19;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  id v26;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 2)
  {
    nameLabel = self->_nameLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](nameLabel, "setFont:", v6);

    v7 = self->_nameLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    ageRatingLabel = self->_ageRatingLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](ageRatingLabel, "setFont:", v10);

    v11 = self->_ageRatingLabel;
    -[VUIAppInstallLockup _textColorForDarkMode](self, "_textColorForDarkMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    iAPLabel = self->_iAPLabel;
    v14 = *MEMORY[0x1E0DC4AA0];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](iAPLabel, "setFont:", v15);

    v16 = self->_iAPLabel;
    -[VUIAppInstallLockup _textColorForDarkMode](self, "_textColorForDarkMode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    subtitleLabel = self->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](subtitleLabel, "setFont:", v19);

    v20 = self->_subtitleLabel;
    -[VUIAppInstallLockup _textColorForDarkMode](self, "_textColorForDarkMode");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:");
  }
  else
  {
    v26 = (id)objc_opt_new();
    objc_msgSend(v26, "setTextStyle:", 2);
    objc_msgSend(v26, "setFontWeight:", 6);
    objc_msgSend(v26, "setMaximumContentSizeCategory:", 7);
    objc_msgSend(MEMORY[0x1E0DC1350], "vui_fontFromTextLayout:", v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_nameLabel, "setFont:", v21);
    v22 = self->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B08], *MEMORY[0x1E0DC48F0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v22, "setFont:", v23);

    v24 = self->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v24, "setTextColor:", v25);

  }
}

- (id)_textColorForDarkMode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (NSString)iAP
{
  return self->_iAP;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIStackView)metadataStackView
{
  return self->_metadataStackView;
}

- (void)setMetadataStackView:(id)a3
{
  objc_storeStrong((id *)&self->_metadataStackView, a3);
}

- (BOOL)canFocus
{
  return self->_canFocus;
}

- (void)setCanFocus:(BOOL)a3
{
  self->_canFocus = a3;
}

- (void)setAgeRatingBadge:(id)a3
{
  objc_storeStrong((id *)&self->_ageRatingBadge, a3);
}

- (UILabel)ageRatingLabel
{
  return self->_ageRatingLabel;
}

- (void)setAgeRatingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_ageRatingLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ageRatingLabel, 0);
  objc_storeStrong((id *)&self->_ageRatingBadge, 0);
  objc_storeStrong((id *)&self->_metadataStackView, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_iAP, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_containerStack, 0);
  objc_storeStrong((id *)&self->_nameAndRatingStack, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_iAPLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
