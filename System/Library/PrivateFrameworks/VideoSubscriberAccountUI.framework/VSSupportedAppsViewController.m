@implementation VSSupportedAppsViewController

- (VSSupportedAppsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  VSSupportedAppsViewController *v4;
  NSOperationQueue *v5;
  NSOperationQueue *privateQueue;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSSupportedAppsViewController;
  v4 = -[VSSupportedAppsViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    privateQueue = v4->_privateQueue;
    v4->_privateQueue = v5;

    -[NSOperationQueue setName:](v4->_privateQueue, "setName:", CFSTR("VSSupportedAppsViewController"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v4->_privateQueue, "setMaxConcurrentOperationCount:", 1);
    -[VSSupportedAppsViewController navigationItem](v4, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, v4, sel__doneButtonPresed_);
    objc_msgSend(v7, "setRightBarButtonItem:", v8);

  }
  return v4;
}

- (void)_didFinish
{
  id v3;

  -[VSSupportedAppsViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedAppsViewControllerDidFinish:", self);

}

- (void)_presentError:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__VSSupportedAppsViewController__presentError___block_invoke;
  v5[3] = &unk_24FE1AC20;
  v5[4] = self;
  VSAlertForError(a3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  VSPerformBlockOnMainThread();

}

uint64_t __47__VSSupportedAppsViewController__presentError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinish");
}

uint64_t __47__VSSupportedAppsViewController__presentError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_displayApps
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VSSupportedAppsViewController supportedApps](self, "supportedApps");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v8, "shortenedDisplayName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "vs_setObjectUnlessNil:forKey:", v10, CFSTR("appName"));

        objc_msgSend(v8, "icon");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "vs_setObjectUnlessNil:forKey:", v11, CFSTR("appIcon"));

        objc_msgSend(v3, "addObject:", v9);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v3, "count"))
    -[VSSupportedAppsViewController setApps:](self, "setApps:", v3);

}

- (void)beginLoadingImages
{
  void *v3;
  void *v4;
  VSLoadAllAppIconsOperation *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  objc_copyWeak(&v8, &location);
  VSMainThreadOperationWithBlock();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSupportedAppsViewController supportedApps](self, "supportedApps", v7, 3221225472, __51__VSSupportedAppsViewController_beginLoadingImages__block_invoke, &unk_24FE1A3F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VSLoadAllAppIconsOperation initWithApps:shouldPrecomposeIcon:]([VSLoadAllAppIconsOperation alloc], "initWithApps:shouldPrecomposeIcon:", v4, 0);
  objc_msgSend(v3, "addDependency:", v5);
  -[VSSupportedAppsViewController privateQueue](self, "privateQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v5);

  VSEnqueueCompletionOperation();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __51__VSSupportedAppsViewController_beginLoadingImages__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_displayApps");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)VSSupportedAppsViewController;
  -[VSSupportedAppsViewController viewDidLoad](&v34, sel_viewDidLoad);
  -[VSSupportedAppsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 2);
  objc_msgSend(v5, "startAnimating");
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v5);
  VSMainConcurrencyBindingOptions();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = *MEMORY[0x24BDF8F60];
  objc_msgSend(v7, "setObject:forKey:", *MEMORY[0x24BDD0E38], *MEMORY[0x24BDF8F60]);
  objc_msgSend(v5, "vs_bind:toObject:withKeyPath:options:", CFSTR("hidden"), self, CFSTR("apps"), v7);

  v9 = objc_alloc_init(MEMORY[0x24BEBFEC8]);
  VSMainConcurrencyBindingOptions();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vs_bind:toObject:withKeyPath:options:", CFSTR("apps"), self, CFSTR("apps"), v10);

  VSMainConcurrencyBindingOptions();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vs_bind:toObject:withKeyPath:options:", CFSTR("title"), self, CFSTR("title"), v11);

  -[VSSupportedAppsViewController addChildViewController:](self, "addChildViewController:", v9);
  objc_msgSend(v9, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v12);
  objc_msgSend(v9, "didMoveToParentViewController:", self);
  VSMainConcurrencyBindingOptions();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "setObject:forKey:", *MEMORY[0x24BDD0E30], v8);
  objc_msgSend(v12, "vs_bind:toObject:withKeyPath:options:", CFSTR("hidden"), self, CFSTR("apps"), v14);

  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v18);

  objc_msgSend(v5, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v21);

  objc_msgSend(v12, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v24);

  objc_msgSend(v12, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v27);

  objc_msgSend(v12, "leftAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v30);

  objc_msgSend(v12, "rightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v33);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v15);
}

- (VSOptional)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_identityProvider, a3);
}

- (NSArray)supportedApps
{
  return self->_supportedApps;
}

- (void)setSupportedApps:(id)a3
{
  objc_storeStrong((id *)&self->_supportedApps, a3);
}

- (VSSupportedAppsViewControllerDelegate)delegate
{
  return (VSSupportedAppsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_supportedApps, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

@end
