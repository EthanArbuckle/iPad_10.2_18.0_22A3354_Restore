@implementation WBSCloudExtensionStateManager

+ (WBSCloudExtensionStateManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_6);
  return (WBSCloudExtensionStateManager *)(id)sharedManager_manager;
}

- (void)addProvider:(id)a3
{
  id v4;
  NSMutableArray *stateProviders;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  stateProviders = self->_stateProviders;
  v8 = v4;
  if (!stateProviders)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_stateProviders;
    self->_stateProviders = v6;

    v4 = v8;
    stateProviders = self->_stateProviders;
  }
  -[NSMutableArray addObject:](stateProviders, "addObject:", v4);

}

void __46__WBSCloudExtensionStateManager_sharedManager__block_invoke()
{
  WBSCloudExtensionStateManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSCloudExtensionStateManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (WBSCloudExtensionStateManager)init
{
  WBSCloudExtensionStateManager *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  WBSCloudExtensionStateManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WBSCloudExtensionStateManager;
  v2 = -[WBSCloudExtensionStateManager init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_extensionSyncEnabled = objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", *MEMORY[0x1E0D8A260], 1);

    objc_msgSend(MEMORY[0x1E0D8A148], "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasAnyExtensionManagement");

    if (v5)
      -[WBSCloudExtensionStateManager setExtensionSyncEnabled:](v2, "setExtensionSyncEnabled:", 0);
    v2->_manateeState = 0;
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__updateCloudExtensionStatesFromSafariBookmarksSyncAgent_, *MEMORY[0x1E0D8A560], 0);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__extensionSyncEnabledStateDidChangeDistributedNotificationHandler_, CFSTR("CloudExtensionSyncStateDidChange"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__managedExtensionStateDidChange_, *MEMORY[0x1E0D8A450], 0);

    -[WBSCloudExtensionStateManager _updateCloudExtensionStatesFromSafariBookmarksSyncAgent:](v2, "_updateCloudExtensionStatesFromSafariBookmarksSyncAgent:", 0);
    v9 = v2;
  }

  return v2;
}

- (void)_updateCloudExtensionStatesFromSafariBookmarksSyncAgent:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_INFO, "Updating cloud extension states from notification: %@", buf, 0xCu);
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke;
  v6[3] = &unk_1E5441EE0;
  v6[4] = self;
  -[WBSCloudExtensionStateManager _getCloudExtensionStatesWithCompletionHandler:](self, "_getCloudExtensionStatesWithCompletionHandler:", v6);

}

- (void)_getCloudExtensionStatesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_INFO, "Fetching cloud extension state", buf, 2u);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__WBSCloudExtensionStateManager__getCloudExtensionStatesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5441E68;
  v8 = v4;
  v6 = v4;
  -[WBSCloudExtensionStateManager _determineExtensionSyncAvailabilityWithCompletionHandler:](self, "_determineExtensionSyncAvailabilityWithCompletionHandler:", v7);

}

uint64_t __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke_2_cold_1(v2, v3);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 40) = 0;
    return objc_msgSend(*(id *)(a1 + 40), "_updateLocalStateFromCloudExtensionState");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 40) = 1;
    v9 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v22 = 138477827;
      v23 = v10;
      _os_log_impl(&dword_1A840B000, v9, OS_LOG_TYPE_INFO, "Received cloud devices: %{private}@", (uint8_t *)&v22, 0xCu);
    }
    v11 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 56);
      v22 = 138477827;
      v23 = v12;
      _os_log_impl(&dword_1A840B000, v11, OS_LOG_TYPE_INFO, "Received cloud extension state: %{private}@", (uint8_t *)&v22, 0xCu);
    }
    v13 = objc_msgSend(*(id *)(a1 + 56), "copy");
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(v14 + 24);
    *(_QWORD *)(v14 + 24) = v13;

    v16 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(void **)(v17 + 32);
    *(_QWORD *)(v17 + 32) = v16;

    v19 = *(_QWORD **)(a1 + 40);
    if (!v19[6])
    {
      objc_msgSend(v19, "_schedulePruningOfInactiveDevices");
      v19 = *(_QWORD **)(a1 + 40);
    }
    objc_msgSend(v19, "_cloudExtensionStatesWereUpdated");
    v20 = *(_QWORD *)(a1 + 40);
    if (!*(_BYTE *)(v20 + 8))
    {
      *(_BYTE *)(v20 + 8) = 1;
      if ((objc_msgSend(*(id *)(a1 + 40), "_cloudStateMatchesLocalStateForCurrentDevice") & 1) == 0)
      {
        v21 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_1A840B000, v21, OS_LOG_TYPE_INFO, "Cloud state for the current device doesn't match local state, saving extension state to cloud", (uint8_t *)&v22, 2u);
        }
        objc_msgSend(*(id *)(a1 + 40), "localExtensionStateDidChange");
      }
    }
    result = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(result + 65) && !*(_QWORD *)(result + 56))
      return objc_msgSend((id)result, "_ensureCurrentDeviceIsSavedPeriodically");
  }
  return result;
}

void __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v5, v6, "Fetching cloud extension states failed with error %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

- (void)_updateLocalStateFromCloudExtensionState
{
  id v3;

  -[WBSCloudExtensionStateManager _updateStateProvidersFromCloudExtensionState](self, "_updateStateProvidersFromCloudExtensionState");
  -[WBSCloudExtensionStateManager updateNewTabPageFromCloudDeviceState](self, "updateNewTabPageFromCloudDeviceState");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("WBSCloudExtensionStateDidChange"), 0);

}

- (void)updateNewTabPageFromCloudDeviceState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_cloudDevices, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_determineNewTabPageFromCloudDeviceState:", self->_cloudDevices);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSCloudExtensionStateManager _defaultWebExtensionsController](self, "_defaultWebExtensionsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tabOverridePreferencesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extensionComposedIdentifierForNewTabPreferenceInDefaults:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 141558275;
      v33 = 1752392040;
      v34 = 2117;
      v35 = v4;
      _os_log_impl(&dword_1A840B000, v8, OS_LOG_TYPE_INFO, "Attempting to set local new tab page from sync to %{sensitive, mask.hash}@", buf, 0x16u);
    }
    if (v4 == v7 || objc_msgSend(v4, "isEqualToString:", v7))
    {
      v9 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A840B000, v9, OS_LOG_TYPE_INFO, "Skipping setting local new tab page because there would be no change", buf, 2u);
      }
    }
    else
    {
      if (objc_msgSend(v4, "length"))
      {
        -[WBSCloudExtensionStateManager _allComposedIdentifiersAssociatedWithComposedIdentifier:](self, "_allComposedIdentifiersAssociatedWithComposedIdentifier:", v4);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v28;
          while (2)
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v28 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v5, "extensionWithComposedIdentifier:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15), (_QWORD)v27);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "webExtensionForExtension:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {

                v19 = (void *)objc_msgSend(v17, "newTabOverridePageURL");
                v20 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
                v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
                if (v19)
                {
                  if (v21)
                  {
                    *(_DWORD *)buf = 141558275;
                    v33 = 1752392040;
                    v34 = 2117;
                    v35 = v4;
                    _os_log_impl(&dword_1A840B000, v20, OS_LOG_TYPE_INFO, "Setting the new tab page to be existing extension %{sensitive, mask.hash}@ from sync", buf, 0x16u);
                  }
                  objc_msgSend(v5, "tabOverridePreferencesManager");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "composedIdentifier");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "setNewTabBehaviorWithExtensionComposedIdentifier:inDefaults:fromUserGesture:", v23, v3, 0);

                  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "postNotificationName:object:", CFSTR("WBSNewTabPageDidChange"), 0);

                }
                else if (v21)
                {
                  *(_DWORD *)buf = 141558275;
                  v33 = 1752392040;
                  v34 = 2117;
                  v35 = v4;
                  _os_log_impl(&dword_1A840B000, v20, OS_LOG_TYPE_INFO, "New tab page extension %{sensitive, mask.hash}@ not set from sync because it doesn't have a new tab page", buf, 0x16u);
                }

                goto LABEL_31;
              }
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
            if (v13)
              continue;
            break;
          }
        }

        v18 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 141558275;
          v33 = 1752392040;
          v34 = 2117;
          v35 = v4;
          _os_log_impl(&dword_1A840B000, v18, OS_LOG_TYPE_INFO, "New tab page extension %{sensitive, mask.hash}@ not set from sync because it's not installed on the system", buf, 0x16u);
        }
      }
      else
      {
        v25 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A840B000, v25, OS_LOG_TYPE_INFO, "Clearing local new tab page from sync", buf, 2u);
        }
        objc_msgSend(v5, "tabOverridePreferencesManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "clearNewTabBehaviorInDefaults:fromUserGesture:", v3, 0);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "postNotificationName:object:", CFSTR("WBSNewTabPageDidChange"), 0);
      }
