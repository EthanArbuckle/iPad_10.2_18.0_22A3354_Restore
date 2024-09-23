@implementation WLWelcomeViewController

- (WLWelcomeViewController)init
{
  return (WLWelcomeViewController *)-[WLWelcomeViewController _initWithForceUITestMode:forceUITestModeDownloadError:](self, "_initWithForceUITestMode:forceUITestModeDownloadError:", 0, 0);
}

- (id)initForUITestWithForceDownloadError:(BOOL)a3
{
  return -[WLWelcomeViewController _initWithForceUITestMode:forceUITestModeDownloadError:](self, "_initWithForceUITestMode:forceUITestModeDownloadError:", 1, a3);
}

- (id)_initWithForceUITestMode:(BOOL)a3 forceUITestModeDownloadError:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WLWelcomeViewController *v12;
  uint64_t v13;
  OBTrayButton *continueButton;
  OBTrayButton *v15;
  void *v16;
  void *v17;
  WLWelcomeController *v18;
  WLWelcomeController *welcomeController;
  objc_super v21;

  v4 = a4;
  v5 = a3;
  WLLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("MoveToiOS"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)WLWelcomeViewController;
  v12 = -[WLWelcomeViewController initWithTitle:detailText:icon:contentLayout:](&v21, sel_initWithTitle_detailText_icon_contentLayout_, v7, v8, v11, 2);

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v13 = objc_claimAutoreleasedReturnValue();
    continueButton = v12->_continueButton;
    v12->_continueButton = (OBTrayButton *)v13;

    v15 = v12->_continueButton;
    WLLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTitle:forState:](v15, "setTitle:forState:", v16, 0);

    -[OBTrayButton addTarget:action:forControlEvents:](v12->_continueButton, "addTarget:action:forControlEvents:", v12, sel__continueTapped_, 64);
    -[WLWelcomeViewController buttonTray](v12, "buttonTray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addButton:", v12->_continueButton);

    v18 = -[WLWelcomeController initWithWelcomeViewController:forceUITestMode:forceUITestModeDownloadError:]([WLWelcomeController alloc], "initWithWelcomeViewController:forceUITestMode:forceUITestModeDownloadError:", v12, v5, v4);
    welcomeController = v12->_welcomeController;
    v12->_welcomeController = v18;

  }
  return v12;
}

- (void)dealloc
{
  objc_super v4;

  _WLLog();
  v4.receiver = self;
  v4.super_class = (Class)WLWelcomeViewController;
  -[WLWelcomeViewController dealloc](&v4, sel_dealloc, self);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLWelcomeViewController;
  -[WLOnboardingViewController viewDidLoad](&v6, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("qrcode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithImage:style:target:action:", v3, 2, self, sel__qrcodeTapped_);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

}

- (void)_qrcodeTapped:(id)a3
{
  void *v4;
  void *v5;
  WLQRCodeDefaultViewController *v6;

  if (!self->_qrcodeLoaded)
  {
    self->_qrcodeLoaded = 1;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("qrcode_loaded"));
    objc_msgSend(v4, "synchronize");

  }
  v6 = -[WLQRCodeDefaultViewController initWithDefaultQRCode]([WLQRCodeDefaultViewController alloc], "initWithDefaultQRCode");
  -[WLWelcomeViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)_continueTapped:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void (**continueHandler)(void);

  -[OBTrayButton showsBusyIndicator](self->_continueButton, "showsBusyIndicator", a3);
  if (self->_qrcodeLoaded)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("qrcode_loaded"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "BOOLValue");

  }
  objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didLoadQRCode:", v4);

  continueHandler = (void (**)(void))self->_continueHandler;
  if (continueHandler)
    continueHandler[2]();
}

- (void)setCompletionHandler:(id)a3
{
  -[WLWelcomeController setCompletionHandler:](self->_welcomeController, "setCompletionHandler:", a3);
}

- (id)completionHandler
{
  return -[WLWelcomeController completionHandler](self->_welcomeController, "completionHandler");
}

- (void)setResetHandler:(id)a3
{
  -[WLWelcomeController setResetHandler:](self->_welcomeController, "setResetHandler:", a3);
}

- (id)resetHandler
{
  return -[WLWelcomeController resetHandler](self->_welcomeController, "resetHandler");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WLWelcomeViewController;
  -[WLWelcomeViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[OBTrayButton hidesBusyIndicator](self->_continueButton, "hidesBusyIndicator");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLWelcomeViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[WLWelcomeViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    -[WLWelcomeViewController viewDidAppear:].cold.1();

  -[WLWelcomeViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[WLWelcomeViewController viewDidAppear:].cold.2();
  -[WLWelcomeController setNavigationController:](self->_welcomeController, "setNavigationController:", v5);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WLWelcomeViewController;
  -[WLWelcomeViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[OBTrayButton hidesBusyIndicator](self->_continueButton, "hidesBusyIndicator");
}

- (id)continueHandler
{
  return self->_continueHandler;
}

- (void)setContinueHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

- (void)viewDidAppear:.cold.1()
{
  __assert_rtn("-[WLWelcomeViewController viewDidAppear:]", "WLWelcomeViewController.m", 110, "self.navigationController");
}

- (void)viewDidAppear:.cold.2()
{
  __assert_rtn("-[WLWelcomeViewController viewDidAppear:]", "WLWelcomeViewController.m", 112, "[navigationController isKindOfClass:[BFFNavigationController class]]");
}

@end
