@implementation SBWebClipService

- (SBWebClipService)initWithWorkspace:(id)a3 sceneManager:(id)a4 placeholderController:(id)a5 applicationController:(id)a6 lockScreenManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SBWebClipService *v17;
  SBWebClipService *v18;
  NSMutableArray *v19;
  NSMutableArray *connections;
  uint64_t v21;
  FBServiceClientAuthenticator *legacyClientAuthenticator;
  uint64_t v23;
  FBServiceClientAuthenticator *clientAuthenticator;
  uint64_t v25;
  OS_dispatch_queue *serviceQueue;
  void *v27;
  id *v28;
  uint64_t v29;
  id v30;
  _QWORD v32[4];
  id *v33;
  objc_super v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v34.receiver = self;
  v34.super_class = (Class)SBWebClipService;
  v17 = -[SBWebClipService init](&v34, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_workspace, v12);
    objc_storeWeak((id *)&v18->_sceneManager, v13);
    objc_storeStrong((id *)&v18->_placeholderController, a5);
    objc_storeStrong((id *)&v18->_applicationController, a6);
    objc_storeStrong((id *)&v18->_lockScreenManager, a7);
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    connections = v18->_connections;
    v18->_connections = v19;

    v18->_pendingLaunchTimeout = 5.0;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.dimSumService"));
    legacyClientAuthenticator = v18->_legacyClientAuthenticator;
    v18->_legacyClientAuthenticator = (FBServiceClientAuthenticator *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.webClipService"));
    clientAuthenticator = v18->_clientAuthenticator;
    v18->_clientAuthenticator = (FBServiceClientAuthenticator *)v23;

    v25 = BSDispatchQueueCreateWithQualityOfService();
    serviceQueue = v18->_serviceQueue;
    v18->_serviceQueue = (OS_dispatch_queue *)v25;

    v27 = (void *)MEMORY[0x1E0D23030];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __113__SBWebClipService_initWithWorkspace_sceneManager_placeholderController_applicationController_lockScreenManager___block_invoke;
    v32[3] = &unk_1E8E9EFA0;
    v28 = v18;
    v33 = v28;
    objc_msgSend(v27, "listenerWithConfigurator:", v32);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v28[8];
    v28[8] = (id)v29;

    objc_msgSend(v28[8], "activate");
  }

  return v18;
}

void __113__SBWebClipService_initWithWorkspace_sceneManager_placeholderController_applicationController_lockScreenManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAB088], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (id)initForTestingWithPlaceholderController:(id)a3 applicationController:(id)a4
{
  id v7;
  id v8;
  SBWebClipService *v9;
  SBWebClipService *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[SBWebClipService init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeholderController, a3);
    objc_storeStrong((id *)&v10->_applicationController, a4);
    v10->_pendingLaunchTimeout = 5.0;
  }

  return v10;
}

