@implementation SBBackgroundActivityAttributionManager

uint64_t __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
}

- (void)statusBarAssertionManager:(id)a3 statusBarSettingsDidChange:(id)a4
{
  id v5;

  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBBackgroundActivityAttributionManager updateForegroundApplicationSceneHandles:withOptions:completion:](self, "updateForegroundApplicationSceneHandles:withOptions:completion:", v5, 2, 0);

}

void __105__SBBackgroundActivityAttributionManager_updateForegroundApplicationSceneHandles_withOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 56);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_postStatusStringsByIdentifier:", v6);
    v7 = *(_QWORD *)(a1 + 56);
  }
  if ((v7 & 2) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setBackgroundActivitiesToSuppress:", v5, (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(void))(v13 + 16))();

}

- (void)_postStatusStringsByIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v8);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v9 == v10)
          v11 = &stru_1E8EC7EC0;
        else
          v11 = v9;
        v12 = v11;

        objc_msgSend(MEMORY[0x1E0CEAA00], "stui_getDoubleHeightStatusStringBackgroundActivityWithIdentifier:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[__CFString isEqualToString:](v12, "isEqualToString:", v13) & 1) == 0)
          objc_msgSend(MEMORY[0x1E0CEAA00], "stui_postDoubleHeightStatusString:forBackgroundActivityWithIdentifier:", v12, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (id)_statusStringsByIdentifierForActiveAttributionsByBackgroundActivityIdentifier:(id)a3 inactiveAttributionsByBackgroundActivityIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
  if (v10)
  {
    v11 = v10;
    v55 = *(_QWORD *)v65;
    v51 = v7;
    v52 = v8;
    v48 = v9;
    do
    {
      v12 = 0;
      v50 = v11;
      do
      {
        if (*(_QWORD *)v65 != v55)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v12);
        objc_msgSend(v9, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = STUIStyleOverrideForBackgroundActivityIdentifier();
        if (v16 == 4)
          goto LABEL_34;
        if (v16 != 2048)
        {
          -[SBBackgroundActivityAssertionServiceManager statusStringForBackgroundActivityWithIdentifier:activeAttributions:](self->_assertionServiceManager, "statusStringForBackgroundActivityWithIdentifier:activeAttributions:", v13, v14);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            goto LABEL_40;
LABEL_34:
          if (objc_msgSend(v14, "count") != 1)
            goto LABEL_39;
          v57 = v13;
          v59 = v15;
          v39 = v12;
          v40 = v14;
          objc_msgSend(v14, "anyObject");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBBackgroundActivityAttributionManager _applicationForBackgroundActivityAttribution:](self, "_applicationForBackgroundActivityAttribution:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "displayName");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            v44 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("STATUS_BAR_BACKGROUND_ACTIVITY_SINGLE_APP_WITH_NAME_FORMAT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "stringWithFormat:", v46, v43);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v11 = v50;
          }
          else
          {
            v30 = 0;
          }

          v12 = v39;
          v14 = v40;
          v13 = v57;
          v15 = v59;
          v7 = v51;
          v8 = v52;
          if (!v30)
          {
LABEL_39:
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_40;
        }
        v56 = v13;
        v58 = v15;
        v53 = v12;
        v49 = objc_msgSend(v15, "count");
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v54 = v14;
        v18 = v14;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v61 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
              objc_msgSend(v23, "activityAttribution");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "attributedEntity");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "isSystemService");

              if ((v26 & 1) == 0)
              {
                -[SBBackgroundActivityAttributionManager _applicationForBackgroundActivityAttribution:](self, "_applicationForBackgroundActivityAttribution:", v23);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v27)
                {
                  objc_msgSend(v17, "addObject:", v27);
                }
                else
                {
                  SBLogStatusBarish();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v69 = v23;
                    _os_log_fault_impl(&dword_1D0540000, v28, OS_LOG_TYPE_FAULT, "Could not look up a background locating app for %@", buf, 0xCu);
                  }

                }
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
          }
          while (v20);
        }

        v29 = objc_msgSend(v17, "count");
        v30 = (void *)v29;
        if (v29)
        {
          if (v29 == 1)
          {
            objc_msgSend(v17, "anyObject");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "displayName");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v33 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("STATUS_BAR_BACKGROUND_LOCATION_SINGLE_APP_WITH_NAME_FORMAT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "stringWithFormat:", v35, v32);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v36 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v37;
            if (v49)
              v38 = CFSTR("STATUS_BAR_BACKGROUND_LOCATION_MULTIPLE_OTHER_APPS_WITH_COUNT_FORMAT");
            else
              v38 = CFSTR("STATUS_BAR_BACKGROUND_LOCATION_MULTIPLE_APPS_WITH_COUNT_FORMAT");
            objc_msgSend(v37, "localizedStringForKey:value:table:", v38, &stru_1E8EC7EC0, CFSTR("SpringBoardPlurals"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "stringWithFormat:", v34, v30);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v7 = v51;
          v8 = v52;
          v9 = v48;
          v13 = v56;

          v14 = v54;
          v15 = v58;
          v11 = v50;
        }
        else
        {
          v7 = v51;
          v8 = v52;
          v9 = v48;
          v11 = v50;
          v14 = v54;
          v13 = v56;
          v15 = v58;
        }

        v12 = v53;
        if (!v30)
          goto LABEL_34;
LABEL_40:
        objc_msgSend(v8, "setObject:forKey:", v30, v13);

        ++v12;
      }
      while (v12 != v11);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)updateForegroundApplicationSceneHandles:(id)a3 withOptions:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBBackgroundActivityAttributionManager updateForegroundApplicationSceneHandles:withOptions:completion:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("SBBackgroundActivityAttributionManager.m"), 128, CFSTR("this call must be made on the main thread"));

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __105__SBBackgroundActivityAttributionManager_updateForegroundApplicationSceneHandles_withOptions_completion___block_invoke;
  v14[3] = &unk_1E8EAC440;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a4;
  v10 = v9;
  v11 = v8;
  -[SBBackgroundActivityAttributionManager _mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles:withHandler:](self, "_mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles:withHandler:", v11, v14);

}

