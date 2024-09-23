@implementation VSIdentityProviderViewController

- (VSIdentityProviderViewController)initWithIdentityProvider:(id)a3
{
  id v5;
  VSIdentityProviderViewController *v6;
  VSIdentityProviderViewController *v7;
  NSOperationQueue *v8;
  NSOperationQueue *privateQueue;
  VSIdentityProviderRequestManager *v10;
  VSIdentityProviderRequestManager *requestManager;
  VSIdentityProviderRequestManager *v12;
  void *v13;
  VSIdentityProviderRequestManager *v14;
  void *v15;
  VSIdentityProviderRequestManager *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  VSRequireMainThread();
  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The identityProvider parameter must not be nil."));
  v19.receiver = self;
  v19.super_class = (Class)VSIdentityProviderViewController;
  v6 = -[VSIdentityProviderViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identityProvider, a3);
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    privateQueue = v7->_privateQueue;
    v7->_privateQueue = v8;

    -[NSOperationQueue setName:](v7->_privateQueue, "setName:", CFSTR("VSIdentityProviderViewController"));
    v10 = -[VSIdentityProviderRequestManager initWithIdentityProvider:]([VSIdentityProviderRequestManager alloc], "initWithIdentityProvider:", v5);
    requestManager = v7->_requestManager;
    v7->_requestManager = v10;

    -[VSIdentityProviderRequestManager setDelegate:](v7->_requestManager, "setDelegate:", v7);
    v12 = v7->_requestManager;
    VSMainConcurrencyBindingOptions();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderViewController vs_bind:toObject:withKeyPath:options:](v7, "vs_bind:toObject:withKeyPath:options:", CFSTR("viewModel"), v12, CFSTR("viewModel"), v13);

    v14 = v7->_requestManager;
    VSMainConcurrencyBindingOptions();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderRequestManager vs_bind:toObject:withKeyPath:options:](v14, "vs_bind:toObject:withKeyPath:options:", CFSTR("auditToken"), v7, CFSTR("auditToken"), v15);

    v16 = v7->_requestManager;
    VSMainConcurrencyBindingOptions();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderRequestManager vs_bind:toObject:withKeyPath:options:](v16, "vs_bind:toObject:withKeyPath:options:", CFSTR("canIssuePrivacyVouchers"), v7, CFSTR("canIssuePrivacyVouchers"), v17);

  }
  return v7;
}

- (VSIdentityProviderViewController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSIdentityProviderViewController)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The %@ initializer is not available."), v6);

  return 0;
}

- (VSIdentityProviderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The %@ initializer is not available."), v7);

  return 0;
}

- (void)dealloc
{
  VSViewModel *v3;
  void *v4;
  objc_super v5;

  VSRequireMainThread();
  v3 = self->_viewModel;
  if (v3)
    -[VSIdentityProviderViewController _stopObservingViewModel:](self, "_stopObservingViewModel:", v3);
  -[VSIdentityProviderViewController privateQueue](self, "privateQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllOperations");

  v5.receiver = self;
  v5.super_class = (Class)VSIdentityProviderViewController;
  -[VSIdentityProviderViewController dealloc](&v5, sel_dealloc);
}

- (void)_startObservingViewModel:(id)a3
{
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("validationState"), 3, kVSKeyValueObservingContext_ViewModelValidationState);
}

- (void)_stopObservingViewModel:(id)a3
{
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("validationState"), kVSKeyValueObservingContext_ViewModelValidationState);
}

