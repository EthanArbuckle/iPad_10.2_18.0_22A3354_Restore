@implementation ICQInternetPrivacySheet

- (ICQInternetPrivacySheet)initWithIdentifier:(id)a3 viewModel:(id)a4
{
  id v6;
  id v7;
  ICQInternetPrivacySheet *v8;
  ICQInternetPrivacySheet *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICQInternetPrivacySheet;
  v8 = -[ICQInternetPrivacySheet init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_viewModel, v7);
    -[ICQInternetPrivacySheet setTextForIdentifier:](v9, "setTextForIdentifier:", v6);
  }

  return v9;
}

- (void)setTextForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.icloud.privaterelay.learnmoresubscriber")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_SUBSCRIBER_HEADER"), &stru_24E400750, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInternetPrivacySheet setHeaderText:](self, "setHeaderText:", v5);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_SUBSCRIBER_BODY"), &stru_24E400750, CFSTR("Localizable"));
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v7;
    -[ICQInternetPrivacySheet setBodyText:](self, "setBodyText:", v7);
    goto LABEL_6;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.icloud.privaterelay.learnmoreunsupportednetwork")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_NETWORK_HEADER"), &stru_24E400750, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInternetPrivacySheet setHeaderText:](self, "setHeaderText:", v9);

    -[ICQInternetPrivacySheet viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "internetPrivacyLearnMoreMessage");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.icloud.privaterelay.learnmoreunsupportedregion")))goto LABEL_7;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_REGION_HEADER"), &stru_24E400750, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet setHeaderText:](self, "setHeaderText:", v12);

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INTERNET_PRIVACY_LEARN_MORE_REGION_BODY"), &stru_24E400750, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet viewModel](self, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "country");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet setBodyText:](self, "setBodyText:", v16);

LABEL_6:
LABEL_7:

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICQInternetPrivacySheet;
  -[ICQInternetPrivacySheet viewDidLoad](&v3, sel_viewDidLoad);
  -[ICQInternetPrivacySheet setupUI](self, "setupUI");
}

- (void)setupUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped_);
  -[ICQInternetPrivacySheet navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  -[ICQInternetPrivacySheet view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[ICQInternetPrivacySheet setupScrollView](self, "setupScrollView");
  -[ICQInternetPrivacySheet setupStack](self, "setupStack");
  -[ICQInternetPrivacySheet addHeaderIcon](self, "addHeaderIcon");
  -[ICQInternetPrivacySheet addHeaderText](self, "addHeaderText");
  -[ICQInternetPrivacySheet addBodyText](self, "addBodyText");
}

- (void)setupScrollView
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
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setContentInset:", 25.0, 0.0, 40.0, 0.0);
  -[ICQInternetPrivacySheet view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  v15 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v3, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  objc_msgSend(v3, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v16;
  objc_msgSend(v3, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v7;
  objc_msgSend(v3, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v12);

  -[ICQInternetPrivacySheet setScrollView:](self, "setScrollView:", v3);
}

- (void)setupStack
{
  void *v3;
  _BOOL4 v4;
  double v5;
  void *v6;
  void *v7;
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
  _QWORD v29[7];

  v29[5] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAxis:", 1);
  v4 = -[ICQInternetPrivacySheet _deviceIsiPad](self, "_deviceIsiPad");
  v5 = 25.0;
  if (v4)
    v5 = 30.0;
  objc_msgSend(v3, "setSpacing:", v5);
  objc_msgSend(v3, "setAlignment:", 3);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ICQInternetPrivacySheet scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v3);

  v20 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v3, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet scrollView](self, "scrollView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  objc_msgSend(v3, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet scrollView](self, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v21;
  objc_msgSend(v3, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v16;
  objc_msgSend(v3, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v9;
  objc_msgSend(v3, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v14);

  -[ICQInternetPrivacySheet setStackView:](self, "setStackView:", v3);
}

- (void)addHeaderIcon
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x24BEBD668]);
  objc_msgSend(MEMORY[0x24BEBD640], "icqBundleImageNamed:", CFSTR("PrivateRelayLargeIcon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithImage:", v4);

  -[ICQInternetPrivacySheet stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addArrangedSubview:", v6);

  -[ICQInternetPrivacySheet setIconView:](self, "setIconView:", v6);
}

- (id)createTextViewWithText:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  double v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "setScrollEnabled:", 0);
  objc_msgSend(v5, "setEditable:", 0);
  v6 = -[ICQInternetPrivacySheet _deviceIsiPad](self, "_deviceIsiPad");
  v7 = 20.0;
  if (v6)
    v7 = 40.0;
  objc_msgSend(v5, "setTextContainerInset:", 0.0, v7, 0.0, v7);
  return v5;
}

- (void)addHeaderText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ICQInternetPrivacySheet headerText](self, "headerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet createTextViewWithText:](self, "createTextViewWithText:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 34.0, *MEMORY[0x24BEBB5E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE210]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledFontForFont:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v6);

  -[ICQInternetPrivacySheet stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addArrangedSubview:", v8);

}

- (void)addBodyText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  -[ICQInternetPrivacySheet bodyText](self, "bodyText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySheet createTextViewWithText:](self, "createTextViewWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setParagraphSpacing:", 25.0);
  objc_msgSend(v5, "setAlignment:", 1);
  v6 = objc_alloc(MEMORY[0x24BDD1688]);
  -[ICQInternetPrivacySheet bodyText](self, "bodyText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  v13[0] = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v13[1] = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = *MEMORY[0x24BEBB3A8];
  v14[1] = v10;
  v14[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttributes:range:", v11, 0, objc_msgSend(v8, "length"));

  objc_msgSend(v4, "setAttributedText:", v8);
  -[ICQInternetPrivacySheet stackView](self, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addArrangedSubview:", v4);

}

- (void)doneButtonTapped:(id)a3
{
  -[ICQInternetPrivacySheet dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)_deviceIsiPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (UILabel)heaerLabel
{
  return self->_heaerLabel;
}

- (void)setHeaerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_heaerLabel, a3);
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void)setBodyText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (ICQInternetPrivacyViewModel)viewModel
{
  return (ICQInternetPrivacyViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (void)setViewModel:(id)a3
{
  objc_storeWeak((id *)&self->_viewModel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewModel);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_heaerLabel, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