- (void)_mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles:(id)a3 withHandler:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *internalQueue;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v33;
  _QWORD block[5];
  id v35;
  id v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[6];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBBackgroundActivityAttributionManager _mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles:withHandler:]");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("SBBackgroundActivityAttributionManager.m"), 179, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v5;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v46;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v46 != v29)
          objc_enumerationMutation(obj);
        v31 = v7;
        v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v7);
        objc_msgSend(v33, "application");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "backgroundActivityAttributionsByIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v42 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_msgSend(v10, "objectForKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v40[0] = MEMORY[0x1E0C809B0];
              v40[1] = 3221225472;
              v40[2] = __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke;
              v40[3] = &unk_1E8EAC468;
              v40[4] = self;
              v40[5] = v33;
              objc_msgSend(v16, "objectsPassingTest:", v40);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectForKey:", v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = (void *)objc_msgSend(v18, "mutableCopy");

              if (v19)
                objc_msgSend(v19, "unionSet:", v17);
              else
                objc_msgSend(v6, "setObject:forKey:", v17, v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          }
          while (v12);
        }

        v7 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v30);
  }

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__46;
  v38[4] = __Block_byref_object_dispose__46;
  -[SBWindowSceneStatusBarAssertionManager currentStatusBarSettings](self->_appStatusBarAssertionManager, "currentStatusBarSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "backgroundActivitiesToSuppress");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (id)objc_msgSend(v21, "mutableCopy");

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke_29;
  block[3] = &unk_1E8EAC4B8;
  block[4] = self;
  v35 = v6;
  v36 = v27;
  v37 = v38;
  v23 = v27;
  v24 = v6;
  dispatch_async(internalQueue, block);

  _Block_object_dispose(v38, 8);
}

+ (Class)_implementationClass
{
  return (Class)objc_opt_class();
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SBBackgroundActivityAttributionManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_16 != -1)
    dispatch_once(&sharedInstance_onceToken_16, block);
  return (id)sharedInstance___sharedBackgroundActivityAssertionManager;
}

