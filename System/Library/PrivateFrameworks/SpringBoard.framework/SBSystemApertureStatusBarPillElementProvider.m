@implementation SBSystemApertureStatusBarPillElementProvider

- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ updated background activities to suppress"), a4, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededForReason:](self, "_updateActiveElementIfNeededForReason:", v5);

}

- (void)_updateActiveElementIfNeededWithLayoutState:(id)a3 reason:(id)a4 notifyingObserversIfNecessary:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void (**v44)(_QWORD);
  void *v45;
  void *v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  _QWORD v57[5];
  void (**v58)(_QWORD);
  _QWORD v59[5];
  id v60;
  id v61;
  BOOL v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v5 = a5;
  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededWithLayoutState:reason:notifyingObserversIfNecessary:]");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("SBSystemApertureStatusBarPillElementProvider.m"), 332, CFSTR("this call must be made on the main thread"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_observedSceneHandle);
  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isUILocked"))
    v12 = objc_msgSend(v11, "isUIUnlocking") ^ 1;
  else
    v12 = 0;
  v54 = v9;
  v55 = v8;
  v52 = v11;
  v53 = WeakRetained;
  v51 = v5;
  if (objc_msgSend(v8, "unlockedEnvironmentMode") != 3 || (v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v12;
    objc_msgSend(WeakRetained, "statusBarStateProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeStatusBarObserver:", self);

    -[SBSystemApertureStatusBarPillElementProvider setObservedSceneHandle:](self, "setObservedSceneHandle:", 0);
  }
  else
  {
    objc_msgSend(v8, "elementWithRole:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "workspaceEntity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceApplicationSceneEntity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "sceneHandle");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (WeakRetained != v16)
    {
      objc_msgSend(WeakRetained, "statusBarStateProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeStatusBarObserver:", self);

      objc_msgSend(v16, "statusBarStateProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addStatusBarObserver:", self);

      -[SBSystemApertureStatusBarPillElementProvider setObservedSceneHandle:](self, "setObservedSceneHandle:", v16);
    }
    objc_msgSend(v16, "backgroundActivitiesToSuppress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
  }
  v22 = objc_loadWeakRetained((id *)&self->_statusBarAssertionManager);
  objc_msgSend(v22, "currentStatusBarSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "backgroundActivitiesToSuppress");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v19;
  objc_msgSend(v19, "setByAddingObjectsFromSet:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v25;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[SBSystemApertureStatusBarPillElementProvider suppressionAssertions](self, "suppressionAssertions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  v30 = v26;
  if (v29)
  {
    v31 = v29;
    v32 = *(_QWORD *)v64;
    v30 = v26;
    do
    {
      v33 = 0;
      v34 = v30;
      do
      {
        if (*(_QWORD *)v64 != v32)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v33), "backgroundActivitiesToSuppress");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setByAddingObjectsFromSet:", v35);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        ++v33;
        v34 = v30;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v31);
  }

  if (-[SBSystemApertureSettings hideRemotePrototypingFallbackPill](self->_settings, "hideRemotePrototypingFallbackPill"))
  {
    objc_msgSend(v30, "setByAddingObject:", *MEMORY[0x1E0DB0B28]);
    v36 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v36;
  }
  v37 = (void *)-[NSSet mutableCopy](self->_currentBackgroundActivityIdentifiers, "mutableCopy");
  objc_msgSend(v37, "minusSet:", v30);
  objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "resolvedBackgroundActivityFromBackgroundActivities:inPrecedenceScope:", v37, v20);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureStatusBarPillElementProvider resolvedBackgroundActivityIdentifier](self, "resolvedBackgroundActivityIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualStrings() & 1) != 0)
  {
    v41 = v50;
    if (v51)
    {
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_3;
      v56[3] = &unk_1E8EB5938;
      v56[4] = self;
      -[SBSystemApertureStatusBarPillElementProvider _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_statusBarBackgroundActivityDidChangeWithoutUpdateFromProvider_, v56);
    }
  }
  else
  {
    -[SBSystemApertureStatusBarPillElementProvider setResolvedBackgroundActivityIdentifier:](self, "setResolvedBackgroundActivityIdentifier:", v39);
    v42 = MEMORY[0x1E0C809B0];
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke;
    v59[3] = &unk_1E8E9F2A8;
    v59[4] = self;
    v43 = v39;
    v60 = v43;
    v61 = v54;
    v62 = v51;
    v44 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v59);
    if (v43
      && !-[SBSystemApertureStatusBarPillElementProvider _managesDedicatedElementForBackgroundActivityIdentifier:](self, "_managesDedicatedElementForBackgroundActivityIdentifier:", v43))
    {
      v45 = (void *)MEMORY[0x1E0C99E88];
      v57[0] = v42;
      v57[1] = 3221225472;
      v57[2] = __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_2;
      v57[3] = &unk_1E8EA0EE0;
      v57[4] = self;
      v58 = v44;
      objc_msgSend(v45, "scheduledTimerWithTimeInterval:repeats:block:", 0, v57, 0.75);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureStatusBarPillElementProvider setApplyOverridesDebounceTimer:](self, "setApplyOverridesDebounceTimer:", v46);

    }
    else
    {
      v44[2](v44);
    }
    v47 = -[SBSystemApertureStatusBarPillElementProvider _managesDedicatedElementForBackgroundActivityIdentifier:](self, "_managesDedicatedElementForBackgroundActivityIdentifier:", v43);
    v41 = v50;
    if (v47
      || -[SBSystemApertureStatusBarPillElementProvider _managesDedicatedElementForBackgroundActivityIdentifier:](self, "_managesDedicatedElementForBackgroundActivityIdentifier:", v40))
    {
      -[SBSystemApertureStatusBarPillElementProvider _updateNowRecordingAndNowLocatingElementsWithReason:](self, "_updateNowRecordingAndNowLocatingElementsWithReason:", CFSTR("overrides changed"));
    }

  }
}