LABEL_31:

    }
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A840B000, v10, OS_LOG_TYPE_INFO, "Skipping updating new tab page from cloud state since there aren't any cloud devices", buf, 2u);
    }
  }
}

- (void)_determineExtensionSyncAvailabilityWithCompletionHandler:(id)a3
{
  -[WBSCloudExtensionStateManager _determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled:completionHandler:](self, "_determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled:completionHandler:", 0, a3);
}

- (void)_determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v7 = v6;
  if ((a3 || self->_extensionSyncEnabled) && self->_manateeState != 2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __115__WBSCloudExtensionStateManager__determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled_completionHandler___block_invoke;
    v8[3] = &unk_1E5441D58;
    v8[4] = self;
    v9 = v6;
    -[WBSCloudExtensionStateManager _getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler:](self, "_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler:", v8);

  }
  else
  {
    self->_hasSuccessfullyUpdatedCloudExtensionStatesAtLeastOnce = 0;
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)_getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D8A180], "sharedObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__WBSCloudExtensionStateManager__getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5441DA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler:", v7);

}

- (void)_updateStateProvidersFromCloudExtensionState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *i;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  NSDictionary *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  const __CFString *v37;
  NSObject *v38;
  NSDictionary *cloudExtensionStates;
  NSObject *v40;
  uint64_t v41;
  NSDictionary *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSDictionary *obj;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  NSDictionary *v52;
  WBSCloudExtensionStateManager *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  NSDictionary *v73;
  __int16 v74;
  const __CFString *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allValues](self->_cloudExtensionStates, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v6;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D8A5E0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A840B000, v8, OS_LOG_TYPE_INFO, "Found cloud data in unexpected format, ignoring", buf, 2u);
    }
  }
  else
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = self->_cloudExtensionStates;
    v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v67;
      v53 = self;
      v47 = v3;
      v44 = *(_QWORD *)v67;
      do
      {
        v12 = 0;
        v45 = v10;
        do
        {
          if (*(_QWORD *)v67 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v12);
          if ((objc_msgSend(v3, "containsObject:", v13) & 1) == 0)
          {
            v48 = v12;
            -[WBSCloudExtensionStateManager _allComposedIdentifiersAssociatedWithComposedIdentifier:](self, "_allComposedIdentifiersAssociatedWithComposedIdentifier:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v52 = v14;
            v50 = -[NSDictionary countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
            if (v50)
            {
              v49 = *(_QWORD *)v63;
              do
              {
                for (i = 0; i != v50; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v63 != v49)
                    objc_enumerationMutation(v52);
                  v17 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
                  v58 = 0u;
                  v59 = 0u;
                  v60 = 0u;
                  v61 = 0u;
                  v18 = self->_stateProviders;
                  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
                  if (v19)
                  {
                    v20 = v19;
                    v21 = 0;
                    v22 = *(_QWORD *)v59;
                    do
                    {
                      for (j = 0; j != v20; ++j)
                      {
                        if (*(_QWORD *)v59 != v22)
                          objc_enumerationMutation(v18);
                        v24 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
                        if (objc_msgSend(v24, "hasExtensionWithComposedIdentifier:", v17))
                        {
                          v25 = v17;

                          objc_msgSend(v15, "addObject:", v24);
                          v21 = v25;
                        }
                      }
                      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v58, v81, 16);
                    }
                    while (v20);

                    self = v53;
                    if (v21)
                      goto LABEL_30;
                  }
                  else
                  {

                  }
                }
                v50 = -[NSDictionary countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v62, v82, 16);
              }
              while (v50);
            }
            v21 = 0;
LABEL_30:
            v26 = v52;

            -[NSDictionary allObjects](v52, "allObjects");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v3 = v47;
            objc_msgSend(v47, "addObjectsFromArray:", v27);

            if (v21)
            {
              -[WBSCloudExtensionStateManager _cloudExtensionStateForComposedIdentifiers:](self, "_cloudExtensionStateForComposedIdentifiers:", v52);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v28, "count"))
              {
                v56 = 0u;
                v57 = 0u;
                v54 = 0u;
                v55 = 0u;
                v51 = v15;
                v29 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
                if (v29)
                {
                  v30 = v29;
                  v31 = *(_QWORD *)v55;
                  do
                  {
                    for (k = 0; k != v30; ++k)
                    {
                      if (*(_QWORD *)v55 != v31)
                        objc_enumerationMutation(v51);
                      v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
                      objc_msgSend(v33, "profileServerIDForStateManager:", v53);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      v35 = objc_msgSend((id)objc_opt_class(), "_determineEnabledStateFromCloudExtensionState:forProfileServerID:", v28, v34);
                      v36 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 141559043;
                        v37 = CFSTR("OFF");
                        if ((_DWORD)v35)
                          v37 = CFSTR("ON");
                        v71 = 1752392040;
                        v72 = 2117;
                        v73 = v52;
                        v74 = 2113;
                        v75 = v37;
                        v76 = 2113;
                        v77 = v34;
                        v78 = 2113;
                        v79 = v28;
                        _os_log_impl(&dword_1A840B000, v36, OS_LOG_TYPE_INFO, "Extensions: %{sensitive, mask.hash}@, cloud state: %{private}@, for profile: %{private}@, computed from: %{private}@", buf, 0x34u);
                      }
                      objc_msgSend(v33, "setExtensionWithComposedIdentifier:isEnabledInCloud:", v21, v35);

                    }
                    v30 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v54, v80, 16);
                  }
                  while (v30);
                }

                v3 = v47;
                v26 = v52;
              }
              else
              {
                v38 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  cloudExtensionStates = v53->_cloudExtensionStates;
                  v40 = v38;
                  v41 = -[NSDictionary count](cloudExtensionStates, "count");
                  v42 = v53->_cloudExtensionStates;
                  *(_DWORD *)buf = 134218243;
                  v71 = v41;
                  v72 = 2113;
                  v73 = v42;
                  _os_log_impl(&dword_1A840B000, v40, OS_LOG_TYPE_INFO, "No cloud state found for extension: in %lu item cloud state %{private}@", buf, 0x16u);

                }
              }

              self = v53;
            }

            v11 = v44;
            v10 = v45;
            v12 = v48;
          }
          ++v12;
        }
        while (v12 != v10);
        v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v83, 16);
      }
      while (v10);
    }

  }
}

