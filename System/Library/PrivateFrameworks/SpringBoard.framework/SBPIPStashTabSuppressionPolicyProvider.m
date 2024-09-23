@implementation SBPIPStashTabSuppressionPolicyProvider

- (SBPIPStashTabSuppressionPolicyProvider)initWithObserver:(id)a3 bannerManager:(id)a4 sceneManager:(id)a5 pipManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBPIPStashTabSuppressionPolicyProvider *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SBPIPStashTabSuppressionPolicyProvider;
  v15 = -[SBPIPStashTabSuppressionPolicyProvider init](&v23, sel_init);
  if (v15)
  {
    if (v13)
    {
      if (v14)
      {
LABEL_4:
        objc_storeWeak((id *)&v15->_observer, v11);
        objc_storeWeak((id *)&v15->_bannerManager, v12);
        objc_storeWeak((id *)&v15->_sceneManager, v13);
        objc_storeWeak((id *)&v15->_pipManager, v14);
        objc_msgSend(v12, "addTransitionObserver:", v15);
        objc_msgSend(v13, "_layoutStateTransitionCoordinator");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObserver:", v15);

        -[SBPIPStashTabSuppressionPolicyProvider _resetReevaluatePolicyTimer](v15, "_resetReevaluatePolicyTimer");
        v17 = objc_opt_class();
        objc_msgSend(v13, "currentLayoutState");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        SBSafeCast(v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBPIPStashTabSuppressionPolicyProvider _updateSceneHandleToObserveForLayoutState:](v15, "_updateSceneHandleToObserveForLayoutState:", v19);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBPIPStashTabSuppressionPolicyProvider.m"), 51, CFSTR("invalid scene manager"));

      if (v14)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("SBPIPStashTabSuppressionPolicyProvider.m"), 52, CFSTR("invalid pip manager"));

    goto LABEL_4;
  }
LABEL_5:

  return v15;
}

- (void)invalidate
{
  id WeakRetained;
  id v4;
  id v5;
  void *v6;

  objc_storeWeak((id *)&self->_observer, 0);
  self->_invalidated = 1;
  -[NSTimer invalidate](self->_reevaluatePolicyTimer, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_bannerManager);
  objc_msgSend(WeakRetained, "removeTransitionObserver:", self);

  v4 = objc_loadWeakRetained((id *)&self->_sceneHandleToObserve);
  objc_msgSend(v4, "removeObserver:", self);

  v5 = objc_loadWeakRetained((id *)&self->_sceneManager);
  objc_msgSend(v5, "_layoutStateTransitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[SBPIPStashTabSuppressionPolicyProvider setSceneHandleToObserve:](self, "setSceneHandleToObserve:", 0);
  -[SBPIPStashTabSuppressionPolicyProvider _reevaluatePolicy](self, "_reevaluatePolicy");
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPStashTabSuppressionPolicyProvider.m"), 78, CFSTR("Released %@ without invalidating"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)SBPIPStashTabSuppressionPolicyProvider;
  -[SBPIPStashTabSuppressionPolicyProvider dealloc](&v5, sel_dealloc);
}

- (void)_reevaluatePolicy
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  if (self->_invalidated
    || -[NSMutableSet count](self->_requestIdentifiersForPresentedExpanseBanners, "count")
    || self->_reevaluatePolicyTimer)
  {
    v3 = 0;
  }
  else
  {
    -[SBPIPStashTabSuppressionPolicyProvider sceneHandleToObserve](self, "sceneHandleToObserve");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "clientSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    v3 = objc_msgSend(v10, "homeIndicatorAutoHidden");
  }
  -[SBPIPStashTabSuppressionPolicyProvider setStashTabCanBeHidden:](self, "setStashTabCanBeHidden:", v3);
}

