@implementation SBFloatingDockSuggestionsModel

- (SBFloatingDockSuggestionsModel)initWithMaximumNumberOfSuggestions:(unint64_t)a3 homeScreenContextProvider:(id)a4 recentsController:(id)a5 recentsDataStore:(id)a6 recentsDefaults:(id)a7 floatingDockDefaults:(id)a8 appSuggestionManager:(id)a9 applicationController:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  SBFloatingDockSuggestionsModel *v20;
  SBFloatingDockSuggestionsModel *v21;
  void *v22;
  NSOrderedSet *v23;
  NSOrderedSet *currentDisplayItems;
  void *v25;
  NSMutableSet *v26;
  NSMutableSet *pendingSuggestionUpdateReasons;
  uint64_t v28;
  SBIconModel *iconModel;
  void *v30;
  void *v31;
  SBFloatingDockSuggestionsModel *v32;
  uint64_t v33;
  PTSingleTestRecipe *stressTestRecipe;
  void *v35;
  uint64_t v36;
  APSubjectMonitorSubscription *appProtectionSubscription;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  SBFloatingDockSuggestionsModel *v43;
  objc_super v44;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v41 = a7;
  v40 = a8;
  v39 = a9;
  v19 = a10;
  v44.receiver = self;
  v44.super_class = (Class)SBFloatingDockSuggestionsModel;
  v20 = -[SBFloatingDockSuggestionsModel init](&v44, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_maxSuggestions = a3;
    objc_storeWeak((id *)&v20->_recentsDataStore, v18);
    objc_storeWeak((id *)&v21->_recentsController, v17);
    objc_storeStrong((id *)&v21->_appSuggestionManager, a9);
    objc_storeWeak((id *)&v21->_homeScreenContextProvider, v16);
    objc_storeStrong((id *)&v21->_applicationController, a10);
    objc_storeStrong((id *)&v21->_floatingDockDefaults, a8);
    -[SBFloatingDockSuggestionsModel _setRecentsEnabled:](v21, "_setRecentsEnabled:", -[SBFloatingDockDefaults recentsEnabled](v21->_floatingDockDefaults, "recentsEnabled", v39, v40, v41));
    objc_msgSend(v18, "setPersistenceDelegate:", v21);
    objc_storeStrong((id *)&v21->_recentsDefaults, a7);
    objc_msgSend(v18, "displayItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRecentDisplayItems:", v22);

    -[SBFloatingDockSuggestionsModel _initializeAndObserveDefaults](v21, "_initializeAndObserveDefaults");
    v23 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    currentDisplayItems = v21->_currentDisplayItems;
    v21->_currentDisplayItems = v23;

    -[SBFloatingDockSuggestionsModel _dockListModelFromContextProvider](v21, "_dockListModelFromContextProvider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockSuggestionsModel setUserDockListModel:](v21, "setUserDockListModel:", v25);

    -[SBFloatingDockSuggestionsModel _reloadRecentsAndSuggestions](v21, "_reloadRecentsAndSuggestions");
    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendingSuggestionUpdateReasons = v21->_pendingSuggestionUpdateReasons;
    v21->_pendingSuggestionUpdateReasons = v26;

    -[SBFloatingDockSuggestionsModel _addStateCaptureHandlers](v21, "_addStateCaptureHandlers");
    objc_msgSend(v16, "model");
    v28 = objc_claimAutoreleasedReturnValue();
    iconModel = v21->_iconModel;
    v21->_iconModel = (SBIconModel *)v28;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v21, sel__appSuggestionsChanged_, CFSTR("SBSuggestedAppChangedNotification"), v21->_appSuggestionManager);
    objc_msgSend(v30, "addObserver:selector:name:object:", v21, sel__iconModelDidLayout_, *MEMORY[0x1E0DAAA08], v21->_iconModel);
    objc_msgSend(v30, "addObserver:selector:name:object:", v21, sel__iconModelDidChange_, SBIconControllerIconModelDidChangeNotification, v16);
    v31 = (void *)MEMORY[0x1E0D830E8];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __210__SBFloatingDockSuggestionsModel_initWithMaximumNumberOfSuggestions_homeScreenContextProvider_recentsController_recentsDataStore_recentsDefaults_floatingDockDefaults_appSuggestionManager_applicationController___block_invoke;
    v42[3] = &unk_1E8E9DED8;
    v32 = v21;
    v43 = v32;
    objc_msgSend(v31, "recipeWithTitle:prepareBlock:action:cleanupBlock:", CFSTR("Run Dock Suggestions Stress Test"), 0, v42, 0);
    v33 = objc_claimAutoreleasedReturnValue();
    stressTestRecipe = v32->_stressTestRecipe;
    v32->_stressTestRecipe = (PTSingleTestRecipe *)v33;

    objc_msgSend(MEMORY[0x1E0DAA470], "registerTestRecipe:", v32->_stressTestRecipe);
    objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addMonitor:subjectMask:subscriptionOptions:", v32, 1, 1);
    v36 = objc_claimAutoreleasedReturnValue();
    appProtectionSubscription = v32->_appProtectionSubscription;
    v32->_appProtectionSubscription = (APSubjectMonitorSubscription *)v36;

  }
  return v21;
}

uint64_t __210__SBFloatingDockSuggestionsModel_initWithMaximumNumberOfSuggestions_homeScreenContextProvider_recentsController_recentsDataStore_recentsDefaults_floatingDockDefaults_appSuggestionManager_applicationController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runStressTestWithCompletion:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBIconListModel removeListObserver:](self->_userDockListModel, "removeListObserver:", self);
  -[APSubjectMonitorSubscription invalidate](self->_appProtectionSubscription, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SBFloatingDockSuggestionsModel;
  -[SBFloatingDockSuggestionsModel dealloc](&v4, sel_dealloc);
}

