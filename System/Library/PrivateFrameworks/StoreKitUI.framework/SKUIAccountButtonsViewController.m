@implementation SKUIAccountButtonsViewController

- (SKUIAccountButtonsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SKUIAccountButtonsViewController *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIAccountButtonsViewController initWithNibName:bundle:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIAccountButtonsViewController;
  v8 = -[SKUIAccountButtonsViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__accountStoreChangedNotification_, *MEMORY[0x1E0DAF718], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__restrictionsChangedNotification_, *MEMORY[0x1E0D46EC8], 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D46EC8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DAF718], 0);
  -[SKUIAccountButtonsView appleIDButton](self->_buttonsView, "appleIDButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 64);

  -[SKUIAccountButtonsView ECommerceButton](self->_buttonsView, "ECommerceButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, 0, 64);

  -[SKUIAccountButtonsView redeemButton](self->_buttonsView, "redeemButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, 0, 64);

  -[SKUIAccountButtonsView termsAndConditionsButton](self->_buttonsView, "termsAndConditionsButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, 0, 64);

  v8.receiver = self;
  v8.super_class = (Class)SKUIAccountButtonsViewController;
  -[SKUIAccountButtonsViewController dealloc](&v8, sel_dealloc);
}

- (BOOL)isGiftingHidden
{
  void *v2;
  char v3;

  -[SKUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGiftingHidden");

  return v3;
}

- (BOOL)isTermsAndConditionsHidden
{
  void *v2;
  char v3;

  -[SKUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTermsAndConditionsHidden");

  return v3;
}

- (void)setECommerceLink:(id)a3
{
  void *v5;
  void *v6;
  SKUILink *v7;

  v7 = (SKUILink *)a3;
  if (self->_ecommerceLink != v7)
  {
    objc_storeStrong((id *)&self->_ecommerceLink, a3);
    -[SKUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUILink title](v7, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setECommerceLinkTitle:", v6);

  }
}

- (void)setGiftingHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SKUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGiftingHidden:", v3);

}

- (void)setTermsAndConditionsHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SKUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTermsAndConditionsHidden:", v3);

}

- (void)loadView
{
  void *v3;

  -[SKUIAccountButtonsViewController _buttonsView](self, "_buttonsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIAccountButtonsViewController setView:](self, "setView:", v3);

  -[SKUIAccountButtonsViewController _reloadAccountsButton](self, "_reloadAccountsButton");
  -[SKUIAccountButtonsViewController _reloadRestrictions](self, "_reloadRestrictions");
}

- (void)_ecommerceLinkAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SKUIAccountButtonsViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "accountButtonsViewControllerDidTapECommerceLink:", self);
  }
  else
  {
    -[SKUILink URL](self->_ecommerceLink, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      SKUIMetricsOpenURL(v4);

  }
}

- (void)_giftAction:(id)a3
{
  SKUIGiftViewController *v4;
  SKUIGift *v5;

  v5 = -[SKUIGift initWithGiftCategory:]([SKUIGift alloc], "initWithGiftCategory:", 0);
  v4 = -[SKUIGiftViewController initWithGift:]([SKUIGiftViewController alloc], "initWithGift:", v5);
  -[SKUIGiftViewController setClientContext:](v4, "setClientContext:", self->_clientContext);
  -[SKUIAccountButtonsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_redeemButtonAction:(id)a3
{
  SKUIRedeemViewController *v4;

  v4 = -[SKUIRedeemViewController initWithRedeemCategory:]([SKUIRedeemViewController alloc], "initWithRedeemCategory:", 0);
  -[SKUIRedeemViewController setClientContext:](v4, "setClientContext:", self->_clientContext);
  -[SKUIAccountButtonsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_signInButtonAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0DAF488]);
  objc_msgSend(MEMORY[0x1E0DAF490], "contextForSignIn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAuthenticationContext:", v6);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__SKUIAccountButtonsViewController__signInButtonAction___block_invoke;
  v8[3] = &unk_1E73A1FD8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "startWithAuthenticateResponseBlock:", v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __56__SKUIAccountButtonsViewController__signInButtonAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__SKUIAccountButtonsViewController__signInButtonAction___block_invoke_2;
  v5[3] = &unk_1E73A3138;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __56__SKUIAccountButtonsViewController__signInButtonAction___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reloadAccountsButton");

  if (objc_msgSend(*(id *)(a1 + 32), "authenticateResponseType") == 4)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "_sendDidSignIn");

  }
}

- (void)_termsAndConditionsButtonAction:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "termsAndConditionsURL", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SKUIMetricsOpenURL(v3);

}

- (void)_usernameButtonAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SKUIClientContext *clientContext;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  BOOL v15;
  char v16;
  SKUIClientContext *v17;
  SKUIClientContext *v18;
  void *v19;
  SKUIClientContext *v20;
  SKUIClientContext *v21;
  void *v22;
  SKUIClientContext *v23;
  SKUIClientContext *v24;
  void *v25;
  SKUIClientContext *v26;
  SKUIClientContext *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[SKUIAccountButtonsViewController _reloadAccountsButton](self, "_reloadAccountsButton");
    goto LABEL_28;
  }
  if (!-[SKUIClientContext isMultiUser](self->_clientContext, "isMultiUser")
    || !-[SKUIClientContext isManagedAppleID](self->_clientContext, "isManagedAppleID"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC3450]);
    v8 = (void *)MEMORY[0x1E0D002B8];
    objc_msgSend(v6, "accountName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "formattedUsernameFromUsername:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMessage:", v10);

    objc_msgSend(v7, "setPreferredStyle:", 1);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("SIGN_IN_ALERT_TITLE"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SIGN_IN_ALERT_TITLE"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v12);

    v13 = -[SKUIClientContext isMultiUser](self->_clientContext, "isMultiUser");
    v14 = MEMORY[0x1E0C809B0];
    if (v13)
    {
      objc_initWeak(&location, self);
    }
    else
    {
      v15 = -[SKUIClientContext isManagedAppleID](self->_clientContext, "isManagedAppleID");
      objc_initWeak(&location, self);
      if (v15)
      {
        v16 = 1;
LABEL_16:
        v20 = self->_clientContext;
        v21 = v20;
        if (v20)
          -[SKUIClientContext localizedStringForKey:](v20, "localizedStringForKey:", CFSTR("SIGN_IN_ALERT_SIGN_OUT"));
        else
          +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SIGN_IN_ALERT_SIGN_OUT"), 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v31[0] = v14;
        v31[1] = 3221225472;
        v31[2] = __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_2;
        v31[3] = &unk_1E739FF68;
        objc_copyWeak(&v32, &location);
        objc_msgSend(v7, "_addActionWithTitle:style:handler:", v22, 0, v31);

        if ((v16 & 1) == 0)
        {
          v23 = self->_clientContext;
          v24 = v23;
          if (v23)
            -[SKUIClientContext localizedStringForKey:](v23, "localizedStringForKey:", CFSTR("SIGN_IN_ALERT_IFORGOT"));
          else
            +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SIGN_IN_ALERT_IFORGOT"), 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v29[0] = v14;
          v29[1] = 3221225472;
          v29[2] = __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_3;
          v29[3] = &unk_1E739FF68;
          objc_copyWeak(&v30, &location);
          objc_msgSend(v7, "_addActionWithTitle:style:handler:", v25, 0, v29);

          objc_destroyWeak(&v30);
        }
        v26 = self->_clientContext;
        v27 = v26;
        if (v26)
          -[SKUIClientContext localizedStringForKey:](v26, "localizedStringForKey:", CFSTR("CANCEL"));
        else
          +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CANCEL"), 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "_addActionWithTitle:style:handler:", v28, 1, 0);
        -[SKUIAccountButtonsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);

        goto LABEL_28;
      }
    }
    v17 = self->_clientContext;
    v18 = v17;
    if (v17)
      -[SKUIClientContext localizedStringForKey:](v17, "localizedStringForKey:", CFSTR("SIGN_IN_ALERT_VIEW_APPLE_ID"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SIGN_IN_ALERT_VIEW_APPLE_ID"), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = v14;
    v33[1] = 3221225472;
    v33[2] = __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke;
    v33[3] = &unk_1E739FF68;
    objc_copyWeak(&v34, &location);
    objc_msgSend(v7, "_addActionWithTitle:style:handler:", v19, 0, v33);

    objc_destroyWeak(&v34);
    v16 = 0;
    goto LABEL_16;
  }
LABEL_28:

}

void __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_viewAppleID");

}

void __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_signOut");

}