uint64_t __98__WBSCloudExtensionStateManager__getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __115__WBSCloudExtensionStateManager__determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled_completionHandler___block_invoke(uint64_t a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;

  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = *(_QWORD **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v3[9] == 1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  else
    return objc_msgSend(v3, "_getCloudSettingsContainerManateeStateWithCompletionHandler:", v4);
}

void __79__WBSCloudExtensionStateManager__getCloudExtensionStatesWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D8A1C0], "sharedProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getCloudExtensionStatesWithCompletionHandler:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("WBSCloudExtensionStateManagerErrorDomain"), 0, CFSTR("Extension syncing is not available"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
  }

}

void __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__WBSCloudExtensionStateManager__updateCloudExtensionStatesFromSafariBookmarksSyncAgent___block_invoke_2;
  v14[3] = &unk_1E5441EB8;
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v18 = v7;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __98__WBSCloudExtensionStateManager__getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__WBSCloudExtensionStateManager__getPrimaryAppleAccountHasSafariSyncEnabledWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5441D80;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)setExtensionSyncEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  WBSPeriodicActivityScheduler *periodicDeviceSavingScheduler;
  void *v10;
  int v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_extensionSyncEnabled != a3)
  {
    v3 = a3;
    v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v7 = v6;
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_INFO, "Changing extension sync enabled to %{public}@", (uint8_t *)&v11, 0xCu);

    }
    self->_extensionSyncEnabled = v3;
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBool:forKey:", v3, *MEMORY[0x1E0D8A260]);

    if (v3)
    {
      -[WBSCloudExtensionStateManager localExtensionStateDidChange](self, "localExtensionStateDidChange");
    }
    else
    {
      -[WBSPeriodicActivityScheduler invalidate](self->_periodicDeviceSavingScheduler, "invalidate");
      periodicDeviceSavingScheduler = self->_periodicDeviceSavingScheduler;
      self->_periodicDeviceSavingScheduler = 0;

      -[WBSCloudExtensionStateManager _deleteCurrentDeviceFromCloudKit](self, "_deleteCurrentDeviceFromCloudKit");
    }
    -[WBSCloudExtensionStateManager _updateCloudExtensionStatesFromSafariBookmarksSyncAgent:](self, "_updateCloudExtensionStatesFromSafariBookmarksSyncAgent:", 0);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("CloudExtensionSyncStateDidChange"), 0, 0, 1);

  }
}

- (void)removeProvider:(id)a3
{
  -[NSMutableArray removeObject:](self->_stateProviders, "removeObject:", a3);
}

- (void)localExtensionStateDidChange
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (self->_extensionSyncEnabled && -[NSMutableArray count](self->_stateProviders, "count"))
  {
    -[WBSCloudExtensionStateManager _extensionDeviceDictionaryForCurrentDevice](self, "_extensionDeviceDictionaryForCurrentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[WBSCloudExtensionStateManager _extensionStatesDictionaryForCurrentDevice](self, "_extensionStatesDictionaryForCurrentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke;
      v5[3] = &unk_1E5441CE0;
      v5[4] = self;
      -[WBSCloudExtensionStateManager _saveExtensionStatesWithDictionaryRepresentation:forDevice:completionHandler:](self, "_saveExtensionStatesWithDictionaryRepresentation:forDevice:completionHandler:", v4, v3, v5);

    }
  }
}

void __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke_cold_1(v4);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke_21;
    block[3] = &unk_1E5441CB8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke_21(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_setDate:forKey:", v3, *MEMORY[0x1E0D8A280]);

  result = objc_msgSend(*(id *)(a1 + 32), "_ensureCurrentDeviceIsSavedPeriodically");
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_INFO, "Performing requested fetch after saving cloud extension states", v6, 2u);
    }
    result = objc_msgSend(*(id *)(a1 + 32), "_updateCloudExtensionStatesFromSafariBookmarksSyncAgent:", 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  }
  return result;
}

- (void)getLockupViewsForAppsOnOtherDevicesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[WBSASCLockupViewGenerator sharedGenerator](WBSASCLockupViewGenerator, "sharedGenerator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSCloudExtensionStateManager extensionAppsFromOtherDevices](self, "extensionAppsFromOtherDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generateLockupViewsForAvailableApps:completionHandler:", v5, v4);

}

- (BOOL)_hasInstalledApplicationWithIdentifier:(id)a3
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "intValue");
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    LOBYTE(v13) = 0;
    goto LABEL_12;
  }
  v7 = (void *)v6;
  v8 = v4;
  while ((_DWORD)v8)
  {
    objc_msgSend(v7, "iTunesMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "storeItemIdentifier");

    if (v10 == v8)
      goto LABEL_10;
LABEL_7:
    objc_msgSend(v5, "nextObject");
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
    if (!v13)
      goto LABEL_11;
  }
  objc_msgSend(v7, "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
    goto LABEL_7;
LABEL_10:
  LOBYTE(v13) = 1;
LABEL_11:

LABEL_12:
  return v13;
}

- (id)extensionAppsFromOtherDevices
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *stateProviders;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  WBSAvailableAppWithExtension *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  WBSCloudExtensionStateManager *v52;
  void *v53;
  void *v54;
  NSDictionary *v55;
  uint64_t v56;
  int v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  id v68;
  _QWORD v69[5];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v4 = self->_cloudExtensionStates;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
  if (v5)
  {
    v6 = v5;
    v7 = MEMORY[0x1E0C809B0];
    v8 = *(_QWORD *)v71;
    v54 = (void *)*MEMORY[0x1E0D8A5D0];
    v53 = (void *)*MEMORY[0x1E0D8A5E8];
    v51 = *MEMORY[0x1E0D8A578];
    v49 = *MEMORY[0x1E0D8A288];
    v52 = self;
    v60 = *(_QWORD *)v71;
    v61 = v3;
    v55 = v4;
    do
    {
      v9 = 0;
      v56 = v6;
      do
      {
        if (*(_QWORD *)v71 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v9);
        if ((objc_msgSend(v3, "containsObject:", v10) & 1) == 0)
        {
          -[WBSCloudExtensionStateManager _allComposedIdentifiersAssociatedWithComposedIdentifier:](self, "_allComposedIdentifiersAssociatedWithComposedIdentifier:", v10);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSCloudExtensionStateManager _cloudExtensionStateForComposedIdentifiers:](self, "_cloudExtensionStateForComposedIdentifiers:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x1E0C99E60];
          stateProviders = self->_stateProviders;
          v69[0] = v7;
          v69[1] = 3221225472;
          v69[2] = __62__WBSCloudExtensionStateManager_extensionAppsFromOtherDevices__block_invoke;
          v69[3] = &unk_1E5441D08;
          v69[4] = self;
          -[NSMutableArray safari_mapObjectsUsingBlock:](stateProviders, "safari_mapObjectsUsingBlock:", v69);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setWithArray:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v67[0] = v7;
          v67[1] = 3221225472;
          v67[2] = __62__WBSCloudExtensionStateManager_extensionAppsFromOtherDevices__block_invoke_2;
          v67[3] = &unk_1E5441D30;
          v67[4] = self;
          v16 = v11;
          v68 = v16;
          if ((objc_msgSend(v15, "safari_containsObjectPassingTest:", v67) & 1) != 0)
          {
            v59 = v15;
            v17 = v54;
            v18 = v53;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v66 = 0u;
            v58 = v16;
            v19 = v16;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v64;
LABEL_10:
              v23 = 0;
              while (1)
              {
                if (*(_QWORD *)v64 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v23);
                objc_msgSend(v24, "safari_stringForKey:returningNilIfEmpty:", v17, 1);
                v25 = objc_claimAutoreleasedReturnValue();
                if (v25)
                {
                  v28 = (void *)v25;

                  v29 = 0;
                  self = v52;
                  goto LABEL_24;
                }
                objc_msgSend(v24, "safari_stringForKey:returningNilIfEmpty:", v18, 1);
                v26 = objc_claimAutoreleasedReturnValue();
                if (v26)
                  break;
                if (v21 == ++v23)
                {
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
                  self = v52;
                  if (v21)
                    goto LABEL_10;
                  goto LABEL_17;
                }
              }
              v30 = (void *)v26;
              objc_msgSend(v24, "safari_stringForKey:", v51);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              self = v52;
              if (v29)
                goto LABEL_25;
            }
            else
            {
LABEL_17:

            }
            objc_msgSend(v19, "firstObject");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "safari_stringForKey:", v51);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(MEMORY[0x1E0D8A120], "isInternalInstall"))
            {
              objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "dictionaryForKey:", v49);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "safari_stringForKey:", v29);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
LABEL_24:
                v34 = (void *)MEMORY[0x1E0CB3940];
                developerIdentifierFromComposedIdentifier(v10);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "stringWithFormat:", CFSTR("%@.%@"), v35, v28);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                v57 = 0;
                goto LABEL_27;
              }
            }
            else
            {
LABEL_25:
              v28 = 0;
            }
            v36 = 0;
            v57 = 1;
