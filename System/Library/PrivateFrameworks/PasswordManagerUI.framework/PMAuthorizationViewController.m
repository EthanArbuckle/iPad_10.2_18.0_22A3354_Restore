@implementation PMAuthorizationViewController

- (PMAuthorizationViewController)initWithPresentationContext:(id)a3 activity:(id)a4
{
  id v7;
  id v8;
  PMAuthorizationViewController *v9;
  PMAuthorizationViewController *v10;
  id *p_presentationContext;
  SFWirelessSettingsController *v12;
  SFWirelessSettingsController *wirelessSettingsController;
  void *v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  _BOOL4 hasInternalAndExternalPasskeyLoginChoices;
  BOOL *p_includePasskeySymbolInTitleView;
  BOOL biometricsEnabled;
  void *v21;
  PMAuthorizationViewController *v22;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PMAuthorizationViewController;
  v9 = -[PMAuthorizationViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    p_presentationContext = (id *)&v9->_presentationContext;
    objc_storeStrong((id *)&v9->_presentationContext, a3);
    objc_storeStrong((id *)&v10->_authorizationActivity, a4);
    v12 = (SFWirelessSettingsController *)objc_alloc_init(MEMORY[0x24BE901E0]);
    wirelessSettingsController = v10->_wirelessSettingsController;
    v10->_wirelessSettingsController = v12;

    v10->_biometricsEnabled = objc_msgSend(MEMORY[0x24BE0B290], "isBiometricAuthenticationAvailable");
    objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isKeychainSyncEnabled") & 1) != 0)
    {
      v15 = objc_msgSend(*p_presentationContext, "iCloudKeychainPasskeyLoginChoiceCount");

      if (v15)
      {
        v16 = 0;
        v17 = objc_msgSend(*p_presentationContext, "externalPasskeyLoginChoiceCount") != 0;
        goto LABEL_7;
      }
    }
    else
    {

    }
    v17 = 0;
    v16 = 1;
LABEL_7:
    v10->_hasInternalAndExternalPasskeyLoginChoices = v17;
    if (((objc_msgSend(*p_presentationContext, "hasPlatformCredentialRequest") & 1) != 0
       || (objc_msgSend(*p_presentationContext, "requestTypes") & 0x40) != 0)
      && (v10->_biometricsEnabled || v16 && objc_msgSend(*p_presentationContext, "externalPasskeyLoginChoiceCount")))
    {
      hasInternalAndExternalPasskeyLoginChoices = v10->_hasInternalAndExternalPasskeyLoginChoices;
      p_includePasskeySymbolInTitleView = &v10->_includePasskeySymbolInTitleView;
      v10->_includePasskeySymbolInTitleView = !hasInternalAndExternalPasskeyLoginChoices;
      if (!hasInternalAndExternalPasskeyLoginChoices)
      {
        biometricsEnabled = 1;
LABEL_18:
        *p_includePasskeySymbolInTitleView = biometricsEnabled;
        objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10->_forceLegacySignInSheet = objc_msgSend(v21, "safari_BOOLForKey:defaultValue:", CFSTR("forceLegacySignInSheet"), 0);

        v22 = v10;
        goto LABEL_19;
      }
    }
    else
    {
      p_includePasskeySymbolInTitleView = &v10->_includePasskeySymbolInTitleView;
      v10->_includePasskeySymbolInTitleView = 0;
    }
    if (objc_msgSend(*p_presentationContext, "_passkeyURLType"))
      biometricsEnabled = v10->_biometricsEnabled;
    else
      biometricsEnabled = 0;
    goto LABEL_18;
  }
LABEL_19:

  return v10;
}

- (void)updateInterfaceWithLoginChoices:(id)a3
{
  id v4;
  void *v5;
  _QWORD block[5];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[ASCAuthorizationPresentationContext updateLoginChoices:](self->_presentationContext, "updateLoginChoices:", v4);
    -[ASNavigationController topViewController](self->_navigationController, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "reloadLoginChoices");
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_8;
      block[3] = &unk_2513E7238;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }

  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global);
  }

}

void __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_cold_1();
}

void __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_initialViewControllerForPresentationContext:expandingOtherLoginChoices:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "setDelegate:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "pushViewController:animated:", v3, 1);
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setViewControllers:", v5);

  }
  else
  {
    os_activity_apply(*(os_activity_t *)(v4 + 984), &__block_literal_global_9);
  }

}

void __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_2()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_2_cold_1();
}

- (void)presentPINEntryInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PMAuthorizationViewController_presentPINEntryInterface__block_invoke;
  block[3] = &unk_2513E7238;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __57__PMAuthorizationViewController_presentPINEntryInterface__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentPINEntryInterface");
}

- (void)pushOrUpdateBasicPaneViewControllerWithError:(int64_t)a3
{
  -[PMAuthorizationViewController pushOrUpdateBasicPaneViewControllerWithError:overrideUserVisibleErrorMessage:](self, "pushOrUpdateBasicPaneViewControllerWithError:overrideUserVisibleErrorMessage:", a3, 0);
}