- (void)prepareToLaunchWebClipWithIdentifier:(id)a3 handler:(id)a4
{
  void *v4;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
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
  SBDeviceApplicationSceneEntity *v23;
  void *v24;
  void *v25;
  SBDeviceApplicationSceneEntity *v26;
  SBDeviceApplicationSceneEntity *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  BOOL v31;
  char v32;
  char v33;
  SBAppClipPlaceholderWorkspaceEntity *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  SBActivationSettings *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  SBDeviceApplicationSceneEntity *v53;
  void *v54;
  int v55;
  void (**v56)(void);
  _QWORD v57[4];
  SBAppClipPlaceholderWorkspaceEntity *v58;
  id v59;
  id v60;
  id v61;
  void (**v62)(void);
  _QWORD v63[5];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id WeakRetained;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  SBAppClipPlaceholderWorkspaceEntity *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v56 = (void (**)(void))a4;
  objc_msgSend(MEMORY[0x1E0CEAC08], "webClipWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWebClipService.m"), 117, CFSTR("No web clip for the given identifier"));

  }
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__98;
  v68 = __Block_byref_object_dispose__98;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __65__SBWebClipService_prepareToLaunchWebClipWithIdentifier_handler___block_invoke;
  v63[3] = &unk_1E8EBC428;
  v63[4] = &v64;
  -[SBWebClipService _performActionIfContinuitySessionActive:](self, "_performActionIfContinuitySessionActive:", v63);
  if (!objc_msgSend(v8, "isAppClip"))
  {
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "iconController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "bookmarkIconForWebClipIdentifier:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v19, "isBookmarkIcon"))
    {
      v27 = 0;
LABEL_40:
      v54 = v27;
      v56[2]();
      goto LABEL_41;
    }
    v20 = v19;
    v21 = v19;
    objc_msgSend(v21, "applicationToLaunch");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (objc_msgSend(v21, "representsWebApp"))
      {
        +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:](SBWebApplication, "_webAppIdentifierFromWebClipIdentifier:", v7);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = [SBDeviceApplicationSceneEntity alloc];
        v24 = (void *)v65[5];
        objc_msgSend(v24, "displayIdentity");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v23, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v22, v4, v24, v25);

      }
      else
      {
        v53 = [SBDeviceApplicationSceneEntity alloc];
        v55 = __sb__runningInSpringBoard();
        if (v55)
        {
          v39 = SBFEffectiveDeviceClass() == 2;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v4, "userInterfaceIdiom") == 1;
        }
        v40 = (void *)v65[5];
        objc_msgSend(v40, "displayIdentity");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[SBDeviceApplicationSceneEntity initWithApplication:generatingNewPrimarySceneIfRequired:sceneHandleProvider:displayIdentity:](v53, "initWithApplication:generatingNewPrimarySceneIfRequired:sceneHandleProvider:displayIdentity:", v22, v39, v40, v41);

        if ((v55 & 1) != 0)
          goto LABEL_39;
      }

    }
    else
    {
      v26 = 0;
    }
