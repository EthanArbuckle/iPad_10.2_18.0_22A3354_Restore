@implementation SBFluidSwitcherGestureWorkspaceTransaction

- (SBFluidSwitcherGestureWorkspaceTransaction)initWithTransitionRequest:(id)a3 switcherController:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  SBFluidSwitcherGestureWorkspaceTransaction *v10;
  SBFluidSwitcherGestureWorkspaceTransaction *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIApplicationSceneDeactivationAssertion *backgroundingScenesDeactivationAssertion;
  uint64_t v17;
  NSMapTable *originalLayoutStatesBySwitcherController;
  uint64_t v19;
  NSMapTable *activeLayoutStatesBySwitcherController;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSMutableSet *v29;
  NSMutableSet *ancillaryLayoutTransactions;
  NSMutableSet *v31;
  NSMutableSet *layoutTransitionCompletions;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  NSMutableSet *sceneIdentifiersWithSceneUpdateTransactionsInProgress;
  uint64_t v39;
  NSMutableDictionary *pendingSceneUpdateTransactionsBySceneIdentifier;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v47.receiver = self;
  v47.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  v10 = -[SBSystemGestureWorkspaceTransaction initWithTransitionRequest:](&v47, sel_initWithTransitionRequest_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_switcherController, v8);
    objc_msgSend(v8, "contentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v11->_switcherViewController, v12);

    v42 = v9;
    objc_storeWeak((id *)&v11->_delegate, v9);
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sceneDeactivationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "newAssertionWithReason:", 0);
    backgroundingScenesDeactivationAssertion = v11->_backgroundingScenesDeactivationAssertion;
    v11->_backgroundingScenesDeactivationAssertion = (UIApplicationSceneDeactivationAssertion *)v15;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    originalLayoutStatesBySwitcherController = v11->_originalLayoutStatesBySwitcherController;
    v11->_originalLayoutStatesBySwitcherController = (NSMapTable *)v17;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    activeLayoutStatesBySwitcherController = v11->_activeLayoutStatesBySwitcherController;
    v11->_activeLayoutStatesBySwitcherController = (NSMapTable *)v19;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "connectedWindowScenes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v44;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v26), "switcherController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "layoutState");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](v11->_originalLayoutStatesBySwitcherController, "setObject:forKey:", v28, v27);
          -[NSMapTable setObject:forKey:](v11->_activeLayoutStatesBySwitcherController, "setObject:forKey:", v28, v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v24);
    }

    v29 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    ancillaryLayoutTransactions = v11->_ancillaryLayoutTransactions;
    v11->_ancillaryLayoutTransactions = v29;

    v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    layoutTransitionCompletions = v11->_layoutTransitionCompletions;
    v11->_layoutTransitionCompletions = v31;

    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "animationSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "arcSwipeSettings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "settlingDuration");
    *(double *)&SBFluidSwitcherMaximumActivationDelayForArcSwipes = v36 * 0.9;

    v11->_shouldCancelGestureUponInterruption = 1;
    v37 = objc_opt_new();
    sceneIdentifiersWithSceneUpdateTransactionsInProgress = v11->_sceneIdentifiersWithSceneUpdateTransactionsInProgress;
    v11->_sceneIdentifiersWithSceneUpdateTransactionsInProgress = (NSMutableSet *)v37;

    v39 = objc_opt_new();
    pendingSceneUpdateTransactionsBySceneIdentifier = v11->_pendingSceneUpdateTransactionsBySceneIdentifier;
    v11->_pendingSceneUpdateTransactionsBySceneIdentifier = (NSMutableDictionary *)v39;

    v9 = v42;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[UIApplicationSceneDeactivationAssertion relinquish](self->_backgroundingScenesDeactivationAssertion, "relinquish");
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction dealloc](&v3, sel_dealloc);
}

- (id)_currentGestureEventForGesture:(id)a3
{
  id v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  SBScrunchGestureSwitcherModifierEvent *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double digitizerSurfaceHeightForLastGestureEvent;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v50;
  double v51;
  double v52;

  v5 = a3;
  v6 = -[SBFluidSwitcherGestureWorkspaceTransaction _gestureType](self, "_gestureType");
  -[SBFluidSwitcherGestureWorkspaceTransaction selectedAppLayout](self, "selectedAppLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "state");

  v9 = SBGestureModifierPhaseForGestureState(v8);
  -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v10;
    v14 = objc_msgSend(v13, "recognizedTouchType");
    v15 = -[SBGestureSwitcherModifierEvent initWithGestureID:selectedAppLayout:gestureType:phase:]([SBScrunchGestureSwitcherModifierEvent alloc], "initWithGestureID:selectedAppLayout:gestureType:phase:", self->_gestureID, v7, v6, v9);
    objc_msgSend(v13, "velocityInView:", v12);
    -[SBGestureSwitcherModifierEvent setVelocityInContainerView:](v15, "setVelocityInContainerView:");
    objc_msgSend(v13, "initialCentroid");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v13, "centroid");
    v21 = v20;
    v23 = v22;
    objc_msgSend(v13, "absoluteScale");
    -[SBScrunchGestureSwitcherModifierEvent setAbsoluteScale:](v15, "setAbsoluteScale:");
    objc_msgSend(v13, "locationInView:", v12);
    -[SBGestureSwitcherModifierEvent setLocationInContainerView:](v15, "setLocationInContainerView:");
    objc_msgSend(v13, "translationInView:", v12);
    v25 = v24;
    v27 = v26;
    objc_msgSend(v13, "translationWithoutConsideringScaleInView:", v12);
    v29 = v28;
    v31 = v30;
    if (v14 == 1)
    {
      v50 = v28;
      v51 = v25;
      v52 = v17;
      +[SBHomeGestureDomain rootSettings](SBHomeGestureDomain, "rootSettings");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "travelDistanceForTranslatingScreenHeight");
      v34 = v33;
      digitizerSurfaceHeightForLastGestureEvent = self->_digitizerSurfaceHeightForLastGestureEvent;
      if (BSFloatIsZero())
        digitizerSurfaceHeightForLastGestureEvent = 110.0;
      v36 = digitizerSurfaceHeightForLastGestureEvent / v34;
      objc_msgSend(v32, "minimumDistanceThresholdToScaleMultiplier");
      v38 = v37;
      objc_msgSend(v12, "bounds");
      v40 = digitizerSurfaceHeightForLastGestureEvent * (v19 / v39);
      if (v40 < v38 && BSFloatGreaterThanFloat())
        v36 = v36 / (v40 / v38);
      v29 = v50;
      v27 = v27 * v36;
      v31 = v31 * v36;
      v17 = v52;
      v21 = v52 + v21 - v52;
      v23 = v19 + (v23 - v19) * v36;

      v25 = v51;
    }
    -[SBScrunchGestureSwitcherModifierEvent setInitialCentroid:](v15, "setInitialCentroid:", v17, v19);
    -[SBScrunchGestureSwitcherModifierEvent setCentroid:](v15, "setCentroid:", v21, v23);
    -[SBGestureSwitcherModifierEvent setTranslationInContainerView:](v15, "setTranslationInContainerView:", v25, v27);
    -[SBScrunchGestureSwitcherModifierEvent setTranslationWithoutScale:](v15, "setTranslationWithoutScale:", v29, v31);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = -[SBGestureSwitcherModifierEvent initWithGestureID:selectedAppLayout:gestureType:phase:]([SBItemResizeGestureSwitcherModifierEvent alloc], "initWithGestureID:selectedAppLayout:gestureType:phase:", self->_gestureID, v7, v6, v9);
        -[SBScrunchGestureSwitcherModifierEvent setSelectedLayoutRole:](v15, "setSelectedLayoutRole:", -[SBFluidSwitcherGestureWorkspaceTransaction selectedLayoutRole](self, "selectedLayoutRole"));
        -[SBScrunchGestureSwitcherModifierEvent setSelectedEdge:](v15, "setSelectedEdge:", -[SBFluidSwitcherGestureWorkspaceTransaction selectedEdge](self, "selectedEdge"));
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = -[SBGestureSwitcherModifierEvent initWithGestureID:selectedAppLayout:gestureType:phase:]([SBWindowDragSwitcherModifierEvent alloc], "initWithGestureID:selectedAppLayout:gestureType:phase:", self->_gestureID, v7, v6, v9);
          -[SBScrunchGestureSwitcherModifierEvent setDraggingFromContinuousExposeStrips:](v15, "setDraggingFromContinuousExposeStrips:", -[SBFluidSwitcherGestureWorkspaceTransaction isDraggingFromContinuousExposeStrips](self, "isDraggingFromContinuousExposeStrips"));
          -[SBFluidSwitcherGestureWorkspaceTransaction locationInSelectedDisplayItem](self, "locationInSelectedDisplayItem");
          -[SBScrunchGestureSwitcherModifierEvent setLocationInSelectedDisplayItem:](v15, "setLocationInSelectedDisplayItem:");
          -[SBFluidSwitcherGestureWorkspaceTransaction sizeOfSelectedDisplayItem](self, "sizeOfSelectedDisplayItem");
          -[SBScrunchGestureSwitcherModifierEvent setSizeOfSelectedDisplayItem:](v15, "setSizeOfSelectedDisplayItem:");
        }
        else
        {
          v15 = -[SBGestureSwitcherModifierEvent initWithGestureID:selectedAppLayout:gestureType:phase:]([SBGestureSwitcherModifierEvent alloc], "initWithGestureID:selectedAppLayout:gestureType:phase:", self->_gestureID, v7, v6, v9);
        }
      }
      objc_msgSend(v41, "velocityInView:", v12);
      -[SBGestureSwitcherModifierEvent setVelocityInContainerView:](v15, "setVelocityInContainerView:");
      objc_msgSend(v41, "translationInView:", v12);
      -[SBGestureSwitcherModifierEvent setTranslationInContainerView:](v15, "setTranslationInContainerView:");
      objc_msgSend(v41, "_hysteresis");
      -[SBGestureSwitcherModifierEvent setHysteresis:](v15, "setHysteresis:");
      objc_msgSend(v41, "locationInView:", v12);
      v46 = v45;
      v48 = v47;

      -[SBGestureSwitcherModifierEvent setLocationInContainerView:](v15, "setLocationInContainerView:", v46, v48);
      v14 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = v10;
        v15 = -[SBGestureSwitcherModifierEvent initWithGestureID:selectedAppLayout:gestureType:phase:]([SBIndirectPanGestureSwitcherModifierEvent alloc], "initWithGestureID:selectedAppLayout:gestureType:phase:", self->_gestureID, v7, v6, v9);
        -[SBGestureSwitcherModifierEvent setMouseEvent:](v15, "setMouseEvent:", objc_msgSend(v42, "currentInputType") == 1);
        objc_msgSend(v42, "velocityInView:", v12);
        -[SBGestureSwitcherModifierEvent setVelocityInContainerView:](v15, "setVelocityInContainerView:");
        objc_msgSend(v42, "translationInView:", v12);
        -[SBGestureSwitcherModifierEvent setTranslationInContainerView:](v15, "setTranslationInContainerView:");
        -[SBGestureSwitcherModifierEvent setHysteresis:](v15, "setHysteresis:", 10.0);
        objc_msgSend(v42, "locationInView:", v12);
        -[SBGestureSwitcherModifierEvent setLocationInContainerView:](v15, "setLocationInContainerView:");
        v43 = objc_msgSend(v42, "endReason");

        -[SBScrunchGestureSwitcherModifierEvent setIndirectPanEndReason:](v15, "setIndirectPanEndReason:", v43);
        v14 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherGestureWorkspaceTransaction.m"), 295, CFSTR("Unknown gesture recognizer: %@"), v10);

        v14 = 0;
        v15 = 0;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBGestureSwitcherModifierEvent setTouchHistoryProvider:](v15, "setTouchHistoryProvider:", v10);
  -[SBGestureSwitcherModifierEvent setTouchType:](v15, "setTouchType:", v14);
  -[SBGestureSwitcherModifierEvent setPointerTouch:](v15, "setPointerTouch:", self->_isPointerTouch);
  -[SBGestureSwitcherModifierEvent setHidEventSenderID:](v15, "setHidEventSenderID:", self->_hidEventSenderID);
  objc_msgSend(v10, "lastTouchTimestamp");
  -[SBGestureSwitcherModifierEvent setLastTouchTimestamp:](v15, "setLastTouchTimestamp:");
  -[SBGestureSwitcherModifierEvent setCanceled:](v15, "setCanceled:", objc_msgSend(v10, "state") == 4);

  return v15;
}