uint64_t __56__SBBackgroundActivityAttributionManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  kdebug_trace();
  v2 = objc_alloc_init((Class)objc_msgSend(*(id *)(a1 + 32), "_implementationClass"));
  v3 = (void *)sharedInstance___sharedBackgroundActivityAssertionManager;
  sharedInstance___sharedBackgroundActivityAssertionManager = (uint64_t)v2;

  return kdebug_trace();
}

- (SBBackgroundActivityAttributionManager)init
{
  SBBackgroundActivityAttributionManager *v3;
  uint64_t v4;
  NSMapTable *attributionsByBackgroundActivityIdentifier;
  uint64_t v6;
  NSMapTable *suspendedAttributionsByBackgroundActivityIdentifier;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  id v10;
  uint64_t v11;
  FBWorkspaceEventQueue *eventQueue;
  void *v13;
  uint64_t v14;
  SBWindowSceneStatusBarAssertionManager *appStatusBarAssertionManager;
  uint64_t v16;
  NSMutableSet *backgroundActivityIdentifiers;
  SBStatusBarTapManager *v18;
  SBStatusBarTapManager *statusBarTapManager;
  id v20;
  void *v21;
  uint64_t v22;
  STBackgroundActivitiesStatusDomain *backgroundActivitiesDomain;
  uint64_t v24;
  STStatusBarOverridesStatusDomain *overridesDomain;
  SBBackgroundActivityAssertionServiceManager *v26;
  SBBackgroundActivityAssertionServiceManager *assertionServiceManager;
  void *v29;
  uint64_t v30;
  id v31;
  id location;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SBBackgroundActivityAttributionManager;
  v3 = -[SBBackgroundActivityAttributionManager init](&v33, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    attributionsByBackgroundActivityIdentifier = v3->_attributionsByBackgroundActivityIdentifier;
    v3->_attributionsByBackgroundActivityIdentifier = (NSMapTable *)v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    suspendedAttributionsByBackgroundActivityIdentifier = v3->_suspendedAttributionsByBackgroundActivityIdentifier;
    v3->_suspendedAttributionsByBackgroundActivityIdentifier = (NSMapTable *)v6;

    Serial = BSDispatchQueueCreateSerial();
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)Serial;

    v10 = objc_alloc(MEMORY[0x1E0D229B8]);
    v11 = objc_msgSend(v10, "initWithName:onQueue:", CFSTR("com.apple.springboard.background-activities.eventqueue"), MEMORY[0x1E0C80D38]);
    eventQueue = v3->_eventQueue;
    v3->_eventQueue = (FBWorkspaceEventQueue *)v11;

    +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay](SBWindowSceneStatusBarManager, "windowSceneStatusBarManagerForEmbeddedDisplay");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assertionManager");
    v14 = objc_claimAutoreleasedReturnValue();
    appStatusBarAssertionManager = v3->_appStatusBarAssertionManager;
    v3->_appStatusBarAssertionManager = (SBWindowSceneStatusBarAssertionManager *)v14;

    -[SBWindowSceneStatusBarAssertionManager addObserver:](v3->_appStatusBarAssertionManager, "addObserver:", v3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    backgroundActivityIdentifiers = v3->_backgroundActivityIdentifiers;
    v3->_backgroundActivityIdentifiers = (NSMutableSet *)v16;

    v18 = objc_alloc_init(SBStatusBarTapManager);
    statusBarTapManager = v3->_statusBarTapManager;
    v3->_statusBarTapManager = v18;

    objc_initWeak(&location, v3);
    v30 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v31, &location);
    v20 = (id)BSLogAddStateCaptureBlockWithTitle();
    objc_msgSend((id)SBApp, "systemStatusServer", v30, 3221225472, __46__SBBackgroundActivityAttributionManager_init__block_invoke, &unk_1E8EA12C0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SBBackgroundActivityAttributionManager.m"), 98, CFSTR("SBBackgroundActivityAttributionManager is being created before the system status server"));

    }
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0868]), "initWithServerHandle:", v21);
    backgroundActivitiesDomain = v3->_backgroundActivitiesDomain;
    v3->_backgroundActivitiesDomain = (STBackgroundActivitiesStatusDomain *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A18]), "initWithServerHandle:", v21);
    overridesDomain = v3->_overridesDomain;
    v3->_overridesDomain = (STStatusBarOverridesStatusDomain *)v24;

    -[SBBackgroundActivityAttributionManager _registerHandlerAndHandleExistingState](v3, "_registerHandlerAndHandleExistingState");
    v26 = objc_alloc_init(SBBackgroundActivityAssertionServiceManager);
    assertionServiceManager = v3->_assertionServiceManager;
    v3->_assertionServiceManager = v26;

    -[SBBackgroundActivityAssertionServiceManager setDelegate:](v3->_assertionServiceManager, "setDelegate:", v3);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v3;
}

id __46__SBBackgroundActivityAttributionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[STBackgroundActivitiesStatusDomain invalidate](self->_backgroundActivitiesDomain, "invalidate");
  -[STStatusBarOverridesStatusDomain invalidate](self->_overridesDomain, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBBackgroundActivityAttributionManager;
  -[SBBackgroundActivityAttributionManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[SBBackgroundActivityAttributionManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)handleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = -[SBBackgroundActivityAssertionServiceManager handleTapForBackgroundActivityWithIdentifier:windowScene:](self->_assertionServiceManager, "handleTapForBackgroundActivityWithIdentifier:windowScene:", v6, v7)|| -[SBStatusBarTapManager handleTapForBackgroundActivityWithIdentifier:windowScene:](self->_statusBarTapManager, "handleTapForBackgroundActivityWithIdentifier:windowScene:", v6, v7);

  return v8;
}

- (void)invalidateBackgroundActivityAttributions:(id)a3
{
  -[SBBackgroundActivityAssertionServiceManager invalidateBackgroundActivityAssertionsForAttributions:](self->_assertionServiceManager, "invalidateBackgroundActivityAssertionsForAttributions:", a3);
}

- (id)_applicationForBackgroundActivityAttribution:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "activityAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "applicationWithBundleIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "activityAttribution");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationWithPid:", objc_msgSend(v10, "pid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

uint64_t __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v4 = a2;
  objc_msgSend(v4, "backgroundActivityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "canHandleTapForBackgroundActivityWithIdentifier:windowScene:", v5, v6);

  LODWORD(v6) = objc_msgSend(v4, "showsWhenForeground");
  return (v6 | v3) ^ 1;
}

void __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke_29(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "minusSet:", v12);

          if (objc_msgSend(v11, "count"))
            objc_msgSend(v2, "setObject:forKey:", v11, v8);
          else
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v8);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  v13 = *(void **)(a1 + 32);
  v14 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v13, "_statusStringsByIdentifierForActiveAttributionsByBackgroundActivityIdentifier:inactiveAttributionsByBackgroundActivityIdentifier:", v14, *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __172__SBBackgroundActivityAttributionManager__mainQueue_getBackgroundActivityIdentifiersToSuppressAndStatusStringsByIdentifierForForegroundApplicationSceneHandles_withHandler___block_invoke_2;
  block[3] = &unk_1E8EAC490;
  v16 = *(id *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v21 = v16;
  v22 = v17;
  v20 = v15;
  v18 = v15;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers:(id)a3 removedBackgroundActivityIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke;
  block[3] = &unk_1E8E9E270;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%@"), v4, CFSTR("UpdateSuppressionSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D229B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke_2;
  v10[3] = &unk_1E8E9F108;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v7;
  v13 = *(id *)(a1 + 48);
  v8 = v5;
  objc_msgSend(v6, "eventWithName:handler:", v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "executeOrAppendEvent:", v9);

}