- (void)pushOrUpdateBasicPaneViewControllerWithError:(int64_t)a3 overrideUserVisibleErrorMessage:(id)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(void *, void *);
  void (**v9)(_QWORD);
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD aBlock[5];

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke;
  aBlock[3] = &unk_2513E7288;
  aBlock[4] = self;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_3;
  v14[3] = &unk_2513E7238;
  v14[4] = self;
  v9 = (void (**)(_QWORD))_Block_copy(v14);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_5;
  v13[3] = &unk_2513E7288;
  v13[4] = self;
  v10 = _Block_copy(v13);
  v11 = (void (**)(_QWORD, _QWORD))v10;
  switch(a3)
  {
    case 4:
      descriptionForErrorCode();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v12);
      goto LABEL_4;
    case 5:
      v9[2](v9);
      break;
    case 6:
    case 7:
    case 13:
      descriptionForErrorCode();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v11)[2](v11, v12);
LABEL_4:

      break;
    case 16:
      (*((void (**)(void *, id))v10 + 2))(v10, v6);
      break;
    default:
      break;
  }

}

void __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_2;
  v5[3] = &unk_2513E7260;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pushSecurityKeyViewControllerWithOverrideSubtitle:overrideTitle:", *(_QWORD *)(a1 + 40), 0);
}

void __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_4;
  block[3] = &unk_2513E7238;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "overrideNoCredentialsErrorTitle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    _WBSLocalizedString();
    v2 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v2;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "overrideNoCredentialsErrorMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "_pushSecurityKeyViewControllerWithOverrideSubtitle:overrideTitle:", v3, v8);

}

void __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_6;
  v5[3] = &unk_2513E7260;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __110__PMAuthorizationViewController_pushOrUpdateBasicPaneViewControllerWithError_overrideUserVisibleErrorMessage___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateOrPushPlatformKeyViewControllerWithSubtitle:", *(_QWORD *)(a1 + 40));
}

- (id)navigationController
{
  return self->_navigationController;
}

- (void)performConditionalRegistrationIfPossible
{
  ASCredentialPickerViewControllerProtocol *v3;
  ASCredentialPickerViewControllerProtocol *conditionalRegistrationViewController;

  -[PMAuthorizationViewController _initialViewControllerForPresentationContext:](self, "_initialViewControllerForPresentationContext:", self->_presentationContext);
  v3 = (ASCredentialPickerViewControllerProtocol *)objc_claimAutoreleasedReturnValue();
  conditionalRegistrationViewController = self->_conditionalRegistrationViewController;
  self->_conditionalRegistrationViewController = v3;

  -[ASCredentialPickerViewControllerProtocol setDelegate:](self->_conditionalRegistrationViewController, "setDelegate:", self);
  -[ASCredentialPickerViewControllerProtocol performConditionalRegistrationIfPossible](self->_conditionalRegistrationViewController, "performConditionalRegistrationIfPossible");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v5 = WBS_LOG_CHANNEL_PREFIXServiceLifecycle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v12 = objc_opt_class();
    _os_log_impl(&dword_243521000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ will appear", buf, 0xCu);

  }
  v10.receiver = self;
  v10.super_class = (Class)PMAuthorizationViewController;
  -[PMAuthorizationViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  if (-[PMAuthorizationViewController isBeingPresented](self, "isBeingPresented"))
  {
    -[PMAuthorizationViewController _setUpInitialViewController](self, "_setUpInitialViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __48__PMAuthorizationViewController_viewWillAppear___block_invoke;
      v9[3] = &unk_2513E7238;
      v9[4] = self;
      -[PMAuthorizationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, v9);
    }

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXServiceLifecycle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[PMAuthorizationViewController viewWillAppear:].cold.1();
  }
}

uint64_t __48__PMAuthorizationViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1024));
  objc_msgSend(WeakRetained, "authorizationViewControllerDidCompleteInitialPresentation:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "_startCABLEClientForSingleLoginChoiceIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_startCABLEAuthenticatorOnInitialPresentationIfNeeded");
}

- (id)_signInBarButtonItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  ASCAuthorizationPresentationContext *presentationContext;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBD708]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 20.0, *MEMORY[0x24BEBB610]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  -[ASCAuthorizationPresentationContext overrideHeader](self->_presentationContext, "overrideHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  presentationContext = self->_presentationContext;
  if (v6)
  {
    -[ASCAuthorizationPresentationContext overrideHeader](presentationContext, "overrideHeader");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[ASCAuthorizationPresentationContext requestTypes](presentationContext, "requestTypes") == 2)
      objc_msgSend(MEMORY[0x24BE82CC8], "isAppleAccountBrandingEnabled");
    _WBSLocalizedString();
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  objc_msgSend(v4, "setText:", v8);

  if (self->_includePasskeySymbolInTitleView)
  {
    v10 = objc_alloc(MEMORY[0x24BEBD668]);
    v11 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:scale:", 7, 1, 20.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemImageNamed:withConfiguration:", CFSTR("person.badge.key.fill"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageWithTintColor:renderingMode:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v10, "initWithImage:", v15);

    v17 = objc_alloc(MEMORY[0x24BEBD978]);
    v22[0] = v16;
    v22[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithArrangedSubviews:", v18);

    objc_msgSend(v19, "setDistribution:", 3);
    objc_msgSend(v19, "setAlignment:", 2);
    objc_msgSend(v19, "setSpacing:", 4.0);
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v19);

  }
  else
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v4);
  }

  return v20;
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (id)_setUpInitialViewController
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[PMAuthorizationViewController _initialViewControllerForPresentationContext:](self, "_initialViewControllerForPresentationContext:", self->_presentationContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PMAuthorizationViewController _setUpContainerViewControllerWithCredentialRequestViewController:](self, "_setUpContainerViewControllerWithCredentialRequestViewController:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_34);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BE0B1C8];
    v11 = *MEMORY[0x24BDD0FD8];
    v12[0] = CFSTR("No view controller specified for request.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "authorizationViewController:didCompleteWithCredential:error:", self, 0, v9);

    v4 = 0;
  }

  return v4;
}

