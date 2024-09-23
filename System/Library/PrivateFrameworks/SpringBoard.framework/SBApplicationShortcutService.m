@implementation SBApplicationShortcutService

- (void)applicationServer:(id)a3 client:(id)a4 setDynamicApplicationShortcutItems:(id)a5 forBundleIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v9 = a4;
  v10 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __112__SBApplicationShortcutService_applicationServer_client_setDynamicApplicationShortcutItems_forBundleIdentifier___block_invoke;
  v13[3] = &unk_1E8EAA658;
  v13[4] = self;
  v14 = v10;
  v15 = v9;
  v11 = v9;
  v12 = v10;
  -[SBApplicationShortcutService _authenticateClient:forBundleIdentifier:withCompletionHandler:](self, "_authenticateClient:forBundleIdentifier:withCompletionHandler:", v11, a6, v13);

}

- (void)applicationServer:(id)a3 client:(id)a4 fetchApplicationShortcutItemsOfTypes:(unint64_t)a5 forBundleIdentifier:(id)a6 withCompletion:(id)a7
{
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SBApplicationShortcutService *v16;
  id v17;
  id v18;
  unint64_t v19;

  v11 = a4;
  v12 = a6;
  v13 = a7;
  if (v13)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke;
    v14[3] = &unk_1E8EAA630;
    v19 = a5;
    v15 = v12;
    v18 = v13;
    v16 = self;
    v17 = v11;
    -[SBApplicationShortcutService _authenticateClient:forBundleIdentifier:withCompletionHandler:](self, "_authenticateClient:forBundleIdentifier:withCompletionHandler:", v17, v15, v14);

  }
}

- (void)_authenticateClient:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    if (v8)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __94__SBApplicationShortcutService__authenticateClient_forBundleIdentifier_withCompletionHandler___block_invoke;
      v12[3] = &unk_1E8EAA598;
      v13 = v8;
      v14 = v9;
      v15 = v11;
      -[SBApplicationShortcutService _checkEntitlementsForClient:withCompletionHandler:](self, "_checkEntitlementsForClient:withCompletionHandler:", v13, v12);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
    }
  }

}

- (void)_checkEntitlementsForClient:(id)a3 withCompletionHandler:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v6)
  {
    if (v7)
    {
      -[FBServiceClientAuthenticator authenticateClient:](self->_serviceClientFullAccessEntitlementAuthenticator, "authenticateClient:", v7);
      -[FBServiceClientAuthenticator authenticateClient:](self->_serviceClientCustomImageEntitlementAuthenticator, "authenticateClient:", v7);
    }
    v6[2](v6);
  }

}

void __94__SBApplicationShortcutService__authenticateClient_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void (*v3)(void);
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "processHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40) && (objc_msgSend(v4, "isEqualToString:") & 1) == 0)
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  else
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  v3();

}

