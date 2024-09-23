@implementation VSViewControllerFactory

+ (id)sharedFactory
{
  if (sharedFactory___vs_lazy_init_predicate != -1)
    dispatch_once(&sharedFactory___vs_lazy_init_predicate, &__block_literal_global_10);
  return (id)sharedFactory___vs_lazy_init_variable;
}

void __40__VSViewControllerFactory_sharedFactory__block_invoke()
{
  VSViewControllerFactory *v0;
  void *v1;

  v0 = objc_alloc_init(VSViewControllerFactory);
  v1 = (void *)sharedFactory___vs_lazy_init_variable;
  sharedFactory___vs_lazy_init_variable = (uint64_t)v0;

}

- (VSViewControllerFactory)init
{
  VSViewControllerFactory *v2;
  NSOperationQueue *v3;
  NSOperationQueue *privateQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSViewControllerFactory;
  v2 = -[VSViewControllerFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    -[NSOperationQueue setName:](v2->_privateQueue, "setName:", CFSTR("VSViewControllerFactory"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_privateQueue, "setMaxConcurrentOperationCount:", 1);
  }
  return v2;
}

- (void)viewServiceRemoteViewControllerWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The completion parameter must not be nil."));
  v4 = (void *)objc_opt_class();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__VSViewControllerFactory_viewServiceRemoteViewControllerWithCompletion___block_invoke;
  v7[3] = &unk_24FE1A700;
  v8 = v3;
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("VSViewServiceViewController"), CFSTR("com.apple.VSViewService"), v7);

}

void __73__VSViewControllerFactory_viewServiceRemoteViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void (*v9)(void);
  id v10;

  v3 = a2;
  v10 = v3;
  if (v3)
  {
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = (void *)MEMORY[0x24BDBCE88];
      v6 = *MEMORY[0x24BDBCAB8];
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "raise:format:", v6, CFSTR("Unexpectedly, readyViewController was %@, instead of VSViewServiceRemoteViewController."), v8, v10);

    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    VSPublicError();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

- (id)identityProviderPickerViewControllerWithIdentityProviders:(id)a3
{
  id v3;
  VSIdentityProviderPickerViewController_iOS *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(VSIdentityProviderPickerViewController_iOS);
  -[VSIdentityProviderPickerViewController_iOS setIdentityProviders:](v4, "setIdentityProviders:", v3);

  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)authenticationViewControllerForViewModel:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  __objc2_class *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = (void *)MEMORY[0x24BDBCE88];
      v5 = *MEMORY[0x24BDBCAB8];
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "raise:format:", v5, CFSTR("Unexpectedly, viewModel was %@, instead of VSCredentialEntryViewModel."), v7);

    }
    v8 = VSCredentialEntryViewController_iOS;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = (void *)MEMORY[0x24BDBCE88];
        v10 = *MEMORY[0x24BDBCAB8];
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "raise:format:", v10, CFSTR("Unexpectedly, viewModel was %@, instead of VSAutoAuthenticationViewModel."), v12);

      }
      v8 = VSAutoAuthenticationViewController_iOS;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v17 = (void *)MEMORY[0x24BDBCE88];
            v18 = *MEMORY[0x24BDBCAB8];
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "raise:format:", v18, CFSTR("Unexpectedly, viewModel was %@, instead of VSOnscreenCodeViewModel."), v20);

          }
          objc_msgSend(0, "setViewModel:", v3);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v21 = (void *)MEMORY[0x24BDBCE88];
              v22 = *MEMORY[0x24BDBCAB8];
              v23 = (objc_class *)objc_opt_class();
              NSStringFromClass(v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "raise:format:", v22, CFSTR("Unexpectedly, viewModel was %@, instead of VSTwoFactorEntryViewModel."), v24);

            }
            v8 = VSTwoFactorEntryViewController_iOS;
            goto LABEL_21;
          }
        }
        v26 = 0;
        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = (void *)MEMORY[0x24BDBCE88];
        v14 = *MEMORY[0x24BDBCAB8];
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise:format:", v14, CFSTR("Unexpectedly, viewModel was %@, instead of VSWebAuthenticationViewModel."), v16);

      }
      v8 = VSWebAuthenticationViewController;
    }
  }
LABEL_21:
  v25 = v3;
  v26 = objc_alloc_init(v8);
  objc_msgSend(v26, "setViewModel:", v25);

