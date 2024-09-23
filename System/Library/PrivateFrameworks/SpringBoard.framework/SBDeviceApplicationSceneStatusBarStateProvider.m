@implementation SBDeviceApplicationSceneStatusBarStateProvider

- (id)backgroundActivitiesToSuppress
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(WeakRetained, "backgroundActivitiesToSuppress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uiClientSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v5, "preferredBackgroundActivitiesToSuppress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unionSet:", v7);

      v4 = v6;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_statusBarAppearsOutsideOfAJailedApp
{
  return -[SBDeviceApplicationSceneStatusBarStateProvider _statusBarAppearsOutsideOfAJailedAppInOrientation:](self, "_statusBarAppearsOutsideOfAJailedAppInOrientation:", -[SBDeviceApplicationSceneStatusBarStateProvider _statusBarOrientationGivenFallbackOrientation:](self, "_statusBarOrientationGivenFallbackOrientation:", -[SBDeviceApplicationSceneStatusBarStateProvider _fallbackInterfaceOrientation](self, "_fallbackInterfaceOrientation")));
}

- (int64_t)_fallbackInterfaceOrientation
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  v3 = objc_msgSend(WeakRetained, "defaultInterfaceOrientation");

  return v3;
}

- (int64_t)_statusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "uiSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "deviceOrientationEventsEnabled"))
    {
      objc_msgSend(v5, "uiClientSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = objc_msgSend(v7, "interfaceOrientation");

    }
    else
    {
      a3 = objc_msgSend(v6, "interfaceOrientation");
    }

  }
  return a3;
}

- (uint64_t)_statusBarCanAppearOutsideApp
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isClassic"))
  {
    objc_msgSend(WeakRetained, "_windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "switcherController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isChamoisWindowingUIEnabled") ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __76__SBDeviceApplicationSceneStatusBarStateProvider_Base_addStatusBarObserver___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2(uint64_t result, void *a2, char a3)
{
  if ((a3 & 1) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarStyleTo:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_12(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((a3 & 2) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "statusBarPartStyles", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v5, "sceneWithIdentifier:didChangeStatusBarStyleTo:forPartWithIdentifier:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "statusBarStyleForPartWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11)), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (int64_t)_statusBarStyleForPartWithIdentifier:(id)a3 suppressingInherited:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a4;
  v6 = a3;
  -[SBDeviceApplicationSceneStatusBarStateProvider_Base statusBarPartStyles](self, "statusBarPartStyles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (!v4)
    {
      v9 = 4;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  v9 = objc_msgSend(v8, "integerValue");
  if (v9 == 4 && v4)
LABEL_6:
    v9 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base statusBarStyle](self, "statusBarStyle");
LABEL_8:

  return v9;
}

- (id)_statusBarPartStyles
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "uiClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusBarPartStyles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v5;
}

- (BOOL)_statusBarHiddenGivenFallbackOrientation:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "uiClientSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "statusBarHidden");

  }
  else
  {
    v8 = objc_msgSend(WeakRetained, "defaultStatusBarHiddenForOrientation:", a3);
  }

  return v8;
}

- (int64_t)_statusBarStyle
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "uiClientSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "statusBarModernStyle");

  }
  else
  {
    v7 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base defaultStatusBarStyle](self, "defaultStatusBarStyle");
  }

  return v7;
}

- (BOOL)_statusBarAppearsOutsideOfAJailedAppInOrientation:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  int v7;

  if (-[SBDeviceApplicationSceneStatusBarStateProvider _statusBarCanAppearOutsideApp]((uint64_t)self))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
    objc_msgSend(WeakRetained, "application");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "includesStatusBarInClassicJailForInterfaceOrientation:", a3) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (int64_t)_defaultStatusBarStyle
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  v3 = objc_msgSend(WeakRetained, "_defaultStatusBarStyleFromSceneDataStore");
  if (v3 == -1)
  {
    objc_msgSend(WeakRetained, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "defaultStatusBarStyle");

  }
  v6 = _SBStatusBarStyleFromLegacyStyle(v3);

  return v6;
}