LABEL_39:
    v42 = objc_alloc_init(SBActivationSettings);
    objc_msgSend(v21, "bookmark");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "launchURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBActivationSettings setObject:forActivationSetting:](v42, "setObject:forActivationSetting:", v44, 5);

    -[SBWorkspaceEntity applyActivationSettings:](v26, "applyActivationSettings:", v42);
    v19 = v20;
    v27 = v26;
    goto LABEL_40;
  }
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWebClipService.m"), 131, CFSTR("%@ Expects a target bundle identifier to be laid down for web clip with identifier %@."), v54, v7);

  }
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "model");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v51, "bookmarkIconForWebClipIdentifier:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = v13 == 0;

  if ((_DWORD)v11)
    v14 = (id)objc_msgSend(v51, "addBookmarkIconForWebClip:", v8);
  v52 = (void *)objc_msgSend((id)v65[5], "newSceneIdentifierForBundleIdentifier:supportsMultiwindow:", v10, 0);
  objc_msgSend(MEMORY[0x1E0D23068], "storeForApplication:", v10);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "sceneStoreForIdentifier:creatingIfNecessary:", v52, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v7, CFSTR("appClipIdentifier"));
  v48 = v15;
  if (v10)
  {
    -[SBApplicationController applicationWithBundleIdentifier:](self->_applicationController, "applicationWithBundleIdentifier:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  -[SBApplicationPlaceholderController placeholderForDisplayID:](self->_placeholderController, "placeholderForDisplayID:", v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = +[SBAppClipPlaceholderWorkspaceEntity isAppClipUpdateAvailableForBundleIdentifier:](SBAppClipPlaceholderWorkspaceEntity, "isAppClipUpdateAvailableForBundleIdentifier:", v29);

  if (v16)
    v31 = v28 == 0;
  else
    v31 = 0;
  v32 = !v31 || v30;
  if ((v32 & 1) != 0)
  {
    if (v28)
      v33 = 1;
    else
      v33 = v30;
    if ((v33 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWebClipService.m"), 165, CFSTR("%@ Expects a placeholder application to be laid down for web clip with target bundle identifier %@."), v54, v10);

    }
    v34 = -[SBAppClipPlaceholderWorkspaceEntity initWithBundleIdentifier:futureSceneIdentifier:needsUpdate:]([SBAppClipPlaceholderWorkspaceEntity alloc], "initWithBundleIdentifier:futureSceneIdentifier:needsUpdate:", v10, v52, v30);
    SBLogWebClip();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v71 = v54;
      v72 = 2114;
      v73 = v34;
      _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Will launch app clip placeholder with workspace entity: %{public}@", buf, 0x16u);
    }

    ((void (*)(void (**)(void), SBAppClipPlaceholderWorkspaceEntity *))v56[2])(v56, v34);
  }
  else
  {
    v36 = (void *)v65[5];
    objc_msgSend(v36, "displayIdentity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDeviceApplicationSceneEntity defaultEntityWithApplication:sceneHandleProvider:displayIdentity:](SBDeviceApplicationSceneEntity, "defaultEntityWithApplication:sceneHandleProvider:displayIdentity:", v16, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __65__SBWebClipService_prepareToLaunchWebClipWithIdentifier_handler___block_invoke_2;
    v57[3] = &unk_1E8EBC450;
    v34 = v38;
    v58 = v34;
    v59 = v54;
    v60 = v16;
    v61 = v7;
    v62 = v56;
    -[SBWebClipService buildLaunchActionsForAppClipWithWebClipIdentifier:completion:](self, "buildLaunchActionsForAppClipWithWebClipIdentifier:completion:", v61, v57);

  }
  v19 = v51;
LABEL_41:

  _Block_object_dispose(&v64, 8);
}

void __65__SBWebClipService_prepareToLaunchWebClipWithIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "mainWindowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneManager");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __65__SBWebClipService_prepareToLaunchWebClipWithIdentifier_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addActions:", a2);
  SBLogWebClip();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v8 = 138543874;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Backing application exists for: %{public}@. Launching %{public}@.", (uint8_t *)&v8, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

+ (id)bestWebClipForTargetContentIdentifier:(id)a3 fromWebClips:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  char v36;
  int v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  unint64_t v44;
  id obj;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  if (!v7)
    goto LABEL_19;
  v8 = v7;
  if (!v5)
  {
    if (v7 != 1)
      goto LABEL_19;
LABEL_18:
    objc_msgSend(v6, "firstObject");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v9 = objc_msgSend(v5, "length");
  if (v8 == 1 && !v9)
    goto LABEL_18;
  if (!objc_msgSend(v5, "length"))
  {
LABEL_19:
    v18 = 0;
    goto LABEL_20;
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v54 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 && objc_msgSend(v16, "length") && (objc_msgSend(v17, "isEqualToString:", v5) & 1) != 0)
        {
          v18 = v15;

          if (v18)
            goto LABEL_20;
          goto LABEL_22;
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v12)
        continue;
      break;
    }
  }

