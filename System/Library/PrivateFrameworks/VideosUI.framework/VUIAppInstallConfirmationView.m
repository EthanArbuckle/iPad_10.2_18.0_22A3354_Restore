@implementation VUIAppInstallConfirmationView

- (VUIAppInstallConfirmationView)initWithFrame:(CGRect)a3
{
  VUIAppInstallConfirmationView *v3;
  VUIAppInstallLockup *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  VUIAppInstallLockup *lockupView;
  double v11;
  double v12;
  uint64_t v13;
  UILabel *imageSubtitleView;
  uint64_t v15;
  UILabel *titleView;
  uint64_t v17;
  UILabel *messageView;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  UIButton *actionButton;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  UILabel *v30;
  void *v31;
  UILabel *v32;
  uint64_t v33;
  void *v34;
  UILabel *v35;
  void *v36;
  uint64_t v37;
  UIButton *cancelButton;
  UIButton *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  UIButton *appStoreButton;
  uint64_t v46;
  UIButton *secondaryLinkButton;
  void *v48;
  UIButton *v49;
  void *v50;
  UIButton *v51;
  void *v52;
  VUIBuyButtonLockup *v53;
  VUIBuyButtonLockup *buyLockup;
  void *v55;
  uint64_t v56;
  UIButton *v57;
  void *v58;
  void *v59;
  void *v60;
  UILabel *v61;
  void *v62;
  UILabel *v63;
  void *v64;
  void *v65;
  UILabel *v66;
  void *v67;
  UILabel *v68;
  void *v69;
  objc_super v71;

  v71.receiver = self;
  v71.super_class = (Class)VUIAppInstallConfirmationView;
  v3 = -[VUIAppInstallConfirmationView initWithFrame:](&v71, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [VUIAppInstallLockup alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[VUIAppInstallLockup initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    lockupView = v3->_lockupView;
    v3->_lockupView = (VUIAppInstallLockup *)v9;

    LODWORD(v11) = 1148846080;
    -[VUIAppInstallLockup setContentCompressionResistancePriority:forAxis:](v3->_lockupView, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    LODWORD(v12) = 1148846080;
    -[VUIAppInstallLockup setContentCompressionResistancePriority:forAxis:](v3->_lockupView, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    imageSubtitleView = v3->_imageSubtitleView;
    v3->_imageSubtitleView = (UILabel *)v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageSubtitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_imageSubtitleView, "setNumberOfLines:", -1);
    -[UILabel setTextAlignment:](v3->_imageSubtitleView, "setTextAlignment:", 1);
    -[UILabel setAccessibilityIdentifier:](v3->_imageSubtitleView, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Text.imageSubtitle"));
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    titleView = v3->_titleView;
    v3->_titleView = (UILabel *)v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_titleView, "setNumberOfLines:", -1);
    -[UILabel setTextAlignment:](v3->_titleView, "setTextAlignment:", 1);
    -[UILabel setAccessibilityIdentifier:](v3->_imageSubtitleView, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Text.title"));
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    messageView = v3->_messageView;
    v3->_messageView = (UILabel *)v17;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_messageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_messageView, "setNumberOfLines:", -1);
    -[UILabel setTextAlignment:](v3->_messageView, "setTextAlignment:", 1);
    -[UILabel setAccessibilityIdentifier:](v3->_messageView, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Text.message"));
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom");

    if (v20 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
      v21 = objc_claimAutoreleasedReturnValue();
      actionButton = v3->_actionButton;
      v3->_actionButton = (UIButton *)v21;

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIButton setAccessibilityIdentifier:](v3->_actionButton, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Button.install.state=\"inactive\"));
      v23 = v3->_imageSubtitleView;
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v23, "setFont:", v24);

      v25 = v3->_imageSubtitleView;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "colorWithAlphaComponent:", 0.7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v25, "setTextColor:", v27);

      v28 = v3->_titleView;
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v28, "setFont:", v29);

      v30 = v3->_titleView;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v30, "setTextColor:", v31);

      v32 = v3->_messageView;
      v33 = *MEMORY[0x1E0DC4A88];
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v32, "setFont:", v34);

      v35 = v3->_messageView;
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v35, "setTextColor:", v36);

      objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
      v37 = objc_claimAutoreleasedReturnValue();
      cancelButton = v3->_cancelButton;
      v3->_cancelButton = (UIButton *)v37;

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_cancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v39 = v3->_cancelButton;
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:", CFSTR("APP_INSTALL_ACTION_TITLE_CANCEL"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](v39, "setTitle:forState:", v41, 0);

      -[UIButton setAccessibilityIdentifier:](v3->_cancelButton, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Button.close"));
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:", CFSTR("APP_INSTALL_APPSTORE_BUTTON"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAppInstallConfirmationView _buttonWithTitleForTV:textStyle:](v3, "_buttonWithTitleForTV:textStyle:", v43, v33);
      v44 = objc_claimAutoreleasedReturnValue();
      appStoreButton = v3->_appStoreButton;
      v3->_appStoreButton = (UIButton *)v44;

      -[UIButton setAccessibilityIdentifier:](v3->_appStoreButton, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Button.openAppStore"));
      -[VUIAppInstallConfirmationView _buttonWithTitleForTV:textStyle:](v3, "_buttonWithTitleForTV:textStyle:", &stru_1E9FF3598, v33);
      v46 = objc_claimAutoreleasedReturnValue();
      secondaryLinkButton = v3->_secondaryLinkButton;
      v3->_secondaryLinkButton = (UIButton *)v46;

      -[UIButton titleLabel](v3->_secondaryLinkButton, "titleLabel");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setLineBreakMode:", 4);

      -[UIButton setAccessibilityIdentifier:](v3->_secondaryLinkButton, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Button.openSecondaryLink"));
      v49 = v3->_actionButton;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton _setVisualEffectViewEnabled:backgroundColor:](v49, "_setVisualEffectViewEnabled:backgroundColor:", 0, v50);

      v51 = v3->_cancelButton;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton _setVisualEffectViewEnabled:backgroundColor:](v51, "_setVisualEffectViewEnabled:backgroundColor:", 0, v52);
    }
    else
    {
      v53 = -[VUIBuyButtonLockup initWithFrame:]([VUIBuyButtonLockup alloc], "initWithFrame:", v5, v6, v7, v8);
      buyLockup = v3->_buyLockup;
      v3->_buyLockup = v53;

      -[VUIBuyButtonLockup setTranslatesAutoresizingMaskIntoConstraints:](v3->_buyLockup, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[VUIBuyButtonLockup setSpacing:](v3->_buyLockup, "setSpacing:", 6.0);
      -[VUIBuyButtonLockup setAxis:](v3->_buyLockup, "setAxis:", 1);
      -[VUIBuyButtonLockup setAlignment:](v3->_buyLockup, "setAlignment:", 3);
      -[VUIBuyButtonLockup button](v3->_buyLockup, "button");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Button.install.state=\"inactive\"));

      -[VUIBuyButtonLockup button](v3->_buyLockup, "button");
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v3->_actionButton;
      v3->_actionButton = (UIButton *)v56;

      -[VUIAppInstallLockup metadataStackView](v3->_lockupView, "metadataStackView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "arrangedSubviews");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "lastObject");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v52, "addArrangedSubview:", v3->_buyLockup);
      objc_msgSend(v52, "setCustomSpacing:afterView:", v59, 15.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAppInstallConfirmationView setBackgroundColor:](v3, "setBackgroundColor:", v60);

      v61 = v3->_imageSubtitleView;
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v61, "setFont:", v62);

      v63 = v3->_imageSubtitleView;
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "colorWithAlphaComponent:", 0.8);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v63, "setTextColor:", v65);

      v66 = v3->_messageView;
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v66, "setFont:", v67);

      v68 = v3->_messageView;
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_secondaryTextColor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v68, "setTextColor:", v69);

    }
  }
  -[VUIAppInstallConfirmationView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("UIA.TV.Dialog.AppInstallConfirmation"));
  return v3;
}

