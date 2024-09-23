@implementation PPLPeopleAppSceneManager

+ (id)sharedSceneManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__PPLPeopleAppSceneManager_sharedSceneManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSceneManager_onceToken != -1)
    dispatch_once(&sharedSceneManager_onceToken, block);
  return (id)sharedSceneManager___sharedSceneManager;
}

void __46__PPLPeopleAppSceneManager_sharedSceneManager__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc((Class)objc_opt_class());
  +[PPLPeopleAppLauncher sharedLauncher](PPLPeopleAppLauncher, "sharedLauncher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithAppLauncher:", v3);
  v2 = (void *)sharedSceneManager___sharedSceneManager;
  sharedSceneManager___sharedSceneManager = v1;

}

- (PPLPeopleAppSceneManager)initWithAppLauncher:(id)a3
{
  id v5;
  PPLPeopleAppSceneManager *v6;
  uint64_t v7;
  NSPointerArray *sceneRequesters;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPLPeopleAppSceneManager;
  v6 = -[PPLPeopleAppSceneManager init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v7 = objc_claimAutoreleasedReturnValue();
    sceneRequesters = v6->_sceneRequesters;
    v6->_sceneRequesters = (NSPointerArray *)v7;

    objc_storeStrong((id *)&v6->_peopleAppLauncher, a3);
    -[PPLPeopleAppLauncher setDelegate:](v6->_peopleAppLauncher, "setDelegate:", v6);
  }

  return v6;
}

- (void)addSceneRequester:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PPLPeopleAppSceneManager sceneRequesters](self, "sceneRequesters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPLPeopleAppSceneManager scene](self, "scene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneManager:didRevokeOwnershipOfScene:", self, v7);

    -[PPLPeopleAppSceneManager sceneRequesters](self, "sceneRequesters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addPointer:", v9);

    -[PPLPeopleAppSceneManager _configureSceneForRequester:](self, "_configureSceneForRequester:", v9);
  }

}

- (void)removeSceneRequester:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PPLPeopleAppSceneManager sceneRequesters](self, "sceneRequesters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v11);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "removePointerAtIndex:", v6);
    objc_msgSend(v5, "lastObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v11)
    {
      -[PPLPeopleAppSceneManager scene](self, "scene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sceneManager:didRevokeOwnershipOfScene:", self, v8);

    }
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[PPLPeopleAppSceneManager _configureSceneForRequester:](self, "_configureSceneForRequester:", v10);
    }
    else
    {
      -[PPLPeopleAppSceneManager _sendSceneToBackground](self, "_sendSceneToBackground");
    }
  }

}

- (void)willLaunchPeopleAppInBackground:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__PPLPeopleAppSceneManager_willLaunchPeopleAppInBackground___block_invoke;
  block[3] = &unk_24D5ED9B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __60__PPLPeopleAppSceneManager_willLaunchPeopleAppInBackground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureSceneForRequester:", 0);
}

- (void)transaction:(id)a3 didCreateScene:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[PPLPeopleAppSceneManager setScene:](self, "setScene:", v5);
  -[PPLPeopleAppSceneManager scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  -[PPLPeopleAppSceneManager sceneRequesters](self, "sceneRequesters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sceneManager:didGrantOwnershipOfScene:", self, v5);
}

- (void)sceneDidInvalidate:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint8_t v19[16];

  -[PPLPeopleAppSceneManager scene](self, "scene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[PPLPeopleAppSceneManager transaction](self, "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  PPLPeopleViewServiceLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_216B10000, v6, OS_LOG_TYPE_DEFAULT, "scene invalidated", v19, 2u);
  }

  -[PPLPeopleAppSceneManager sceneRequesters](self, "sceneRequesters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PPLPeopleViewServiceLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PPLPeopleAppSceneManager sceneDidInvalidate:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    -[PPLPeopleAppSceneManager scene](self, "scene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sceneManager:didRevokeOwnershipOfScene:", self, v18);

    -[PPLPeopleAppSceneManager setScene:](self, "setScene:", 0);
    -[PPLPeopleAppSceneManager _createSceneForRequester:](self, "_createSceneForRequester:", v9);
  }
  else
  {
    -[PPLPeopleAppSceneManager setScene:](self, "setScene:", 0);
  }

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a6;
  PPLPeopleViewServiceLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[PPLPeopleAppSceneManager scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:]";
    _os_log_impl(&dword_216B10000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "shouldDismiss"))
  {
    -[PPLPeopleAppSceneManager sceneRequesters](self, "sceneRequesters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[PPLPeopleAppSceneManager scene](self, "scene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sceneManager:sceneDidRequestDismissal:", self, v12);

    }
  }

}

- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE v11[24];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  if (objc_msgSend(v4, "event") == 1 || objc_msgSend(v4, "event") == 2)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BE380B8];
    FBSProcessResourceAllowanceMakeWithRealTimeInterval();
    objc_msgSend(v6, "provisionWithAllowance:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BE380C8];
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "policyWithProvisions:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_launchPeopleAppIfNeededWithForegroundPriority:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PPLPeopleAppSceneManager peopleAppLauncher](self, "peopleAppLauncher");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchPeopleAppIfNeededWithForegroundPriority:", v3);

}

- (void)_configureSceneForRequester:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PPLPeopleAppSceneManager scene](self, "scene");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[PPLPeopleAppSceneManager scene](self, "scene"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isValid"),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    PPLPeopleViewServiceLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PPLPeopleAppSceneManager scene](self, "scene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_216B10000, v9, OS_LOG_TYPE_DEFAULT, "Current scene %@", (uint8_t *)&v11, 0xCu);

    }
    -[PPLPeopleAppSceneManager _updateSceneSettingsForRequester:](self, "_updateSceneSettingsForRequester:", v4);
  }
  else
  {
    -[PPLPeopleAppSceneManager _createSceneForRequester:](self, "_createSceneForRequester:", v4);
  }

}

- (void)_createSceneForRequester:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  void (**v45)(_QWORD, _QWORD);
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  PPLPeopleEntitySceneSpecification *v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id buf;
  _QWORD v65[7];

  v4 = a3;
  -[PPLPeopleAppSceneManager _launchPeopleAppIfNeededWithForegroundPriority:](self, "_launchPeopleAppIfNeededWithForegroundPriority:", 1);
  if (v4)
    v5 = 4;
  else
    v5 = 2;
  -[PPLPeopleAppSceneManager transaction](self, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    PPLPeopleViewServiceLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_216B10000, v7, OS_LOG_TYPE_DEFAULT, "another active transaction", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v4, "personURL");
    v7 = objc_claimAutoreleasedReturnValue();
    PPLPeopleViewServiceLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_216B10000, v9, OS_LOG_TYPE_DEFAULT, "setup new transaction", (uint8_t *)&buf, 2u);
      }

      v10 = objc_alloc(MEMORY[0x24BE38050]);
      objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.PeopleViewService"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x24BDAC760];
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke;
      v65[3] = &unk_24D5EDA00;
      v65[4] = self;
      v65[5] = v5;
      v13 = (void *)objc_msgSend(v10, "initWithProcessIdentity:executionContextProvider:", v11, v65);
      -[PPLPeopleAppSceneManager setTransaction:](self, "setTransaction:", v13);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__updateTraitCollection, *MEMORY[0x24BDF8198], 0);

      objc_initWeak(&buf, self);
      -[PPLPeopleAppSceneManager transaction](self, "transaction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = v12;
      v61[1] = 3221225472;
      v61[2] = __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_2;
      v61[3] = &unk_24D5EDA50;
      objc_copyWeak(&v63, &buf);
      v16 = v4;
      v62 = v16;
      objc_msgSend(v15, "setCompletionBlock:", v61);

      v58 = objc_alloc_init(PPLPeopleEntitySceneSpecification);
      v17 = objc_alloc_init(-[PPLPeopleEntitySceneSpecification settingsClass](v58, "settingsClass"));
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      objc_msgSend(MEMORY[0x24BE38058], "mainConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDisplayConfiguration:", v19);

      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setUserInterfaceStyle:", objc_msgSend(v21, "userInterfaceStyle"));

      objc_msgSend(v18, "setForeground:", v4 != 0);
      if (v4)
      {
        objc_msgSend(v16, "initialSceneFrame");
        v23 = v22;
        v25 = v24;
        objc_msgSend(v16, "sceneSafeAreaInsetPortrait");
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "bounds");
        v23 = v42;
        v25 = v43;
        v27 = *MEMORY[0x24BDF7718];
        v29 = *(double *)(MEMORY[0x24BDF7718] + 8);
        v31 = *(double *)(MEMORY[0x24BDF7718] + 16);
        v33 = *(double *)(MEMORY[0x24BDF7718] + 24);

      }
      objc_msgSend(v18, "setFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), v23, v25);
      objc_msgSend(v18, "setInterfaceOrientationMode:", 0);
      objc_msgSend(v18, "setInterfaceOrientation:", 1);
      objc_msgSend(v18, "setForcedStatusBarForegroundTransparent:", 1);
      objc_msgSend(v18, "setSafeAreaInsetsPortrait:", v27, v29, v31, v33);
      v59[0] = v12;
      v59[1] = 3221225472;
      v59[2] = __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_18;
      v59[3] = &unk_24D5EDA78;
      v44 = v18;
      v60 = v44;
      v45 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199FF014](v59);
      v45[2](v45, 1);
      v45[2](v45, 2);
      v45[2](v45, 4);
      v45[2](v45, 3);
      v46 = objc_alloc_init(-[UIApplicationSceneSpecification clientSettingsClass](v58, "clientSettingsClass"));
      v47 = (void *)objc_msgSend(v46, "mutableCopy");

      objc_msgSend(v47, "setStatusBarHidden:", 1);
      objc_msgSend(v47, "setSupportedInterfaceOrientations:", 2);
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE380A0]), "initWithSpecification:", v58);
      objc_msgSend(v48, "setSettings:", v44);
      objc_msgSend(v48, "setClientSettings:", v47);
      v57 = v44;
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C20]), "initWithURL:", v7);
      v50 = objc_alloc_init(-[UIApplicationSceneSpecification transitionContextClass](v58, "transitionContextClass"));
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setActions:", v51);

      -[PPLPeopleAppSceneManager transaction](self, "transaction");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE380E0], "identityForIdentifier:workspaceIdentifier:", CFSTR("com.apple.PeopleViewService"), CFSTR("com.apple.PeopleViewService"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "updateSceneWithIdentity:parameters:transitionContext:", v53, v48, v50);

      -[PPLPeopleAppSceneManager transaction](self, "transaction");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "addObserver:", self);

      -[PPLPeopleAppSceneManager transaction](self, "transaction");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "begin");

      -[PPLPeopleAppSceneManager transaction](self, "transaction");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setWaitsForSceneCommits:", 1);

      objc_destroyWeak(&v63);
      objc_destroyWeak(&buf);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[PPLPeopleAppSceneManager _createSceneForRequester:].cold.1(v9, v34, v35, v36, v37, v38, v39, v40);

    }
  }

}

