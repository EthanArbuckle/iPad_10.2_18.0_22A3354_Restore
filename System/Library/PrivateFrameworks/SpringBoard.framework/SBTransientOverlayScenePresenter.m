@implementation SBTransientOverlayScenePresenter

- (BOOL)hasActivePresentation
{
  void *v2;
  BOOL v3;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_topmostPresentedEntity
{
  void *v3;
  void *v4;
  NSMutableArray *entities;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[NSMutableArray lastObject](self->_entities, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isDismissing") & 1) != 0)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__122;
    v13 = __Block_byref_object_dispose__122;
    v14 = 0;
    entities = self->_entities;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__SBTransientOverlayScenePresenter__topmostPresentedEntity__block_invoke;
    v8[3] = &unk_1E8EC0150;
    v8[4] = &v9;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](entities, "enumerateObjectsWithOptions:usingBlock:", 2, v8);
    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (BOOL)hasIdleTimerBehaviors
{
  void *v2;
  BOOL v3;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSNumber)preferredWhitePointAdaptivityStyleValue
{
  return self->_preferredWhitePointAdaptivityStyleValue;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SBTransientOverlayScenePresenter presentedViewControllers](self, "presentedViewControllers", 0, 0);
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
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
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

- (NSArray)presentedViewControllers
{
  return (NSArray *)-[NSMutableArray bs_compactMap:](self->_entities, "bs_compactMap:", &__block_literal_global_381);
}

- (BOOL)canActivePresentationBecomeLocalFirstResponder
{
  void *v2;
  char v3;

  -[SBTransientOverlayScenePresenter topmostPresentedViewController](self, "topmostPresentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeLocalFirstResponder");

  return v3;
}

- (SBTransientOverlayViewController)topmostPresentedViewController
{
  void *v2;
  void *v3;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBTransientOverlayViewController *)v3;
}

- (void)zStackParticipantDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBTransientOverlayScenePresenter _updateCurrentEntityHomeGrabberAnimated:](self, "_updateCurrentEntityHomeGrabberAnimated:", self->_homeAffordanceUpdatesShouldBeAnimated);
  if (objc_msgSend(v5, "activationState") == 1)
  {
    -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransientOverlayScenePresenter _preserveInputViewsForEntityIfNeeded:](self, "_preserveInputViewsForEntityIfNeeded:", v4);
LABEL_5:

    goto LABEL_6;
  }
  if (!objc_msgSend(v5, "activationState"))
  {
    -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransientOverlayScenePresenter _restoreInputViewsForEntityIfNeeded:](self, "_restoreInputViewsForEntityIfNeeded:", v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_updateCurrentEntityHomeGrabberAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBLockStateAggregator hasAnyLockState](self->_lockStateAggregator, "hasAnyLockState"))
    v6 = objc_msgSend(v5, "preferredLockedGestureDismissalStyle");
  else
    v6 = objc_msgSend(v5, "preferredUnlockedGestureDismissalStyle");
  v7 = v6;
  v17 = v5;
  if (-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture"))
    v8 = -[SBFZStackParticipant homeAffordanceDrawingSuppressed](self->_zStackParticipant, "homeAffordanceDrawingSuppressed", v5) ^ 1;
  else
    LOBYTE(v8) = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_entities;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isDismissing", v17) & 1) == 0)
        {
          if ((v8 & (v14 == v18)) != 0)
            LOBYTE(v8) = v7 != 0;
          objc_msgSend(v14, "viewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setPresentationPrefersHomeGrabberHidden:animated:", (v8 & 1) == 0, v3);

          objc_msgSend(v14, "viewController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setHomeGrabberPointerClickDelegate:", self);

        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

- (void)_restoreInputViewsForEntityIfNeeded:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "hasPreservedInputViews"))
  {
    objc_msgSend(v4, "setHasPreservedInputViews:", 0);
    objc_msgSend(v4, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "restoreInputViewsAnimated:", 1);

  }
}

- (SBTransientOverlayViewController)viewControllerForGestureDismissal
{
  void *v2;
  void *v3;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBTransientOverlayViewController *)v3;
}

- (SBTransientOverlayScenePresenter)initWithWindowScene:(id)a3 alertItemsController:(id)a4 lockStateAggregator:(id)a5 zStackResolver:(id)a6 reachabilityManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SBTransientOverlayScenePresenter *v17;
  SBTransientOverlayScenePresenter *v18;
  uint64_t v19;
  SBFZStackParticipant *zStackParticipant;
  void *v21;
  SBIdleTimerCoordinatorHelper *v22;
  SBIdleTimerCoordinatorHelper *idleTimerCoordinatorHelper;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SBTransientOverlayScenePresenter;
  v17 = -[SBTransientOverlayScenePresenter init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_windowScene, v12);
    objc_storeStrong((id *)&v18->_alertItemsController, a4);
    objc_msgSend(v15, "acquireParticipantWithIdentifier:delegate:", 15, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    zStackParticipant = v18->_zStackParticipant;
    v18->_zStackParticipant = (SBFZStackParticipant *)v19;

    objc_storeStrong((id *)&v18->_lockStateAggregator, a5);
    objc_storeStrong((id *)&v18->_reachabilityManager, a7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v18, sel__windowedAccessoryDidAttachOrDetach_, CFSTR("SBUIWindowedAccessoryDidAttachOrDetachNotification"), 0);

    v22 = -[SBIdleTimerCoordinatorHelper initWithSourceProvider:]([SBIdleTimerCoordinatorHelper alloc], "initWithSourceProvider:", v18);
    idleTimerCoordinatorHelper = v18->_idleTimerCoordinatorHelper;
    v18->_idleTimerCoordinatorHelper = v22;

  }
  return v18;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (self->_coverSheetExternalBehaviorProvider)
    objc_msgSend(WeakRetained, "transientOverlayScenePresenter:unregisterCoverSheetExternalBehaviorProvider:", self);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_entities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "viewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTransientOverlayDelegate:", 0);
        objc_msgSend(v11, "setIdleTimerCoordinator:", 0);
        -[SBTransientOverlayScenePresenter _invalidateAssertionsForEntity:](self, "_invalidateAssertionsForEntity:", v10);

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMapTable objectEnumerator](self->_entityToSceneDeactivationAssertion, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "relinquish");
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  -[SBFZStackParticipant invalidate](self->_zStackParticipant, "invalidate");
  -[BSInvalidatable invalidate](self->_bannerSuppressionAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_inCallNonModalSuppressionAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_deviceOrientationUpdateDeferralAssertion, "invalidate");
  -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_globalStatusBarAssertion, "invalidate");
  -[SBIdleTimerCoordinatorHelper removeProvider:](self->_idleTimerCoordinatorHelper, "removeProvider:", self);
  if (self->_isPendingAlertItems)
    -[SBAlertItemsController setForceAlertsToPend:forReason:](self->_alertItemsController, "setForceAlertsToPend:forReason:", 0, CFSTR("_SBTransientOverlayScenePresenterAlertItemsPendReason"));
  if (self->_isReachabilityTemporarilyDisabled)
    -[SBReachabilityManager setReachabilityTemporarilyDisabled:forReason:](self->_reachabilityManager, "setReachabilityTemporarilyDisabled:forReason:", 0, CFSTR("_SBTransientOverlayScenePresenterReachabilityDisabledReason"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObserver:name:object:", self, CFSTR("SBUIWindowedAccessoryDidAttachOrDetachNotification"), 0);

  -[SBTransientOverlayScenePresenter setCoverSheetPresentationManager:](self, "setCoverSheetPresentationManager:", 0);
  v18.receiver = self;
  v18.super_class = (Class)SBTransientOverlayScenePresenter;
  -[SBTransientOverlayScenePresenter dealloc](&v18, sel_dealloc);
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
  SBCoverSheetPresentationManager *v5;
  SBCoverSheetPresentationManager *coverSheetPresentationManager;
  void *v7;
  void *v8;
  SBCoverSheetPresentationManager *v9;

  v5 = (SBCoverSheetPresentationManager *)a3;
  coverSheetPresentationManager = self->_coverSheetPresentationManager;
  v9 = v5;
  if (coverSheetPresentationManager != v5)
  {
    if (coverSheetPresentationManager)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("SBCoverSheetWillPresentNotification"), self->_coverSheetPresentationManager);

    }
    objc_storeStrong((id *)&self->_coverSheetPresentationManager, a3);
    if (self->_coverSheetPresentationManager)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__handleCoverSheetWillPresent_, CFSTR("SBCoverSheetWillPresentNotification"), self->_coverSheetPresentationManager);

    }
  }

}

- (BOOL)canHandleButtonEvents
{
  void *v2;
  BOOL v3;

  -[SBTransientOverlayScenePresenter _buttonEventHandlingViewController](self, "_buttonEventHandlingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return -[SBIdleTimerCoordinatorHelper targetCoordinator](self->_idleTimerCoordinatorHelper, "targetCoordinator");
}

- (BOOL)ownsHomeGesture
{
  return -[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture");
}

- (int64_t)preferredGestureDismissalStyle
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBLockStateAggregator hasAnyLockState](self->_lockStateAggregator, "hasAnyLockState"))
    v5 = objc_msgSend(v4, "preferredLockedGestureDismissalStyle");
  else
    v5 = objc_msgSend(v4, "preferredUnlockedGestureDismissalStyle");
  v6 = v5;

  return v6;
}

- (void)setBannerManager:(id)a3
{
  SBBannerManager *v5;
  SBBannerManager *v6;

  v5 = (SBBannerManager *)a3;
  if (self->_bannerManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bannerManager, a3);
    -[SBTransientOverlayScenePresenter _updateFeaturePolicies](self, "_updateFeaturePolicies");
    v5 = v6;
  }

}

- (void)setInCallPresentationManager:(id)a3
{
  SBInCallPresentationManager *v5;
  SBInCallPresentationManager *v6;

  v5 = (SBInCallPresentationManager *)a3;
  if (self->_inCallPresentationManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_inCallPresentationManager, a3);
    -[SBTransientOverlayScenePresenter _updateFeaturePolicies](self, "_updateFeaturePolicies");
    v5 = v6;
  }

}

- (void)setIdleTimerCoordinator:(id)a3
{
  -[SBIdleTimerCoordinatorHelper setTargetCoordinator:](self->_idleTimerCoordinatorHelper, "setTargetCoordinator:", a3);
}

- (BOOL)shouldDisableControlCenter
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
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
  v2 = self->_entities;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "viewController", (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "shouldDisableControlCenter");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
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
  v2 = self->_entities;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isDismissing", (_QWORD)v10) & 1) == 0)
        {
          objc_msgSend(v6, "viewController");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "dismissesForCoverSheetPresentation");

          if (!v8)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)shouldDisableSiri
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
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
  v2 = self->_entities;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "viewController", (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "shouldDisableSiri");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (double)topmostWindowLevel
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowLevel");
  v5 = v4;

  return v5;
}

- (UIStatusBarStyleRequest)currentStatusBarStyleRequest
{
  void *v2;
  void *v3;
  void *v4;

  -[SBTransientOverlayScenePresenter _statusBarEntity](self, "_statusBarEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentStatusBarStyleRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIStatusBarStyleRequest *)v4;
}

- (BOOL)handleDoubleHeightStatusBarTap
{
  void *v2;
  void *v3;
  char v4;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "handleDoubleHeightStatusBarTap");
  else
    v4 = 0;

  return v4;
}

- (BOOL)hasPresentationAboveWindowLevel:(double)a3
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
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
  v3 = self->_entities;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "window", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "windowLevel");
        v8 = BSFloatGreaterThanOrEqualToFloat();

        if ((v8 & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)activePresentationPreventsDragAndDrop
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[SBTransientOverlayScenePresenter hasActivePresentation](self, "hasActivePresentation");
  if (v3)
  {
    -[SBTransientOverlayScenePresenter topmostPresentedViewController](self, "topmostPresentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldPreventDragAndDrop");

    LOBYTE(v3) = v5;
  }
  return v3;
}

