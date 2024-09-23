@implementation SBModalUIFluidDismissGestureManager

- (BOOL)homeGestureInteraction:(id)a3 shouldReceiveTouch:(id)a4
{
  return -[SBModalUIFluidDismissGestureManager _dismissalTypeForCurrentContext](self, "_dismissalTypeForCurrentContext", a3, a4) != 0;
}

- (int64_t)_dismissalTypeForCurrentContext
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  int64_t v5;
  void *v6;
  int v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (+[SBAssistantController isVisible](SBAssistantController, "isVisible")
    && (objc_msgSend(WeakRetained, "assistantController"),
        v3 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)v3, "assistantRootViewController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        (id)v3,
        LOBYTE(v3) = objc_msgSend(v4, "ownsHomeGesture"),
        v4,
        (v3 & 1) != 0))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(WeakRetained, "transientOverlayPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllerForGestureDismissal");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = objc_msgSend(v6, "ownsHomeGesture");

      if (v7 && (v8 = objc_msgSend(v6, "preferredGestureDismissalStyle"), (unint64_t)(v8 - 1) <= 4))
        v5 = qword_1D0E8A790[v8 - 1];
      else
        v5 = 0;
    }

  }
  return v5;
}

- (SBModalUIFluidDismissGestureManager)initWithWindowScene:(id)a3 systemGestureManager:(id)a4
{
  id v6;
  id v7;
  SBModalUIFluidDismissGestureManager *v8;
  SBModalUIFluidDismissGestureManager *v9;
  uint64_t v10;
  SBHomeGestureSettings *homeGestureSettings;
  uint64_t v12;
  BSCompoundAssertion *observers;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBModalUIFluidDismissGestureManager;
  v8 = -[SBModalUIFluidDismissGestureManager init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_systemGestureManager, a4);
    objc_storeWeak((id *)&v9->_windowScene, v6);
    +[SBHomeGestureDomain rootSettings](SBHomeGestureDomain, "rootSettings");
    v10 = objc_claimAutoreleasedReturnValue();
    homeGestureSettings = v9->_homeGestureSettings;
    v9->_homeGestureSettings = (SBHomeGestureSettings *)v10;

    -[PTSettings addKeyObserver:](v9->_homeGestureSettings, "addKeyObserver:", v9);
    objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:", CFSTR("SBModalUIFluidDismissGestureManager observers"));
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v9->_observers;
    v9->_observers = (BSCompoundAssertion *)v12;

    -[SBModalUIFluidDismissGestureManager _addOrRemoveGestureForCurrentSettings](v9, "_addOrRemoveGestureForCurrentSettings");
  }

  return v9;
}

- (void)dealloc
{
  BSCompoundAssertion *observers;
  objc_super v4;

  -[BSCompoundAssertion invalidate](self->_observers, "invalidate");
  observers = self->_observers;
  self->_observers = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBModalUIFluidDismissGestureManager;
  -[SBModalUIFluidDismissGestureManager dealloc](&v4, sel_dealloc);
}

- (void)_addOrRemoveGestureForCurrentSettings
{
  _BOOL4 v3;
  SBHomeGestureInteraction *homeGestureInteraction;
  SBHomeGestureInteraction *v5;
  SBHomeGestureInteraction *v6;

  v3 = -[SBHomeGestureSettings isHomeGestureEnabled](self->_homeGestureSettings, "isHomeGestureEnabled");
  homeGestureInteraction = self->_homeGestureInteraction;
  if (v3)
  {
    if (homeGestureInteraction)
      return;
    v5 = -[SBHomeGestureInteraction initWithSystemGestureManager:delegate:]([SBHomeGestureInteraction alloc], "initWithSystemGestureManager:delegate:", self->_systemGestureManager, self);
  }
  else
  {
    if (!homeGestureInteraction)
      return;
    -[SBHomeGestureInteraction invalidate](homeGestureInteraction, "invalidate");
    v5 = 0;
  }
  v6 = self->_homeGestureInteraction;
  self->_homeGestureInteraction = v5;

}

- (void)handleGestureBegan:(id)a3 initiatedFromBottomEdge:(BOOL)a4
{
  -[SBModalUIFluidDismissGestureManager handleGestureBegan:initiatedFromBottomEdge:dismissalThreshold:initiatedFromIndirectEdge:](self, "handleGestureBegan:initiatedFromBottomEdge:dismissalThreshold:initiatedFromIndirectEdge:", a3, a4, 0, -200.0);
}