LABEL_27:
            if (v36)
              v37 = v36;
            else
              v37 = v29;
            v38 = -[WBSCloudExtensionStateManager _hasInstalledApplicationWithIdentifier:](self, "_hasInstalledApplicationWithIdentifier:", v37);
            objc_msgSend(v62, "allObjects");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "addObjectsFromArray:", v39);

            if (v38)
            {
              v40 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138477827;
                v75 = v10;
                _os_log_impl(&dword_1A840B000, v40, OS_LOG_TYPE_INFO, "Skipping %{private}@ in extensionAppsFromOtherDevices because its containing app is installed", buf, 0xCu);
              }
            }
            else
            {
              if (v57)
                v41 = v29;
              else
                v41 = v28;
              v42 = v41;
              if (v42)
              {
                objc_msgSend(v50, "objectForKeyedSubscript:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v43)
                {
                  v44 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138478339;
                    v75 = v10;
                    v76 = 2113;
                    v77 = v29;
                    v78 = 2113;
                    v79 = v28;
                    _os_log_impl(&dword_1A840B000, v44, OS_LOG_TYPE_INFO, "Creating available app for composed identifier: %{private}@ with adamID: %{private}@, platform specific bundle identifier: %{private}@", buf, 0x20u);
                  }
                  v45 = -[WBSAvailableAppWithExtension initWithAdamID:platformSpecificBundleID:]([WBSAvailableAppWithExtension alloc], "initWithAdamID:platformSpecificBundleID:", v29, v28);
                  if ((v57 & 1) == 0)
                  {
                    developerIdentifierFromComposedIdentifier(v10);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WBSAvailableAppWithExtension setRequiredTeamID:](v45, "setRequiredTeamID:", v46);

                  }
                  objc_msgSend(v50, "setObject:forKeyedSubscript:", v45, v42);

                }
              }

            }
            v3 = v61;
            v4 = v55;
            v6 = v56;
            v7 = MEMORY[0x1E0C809B0];
            v16 = v58;
            v15 = v59;
          }
          else
          {
            v27 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              v75 = v10;
              _os_log_impl(&dword_1A840B000, v27, OS_LOG_TYPE_INFO, "Skipping %{private}@ in extensionAppsFromOtherDevices because it wouldn't be enabled", buf, 0xCu);
            }
          }

          v8 = v60;
        }
        ++v9;
      }
      while (v9 != v6);
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
    }
    while (v6);
  }

  objc_msgSend(v50, "allValues");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

uint64_t __62__WBSCloudExtensionStateManager_extensionAppsFromOtherDevices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "profileServerIDForStateManager:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__WBSCloudExtensionStateManager_extensionAppsFromOtherDevices__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "_determineEnabledStateFromCloudExtensionState:forProfileServerID:", *(_QWORD *)(a1 + 40), v3);

  return v4;
}

- (BOOL)isExtensionEnabledInCloudWithComposedIdentifier:(id)a3 forProfileServerID:(id)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a4;
  -[WBSCloudExtensionStateManager _cloudExtensionStateAssociatedWithComposedIdentifier:](self, "_cloudExtensionStateAssociatedWithComposedIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v8 = objc_msgSend((id)objc_opt_class(), "_determineEnabledStateFromCloudExtensionState:forProfileServerID:", v7, v6);
  else
    v8 = 0;

  return v8;
}

- (void)setManateeState:(int64_t)a3
{
  id v3;

  if (self->_manateeState != a3)
  {
    self->_manateeState = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("WBSCloudExtensionManateeStateDidChange"), 0);

  }
}

- (void)_getCloudSettingsContainerManateeStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D8A1C0], "sharedProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__WBSCloudExtensionStateManager__getCloudSettingsContainerManateeStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5441DA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getCloudSettingsContainerManateeStateWithCompletionHandler:", v7);

}

void __93__WBSCloudExtensionStateManager__getCloudSettingsContainerManateeStateWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__WBSCloudExtensionStateManager__getCloudSettingsContainerManateeStateWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5441D80;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __93__WBSCloudExtensionStateManager__getCloudSettingsContainerManateeStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  uint64_t v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 48))
      v3 = CFSTR("is");
    else
      v3 = CFSTR("is not");
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_INFO, "Encryption %{public}@ supported for cloud extension state", (uint8_t *)&v6, 0xCu);
  }
  if (*(_BYTE *)(a1 + 48))
    v4 = 1;
  else
    v4 = 2;
  objc_msgSend(*(id *)(a1 + 32), "setManateeState:", v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_extensionDeviceDictionaryForCurrentDevice
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[WBSCloudExtensionStateManager _defaultWebExtensionsController](self, "_defaultWebExtensionsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_deviceUUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D8A108], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userAssignedName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v5, "length"))
    {
      v6 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[WBSCloudExtensionStateManager _extensionDeviceDictionaryForCurrentDevice].cold.2();

      v5 = &stru_1E5449658;
    }
    v7 = *MEMORY[0x1E0D8A5A8];
    v15[0] = *MEMORY[0x1E0D8A588];
    v15[1] = v7;
    v16[0] = v5;
    v16[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "tabOverridePreferencesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudExtensionStateForDefaults:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_dictionaryByMergingWithDictionary:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WBSCloudExtensionStateManager _extensionDeviceDictionaryForCurrentDevice].cold.1();
    v12 = 0;
  }

  return v12;
}

- (id)_extensionStatesDictionaryForCurrentDevice
{
  NSMutableArray *stateProviders;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  WBSCloudExtensionStateManager *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  stateProviders = self->_stateProviders;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __75__WBSCloudExtensionStateManager__extensionStatesDictionaryForCurrentDevice__block_invoke;
  v46[3] = &unk_1E5441DD0;
  v46[4] = self;
  -[NSMutableArray sortedArrayUsingComparator:](stateProviders, "sortedArrayUsingComparator:", v46);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v43;
    v36 = *MEMORY[0x1E0D8A5F8];
    v27 = self;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v4);
        objc_msgSend(v5, "cloudExtensionStateForStateManager:", self);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (filteredStateDictionaryForExtensionState_once != -1)
          dispatch_once(&filteredStateDictionaryForExtensionState_once, &__block_literal_global_164);
        objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_166);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "profileServerIDForStateManager:", self);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v31 = v4;
          v34 = v7;
          v33 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:");
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v30 = v6;
          v8 = v6;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          if (!v9)
            goto LABEL_25;
          v10 = v9;
          v35 = *(_QWORD *)v39;
          while (1)
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v39 != v35)
                objc_enumerationMutation(v8);
              v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v11);
              objc_msgSend(v8, "safari_dictionaryForKey:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "safari_dictionaryForKey:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v14)
              {
                if (!v33)
                  goto LABEL_23;
                objc_msgSend(v32, "safari_dictionaryForKey:", v12);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v14, "safari_dictionaryForKey:", v36);
              v15 = objc_claimAutoreleasedReturnValue();
              if (v15)
                v16 = (void *)v15;
              else
                v16 = (void *)MEMORY[0x1E0C9AA70];
              v17 = (void *)objc_msgSend(v16, "mutableCopy");
              v18 = filteredStateDictionaryForEnabledState_once;
              v19 = v13;
              if (v18 != -1)
                dispatch_once(&filteredStateDictionaryForEnabledState_once, &__block_literal_global_169);
              objc_msgSend(v19, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_170);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, v34);
              v21 = (void *)objc_msgSend(v14, "mutableCopy");
              v22 = (void *)objc_msgSend(v17, "copy");
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, v36);

              v23 = (void *)objc_msgSend(v21, "copy");
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v23, v12);

