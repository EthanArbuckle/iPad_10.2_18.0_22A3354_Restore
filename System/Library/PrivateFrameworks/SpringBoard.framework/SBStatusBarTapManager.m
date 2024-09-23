@implementation SBStatusBarTapManager

- (BOOL)handleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  _QWORD *v20;
  void (**v21)(_QWORD, _QWORD);
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBStatusBarTapManager handleTapForBackgroundActivityWithIdentifier:windowScene:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("SBStatusBarTapManager.m"), 68, CFSTR("this call must be made on the main thread"));

  }
  -[SBStatusBarTapManager _handlerForBackgroundActivityWithIdentifier:windowScene:](self, "_handlerForBackgroundActivityWithIdentifier:windowScene:", v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)v8;
  if (v8)
    v10 = *(void **)(v8 + 24);
  else
    v10 = 0;
  v11 = v10;
  objc_initWeak(&location, self);
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__SBStatusBarTapManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke;
  v22[3] = &unk_1E8EBC1C8;
  objc_copyWeak(&v24, &location);
  v13 = v6;
  v23 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v22);
  if (v9 && v9[3] && -[SBStatusBarTapManager _isUILocked:](self, "_isUILocked:", v7))
  {
    objc_msgSend(v11, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __82__SBStatusBarTapManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke_2;
    v19[3] = &unk_1E8EAAA98;
    v21 = v14;
    v20 = v9;
    -[SBStatusBarTapManager _performAfterAttemptingUnlockForAppWithBundleIdentifier:windowScene:completion:](self, "_performAfterAttemptingUnlockForAppWithBundleIdentifier:windowScene:completion:", v15, v7, v19);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD *))v14)[2](v14, v9);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v9 != 0;
}

void __82__SBStatusBarTapManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  if (a2)
    v4 = (void *)a2[3];
  else
    v4 = 0;
  v8 = v4;
  if (-[_SBStatusBarTapHandler handleTap](a2))
  {
    objc_msgSend(v8, "sceneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_addRecentlyTappedApplicationDestinations:forBackgroundActivityWithIdentifier:", v7, *(_QWORD *)(a1 + 32));

    }
  }

}

uint64_t __82__SBStatusBarTapManager_handleTapForBackgroundActivityWithIdentifier_windowScene___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(result + 40) + 16))(*(_QWORD *)(result + 40), *(_QWORD *)(result + 32));
  return result;
}