- (void)dockViewDidBecomeVisible
{
  -[SBAppSuggestionManager enableListeningForUpdatesForReason:](self->_appSuggestionManager, "enableListeningForUpdatesForReason:", CFSTR("SBFloatingDockSuggestionsReason"));
}

- (void)dockViewDidResignVisible
{
  -[SBAppSuggestionManager disableListeningForUpdatesForReason:](self->_appSuggestionManager, "disableListeningForUpdatesForReason:", CFSTR("SBFloatingDockSuggestionsReason"));
}

- (void)beginPendingUpdatesForReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableSet addObject:](self->_pendingSuggestionUpdateReasons, "addObject:", v4);
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Beging pending app suggestions update because %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)endPendingUpdatesForReason:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBFloatingDockSuggestionsModel _isPendingAppSuggestionsUpdate](self, "_isPendingAppSuggestionsUpdate");
  -[NSMutableSet removeObject:](self->_pendingSuggestionUpdateReasons, "removeObject:", v4);
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "End pending app suggestions update because %@", (uint8_t *)&v9, 0xCu);
  }

  v7 = -[SBFloatingDockSuggestionsModel _isPendingAppSuggestionsUpdate](self, "_isPendingAppSuggestionsUpdate");
  if (v5 && !v7)
  {
    -[SBAppSuggestionManager currentSuggestedApp](self->_appSuggestionManager, "currentSuggestedApp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockSuggestionsModel _performAppSuggestionChangedWithNewSuggestion:](self, "_performAppSuggestionChangedWithNewSuggestion:", v8);

  }
}

- (void)setRequestedSuggestedApplication:(id)a3
{
  SBApplication *v5;
  SBApplication *v6;

  v5 = (SBApplication *)a3;
  if (self->_requestedSuggestedApplication != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_requestedSuggestedApplication, a3);
    -[SBFloatingDockSuggestionsModel _updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:](self, "_updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:", 0, 1);
    v5 = v6;
  }

}

- (void)dataStore:(id)a3 persistDisplayItems:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "plistRepresentation", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[SBRecentDisplayItemsDefaults setDockRecentsPlistRepresentation:](self->_recentsDefaults, "setDockRecentsPlistRepresentation:", v6);
}

- (id)persistedDisplayItemsForDataStore:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  SBDisplayItem *v12;
  SBDisplayItem *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  SBDisplayItem *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[SBRecentDisplayItemsDefaults dockRecentsPlistRepresentation](self->_recentsDefaults, "dockRecentsPlistRepresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v7)
    {
      v8 = v7;
      v18 = v3;
      v9 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          v12 = -[SBDisplayItem initWithPlistRepresentation:]([SBDisplayItem alloc], "initWithPlistRepresentation:", v11);
          if (!v12)
          {

            SBLogCommon();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              -[SBFloatingDockSuggestionsModel persistedDisplayItemsForDataStore:].cold.1(v11, v16);

            v4 = 0;
            goto LABEL_19;
          }
          v13 = v12;
          -[SBDisplayItem bundleIdentifier](v12, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14 || (objc_msgSend(v5, "containsObject:", v14) & 1) == 0)
          {
            SBLogCommon();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v13;
              _os_log_debug_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEBUG, "found persisted dock recent display item: %@", buf, 0xCu);
            }

            objc_msgSend(v4, "addObject:", v13);
            objc_msgSend(v5, "addObject:", v14);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v8)
          continue;
        break;
      }
LABEL_19:
      v3 = v18;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)dataStore:(id)a3 shouldRestorePersistedDisplayItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBFloatingDockSuggestionsModel homeScreenContextProvider](self, "homeScreenContextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v7, "expectedIconForDisplayIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "isIconVisible:", v10);
      -[SBApplicationController restrictionController](self->_applicationController, "restrictionController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isApplicationIdentifierRestricted:", v9);

      v8 = v11 & (v13 ^ 1);
      SBLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v16 = 138413058;
        v17 = v5;
        v18 = 1024;
        v19 = v11 & (v13 ^ 1);
        v20 = 1024;
        v21 = v11;
        v22 = 1024;
        v23 = v13;
        _os_log_debug_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEBUG, "should restore persisted dock recent display item %@: %{BOOL}u (visible: %{BOOL}u, restricted: %{BOOL}u)", (uint8_t *)&v16, 0x1Eu);
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)_moveOrAddRecentThenCull:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;

  v5 = a3;
  v6 = -[NSMutableOrderedSet sb_indexOfFloatingDockSuggestionDisplayItem:](self->_currentRecentDisplayItemsSortedByRecency, "sb_indexOfFloatingDockSuggestionDisplayItem:", v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableOrderedSet removeObjectAtIndex:](self->_currentRecentDisplayItemsSortedByRecency, "removeObjectAtIndex:", v6);
  -[NSMutableOrderedSet insertObject:atIndex:](self->_currentRecentDisplayItemsSortedByRecency, "insertObject:atIndex:", v5, 0);
  if ((int64_t)(-[NSMutableOrderedSet count](self->_currentRecentDisplayItemsSortedByRecency, "count")
                      - self->_maxSuggestions) >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFloatingDockSuggestionsModel.m"), 236, CFSTR("shouldn't be getting updates that are adding more than 1 item at a time"));

  }
  if (-[NSMutableOrderedSet count](self->_currentRecentDisplayItemsSortedByRecency, "count") <= self->_maxSuggestions)
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableOrderedSet lastObject](self->_currentRecentDisplayItemsSortedByRecency, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet removeObject:](self->_currentRecentDisplayItemsSortedByRecency, "removeObject:", v7);
  }

  return v7;
}

- (id)_oldestRecent
{
  return (id)-[NSMutableOrderedSet lastObject](self->_currentRecentDisplayItemsSortedByRecency, "lastObject");
}