- (void)handleGestureBegan:(id)a3 initiatedFromBottomEdge:(BOOL)a4 dismissalThreshold:(double)a5 initiatedFromIndirectEdge:(BOOL)a6
{
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  _QWORD v15[4];
  id v16;
  SBModalUIFluidDismissGestureManager *v17;
  double v18;
  BOOL v19;
  BOOL v20;

  v10 = a3;
  -[SBModalUIFluidDismissGestureManager currentTransaction](self, "currentTransaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "_fbsDisplayConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke_3;
    v15[3] = &unk_1E8EB6020;
    v16 = v10;
    v17 = self;
    v19 = a4;
    v18 = a5;
    v20 = a6;
    objc_msgSend(v12, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v14, &__block_literal_global_246, v15);

  }
}

void __127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setSource:", 11);
  objc_msgSend(v2, "setEventLabel:", CFSTR("SBModalUIFluidDismissSystemGesture"));
  objc_msgSend(v2, "modifyTransientOverlayContext:", &__block_literal_global_10_2);

}

void __127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlayPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPresentationManager:", v3);

}

uint64_t __127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  id v8;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = objc_msgSend(*(id *)(a1 + 40), "_dismissalTypeForCurrentContext");
  if (v5)
    v6 = (unint64_t)(v4 - 1) >= 2;
  else
    v6 = 1;
  v7 = !v6;
  if ((_DWORD)v7 == 1)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke_4;
    v11[3] = &unk_1E8EB5FF8;
    v13 = v5;
    v15 = *(_WORD *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 48);
    v10 = *(int8x16_t *)(a1 + 32);
    v8 = (id)v10.i64[0];
    v12 = vextq_s8(v10, v10, 8uLL);
    objc_msgSend(v3, "setTransactionProvider:", v11);

  }
  return v7;
}

SBModalUIFluidDismissGestureWorkspaceTransaction *__127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  SBModalUIFluidDismissGestureWorkspaceTransaction *v4;
  id WeakRetained;
  SBModalUIFluidDismissGestureWorkspaceTransaction *v6;

  v3 = a2;
  v4 = [SBModalUIFluidDismissGestureWorkspaceTransaction alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v6 = -[SBModalUIFluidDismissGestureWorkspaceTransaction initWithTransitionRequest:windowScene:dismissalType:initiatedFromBottomEdge:](v4, "initWithTransitionRequest:windowScene:dismissalType:initiatedFromBottomEdge:", v3, WeakRetained, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

  -[SBModalUIFluidDismissGestureWorkspaceTransaction setDismissalThreshold:](v6, "setDismissalThreshold:", *(double *)(a1 + 56));
  -[SBModalUIFluidDismissGestureWorkspaceTransaction setAnimateGestureCancelationOrFailure:](v6, "setAnimateGestureCancelationOrFailure:", *(unsigned __int8 *)(a1 + 65));
  -[SBModalUIFluidDismissGestureWorkspaceTransaction addObserver:](v6, "addObserver:", *(_QWORD *)(a1 + 32));
  -[SBSystemGestureWorkspaceTransaction setGestureRecognizer:](v6, "setGestureRecognizer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTransaction:", v6);
  return v6;
}

- (void)handleGestureChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBModalUIFluidDismissGestureManager currentTransaction](self, "currentTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "systemGestureStateChanged:", v6);

}

- (void)handleGestureEnded:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBModalUIFluidDismissGestureManager currentTransaction](self, "currentTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "systemGestureStateChanged:", v6);
  }
  else if (objc_msgSend(v6, "state") != 4)
  {
    objc_msgSend(v6, "setEnabled:", 0);
    objc_msgSend(v6, "setEnabled:", 1);
  }

}

- (id)addObserver:(id)a3 forReason:(id)a4
{
  return (id)-[BSCompoundAssertion acquireForReason:withContext:](self->_observers, "acquireForReason:withContext:", a4, a3);
}

- (unint64_t)homeGestureInteraction:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2)
    return 0;
  else
    return qword_1D0E8A778[a4 - 1];
}