- (void)_updateSceneHandleToObserveForLayoutState:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(void);
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "unlockedEnvironmentMode") == 3
    && (objc_msgSend(v14, "elements"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5 == 1))
  {
    objc_msgSend(v14, "elementWithRole:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entityGenerator");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_opt_class();
    v10 = v8;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v13 = v11;

    objc_msgSend(v13, "sceneHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  -[SBPIPStashTabSuppressionPolicyProvider setSceneHandleToObserve:](self, "setSceneHandleToObserve:", v12);

}

- (void)_startTrackingPresentable:(id)a3
{
  id v4;
  NSMutableSet *requestIdentifiersForPresentedExpanseBanners;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;

  v4 = a3;
  requestIdentifiersForPresentedExpanseBanners = self->_requestIdentifiersForPresentedExpanseBanners;
  v9 = v4;
  if (!requestIdentifiersForPresentedExpanseBanners)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_requestIdentifiersForPresentedExpanseBanners;
    self->_requestIdentifiersForPresentedExpanseBanners = v6;

    v4 = v9;
    requestIdentifiersForPresentedExpanseBanners = self->_requestIdentifiersForPresentedExpanseBanners;
  }
  objc_msgSend(v4, "requestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](requestIdentifiersForPresentedExpanseBanners, "addObject:", v8);

  -[SBPIPStashTabSuppressionPolicyProvider _reevaluatePolicy](self, "_reevaluatePolicy");
}

- (void)_stopTrackingPresentable:(id)a3
{
  NSMutableSet *requestIdentifiersForPresentedExpanseBanners;
  void *v5;
  NSMutableSet *v6;

  requestIdentifiersForPresentedExpanseBanners = self->_requestIdentifiersForPresentedExpanseBanners;
  objc_msgSend(a3, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](requestIdentifiersForPresentedExpanseBanners, "removeObject:", v5);

  if (!-[NSMutableSet count](self->_requestIdentifiersForPresentedExpanseBanners, "count"))
  {
    v6 = self->_requestIdentifiersForPresentedExpanseBanners;
    self->_requestIdentifiersForPresentedExpanseBanners = 0;

  }
  -[SBPIPStashTabSuppressionPolicyProvider _reevaluatePolicy](self, "_reevaluatePolicy");
}

- (void)setSceneHandleToObserve:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandleToObserve);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "removeObserver:", self);
    objc_storeWeak((id *)&self->_sceneHandleToObserve, obj);
    objc_msgSend(obj, "addObserver:", self);
    -[SBPIPStashTabSuppressionPolicyProvider _reevaluatePolicy](self, "_reevaluatePolicy");
  }

}

- (void)setStashTabCanBeHidden:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  NSObject *v6;
  id v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_stashTabCanBeHidden != a3)
  {
    v3 = a3;
    self->_stashTabCanBeHidden = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_pipManager);
    SBLogPIP();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109378;
      v8[1] = v3;
      v9 = 2112;
      v10 = WeakRetained;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[SBPIPStashTabSuppressionPolicyProvider] setStashTabCanBeHidden %{BOOL}u %@", (uint8_t *)v8, 0x12u);
    }

    v7 = objc_loadWeakRetained((id *)&self->_observer);
    objc_msgSend(v7, "stashTabVisibilityPolicyProviderDidUpdatePolicy:", self);

    if (v3)
    {
      objc_msgSend(WeakRetained, "addStashTabSuppressionTarget:action:", self, sel__tapRecognized_);
      objc_msgSend((id)SBApp, "addActiveOrientationObserver:", self);
    }
    else
    {
      objc_msgSend(WeakRetained, "removeStashTabSuppressionTarget:action:", self, sel__tapRecognized_);
      objc_msgSend((id)SBApp, "removeActiveOrientationObserver:", self);
    }

  }
}

- (void)_tapRecognized:(id)a3
{
  -[SBPIPStashTabSuppressionPolicyProvider setStashTabCanBeHidden:](self, "setStashTabCanBeHidden:", 0);
  -[SBPIPStashTabSuppressionPolicyProvider _resetReevaluatePolicyTimer](self, "_resetReevaluatePolicyTimer");
}

- (void)_resetReevaluatePolicyTimer
{
  NSTimer *reevaluatePolicyTimer;
  SBPIPStashTabSuppressionPolicyProvider *v4;
  NSTimer *v5;
  NSTimer *v6;
  _QWORD v7[5];

  reevaluatePolicyTimer = self->_reevaluatePolicyTimer;
  v4 = self;
  -[NSTimer invalidate](reevaluatePolicyTimer, "invalidate");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SBPIPStashTabSuppressionPolicyProvider__resetReevaluatePolicyTimer__block_invoke;
  v7[3] = &unk_1E8EB8270;
  v7[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, 4.0);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v6 = self->_reevaluatePolicyTimer;
  self->_reevaluatePolicyTimer = v5;

}

void __69__SBPIPStashTabSuppressionPolicyProvider__resetReevaluatePolicyTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  if (v3 && *((id *)v3 + 11) == v5)
  {
    *((_QWORD *)v3 + 11) = 0;

    objc_msgSend(v4, "_reevaluatePolicy");
  }

}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  -[SBPIPStashTabSuppressionPolicyProvider setStashTabCanBeHidden:](self, "setStashTabCanBeHidden:", 0, a5, a4);
  -[SBPIPStashTabSuppressionPolicyProvider _resetReevaluatePolicyTimer](self, "_resetReevaluatePolicyTimer");
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

  -[SBPIPStashTabSuppressionPolicyProvider _updateSceneHandleToObserveForLayoutState:](self, "_updateSceneHandleToObserveForLayoutState:", v8);
}

