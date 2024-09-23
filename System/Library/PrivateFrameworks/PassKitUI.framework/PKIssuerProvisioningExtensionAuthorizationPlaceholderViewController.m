@implementation PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController

- (void)loadView
{
  void *v3;
  void *v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *indicator;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController;
  -[PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController loadView](&v7, sel_loadView);
  -[PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizesSubviews:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
  indicator = self->_indicator;
  self->_indicator = v5;

  objc_msgSend(v3, "addSubview:", self->_indicator);
  -[UIActivityIndicatorView startAnimating](self->_indicator, "startAnimating");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  UIActivityIndicatorView *indicator;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController;
  -[PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKIssuerProvisioningExtensionAuthorizationPlaceholderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v3, "safeAreaInsets");
  indicator = self->_indicator;
  -[UIActivityIndicatorView frame](indicator, "frame");
  PKSizeAlignedInRect();
  -[UIActivityIndicatorView setFrame:](indicator, "setFrame:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicator, 0);
}

@end