- (double)_statusBarAlpha
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "uiClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusBarAlpha");
    v6 = v5;

  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

uint64_t __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_22(uint64_t result, void *a2, char a3)
{
  if ((a3 & 8) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarHiddenTo:withAnimation:", *(_QWORD *)(result + 32), *(unsigned __int8 *)(result + 48), *(_QWORD *)(result + 40));
  return result;
}

uint64_t __102__SBDeviceApplicationSceneStatusBarStateProvider__handleStatusBarBackgroundActivitiesToSuppressUpdate__block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x40) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeBackgroundActivitiesToSuppressTo:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIApplicationSceneSettingsDiffInspector *appSceneSettingsDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v12;
  UIApplicationSceneSettingsDiffInspector *v13;
  UIApplicationSceneSettingsDiffInspector *v14;
  uint64_t v15;
  UIApplicationSceneSettingsDiffInspector *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    appSceneSettingsDiffInspector = self->_appSceneSettingsDiffInspector;
    if (!appSceneSettingsDiffInspector)
    {
      v12 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA340]);
      v13 = self->_appSceneSettingsDiffInspector;
      self->_appSceneSettingsDiffInspector = v12;

      objc_initWeak(&location, self);
      v14 = self->_appSceneSettingsDiffInspector;
      v15 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke;
      v19[3] = &unk_1E8EA2658;
      objc_copyWeak(&v20, &location);
      -[UIApplicationSceneSettingsDiffInspector observeInterfaceOrientationWithBlock:](v14, "observeInterfaceOrientationWithBlock:", v19);
      v16 = self->_appSceneSettingsDiffInspector;
      v17[0] = v15;
      v17[1] = 3221225472;
      v17[2] = __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2;
      v17[3] = &unk_1E8EA2658;
      objc_copyWeak(&v18, &location);
      -[UIApplicationSceneSettingsDiffInspector observeStatusBarAvoidanceFrameWithBlock:](v16, "observeStatusBarAvoidanceFrameWithBlock:", v17);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      appSceneSettingsDiffInspector = self->_appSceneSettingsDiffInspector;
    }
    objc_msgSend(v9, "evaluateWithInspector:context:", appSceneSettingsDiffInspector, 0);
  }

}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIApplicationSceneClientSettingsDiffInspector *appClientSettingsDiffInspector;
  UIApplicationSceneClientSettingsDiffInspector *v12;
  UIApplicationSceneClientSettingsDiffInspector *v13;
  UIApplicationSceneClientSettingsDiffInspector *v14;
  uint64_t v15;
  UIApplicationSceneClientSettingsDiffInspector *v16;
  UIApplicationSceneClientSettingsDiffInspector *v17;
  UIApplicationSceneClientSettingsDiffInspector *v18;
  uint64_t v19;
  UIApplicationSceneClientSettingsDiffInspector *v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  SBSUIInCallSceneClientSettingsDiffInspector *v24;
  SBSUIInCallSceneClientSettingsDiffInspector *inCallSceneClientSettingsDiffInspector;
  SBSUIInCallSceneClientSettingsDiffInspector *v26;
  SBSUIInCallSceneClientSettingsDiffInspector *v27;
  id *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
    if (!appClientSettingsDiffInspector)
    {
      v12 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
      v13 = self->_appClientSettingsDiffInspector;
      self->_appClientSettingsDiffInspector = v12;

      objc_initWeak(location, self);
      v14 = self->_appClientSettingsDiffInspector;
      v15 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
      v39[3] = &unk_1E8EA2658;
      objc_copyWeak(&v40, location);
      -[UIApplicationSceneClientSettingsDiffInspector observeStatusBarModernStyleWithBlock:](v14, "observeStatusBarModernStyleWithBlock:", v39);
      v16 = self->_appClientSettingsDiffInspector;
      v37[0] = v15;
      v37[1] = 3221225472;
      v37[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3;
      v37[3] = &unk_1E8EA2658;
      v28 = &v38;
      objc_copyWeak(&v38, location);
      -[UIApplicationSceneClientSettingsDiffInspector observeStatusBarPartStylesWithBlock:](v16, "observeStatusBarPartStylesWithBlock:", v37);
      v17 = self->_appClientSettingsDiffInspector;
      v35[0] = v15;
      v35[1] = 3221225472;
      v35[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_13;
      v35[3] = &unk_1E8EA2658;
      objc_copyWeak(&v36, location);
      -[UIApplicationSceneClientSettingsDiffInspector observeStatusBarAlphaWithBlock:](v17, "observeStatusBarAlphaWithBlock:", v35);
      v18 = self->_appClientSettingsDiffInspector;
      v19 = v15;
      v33[0] = v15;
      v33[1] = 3221225472;
      v33[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_18;
      v33[3] = &unk_1E8EA2658;
      objc_copyWeak(&v34, location);
      -[UIApplicationSceneClientSettingsDiffInspector observeStatusBarHiddenWithBlock:](v18, "observeStatusBarHiddenWithBlock:", v33);
      v20 = self->_appClientSettingsDiffInspector;
      v31[0] = v19;
      v31[1] = 3221225472;
      v31[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_23;
      v31[3] = &unk_1E8EA2658;
      objc_copyWeak(&v32, location);
      -[UIApplicationSceneClientSettingsDiffInspector observeInterfaceOrientationWithBlock:](v20, "observeInterfaceOrientationWithBlock:", v31);
      objc_destroyWeak(&v32);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v40);
      objc_destroyWeak(location);
      appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
    }
    objc_msgSend(v9, "evaluateWithInspector:context:", appClientSettingsDiffInspector, v10, v28);
    if (!self->_hasAttemptedInCallSceneClientSettingsDiffInspectorCreation)
    {
      self->_hasAttemptedInCallSceneClientSettingsDiffInspectorCreation = 1;
      objc_msgSend(v8, "sceneIfExists");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "clientSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v24 = (SBSUIInCallSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0DAC4D0]);
        inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
        self->_inCallSceneClientSettingsDiffInspector = v24;

        objc_initWeak(location, self);
        v26 = self->_inCallSceneClientSettingsDiffInspector;
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_29;
        v29[3] = &unk_1E8EA2658;
        objc_copyWeak(&v30, location);
        -[SBSUIInCallSceneClientSettingsDiffInspector observePreferredStatusBarStyleOverridesToSuppressWithBlock:](v26, "observePreferredStatusBarStyleOverridesToSuppressWithBlock:", v29);
        objc_destroyWeak(&v30);
        objc_destroyWeak(location);
      }
    }
    v27 = self->_inCallSceneClientSettingsDiffInspector;
    if (v27)
      objc_msgSend(v9, "evaluateWithInspector:context:", v27, v10);
  }

}