- (BOOL)shouldSuppressMedusaKeyboardDuringGesture
{
  return 0;
}

- (void)_willInterruptWithReason:(id)a3
{
  NSTimer *activateScenesTimer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction _willInterruptWithReason:](&v5, sel__willInterruptWithReason_, a3);
  -[NSMutableSet removeAllObjects](self->_layoutTransitionCompletions, "removeAllObjects");
  -[NSTimer invalidate](self->_activateScenesTimer, "invalidate");
  activateScenesTimer = self->_activateScenesTimer;
  self->_activateScenesTimer = 0;

  -[SBFluidSwitcherGestureWorkspaceTransaction _failRunningLayoutStateTransition](self, "_failRunningLayoutStateTransition");
  -[NSMutableDictionary removeAllObjects](self->_pendingSceneUpdateTransactionsBySceneIdentifier, "removeAllObjects");
}

- (void)_didInterruptWithReason:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction _didInterruptWithReason:](&v6, sel__didInterruptWithReason_, a3);
  -[SBSystemGestureWorkspaceTransaction finishWithCompletionType:](self, "finishWithCompletionType:", 1);
  if (self->_shouldCancelGestureUponInterruption)
  {
    -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 0);

    -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 1);

  }
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SBFluidSwitcherGestureWorkspaceTransaction finalRootTransaction](self, "finalRootTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SBFluidSwitcherGestureWorkspaceTransaction finalRootTransaction](self, "finalRootTransaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canInterruptForTransitionRequest:", v4);

  }
  else
  {
    v7 = +[SBToAppsWorkspaceTransaction canInterruptTransaction:forTransitionRequest:](SBToAppsWorkspaceTransaction, "canInterruptTransaction:forTransitionRequest:", 0, v4);
  }

  return v7;
}

- (void)interceptTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "finalize");
  -[SBFluidSwitcherGestureWorkspaceTransaction _runSceneLayoutTransactionForTransitionRequest:updateScenes:](self, "_runSceneLayoutTransactionForTransitionRequest:updateScenes:", v4, 1);
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherController](self, "switcherController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "performTransitionWithContext:animated:completion:", v5, 1, 0);
}

- (void)_begin
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBStringForFluidSwitcherGestureType(objc_msgSend(a1, "_gestureType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, v4, "Began fluid switcher gesture transaction of type: %@.", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_2();
}

void __52__SBFluidSwitcherGestureWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAcquiredTransientOverlayViewController:", v5) & 1) == 0
    && objc_msgSend(*(id *)(a1 + 40), "isPresentingViewController:", v5))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v6, "setObject:forKey:", v5, v10);
  }

}

void __52__SBFluidSwitcherGestureWorkspaceTransaction__begin__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
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
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKey:", v7, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "addAcquiredTransientOverlayViewController:forAppLayout:", v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)_childTransactionDidComplete:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  v4 = a3;
  -[SBFluidSwitcherGestureWorkspaceTransaction _childTransactionDidComplete:](&v11, sel__childTransactionDidComplete_, v4);
  v5 = objc_opt_class();
  SBSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "applicationSceneEntity", v11.receiver, v11.super_class);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sceneHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sceneIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableSet removeObject:](self->_sceneIdentifiersWithSceneUpdateTransactionsInProgress, "removeObject:", v9);
    -[NSMutableDictionary objectForKey:](self->_pendingSceneUpdateTransactionsBySceneIdentifier, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_pendingSceneUpdateTransactionsBySceneIdentifier, "removeObjectForKey:", v9);
      if ((-[SBFluidSwitcherGestureWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) == 0)
        -[SBFluidSwitcherGestureWorkspaceTransaction _startSceneUpdateTransaction:forSceneIdentifier:](self, "_startSceneUpdateTransaction:forSceneIdentifier:", v10, v9);
    }

  }
}

- (void)_didComplete
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBStringForFluidSwitcherGestureType(objc_msgSend(a1, "_gestureType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, v4, "Completed fluid switcher gesture transaction of type: %@.", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)systemGestureStateChanged:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (-[SBFluidSwitcherGestureWorkspaceTransaction isRunning](self, "isRunning"))
  {
    -[SBFluidSwitcherGestureWorkspaceTransaction _switcherGestureDidUpdate:](self, "_switcherGestureDidUpdate:", v4);
  }
  else
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBFluidSwitcherGestureWorkspaceTransaction systemGestureStateChanged:].cold.1(self, v4, v5);

  }
}

- (void)_finishWithCompletionType:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  -[SBSystemGestureWorkspaceTransaction _finishWithCompletionType:](&v4, sel__finishWithCompletionType_, a3);
  -[SBFluidSwitcherGestureWorkspaceTransaction removeMilestone:](self, "removeMilestone:", CFSTR("trackingGesture"));
}

- (void)didEndAllAnimations
{
  id v3;

  -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureWorkspaceTransaction _switcherGestureDidUpdate:](self, "_switcherGestureDidUpdate:", v3);

}

- (void)_switcherGestureDidUpdate:(id)a3
{
  SBUISwitcherAnimationController *animationController;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_calledBeginWithGesture
    || (-[SBFluidSwitcherGestureWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) == 0)
  {
    animationController = self->_animationController;
    if (!animationController
      || -[SBUISwitcherAnimationController isInterruptible](animationController, "isInterruptible"))
    {
      -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pipViewMorphAnimator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "addObserver:", self);
      }
      else
      {
        if (!self->_calledBeginWithGesture)
        {
          self->_calledBeginWithGesture = 1;
          -[SBFluidSwitcherGestureWorkspaceTransaction _willBeginWithGesture:](self, "_willBeginWithGesture:", v8);
          -[SBFluidSwitcherGestureWorkspaceTransaction _beginWithGesture:](self, "_beginWithGesture:", v8);
        }
        if (objc_msgSend(v8, "state") != 1)
        {
          if (objc_msgSend(v8, "state") == 2)
          {
            -[SBFluidSwitcherGestureWorkspaceTransaction _updateWithGesture:](self, "_updateWithGesture:", v8);
          }
          else
          {
            -[SBFluidSwitcherGestureWorkspaceTransaction _finishWithGesture:](self, "_finishWithGesture:", v8);
            self->_calledBeginWithGesture = 0;
          }
        }
      }

    }
  }

}

- (void)_willBeginWithGesture:(id)a3
{
  NSUUID *v4;
  NSUUID *gestureID;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", a3);
  v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  gestureID = self->_gestureID;
  self->_gestureID = v4;

  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willBeginGestureWithType:identifier:", -[SBFluidSwitcherGestureWorkspaceTransaction _gestureType](self, "_gestureType"), self->_gestureID);

}