void __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  char v26;
  char v27;
  char v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  char v43;
  unint64_t v44;
  _QWORD v45[4];
  char v46;
  _QWORD v47[4];
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD block[4];
  id v60;
  id v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if ((v9 & 0x1000002) != 0)
  {
    v10 = objc_msgSend(v7, "isLocked") ^ 1;
    v11 = *(_QWORD *)(a1 + 64);
    if (a2)
      goto LABEL_3;
  }
  else
  {
    v10 = 0;
    v11 = *(_QWORD *)(a1 + 64);
    if (a2)
    {
LABEL_3:
      v40 = v10;
      v42 = v8;
      v43 = v11;
      v44 = v11 & 8;
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "applicationWithBundleIdentifier:", v6);
      v13 = objc_claimAutoreleasedReturnValue();

      v90 = 0;
      v91 = &v90;
      v92 = 0x2020000000;
      v93 = 0;
      v86 = 0;
      v87 = &v86;
      v88 = 0x2020000000;
      v89 = 0;
      v82 = 0;
      v83 = &v82;
      v84 = 0x2020000000;
      v85 = 0;
      v78 = 0;
      v79 = &v78;
      v80 = 0x2020000000;
      v81 = 0;
      v74 = 0;
      v75 = &v74;
      v76 = 0x2020000000;
      v77 = 0;
      v68 = 0;
      v69 = &v68;
      v70 = 0x3032000000;
      v71 = __Block_byref_object_copy__32;
      v72 = __Block_byref_object_dispose__32;
      v73 = 0;
      if ((v9 & 0x1000000) != 0)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_14;
        block[3] = &unk_1E8EAA5C0;
        v62 = &v90;
        v60 = v6;
        v63 = &v86;
        v64 = &v82;
        v65 = &v78;
        v66 = &v74;
        v67 = &v68;
        v61 = *(id *)(a1 + 32);
        dispatch_sync(MEMORY[0x1E0C80D38], block);

      }
      if (v44)
      {
        v15 = (void *)v13;
        if (*((_BYTE *)v79 + 24))
        {
          if (*((_BYTE *)v87 + 24))
            v14 = 0;
          else
            v14 = 3;
          if (!v13)
          {
LABEL_29:
            v22 = 0;
            if ((v9 & 0x1000000) != 0)
            {
              v29 = 0;
              v20 = 0;
              if (v69[5])
              {
                v53 = 0;
                v54 = &v53;
                v55 = 0x3032000000;
                v56 = __Block_byref_object_copy__32;
                v57 = __Block_byref_object_dispose__32;
                v58 = 0;
                v47[0] = MEMORY[0x1E0C809B0];
                v47[1] = 3221225472;
                v47[2] = __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_2;
                v47[3] = &unk_1E8EAA5E8;
                v49 = &v68;
                v50 = &v53;
                v48 = v6;
                v51 = &v82;
                v52 = v14;
                dispatch_sync(MEMORY[0x1E0C80D38], v47);
                v29 = (id)v54[5];

                _Block_object_dispose(&v53, 8);
                v22 = 0;
                v20 = 0;
              }
            }
            else
            {
              v29 = 0;
              v20 = 0;
            }
            goto LABEL_33;
          }
        }
        else
        {
          v14 = 0;
          if (!v13)
            goto LABEL_29;
        }
      }
      else
      {
        v14 = 0;
        v15 = (void *)v13;
        if (!v13)
          goto LABEL_29;
      }
      objc_msgSend(v15, "info");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isBlockedForScreenTimeExpiration");

      if ((v9 & 0x1000001) != 0)
        v19 = v18;
      else
        v19 = 1;
      if ((v19 & 1) != 0)
      {
        v20 = 0;
      }
      else
      {
        objc_msgSend(v15, "info");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "staticApplicationShortcutItems");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if ((v40 & ~v18) != 0)
      {
        objc_msgSend(v15, "dynamicApplicationShortcutItems");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v9 & 0x1000000) != 0)
        {
LABEL_25:
          v23 = v14;
          objc_msgSend(v15, "info");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)MEMORY[0x1E0DAA478];
          objc_msgSend(v15, "displayName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "itemID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v41, "unsignedIntegerValue");
          v36 = v91[3];
          v25 = objc_msgSend(v24, "supportsMultiwindow");
          v26 = objc_msgSend(v15, "isSystemApplication");
          v27 = objc_msgSend(v15, "isInternalApplication");
          v28 = objc_msgSend(v24, "isBeta");
          BYTE5(v35) = *((_BYTE *)v83 + 24);
          BYTE4(v35) = *((_BYTE *)v75 + 24);
          BYTE3(v35) = v28;
          BYTE2(v35) = v27;
          BYTE1(v35) = v26;
          LOBYTE(v35) = v25;
          objc_msgSend(v38, "composedShortcutsForApplicationWithBundleIdentifier:iconDisplayName:staticItems:dynamicItems:applicationItemID:numberOfDisplayItemsInSwitcher:supportsMultipleWindows:isSystemApplication:isInternalApplication:isApplicationInBeta:isApplicationHidden:iconManagerAllowsEditing:removeStyle:", v6, v39, v20, v22, v37, v36, v35, v23);
          v29 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
          if ((v43 & 4) == 0)
          {
            v45[0] = MEMORY[0x1E0C809B0];
            v45[1] = 3221225472;
            v45[2] = __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_3;
            v45[3] = &__block_descriptor_33_e53_B24__0__SBSApplicationShortcutItem_8__NSDictionary_16l;
            v46 = v44 >> 3;
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v45);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "filteredArrayUsingPredicate:", v30);
            v31 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "filteredArrayUsingPredicate:", v30);
            v32 = objc_claimAutoreleasedReturnValue();

            v22 = (void *)v32;
            v29 = (id)v31;
          }
          v33 = *(_QWORD *)(a1 + 56);
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB0]), "initWithStaticApplicationShortcutItems:dynamicApplicationShortcutItems:composedApplicationShortcutItems:", v20, v22, v29);
          (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v34);

          _Block_object_dispose(&v68, 8);
          _Block_object_dispose(&v74, 8);
          _Block_object_dispose(&v78, 8);
          _Block_object_dispose(&v82, 8);
          _Block_object_dispose(&v86, 8);
          _Block_object_dispose(&v90, 8);

          v8 = v42;
          goto LABEL_36;
        }
      }
      else
      {
        v22 = 0;
        if ((v9 & 0x1000000) != 0)
          goto LABEL_25;
      }
      v29 = 0;
      goto LABEL_33;
    }
  }
  SBLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_cold_1(a1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_36:

}