id __60__SBTransientOverlayScenePresenter_presentedViewControllers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isDismissing") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int64_t)presentedViewControllerCount
{
  NSMutableArray *v2;
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
  v2 = self->_entities;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isDismissing", (_QWORD)v9) ^ 1;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
  void *v2;
  void *v3;
  char v4;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldUseSceneBasedKeyboardFocus");

  return v4;
}

- (BOOL)hasVisibleStatusBar
{
  void *v2;
  void *v3;
  char v4;

  -[SBTransientOverlayScenePresenter _statusBarEntity](self, "_statusBarEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasVisibleStatusBar");

  return v4;
}

- (BOOL)isPresentingViewController:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_entities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isDismissing", (_QWORD)v12) & 1) == 0)
        {
          objc_msgSend(v9, "viewController");
          v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v10 == v4)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)isTopmostPresentedViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  if (!a3)
    return 0;
  v4 = a3;
  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6 == v4;

  return v7;
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
  -[SBTransientOverlayScenePresenter presentedViewControllers](self, "presentedViewControllers", 0);
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
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isPresentedByProcess:", v4) & 1) != 0)
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
  -[SBTransientOverlayScenePresenter presentedViewControllers](self, "presentedViewControllers", 0);
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
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isPresentedByBundleIdentifier:", v4) & 1) != 0)
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

- (id)keyboardFocusTargetForTopmostPresentingScene
{
  void *v2;
  void *v3;
  void *v4;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardFocusTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isTopmostPresentationFromSceneWithIdentityTokenString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPresentedFromSceneWithIdentityTokenString:", v4);

  return v7;
}

- (BOOL)prefersStatusBarActivityItemVisible
{
  void *v2;
  void *v3;
  char v4;

  -[SBTransientOverlayScenePresenter _statusBarEntity](self, "_statusBarEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "prefersStatusBarActivityItemVisible");

  return v4;
}

- (id)newContentStatusBarHiddenAssertionWithReason:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *contentStatusBarHiddenAssertions;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id location;

  v4 = a3;
  if (!self->_contentStatusBarHiddenAssertions)
  {
    v5 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    contentStatusBarHiddenAssertions = self->_contentStatusBarHiddenAssertions;
    self->_contentStatusBarHiddenAssertions = v5;

  }
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C80D38];
  v11 = MEMORY[0x1E0C80D38];
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __81__SBTransientOverlayScenePresenter_newContentStatusBarHiddenAssertionWithReason___block_invoke;
  v17 = &unk_1E8E9E468;
  objc_copyWeak(&v18, &location);
  v12 = (void *)objc_msgSend(v7, "initWithIdentifier:forReason:queue:invalidationBlock:", v9, v4, v10, &v14);

  -[NSMutableArray addObject:](self->_contentStatusBarHiddenAssertions, "addObject:", v12, v14, v15, v16, v17);
  -[SBTransientOverlayScenePresenter _updateContentStatusBarPresentation](self, "_updateContentStatusBarPresentation");
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

void __81__SBTransientOverlayScenePresenter_newContentStatusBarHiddenAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[6], "removeObject:", v5);
    objc_msgSend(v4, "_updateContentStatusBarPresentation");
  }

}

- (void)performDismissalRequest:(id)a3 outerCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  SBTransientOverlayScenePresenter *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v36 = v6;
  v8 = objc_msgSend(v6, "requestType");
  if ((unint64_t)(v8 - 2) < 2)
  {
    v18 = self;
    v19 = (void *)-[NSMutableArray copy](self->_entities, "copy");
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    v35 = v19;
    v51 = objc_msgSend(v19, "count");
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __83__SBTransientOverlayScenePresenter_performDismissalRequest_outerCompletionHandler___block_invoke;
    v44[3] = &unk_1E8EC0060;
    v47 = &v48;
    v46 = v7;
    v20 = v36;
    v45 = v20;
    v21 = MEMORY[0x1D17E5550](v44);
    v22 = (void *)v21;
    if (v49[3] < 1)
    {
      (*(void (**)(uint64_t))(v21 + 16))(v21);
    }
    else
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v35, "reverseObjectEnumerator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v41 != v25)
              objc_enumerationMutation(v23);
            v27 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            v28 = objc_msgSend(v20, "isAnimated");
            v37[0] = MEMORY[0x1E0C809B0];
            v37[1] = 3221225472;
            v37[2] = __83__SBTransientOverlayScenePresenter_performDismissalRequest_outerCompletionHandler___block_invoke_2;
            v37[3] = &unk_1E8EA8CD0;
            v39 = &v48;
            v38 = v22;
            -[SBTransientOverlayScenePresenter _dismissEntity:animated:completion:](v18, "_dismissEntity:animated:completion:", v27, v28, v37);

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
        }
        while (v24);
      }

    }
    _Block_object_dispose(&v48, 8);

  }
  else if (v8)
  {
    if (v8 == 1)
    {
      v9 = v7;
      objc_msgSend(v6, "viewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v11 = self->_entities;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v53;
LABEL_6:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v53 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v14);
          objc_msgSend(v15, "viewController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == v10;

          if (v17)
            break;
          if (v12 == ++v14)
          {
            v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
            if (v12)
              goto LABEL_6;
            goto LABEL_12;
          }
        }
        v31 = v15;

        if (!v31)
          goto LABEL_29;
        v32 = objc_msgSend(v36, "isAnimated");
        objc_msgSend(v36, "completionHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBTransientOverlayScenePresenter _dismissEntity:animated:completion:](self, "_dismissEntity:animated:completion:", v31, v32, v33);

      }
      else
      {
LABEL_12:

LABEL_29:
        objc_msgSend(v36, "completionHandler");
        v34 = objc_claimAutoreleasedReturnValue();
        v31 = (id)v34;
        if (v34)
          (*(void (**)(uint64_t))(v34 + 16))(v34);
      }

      v7 = v9;
    }
  }
  else
  {
    objc_msgSend(v6, "completionHandler");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v29)
      (*(void (**)(uint64_t))(v29 + 16))(v29);

  }
}

void __83__SBTransientOverlayScenePresenter_performDismissalRequest_outerCompletionHandler___block_invoke(uint64_t a1)
{
  void (**v1)(void);
  void *v2;
  void (**v3)(void);
  void (**v4)(void);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v1 = (void (**)(void))MEMORY[0x1D17E5550](*(_QWORD *)(a1 + 40));
      if (!v1)
      {
LABEL_5:

        return;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void (**)(void))MEMORY[0x1D17E5550]();

      v1 = v4;
      if (!v4)
        goto LABEL_5;
    }
    v3 = v1;
    v1[2]();
    v1 = v3;
    goto LABEL_5;
  }
}

uint64_t __83__SBTransientOverlayScenePresenter_performDismissalRequest_outerCompletionHandler___block_invoke_2(uint64_t a1)
{
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performPresentationRequest:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  int v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  char v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  NSObject *v33;
  int v34;
  _SBTransientOverlayPresentedEntity *v35;
  SBTransientOverlayWindow *v36;
  void *v37;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  NSMutableArray *entities;
  _SBTransientOverlayPresentedEntity *v42;
  double v43;
  NSMutableArray *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  id v72;
  void *v73;
  void *v74;
  int64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  void *v80;
  id v81;
  void *v82;
  int v83;
  void *v84;
  SBTransientOverlayDefaultTransitionContextProvider *v85;
  void *v86;
  uint64_t v87;
  id v88;
  _SBTransientOverlayPresentedEntity *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  uint64_t v95;
  void *v96;
  BOOL isInitiatingEntityPresentation;
  void *v98;
  _SBTransientOverlayPresentedEntity *v99;
  SBTransientOverlayWindow *v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  unsigned int v107;
  _QWORD v108[4];
  _SBTransientOverlayPresentedEntity *v109;
  SBTransientOverlayScenePresenter *v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  char v117;
  _QWORD v118[5];
  id v119;
  char v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;
  _QWORD v130[4];
  id v131;
  id v132;
  _QWORD v133[4];
  id v134;
  id v135;
  id from;
  id location;
  _QWORD v138[6];
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint8_t v147[128];
  _BYTE buf[24];
  uint64_t v149;
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v104 = a3;
  isInitiatingEntityPresentation = self->_isInitiatingEntityPresentation;
  self->_isInitiatingEntityPresentation = 1;
  -[SBTransientOverlayScenePresenter _currentExternalStatusBarSettings](self, "_currentExternalStatusBarSettings");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = (void *)objc_msgSend(v104, "mutableCopy");
  objc_msgSend(v105, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v104, "isAnimated");
  SBLogTransientOverlay();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v149) = v107;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing presentation for %{public}@ animated: %{BOOL}u", buf, 0x1Cu);
  }

  objc_msgSend(v4, "setTransientOverlayDelegate:", self);
  objc_msgSend(v4, "bs_beginAppearanceTransition:animated:", 1, v107);
  if (!-[NSMutableArray count](self->_entities, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "_applicationKeyWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_msgSend(WeakRetained, "transientOverlayScenePresenter:shouldResignFirstResponderForKeyWindow:", self, v6))
    {
      v8 = objc_msgSend(v6, "canResignFirstResponder");

      if (v8)
      {
        objc_storeStrong((id *)&self->_initialPresentationKeyWindow, v6);
        -[UIWindow resignFirstResponder](self->_initialPresentationKeyWindow, "resignFirstResponder");
      }
    }
    else
    {

    }
  }
  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "originatingProcess");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v103)
    goto LABEL_26;
  objc_msgSend(v103, "viewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "allowsStackingOverlayContentAbove") & 1) == 0)
  {
    if (v98)
    {
      objc_msgSend(v103, "viewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isPresentedByProcess:", v98);

      if ((v11 & 1) != 0)
        goto LABEL_26;
    }
    else
    {

    }
    v12 = (void *)-[NSMutableArray copy](self->_entities, "copy");
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    v9 = v12;
    v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v143, v151, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v144;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v144 != v14)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isDismissing") & 1) == 0)
            -[SBTransientOverlayScenePresenter _dismissEntity:animated:completion:](self, "_dismissEntity:animated:completion:", v16, 1, 0);
        }
        v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v143, v151, 16);
      }
      while (v13);
    }

  }