- (void)_handleStatusBarBackgroundActivitiesToSuppressUpdate
{
  SBDeviceApplicationSceneStatusBarStateProvider *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  -[SBDeviceApplicationSceneStatusBarStateProvider statusBarSceneIdentifier](v2, "statusBarSceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneStatusBarStateProvider backgroundActivitiesToSuppress](v2, "backgroundActivitiesToSuppress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogAppStatusBars();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    STBackgroundActivityIdentifiersDescription();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v13 = v3;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v8;
    _os_log_debug_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEBUG, "(%@) %@ backgroundActivitiesToSuppress scene setting changed to %@ ", buf, 0x20u);

  }
  if (-[SBDeviceApplicationSceneStatusBarStateProvider _anyObserverWants:](v2, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeBackgroundActivitiesToSuppressTo_))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __102__SBDeviceApplicationSceneStatusBarStateProvider__handleStatusBarBackgroundActivitiesToSuppressUpdate__block_invoke;
    v9[3] = &unk_1E8EA2720;
    v10 = v3;
    v11 = v4;
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base enumerateObserversWithBlock:](v2, "enumerateObserversWithBlock:", v9);

  }
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_18(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  char v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "statusBarSceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "statusBarHidden");
  SBLogAppStatusBars();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v13 = v4;
    v14 = 2112;
    v15 = (id)objc_opt_class();
    v16 = 1024;
    v17 = v5;
    v7 = v15;
    _os_log_debug_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarHidden scene client setting changed to %{BOOL}u", buf, 0x1Cu);

  }
  if (objc_msgSend(v3, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarHiddenTo_withAnimation_))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_21;
    v8[3] = &unk_1E8EA26D0;
    v10 = a2;
    v8[4] = v3;
    v9 = v4;
    v11 = v5;
    objc_msgSend(v3, "_performUpdateWith:actions:", a2, v8);

  }
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_11(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_12;
  v3[3] = &unk_1E8EA2680;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateObserversWithBlock:", v3);

}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "statusBarSceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarPartStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogAppStatusBars();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v12 = v4;
    v13 = 2112;
    v14 = (id)objc_opt_class();
    v15 = 2112;
    v16 = v5;
    v7 = v14;
    _os_log_debug_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarPartStyles scene client setting changed to %@", buf, 0x20u);

  }
  if (objc_msgSend(v3, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarStyleTo_forPartWithIdentifier_))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_11;
    v8[3] = &unk_1E8E9E270;
    v8[4] = v3;
    v9 = v3;
    v10 = v4;
    objc_msgSend(v9, "_performUpdateWith:actions:", a2, v8);

  }
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "statusBarSceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "statusBarStyle");
  SBLogAppStatusBars();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    _SBStringFromStatusBarStyle(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v14 = v4;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    _os_log_debug_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarModernStyle scene client setting changed to %@", buf, 0x20u);

  }
  if (objc_msgSend(v3, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarStyleTo_))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_6;
    v10[3] = &unk_1E8EA0AF0;
    v10[4] = v3;
    v11 = v4;
    v12 = v5;
    objc_msgSend(v3, "_performUpdateWith:actions:", a2, v10);

  }
}

