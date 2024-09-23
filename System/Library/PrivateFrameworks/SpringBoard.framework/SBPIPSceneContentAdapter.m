@implementation SBPIPSceneContentAdapter

- (SBPIPSceneContentAdapter)initWithPIPContentType:(int64_t)a3 sceneManager:(id)a4
{
  id v7;
  SBPIPSceneContentAdapter *v8;
  SBPIPSceneContentAdapter *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBPIPSceneContentAdapter;
  v8 = -[SBPIPSceneContentAdapter init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_pipContentType = a3;
    objc_storeStrong((id *)&v8->_sceneManager, a4);
    -[SBSceneManager _layoutStateTransitionCoordinator](v9->_sceneManager, "_layoutStateTransitionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", v9);

    -[SBSceneManager(ChamoisDevelopmentShimming) currentLayoutState](v9->_sceneManager, "currentLayoutState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_effectiveEnvironmentMode = objc_msgSend(v11, "unlockedEnvironmentMode");

  }
  return v9;
}

- (int64_t)contentTypeForPIPController:(id)a3
{
  return self->_pipContentType;
}

- (BOOL)isStartingStoppingOrCancellingPictureInPictureForPIPController:(id)a3
{
  return 0;
}

- (BOOL)isPresentingPictureInPictureForPIPController:(id)a3 applicationBundleIdentifier:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  objc_msgSend(WeakRetained, "hostedAppSceneHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "application", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v5);

        if ((v14 & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)shouldStartPictureInPictureForPIPController:(id)a3 applicationWithProcessIdentifierEnteringBackground:(int)a4 scenePersistenceIdentifier:(id)a5
{
  return 0;
}

- (BOOL)isStoppingOrCancellingPictureForPIPController:(id)a3 applicationWithBundleIdentifier:(id)a4 scenePersistenceIdentifier:(id)a5
{
  return 0;
}

- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3
{
  return 0;
}

- (void)setPIPController:(id)a3
{
  SBPIPControllerAdapterContextProviding **p_pipController;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_pipController = &self->_pipController;
  WeakRetained = objc_loadWeakRetained((id *)p_pipController);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_pipController, obj);
    v6 = obj;
  }

}

- (void)pipController:(id)a3 didAddContainerViewController:(id)a4
{
  void *v5;
  NSMutableSet *trackedPIPBundleIdentifiers;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  objc_msgSend(v15, "hostedAppSceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    trackedPIPBundleIdentifiers = self->_trackedPIPBundleIdentifiers;
    if (!trackedPIPBundleIdentifiers)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v8 = self->_trackedPIPBundleIdentifiers;
      self->_trackedPIPBundleIdentifiers = v7;

      trackedPIPBundleIdentifiers = self->_trackedPIPBundleIdentifiers;
    }
    objc_msgSend(v5, "application");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](trackedPIPBundleIdentifiers, "addObject:", v10);

    -[SBPIPSceneContentAdapter _recalculateLevelAssertions](self, "_recalculateLevelAssertions");
    if (objc_msgSend(v15, "requiresMedusaKeyboard"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
      objc_msgSend(WeakRetained, "windowSceneManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activeDisplayWindowScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "medusaHostedKeyboardWindowController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateMedusaHostedKeyboardWindow");

    }
  }

}

- (void)pipController:(id)a3 willRemoveContainerViewController:(id)a4
{
  NSMutableSet *trackedPIPBundleIdentifiers;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a4, "hostedAppSceneHandle", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SBPIPSceneContentAdapter _recalculateLevelAssertions](self, "_recalculateLevelAssertions");
  trackedPIPBundleIdentifiers = self->_trackedPIPBundleIdentifiers;
  objc_msgSend(v10, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](trackedPIPBundleIdentifiers, "removeObject:", v7);

  objc_msgSend(v10, "sceneIfExists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "updateSettingsWithBlock:", &__block_literal_global_276);

}

uint64_t __76__SBPIPSceneContentAdapter_pipController_willRemoveContainerViewController___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", 0);
}