LABEL_22:
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v18 = 0;
    goto LABEL_54;
  }
  v21 = 0x1E0CB3000uLL;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v20, 0);
  objc_msgSend(v22, "host");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v43)
  {
    v18 = 0;
    goto LABEL_53;
  }
  v38 = v22;
  v39 = v20;
  v40 = v6;
  v41 = v5;
  objc_msgSend(v20, "pathComponents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v10;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (!v48)
  {
    v42 = 0;
    goto LABEL_52;
  }
  v44 = 0;
  v42 = 0;
  v47 = *(_QWORD *)v50;
  do
  {
    for (j = 0; j != v48; ++j)
    {
      if (*(_QWORD *)v50 != v47)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
      objc_msgSend(v25, "pageURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(objc_alloc(*(Class *)(v21 + 2456)), "initWithURL:resolvingAgainstBaseURL:", v26, 0);
      objc_msgSend(v27, "host");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pathComponents");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v46 = v25;
        objc_msgSend(v26, "absoluteString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v30, "length"))
          goto LABEL_44;
        v31 = BSEqualStrings();

        if (v31)
        {
          v32 = objc_msgSend(v23, "count");
          if (v32 >= objc_msgSend(v29, "count"))
          {
            v33 = 0;
            if (objc_msgSend(v23, "count"))
            {
              while (1)
              {
                objc_msgSend(v23, "objectAtIndex:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                if (v33 >= objc_msgSend(v29, "count"))
                {
                  v37 = 1;
                  goto LABEL_40;
                }
                objc_msgSend(v29, "objectAtIndex:", v33);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = BSEqualStrings();

                if ((v36 & 1) == 0)
                  break;
                ++v33;

                if (v33 >= objc_msgSend(v23, "count"))
                  goto LABEL_37;
              }
              v37 = 0;
LABEL_40:

            }
            else
            {
LABEL_37:
              v37 = 1;
            }
            if (v37 && v33 >= v44)
            {
              v30 = v42;
              v42 = v46;
              v44 = v33;
              v21 = 0x1E0CB3000;
LABEL_44:

              goto LABEL_46;
            }
          }
        }
        v21 = 0x1E0CB3000;
      }
LABEL_46:

    }
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  }
  while (v48);
LABEL_52:

  v6 = v40;
  v5 = v41;
  v22 = v38;
  v20 = v39;
  v18 = v42;
LABEL_53:

LABEL_54:
LABEL_20:

  return v18;
}

- (id)targetApplicationBundleIdentifierForWebClip:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iconController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "bookmarkIconForWebClipIdentifier:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isBookmarkIcon"))
    {
      objc_msgSend(v7, "applicationToLaunch");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)launchWebClipWithIdentifier:(id)a3 origin:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  SBWebClipService *v19;
  id v20;
  id v21;
  SEL v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[SBWebClipService _clearPendingLaunch](self, "_clearPendingLaunch");
  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogWebClip();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    SBSStringFromWebClipServiceLaunchOrigin();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v11;
    v26 = 2114;
    v27 = v7;
    v28 = 2114;
    v29 = v13;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Received request to launch web clip with identifier: %{public}@ origin: %{public}@", buf, 0x20u);

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke;
  v17[3] = &unk_1E8EBC538;
  v18 = v7;
  v19 = self;
  v22 = a2;
  v23 = v9;
  v20 = v11;
  v21 = v8;
  v14 = v8;
  v15 = v11;
  v16 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SBLockScreenUnlockRequest *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  SBLockScreenUnlockRequest *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  _QWORD block[4];
  id v34;
  NSObject *v35;
  id v36[2];
  _QWORD v37[5];
  id v38;
  id v39;
  _BYTE *v40;
  uint64_t v41;
  _QWORD v42[4];
  SBLockScreenUnlockRequest *v43;
  _BYTE *v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  const __CFString *v49;
  _QWORD v50[4];

  v50[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEAC08], "webClipWithIdentifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "applicationBundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isAppClip"))
      v5 = v4 == 0;
    else
      v5 = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("SBWebClipService.m"), 300, CFSTR("%@ Expects a target bundle identifier to be laid down for app clip with identifier %@."), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

    }
    else if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "placeholderForDisplayID:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "applicationWithBundleIdentifier:", v4);
      v32 = objc_claimAutoreleasedReturnValue();
      if (!(v32 | v6))
      {
        SBLogWebClip();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_QWORD *)(a1 + 48);
          v9 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2114;
          v46 = (uint64_t (*)(uint64_t, uint64_t))v4;
          _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Can't launch web clip with identifier:%{public}@ because a placeholder or application for:%{public}@ could not be found. Will wait for placeholder or application to be installed.", buf, 0x20u);
        }

        objc_msgSend(*(id *)(a1 + 40), "_beginWaitingForBundleIdentifier:webClipIdentifier:launchOrigin:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
        objc_initWeak((id *)buf, *(id *)(a1 + 40));
        v10 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
        v11 = dispatch_time(0, (uint64_t)(*(double *)(*(_QWORD *)(a1 + 40) + 120) * 1000000000.0));
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_55;
        block[3] = &unk_1E8EBC510;
        objc_copyWeak(v36, (id *)buf);
        v36[1] = v10;
        v34 = *(id *)(a1 + 48);
        v4 = v4;
        v35 = v4;
        dispatch_after(v11, MEMORY[0x1E0C80D38], block);

        objc_destroyWeak(v36);
        objc_destroyWeak((id *)buf);
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    v6 = 0;
    v32 = 0;
LABEL_15:
    v13 = &stru_1E8EC7EC0;
    if (v4)
      v13 = (__CFString *)v4;
    v31 = v13;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    v49 = CFSTR("SBWebClipServiceWillLaunchWebClipBundleIdentifierKey");
    v50[0] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("SBWebClipServiceWillLaunchWebClipNotificationName"), v15, v16);

    v17 = *(_QWORD *)(a1 + 72);
    if (v17 == 2)
    {
      v18 = 29;
      v19 = 2;
    }
    else if (v17 == 1)
    {
      v18 = 26;
      v19 = 5;
    }
    else
    {
      v18 = 29;
      v19 = 43;
    }
    v20 = objc_alloc_init(SBLockScreenUnlockRequest);
    -[SBLockScreenUnlockRequest setSource:](v20, "setSource:", v18);
    -[SBLockScreenUnlockRequest setIntent:](v20, "setIntent:", 3);
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@: Open web clip: %@"), v23, *(_QWORD *)(a1 + 32));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenUnlockRequest setName:](v20, "setName:", v24);

    -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v20, "setWantsBiometricPresentation:", 1);
    -[SBLockScreenUnlockRequest setConfirmedNotInPocket:](v20, "setConfirmedNotInPocket:", 1);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v46 = __Block_byref_object_copy__98;
    v47 = __Block_byref_object_dispose__98;
    v48 = 0;
    v25 = MEMORY[0x1E0C809B0];
    v26 = *(void **)(a1 + 40);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_2;
    v42[3] = &unk_1E8EBC478;
    v44 = buf;
    v27 = v20;
    v43 = v27;
    objc_msgSend(v26, "_performActionIfContinuitySessionActive:", v42);
    v29 = *(void **)(a1 + 32);
    v28 = *(_QWORD *)(a1 + 40);
    v30 = *(void **)(v28 + 40);
    v37[0] = v25;
    v37[1] = 3221225472;
    v37[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_3;
    v37[3] = &unk_1E8EBC4E8;
    v37[4] = v28;
    v38 = v29;
    v40 = buf;
    v41 = v19;
    v39 = *(id *)(a1 + 48);
    objc_msgSend(v30, "unlockWithRequest:completion:", v27, v37);

    _Block_object_dispose(buf, 8);
    goto LABEL_23;
  }
  SBLogWebClip();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_cold_1();