- (void)bannerManager:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  _QWORD v11[5];
  id v12;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "requestIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.conversationController.HUD"));

  if (v10)
  {
    -[SBPIPStashTabSuppressionPolicyProvider _startTrackingPresentable:](self, "_startTrackingPresentable:", v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __105__SBPIPStashTabSuppressionPolicyProvider_bannerManager_willPresentPresentable_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E8EA1AD8;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v11);

  }
}

uint64_t __105__SBPIPStashTabSuppressionPolicyProvider_bannerManager_willPresentPresentable_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_stopTrackingPresentable:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)bannerManager:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  _QWORD v11[5];
  id v12;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "requestIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.conversationController.HUD"));

  if (v10)
  {
    -[SBPIPStashTabSuppressionPolicyProvider _stopTrackingPresentable:](self, "_stopTrackingPresentable:", v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __105__SBPIPStashTabSuppressionPolicyProvider_bannerManager_willDismissPresentable_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_1E8EA1AD8;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v11);

  }
}

uint64_t __105__SBPIPStashTabSuppressionPolicyProvider_bannerManager_willDismissPresentable_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_startTrackingPresentable:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIApplicationSceneClientSettingsDiffInspector *clientSettingsInspector;
  UIApplicationSceneClientSettingsDiffInspector *v12;
  UIApplicationSceneClientSettingsDiffInspector *v13;
  UIApplicationSceneClientSettingsDiffInspector *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  clientSettingsInspector = self->_clientSettingsInspector;
  if (!clientSettingsInspector)
  {
    v12 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
    v13 = self->_clientSettingsInspector;
    self->_clientSettingsInspector = v12;

    objc_initWeak(&location, self);
    v14 = self->_clientSettingsInspector;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __104__SBPIPStashTabSuppressionPolicyProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v18 = &unk_1E8EA2658;
    objc_copyWeak(&v19, &location);
    -[UIApplicationSceneClientSettingsDiffInspector observeHomeIndicatorAutoHiddenWithBlock:](v14, "observeHomeIndicatorAutoHiddenWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    clientSettingsInspector = self->_clientSettingsInspector;
  }
  -[UIApplicationSceneClientSettingsDiffInspector inspectDiff:withContext:](clientSettingsInspector, "inspectDiff:withContext:", v9, v10, v15, v16, v17, v18);

}

void __104__SBPIPStashTabSuppressionPolicyProvider_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reevaluatePolicy");

}

- (BOOL)stashTabCanBeHidden
{
  return self->_stashTabCanBeHidden;
}

- (SBPIPStashTabSuppressionPolicyProviderObserver)observer
{
  return (SBPIPStashTabSuppressionPolicyProviderObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (SBBannerManager)bannerManager
{
  return (SBBannerManager *)objc_loadWeakRetained((id *)&self->_bannerManager);
}

- (SBSceneManager)sceneManager
{
  return (SBSceneManager *)objc_loadWeakRetained((id *)&self->_sceneManager);
}

- (SBSwitcherController)switcherController
{
  return (SBSwitcherController *)objc_loadWeakRetained((id *)&self->_switcherController);
}

- (SBWindowScenePIPManager)pipManager
{
  return (SBWindowScenePIPManager *)objc_loadWeakRetained((id *)&self->_pipManager);
}

- (SBDeviceApplicationSceneHandle)sceneHandleToObserve
{
  return (SBDeviceApplicationSceneHandle *)objc_loadWeakRetained((id *)&self->_sceneHandleToObserve);
}

- (NSTimer)reevaluatePolicyTimer
{
  return self->_reevaluatePolicyTimer;
}

- (void)setReevaluatePolicyTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reevaluatePolicyTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reevaluatePolicyTimer, 0);
  objc_destroyWeak((id *)&self->_sceneHandleToObserve);
  objc_destroyWeak((id *)&self->_pipManager);
  objc_destroyWeak((id *)&self->_switcherController);
  objc_destroyWeak((id *)&self->_sceneManager);
  objc_destroyWeak((id *)&self->_bannerManager);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_clientSettingsInspector, 0);
  objc_storeStrong((id *)&self->_requestIdentifiersForPresentedExpanseBanners, 0);
}

@end
