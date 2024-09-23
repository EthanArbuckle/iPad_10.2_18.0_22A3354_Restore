@implementation SBTransientOverlayPresentationManager

- (id)transientOverlayPresenterForWindowScene:(id)a3
{
  return -[NSMapTable objectForKey:](self->_presentersByWindowScene, "objectForKey:", a3);
}

- (BOOL)hasActivePresentation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasActivePresentation") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasIdleTimerBehaviors
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasIdleTimerBehaviors") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasActiveSpotlightPresentation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasActiveSpotlightPresentation") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)canActivePresentationBecomeLocalFirstResponder
{
  void *v3;
  void *v4;
  char v5;

  -[SBWindowSceneManager activeDisplayWindowScene](self->_windowSceneManager, "activeDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMapTable objectForKey:](self->_presentersByWindowScene, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canActivePresentationBecomeLocalFirstResponder");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canActivePresentationBecomeFirstResponder
{
  void *v2;
  char v3;

  -[SBTransientOverlayPresentationManager topmostPresentedViewController](self, "topmostPresentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (id)topmostPresentedViewController
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "topmostPresentedViewController");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (SBTransientOverlayPresentationManager)initWithWindowSceneManager:(id)a3 alertItemsController:(id)a4 lockStateAggregator:(id)a5 reachabilityManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBTransientOverlayPresentationManager *v15;
  SBTransientOverlayPresentationManager *v16;
  SBIdleTimerCoordinatorHelper *v17;
  SBIdleTimerCoordinatorHelper *idleTimerCoordinatorHelper;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBTransientOverlayPresentationManager;
  v15 = -[SBTransientOverlayPresentationManager init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_windowSceneManager, a3);
    objc_storeStrong((id *)&v16->_alertItemsController, a4);
    objc_storeStrong((id *)&v16->_lockStateAggregator, a5);
    objc_storeStrong((id *)&v16->_reachabilityManager, a6);
    v17 = -[SBIdleTimerCoordinatorHelper initWithSourceProvider:]([SBIdleTimerCoordinatorHelper alloc], "initWithSourceProvider:", v16);
    idleTimerCoordinatorHelper = v16->_idleTimerCoordinatorHelper;
    v16->_idleTimerCoordinatorHelper = v17;

  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[SBIdleTimerCoordinatorHelper removeProvider:](self->_idleTimerCoordinatorHelper, "removeProvider:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBTransientOverlayPresentationManager;
  -[SBTransientOverlayPresentationManager dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      -[NSHashTable addObject:](observers, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;
  id v5;

  v5 = a3;
  if (v5)
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (void)setCoverSheetPresentationManager:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setCoverSheetPresentationManager:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return -[SBIdleTimerCoordinatorHelper targetCoordinator](self->_idleTimerCoordinatorHelper, "targetCoordinator");
}

- (void)setIdleTimerCoordinator:(id)a3
{
  -[SBIdleTimerCoordinatorHelper setTargetCoordinator:](self->_idleTimerCoordinatorHelper, "setTargetCoordinator:", a3);
}

- (BOOL)shouldDisableControlCenter
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "shouldDisableControlCenter") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)shouldDisableCoverSheetGesture
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "shouldDisableCoverSheetGesture") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)shouldDisableSiri
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "shouldDisableSiri") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)defaultDisplayConfigurationForTransientOverlayPresentation
{
  void *v2;
  void *v3;

  -[SBWindowSceneManager activeDisplayWindowScene](self->_windowSceneManager, "activeDisplayWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_fbsDisplayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v4;
  NSMapTable *presentersByWindowScene;
  NSMapTable *v6;
  NSMapTable *v7;
  void *v8;
  SBTransientOverlayScenePresenter *v9;
  SBAlertItemsController *alertItemsController;
  SBLockStateAggregator *lockStateAggregator;
  void *v12;
  SBTransientOverlayScenePresenter *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  presentersByWindowScene = self->_presentersByWindowScene;
  v17 = v4;
  if (!presentersByWindowScene)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_presentersByWindowScene;
    self->_presentersByWindowScene = v6;

    v4 = v17;
    presentersByWindowScene = self->_presentersByWindowScene;
  }
  -[NSMapTable objectForKey:](presentersByWindowScene, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = [SBTransientOverlayScenePresenter alloc];
    alertItemsController = self->_alertItemsController;
    lockStateAggregator = self->_lockStateAggregator;
    objc_msgSend(v17, "zStackResolver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBTransientOverlayScenePresenter initWithWindowScene:alertItemsController:lockStateAggregator:zStackResolver:reachabilityManager:](v9, "initWithWindowScene:alertItemsController:lockStateAggregator:zStackResolver:reachabilityManager:", v17, alertItemsController, lockStateAggregator, v12, self->_reachabilityManager);

    -[SBTransientOverlayScenePresenter addObserver:](v13, "addObserver:", self);
    -[SBTransientOverlayScenePresenter setCoverSheetPresentationManager:](v13, "setCoverSheetPresentationManager:", self->_coverSheetPresentationManager);
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);
    -[SBTransientOverlayScenePresenter setDelegate:](v13, "setDelegate:", WeakRetained);

    -[SBTransientOverlayScenePresenter setBannerManager:](v13, "setBannerManager:", self->_bannerManager);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inCallPresentationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransientOverlayScenePresenter setInCallPresentationManager:](v13, "setInCallPresentationManager:", v16);

    -[SBTransientOverlayScenePresenter setIdleTimerCoordinator:](v13, "setIdleTimerCoordinator:", self);
    -[NSMapTable setObject:forKey:](self->_presentersByWindowScene, "setObject:forKey:", v13, v17);

  }
}