void __112__SBApplicationShortcutService_applicationServer_client_setDynamicApplicationShortcutItems_forBundleIdentifier___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v7 = a4;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sanitizeApplicationShortcutItems:withEntitlements:", *(_QWORD *)(a1 + 40), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationWithBundleIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDynamicApplicationShortcutItems:", v8);

  }
  else
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __112__SBApplicationShortcutService_applicationServer_client_setDynamicApplicationShortcutItems_forBundleIdentifier___block_invoke_cold_1(a1);

  }
}

- (id)_sanitizeApplicationShortcutItems:(id)a3 withEntitlements:(unint64_t)a4
{
  char v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    v21 = &v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "copy", v21);
        v13 = v12;
        if ((v4 & 2) == 0)
        {
          objc_msgSend(v12, "bundleIdentifierToLaunch");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            SBLogCommon();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[SBApplicationShortcutService _sanitizeApplicationShortcutItems:withEntitlements:].cold.3();

            objc_msgSend(v13, "setBundleIdentifierToLaunch:", 0);
          }
        }
        objc_msgSend(v13, "icon");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v4 & 3) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            SBLogCommon();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              -[SBApplicationShortcutService _sanitizeApplicationShortcutItems:withEntitlements:].cold.2();

            objc_msgSend(v13, "setIcon:", 0);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "imageData");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              SBLogCommon();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                -[SBApplicationShortcutService _sanitizeApplicationShortcutItems:withEntitlements:].cold.1();

              objc_msgSend(v13, "setIcon:", 0);
            }
          }
        }
        if (v13)
          objc_msgSend(v6, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  return v6;
}

uint64_t __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 32) && (objc_msgSend(MEMORY[0x1E0DAA478], "sbh_isShortcutItemDeleteOrRemove:", v5) & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(MEMORY[0x1E0DAA478], "sbh_isShortcutItemSpringBoardOnly:", v5) ^ 1;

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1)
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_108);
  return (id)sharedInstance___sharedInstance_8;
}

void __46__SBApplicationShortcutService_sharedInstance__block_invoke()
{
  SBApplicationShortcutService *v0;
  void *v1;

  v0 = objc_alloc_init(SBApplicationShortcutService);
  v1 = (void *)sharedInstance___sharedInstance_8;
  sharedInstance___sharedInstance_8 = (uint64_t)v0;

}

- (SBApplicationShortcutService)init
{
  SBApplicationShortcutService *v2;
  id v3;
  uint64_t v4;
  FBServiceClientAuthenticator *serviceClientFullAccessEntitlementAuthenticator;
  id v6;
  uint64_t v7;
  FBServiceClientAuthenticator *serviceClientCustomImageEntitlementAuthenticator;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBApplicationShortcutService;
  v2 = -[SBApplicationShortcutService init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D22990]);
    v4 = objc_msgSend(v3, "initWithEntitlement:", *MEMORY[0x1E0DAB570]);
    serviceClientFullAccessEntitlementAuthenticator = v2->_serviceClientFullAccessEntitlementAuthenticator;
    v2->_serviceClientFullAccessEntitlementAuthenticator = (FBServiceClientAuthenticator *)v4;

    v6 = objc_alloc(MEMORY[0x1E0D22990]);
    v7 = objc_msgSend(v6, "initWithEntitlement:", *MEMORY[0x1E0DAB568]);
    serviceClientCustomImageEntitlementAuthenticator = v2->_serviceClientCustomImageEntitlementAuthenticator;
    v2->_serviceClientCustomImageEntitlementAuthenticator = (FBServiceClientAuthenticator *)v7;

    +[SBApplicationServer sharedInstance](SBApplicationServer, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShortcutDelegate:", v2);

  }
  return v2;
}

