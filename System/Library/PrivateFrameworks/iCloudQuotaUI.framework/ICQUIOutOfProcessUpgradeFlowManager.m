@implementation ICQUIOutOfProcessUpgradeFlowManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__ICQUIOutOfProcessUpgradeFlowManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sRemoteUpgradeFlowManager;
}

void __52__ICQUIOutOfProcessUpgradeFlowManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedManager_sRemoteUpgradeFlowManager;
  sharedManager_sRemoteUpgradeFlowManager = (uint64_t)v0;

}

- (ICQUIOutOfProcessUpgradeFlowManager)init
{
  ICQUIOutOfProcessUpgradeFlowManager *v2;
  ICQRemoteUIDataLoader *v3;
  ICQRemoteUIDataLoader *loader;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQUIOutOfProcessUpgradeFlowManager;
  v2 = -[ICQUIOutOfProcessUpgradeFlowManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ICQRemoteUIDataLoader);
    loader = v2->_loader;
    v2->_loader = v3;

    v2->_presentationLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)beginFlowWithViewController:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  uint8_t buf[16];

  v4 = a3;
  -[ICQUIOutOfProcessUpgradeFlowManager offer](self, "offer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICQUIOutOfProcessUpgradeFlowManager _isDefaultOfferFlow:](self, "_isDefaultOfferFlow:", v5);

  -[ICQUIOutOfProcessUpgradeFlowManager offer](self, "offer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serverUIURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICQUIOutOfProcessUpgradeFlowManager _canUseExtensionKitForURL:](self, "_canUseExtensionKitForURL:", v8);

  if (v4)
  {
    v10 = 0;
  }
  else
  {
    -[ICQUIOutOfProcessUpgradeFlowManager _topMostPresentingViewController](self, "_topMostPresentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 == 0;

  }
  -[ICQUIOutOfProcessUpgradeFlowManager link](self, "link");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "action");

  -[ICQUIOutOfProcessUpgradeFlowManager presentingSceneIdentifier](self, "presentingSceneIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v21 = v6;
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Unknown scene identifier! Falling back to topmost viewcontroller's scene", buf, 2u);
    }

    -[ICQUIOutOfProcessUpgradeFlowManager _topMostPresentingViewController](self, "_topMostPresentingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "windowScene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_sceneIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIOutOfProcessUpgradeFlowManager setPresentingSceneIdentifier:](self, "setPresentingSceneIdentifier:", v20);

    v6 = v21;
  }
  if (v6 || v10 || !v9 || v13 == 127)
    -[ICQUIOutOfProcessUpgradeFlowManager _beginSBRemoteAlertFlow](self, "_beginSBRemoteAlertFlow");
  else
    -[ICQUIOutOfProcessUpgradeFlowManager _beginExtensionKitFlowWithViewController:](self, "_beginExtensionKitFlowWithViewController:", v4);

}

- (BOOL)_canUseExtensionKitForURL:(id)a3
{
  id v3;
  char v4;
  char v5;
  NSObject *v6;

  v3 = a3;
  v4 = +[ICQUIExtensionKitHelpers isExtensionKitFlagEnabled](ICQUIExtensionKitHelpers, "isExtensionKitFlagEnabled");
  v5 = +[ICQUIExtensionKitHelpers isExtensionKitURL:](ICQUIExtensionKitHelpers, "isExtensionKitURL:", v3);

  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICQUIOutOfProcessUpgradeFlowManager _canUseExtensionKitForURL:].cold.1(v4, v5, v6);

  return v4 | v5;
}

- (BOOL)_isDefaultOfferFlow:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.icq"));

  objc_msgSend(v3, "serverUIURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return v5;
  else
    return 1;
}