- (id)statusBarSceneIdentifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_anyObserverWants:(SEL)a3
{
  return 1;
}

- (void)_performUpdateWith:(id)a3 actions:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void (**)(_QWORD))a4;
  objc_msgSend(v10, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:timingFunction:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsAdditiveAnimations:", 1);
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:actions:", v8, v5);

  }
  else if (v5)
  {
    v5[2](v5);
  }
  objc_msgSend(v10, "animationFence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawingWithFence:", v9);

}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2;
  v5[3] = &unk_1E8EA2630;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObserversWithBlock:", v5);

}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_21(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  char v12;

  v2 = *(id *)(a1 + 48);
  if (objc_msgSend(v2, "isUISubclass"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "statusBarAnimation");
  else
    v6 = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_22;
  v9[3] = &unk_1E8EA26A8;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v12 = *(_BYTE *)(a1 + 56);
  v10 = v8;
  v11 = v6;
  objc_msgSend(v7, "enumerateObserversWithBlock:", v9);

}

- (id)_initWithSceneHandle:(id)a3
{
  id v4;
  SBDeviceApplicationSceneStatusBarStateProvider *v5;
  SBDeviceApplicationSceneStatusBarStateProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationSceneStatusBarStateProvider;
  v5 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sceneHandle, v4);
    objc_msgSend(v4, "addObserver:", v6);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SBDeviceApplicationSceneStatusBarStateProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneStatusBarStateProvider;
  -[SBDeviceApplicationSceneStatusBarStateProvider dealloc](&v3, sel_dealloc);
}