- (void)_signInButtonPressed:(id)a3
{
  id v3;

  -[VSIdentityProviderViewController viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValidationState:", 1);

}

- (void)_showValidationAlertForError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  VSErrorLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[VSIdentityProviderViewController _showValidationAlertForError:].cold.1((uint64_t)v4, v5);

  VSAlertForError(v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_startValidation
{
  VSSpinnerTitleView *v3;
  void *v4;
  void *v5;
  void *v6;
  VSSpinnerTitleView *v7;

  -[VSIdentityProviderViewController _hideNavigationBarButtons](self, "_hideNavigationBarButtons");
  v3 = [VSSpinnerTitleView alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CREDENTIAL_ENTRY_VERIFYING"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VSSpinnerTitleView initWithTitle:](v3, "initWithTitle:", v5);

  -[VSIdentityProviderViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleView:", v7);

  -[UIViewController vs_beginIgnoringInteraction](self, "vs_beginIgnoringInteraction");
}

- (void)_stopValidationAndShowButtons:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  -[VSIdentityProviderViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleView:", 0);

  -[UIViewController vs_endIgnoringInteraction](self, "vs_endIgnoringInteraction");
  if (v3)
    -[VSIdentityProviderViewController _showNavigationBarButtons](self, "_showNavigationBarButtons");
}

- (void)_showNavigationBarButtons
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  -[VSIdentityProviderViewController navigationItem](self, "navigationItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderViewController signInButtonItem](self, "signInButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v3);

  if (-[VSIdentityProviderViewController isCancellationAllowed](self, "isCancellationAllowed"))
  {
    -[VSIdentityProviderViewController viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInAuthenticationShareFlow");

    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      v8 = CFSTR("NOT_NOW_BUTTON_TITLE");
    else
      v8 = CFSTR("CANCEL_TITLE");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", v9, 0, self, sel__cancelButtonPressed_);
    objc_msgSend(v11, "setLeftBarButtonItem:", v10);
    objc_msgSend(v11, "setHidesBackButton:", 1);

  }
  else
  {
    objc_msgSend(v11, "setLeftBarButtonItem:", 0);
    objc_msgSend(v11, "setHidesBackButton:", 0);
  }

}

- (void)_hideNavigationBarButtons
{
  id v2;

  -[VSIdentityProviderViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidesBackButton:", 1);
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);
  objc_msgSend(v2, "setRightBarButtonItem:", 0);

}

- (id)_logoLoadOperationForPreferredImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  VSImageLoadOperation *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  VSImageLoadOperation *v17;
  id v18;
  id v19;
  id location;

  height = a3.height;
  width = a3.width;
  -[VSIdentityProviderViewController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_255E8E790))
  {
    v7 = v6;
    objc_msgSend(v7, "logoProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      objc_initWeak(&location, self);
      v11 = -[VSImageLoadOperation initWithItemProvider:preferredImageSize:]([VSImageLoadOperation alloc], "initWithItemProvider:preferredImageSize:", v10, width, height);
      -[VSImageLoadOperation setNonAppInitiated:](v11, "setNonAppInitiated:", 1);
      -[VSIdentityProviderViewController auditToken](self, "auditToken");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSImageLoadOperation setAuditToken:](v11, "setAuditToken:", v12);

      -[VSIdentityProviderViewController setLogoLoadOperation:](self, "setLogoLoadOperation:", v11);
      v16 = MEMORY[0x24BDAC760];
      objc_copyWeak(&v19, &location);
      v17 = v11;
      v18 = v7;
      VSMainThreadOperationWithBlock();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addDependency:", v17, v16, 3221225472, __76__VSIdentityProviderViewController__logoLoadOperationForPreferredImageSize___block_invoke, &unk_24FE19C28);
      VSEnqueueCompletionOperation();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF8CA8]), "initWithOperation:timeout:", v17, 0.3);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __76__VSIdentityProviderViewController__logoLoadOperationForPreferredImageSize___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(a1[4], "result");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forceUnwrapObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "setLogo:", v5);
    objc_msgSend(a1[5], "setLogoFinishedLoading:", 1);

    WeakRetained = v6;
  }

}