- (BOOL)pipController:(id)a3 willBeginPIPInterruptionForAssertion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;
  NSMutableSet *interruptingBundleIdentifiersSinceLastTransition;
  NSMutableSet *v32;
  NSMutableSet *v33;
  id v34;
  id obj;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "cameraSensorAttributionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager(ChamoisDevelopmentShimming) currentLayoutState](self->_sceneManager, "currentLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringForPIPBehaviorOverrideReason(1uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  v36 = v7;
  objc_msgSend(v7, "elementWithRole:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workspaceEntity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applicationSceneEntity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "application");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", v6);

  if ((v10 & 1) != 0)
  {
    if (v16)
    {
      SBLogPIP();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        _SBFLoggingMethodProem();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v18;
        v44 = 2114;
        v45 = v5;
        v46 = 2114;
        v47 = v6;
        v19 = "%{public}@ NOT stashing PIP for interruption assertion: [%{public}@] bundleIdentifier[%{public}@], as it's"
              " within the floating app";
LABEL_23:
        _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0x20u);

      }
    }
    else if (-[NSMutableSet containsObject:](self->_interruptingBundleIdentifiersSinceLastTransition, "containsObject:", v6))
    {
      SBLogPIP();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        _SBFLoggingMethodProem();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v18;
        v44 = 2114;
        v45 = v5;
        v46 = 2114;
        v47 = v6;
        v19 = "%{public}@ NOT stashing PIP for interruption assertion: [%{public}@] bundleIdentifier[%{public}@], as we w"
              "ere asked about it before";
        goto LABEL_23;
      }
    }
    else if (-[NSMutableSet containsObject:](self->_trackedPIPBundleIdentifiers, "containsObject:", v6))
    {
      SBLogPIP();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        _SBFLoggingMethodProem();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v18;
        v44 = 2114;
        v45 = v5;
        v46 = 2114;
        v47 = v6;
        v19 = "%{public}@ NOT stashing PIP for interruption assertion: [%{public}@] bundleIdentifier[%{public}@], as it's within PIP";
        goto LABEL_23;
      }
    }
    else
    {
      v34 = v5;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v36, "elements");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "workspaceEntity");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "applicationSceneEntity");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "application");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "bundleIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqual:", v6);

            if ((v28 & 1) != 0)
            {

              interruptingBundleIdentifiersSinceLastTransition = self->_interruptingBundleIdentifiersSinceLastTransition;
              if (!interruptingBundleIdentifiersSinceLastTransition)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
                v32 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
                v33 = self->_interruptingBundleIdentifiersSinceLastTransition;
                self->_interruptingBundleIdentifiersSinceLastTransition = v32;

                interruptingBundleIdentifiersSinceLastTransition = self->_interruptingBundleIdentifiersSinceLastTransition;
              }
              -[NSMutableSet addObject:](interruptingBundleIdentifiersSinceLastTransition, "addObject:", v6);
              v29 = 1;
              v5 = v34;
              goto LABEL_25;
            }
          }
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v21)
            continue;
          break;
        }
      }

      SBLogPIP();
      v17 = objc_claimAutoreleasedReturnValue();
      v5 = v34;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        _SBFLoggingMethodProem();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v18;
        v44 = 2114;
        v45 = v34;
        v46 = 2114;
        v47 = v6;
        v19 = "%{public}@ NOT stashing PIP for interruption assertion: [%{public}@] bundleIdentifier[%{public}@], as it i"
              "sn't within the layout state or in PIP";
        goto LABEL_23;
      }
    }
  }
  else
  {
    SBLogPIP();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v18;
      v44 = 2114;
      v45 = v5;
      v46 = 2114;
      v47 = v6;
      v19 = "%{public}@ NOT stashing PIP for interruption assertion: [%{public}@] bundleIdentifier[%{public}@], because i"
            "t's not due to camera usage";
      goto LABEL_23;
    }
  }

  v29 = 0;
LABEL_25:

  return v29;
}

- (void)pipController:(id)a3 didUpdateEnhancedWindowingModeEnabled:(BOOL)a4 windowScene:(id)a5
{
  _BOOL8 v5;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  BOOL v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  v19 = v7;
  objc_msgSend(WeakRetained, "containerViewControllersOnWindowScene:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "hostedAppSceneHandle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "setWantsEnhancedWindowingEnabled:", v5);
          objc_msgSend(v16, "sceneIfExists");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            v20[0] = v13;
            v20[1] = 3221225472;
            v20[2] = __92__SBPIPSceneContentAdapter_pipController_didUpdateEnhancedWindowingModeEnabled_windowScene___block_invoke;
            v20[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
            v21 = v5;
            objc_msgSend(v17, "updateSettingsWithBlock:", v20);
          }

        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

}

