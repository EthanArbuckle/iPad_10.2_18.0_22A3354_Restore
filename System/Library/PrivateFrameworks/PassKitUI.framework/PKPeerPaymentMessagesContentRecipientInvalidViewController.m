@implementation PKPeerPaymentMessagesContentRecipientInvalidViewController

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
  v9.super_class = (Class)PKPeerPaymentMessagesContentRecipientInvalidViewController;
  -[PKPeerPaymentMessagesContentRecipientInvalidViewController viewDidLoad](&v9, sel_viewDidLoad);
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
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipientDisplayName");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "length"))
  {
    -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_INVALID_FORMAT"), CFSTR("%@"), v8);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_INVALID_NO_DISPLAY_NAME"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "setText:", v6);

}

@end