void __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "acquireLockForReason:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeActiveBackgroundActivities:", *(_QWORD *)(a1 + 48));

    objc_msgSend(MEMORY[0x1E0CEAA00], "removeStyleOverrides:", STUIStyleOverridesForBackgroundActivityIdentifiers());
    SBLogStatusBarish();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      STBackgroundActivityIdentifiersDescription();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Removed background activities: %{public}@", buf, 0xCu);

    }
  }
  v6 = *(void **)(a1 + 32);
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke_53;
  v11[3] = &unk_1E8E9E270;
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  v14 = v2;
  v10 = v2;
  objc_msgSend(v6, "updateForegroundApplicationSceneHandles:withOptions:completion:", v7, -1, v11);

}

uint64_t __161__SBBackgroundActivityAttributionManager__updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers_removedBackgroundActivityIdentifiers___block_invoke_53(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addActiveBackgroundActivities:", *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x1E0CEAA00], "addStyleOverrides:", STUIStyleOverridesForBackgroundActivityIdentifiers());
    SBLogStatusBarish();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      STBackgroundActivityIdentifiersDescription();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Added background activities: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "relinquishLock:", *(_QWORD *)(a1 + 48));
}

- (void)_registerHandlerAndHandleExistingState
{
  STBackgroundActivitiesStatusDomain *backgroundActivitiesDomain;
  uint64_t v4;
  STStatusBarOverridesStatusDomain *overridesDomain;
  NSObject *internalQueue;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  id location;

  objc_initWeak(&location, self);
  backgroundActivitiesDomain = self->_backgroundActivitiesDomain;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke;
  v11[3] = &unk_1E8EAC4E0;
  v11[4] = self;
  objc_copyWeak(&v12, &location);
  -[STBackgroundActivitiesStatusDomain observeDataWithBlock:](backgroundActivitiesDomain, "observeDataWithBlock:", v11);
  overridesDomain = self->_overridesDomain;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_3;
  v9[3] = &unk_1E8EAC508;
  v9[4] = self;
  objc_copyWeak(&v10, &location);
  -[STStatusBarOverridesStatusDomain observeDataWithBlock:](overridesDomain, "observeDataWithBlock:", v9);
  internalQueue = self->_internalQueue;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_5;
  v7[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v8, &location);
  dispatch_async(internalQueue, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_2;
  v6[3] = &unk_1E8E9F280;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_updateWithData:andOverrides:", *(_QWORD *)(a1 + 32), WeakRetained[4]);
    WeakRetained = v3;
  }

}

void __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_4;
  v6[3] = &unk_1E8E9F280;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_updateWithData:andOverrides:", WeakRetained[2], *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __80__SBBackgroundActivityAttributionManager__registerHandlerAndHandleExistingState__block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained[1], "data");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[3], "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_queue_updateWithData:andOverrides:", v2, v3);

    WeakRetained = v4;
  }

}