- (void)_showViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VSIdentityProviderViewController _stopValidationAndShowButtons:](self, "_stopValidationAndShowButtons:", 1);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VSIdentityProviderViewController childViewControllers](self, "childViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "willMoveToParentViewController:", 0);
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeFromSuperview");

        objc_msgSend(v10, "removeFromParentViewController");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[VSIdentityProviderViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v4, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAutoresizingMask:", 18);
  -[VSIdentityProviderViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  objc_msgSend(v12, "setFrame:");
  objc_msgSend(v13, "addSubview:", v12);
  objc_msgSend(v4, "didMoveToParentViewController:", self);
  -[UIViewController vs_updateNavigationItemAndForceViewReloadWithSearchController:](self, "vs_updateNavigationItemAndForceViewReloadWithSearchController:", 0);

}

- (void)_dismiss
{
  id v3;

  -[VSIdentityProviderViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissIdentityProviderViewController:", self);

}

- (void)_didCancel
{
  id v3;

  -[VSIdentityProviderViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identityProviderViewControllerDidCancel:", self);

}

- (void)setViewModel:(id)a3
{
  id v5;
  VSViewModel *viewModel;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id location;

  v5 = a3;
  viewModel = self->_viewModel;
  if (viewModel)
    -[VSIdentityProviderViewController _stopObservingViewModel:](self, "_stopObservingViewModel:", self->_viewModel);
  objc_storeStrong((id *)&self->_viewModel, a3);
  +[VSViewControllerFactory sharedFactory](VSViewControllerFactory, "sharedFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = v5;
    VSMainConcurrencyBindingOptions();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderViewController vs_bind:toObject:withKeyPath:options:](self, "vs_bind:toObject:withKeyPath:options:", CFSTR("title"), v8, CFSTR("title"), v9);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = (void *)MEMORY[0x24BDBCE88];
        v11 = *MEMORY[0x24BDBCAB8];
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "raise:format:", v11, CFSTR("Unexpectedly, viewModel was %@, instead of VSCuratedViewModel."), v13);

      }
      v14 = v8;
      objc_msgSend(v14, "beginValidationButtonTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", v15, 0, self, sel__signInButtonPressed_);
      VSMainConcurrencyBindingOptions();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "vs_bind:toObject:withKeyPath:options:", CFSTR("enabled"), v14, CFSTR("beginValidationButtonEnabled"), v17);

    }
    else
    {
      v16 = 0;
    }
    -[VSIdentityProviderViewController setSignInButtonItem:](self, "setSignInButtonItem:", v16);
    -[VSIdentityProviderViewController _startObservingViewModel:](self, "_startObservingViewModel:", v8);
    objc_msgSend(v7, "authenticationViewControllerForViewModel:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "forceUnwrapObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setDelegate:", self);
    VSMainConcurrencyBindingOptions();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "vs_bind:toObject:withKeyPath:options:", CFSTR("cancellationAllowed"), self, CFSTR("cancellationAllowed"), v20);

    objc_initWeak(&location, self);
    objc_copyWeak(&v29, &location);
    v21 = v19;
    VSMainThreadOperationWithBlock();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v21, "preferredLogoSize");
      -[VSIdentityProviderViewController _logoLoadOperationForPreferredImageSize:](self, "_logoLoadOperationForPreferredImageSize:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v28 = v7;
        v25 = v23;
        -[VSIdentityProviderViewController privateQueue](self, "privateQueue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addOperation:", v25);

        objc_msgSend(v22, "addDependency:", v25);
        v7 = v28;
      }

    }
    VSEnqueueCompletionOperation();

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    goto LABEL_16;
  }
  -[VSIdentityProviderViewController vs_unbind:](self, "vs_unbind:", CFSTR("title"));
  if (!viewModel)
  {
    objc_msgSend(v7, "loadingViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "forceUnwrapObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[VSIdentityProviderViewController _showViewController:](self, "_showViewController:", v8);
LABEL_16:

    goto LABEL_17;
  }
  -[VSIdentityProviderViewController _dismiss](self, "_dismiss");
LABEL_17:
  -[VSIdentityProviderViewController _showNavigationBarButtons](self, "_showNavigationBarButtons");

}

