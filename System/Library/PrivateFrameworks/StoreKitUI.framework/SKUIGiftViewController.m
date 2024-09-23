@implementation SKUIGiftViewController

- (SKUIGiftViewController)initWithGift:(id)a3
{
  id v4;
  SKUIGift *v5;
  SKUIGift *gift;
  id v7;
  void *v8;
  void *v9;
  SKUIGiftViewController *v10;
  SKUIGiftViewController *v11;
  objc_super v13;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIGiftViewController initWithGift:].cold.1();
  }
  v5 = (SKUIGift *)objc_msgSend(v4, "copy");
  gift = self->_gift;
  self->_gift = v5;

  v7 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  v13.receiver = self;
  v13.super_class = (Class)SKUIGiftViewController;
  v10 = -[SKUIGiftViewController initWithRootViewController:](&v13, sel_initWithRootViewController_, v7);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_placeholderViewController, v7);
    -[SKUIGiftViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 2);
  }

  return v11;
}

- (NSOperationQueue)operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 6);
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)setClientContext:(id)a3
{
  SKUIClientContext *v5;
  UIViewController *placeholderViewController;
  void *v7;
  SKUIClientContext *v8;

  v5 = (SKUIClientContext *)a3;
  if (self->_clientContext != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    placeholderViewController = self->_placeholderViewController;
    -[SKUIGiftViewController _localizedString:](self, "_localizedString:", CFSTR("GIFTING_FLOW_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setTitle:](placeholderViewController, "setTitle:", v7);

    v5 = v8;
  }

}

- (void)setOperationQueue:(id)a3
{
  NSOperationQueue *v5;
  SKUIGiftComposeViewController *rootViewController;
  void *v7;
  NSOperationQueue *v8;

  v5 = (NSOperationQueue *)a3;
  if (self->_operationQueue != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_operationQueue, a3);
    rootViewController = self->_rootViewController;
    -[SKUIGiftViewController operationQueue](self, "operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftStepViewController setOperationQueue:](rootViewController, "setOperationQueue:", v7);

    v5 = v8;
  }

}

- (CGSize)preferredContentSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double Width;
  double Height;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGSize result;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 1)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v30.origin.x = v7;
  v30.origin.y = v9;
  v30.size.width = v11;
  v30.size.height = v13;
  Width = CGRectGetWidth(v30);
  v31.origin.x = v7;
  v31.origin.y = v9;
  v31.size.width = v11;
  v31.size.height = v13;
  Height = CGRectGetHeight(v31);
  if (Width < 1024.0 || Height < 1024.0)
  {
LABEL_7:
    v28.receiver = self;
    v28.super_class = (Class)SKUIGiftViewController;
    -[SKUIGiftViewController preferredContentSize](&v28, sel_preferredContentSize);
    v18 = v17;
    v20 = v19;
  }
  else
  {
    -[SKUIGiftViewController navigationBar](self, "navigationBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "frame");
      v23 = CGRectGetHeight(v32);
    }
    else
    {
      v23 = 0.0;
    }
    v24 = v23 + 1045.0;
    v25 = v23 + 904.0;
    if (Height <= Width)
      v20 = v25;
    else
      v20 = v24;
    *(double *)&v18 = 784.0;

  }
  v26 = *(double *)&v18;
  v27 = v20;
  result.height = v27;
  result.width = v26;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
    return 30;
  if (SKUIAllowsLandscapePhone())
    return 26;
  return 2;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIGiftViewController;
  -[SKUIGiftViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[SKUIGiftViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_initialBarStyle = objc_msgSend(v6, "statusBarStyle");

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStatusBarStyle:", 0);

  }
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SKUIGift *gift;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SKUIGiftViewController;
  -[SKUIGiftViewController viewDidLoad](&v17, sel_viewDidLoad);
  if (!self->_giftConfiguration)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
    objc_msgSend(v3, "setAction:", sel__cancelButtonAction_);
    objc_msgSend(v3, "setTarget:", self);
    -[SKUIGiftViewController _localizedString:](self, "_localizedString:", CFSTR("GIFTING_CANCEL_BUTTON"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v4);

    -[SKUIGiftViewController topViewController](self, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftBarButtonItem:", v3);

    objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      gift = self->_gift;
      objc_msgSend(v8, "accountName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGift setSenderEmailAddress:](gift, "setSenderEmailAddress:", v10);

      -[SKUIGiftViewController _loadGiftConfiguration](self, "_loadGiftConfiguration");
    }
    else
    {
      objc_initWeak(&location, self);
      v11 = objc_alloc(MEMORY[0x1E0DAF488]);
      objc_msgSend(MEMORY[0x1E0DAF490], "contextForSignIn");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithAuthenticationContext:", v12);

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __37__SKUIGiftViewController_viewDidLoad__block_invoke;
      v14[3] = &unk_1E73A1FD8;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v13, "startWithAuthenticateResponseBlock:", v14);
      objc_destroyWeak(&v15);

      objc_destroyWeak(&location);
    }

  }
}

void __37__SKUIGiftViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SKUIGiftViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E73A1D50;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __37__SKUIGiftViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishAuthenticateWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIGiftViewController;
  -[SKUIGiftViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  -[SKUIGiftViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStatusBarStyle:", self->_initialBarStyle);

  }
}

- (void)_cancelButtonAction:(id)a3
{
  -[SKUIGiftViewController _finishGiftingWithResult:](self, "_finishGiftingWithResult:", 0);
}

- (void)_clientContextDidLoadWithContext:(id)a3 error:(id)a4
{
  if (a3)
  {
    -[SKUIGiftViewController setClientContext:](self, "setClientContext:", a3, a4);
    -[SKUIGiftViewController _loadGiftConfiguration](self, "_loadGiftConfiguration");
  }
  else
  {
    NSLog(CFSTR("ERROR: %@"), a2, a4);
    -[SKUIGiftViewController _finishGiftingWithResult:](self, "_finishGiftingWithResult:", 0);
  }
}

- (void)_configurationDidLoadWithResult:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  SKUIGiftComposeViewController *v7;
  SKUIGiftComposeViewController *rootViewController;
  SKUIGiftComposeViewController *v9;
  void *v10;
  SKUINetworkErrorViewController *v11;
  void *v12;
  UIViewController *placeholderViewController;
  SKUINetworkErrorViewController *v14;
  _QWORD v15[2];

  v4 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4)
  {
    v7 = -[SKUIGiftComposeViewController initWithGift:configuration:]([SKUIGiftComposeViewController alloc], "initWithGift:configuration:", self->_gift, self->_giftConfiguration);
    rootViewController = self->_rootViewController;
    self->_rootViewController = v7;

    v9 = self->_rootViewController;
    -[SKUIGiftViewController operationQueue](self, "operationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftStepViewController setOperationQueue:](v9, "setOperationQueue:", v10);

    v15[0] = self->_rootViewController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (SKUINetworkErrorViewController *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftViewController setViewControllers:](self, "setViewControllers:", v11);
  }
  else
  {
    if (!+[SKUINetworkErrorViewController canDisplayError:](SKUINetworkErrorViewController, "canDisplayError:", v6))
    {
      NSLog(CFSTR("ERROR: %@"), v6);
      -[SKUIGiftViewController _finishGiftingWithResult:](self, "_finishGiftingWithResult:", 0);
      goto LABEL_7;
    }
    v11 = -[SKUINetworkErrorViewController initWithError:]([SKUINetworkErrorViewController alloc], "initWithError:", v6);
    -[SKUINetworkErrorViewController setClientContext:](v11, "setClientContext:", self->_clientContext);
    v14 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGiftViewController setViewControllers:](self, "setViewControllers:", v12);

  }
