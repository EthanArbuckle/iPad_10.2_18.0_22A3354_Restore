@implementation SBFocusModesHomeScreenSettingsManager

- (SBFocusModesHomeScreenSettingsManager)init
{
  SBFocusModesHomeScreenSettingsManager *v2;
  SBFocusModesHomeScreenSettingsServer *v3;
  SBFocusModesHomeScreenSettingsServer *settingsServer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFocusModesHomeScreenSettingsManager;
  v2 = -[SBFocusModesHomeScreenSettingsManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SBFocusModesHomeScreenSettingsServer);
    settingsServer = v2->_settingsServer;
    v2->_settingsServer = v3;

    -[SBFocusModesHomeScreenSettingsServer setDelegate:](v2->_settingsServer, "setDelegate:", v2);
    -[SBFocusModesHomeScreenSettingsServer activate](v2->_settingsServer, "activate");
  }
  return v2;
}

- (void)settingsServer:(id)a3 homeScreenSnapshotsForSuggestedPagesWithRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SBFocusModesHomeScreenSettingsManager *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke;
  block[3] = &unk_1E8E9F7B8;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __115__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  SBIconModel *v6;
  void *v7;
  SBIconModel *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  id v31;
  SBIconModel *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  SBIconModel *v42;
  id v43;

  objc_msgSend(*(id *)(a1 + 32), "focusModeIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveIconStateIfNeeded");
  objc_msgSend(v3, "iconState");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAA608]), "initWithCurrentState:desiredState:", v36, v36);
  v6 = [SBIconModel alloc];
  objc_msgSend(v3, "applicationDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v5;
  v8 = -[SBHIconModel initWithStore:applicationDataSource:](v6, "initWithStore:applicationDataSource:", v5, v7);

  v39 = v3;
  objc_msgSend(v3, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconModel setDelegate:](v8, "setDelegate:", v9);

  v10 = objc_alloc(MEMORY[0x1E0DAA640]);
  objc_msgSend(v4, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "maxListCount");
  v14 = objc_msgSend(v4, "listGridSize");
  v37 = v4;
  objc_msgSend(v4, "iconGridSizeClassSizes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v10, "initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:", v11, v12, v13, v14, v15);

  objc_msgSend(v16, "setModel:", v8);
  -[SBHIconModel reloadIcons](v8, "reloadIcons");
  v17 = objc_alloc_init(MEMORY[0x1E0DAA650]);
  objc_msgSend(v17, "setFolder:", v16);
  objc_msgSend(v2, "_configureRootFolderConfiguration:", v17);
  v34 = v17;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA648]), "initWithConfiguration:", v17);
  objc_msgSend(v33, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_class();
  v20 = v18;
  if (v19)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
  }
  else
  {
    v21 = 0;
  }
  v22 = v21;

  objc_msgSend(v16, "removeAllLists");
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA500]), "initWithIconManager:overridingRootFolder:", v2, v16);
  objc_msgSend(*(id *)(a1 + 32), "proactivePages");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSuggestedPages:withFocusModeIdentifier:forSnapshot:completion:", v24, v38, 1, 0);
  v25 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "snapshotDelay");
  v27 = v26;
  objc_msgSend(*(id *)(a1 + 32), "snapshotScale");
  v29 = v28;
  v30 = objc_msgSend(*(id *)(a1 + 32), "excludeWallpaper");
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __115__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke_2;
  v41[3] = &unk_1E8EAA900;
  v31 = *(id *)(a1 + 48);
  v42 = v8;
  v43 = v31;
  v32 = v8;
  objc_msgSend(v25, "_snapshotRootFolderView:snapshotDelay:snapshotScale:excludeWallpaper:focusModeIdentifier:iconManager:isSuggestedPage:completion:", v22, v30, v38, v2, 1, v41, v27, v29);

}