LABEL_26:
  v17 = objc_msgSend(v4, "preferredInterfaceOrientationForPresentation");
  v18 = objc_msgSend(v4, "supportedInterfaceOrientations");
  v106 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v17)
  {
    SBLogTransientOverlay();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BSInterfaceOrientationDescription();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v20;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ has a preferred interface orientation: %{public}@", buf, 0x16u);

    }
    v21 = v17;
  }
  else
  {
    v22 = objc_msgSend(v106, "defaultPreferredInterfaceOrientationForPresentationForTransientOverlayScenePresenter:", self);
    if ((unint64_t)(v22 - 1) >= 4)
      v21 = 1;
    else
      v21 = v22;
  }
  v23 = v18 & 0x1E;
  if ((v18 & 0x1E) == 0)
  {
    v24 = v21;
    v23 = objc_msgSend(v106, "defaultSupportedInterfaceOrientationsForTransientOverlayScenePresenter:", self);
    v21 = v24;
  }
  if ((v23 & (1 << v21)) == 0)
  {
    if ((v23 & 2) != 0)
    {
      v21 = 1;
    }
    else if ((v23 & 0x10) != 0)
    {
      v21 = 4;
    }
    else if ((v23 & 8) != 0)
    {
      v21 = 3;
    }
    else
    {
      v21 = 2;
    }
  }
  v95 = v21;
  objc_msgSend(v4, "setContainerOrientation:");
  -[SBTransientOverlayScenePresenter setFluidDismissalState:forViewController:](self, "setFluidDismissalState:forViewController:", 0, v4);
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  v25 = self->_entities;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v139, v150, 16);
  if (!v26)
  {
LABEL_53:

LABEL_58:
    v36 = [SBTransientOverlayWindow alloc];
    -[SBTransientOverlayScenePresenter windowScene](self, "windowScene");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBTransientOverlayScenePresenter-%@"), v4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:](v36, "initWithWindowScene:rootViewController:role:debugName:", v37, v4, CFSTR("SBTraitsParticipantRoleTransientOverlay"), v38);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransientOverlayWindow setBackgroundColor:](v100, "setBackgroundColor:", v39);

    if (!self->_entities)
    {
      v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      entities = self->_entities;
      self->_entities = v40;

    }
    v42 = [_SBTransientOverlayPresentedEntity alloc];
    v43 = *MEMORY[0x1E0CEBBD0] + 5.0;
    v35 = -[_SBTransientOverlayPresentedEntity initWithViewController:window:baseWindowLevel:](v42, "initWithViewController:window:baseWindowLevel:", v4, v100, v43);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v149 = 0;
    v44 = self->_entities;
    v138[0] = MEMORY[0x1E0C809B0];
    v138[1] = 3221225472;
    v138[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke;
    v138[3] = &unk_1E8EC0088;
    *(double *)&v138[5] = v43;
    v138[4] = buf;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](v44, "enumerateObjectsWithOptions:usingBlock:", 2, v138);
    -[NSMutableArray insertObject:atIndex:](self->_entities, "insertObject:atIndex:", v35, *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
    {
      v45 = 0;
      do
      {
        -[NSMutableArray objectAtIndex:](self->_entities, "objectAtIndex:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBTransientOverlayScenePresenter _preserveInputViewsForEntityIfNeeded:](self, "_preserveInputViewsForEntityIfNeeded:", v46);

        ++v45;
      }
      while (v45 < *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
    }
    objc_msgSend(v106, "siriPresentationObservationTokenForTransientOverlayScenePresenter:", self);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101 && SBPresentationObservationTokenStatePresentedOrPresenting(objc_msgSend(v101, "state")))
    {
      objc_msgSend(v106, "transientOverlayScenePresenter:acquireSiriWindowLevelAssertionWithReason:windowLevel:", self, CFSTR("TransientOverlayPresented"), v43 + -1.0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        -[_SBTransientOverlayPresentedEntity setSiriPresentationObservationToken:](v35, "setSiriPresentationObservationToken:", v101);
        -[_SBTransientOverlayPresentedEntity setSiriWindowLevelAssertion:](v35, "setSiriWindowLevelAssertion:", v47);
        objc_initWeak(&location, self);
        objc_initWeak(&from, v35);
        v133[0] = MEMORY[0x1E0C809B0];
        v133[1] = 3221225472;
        v133[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_2;
        v133[3] = &unk_1E8EC00B0;
        objc_copyWeak(&v134, &from);
        objc_copyWeak(&v135, &location);
        objc_msgSend(v101, "setDidDismissHandler:", v133);
        objc_destroyWeak(&v135);
        objc_destroyWeak(&v134);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }

    }
    objc_msgSend(v106, "controlCenterPresentationObservationTokenForTransientOverlayScenePresenter:", self);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48 && SBPresentationObservationTokenStatePresentedOrPresenting(objc_msgSend(v48, "state")))
    {
      objc_msgSend(v106, "transientOverlayScenePresenter:acquireControlCenterWindowLevelAssertionWithReason:windowLevel:", self, CFSTR("TransientOverlayPresented"), v43 + -0.9);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        -[_SBTransientOverlayPresentedEntity setControlCenterPresentationObservationToken:](v35, "setControlCenterPresentationObservationToken:", v49);
        -[_SBTransientOverlayPresentedEntity setControlCenterWindowLevelAssertion:](v35, "setControlCenterWindowLevelAssertion:", v50);
        objc_initWeak(&location, self);
        objc_initWeak(&from, v35);
        v130[0] = MEMORY[0x1E0C809B0];
        v130[1] = 3221225472;
        v130[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_3;
        v130[3] = &unk_1E8EC00B0;
        objc_copyWeak(&v131, &from);
        objc_copyWeak(&v132, &location);
        objc_msgSend(v49, "setDidDismissHandler:", v130);
        objc_destroyWeak(&v132);
        objc_destroyWeak(&v131);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }

    }
    objc_msgSend(v106, "bannerLongLookPresentationObservationTokenForTransientOverlayScenePresenter:", self);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51 && SBPresentationObservationTokenStatePresentedOrPresenting(objc_msgSend(v51, "state")))
    {
      objc_msgSend(v106, "transientOverlayScenePresenter:acquireBannerLongLookWindowLevelAssertionWithReason:windowLevel:", self, CFSTR("TransientOverlayPresented"), v43 + -0.8);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        -[_SBTransientOverlayPresentedEntity setBannerLongLookPresentationObservationToken:](v35, "setBannerLongLookPresentationObservationToken:", v52);
        -[_SBTransientOverlayPresentedEntity setBannerLongLookWindowLevelAssertion:](v35, "setBannerLongLookWindowLevelAssertion:", v53);
        objc_initWeak(&location, self);
        objc_initWeak(&from, v35);
        v127[0] = MEMORY[0x1E0C809B0];
        v127[1] = 3221225472;
        v127[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_4;
        v127[3] = &unk_1E8EC00B0;
        objc_copyWeak(&v128, &from);
        objc_copyWeak(&v129, &location);
        objc_msgSend(v52, "setDidDismissHandler:", v127);
        objc_destroyWeak(&v129);
        objc_destroyWeak(&v128);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }

    }
    v54 = -[SBTransientOverlayScenePresenter _newKeyboardFocusAssertionForEntity:](self, "_newKeyboardFocusAssertionForEntity:", v35);
    -[_SBTransientOverlayPresentedEntity setKeyFocusStealingAssertion:](v35, "setKeyFocusStealingAssertion:", v54);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<TransientOverlayEntity-%@>"), v4);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "transientOverlayScenePresenter:acquireDisableAutoUnlockAssertionWithReason:", self, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBTransientOverlayPresentedEntity setDisableAutoUnlockAssertion:](v35, "setDisableAutoUnlockAssertion:", v56);

    +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "isConnectedToWindowedAccessory");

    +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "visibleScreenCoordinatesForWindowedAccessory");
    v61 = v60;
    v63 = v62;
    v65 = v64;
    v67 = v66;

    objc_msgSend(v4, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v58, v61, v63, v65, v67);
    _Block_object_dispose(buf, 8);

    v99 = 0;
    v34 = 1;
    goto LABEL_79;
  }
  v27 = *(_QWORD *)v140;
LABEL_45:
  v28 = 0;
  while (1)
  {
    if (*(_QWORD *)v140 != v27)
      objc_enumerationMutation(v25);
    v29 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v28);
    objc_msgSend(v29, "viewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30 == v4)
      break;

LABEL_51:
    if (v26 == ++v28)
    {
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v139, v150, 16);
      if (v26)
        goto LABEL_45;
      goto LABEL_53;
    }
  }
  v31 = objc_msgSend(v29, "isDismissing");

  if ((v31 & 1) == 0)
    goto LABEL_51;
  v32 = v29;

  v99 = (_SBTransientOverlayPresentedEntity *)v32;
  if (!v99)
    goto LABEL_58;
  SBLogTransientOverlay();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Using existing entity for presenting %{public}@", buf, 0x16u);
  }

  -[_SBTransientOverlayPresentedEntity setDismissing:](v99, "setDismissing:", 0);
  v34 = 0;
  v35 = v99;
LABEL_79:
  self->_isInitiatingEntityPresentation = isInitiatingEntityPresentation;
  -[SBTransientOverlayScenePresenter _updateBackgroundWindowForEntity:](self, "_updateBackgroundWindowForEntity:", v35);
  -[SBTransientOverlayScenePresenter _updateWindowHitTestingForEntity:](self, "_updateWindowHitTestingForEntity:", v35);
  -[_SBTransientOverlayPresentedEntity window](v35, "window");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransientOverlayScenePresenter _windowLevelForEntity:](self, "_windowLevelForEntity:", v35);
  v70 = v69;
  objc_msgSend(v68, "setLevel:");
  objc_msgSend(v68, "setAccessibilityIdentifier:", CFSTR("SBTransientOverlayWindow"));
  if (v34)
  {
    SBLogTransientOverlay();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2048;
      v149 = v70;
      _os_log_impl(&dword_1D0540000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@: Created window for %{public}@ at level: %f", buf, 0x20u);
    }

  }
  objc_msgSend(v4, "setIdleTimerCoordinator:", self);
  v125[0] = MEMORY[0x1E0C809B0];
  v125[1] = 3221225472;
  v125[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_56;
  v125[3] = &unk_1E8EAD748;
  v102 = v68;
  v126 = v102;
  objc_msgSend(v4, "updateDisplayLayoutElementWithBuilder:", v125);
  -[SBTransientOverlayScenePresenter _applyProximityDetectionModeForEntity:](self, "_applyProximityDetectionModeForEntity:", v35);
  -[SBTransientOverlayScenePresenter _applyWallpaperAnimationSuspensionAssertionForEntity:](self, "_applyWallpaperAnimationSuspensionAssertionForEntity:", v35);
  -[SBTransientOverlayScenePresenter _updateCurrentEntityHomeGrabberAnimated:](self, "_updateCurrentEntityHomeGrabberAnimated:", v107);
  -[SBTransientOverlayScenePresenter _updateZStackStateWithAnimationBehavior:reason:](self, "_updateZStackStateWithAnimationBehavior:reason:", v107, CFSTR("perform presentation request"));
  -[SBTransientOverlayScenePresenter _updateFeaturePolicies](self, "_updateFeaturePolicies");
  -[SBTransientOverlayScenePresenter _updateDeactivationAssertions](self, "_updateDeactivationAssertions");
  v72 = -[SBIdleTimerCoordinatorHelper proposeProvider:byCoordinator:reason:](self->_idleTimerCoordinatorHelper, "proposeProvider:byCoordinator:reason:", v4, self, CFSTR("SBTransientOverlayScenePresenterRequestedIdleTimer"));
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleTransientOverlay")) & 1) == 0)
  {
    objc_msgSend(v102, "_legacySetRotatableViewOrientation:duration:", v95, 0.0);
    -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "window");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "_windowInterfaceOrientation");

    if (self->_topmostViewControllerInterfaceOrientation != v75)
    {
      objc_msgSend(v106, "transientOverlayScenePresenter:willChangeTopmostViewControllerInterfaceOrientationToOrientation:", self, v75);
      self->_topmostViewControllerInterfaceOrientation = v75;
    }
  }
  objc_msgSend(v106, "transientOverlayScenePresenter:willPresentViewController:", self, v4);
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v76 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v121, v147, 16);
  if (v77)
  {
    v78 = *(_QWORD *)v122;
    do
    {
      for (j = 0; j != v77; ++j)
      {
        if (*(_QWORD *)v122 != v78)
          objc_enumerationMutation(v76);
        v80 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v80, "transientOverlayScenePresenter:willPresentViewController:", self, v4);
      }
      v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v121, v147, 16);
    }
    while (v77);
  }

  v81 = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(v81, "screen");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "_isCarScreen");

  if (v83)
    objc_msgSend(v102, "setHidden:", 0);
  else
    objc_msgSend(v102, "makeKeyAndVisible");
  -[_SBTransientOverlayPresentedEntity setHasFinishedWindowInitialization:](v35, "setHasFinishedWindowInitialization:", 1);
  v84 = (void *)objc_msgSend(v4, "newTransientOverlayPresentationTransitionCoordinator");
  v85 = objc_alloc_init(SBTransientOverlayDefaultTransitionContextProvider);
  -[SBTransientOverlayDefaultTransitionContextProvider setAnimated:](v85, "setAnimated:", v107);
  objc_msgSend(v106, "transientOverlayScenePresenterRequestsAppIconForceTouchDismissal:animated:", self, v107);
  if (objc_msgSend(v105, "shouldDismissSiri"))
    objc_msgSend(v106, "transientOverlayScenePresenterRequestsSiriDismissal:animated:", self, v107);
  objc_msgSend(v105, "completionHandler");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, v85);
  v87 = MEMORY[0x1E0C809B0];
  v118[0] = MEMORY[0x1E0C809B0];
  v118[1] = 3221225472;
  v118[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_2_65;
  v118[3] = &unk_1E8E9EE00;
  v118[4] = self;
  v88 = v96;
  v119 = v88;
  v120 = v107;
  v108[0] = v87;
  v108[1] = 3221225472;
  v108[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_3_66;
  v108[3] = &unk_1E8EC00D8;
  v89 = v35;
  v109 = v89;
  v110 = self;
  v90 = v4;
  v111 = v90;
  v91 = v84;
  v112 = v91;
  objc_copyWeak(&v116, (id *)buf);
  v92 = v106;
  v113 = v92;
  v93 = v104;
  v114 = v93;
  v117 = v107;
  v94 = v86;
  v115 = v94;
  -[SBTransientOverlayDefaultTransitionContextProvider transitionAlongsideUsingBlock:completion:](v85, "transitionAlongsideUsingBlock:completion:", v118, v108);
  objc_msgSend(v91, "startTransitionWithContextProvider:", v85);

  objc_destroyWeak(&v116);
  objc_destroyWeak((id *)buf);

}

uint64_t __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  objc_msgSend(a2, "baseWindowLevel");
  result = BSFloatLessThanOrEqualToFloat();
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3 + 1;
    *a4 = 1;
  }
  return result;
}