- (void)_beginSBRemoteAlertFlow
{
  os_unfair_lock_s *p_presentationLock;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  id v16;
  id buf[2];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  -[ICQUIOutOfProcessUpgradeFlowManager offer](self, "offer");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  -[ICQUIOutOfProcessUpgradeFlowManager link](self, "link");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  p_presentationLock = &self->_presentationLock;
  os_unfair_lock_lock(&self->_presentationLock);
  if (!self->_isPresented)
  {
    self->_isPresented = 1;
    os_unfair_lock_unlock(&self->_presentationLock);
    objc_msgSend((id)v25[5], "requestedServerUIURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (objc_msgSend((id)v19[5], "action") != 115 && objc_msgSend((id)v19[5], "action") != 121)
      {
        objc_initWeak(buf, self);
        -[ICQUIOutOfProcessUpgradeFlowManager loader](self, "loader");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v25[5], "serverUIURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __62__ICQUIOutOfProcessUpgradeFlowManager__beginSBRemoteAlertFlow__block_invoke;
        v12[3] = &unk_24E3F4DC8;
        objc_copyWeak(&v16, buf);
        v14 = &v24;
        v13 = v9;
        v15 = &v18;
        objc_msgSend(v10, "loadDataFromURL:completion:", v11, v12);

        objc_destroyWeak(&v16);
        objc_destroyWeak(buf);
        goto LABEL_12;
      }
      objc_msgSend((id)v25[5], "_updateRequestedServerUIURLWithURL:", v9);
    }
    -[ICQUIOutOfProcessUpgradeFlowManager _startUpsellWithOffer:link:preloadedRemoteUIData:error:](self, "_startUpsellWithOffer:link:preloadedRemoteUIData:error:", v25[5], v19[5], 0, 0);
LABEL_12:

    goto LABEL_13;
  }
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Remote flow already presented! Wait until it's complete.", (uint8_t *)buf, 2u);
  }

  -[ICQUIOutOfProcessUpgradeFlowManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ICQUIOutOfProcessUpgradeFlowManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIOutOfProcessUpgradeFlowManager flowManager](self, "flowManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "upgradeFlowManagerDidCancel:", v8);

  }
  os_unfair_lock_unlock(p_presentationLock);
LABEL_13:
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
}

void __62__ICQUIOutOfProcessUpgradeFlowManager__beginSBRemoteAlertFlow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v11 || !WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_updateRequestedServerUIURLWithURL:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "_startUpsellWithOffer:link:preloadedRemoteUIData:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v11, v5);
  }
  else
  {
    objc_msgSend(WeakRetained, "setIsPresented:", 0);
    objc_msgSend(WeakRetained, "_clearServerUIURL");
    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "flowManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "upgradeFlowManagerDidCancel:", v10);

    }
  }

}

- (void)_startUpsellWithOffer:(id)a3 link:(id)a4 preloadedRemoteUIData:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  objc_class *v26;
  id v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id location;
  uint8_t buf[8];
  uint64_t v33;
  Class (*v34)(uint64_t);
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _ICQGetLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICQUIOutOfProcessUpgradeFlowManager _startUpsellWithOffer:link:preloadedRemoteUIData:error:].cold.1(v13);

    self->_isPresented = 0;
    -[ICQUIOutOfProcessUpgradeFlowManager _clearServerUIURL](self, "_clearServerUIURL");
    -[ICQUIOutOfProcessUpgradeFlowManager delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[ICQUIOutOfProcessUpgradeFlowManager delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUIOutOfProcessUpgradeFlowManager flowManager](self, "flowManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "upgradeFlowManagerDidCancel:", v19);

    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Presenting out-of-process upgrade flow.", buf, 2u);
    }

    v20 = objc_alloc(MEMORY[0x24BEC7310]);
    -[ICQUIOutOfProcessUpgradeFlowManager flowOptions](self, "flowOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "serializedData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithOffer:link:flowOptionsData:preloadedRemoteUIData:", v10, v11, v22, v12);
    -[ICQUIOutOfProcessUpgradeFlowManager setRemoteContext:](self, "setRemoteContext:", v23);

    -[ICQRemoteContext setPresentingSceneIdentifier:](self->_remoteContext, "setPresentingSceneIdentifier:", self->_presentingSceneIdentifier);
    -[ICQRemoteContext setPresentingSceneBundleIdentifier:](self->_remoteContext, "setPresentingSceneBundleIdentifier:", self->_presentingSceneBundleIdentifier);
    objc_initWeak(&location, self);
    v37 = 0;
    v38 = &v37;
    v39 = 0x2050000000;
    v24 = (void *)getINDaemonConnectionClass_softClass_3;
    v40 = getINDaemonConnectionClass_softClass_3;
    v25 = MEMORY[0x24BDAC760];
    if (!getINDaemonConnectionClass_softClass_3)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v33 = 3221225472;
      v34 = __getINDaemonConnectionClass_block_invoke_3;
      v35 = &unk_24E3F3868;
      v36 = &v37;
      __getINDaemonConnectionClass_block_invoke_3((uint64_t)buf);
      v24 = (void *)v38[3];
    }
    v26 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v37, 8);
    v27 = objc_alloc_init(v26);
    -[ICQUIOutOfProcessUpgradeFlowManager remoteContext](self, "remoteContext");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v25;
    v29[1] = 3221225472;
    v29[2] = __94__ICQUIOutOfProcessUpgradeFlowManager__startUpsellWithOffer_link_preloadedRemoteUIData_error___block_invoke;
    v29[3] = &unk_24E3F4DF0;
    objc_copyWeak(&v30, &location);
    v29[4] = self;
    objc_msgSend(v27, "presentHiddenFreshmintWithContext:completion:", v28, v29);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

}