LABEL_23:

}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "mainWindowScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sbDisplayConfiguration");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "setWindowScene:", v6);
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_3(_QWORD *a1, int a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  if (a2)
  {
    v3 = (void *)a1[4];
    v4 = a1[5];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_4;
    v9[3] = &unk_1E8EBC4C0;
    v5 = (void *)a1[6];
    v6 = a1[7];
    v9[4] = v3;
    v7 = a1[8];
    v12 = v6;
    v13 = v7;
    v9[1] = 3221225472;
    v10 = v5;
    v11 = (id)a1[5];
    objc_msgSend(v3, "prepareToLaunchWebClipWithIdentifier:handler:", v4, v9);

  }
  else
  {
    SBLogWebClip();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_3_cold_1();

  }
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v9[0] = MEMORY[0x1E0C809B0];
    v5 = *(_QWORD *)(a1 + 64);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_5;
    v9[3] = &unk_1E8EAE550;
    v7 = *(_QWORD *)(v6 + 40);
    v9[1] = 3221225472;
    v12 = v5;
    v10 = v3;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v7, v9, &__block_literal_global_335);

    v8 = v10;
  }
  else
  {
    SBLogWebClip();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_4_cold_1();
  }

}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(v3, "setEventLabel:", CFSTR("ActivateWebClipFromSBS"));
  objc_msgSend(v3, "setSource:", *(_QWORD *)(a1 + 48));
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_6;
  v9[3] = &unk_1E8E9EE50;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v9);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_7;
  v6[3] = &unk_1E8E9DEB0;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v5 = (id)objc_msgSend(v3, "addCompletionHandler:", v6);

}

