@implementation PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController;
  -[PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController viewDidLoad](&v9, sel_viewDidLoad);
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

}

- (void)reloadContent
{
  void *v2;
  void *v3;
  id v4;

  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v3);

}

@end