- (void)_beginWithGesture:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  SBWorkspaceApplicationSceneTransitionContext *v11;
  void *v12;
  SBMainWorkspaceTransaction *finalRootTransaction;
  SBMainWorkspaceTransaction *v14;
  SBUISwitcherAnimationController *animationController;
  SBAutoPIPWorkspaceTransaction *autoPIPWorkspaceTransaction;
  SBSceneLayoutWorkspaceTransaction *layoutTransaction;
  NSMutableSet *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSTimer *activateScenesTimer;
  void *v23;
  void *v24;
  void *v25;
  unint64_t SenderID;
  void *v27;
  SBFluidSwitcherGesture *v28;
  void *v29;
  void *v30;
  id WeakRetained;
  void *v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  SBFluidSwitcherGestureWorkspaceTransaction *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSystemGestureAppSwitcher();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v41 = v7;
    v42 = 2050;
    v43 = self;
    v44 = 2114;
    v45 = v9;
    v46 = 2050;
    v47 = v4;
    v48 = 2114;
    v49 = v10;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Begin with gesture recognizer: <%{public}@:%{public}p> (%{public}@)", buf, 0x34u);

  }
  v11 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
  -[SBFluidSwitcherGestureWorkspaceTransaction _transitionRequestForApplicationTransitionContext:eventLabel:](self, "_transitionRequestForApplicationTransitionContext:eventLabel:", v11, CFSTR("InterruptingGesture"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSource:", 11);
  finalRootTransaction = self->_finalRootTransaction;
  if (finalRootTransaction)
  {
    -[SBWorkspaceTransaction interruptForTransitionRequest:](finalRootTransaction, "interruptForTransitionRequest:", v12);
    v14 = self->_finalRootTransaction;
    self->_finalRootTransaction = 0;

  }
  -[SBUISwitcherAnimationController interruptWithReason:](self->_animationController, "interruptWithReason:", CFSTR("InterruptingGesture"));
  animationController = self->_animationController;
  self->_animationController = 0;

  -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](self->_autoPIPWorkspaceTransaction, "setCompletionBlock:", 0);
  if (-[SBAutoPIPWorkspaceTransaction isRunning](self->_autoPIPWorkspaceTransaction, "isRunning"))
    -[SBAutoPIPWorkspaceTransaction interruptWithReason:](self->_autoPIPWorkspaceTransaction, "interruptWithReason:", CFSTR("InterruptingGesture"));
  autoPIPWorkspaceTransaction = self->_autoPIPWorkspaceTransaction;
  self->_autoPIPWorkspaceTransaction = 0;

  -[SBWorkspaceTransaction interruptForTransitionRequest:](self->_layoutTransaction, "interruptForTransitionRequest:", v12);
  layoutTransaction = self->_layoutTransaction;
  self->_layoutTransaction = 0;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = self->_ancillaryLayoutTransactions;
  v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v36;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v21++), "interruptForTransitionRequest:", v12);
      }
      while (v19 != v21);
      v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v19);
  }

  -[NSMutableSet removeAllObjects](self->_ancillaryLayoutTransactions, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_layoutTransitionCompletions, "removeAllObjects");
  -[NSTimer invalidate](self->_activateScenesTimer, "invalidate");
  activateScenesTimer = self->_activateScenesTimer;
  self->_activateScenesTimer = 0;

  -[SBFluidSwitcherGestureWorkspaceTransaction _updateDigitizerSurfaceDimensions](self, "_updateDigitizerSurfaceDimensions");
  objc_msgSend(v4, "_activeEventOfType:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_activeTouchesForEvent:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "anyObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isPointerTouch = objc_msgSend(v25, "_isPointerTouch");

  SenderID = objc_msgSend(v23, "_hidEvent");
  if (SenderID)
    SenderID = IOHIDEventGetSenderID();
  self->_hidEventSenderID = SenderID;
  objc_initWeak((id *)buf, self);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __64__SBFluidSwitcherGestureWorkspaceTransaction__beginWithGesture___block_invoke;
  v33[3] = &unk_1E8EA6B00;
  objc_copyWeak(&v34, (id *)buf);
  v27 = (void *)MEMORY[0x1D17E5550](v33);
  v28 = -[SBFluidSwitcherGesture initWithType:eventProvider:]([SBFluidSwitcherGesture alloc], "initWithType:eventProvider:", -[SBFluidSwitcherGestureWorkspaceTransaction _gestureType](self, "_gestureType"), v27);
  -[SBFluidSwitcherGesture _setState:](v28, "_setState:", 1);
  -[SBFluidSwitcherGestureWorkspaceTransaction selectedAppLayout](self, "selectedAppLayout");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGesture _setSelectedAppLayout:](v28, "_setSelectedAppLayout:", v29);

  -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGesture _setGestureRecognizerForStudyLog:](v28, "_setGestureRecognizerForStudyLog:", v30);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "fluidSwitcherGestureTransaction:didBeginGesture:", self, v28);

  -[SBFluidSwitcherGestureWorkspaceTransaction backgroundingScenesDeactivationAssertion](self, "backgroundingScenesDeactivationAssertion");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "relinquish");

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);

}

id __64__SBFluidSwitcherGestureWorkspaceTransaction__beginWithGesture___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_currentGestureEventForGesture:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateWithGesture:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  -[SBFluidSwitcherGestureWorkspaceTransaction _updateDigitizerSurfaceDimensions](self, "_updateDigitizerSurfaceDimensions", a3);
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeGesture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_setState:", 2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "fluidSwitcherGestureTransaction:didUpdateGesture:", self, v5);

}

- (void)_finishWithGesture:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  int v15;
  void *v16;
  __int16 v17;
  SBFluidSwitcherGestureWorkspaceTransaction *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogSystemGestureAppSwitcher();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBSystemGestureRecognizerStateDescription(objc_msgSend(v4, "state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544386;
    v16 = v7;
    v17 = 2050;
    v18 = self;
    v19 = 2114;
    v20 = v9;
    v21 = 2050;
    v22 = v4;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Finish with gesture recognizer: <%{public}@:%{public}p> (%{public}@)", (uint8_t *)&v15, 0x34u);

  }
  -[SBFluidSwitcherGestureWorkspaceTransaction _updatePPTsForGestureEnded](self, "_updatePPTsForGestureEnded");
  self->_hasCompletedAtLeastOneGesture = 1;
  -[SBFluidSwitcherGestureWorkspaceTransaction _updateDigitizerSurfaceDimensions](self, "_updateDigitizerSurfaceDimensions");
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activeGesture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_setState:", 3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "fluidSwitcherGestureTransaction:didEndGesture:", self, v13);

}

- (void)setSelectedAppLayout:(id)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  SBAppLayout *v8;

  v8 = (SBAppLayout *)a3;
  if (self->_selectedAppLayout != v8)
  {
    objc_storeStrong((id *)&self->_selectedAppLayout, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
    objc_msgSend(WeakRetained, "layoutContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeGesture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setSelectedAppLayout:", v8);

  }
}

- (BOOL)isLiveResize
{
  return 0;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureWorkspaceTransaction _windowSceneForWorkspaceTransitionRequest:](self, "_windowSceneForWorkspaceTransitionRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "layoutStateTransitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutStateForApplicationTransitionContext:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureWorkspaceTransaction _switcherControllerForWorkspaceTransitionRequest:](self, "_switcherControllerForWorkspaceTransitionRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_activeLayoutStatesBySwitcherController, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationTransitionContext:frameForApplicationSceneEntity:", v6, v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)transactionDidComplete:(id)a3
{
  SBSceneLayoutWorkspaceTransaction *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  SBSceneLayoutWorkspaceTransaction *v10;
  _BOOL4 v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  SBUISwitcherAnimationController *animationController;
  SBAutoPIPWorkspaceTransaction *autoPIPWorkspaceTransaction;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSTimer *activateScenesTimer;
  NSMutableSet *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  SBSceneLayoutWorkspaceTransaction *v26;
  SBSceneLayoutWorkspaceTransaction *layoutTransaction;
  SBSceneLayoutWorkspaceTransaction *v28;
  NSMutableSet *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  SBSceneLayoutWorkspaceTransaction *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  id v43;
  objc_class *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id location;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  SBFluidSwitcherGestureWorkspaceTransaction *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  SBSceneLayoutWorkspaceTransaction *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = (SBSceneLayoutWorkspaceTransaction *)a3;
  SBLogSystemGestureAppSwitcher();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v62 = v7;
    v63 = 2050;
    v64 = self;
    v65 = 2114;
    v66 = v9;
    v67 = 2050;
    v68 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Transaction did complete: <%{public}@:%{public}p>", buf, 0x2Au);

  }
  -[SBFluidSwitcherGestureWorkspaceTransaction animationController](self, "animationController");
  v10 = (SBSceneLayoutWorkspaceTransaction *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == v4;

  if (v11)
  {
    -[SBUIWorkspaceAnimationController workspaceTransitionRequest](self->_animationController, "workspaceTransitionRequest");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "completionBlock");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v48, "completionBlock");
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13[2](v13, 1);

    }
    animationController = self->_animationController;
    self->_animationController = 0;

    autoPIPWorkspaceTransaction = self->_autoPIPWorkspaceTransaction;
    self->_autoPIPWorkspaceTransaction = 0;

    if ((-[SBSceneLayoutWorkspaceTransaction isInterrupted](v4, "isInterrupted") & 1) == 0)
    {
      -[SBFluidSwitcherGestureWorkspaceTransaction _copiedTransitionRequestFromTransitionRequest:](self, "_copiedTransitionRequestFromTransitionRequest:", v48);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "applicationContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAnimationDisabled:", 1);

      objc_msgSend(v16, "transientOverlayContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAnimated:", 0);

      objc_msgSend(v16, "finalize");
      objc_msgSend(v16, "applicationContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layoutState");
      v46 = objc_claimAutoreleasedReturnValue();

      -[SBFluidSwitcherGestureWorkspaceTransaction _updatePPTsForAnimationEndedWithFinalLayoutState:](self, "_updatePPTsForAnimationEndedWithFinalLayoutState:", v46);
      -[SBFluidSwitcherGestureWorkspaceTransaction setSelectedAppLayout:](self, "setSelectedAppLayout:", 0);
      -[NSTimer invalidate](self->_activateScenesTimer, "invalidate");
      activateScenesTimer = self->_activateScenesTimer;
      self->_activateScenesTimer = 0;

      if (-[NSMutableSet count](self->_layoutTransitionCompletions, "count"))
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v21 = self->_layoutTransitionCompletions;
        v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v58;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v58 != v23)
                objc_enumerationMutation(v21);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v24++) + 16))();
            }
            while (v22 != v24);
            v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
          }
          while (v22);
        }

        -[NSMutableSet removeAllObjects](self->_layoutTransitionCompletions, "removeAllObjects");
      }
      else
      {
        -[SBFluidSwitcherGestureWorkspaceTransaction _failRunningLayoutStateTransition](self, "_failRunningLayoutStateTransition");
      }
      layoutTransaction = self->_layoutTransaction;
      if (layoutTransaction)
      {
        -[SBWorkspaceTransaction interruptForTransitionRequest:](layoutTransaction, "interruptForTransitionRequest:", v16);
        v28 = self->_layoutTransaction;
        self->_layoutTransaction = 0;

      }
      if (-[NSMutableSet count](self->_ancillaryLayoutTransactions, "count", v46))
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v29 = self->_ancillaryLayoutTransactions;
        v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v54;
          do
          {
            v32 = 0;
            do
            {
              if (*(_QWORD *)v54 != v31)
                objc_enumerationMutation(v29);
              objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v32++), "interruptForTransitionRequest:", v16);
            }
            while (v30 != v32);
            v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
          }
          while (v30);
        }

        -[NSMutableSet removeAllObjects](self->_ancillaryLayoutTransactions, "removeAllObjects");
      }
      if (objc_msgSend(v47, "unlockedEnvironmentMode") == 1)
        objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:updateMirroredDisplays:animated:logMessage:", objc_msgSend((id)SBApp, "interfaceOrientationForCurrentDeviceOrientation:", 0), 1, 1, CFSTR("SBFluidSwitcherGestureWorkspaceTransaction completed transition to home screen"));
      -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "workspace");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "transactionForTransitionRequest:", v16);
      v35 = (SBSceneLayoutWorkspaceTransaction *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_finalRootTransaction, v35);
      v36 = objc_opt_class();
      SBSafeCast(v36, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
        objc_msgSend(v37, "_setShouldSerialDismissOverlays:", 0);
      objc_initWeak(&location, self);
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __69__SBFluidSwitcherGestureWorkspaceTransaction_transactionDidComplete___block_invoke;
      v49[3] = &unk_1E8EA6B28;
      objc_copyWeak(&v51, &location);
      v49[4] = self;
      v39 = v16;
      v50 = v39;
      -[SBSceneLayoutWorkspaceTransaction setCompletionBlock:](v35, "setCompletionBlock:", v49);
      -[SBFluidSwitcherGestureWorkspaceTransaction _switcherControllerForWorkspaceTransitionRequest:](self, "_switcherControllerForWorkspaceTransitionRequest:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable setObject:forKey:](self->_activeLayoutStatesBySwitcherController, "setObject:forKey:", v47, v40);
      SBLogSystemGestureAppSwitcher();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (id)objc_claimAutoreleasedReturnValue();
        v44 = (objc_class *)objc_opt_class();
        NSStringFromClass(v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v62 = v43;
        v63 = 2050;
        v64 = self;
        v65 = 2114;
        v66 = v45;
        v67 = 2050;
        v68 = v35;
        v69 = 2114;
        v70 = v47;
        _os_log_impl(&dword_1D0540000, v41, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Running final root transaction: <%{public}@:%{public}p> to transition to layout state: %{public}@", buf, 0x34u);

      }
      -[SBFluidSwitcherGestureWorkspaceTransaction _addChildWorkspaceTransaction:](self, "_addChildWorkspaceTransaction:", v35);

      objc_destroyWeak(&v51);
      objc_destroyWeak(&location);

    }
  }
  else if (self->_layoutTransaction == v4)
  {
    -[SBFluidSwitcherGestureWorkspaceTransaction backgroundingScenesDeactivationAssertion](self, "backgroundingScenesDeactivationAssertion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "relinquish");

    v26 = self->_layoutTransaction;
    self->_layoutTransaction = 0;

  }
  else if (-[NSMutableSet containsObject:](self->_ancillaryLayoutTransactions, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_ancillaryLayoutTransactions, "removeObject:", v4);
  }

}

void __69__SBFluidSwitcherGestureWorkspaceTransaction_transactionDidComplete___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    SBLogSystemGestureAppSwitcher();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "finalRootTransaction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "finalRootTransaction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v5;
      v17 = 2050;
      v18 = WeakRetained;
      v19 = 2114;
      v20 = v8;
      v21 = 2050;
      v22 = v9;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Transaction did complete: <%{public}@:%{public}p>", (uint8_t *)&v15, 0x2Au);

    }
    objc_msgSend(WeakRetained, "gestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "state");

    if ((unint64_t)(v11 - 3) > 0xFFFFFFFFFFFFFFFDLL
      || (objc_msgSend(WeakRetained, "animationController"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v12))
    {
      objc_msgSend(*(id *)(a1 + 32), "_switcherControllerForWorkspaceTransitionRequest:", *(_QWORD *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layoutState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[44], "setObject:forKey:", v14, v13);

    }
    else
    {
      objc_msgSend(WeakRetained, "finishWithCompletionType:", 1);
    }
    objc_msgSend(WeakRetained, "setFinalRootTransaction:", 0);
  }

}

- (id)createSceneEntityForHandle:(id)a3
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;

  v3 = a3;
  v4 = -[SBDeviceApplicationSceneEntity initWithApplicationSceneHandle:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", v3);

  return v4;
}

- (void)transaction:(id)a3 performTransitionWithCompletion:(id)a4
{
  SBSceneLayoutWorkspaceTransaction *v6;
  void (**v7)(_QWORD);
  void *v8;
  NSMutableSet *layoutTransitionCompletions;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = (SBSceneLayoutWorkspaceTransaction *)a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = v7;
  if (self->_animationController)
  {
    layoutTransitionCompletions = self->_layoutTransitionCompletions;
    v10 = (void *)objc_msgSend(v7, "copy");
    v11 = (void *)MEMORY[0x1D17E5550]();
    -[NSMutableSet addObject:](layoutTransitionCompletions, "addObject:", v11);

  }
  else if (v7)
  {
    v7[2](v7);
  }
  if (self->_layoutTransaction == v6 && -[NSMutableSet count](self->_ancillaryLayoutTransactions, "count"))
  {
    v30 = v8;
    -[SBWorkspaceTransaction displayIdentity](v6, "displayIdentity");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "windowSceneManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v12;
    objc_msgSend(v13, "windowSceneForDisplayIdentity:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "switcherController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v28, "isChamoisWindowingUIEnabled");
    objc_msgSend(v14, "sceneManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransaction transitionRequest](v6, "transitionRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "applicationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "elements");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v20;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v37;
      v24 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = v24;
          v32[1] = 3221225472;
          v32[2] = __90__SBFluidSwitcherGestureWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke;
          v32[3] = &unk_1E8EA6B50;
          v33 = v16;
          v34 = v26;
          v35 = v15;
          objc_msgSend(v27, "enumerateSceneManagersWithBlock:", v32);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v22);
    }

    v8 = v30;
  }

}

void __90__SBFluidSwitcherGestureWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "allScenes", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if (v13)
          {
            objc_msgSend(v10, "identity");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "transferOwnershipOfSceneWithIdentity:toSceneManager:", v14, *(_QWORD *)(a1 + 32));

            objc_msgSend(*(id *)(a1 + 32), "existingSceneHandleForScene:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_opt_class();
            v17 = v15;
            if (v16)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v18 = v17;
              else
                v18 = 0;
            }
            else
            {
              v18 = 0;
            }
            v19 = v18;

            objc_msgSend(v19, "setWantsEnhancedWindowingEnabled:", *(unsigned __int8 *)(a1 + 48));
            goto LABEL_17;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_17:

  }
}

- (void)transaction:(id)a3 didEndLayoutTransitionWithContinuation:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (BOOL)transaction:(id)a3 shouldKeepSceneForeground:(id)a4 withReason:(id *)a5
{
  int64_t v6;

  v6 = -[SBFluidSwitcherGestureWorkspaceTransaction _gestureType](self, "_gestureType", a3, a4);
  if (a5 && v6 == 8)
    *a5 = CFSTR("window drag");
  return v6 == 8;
}

- (void)handleTransitionRequestForGestureUpdate:(id)a3 fromGestureManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  SBApplicationSceneUpdateTransaction *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  BOOL v51;
  void *v53;
  id v54;
  id v55;
  id v56;
  int v57;
  void *v58;
  id obj;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  SBFluidSwitcherGestureWorkspaceTransaction *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  SBFluidSwitcherGestureWorkspaceTransaction *v71;
  id v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  _BYTE v78[128];
  uint64_t v79;
  CGRect v80;
  CGRect v81;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v63 = self;
  v56 = a4;
  -[SBFluidSwitcherGestureWorkspaceTransaction _workspaceTransitionRequestForSwitcherTransitionRequest:fromGestureManager:withEventLabel:](self, "_workspaceTransitionRequestForSwitcherTransitionRequest:fromGestureManager:withEventLabel:", v6);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "switcherController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "applicationContext");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  objc_msgSend(v7, "switcherCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __105__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureUpdate_fromGestureManager___block_invoke;
  v69[3] = &unk_1E8EA6B78;
  v54 = v6;
  v70 = v54;
  v71 = v63;
  v73 = &v74;
  v55 = v7;
  v72 = v55;
  objc_msgSend(v8, "enumerateSwitcherControllersWithBlock:", v69);

  objc_msgSend(v58, "setCrossingDisplays:", *((unsigned __int8 *)v75 + 24));
  v9 = objc_msgSend(v55, "isChamoisWindowingUIEnabled");
  v10 = objc_msgSend(v60, "isInLiveResize");
  if (*((_BYTE *)v75 + 24))
    v11 = 1;
  else
    v11 = v9;
  v12 = v10 ^ 1;
  if (v11 != 1 || !v12)
  {
    objc_msgSend(v58, "finalize");
    v57 = v12;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(v60, "entities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    if (!v14)
      goto LABEL_34;
    v61 = *(_QWORD *)v66;
    obj = v13;
    while (1)
    {
      v62 = v14;
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v66 != v61)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        if (objc_msgSend(v16, "isApplicationSceneEntity"))
        {
          v17 = v16;
          v18 = -[SBApplicationSceneUpdateTransaction initWithApplicationSceneEntity:transitionRequest:]([SBApplicationSceneUpdateTransaction alloc], "initWithApplicationSceneEntity:transitionRequest:", v17, v58);
          objc_msgSend(v17, "sceneHandle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "sceneIfExists");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            v64 = v21;
          }
          else
          {
            objc_msgSend(v19, "sceneIdentifier");
            v64 = (id)objc_claimAutoreleasedReturnValue();
          }

          v23 = -[SBFluidSwitcherGestureWorkspaceTransaction _sceneUpdateTransactionIsForLiveResize:](v63, "_sceneUpdateTransactionIsForLiveResize:", v18);
          objc_msgSend(v20, "settings");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "frame");
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v32 = v31;

          if (objc_msgSend(v17, "supportsPresentationAtAnySize"))
          {
            objc_msgSend(v60, "frameForApplicationSceneEntity:", v17);
            v34 = v33;
            v36 = v35;
            v38 = v37;
            v40 = v39;
          }
          else
          {
            -[SBApplicationSceneUpdateTransaction sceneSettings](v18, "sceneSettings");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "frame");
            v34 = v42;
            v36 = v43;
            v38 = v44;
            v40 = v45;

          }
          objc_msgSend(v20, "settings");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "interfaceOrientation");

          objc_msgSend(v60, "layoutState");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uniqueIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v48, "interfaceOrientationForElementIdentifier:", v49);

          if (!v20)
            goto LABEL_30;
          if (((v57 | v23) & 1) != 0)
            goto LABEL_38;
          v80.origin.x = v26;
          v80.origin.y = v28;
          v80.size.width = v30;
          v80.size.height = v32;
          v81.origin.x = v34;
          v81.origin.y = v36;
          v81.size.width = v38;
          v81.size.height = v40;
          v51 = CGRectEqualToRect(v80, v81);
          if (v47 != v50 || !v51)
          {
LABEL_38:
            if (v23
              && -[NSMutableSet containsObject:](v63->_sceneIdentifiersWithSceneUpdateTransactionsInProgress, "containsObject:", v64))
            {
              -[NSMutableDictionary objectForKey:](v63->_pendingSceneUpdateTransactionsBySceneIdentifier, "objectForKey:", v64);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              if (v53)
                -[NSMutableDictionary removeObjectForKey:](v63->_pendingSceneUpdateTransactionsBySceneIdentifier, "removeObjectForKey:", v64);
              -[NSMutableDictionary setObject:forKey:](v63->_pendingSceneUpdateTransactionsBySceneIdentifier, "setObject:forKey:", v18, v64);

              goto LABEL_31;
            }
LABEL_30:
            -[SBFluidSwitcherGestureWorkspaceTransaction _startSceneUpdateTransaction:forSceneIdentifier:](v63, "_startSceneUpdateTransaction:forSceneIdentifier:", v18, v64);
          }
LABEL_31:

          continue;
        }
      }
      v13 = obj;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
      if (!v14)
      {
LABEL_34:

        goto LABEL_35;
      }
    }
  }
  objc_msgSend(v58, "modifyApplicationContext:", &__block_literal_global_70);
  objc_msgSend(v58, "finalize");
  -[SBFluidSwitcherGestureWorkspaceTransaction _runSceneLayoutTransactionForTransitionRequest:updateScenes:](v63, "_runSceneLayoutTransactionForTransitionRequest:updateScenes:", v58, 1);
