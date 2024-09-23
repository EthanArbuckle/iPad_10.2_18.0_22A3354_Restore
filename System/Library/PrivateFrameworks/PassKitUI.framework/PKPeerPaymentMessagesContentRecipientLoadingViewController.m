@implementation PKPeerPaymentMessagesContentRecipientLoadingViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentMessagesContentRecipientLoadingViewController;
  -[PKPeerPaymentMessagesContentRecipientLoadingViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimating");

}

@end