- (void)_queue_updateWithData:(id)a3 andOverrides:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  NSMutableSet *v68;
  NSMutableSet *suspendedBackgroundActivityIdentifiers;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id obj;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD block[4];
  id v84;
  SBBackgroundActivityAttributionManager *v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  BSDispatchQueueAssert();
  -[STBackgroundActivitiesStatusDomainData attributions](self->_queue_processedData, "attributions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v7, "attributions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v75 = v7;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  objc_msgSend(v16, "bs_differenceWithArray:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v16;
  objc_msgSend(v12, "bs_differenceWithArray:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_queue_processedData, a3);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarOverridesStatusDomainData suppressedBackgroundActivityIdentifiers](self->_queue_processedOverrides, "suppressedBackgroundActivityIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v80 = v21;

  objc_msgSend(v8, "suppressedBackgroundActivityIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v74 = v8;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;

  __77__SBBackgroundActivityAttributionManager__queue_updateWithData_andOverrides___block_invoke(v26, v25, v80);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v25;
  __77__SBBackgroundActivityAttributionManager__queue_updateWithData_andOverrides___block_invoke((uint64_t)v27, v80, v25);
  v76 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_queue_processedOverrides, a4);
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v28 = v18;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v108 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
        objc_msgSend(v33, "backgroundActivityIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v80, "containsObject:", v34))
        {
          SBRemoveBackgroundActivityAttributionByIdentifier(v33, self->_suspendedAttributionsByBackgroundActivityIdentifier);
        }
        else if (SBRemoveBackgroundActivityAttributionByIdentifier(v33, self->_attributionsByBackgroundActivityIdentifier))
        {
          objc_msgSend(v81, "addObject:", v34);
        }

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
    }
    while (v30);
  }

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v35 = v17;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v104 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
        objc_msgSend(v40, "backgroundActivityIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v79, "containsObject:", v41))
        {
          SBAddBackgroundActivityAttributionByIdentifier(v40, self->_suspendedAttributionsByBackgroundActivityIdentifier);
        }
        else if (SBAddBackgroundActivityAttributionByIdentifier(v40, self->_attributionsByBackgroundActivityIdentifier))
        {
          objc_msgSend(v82, "addObject:", v41);
        }

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
    }
    while (v37);
  }
  v73 = v12;

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v27;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v114, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v100;
    do
    {
      v45 = 0;
      v46 = v28;
      do
      {
        if (*(_QWORD *)v100 != v44)
          objc_enumerationMutation(obj);
        v47 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v45);
        -[NSMapTable objectForKey:](self->_attributionsByBackgroundActivityIdentifier, "objectForKey:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "allObjects");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMapTable removeObjectForKey:](self->_attributionsByBackgroundActivityIdentifier, "removeObjectForKey:", v47);
        objc_msgSend(v46, "arrayByAddingObjectsFromArray:", v49);
        v28 = (id)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v49, "count"))
        {
          objc_msgSend(v82, "removeObject:", v47);
          objc_msgSend(v81, "addObject:", v47);
        }
        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        v50 = v49;
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v96;
          do
          {
            for (k = 0; k != v52; ++k)
            {
              if (*(_QWORD *)v96 != v53)
                objc_enumerationMutation(v50);
              SBAddBackgroundActivityAttributionByIdentifier(*(void **)(*((_QWORD *)&v95 + 1) + 8 * k), self->_suspendedAttributionsByBackgroundActivityIdentifier);
            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v95, v113, 16);
          }
          while (v52);
        }

        ++v45;
        v46 = v28;
      }
      while (v45 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v114, 16);
    }
    while (v43);
  }

  v93 = 0u;
  v94 = 0u;
  v92 = 0u;
  v91 = 0u;
  v77 = v76;
  v55 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v92;
    do
    {
      v58 = 0;
      v59 = v35;
      do
      {
        if (*(_QWORD *)v92 != v57)
          objc_enumerationMutation(v77);
        v60 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v58);
        -[NSMapTable objectForKey:](self->_suspendedAttributionsByBackgroundActivityIdentifier, "objectForKey:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "allObjects");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMapTable removeObjectForKey:](self->_suspendedAttributionsByBackgroundActivityIdentifier, "removeObjectForKey:", v60);
        objc_msgSend(v59, "arrayByAddingObjectsFromArray:", v62);
        v35 = (id)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v62, "count"))
        {
          objc_msgSend(v81, "removeObject:", v60);
          objc_msgSend(v82, "addObject:", v60);
        }
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v63 = v62;
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v88;
          do
          {
            for (m = 0; m != v65; ++m)
            {
              if (*(_QWORD *)v88 != v66)
                objc_enumerationMutation(v63);
              SBAddBackgroundActivityAttributionByIdentifier(*(void **)(*((_QWORD *)&v87 + 1) + 8 * m), self->_attributionsByBackgroundActivityIdentifier);
            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v87, v111, 16);
          }
          while (v65);
        }

        ++v58;
        v59 = v35;
      }
      while (v58 != v56);
      v56 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v91, v112, 16);
    }
    while (v56);
  }

  -[NSMutableSet minusSet:](self->_backgroundActivityIdentifiers, "minusSet:", v81);
  -[NSMutableSet unionSet:](self->_backgroundActivityIdentifiers, "unionSet:", v82);
  v68 = (NSMutableSet *)objc_msgSend(v79, "mutableCopy");
  suspendedBackgroundActivityIdentifiers = self->_suspendedBackgroundActivityIdentifiers;
  self->_suspendedBackgroundActivityIdentifiers = v68;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SBBackgroundActivityAttributionManager__queue_updateWithData_andOverrides___block_invoke_2;
  block[3] = &unk_1E8E9E270;
  v84 = v28;
  v85 = self;
  v86 = v35;
  v70 = v35;
  v71 = v28;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (objc_msgSend(v82, "count") || objc_msgSend(v81, "count"))
    -[SBBackgroundActivityAttributionManager _updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers:removedBackgroundActivityIdentifiers:](self, "_updateAppSceneSettingsForForegroundAppsAndPostAddedBackgroundActivityIdentifiers:removedBackgroundActivityIdentifiers:", v82, v81);

}

