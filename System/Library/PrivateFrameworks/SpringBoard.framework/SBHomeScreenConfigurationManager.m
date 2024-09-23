@implementation SBHomeScreenConfigurationManager

- (SBHomeScreenConfigurationManager)init
{
  SBHomeScreenConfigurationManager *v2;
  uint64_t v3;
  SBHomeScreenConfigurationServer *server;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBHomeScreenConfigurationManager;
  v2 = -[SBHomeScreenConfigurationManager init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    server = v2->_server;
    v2->_server = (SBHomeScreenConfigurationServer *)v3;

    -[SBHomeScreenConfigurationServer setDelegate:]((id *)&v2->_server->super.isa, v2);
    -[SBHomeScreenConfigurationServer activate]((uint64_t)v2->_server);
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0DAAA08];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__SBHomeScreenConfigurationManager_init__block_invoke;
    v10[3] = &unk_1E8EAD940;
    objc_copyWeak(&v11, &location);
    v8 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v7, 0, v6, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __40__SBHomeScreenConfigurationManager_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  -[SBHomeScreenConfigurationManager iconModelDidLayout:]((uint64_t)WeakRetained);

}

- (void)iconModelDidLayout:(uint64_t)a1
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1 && *(_QWORD *)(a1 + 16))
  {
    SBLogHomeScreenConfiguration();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Updating installed focus mode because icon model laid out", v3, 2u);
    }

    -[SBHomeScreenConfigurationManager updateHomeScreenWithConfiguration:completion:](a1, *(void **)(a1 + 16), &__block_literal_global_193);
  }
}

void __55__SBHomeScreenConfigurationManager_iconModelDidLayout___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    SBLogHomeScreenConfiguration();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __55__SBHomeScreenConfigurationManager_iconModelDidLayout___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)updateHomeScreenWithConfiguration:(void *)a3 completion:
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
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
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    BSDispatchQueueAssertMain();
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootFolder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = *(id *)(a1 + 24);
      if (v10)
        -[SBHomeScreenConfigurationManager teardownFocusMode:rootFolder:](a1, v10, v8);
      if (v5)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("com.apple.SpringBoard.HomeScreenConfigurationService.configuration.%@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA468]), "initWithIdentifier:folder:", v14, v8);
        v16 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v15;
        v17 = v15;

        objc_msgSend(v5, "layout");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dockItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeScreenConfigurationManager applyDockItems:toFocusMode:iconModel:rootFolder:](a1, v19, v17, v9, v8);

        objc_msgSend(v18, "items");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHomeScreenConfigurationManager applyHomeScreenItems:toFocusMode:iconModel:rootFolder:](a1, v20, v17, v9, v8);

        -[SBHomeScreenConfigurationManager focusModeManager](a1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "donateFocusMode:fromSource:", v17, 2);

        SBLogHomeScreenConfiguration();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v14;
          _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "Installed focus mode with ID: %@", buf, 0xCu);
        }

      }
      else
      {
        -[SBHomeScreenConfigurationManager focusModeManager](a1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "donateFocusMode:fromSource:", 0, 2);

        v25 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = 0;

      }
      v6[2](v6, 0);

    }
    else
    {
      SBLogHomeScreenConfiguration();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[SBHomeScreenConfigurationManager updateHomeScreenWithConfiguration:completion:].cold.1(v23);

      v6[2](v6, 0);
    }

  }
}

- (void)configurationServerDidBeginConfigurationSession:(id)a3 completion:(id)a4
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(id, _QWORD))a4;
  SBLogHomeScreenConfiguration();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Beginning configuration session", v6, 2u);
  }

  v4[2](v4, 0);
}

- (void)configurationServer:(id)a3 didReceiveConfiguration:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  SBLogHomeScreenConfiguration();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Received configuration %{public}@", buf, 0xCu);
  }

  v11 = v6;
  v9 = v7;
  v10 = v6;
  BSDispatchMain();

}

void __91__SBHomeScreenConfigurationManager_configurationServer_didReceiveConfiguration_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  -[SBHomeScreenConfigurationManager updateHomeScreenWithConfiguration:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)configurationServerDidEndConfigurationSession:(id)a3 completion:(id)a4
{
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  v4 = a4;
  SBLogHomeScreenConfiguration();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Ending configuration session", buf, 2u);
  }

  v6 = v4;
  BSDispatchMain();

}

void __93__SBHomeScreenConfigurationManager_configurationServerDidEndConfigurationSession_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  -[SBHomeScreenConfigurationManager updateHomeScreenWithConfiguration:completion:](*(_QWORD *)(a1 + 32), 0, *(void **)(a1 + 40));
}

- (void)teardownFocusMode:(void *)a3 rootFolder:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    SBLogHomeScreenConfiguration();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Tearing down focus mode with ID: %@", buf, 0xCu);

    }
    objc_msgSend(v5, "lists");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v16, "removeAllIcons", (_QWORD)v19);
          objc_msgSend(v5, "removeFromList:", v16);
          objc_msgSend(v6, "removeList:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    objc_msgSend(v5, "dockList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "removeAllIcons");
      objc_msgSend(v5, "setDockList:", 0);
    }

  }
}