- (void)_handleNewRecentItem:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  SBBestAppSuggestion *currentAppSuggestion;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  id v15;

  v15 = a3;
  v4 = -[SBFloatingDockSuggestionsModel shouldAddItem:](self, "shouldAddItem:", v15);
  v5 = v15;
  if (v4)
  {
    -[SBFloatingDockSuggestionsModel _moveOrAddRecentThenCull:](self, "_moveOrAddRecentThenCull:", v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    currentAppSuggestion = self->_currentAppSuggestion;
    if (v6)
    {
      if (!currentAppSuggestion
        || (v8 = -[NSMutableOrderedSet sb_indexOfFloatingDockSuggestionDisplayItem:](self->_currentRecentDisplayItems, "sb_indexOfFloatingDockSuggestionDisplayItem:", v6), -[SBFloatingDockSuggestionsModel _displayItemForAppSuggestion:](self, "_displayItemForAppSuggestion:", self->_currentAppSuggestion), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = -[SBFloatingDockSuggestionsModel _indexForAppSuggestion:](self, "_indexForAppSuggestion:", v9), v9, v8 != v10))
      {
        -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_currentRecentDisplayItems, "replaceObjectAtIndex:withObject:", -[NSMutableOrderedSet sb_indexOfFloatingDockSuggestionDisplayItem:](self->_currentRecentDisplayItems, "sb_indexOfFloatingDockSuggestionDisplayItem:", v6), v15);
LABEL_12:
        WeakRetained = objc_loadWeakRetained((id *)&self->_recentsDataStore);
        objc_msgSend(WeakRetained, "setDisplayItems:", self->_currentRecentDisplayItems);

        -[SBFloatingDockSuggestionsModel _updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:](self, "_updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:", 0, 1);
        v5 = v15;
        goto LABEL_13;
      }
      -[NSMutableOrderedSet lastObject](self->_currentRecentDisplayItemsSortedByRecency, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSMutableOrderedSet indexOfObject:](self->_currentRecentDisplayItems, "indexOfObject:", v11);
      v13 = -[NSMutableOrderedSet indexOfObject:](self->_currentRecentDisplayItems, "indexOfObject:", v6);
      -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_currentRecentDisplayItems, "replaceObjectAtIndex:withObject:", v12, v15);
      -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_currentRecentDisplayItems, "replaceObjectAtIndex:withObject:", v13, v11);
    }
    else
    {
      if (!currentAppSuggestion
        || -[NSMutableOrderedSet count](self->_currentRecentDisplayItems, "count") != self->_maxSuggestions - 1)
      {
        -[NSMutableOrderedSet insertObject:atIndex:](self->_currentRecentDisplayItems, "insertObject:atIndex:", v15, 0);
        goto LABEL_12;
      }
      -[SBFloatingDockSuggestionsModel _oldestRecent](self, "_oldestRecent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_currentRecentDisplayItems, "replaceObjectAtIndex:withObject:", -[NSMutableOrderedSet indexOfObject:](self->_currentRecentDisplayItems, "indexOfObject:", v11), v15);
      -[NSMutableOrderedSet addObject:](self->_currentRecentDisplayItems, "addObject:", v11);
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (BOOL)shouldAddItem:(id)a3
{
  NSMutableOrderedSet *currentRecentDisplayItems;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  currentRecentDisplayItems = self->_currentRecentDisplayItems;
  v4 = a3;
  LOBYTE(currentRecentDisplayItems) = -[NSMutableOrderedSet sb_containsFloatingDockSuggestionDisplayItem:](currentRecentDisplayItems, "sb_containsFloatingDockSuggestionDisplayItem:", v4);
  v5 = (void *)MEMORY[0x1E0CF9688];
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "applicationWithBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "isHidden");

  return (v5 | currentRecentDisplayItems) ^ 1;
}

- (BOOL)recentDisplayItemsController:(id)a3 shouldAddItem:(id)a4
{
  id v5;
  char v6;
  uint64_t v7;
  SBIconModel *iconModel;
  void *v9;
  void *v10;
  BOOL v11;

  v5 = a4;
  v6 = -[SBFloatingDockSuggestionsModel _displayItemContainedInUserDock:](self, "_displayItemContainedInUserDock:", v5);
  v7 = objc_msgSend(v5, "type");
  iconModel = self->_iconModel;
  if (v7 == 5)
    objc_msgSend(v5, "webClipIdentifier");
  else
    objc_msgSend(v5, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconModel expectedIconForDisplayIdentifier:](iconModel, "expectedIconForDisplayIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SBIconModel isIconVisible:](self->_iconModel, "isIconVisible:", v10) & ~v6;
  return v11;
}

- (void)recentDisplayItemsController:(id)a3 didAddItem:(id)a4
{
  id v5;

  v5 = a4;
  BSDispatchQueueAssertMain();
  -[SBFloatingDockSuggestionsModel _handleNewRecentItem:](self, "_handleNewRecentItem:", v5);

}

- (void)recentDisplayItemsController:(id)a3 didAddItem:(id)a4 andDropItem:(id)a5
{
  id v6;

  v6 = a4;
  BSDispatchQueueAssertMain();
  -[SBFloatingDockSuggestionsModel _handleNewRecentItem:](self, "_handleNewRecentItem:", v6);

}

- (void)recentDisplayItemsController:(id)a3 didMoveItemToFront:(id)a4
{
  BOOL v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  BSDispatchQueueAssertMain();
  v5 = -[SBFloatingDockSuggestionsModel _displayItemContainedInUserDock:](self, "_displayItemContainedInUserDock:", v9);
  v6 = v9;
  if (!v5)
  {
    if ((-[NSMutableOrderedSet sb_containsFloatingDockSuggestionDisplayItem:](self->_currentRecentDisplayItems, "sb_containsFloatingDockSuggestionDisplayItem:", v9) & 1) != 0)
    {
      -[SBFloatingDockSuggestionsModel _moveOrAddRecentThenCull:](self, "_moveOrAddRecentThenCull:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_currentRecentDisplayItems, "replaceObjectAtIndex:withObject:", -[NSMutableOrderedSet sb_indexOfFloatingDockSuggestionDisplayItem:](self->_currentRecentDisplayItems, "sb_indexOfFloatingDockSuggestionDisplayItem:", v7), v9);
        WeakRetained = objc_loadWeakRetained((id *)&self->_recentsDataStore);
        objc_msgSend(WeakRetained, "setDisplayItems:", self->_currentRecentDisplayItems);

        -[SBFloatingDockSuggestionsModel _updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:](self, "_updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:", 0, 1);
      }

    }
    else
    {
      -[SBFloatingDockSuggestionsModel _handleNewRecentItem:](self, "_handleNewRecentItem:", v9);
    }
    v6 = v9;
  }

}

- (void)recentDisplayItemsController:(id)a3 didRemoveItem:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t maxSuggestions;
  BOOL v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  id v13;

  v13 = a4;
  BSDispatchQueueAssertMain();
  v5 = -[NSMutableOrderedSet sb_indexOfFloatingDockSuggestionDisplayItem:](self->_currentRecentDisplayItems, "sb_indexOfFloatingDockSuggestionDisplayItem:", v13);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    if (self->_currentAppSuggestion
      && ((v7 = -[NSMutableOrderedSet count](self->_currentRecentDisplayItems, "count"),
           maxSuggestions = self->_maxSuggestions,
           v7 == maxSuggestions)
        ? (v9 = v6 >= maxSuggestions - 1)
        : (v9 = 1),
          !v9
       && (-[NSMutableOrderedSet lastObject](self->_currentRecentDisplayItems, "lastObject"),
           (v10 = objc_claimAutoreleasedReturnValue()) != 0)))
    {
      v11 = (void *)v10;
      -[NSMutableOrderedSet removeObject:](self->_currentRecentDisplayItems, "removeObject:", v10);
      -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self->_currentRecentDisplayItems, "replaceObjectAtIndex:withObject:", v6, v11);

    }
    else
    {
      -[NSMutableOrderedSet removeObjectAtIndex:](self->_currentRecentDisplayItems, "removeObjectAtIndex:", v6);
    }
    -[NSMutableOrderedSet removeObject:](self->_currentRecentDisplayItemsSortedByRecency, "removeObject:", v13);
    WeakRetained = objc_loadWeakRetained((id *)&self->_recentsDataStore);
    objc_msgSend(WeakRetained, "setDisplayItems:", self->_currentRecentDisplayItems);

    -[SBFloatingDockSuggestionsModel _updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:](self, "_updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:", 0, 1);
  }

}