- (BOOL)canHandleTapForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3978];
  v8 = a3;
  if ((objc_msgSend(v7, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBStatusBarTapManager canHandleTapForBackgroundActivityWithIdentifier:windowScene:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("SBStatusBarTapManager.m"), 96, CFSTR("this call must be made on the main thread"));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  -[SBStatusBarTapManager _handlerForBackgroundActivityWithIdentifier:orOutApplications:](self, "_handlerForBackgroundActivityWithIdentifier:orOutApplications:", v8, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v19;
  if (v10)
  {
    v12 = 1;
  }
  else if (objc_msgSend(v11, "count"))
  {
    -[SBStatusBarTapManager _allApplicationDestinationsForApplications:windowScene:](self, "_allApplicationDestinationsForApplications:windowScene:", v11, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBStatusBarTapManager _foregroundApplicationDestinationsForApplications:windowScene:](self, "_foregroundApplicationDestinationsForApplications:windowScene:", v11, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v15, "minusOrderedSet:", v14);
    v12 = objc_msgSend(v15, "count") != 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_handlerForBackgroundActivityWithIdentifier:(id)a3 windowScene:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  NSObject *v14;
  void *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  -[SBStatusBarTapManager _handlerForBackgroundActivityWithIdentifier:orOutApplications:](self, "_handlerForBackgroundActivityWithIdentifier:orOutApplications:", v7, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;

  if (objc_msgSend(v11, "count"))
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarTapManager.m"), 127, CFSTR("should not have both a handler and apps"));

    }
    -[SBStatusBarTapManager _appDestinationForNextSceneToVisitForApps:andBackgroundActivityWithIdentifier:windowScene:](self, "_appDestinationForNextSceneToVisitForApps:andBackgroundActivityWithIdentifier:windowScene:", v11, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[_SBStatusBarTapHandler initWithApplicationDestination:]([_SBStatusBarTapHandler alloc], v12);

      v10 = v13;
    }

  }
  if (!v10)
  {
    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBStatusBarTapManager _handlerForBackgroundActivityWithIdentifier:windowScene:].cold.1((uint64_t)v7, (uint64_t)v11, v14);

  }
  return v10;
}

- (id)_handlerForBackgroundActivityWithIdentifier:(id)a3 orOutApplications:(id *)a4
{
  id v5;
  void *v6;
  __CFString **v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v12;
  int v13;
  _SBStatusBarTapHandler *v14;
  void *v15;
  const __CFString *v16;
  _SBStatusBarTapHandler *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0B68]) & 1) != 0)
    goto LABEL_11;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0B78]))
  {
    v7 = SBMapsBundleIdentifier;
    goto LABEL_4;
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0BA0]))
  {
    objc_msgSend((id)SBApp, "audioRecordingManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nowRecordingApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v6, "addObject:", v9);

    goto LABEL_10;
  }
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0B28]))
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0AF0]))
    {
      objc_msgSend((id)SBApp, "nowLocatingApps");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_10;
LABEL_22:
      objc_msgSend(v6, "addObjectsFromArray:", v8);
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0B48]))
    {
      v17 = [_SBStatusBarTapHandler alloc];
      v18 = &__block_literal_global_332;
    }
    else
    {
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0BF0]))
      {
        v14 = [_SBStatusBarTapHandler alloc];
        v15 = (void *)MEMORY[0x1E0C99E98];
        v16 = CFSTR("prefs:root=INTERNET_TETHERING");
        goto LABEL_39;
      }
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0B30]))
      {
        v7 = SBDiagnosticsBundleIdentifier;
LABEL_4:
        SBWorkspaceApplicationForIdentifier(*v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v6, "addObject:", v8);
        goto LABEL_10;
      }
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0B70]))
      {
        v14 = [_SBStatusBarTapHandler alloc];
        v15 = (void *)MEMORY[0x1E0C99E98];
        v16 = CFSTR("prefs:root=General&path=ManagedConfigurationList");
        goto LABEL_39;
      }
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0BE8]))
      {
        +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isInternalInstall");

        if (!v20)
          goto LABEL_11;
        v14 = [_SBStatusBarTapHandler alloc];
        v15 = (void *)MEMORY[0x1E0C99E98];
        v16 = CFSTR("prefs:root=INTERNAL_SETTINGS&path=sysdiagnose");
        goto LABEL_39;
      }
      if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0BC8]))
      {
        if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DB0B18]))
        {
          v14 = [_SBStatusBarTapHandler alloc];
          v15 = (void *)MEMORY[0x1E0C99E98];
          v16 = CFSTR("prefs:root=EMERGENCY_SOS");
          goto LABEL_39;
        }
        if (!v5 || (STUIBackgroundActivityIdentiferRepresentsStyleOverride() & 1) != 0)
          goto LABEL_11;
        objc_msgSend((id)SBApp, "appsForBackgroundActivityWithIdentifier:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      v17 = [_SBStatusBarTapHandler alloc];
      v18 = &__block_literal_global_27_4;
    }
    v10 = -[_SBStatusBarTapHandler initWithBlock:](v17, v18);
    goto LABEL_12;
  }
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isInternalInstall") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D83028], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "activePrototypingEnabled");

    if (!v13)
      goto LABEL_11;
    v14 = [_SBStatusBarTapHandler alloc];
    v15 = (void *)MEMORY[0x1E0C99E98];
    v16 = CFSTR("prefs:root=INTERNAL_SETTINGS&path=Prototyping");
LABEL_39:
    objc_msgSend(v15, "URLWithString:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_SBStatusBarTapHandler initWithURL:](v14, v21);

    goto LABEL_12;
  }
LABEL_10:

LABEL_11:
  v10 = 0;
LABEL_12:
  if (a4 && objc_msgSend(v6, "count"))
    *a4 = objc_retainAutorelease(v6);

  return v10;
}

void __87__SBStatusBarTapManager__handlerForBackgroundActivityWithIdentifier_orOutApplications___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("SBStatusBarReturnToHearingAidNotification"), 0, 0);

}