void __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_4;
  block[3] = &unk_1E739FF68;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_openIForgot");

}

- (void)_accountStoreChangedNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SKUIAccountButtonsViewController__accountStoreChangedNotification___block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __69__SKUIAccountButtonsViewController__accountStoreChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadAccountsButton");
}

- (void)_restrictionsChangedNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SKUIAccountButtonsViewController__restrictionsChangedNotification___block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __69__SKUIAccountButtonsViewController__restrictionsChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadRestrictions");
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
    return 30;
  else
    return 2;
}

- (id)_buttonsView
{
  SKUIAccountButtonsView *buttonsView;
  SKUIAccountButtonsView *v4;
  SKUIAccountButtonsView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  buttonsView = self->_buttonsView;
  if (!buttonsView)
  {
    v4 = -[SKUIAccountButtonsView initWithClientContext:]([SKUIAccountButtonsView alloc], "initWithClientContext:", self->_clientContext);
    v5 = self->_buttonsView;
    self->_buttonsView = v4;

    -[SKUIAccountButtonsView ECommerceButton](self->_buttonsView, "ECommerceButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__ecommerceLinkAction_, 64);

    -[SKUIAccountButtonsView giftingButton](self->_buttonsView, "giftingButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__giftAction_, 64);

    -[SKUIAccountButtonsView redeemButton](self->_buttonsView, "redeemButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__redeemButtonAction_, 64);

    -[SKUIAccountButtonsView termsAndConditionsButton](self->_buttonsView, "termsAndConditionsButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__termsAndConditionsButtonAction_, 64);

    buttonsView = self->_buttonsView;
  }
  return buttonsView;
}

- (void)_openIForgot
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0DDC188]);
  v5 = (id)objc_msgSend(v2, "initWithURLBagKey:", *MEMORY[0x1E0DAFD20]);
  objc_msgSend(v5, "setITunesStoreURL:", 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC180]), "initWithOpenURLRequest:", v5);
  objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v3);

}