- (NSString)resolvedBackgroundActivityIdentifier
{
  return self->_resolvedBackgroundActivityIdentifier;
}

- (NSHashTable)suppressionAssertions
{
  return self->_suppressionAssertions;
}

- (void)setObservedSceneHandle:(id)a3
{
  objc_storeWeak((id *)&self->_observedSceneHandle, a3);
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = objc_opt_class();
  objc_msgSend(v5, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededWithLayoutState:reason:](self, "_updateActiveElementIfNeededWithLayoutState:reason:", v8, CFSTR("layoutStateTransitionDidEnd"));
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = objc_opt_class();
  objc_msgSend(v5, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededWithLayoutState:reason:](self, "_updateActiveElementIfNeededWithLayoutState:reason:", v8, CFSTR("layoutStateTransitionDidBegin"));
}

- (void)_updateActiveElementIfNeededWithLayoutState:(id)a3 reason:(id)a4
{
  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededWithLayoutState:reason:notifyingObserversIfNecessary:](self, "_updateActiveElementIfNeededWithLayoutState:reason:notifyingObserversIfNecessary:", a3, a4, 0);
}

- (void)_updateActiveElementIfNeededForReason:(id)a3
{
  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededForReason:notifyingObserversIfNecessary:](self, "_updateActiveElementIfNeededForReason:notifyingObserversIfNecessary:", a3, 0);
}

- (void)statusBarAssertionManager:(id)a3 statusBarSettingsDidChange:(id)a4
{
  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededForReason:](self, "_updateActiveElementIfNeededForReason:", CFSTR("Status bar settings changed"), a4);
}

- (void)statusBarAssertionManager:(id)a3 addStatusBarSettingsAssertion:(id)a4
{
  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededForReason:](self, "_updateActiveElementIfNeededForReason:", CFSTR("Added status bar settings assertion"), a4);
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = objc_opt_class();
  objc_msgSend(v5, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededWithLayoutState:reason:](self, "_updateActiveElementIfNeededWithLayoutState:reason:", v8, CFSTR("layoutStateTransitionWillEnd"));
}