void __49__VSIdentityProviderViewController_setViewModel___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_showViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "identityProviderViewControllerDidFinishLoading:", *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (void)enqueueRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSIdentityProviderViewController requestManager](self, "requestManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enqueueRequest:", v4);

}

- (void)sendErrorMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSIdentityProviderViewController requestManager](self, "requestManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendErrorMessage:", v4);

}

- (BOOL)currentAuthenticationViewControllerSupportsPreAuth
{
  void *v2;
  void *v3;
  char v4;

  -[VSIdentityProviderViewController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_255EBDD20);
  else
    v4 = 0;

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  VSIdentityProviderViewController *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  objc_super v25;

  if ((void *)kVSKeyValueObservingContext_ViewModelValidationState == a6)
  {
    v11 = *MEMORY[0x24BDD0E80];
    v12 = a5;
    objc_msgSend(v12, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "unsignedIntegerValue");
    switch(v16)
    {
      case 0:
        if (v14 == 4 || v14 == 1)
        {
          v18 = self;
          v19 = 1;
          goto LABEL_17;
        }
        break;
      case 1:
        goto LABEL_12;
      case 2:
        if (!v14)
LABEL_12:
          -[VSIdentityProviderViewController _startValidation](self, "_startValidation");
        break;
      case 3:
        if (v14 == 2)
        {
          v18 = self;
          v19 = 0;
LABEL_17:
          -[VSIdentityProviderViewController _stopValidationAndShowButtons:](v18, "_stopValidationAndShowButtons:", v19);
        }
        break;
      case 4:
        if (v14 == 2)
        {
          -[VSIdentityProviderViewController _stopValidationAndShowButtons:](self, "_stopValidationAndShowButtons:", 1);
          v20 = (void *)MEMORY[0x24BDF8C38];
          -[VSIdentityProviderViewController viewModel](self, "viewModel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "error");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "optionalWithObject:", v22);
          v24 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "forceUnwrapObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSIdentityProviderViewController _showValidationAlertForError:](self, "_showValidationAlertForError:", v23);

        }
        break;
      default:
        return;
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)VSIdentityProviderViewController;
    v10 = a5;
    -[VSIdentityProviderViewController observeValueForKeyPath:ofObject:change:context:](&v25, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);

  }
}

- (void)identityProviderRequestManager:(id)a3 finishedRequest:(id)a4 withResult:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[VSIdentityProviderViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identityProviderViewController:didFinishRequest:withResult:", self, v8, v7);

}

- (void)identityProviderRequestManager:(id)a3 didAuthenticateAccount:(id)a4 forRequest:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[VSIdentityProviderViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "identityProviderViewController:didAuthenticateAccount:forRequest:", self, v9, v7);

}