- (void)_reloadAccountsButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SKUIClientContext *clientContext;
  SKUIClientContext *v9;
  void *v10;
  void *v11;
  SKUIAccountButtonsView *buttonsView;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[SKUIAccountButtonsView appleIDButton](self->_buttonsView, "appleIDButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v5 = (void *)MEMORY[0x1E0D002B8];
    objc_msgSend(v15, "accountName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedUsernameFromUsername:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("ACCOUNT_BUTTON_APPLE_ID"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ACCOUNT_BUTTON_APPLE_ID"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%@"), 0, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:forState:", v11, 0);
    objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 64);
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__usernameButtonAction_, 64);
    buttonsView = self->_buttonsView;
    objc_msgSend(v15, "creditsString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIAccountButtonsView setAccountCredits:](buttonsView, "setAccountCredits:", v13);

  }
  else
  {
    v9 = self->_clientContext;
    if (v9)
      -[SKUIClientContext localizedStringForKey:](v9, "localizedStringForKey:", CFSTR("ACCOUNT_BUTTON_SIGN_IN"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ACCOUNT_BUTTON_SIGN_IN"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:forState:", v14, 0);

    objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 64);
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__signInButtonAction_, 64);
    -[SKUIAccountButtonsView setAccountCredits:](self->_buttonsView, "setAccountCredits:", 0);
  }
  -[SKUIAccountButtonsView setNeedsLayout](self->_buttonsView, "setNeedsLayout");

}

- (void)_reloadRestrictions
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]);

  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunningInStoreDemoMode");

  -[SKUIAccountButtonsView appleIDButton](self->_buttonsView, "appleIDButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4 == 2)
    v9 = 0;
  else
    v9 = v6 ^ 1u;
  objc_msgSend(v7, "setEnabled:", v9);

  -[SKUIAccountButtonsView giftingButton](self->_buttonsView, "giftingButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v6 ^ 1u);

  -[SKUIAccountButtonsView redeemButton](self->_buttonsView, "redeemButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v6 ^ 1u);

}

- (void)_sendDidSignIn
{
  SKUIAccountButtonsDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "accountButtonsViewControllerDidSignIn:", self);

  }
}

- (void)_signOut
{
  void *v3;
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v7, "signOutAccount:", v3);
    -[SKUIAccountButtonsViewController _reloadAccountsButton](self, "_reloadAccountsButton");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "accountButtonsViewControllerDidSignOut:", self);

    }
  }

}

- (void)_viewAppleID
{
  id v3;
  void *v4;
  id v5;

  -[SKUIClientContext clientInterface](self->_clientContext, "clientInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0DDC1E0]);
  objc_msgSend(v3, "setCanMoveToOverlay:", 0);
  objc_msgSend(v3, "setClientInterface:", v5);
  objc_msgSend(v3, "setStyle:", 2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v3);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  -[SKUIAccountButtonsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIAccountButtonsDelegate)delegate
{
  return (SKUIAccountButtonsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUILink)ECommerceLink
{
  return self->_ecommerceLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecommerceLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_buttonsView, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIAccountButtonsViewController initWithNibName:bundle:]";
}

@end