LABEL_23:
              ++v11;
            }
            while (v10 != v11);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            if (!v10)
            {
LABEL_25:

              self = v27;
              v6 = v30;
              v4 = v31;
              v7 = v34;
              break;
            }
          }
        }

        ++v4;
      }
      while (v4 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v29);
  }
  v24 = (void *)objc_msgSend(v37, "copy");

  return v24;
}

uint64_t __75__WBSCloudExtensionStateManager__extensionStatesDictionaryForCurrentDevice__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  char v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "profileServerIDForStateManager:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", v7);
  objc_msgSend(v6, "profileServerIDForStateManager:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", v8);
  v10 = v5 & !v9;
  if ((v5 & !v9) != 0)
    v11 = -1;
  else
    v11 = 1;
  if ((v10 & 1) == 0 && !v9)
    v11 = objc_msgSend(v7, "compare:", v8);

  return v11;
}

- (void)_saveExtensionStatesWithDictionaryRepresentation:(id)a3 forDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    v20 = v8;
    v21 = 2113;
    v22 = v9;
    _os_log_impl(&dword_1A840B000, v11, OS_LOG_TYPE_INFO, "Saving extension state to cloud: %{private}@, for device: %{private}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110__WBSCloudExtensionStateManager__saveExtensionStatesWithDictionaryRepresentation_forDevice_completionHandler___block_invoke;
  v15[3] = &unk_1E5441DF8;
  v17 = v9;
  v18 = v10;
  v16 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[WBSCloudExtensionStateManager _determineExtensionSyncAvailabilityWithCompletionHandler:](self, "_determineExtensionSyncAvailabilityWithCompletionHandler:", v15);

}

void __110__WBSCloudExtensionStateManager__saveExtensionStatesWithDictionaryRepresentation_forDevice_completionHandler___block_invoke(_QWORD *a1, char a2)
{
  uint64_t v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D8A1C0], "sharedProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "saveExtensionStatesWithDictionaryRepresentation:forDevice:completionHandler:", a1[4], a1[5], a1[6]);
  }
  else
  {
    v3 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("WBSCloudExtensionStateManagerErrorDomain"), 0, CFSTR("Extension syncing is not available"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }

}

- (void)_saveCurrentDeviceToCloudKitWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_DEFAULT, "Doing periodic save of current device to CloudKit", buf, 2u);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__WBSCloudExtensionStateManager__saveCurrentDeviceToCloudKitWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5441D58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[WBSCloudExtensionStateManager _determineExtensionSyncAvailabilityWithCompletionHandler:](self, "_determineExtensionSyncAvailabilityWithCompletionHandler:", v7);

}

void __83__WBSCloudExtensionStateManager__saveCurrentDeviceToCloudKitWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_extensionDeviceDictionaryForCurrentDevice");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D8A1C0], "sharedProxy");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "saveExtensionDeviceWithDictionaryRepresentation:completionHandler:", v6, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("WBSCloudExtensionStateManagerErrorDomain"), 1, CFSTR("Could not compute cloud extension device dictionary"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
    }

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("WBSCloudExtensionStateManagerErrorDomain"), 0, CFSTR("Extension syncing is not available"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }

}

- (void)_deleteCurrentDeviceFromCloudKit
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v3, OS_LOG_TYPE_DEFAULT, "Deleting current device from CloudKit", buf, 2u);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke;
  v4[3] = &unk_1E5441E40;
  v4[4] = self;
  -[WBSCloudExtensionStateManager _determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled:completionHandler:](self, "_determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled:completionHandler:", 1, v4);
}

void __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_defaultWebExtensionsController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_deviceUUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D8A1C0], "sharedProxy");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deleteCloudExtensionDevicesWithUUIDStrings:completionHandler:", v5, &__block_literal_global_51);

    }
    else
    {
      v7 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_cold_1();
    }

  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_cold_2();
  }
}

void __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_50(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_50_cold_1(v3);
  }

}

- (id)_composedIdentifierForBundleIdentifier:(id)a3 relatedToComposedIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  developerIdentifierFromComposedIdentifier(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSWebExtensionsController _composedIdentifierForStateOfExtensionWithBundleIdentifier:developerIdentifier:](WBSWebExtensionsController, "_composedIdentifierForStateOfExtensionWithBundleIdentifier:developerIdentifier:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_allComposedIdentifiersAssociatedWithComposedIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *cloudExtensionStates;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  WBSCloudExtensionStateManager *v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  cloudExtensionStates = self->_cloudExtensionStates;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__WBSCloudExtensionStateManager__allComposedIdentifiersAssociatedWithComposedIdentifier___block_invoke;
  v14[3] = &unk_1E5441E90;
  v7 = v4;
  v15 = v7;
  v8 = v5;
  v16 = v8;
  v17 = self;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](cloudExtensionStates, "enumerateKeysAndObjectsUsingBlock:", v14);
  if (objc_msgSend(MEMORY[0x1E0D8A120], "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryForKey:", *MEMORY[0x1E0D8A290]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_stringForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
      objc_msgSend(v8, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(v8, "copy");

  return v12;
}

void __89__WBSCloudExtensionStateManager__allComposedIdentifiersAssociatedWithComposedIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BYTE *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v29 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v30 = v6;
  if (objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v37 = 0uLL;
    v38 = 0uLL;
    v35 = 0uLL;
    v36 = 0uLL;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v36;
      v12 = *MEMORY[0x1E0D8A5F0];
      v13 = *MEMORY[0x1E0D8A5D8];
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v15, "safari_stringForKey:returningNilIfEmpty:", v12, 1, v29);
          v16 = objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            objc_msgSend(v15, "safari_stringForKey:returningNilIfEmpty:", v13, 1);
            v16 = objc_claimAutoreleasedReturnValue();
            if (!v16)
              continue;
          }
          v25 = (void *)v16;
          v27 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 48), "_composedIdentifierForBundleIdentifier:relatedToComposedIdentifier:", v16, *(_QWORD *)(a1 + 32));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v28);

          *v29 = 1;
          goto LABEL_26;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v10)
          continue;
        break;
      }
    }
  }
  else
  {
    v33 = 0uLL;
    v34 = 0uLL;
    v31 = 0uLL;
    v32 = 0uLL;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      v21 = *MEMORY[0x1E0D8A5F0];
      v22 = *MEMORY[0x1E0D8A5D8];
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v24, "safari_stringForKey:returningNilIfEmpty:", v21, 1, v29);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            objc_msgSend(v24, "safari_stringForKey:returningNilIfEmpty:", v22, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v25)
              continue;
          }
          objc_msgSend(*(id *)(a1 + 48), "_composedIdentifierForBundleIdentifier:relatedToComposedIdentifier:", v25, *(_QWORD *)(a1 + 32));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "isEqualToString:", *(_QWORD *)(a1 + 32)))
          {
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v30);
            *v29 = 1;