void __60__PMAuthorizationViewController__setUpInitialViewController__block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __60__PMAuthorizationViewController__setUpInitialViewController__block_invoke_cold_1();
}

- (id)_initialViewControllerForPresentationContext:(id)a3
{
  return -[PMAuthorizationViewController _initialViewControllerForPresentationContext:expandingOtherLoginChoices:](self, "_initialViewControllerForPresentationContext:expandingOtherLoginChoices:", a3, 0);
}

- (id)_initialViewControllerForPresentationContext:(id)a3 expandingOtherLoginChoices:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "cableAuthenticatorURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v9 = objc_msgSend(v6, "requestTypes");
    objc_msgSend(v6, "loginChoices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isKeychainSyncEnabled") & 1) == 0
      && (objc_msgSend(v11, "canKeychainSyncBeEnabled") & 1) == 0)
    {
      v12 = objc_msgSend(v6, "externalPasskeyLoginChoiceCount");
      objc_msgSend(v10, "safari_filterObjectsUsingBlock:", &__block_literal_global_42);
      v13 = objc_claimAutoreleasedReturnValue();

      if (!v12)
        v9 &= 0xFFFFFFFFFFFFFFF3;
      v10 = (void *)v13;
    }
    if (v9 == 32)
    {
      objc_msgSend(v10, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count") == 1
        && objc_msgSend(v17, "loginChoiceKind") == 3
        && objc_msgSend(v17, "credentialKind") == 2)
      {
        -[PMAuthorizationViewController _securityKeyRequestViewController](self, "_securityKeyRequestViewController");
        v14 = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      if (v9 == 16)
      {
        -[PMAuthorizationViewController _securityKeyRequestViewController](self, "_securityKeyRequestViewController");
        v14 = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)objc_claimAutoreleasedReturnValue();
        if (v14)
          goto LABEL_30;
        goto LABEL_23;
      }
      if (!-[PMAuthorizationViewController _shouldPresentCABLEAsInitialViewControllerForRequestTypes:shouldAllowSecurityKeysFromCABLEView:](self, "_shouldPresentCABLEAsInitialViewControllerForRequestTypes:shouldAllowSecurityKeysFromCABLEView:", v9, objc_msgSend(v6, "shouldAllowSecurityKeysFromCABLEView")))
      {
LABEL_23:
        -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {

        }
        else
        {
          v19 = -[ASCAuthorizationPresentationContext isProxiedRequest](self->_presentationContext, "isProxiedRequest");

          if (v19)
          {
            v14 = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7150]), "initWithPersona:presentationContext:", 1, v6);
            -[ASCredentialRequestPaneViewController setDelegate:](v14, "setDelegate:", self);
            -[PMCredentialPickerViewController setAuthenticationDelegate:](v14, "setAuthenticationDelegate:", self);
            goto LABEL_30;
          }
        }
        if (self->_forceLegacySignInSheet)
        {
          v14 = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDB70D0]), "initWithPresentationContext:shouldExpandOtherLoginChoices:activity:", v6, v4, self->_authorizationActivity);
        }
        else
        {
          v14 = -[PMCredentialPickerViewController initWithPresentationContext:shouldExpandOtherLoginChoices:activity:]([_TtC17PasswordManagerUI32PMCredentialPickerViewController alloc], "initWithPresentationContext:shouldExpandOtherLoginChoices:activity:", v6, v4, self->_authorizationActivity);
          if (!v14)
            goto LABEL_31;
        }
LABEL_30:
        -[PMAuthorizationViewController _signInBarButtonItem](self, "_signInBarButtonItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PMCredentialPickerViewController navigationItem](v14, "navigationItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLeftBarButtonItem:", v20);

        -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PMCredentialPickerViewController as_navigationItem](v14, "as_navigationItem");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRightBarButtonItem:", v22);

        goto LABEL_31;
      }
      objc_msgSend(v10, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDB70E0]), "initWithPresentationContext:loginChoice:activity:", self->_presentationContext, v17, self->_authorizationActivity);
      self->_includePasskeySymbolInTitleView = 0;
    }

    if (v14)
      goto LABEL_30;
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "shouldRequireCABLEAuthenticatorConsent"))
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDB70F0]), "initWithPresentationContext:", v6);
  else
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDB70E8]), "initRequiringTableView:", 0);
  v14 = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)v8;
  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMCredentialPickerViewController as_navigationItem](v14, "as_navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRightBarButtonItem:", v15);

  -[PMAuthorizationViewController _signInBarButtonItem](self, "_signInBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMCredentialPickerViewController as_navigationItem](v14, "as_navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeftBarButtonItem:", v10);
LABEL_31:

  return v14;
}