LABEL_35:

  _Block_object_dispose(&v74, 8);
}

void __105__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureUpdate_fromGestureManager___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  id v12;

  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "appLayout");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[5] + 352), "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatingAppLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEqual:", a1[6]);

  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else if ((objc_msgSend(v8, "containsAnyItemFromAppLayout:", v12) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v11 = objc_msgSend(v9, "containsAnyItemFromAppLayout:", v12);
  }
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v11;
  *a3 = *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24);

}

void __105__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureUpdate_fromGestureManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "applicationSceneEntities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_each:", &__block_literal_global_71);

}

uint64_t __105__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureUpdate_fromGestureManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFlag:forActivationSetting:", 1, 9);
}

- (BOOL)_sceneUpdateTransactionIsForLiveResize:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_opt_class();
  objc_msgSend(v3, "applicationSceneEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "inLiveResize");
  return (char)v6;
}

- (void)_startSceneUpdateTransaction:(id)a3 forSceneIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id WeakRetained;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "applicationSceneEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sceneIfExists");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_5;
  objc_msgSend(v10, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(v6, "sceneSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  objc_msgSend(v10, "settings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "interfaceOrientation");

  objc_msgSend(v6, "sceneSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "interfaceOrientation");

  if (!-[SBFluidSwitcherGestureWorkspaceTransaction _sceneUpdateTransactionIsForLiveResize:](self, "_sceneUpdateTransactionIsForLiveResize:", v6))goto LABEL_5;
  v60.origin.x = v13;
  v60.origin.y = v15;
  v60.size.width = v17;
  v60.size.height = v19;
  v61.origin.x = v22;
  v61.origin.y = v24;
  v61.size.width = v26;
  v61.size.height = v28;
  if (!CGRectEqualToRect(v60, v61) || v30 != v32)
  {
LABEL_5:
    v51 = v10;
    -[NSMutableSet addObject:](self->_sceneIdentifiersWithSceneUpdateTransactionsInProgress, "addObject:", v7);
    v52 = v6;
    -[SBFluidSwitcherGestureWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v6, 0);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
    objc_msgSend(WeakRetained, "liveContentOverlays");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v55 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          if (!objc_msgSend(v38, "type"))
          {
            objc_msgSend(v38, "itemForLayoutRole:", 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "uniqueIdentifier");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isEqual:", v7);

            if (v41)
            {
              objc_msgSend(WeakRetained, "liveContentOverlays");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectForKey:", v38);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v52, "sceneSettings");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "frame");
                v46 = v45;
                v48 = v47;

                objc_msgSend(v52, "sceneSettings");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = objc_msgSend(v49, "interfaceOrientation");

                objc_msgSend(v43, "setContentReferenceSize:interfaceOrientation:", v50, v46, v48);
              }

              goto LABEL_18;
            }
          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        if (v35)
          continue;
        break;
      }
    }
LABEL_18:

    v10 = v51;
    v6 = v52;
  }

}

- (void)handleTransitionRequestForGestureComplete:(id)a3 fromGestureManager:(id)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBUISwitcherAnimationController *animationController;
  uint64_t v22;
  void *v23;
  SBUISwitcherAnimationController *v24;
  SBUISwitcherAnimationController *v25;
  SBUISwitcherAnimationController *v26;
  void *v27;
  int IsYes;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  SBUISwitcherAnimationController *v34;
  _BOOL4 v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  char v42;
  SBAutoPIPWorkspaceTransaction *v43;
  SBAutoPIPWorkspaceTransaction *autoPIPWorkspaceTransaction;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  SBAutoPIPWorkspaceTransaction *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  char v54;
  void *v55;
  int v56;
  int64_t numberOfAppLayoutsTraveledWithArcSwipe;
  double v58;
  void *v59;
  NSTimer *v60;
  NSTimer *activateScenesTimer;
  void *v62;
  _BOOL4 v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  _QWORD v71[4];
  NSObject *v72;
  id v73;
  char v74;
  _QWORD v75[4];
  id v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  SBFluidSwitcherGestureWorkspaceTransaction *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v69 = a4;
  objc_msgSend(v6, "appLayout");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unlockedEnvironmentMode");
  v8 = objc_msgSend(v6, "floatingConfiguration");
  objc_msgSend(v6, "floatingSwitcherVisible");
  -[NSMutableDictionary removeAllObjects](self->_pendingSceneUpdateTransactionsBySceneIdentifier, "removeAllObjects");
  LODWORD(a4) = -[SBFluidSwitcherGestureWorkspaceTransaction isInterrupted](self, "isInterrupted");
  SBLogSystemGestureAppSwitcher();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if ((_DWORD)a4)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      SBStringForUnlockedEnvironmentMode(v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      SBStringForFloatingConfiguration(v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      BSSettingFlagDescription();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v78 = v12;
      v79 = 2050;
      v80 = self;
      v81 = 2114;
      v82 = v70;
      v83 = 2114;
      v84 = v13;
      v85 = 2114;
      v86 = v14;
      v87 = 2114;
      v88 = v15;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> skipping adding final child transaction, because current transaction interrupted: appLayout: %{public}@, unlockedEnvironmentMode: %{public}@, floatingConfiguration: %{public}@, floatingSwitcherVisible: %{public}@", buf, 0x3Eu);

    }
    goto LABEL_52;
  }
  if (v10)
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringForUnlockedEnvironmentMode(v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SBStringForFloatingConfiguration(v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    BSSettingFlagDescription();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v78 = v17;
    v79 = 2050;
    v80 = self;
    v81 = 2114;
    v82 = v70;
    v83 = 2114;
    v84 = v18;
    v85 = 2114;
    v86 = v19;
    v87 = 2114;
    v88 = v20;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Adding child transaction to activate appLayout: %{public}@, unlockedEnvironmentMode: %{public}@, floatingConfiguration: %{public}@, floatingSwitcherVisible: %{public}@", buf, 0x3Eu);

  }
  -[SBFluidSwitcherGestureWorkspaceTransaction _workspaceTransitionRequestForSwitcherTransitionRequest:fromGestureManager:withEventLabel:](self, "_workspaceTransitionRequestForSwitcherTransitionRequest:fromGestureManager:withEventLabel:", v6, v69, CFSTR("FinalFluidSwitcherGestureAction"));
  v9 = objc_claimAutoreleasedReturnValue();
  -[NSObject finalize](v9, "finalize");
  objc_msgSend(v69, "switcherController");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "switcherCoordinator");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISwitcherAnimationController interruptWithReason:](self->_animationController, "interruptWithReason:", CFSTR("GestureCompleting"));
  animationController = self->_animationController;
  self->_animationController = 0;

  v22 = objc_opt_class();
  objc_msgSend(v66, "animationControllerForTransitionRequest:", v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v22, v23);
  v24 = (SBUISwitcherAnimationController *)objc_claimAutoreleasedReturnValue();
  v25 = self->_animationController;
  self->_animationController = v24;

  v26 = self->_animationController;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherGestureWorkspaceTransaction.m"), 978, CFSTR("Got a nil animationController back from SBSwitcherController!"));

    v26 = self->_animationController;
  }
  -[SBUIAnimationController addObserver:](v26, "addObserver:", self);
  -[SBFluidSwitcherGestureWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_animationController);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureWorkspaceTransaction _updateMainDisplayIfNecessaryForWorkspaceTransitionRequests:](self, "_updateMainDisplayIfNecessaryForWorkspaceTransitionRequests:", v27);

  if (v7 == 2)
  {
    IsYes = 1;
    goto LABEL_12;
  }
  IsYes = BSSettingFlagIsYes();
  if (v7 != 1)
  {
LABEL_12:
    objc_msgSend(v70, "allItems");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v30, "count") == 0;

    if (((IsYes | v29 | SBFloatingConfigurationIsStashed(v8)) & 1) != 0)
    {
      LOBYTE(v63) = 0;
    }
    else
    {
      -[SBFluidSwitcherGestureWorkspaceTransaction selectedAppLayout](self, "selectedAppLayout");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (objc_msgSend(v70, "isOrContainsAppLayout:", v31) & 1) == 0
         && -[SBFluidSwitcherGestureWorkspaceTransaction _gestureType](self, "_gestureType") != 8;

      v29 = v63;
    }
    goto LABEL_18;
  }
  SBFloatingConfigurationIsStashed(v8);
  LOBYTE(v63) = 0;
  v29 = 1;
