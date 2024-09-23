@implementation WLQRCodeDefaultViewController

- (WLQRCodeDefaultViewController)initWithDefaultQRCode
{
  void *v3;
  void *v4;
  char v5;
  WLQRCode *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  WLQRCode *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WLQRCodeDefaultViewController *v18;
  objc_super v20;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("CN"));
  v6 = [WLQRCode alloc];
  WLLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) != 0)
  {
    v9 = CFSTR("https://support.apple.com/HT201196");
    v10 = CFSTR("apple_support");
  }
  else
  {
    v9 = CFSTR("https://play.google.com/store/apps/details?id=com.apple.movetoios");
    v10 = CFSTR("google_play");
  }
  v11 = -[WLQRCode initWithName:title:URL:code:](v6, "initWithName:title:URL:code:", v7, v8, v9, v10);

  objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didLoadAndroidStore:selected:canceled:inAttempts:", v10, 0, 0, 0);

  v13 = (void *)MEMORY[0x24BDD17C8];
  WLLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLQRCode name](v11, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[WLQRCode title](v11, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)WLQRCodeDefaultViewController;
  v18 = -[WLQRCodeDefaultViewController initWithTitle:detailText:symbolName:](&v20, sel_initWithTitle_detailText_symbolName_, v17, v16, CFSTR("qrcode"));

  if (v18)
  {
    v18->_useGooglePlayStore = v5 ^ 1;
    -[WLQRCodeViewController setQrcode:](v18, "setQrcode:", v11);
  }

  return v18;
}

- (void)viewDidLoad
{
  OBLinkTrayButton *v3;
  OBLinkTrayButton *continueButton;
  void *v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *indicatorView;
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
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)WLQRCodeDefaultViewController;
  -[WLOnboardingViewController viewDidLoad](&v17, sel_viewDidLoad);
  WLLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v3 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v3;

  -[OBLinkTrayButton setTitle:forState:](self->_continueButton, "setTitle:forState:", v16, 0);
  -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel__listButtonTapped_, 64);
  -[WLQRCodeDefaultViewController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addButton:", self->_continueButton);

  v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  indicatorView = self->_indicatorView;
  self->_indicatorView = v6;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_indicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBLinkTrayButton addSubview:](self->_continueButton, "addSubview:", self->_indicatorView);
  v8 = (void *)MEMORY[0x24BDD1628];
  -[UIActivityIndicatorView centerXAnchor](self->_indicatorView, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton centerXAnchor](self->_continueButton, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  -[UIActivityIndicatorView centerYAnchor](self->_indicatorView, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton centerYAnchor](self->_continueButton, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v15);

  -[UIActivityIndicatorView stopAnimating](self->_indicatorView, "stopAnimating");
  -[WLQRCodeDefaultViewController requestCodes](self, "requestCodes");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WLQRCodeDefaultViewController;
  -[WLQRCodeViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WLQRCodeDefaultViewController setIndicatorHidden:](self, "setIndicatorHidden:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  WLQRCodeProvider *provider;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLQRCodeDefaultViewController;
  -[WLQRCodeDefaultViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[WLQRCodeProvider setDelegate:](self->_provider, "setDelegate:", 0);
  provider = self->_provider;
  self->_provider = 0;

}

- (void)_listButtonTapped:(id)a3
{
  if (self->_codes)
  {
    -[WLQRCodeDefaultViewController pushListViewController](self, "pushListViewController", a3);
  }
  else
  {
    -[WLQRCodeDefaultViewController setIndicatorHidden:](self, "setIndicatorHidden:", 0);
    -[WLQRCodeDefaultViewController requestCodes](self, "requestCodes");
  }
}

- (void)requestCodes
{
  WLQRCodeProvider *v3;
  WLQRCodeProvider *provider;

  -[WLQRCodeProvider setDelegate:](self->_provider, "setDelegate:", 0);
  v3 = objc_alloc_init(WLQRCodeProvider);
  provider = self->_provider;
  self->_provider = v3;

  -[WLQRCodeProvider setUseGooglePlayStore:](self->_provider, "setUseGooglePlayStore:", self->_useGooglePlayStore);
  -[WLQRCodeProvider setDelegate:](self->_provider, "setDelegate:", self);
  -[WLQRCodeProvider request](self->_provider, "request");
}

- (void)setIndicatorHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL8 v6;
  UIActivityIndicatorView *indicatorView;

  v3 = a3;
  -[OBLinkTrayButton titleLabel](self->_continueButton, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = !v3;
  objc_msgSend(v5, "setHidden:", v6);

  indicatorView = self->_indicatorView;
  if (v6)
    -[UIActivityIndicatorView startAnimating](indicatorView, "startAnimating");
  else
    -[UIActivityIndicatorView stopAnimating](indicatorView, "stopAnimating");
}

- (void)providerDidProvide:(id)a3
{
  WLQRCodeProvider *provider;

  -[WLQRCodeDefaultViewController setCodes:](self, "setCodes:", a3);
  if (-[UIActivityIndicatorView isAnimating](self->_indicatorView, "isAnimating"))
    -[WLQRCodeDefaultViewController pushListViewController](self, "pushListViewController");
  provider = self->_provider;
  self->_provider = 0;

}

- (void)pushListViewController
{
  void *v3;
  WLQRCodeListViewController *v4;
  void *v5;
  id v6;

  WLLocalizedString();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:]([WLQRCodeListViewController alloc], "initWithTitle:detailText:symbolName:adoptTableViewScrollView:", v6, v3, CFSTR("qrcode"), 1);
  -[WLQRCodeListViewController setQrcodes:](v4, "setQrcodes:", self->_codes);
  -[WLQRCodeDefaultViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v4, 1);

}

- (NSArray)codes
{
  return self->_codes;
}

- (void)setCodes:(id)a3
{
  objc_storeStrong((id *)&self->_codes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codes, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
}

@end
