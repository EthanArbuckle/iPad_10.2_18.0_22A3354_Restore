@implementation SKUIRedeemITunesPassLearnMoreViewController

- (SKUIRedeemITunesPassLearnMoreViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SKUIRedeemITunesPassLearnMoreViewController *v8;
  SKUIRedeemITunesPassLearnMoreViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemITunesPassLearnMoreViewController initWithNibName:bundle:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIRedeemITunesPassLearnMoreViewController;
  v8 = -[SKUIRedeemITunesPassLearnMoreViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v6, v7);
  v9 = v8;
  if (v8)
    -[SKUIRedeemITunesPassLearnMoreViewController setEdgesForExtendedLayout:](v8, "setEdgesForExtendedLayout:", 0);

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SKUIRedeemITunesPassLearnMoreView button](self->_learnMoreView, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SKUIPassbookLoader setDelegate:](self->_passbookLoader, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SKUIRedeemITunesPassLearnMoreViewController;
  -[SKUIRedeemITunesPassLearnMoreViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  SKUIRedeemITunesPassLearnMoreView *learnMoreView;
  SKUIRedeemITunesPassLearnMoreView *v4;
  SKUIRedeemITunesPassLearnMoreView *v5;
  SKUIRedeemITunesPassLearnMoreView *v6;
  void *v7;
  void *v8;
  SKUIRedeemITunesPassLearnMoreView *v9;
  void *v10;
  void *v11;
  SKUIRedeemITunesPassLearnMoreView *v12;
  void *v13;
  void *v14;
  SKUIRedeemITunesPassLearnMoreView *v15;
  void *v16;
  void *v17;

  learnMoreView = self->_learnMoreView;
  if (!learnMoreView)
  {
    v4 = objc_alloc_init(SKUIRedeemITunesPassLearnMoreView);
    v5 = self->_learnMoreView;
    self->_learnMoreView = v4;

    v6 = self->_learnMoreView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemITunesPassLearnMoreView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SKUIRedeemStepViewController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_learnMoreView;
    objc_msgSend(v8, "successImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemITunesPassLearnMoreView setHeaderImage:](v9, "setHeaderImage:", v10);

    objc_msgSend(v8, "ITunesPassConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_learnMoreView;
    objc_msgSend(v11, "learnMoreExplanation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemITunesPassLearnMoreView setExplanationString:](v12, "setExplanationString:", v13);

    -[SKUIRedeemITunesPassLearnMoreViewController _existingPass](self, "_existingPass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = self->_learnMoreView;
    if (v14)
      objc_msgSend(v11, "learnMoreViewPassButtonTitle");
    else
      objc_msgSend(v11, "learnMoreAddPassButtonTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemITunesPassLearnMoreView setButtonTitle:](v15, "setButtonTitle:", v16);

    -[SKUIRedeemITunesPassLearnMoreView button](self->_learnMoreView, "button");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel__passButtonAction_, 64);

    learnMoreView = self->_learnMoreView;
  }
  -[SKUIRedeemITunesPassLearnMoreViewController setView:](self, "setView:", learnMoreView);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  +[SKUIITunesPassLearnMoreAlertDelegate beginThrottleInterval](SKUIITunesPassLearnMoreAlertDelegate, "beginThrottleInterval");
  v5.receiver = self;
  v5.super_class = (Class)SKUIRedeemITunesPassLearnMoreViewController;
  -[SKUIRedeemITunesPassLearnMoreViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  -[SKUIRedeemStepViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ITunesPassConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "learnMoreTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemITunesPassLearnMoreViewController setTitle:](self, "setTitle:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v8, "setAction:", sel__doneButtonAction_);
  objc_msgSend(v8, "setStyle:", 2);
  objc_msgSend(v8, "setTarget:", self);
  objc_msgSend(v6, "learnMoreDoneButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  -[SKUIRedeemITunesPassLearnMoreViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v8);

  v11.receiver = self;
  v11.super_class = (Class)SKUIRedeemITunesPassLearnMoreViewController;
  -[SKUIRedeemITunesPassLearnMoreViewController viewWillAppear:](&v11, sel_viewWillAppear_, v3);

}

- (void)passbookLoaderDidFinish:(id)a3
{
  SKUIPassbookLoader *passbookLoader;
  void *v5;
  void *v6;
  void *v7;
  SKUIRedeemITunesPassLearnMoreView *learnMoreView;
  void *v9;
  id v10;

  -[SKUIPassbookLoader setDelegate:](self->_passbookLoader, "setDelegate:", 0);
  passbookLoader = self->_passbookLoader;
  self->_passbookLoader = 0;

  -[SKUIRedeemITunesPassLearnMoreViewController _existingPass](self, "_existingPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SKUIRedeemStepViewController configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ITunesPassConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    learnMoreView = self->_learnMoreView;
    objc_msgSend(v7, "learnMoreViewPassButtonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemITunesPassLearnMoreView setButtonTitle:](learnMoreView, "setButtonTitle:", v9);

  }
  -[SKUIRedeemITunesPassLearnMoreView button](self->_learnMoreView, "button");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 1);

}

- (void)_doneButtonAction:(id)a3
{
  -[SKUIRedeemITunesPassLearnMoreViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_passButtonAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SKUIRedeemITunesPassLearnMoreViewController _existingPass](self, "_existingPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "passURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIMetricsOpenURL(v6);

  }
  else
  {
    self->_didTapAddPassbookButton = 1;
    objc_msgSend(v7, "setEnabled:", 0);
    if (self->_passbookURL)
      -[SKUIRedeemITunesPassLearnMoreViewController _loadPassbookPass](self, "_loadPassbookPass");
    else
      -[SKUIRedeemITunesPassLearnMoreViewController _loadPassbookURL](self, "_loadPassbookURL");
  }

}

- (void)_didLoadPassbookURLString:(id)a3
{
  NSURL *v4;
  NSURL *passbookURL;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v7);
    passbookURL = self->_passbookURL;
    self->_passbookURL = v4;

    if (self->_didTapAddPassbookButton)
      -[SKUIRedeemITunesPassLearnMoreViewController _loadPassbookPass](self, "_loadPassbookPass");
  }
  else
  {
    -[SKUIRedeemITunesPassLearnMoreViewController _showErrorDialog](self, "_showErrorDialog");
    -[SKUIRedeemITunesPassLearnMoreView button](self->_learnMoreView, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 1);

  }
}

- (id)_existingPass
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ITunesPassSerialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = SKUIPassKitUIFramework();
    v6 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("PKPassLibrary"), v5));
    objc_msgSend(v6, "passWithPassTypeIdentifier:serialNumber:", CFSTR("pass.com.apple.itunes.storecredit"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_loadPassbookPass
{
  SKUIPassbookLoader *v3;
  void *v4;
  SKUIPassbookLoader *v5;
  SKUIPassbookLoader *passbookLoader;
  SKUIPassbookLoader *v7;
  void *v8;

  if (!self->_passbookLoader)
  {
    if (self->_passbookURL)
    {
      v3 = [SKUIPassbookLoader alloc];
      -[SKUIRedeemStepViewController clientContext](self, "clientContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[SKUIPassbookLoader initWithClientContext:](v3, "initWithClientContext:", v4);
      passbookLoader = self->_passbookLoader;
      self->_passbookLoader = v5;

      -[SKUIPassbookLoader setDelegate:](self->_passbookLoader, "setDelegate:", self);
      v7 = self->_passbookLoader;
      -[SKUIRedeemStepViewController operationQueue](self, "operationQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIPassbookLoader setOperationQueue:](v7, "setOperationQueue:", v8);

      -[SKUIPassbookLoader loadPassWithURL:](self->_passbookLoader, "loadPassWithURL:", self->_passbookURL);
    }
  }
}

- (void)_loadPassbookURL
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_passbookURL)
  {
    objc_initWeak(&location, self);
    -[SKUIRedeemStepViewController clientContext](self, "clientContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLBag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__SKUIRedeemITunesPassLearnMoreViewController__loadPassbookURL__block_invoke;
    v5[3] = &unk_1E73A3C50;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "loadValueForKey:completionBlock:", CFSTR("getAddCreditPassUrl"), v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __63__SKUIRedeemITunesPassLearnMoreViewController__loadPassbookURL__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SKUIRedeemITunesPassLearnMoreViewController__loadPassbookURL__block_invoke_2;
  v5[3] = &unk_1E73A3138;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __63__SKUIRedeemITunesPassLearnMoreViewController__loadPassbookURL__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didLoadPassbookURLString:", *(_QWORD *)(a1 + 32));

}

- (void)_showErrorDialog
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SKUIRedeemStepViewController clientContext](self, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3450];
  v10 = v3;
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LOAD_ERROR_TITLE"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LOAD_ERROR_TITLE"), 0, CFSTR("Redeem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  if (v10)
    objc_msgSend(v10, "localizedStringForKey:inTable:", CFSTR("ITUNES_PASS_LOAD_ERROR_DISMISS_BUTTON"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ITUNES_PASS_LOAD_ERROR_DISMISS_BUTTON"), 0, CFSTR("Redeem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  -[SKUIRedeemITunesPassLearnMoreViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passbookURL, 0);
  objc_storeStrong((id *)&self->_passbookLoader, 0);
  objc_storeStrong((id *)&self->_learnMoreView, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemITunesPassLearnMoreViewController initWithNibName:bundle:]";
}

@end