LABEL_18:
  -[NSObject applicationContext](v9, "applicationContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layoutState");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSObject applicationContext](v9, "applicationContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "previousLayoutState");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (SBPeekConfigurationIsValid(objc_msgSend(v67, "peekConfiguration"))
    && !SBPeekConfigurationIsValid(objc_msgSend(v65, "peekConfiguration")))
  {
    objc_msgSend(v68, "_dismissMedusaBanner");
  }
  v34 = self->_animationController;
  if (v34)
    v35 = v29;
  else
    v35 = 0;
  if (!v35)
    goto LABEL_37;
  objc_msgSend(v68, "contentViewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_opt_class();
  v38 = v36;
  if (v37)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v38;
    else
      v39 = 0;
  }
  else
  {
    v39 = 0;
  }
  v40 = v39;

  -[NSObject applicationContext](v9, "applicationContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v40, "shouldMorphToPIPForTransitionContext:", v41);

  if ((v42 & 1) != 0)
  {
    v43 = -[SBAutoPIPWorkspaceTransaction initWithTransitionRequest:]([SBAutoPIPWorkspaceTransaction alloc], "initWithTransitionRequest:", v9);
    autoPIPWorkspaceTransaction = self->_autoPIPWorkspaceTransaction;
    self->_autoPIPWorkspaceTransaction = v43;

    -[NSObject transientOverlayContext](v9, "transientOverlayContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "transientOverlay");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "viewController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
    {
      v49 = self->_autoPIPWorkspaceTransaction;
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke;
      v75[3] = &unk_1E8E9E980;
      v76 = v47;
      -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](v49, "setCompletionBlock:", v75);

    }
    -[SBFluidSwitcherGestureWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_autoPIPWorkspaceTransaction);

  }
  if (self->_autoPIPWorkspaceTransaction
    || +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:reason:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:reason:", v9, 1))
  {
    -[SBUISwitcherAnimationController _setInterruptible:](self->_animationController, "_setInterruptible:", 0);
    v50 = 0;
  }
  else
  {
LABEL_37:
    v50 = 1;
  }
  -[SBFluidSwitcherGestureWorkspaceTransaction _acquireBackgroundingScenesDeactivationAssertionForTransitionRequest:](self, "_acquireBackgroundingScenesDeactivationAssertionForTransitionRequest:", v9);
  -[NSMapTable objectForKey:](self->_originalLayoutStatesBySwitcherController, "objectForKey:", v68);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_activeLayoutStatesBySwitcherController, "objectForKey:", v68);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "unlockedEnvironmentMode") != 3)
    goto LABEL_42;
  v53 = objc_msgSend(v70, "type");
  v54 = !v63;
  if (v53)
    v54 = 1;
  if (!((v34 == 0) | v54 & 1))
  {
    -[SBFluidSwitcherGestureWorkspaceTransaction _runSceneLayoutTransactionForTransitionRequest:updateScenes:](self, "_runSceneLayoutTransactionForTransitionRequest:updateScenes:", v9, 0);
    ++self->_numberOfAppLayoutsTraveledWithArcSwipe;
    objc_msgSend(v51, "appLayout");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v70, "isEqual:", v55);

    if (v56)
      self->_numberOfAppLayoutsTraveledWithArcSwipe = 0;
    objc_initWeak((id *)buf, self);
    numberOfAppLayoutsTraveledWithArcSwipe = self->_numberOfAppLayoutsTraveledWithArcSwipe;
    if (numberOfAppLayoutsTraveledWithArcSwipe <= 1)
      numberOfAppLayoutsTraveledWithArcSwipe = 1;
    if ((double)(numberOfAppLayoutsTraveledWithArcSwipe - 1) * 0.5 + 0.1 <= *(double *)&SBFluidSwitcherMaximumActivationDelayForArcSwipes)
      v58 = (double)(numberOfAppLayoutsTraveledWithArcSwipe - 1) * 0.5 + 0.1;
    else
      v58 = *(double *)&SBFluidSwitcherMaximumActivationDelayForArcSwipes;
    v59 = (void *)MEMORY[0x1E0C99E88];
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke_2;
    v71[3] = &unk_1E8EA6BE0;
    objc_copyWeak(&v73, (id *)buf);
    v72 = v9;
    v74 = v50;
    objc_msgSend(v59, "scheduledTimerWithTimeInterval:repeats:block:", 0, v71, v58);
    v60 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    activateScenesTimer = self->_activateScenesTimer;
    self->_activateScenesTimer = v60;

    objc_destroyWeak(&v73);
    objc_destroyWeak((id *)buf);
  }
  else
  {
LABEL_42:
    -[SBFluidSwitcherGestureWorkspaceTransaction _runSceneLayoutTransactionForTransitionRequest:updateScenes:](self, "_runSceneLayoutTransactionForTransitionRequest:updateScenes:", v9, v50);
  }

LABEL_52:
}

uint64_t __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handlePictureInPictureDidBegin");
  return result;
}

void __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke_3;
    v3[3] = &unk_1E8EA2880;
    v4 = *(id *)(a1 + 32);
    SBLayoutRoleEnumerateValidRoles(v3);
    objc_msgSend(WeakRetained, "_runSceneLayoutTransactionForTransitionRequest:updateScenes:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

  }
}

void __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForLayoutRole:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEntity:forLayoutRole:", v7, a2);

    v5 = 0;
  }

}

- (void)_updateMainDisplayIfNecessaryForWorkspaceTransitionRequests:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int IsYes;
  void *v14;
  uint64_t v15;
  BOOL IsStashed;
  id v17;
  int64_t v18;
  int v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __106__SBFluidSwitcherGestureWorkspaceTransaction__updateMainDisplayIfNecessaryForWorkspaceTransitionRequests___block_invoke;
  v26[3] = &unk_1E8EA6C08;
  v26[4] = self;
  objc_msgSend(a3, "bs_firstObjectPassingTest:", v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBWorkspaceTransaction windowScene](self, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "homeScreenController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "appLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "unlockedEnvironmentMode");
    v11 = objc_msgSend(v8, "floatingConfiguration");
    objc_msgSend(v8, "isFloatingSwitcherVisible");
    if (v10 == 2)
    {
      v12 = 1;
    }
    else
    {
      IsYes = BSSettingFlagIsYes();
      if (v10 == 1)
      {
        SBFloatingConfigurationIsStashed(v11);
        LOBYTE(v11) = 1;
        goto LABEL_18;
      }
      v12 = IsYes;
    }
    objc_msgSend(v9, "allItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    IsStashed = SBFloatingConfigurationIsStashed(v11);
    if (v15)
      LODWORD(v11) = v12;
    else
      LODWORD(v11) = 1;
    if ((v11 & 1) == 0 && !IsStashed)
    {
      -[SBFluidSwitcherGestureWorkspaceTransaction selectedAppLayout](self, "selectedAppLayout");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isOrContainsAppLayout:", v17) & 1) != 0)
      {
LABEL_33:

        goto LABEL_34;
      }
      v18 = -[SBFluidSwitcherGestureWorkspaceTransaction _gestureType](self, "_gestureType");

      if (v18 == 8)
        goto LABEL_34;
      goto LABEL_17;
    }
    if (v15)
    {
      if (!(_DWORD)v11)
      {
LABEL_34:

        goto LABEL_35;
      }
LABEL_17:
      v19 = 0;
LABEL_23:
      objc_msgSend(v6, "iconManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v17 = v23;
      }
      else
      {
        +[SBIconController sharedInstance](SBIconController, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "iconManager");
        v17 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (objc_msgSend(v17, "isFolderPageManagementUIVisible"))
      {
        objc_msgSend(v17, "dismissFolderPageManagementUI");
      }
      else if (objc_msgSend(v17, "isShowingModalInteraction"))
      {
        if (v19)
          objc_msgSend(v17, "popModalInteraction");
        else
          objc_msgSend(v17, "dismissModalInteractions");
      }
      else
      {
        objc_msgSend(v17, "setEditing:", 0);
      }
      goto LABEL_33;
    }
LABEL_18:
    v20 = objc_msgSend(v8, "interfaceOrientation");
    objc_msgSend((id)SBApp, "noteInterfaceOrientationChanged:logMessage:", v20, CFSTR("SBFluidSwitcherGestureWorkspaceTransaction running animation to home screen"));
    if (v6)
    {
      v21 = v6;
    }
    else
    {
      +[SBUIController sharedInstance](SBUIController, "sharedInstance");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;
    objc_msgSend(v21, "beginRequiringContentForReason:", CFSTR("SBUIHomeScreenActiveContentRequirementReason"));

    if ((v11 & 1) == 0)
      goto LABEL_34;
    v19 = 1;
    goto LABEL_23;
  }
LABEL_35:

}

uint64_t __106__SBFluidSwitcherGestureWorkspaceTransaction__updateMainDisplayIfNecessaryForWorkspaceTransitionRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "_windowSceneForWorkspaceTransitionRequest:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isMainDisplayWindowScene") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isContinuityDisplayWindowScene");

  return v3;
}

- (void)_acquireBackgroundingScenesDeactivationAssertionForTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[SBFluidSwitcherGestureWorkspaceTransaction _switcherControllerForWorkspaceTransitionRequest:](self, "_switcherControllerForWorkspaceTransitionRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_activeLayoutStatesBySwitcherController, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v4, "applicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "layoutState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "elements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v11);

  if (objc_msgSend(v8, "count"))
  {
    -[SBFluidSwitcherGestureWorkspaceTransaction backgroundingScenesDeactivationAssertion](self, "backgroundingScenesDeactivationAssertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "relinquish");

    -[SBFluidSwitcherGestureWorkspaceTransaction backgroundingScenesDeactivationAssertion](self, "backgroundingScenesDeactivationAssertion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __115__SBFluidSwitcherGestureWorkspaceTransaction__acquireBackgroundingScenesDeactivationAssertionForTransitionRequest___block_invoke;
    v14[3] = &unk_1E8EA3EA0;
    v15 = v8;
    objc_msgSend(v13, "acquireWithPredicate:transitionContext:", v14, 0);

  }
}

uint64_t __115__SBFluidSwitcherGestureWorkspaceTransaction__acquireBackgroundingScenesDeactivationAssertionForTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "workspaceEntity", (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "applicationSceneEntity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sceneHandle");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v10, "sceneIfExists");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v12, "isEqual:", v13);

        if ((v10 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_runSceneLayoutTransactionForTransitionRequest:(id)a3 updateScenes:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  SBSceneLayoutWorkspaceTransaction *layoutTransaction;
  SBSceneLayoutWorkspaceTransaction *v9;
  NSMutableSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _BOOL8 v15;
  void *v16;
  void *v17;
  SBSceneLayoutWorkspaceTransaction *v18;
  SBSceneLayoutWorkspaceTransaction *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  SBSceneLayoutWorkspaceTransaction *v25;
  NSMutableSet *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  SBFluidSwitcherGestureWorkspaceTransaction *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
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
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v4 = a4;
  v70 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  layoutTransaction = self->_layoutTransaction;
  if (layoutTransaction)
  {
    -[SBWorkspaceTransaction interruptForTransitionRequest:](layoutTransaction, "interruptForTransitionRequest:", v7);
    v9 = self->_layoutTransaction;
    self->_layoutTransaction = 0;

  }
  if (-[NSMutableSet count](self->_ancillaryLayoutTransactions, "count"))
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v10 = self->_ancillaryLayoutTransactions;
    v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v63 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "interruptForTransitionRequest:", v7);
        }
        v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v12);
    }

    -[NSMutableSet removeAllObjects](self->_ancillaryLayoutTransactions, "removeAllObjects");
  }
  -[SBFluidSwitcherGestureWorkspaceTransaction _failRunningLayoutStateTransition](self, "_failRunningLayoutStateTransition");
  v15 = !v4;
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherController](self, "switcherController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "switcherCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setLiveContentOverlayUpdatesSuspended:", v15);
  if (!v15)
  {
    v45 = v17;
    v18 = -[SBSceneLayoutWorkspaceTransaction initWithTransitionRequest:delegate:]([SBSceneLayoutWorkspaceTransaction alloc], "initWithTransitionRequest:delegate:", v7, self);
    v19 = self->_layoutTransaction;
    self->_layoutTransaction = v18;

    -[SBSceneLayoutWorkspaceTransaction addObserver:](self->_layoutTransaction, "addObserver:", self);
    -[SBSceneLayoutWorkspaceTransaction setOptions:](self->_layoutTransaction, "setOptions:", 6);
    +[SBMainWorkspaceTransitionRequest ancillaryTransitionRequestsForTransitionRequest:](SBMainWorkspaceTransitionRequest, "ancillaryTransitionRequestsForTransitionRequest:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v59 != v23)
            objc_enumerationMutation(v20);
          v25 = -[SBSceneLayoutWorkspaceTransaction initWithTransitionRequest:delegate:]([SBSceneLayoutWorkspaceTransaction alloc], "initWithTransitionRequest:delegate:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j), self);
          -[SBSceneLayoutWorkspaceTransaction addObserver:](v25, "addObserver:", self);
          -[SBSceneLayoutWorkspaceTransaction setOptions:](v25, "setOptions:", 6);
          -[NSMutableSet addObject:](self->_ancillaryLayoutTransactions, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      }
      while (v22);
    }
    -[SBFluidSwitcherGestureWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_layoutTransaction);
    v56 = 0u;
    v57 = 0u;
    v55 = 0u;
    v54 = 0u;
    v26 = self->_ancillaryLayoutTransactions;
    v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v55 != v29)
            objc_enumerationMutation(v26);
          -[SBFluidSwitcherGestureWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k));
        }
        v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      }
      while (v28);
    }

    v43 = (void *)-[NSMapTable copy](self->_activeLayoutStatesBySwitcherController, "copy");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v20;
    objc_msgSend(v31, "setByAddingObjectsFromSet:", v20);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v33 = v32;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v51;
      do
      {
        for (m = 0; m != v35; ++m)
        {
          if (*(_QWORD *)v51 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * m);
          -[SBFluidSwitcherGestureWorkspaceTransaction _switcherControllerForWorkspaceTransitionRequest:](self, "_switcherControllerForWorkspaceTransitionRequest:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "applicationContext");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "layoutState");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMapTable setObject:forKey:](self->_activeLayoutStatesBySwitcherController, "setObject:forKey:", v41, v39);
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
      }
      while (v35);
    }

    v17 = v45;
    if ((unint64_t)objc_msgSend(v33, "count") >= 2)
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __106__SBFluidSwitcherGestureWorkspaceTransaction__runSceneLayoutTransactionForTransitionRequest_updateScenes___block_invoke;
      v46[3] = &unk_1E8EA6C58;
      v47 = v45;
      v48 = v43;
      v49 = self;
      objc_msgSend(v47, "enumerateSwitcherControllersWithBlock:", v46);

    }
    v42 = v44;
    goto LABEL_39;
  }
  objc_storeStrong((id *)&self->super.super.super._transitionRequest, a3);
  if (!self->_hasActiveLayoutStateTransitionCoordinatorTransition)
  {
    self->_hasActiveLayoutStateTransitionCoordinatorTransition = 1;
    -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "beginTransitionForWorkspaceTransaction:", self);