- (void)invalidateStatusBarSettings
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[SBDeviceApplicationSceneStatusBarStateProvider statusBarSceneIdentifier](self, "statusBarSceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__SBDeviceApplicationSceneStatusBarStateProvider_invalidateStatusBarSettings__block_invoke;
  v5[3] = &unk_1E8EA2608;
  v6 = v3;
  v4 = v3;
  -[SBDeviceApplicationSceneStatusBarStateProvider_Base enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v5);

}

uint64_t __77__SBDeviceApplicationSceneStatusBarStateProvider_invalidateStatusBarSettings__block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x20) != 0)
    return objc_msgSend(a2, "didInvalidateStatusBarDescriptionForSceneWithIdentifier:", *(_QWORD *)(result + 32));
  return result;
}

- (void)invalidate
{
  id WeakRetained;

  -[UIApplicationSceneClientSettingsDiffInspector removeAllObservers](self->_appClientSettingsDiffInspector, "removeAllObservers");
  -[UIApplicationSceneSettingsDiffInspector removeAllObservers](self->_appSceneSettingsDiffInspector, "removeAllObservers");
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "removeObserver:", self);

}

- (CGRect)statusBarAvoidanceFrame
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "uiSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusBarAvoidanceFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)sceneWantsDeviceOrientationEventsEnabled
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  v3 = objc_msgSend(WeakRetained, "wantsDeviceOrientationEventsEnabled");

  return v3;
}

- (id)overlayStatusBarData
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "overlayStatusBarData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)breadcrumbProvider
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "breadcrumbProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)classicApplicationSceneHandleIfExists
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isClassic"))
    v4 = WeakRetained;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)sceneToHandleStatusBarTapIfExists
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandle);
  objc_msgSend(WeakRetained, "sceneIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_suppressInheritedPartStyles
{
  return 0;
}

- (BOOL)_statusBarAppearsOutsideOfAJailedAppCanChange
{
  int CanAppearOutside;
  BOOL v4;

  CanAppearOutside = -[SBDeviceApplicationSceneStatusBarStateProvider _statusBarCanAppearOutsideApp]((uint64_t)self);
  if (CanAppearOutside)
  {
    v4 = -[SBDeviceApplicationSceneStatusBarStateProvider _statusBarAppearsOutsideOfAJailedAppInOrientation:](self, "_statusBarAppearsOutsideOfAJailedAppInOrientation:", 1);
    LOBYTE(CanAppearOutside) = v4 ^ -[SBDeviceApplicationSceneStatusBarStateProvider _statusBarAppearsOutsideOfAJailedAppInOrientation:](self, "_statusBarAppearsOutsideOfAJailedAppInOrientation:", 4);
  }
  return CanAppearOutside;
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_13(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "statusBarSceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarAlpha");
  v6 = v5;
  SBLogAppStatusBars();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v13 = v4;
    v14 = 2112;
    v15 = (id)objc_opt_class();
    v16 = 2048;
    v17 = v6;
    v8 = v15;
    _os_log_debug_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarAlpha scene client setting changed to %f", buf, 0x20u);

  }
  if (objc_msgSend(v3, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarAlphaTo_))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_16;
    v9[3] = &unk_1E8EA0AF0;
    v9[4] = v3;
    v10 = v4;
    v11 = v6;
    objc_msgSend(v3, "_performUpdateWith:actions:", a2, v9);

  }
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_16(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_17;
  v3[3] = &unk_1E8EA2630;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "enumerateObserversWithBlock:", v3);

}

uint64_t __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_17(uint64_t result, void *a2, char a3)
{
  if ((a3 & 4) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarAlphaTo:", *(_QWORD *)(result + 32), *(double *)(result + 40));
  return result;
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_23(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "sceneWantsDeviceOrientationEventsEnabled"))
  {
    objc_msgSend(v4, "statusBarSceneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "statusBarOrientation");
    SBLogAppStatusBars();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      BSInterfaceOrientationDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v5;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      _os_log_debug_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEBUG, "(%@) %@ interfaceOrientation scene client setting changed to %@", buf, 0x20u);

    }
    if (objc_msgSend(v4, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarOrientationTo_))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_26;
      v11[3] = &unk_1E8EA0AF0;
      v11[4] = v4;
      v12 = v5;
      v13 = v6;
      objc_msgSend(v4, "_performUpdateWith:actions:", a2, v11);

    }
  }

}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_26(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_27;
  v5[3] = &unk_1E8EA2630;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObserversWithBlock:", v5);

}