- (BOOL)identityProviderRequestManager:(id)a3 requestsAlert:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VSIdentityProviderAlertAction *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v26;
  void *v27;
  VSIdentityProviderViewController *v28;
  id v29;
  id obj;
  id val;
  _QWORD v32[5];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id from;
  id location;
  uint8_t buf[4];
  id v42;
  _BYTE v43[128];
  _QWORD v44[3];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v28 = self;
  v29 = a4;
  -[VSIdentityProviderViewController currentlyPresentedIdentityProviderAlert](self, "currentlyPresentedIdentityProviderAlert");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v6;
  if (v6)
  {
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
    -[VSIdentityProviderViewController setCurrentlyPresentedIdentityProviderAlert:](self, "setCurrentlyPresentedIdentityProviderAlert:", 0);
  }
  v7 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(v29, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  val = (id)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, val);
  objc_initWeak(&from, v28);
  objc_msgSend(v29, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    v11 = objc_alloc_init(VSIdentityProviderAlertAction);
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ERROR_DISMISS_BUTTON_TITLE"), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSIdentityProviderAlertAction setTitle:](v11, "setTitle:", v13);

    -[VSIdentityProviderAlertAction setStyle:](v11, "setStyle:", 0);
    v44[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v10;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "style");
        v20 = (void *)MEMORY[0x24BDF67E8];
        objc_msgSend(v18, "title");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        if (v19 == 1)
          v22 = 1;
        else
          v22 = 2 * (v19 == 2);
        v32[2] = __81__VSIdentityProviderViewController_identityProviderRequestManager_requestsAlert___block_invoke;
        v32[3] = &unk_24FE19C50;
        objc_copyWeak(&v33, &from);
        objc_copyWeak(&v34, &location);
        v32[4] = v18;
        objc_msgSend(v20, "actionWithTitle:style:handler:", v21, v22, v32);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(val, "addAction:", v23);
        objc_destroyWeak(&v34);
        objc_destroyWeak(&v33);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v15);
  }

  VSDefaultLogObject();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v29;
    _os_log_impl(&dword_2303C5000, v24, OS_LOG_TYPE_DEFAULT, "Presenting identity provider alert %@", buf, 0xCu);
  }

  -[VSIdentityProviderViewController setCurrentlyPresentedIdentityProviderAlert:](v28, "setCurrentlyPresentedIdentityProviderAlert:", val);
  -[VSIdentityProviderViewController presentViewController:animated:completion:](v28, "presentViewController:animated:completion:", val, 1, 0);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __81__VSIdentityProviderViewController_identityProviderRequestManager_requestsAlert___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void (**v4)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    v2 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(WeakRetained, "setCurrentlyPresentedIdentityProviderAlert:", 0);
    objc_msgSend(a1[4], "callback");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(a1[4], "callback");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

    }
  }

}

- (void)identityProviderRequestManager:(id)a3 didUpdateLogoViewModel:(id)a4
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = objc_msgSend(v9, "conformsToProtocol:", &unk_255E8E790);
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v9, "preferredLogoSize");
    -[VSIdentityProviderViewController _logoLoadOperationForPreferredImageSize:](self, "_logoLoadOperationForPreferredImageSize:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[VSIdentityProviderViewController privateQueue](self, "privateQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addOperation:", v7);

    }
    v6 = v9;
  }

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSIdentityProviderViewController;
  -[VSIdentityProviderViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[UIViewController vs_adjustContentScrollViewInsets](self, "vs_adjustContentScrollViewInsets");
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (VSIdentityProviderViewControllerDelegate)delegate
{
  return (VSIdentityProviderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (BOOL)canIssuePrivacyVouchers
{
  return self->_canIssuePrivacyVouchers;
}

- (void)setCanIssuePrivacyVouchers:(BOOL)a3
{
  self->_canIssuePrivacyVouchers = a3;
}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (void)setCancellationAllowed:(BOOL)a3
{
  self->_cancellationAllowed = a3;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (VSImageLoadOperation)logoLoadOperation
{
  return self->_logoLoadOperation;
}

- (void)setLogoLoadOperation:(id)a3
{
  objc_storeStrong((id *)&self->_logoLoadOperation, a3);
}

- (VSViewModel)viewModel
{
  return self->_viewModel;
}

- (VSIdentityProviderRequestManager)requestManager
{
  return self->_requestManager;
}

- (void)setRequestManager:(id)a3
{
  objc_storeStrong((id *)&self->_requestManager, a3);
}

- (UIBarButtonItem)signInButtonItem
{
  return self->_signInButtonItem;
}

- (void)setSignInButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_signInButtonItem, a3);
}

- (UIBarButtonItem)cancelButtonItem
{
  return self->_cancelButtonItem;
}

- (void)setCancelButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonItem, a3);
}

- (UIViewController)currentlyPresentedIdentityProviderAlert
{
  return self->_currentlyPresentedIdentityProviderAlert;
}

- (void)setCurrentlyPresentedIdentityProviderAlert:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyPresentedIdentityProviderAlert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyPresentedIdentityProviderAlert, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_signInButtonItem, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_logoLoadOperation, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

- (void)_showValidationAlertForError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Will show validation alert for error: %@", (uint8_t *)&v2, 0xCu);
}

@end