- (void)_updateActiveElementIfNeededForReason:(id)a3 notifyingObserversIfNecessary:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a4;
  v19 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededForReason:notifyingObserversIfNecessary:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("SBSystemApertureStatusBarPillElementProvider.m"), 317, CFSTR("this call must be made on the main thread"));

  }
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_layoutStateTransitionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isTransitioning");

  if (v9)
  {
    v10 = objc_opt_class();
    objc_msgSend(v6, "_layoutStateTransitionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transitionContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "toLayoutState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v15 = v14;
    else
      v15 = v7;
    v16 = v15;

    v7 = v16;
  }
  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededWithLayoutState:reason:notifyingObserversIfNecessary:](self, "_updateActiveElementIfNeededWithLayoutState:reason:notifyingObserversIfNecessary:", v7, v19, v4);

}

- (void)_nowRecordingAppDidChange
{
  -[SBSystemApertureStatusBarPillElementProvider _updateNowRecordingElementWithReason:](self, "_updateNowRecordingElementWithReason:", CFSTR("now recording apps did change"));
}

- (void)_updateNowRecordingElementWithReason:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  SBSystemApertureStatusBarPillElement *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend((id)SBApp, "audioRecordingManager", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nowRecordingApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0DB0BA0];
  -[SBSystemApertureStatusBarPillElementProvider resolvedBackgroundActivityIdentifier](self, "resolvedBackgroundActivityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7
    || -[NSMutableSet containsObject:](self->_applicationsWithActiveElements, "containsObject:", v4))
  {

    v4 = 0;
  }
  -[SBSystemApertureStatusBarPillElementProvider _nowRecordingElement](self, "_nowRecordingElement");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (SBSystemApertureStatusBarPillElement *)v8;
  if (v4)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureStatusBarPillElement setAssociatedApplications:](v9, "setAssociatedApplications:", v10);

    }
    else
    {
      v9 = -[SBSystemApertureStatusBarPillElement initWithBackgroundActivityIdentifier:]([SBSystemApertureStatusBarPillElement alloc], "initWithBackgroundActivityIdentifier:", v5);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureStatusBarPillElement setAssociatedApplications:](v9, "setAssociatedApplications:", v11);

      -[SBSystemApertureStatusBarPillElementProvider _registerElement:](self, "_registerElement:", v9);
    }
  }
  else
  {
    -[SBSystemApertureStatusBarPillElementProvider _invalidateElement:withReason:](self, "_invalidateElement:withReason:", v8, CFSTR("now recording app did change"));
  }

}

- (SBSystemApertureStatusBarPillElement)_nowRecordingElement
{
  return (SBSystemApertureStatusBarPillElement *)-[NSMutableSet bs_firstObjectPassingTest:](self->__registeredElements, "bs_firstObjectPassingTest:", &__block_literal_global_73);
}

- (void)_invalidateElement:(id)a3 withReason:(id)a4
{
  id v6;
  void *v7;
  NSMutableSet *registeredElements;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    objc_msgSend(v9, "clientStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateWithReason:", v6);

    -[NSMutableSet removeObject:](self->__registeredElements, "removeObject:", v9);
    if (!-[NSMutableSet count](self->__registeredElements, "count"))
    {
      registeredElements = self->__registeredElements;
      self->__registeredElements = 0;

    }
  }

}