void __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_14(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_recentAppLayoutsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recentDisplayItemsForBundleIdentifier:includingHiddenAppLayouts:", a1[4], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v4, "count");

  +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v5, "hasAnyLockState");

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "iconManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    v7 = objc_msgSend(v6, "isEditingAllowed");
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v7;
  objc_msgSend(v15, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationIconForBundleIdentifier:", a1[4]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = objc_msgSend(v15, "isUninstallSupportedForIcon:", v9);
    if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
      v10 = 0;
    else
      v10 = objc_msgSend(v6, "isIconIgnored:", v9);
  }
  else
  {
    v10 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 0;
  }
  *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = v10;
  +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "placeholderForDisplayID:", a1[5]);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1[11] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

void __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "placeholdersByDisplayID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "applicationItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "applicationDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "canBeShared");
  LOBYTE(v10) = *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24);
  objc_msgSend(MEMORY[0x1E0DAA478], "composedShortcutsForDownloadingApplicationWithBundleIdentifier:iconDisplayName:applicationItemID:canModifyDownloadState:prioritizationIsAvailable:downloadingInformationAgent:iconManagerAllowsEditing:removeStyle:canShare:", a1[4], v6, v5, 0, v3, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), v10, a1[8], v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClientCustomImageEntitlementAuthenticator, 0);
  objc_storeStrong((id *)&self->_serviceClientFullAccessEntitlementAuthenticator, 0);
}

- (void)_sanitizeApplicationShortcutItems:withEntitlements:.cold.1()
{
  _QWORD *v0;
  _DWORD *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (objc_class *)OUTLINED_FUNCTION_1_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *v1 = 138543362;
  *v0 = v3;
  OUTLINED_FUNCTION_0_11(&dword_1D0540000, v4, v5, "[%{public}@] Client is not entitled to set a contact icon with custom image data. Ignoring.");

  OUTLINED_FUNCTION_3_6();
}

- (void)_sanitizeApplicationShortcutItems:withEntitlements:.cold.2()
{
  _QWORD *v0;
  _DWORD *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (objc_class *)OUTLINED_FUNCTION_1_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *v1 = 138543362;
  *v0 = v3;
  OUTLINED_FUNCTION_0_11(&dword_1D0540000, v4, v5, "[%{public}@] Client is not entitled to set an icon using a custom (dynamic, non-masked) image. Ignoring.");

  OUTLINED_FUNCTION_3_6();
}

- (void)_sanitizeApplicationShortcutItems:withEntitlements:.cold.3()
{
  _QWORD *v0;
  _DWORD *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (objc_class *)OUTLINED_FUNCTION_1_8();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *v1 = 138543362;
  *v0 = v3;
  OUTLINED_FUNCTION_0_11(&dword_1D0540000, v4, v5, "[%{public}@] Client is not entitled to set bundleIdentifierToLaunch. Ignoring.");

  OUTLINED_FUNCTION_3_6();
}

void __129__SBApplicationShortcutService_applicationServer_client_fetchApplicationShortcutItemsOfTypes_forBundleIdentifier_withCompletion___block_invoke_cold_1(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "processHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v4, v5, "[%{public}@] Client process [%@] is not entitled to request application shortcut items on behalf of another process. Ignoring request.", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_20();
}

void __112__SBApplicationShortcutService_applicationServer_client_setDynamicApplicationShortcutItems_forBundleIdentifier___block_invoke_cold_1(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "processHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v4, v5, "[%{public}@] Client process [%@] is not entitled to change dynamic application shortcut items on behalf of another process. Ignoring request.", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_20();
}

@end