uint64_t __105__PMAuthorizationViewController__initialViewControllerForPresentationContext_expandingOtherLoginChoices___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "loginChoiceKind") == 2)
    v3 = objc_msgSend(v2, "isExternal");
  else
    v3 = 1;

  return v3;
}

- (BOOL)_shouldPresentCABLEAsInitialViewControllerForRequestTypes:(unint64_t)a3 shouldAllowSecurityKeysFromCABLEView:(BOOL)a4
{
  BOOL v4;

  v4 = a3 == 96 && a4;
  return a3 == 64 || v4;
}

- (id)_securityKeyRequestViewController
{
  return -[PMAuthorizationViewController _securityKeyRequestViewControllerWithOverrideSubtitle:overrideTitle:](self, "_securityKeyRequestViewControllerWithOverrideSubtitle:overrideTitle:", 0, 0);
}

- (id)_securityKeyRequestViewControllerWithOverrideSubtitle:(id)a3 overrideTitle:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB7128], "titleWithPresentationContext:", self->_presentationContext);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (objc_msgSend(v6, "length"))
  {
    v10 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB7128], "messageWithPresentationContext:", self->_presentationContext);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[ASCAuthorizationPresentationContext useAlternativeSecurityKeysIcon](self->_presentationContext, "useAlternativeSecurityKeysIcon"))
  {
    objc_msgSend(MEMORY[0x24BDB7118], "alternativeSecurityKeysIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB7118], "systemSecurityKeysIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 2;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB70D8]), "initWithTitle:titleStyle:subtitle:subtitleStyle:icon:iconStyle:", v9, 2, v10, 3, v11, v12);

  return v13;
}

- (void)_presentPINEntryInterface
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB7150]), "initWithPersona:presentationContext:", 0, self->_presentationContext);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setAuthenticationDelegate:", self);
  -[PMAuthorizationViewController _signInBarButtonItem](self, "_signInBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "as_navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "as_navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  -[ASNavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v7, 0);
}

- (void)_presentManualPasswordEntryInterface
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB7150]), "initWithPersona:presentationContext:", 1, self->_presentationContext);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setAuthenticationDelegate:", self);
  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  -[ASNavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v5, 0);
}

- (id)_cancelBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__cancelButtonSelected_);
}

- (void)_cancelButtonSelected:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE0B1C8], 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "authorizationViewController:didCompleteWithCredential:error:", self, 0, v4);

}

- (id)_setUpContainerViewControllerWithCredentialRequestViewController:(id)a3
{
  objc_class *v4;
  id v5;
  ASNavigationController *v6;
  ASNavigationController *navigationController;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDB7138];
  v5 = a3;
  v6 = (ASNavigationController *)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  navigationController = self->_navigationController;
  self->_navigationController = v6;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7100]), "initWithRootViewController:", self->_navigationController);
  objc_msgSend(v8, "setPaneDelegate:", self);
  -[ASNavigationController setDelegate:](self->_navigationController, "setDelegate:", v8);
  return v8;
}

- (void)_pushSecurityKeyViewController
{
  -[PMAuthorizationViewController _pushSecurityKeyViewControllerWithOverrideSubtitle:overrideTitle:](self, "_pushSecurityKeyViewControllerWithOverrideSubtitle:overrideTitle:", 0, 0);
}

- (void)_pushSecurityKeyViewControllerWithOverrideSubtitle:(id)a3 overrideTitle:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  -[PMAuthorizationViewController _securityKeyRequestViewControllerWithOverrideSubtitle:overrideTitle:](self, "_securityKeyRequestViewControllerWithOverrideSubtitle:overrideTitle:", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "as_navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  -[ASNavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v7, 1);
}

- (void)_updateOrPushPlatformKeyViewControllerWithSubtitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ASNavigationController visibleViewController](self->_navigationController, "visibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "updateSubtitle:", v9);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDB70D8]);
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB7118], "headerIconForPresentationContext:", self->_presentationContext);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithTitle:subtitle:icon:", v6, v9, v7);

    -[ASNavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v8, 1);
  }

}

- (void)_pushActivateSecurityKeyAgainViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDB7128], "activateSecurityKeyAgainMessageText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMAuthorizationViewController _securityKeyRequestViewControllerWithOverrideSubtitle:overrideTitle:](self, "_securityKeyRequestViewControllerWithOverrideSubtitle:overrideTitle:", v3, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PMAuthorizationViewController _signInBarButtonItem](self, "_signInBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "as_navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "as_navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  -[ASNavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v8, 1);
}