uint64_t __115__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)settingsServer:(id)a3 homeScreenSnapshotsWithRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SBFocusModesHomeScreenSettingsManager *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsWithRequest_completion___block_invoke;
  block[3] = &unk_1E8E9F7B8;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __98__SBFocusModesHomeScreenSettingsManager_settingsServer_homeScreenSnapshotsWithRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "focusModeIdentifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolderController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "snapshotDelay");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "snapshotScale");
  objc_msgSend(v10, "_snapshotRootFolderView:snapshotDelay:snapshotScale:excludeWallpaper:focusModeIdentifier:iconManager:isSuggestedPage:completion:", v9, objc_msgSend(*(id *)(a1 + 32), "excludeWallpaper"), v14, v3, 0, *(_QWORD *)(a1 + 48), v12, v13);

}

- (void)settingsServer:(id)a3 updateFocusModeHomeScreenSettingsWithRequest:(id)a4
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;

  v4 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__SBFocusModesHomeScreenSettingsManager_settingsServer_updateFocusModeHomeScreenSettingsWithRequest___block_invoke;
  block[3] = &unk_1E8E9DED8;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __101__SBFocusModesHomeScreenSettingsManager_settingsServer_updateFocusModeHomeScreenSettingsWithRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  int v18;
  uint64_t k;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  SBLogFocusModes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v65 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Update Focus Home Screen settings with request: %{public}@", buf, 0xCu);
  }

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "iconManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rootFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lists");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0DAA468]);
  objc_msgSend(*(id *)(a1 + 32), "focusModeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:folder:", v6, v4);

  objc_msgSend(*(id *)(a1 + 32), "listsToAdd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "listsToRemove");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lists");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v8;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v57 != v39)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v11 = v43;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v53 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
              objc_msgSend(v16, "uniqueIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "isEqualToString:", v10);

              if (v18)
                objc_msgSend(v7, "addToList:", v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
          }
          while (v13);
        }

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v41);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v37 = v36;
  v42 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v42)
  {
    v40 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v49 != v40)
          objc_enumerationMutation(v37);
        v20 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v21 = v43;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v45;
          do
          {
            for (m = 0; m != v23; ++m)
            {
              if (*(_QWORD *)v45 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * m);
              objc_msgSend(v26, "uniqueIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "isEqualToString:", v20);

              if (v28)
                objc_msgSend(v7, "removeFromList:", v26);
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
          }
          while (v23);
        }

      }
      v42 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v42);
  }

  objc_msgSend(v7, "lists");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "isEqualToArray:", v29) & 1) == 0)
  {
    objc_msgSend(v34, "focusModeManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addFocusModeRequiringIntroduction:", v31);

  }
  objc_msgSend(v35, "updateRootFolderWithCurrentDoNotDisturbState");

}

- (void)settingsServer:(id)a3 addSuggestedHomeScreenPageWithRequest:(id)a4
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;

  v4 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke;
  block[3] = &unk_1E8E9DED8;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  SBLogFocusModes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v18 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Add suggested home screen page with request: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "focusModeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "proactivePageSuggestionsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "proactivePages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke_14;
  v15[3] = &unk_1E8E9DED8;
  v10 = v5;
  v16 = v10;
  objc_msgSend(v7, "addSuggestedPages:withFocusModeIdentifier:forSnapshot:completion:", v8, v4, 0, v15);
  if (objc_msgSend(*(id *)(a1 + 32), "appendExistingPages"))
  {
    objc_msgSend(v6, "rootFolder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke_2;
    v13[3] = &unk_1E8EAA808;
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA468]), "initWithIdentifier:folder:", v4, v11);
    v12 = v14;
    objc_msgSend(v11, "enumerateListsWithOptions:usingBlock:", 4, v13);

  }
}

uint64_t __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateRootFolderWithCurrentDoNotDisturbState");
}

void __94__SBFocusModesHomeScreenSettingsManager_settingsServer_addSuggestedHomeScreenPageWithRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isHiddenByUser") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addToList:", v3);

}