- (id)_appDestinationForNextSceneToVisitForApps:(id)a3 andBackgroundActivityWithIdentifier:(id)a4 windowScene:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[SBStatusBarTapManager _allApplicationDestinationsForApplications:windowScene:](self, "_allApplicationDestinationsForApplications:windowScene:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStatusBarTapManager _foregroundApplicationDestinationsForApplications:windowScene:](self, "_foregroundApplicationDestinationsForApplications:windowScene:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBStatusBarTapManager _recentlyTappedApplicationDestinationsForBackgroundActivityWithIdentifier:](self, "_recentlyTappedApplicationDestinationsForBackgroundActivityWithIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "mutableCopy");
  v15 = -[SBStatusBarTapManager _isUILocked:](self, "_isUILocked:", v9);

  if (!v15)
  {
    objc_msgSend(v14, "minusOrderedSet:", v12);
    if (!objc_msgSend(v14, "count"))
    {
      v19 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v14, "minusSet:", v13);
    if (!objc_msgSend(v14, "count"))
      -[SBStatusBarTapManager _resetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:](self, "_resetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:", v8);
    objc_msgSend(v12, "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBStatusBarTapManager _addRecentlyTappedApplicationDestinations:forBackgroundActivityWithIdentifier:](self, "_addRecentlyTappedApplicationDestinations:forBackgroundActivityWithIdentifier:", v16, v8);

    -[SBStatusBarTapManager _recentlyTappedApplicationDestinationsForBackgroundActivityWithIdentifier:](self, "_recentlyTappedApplicationDestinationsForBackgroundActivityWithIdentifier:", v8);
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v18, "minusSet:", v17);
    v13 = (void *)v17;
    v14 = v18;
  }
  objc_msgSend(v14, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v19;
}

- (void)_addRecentlyTappedApplicationDestinations:(id)a3 forBackgroundActivityWithIdentifier:(id)a4
{
  id v7;
  id v8;
  NSMutableDictionary *backgroundActivityIdentifiersToRecentScenes;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarTapManager.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinations"));

  }
  backgroundActivityIdentifiersToRecentScenes = self->_backgroundActivityIdentifiersToRecentScenes;
  if (!backgroundActivityIdentifiersToRecentScenes)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = self->_backgroundActivityIdentifiersToRecentScenes;
    self->_backgroundActivityIdentifiersToRecentScenes = v10;

    backgroundActivityIdentifiersToRecentScenes = self->_backgroundActivityIdentifiersToRecentScenes;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](backgroundActivityIdentifiersToRecentScenes, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v7, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v16);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backgroundActivityIdentifiersToRecentScenes, "setObject:forKeyedSubscript:", v15, v8);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v22, "sceneIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          objc_msgSend(v15, "removeObject:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v19);
  }

  -[SBStatusBarTapManager _scheduleResetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:](self, "_scheduleResetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:", v8);
}

- (void)_scheduleResetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *backgroundActivityIdentifiersToRecentSceneResetTimers;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  if (!self->_backgroundActivityIdentifiersToRecentSceneResetTimers)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    backgroundActivityIdentifiersToRecentSceneResetTimers = self->_backgroundActivityIdentifiersToRecentSceneResetTimers;
    self->_backgroundActivityIdentifiersToRecentSceneResetTimers = v5;

  }
  objc_initWeak(&location, self);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundActivityIdentifiersToRecentSceneResetTimers, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "invalidate");
  v9 = (void *)MEMORY[0x1E0C99E88];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __105__SBStatusBarTapManager__scheduleResetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier___block_invoke;
  v13[3] = &unk_1E8EA3218;
  objc_copyWeak(&v15, &location);
  v10 = v4;
  v14 = v10;
  objc_msgSend(v9, "timerWithTimeInterval:repeats:block:", 0, v13, 8.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTimer:forMode:", v11, *MEMORY[0x1E0C99860]);

  objc_msgSend(v11, "setTolerance:", 1.0);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backgroundActivityIdentifiersToRecentSceneResetTimers, "setObject:forKeyedSubscript:", v11, v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __105__SBStatusBarTapManager__scheduleResetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:", *(_QWORD *)(a1 + 32));

}

- (id)_recentlyTappedApplicationDestinationsForBackgroundActivityWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundActivityIdentifiersToRecentScenes, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)_resetRecentlyTappedSceneIdentifiersForBackgroundActivityWithIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_backgroundActivityIdentifiersToRecentScenes, "removeObjectForKey:", a3);
}

- (id)_workspace
{
  return +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
}

- (BOOL)_isUILocked:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "uiLockStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = objc_msgSend(v6, "isUILocked");
  return v7;
}