- (id)focusModeManager
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "iconManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "focusModeManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)applyDockItems:(void *)a3 toFocusMode:(void *)a4 iconModel:(void *)a5 rootFolder:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v14 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    objc_msgSend(v9, "dockList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA5F0]), "initWithFolder:maxIconCount:", v11, objc_msgSend(v10, "maxIconCountForDock"));
      objc_msgSend(v9, "setDockList:", v12);
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__SBHomeScreenConfigurationManager_applyDockItems_toFocusMode_iconModel_rootFolder___block_invoke;
    v15[3] = &unk_1E8EB1D98;
    v15[4] = a1;
    v16 = v10;
    v17 = v11;
    objc_msgSend(v14, "bs_compactMap:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIcons:", v13);

  }
}

- (void)applyHomeScreenItems:(void *)a3 toFocusMode:(void *)a4 iconModel:(void *)a5 rootFolder:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    objc_msgSend(v10, "lists");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bs_reverse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __90__SBHomeScreenConfigurationManager_applyHomeScreenItems_toFocusMode_iconModel_rootFolder___block_invoke;
    v38[3] = &unk_1E8EB1D98;
    v38[4] = a1;
    v39 = v11;
    v15 = v12;
    v40 = v15;
    objc_msgSend(v9, "bs_compactMap:", v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      do
      {
        objc_msgSend(v14, "lastObject");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          objc_msgSend(v14, "removeLastObject");
        }
        else
        {
          objc_msgSend(v15, "addEmptyList");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setHidden:", 1);
          objc_msgSend(v10, "addToList:", v18);
        }
        objc_msgSend(v18, "setIcons:gridCellInfoOptions:", v16, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v19;
      }
      while (objc_msgSend(v19, "count"));
    }
    else
    {
      v19 = v16;
    }
    v33 = v12;
    v20 = v9;
    SBLogHomeScreenConfiguration();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "lists");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      v24 = v23 - objc_msgSend(v14, "count");
      v25 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 134218240;
      v43 = v24;
      v44 = 2048;
      v45 = v25;
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Finished configuring %ld pages, %ld unused pages will be deleted", buf, 0x16u);

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v26 = v14;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v10, "removeFromList:", v31);
          objc_msgSend(v15, "removeList:", v31);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v28);
    }

    v9 = v20;
    v12 = v33;
  }

}

id __84__SBHomeScreenConfigurationManager_applyDockItems_toFocusMode_iconModel_rootFolder___block_invoke(void **a1, void *a2)
{
  return -[SBHomeScreenConfigurationManager iconForItem:iconModel:rootFolder:](a1[4], a2, a1[5], a1[6]);
}

- (id)iconForItem:(void *)a3 iconModel:(void *)a4 rootFolder:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (objc_msgSend(v7, "kind") == 1)
    {
      -[SBHomeScreenConfigurationManager iconForApp:iconModel:rootFolder:]((uint64_t)a1, v7, v8, v9);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SBLogHomeScreenConfiguration();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SBHomeScreenConfigurationManager iconForItem:iconModel:rootFolder:].cold.1((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);

      a1 = 0;
    }
  }

  return a1;
}

id __90__SBHomeScreenConfigurationManager_applyHomeScreenItems_toFocusMode_iconModel_rootFolder___block_invoke(void **a1, void *a2)
{
  return -[SBHomeScreenConfigurationManager iconForItem:iconModel:rootFolder:](a1[4], a2, a1[5], a1[6]);
}

- (id)iconForApp:(void *)a3 iconModel:(void *)a4 rootFolder:
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(a2, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogHomeScreenConfiguration();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v9;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Creating icon for app with bundle identifier: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(v7, "applicationIconForBundleIdentifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v8, "indexPathForIcon:includingPlaceholders:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v7, "addAdditionalIconMatchingIcon:", v11);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = v11;
      }
      v15 = v13;
    }
    else
    {
      SBLogHomeScreenConfiguration();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[SBHomeScreenConfigurationManager iconForApp:iconModel:rootFolder:].cold.1((uint64_t)v9, v14);

      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFocusMode, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

void __55__SBHomeScreenConfigurationManager_iconModelDidLayout___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "An error occurred updating the installed focus mode: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)updateHomeScreenWithConfiguration:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Failed to construct focus mode from configuration: icon model was nil", v1, 2u);
}

- (void)iconForItem:(uint64_t)a3 iconModel:(uint64_t)a4 rootFolder:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Unsupported home screen item type: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)iconForApp:(uint64_t)a1 iconModel:(NSObject *)a2 rootFolder:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1D0540000, a2, OS_LOG_TYPE_FAULT, "Unable to create app icon for suggested bundle identifier: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end