void __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "siriWindowLevelAssertion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    objc_msgSend(v8, "setSiriWindowLevelAssertion:", 0);
    objc_msgSend(v8, "siriPresentationObservationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(v8, "setSiriPresentationObservationToken:", 0);
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "_topmostPresentedEntity");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v8)
      {
        objc_msgSend(v6, "_updateCurrentEntityHomeGrabberAnimated:", 1);
        objc_msgSend(v6, "_updateZStackStateWithAnimationBehavior:reason:", 1, CFSTR("Siri presentation did dismiss"));
      }
    }

    WeakRetained = v8;
  }

}

void __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "controlCenterWindowLevelAssertion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    objc_msgSend(v8, "setControlCenterWindowLevelAssertion:", 0);
    objc_msgSend(v8, "controlCenterPresentationObservationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(v8, "setControlCenterPresentationObservationToken:", 0);
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "_topmostPresentedEntity");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v8)
      {
        objc_msgSend(v6, "_updateCurrentEntityHomeGrabberAnimated:", 1);
        objc_msgSend(v6, "_updateZStackStateWithAnimationBehavior:reason:", 1, CFSTR("control center presentation did dismiss"));
      }
    }

    WeakRetained = v8;
  }

}

void __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "bannerLongLookWindowLevelAssertion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    objc_msgSend(v8, "setBannerLongLookWindowLevelAssertion:", 0);
    objc_msgSend(v8, "bannerLongLookPresentationObservationToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(v8, "setBannerLongLookPresentationObservationToken:", 0);
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "_topmostPresentedEntity");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v8)
      {
        objc_msgSend(v6, "_updateCurrentEntityHomeGrabberAnimated:", 1);
        objc_msgSend(v6, "_updateZStackStateWithAnimationBehavior:reason:", 1, CFSTR("banner long look presentation did dismiss"));
      }
    }

    WeakRetained = v8;
  }

}

void __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_56(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "level");
  objc_msgSend(v4, "setLevel:", (uint64_t)v3);
  objc_msgSend(v4, "setFillsDisplayBounds:", 1);
  objc_msgSend(v4, "setLayoutRole:", 3);

}

uint64_t __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_2_65(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateStatusBarWithCurrentExternalStatusBarSettings:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_updatePreferredWhitePointAdaptivityStyle");
}

uint64_t __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_3_66(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  void *v14;
  id WeakRetained;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  if (!*(_QWORD *)(a1 + 32) || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "containsObject:") & 1) == 0)
  {
    SBLogTransientOverlay();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v19 = 138543618;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    v5 = "%{public}@: Ignoring presentation completion for %{public}@ since the entity is no longer valid";
    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isDismissing"))
  {
    SBLogTransientOverlay();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v19 = 138543618;
    v20 = v3;
    v21 = 2114;
    v22 = v4;
    v5 = "%{public}@: Ignoring presentation completion for %{public}@ since it is now dismissing";
LABEL_8:
    v8 = v2;
    v9 = 22;
LABEL_9:
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v19, v9);
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 48), "bs_endAppearanceTransition");
  v14 = *(void **)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(v14, "finalizeTransitionWithContextProvider:", WeakRetained);

  if (objc_msgSend(*(id *)(a1 + 48), "isContentOpaque"))
  {
    objc_msgSend(*(id *)(a1 + 64), "transientOverlayScenePresenterRequestsControlCenterDismissal:animated:", *(_QWORD *)(a1 + 40), 0);
    if (objc_msgSend(*(id *)(a1 + 72), "shouldDismissSiri"))
      objc_msgSend(*(id *)(a1 + 64), "transientOverlayScenePresenterRequestsSiriDismissal:animated:", *(_QWORD *)(a1 + 40), 0);
  }
  SBLogTransientOverlay();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(unsigned __int8 *)(a1 + 96);
    v19 = 138543874;
    v20 = v16;
    v21 = 2114;
    v22 = v17;
    v23 = 1024;
    v24 = v18;
    v5 = "%{public}@: Finished performing presentation for %{public}@ animated: %{BOOL}u";
    v8 = v2;
    v9 = 28;
    goto LABEL_9;
  }
LABEL_10:

  result = *(_QWORD *)(a1 + 80);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, v10, v11, v12);
  return result;
}

- (void)setFluidDismissalState:(id)a3 forViewController:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  NSMutableArray *entities;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  uint64_t v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double MaxY;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  double v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  __int128 v48;
  __int128 v49;
  CGFloat v50;
  CGFloat sx;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  CGRect v61;
  CGRect v62;

  v7 = a3;
  v8 = a4;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__122;
  v59 = __Block_byref_object_dispose__122;
  v60 = 0;
  entities = self->_entities;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __77__SBTransientOverlayScenePresenter_setFluidDismissalState_forViewController___block_invoke;
  v52[3] = &unk_1E8EC0100;
  v10 = v8;
  v53 = v10;
  v54 = &v55;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](entities, "enumerateObjectsWithOptions:usingBlock:", 2, v52);
  v11 = (void *)v56[5];
  if (!v11)
    goto LABEL_20;
  objc_msgSend(v11, "fluidDismissalState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v56[5], "setFluidDismissalState:", v7);
  objc_msgSend(v10, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = objc_msgSend(v7, "dismissalType");
  v43 = 0.0;
  if ((unint64_t)(v22 - 4) < 2)
  {
    objc_msgSend(v7, "contentRect");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v61.origin.x = v15;
    v61.origin.y = v17;
    v61.size.width = v19;
    v61.size.height = v21;
    MaxY = CGRectGetMaxY(v61);
    v62.origin.x = v24;
    v62.origin.y = v26;
    v62.size.width = v28;
    v62.size.height = v30;
    v32 = CGRectGetMaxY(v62);
    objc_msgSend(v7, "contentWeighting");
    v34 = v33;
    v35 = 0;
    v36 = MaxY - v32;
LABEL_9:
    v39 = 1;
    goto LABEL_10;
  }
  if (v22 != 2 && v22 != 3)
  {
    v34 = 1.0;
    v35 = 1;
    v36 = 0.0;
    goto LABEL_9;
  }
  objc_msgSend(v7, "contentWeighting");
  v34 = v37;
  objc_msgSend(v7, "backgroundWeighting");
  v43 = v38;
  v39 = 0;
  v35 = 1;
  v36 = 0.0;
LABEL_10:
  v50 = 1.0;
  sx = 1.0;
  v48 = *MEMORY[0x1E0C9D538];
  v49 = v48;
  objc_msgSend(v7, "contentRect");
  -[SBTransientOverlayScenePresenter _getContentScale:translation:fromRect:entity:](self, "_getContentScale:translation:fromRect:entity:", &sx, &v49, v56[5]);
  objc_msgSend(v7, "homeGrabberContentRect");
  -[SBTransientOverlayScenePresenter _getContentScale:translation:fromRect:entity:](self, "_getContentScale:translation:fromRect:entity:", &v50, &v48, v56[5]);
  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeScale(&v47, sx, sx);
  v45 = v47;
  CGAffineTransformTranslate(&v46, &v45, *(CGFloat *)&v49, *((CGFloat *)&v49 + 1));
  v47 = v46;
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeScale(&v46, v50, v50);
  v44 = v46;
  CGAffineTransformTranslate(&v45, &v44, *(CGFloat *)&v48, *((CGFloat *)&v48 + 1));
  v46 = v45;
  objc_msgSend(v10, "setPresentationDimmingViewHidden:", v39);
  objc_msgSend(v10, "setPresentationDimmingAlpha:", v43);
  v45 = v47;
  objc_msgSend(v10, "setPresentationContentTransform:", &v45);
  v45 = v46;
  objc_msgSend(v10, "setPresentationHomeGrabberTransform:", &v45);
  v40 = (void *)objc_msgSend(v12, "transitionPhase");
  if (v40 == (void *)objc_msgSend(v7, "transitionPhase"))
  {
    v4 = -[SBTransientOverlayScenePresenter _preferredStatusBarVisibilityForEntity:](self, "_preferredStatusBarVisibilityForEntity:", v56[5]);
    -[SBTransientOverlayScenePresenter _currentExternalStatusBarSettings](self, "_currentExternalStatusBarSettings");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPresentationPrefersStatusBarHidden:initialStatusBarSettings:", -[SBTransientOverlayScenePresenter _isPresentationStatusBarHiddenForVisibility:currentExternalStatusBarSettings:](self, "_isPresentationStatusBarHiddenForVisibility:currentExternalStatusBarSettings:", v4, v40), 0);

  }
  else
  {
    -[SBTransientOverlayScenePresenter _updateStatusBarWithCurrentExternalStatusBarSettings:animated:](self, "_updateStatusBarWithCurrentExternalStatusBarSettings:animated:", 0, 1);
  }
  objc_msgSend(v10, "setPresentationHomeGrabberAlpha:", v34);
  objc_msgSend(v10, "setPresentationHomeGrabberAdditionalEdgeSpacing:", v36);
  if ((_DWORD)v35 && (v41 = (void *)v56[5]) != 0)
  {
    objc_msgSend(v41, "window", 0.0);
    self = (SBTransientOverlayScenePresenter *)objc_claimAutoreleasedReturnValue();
    -[SBTransientOverlayScenePresenter windowScene](self, "windowScene");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "screen");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "traitCollection");
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v35, "displayCornerRadius");
    v42 = 1;
  }
  else
  {
    v42 = 0;
  }
  objc_msgSend(v10, "setPresentationContentCornerRadius:");
  if (v42)
  {

  }
LABEL_20:

  _Block_object_dispose(&v55, 8);
}