- (void)setAppIcon:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "iconSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend((id)objc_opt_class(), "iconSize");
  +[VUIAppIconImageService iconCornerRadiusForSize:](VUIAppIconImageService, "iconCornerRadiusForSize:");
  objc_msgSend(v4, "vui_iconImageOfSize:radius:stroke:", v6, v8, v9, 0.0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIAppInstallLockup setIcon:](self->_lockupView, "setIcon:", v10);
}

- (void)setTitle:(id)a3
{
  NSString **p_title;
  id v6;

  p_title = &self->_title;
  objc_storeStrong((id *)&self->_title, a3);
  v6 = a3;
  -[UILabel setText:](self->_titleView, "setText:", *p_title);

}

- (void)setMessage:(id)a3
{
  NSString **p_message;
  id v6;

  p_message = &self->_message;
  objc_storeStrong((id *)&self->_message, a3);
  v6 = a3;
  -[UILabel setText:](self->_messageView, "setText:", *p_message);

}

- (void)setAppName:(id)a3
{
  -[VUIAppInstallLockup setName:](self->_lockupView, "setName:", a3);
}

- (void)setAgeRating:(id)a3
{
  -[VUIAppInstallLockup setAgeRating:](self->_lockupView, "setAgeRating:", a3);
}

- (void)setIAP:(id)a3
{
  VUIBuyButtonLockup *buyLockup;

  -[VUIAppInstallLockup setIAP:](self->_lockupView, "setIAP:");
  buyLockup = self->_buyLockup;
  if (buyLockup)
    -[VUIBuyButtonLockup setHasIAP:](buyLockup, "setHasIAP:", a3 != 0);
}