- (BOOL)recentDisplayItemsControllerShouldRepresentAppClipsAsWebClips:(id)a3
{
  return 1;
}

- (void)_updateCurrentDisplayItemsAfterContinuityChange:(BOOL)a3 notifyDelegate:(BOOL)a4
{
  _BOOL4 v4;
  SBFloatingDockSuggestionsModel *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t maxSuggestions;
  unint64_t v16;
  SBFloatingDockSuggestionsModel *v17;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v4 = a4;
  v34 = a3;
  v5 = self;
  v42 = *MEMORY[0x1E0C80C00];
  -[SBFloatingDockSuggestionsModel currentDisplayItems](self, "currentDisplayItems");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[NSMutableOrderedSet mutableCopy](v5->_currentRecentDisplayItems, "mutableCopy");
  -[SBFloatingDockSuggestionsModel requestedSuggestedApplication](v5, "requestedSuggestedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (unint64_t)v7;
  if (v7)
  {
    objc_msgSend(v7, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:sceneIdentifier:](SBDisplayItem, "applicationDisplayItemWithBundleIdentifier:sceneIdentifier:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_7;
LABEL_6:
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __97__SBFloatingDockSuggestionsModel__updateCurrentDisplayItemsAfterContinuityChange_notifyDelegate___block_invoke;
    v39[3] = &unk_1E8EA55D8;
    v40 = v11;
    v12 = v11;
    objc_msgSend(v6, "indexesOfObjectsPassingTest:", v39);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsAtIndexes:", v13);
    objc_msgSend(v6, "addObject:", v10);

    goto LABEL_7;
  }
  if (v5->_currentAppSuggestion)
  {
    -[SBFloatingDockSuggestionsModel _displayItemForAppSuggestion:](v5, "_displayItemForAppSuggestion:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_6;
  }
LABEL_7:
  v14 = objc_msgSend(v6, "count");
  maxSuggestions = v5->_maxSuggestions;
  v16 = v14 - maxSuggestions;
  if (v14 > maxSuggestions)
    objc_msgSend(v6, "removeObjectsInRange:", maxSuggestions - ((v8 | (unint64_t)v5->_currentAppSuggestion) != 0), v16);
  if ((objc_msgSend(v6, "isEqualToOrderedSet:", v33, v16) & 1) == 0)
  {
    if (v4)
    {
      v31 = (void *)v8;
      v17 = v5;
      WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
      v32 = v6;
      objc_msgSend(v6, "differenceFromOrderedSet:withOptions:", v33, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v36 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v24, "object", v31);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v24, "changeType");
            v27 = objc_msgSend(v24, "index");
            v28 = objc_msgSend(v24, "associatedIndex");
            v29 = v28;
            if (v26 == 1)
            {
              if (v28 == 0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(WeakRetained, "dockSuggestionsModel:didRemoveItem:atIndex:involvesContinuity:", v17, v25, v27, v34);
            }
            else if (!v26)
            {
              if (v28 == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(WeakRetained, "dockSuggestionsModel:didInsertItem:atIndex:involvesContinuity:", v17, v25, v27, v34);
              }
              else
              {
                objc_msgSend(v33, "objectAtIndex:", v28);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(WeakRetained, "dockSuggestionsModel:didReplaceItem:atIndex:withItem:atIndex:involvesContinuity:", v17, v30, v29, v25, v27, v34);

              }
            }

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v21);
      }

      v5 = v17;
      v8 = (unint64_t)v31;
      v6 = v32;
    }
    -[SBFloatingDockSuggestionsModel setCurrentDisplayItems:](v5, "setCurrentDisplayItems:", v6, v31);
  }

}

uint64_t __97__SBFloatingDockSuggestionsModel__updateCurrentDisplayItemsAfterContinuityChange_notifyDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_displayItemContainedInUserDock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 5)
  {
    objc_msgSend(v4, "webClipIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBIconListModel directlyContainsLeafIconWithIdentifier:](self->_userDockListModel, "directlyContainsLeafIconWithIdentifier:", v6);
  }
  else
  {
    if (v5)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel lastDirectlyContainedLeafIconWithApplicationBundleIdentifier:](self->_userDockListModel, "lastDirectlyContainedLeafIconWithApplicationBundleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
LABEL_7:

  return v8;
}

- (id)_filterRecentDisplayItems:(id)a3 filteredOutItems:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  if (a4)
  {
    v23 = objc_retainAutorelease(objc_alloc_init(MEMORY[0x1E0C99E10]));
    *a4 = v23;
  }
  else
  {
    v23 = 0;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v26;
    *(_QWORD *)&v9 = 138412290;
    v22 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1E0CF9688];
        objc_msgSend(v13, "bundleIdentifier", v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "applicationWithBundleIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isHidden");

        if (v17)
        {
          SBLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "bundleIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v30 = v19;
            _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Removing %@ because it's hidden by AppProtection", buf, 0xCu);

          }
        }
        else
        {
          if (-[SBFloatingDockSuggestionsModel _displayItemContainedInUserDock:](self, "_displayItemContainedInUserDock:", v13))
          {
            v20 = v23;
LABEL_17:
            objc_msgSend(v20, "addObject:", v13);
            continue;
          }
          if (objc_msgSend(v24, "count") < self->_maxSuggestions)
          {
            v20 = v24;
            goto LABEL_17;
          }
          if (objc_msgSend(v24, "count") >= self->_maxSuggestions)
            goto LABEL_21;
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v10);
  }
