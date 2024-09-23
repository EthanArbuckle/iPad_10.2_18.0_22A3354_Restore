@implementation PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController;
  -[PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVerticalPadding:", 18.0);

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUIScreenScale();
  +[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKUIApplePayLogo(v7, 90.0, 25.0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v8);

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKPrimaryAppleAccountFormattedUsername();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_AMBIGUOUS_SENDER_ADDRESS_FORMAT"), CFSTR("%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v12);

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_AMBIGUOUS_SENDER_ADDRESS_ACTION"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:forState:", v15, 0);

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "button");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel__openSettings, 0x2000);

}

- (void)_openSettings
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=MESSAGES&path=MADRID_ACCOUNTS_BUTTON"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

@end
