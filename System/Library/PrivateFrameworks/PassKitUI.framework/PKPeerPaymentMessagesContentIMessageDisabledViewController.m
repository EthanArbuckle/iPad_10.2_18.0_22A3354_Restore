@implementation PKPeerPaymentMessagesContentIMessageDisabledViewController

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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentMessagesContentIMessageDisabledViewController;
  -[PKPeerPaymentMessagesContentIMessageDisabledViewController viewDidLoad](&v17, sel_viewDidLoad);
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
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_IMESSAGE_DISABLED_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_IMESSAGE_DISABLED_ACTION"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v14, 0);

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "button");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__openSettings, 0x2000);

}

- (void)_openSettings
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=MESSAGES"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

@end
