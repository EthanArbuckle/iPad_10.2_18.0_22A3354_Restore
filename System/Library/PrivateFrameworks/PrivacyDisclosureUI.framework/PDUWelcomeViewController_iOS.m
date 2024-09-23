@implementation PDUWelcomeViewController_iOS

- (PDUWelcomeViewController_iOS)initWithApplicationIdentity:(id)a3 consentStore:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PDUWelcomeViewController_iOS *v14;
  PDUWelcomeViewController_iOS *v15;
  PDUWelcomeViewController_iOS *v16;
  objc_super v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v19 = 0;
  objc_msgSend(v7, "findApplicationRecordWithError:", &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  PDUWelcomeTitleTextForAppRecord(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PDUWelcomeDetailTextForAppRecord(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDUWelcomeViewController_iOS _requestIconForApplication:](self, "_requestIconForApplication:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)PDUWelcomeViewController_iOS;
  v14 = -[PDUWelcomeViewController_iOS initWithTitle:detailText:icon:contentLayout:](&v18, sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, v13, 2);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_applicationIdentity, a3);
    objc_storeStrong((id *)&v15->_applicationRecord, v9);
    objc_storeStrong((id *)&v15->_consentStore, a4);
    v16 = v15;
  }

  return v15;
}

- (id)_requestIconForApplication:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v4 = (objc_class *)MEMORY[0x24BE51A90];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:", v7);
  objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AC8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDrawBorder:", 1);
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", objc_msgSend(v8, "CGImageForDescriptor:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  dispatch_get_global_queue(21, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__PDUWelcomeViewController_iOS__requestIconForApplication___block_invoke;
  v15[3] = &unk_2515A5D48;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  objc_copyWeak(&v18, &location);
  dispatch_async(v11, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v10;
}

- (void)viewDidLoad
{
  PDCApplicationIdentity *applicationIdentity;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
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
  id v49;
  void *v50;
  void *v51;
  objc_super v52;
  id v53;
  _QWORD v54[5];

  v54[4] = *MEMORY[0x24BDAC8D0];
  applicationIdentity = self->_applicationIdentity;
  v53 = 0;
  -[PDCApplicationIdentity findApplicationRecordWithError:](applicationIdentity, "findApplicationRecordWithError:", &v53);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v53;
  PDULocalizedNameForAppRecord(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PDUWelcomeTintColorForApplicationRecord(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PDUWelcomeViewController_iOS view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v7);

  }
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PDULocalizedString(CFSTR("WELCOME_CONTINUE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:forState:", v10, 0);

  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_continuePressed, 64);
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("continue-button"));
  -[PDUWelcomeViewController_iOS buttonTray](self, "buttonTray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addButton:", v9);

  objc_msgSend(v7, "convertedToRGB");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend(v9, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertedToRGB");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", v51);

    if (v15)
    {
      objc_msgSend(v9, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "baseForegroundColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDUWelcomeViewController_iOS setContinueButtonOriginalTextColor:](self, "setContinueButtonOriginalTextColor:", v17);

      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBaseForegroundColor:", v18);

      objc_msgSend(v9, "setConfiguration:", v16);
      objc_msgSend(v9, "setNeedsUpdateConfiguration");

    }
  }
  v50 = v7;
  -[PDUWelcomeViewController_iOS setContinueButton:](self, "setContinueButton:", v9);
  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PDULocalizedString(CFSTR("WELCOME_CLOSE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v20, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:forState:", v21, 0);

  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_cancelPressed, 64);
  objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("cancel-button"));
  -[PDUWelcomeViewController_iOS buttonTray](self, "buttonTray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addButton:", v19);

  if (PDUShouldShowLearnMoreScreen(v4))
  {
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v48 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BDF77B8], 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "titleLabel");
    v47 = v20;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFont:", v24);

    objc_msgSend(v23, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAdjustsFontForContentSizeCategory:", 1);

    PDULocalizedString(CFSTR("WELCOME_LEARN_MORE"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitle:forState:", v27, 0);

    objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel_learnMorePressed, 64);
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PDUWelcomeViewController_iOS contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PDUWelcomeViewController_iOS contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v23);

    v30 = (void *)MEMORY[0x24BDD1628];
    -[PDUWelcomeViewController_iOS contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 3, 0, v31, 3, 1.0, 0.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)MEMORY[0x24BDD1628];
    -[PDUWelcomeViewController_iOS contentView](self, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 9, 0, v34, 9, 1.0, 0.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x24BDD1628];
    -[PDUWelcomeViewController_iOS contentView](self, "contentView");
    v49 = v5;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v37, 7, 1, v23, 7, 1.0, 0.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (void *)MEMORY[0x24BDD1628];
    -[PDUWelcomeViewController_iOS contentView](self, "contentView");
    v46 = v4;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v40, 8, 0, v23, 8, 1.0, 0.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[PDUWelcomeViewController_iOS contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v32;
    v54[1] = v35;
    v54[2] = v41;
    v54[3] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addConstraints:", v43);

    v4 = v46;
    v5 = v49;

    v20 = v47;
    v6 = v48;
  }
  -[PDUWelcomeViewController_iOS view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAccessibilityIdentifier:", CFSTR("pdui-welcome-view"));

  -[PDUWelcomeViewController_iOS contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layoutIfNeeded");

  v52.receiver = self;
  v52.super_class = (Class)PDUWelcomeViewController_iOS;
  -[OBBaseWelcomeController viewDidLoad](&v52, sel_viewDidLoad);

}

- (void)continuePressed
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[PDUWelcomeViewController_iOS delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PDCApplicationRecord regulatoryPrivacyDisclosureVersion](self->_applicationRecord, "regulatoryPrivacyDisclosureVersion");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PDCApplicationRecord bundleIdentifier](self->_applicationRecord, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)-[PDCConsentStore writeUserConsentedRegulatoryDisclosureVersion:forBundleIdentifier:](self->_consentStore, "writeUserConsentedRegulatoryDisclosureVersion:forBundleIdentifier:", v8, v5);
    -[PDUWelcomeViewController_iOS delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "welcomeViewController:didDismissWithUserResponse:", self, 1);

  }
}