LABEL_7:
  placeholderViewController = self->_placeholderViewController;
  self->_placeholderViewController = 0;

}

- (void)_finishAuthenticateWithResponse:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  int v8;
  SKUIGift *gift;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v12
    && objc_msgSend(v12, "authenticateResponseType") == 4
    && (objc_msgSend(v12, "authenticatedAccount"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isManagedAppleID"),
        v7,
        !v8))
  {
    gift = self->_gift;
    objc_msgSend(v12, "authenticatedAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGift setSenderEmailAddress:](gift, "setSenderEmailAddress:", v11);

    -[SKUIGiftViewController _loadGiftConfiguration](self, "_loadGiftConfiguration");
  }
  else
  {
    -[SKUIGiftViewController _configurationDidLoadWithResult:error:](self, "_configurationDidLoadWithResult:error:", 0, v6);
  }

}

- (void)_finishGiftingWithResult:(BOOL)a3
{
  _BOOL8 v3;
  SKUIGiftViewControllerDelegate **p_giftDelegate;
  id WeakRetained;
  char v7;
  id v8;

  v3 = a3;
  p_giftDelegate = &self->_giftDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_giftDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_giftDelegate);
    objc_msgSend(v8, "giftViewController:didFinishWithResult:", self, v3);

  }
  else
  {
    -[SKUIGiftViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)_loadGiftConfiguration
{
  SKUIGiftConfiguration *v3;
  void *v4;
  SKUIGiftConfiguration *v5;
  SKUIGiftConfiguration *giftConfiguration;
  SKUIGiftConfiguration *v7;
  SKUIReloadConfigurationOperation *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  if (self->_clientContext)
  {
    v3 = [SKUIGiftConfiguration alloc];
    -[SKUIGiftViewController operationQueue](self, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SKUIGiftConfiguration initWithOperationQueue:clientContext:](v3, "initWithOperationQueue:clientContext:", v4, self->_clientContext);
    giftConfiguration = self->_giftConfiguration;
    self->_giftConfiguration = v5;

    v7 = self->_giftConfiguration;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke;
    v12[3] = &unk_1E73A2028;
    objc_copyWeak(&v13, &location);
    -[SKUIGiftConfiguration loadConfigurationWithCompletionBlock:](v7, "loadConfigurationWithCompletionBlock:", v12);
    objc_destroyWeak(&v13);
  }
  else
  {
    v8 = objc_alloc_init(SKUIReloadConfigurationOperation);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_3;
    v10[3] = &unk_1E73A1D78;
    objc_copyWeak(&v11, &location);
    -[SKUIReloadConfigurationOperation setOutputBlock:](v8, "setOutputBlock:", v10);
    -[SKUIGiftViewController operationQueue](self, "operationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v8);

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&location);
}

void __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_2;
  block[3] = &unk_1E73A2000;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_configurationDidLoadWithResult:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_4;
  block[3] = &unk_1E73A2050;
  v10 = v5;
  v7 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v11 = v6;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __48__SKUIGiftViewController__loadGiftConfiguration__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  SKUIClientContext *v3;

  if (*(_QWORD *)(a1 + 32))
    v3 = -[SKUIClientContext initWithConfigurationDictionary:]([SKUIClientContext alloc], "initWithConfigurationDictionary:", *(_QWORD *)(a1 + 32));
  else
    v3 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_clientContextDidLoadWithContext:error:", v3, *(_QWORD *)(a1 + 40));

}

- (id)_localizedString:(id)a3
{
  id v4;
  SKUIClientContext *clientContext;
  void *v6;
  void *v7;

  v4 = a3;
  clientContext = self->_clientContext;
  if (clientContext)
  {
    -[SKUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", v4, CFSTR("Gifting"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SKUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v4, &stru_1E73A9FB0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SKUIGift)gift
{
  return self->_gift;
}

- (SKUIGiftViewControllerDelegate)giftDelegate
{
  return (SKUIGiftViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_giftDelegate);
}

- (void)setGiftDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_giftDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
  objc_destroyWeak((id *)&self->_giftDelegate);
  objc_storeStrong((id *)&self->_gift, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithGift:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftViewController initWithGift:]";
}

@end