void __77__SBTransientOverlayScenePresenter_setFluidDismissalState_forViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  char v6;
  int v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  -[SBTransientOverlayScenePresenter _buttonEventHandlingViewController](self, "_buttonEventHandlingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    SBLogTransientOverlay();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Transient overlay handled headset button press: %@", (uint8_t *)&v8, 0xCu);
    }

    v6 = objc_msgSend(v4, "handleHeadsetButtonPress:", v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)handleHomeButtonPress
{
  void *v2;
  NSObject *v3;
  char v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SBTransientOverlayScenePresenter _buttonEventHandlingViewController](self, "_buttonEventHandlingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    SBLogTransientOverlay();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v2;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled home button press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    v4 = objc_msgSend(v2, "handleHomeButtonPress");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)handleHomeButtonDoublePress
{
  void *v3;
  NSObject *v4;
  BOOL v5;
  uint64_t v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[SBTransientOverlayScenePresenter _buttonEventHandlingViewController](self, "_buttonEventHandlingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    SBLogTransientOverlay();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Transient overlay handled home button double press: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    if ((objc_msgSend(v3, "handleHomeButtonDoublePress") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      if (-[SBLockStateAggregator hasAnyLockState](self->_lockStateAggregator, "hasAnyLockState"))
        v6 = objc_msgSend(v3, "preferredLockedGestureDismissalStyle");
      else
        v6 = objc_msgSend(v3, "preferredUnlockedGestureDismissalStyle");
      v5 = v6 != 3;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)handleHomeButtonLongPress
{
  void *v2;
  NSObject *v3;
  char v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SBTransientOverlayScenePresenter _buttonEventHandlingViewController](self, "_buttonEventHandlingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    SBLogTransientOverlay();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v2;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled home button long press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    v4 = objc_msgSend(v2, "handleHomeButtonLongPress");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)handleLockButtonPress
{
  void *v2;
  NSObject *v3;
  char v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SBTransientOverlayScenePresenter _buttonEventHandlingViewController](self, "_buttonEventHandlingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    SBLogTransientOverlay();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v2;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled lock button press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    v4 = objc_msgSend(v2, "handleLockButtonPress");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)handleVoiceCommandButtonPress
{
  void *v2;
  NSObject *v3;
  char v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SBTransientOverlayScenePresenter _buttonEventHandlingViewController](self, "_buttonEventHandlingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    SBLogTransientOverlay();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v2;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled voice command button press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    v4 = objc_msgSend(v2, "handleVoiceCommandButtonPress");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)handleVolumeUpButtonPress
{
  void *v2;
  NSObject *v3;
  char v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SBTransientOverlayScenePresenter _buttonEventHandlingViewController](self, "_buttonEventHandlingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    SBLogTransientOverlay();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v2;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled volume up button press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    v4 = objc_msgSend(v2, "handleVolumeUpButtonPress");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)handleVolumeDownButtonPress
{
  void *v2;
  NSObject *v3;
  char v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SBTransientOverlayScenePresenter _buttonEventHandlingViewController](self, "_buttonEventHandlingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    SBLogTransientOverlay();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v2;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled volume down button press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    v4 = objc_msgSend(v2, "handleVolumeDownButtonPress");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a4;
  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBLockStateAggregator hasAnyLockState](self->_lockStateAggregator, "hasAnyLockState"))
    v7 = objc_msgSend(v6, "preferredLockedGestureDismissalStyle");
  else
    v7 = objc_msgSend(v6, "preferredUnlockedGestureDismissalStyle");
  if (v5)
    v8 = v7 == 3;
  else
    v8 = 1;
  v9 = !v8;
  v10 = v9;
  if (objc_msgSend(v6, "preventsSystemApertureSuppressionFromBelow"))
  {
    if (SBUIIsSystemApertureEnabled())
      v10 = 2;
    else
      v10 = v9;
  }
  objc_msgSend(v29, "setActivationPolicyForParticipantsBelow:", v10);
  if (v9)
  {
    objc_msgSend(v29, "setHomeAffordanceDrawingSuppression:", objc_msgSend(v6, "homeAffordanceSuppression"));
    v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    objc_msgSend(v5, "bannerLongLookWindowLevelAssertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v11, "addIndex:", 22);
    objc_msgSend(v5, "controlCenterWindowLevelAssertion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v11, "addIndex:", 19);
    objc_msgSend(v5, "siriWindowLevelAssertion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v11, "addIndex:", 17);
    objc_msgSend(v29, "setAssertIsAboveParticipantIdentifiers:", v11);

  }
  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "grabberView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v9)
    objc_msgSend(v17, "addObserver:", self);
  else
    objc_msgSend(v17, "removeObserver:", self);

  if (v10)
  {
    if (-[SBTransientOverlayScenePresenter hasVisibleStatusBar](self, "hasVisibleStatusBar"))
    {
      v19 = 0;
    }
    else
    {
      -[SBTransientOverlayScenePresenter topmostPresentedViewController](self, "topmostPresentedViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "presentationPrefersStatusBarHidden"))
      {
        -[SBTransientOverlayScenePresenter _statusBarEntity](self, "_statusBarEntity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fluidDismissalState");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v23 == 0;

      }
      else
      {
        v19 = 0;
      }

    }
    if (-[SBTransientOverlayScenePresenter preferredGestureDismissalStyle](self, "preferredGestureDismissalStyle"))
      v20 = v19;
    else
      v20 = 1;
    if (v9)
    {
      objc_msgSend(v16, "grabberView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isHidden");

      v20 = v25 | v20;
    }
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v29, "setSuppressSystemApertureForSystemChromeSuppression:", v20);
  objc_msgSend(v16, "associatedBundleIdentifiersToSuppressInSystemAperture");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAssociatedBundleIdentifiersToSuppressInSystemAperture:", v26);

  objc_msgSend(v16, "associatedSceneIdentifiersToSuppressInSystemAperture");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAssociatedSceneIdentifiersToSuppressInSystemAperture:", v27);

  objc_msgSend(v16, "audioCategoriesDisablingVolumeHUD");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAudioCategoriesDisablingVolumeHUD:", v28);

}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  if (-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture", a3))
    -[SBTransientOverlayScenePresenter handleHomeButtonPress](self, "handleHomeButtonPress");
}

- (void)homeGrabberViewDidUpdateHidden:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "grabberView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    -[SBTransientOverlayScenePresenter _updateZStackStateWithAnimationBehavior:reason:](self, "_updateZStackStateWithAnimationBehavior:reason:", 2, CFSTR("homeGrabberViewDidUpdateHidden"));
  else
    objc_msgSend(v7, "removeObserver:", self);

}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11
    && (objc_msgSend(v11, "viewController"), v13 = (id)objc_claimAutoreleasedReturnValue(), v13, v13 == v8))
  {
    -[SBIdleTimerCoordinatorHelper proposeIdleTimerBehavior:fromProvider:reason:](self->_idleTimerCoordinatorHelper, "proposeIdleTimerBehavior:fromProvider:reason:", v9, v8, v10);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIdleTimerCoordinatorHelper updateProvider:behavior:reason:](self->_idleTimerCoordinatorHelper, "updateProvider:behavior:reason:", v8, v9, v10);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  return v15;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinatorRequestedIdleTimerBehavior:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[SBIdleTimerBehavior defaultBehavior](SBIdleTimerBehavior, "defaultBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (int64_t)defaultPreferredInterfaceOrientationForPresentationForTransientOverlayViewController:(id)a3
{
  id WeakRetained;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "defaultPreferredInterfaceOrientationForPresentationForTransientOverlayScenePresenter:", self);

  return v5;
}

- (unint64_t)defaultSupportedInterfaceOrientationsForTransientOverlayViewController:(id)a3
{
  id WeakRetained;
  unint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "defaultSupportedInterfaceOrientationsForTransientOverlayScenePresenter:", self);

  return v5;
}

- (BOOL)defaultShouldAutorotateForTransientOverlayViewController:(id)a3
{
  SBTransientOverlayScenePresenter *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "defaultShouldAutorotateForTransientOverlayScenePresenter:", v3);

  return (char)v3;
}

- (BOOL)isKeyboardVisibleForSpringBoardForTransientOverlayViewController:(id)a3
{
  SBTransientOverlayScenePresenter *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "isKeyboardVisibleForSpringBoardForTransientOverlayScenePresenter:", v3);

  return (char)v3;
}

- (void)transientOverlayViewControllerNeedsContentOpaqueUpdate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_entities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "viewController", (_QWORD)v13);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v12 = v10;

    if (!v12)
      goto LABEL_13;
    -[SBTransientOverlayScenePresenter _applyWallpaperAnimationSuspensionAssertionForEntity:](self, "_applyWallpaperAnimationSuspensionAssertionForEntity:", v12);
    -[SBTransientOverlayScenePresenter _updateBackgroundWindowForEntity:](self, "_updateBackgroundWindowForEntity:", v12);
    v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)transientOverlayViewControllerNeedsGestureDismissalStyleUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v7;
    if (v6 == v7)
    {
      -[SBTransientOverlayScenePresenter _updateCurrentEntityHomeGrabberAnimated:](self, "_updateCurrentEntityHomeGrabberAnimated:", 1);
      -[SBTransientOverlayScenePresenter _updateZStackStateWithAnimationBehavior:reason:](self, "_updateZStackStateWithAnimationBehavior:reason:", 1, CFSTR("transient overlay dismiss style updated"));
      v4 = v7;
    }
  }

}

- (void)transientOverlayViewControllerNeedsProximityDetectionUpdate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_entities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "viewController", (_QWORD)v13);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v12 = v10;

    if (!v12)
      goto LABEL_13;
    -[SBTransientOverlayScenePresenter _applyProximityDetectionModeForEntity:](self, "_applyProximityDetectionModeForEntity:", v12);
    v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)transientOverlayViewControllerNeedsStatusBarAppearanceUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[SBTransientOverlayScenePresenter _statusBarEntity](self, "_statusBarEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[SBTransientOverlayScenePresenter _currentExternalStatusBarSettings](self, "_currentExternalStatusBarSettings");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[SBTransientOverlayScenePresenter _updateStatusBarWithCurrentExternalStatusBarSettings:animated:](self, "_updateStatusBarWithCurrentExternalStatusBarSettings:animated:", v7, objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlockWithAnimationsEnabled"));

  }
}

- (void)transientOverlayViewControllerNeedsWhitePointAdaptivityStyleUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    -[SBTransientOverlayScenePresenter _updatePreferredWhitePointAdaptivityStyle](self, "_updatePreferredWhitePointAdaptivityStyle");
}

- (void)transientOverlayViewControllerWillBeginRotation:(id)a3 toInterfaceOrientation:(int64_t)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "setContainerOrientation:", a4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_entities;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "viewController", (_QWORD)v18);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v6)
        {
          v14 = v12;

          if (v14)
          {
            objc_msgSend(v14, "setRotating:", 1);
            -[SBTransientOverlayScenePresenter _updateBackgroundWindowForEntity:](self, "_updateBackgroundWindowForEntity:", v14);
            if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleTransientOverlay")) & 1) == 0)
            {
              -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
              v15 = (id)objc_claimAutoreleasedReturnValue();

              if (v15 == v14)
              {
                WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                objc_msgSend(WeakRetained, "transientOverlayScenePresenter:willChangeTopmostViewControllerInterfaceOrientationToOrientation:", self, a4);

                self->_topmostViewControllerInterfaceOrientation = a4;
              }
            }
          }
          goto LABEL_14;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = 0;
LABEL_14:
  -[SBTransientOverlayScenePresenter _currentExternalStatusBarSettings](self, "_currentExternalStatusBarSettings", (_QWORD)v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransientOverlayScenePresenter _updateStatusBarWithCurrentExternalStatusBarSettings:animated:](self, "_updateStatusBarWithCurrentExternalStatusBarSettings:animated:", v17, 0);

}

