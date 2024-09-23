@implementation SKUIDonationViewController

- (id)_initSKUIDonationViewController
{
  id v3;
  void *v4;
  void *v5;
  SKUIDonationViewController *v6;
  SKUIDonationViewController *v7;
  objc_super v9;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDonationViewController _initSKUIDonationViewController].cold.1();
  }
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "_systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v9.receiver = self;
  v9.super_class = (Class)SKUIDonationViewController;
  v6 = -[SKUIDonationViewController initWithRootViewController:](&v9, sel_initWithRootViewController_, v3);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placeholderViewController, v3);
    -[SKUIDonationViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
  }

  return v7;
}

- (SKUIDonationViewController)initWithCharityIdentifier:(id)a3
{
  id v4;
  SKUIDonationViewController *v5;
  uint64_t v6;
  NSString *charityID;

  v4 = a3;
  v5 = -[SKUIDonationViewController _initSKUIDonationViewController](self, "_initSKUIDonationViewController");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    charityID = v5->_charityID;
    v5->_charityID = (NSString *)v6;

  }
  return v5;
}

- (SKUIDonationViewController)initWithURL:(id)a3
{
  void *v4;
  SKUIDonationViewController *v5;

  objc_msgSend(a3, "valueForQueryParameter:", CFSTR("charity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKUIDonationViewController initWithCharityIdentifier:](self, "initWithCharityIdentifier:", v4);

  return v5;
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
  SKUIClientContext **p_clientContext;
  UIViewController *placeholderViewController;
  void *v8;
  SKUIClientContext *v9;

  v5 = (SKUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    placeholderViewController = self->_placeholderViewController;
    if (*p_clientContext)
      -[SKUIClientContext localizedStringForKey:](*p_clientContext, "localizedStringForKey:", CFSTR("DONATION_FLOW_TITLE"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_TITLE"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setTitle:](placeholderViewController, "setTitle:", v8);

    v5 = v9;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  SKUIClientContext *clientContext;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = a3;
  if (!self->_donationConfiguration)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
    objc_msgSend(v5, "setAction:", sel__cancelButtonAction_);
    objc_msgSend(v5, "setTarget:", self);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("DONATION_FLOW_CANCEL_BUTTON"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DONATION_FLOW_CANCEL_BUTTON"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v7);

    -[SKUIDonationViewController topViewController](self, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", v5);

    objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SKUIDonationViewController _loadDonationConfiguration](self, "_loadDonationConfiguration");
    }
    else
    {
      objc_initWeak(&location, self);
      v12 = objc_alloc(MEMORY[0x1E0DAF488]);
      objc_msgSend(MEMORY[0x1E0DAF490], "contextForSignIn");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithAuthenticationContext:", v13);

      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __45__SKUIDonationViewController_viewWillAppear___block_invoke;
      v16[3] = &unk_1E73A1FD8;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v14, "startWithAuthenticateResponseBlock:", v16);
      objc_destroyWeak(&v17);

      objc_destroyWeak(&location);
    }

  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIDonationViewController;
  -[SKUIDonationViewController viewWillAppear:](&v15, sel_viewWillAppear_, v3);
}

void __45__SKUIDonationViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __45__SKUIDonationViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_1E73A1D50;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __45__SKUIDonationViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishAuthenticateWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_cancelButtonAction:(id)a3
{
  -[SKUIDonationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_configurationDidLoadWithResult:(BOOL)a3 error:(id)a4
{
  id v5;
  SKUIDonationConfiguration *donationConfiguration;
  void *v7;
  SKUIDonationAmountViewController *v8;
  void *v9;
  void *v10;
  SKUIDonationAmountViewController **v11;
  void *v12;
  void *v13;
  UIViewController *placeholderViewController;
  SKUIDonationAmountViewController *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  donationConfiguration = self->_donationConfiguration;
  if (self->_charityID)
  {
    -[SKUIDonationConfiguration charityForIdentifier:](donationConfiguration, "charityForIdentifier:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
LABEL_3:
      v8 = -[SKUIDonationAmountViewController initWithCharity:configuration:]([SKUIDonationAmountViewController alloc], "initWithCharity:configuration:", v7, self->_donationConfiguration);
      -[SKUIDonationViewController operationQueue](self, "operationQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIDonationStepViewController setOperationQueue:](v8, "setOperationQueue:", v9);

      -[SKUIDonationConfiguration loadLogoForCharity:](self->_donationConfiguration, "loadLogoForCharity:", v7);
      v16[0] = v8;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = (SKUIDonationAmountViewController **)v16;
      goto LABEL_10;
    }
  }
  else
  {
    -[SKUIDonationConfiguration allCharities](donationConfiguration, "allCharities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

    if (v7)
      goto LABEL_3;
  }
  if (!+[SKUINetworkErrorViewController canDisplayError:](SKUINetworkErrorViewController, "canDisplayError:", v5))
  {
    NSLog(CFSTR("[Donation]: Error: %@"), v5);
    -[SKUIDonationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    goto LABEL_11;
  }
  v8 = -[SKUINetworkErrorViewController initWithError:]([SKUINetworkErrorViewController alloc], "initWithError:", v5);
  -[SKUIDonationAmountViewController setClientContext:](v8, "setClientContext:", self->_clientContext);
  v15 = v8;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = &v15;
LABEL_10:
  objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDonationViewController setViewControllers:](self, "setViewControllers:", v13);

LABEL_11:
  placeholderViewController = self->_placeholderViewController;
  self->_placeholderViewController = 0;

}

- (void)_finishAuthenticateWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7 && objc_msgSend(v7, "authenticateResponseType") == 4)
    -[SKUIDonationViewController _loadDonationConfiguration](self, "_loadDonationConfiguration");
  else
    -[SKUIDonationViewController _configurationDidLoadWithResult:error:](self, "_configurationDidLoadWithResult:error:", 0, v6);

}

- (void)_loadDonationConfiguration
{
  SKUIDonationConfiguration *v3;
  void *v4;
  void *v5;
  SKUIDonationConfiguration *v6;
  SKUIDonationConfiguration *donationConfiguration;
  SKUIDonationConfiguration *v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = [SKUIDonationConfiguration alloc];
  -[SKUIDonationViewController operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIDonationViewController clientContext](self, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKUIDonationConfiguration initWithOperationQueue:clientContext:](v3, "initWithOperationQueue:clientContext:", v4, v5);
  donationConfiguration = self->_donationConfiguration;
  self->_donationConfiguration = v6;

  v8 = self->_donationConfiguration;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SKUIDonationViewController__loadDonationConfiguration__block_invoke;
  v9[3] = &unk_1E73A2028;
  objc_copyWeak(&v10, &location);
  -[SKUIDonationConfiguration loadConfigurationWithCompletionBlock:](v8, "loadConfigurationWithCompletionBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __56__SKUIDonationViewController__loadDonationConfiguration__block_invoke(uint64_t a1, char a2, void *a3)
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
  block[2] = __56__SKUIDonationViewController__loadDonationConfiguration__block_invoke_2;
  block[3] = &unk_1E73A2000;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __56__SKUIDonationViewController__loadDonationConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_configurationDidLoadWithResult:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (NSString)charityIdentifier
{
  return self->_charityID;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_donationConfiguration, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_charityID, 0);
}

- (void)_initSKUIDonationViewController
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDonationViewController _initSKUIDonationViewController]";
}

@end
