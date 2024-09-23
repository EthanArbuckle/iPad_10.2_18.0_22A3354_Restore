@implementation PKPeerPaymentMessagesContentEnableViewController

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
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKPeerPaymentMessagesContentEnableViewController;
  -[PKPeerPaymentMessagesContentEnableViewController viewDidLoad](&v19, sel_viewDidLoad);
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

  LODWORD(v7) = PKUserHasDisabledPeerPayment();
  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v7)
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_REENABLEMENT_REQUIRED_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

    -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "button");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("PEER_PAYMENT_MESSAGES_REENABLEMENT_REQUIRED_ACTION");
  }
  else
  {
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_ENABLEMENT_REQUIRED_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v15);

    -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "button");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("PEER_PAYMENT_MESSAGES_ENABLEMENT_REQUIRED_ACTION");
  }
  PKLocalizedPeerPaymentString(&v14->isa);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v16, 0);

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "button");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__openSettings, 0x2000);

}

- (void)_openSettings
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=PASSBOOK"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

@end