LABEL_21:

  return v24;
}

- (BOOL)_shouldProcessAppSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  SBIconListModel *userDockListModel;
  void *v12;
  NSMutableOrderedSet *currentRecentDisplayItems;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "bundleIdentifier"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    if (objc_msgSend(v5, "isHandoff"))
    {
      if (self->_currentAppSuggestion)
      {
        objc_msgSend(v5, "uniqueIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBBestAppSuggestion uniqueIdentifier](self->_currentAppSuggestion, "uniqueIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8) ^ 1;

      }
      else
      {
        LOBYTE(v9) = 1;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
    userDockListModel = self->_userDockListModel;
    objc_msgSend(v5, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(userDockListModel) = -[SBIconListModel directlyContainsLeafIconWithIdentifier:](userDockListModel, "directlyContainsLeafIconWithIdentifier:", v12);

    currentRecentDisplayItems = self->_currentRecentDisplayItems;
    -[SBFloatingDockSuggestionsModel _displayItemForAppSuggestion:](self, "_displayItemForAppSuggestion:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayItemForFloatingDockSuggestionsComparison");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(currentRecentDisplayItems) = -[NSMutableOrderedSet sb_containsFloatingDockSuggestionDisplayItem:](currentRecentDisplayItems, "sb_containsFloatingDockSuggestionDisplayItem:", v15);

    v10 = v9 | (userDockListModel | currentRecentDisplayItems) ^ 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SBFloatingDockSuggestionsModel_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __79__SBFloatingDockSuggestionsModel_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadRecentsAndSuggestions");
}

- (unint64_t)_indexForAppSuggestion:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableOrderedSet *currentRecentDisplayItems;
  unsigned int v7;
  unint64_t v8;

  v4 = a3;
  v5 = -[NSMutableOrderedSet count](self->_currentRecentDisplayItems, "count");
  currentRecentDisplayItems = self->_currentRecentDisplayItems;
  if (v5 >= self->_maxSuggestions)
  {
    v8 = -[NSMutableOrderedSet count](currentRecentDisplayItems, "count") - 1;
  }
  else
  {
    v7 = -[NSMutableOrderedSet sb_containsFloatingDockSuggestionDisplayItem:](currentRecentDisplayItems, "sb_containsFloatingDockSuggestionDisplayItem:", v4);
    v8 = -[NSMutableOrderedSet count](self->_currentRecentDisplayItems, "count") - v7;
  }

  return v8;
}

- (void)_appSuggestionsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *pendingSuggestionUpdateReasons;
  void *v7;
  void *v8;
  int v9;
  NSMutableSet *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBFloatingDockSuggestionsModel _isPendingAppSuggestionsUpdate](self, "_isPendingAppSuggestionsUpdate"))
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      pendingSuggestionUpdateReasons = self->_pendingSuggestionUpdateReasons;
      v9 = 138412290;
      v10 = pendingSuggestionUpdateReasons;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring app suggestions changed because %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("SBNewSuggestedAppKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFloatingDockSuggestionsModel _performAppSuggestionChangedWithNewSuggestion:](self, "_performAppSuggestionChangedWithNewSuggestion:", v8);
  }

}

- (void)_performAppSuggestionChangedWithNewSuggestion:(id)a3
{
  SBBestAppSuggestion *v4;
  SBBestAppSuggestion *currentAppSuggestion;

  v4 = (SBBestAppSuggestion *)a3;
  BSDispatchQueueAssertMain();
  currentAppSuggestion = self->_currentAppSuggestion;
  self->_currentAppSuggestion = v4;

  -[SBFloatingDockSuggestionsModel _updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:](self, "_updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:", 1, 1);
}

- (BOOL)_isPendingAppSuggestionsUpdate
{
  return -[NSMutableSet count](self->_pendingSuggestionUpdateReasons, "count") != 0;
}

