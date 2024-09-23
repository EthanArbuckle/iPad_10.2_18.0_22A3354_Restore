@implementation SBWipeSnapshotManifestTestRecipe

- (id)title
{
  return CFSTR("Wipe Snapshot Manifest (most recent app)");
}

- (void)handleVolumeIncrease
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "application");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v5);
  }
  if (!objc_msgSend(v2, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recentAppLayouts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      v14 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
          v30[0] = v14;
          v30[1] = 3221225472;
          v30[2] = __56__SBWipeSnapshotManifestTestRecipe_handleVolumeIncrease__block_invoke;
          v30[3] = &unk_1E8EA43C0;
          v31 = v2;
          objc_msgSend(v16, "enumerate:", v30);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      }
      while (v12);
    }

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = v2;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * k);
        SBLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v22, "bundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v24;
          _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_INFO, "[%{public}@] Wiping snapshot manifest...", buf, 0xCu);

        }
        objc_msgSend(v22, "_snapshotManifest");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "deleteAllSnapshots");

        objc_msgSend(v22, "_reingestStaticDefaultImagesInSnapshotManifest");
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
    }
    while (v19);
  }

}

void __56__SBWipeSnapshotManifestTestRecipe_handleVolumeIncrease__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!objc_msgSend(v10, "type"))
  {
    v6 = *(void **)(a1 + 32);
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationWithBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

    *a4 = 1;
  }

}

@end