- (void)windowSceneDidDisconnect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SBTransientOverlayPresentationManager *v19;
  NSMapTable *presentersByWindowScene;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_presentersByWindowScene, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "presentedViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBTransientOverlayDismissalRequest dismissalRequestForAllViewControllersInWindowScene:](SBMutableTransientOverlayDismissalRequest, "dismissalRequestForAllViewControllersInWindowScene:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAnimated:", 0);
    v24 = v4;
    -[NSMapTable removeObjectForKey:](self->_presentersByWindowScene, "removeObjectForKey:", v4);
    v25 = v8;
    objc_msgSend(v6, "performDismissalRequest:outerCompletionHandler:", v8, 0);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
          v14 = objc_opt_class();
          SBSafeCast(v14, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "pairedRemoteTransientOverlay");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              v19 = self;
              presentersByWindowScene = self->_presentersByWindowScene;
              objc_msgSend(v17, "_sbWindowScene");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMapTable objectForKey:](presentersByWindowScene, "objectForKey:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22)
              {
                +[SBTransientOverlayDismissalRequest dismissalRequestForViewController:](SBMutableTransientOverlayDismissalRequest, "dismissalRequestForViewController:", v18);
                v23 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v22, "performDismissalRequest:outerCompletionHandler:", v23, 0);
                v25 = (void *)v23;
                v6 = v22;
              }
              else
              {
                v6 = 0;
              }
              self = v19;
            }

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v10);
    }

    v4 = v24;
  }

}

- (BOOL)hasPresentationAboveWindowLevel:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hasPresentationAboveWindowLevel:", a3) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)activePresentationPreventsDragAndDrop
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[SBTransientOverlayPresentationManager hasActivePresentation](self, "hasActivePresentation");
  if (v3)
  {
    -[SBTransientOverlayPresentationManager topmostPresentedViewController](self, "topmostPresentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldPreventDragAndDrop");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (int64_t)presentedViewControllerCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "presentedViewControllerCount");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUseSceneBasedKeyboardFocusForActivePresentation
{
  void *v3;
  void *v4;
  char v5;

  -[SBWindowSceneManager activeDisplayWindowScene](self->_windowSceneManager, "activeDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMapTable objectForKey:](self->_presentersByWindowScene, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldUseSceneBasedKeyboardFocusForActivePresentation");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isPresentingViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isPresentingViewController:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isTopmostPresentedViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (v4
          && (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isTopmostPresentedViewController:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)hasActivePresentationFromProcess:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasActivePresentationFromProcess:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasActivePresentationFromBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasActivePresentationFromBundleIdentifier:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasActivePresentationForWindowScene:(id)a3
{
  void *v3;
  char v4;

  -[SBTransientOverlayPresentationManager transientOverlayPresenterForWindowScene:](self, "transientOverlayPresenterForWindowScene:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasActivePresentation");

  return v4;
}

- (BOOL)isTopmostPresentationFromSceneWithIdentityTokenString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isTopmostPresentationFromSceneWithIdentityTokenString:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)keyboardFocusTargetForSBWindowScene:(id)a3
{
  void *v3;
  void *v4;

  -[NSMapTable objectForKey:](self->_presentersByWindowScene, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardFocusTargetForTopmostPresentingScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)prefersStatusBarActivityItemVisible
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "prefersStatusBarActivityItemVisible") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)performDismissalRequest:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  switch(objc_msgSend(v4, "requestType"))
  {
    case 0:
      objc_msgSend(v4, "completionHandler");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
        (*(void (**)(uint64_t))(v5 + 16))(v5);
      goto LABEL_22;
    case 1:
      objc_msgSend(v4, "viewController");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject _sbWindowScene](v6, "_sbWindowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[NSMapTable objectForKey:](self->_presentersByWindowScene, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "performDismissalRequest:outerCompletionHandler:", v4, 0);
      }
      else
      {
        objc_msgSend(v4, "completionHandler");
        v17 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v17;
        if (v17)
          (*(void (**)(uint64_t))(v17 + 16))(v17);
      }

      goto LABEL_22;
    case 2:
      v6 = dispatch_group_create();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v11 = MEMORY[0x1E0C809B0];
      if (v10)
      {
        v12 = v10;
        v13 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            dispatch_group_enter(v6);
            v21[0] = v11;
            v21[1] = 3221225472;
            v21[2] = __65__SBTransientOverlayPresentationManager_performDismissalRequest___block_invoke;
            v21[3] = &unk_1E8E9DED8;
            v22 = v6;
            objc_msgSend(v15, "performDismissalRequest:outerCompletionHandler:", v4, v21);

          }
          v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v12);
      }

      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __65__SBTransientOverlayPresentationManager_performDismissalRequest___block_invoke_2;
      v19[3] = &unk_1E8E9DED8;
      v20 = v4;
      dispatch_group_notify(v6, MEMORY[0x1E0C80D38], v19);

      goto LABEL_22;
    case 3:
      objc_msgSend(v4, "windowScene");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[NSMapTable objectForKey:](self->_presentersByWindowScene, "objectForKey:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "performDismissalRequest:outerCompletionHandler:", v4, 0);
      }
      else
      {
        objc_msgSend(v4, "completionHandler");
        v18 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v18;
        if (v18)
          (*(void (**)(uint64_t))(v18 + 16))(v18);
      }

