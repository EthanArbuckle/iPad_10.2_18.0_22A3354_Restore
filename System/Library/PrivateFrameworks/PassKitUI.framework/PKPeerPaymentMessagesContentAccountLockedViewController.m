@implementation PKPeerPaymentMessagesContentAccountLockedViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PKPeerPaymentMessagesContentAccountLockedViewController;
  -[PKPeerPaymentMessagesContentAccountLockedViewController viewDidLoad](&v19, sel_viewDidLoad);
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

  PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PEER_PAYMENT_MESSAGES_ACCOUNT_LOCKED_ACTION"), 0);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PEER_PAYMENT_MESSAGES_ACCOUNT_LOCKED_TITLE"), 0);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v12);

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "button");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v10, 0);

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "button");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__openWallet, 0x2000);

}

- (void)_openWallet
{
  id v3;

  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleAction:sender:completion:", 5, self, 0);

}

@end