- (void)_initializeAndObserveDefaults
{
  SBFloatingDockDefaults *floatingDockDefaults;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  floatingDockDefaults = self->_floatingDockDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "recentsEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C80D38];
  v6 = MEMORY[0x1E0C80D38];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __63__SBFloatingDockSuggestionsModel__initializeAndObserveDefaults__block_invoke;
  v11 = &unk_1E8E9DF28;
  objc_copyWeak(&v12, &location);
  v7 = (id)-[SBFloatingDockDefaults observeDefault:onQueue:withBlock:](floatingDockDefaults, "observeDefault:onQueue:withBlock:", v4, v5, &v8);

  -[SBFloatingDockSuggestionsModel _setRecentsEnabled:](self, "_setRecentsEnabled:", -[SBFloatingDockDefaults recentsEnabled](self->_floatingDockDefaults, "recentsEnabled", v8, v9, v10, v11));
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __63__SBFloatingDockSuggestionsModel__initializeAndObserveDefaults__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setRecentsEnabled:", objc_msgSend(WeakRetained[15], "recentsEnabled"));
    WeakRetained = v2;
  }

}

- (void)_setRecentsEnabled:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_recentsEnabled != a3)
  {
    -[SBFloatingDockSuggestionsModel recentsController](self, "recentsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_recentsEnabled)
    {
      self->_recentsEnabled = 0;
      objc_msgSend(v4, "setDelegate:", 0);
      -[SBFloatingDockSuggestionsModel resetRecentsAndSuggestions](self, "resetRecentsAndSuggestions");
    }
    else
    {
      self->_recentsEnabled = 1;
      objc_msgSend(v4, "setDelegate:", self);
      -[SBFloatingDockSuggestionsModel _reloadRecentsAndSuggestions](self, "_reloadRecentsAndSuggestions");
    }

  }
}

- (id)_displayItemForAppSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBContinuityDisplayItem continuityAppDisplayItemWithBundleIdentifier:appSuggestion:](SBContinuityDisplayItem, "continuityAppDisplayItemWithBundleIdentifier:appSuggestion:", v7, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
LABEL_5:
    v5 = 0;
  }
LABEL_6:

  return v5;
}

- (void)_addStateCaptureHandlers
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7[5];
  id v8[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C80D38];
  v3 = (void *)MEMORY[0x1E0C809B0];
  v8[1] = (id)MEMORY[0x1E0C809B0];
  v8[2] = (id)3221225472;
  v8[3] = __58__SBFloatingDockSuggestionsModel__addStateCaptureHandlers__block_invoke;
  v8[4] = &unk_1E8EA12C0;
  objc_copyWeak(&v9, &location);
  v4 = (id)BSLogAddStateCaptureBlockWithTitle();

  v7[1] = v3;
  v7[2] = (id)3221225472;
  v7[3] = __58__SBFloatingDockSuggestionsModel__addStateCaptureHandlers__block_invoke_2;
  v7[4] = &unk_1E8EA12C0;
  objc_copyWeak(v8, &location);
  v5 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_copyWeak(v7, &location);
  v6 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(v7);
  objc_destroyWeak(v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

__CFString *__58__SBFloatingDockSuggestionsModel__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  __CFString *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[17], "description");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E8EC7EC0;
  }

  return v3;
}

__CFString *__58__SBFloatingDockSuggestionsModel__addStateCaptureHandlers__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  v3 = &stru_1E8EC7EC0;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "bundleIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (__CFString *)v4;
    else
      v6 = &stru_1E8EC7EC0;
    v3 = v6;

  }
  return v3;
}

id __58__SBFloatingDockSuggestionsModel__addStateCaptureHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentDisplayItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)resetRecentsAndSuggestions
{
  id v3;

  -[SBFloatingDockSuggestionsModel recentsController](self, "recentsController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");
  -[SBFloatingDockSuggestionsModel _reloadRecentsAndSuggestions](self, "_reloadRecentsAndSuggestions");

}