- (SBSystemApertureStatusBarPillElementProvider)init
{
  uint64_t v4;
  void *v5;
  SBSystemApertureStatusBarPillElementProvider *v6;
  uint64_t v7;
  UIStatusBarServer *statusBarServer;
  void *v9;
  void *v10;
  uint64_t v11;
  SBSystemApertureSettings *settings;
  uint64_t v13;
  NSHashTable *observers;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableSet *applicationsWithActiveElements;
  objc_super v20;

  v4 = SBFEffectiveArtworkSubtype();
  if (v4 > 2795)
  {
    if (v4 != 2796 && v4 != 2868)
      goto LABEL_7;
  }
  else if (v4 != 2556 && v4 != 2622)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureStatusBarPillElementProvider.m"), 89, CFSTR("Nope. You cannot do this without being on a Jindo device."));

  }
  v20.receiver = self;
  v20.super_class = (Class)SBSystemApertureStatusBarPillElementProvider;
  v6 = -[SBSystemApertureStatusBarPillElementProvider init](&v20, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA00]), "initWithStatusBar:", 0);
    statusBarServer = v6->__statusBarServer;
    v6->__statusBarServer = (UIStatusBarServer *)v7;

    +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay](SBWindowSceneStatusBarManager, "windowSceneStatusBarManagerForEmbeddedDisplay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assertionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_statusBarAssertionManager, v10);

    +[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings");
    v11 = objc_claimAutoreleasedReturnValue();
    settings = v6->_settings;
    v6->_settings = (SBSystemApertureSettings *)v11;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v13 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v6, sel__nowLocatingAppsDidChange, CFSTR("SBNowLocatingAppsDidChangeNotification"), SBApp);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v6, sel__nowRecordingAppDidChange, CFSTR("SBNowRecordingAppDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    applicationsWithActiveElements = v6->_applicationsWithActiveElements;
    v6->_applicationsWithActiveElements = (NSMutableSet *)v17;

  }
  return v6;
}

- (void)activateWithRegistrar:(id)a3
{
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a3;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSystemApertureStatusBarPillElementProvider activateWithRegistrar:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SBSystemApertureStatusBarPillElementProvider.m"), 103, CFSTR("this call must be made on the main thread"));

  }
  if (-[SBSystemApertureStatusBarPillElementProvider isActivated](self, "isActivated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureStatusBarPillElementProvider.m"), 104, CFSTR("Must invalidate before reactivation"));

  }
  -[SBSystemApertureStatusBarPillElementProvider setActivated:](self, "setActivated:", 1);
  -[SBSystemApertureStatusBarPillElementProvider setElementRegistrar:](self, "setElementRegistrar:", v6);

  -[UIStatusBarServer setStatusBar:](self->__statusBarServer, "setStatusBar:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarAssertionManager);
  objc_msgSend(WeakRetained, "addObserver:", self);

  if (SBStatusBarIsSpeakeasy())
  {
    objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addBackgroundActivityClient:", self);

  }
  else
  {
    -[SBSystemApertureStatusBarPillElementProvider _updateCurrentBackgroundActivityIdentifiersWithStatusBarOverrides:](self, "_updateCurrentBackgroundActivityIdentifiersWithStatusBarOverrides:", objc_msgSend(MEMORY[0x1E0CEAA00], "getStyleOverrides"));
  }
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_layoutStateTransitionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__lockStateChanged, *MEMORY[0x1E0DAC318], 0);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_observers;
    objc_sync_enter(v5);
    -[NSHashTable addObject:](self->_observers, "addObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSHashTable *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_observers;
    objc_sync_enter(v5);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (id)acquireSuppressionAssertionForBackgroundActivities:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  _SBSystemApertureBackgroundActivitySuppressionAssertion *v8;
  id v9;
  _SBSystemApertureBackgroundActivitySuppressionAssertion *v10;
  NSHashTable *v11;
  NSHashTable *suppressionAssertions;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = [_SBSystemApertureBackgroundActivitySuppressionAssertion alloc];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __106__SBSystemApertureStatusBarPillElementProvider_acquireSuppressionAssertionForBackgroundActivities_reason___block_invoke;
  v19 = &unk_1E8EA4CC0;
  objc_copyWeak(&v21, &location);
  v9 = v7;
  v20 = v9;
  v10 = -[_SBSystemApertureBackgroundActivitySuppressionAssertion initWithIdentifier:forReason:backgroundActivitiesToSuppress:invalidationBlock:](v8, "initWithIdentifier:forReason:backgroundActivitiesToSuppress:invalidationBlock:", CFSTR("_SBSystemApertureStatusBarPillSuppressionAssertion"), v9, v6, &v16);
  if (!self->_suppressionAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    suppressionAssertions = self->_suppressionAssertions;
    self->_suppressionAssertions = v11;

  }
  -[SBSystemApertureStatusBarPillElementProvider suppressionAssertions](self, "suppressionAssertions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Added assertion for %@"), v9, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededForReason:](self, "_updateActiveElementIfNeededForReason:", v14);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v10;
}