uint64_t __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setActivatingEntity:", *(_QWORD *)(a1 + 32));
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogWebClip();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Did launch web clip with workspace entity: %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

uint64_t __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_52()
{
  return 1;
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_55(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[11] == *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "_clearPendingLaunch");
    SBLogWebClip();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_55_cold_1(a1, v4);

  }
}

- (void)_beginWaitingForBundleIdentifier:(id)a3 webClipIdentifier:(id)a4 launchOrigin:(id)a5
{
  NSNumber *v8;
  id v9;
  id v10;
  NSString *v11;
  NSString *pendingBundleIdentifier;
  NSString *v13;
  NSString *pendingWebClipIdentifier;
  NSNumber *pendingLaunchOrigin;
  id v16;

  v8 = (NSNumber *)a5;
  v9 = a4;
  v10 = a3;
  -[SBWebClipService _clearPendingLaunch](self, "_clearPendingLaunch");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__placeholdersDidChange_, CFSTR("SBApplicationPlaceholdersDidChangeNotification"), self->_placeholderController);
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__applicationsDidChange_, CFSTR("SBInstalledApplicationsDidChangeNotification"), self->_applicationController);
  v11 = (NSString *)objc_msgSend(v10, "copy");

  pendingBundleIdentifier = self->_pendingBundleIdentifier;
  self->_pendingBundleIdentifier = v11;

  v13 = (NSString *)objc_msgSend(v9, "copy");
  pendingWebClipIdentifier = self->_pendingWebClipIdentifier;
  self->_pendingWebClipIdentifier = v13;

  pendingLaunchOrigin = self->_pendingLaunchOrigin;
  self->_pendingLaunchOrigin = v8;

}

- (void)_clearPendingLaunch
{
  NSString *pendingBundleIdentifier;
  NSString *pendingWebClipIdentifier;
  NSNumber *pendingLaunchOrigin;
  id v6;

  if (self->_pendingBundleIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SBApplicationPlaceholdersDidChangeNotification"), self->_placeholderController);
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("SBInstalledApplicationsDidChangeNotification"), self->_applicationController);
    pendingBundleIdentifier = self->_pendingBundleIdentifier;
    self->_pendingBundleIdentifier = 0;

    pendingWebClipIdentifier = self->_pendingWebClipIdentifier;
    self->_pendingWebClipIdentifier = 0;

    pendingLaunchOrigin = self->_pendingLaunchOrigin;
    self->_pendingLaunchOrigin = 0;

    ++self->_pendingLaunchGenerationCount;
  }
}