LABEL_22:
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)loadingViewController
{
  VSLoadingViewController_iOS *v2;
  void *v3;

  v2 = objc_alloc_init(VSLoadingViewController_iOS);
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)viewControllerToConfirmAccountDeletionForAccount:(id)a3 preferredStyle:(int64_t)a4 confirmationHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (void *)MEMORY[0x24BDD1488];
  v10 = a3;
  objc_msgSend(v9, "vs_frameworkBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_CONFIRMATION_TITLE_FORMAT"), 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identityProviderDisplayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = objc_msgSend(v10, "isSynchronizable");
  v15 = 0;
  if ((_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_CONFIRMATION_MESSAGE_FORMAT_GENERIC"), 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v14, v15, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_BUTTON_TITLE"), 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDF67E8];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __111__VSViewControllerFactory_viewControllerToConfirmAccountDeletionForAccount_preferredStyle_confirmationHandler___block_invoke;
  v28[3] = &unk_24FE19FA0;
  v29 = v7;
  v21 = v7;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v19, 2, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v22);
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CANCEL_TITLE"), 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v24, 1, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v25);
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __111__VSViewControllerFactory_viewControllerToConfirmAccountDeletionForAccount_preferredStyle_confirmationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)viewControllerToConfirmDeveloperIdentityProviderDeletionWithConfirmationHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF8BD8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "developerIdentityProviderDeletionConfirmationMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DEVELOPER_DELETION_ACTION_TITLE"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDF67E8];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __107__VSViewControllerFactory_viewControllerToConfirmDeveloperIdentityProviderDeletionWithConfirmationHandler___block_invoke;
  v17[3] = &unk_24FE19FA0;
  v18 = v3;
  v10 = v3;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v8, 2, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v11);
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL_TITLE"), 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v14);
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __107__VSViewControllerFactory_viewControllerToConfirmDeveloperIdentityProviderDeletionWithConfirmationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)viewControllerForUnsupportedProvider:(id)a3 withRequestingAppDisplayName:(id)a4 storage:(id)a5 acknowledgementHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  VSViewControllerFactory *v56;
  id v57;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v47 = a6;
  objc_msgSend(v9, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "forceUnwrapObject");
  v13 = objc_claimAutoreleasedReturnValue();

  v50 = v10;
  v46 = (void *)v13;
  if (v10)
  {
    v44 = v11;
    v14 = v10;
    v15 = objc_msgSend(v9, "isProhibitedByStore");
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("UNSUPPORTED_PROVIDER_TITLE_FORMAT"), 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, v13);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("UNSUPPORTED_PROVIDER_MESSAGE_FORMAT"), 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v21, v14, v43);
    }
    else
    {
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("UNSUPPORTED_APP_TITLE_FORMAT"), 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, v14, v13);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
      v25 = v13;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("UNSUPPORTED_APP_MESSAGE_FORMAT"), 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v21, v25, v14);
    }
    v24 = objc_claimAutoreleasedReturnValue();

    v23 = v19;
    v11 = v44;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("UNSUPPORTED_PROVIDER_TITLE_FORMAT"), 0, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v14, v13);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("UNSUPPORTED_PROVIDER_SYSTEM_MESSAGE"), 0, 0);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v24;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v23, v24, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("ERROR_DISMISS_BUTTON_TITLE"), 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x24BDF67E8];
  v31 = MEMORY[0x24BDAC760];
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke;
  v53[3] = &unk_24FE1A750;
  v54 = v9;
  v55 = v11;
  v32 = v47;
  v56 = self;
  v57 = v32;
  v49 = v11;
  v33 = v9;
  objc_msgSend(v30, "actionWithTitle:style:handler:", v29, 0, v53);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAction:", v34);
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("CHOOSE_ANOTHER_PROVIDER_BUTTON_TITLE"), 0, 0);
  v36 = (void *)v23;
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x24BDF67E8];
  v51[0] = v31;
  v51[1] = 3221225472;
  v51[2] = __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke_3;
  v51[3] = &unk_24FE19FA0;
  v52 = v32;
  v39 = v32;
  objc_msgSend(v38, "actionWithTitle:style:handler:", v37, 1, v51);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAction:", v40);
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v27);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

void __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDF8B58]);
  if ((objc_msgSend(*(id *)(a1 + 32), "isDeveloper") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "providerID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forceUnwrapObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF8C28], "recordSignInEventWithProviderIdentifier:supportedProvider:channelAdamID:signInType:error:", v4, 0, 0, *MEMORY[0x24BDF8E98], 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "providerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentityProviderID:", v5);

  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOptionalIdentityProviderDisplayName:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF8C30]), "initWithSerializedData:", v7);
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAuthenticationToken:", v9);

  v10 = objc_alloc_init(MEMORY[0x24BDF8B60]);
  v11 = objc_alloc(MEMORY[0x24BDF8B88]);
  v20[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithUnsavedAccounts:channels:storage:", v12, v10, *(_QWORD *)(a1 + 40));

  v17 = MEMORY[0x24BDAC760];
  v18 = v13;
  v19 = *(id *)(a1 + 56);
  v14 = v13;
  VSMainThreadOperationWithBlock();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addDependency:", v14, v17, 3221225472, __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke_2, &unk_24FE1A728);
  VSEnqueueCompletionOperation();
  objc_msgSend(*(id *)(a1 + 48), "privateQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v14);

}

void __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x24BDF8C38];
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceUnwrapObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "optionalWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

}