void __106__SBSystemApertureStatusBarPillElementProvider_acquireSuppressionAssertionForBackgroundActivities_reason___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "suppressionAssertions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v10);

    objc_msgSend(v4, "suppressionAssertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      v8 = (void *)v4[8];
      v4[8] = 0;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalidated assertion for %@"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateActiveElementIfNeededForReason:", v9);

  }
}

- (id)acquireActiveElementAssertionForApplication:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *assertionsForApplicationsWithActiveElements;
  _SBSystemApertureBackgroundActivitySuppressionActiveApplicationAssertion *v10;
  void *v11;
  id v12;
  _SBSystemApertureBackgroundActivitySuppressionActiveApplicationAssertion *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[NSMutableSet addObject:](self->_applicationsWithActiveElements, "addObject:", v6);
    if (!self->_assertionsForApplicationsWithActiveElements)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      assertionsForApplicationsWithActiveElements = self->_assertionsForApplicationsWithActiveElements;
      self->_assertionsForApplicationsWithActiveElements = v8;

    }
    objc_initWeak(&location, self);
    v10 = [_SBSystemApertureBackgroundActivitySuppressionActiveApplicationAssertion alloc];
    objc_msgSend(v6, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __99__SBSystemApertureStatusBarPillElementProvider_acquireActiveElementAssertionForApplication_reason___block_invoke;
    v15[3] = &unk_1E8EA4CC0;
    objc_copyWeak(&v17, &location);
    v12 = v7;
    v16 = v12;
    v13 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:](v10, "initWithIdentifier:forReason:invalidationBlock:", v11, CFSTR("client request"), v15);

    -[_SBSystemApertureBackgroundActivitySuppressionActiveApplicationAssertion setApplication:](v13, "setApplication:", v6);
    -[NSMutableSet addObject:](self->_assertionsForApplicationsWithActiveElements, "addObject:", v13);
    -[SBSystemApertureStatusBarPillElementProvider _updateNowRecordingAndNowLocatingElementsWithReason:](self, "_updateNowRecordingAndNowLocatingElementsWithReason:", v12);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __99__SBSystemApertureStatusBarPillElementProvider_acquireActiveElementAssertionForApplication_reason___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[10], "removeObject:", v11);
    v5 = objc_msgSend(v4[10], "count");
    v6 = v4[10];
    if (v5)
    {
      objc_msgSend(v6, "bs_compactMap:", &__block_literal_global_239);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "mutableCopy");
      v9 = v4[9];
      v4[9] = (id)v8;

    }
    else
    {
      v4[10] = 0;

      objc_msgSend(v4[9], "removeAllObjects");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalidated assertion %@"), *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateNowRecordingAndNowLocatingElementsWithReason:", v10);

  }
}

uint64_t __99__SBSystemApertureStatusBarPillElementProvider_acquireActiveElementAssertionForApplication_reason___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "application");
}

