@implementation SBApplicationMultiwindowService

+ (SBApplicationMultiwindowService)sharedInstance
{
  if (sharedInstance_onceToken_18 != -1)
    dispatch_once(&sharedInstance_onceToken_18, &__block_literal_global_136);
  return (SBApplicationMultiwindowService *)(id)sharedInstance___sharedInstance_11;
}

void __49__SBApplicationMultiwindowService_sharedInstance__block_invoke()
{
  SBApplicationMultiwindowService *v0;
  void *v1;

  v0 = objc_alloc_init(SBApplicationMultiwindowService);
  v1 = (void *)sharedInstance___sharedInstance_11;
  sharedInstance___sharedInstance_11 = (uint64_t)v0;

}

- (SBApplicationMultiwindowService)init
{
  SBApplicationMultiwindowService *v2;
  id v3;
  uint64_t v4;
  FBServiceClientAuthenticator *triggerShowAllWindowsEntitlementAuthenticator;
  id v6;
  uint64_t v7;
  FBServiceClientAuthenticator *requestShelfPresentationEntitlementAuthenticator;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBApplicationMultiwindowService;
  v2 = -[SBApplicationMultiwindowService init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D22990]);
    v4 = objc_msgSend(v3, "initWithEntitlement:", *MEMORY[0x1E0DAB558]);
    triggerShowAllWindowsEntitlementAuthenticator = v2->_triggerShowAllWindowsEntitlementAuthenticator;
    v2->_triggerShowAllWindowsEntitlementAuthenticator = (FBServiceClientAuthenticator *)v4;

    v6 = objc_alloc(MEMORY[0x1E0D22990]);
    v7 = objc_msgSend(v6, "initWithEntitlement:", *MEMORY[0x1E0DAB550]);
    requestShelfPresentationEntitlementAuthenticator = v2->_requestShelfPresentationEntitlementAuthenticator;
    v2->_requestShelfPresentationEntitlementAuthenticator = (FBServiceClientAuthenticator *)v7;

    +[SBApplicationServer sharedInstance](SBApplicationServer, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMultiwindowDelegate:", v2);

  }
  return v2;
}

- (void)applicationServer:(id)a3 client:(id)a4 showAllWindowsForBundleIdentifier:(id)a5
{
  id v7;

  v7 = a5;
  if (-[FBServiceClientAuthenticator authenticateClient:](self->_triggerShowAllWindowsEntitlementAuthenticator, "authenticateClient:", a4))-[SBApplicationMultiwindowService triggerShowAllWindowsForApplicationBundleIdentifier:](self, "triggerShowAllWindowsForApplicationBundleIdentifier:", v7);

}

- (void)applicationServer:(id)a3 client:(id)a4 requestShelfPresentationForSceneWithIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a4;
  v8 = a5;
  if (-[FBServiceClientAuthenticator authenticateClient:](self->_requestShelfPresentationEntitlementAuthenticator, "authenticateClient:", v7))
  {
    v9 = v8;
    v10 = v7;
    BSDispatchMain();

  }
}

void __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowSceneForSceneIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fbsDisplayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_2;
  v7[3] = &unk_1E8EA2258;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v5, 0, v7);

}

uint64_t __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_2(id *a1, void *a2)
{
  id v3;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 54);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_3;
  v5[3] = &unk_1E8EAACE0;
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  objc_msgSend(v3, "modifyApplicationContext:", v5);
  objc_msgSend(v3, "finalize");

  return 1;
}

void __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_3(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t *v8;
  void *v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a2;
  objc_msgSend(a1[4], "processHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_4;
  v18 = &unk_1E8EAC5E0;
  v22 = &v23;
  v6 = v3;
  v19 = v6;
  v7 = v5;
  v20 = v7;
  v8 = (uint64_t *)(a1 + 5);
  v21 = a1[5];
  SBLayoutRoleEnumerateValidRoles(&v15);
  objc_msgSend(a1[6], "switcherController", v15, v16, v17, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isChamoisWindowingUIEnabled");

  if ((v10 & 1) != 0)
  {
LABEL_6:
    objc_msgSend(v6, "setRequestedAppExposeBundleID:", v7);
    goto LABEL_7;
  }
  v11 = v24[3];
  if (!v11)
  {
    SBLogAppSwitcher();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_3_cold_1((uint64_t)v7, v8, v12);

    goto LABEL_6;
  }
  if (v11 == 1)
  {
    objc_msgSend(v6, "previousLayoutState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "elementWithRole:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v6, "setRequestedWindowPickerRole:", v24[3]);
    else
      objc_msgSend(v6, "setRequestedAppExposeBundleID:", v7);

  }
  else
  {
    objc_msgSend(v6, "setRequestedWindowPickerRole:");
  }
LABEL_7:

  _Block_object_dispose(&v23, 8);
}

void __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "previousLayoutState");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "elementWithRole:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workspaceEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationSceneEntity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    {
      objc_msgSend(v8, "sceneIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 48));

      if (v11)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    }
    else
    {

    }
  }
}

- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __87__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke_2;
  v3[3] = &unk_1E8E9EE78;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "requestTransitionWithBuilder:", v3);

}

void __87__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 33);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke_3;
  v4[3] = &unk_1E8E9EE50;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v4);
  objc_msgSend(v3, "finalize");

}

void __87__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setRequestedAppExposeBundleID:", v2);
  objc_msgSend(v3, "setWaitsForSceneUpdates:", 0);

}

- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3 displayConfiguration:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = a3;
  v8 = a4;
  v9 = v5;
  v6 = v5;
  v7 = v8;
  BSDispatchMain();

}

void __108__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier_displayConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __108__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier_displayConfiguration___block_invoke_2;
  v4[3] = &unk_1E8E9EE78;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v3, v4, 0);

}

void __108__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier_displayConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 33);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __108__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier_displayConfiguration___block_invoke_3;
  v4[3] = &unk_1E8E9EE50;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v4);
  objc_msgSend(v3, "finalize");

}

void __108__SBApplicationMultiwindowService_triggerShowAllWindowsForApplicationBundleIdentifier_displayConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setRequestedAppExposeBundleID:", v2);
  objc_msgSend(v3, "setWaitsForSceneUpdates:", 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestShelfPresentationEntitlementAuthenticator, 0);
  objc_storeStrong((id *)&self->_triggerShowAllWindowsEntitlementAuthenticator, 0);
}

void __107__SBApplicationMultiwindowService_applicationServer_client_requestShelfPresentationForSceneWithIdentifier___block_invoke_3_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_fault_impl(&dword_1D0540000, log, OS_LOG_TYPE_FAULT, "%@ requested shelf presentation with an invalid scene identifier (%@); defaulting to App Expose shelf",
    (uint8_t *)&v4,
    0x16u);
}

@end