- (void)cancelPressed
{
  void *v3;
  char v4;
  id v5;

  -[PDUWelcomeViewController_iOS delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PDUWelcomeViewController_iOS delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "welcomeViewController:didDismissWithUserResponse:", self, 0);

  }
}

- (void)learnMorePressed
{
  void *v3;
  void *v4;
  PDUDisclosureReviewViewController_iOS *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)MEMORY[0x24BDD1488];
  -[PDCApplicationRecord URL](self->_applicationRecord, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleWithURL:", v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[PDUDisclosureReviewViewController_iOS initWithBundle:variant:]([PDUDisclosureReviewViewController_iOS alloc], "initWithBundle:variant:", v13, 0);
  -[PDUDisclosureReviewViewController_iOS setDelegate:](v5, "setDelegate:", self);
  -[PDUWelcomeViewController_iOS view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDUDisclosureReviewViewController_iOS view](v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v5);
  -[PDUWelcomeViewController_iOS view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v11);

  objc_msgSend(v9, "setOverrideUserInterfaceStyle:", -[PDUWelcomeViewController_iOS preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle"));
  -[PDUWelcomeViewController_iOS presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)disclosureReviewViewControllerDidDismiss:(id)a3
{
  -[PDUWelcomeViewController_iOS dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)preferredUserInterfaceStyle
{
  void *v3;
  int64_t v4;
  objc_super v6;

  +[PDUAppDisclosureStyle styleWithApplication:](PDUAppDisclosureStyle, "styleWithApplication:", self->_applicationRecord);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceStyle");

  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)PDUWelcomeViewController_iOS;
    return -[PDUWelcomeViewController_iOS preferredUserInterfaceStyle](&v6, sel_preferredUserInterfaceStyle);
  }
  return v4;
}

- (void)_updateContinueButtonConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[PDUWelcomeViewController_iOS view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColor");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[PDUWelcomeViewController_iOS continueButton](self, "continueButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "convertedToRGB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_4;
  -[PDUWelcomeViewController_iOS continueButton](self, "continueButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertedToRGB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v6);

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    -[PDUWelcomeViewController_iOS continueButtonOriginalTextColor](self, "continueButtonOriginalTextColor");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  objc_msgSend(v5, "setBaseForegroundColor:", v12);

  -[PDUWelcomeViewController_iOS continueButton](self, "continueButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConfiguration:", v5);

  -[PDUWelcomeViewController_iOS continueButton](self, "continueButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNeedsUpdateConfiguration");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PDUWelcomeViewController_iOS;
  v4 = a3;
  -[PDUWelcomeViewController_iOS traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[PDUWelcomeViewController_iOS traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[PDUWelcomeViewController_iOS _updateContinueButtonConfiguration](self, "_updateContinueButtonConfiguration");
}

- (PDUWelcomeViewControllerDelegate)delegate
{
  return (PDUWelcomeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OBTrayButton)continueButton
{
  return (OBTrayButton *)objc_loadWeakRetained((id *)&self->_continueButton);
}

- (void)setContinueButton:(id)a3
{
  objc_storeWeak((id *)&self->_continueButton, a3);
}

- (UIColor)continueButtonOriginalTextColor
{
  return self->_continueButtonOriginalTextColor;
}

- (void)setContinueButtonOriginalTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonOriginalTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButtonOriginalTextColor, 0);
  objc_destroyWeak((id *)&self->_continueButton);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_consentStore, 0);
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
}

@end