void __92__SBPIPSceneContentAdapter_pipController_didUpdateEnhancedWindowingModeEnabled_windowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "setEnhancedWindowingEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableSet *interruptingBundleIdentifiersSinceLastTransition;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "toLayoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unlockedEnvironmentMode");
  if (self->_effectiveEnvironmentMode != v7)
  {
    self->_effectiveEnvironmentMode = v7;
    -[SBPIPSceneContentAdapter _recalculateLevelAssertions](self, "_recalculateLevelAssertions");
  }
  v22 = v5;
  objc_msgSend(v5, "fromLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_map:", &__block_literal_global_3_2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = v8;
  objc_msgSend(v8, "elements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v15, "layoutRole") != 2)
        {
          objc_msgSend(v15, "workspaceEntity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "applicationSceneEntity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "application");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v23, "containsObject:", v19) & 1) == 0)
          {
            -[NSMutableSet removeObject:](self->_interruptingBundleIdentifiersSinceLastTransition, "removeObject:", v19);
            if (!-[NSMutableSet count](self->_interruptingBundleIdentifiersSinceLastTransition, "count"))
            {
              interruptingBundleIdentifiersSinceLastTransition = self->_interruptingBundleIdentifiersSinceLastTransition;
              self->_interruptingBundleIdentifiersSinceLastTransition = 0;

            }
          }

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

}

id __99__SBPIPSceneContentAdapter_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  v3 = objc_msgSend(v2, "layoutRole");
  if (v3 == 1 || !SBLayoutRoleIsValidForSplitView(v3))
  {
    objc_msgSend(v2, "workspaceEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationSceneEntity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_recalculateLevelAssertions
{
  id WeakRetained;
  double v4;
  double v5;
  SBFloatingDockWindowLevelAssertion *v6;
  double v7;
  void *dockWindowLevelAssertion;
  SBFloatingDockWindowLevelAssertion *v9;
  SBFloatingDockWindowLevelAssertion *v10;
  id v11;

  -[SBMainDisplaySceneManager _windowScene](self->_sceneManager, "_windowScene");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  if (!objc_msgSend(WeakRetained, "isPictureInPictureWindowVisibleOnWindowScene:", v11)
    || self->_effectiveEnvironmentMode != 1)
  {
    -[SBFloatingDockWindowLevelAssertion invalidate](self->_dockWindowLevelAssertion, "invalidate");
    dockWindowLevelAssertion = self->_dockWindowLevelAssertion;
    self->_dockWindowLevelAssertion = 0;
    goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "windowLevelForWindowScene:", v11);
  v5 = v4 + -1.0;
  v6 = self->_dockWindowLevelAssertion;
  if (!v6)
  {
LABEL_6:
    -[SBFloatingDockWindowLevelAssertion invalidate](v6, "invalidate");
    objc_msgSend(v11, "floatingDockController");
    dockWindowLevelAssertion = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBFloatingDockWindowLevelAssertion initWithFloatingDockController:priority:level:reason:]([SBFloatingDockWindowLevelAssertion alloc], "initWithFloatingDockController:priority:level:reason:", dockWindowLevelAssertion, 3, CFSTR("SBSystemNotesContentViewController"), v5);
    v10 = self->_dockWindowLevelAssertion;
    self->_dockWindowLevelAssertion = v9;

LABEL_8:
    goto LABEL_9;
  }
  -[SBFloatingDockWindowLevelAssertion level](v6, "level");
  if (v7 != v5)
  {
    v6 = self->_dockWindowLevelAssertion;
    goto LABEL_6;
  }
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptingBundleIdentifiersSinceLastTransition, 0);
  objc_storeStrong((id *)&self->_dockWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_trackedPIPBundleIdentifiers, 0);
  objc_destroyWeak((id *)&self->_pipController);
}

@end