void __94__ICQUIOutOfProcessUpgradeFlowManager__startUpsellWithOffer_link_preloadedRemoteUIData_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (!WeakRetained)
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __94__ICQUIOutOfProcessUpgradeFlowManager__startUpsellWithOffer_link_preloadedRemoteUIData_error___block_invoke_cold_1();
    goto LABEL_18;
  }
  objc_msgSend(WeakRetained, "setRemoteContext:", 0);
  objc_msgSend(v7, "setIsPresented:", 0);
  objc_msgSend(v7, "_clearServerUIURL");
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v9)
      goto LABEL_15;
    v19 = 138412290;
    v20 = v5;
    v10 = "[Within Client] presentHiddenFreshmintWithUserInfo ERROR = %@";
    v11 = v8;
    v12 = 12;
    goto LABEL_14;
  }
  if (!a2)
  {
    if (!v9)
      goto LABEL_15;
    LOWORD(v19) = 0;
    v10 = "[Within Client] presentHiddenFreshmintWithUserInfo didCancel flow";
    v11 = v8;
    v12 = 2;
LABEL_14:
    _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v19, v12);
LABEL_15:

    objc_msgSend(v7, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      objc_msgSend(v7, "delegate");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "flowManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject upgradeFlowManagerDidCancel:](v13, "upgradeFlowManagerDidCancel:", v16);
      goto LABEL_17;
    }
    goto LABEL_19;
  }
  if (v9)
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "[Within Client] presentHiddenFreshmintWithUserInfo didComplete flow", (uint8_t *)&v19, 2u);
  }

  objc_msgSend(v7, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v7, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "flowManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject upgradeFlowManagerDidComplete:](v13, "upgradeFlowManagerDidComplete:", v16);
LABEL_17:

LABEL_18:
  }
LABEL_19:

}

- (void)_beginExtensionKitFlowWithViewController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[16];

  v4 = a3;
  os_unfair_lock_lock(&self->_presentationLock);
  if (!self->_isPresented)
  {
    self->_isPresented = 1;
    os_unfair_lock_unlock(&self->_presentationLock);
    objc_msgSend(v4, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ICQUIOutOfProcessUpgradeFlowManager _beginExtensionKitFlowWithViewController:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);

    }
    else if (v4)
    {
      v19 = v4;
      goto LABEL_13;
    }
    -[ICQUIOutOfProcessUpgradeFlowManager _topMostPresentingViewController](self, "_topMostPresentingViewController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v8 = v19;
    -[ICQUIOutOfProcessUpgradeFlowManager delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      _ICQGetLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[ICQUIOutOfProcessUpgradeFlowManager _beginExtensionKitFlowWithViewController:].cold.1(v28, v29, v30, v31, v32, v33, v34, v35);

      -[ICQUIOutOfProcessUpgradeFlowManager setIsPresented:](self, "setIsPresented:", 0);
      -[ICQUIOutOfProcessUpgradeFlowManager _clearServerUIURL](self, "_clearServerUIURL");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[ICQUIOutOfProcessUpgradeFlowManager flowManager](self, "flowManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        ICQCreateError();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "upgradeFlowManagerDidFail:error:", v36, v37);

      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_22;
        -[ICQUIOutOfProcessUpgradeFlowManager flowManager](self, "flowManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "upgradeFlowManagerDidCancel:", v36);
      }

      goto LABEL_22;
    }
    v20 = objc_alloc(MEMORY[0x24BEC7310]);
    -[ICQUIOutOfProcessUpgradeFlowManager offer](self, "offer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIOutOfProcessUpgradeFlowManager link](self, "link");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIOutOfProcessUpgradeFlowManager flowOptions](self, "flowOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "serializedData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v20, "initWithOffer:link:flowOptionsData:preloadedRemoteUIData:", v21, v22, v24, 0);
    -[ICQUIOutOfProcessUpgradeFlowManager setRemoteContext:](self, "setRemoteContext:", v25);

    -[ICQRemoteContext setPresentingSceneIdentifier:](self->_remoteContext, "setPresentingSceneIdentifier:", self->_presentingSceneIdentifier);
    -[ICQRemoteContext setPresentingSceneBundleIdentifier:](self->_remoteContext, "setPresentingSceneBundleIdentifier:", self->_presentingSceneBundleIdentifier);
    -[ICQUIOutOfProcessUpgradeFlowManager remoteContext](self, "remoteContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "toDictionary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __80__ICQUIOutOfProcessUpgradeFlowManager__beginExtensionKitFlowWithViewController___block_invoke;
    v38[3] = &unk_24E3F4E18;
    v38[4] = self;
    v9 = v9;
    v39 = v9;
    +[ICQUIRemoteExtensionEntry presentRemoteViewControllerWithContext:presentingViewController:completion:](ICQUIRemoteExtensionEntry, "presentRemoteViewControllerWithContext:presentingViewController:completion:", v27, v8, v38);

LABEL_22:
    goto LABEL_23;
  }
  os_unfair_lock_unlock(&self->_presentationLock);
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Remote extension flow already presented! Wait until it's complete.", buf, 2u);
  }

  -[ICQUIOutOfProcessUpgradeFlowManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[ICQUIOutOfProcessUpgradeFlowManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIOutOfProcessUpgradeFlowManager flowManager](self, "flowManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "upgradeFlowManagerDidCancel:", v9);
    goto LABEL_22;
  }
LABEL_23:

}

void __80__ICQUIOutOfProcessUpgradeFlowManager__beginExtensionKitFlowWithViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "_clearServerUIURL");
  if (a2)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "flowManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "upgradeFlowManagerDidCancel:");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "flowManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "upgradeFlowManagerDidComplete:");
  }

}