- (void)_snapshotRootFolderView:(id)a3 snapshotDelay:(double)a4 snapshotScale:(double)a5 excludeWallpaper:(BOOL)a6 focusModeIdentifier:(id)a7 iconManager:(id)a8 isSuggestedPage:(BOOL)a9 completion:(id)a10
{
  _BOOL8 v14;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  BOOL v34;

  v14 = a6;
  v18 = a3;
  v19 = (void *)MEMORY[0x1E0CB3978];
  v20 = a10;
  v21 = a8;
  v22 = a7;
  if ((objc_msgSend(v19, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBFocusModesHomeScreenSettingsManager _snapshotRootFolderView:snapshotDelay:snapshotScale:excludeWallpaper:focusModeIdentifier:iconManager:isSuggestedPage:completion:]");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("SBFocusModesHomeScreenSettingsManager.m"), 197, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(v18, "folder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __169__SBFocusModesHomeScreenSettingsManager__snapshotRootFolderView_snapshotDelay_snapshotScale_excludeWallpaper_focusModeIdentifier_iconManager_isSuggestedPage_completion___block_invoke;
  v30[3] = &unk_1E8EAA968;
  v31 = v23;
  v32 = v18;
  v34 = a9;
  v33 = v24;
  v25 = v24;
  v26 = v18;
  v29 = v23;
  objc_msgSend(v29, "enumerateListsWithOptions:usingBlock:", 4, v30);
  -[SBFocusModesHomeScreenSettingsManager _snapshotRemainingListViews:snapshotDelay:snapshotScale:excludeWallpaper:forFocusModeIdentifier:iconManager:rootFolderView:accumulatedSnapshots:completion:](self, "_snapshotRemainingListViews:snapshotDelay:snapshotScale:excludeWallpaper:forFocusModeIdentifier:iconManager:rootFolderView:accumulatedSnapshots:completion:", v25, v14, v22, v21, v26, 0, a4, a5, v20);

}

void __169__SBFocusModesHomeScreenSettingsManager__snapshotRootFolderView_snapshotDelay_snapshotScale_excludeWallpaper_focusModeIdentifier_iconManager_isSuggestedPage_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isTrailingEmptyList:"))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_createIconListViewForList:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showAllIcons");
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v6, "enumerateIconViewsUsingBlock:", &__block_literal_global_111);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

  }
}

void __169__SBFocusModesHomeScreenSettingsManager__snapshotRootFolderView_snapshotDelay_snapshotScale_excludeWallpaper_focusModeIdentifier_iconManager_isSuggestedPage_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  objc_msgSend(v2, "customIconImageViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "widgetIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v5, "isWidgetStackIcon");

  if ((_DWORD)v2)
    objc_msgSend(v6, "setAlwaysShowsAsStack:", 1);

}