- (void)transientOverlayViewControllerDidEndRotation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_entities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "viewController", (_QWORD)v13);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v12 = v10;

    if (!v12)
      goto LABEL_13;
    -[NSMutableArray setRotating:](v12, "setRotating:", 0);
    -[SBTransientOverlayScenePresenter _updateBackgroundWindowForEntity:](self, "_updateBackgroundWindowForEntity:", v12);
    v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)transientOverlayViewControllerNeedsWindowHitTestingUpdate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_entities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "viewController", (_QWORD)v13);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v12 = v10;

    if (!v12)
      goto LABEL_13;
    -[SBTransientOverlayScenePresenter _updateWindowHitTestingForEntity:](self, "_updateWindowHitTestingForEntity:", v12);
    v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)transientOverlayViewControllerDidUpdatePresentationPrefersStatusBarHidden:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBTransientOverlayScenePresenter topmostPresentedViewController](self, "topmostPresentedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[SBTransientOverlayScenePresenter _updateZStackStateWithAnimationBehavior:reason:](self, "_updateZStackStateWithAnimationBehavior:reason:", 2, CFSTR("presentationPrefersStatusBarHiddenDidChange"));
}

- (BOOL)transientOverlayViewControllerIsForegroundActive:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (-[SBFZStackParticipant activationState](self->_zStackParticipant, "activationState"))
  {
    v5 = 0;
  }
  else
  {
    -[SBTransientOverlayScenePresenter topmostPresentedViewController](self, "topmostPresentedViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v6 == v4;

  }
  return v5;
}

- (void)transientOverlayViewController:(id)a3 requestZStackParticipantPreferencesUpdateWithReason:(id)a4
{
  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", a4);
}

- (void)transientOverlayViewControllerDidUpdateHIDEventDeferringDisabled:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  SBTransientOverlayScenePresenter *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = self->_entities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
      objc_msgSend(v10, "viewController", (_QWORD)v24);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v10;

    if (!v12)
      goto LABEL_15;
    if (objc_msgSend(v4, "hidEventDeferringDisabled"))
    {
      -[NSObject keyFocusStealingAssertion](v12, "keyFocusStealingAssertion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "invalidate");

      -[NSObject setKeyFocusStealingAssertion:](v12, "setKeyFocusStealingAssertion:", 0);
      -[NSObject keyFocusPreventionAssertion](v12, "keyFocusPreventionAssertion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        SBLogTransientOverlay();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v29 = self;
          v30 = 2114;
          v31 = v4;
          v16 = "%{public}@: Not taking key focus prevention assertion for %{public}@ because it already has one.";
LABEL_20:
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
      objc_msgSend(v4, "hostedSceneIdentityTokens");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count") == 1)
      {
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "keyboardFocusController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "preventFocusForSceneWithIdentityToken:reason:", v22, CFSTR("scene-backed remote transient overlay preventing focus"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject setKeyFocusPreventionAssertion:](v12, "setKeyFocusPreventionAssertion:", v23);
      }
    }
    else
    {
      -[NSObject keyFocusPreventionAssertion](v12, "keyFocusPreventionAssertion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "invalidate");

      -[NSObject setKeyFocusPreventionAssertion:](v12, "setKeyFocusPreventionAssertion:", 0);
      -[NSObject keyFocusStealingAssertion](v12, "keyFocusStealingAssertion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        SBLogTransientOverlay();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v29 = self;
          v30 = 2114;
          v31 = v4;
          v16 = "%{public}@: Not taking new keyboard focus lock assertion in response to hidEventDeferringDisabled update"
                " for %{public}@ because it already has one.";
          goto LABEL_20;
        }
LABEL_21:

        goto LABEL_26;
      }
      v19 = -[SBTransientOverlayScenePresenter _newKeyboardFocusAssertionForEntity:](self, "_newKeyboardFocusAssertionForEntity:", v12);
      -[NSObject setKeyFocusStealingAssertion:](v12, "setKeyFocusStealingAssertion:", v19);
    }

  }
  else
  {
LABEL_9:

LABEL_15:
    SBLogTransientOverlay();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = self;
      v30 = 2114;
      v31 = v4;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring hidEventDeferringDisabled update for %{public}@ because the entity is no longer valid.", buf, 0x16u);
    }
  }
LABEL_26:

}

- (void)_handleCoverSheetWillPresent:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[NSMutableArray copy](self->_entities, "copy", a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isDismissing", (_QWORD)v13) & 1) == 0)
        {
          objc_msgSend(v10, "viewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "dismissesForCoverSheetPresentation");

          if (v12)
            -[SBTransientOverlayScenePresenter _dismissEntity:animated:completion:](self, "_dismissEntity:animated:completion:", v10, 1, 0);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_applyProximityDetectionModeForEntity:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "isDismissing") & 1) != 0
    || (objc_msgSend(v10, "viewController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "prefersProximityDetectionEnabled"),
        v4,
        !v5))
  {
    objc_msgSend(v10, "setProximityEnabledAssertion:", 0);
  }
  else
  {
    objc_msgSend(v10, "proximityEnabledAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<TransientOverlayEntity-%p>"), v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "transientOverlayScenePresenter:acquireProximitySensorEnabledAssertionWithReason:", self, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setProximityEnabledAssertion:", v9);

    }
  }

}

- (void)_applyWallpaperAnimationSuspensionAssertionForEntity:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isContentOpaque");

  objc_msgSend(v13, "wallpaperAnimationSuspensionAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {

    if (!v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "viewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("<TransientOverlayEntity-%@>"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "transientOverlayScenePresenter:acquireWallpaperAnimationSuspensionAssertionWithReason:", self, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWallpaperAnimationSuspensionAssertion:", v12);

    }
  }
  else
  {
    objc_msgSend(v6, "invalidate");

    objc_msgSend(v13, "setWallpaperAnimationSuspensionAssertion:", 0);
  }

}

- (id)_buttonEventHandlingViewController
{
  void *v2;
  void *v3;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_dismissEntity:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  SBTransientOverlayDefaultTransitionContextProvider *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  SBTransientOverlayDefaultTransitionContextProvider *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  SBTransientOverlayScenePresenter *v31;
  id v32;
  id v33;
  SBTransientOverlayDefaultTransitionContextProvider *v34;
  id v35;
  id v36;
  BOOL v37;
  BOOL v38;
  _QWORD v39[5];
  BOOL v40;
  uint8_t buf[4];
  SBTransientOverlayScenePresenter *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  _BOOL4 v46;
  uint64_t v47;

  v6 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayScenePresenter.m"), 1325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entity != nil"));

  }
  objc_msgSend(v9, "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogTransientOverlay();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v42 = self;
    v43 = 2114;
    v44 = v11;
    v45 = 1024;
    v46 = v6;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing dismissal for %{public}@ animated: %{BOOL}u", buf, 0x1Cu);
  }

  v13 = -[SBTransientOverlayScenePresenter isTopmostPresentedViewController:](self, "isTopmostPresentedViewController:", v11);
  objc_msgSend(v9, "setDismissing:", 1);
  if (!-[SBFZStackParticipant activationState](self->_zStackParticipant, "activationState"))
  {
    objc_msgSend(v9, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "traitsParticipant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidate");

    objc_msgSend(v9, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setTraitsParticipant:", 0);

  }
  objc_msgSend(v11, "bs_beginAppearanceTransition:animated:", 0, v6);
  -[SBTransientOverlayScenePresenter _updateCurrentEntityHomeGrabberAnimated:](self, "_updateCurrentEntityHomeGrabberAnimated:", v6);
  -[SBTransientOverlayScenePresenter _updateZStackStateWithAnimationBehavior:reason:](self, "_updateZStackStateWithAnimationBehavior:reason:", v6, CFSTR("dismissing"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v18 = (void *)objc_msgSend(v11, "newTransientOverlayDismissalTransitionCoordinator");
  v19 = objc_alloc_init(SBTransientOverlayDefaultTransitionContextProvider);
  -[SBTransientOverlayDefaultTransitionContextProvider setAnimated:](v19, "setAnimated:", v6);
  -[SBTransientOverlayScenePresenter _applyProximityDetectionModeForEntity:](self, "_applyProximityDetectionModeForEntity:", v9);
  objc_msgSend(v9, "keyFocusStealingAssertion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "invalidate");

  objc_msgSend(v9, "setKeyFocusStealingAssertion:", 0);
  objc_msgSend(v9, "keyFocusPreventionAssertion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "invalidate");

  objc_msgSend(v9, "setKeyFocusPreventionAssertion:", 0);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __71__SBTransientOverlayScenePresenter__dismissEntity_animated_completion___block_invoke;
  v39[3] = &unk_1E8E9F508;
  v39[4] = self;
  v40 = v6;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __71__SBTransientOverlayScenePresenter__dismissEntity_animated_completion___block_invoke_2;
  v29[3] = &unk_1E8EC0128;
  v30 = v9;
  v31 = self;
  v32 = v11;
  v33 = v18;
  v34 = v19;
  v35 = WeakRetained;
  v37 = v6;
  v38 = v13;
  v36 = v10;
  v22 = v10;
  v23 = WeakRetained;
  v24 = v19;
  v25 = v18;
  v26 = v11;
  v27 = v9;
  -[SBTransientOverlayDefaultTransitionContextProvider transitionAlongsideUsingBlock:completion:](v24, "transitionAlongsideUsingBlock:completion:", v39, v29);
  objc_msgSend(v25, "startTransitionWithContextProvider:", v24);

}

uint64_t __71__SBTransientOverlayScenePresenter__dismissEntity_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_currentExternalStatusBarSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateStatusBarWithCurrentExternalStatusBarSettings:animated:", v3, *(unsigned __int8 *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_updatePreferredWhitePointAdaptivityStyle");
}

uint64_t __71__SBTransientOverlayScenePresenter__dismissEntity_animated_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t result;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  _BYTE buf[32];
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32) || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "containsObject:") & 1) == 0)
  {
    SBLogTransientOverlay();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v18;
    v19 = "%{public}@: Ignoring dismissal completion for %{public}@ since the entity is no longer valid";
    goto LABEL_14;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isDismissing") & 1) == 0)
  {
    SBLogTransientOverlay();
    v2 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    v20 = *(_QWORD *)(a1 + 40);
    v21 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v21;
    v19 = "%{public}@: Ignoring dismissal completion for %{public}@ since it is now re-presenting";
LABEL_14:
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
    goto LABEL_37;
  }
  objc_msgSend(*(id *)(a1 + 32), "window");
  v2 = objc_claimAutoreleasedReturnValue();
  -[NSObject resignAsKeyWindow](v2, "resignAsKeyWindow");
  objc_msgSend(*(id *)(a1 + 40), "_topmostPresentedEntity");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_restoreInputViewsForEntityIfNeeded:");
  -[NSObject setHidden:](v2, "setHidden:", 1);
  -[NSObject setRootViewController:](v2, "setRootViewController:", 0);
  if (objc_msgSend(*(id *)(a1 + 48), "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 48), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

  }
  objc_msgSend(*(id *)(a1 + 32), "backgroundWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);
  v45 = v4;
  objc_msgSend(v4, "setRootViewController:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_invalidateAssertionsForEntity:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 56), "finalizeTransitionWithContextProvider:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "transientOverlayDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);

  if (v5 == v6)
    objc_msgSend(*(id *)(a1 + 48), "setTransientOverlayDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 48), "idleTimerCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);

  if (v7 == v8)
    objc_msgSend(*(id *)(a1 + 48), "setIdleTimerCoordinator:", 0);
  objc_msgSend(*(id *)(a1 + 48), "setPresentationPrefersStatusBarHidden:initialStatusBarSettings:", 0, 0);
  objc_msgSend(*(id *)(a1 + 48), "setPresentationPrefersHomeGrabberHidden:animated:", 0, 0);
  objc_msgSend(*(id *)(a1 + 48), "setPresentationHomeGrabberAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 48), "setPresentationHomeGrabberAdditionalEdgeSpacing:", 0.0);
  v9 = *(void **)(a1 + 48);
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)buf = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&buf[16] = v10;
  v53 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v9, "setPresentationHomeGrabberTransform:", buf);
  objc_msgSend(*(id *)(a1 + 48), "setPresentationContentCornerRadius:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "removeProvider:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeObject:", *(_QWORD *)(a1 + 32));
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "count");
  v12 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    v13 = *(void **)(v12 + 96);
    objc_msgSend((id)v12, "_topmostPresentedEntity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v13, "proposeProvider:byCoordinator:reason:", v15, *(_QWORD *)(a1 + 40), CFSTR("SBTransientOverlayPresentationManagerRequestedIdleTimer"));

  }
  else
  {
    if (!*(_BYTE *)(v12 + 120))
    {
      objc_msgSend(*(id *)(v12 + 96), "targetCoordinator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 40);
      +[SBIdleTimerBehavior disabledBehavior](SBIdleTimerBehavior, "disabledBehavior");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (id)objc_msgSend(v22, "idleTimerProvider:didProposeBehavior:forReason:", v23, v24, CFSTR("SBTransientOverlayPresentationManagerNoneActive"));

      v26 = *(_QWORD *)(a1 + 40);
      if (*(_QWORD *)(v26 + 104))
      {
        v27 = objc_msgSend(*(id *)(a1 + 72), "transientOverlayScenePresenter:shouldRestoreFirstResponderForKeyWindow:");
        v26 = *(_QWORD *)(a1 + 40);
        if (v27)
        {
          objc_msgSend(*(id *)(v26 + 104), "becomeFirstResponder");
          v26 = *(_QWORD *)(a1 + 40);
        }
      }
      v28 = *(void **)(v26 + 104);
      *(_QWORD *)(v26 + 104) = 0;

      v12 = *(_QWORD *)(a1 + 40);
    }
    v14 = *(void **)(v12 + 72);
    *(_QWORD *)(v12 + 72) = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "_updateFeaturePolicies");
  objc_msgSend(*(id *)(a1 + 40), "_updateDeactivationAssertions");
  v29 = *(void **)(a1 + 40);
  objc_msgSend(v29, "_currentExternalStatusBarSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_updateStatusBarWithCurrentExternalStatusBarSettings:animated:", v30, *(unsigned __int8 *)(a1 + 88));

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleTransientOverlay")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_topmostPresentedEntity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "window");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "_windowInterfaceOrientation");

    objc_msgSend(*(id *)(a1 + 72), "transientOverlayScenePresenter:willChangeTopmostViewControllerInterfaceOrientationToOrientation:", *(_QWORD *)(a1 + 40), v33);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) = v33;
  }
  objc_msgSend(*(id *)(a1 + 48), "bs_endAppearanceTransition");
  objc_msgSend(*(id *)(a1 + 72), "transientOverlayScenePresenter:didDismissViewController:wasTopmostPresentation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 89));
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v34 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "copy");
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v48 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v39, "transientOverlayScenePresenter:didDismissViewController:wasTopmostPresentation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 89));
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v36);
  }

  SBLogTransientOverlay();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = *(_QWORD *)(a1 + 40);
    v42 = *(_QWORD *)(a1 + 48);
    v43 = *(unsigned __int8 *)(a1 + 88);
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v41;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v42;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v43;
    _os_log_impl(&dword_1D0540000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished performing dismissal for %{public}@ animated: %{BOOL}u", buf, 0x1Cu);
  }