- (id)customScreenEdgePanGestureRecognizerForHomeGestureInteraction:(id)a3
{
  void *v4;

  +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:action:](SBHomeGesturePanGestureRecognizer, "homeGesturePanGestureRecognizerWithTarget:action:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterfaceDelegate:", self);
  objc_msgSend(v4, "setEdges:", 4);
  objc_msgSend(v4, "setAllowedTouchTypes:", &unk_1E91CEBD8);
  return v4;
}

- (void)homeGestureInteractionBegan:(id)a3
{
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "recognizedGestureType");
  if (v4 == 2)
  {
    objc_msgSend(v8, "indirectScreenEdgeGestureRecognitionDistance");
    v6 = -v5;
  }
  else
  {
    v6 = -200.0;
  }
  objc_msgSend(v8, "recognizedGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModalUIFluidDismissGestureManager handleGestureBegan:initiatedFromBottomEdge:dismissalThreshold:initiatedFromIndirectEdge:](self, "handleGestureBegan:initiatedFromBottomEdge:dismissalThreshold:initiatedFromIndirectEdge:", v7, 1, v4 == 2, v6);

}

- (void)homeGestureInteractionChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "recognizedGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBModalUIFluidDismissGestureManager handleGestureChanged:](self, "handleGestureChanged:", v4);

}

- (void)homeGestureInteractionEnded:(id)a3
{
  id v4;

  objc_msgSend(a3, "recognizedGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBModalUIFluidDismissGestureManager handleGestureEnded:](self, "handleGestureEnded:", v4);

}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  id WeakRetained;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v5 = -[SBModalUIFluidDismissGestureManager _dismissalTypeForCurrentContext](self, "_dismissalTypeForCurrentContext");
  if ((unint64_t)(v5 - 2) >= 4)
  {
    if (v5 != 1)
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_msgSend(WeakRetained, "assistantController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assistantRootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(WeakRetained, "transientOverlayPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllerForGestureDismissal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v9;
}

- (int64_t)touchInterfaceOrientationForGestureRecognizer:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  int64_t v18;

  -[SBModalUIFluidDismissGestureManager viewForSystemGestureRecognizer:](self, "viewForSystemGestureRecognizer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  objc_msgSend(v3, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:toView:", v6, 1.0, 1.0);
  objc_msgSend(v5, "_convertPointToSceneReferenceSpace:");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:toView:", v12, 0.0, 0.0);
  objc_msgSend(v11, "_convertPointToSceneReferenceSpace:");
  v14 = v8 - v13;
  v16 = v10 - v15;

  v17 = v14 <= 0.0;
  if (v14 <= 0.0 || v16 <= 0.0)
  {
    if (v14 > 0.0 || v16 > 0.0)
    {
      if (v16 > 0.0)
        v17 = 1;
      if (v17)
        v18 = 3;
      else
        v18 = 4;
    }
    else
    {
      v18 = 2;
    }
  }
  else
  {
LABEL_4:
    v18 = 1;
  }

  return v18;
}

- (void)_notifyObserversDismissalEnded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[BSCompoundAssertion orderedContext](self->_observers, "orderedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "noteModalUIFluidDismissalDidEnd:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)transactionDidComplete:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBModalUIFluidDismissGestureManager currentTransaction](self, "currentTransaction");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[SBModalUIFluidDismissGestureManager setCurrentTransaction:](self, "setCurrentTransaction:", 0);
  -[SBModalUIFluidDismissGestureManager _notifyObserversDismissalEnded](self, "_notifyObserversDismissalEnded");
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  _QWORD block[5];

  if (self->_homeGestureSettings == a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__SBModalUIFluidDismissGestureManager_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __67__SBModalUIFluidDismissGestureManager_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addOrRemoveGestureForCurrentSettings");
}

- (SBSystemGestureManager)systemGestureManager
{
  return self->_systemGestureManager;
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (SBHomeGestureSettings)homeGestureSettings
{
  return self->_homeGestureSettings;
}

- (void)setHomeGestureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureSettings, a3);
}

- (SBHomeGestureInteraction)homeGestureInteraction
{
  return self->_homeGestureInteraction;
}

- (void)setHomeGestureInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_homeGestureInteraction, a3);
}

- (SBModalUIFluidDismissGestureWorkspaceTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransaction, a3);
}

- (BSCompoundAssertion)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_homeGestureInteraction, 0);
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
}

@end