- (void)setAppSubtitle:(id)a3
{
  -[VUIAppInstallLockup setSubtitle:](self->_lockupView, "setSubtitle:", a3);
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;

  if (!self->_didLayout)
  {
    self->_didLayout = 1;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 == 2)
      -[VUIAppInstallConfirmationView _layoutForTvos](self, "_layoutForTvos");
    else
      -[VUIAppInstallConfirmationView _layoutForIos](self, "_layoutForIos");
  }
}

- (void)_layoutForTvos
{
  id v3;
  UILabel *imageSubtitleView;
  void *v5;
  void *v6;
  id v7;
  UILabel *messageView;
  void *v9;
  void *v10;
  id v11;
  UIButton *cancelButton;
  UIButton *secondaryLinkButton;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
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
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[3];
  _QWORD v54[4];
  _QWORD v55[2];
  _QWORD v56[3];

  v56[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  imageSubtitleView = self->_imageSubtitleView;
  v56[0] = self->_lockupView;
  v56[1] = imageSubtitleView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArrangedSubviews:", v5);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setAxis:", 1);
  objc_msgSend(v6, "setDistribution:", 3);
  objc_msgSend(v6, "setAlignment:", 3);
  v7 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  messageView = self->_messageView;
  v55[0] = self->_titleView;
  v55[1] = messageView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithArrangedSubviews:", v9);

  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setAxis:", 1);
  objc_msgSend(v10, "setDistribution:", 3);
  objc_msgSend(v10, "setAlignment:", 3);
  objc_msgSend(v10, "setSpacing:", 16.0);
  v11 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  cancelButton = self->_cancelButton;
  v54[0] = self->_actionButton;
  v54[1] = cancelButton;
  secondaryLinkButton = self->_secondaryLinkButton;
  v54[2] = self->_appStoreButton;
  v54[3] = secondaryLinkButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithArrangedSubviews:", v14);

  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v15, "setAxis:", 1);
  objc_msgSend(v15, "setDistribution:", 0);
  objc_msgSend(v15, "setAlignment:", 3);
  LODWORD(v16) = 1132068864;
  objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", 0, v16);
  -[UIButton widthAnchor](self->_actionButton, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", 500.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[UIButton widthAnchor](self->_cancelButton, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToConstant:", 500.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[UIButton widthAnchor](self->_appStoreButton, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 500.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  LODWORD(v23) = 1112014848;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_secondaryLinkButton, "setContentCompressionResistancePriority:forAxis:", 0, v23);
  objc_msgSend(v15, "setSpacing:", 14.0);
  -[UIButton heightAnchor](self->_actionButton, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 66.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[UIButton heightAnchor](self->_cancelButton, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton heightAnchor](self->_actionButton, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  v29 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v53[0] = v6;
  v53[1] = v10;
  v53[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithArrangedSubviews:", v30);

  -[VUIAppInstallConfirmationView addSubview:](self, "addSubview:", v31);
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v31, "setAxis:", 1);
  objc_msgSend(v31, "setDistribution:", 3);
  objc_msgSend(v31, "setAlignment:", 3);
  objc_msgSend(v31, "setSpacing:", 35.0);
  objc_msgSend(v31, "setCustomSpacing:afterView:", v10, 50.0);
  LODWORD(v32) = 1148846080;
  objc_msgSend(v31, "setContentHuggingPriority:forAxis:", 0, v32);
  objc_msgSend(v31, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallConfirmationView centerXAnchor](self, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  objc_msgSend(v31, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallConfirmationView centerYAnchor](self, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  objc_msgSend(v31, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallConfirmationView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  objc_msgSend(v31, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallConfirmationView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

  objc_msgSend(v15, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  objc_msgSend(v15, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

}

- (void)_layoutForIos
{
  id v3;
  UILabel *imageSubtitleView;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  imageSubtitleView = self->_imageSubtitleView;
  v40[0] = self->_lockupView;
  v40[1] = imageSubtitleView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArrangedSubviews:", v5);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setAxis:", 1);
  objc_msgSend(v6, "setDistribution:", 3);
  objc_msgSend(v6, "setAlignment:", 3);
  v7 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v39[0] = self->_messageView;
  v39[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArrangedSubviews:", v8);

  -[VUIAppInstallConfirmationView addSubview:](self, "addSubview:", v9);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setAxis:", 1);
  objc_msgSend(v9, "setDistribution:", 3);
  objc_msgSend(v9, "setAlignment:", 3);
  objc_msgSend(v9, "setSpacing:", 24.0);
  objc_msgSend(v9, "setCustomSpacing:afterView:", self->_messageView, 24.0);
  -[UILabel widthAnchor](self->_messageView, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -80.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  LODWORD(v13) = 1144586240;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_messageView, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  LODWORD(v14) = 1144586240;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_messageView, "setContentCompressionResistancePriority:forAxis:", 0, v14);
  objc_msgSend(v9, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallConfirmationView readableContentGuide](self, "readableContentGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  objc_msgSend(v9, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallConfirmationView readableContentGuide](self, "readableContentGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  objc_msgSend(v9, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallConfirmationView readableContentGuide](self, "readableContentGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:constant:", v25, 20.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  objc_msgSend(v9, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallConfirmationView readableContentGuide](self, "readableContentGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:constant:", v29, -20.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  objc_msgSend(v9, "leftAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallConfirmationView readableContentGuide](self, "readableContentGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leftAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, 20.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

  objc_msgSend(v9, "rightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppInstallConfirmationView readableContentGuide](self, "readableContentGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, -20.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

}

+ (CGSize)iconSize
{
  void *v2;
  _BOOL4 v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 2;

  v4 = dbl_1DA1C24D0[v3];
  v5 = dbl_1DA1C24E0[v3];
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)_buttonWithTitleForTV:(id)a3 textStyle:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0DC3518];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "buttonWithType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_setFont:", v9);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleColor:forState:", v10, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleColor:forState:", v11, 8);

  objc_msgSend(v8, "setBackgroundImage:forStates:", 0, 0);
  objc_msgSend(v8, "_setVisualEffectViewEnabled:backgroundColor:", 0, 0);
  objc_msgSend(v8, "setTitle:forState:", v7, 0);

  return v8;
}

- (VUIAppInstallLockup)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
  objc_storeStrong((id *)&self->_lockupView, a3);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIButton)appStoreButton
{
  return self->_appStoreButton;
}

- (void)setAppStoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_appStoreButton, a3);
}

- (UIButton)secondaryLinkButton
{
  return self->_secondaryLinkButton;
}

- (void)setSecondaryLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLinkButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLinkButton, 0);
  objc_storeStrong((id *)&self->_appStoreButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_buttonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_buyLockup, 0);
  objc_storeStrong((id *)&self->_imageSubtitleView, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end