- (id)_topMostPresentingViewController
{
  void *v2;
  void *v3;
  NSObject *v4;

  -[ICQUIOutOfProcessUpgradeFlowManager _rootViewController](self, "_rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topMostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ICQUIOutOfProcessUpgradeFlowManager _topMostPresentingViewController].cold.1((uint64_t)v3, v4);

  return v3;
}

- (id)_rootViewController
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_clearServerUIURL
{
  -[ICQOffer _updateRequestedServerUIURLWithURL:](self->_offer, "_updateRequestedServerUIURLWithURL:", 0);
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
  objc_storeStrong((id *)&self->_offer, a3);
}

- (ICQLink)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_storeStrong((id *)&self->_link, a3);
}

- (ICQUpgradeFlowOptions)flowOptions
{
  return self->_flowOptions;
}

- (void)setFlowOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (ICQUpgradeFlowManager)flowManager
{
  return (ICQUpgradeFlowManager *)objc_loadWeakRetained((id *)&self->_flowManager);
}

- (void)setFlowManager:(id)a3
{
  objc_storeWeak((id *)&self->_flowManager, a3);
}

- (ICQUpgradeFlowManagerDelegate)delegate
{
  return (ICQUpgradeFlowManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (ICQRemoteContext)remoteContext
{
  return self->_remoteContext;
}

- (void)setRemoteContext:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContext, a3);
}

- (ICQRemoteUIDataLoader)loader
{
  return self->_loader;
}

- (void)setLoader:(id)a3
{
  objc_storeStrong((id *)&self->_loader, a3);
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_remoteContext, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_flowManager);
  objc_storeStrong((id *)&self->_flowOptions, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

- (void)_canUseExtensionKitForURL:(os_log_t)log .cold.1(char a1, char a2, os_log_t log)
{
  const __CFString *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = CFSTR("NO");
  v9 = *MEMORY[0x24BDAC8D0];
  if ((a1 & 1) != 0)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if ((a2 & 1) != 0)
    v3 = CFSTR("YES");
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = v3;
  _os_log_debug_impl(&dword_21F2CC000, log, OS_LOG_TYPE_DEBUG, "isExtensionKitFlagEnabled: %@, isExtensionKitURL: %@", (uint8_t *)&v5, 0x16u);
}

- (void)_startUpsellWithOffer:(void *)a1 link:preloadedRemoteUIData:error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_21F2CC000, v2, v3, "Unable to present at this time, %@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __94__ICQUIOutOfProcessUpgradeFlowManager__startUpsellWithOffer_link_preloadedRemoteUIData_error___block_invoke_cold_1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_2(&dword_21F2CC000, v1, v2, "%@ instance no longer exist.", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_beginExtensionKitFlowWithViewController:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21F2CC000, a1, a3, "Viewcontroller is nil and couldn't find a root view controller -- Unable to start extension flow!", a5, a6, a7, a8, 0);
}

- (void)_beginExtensionKitFlowWithViewController:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21F2CC000, a1, a3, "Provided viewcontroller is already presenting! Using workaround to get topmost view controller", a5, a6, a7, a8, 0);
}

- (void)_topMostPresentingViewController
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_DEBUG, "Returning topmost VC %@", (uint8_t *)&v2, 0xCu);
}

@end