- (void)invalidate
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSystemApertureStatusBarPillElementProvider invalidate]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("SBSystemApertureStatusBarPillElementProvider.m"), 191, CFSTR("this call must be made on the main thread"));

  }
  if (!-[SBSystemApertureStatusBarPillElementProvider isActivated](self, "isActivated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureStatusBarPillElementProvider.m"), 192, CFSTR("Invalidating an inactive provider."));

  }
  -[SBSystemApertureStatusBarPillElementProvider setActivated:](self, "setActivated:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarAssertionManager);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeBackgroundActivityClient:", self);

  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_layoutStateTransitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (void *)-[NSMutableSet copy](self->__registeredElements, "copy", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[SBSystemApertureStatusBarPillElementProvider _invalidateElement:withReason:](self, "_invalidateElement:withReason:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13++), CFSTR("SBSystemApertureStatusBarPillElementProvider invalidated"));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (-[SBSystemApertureStatusBarPillElementProvider isActivated](self, "isActivated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureStatusBarPillElementProvider.m"), 206, CFSTR("Deallocated %@ without first invalidating it."), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)SBSystemApertureStatusBarPillElementProvider;
  -[SBSystemApertureStatusBarPillElementProvider dealloc](&v5, sel_dealloc);
}

- (void)_updateNowRecordingAndNowLocatingElementsWithReason:(id)a3
{
  id v4;

  v4 = a3;
  -[SBSystemApertureStatusBarPillElementProvider _updateNowRecordingElementWithReason:](self, "_updateNowRecordingElementWithReason:", v4);
  -[SBSystemApertureStatusBarPillElementProvider _updateNowLocatingElementWithReason:](self, "_updateNowLocatingElementWithReason:", v4);

}

- (void)_nowLocatingAppsDidChange
{
  -[SBSystemApertureStatusBarPillElementProvider _updateNowLocatingElementWithReason:](self, "_updateNowLocatingElementWithReason:", CFSTR("now locating apps did change"));
}

- (void)_updateNowLocatingElementWithReason:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SBSystemApertureStatusBarPillElement *v8;
  SBSystemApertureStatusBarPillElement *v9;
  id v10;

  v10 = a3;
  objc_msgSend((id)SBApp, "nowLocatingApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend((id)SBApp, "nowLocatingApps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v7, "minusSet:", self->_applicationsWithActiveElements);
  -[SBSystemApertureStatusBarPillElementProvider _nowLocatingElement](self, "_nowLocatingElement");
  v8 = (SBSystemApertureStatusBarPillElement *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if (v8)
    {
      -[SBSystemApertureStatusBarPillElement setAssociatedApplications:](v8, "setAssociatedApplications:", v7);
    }
    else
    {
      v9 = [SBSystemApertureStatusBarPillElement alloc];
      v8 = -[SBSystemApertureStatusBarPillElement initWithBackgroundActivityIdentifier:](v9, "initWithBackgroundActivityIdentifier:", *MEMORY[0x1E0DB0AF0]);
      -[SBSystemApertureStatusBarPillElement setAssociatedApplications:](v8, "setAssociatedApplications:", v7);
      -[SBSystemApertureStatusBarPillElementProvider _registerElement:](self, "_registerElement:", v8);
    }
  }
  else
  {
    -[SBSystemApertureStatusBarPillElementProvider _invalidateElement:withReason:](self, "_invalidateElement:withReason:", v8, v10);
  }

}

- (void)_registerElement:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *registeredElements;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id WeakRetained;
  void *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    objc_msgSend(v4, "clientStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v11;
    if (!v5)
    {
      registeredElements = self->__registeredElements;
      if (!registeredElements)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        v8 = self->__registeredElements;
        self->__registeredElements = v7;

        registeredElements = self->__registeredElements;
      }
      -[NSMutableSet addObject:](registeredElements, "addObject:", v11);
      WeakRetained = objc_loadWeakRetained((id *)&self->_elementRegistrar);
      objc_msgSend(WeakRetained, "registerElement:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClientStorage:", v10);

      v4 = v11;
    }
  }

}

- (SBSystemApertureStatusBarPillElement)_activeElement
{
  NSMutableSet *registeredElements;
  _QWORD v4[5];

  registeredElements = self->__registeredElements;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__SBSystemApertureStatusBarPillElementProvider__activeElement__block_invoke;
  v4[3] = &unk_1E8EB58B0;
  v4[4] = self;
  -[NSMutableSet bs_firstObjectPassingTest:](registeredElements, "bs_firstObjectPassingTest:", v4);
  return (SBSystemApertureStatusBarPillElement *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __62__SBSystemApertureStatusBarPillElementProvider__activeElement__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "representedBackgroundActivityIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_managesDedicatedElementForBackgroundActivityIdentifiers:", v3) ^ 1;

  return v4;
}