LABEL_26:
            goto LABEL_27;
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v19)
          continue;
        break;
      }
    }
  }
LABEL_27:

}

- (id)_cloudExtensionStateForComposedIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[NSDictionary safari_arrayContainingObjectsOfClass:forKey:](self->_cloudExtensionStates, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)_cloudExtensionStateAssociatedWithComposedIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[WBSCloudExtensionStateManager _allComposedIdentifiersAssociatedWithComposedIdentifier:](self, "_allComposedIdentifiersAssociatedWithComposedIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCloudExtensionStateManager _cloudExtensionStateForComposedIdentifiers:](self, "_cloudExtensionStateForComposedIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_cloudExtensionStatesWereUpdated
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[WBSCloudExtensionStateManager _cloudStateMatchesLocalStateForCurrentDevice](self, "_cloudStateMatchesLocalStateForCurrentDevice"))
  {
    -[WBSCloudExtensionStateManager _updateLocalStateFromCloudExtensionState](self, "_updateLocalStateFromCloudExtensionState");
  }
  else
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A840B000, v3, OS_LOG_TYPE_INFO, "Cloud state doesn't match local state at fetch time, saving local state to the cloud and fetching again", v4, 2u);
    }
    self->_performFetchAfterNextSave = 1;
    -[WBSCloudExtensionStateManager localExtensionStateDidChange](self, "localExtensionStateDidChange");
  }
}

- (void)_ensureCurrentDeviceIsSavedPeriodically
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  WBSPeriodicActivityScheduler *v7;
  WBSPeriodicActivityScheduler *periodicDeviceSavingScheduler;
  _QWORD v9[4];
  id v10;
  id location;

  -[WBSPeriodicActivityScheduler invalidate](self->_periodicDeviceSavingScheduler, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x1E0D8A280]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D8A178]);
  if (saveCurrentDeviceTimeInterval_onceToken != -1)
    dispatch_once(&saveCurrentDeviceTimeInterval_onceToken, &__block_literal_global_180);
  v6 = *(double *)&saveCurrentDeviceTimeInterval_saveCurrentDeviceTimeInterval;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke;
  v9[3] = &unk_1E5441F48;
  objc_copyWeak(&v10, &location);
  v7 = (WBSPeriodicActivityScheduler *)objc_msgSend(v5, "initWithInterval:minimumDelay:lastFireDate:block:", v4, v9, v6, 1.0);
  periodicDeviceSavingScheduler = self->_periodicDeviceSavingScheduler;
  self->_periodicDeviceSavingScheduler = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_2;
  block[3] = &unk_1E5441F48;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_saveCurrentDeviceToCloudKitWithCompletionHandler:", &__block_literal_global_60);
    WeakRetained = v2;
  }

}

void __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_3_cold_1(v3);
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_62_0);
  }

}

void __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_61()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_setDate:forKey:", v0, *MEMORY[0x1E0D8A280]);

}

- (void)_schedulePruningOfInactiveDevices
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  WBSPeriodicActivityScheduler *v7;
  WBSPeriodicActivityScheduler *inactiveDevicePruningScheduler;
  _QWORD v9[4];
  id v10;
  id location;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x1E0D8A278]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D8A178]);
  if (pruneInactiveDevicesTimeInterval_onceToken != -1)
    dispatch_once(&pruneInactiveDevicesTimeInterval_onceToken, &__block_literal_global_181);
  v6 = *(double *)&pruneInactiveDevicesTimeInterval_pruneInactiveDevicesTimeInterval;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke;
  v9[3] = &unk_1E5441F48;
  objc_copyWeak(&v10, &location);
  v7 = (WBSPeriodicActivityScheduler *)objc_msgSend(v5, "initWithInterval:minimumDelay:lastFireDate:block:", v4, v9, v6, 1.0);
  inactiveDevicePruningScheduler = self->_inactiveDevicePruningScheduler;
  self->_inactiveDevicePruningScheduler = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke_2;
  block[3] = &unk_1E5441F48;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke_3;
    v3[3] = &unk_1E5441F70;
    v3[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_pruneInactiveDevicesFromCloudKitWithCompletionHandler:", v3);
  }

}

void __66__WBSCloudExtensionStateManager__schedulePruningOfInactiveDevices__block_invoke_3(uint64_t a1, int a2, int a3)
{
  void *v5;
  void *v6;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_setDate:forKey:", v6, *MEMORY[0x1E0D8A278]);

    if (a3)
      objc_msgSend(*(id *)(a1 + 32), "_cloudExtensionStatesWereUpdated");
  }
}

+ (id)_uuidStringsOfInactiveCloudDevices:(id)a3 currentDeviceUUIDString:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = timeIntervalBeforeAssumingDeviceHasBecomeInactive_onceToken;
  v8 = a3;
  if (v7 != -1)
    dispatch_once(&timeIntervalBeforeAssumingDeviceHasBecomeInactive_onceToken, &__block_literal_global_182);
  objc_msgSend(v6, "dateWithTimeIntervalSinceNow:", -*(double *)&timeIntervalBeforeAssumingDeviceHasBecomeInactive_timeIntervalBeforeAssumingDeviceHasBecomeInactive);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__WBSCloudExtensionStateManager__uuidStringsOfInactiveCloudDevices_currentDeviceUUIDString___block_invoke;
  v14[3] = &unk_1E5441F98;
  v15 = v5;
  v16 = v9;
  v10 = v9;
  v11 = v5;
  objc_msgSend(v8, "safari_mapAndFilterObjectsUsingBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __92__WBSCloudExtensionStateManager__uuidStringsOfInactiveCloudDevices_currentDeviceUUIDString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x1E0D8A5A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") && (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x1E0D8A580]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "compare:", *(_QWORD *)(a1 + 40)) == -1)
      v5 = v4;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_removeDeviceWithUUIDString:(id)a3 fromCloudDevices:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  char v14;

  v5 = a3;
  v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__WBSCloudExtensionStateManager__removeDeviceWithUUIDString_fromCloudDevices___block_invoke;
  v10[3] = &unk_1E5441FC0;
  v12 = v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v13, 8);
  return v8;
}

id __78__WBSCloudExtensionStateManager__removeDeviceWithUUIDString_fromCloudDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x1E0D8A5A8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length") && objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v6))
    {
      v5 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      v5 = v4;
    }

  }
  return v5;
}