LABEL_37:
  result = *(_QWORD *)(a1 + 80);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (double)_backgroundWindowLevelForEntity:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  double v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_entities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "baseWindowLevel", (_QWORD)v15);
        objc_msgSend(v4, "baseWindowLevel");
        v8 += SBFloatEqualsFloat();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
    v11 = (double)v8;
  }
  else
  {
    v11 = 0.0;
  }

  objc_msgSend(v4, "baseWindowLevel");
  v13 = v12;

  return v13 + v11 * 2.1;
}

- (id)_currentExternalStatusBarSettings
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "currentStatusBarSettingsForTransientOverlayScenePresenter:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_getContentScale:(double *)a3 translation:(CGPoint *)a4 fromRect:(CGRect)a5 entity:(id)a6
{
  CGFloat width;
  id v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  CGRect v35;

  width = a5.size.width;
  v9 = a6;
  v11 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v34 = v9;
  objc_msgSend(v9, "fluidDismissalState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "dismissalType");
  v14 = 1.0;
  if (v12 && (v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend(v34, "viewController", 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v19 = width;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    UIRectGetCenter();
    v33 = v26;
    v28 = v27;
    UIRectGetCenter();
    v30 = v29;
    v32 = v31;
    v35.origin.x = v18;
    v35.origin.y = v21;
    v35.size.width = v23;
    v35.size.height = v25;
    v11 = v33 - v30;
    v10 = v28 - v32;
    v14 = v19 / CGRectGetWidth(v35);
  }
  if (a3)
    *a3 = v14;
  if (a4)
  {
    a4->x = v11;
    a4->y = v10;
  }

}

- (void)_invalidateAssertionsForEntity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "bannerLongLookWindowLevelAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(v11, "setBannerLongLookWindowLevelAssertion:", 0);
  objc_msgSend(v11, "bannerLongLookPresentationObservationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(v11, "setBannerLongLookPresentationObservationToken:", 0);
  objc_msgSend(v11, "controlCenterWindowLevelAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  objc_msgSend(v11, "setControlCenterWindowLevelAssertion:", 0);
  objc_msgSend(v11, "controlCenterPresentationObservationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  objc_msgSend(v11, "setControlCenterPresentationObservationToken:", 0);
  objc_msgSend(v11, "siriWindowLevelAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  objc_msgSend(v11, "setSiriWindowLevelAssertion:", 0);
  objc_msgSend(v11, "siriPresentationObservationToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  objc_msgSend(v11, "setSiriPresentationObservationToken:", 0);
  objc_msgSend(v11, "disableAutoUnlockAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  objc_msgSend(v11, "setDisableAutoUnlockAssertion:", 0);
  objc_msgSend(v11, "wallpaperAnimationSuspensionAssertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  objc_msgSend(v11, "setWallpaperAnimationSuspensionAssertion:", 0);
}

- (BOOL)_isPresentationStatusBarHiddenForVisibility:(int)a3 currentExternalStatusBarSettings:(id)a4
{
  int v4;
  void *v5;

  v4 = a3;
  if (!a3)
  {
    objc_msgSend(a4, "alpha");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    if (BSFloatGreaterThanFloat())
      v4 = 2;
    else
      v4 = 1;

  }
  return v4 == 1;
}

- (id)_newSceneDeactivationAssertionWithReason:(int64_t)a3
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "transientOverlayScenePresenter:newSceneDeactivationAssertionWithReason:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)_preferredStatusBarVisibilityForEntity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_preferredStatusBarVisibility");

  if (-[NSMutableArray count](self->_contentStatusBarHiddenAssertions, "count"))
    v7 = v6 == 2;
  else
    v7 = 1;
  if (!v7)
    goto LABEL_8;
  if (v6 == 2)
  {
    -[SBTransientOverlayScenePresenter _statusBarEntity](self, "_statusBarEntity");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v4)
    {
LABEL_8:
      v6 = 1;
      goto LABEL_9;
    }
    objc_msgSend(v4, "fluidDismissalState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && objc_msgSend(v10, "dismissalType") == 3)
    {
      v14 = 0x3FF0000000000000;
      objc_msgSend(v4, "fluidDismissalState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentRect");
      -[SBTransientOverlayScenePresenter _getContentScale:translation:fromRect:entity:](self, "_getContentScale:translation:fromRect:entity:", &v14, 0, v4);

      if (BSFloatLessThanFloat())
        v13 = 1;
      else
        v13 = 2;
      if (objc_msgSend(v11, "transitionPhase") == 1)
        v6 = 0;
      else
        v6 = v13;
    }
    else
    {
      v6 = 2;
    }

  }
LABEL_9:

  return v6;
}

- (double)_windowLevelForEntity:(id)a3
{
  double v3;

  -[SBTransientOverlayScenePresenter _backgroundWindowLevelForEntity:](self, "_backgroundWindowLevelForEntity:", a3);
  return v3 + 0.1;
}

void __59__SBTransientOverlayScenePresenter__topmostPresentedEntity__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "isDismissing") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_updateBackgroundWindowForEntity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SBTransientOverlayScenePresenter *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CEABB0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SBTransientOverlayScenePresenter__updateBackgroundWindowForEntity___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performWithoutAnimation:", v7);

}

void __69__SBTransientOverlayScenePresenter__updateBackgroundWindowForEntity___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  SBTransientOverlayBackgroundWindow *v4;
  id v5;
  void *v6;
  void *v7;
  SBTransientOverlayBackgroundWindow *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isContentOpaque"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isRotating");

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "backgroundWindow");
      v4 = (SBTransientOverlayBackgroundWindow *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
        objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setBackgroundColor:", v6);

        v8 = [SBTransientOverlayBackgroundWindow alloc];
        objc_msgSend(*(id *)(a1 + 32), "window");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "windowScene");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBTransientOverlayPresentationManagerBackground-%@"), v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:](v8, "initWithWindowScene:rootViewController:role:debugName:", v10, v5, CFSTR("SBTraitsParticipantRoleTransientOverlayBackground"), v11);

        -[SBTransientOverlayBackgroundWindow setBackgroundColor:](v4, "setBackgroundColor:", v6);
        objc_msgSend(*(id *)(a1 + 32), "setBackgroundWindow:", v4);

      }
      SBLogTransientOverlay();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "viewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        v20 = 2114;
        v21 = v14;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Showing background window for view controller: %{public}@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "_backgroundWindowLevelForEntity:", *(_QWORD *)(a1 + 32));
      -[SBTransientOverlayBackgroundWindow setLevel:](v4, "setLevel:");
      -[SBWindow setHidden:](v4, "setHidden:", 0);
      goto LABEL_13;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "backgroundWindow");
  v4 = (SBTransientOverlayBackgroundWindow *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    SBLogTransientOverlay();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "viewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v16;
      v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Hiding background window for view controller: %{public}@", buf, 0x16u);

    }
    -[SBWindow setHidden:](v4, "setHidden:", 1);
    -[SBTransientOverlayBackgroundWindow setRootViewController:](v4, "setRootViewController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setBackgroundWindow:", 0);
  }
LABEL_13:

}

- (void)_updateWindowHitTestingForEntity:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bs_setHitTestingDisabled:", objc_msgSend(v5, "prefersWindowHitTestingDisabled"));
}

- (void)_updateZStackStateWithAnimationBehavior:(int64_t)a3 reason:(id)a4
{
  BOOL homeAffordanceUpdatesShouldBeAnimated;

  if (a3 == 2)
  {
    -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", a4);
  }
  else
  {
    homeAffordanceUpdatesShouldBeAnimated = self->_homeAffordanceUpdatesShouldBeAnimated;
    self->_homeAffordanceUpdatesShouldBeAnimated = a3 != 0;
    -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", a4);
    self->_homeAffordanceUpdatesShouldBeAnimated = homeAffordanceUpdatesShouldBeAnimated;
  }
}