id __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setWatchdogProvider:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setLaunchIntent:", *(_QWORD *)(a1 + 40));
  return v2;
}

void __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  dispatch_time_t v14;
  uint8_t v15[16];
  _QWORD block[5];
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setTransaction:", 0);
  PPLPeopleViewServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_216B10000, v6, OS_LOG_TYPE_DEFAULT, "successfully created transaction", v15, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_2_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

    v14 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_13;
    block[3] = &unk_24D5EDA28;
    block[4] = WeakRetained;
    v17 = *(id *)(a1 + 32);
    dispatch_after(v14, MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createSceneForRequester:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_18(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDefaultStatusBarHeight:forOrientation:", a2, 0.0);
}

- (void)_updateTraitCollection
{
  id v2;

  -[PPLPeopleAppSceneManager scene](self, "scene");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSettingsWithBlock:", &__block_literal_global_1);

}

void __50__PPLPeopleAppSceneManager__updateTraitCollection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isUISubclass"))
  {
    v2 = (void *)MEMORY[0x24BDF6D38];
    v3 = v6;
    objc_msgSend(v2, "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  }
}

- (void)_updateSceneSettingsForRequester:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PPLPeopleAppSceneManager scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__PPLPeopleAppSceneManager__updateSceneSettingsForRequester___block_invoke;
  v10[3] = &unk_24D5EDAC0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __61__PPLPeopleAppSceneManager__updateSceneSettingsForRequester___block_invoke_2;
  v8[3] = &unk_24D5EDAE8;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  objc_msgSend(v5, "performUpdate:withCompletion:", v10, v8);

}

void __61__PPLPeopleAppSceneManager__updateSceneSettingsForRequester___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v11, "setForeground:", 1);
  if (objc_msgSend(v11, "isUISubclass"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = v11;
    objc_msgSend(v6, "initialSceneFrame");
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(*(id *)(a1 + 32), "sceneSafeAreaInsetPortrait");
    objc_msgSend(v7, "setSafeAreaInsetsPortrait:");

  }
  objc_msgSend(*(id *)(a1 + 32), "personURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C20]), "initWithURL:", v8);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActions:", v10);

  }
}

void __61__PPLPeopleAppSceneManager__updateSceneSettingsForRequester___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "sceneRequesters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == *(id *)(a1 + 40))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sceneManager:didGrantOwnershipOfScene:", v4, v5);

  }
}

- (void)_sendSceneToBackground
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PPLPeopleViewServiceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_216B10000, v3, OS_LOG_TYPE_DEFAULT, "Sending people app to the background", v5, 2u);
  }

  -[PPLPeopleAppSceneManager scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateSettingsWithTransitionBlock:", &__block_literal_global_28);

}

uint64_t __50__PPLPeopleAppSceneManager__sendSceneToBackground__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setForeground:", 0);
  return 0;
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (FBApplicationUpdateScenesTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (NSPointerArray)sceneRequesters
{
  return self->_sceneRequesters;
}

- (PPLPeopleAppLauncher)peopleAppLauncher
{
  return self->_peopleAppLauncher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleAppLauncher, 0);
  objc_storeStrong((id *)&self->_sceneRequesters, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)sceneDidInvalidate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216B10000, a1, a3, "People app died while foreground", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_createSceneForRequester:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216B10000, a1, a3, "missing url, bailing out early", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __53__PPLPeopleAppSceneManager__createSceneForRequester___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216B10000, a1, a3, "failed to create transaction... try again", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