void __124__VSViewControllerFactory_viewControllerForUnsupportedProvider_withRequestingAppDisplayName_storage_acknowledgementHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)viewControllerForAppsSupportedByIdentityProvider:(id)a3 supportedApps:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  VSSupportedAppsViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(VSSupportedAppsViewController);
  -[VSSupportedAppsViewController setDelegate:](v10, "setDelegate:", v8);

  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSSupportedAppsViewController setIdentityProvider:](v10, "setIdentityProvider:", v11);
  if (v7)
    -[VSSupportedAppsViewController setSupportedApps:](v10, "setSupportedApps:", v7);
  -[VSSupportedAppsViewController beginLoadingImages](v10, "beginLoadingImages");
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SUPPORTED_APPS_TITLE"), 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSupportedAppsViewController setTitle:](v10, "setTitle:", v13);

  v14 = objc_alloc_init(MEMORY[0x24BDF6BF8]);
  v18[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setViewControllers:", v15);

  objc_msgSend(v14, "setModalPresentationStyle:", 2);
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs:(id)a3 grantingVouchers:(BOOL)a4 appleAccountName:(id)a5 identityProvider:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  _QWORD v41[4];
  id v42;

  v9 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = (objc_class *)MEMORY[0x24BDBCED8];
  v15 = a3;
  v16 = objc_alloc_init(v14);
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_ACTIVITY_REPORTING_CONSENT_TITLE"), 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0x24BDD1000;
  v40 = v12;
  if (v12)
  {
    v20 = (void *)MEMORY[0x24BDD1488];
    v21 = v12;
    objc_msgSend(v20, "vs_frameworkBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("PLAYBACK_ACTIVITY_REPORTING_CONSENT_TITLE_FORMAT"), 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "displayName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "forceUnwrapObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v23, v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v19 = 0x24BDD1000uLL;
    v18 = (void *)v26;
  }
  objc_msgSend(v16, "setObject:forKey:", v18, *MEMORY[0x24BEBFEE8]);
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v9)
    v29 = CFSTR("PLAYBACK_ACTIVITY_REPORTING_COMBINED_CONSENT_MESSAGE_FORMAT");
  else
    v29 = CFSTR("PLAYBACK_ACTIVITY_REPORTING_CONSENT_MESSAGE_FORMAT");
  objc_msgSend(v27, "localizedStringForKey:value:table:", v29, 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v19 + 1992), "stringWithFormat:", v30, v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setObject:forKey:", v31, *MEMORY[0x24BEBFEE0]);
  if (v11)
    objc_msgSend(v16, "setObject:forKey:", v11, *MEMORY[0x24BEBFED8]);
  v32 = objc_alloc(MEMORY[0x24BEBFEC0]);
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __160__VSViewControllerFactory_viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs_grantingVouchers_appleAccountName_identityProvider_completionHandler___block_invoke;
  v41[3] = &unk_24FE1A7A0;
  v42 = v13;
  v33 = v13;
  v34 = (void *)objc_msgSend(v32, "initWithBundleIDs:options:completionHandler:", v15, v16, v41);

  v35 = objc_alloc_init(MEMORY[0x24BDF6F98]);
  objc_msgSend(v35, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addChildViewController:", v34);
  objc_msgSend(v34, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  objc_msgSend(v37, "setFrame:");
  objc_msgSend(v37, "setAutoresizingMask:", 18);
  objc_msgSend(v36, "addSubview:", v37);
  objc_msgSend(v34, "didMoveToParentViewController:", v35);
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v35);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

void __160__VSViewControllerFactory_viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs_grantingVouchers_appleAccountName_identityProvider_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Received access result: %@.", buf, 0xCu);

  }
  v6 = *(id *)(a1 + 32);
  VSPerformBlockOnMainThread();

}

uint64_t __160__VSViewControllerFactory_viewControllerForPlaybackActivityReportingFromAppsWithBundleIDs_grantingVouchers_appleAccountName_identityProvider_completionHandler___block_invoke_106(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) != 0, *(_QWORD *)(a1 + 40) == 1);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
}

@end