id __77__SBBackgroundActivityAttributionManager__queue_updateWithData_andOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v5, "minusSet:", v4);

  return v5;
}

void __77__SBBackgroundActivityAttributionManager__queue_updateWithData_andOverrides___block_invoke_2(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(a1[5], "_applicationForBackgroundActivityAttribution:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "releaseBackgroundActivityAttribution:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = a1[6];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j);
        objc_msgSend(a1[5], "_applicationForBackgroundActivityAttribution:", v14, (_QWORD)v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "takeBackgroundActivityAttribution:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBBackgroundActivityAttributionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBBackgroundActivityAttributionManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SBBackgroundActivityAttributionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__SBBackgroundActivityAttributionManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __80__SBBackgroundActivityAttributionManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__SBBackgroundActivityAttributionManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v7[3] = &unk_1E8EAC530;
  v8 = v2;
  v6 = v2;
  objc_msgSend(v3, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", v6, CFSTR("attributionsByBackgroundActivityIdentifier"), v4, 1, v7);

  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), CFSTR("assertionServiceManager"));
}

id __80__SBBackgroundActivityAttributionManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "allObjects");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

- (void)assertionServiceDidChangeStatusStringsForAForegroundApp
{
  BSDispatchMain();
}

void __97__SBBackgroundActivityAttributionManager_assertionServiceDidChangeStatusStringsForAForegroundApp__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateForegroundApplicationSceneHandles:withOptions:completion:", v2, 1, 0);

}

- (SBWindowSceneStatusBarAssertionManager)appStatusBarAssertionManager
{
  return self->_appStatusBarAssertionManager;
}

- (void)setAppStatusBarAssertionManager:(id)a3
{
  objc_storeStrong((id *)&self->_appStatusBarAssertionManager, a3);
}

- (NSMapTable)attributionsByBackgroundActivityIdentifier
{
  return self->_attributionsByBackgroundActivityIdentifier;
}

- (void)setAttributionsByBackgroundActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_attributionsByBackgroundActivityIdentifier, a3);
}

- (NSMapTable)suspendedAttributionsByBackgroundActivityIdentifier
{
  return self->_suspendedAttributionsByBackgroundActivityIdentifier;
}

- (void)setSuspendedAttributionsByBackgroundActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_suspendedAttributionsByBackgroundActivityIdentifier, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (FBWorkspaceEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (NSMutableSet)backgroundActivityIdentifiers
{
  return self->_backgroundActivityIdentifiers;
}

- (void)setBackgroundActivityIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSMutableSet)suspendedBackgroundActivityIdentifiers
{
  return self->_suspendedBackgroundActivityIdentifiers;
}

- (void)setSuspendedBackgroundActivityIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (SBStatusBarTapManager)statusBarTapManager
{
  return self->_statusBarTapManager;
}

- (SBBackgroundActivityAssertionServiceManager)assertionServiceManager
{
  return self->_assertionServiceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionServiceManager, 0);
  objc_storeStrong((id *)&self->_statusBarTapManager, 0);
  objc_storeStrong((id *)&self->_suspendedBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_suspendedAttributionsByBackgroundActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_attributionsByBackgroundActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_appStatusBarAssertionManager, 0);
  objc_storeStrong((id *)&self->_queue_processedOverrides, 0);
  objc_storeStrong((id *)&self->_overridesDomain, 0);
  objc_storeStrong((id *)&self->_queue_processedData, 0);
  objc_storeStrong((id *)&self->_backgroundActivitiesDomain, 0);
}

@end