LABEL_22:
      break;
    default:
      break;
  }

}

void __65__SBTransientOverlayPresentationManager_performDismissalRequest___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__SBTransientOverlayPresentationManager_performDismissalRequest___block_invoke_2(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

- (void)performPresentationRequest:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSMapTable count](self->_presentersByWindowScene, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayPresentationManager.m"), 430, CFSTR("The TransientOverlayPresentationManager must have at least one window scene registered..."));

  }
  objc_msgSend(v8, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[SBWindowSceneManager activeDisplayWindowScene](self->_windowSceneManager, "activeDisplayWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMapTable objectForKey:](self->_presentersByWindowScene, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performPresentationRequest:", v8);

}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "handleHeadsetButtonPress:", v3) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)handleHomeButtonPress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "handleHomeButtonPress") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)handleHomeButtonDoublePress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "handleHomeButtonDoublePress") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)handleHomeButtonLongPress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "handleHomeButtonLongPress") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)handleLockButtonPress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "handleLockButtonPress") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)handleVoiceCommandButtonPress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "handleVoiceCommandButtonPress") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)handleVolumeUpButtonPress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "handleVolumeUpButtonPress") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)handleVolumeDownButtonPress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "handleVolumeDownButtonPress") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        if (*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15) == v8)
        {

          -[SBIdleTimerCoordinatorHelper proposeIdleTimerBehavior:fromProvider:reason:](self->_idleTimerCoordinatorHelper, "proposeIdleTimerBehavior:fromProvider:reason:", v9, v8, v10);
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
        continue;
      break;
    }
  }

  -[SBIdleTimerCoordinatorHelper updateProvider:behavior:reason:](self->_idleTimerCoordinatorHelper, "updateProvider:behavior:reason:", v8, v9, v10);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v17 = (void *)v16;

  return v17;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable objectEnumerator](self->_presentersByWindowScene, "objectEnumerator", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasIdleTimerBehaviors") & 1) != 0)
        {
          objc_msgSend(v9, "coordinatorRequestedIdleTimerBehavior:", self);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          return v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }

  +[SBIdleTimerBehavior defaultBehavior](SBIdleTimerBehavior, "defaultBehavior");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)transientOverlayScenePresenter:(id)a3 willPresentViewController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "transientOverlayPresentationManager:willPresentViewController:", self, v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)transientOverlayScenePresenter:(id)a3 didDismissViewController:(id)a4 wasTopmostPresentation:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
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
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "transientOverlayPresentationManager:didDismissViewController:wasTopmostPresentation:", self, v7, v5);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (SBBannerManager)bannerManager
{
  return self->_bannerManager;
}

- (void)setBannerManager:(id)a3
{
  objc_storeStrong((id *)&self->_bannerManager, a3);
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  return self->_coverSheetPresentationManager;
}

- (SBTransientOverlayScenePresenterDelegate)presenterDelegate
{
  return (SBTransientOverlayScenePresenterDelegate *)objc_loadWeakRetained((id *)&self->_presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presenterDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenterDelegate);
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_bannerManager, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
  objc_storeStrong((id *)&self->_presentersByWindowScene, 0);
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
}

@end