- (SBSystemApertureStatusBarPillElement)_nowLocatingElement
{
  return (SBSystemApertureStatusBarPillElement *)-[NSMutableSet bs_firstObjectPassingTest:](self->__registeredElements, "bs_firstObjectPassingTest:", &__block_literal_global_72_0);
}

uint64_t __67__SBSystemApertureStatusBarPillElementProvider__nowLocatingElement__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "representedBackgroundActivityIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0DB0AF0]);

  return v3;
}

uint64_t __68__SBSystemApertureStatusBarPillElementProvider__nowRecordingElement__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "representedBackgroundActivityIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0DB0BA0]);

  return v3;
}

- (void)_updateCurrentBackgroundActivityIdentifiersWithStatusBarOverrides:(unint64_t)a3
{
  id v4;

  if ((SBStatusBarIsSpeakeasy() & 1) == 0)
  {
    STUIBackgroundActivityIdentifiersForStyleOverrides();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureStatusBarPillElementProvider setCurrentBackgroundActivityIdentifiers:](self, "setCurrentBackgroundActivityIdentifiers:", v4);

  }
}

- (void)setCurrentBackgroundActivityIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *currentBackgroundActivityIdentifiers;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSystemApertureStatusBarPillElementProvider setCurrentBackgroundActivityIdentifiers:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBSystemApertureStatusBarPillElementProvider.m"), 309, CFSTR("this call must be made on the main thread"));

  }
  if ((BSEqualSets() & 1) == 0)
  {
    v4 = (NSSet *)objc_msgSend(v8, "copy");
    currentBackgroundActivityIdentifiers = self->_currentBackgroundActivityIdentifiers;
    self->_currentBackgroundActivityIdentifiers = v4;

    -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededForReason:notifyingObserversIfNecessary:](self, "_updateActiveElementIfNeededForReason:notifyingObserversIfNecessary:", CFSTR("setCurrentStyleOverrides"), 1);
  }

}

void __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBSystemApertureStatusBarPillElement *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_activeElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "representedBackgroundActivityIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v4 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_82;
      v15[3] = &unk_1E8EB5938;
      v15[4] = v4;
      objc_msgSend(v4, "_enumerateObserversRespondingToSelector:usingBlock:", sel_statusBarBackgroundActivityDidChangeWithoutUpdateFromProvider_, v15);
    }
  }
  else
  {
    STBackgroundActivityIdentifiersDescription();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    STBackgroundActivityIdentifierDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogSystemAperturePills();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v17 = v8;
      v18 = 2114;
      v19 = v5;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "updating active element for reason: %{public}@. Overrides changing from %{public}@ --> %{public}@", buf, 0x20u);
    }

    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updating from %@ to %@"), v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_invalidateElement:withReason:", v2, v10);

    v11 = *(void **)(a1 + 40);
    if (v11 && (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DB0AF0]) & 1) == 0)
    {
      v12 = *(void **)(a1 + 32);
      v13 = -[SBSystemApertureStatusBarPillElement initWithBackgroundActivityIdentifier:]([SBSystemApertureStatusBarPillElement alloc], "initWithBackgroundActivityIdentifier:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v12, "_registerElement:", v13);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "applyOverridesDebounceTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setApplyOverridesDebounceTimer:", 0);
}

uint64_t __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_82(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "statusBarBackgroundActivityDidChangeWithoutUpdateFromProvider:", *(_QWORD *)(a1 + 32));
}

void __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isValid"))
  {
    objc_msgSend(*(id *)(a1 + 32), "applyOverridesDebounceTimer");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if (v3 == v4)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __129__SBSystemApertureStatusBarPillElementProvider__updateActiveElementIfNeededWithLayoutState_reason_notifyingObserversIfNecessary___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "statusBarBackgroundActivityDidChangeWithoutUpdateFromProvider:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_managesDedicatedElementForBackgroundActivityIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend((id)*MEMORY[0x1E0DB0AF0], "isEqualToString:", v3) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend((id)*MEMORY[0x1E0DB0BA0], "isEqualToString:", v3);

  return v4;
}