- (void)_snapshotRemainingListViews:(id)a3 snapshotDelay:(double)a4 snapshotScale:(double)a5 excludeWallpaper:(BOOL)a6 forFocusModeIdentifier:(id)a7 iconManager:(id)a8 rootFolderView:(id)a9 accumulatedSnapshots:(id)a10 completion:(id)a11
{
  _BOOL4 v15;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  SBViewSnapshotProvider *v41;
  double v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  SBHomeScreenPreviewView *v50;
  void *v51;
  void *v52;
  void *v53;
  SBFocusModesHomeScreenSettingsManager *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  SBFocusModesHomeScreenSettingsManager *v64;
  id v65;
  id v66;
  id v67;
  double v68;
  double v69;
  BOOL v70;

  v15 = a6;
  v19 = a3;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBFocusModesHomeScreenSettingsManager _snapshotRemainingListViews:snapshotDelay:snapshotScale:excludeWallpaper:forFocusModeIdentifier:iconManager:rootFolderView:accumulatedSnapshots:completion:]");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("SBFocusModesHomeScreenSettingsManager.m"), 228, CFSTR("this call must be made on the main thread"));

  }
  if (objc_msgSend(v19, "count"))
  {
    v54 = self;
    v55 = v23;
    objc_msgSend(v19, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v22;
    objc_msgSend(v22, "folder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "userInterfaceIdiom");

    v57 = v20;
    if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v29 = objc_msgSend(v21, "interfaceOrientation");
    else
      v29 = 1;
    SBScreenBoundsRotatedRoundCenter(v29);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    if (v15)
      v39 = 8259;
    else
      v39 = 8195;
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "homeScreenViewController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "_sbWindowScene");
    v40 = objc_claimAutoreleasedReturnValue();
    v50 = -[SBHomeScreenPreviewView initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:]([SBHomeScreenPreviewView alloc], "initWithFrame:iconManager:wallpaperController:options:wallpaperImage:listView:", v21, 0, v39, 0, v25, v32, v34, v36, v38);
    v51 = (void *)v40;
    v41 = -[SBViewSnapshotProvider initWithWindowScene:view:orientation:]([SBViewSnapshotProvider alloc], "initWithWindowScene:view:orientation:", v40, v50, v29);
    -[SBViewSnapshotProvider setIncludeWindowSceneWallpaper:](v41, "setIncludeWindowSceneWallpaper:", !v15);
    if (objc_msgSend(v25, "containsWidget"))
    {
      v42 = 5.0;
      if (a4 <= 5.0)
        v42 = a4;
      -[SBViewSnapshotProvider setDelay:](v41, "setDelay:", v42);
    }
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __196__SBFocusModesHomeScreenSettingsManager__snapshotRemainingListViews_snapshotDelay_snapshotScale_excludeWallpaper_forFocusModeIdentifier_iconManager_rootFolderView_accumulatedSnapshots_completion___block_invoke;
    v58[3] = &unk_1E8EAA990;
    v68 = a5;
    v59 = v25;
    v60 = v57;
    v61 = v26;
    v23 = v55;
    v62 = v55;
    v63 = v19;
    v64 = v54;
    v69 = a4;
    v70 = v15;
    v65 = v21;
    v43 = v26;
    v22 = v56;
    v66 = v56;
    v67 = v24;
    v44 = v43;
    v45 = v19;
    v46 = v44;
    v47 = v25;
    -[SBViewSnapshotProvider snapshotWithImageBlock:](v41, "snapshotWithImageBlock:", v58);

    v19 = v45;
    v20 = v57;

  }
  else
  {
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAE58]), "initWithSnapshots:", v23);
    (*((void (**)(id, void *, _QWORD))v24 + 2))(v24, v30, 0);

  }
}

void __196__SBFocusModesHomeScreenSettingsManager__snapshotRemainingListViews_snapshotDelay_snapshotScale_excludeWallpaper_forFocusModeIdentifier_iconManager_rootFolderView_accumulatedSnapshots_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __IOSurface *buffer;

  objc_msgSend(a2, "ioSurface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBCreateScaledIOSurface(v3, 0, *(double *)(a1 + 104));
  buffer = (__IOSurface *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D017A0]), "initWithPort:", IOSurfaceCreateMachPort(buffer));
  objc_msgSend(*(id *)(a1 + 32), "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAE68]), "initWithListIdentifier:focusModeIdentifier:machPortSendRight:", v6, *(_QWORD *)(a1 + 40), v4);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA468]), "initWithIdentifier:folder:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v7, "setWantsListVisible:", objc_msgSend(v8, "wantsListVisible:", v5));
  v9 = *(void **)(a1 + 56);
  if (v9)
    v10 = v9;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;
  objc_msgSend(v10, "addObject:", v7);
  objc_msgSend(*(id *)(a1 + 64), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 64), "count") - 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "_snapshotRemainingListViews:snapshotDelay:snapshotScale:excludeWallpaper:forFocusModeIdentifier:iconManager:rootFolderView:accumulatedSnapshots:completion:", v12, *(unsigned __int8 *)(a1 + 120), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v11, *(double *)(a1 + 112), *(double *)(a1 + 104), *(_QWORD *)(a1 + 96));

}

- (SBFocusModesHomeScreenSettingsServer)settingsServer
{
  return self->_settingsServer;
}

- (void)setSettingsServer:(id)a3
{
  objc_storeStrong((id *)&self->_settingsServer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsServer, 0);
}

@end