- (id)_allApplicationDestinationsForApplications:(id)a3 windowScene:(id)a4
{
  id v5;
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  _SBStatusBarTapApplicationDestination *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _SBStatusBarTapApplicationDestination *v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[4];
  uint64_t v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_persistenceIdentifiersForBundleIdentifier:onlyIncludeLaunchableIdentifiers:", v10, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
        if (!v12)
        {

LABEL_20:
          SBLogCommon();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[SBStatusBarTapManager _allApplicationDestinationsForApplications:windowScene:].cold.1(v38, v8, &v39, v22);

          v23 = -[_SBStatusBarTapApplicationDestination initWithApplication:sceneIdentifier:windowScene:]([_SBStatusBarTapApplicationDestination alloc], "initWithApplication:sceneIdentifier:windowScene:", v8, 0, v6);
          objc_msgSend(v29, "addObject:", v23);

          continue;
        }
        v13 = v12;
        v28 = i;
        v14 = 0;
        v15 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(v11);
            v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
            objc_msgSend(v8, "_sceneIdentifierForStoredPersistenceIdentifier:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              v19 = -[_SBStatusBarTapApplicationDestination initWithApplication:sceneIdentifier:windowScene:]([_SBStatusBarTapApplicationDestination alloc], "initWithApplication:sceneIdentifier:windowScene:", v8, v18, v6);
              objc_msgSend(v29, "addObject:", v19);
              v14 = 1;
            }
            else
            {
              SBLogCommon();
              v19 = (_SBStatusBarTapApplicationDestination *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v8, "bundleIdentifier");
                v20 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v41 = v17;
                v42 = 2112;
                v43 = v20;
                v21 = (void *)v20;
                _os_log_error_impl(&dword_1D0540000, &v19->super, OS_LOG_TYPE_ERROR, "Unable to find a scene identifier for persistence identifier %@ with application %@", buf, 0x16u);

              }
            }

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
        }
        while (v13);

        i = v28;
        if ((v14 & 1) == 0)
          goto LABEL_20;
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    }
    while (v27);
  }

  return v29;
}

- (id)_foregroundApplicationDestinationsForApplications:(id)a3 windowScene:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  _SBStatusBarTapApplicationDestination *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  _SBStatusBarTapApplicationDestination *v34;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v37 = v11;
  objc_msgSend(v11, "externalForegroundApplicationSceneHandles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v17, "sceneIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "application");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "containsObject:", v19))
        {
          v20 = -[_SBStatusBarTapApplicationDestination initWithApplication:sceneIdentifier:windowScene:]([_SBStatusBarTapApplicationDestination alloc], "initWithApplication:sceneIdentifier:windowScene:", v19, v18, v6);
          objc_msgSend(v7, "addObject:", v20);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v14);
  }

  +[SBSystemApertureSceneElement activeElements](SBSystemApertureSceneElement, "activeElements");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
  {
    v38 = v7;
    v22 = (void *)MEMORY[0x1E0C99E60];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __87__SBStatusBarTapManager__foregroundApplicationDestinationsForApplications_windowScene___block_invoke;
    v43[3] = &unk_1E8EBC230;
    v44 = v5;
    v36 = v21;
    objc_msgSend(v21, "bs_compactMap:", v43);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "externalApplicationSceneHandles");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v40 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v31, "sceneIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "application");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "containsObject:", v33))
          {
            v34 = -[_SBStatusBarTapApplicationDestination initWithApplication:sceneIdentifier:windowScene:]([_SBStatusBarTapApplicationDestination alloc], "initWithApplication:sceneIdentifier:windowScene:", v33, v32, v6);
            objc_msgSend(v38, "addObject:", v34);

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      }
      while (v28);
    }

    v7 = v38;
    v21 = v36;
  }

  return v7;
}

id __87__SBStatusBarTapManager__foregroundApplicationDestinationsForApplications_windowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "associatedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "associatedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((_DWORD)v5)
    {
      objc_msgSend(v3, "associatedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (BOOL)_performAfterAttemptingUnlockForAppWithBundleIdentifier:(id)a3 windowScene:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  SBLockScreenUnlockRequest *v10;
  void *v11;
  void *v12;
  char v13;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setName:](v10, "setName:", CFSTR("Unlock to launch double height status bar app."));
  -[SBLockScreenUnlockRequest setSource:](v10, "setSource:", 24);
  -[SBLockScreenUnlockRequest setWindowScene:](v10, "setWindowScene:", v7);
  SBWorkspaceApplicationForIdentifier(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!SBWorkspaceApplicationCanActivateWhilePasscodeLocked(v11)
    || objc_msgSend(v7, "isContinuityDisplayWindowScene"))
  {
    -[SBLockScreenUnlockRequest setIntent:](v10, "setIntent:", 3);
  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unlockWithRequest:completion:", v10, v8);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiersToRecentSceneResetTimers, 0);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiersToRecentScenes, 0);
}

- (void)_handlerForBackgroundActivityWithIdentifier:(NSObject *)a3 windowScene:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  STBackgroundActivityIdentifierDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "unable to construct a tap handler for %@, %@", (uint8_t *)&v6, 0x16u);

}

- (void)_allApplicationDestinationsForApplications:(_QWORD *)a3 windowScene:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1D0540000, a4, OS_LOG_TYPE_ERROR, "Unable to find a scene identifier for %@, perhaps it was launched by CarPlay?", a1, 0xCu);

}

@end