- (id)_cableClientViewControllerWithLoginChoice:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDB70E0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithPresentationContext:loginChoice:activity:", self->_presentationContext, v5, self->_authorizationActivity);

  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "as_navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  return v6;
}

- (void)_pushCABLEClientViewControllerForCABLELoginChoice:(id)a3
{
  id v4;

  -[PMAuthorizationViewController _cableClientViewControllerWithLoginChoice:](self, "_cableClientViewControllerWithLoginChoice:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASNavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v4, 1);

}

- (void)_pushCABLEConnectingViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ASNavigationController *navigationController;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB70E8]), "initRequiringTableView:", 0);
  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "as_navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  -[PMAuthorizationViewController _signInBarButtonItem](self, "_signInBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  navigationController = self->_navigationController;
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNavigationController setViewControllers:animated:](navigationController, "setViewControllers:animated:", v9, 1);

}

- (void)_pushCABLEAuthenticatingViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ASNavigationController *navigationController;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB7118], "passwordManagerIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAuthorizationPresentationContext isRegistrationRequest](self->_presentationContext, "isRegistrationRequest");
  v4 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAuthorizationPresentationContext serviceName](self->_presentationContext, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB70D8]), "initWithTitle:subtitle:icon:", v7, 0, v3);
  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "as_navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

  -[PMAuthorizationViewController _signInBarButtonItem](self, "_signInBarButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItem:", v11);

  navigationController = self->_navigationController;
  v15[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNavigationController setViewControllers:animated:](navigationController, "setViewControllers:animated:", v14, 1);

}

- (void)_startCABLEClientWithLoginChoice:(id)a3
{
  NSObject *authorizationActivity;
  id WeakRetained;
  id v6;
  _QWORD block[5];

  v6 = a3;
  authorizationActivity = self->_authorizationActivity;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__PMAuthorizationViewController__startCABLEClientWithLoginChoice___block_invoke;
  block[3] = &unk_2513E7238;
  block[4] = self;
  os_activity_apply(authorizationActivity, block);
  if ((-[SFWirelessSettingsController isBluetoothEnabled](self->_wirelessSettingsController, "isBluetoothEnabled") & 1) == 0)
    -[PMAuthorizationViewController _showEnableBluetoothViewControllerForCABLEClientWithLoginChoice:](self, "_showEnableBluetoothViewControllerForCABLEClientWithLoginChoice:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "authorizationViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:", self, v6, 0, &__block_literal_global_61);

}

void __66__PMAuthorizationViewController__startCABLEClientWithLoginChoice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
    v4 = v2;
    v5[0] = 67109120;
    v5[1] = objc_msgSend(v3, "isBluetoothEnabled");
    _os_log_impl(&dword_243521000, v4, OS_LOG_TYPE_DEFAULT, "Starting caBLE client: bluetoothEnabled: %{BOOL}d", (uint8_t *)v5, 8u);

  }
}

- (void)_startCABLEClientForSingleLoginChoiceIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  if (-[PMAuthorizationViewController _shouldPresentCABLEAsInitialViewControllerForRequestTypes:shouldAllowSecurityKeysFromCABLEView:](self, "_shouldPresentCABLEAsInitialViewControllerForRequestTypes:shouldAllowSecurityKeysFromCABLEView:", -[ASCAuthorizationPresentationContext requestTypes](self->_presentationContext, "requestTypes"), -[ASCAuthorizationPresentationContext shouldAllowSecurityKeysFromCABLEView](self->_presentationContext, "shouldAllowSecurityKeysFromCABLEView")))
  {
    -[ASCAuthorizationPresentationContext loginChoices](self->_presentationContext, "loginChoices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_firstObjectPassingTest:", &__block_literal_global_62);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v5;
    if (v5)
    {
      -[PMAuthorizationViewController _startCABLEClientWithLoginChoice:](self, "_startCABLEClientWithLoginChoice:", v5);
      v4 = v5;
    }

  }
}

BOOL __78__PMAuthorizationViewController__startCABLEClientForSingleLoginChoiceIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "loginChoiceKind") == 4;
}

- (void)_showEnableBluetoothViewControllerForCABLEClientWithLoginChoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  PMAuthorizationViewController *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7108]), "initWithPresentationContext:activity:", self->_presentationContext, self->_authorizationActivity);
  -[PMAuthorizationViewController _signInBarButtonItem](self, "_signInBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "as_navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __97__PMAuthorizationViewController__showEnableBluetoothViewControllerForCABLEClientWithLoginChoice___block_invoke;
  v14 = &unk_2513E7260;
  v15 = self;
  v16 = v4;
  v10 = v4;
  objc_msgSend(v5, "setEnableBluetoothHandler:", &v11);
  -[ASNavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v5, 1, v11, v12, v13, v14, v15);

}

uint64_t __97__PMAuthorizationViewController__showEnableBluetoothViewControllerForCABLEClientWithLoginChoice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableBluetoothAndShowCABLEClientViewControllerWithLoginChoice:", *(_QWORD *)(a1 + 40));
}