LABEL_39:

  }
}

void __106__SBFluidSwitcherGestureWorkspaceTransaction__runSceneLayoutTransactionForTransitionRequest_updateScenes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __106__SBFluidSwitcherGestureWorkspaceTransaction__runSceneLayoutTransactionForTransitionRequest_updateScenes___block_invoke_2;
  v8[3] = &unk_1E8EA6C30;
  v9 = v3;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v7 = v3;
  objc_msgSend(v4, "enumerateSwitcherControllersWithBlock:", v8);

}

void __106__SBFluidSwitcherGestureWorkspaceTransaction__runSceneLayoutTransactionForTransitionRequest_updateScenes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(id *)(a1 + 32) != v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 352), "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v4;
    objc_msgSend(v4, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v5;
    objc_msgSend(v5, "appLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v6, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsItem:", v14))
            objc_msgSend(v8, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      v15 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "layoutState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appLayoutByModifyingPreferredDisplayOrdinal:", objc_msgSend(v16, "displayOrdinal"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBSwitcherCoordinatedLayoutStateTransitionContext coordinatedLayoutStateTransitionContextForMovingDisplayItems:fromSwitcherController:fromAppLayout:toAppLayout:toSwitcherController:withApplicationController:](SBSwitcherCoordinatedLayoutStateTransitionContext, "coordinatedLayoutStateTransitionContextForMovingDisplayItems:fromSwitcherController:fromAppLayout:toAppLayout:toSwitcherController:withApplicationController:", v8, v15, v6, v17, v3, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 56), "prepareForCoordinatedLayoutStateTransitionWithContext:", v19);
      objc_msgSend(*(id *)(a1 + 56), "cleanUpAfterCoordinatedLayoutStateTransitionWithContext:", v19);

    }
  }

}

- (void)_failRunningLayoutStateTransition
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_hasActiveLayoutStateTransitionCoordinatorTransition && objc_msgSend(v6, "isTransitioning"))
  {
    self->_hasActiveLayoutStateTransitionCoordinatorTransition = 0;
    objc_msgSend(v6, "willEndTransition");
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.springboard.fluidSwitcherGestureTransaction"), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endTransitionWithError:", v3);

  }
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherController](self, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switcherCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLiveContentOverlayUpdatesSuspended:", 0);

}

- (void)_addChildWorkspaceTransaction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherGestureWorkspaceTransaction.m"), 1231, CFSTR("transaction of unexpected type, %@"), v5);

      }
    }
  }
  -[SBFluidSwitcherGestureWorkspaceTransaction finalRootTransaction](self, "finalRootTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "transitionRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interruptForTransitionRequest:", v7);

  }
  SBLogSystemGestureAppSwitcher();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SBFluidSwitcherGestureWorkspaceTransaction _addChildWorkspaceTransaction:].cold.1((uint64_t)v5, v8, v9);

  -[SBFluidSwitcherGestureWorkspaceTransaction setFinalRootTransaction:](self, "setFinalRootTransaction:", v5);
  -[SBFluidSwitcherGestureWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", v5);

}

- (id)_workspaceTransitionRequestForSwitcherTransitionRequest:(id)a3 fromGestureManager:(id)a4 withEventLabel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "appLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "switcherController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "windowScene");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_fbsDisplayIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentConfiguration");
  v14 = objc_claimAutoreleasedReturnValue();

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "workspace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)v14;
  objc_msgSend(v16, "createRequestWithOptions:displayConfiguration:", 0, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configureRequest:forSwitcherTransitionRequest:withEventLabel:", v17, v8, v9);

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSource:", objc_msgSend(v18, "source"));

  -[NSMapTable objectForKey:](self->_originalLayoutStatesBySwitcherController, "objectForKey:", v12);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v8, "unlockedEnvironmentMode");
  v35 = v11;
  if (v19 == 1)
  {
    v20 = 1;
  }
  else
  {
    +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v11, "isEqual:", v21);

  }
  -[SBFluidSwitcherGestureWorkspaceTransaction selectedAppLayout](self, "selectedAppLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "transientOverlayContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 == 2 || v20)
  {
    if (v24)
    {
      objc_msgSend(v24, "transientOverlay");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __136__SBFluidSwitcherGestureWorkspaceTransaction__workspaceTransitionRequestForSwitcherTransitionRequest_fromGestureManager_withEventLabel___block_invoke;
        v39[3] = &unk_1E8EA1EB8;
        v40 = v24;
        objc_msgSend(v17, "modifyTransientOverlayContext:", v39);
        v26 = v40;
LABEL_14:

        goto LABEL_15;
      }
    }
    if (objc_msgSend(v22, "type") == 2 && ((v20 & 1) != 0 || objc_msgSend(v36, "unlockedEnvironmentMode") != 2))
    {
      -[SBFluidSwitcherGestureWorkspaceTransaction _createWorkspaceTransientOverlayForAppLayout:](self, "_createWorkspaceTransientOverlayForAppLayout:", v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v27;
      if (v27)
      {
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __136__SBFluidSwitcherGestureWorkspaceTransaction__workspaceTransitionRequestForSwitcherTransitionRequest_fromGestureManager_withEventLabel___block_invoke_2;
        v37[3] = &unk_1E8EA1EB8;
        v26 = v27;
        v38 = v26;
        objc_msgSend(v17, "modifyTransientOverlayContext:", v37);

      }
      goto LABEL_14;
    }
  }
LABEL_15:
  objc_msgSend(v17, "applicationContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setInLiveResize:", -[SBFluidSwitcherGestureWorkspaceTransaction isLiveResize](self, "isLiveResize"));
  objc_msgSend(v28, "setPreventSwitcherRecencyModelUpdates:", objc_msgSend(v8, "preventSwitcherRecencyModelUpdates"));
  objc_msgSend(v17, "applicationContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "applicationSceneEntities");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bs_each:", &__block_literal_global_105_0);

  objc_msgSend(v17, "applicationContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDelegate:", self);

  return v17;
}

void __136__SBFluidSwitcherGestureWorkspaceTransaction__workspaceTransitionRequestForSwitcherTransitionRequest_fromGestureManager_withEventLabel___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v2, "transientOverlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v5, "setTransientOverlay:", v4);

  objc_msgSend(v5, "setTransitionType:", 1);
}

void __136__SBFluidSwitcherGestureWorkspaceTransaction__workspaceTransitionRequestForSwitcherTransitionRequest_fromGestureManager_withEventLabel___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setTransientOverlay:", v2);
  objc_msgSend(v3, "setTransitionType:", 1);

}

uint64_t __136__SBFluidSwitcherGestureWorkspaceTransaction__workspaceTransitionRequestForSwitcherTransitionRequest_fromGestureManager_withEventLabel___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFlag:forActivationSetting:", 1, 9);
}

- (id)_copiedTransitionRequestFromTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SBFluidSwitcherGestureWorkspaceTransaction *v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copyMainWorkspaceTransitionRequest");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke;
  v8[3] = &unk_1E8E9ECA8;
  v9 = v4;
  v10 = self;
  v6 = v4;
  objc_msgSend(v5, "modifyApplicationContext:", v8);

  return v5;
}

void __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[4];
  id v20;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke_2;
  v19[3] = &unk_1E8EA2880;
  v5 = v3;
  v20 = v5;
  SBLayoutRoleEnumerateValidRoles(v19);
  if (objc_msgSend(v5, "waitsForSceneUpdates"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 1;
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke_3;
    v12[3] = &unk_1E8EA6CA0;
    v13 = *(id *)(a1 + 32);
    v14 = &v15;
    SBLayoutRoleEnumerateValidRoles(v12);
    v6 = *((_BYTE *)v16 + 24) == 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v5, "setWaitsForSceneUpdates:", v6);
  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "applicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestedFloatingConfiguration:", objc_msgSend(v7, "requestedFloatingConfiguration"));

  objc_msgSend(*(id *)(a1 + 32), "applicationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestedSpaceConfiguration:", objc_msgSend(v8, "requestedSpaceConfiguration"));

  objc_msgSend(*(id *)(a1 + 32), "applicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestedEntityIdentifierToLayoutAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestedEntityIdentifierToLayoutAttributes:", v10);

  objc_msgSend(*(id *)(a1 + 32), "applicationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFencesAnimations:", objc_msgSend(v11, "fencesAnimations"));

}

void __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "entityForLayoutRole:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFlag:forActivationSetting:", 1, 9);

}