uint64_t __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_2_27(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x10) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarOrientationTo:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

void __112__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke_3_29(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleStatusBarBackgroundActivitiesToSuppressUpdate");

}

void __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "statusBarSceneIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "statusBarOrientation");
  v4 = objc_msgSend(v1, "sceneWantsDeviceOrientationEventsEnabled");
  SBLogAppStatusBars();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    BSInterfaceOrientationDescription();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v21 = v2;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v10;
    v26 = 1024;
    v27 = v4;
    _os_log_debug_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEBUG, "(%@) %@ interfaceOrientation scene setting changed to %@ (wantsDeviceOrientationEventsEnabled: %{BOOL}u)", buf, 0x26u);

  }
  if (objc_msgSend(v1, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeSceneInterfaceOrientationTo_))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_33;
    v17[3] = &unk_1E8EA2630;
    v18 = v2;
    v19 = v3;
    objc_msgSend(v1, "enumerateObserversWithBlock:", v17);

  }
  if (objc_msgSend(v1, "_statusBarAppearsOutsideOfAJailedAppCanChange"))
  {
    v6 = objc_msgSend(v1, "statusBarStyle");
    SBLogAppStatusBars();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      _SBStringFromStatusBarStyle(v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v2;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v13;
      _os_log_debug_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarModernStyle changed via rotation of a classic app to %@", buf, 0x20u);

    }
    if (objc_msgSend(v1, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarStyleTo_))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_34;
      v14[3] = &unk_1E8EA2630;
      v15 = v2;
      v16 = v6;
      objc_msgSend(v1, "enumerateObserversWithBlock:", v14);

    }
  }

}

uint64_t __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_33(uint64_t result, void *a2, __int16 a3)
{
  if ((a3 & 0x100) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeSceneInterfaceOrientationTo:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

uint64_t __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_34(uint64_t result, void *a2, char a3)
{
  if ((a3 & 1) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarStyleTo:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

void __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2(uint64_t a1)
{
  id v1;
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  CGRect v28;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "statusBarSceneIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "statusBarAvoidanceFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  SBLogAppStatusBars();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    NSStringFromCGRect(v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v2;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v14;
    _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "(%@) %@ statusBarAvoidanceFrame scene setting changed to %@", buf, 0x20u);

  }
  if (objc_msgSend(v1, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarAvoidanceFrameTo_))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_37;
    v15[3] = &unk_1E8EA26F8;
    v16 = v2;
    v17 = v4;
    v18 = v6;
    v19 = v8;
    v20 = v10;
    objc_msgSend(v1, "enumerateObserversWithBlock:", v15);

  }
}

uint64_t __105__SBDeviceApplicationSceneStatusBarStateProvider_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_37(uint64_t result, void *a2, char a3)
{
  if (a3 < 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarAvoidanceFrameTo:", *(_QWORD *)(result + 32), *(double *)(result + 40), *(double *)(result + 48), *(double *)(result + 56), *(double *)(result + 64));
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneHandle);
  objc_storeStrong((id *)&self->_inCallSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_appSceneSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
}

uint64_t __79__SBDeviceApplicationSceneStatusBarStateProvider_Base_removeStatusBarObserver___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __68__SBDeviceApplicationSceneStatusBarStateProvider_Base__allObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "observer");
}

void __93__SBDeviceApplicationSceneStatusBarStateProvider_Base_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  _SBAppendDescrptionForStatusBarDescribingToBuilder(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

@end