- (void)_enableBluetoothAndShowCABLEClientViewControllerWithLoginChoice:(id)a3
{
  id v4;

  v4 = (id)-[ASNavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", 1);
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_64);
  -[SFWirelessSettingsController setBluetoothEnabled:](self->_wirelessSettingsController, "setBluetoothEnabled:", 1);
}

void __97__PMAuthorizationViewController__enableBluetoothAndShowCABLEClientViewControllerWithLoginChoice___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_243521000, v0, OS_LOG_TYPE_DEFAULT, "Enabling Bluetooth", v1, 2u);
  }
}

- (void)_pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext:(id)a3
{
  id v5;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ASNavigationController *navigationController;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_presentationContext, a3);
  if (self->_forceLegacySignInSheet)
  {
    WeakRetained = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDB70D0]), "initWithPresentationContext:activity:", v5, self->_authorizationActivity);
  }
  else
  {
    WeakRetained = -[PMCredentialPickerViewController initWithPresentationContext:shouldExpandOtherLoginChoices:activity:]([_TtC17PasswordManagerUI32PMCredentialPickerViewController alloc], "initWithPresentationContext:shouldExpandOtherLoginChoices:activity:", v5, 0, self->_authorizationActivity);
    if (!WeakRetained)
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_65);
      WeakRetained = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)objc_loadWeakRetained((id *)&self->_delegate);
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BE0B1C8];
      v17 = *MEMORY[0x24BDD0FD8];
      v18[0] = CFSTR("No view controller specified for request.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 1, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PMCredentialPickerViewController authorizationViewController:didCompleteWithCredential:error:](WeakRetained, "authorizationViewController:didCompleteWithCredential:error:", self, 0, v15);

      goto LABEL_5;
    }
  }
  -[PMAuthorizationViewController _signInBarButtonItem](self, "_signInBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMCredentialPickerViewController navigationItem](WeakRetained, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMCredentialPickerViewController navigationItem](WeakRetained, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

  navigationController = self->_navigationController;
  v16 = WeakRetained;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNavigationController setViewControllers:animated:](navigationController, "setViewControllers:animated:", v12, 1);
LABEL_5:

}

void __110__PMAuthorizationViewController__pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __110__PMAuthorizationViewController__pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext___block_invoke_cold_1();
}

- (void)_showCABLEAuthenticatorError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  ASNavigationController *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  ASNavigationController *navigationController;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getEnabledExtensionsSynchronously");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v38;
    while (2)
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v6);
        v9 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * v11);

        objc_msgSend(MEMORY[0x24BE83030], "sharedManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "extensionSupportsPasskeys:", v9);

        if ((v14 & 1) != 0)
        {
          v15 = 1;
          goto LABEL_12;
        }
        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v8)
        continue;
      break;
    }
    v15 = 0;
  }
  else
  {
    v15 = 0;
    v9 = 0;
  }
LABEL_12:

  if (objc_msgSend(v4, "safari_matchesErrorDomain:andCode:", *MEMORY[0x24BE0B1C8], 5))
  {
    objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isKeychainSyncEnabled");

    if ((v15 | v17) != 1)
    {
      v19 = objc_alloc_init(MEMORY[0x24BDB7110]);
      -[PMAuthorizationViewController _signInBarButtonItem](self, "_signInBarButtonItem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "navigationItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setLeftBarButtonItem:", v32);

      -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "navigationItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setRightBarButtonItem:", v34);

      navigationController = self->_navigationController;
      v42 = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASNavigationController setViewControllers:animated:](navigationController, "setViewControllers:animated:", v20, 1);
      goto LABEL_23;
    }
    objc_msgSend(v4, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FD8]);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(MEMORY[0x24BE82CC8], "hasInternalContent"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("(Internal only: %@)"), v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(MEMORY[0x24BDB7118], "passwordManagerIcon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v22 = (void *)MEMORY[0x24BDB7118];
    objc_msgSend(v9, "sf_bundleIdentifierForContainingApp");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB7170], "headerIconSize");
    objc_msgSend(v22, "iconForApplicationIdentifier:size:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v24;
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB70D8]), "initWithTitle:subtitle:icon:", v19, v20, v21);
  -[PMAuthorizationViewController _signInBarButtonItem](self, "_signInBarButtonItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLeftBarButtonItem:", v26);

  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setRightBarButtonItem:", v28);

  v30 = self->_navigationController;
  v41 = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNavigationController setViewControllers:animated:](v30, "setViewControllers:animated:", v31, 1);

LABEL_23:
}

- (void)_startCABLEAuthenticatorOnInitialPresentationIfNeeded
{
  uint64_t v3;
  void *v4;
  char v5;

  -[ASCAuthorizationPresentationContext cableAuthenticatorURL](self->_presentationContext, "cableAuthenticatorURL");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[ASCAuthorizationPresentationContext shouldRequireCABLEAuthenticatorConsent](self->_presentationContext, "shouldRequireCABLEAuthenticatorConsent");

    if ((v5 & 1) == 0)
      -[PMAuthorizationViewController _startCABLEAuthenticator](self, "_startCABLEAuthenticator");
  }
}