- (void)_placeholdersDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  NSString *pendingWebClipIdentifier;
  NSString *pendingBundleIdentifier;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  NSString *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_pendingBundleIdentifier)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("__placeholdersAdded"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "applicationBundleID", (_QWORD)v18);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", self->_pendingBundleIdentifier);

          if (v12)
          {
            SBLogWebClip();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = (objc_class *)objc_opt_class();
              NSStringFromClass(v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              pendingBundleIdentifier = self->_pendingBundleIdentifier;
              pendingWebClipIdentifier = self->_pendingWebClipIdentifier;
              *(_DWORD *)buf = 138543874;
              v23 = v15;
              v24 = 2114;
              v25 = pendingWebClipIdentifier;
              v26 = 2114;
              v27 = pendingBundleIdentifier;
              _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Placeholder added. Retrying web clip launch with identifier:%{public}@ for:%{public}@.", buf, 0x20u);

            }
            -[SBWebClipService launchWebClipWithIdentifier:origin:](self, "launchWebClipWithIdentifier:origin:", self->_pendingWebClipIdentifier, self->_pendingLaunchOrigin);
            -[SBWebClipService _clearPendingLaunch](self, "_clearPendingLaunch");
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (void)_applicationsDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSString *pendingWebClipIdentifier;
  NSString *pendingBundleIdentifier;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  NSString *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_pendingBundleIdentifier)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("SBInstalledApplicationsAddedBundleIDs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "isEqualToString:", self->_pendingBundleIdentifier, (_QWORD)v16))
          {
            SBLogWebClip();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              v12 = (objc_class *)objc_opt_class();
              NSStringFromClass(v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              pendingBundleIdentifier = self->_pendingBundleIdentifier;
              pendingWebClipIdentifier = self->_pendingWebClipIdentifier;
              *(_DWORD *)buf = 138543874;
              v21 = v13;
              v22 = 2114;
              v23 = pendingWebClipIdentifier;
              v24 = 2114;
              v25 = pendingBundleIdentifier;
              _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Application added. Retrying web clip launch with identifier:%{public}@ for:%{public}@.", buf, 0x20u);

            }
            -[SBWebClipService launchWebClipWithIdentifier:origin:](self, "launchWebClipWithIdentifier:origin:", self->_pendingWebClipIdentifier, self->_pendingLaunchOrigin);
            -[SBWebClipService _clearPendingLaunch](self, "_clearPendingLaunch");
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (void)updateWebClipPropertiesWithIdentifier:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogWebClip();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Received request to update app clip properties with identifier: %{public}@", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SBWebClipService_updateWebClipPropertiesWithIdentifier___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v10 = v3;
  v11 = v5;
  v7 = v5;
  v8 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __58__SBWebClipService_updateWebClipPropertiesWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEAC08], "webClipWithIdentifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "iconController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "model");
    v5 = objc_claimAutoreleasedReturnValue();

    -[NSObject bookmarkIconForWebClipIdentifier:](v5, "bookmarkIconForWebClipIdentifier:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSObject updateExistingBookmarkIcon:forUpdatedWebClip:](v5, "updateExistingBookmarkIcon:forUpdatedWebClip:", v6, v2);
    }
    else
    {
      SBLogWebClip();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v2, "applicationBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543874;
        v14 = v10;
        v15 = 2114;
        v16 = v11;
        v17 = 2114;
        v18 = v12;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Didn't find an icon for webClip identifier %{public}@ and application bundle identifier %{public}@.", (uint8_t *)&v13, 0x20u);

      }
    }

  }
  else
  {
    SBLogWebClip();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Didn't find a web clip with identifier %{public}@.", (uint8_t *)&v13, 0x16u);
    }
  }

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  FBServiceClientAuthenticator *clientAuthenticator;
  void *v12;
  void *v13;
  FBServiceClientAuthenticator *legacyClientAuthenticator;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  NSObject *serviceQueue;
  id v21;
  NSObject *v22;
  _QWORD block[5];
  id v24;
  _QWORD v25[5];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogWebClip();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v9;
    v28 = 2114;
    v29 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%@ Received connection: %{public}@", buf, 0x16u);

  }
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke;
  v25[3] = &unk_1E8EA1060;
  v25[4] = self;
  objc_msgSend(v6, "configureConnection:", v25);
  clientAuthenticator = self->_clientAuthenticator;
  objc_msgSend(v6, "remoteProcess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "auditToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FBServiceClientAuthenticator authenticateAuditToken:](clientAuthenticator, "authenticateAuditToken:", v13))
  {

LABEL_6:
    SBLogWebClip();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v19;
      v28 = 2114;
      v29 = v6;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "%@ Client authenticated, will add connection: %{public}@", buf, 0x16u);

    }
    serviceQueue = self->_serviceQueue;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke_63;
    block[3] = &unk_1E8E9E820;
    block[4] = self;
    v21 = v6;
    v24 = v21;
    dispatch_async(serviceQueue, block);
    objc_msgSend(v21, "activate");

    goto LABEL_12;
  }
  legacyClientAuthenticator = self->_legacyClientAuthenticator;
  objc_msgSend(v6, "remoteProcess");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "auditToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(legacyClientAuthenticator) = -[FBServiceClientAuthenticator authenticateAuditToken:](legacyClientAuthenticator, "authenticateAuditToken:", v16);

  if ((_DWORD)legacyClientAuthenticator)
    goto LABEL_6;
  SBLogWebClip();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[SBWebClipService listener:didReceiveConnection:withContext:].cold.1((uint64_t)self, (uint64_t)v6, v22);

  objc_msgSend(v6, "invalidate");