void __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityForLayoutRole:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationSceneEntity");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v10)
  {
    objc_msgSend(v10, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRunning");

    v6 = v10;
    if ((v9 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (id)_createWorkspaceTransientOverlayForAppLayout:(id)a3
{
  SBFluidSwitcherViewController **p_switcherViewController;
  id v4;
  id WeakRetained;
  void *v6;

  p_switcherViewController = &self->_switcherViewController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_switcherViewController);
  objc_msgSend(WeakRetained, "_createWorkspaceTransientOverlayForAppLayout:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_transitionRequestForApplicationTransitionContext:(id)a3 eventLabel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fbsDisplayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workspace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "createRequestWithOptions:displayConfiguration:", 0, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSource:", objc_msgSend(v14, "source"));

  objc_msgSend(v13, "setApplicationContext:", v7);
  if (v6)
    objc_msgSend(v13, "setEventLabel:", v6);

  return v13;
}

- (void)_addWaitForSceneLayoutTransitionTransaction:(id)a3 forLeafAnimationControllers:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __118__SBFluidSwitcherGestureWorkspaceTransaction__addWaitForSceneLayoutTransitionTransaction_forLeafAnimationControllers___block_invoke;
  v8[3] = &unk_1E8EA6CC8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a4, "_enumerateCoordinatingAnimationsWithBlock:", v8);

}

uint64_t __118__SBFluidSwitcherGestureWorkspaceTransaction__addWaitForSceneLayoutTransitionTransaction_forLeafAnimationControllers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addWaitForSceneLayoutTransitionTransaction:forLeafAnimationControllers:", *(_QWORD *)(a1 + 40), a2);
}

- (void)_updateDigitizerSurfaceDimensions
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_activeEventOfType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "_hidEvent"))
  {
    if (IOHIDEventGetType() != 11)
    {
      IOHIDEventGetChildren();
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (!v6)
      {
LABEL_11:

LABEL_14:
        goto LABEL_15;
      }
      v7 = v6;
      v8 = *(_QWORD *)v13;
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (IOHIDEventGetType() == 17)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v7)
            goto LABEL_5;
          goto LABEL_11;
        }
      }

      if (!v10)
        goto LABEL_15;
    }
    BKSHIDEventGetDigitizerAttributes();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "digitizerSurfaceHeight");
    self->_digitizerSurfaceHeightForLastGestureEvent = v11;
    goto LABEL_14;
  }
LABEL_15:

}

- (id)_windowSceneForWorkspaceTransitionRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)SBApp;
  v4 = a3;
  objc_msgSend(v3, "windowSceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "windowSceneForDisplayIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_switcherControllerForWorkspaceTransitionRequest:(id)a3
{
  void *v3;
  void *v4;

  -[SBFluidSwitcherGestureWorkspaceTransaction _windowSceneForWorkspaceTransitionRequest:](self, "_windowSceneForWorkspaceTransitionRequest:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updatePPTsForGestureTransactionBegan
{
  void *v3;
  void *v4;
  void **v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SBFluidSwitcherGestureWorkspaceTransaction *v10;

  if (__PPTIsRunningSwitcherGestureTest())
  {
    +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentTestName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void **)MEMORY[0x1E0CEB258];
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("delay"), v4);
    v6 = *v5;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __83__SBFluidSwitcherGestureWorkspaceTransaction__updatePPTsForGestureTransactionBegan__block_invoke;
    v8[3] = &unk_1E8E9E820;
    v9 = v4;
    v10 = self;
    v7 = v4;
    objc_msgSend(v6, "installCACommitCompletionBlock:", v8);

  }
}

void __83__SBFluidSwitcherGestureWorkspaceTransaction__updatePPTsForGestureTransactionBegan__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("overall"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("gesture"), *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 234) = 1;
  objc_msgSend(*(id *)(a1 + 40), "switcherViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeGesture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || objc_msgSend(v4, "state") == 3)
    objc_msgSend(*(id *)(a1 + 40), "_updatePPTsForGestureEnded");

}

- (void)_updatePPTsForGestureEnded
{
  void *v3;
  id *v4;
  id v5;

  if (__PPTIsRunningSwitcherGestureTest())
  {
    if (self->_hasCompletedFirstCACommitSinceTransactionBeganForPPT)
    {
      +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentTestName");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      v4 = (id *)MEMORY[0x1E0CEB258];
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("gesture"), v5);
      objc_msgSend(*v4, "startedSubTest:forTest:", CFSTR("animation"), v5);

    }
  }
}

- (void)_updatePPTsForAnimationEndedWithFinalLayoutState:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v3 = __PPTIsRunningSwitcherGestureTest();
  v4 = v14;
  if (v3)
  {
    +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentTestName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!__PPTIsRunningSwitcherGestureToAutoPIPTest())
    {
      v7 = (id *)MEMORY[0x1E0CEB258];
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("animation"), v6);
      objc_msgSend(*v7, "finishedSubTest:forTest:", CFSTR("overall"), v6);
    }
    v8 = __PPTExpectedFinalUnlockedEnvironmentModeForCurrentTest();
    if (v8 == objc_msgSend(v14, "unlockedEnvironmentMode"))
    {
      if (!__PPTIsRunningSwitcherGestureToAutoPIPTest())
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedTest:", v6);
    }
    else
    {
      v9 = (void *)*MEMORY[0x1E0CEB258];
      v10 = (void *)MEMORY[0x1E0CB3940];
      SBStringForUnlockedEnvironmentMode(v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBStringForUnlockedEnvironmentMode(objc_msgSend(v14, "unlockedEnvironmentMode"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ - expected end state is %@, but ended up in %@ instead"), v6, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "failedTest:withFailure:", v6, v13);

    }
    v4 = v14;
  }

}

- (SBSwitcherController)switcherController
{
  return (SBSwitcherController *)objc_loadWeakRetained((id *)&self->_switcherController);
}

- (SBFluidSwitcherViewController)switcherViewController
{
  return (SBFluidSwitcherViewController *)objc_loadWeakRetained((id *)&self->_switcherViewController);
}

- (void)setSwitcherViewController:(id)a3
{
  objc_storeWeak((id *)&self->_switcherViewController, a3);
}

- (SBUISwitcherAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (BOOL)shouldCancelGestureUponInterruption
{
  return self->_shouldCancelGestureUponInterruption;
}

- (void)setShouldCancelGestureUponInterruption:(BOOL)a3
{
  self->_shouldCancelGestureUponInterruption = a3;
}

- (SBSceneLayoutWorkspaceTransaction)layoutTransaction
{
  return self->_layoutTransaction;
}

- (void)setLayoutTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_layoutTransaction, a3);
}

- (SBFluidSwitcherGestureWorkspaceTransactionDelegate)delegate
{
  return (SBFluidSwitcherGestureWorkspaceTransactionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIApplicationSceneDeactivationAssertion)backgroundingScenesDeactivationAssertion
{
  return self->_backgroundingScenesDeactivationAssertion;
}

- (void)setBackgroundingScenesDeactivationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundingScenesDeactivationAssertion, a3);
}

- (NSMapTable)originalLayoutStatesBySwitcherController
{
  return self->_originalLayoutStatesBySwitcherController;
}

- (void)setOriginalLayoutStatesBySwitcherController:(id)a3
{
  objc_storeStrong((id *)&self->_originalLayoutStatesBySwitcherController, a3);
}

- (NSMapTable)activeLayoutStatesBySwitcherController
{
  return self->_activeLayoutStatesBySwitcherController;
}

- (void)setActiveLayoutStatesBySwitcherController:(id)a3
{
  objc_storeStrong((id *)&self->_activeLayoutStatesBySwitcherController, a3);
}

- (SBMainWorkspaceTransaction)finalRootTransaction
{
  return self->_finalRootTransaction;
}

- (void)setFinalRootTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_finalRootTransaction, a3);
}

- (NSMutableSet)ancillaryLayoutTransactions
{
  return self->_ancillaryLayoutTransactions;
}

- (void)setAncillaryLayoutTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_ancillaryLayoutTransactions, a3);
}

- (NSMutableSet)layoutTransitionCompletions
{
  return self->_layoutTransitionCompletions;
}

- (void)setLayoutTransitionCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutTransitionCompletions, a3);
}

- (SBAutoPIPWorkspaceTransaction)autoPIPWorkspaceTransaction
{
  return self->_autoPIPWorkspaceTransaction;
}

- (void)setAutoPIPWorkspaceTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_autoPIPWorkspaceTransaction, a3);
}

- (NSTimer)activateScenesTimer
{
  return self->_activateScenesTimer;
}

- (void)setActivateScenesTimer:(id)a3
{
  objc_storeStrong((id *)&self->_activateScenesTimer, a3);
}

- (SBTransientOverlayViewController)switcherTransitioningTransientOverlayViewController
{
  return self->_switcherTransitioningTransientOverlayViewController;
}

- (void)setSwitcherTransitioningTransientOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_switcherTransitioningTransientOverlayViewController, a3);
}

- (BOOL)hasCompletedAtLeastOneGesture
{
  return self->_hasCompletedAtLeastOneGesture;
}

- (NSUUID)gestureID
{
  return self->_gestureID;
}

- (SBAppLayout)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_gestureID, 0);
  objc_storeStrong((id *)&self->_switcherTransitioningTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_activateScenesTimer, 0);
  objc_storeStrong((id *)&self->_autoPIPWorkspaceTransaction, 0);
  objc_storeStrong((id *)&self->_layoutTransitionCompletions, 0);
  objc_storeStrong((id *)&self->_ancillaryLayoutTransactions, 0);
  objc_storeStrong((id *)&self->_finalRootTransaction, 0);
  objc_storeStrong((id *)&self->_activeLayoutStatesBySwitcherController, 0);
  objc_storeStrong((id *)&self->_originalLayoutStatesBySwitcherController, 0);
  objc_storeStrong((id *)&self->_backgroundingScenesDeactivationAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutTransaction, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_destroyWeak((id *)&self->_switcherViewController);
  objc_destroyWeak((id *)&self->_switcherController);
  objc_storeStrong((id *)&self->_pendingSceneUpdateTransactionsBySceneIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiersWithSceneUpdateTransactionsInProgress, 0);
}

- (int64_t)_gestureType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)systemGestureStateChanged:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  int v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v5 = a1;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "hasStarted");
  v7 = objc_msgSend(v5, "isComplete");
  LODWORD(v5) = objc_msgSend(v5, "isFinishedWorking");
  SBSystemGestureRecognizerStateDescription(objc_msgSend(a2, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 67109890;
  v9[1] = v6;
  v10 = 1024;
  v11 = v7;
  v12 = 1024;
  v13 = (int)v5;
  v14 = 2114;
  v15 = v8;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "SBFluidSwitcherGestureRecognizer state changed while we aren't running. The transaction is started:%{BOOL}u completed:%{BOOL}u finishedWorking:%{BOOL}u and the gesture state is %{public}@", (uint8_t *)v9, 0x1Eu);

}

- (void)_addChildWorkspaceTransaction:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "Adding child transaction: %@", (uint8_t *)&v3);
}

@end