- (void)_updateStatusBarWithCurrentExternalStatusBarSettings:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  void *v17;
  SBWindowSceneStatusBarSettingsAssertion *globalStatusBarAssertion;
  BOOL v19;
  id WeakRetained;
  void *v21;
  void *v22;
  SBWindowSceneStatusBarSettingsAssertion *v23;
  SBWindowSceneStatusBarSettingsAssertion *v24;
  SBWindowSceneStatusBarSettingsAssertion *v25;
  SBInAppStatusBarHiddenAssertion *v26;
  SBWindowSceneStatusBarSettingsAssertion *v27;
  void *v28;
  SBInAppStatusBarHiddenAssertion *v29;
  SBInAppStatusBarHiddenAssertion *appStatusBarAssertion;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  SBWindowSceneStatusBarSettingsAssertion *v45;
  SBInAppStatusBarHiddenAssertion *v46;
  id v47;
  _QWORD v48[4];
  SBWindowSceneStatusBarSettingsAssertion *v49;
  SBInAppStatusBarHiddenAssertion *v50;
  BOOL v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[5];
  id v55;
  BOOL v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  SBTransientOverlayScenePresenter *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v4 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBTransientOverlayScenePresenter _statusBarEntity](self, "_statusBarEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogTransientOverlay();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v63 = self;
    v64 = 2114;
    v65 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Status bar owning view controller set to: %{public}@", buf, 0x16u);

  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v10 = self->_entities;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v58;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v58 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        if (objc_msgSend(v15, "hasFinishedWindowInitialization")
          && -[SBTransientOverlayScenePresenter _preferredStatusBarVisibilityForEntity:](self, "_preferredStatusBarVisibilityForEntity:", v15))
        {
          v16 = 1;
          goto LABEL_14;
        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v12)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_14:

  if (v4)
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA08]), "initWithDefaultParameters");
  else
    v17 = 0;
  globalStatusBarAssertion = self->_globalStatusBarAssertion;
  if (v16)
  {
    v19 = globalStatusBarAssertion == 0;
    if (!globalStatusBarAssertion)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      objc_msgSend(WeakRetained, "statusBarManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "assertionManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v22, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, 7, CFSTR("Transient Overlay"));
      v24 = self->_globalStatusBarAssertion;
      self->_globalStatusBarAssertion = v23;

      -[SBWindowSceneStatusBarSettingsAssertion acquireWithAnimationParameters:](self->_globalStatusBarAssertion, "acquireWithAnimationParameters:", v17);
    }
    if (self->_appStatusBarAssertion)
    {
      v25 = 0;
      v26 = 0;
      goto LABEL_25;
    }
    v28 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v28, "transientOverlayScenePresenter:acquireHideAppStatusBarAssertionWithReason:animated:", self, CFSTR("Transient Overlay"), v4);
    v29 = (SBInAppStatusBarHiddenAssertion *)objc_claimAutoreleasedReturnValue();
    appStatusBarAssertion = self->_appStatusBarAssertion;
    self->_appStatusBarAssertion = v29;

    v25 = 0;
    v26 = 0;
  }
  else
  {
    v25 = globalStatusBarAssertion;
    v27 = self->_globalStatusBarAssertion;
    self->_globalStatusBarAssertion = 0;

    v26 = self->_appStatusBarAssertion;
    v19 = 0;
    v28 = self->_appStatusBarAssertion;
    self->_appStatusBarAssertion = 0;
  }

LABEL_25:
  v31 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke;
  v54[3] = &unk_1E8EC0178;
  v54[4] = self;
  v32 = v6;
  v55 = v32;
  v56 = v19;
  v33 = (void *)MEMORY[0x1D17E5550](v54);
  v34 = v33;
  if (v4)
  {
    v43 = v17;
    v35 = v7;
    v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9F8]), "initWithDefaultParameters");
    v37 = (void *)MEMORY[0x1E0CEA9F8];
    v52[0] = v31;
    v52[1] = 3221225472;
    v52[2] = __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_2;
    v52[3] = &unk_1E8EA02D8;
    v52[4] = self;
    v53 = v34;
    v48[0] = v31;
    v48[1] = 3221225472;
    v48[2] = __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_3;
    v48[3] = &unk_1E8EA8528;
    v49 = v25;
    v50 = v26;
    v51 = v4;
    v38 = v34;
    v39 = v37;
    v7 = v35;
    v17 = v43;
    objc_msgSend(v39, "animateWithParameters:animations:completion:", v36, v52, v48);

  }
  else
  {
    v40 = (void *)MEMORY[0x1E0CEABB0];
    v44[0] = v31;
    v44[1] = 3221225472;
    v44[2] = __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_4;
    v44[3] = &unk_1E8EC01A0;
    v44[4] = self;
    v47 = v33;
    v45 = v25;
    v46 = v26;
    v36 = v34;
    objc_msgSend(v40, "performWithoutAnimation:", v44);

  }
  -[SBTransientOverlayScenePresenter windowScene](self, "windowScene");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "recordingIndicatorManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "updateRecordingIndicatorForStatusBarChanges");

}

void __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(v9, "hasFinishedWindowInitialization");
  v4 = v9;
  if (v3)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "_isPresentationStatusBarHiddenForVisibility:currentExternalStatusBarSettings:", objc_msgSend(*(id *)(a1 + 32), "_preferredStatusBarVisibilityForEntity:", v9), *(_QWORD *)(a1 + 40));
    objc_msgSend(v9, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (*(_BYTE *)(a1 + 48))
      v8 = *(_QWORD *)(a1 + 40);
    else
      v8 = 0;
    objc_msgSend(v6, "setPresentationPrefersStatusBarHidden:initialStatusBarSettings:", v5, v8);

    v4 = v9;
  }

}

void __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateWithAnimationParameters:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "invalidateWithAnimation:", *(unsigned __int8 *)(a1 + 48));
}

uint64_t __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "invalidateWithAnimationParameters:", 0, (_QWORD)v8);
  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

- (void)_updateContentStatusBarPresentation
{
  id v3;

  -[SBTransientOverlayScenePresenter _currentExternalStatusBarSettings](self, "_currentExternalStatusBarSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBTransientOverlayScenePresenter _updateStatusBarWithCurrentExternalStatusBarSettings:animated:](self, "_updateStatusBarWithCurrentExternalStatusBarSettings:animated:", v3, 0);

}

- (void)_updateDeactivationAssertions
{
  SBTransientOverlayScenePresenter *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  id *p_entityToSceneDeactivationAssertion;
  NSMapTable *entityToSceneDeactivationAssertion;
  NSMapTable *v24;
  NSMapTable *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  __int128 v35;
  id *location;
  uint64_t v37;
  NSMutableArray *obj;
  id v39;
  SBTransientOverlayScenePresenter *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  SBTransientOverlayScenePresenter *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v2 = self;
  v59 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = self->_entities;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  v40 = v2;
  if (v3)
  {
    v5 = v3;
    v39 = 0;
    v6 = *(_QWORD *)v46;
    location = (id *)&v2->_windowScene;
    *(_QWORD *)&v4 = 138544130;
    v35 = v4;
    do
    {
      v7 = 0;
      v37 = v5;
      do
      {
        if (*(_QWORD *)v46 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v7);
        -[NSMapTable objectForKey:](v2->_entityToSceneDeactivationAssertion, "objectForKey:", v8, v35);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "viewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "preferredSceneDeactivationReasonValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = objc_msgSend(v11, "integerValue");
          if (!v9 || objc_msgSend(v9, "reason") != v12)
          {
            v13 = -[SBTransientOverlayScenePresenter _newSceneDeactivationAssertionWithReason:](v2, "_newSceneDeactivationAssertionWithReason:", v12);
            SBLogTransientOverlay();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v8, "viewController");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              UIApplicationSceneDeactivationReasonDescription();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v35;
              v51 = v2;
              v52 = 2114;
              v53 = v13;
              v54 = 2114;
              v55 = v15;
              v56 = 2114;
              v57 = v16;
              _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Created new background assertion %{public}@ for %{public}@ with reason: %{public}@", buf, 0x2Au);

            }
            if (v13)
            {
              objc_msgSend(v8, "viewController");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "sceneDeactivationPredicate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              WeakRetained = objc_loadWeakRetained(location);
              objc_msgSend(WeakRetained, "_fbsDisplayIdentity");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "sb_acquireWithPredicate:transitionContext:displayIdentity:", v18, 0, v20);

              v21 = v39;
              if (!v39)
              {
                objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v39 = v21;
              objc_msgSend(v21, "setObject:forKey:", v13, v8);
              v2 = v40;
            }
            v5 = v37;

          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v5);
  }
  else
  {
    v39 = 0;
  }

  entityToSceneDeactivationAssertion = v2->_entityToSceneDeactivationAssertion;
  p_entityToSceneDeactivationAssertion = (id *)&v2->_entityToSceneDeactivationAssertion;
  v24 = entityToSceneDeactivationAssertion;
  objc_storeStrong(p_entityToSceneDeactivationAssertion, v39);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v24;
  v26 = -[NSMapTable countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v25, "objectForKey:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*p_entityToSceneDeactivationAssertion, "objectForKey:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31 != v32)
        {
          objc_msgSend(v31, "relinquish");
          SBLogTransientOverlay();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v30, "viewController");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v51 = v40;
            v52 = 2114;
            v53 = v31;
            v54 = 2114;
            v55 = v34;
            _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Relinquished background assertion %{public}@ for %{public}@", buf, 0x20u);

          }
        }

      }
      v27 = -[NSMapTable countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v27);
  }

}

- (void)_updateFeaturePolicies
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "%{public}@: Failed to begin suppressing banners", a5, a6, a7, a8, 2u);
}

- (void)_updatePreferredWhitePointAdaptivityStyle
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  NSNumber *v8;
  NSNumber *preferredWhitePointAdaptivityStyleValue;
  void *v10;
  void *v11;
  void *v12;

  -[SBTransientOverlayScenePresenter _topmostPresentedEntity](self, "_topmostPresentedEntity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  if (v3)
  {
    v4 = objc_msgSend(v3, "hasFinishedWindowInitialization");
    v5 = v12;
    if (!v4)
      goto LABEL_9;
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "preferredWhitePointAdaptivityStyle"));
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  preferredWhitePointAdaptivityStyleValue = self->_preferredWhitePointAdaptivityStyleValue;
  if (preferredWhitePointAdaptivityStyleValue != v8
    && (-[NSNumber isEqual:](preferredWhitePointAdaptivityStyleValue, "isEqual:", v8) & 1) == 0)
  {
    self->_preferredWhitePointAdaptivityStyleValue = v8;
    -[SBTransientOverlayScenePresenter delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transientOverlayScenePresenter:preferredWhitePointAdaptivityStyleDidChangeWithAnimationSettings:", self, v11);

  }
  v5 = v12;
LABEL_9:

}

- (void)_windowedAccessoryDidAttachOrDetach:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isConnectedToWindowedAccessory");

  +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visibleScreenCoordinatesForWindowedAccessory");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = self->_entities;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v19), "viewController", (_QWORD)v21);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v5, v8, v10, v12, v14);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

}

- (void)_preserveInputViewsForEntityIfNeeded:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPreservedInputViews") & 1) == 0)
  {
    objc_msgSend(v4, "setHasPreservedInputViews:", 1);
    objc_msgSend(v4, "viewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preserveInputViewsAnimated:", 1);

  }
}

- (id)_newKeyboardFocusAssertionForEntity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardFocusController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBKeyboardFocusLockReason activeTransientOverlay](SBKeyboardFocusLockReason, "activeTransientOverlay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusLockSpringBoardWindow:forReason:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (int64_t)topmostViewControllerInterfaceOrientation
{
  return self->_topmostViewControllerInterfaceOrientation;
}

- (SBTransientOverlayScenePresenterDelegate)delegate
{
  return (SBTransientOverlayScenePresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  return self->_coverSheetPresentationManager;
}

- (SBBannerManager)bannerManager
{
  return self->_bannerManager;
}

- (SBInCallPresentationManager)inCallPresentationManager
{
  return self->_inCallPresentationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_appStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_globalStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_interactiveScreenshotGestureDisabledAssertion, 0);
  objc_storeStrong((id *)&self->_initialPresentationKeyWindow, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_entityToSceneDeactivationAssertion, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_deviceOrientationUpdateDeferralAssertion, 0);
  objc_storeStrong((id *)&self->_coverSheetExternalBehaviorProvider, 0);
  objc_storeStrong((id *)&self->_contentStatusBarHiddenAssertions, 0);
  objc_storeStrong((id *)&self->_inCallNonModalSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_inCallPresentationManager, 0);
  objc_storeStrong((id *)&self->_bannerManager, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
}

@end