LABEL_12:

}

void __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAB088], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x1E0DAB088], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke_2;
  v9 = &unk_1E8EA1010;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInvalidationHandler:", &v6);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SBLogWebClip();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%@ Connection invalidated: %{public}@", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(WeakRetained, "_queue_removeConnection:", v3);
  }

}

uint64_t __62__SBWebClipService_listener_didReceiveConnection_withContext___block_invoke_63(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_addConnection:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogWebClip();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%@ Adding Connection: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v4);

}

- (void)_queue_removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogWebClip();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%@ Removing Connection: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  -[NSMutableArray removeObject:](self->_connections, "removeObject:", v4);

}

- (void)_performActionIfContinuitySessionActive:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  if (+[SBContinuitySessionManager areContinuitySessionsAllowed](SBContinuitySessionManager, "areContinuitySessionsAllowed"))
  {
    +[SBContinuitySessionManager sharedInstance](SBContinuitySessionManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "state") == 10)
      v5[2](v5, v4);

  }
}

- (void)buildLaunchActionsForAppClipWithWebClipIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CEAC08], "webClipWithIdentifier:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWebClipService.m"), 525, CFSTR("We expect to have a non-nil UIWebClip"));

  }
  objc_msgSend(v8, "appClipUserActivity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__SBWebClipService_buildLaunchActionsForAppClipWithWebClipIdentifier_completion___block_invoke;
    v12[3] = &unk_1E8EBC560;
    v13 = v9;
    v14 = v7;
    -[SBWebClipService _generateUserActivityDataFromUserActivity:completion:](self, "_generateUserActivityDataFromUserActivity:completion:", v13, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __81__SBWebClipService_buildLaunchActionsForAppClipWithWebClipIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithCapacity:", 4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v4, &unk_1E91D1DC0);

  objc_msgSend(*(id *)(a1 + 32), "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, &unk_1E91D1DD8);

  objc_msgSend(*(id *)(a1 + 32), "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, &unk_1E91D1DF0);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, &unk_1E91D1E08);

  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C0]), "initWithSettings:", v12);
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);

}

- (void)_generateUserActivityDataFromUserActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke;
  v8[3] = &unk_1E8EBC588;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "_createUserActivityDataWithOptions:completionHandler:", MEMORY[0x1E0C9AA70], v8);

}

void __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke_2;
  v11[3] = &unk_1E8EA13D8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke_2_cold_1(a1, v2, v3);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (double)pendingLaunchTimeout
{
  return self->_pendingLaunchTimeout;
}

- (void)setPendingLaunchTimeout:(double)a3
{
  self->_pendingLaunchTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingLaunchOrigin, 0);
  objc_storeStrong((id *)&self->_pendingWebClipIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_legacyClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_placeholderController, 0);
  objc_destroyWeak((id *)&self->_sceneManager);
  objc_destroyWeak((id *)&self->_workspace);
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v0, (uint64_t)v0, "%{public}@ Can't launch web clip with identifier:%{public}@ because we couldn't find the underlying UIWebClip.", v1);
  OUTLINED_FUNCTION_2_0();
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v0, v1, "%{public}@ Can't launch web clip with identifier:%{public}@ because unlock failed.", v2);
  OUTLINED_FUNCTION_2_0();
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, v0, v1, "%{public}@ Can't launch web clip with identifier:%{public}@ because workspace entity is nil.", v2);
  OUTLINED_FUNCTION_2_0();
}

void __55__SBWebClipService_launchWebClipWithIdentifier_origin___block_invoke_55_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543618;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_fault_impl(&dword_1D0540000, a2, OS_LOG_TYPE_FAULT, "%{public}@ Timed out waiting for a placeholder or application to be installed for %@.", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(uint64_t)a2 withContext:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2114;
  v11 = a2;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a3, v7, "%@ Client authentication failed for connection: %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_20();
}

void __73__SBWebClipService__generateUserActivityDataFromUserActivity_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a2;
  v9 = 138543618;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a3, v8, "%{public}@ Failed to create user activity with error %{public}@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_20();
}

@end