- (void)_reloadRecentsAndSuggestions
{
  void *v3;
  id WeakRetained;
  void *v5;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *currentRecentDisplayItems;
  NSMutableOrderedSet *v8;
  NSMutableOrderedSet *currentRecentDisplayItemsSortedByRecency;
  NSMutableOrderedSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  SBBestAppSuggestion *currentAppSuggestion;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SBFloatingDockSuggestionsModel currentDisplayItems](self, "currentDisplayItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_recentsEnabled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_recentsController);
    objc_msgSend(WeakRetained, "recentDisplayItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockSuggestionsModel _filterRecentDisplayItems:filteredOutItems:](self, "_filterRecentDisplayItems:filteredOutItems:", v5, 0);
    v6 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    currentRecentDisplayItems = self->_currentRecentDisplayItems;
    self->_currentRecentDisplayItems = v6;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", -[NSMutableOrderedSet count](self->_currentRecentDisplayItems, "count"));
    v8 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    currentRecentDisplayItemsSortedByRecency = self->_currentRecentDisplayItemsSortedByRecency;
    self->_currentRecentDisplayItemsSortedByRecency = v8;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = self->_currentRecentDisplayItems;
    v11 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          -[NSMutableOrderedSet addObject:](self->_currentRecentDisplayItemsSortedByRecency, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
        }
        v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    currentAppSuggestion = self->_currentAppSuggestion;
    self->_currentAppSuggestion = 0;

  }
  else
  {
    -[NSMutableOrderedSet removeAllObjects](self->_currentRecentDisplayItems, "removeAllObjects");
    -[NSMutableOrderedSet removeAllObjects](self->_currentRecentDisplayItemsSortedByRecency, "removeAllObjects");
  }
  -[SBFloatingDockSuggestionsModel _updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:](self, "_updateCurrentDisplayItemsAfterContinuityChange:notifyDelegate:", 0, 0, (_QWORD)v18);
  -[SBFloatingDockSuggestionsModel currentDisplayItems](self, "currentDisplayItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v17, "dockSuggestionsModel:didReloadItems:withItems:", self, v3, v16);

}

- (id)_dockListModelFromContextProvider
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBFloatingDockSuggestionsModel homeScreenContextProvider](self, "homeScreenContextProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setUserDockListModel:(id)a3
{
  SBIconListModel *v5;
  SBIconListModel *userDockListModel;
  SBIconListModel *v7;

  v5 = (SBIconListModel *)a3;
  userDockListModel = self->_userDockListModel;
  if (userDockListModel != v5)
  {
    v7 = v5;
    -[SBIconListModel removeListObserver:](userDockListModel, "removeListObserver:", self);
    objc_storeStrong((id *)&self->_userDockListModel, a3);
    -[SBIconListModel addListObserver:](self->_userDockListModel, "addListObserver:", self);
    v5 = v7;
  }

}

- (void)_iconModelDidLayout:(id)a3
{
  void *v4;

  -[SBFloatingDockSuggestionsModel _dockListModelFromContextProvider](self, "_dockListModelFromContextProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockSuggestionsModel setUserDockListModel:](self, "setUserDockListModel:", v4);

  -[SBFloatingDockSuggestionsModel _reloadRecentsAndSuggestions](self, "_reloadRecentsAndSuggestions");
}

- (void)_iconModelDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  SBIconModel *v7;
  SBIconModel *iconModel;
  SBIconListModel *v9;

  -[SBFloatingDockSuggestionsModel _dockListModelFromContextProvider](self, "_dockListModelFromContextProvider", a3);
  v9 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
  if (self->_userDockListModel != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0DAAA08];
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DAAA08], self->_iconModel);
    -[SBFloatingDockSuggestionsModel homeScreenContextProvider](self, "homeScreenContextProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "model");
    v7 = (SBIconModel *)objc_claimAutoreleasedReturnValue();
    iconModel = self->_iconModel;
    self->_iconModel = v7;

    -[SBFloatingDockSuggestionsModel setUserDockListModel:](self, "setUserDockListModel:", v9);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__iconModelDidLayout_, v5, self->_iconModel);
    -[SBFloatingDockSuggestionsModel _reloadRecentsAndSuggestions](self, "_reloadRecentsAndSuggestions");

  }
}

- (void)_runStressTestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD v12[4];
  _QWORD v13[4];

  v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v5 = (void *)MEMORY[0x1E0C99E88];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SBFloatingDockSuggestionsModel__runStressTestWithCompletion___block_invoke;
  v8[3] = &unk_1E8EC0550;
  v10 = v13;
  v11 = v12;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  v7 = (id)objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 1, v8, 0.05);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);

}

void __63__SBFloatingDockSuggestionsModel__runStressTestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  SBDisplayItem *v7;
  __CFString **v8;
  void *v9;
  SBDisplayItem *v10;
  __CFString **v11;
  void *v12;
  void *v13;
  SBDisplayItem *v14;
  const __CFString *v15;
  void *v16;
  SBPPTFakeAppSuggestion *v17;
  __CFString **v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  id v23;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5 + 1;
  v23 = v3;
  switch(v5)
  {
    case 0:
      v9 = *(void **)(a1 + 32);
      v10 = [SBDisplayItem alloc];
      v11 = SBMapsBundleIdentifier;
      goto LABEL_22;
    case 1:
      v9 = *(void **)(a1 + 32);
      v10 = [SBDisplayItem alloc];
      v11 = SBMusicBundleIdentifier;
      goto LABEL_22;
    case 2:
      v9 = *(void **)(a1 + 32);
      v10 = [SBDisplayItem alloc];
      v11 = SBMessagesBundleIdentifier;
      goto LABEL_22;
    case 3:
    case 4:
      v6 = *(void **)(a1 + 32);
      v7 = [SBDisplayItem alloc];
      v8 = SBMusicBundleIdentifier;
      goto LABEL_11;
    case 5:
      v13 = *(void **)(a1 + 32);
      v14 = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:]([SBDisplayItem alloc], "initWithType:bundleIdentifier:uniqueIdentifier:", 0, CFSTR("com.apple.Maps"), 0);
      objc_msgSend(v13, "recentDisplayItemsController:didRemoveItem:", 0, v14);
      goto LABEL_28;
    case 6:
      v6 = *(void **)(a1 + 32);
      v7 = [SBDisplayItem alloc];
      v8 = SBMessagesBundleIdentifier;
LABEL_11:
      v15 = *v8;
      goto LABEL_27;
    case 7:
      v9 = *(void **)(a1 + 32);
      v10 = [SBDisplayItem alloc];
      v11 = SBNotesBundleIdentifier;
      goto LABEL_22;
    case 8:
      v16 = *(void **)(a1 + 32);
      v17 = [SBPPTFakeAppSuggestion alloc];
      v18 = SBNotesBundleIdentifier;
      goto LABEL_16;
    case 9:
      v16 = *(void **)(a1 + 32);
      v17 = [SBPPTFakeAppSuggestion alloc];
      v18 = SBMessagesBundleIdentifier;
      goto LABEL_16;
    case 10:
      v16 = *(void **)(a1 + 32);
      v17 = [SBPPTFakeAppSuggestion alloc];
      v18 = SBFilesBundleIdentifier;
LABEL_16:
      v19 = *v18;
      goto LABEL_18;
    case 11:
      v16 = *(void **)(a1 + 32);
      v17 = [SBPPTFakeAppSuggestion alloc];
      v19 = CFSTR("com.apple.not-found");