- (void)_startCABLEAuthenticator
{
  NSObject *authorizationActivity;
  uint64_t v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD block[5];

  authorizationActivity = self->_authorizationActivity;
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke;
  block[3] = &unk_2513E7238;
  block[4] = self;
  os_activity_apply(authorizationActivity, block);
  if ((-[SFWirelessSettingsController isBluetoothEnabled](self->_wirelessSettingsController, "isBluetoothEnabled") & 1) == 0)
    -[PMAuthorizationViewController _showEnableBluetoothViewControllerForCABLEAuthenticator](self, "_showEnableBluetoothViewControllerForCABLEAuthenticator");
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke_73;
  v6[3] = &unk_2513E73D8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(WeakRetained, "authorizationViewController:startCABLEAuthenticationWithCompletionHandler:", self, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 992);
    v4 = v2;
    v5[0] = 67109120;
    v5[1] = objc_msgSend(v3, "isBluetoothEnabled");
    _os_log_impl(&dword_243521000, v4, OS_LOG_TYPE_DEFAULT, "Starting caBLE authenticator: bluetoothEnabled: %{BOOL}d", (uint8_t *)v5, 8u);

  }
}

void __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke_73(uint64_t a1, void *a2, void *a3)
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke_2;
  block[3] = &unk_2513E73B0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __57__PMAuthorizationViewController__startCABLEAuthenticator__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
      objc_msgSend(WeakRetained, "_pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext:");
    else
      objc_msgSend(WeakRetained, "_showCABLEAuthenticatorError:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_showEnableBluetoothViewControllerForCABLEAuthenticator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7108]), "initWithPresentationContext:activity:", self->_presentationContext, self->_authorizationActivity);
  -[PMAuthorizationViewController _signInBarButtonItem](self, "_signInBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88__PMAuthorizationViewController__showEnableBluetoothViewControllerForCABLEAuthenticator__block_invoke;
  v8[3] = &unk_2513E7238;
  v8[4] = self;
  objc_msgSend(v3, "setEnableBluetoothHandler:", v8);
  -[ASNavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v3, 1);

}

uint64_t __88__PMAuthorizationViewController__showEnableBluetoothViewControllerForCABLEAuthenticator__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableBluetoothAndShowCABLEConnectingViewController");
}

- (void)_enableBluetoothAndShowCABLEConnectingViewController
{
  -[PMAuthorizationViewController _pushCABLEConnectingViewController](self, "_pushCABLEConnectingViewController");
  os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_75);
  -[SFWirelessSettingsController setBluetoothEnabled:](self->_wirelessSettingsController, "setBluetoothEnabled:", 1);
}

void __85__PMAuthorizationViewController__enableBluetoothAndShowCABLEConnectingViewController__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_243521000, v0, OS_LOG_TYPE_DEFAULT, "Enabling Bluetooth", v1, 2u);
  }
}

- (void)requestPaneViewController:(id)a3 dismissWithCredential:(id)a4 error:(id)a5
{
  ASAuthorizationViewControllerDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "authorizationViewController:didCompleteWithCredential:error:", self, v9, v8);

}

- (void)requestPaneViewController:(id)a3 didRequestCredentialForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  uint64_t v13;
  id v14;

  v14 = a4;
  v9 = a5;
  v10 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(v14, "loginChoiceKind") == 3)
  {
    v12 = v14;
    v13 = objc_msgSend(v12, "credentialKind");
    if (v13 == 2)
    {
      -[PMAuthorizationViewController _pushSecurityKeyViewController](self, "_pushSecurityKeyViewController");
      if (!-[ASCAuthorizationPresentationContext shouldAllowSecurityKeysFromCABLEView](self->_presentationContext, "shouldAllowSecurityKeysFromCABLEView"))
      {
        (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
        goto LABEL_11;
      }
    }
    else if (v13 != 1)
    {
      if (v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      -[PMAuthorizationViewController _pushSecurityKeyViewController](self, "_pushSecurityKeyViewController");
    }
    objc_msgSend(WeakRetained, "authorizationViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:", self, v12, v9, v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v14, "loginChoiceKind") == 4)
  {
    -[PMAuthorizationViewController _pushCABLEClientViewControllerForCABLELoginChoice:](self, "_pushCABLEClientViewControllerForCABLELoginChoice:", v14);
    -[PMAuthorizationViewController _startCABLEClientWithLoginChoice:](self, "_startCABLEClientWithLoginChoice:", v14);
  }
  else
  {
    objc_msgSend(WeakRetained, "authorizationViewController:didRequestCredentialForLoginChoice:authenticatedContext:completionHandler:", self, v14, v9, v10);
  }
LABEL_12:

}

- (void)requestPaneViewControllerPresentExpandedLoginChoiceInterface:(id)a3
{
  -[PMAuthorizationViewController _replaceRequestPaneViewControllerWithExpandedLoginChoiceList:](self, "_replaceRequestPaneViewControllerWithExpandedLoginChoiceList:", 1);
}

- (void)requestPaneViewControllerNeedsReload:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dismissAndPresentAgain:", self);

}