- (BOOL)_managesDedicatedElementForBackgroundActivityIdentifiers:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0DB0AF0]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0DB0BA0]);

  return v4;
}

- (void)_lockStateChanged
{
  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededForReason:](self, "_updateActiveElementIfNeededForReason:", CFSTR("UILock State Changed"));
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  NSHashTable *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  if (v5)
  {
    v6 = self->_observers;
    objc_sync_enter(v6);
    v7 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    objc_sync_exit(v6);
  }

}

- (void)statusBarAssertionManager:(id)a3 removeStatusBarSettingsAssertion:(id)a4
{
  -[SBSystemApertureStatusBarPillElementProvider _updateActiveElementIfNeededForReason:](self, "_updateActiveElementIfNeededForReason:", CFSTR("Removed status bar settings assertion"), a4);
}

- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4
{
  BSDispatchMain();
}

uint64_t __89__SBSystemApertureStatusBarPillElementProvider_statusBarServer_didReceiveStyleOverrides___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentBackgroundActivityIdentifiersWithStatusBarOverrides:", *(_QWORD *)(a1 + 40));
}

- (void)activeBackgroundActivitiesDidUpdate:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

uint64_t __84__SBSystemApertureStatusBarPillElementProvider_activeBackgroundActivitiesDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentBackgroundActivityIdentifiers:", *(_QWORD *)(a1 + 40));
}

- (UIStatusBarServer)_statusBarServer
{
  return self->__statusBarServer;
}

- (SBSystemApertureController)elementRegistrar
{
  return (SBSystemApertureController *)objc_loadWeakRetained((id *)&self->_elementRegistrar);
}

- (void)setElementRegistrar:(id)a3
{
  objc_storeWeak((id *)&self->_elementRegistrar, a3);
}

- (SBWindowSceneStatusBarAssertionManager)statusBarAssertionManager
{
  return (SBWindowSceneStatusBarAssertionManager *)objc_loadWeakRetained((id *)&self->_statusBarAssertionManager);
}

- (void)setStatusBarAssertionManager:(id)a3
{
  objc_storeWeak((id *)&self->_statusBarAssertionManager, a3);
}

- (NSMutableSet)_registeredElements
{
  return self->__registeredElements;
}

- (void)set_registeredElements:(id)a3
{
  objc_storeStrong((id *)&self->__registeredElements, a3);
}

- (NSSet)currentBackgroundActivityIdentifiers
{
  return self->_currentBackgroundActivityIdentifiers;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (SBDeviceApplicationSceneHandle)observedSceneHandle
{
  return (SBDeviceApplicationSceneHandle *)objc_loadWeakRetained((id *)&self->_observedSceneHandle);
}

- (NSMutableSet)applicationsWithActiveElements
{
  return self->_applicationsWithActiveElements;
}

- (NSMutableSet)assertionsForApplicationsWithActiveElements
{
  return self->_assertionsForApplicationsWithActiveElements;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setResolvedBackgroundActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedBackgroundActivityIdentifier, a3);
}

- (NSTimer)applyOverridesDebounceTimer
{
  return self->_applyOverridesDebounceTimer;
}

- (void)setApplyOverridesDebounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_applyOverridesDebounceTimer, a3);
}

- (SBSystemApertureSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_applyOverridesDebounceTimer, 0);
  objc_storeStrong((id *)&self->_resolvedBackgroundActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_assertionsForApplicationsWithActiveElements, 0);
  objc_storeStrong((id *)&self->_applicationsWithActiveElements, 0);
  objc_storeStrong((id *)&self->_suppressionAssertions, 0);
  objc_destroyWeak((id *)&self->_observedSceneHandle);
  objc_storeStrong((id *)&self->_currentBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->__registeredElements, 0);
  objc_destroyWeak((id *)&self->_statusBarAssertionManager);
  objc_destroyWeak((id *)&self->_elementRegistrar);
  objc_storeStrong((id *)&self->__statusBarServer, 0);
}

@end