LABEL_18:
      v14 = -[SBPPTFakeAppSuggestion initWithBundleIdentifier:](v17, "initWithBundleIdentifier:", v19);
      objc_msgSend(v16, "_performAppSuggestionChangedWithNewSuggestion:", v14);
      goto LABEL_28;
    case 12:
      objc_msgSend(*(id *)(a1 + 32), "_performAppSuggestionChangedWithNewSuggestion:", 0);
      goto LABEL_29;
    case 13:
      v9 = *(void **)(a1 + 32);
      v10 = [SBDisplayItem alloc];
      v11 = SBFacetimeBundleIdentifier;
      goto LABEL_22;
    case 14:
    case 19:
      v9 = *(void **)(a1 + 32);
      v10 = [SBDisplayItem alloc];
      v11 = SBClockBundleIdentifier;
      goto LABEL_22;
    case 15:
      v9 = *(void **)(a1 + 32);
      v10 = [SBDisplayItem alloc];
      v11 = SBCalendarBundleIdentifier;
LABEL_22:
      v20 = *v11;
      goto LABEL_23;
    case 16:
      v9 = *(void **)(a1 + 32);
      v10 = [SBDisplayItem alloc];
      v20 = CFSTR("com.apple.not-found");
LABEL_23:
      v21 = 0;
      goto LABEL_24;
    case 17:
      v6 = *(void **)(a1 + 32);
      v7 = [SBDisplayItem alloc];
      v15 = CFSTR("com.apple.not-found");
LABEL_27:
      v14 = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:](v7, "initWithType:bundleIdentifier:uniqueIdentifier:", 0, v15, 0);
      objc_msgSend(v6, "recentDisplayItemsController:didMoveItemToFront:", 0, v14);
      goto LABEL_28;
    case 18:
      v9 = *(void **)(a1 + 32);
      v10 = [SBDisplayItem alloc];
      v20 = CFSTR("com.apple.mobiletimer");
      v21 = CFSTR("scene");
LABEL_24:
      v14 = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:](v10, "initWithType:bundleIdentifier:uniqueIdentifier:", 0, v20, v21);
      objc_msgSend(v9, "_handleNewRecentItem:", v14);
LABEL_28:

      goto LABEL_29;
    default:
      v12 = v3;
      if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) > 9uLL)
      {
        objc_msgSend(v3, "invalidate");
        v12 = v23;
        v22 = *(_QWORD *)(a1 + 40);
        if (v22)
        {
          (*(void (**)(uint64_t, id))(v22 + 16))(v22, v23);
LABEL_29:
          v12 = v23;
        }
      }
      else
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      }

      return;
  }
}

- (NSOrderedSet)currentDisplayItems
{
  return self->_currentDisplayItems;
}

- (void)setCurrentDisplayItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SBBestAppSuggestion)currentAppSuggestion
{
  return self->_currentAppSuggestion;
}

- (SBApplication)requestedSuggestedApplication
{
  return self->_requestedSuggestedApplication;
}

- (SBFloatingDockSuggestionsModelDelegate)delegate
{
  return (SBFloatingDockSuggestionsModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)maxSuggestions
{
  return self->_maxSuggestions;
}

- (SBAppSuggestionManager)appSuggestionManager
{
  return self->_appSuggestionManager;
}

- (SBRecentDisplayItemsController)recentsController
{
  return (SBRecentDisplayItemsController *)objc_loadWeakRetained((id *)&self->_recentsController);
}

- (SBRecentDisplayItemsDataStore)recentsDataStore
{
  return (SBRecentDisplayItemsDataStore *)objc_loadWeakRetained((id *)&self->_recentsDataStore);
}

- (SBRecentDisplayItemsDefaults)recentsDefaults
{
  return self->_recentsDefaults;
}

- (SBIconListModel)userDockListModel
{
  return self->_userDockListModel;
}

- (SBFloatingDockHomeScreenContextProviding)homeScreenContextProvider
{
  return (SBFloatingDockHomeScreenContextProviding *)objc_loadWeakRetained((id *)&self->_homeScreenContextProvider);
}

- (SBApplicationController)applicationController
{
  return self->_applicationController;
}

- (SBIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
  objc_storeStrong((id *)&self->_iconModel, a3);
}

- (SBFloatingDockDefaults)floatingDockDefaults
{
  return self->_floatingDockDefaults;
}

- (BOOL)recentsEnabled
{
  return self->_recentsEnabled;
}

- (void)setRecentsEnabled:(BOOL)a3
{
  self->_recentsEnabled = a3;
}

- (NSMutableSet)pendingSuggestionUpdateReasons
{
  return self->_pendingSuggestionUpdateReasons;
}

- (NSMutableOrderedSet)currentRecentDisplayItems
{
  return self->_currentRecentDisplayItems;
}

- (NSMutableOrderedSet)currentRecentDisplayItemsSortedByRecency
{
  return self->_currentRecentDisplayItemsSortedByRecency;
}

- (PTSingleTestRecipe)stressTestRecipe
{
  return self->_stressTestRecipe;
}

- (APSubjectMonitorSubscription)appProtectionSubscription
{
  return self->_appProtectionSubscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProtectionSubscription, 0);
  objc_storeStrong((id *)&self->_stressTestRecipe, 0);
  objc_storeStrong((id *)&self->_currentRecentDisplayItemsSortedByRecency, 0);
  objc_storeStrong((id *)&self->_currentRecentDisplayItems, 0);
  objc_storeStrong((id *)&self->_pendingSuggestionUpdateReasons, 0);
  objc_storeStrong((id *)&self->_floatingDockDefaults, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_destroyWeak((id *)&self->_homeScreenContextProvider);
  objc_storeStrong((id *)&self->_userDockListModel, 0);
  objc_storeStrong((id *)&self->_recentsDefaults, 0);
  objc_destroyWeak((id *)&self->_recentsDataStore);
  objc_destroyWeak((id *)&self->_recentsController);
  objc_storeStrong((id *)&self->_appSuggestionManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestedSuggestedApplication, 0);
  objc_storeStrong((id *)&self->_currentAppSuggestion, 0);
  objc_storeStrong((id *)&self->_currentDisplayItems, 0);
}

- (void)persistedDisplayItemsForDataStore:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "failed to create display item from dock plist rep -- aborting loading of items. failed plist rep: %@", (uint8_t *)&v2, 0xCu);
}

@end
