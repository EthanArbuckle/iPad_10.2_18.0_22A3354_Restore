@implementation PKIssuerProvisioningExtensionAuthorizationServiceViewController

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationServiceViewController;
  -[PKIssuerProvisioningExtensionAuthorizationServiceViewController beginRequestWithExtensionContext:](&v10, sel_beginRequestWithExtensionContext_, v4);
  -[PKIssuerProvisioningExtensionAuthorizationServiceViewController childViewControllers](self, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE66E708) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSExtensionPrincipalClass does not conform to PKIssuerProvisioningExtensionAuthorizationProviding"));
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __100__PKIssuerProvisioningExtensionAuthorizationServiceViewController_beginRequestWithExtensionContext___block_invoke;
  v7[3] = &unk_1E3E68760;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "setCompletionHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __100__PKIssuerProvisioningExtensionAuthorizationServiceViewController_beginRequestWithExtensionContext___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __100__PKIssuerProvisioningExtensionAuthorizationServiceViewController_beginRequestWithExtensionContext___block_invoke_2;
  v3[3] = &unk_1E3E66D38;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __100__PKIssuerProvisioningExtensionAuthorizationServiceViewController_beginRequestWithExtensionContext___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  _BYTE *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[968])
  {
    WeakRetained[968] = 1;
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_remoteViewControllerProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serviceViewControllerDidCompleteWithResult:", *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationServiceViewController;
  -[PKIssuerProvisioningExtensionAuthorizationServiceViewController loadView](&v14, sel_loadView);
  -[PKIssuerProvisioningExtensionAuthorizationServiceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizesSubviews:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PKIssuerProvisioningExtensionAuthorizationServiceViewController childViewControllers](self, "childViewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addSubview:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PKIssuerProvisioningExtensionAuthorizationServiceViewController;
  -[PKIssuerProvisioningExtensionAuthorizationServiceViewController viewWillLayoutSubviews](&v22, sel_viewWillLayoutSubviews);
  -[PKIssuerProvisioningExtensionAuthorizationServiceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PKIssuerProvisioningExtensionAuthorizationServiceViewController childViewControllers](self, "childViewControllers", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v14);
  }

}

@end