+ (id)_removeStatesForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__WBSCloudExtensionStateManager__removeStatesForDeviceWithUUIDString_fromCloudExtensionStates___block_invoke;
  v10[3] = &unk_1E5441FE8;
  v11 = v6;
  v12 = a1;
  v7 = v6;
  objc_msgSend(a4, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __95__WBSCloudExtensionStateManager__removeStatesForDeviceWithUUIDString_fromCloudExtensionStates___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 40), "_singleExtensionStates:withStateRemovedForDeviceWithUUIDString:", a3, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

+ (id)_singleExtensionStates:(id)a3 withStateRemovedForDeviceWithUUIDString:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  char v14;

  v5 = a3;
  v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__WBSCloudExtensionStateManager__singleExtensionStates_withStateRemovedForDeviceWithUUIDString___block_invoke;
  v10[3] = &unk_1E5441FC0;
  v12 = v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v13, 8);
  return v8;
}

id __96__WBSCloudExtensionStateManager__singleExtensionStates_withStateRemovedForDeviceWithUUIDString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x1E0D8A5A8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length") && objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v6))
    {
      v5 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      v5 = v4;
    }

  }
  return v5;
}

- (void)_pruneInactiveDevicesFromCloudKitWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_DEFAULT, "Pruning inactive extension devices from CloudKit", buf, 2u);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5441D58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[WBSCloudExtensionStateManager _determineExtensionSyncAvailabilityWithCompletionHandler:](self, "_determineExtensionSyncAvailabilityWithCompletionHandler:", v7);

}

void __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void (*v25)(void);
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD **)(a1 + 32);
    v5 = v4[4];
    objc_msgSend(v4, "_defaultWebExtensionsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_deviceUUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_uuidStringsOfInactiveCloudDevices:currentDeviceUUIDString:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "count");
    v10 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v33 = v8;
        _os_log_impl(&dword_1A840B000, v11, OS_LOG_TYPE_DEFAULT, "Pruning inactive extension devices with UUIDs: %{public}@", buf, 0xCu);
      }
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend((id)objc_opt_class(), "_removeDeviceWithUUIDString:fromCloudDevices:", v17, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), (_QWORD)v27);
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(_QWORD *)(a1 + 32);
            v20 = *(void **)(v19 + 32);
            *(_QWORD *)(v19 + 32) = v18;

            objc_msgSend((id)objc_opt_class(), "_removeStatesForDeviceWithUUIDString:fromCloudExtensionStates:", v17, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = *(_QWORD *)(a1 + 32);
            v23 = *(void **)(v22 + 24);
            *(_QWORD *)(v22 + 24) = v21;

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v14);
      }

      objc_msgSend(MEMORY[0x1E0D8A1C0], "sharedProxy");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "deleteCloudExtensionDevicesWithUUIDStrings:completionHandler:", v12, &__block_literal_global_68);

      v25 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke_cold_1();
      v25 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v25();

  }
  else
  {
    v26 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A840B000, v26, OS_LOG_TYPE_DEFAULT, "Skipping pruning inactive extension devices from CloudKit because extension sync is off", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke_67(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke_67_cold_1(v3);
  }

}

+ (id)_determineNewTabPageFromCloudDeviceState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:returningNilIfEmpty:", *MEMORY[0x1E0D8A590], 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __74__WBSCloudExtensionStateManager__determineNewTabPageFromCloudDeviceState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = *MEMORY[0x1E0D8A5A0];
  v7 = objc_msgSend(v4, "safari_BOOLForKey:", *MEMORY[0x1E0D8A5A0]);
  if (v7 == objc_msgSend(v5, "safari_BOOLForKey:", v6))
  {
    v9 = *MEMORY[0x1E0D8A598];
    objc_msgSend(v5, "safari_dateForKey:", *MEMORY[0x1E0D8A598]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_dateForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "compare:", v11);

  }
  else if (v7)
  {
    v8 = -1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)_determineEnabledStateFromCloudExtensionState:(id)a3 forProfileServerID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__WBSCloudExtensionStateManager__determineEnabledStateFromCloudExtensionState_forProfileServerID___block_invoke;
  v13[3] = &unk_1E5442070;
  v14 = v5;
  v6 = v5;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_dictionaryForKey:", *MEMORY[0x1E0D8A5F8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_dictionaryForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "safari_BOOLForKey:", *MEMORY[0x1E0D8A5C0]);

  return v11;
}

uint64_t __98__WBSCloudExtensionStateManager__determineEnabledStateFromCloudExtensionState_forProfileServerID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v5 = *MEMORY[0x1E0D8A5F8];
  v6 = a3;
  objc_msgSend(a2, "safari_dictionaryForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_dictionaryForKey:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safari_dictionaryForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "safari_dictionaryForKey:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0D8A5B8];
  v12 = objc_msgSend(v8, "safari_BOOLForKey:", *MEMORY[0x1E0D8A5B8]);
  if (v12 == objc_msgSend(v10, "safari_BOOLForKey:", v11))
  {
    v14 = *MEMORY[0x1E0D8A5E0];
    objc_msgSend(v10, "safari_dateForKey:", *MEMORY[0x1E0D8A5E0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_dateForKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "compare:", v16);

  }
  else if (v12)
  {
    v13 = -1;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)_cloudDeviceMatchesLocalDeviceForCurrentDevice
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *cloudDevices;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[WBSCloudExtensionStateManager _extensionDeviceDictionaryForCurrentDevice](self, "_extensionDeviceDictionaryForCurrentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WBSCloudExtensionStateManager _defaultWebExtensionsController](self, "_defaultWebExtensionsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_deviceUUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      cloudDevices = self->_cloudDevices;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __79__WBSCloudExtensionStateManager__cloudDeviceMatchesLocalDeviceForCurrentDevice__block_invoke;
      v17[3] = &unk_1E5442098;
      v18 = v5;
      -[NSArray safari_firstObjectPassingTest:](cloudDevices, "safari_firstObjectPassingTest:", v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v8 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A840B000, v8, OS_LOG_TYPE_INFO, "Current extension device doesn't exist in cloud", buf, 2u);
        }
      }
      v9 = extensionDeviceDictionaryToUseForComparison_once;
      v10 = v7;
      if (v9 != -1)
        dispatch_once(&extensionDeviceDictionaryToUseForComparison_once, &__block_literal_global_183);
      objc_msgSend(v10, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_185);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "isEqualToDictionary:", v3);
      if ((v12 & 1) == 0)
      {
        v13 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A840B000, v13, OS_LOG_TYPE_INFO, "Cloud extension device doesn't match local device", buf, 2u);
        }
        v14 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v20 = v3;
          _os_log_impl(&dword_1A840B000, v14, OS_LOG_TYPE_INFO, "Local extension device: %{private}@", buf, 0xCu);
        }
        v15 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          v20 = v11;
          _os_log_impl(&dword_1A840B000, v15, OS_LOG_TYPE_INFO, "Cloud extension device: %{private}@", buf, 0xCu);
        }
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