- (void)_replaceRequestPaneViewControllerWithExpandedLoginChoiceList:(BOOL)a3
{
  _BOOL8 v3;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *WeakRetained;
  void *v6;
  void *v7;
  ASNavigationController *navigationController;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _TtC17PasswordManagerUI32PMCredentialPickerViewController *v13;
  uint64_t v14;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x24BDAC8D0];
  if (self->_forceLegacySignInSheet)
  {
    WeakRetained = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDB70D0]), "initWithPresentationContext:shouldExpandOtherLoginChoices:activity:", self->_presentationContext, a3, self->_authorizationActivity);
  }
  else
  {
    WeakRetained = -[PMCredentialPickerViewController initWithPresentationContext:shouldExpandOtherLoginChoices:activity:]([_TtC17PasswordManagerUI32PMCredentialPickerViewController alloc], "initWithPresentationContext:shouldExpandOtherLoginChoices:activity:", self->_presentationContext, a3, self->_authorizationActivity);
    if (!WeakRetained)
    {
      os_activity_apply((os_activity_t)self->_authorizationActivity, &__block_literal_global_76);
      WeakRetained = (_TtC17PasswordManagerUI32PMCredentialPickerViewController *)objc_loadWeakRetained((id *)&self->_delegate);
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BE0B1C8];
      v14 = *MEMORY[0x24BDD0FD8];
      v15[0] = CFSTR("No view controller specified for request.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 1, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PMCredentialPickerViewController authorizationViewController:didCompleteWithCredential:error:](WeakRetained, "authorizationViewController:didCompleteWithCredential:error:", self, 0, v12);

      goto LABEL_5;
    }
  }
  -[ASCredentialRequestPaneViewController setDelegate:](WeakRetained, "setDelegate:", self);
  -[PMAuthorizationViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PMCredentialPickerViewController as_navigationItem](WeakRetained, "as_navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  navigationController = self->_navigationController;
  v13 = WeakRetained;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNavigationController setViewControllers:animated:](navigationController, "setViewControllers:animated:", v9, v3);
LABEL_5:

}

void __94__PMAuthorizationViewController__replaceRequestPaneViewControllerWithExpandedLoginChoiceList___block_invoke()
{
  NSObject *v0;

  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __110__PMAuthorizationViewController__pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext___block_invoke_cold_1();
}

- (void)requestPaneViewControllerStartCABLEAuthentication:(id)a3
{
  -[PMAuthorizationViewController _pushCABLEConnectingViewController](self, "_pushCABLEConnectingViewController", a3);
  -[PMAuthorizationViewController _startCABLEAuthenticator](self, "_startCABLEAuthenticator");
}

- (void)passwordAuthenticationViewController:(id)a3 completedWithUserEnteredPIN:(id)a4
{
  id v5;
  id WeakRetained;
  _QWORD v7[5];

  v5 = a4;
  -[PMAuthorizationViewController _pushActivateSecurityKeyAgainViewController](self, "_pushActivateSecurityKeyAgainViewController");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __98__PMAuthorizationViewController_passwordAuthenticationViewController_completedWithUserEnteredPIN___block_invoke;
  v7[3] = &unk_2513E7468;
  v7[4] = self;
  objc_msgSend(WeakRetained, "authorizationViewController:validateUserEnteredPIN:completionHandler:", self, v5, v7);

}

void __98__PMAuthorizationViewController_passwordAuthenticationViewController_completedWithUserEnteredPIN___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__PMAuthorizationViewController_passwordAuthenticationViewController_completedWithUserEnteredPIN___block_invoke_2;
  block[3] = &unk_2513E7440;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __98__PMAuthorizationViewController_passwordAuthenticationViewController_completedWithUserEnteredPIN___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1024));
    objc_msgSend(WeakRetained, "authorizationViewController:didCompleteWithCredential:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "code");
    descriptionForErrorCode();
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_pushSecurityKeyViewControllerWithOverrideSubtitle:overrideTitle:");
  }

}

- (void)passwordAuthenticationViewController:(id)a3 completedWithManuallyEnteredPasswordCredential:(id)a4
{
  ASAuthorizationViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "authorizationViewController:didCompleteWithCredential:error:", self, v6, 0);

}

- (ASAuthorizationViewControllerDelegate)delegate
{
  return (ASAuthorizationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_conditionalRegistrationViewController, 0);
  objc_storeStrong((id *)&self->_wirelessSettingsController, 0);
  objc_storeStrong((id *)&self->_authorizationActivity, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);
}

void __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_243521000, v0, v1, "Rejecting update with no login choices.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__PMAuthorizationViewController_updateInterfaceWithLoginChoices___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_243521000, v0, v1, "Couldn't update interface because a new request view controller could not be created for the new login choices.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)viewWillAppear:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_243521000, v0, OS_LOG_TYPE_FAULT, "Not being presented.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __60__PMAuthorizationViewController__setUpInitialViewController__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_243521000, v0, v1, "No request view controller specified for credential request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __110__PMAuthorizationViewController__pushCABLEAuthenticatorCredentialPickerViewControllerWithPresentationContext___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_243521000, v0, v1, "Unable to create PMCredentialPickerViewController for credential request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