uint64_t __79__WBSCloudExtensionStateManager__cloudDeviceMatchesLocalDeviceForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "safari_stringForKey:", *MEMORY[0x1E0D8A5A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

+ (id)_cloudExtensionStatesDictionaryForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__WBSCloudExtensionStateManager__cloudExtensionStatesDictionaryForDeviceWithUUIDString_fromCloudExtensionStates___block_invoke;
  v9[3] = &unk_1E54420C0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a4, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __113__WBSCloudExtensionStateManager__cloudExtensionStatesDictionaryForDeviceWithUUIDString_fromCloudExtensionStates___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0D8A5A8];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "safari_stringForKey:", v8, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v11) & 1) != 0)
        {
          v12 = v10;

          goto LABEL_11;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)_cloudExtensionStatesMatchLocalExtensionStatesForCurrentDevice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[WBSCloudExtensionStateManager _extensionStatesDictionaryForCurrentDevice](self, "_extensionStatesDictionaryForCurrentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  extensionsStatesDictionaryToUseForComparison(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSCloudExtensionStateManager _defaultWebExtensionsController](self, "_defaultWebExtensionsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_deviceUUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_cloudExtensionStatesDictionaryForDeviceWithUUIDString:fromCloudExtensionStates:", v6, self->_cloudExtensionStates);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  extensionsStatesDictionaryToUseForComparison(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "isEqualToDictionary:", v8);
  v10 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      LOWORD(v18) = 0;
      v12 = "Cloud extension states for the current devices matches local states";
      v13 = v10;
      v14 = 2;
LABEL_10:
      _os_log_impl(&dword_1A840B000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v18, v14);
    }
  }
  else
  {
    if (v11)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1A840B000, v10, OS_LOG_TYPE_INFO, "Cloud extension states for the current device doesn't match local states", (uint8_t *)&v18, 2u);
    }
    v15 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v18 = 138477827;
      v19 = v4;
      _os_log_impl(&dword_1A840B000, v15, OS_LOG_TYPE_INFO, "Local extension states: %{private}@", (uint8_t *)&v18, 0xCu);
    }
    v16 = WBS_LOG_CHANNEL_PREFIXCloudExtensions();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v18 = 138477827;
      v19 = v8;
      v12 = "Cloud extension states: %{private}@";
      v13 = v16;
      v14 = 12;
      goto LABEL_10;
    }
  }

  return v9;
}

- (BOOL)_cloudStateMatchesLocalStateForCurrentDevice
{
  _BOOL4 v3;

  v3 = -[WBSCloudExtensionStateManager _cloudDeviceMatchesLocalDeviceForCurrentDevice](self, "_cloudDeviceMatchesLocalDeviceForCurrentDevice");
  if (v3)
    LOBYTE(v3) = -[WBSCloudExtensionStateManager _cloudExtensionStatesMatchLocalExtensionStatesForCurrentDevice](self, "_cloudExtensionStatesMatchLocalExtensionStatesForCurrentDevice");
  return v3;
}

- (void)_extensionSyncEnabledStateDidChangeDistributedNotificationHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v6 = a3;
  objc_msgSend(v4, "safari_browserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_extensionSyncEnabled = objc_msgSend(v5, "safari_BOOLForKey:defaultValue:", *MEMORY[0x1E0D8A260], 1);

  -[WBSCloudExtensionStateManager _updateCloudExtensionStatesFromSafariBookmarksSyncAgent:](self, "_updateCloudExtensionStatesFromSafariBookmarksSyncAgent:", v6);
}

- (id)_defaultWebExtensionsController
{
  NSMutableArray *stateProviders;
  _QWORD v4[5];

  stateProviders = self->_stateProviders;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__WBSCloudExtensionStateManager__defaultWebExtensionsController__block_invoke;
  v4[3] = &unk_1E54420E8;
  v4[4] = self;
  -[NSMutableArray safari_firstObjectPassingTest:](stateProviders, "safari_firstObjectPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __64__WBSCloudExtensionStateManager__defaultWebExtensionsController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "profileServerIDForStateManager:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_managedExtensionStateDidChange:(id)a3
{
  void *v4;
  char v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0D8A148], "sharedController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAnyExtensionManagement");

  if ((v5 & 1) != 0)
  {
    -[WBSCloudExtensionStateManager setExtensionSyncEnabled:](self, "setExtensionSyncEnabled:", 0);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__WBSCloudExtensionStateManager__managedExtensionStateDidChange___block_invoke;
    v6[3] = &unk_1E5441E40;
    v6[4] = self;
    -[WBSCloudExtensionStateManager _determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled:completionHandler:](self, "_determineExtensionSyncAvailabilityIgnoringExtensionSyncEnabled:completionHandler:", 1, v6);
  }
}

uint64_t __65__WBSCloudExtensionStateManager__managedExtensionStateDidChange___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_updateCloudExtensionStatesFromSafariBookmarksSyncAgent:", 0);
  return result;
}

+ (BOOL)test_determineEnabledStateFromCloudExtensionState:(id)a3 forProfileServerID:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D8A120], "isInternalInstall"))
    v8 = objc_msgSend(a1, "_determineEnabledStateFromCloudExtensionState:forProfileServerID:", v6, v7);
  else
    v8 = 0;

  return v8;
}

+ (id)test_determineNewTabPageFromCloudDeviceState:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D8A120], "isInternalInstall"))
  {
    objc_msgSend(a1, "_determineNewTabPageFromCloudDeviceState:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)test_uuidStringsOfInactiveCloudDevices:(id)a3 currentDeviceUUIDString:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D8A120], "isInternalInstall"))
  {
    objc_msgSend(a1, "_uuidStringsOfInactiveCloudDevices:currentDeviceUUIDString:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)test_removeDeviceWithUUIDString:(id)a3 fromCloudDevices:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D8A120], "isInternalInstall"))
  {
    objc_msgSend(a1, "_removeDeviceWithUUIDString:fromCloudDevices:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)test_removeStatesForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D8A120], "isInternalInstall"))
  {
    objc_msgSend(a1, "_removeStatesForDeviceWithUUIDString:fromCloudExtensionStates:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)test_cloudExtensionStatesDictionaryForDeviceWithUUIDString:(id)a3 fromCloudExtensionStates:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D8A120], "isInternalInstall"))
  {
    objc_msgSend(a1, "_cloudExtensionStatesDictionaryForDeviceWithUUIDString:fromCloudExtensionStates:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isExtensionSyncEnabled
{
  return self->_extensionSyncEnabled;
}

- (int64_t)manateeState
{
  return self->_manateeState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicDeviceSavingScheduler, 0);
  objc_storeStrong((id *)&self->_inactiveDevicePruningScheduler, 0);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
  objc_storeStrong((id *)&self->_cloudExtensionStates, 0);
  objc_storeStrong((id *)&self->_stateProviders, 0);
}

void __61__WBSCloudExtensionStateManager_localExtensionStateDidChange__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v3, v4, "Saving cloud extension states failed with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

- (void)_extensionDeviceDictionaryForCurrentDevice
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Could not determine device name for local cloud extension device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Could not determine UUID for current device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Could not delete current device from CloudKit because extension syncing is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __65__WBSCloudExtensionStateManager__deleteCurrentDeviceFromCloudKit__block_invoke_50_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v3, v4, "Deleting current device failed with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

void __72__WBSCloudExtensionStateManager__ensureCurrentDeviceIsSavedPeriodically__block_invoke_3_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v3, v4, "Periodic save of current device to CloudKit failed with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

void __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1A840B000, v0, OS_LOG_TYPE_DEBUG, "No inactive extension devices found in CloudKit", v1, 2u);
  OUTLINED_FUNCTION_3();
}

void __88__WBSCloudExtensionStateManager__pruneInactiveDevicesFromCloudKitWithCompletionHandler___block_invoke_67_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v3, v4, "Deleting inactive extension devices failed with error %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

@end
