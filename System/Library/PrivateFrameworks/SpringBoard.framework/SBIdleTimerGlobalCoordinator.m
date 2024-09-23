@implementation SBIdleTimerGlobalCoordinator

- (void)idleTimerGlobalStateMonitor:(id)a3 changedForReason:(id)a4
{
  _BOOL4 v5;
  id v6;

  v6 = a4;
  -[SBIdleTimerGlobalCoordinator _updateIdleTimerForReason:](self, "_updateIdleTimerForReason:");
  if (-[SBIdleTimerGlobalCoordinator _hasIdleTimerDisableAssertions](self, "_hasIdleTimerDisableAssertions"))
    v5 = -[SBIdleTimerGlobalCoordinator _areIdleTimerDisableAssertionsPrevented](self, "_areIdleTimerDisableAssertionsPrevented");
  else
    v5 = 1;
  if (self->_idleTimerSourceEnabled != v5)
    -[SBIdleTimerGlobalCoordinator _setIdleTimerSourceEnabled:forReason:](self, "_setIdleTimerSourceEnabled:forReason:");

}

- (BOOL)_hasIdleTimerDisableAssertions
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBIdleTimerGlobalCoordinator _idleTimerDisableAssertions](self, "_idleTimerDisableAssertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "count") != 0;
  else
    v4 = 0;

  return v4;
}

- (NSMutableDictionary)_idleTimerDisableAssertions
{
  return self->_idleTimerDisableAssertions;
}

- (BOOL)_areIdleTimerDisableAssertionsPrevented
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SBIdleTimerGlobalStateMonitor aggregateClientConfiguration](self->_globalStateMonitor, "aggregateClientConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "maxExpirationTimeoutSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = (unint64_t)objc_msgSend(v4, "highestPrecedence") > 1;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator idleTimerProvider:didProposeBehavior:forReason:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SBIdleTimerGlobalCoordinator.m"), 249, CFSTR("this call must be made on the main thread"));

  }
  -[SBIdleTimerGlobalCoordinator _activeIdleTimerProvider](self, "_activeIdleTimerProvider");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v8)
  {
    +[SBIdleTimerBehavior behaviorForBehaviorProvider:](SBIdleTimerBehavior, "behaviorForBehaviorProvider:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIdleTimerGlobalCoordinator _updateIdleTimerForProvider:behavior:forReason:](self, "_updateIdleTimerForProvider:behavior:forReason:", v8, v14, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerProvider);

    if (v11 != WeakRetained)
      -[SBIdleTimerGlobalCoordinator _updateIdleTimerForReason:](self, "_updateIdleTimerForReason:", CFSTR("ActiveProviderChanged"));
    -[SBIdleTimerCoordinatorHelper updateProvider:behavior:reason:](self->_idleTimerCoordinatorHelper, "updateProvider:behavior:reason:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_updateIdleTimerForProvider:(id)a3 behavior:(id)a4 forReason:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v8 = (void *)MEMORY[0x1E0CB3978];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if ((objc_msgSend(v8, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator _updateIdleTimerForProvider:behavior:forReason:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SBIdleTimerGlobalCoordinator.m"), 399, CFSTR("this call must be made on the main thread"));

  }
  -[SBIdleTimerDescriptorFactory idleTimerDescriptorForBehavior:](self->_idleTimerDescriptorFactory, "idleTimerDescriptorForBehavior:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIdleTimerGlobalCoordinator _updateIdleTimerForProvider:behavior:descriptor:forReason:](self, "_updateIdleTimerForProvider:behavior:descriptor:forReason:", v11, v10, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_updateIdleTimerForProvider:(id)a3 behavior:(id)a4 descriptor:(id)a5 forReason:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  SBIdleTimerProxy *v15;
  id v16;
  SBIdleTimerDescriptor **p_enabledIdleTimerDescriptor;
  _BOOL4 idleTimerSourceEnabled;
  NSObject *v19;
  _BOOL4 v20;
  SBIdleTimerDescriptor *v21;
  SBIdleTimerDescriptor *v22;
  void *v24;
  void *v25;
  int v26;
  SBIdleTimerDescriptor *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator _updateIdleTimerForProvider:behavior:descriptor:forReason:]");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("SBIdleTimerGlobalCoordinator.m"), 371, CFSTR("this call must be made on the main thread"));

  }
  -[SBIdleTimerGlobalCoordinator _setIdleTimerProvider:](self, "_setIdleTimerProvider:", v10);
  -[SBIdleTimerCoordinatorHelper idleTimerProxyForProvider:](self->_idleTimerCoordinatorHelper, "idleTimerProxyForProvider:", v10);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (SBIdleTimerProxy *)v14;
    v16 = -[SBIdleTimerCoordinatorHelper updateProvider:behavior:reason:](self->_idleTimerCoordinatorHelper, "updateProvider:behavior:reason:", v10, v11, v13);
  }
  else
  {
    v15 = -[SBIdleTimerProxy initWithIdleTimerSource:]([SBIdleTimerProxy alloc], "initWithIdleTimerSource:", 0);
    -[SBIdleTimerCoordinatorHelper bindProvider:toSourceTimer:behavior:forReason:](self->_idleTimerCoordinatorHelper, "bindProvider:toSourceTimer:behavior:forReason:", v10, v15, v11, v13);
  }
  -[SBIdleTimerProxy setSourceTimer:](self->_enabledIdleTimerProxy, "setSourceTimer:", 0);
  objc_storeStrong((id *)&self->_enabledIdleTimerProxy, v15);
  p_enabledIdleTimerDescriptor = &self->_enabledIdleTimerDescriptor;
  objc_storeStrong((id *)&self->_enabledIdleTimerDescriptor, a5);
  idleTimerSourceEnabled = self->_idleTimerSourceEnabled;
  SBLogIdleTimer();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (idleTimerSourceEnabled)
  {
    if (v20)
    {
      v21 = *p_enabledIdleTimerDescriptor;
      v26 = 138543618;
      v27 = v21;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "applying updated idle timer descriptor: %{public}@ reason:%{public}@", (uint8_t *)&v26, 0x16u);
    }

    -[SBIdleTimerGlobalCoordinator _applyActiveIdleTimerDescriptorForReason:](self, "_applyActiveIdleTimerDescriptorForReason:", v13);
  }
  else
  {
    if (v20)
    {
      v22 = *p_enabledIdleTimerDescriptor;
      v26 = 138543618;
      v27 = v22;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "not applying updated idle timer descriptor: %{public}@ reason:%{public}@", (uint8_t *)&v26, 0x16u);
    }

  }
  return v15;
}

- (BOOL)_updateIdleTimerForReason:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator _updateIdleTimerForReason:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("SBIdleTimerGlobalCoordinator.m"), 320, CFSTR("this call must be made on the main thread"));

  }
  SBLogIdleTimer();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v7;
    v21 = 2114;
    v22 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - updateIdleTimerForReason:\"%{public}@\"]", (uint8_t *)&v19, 0x16u);

  }
  -[SBIdleTimerGlobalCoordinator _updateGlobalStateDisableAssertions](self, "_updateGlobalStateDisableAssertions");
  -[SBIdleTimerGlobalCoordinator _activeIdleTimerProvider](self, "_activeIdleTimerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SBIdleTimerGlobalCoordinator _idleTimerProvider](self, "_idleTimerProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
      -[SBIdleTimerGlobalCoordinator _setIdleTimerProvider:](self, "_setIdleTimerProvider:", v8);
    objc_msgSend(v8, "coordinatorRequestedIdleTimerBehavior:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBIdleTimerBehavior behaviorForBehaviorProvider:](SBIdleTimerBehavior, "behaviorForBehaviorProvider:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIdleTimerDescriptorFactory idleTimerDescriptorForBehavior:](self->_idleTimerDescriptorFactory, "idleTimerDescriptorForBehavior:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v8 == v9 && (objc_msgSend(v12, "isEqual:", self->_enabledIdleTimerDescriptor) & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      v15 = -[SBIdleTimerGlobalCoordinator _updateIdleTimerForProvider:behavior:descriptor:forReason:](self, "_updateIdleTimerForProvider:behavior:descriptor:forReason:", v8, v11, v13, v4);
      v14 = 1;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __81__SBIdleTimerGlobalCoordinator_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_activeIdleTimerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_msgSend(v2, "coordinatorRequestedIdleTimerBehavior:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBIdleTimerBehavior behaviorForBehaviorProvider:](SBIdleTimerBehavior, "behaviorForBehaviorProvider:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "idleTimerDescriptorForBehavior:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_setIdleTimerProvider:", v7);
      v6 = (id)objc_msgSend(*(id *)(a1 + 32), "_updateIdleTimerForProvider:behavior:descriptor:forReason:", v7, v4, v5, CFSTR("LayoutMonitorDidUpdateDisplayLayout"));
    }

    v2 = v7;
  }

}

- (void)_updateGlobalStateDisableAssertions
{
  _BOOL4 v3;
  BSInvalidatable *disableAutoDimAssertion;
  BSInvalidatable *v5;
  BSInvalidatable *v6;
  void *v7;
  void *v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator _updateGlobalStateDisableAssertions]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBIdleTimerGlobalCoordinator.m"), 518, CFSTR("this call must be made on the main thread"));

  }
  v3 = -[SBIdleTimerGlobalStateMonitor isAutoDimDisabled](self->_globalStateMonitor, "isAutoDimDisabled");
  disableAutoDimAssertion = self->_disableAutoDimAssertion;
  if (disableAutoDimAssertion && !v3)
  {
    -[BSInvalidatable invalidate](disableAutoDimAssertion, "invalidate");
    v5 = 0;
LABEL_10:
    v6 = self->_disableAutoDimAssertion;
    self->_disableAutoDimAssertion = v5;

    return;
  }
  if (disableAutoDimAssertion)
    v3 = 0;
  if (v3)
  {
    -[SBIdleTimerGlobalCoordinator acquireIdleTimerDisableAssertionForReason:](self, "acquireIdleTimerDisableAssertionForReason:", CFSTR("SBDisableAutoDim user default."));
    v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
}

- (SBIdleTimerProviding)_idleTimerProvider
{
  return (SBIdleTimerProviding *)objc_loadWeakRetained((id *)&self->_idleTimerProvider);
}

- (void)_setIdleTimerProvider:(id)a3
{
  SBIdleTimerProviding **p_idleTimerProvider;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  obj = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator _setIdleTimerProvider:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBIdleTimerGlobalCoordinator.m"), 363, CFSTR("this call must be made on the main thread"));

  }
  p_idleTimerProvider = &self->_idleTimerProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_idleTimerProvider);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_idleTimerProvider, obj);
    v6 = obj;
  }

}

- (void)resetIdleTimerForReason:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerGlobalCoordinator.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[reason length] > 0"));

  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator resetIdleTimerForReason:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SBIdleTimerGlobalCoordinator.m"), 173, CFSTR("this call must be made on the main thread"));

  }
  if (!-[SBIdleTimerGlobalCoordinator _updateIdleTimerForReason:](self, "_updateIdleTimerForReason:", v9))
  {
    -[SBIdleTimerGlobalCoordinator idleTimer](self, "idleTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");

  }
}

- (SBIdleTimer)idleTimer
{
  return -[SBIdleTimerProxy sourceTimer](self->_idleTimerProxy, "sourceTimer");
}

+ (SBIdleTimerGlobalCoordinator)sharedInstance
{
  return (SBIdleTimerGlobalCoordinator *)objc_msgSend(a1, "_sharedInstanceCreateIfNeeded:", 1);
}

+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3
{
  if (a3 && _sharedInstanceCreateIfNeeded__onceToken != -1)
    dispatch_once(&_sharedInstanceCreateIfNeeded__onceToken, &__block_literal_global_187);
  return (id)_sharedInstanceCreateIfNeeded__coordinator;
}

- (id)_activeIdleTimerProvider
{
  __objc2_class *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;

  if (+[SBAssistantController isVisible](SBAssistantController, "isVisible"))
  {
    v2 = SBAssistantController;
  }
  else
  {
    +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isInUse");

    if (v4)
    {
      v2 = SBSyncController;
    }
    else
    {
      +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isVisible");

      if (!v6)
      {
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        return v7;
      }
      v2 = SBControlCenterController;
    }
  }
  -[__objc2_class sharedInstance](v2, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

void __37__SBIdleTimerGlobalCoordinator_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "layoutMonitor:didUpdateDisplayLayout:withContext:", v11, v7, v8);

}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogIdleTimer();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%{public}@ - layoutMonitor:didUpdateDisplayLayout]", buf, 0xCu);

  }
  BSDispatchMain();
}

void __62__SBIdleTimerGlobalCoordinator__sharedInstanceCreateIfNeeded___block_invoke()
{
  SBIdleTimerGlobalCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(SBIdleTimerGlobalCoordinator);
  v1 = (void *)_sharedInstanceCreateIfNeeded__coordinator;
  _sharedInstanceCreateIfNeeded__coordinator = (uint64_t)v0;

}

+ (id)sharedInstanceIfExists
{
  return (id)objc_msgSend(a1, "_sharedInstanceCreateIfNeeded:", 0);
}

- (SBIdleTimerGlobalCoordinator)init
{
  SBIdleTimerGlobalCoordinator *v2;
  uint64_t v3;
  SBIdleTimerGlobalStateMonitor *globalStateMonitor;
  SBIdleTimerDescriptorFactory *v5;
  SBIdleTimerDescriptorFactory *idleTimerDescriptorFactory;
  SBIdleTimerCoordinatorHelper *v7;
  SBIdleTimerCoordinatorHelper *idleTimerCoordinatorHelper;
  SBIdleTimerProxy *v9;
  SBIdleTimerProxy *idleTimerProxy;
  SBIdleTimerTelemetryEmitter *v11;
  SBIdleTimerTelemetryEmitter *idleTimerTelemetryEmitter;
  NSString *currentDisablingClientBundleIdentifier;
  NSMutableDictionary *v14;
  NSMutableDictionary *idleTimerDisableAssertions;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBIdleTimerGlobalCoordinator;
  v2 = -[SBIdleTimerGlobalCoordinator init](&v17, sel_init);
  if (v2)
  {
    +[SBIdleTimerGlobalStateMonitor sharedInstance](SBIdleTimerGlobalStateMonitor, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    globalStateMonitor = v2->_globalStateMonitor;
    v2->_globalStateMonitor = (SBIdleTimerGlobalStateMonitor *)v3;

    v5 = -[SBIdleTimerDescriptorFactory initWithGlobalStateMonitor:]([SBIdleTimerDescriptorFactory alloc], "initWithGlobalStateMonitor:", v2->_globalStateMonitor);
    idleTimerDescriptorFactory = v2->_idleTimerDescriptorFactory;
    v2->_idleTimerDescriptorFactory = v5;

    objc_storeWeak((id *)&v2->_idleTimerProvider, 0);
    v7 = -[SBIdleTimerCoordinatorHelper initWithSourceProvider:]([SBIdleTimerCoordinatorHelper alloc], "initWithSourceProvider:", 0);
    idleTimerCoordinatorHelper = v2->_idleTimerCoordinatorHelper;
    v2->_idleTimerCoordinatorHelper = v7;

    v2->_idleTimerSourceEnabled = 1;
    v9 = -[SBIdleTimerProxy initWithIdleTimerSource:]([SBIdleTimerProxy alloc], "initWithIdleTimerSource:", 0);
    idleTimerProxy = v2->_idleTimerProxy;
    v2->_idleTimerProxy = v9;

    -[SBIdleTimerBase addIdleTimerObserver:](v2->_idleTimerProxy, "addIdleTimerObserver:", v2);
    v11 = objc_alloc_init(SBIdleTimerTelemetryEmitter);
    idleTimerTelemetryEmitter = v2->_idleTimerTelemetryEmitter;
    v2->_idleTimerTelemetryEmitter = v11;

    currentDisablingClientBundleIdentifier = v2->_currentDisablingClientBundleIdentifier;
    v2->_currentDisablingClientBundleIdentifier = 0;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    idleTimerDisableAssertions = v2->_idleTimerDisableAssertions;
    v2->_idleTimerDisableAssertions = v14;

    -[SBIdleTimerGlobalCoordinator _addStateCaptureHandlers](v2, "_addStateCaptureHandlers");
    -[SBIdleTimerGlobalCoordinator _registerTestRecipes](v2, "_registerTestRecipes");
  }
  return v2;
}

- (void)dealloc
{
  BSInvalidatable *stateCaptureAssertion;
  BSInvalidatable *v4;
  objc_super v5;

  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    -[BSInvalidatable invalidate](stateCaptureAssertion, "invalidate");
    v4 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;

  }
  -[SBIdleTimerGlobalCoordinator _unregisterTestRecipes](self, "_unregisterTestRecipes");
  v5.receiver = self;
  v5.super_class = (Class)SBIdleTimerGlobalCoordinator;
  -[SBIdleTimerGlobalCoordinator dealloc](&v5, sel_dealloc);
}

- (BOOL)isIdleTimerDisabled
{
  void *v2;
  char v3;

  -[SBIdleTimerGlobalCoordinator idleTimer](self, "idleTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDisabled");

  return v3;
}

- (void)start
{
  void *v4;
  FBSDisplayLayoutMonitor *v5;
  FBSDisplayLayoutMonitor *layoutMonitor;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  id v18;
  id location;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator start]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SBIdleTimerGlobalCoordinator.m"), 143, CFSTR("this call must be made on the main thread"));

  }
  if (self->_started)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerGlobalCoordinator.m"), 145, CFSTR("Cannot start if already started."));

  }
  self->_started = 1;
  -[SBIdleTimerGlobalStateMonitor addObserver:](self->_globalStateMonitor, "addObserver:", self);
  -[SBIdleTimerGlobalCoordinator _updateGlobalStateDisableAssertions](self, "_updateGlobalStateDisableAssertions");
  objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __37__SBIdleTimerGlobalCoordinator_start__block_invoke;
  v17 = &unk_1E8EB1870;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v4, "setTransitionHandler:", &v14);
  objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v4, v14, v15, v16, v17);
  v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v5;

  -[SBIdleTimerGlobalCoordinator _activeIdleTimerProvider](self, "_activeIdleTimerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinatorRequestedIdleTimerBehavior:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIdleTimerBehavior behaviorForBehaviorProvider:](SBIdleTimerBehavior, "behaviorForBehaviorProvider:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SBIdleTimerGlobalCoordinator _updateIdleTimerForProvider:behavior:forReason:](self, "_updateIdleTimerForProvider:behavior:forReason:", v7, v9, CFSTR("Startup"));
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)resetIdleTimerIfNonConsecutiveSource:(id)a3 forReason:(id)a4
{
  id v8;
  SBIdleTimerResetSource *v9;
  void *v10;
  SBIdleTimerResetSource *v11;

  v11 = (SBIdleTimerResetSource *)a3;
  v8 = a4;
  v9 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerGlobalCoordinator.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

    v9 = 0;
  }
  if (self->_lastResetSource != v9)
  {
    -[SBIdleTimerGlobalCoordinator resetIdleTimerForReason:](self, "resetIdleTimerForReason:", v8);
    objc_storeStrong((id *)&self->_lastResetSource, a3);
  }

}

- (void)resetIdleTimerIfCurrentIdealDurationAtLeast:(int64_t)a3 forReason:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[SBIdleTimerGlobalCoordinator _activeIdleTimerProvider](self, "_activeIdleTimerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "coordinatorRequestedIdleTimerBehavior:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "idleTimerDuration") >= a3)
      -[SBIdleTimerGlobalCoordinator resetIdleTimerForReason:](self, "resetIdleTimerForReason:", v9);

  }
}

- (id)acquireIdleTimerDisableAssertionForReason:(id)a3
{
  id v4;
  NSMutableDictionary *idleTimerDisableAssertions;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id location;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator acquireIdleTimerDisableAssertionForReason:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("SBIdleTimerGlobalCoordinator.m"), 201, CFSTR("this call must be made on the main thread"));

  }
  idleTimerDisableAssertions = self->_idleTimerDisableAssertions;
  if (!idleTimerDisableAssertions
    || (-[NSMutableDictionary objectForKey:](idleTimerDisableAssertions, "objectForKey:", v4),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_initWeak(&location, self);
    v8 = objc_alloc(MEMORY[0x1E0D01868]);
    v9 = MEMORY[0x1E0C80D38];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __74__SBIdleTimerGlobalCoordinator_acquireIdleTimerDisableAssertionForReason___block_invoke;
    v23[3] = &unk_1E8EA4CC0;
    objc_copyWeak(&v24, &location);
    v23[4] = self;
    v6 = (void *)objc_msgSend(v8, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("DisableIdleTimer"), v4, MEMORY[0x1E0C80D38], v23);

    -[SBIdleTimerGlobalCoordinator _idleTimerDisableAssertions](self, "_idleTimerDisableAssertions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    objc_msgSend(v10, "setObject:forKey:", v6, v4);
    if (v11)
    {
      SBLogIdleTimer();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v14;
        v28 = 2114;
        v29 = v4;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Idle timer disable assertion: Added a new idle timer disable assertion for reason: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      if (!-[SBIdleTimerGlobalCoordinator _areIdleTimerDisableAssertionsPrevented](self, "_areIdleTimerDisableAssertionsPrevented"))
      {
        SBLogIdleTimer();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v20;
          v28 = 2114;
          v29 = v4;
          _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - Idle timer disable assertion: Disabling idle timer for reason: %{public}@", buf, 0x16u);

        }
        -[SBIdleTimerGlobalCoordinator _setIdleTimerSourceEnabled:forReason:](self, "_setIdleTimerSourceEnabled:forReason:", 0, v4);
        goto LABEL_15;
      }
      SBLogIdleTimer();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        v28 = 2114;
        v29 = v4;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Idle timer disable assertion: Added a new idle timer disable assertion for reason: %{public}@ but disable is prevented.", buf, 0x16u);

      }
    }

LABEL_15:
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    goto LABEL_16;
  }
  SBLogIdleTimer();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[SBIdleTimerGlobalCoordinator acquireIdleTimerDisableAssertionForReason:].cold.1((uint64_t)self, (uint64_t)v4, v7);

LABEL_16:
  return v6;
}

void __74__SBIdleTimerGlobalCoordinator_acquireIdleTimerDisableAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v3, "reason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_idleTimerDisableAssertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v5);
    v7 = objc_msgSend(v6, "count");
    SBLogIdleTimer();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v11;
        v16 = 2114;
        v17 = v5;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Idle timer disable assertion: Removed an idle timer disable assertion for reason: %{public}@", (uint8_t *)&v14, 0x16u);

      }
    }
    else
    {
      if (v9)
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v13;
        v16 = 2114;
        v17 = v5;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Idle timer disable assertion: Reenabling idle timer as last disable assertion removed for reason: %{public}@", (uint8_t *)&v14, 0x16u);

      }
      objc_msgSend(WeakRetained, "_setIdleTimerSourceEnabled:forReason:", 1, v5);
    }

  }
}

- (void)_logEffectiveLockTimeout
{
  SBIdleTimerDescriptor *enabledIdleTimerDescriptor;

  if (!-[SBIdleTimerGlobalCoordinator isIdleTimerDisabled](self, "isIdleTimerDisabled"))
  {
    enabledIdleTimerDescriptor = self->_enabledIdleTimerDescriptor;
    if (enabledIdleTimerDescriptor)
      -[SBIdleTimerDescriptor totalInterval](enabledIdleTimerDescriptor, "totalInterval", -1.0);
  }
  AnalyticsSendEventLazy();
}

id __56__SBIdleTimerGlobalCoordinator__logEffectiveLockTimeout__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("lockTimeout");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_setIdleTimerSourceEnabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator _setIdleTimerSourceEnabled:forReason:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBIdleTimerGlobalCoordinator.m"), 407, CFSTR("this call must be made on the main thread"));

  }
  if (self->_idleTimerSourceEnabled != v4)
  {
    self->_idleTimerSourceEnabled = v4;
    -[SBIdleTimerGlobalCoordinator _applyActiveIdleTimerDescriptorForReason:](self, "_applyActiveIdleTimerDescriptorForReason:", v8);
  }

}

- (void)_applyActiveIdleTimerDescriptorForReason:(id)a3
{
  id v4;
  _BOOL4 idleTimerSourceEnabled;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator _applyActiveIdleTimerDescriptorForReason:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("SBIdleTimerGlobalCoordinator.m"), 416, CFSTR("this call must be made on the main thread"));

  }
  idleTimerSourceEnabled = self->_idleTimerSourceEnabled;
  SBLogIdleTimer();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (idleTimerSourceEnabled)
  {
    if (v7)
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "_applyActiveIdleTimerDescriptorForReason:\"%{public}@\" enabled", (uint8_t *)&v11, 0xCu);
    }

    -[SBIdleTimerGlobalCoordinator _setIdleTimerWithDescriptor:forReason:](self, "_setIdleTimerWithDescriptor:forReason:", self->_enabledIdleTimerDescriptor, v4);
    -[SBIdleTimerProxy setSourceTimer:](self->_enabledIdleTimerProxy, "setSourceTimer:", self->_idleTimerProxy);
  }
  else
  {
    if (v7)
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "_applyActiveIdleTimerDescriptorForReason:\"%{public}@\" disabled", (uint8_t *)&v11, 0xCu);
    }

    -[SBIdleTimerProxy setSourceTimer:](self->_enabledIdleTimerProxy, "setSourceTimer:", 0);
    +[SBIdleTimerDescriptorFactory disabledIdleTimerDescriptor](SBIdleTimerDescriptorFactory, "disabledIdleTimerDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIdleTimerGlobalCoordinator _setIdleTimerWithDescriptor:forReason:](self, "_setIdleTimerWithDescriptor:forReason:", v8, v4);

  }
}

- (void)_setIdleTimerWithDescriptor:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBIdleTimerGlobalCoordinator _setIdleTimerWithDescriptor:forReason:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("SBIdleTimerGlobalCoordinator.m"), 429, CFSTR("this call must be made on the main thread"));

  }
  SBLogIdleTimer();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543618;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "_setIdleTimerWithDescriptor:%{public}@ reason:\"%{public}@\"]", (uint8_t *)&v16, 0x16u);
  }

  -[SBIdleTimerGlobalCoordinator _activeIdleTimerProvider](self, "_activeIdleTimerProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIdleTimerGlobalCoordinator _setIdleTimerProvider:](self, "_setIdleTimerProvider:", v9);

  -[SBIdleTimerGlobalCoordinator idleTimer](self, "idleTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = 0;
  +[SBIdleTimerFactory idleTimerForDescriptor:didLogDescriptor:](SBIdleTimerFactory, "idleTimerForDescriptor:didLogDescriptor:", v6, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == v10)
  {
    SBLogIdleTimer();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SBIdleTimerGlobalCoordinator _setIdleTimerWithDescriptor:forReason:].cold.1((uint64_t)self, (uint64_t)v10, v13);
  }
  else
  {
    if (!(_BYTE)v16)
    {
      SBLogIdleTimer();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logAuditReasons:", v12);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setActivated:", 0);
    -[SBIdleTimerProxy setSourceTimer:](self->_idleTimerProxy, "setSourceTimer:", v11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "setActivated:", 1);
    -[SBIdleTimerGlobalCoordinator delegate](self, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject idleTimerGlobalCoordinator:didActivateIdleTimer:](v13, "idleTimerGlobalCoordinator:didActivateIdleTimer:", self, v11);
  }

  -[SBIdleTimerGlobalCoordinator _logTelemetryForIdleTimerUpdatedFromTimer:toTimer:withReason:](self, "_logTelemetryForIdleTimerUpdatedFromTimer:toTimer:withReason:", v10, v11, v7);
  objc_msgSend(v11, "reset");

}

- (void)_addStateCaptureHandlers
{
  SBIdleTimerGlobalCoordinator *v2;
  uint64_t v3;
  BSInvalidatable *stateCaptureAssertion;
  SBIdleTimerGlobalCoordinator *v5;

  v5 = self;
  v2 = v5;
  BSLogAddStateCaptureBlockWithTitle();
  v3 = objc_claimAutoreleasedReturnValue();
  stateCaptureAssertion = v2->_stateCaptureAssertion;
  v2->_stateCaptureAssertion = (BSInvalidatable *)v3;

}

__CFString *__56__SBIdleTimerGlobalCoordinator__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  void *v1;
  __CFString *v2;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "_stateCaptureDescription");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_1E8EC7EC0;
  }
  return v2;
}

- (id)_stateCaptureDescription
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  SBIdleTimerGlobalCoordinator *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __56__SBIdleTimerGlobalCoordinator__stateCaptureDescription__block_invoke;
  v10 = &unk_1E8E9E820;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v7);
  objc_msgSend(v4, "build", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __56__SBIdleTimerGlobalCoordinator__stateCaptureDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "allValues");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendArraySection:withName:skipIfEmpty:", v10, CFSTR("DisabledAssertions"), 0);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "idleTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateCaptureDescriptionWithMultilinePrefix:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "appendObject:withName:", v5, CFSTR("IdleTimer"));

  v7 = *(void **)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v9 = (id)objc_msgSend(v7, "appendObject:withName:", WeakRetained, CFSTR("IdleTimerProvider"));

}

- (void)_logTelemetryForIdleTimerUpdatedFromTimer:(id)a3 toTimer:(id)a4 withReason:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  uint64_t v11;
  int v12;
  SBIdleTimerTelemetryEmitter *idleTimerTelemetryEmitter;
  uint64_t v14;
  void *v15;
  NSString *currentDisablingClientBundleIdentifier;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "isDisabled"))
  {
    if ((objc_msgSend(v9, "hasPrefix:", CFSTR("IdleTimerDisableChangedForMainDisplaySceneManager - client:")) & 1) != 0
      || objc_msgSend(v9, "hasPrefix:", CFSTR("IdleTimerServiceTimeoutAssertionsDidChange - client:")))
    {
      if (objc_msgSend(v9, "hasPrefix:", CFSTR("IdleTimerDisableChangedForMainDisplaySceneManager - client:")))
      {
        objc_msgSend(v9, "substringFromIndex:", objc_msgSend(CFSTR("IdleTimerDisableChangedForMainDisplaySceneManager - client:"), "length"));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      if (objc_msgSend(v9, "hasPrefix:", CFSTR("IdleTimerServiceTimeoutAssertionsDidChange - client:")))
      {
        objc_msgSend(v9, "substringFromIndex:", objc_msgSend(CFSTR("IdleTimerServiceTimeoutAssertionsDidChange - client:"), "length"));
        v11 = objc_claimAutoreleasedReturnValue();

        v10 = (__CFString *)v11;
      }
    }
    else
    {
      v10 = CFSTR("com.apple.springboard");
    }
  }
  else
  {
    v10 = 0;
  }
  v12 = objc_msgSend(v17, "isDisabled");
  if (v12 != objc_msgSend(v8, "isDisabled")
    || !BSEqualStrings()
    || objc_msgSend(v9, "hasSuffix:", CFSTR("AutoLockTimeout")))
  {
    idleTimerTelemetryEmitter = self->_idleTimerTelemetryEmitter;
    v14 = objc_msgSend(v8, "isDisabled");
    -[SBIdleTimerGlobalStateMonitor autoLockTimeout](self->_globalStateMonitor, "autoLockTimeout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIdleTimerTelemetryEmitter logTelemetryForUpdatedIdleTimerState:disablingClientBundleIdentifier:autoLockTimeoutDuration:](idleTimerTelemetryEmitter, "logTelemetryForUpdatedIdleTimerState:disablingClientBundleIdentifier:autoLockTimeoutDuration:", v14, v10, v15);

  }
  currentDisablingClientBundleIdentifier = self->_currentDisablingClientBundleIdentifier;
  self->_currentDisablingClientBundleIdentifier = &v10->isa;

}

- (void)_idleTimerPrefsChanged
{
  BSDispatchMain();
}

uint64_t __54__SBIdleTimerGlobalCoordinator__idleTimerPrefsChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateIdleTimerForReason:", CFSTR("IdleTimerPrefsChanged"));
}

- (void)idleTimerDidRefresh:(id)a3
{
  SBIdleTimerResetSource *lastResetSource;

  lastResetSource = self->_lastResetSource;
  self->_lastResetSource = 0;

}

- (void)idleTimerDidResetForUserAttention:(id)a3
{
  SBIdleTimerResetSource *lastResetSource;

  lastResetSource = self->_lastResetSource;
  self->_lastResetSource = 0;

}

- (void)_registerTestRecipes
{
  -[SBIdleTimerGlobalCoordinator _registerClientDisableAssertionsTestRecipe](self, "_registerClientDisableAssertionsTestRecipe");
  -[SBIdleTimerGlobalCoordinator _registerInternalDisableAssertionsTestRecipe](self, "_registerInternalDisableAssertionsTestRecipe");
}

- (void)_unregisterTestRecipes
{
  PTTestRecipe *clientDisableAssertionsTestRecipe;
  PTTestRecipe *v4;
  PTTestRecipe *internalDisableAssertionsTestRecipe;
  PTTestRecipe *v6;

  clientDisableAssertionsTestRecipe = self->_clientDisableAssertionsTestRecipe;
  if (clientDisableAssertionsTestRecipe)
  {
    -[PTTestRecipe invalidate](clientDisableAssertionsTestRecipe, "invalidate");
    v4 = self->_clientDisableAssertionsTestRecipe;
    self->_clientDisableAssertionsTestRecipe = 0;

  }
  internalDisableAssertionsTestRecipe = self->_internalDisableAssertionsTestRecipe;
  if (internalDisableAssertionsTestRecipe)
  {
    -[PTTestRecipe invalidate](internalDisableAssertionsTestRecipe, "invalidate");
    v6 = self->_internalDisableAssertionsTestRecipe;
    self->_internalDisableAssertionsTestRecipe = 0;

  }
}

- (void)_registerClientDisableAssertionsTestRecipe
{
  PTTestRecipe *v3;
  PTTestRecipe *clientDisableAssertionsTestRecipe;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[7];
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__63;
  v9[4] = __Block_byref_object_dispose__63;
  v10 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke;
  v8[3] = &unk_1E8E9ED40;
  v8[4] = v9;
  v6[4] = v9;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2;
  v7[3] = &unk_1E8E9FD08;
  v7[4] = self;
  v7[5] = v9;
  v7[6] = a2;
  v5[4] = v9;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_82;
  v6[3] = &unk_1E8E9ED40;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2_83;
  v5[3] = &unk_1E8E9ED40;
  objc_msgSend(MEMORY[0x1E0D83030], "recipeWithTitle:prepareBlock:increaseAction:decreaseAction:cleanupBlock:", CFSTR("Client Disable IdleTimer Assertions"), v8, v7, v6, v5);
  v3 = (PTTestRecipe *)objc_claimAutoreleasedReturnValue();
  clientDisableAssertionsTestRecipe = self->_clientDisableAssertionsTestRecipe;
  self->_clientDisableAssertionsTestRecipe = v3;

  +[PTDomain registerTestRecipe:](SBIdleTimerDomain, "registerTestRecipe:", self->_clientDisableAssertionsTestRecipe);
  _Block_object_dispose(v9, 8);

}

void __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ClientIdleTimerTestRecipe:%ld"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count") + 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D3A8B8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v4 = (void *)objc_msgSend(v3, "newAssertionToDisableIdleTimerForReason:error:", v2, &v7);
  v5 = v7;

  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);
  }
  else
  {
    SBLogIdleTimer();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2_cold_1(a1, (uint64_t)v5, v6);

  }
}

void __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_82(uint64_t a1)
{
  id v2;

  BSDispatchQueueAssertMain();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeLastObject");
    objc_msgSend(v2, "invalidate");
  }

}

void __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2_83(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "invalidate", (_QWORD)v9);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (void)_registerInternalDisableAssertionsTestRecipe
{
  PTTestRecipe *v3;
  PTTestRecipe *internalDisableAssertionsTestRecipe;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__63;
  v9[4] = __Block_byref_object_dispose__63;
  v10 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke;
  v8[3] = &unk_1E8E9ED40;
  v8[4] = v9;
  v6[4] = v9;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_2;
  v7[3] = &unk_1E8E9ED40;
  v7[4] = v9;
  v5[4] = v9;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_3;
  v6[3] = &unk_1E8E9ED40;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_4;
  v5[3] = &unk_1E8E9ED40;
  objc_msgSend(MEMORY[0x1E0D83030], "recipeWithTitle:prepareBlock:increaseAction:decreaseAction:cleanupBlock:", CFSTR("Internal Disable IdleTimer Assertions"), v8, v7, v6, v5);
  v3 = (PTTestRecipe *)objc_claimAutoreleasedReturnValue();
  internalDisableAssertionsTestRecipe = self->_internalDisableAssertionsTestRecipe;
  self->_internalDisableAssertionsTestRecipe = v3;

  +[PTDomain registerTestRecipe:](SBIdleTimerDomain, "registerTestRecipe:", self->_internalDisableAssertionsTestRecipe);
  _Block_object_dispose(v9, 8);

}

void __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InternalIdleTimerTestRecipe:%ld"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") + 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acquireIdleTimerDisableAssertionForReason:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
}

void __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_3(uint64_t a1)
{
  id v2;

  BSDispatchQueueAssertMain();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lastObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeLastObject");
    objc_msgSend(v2, "invalidate");
  }

}

void __76__SBIdleTimerGlobalCoordinator__registerInternalDisableAssertionsTestRecipe__block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "invalidate", (_QWORD)v9);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (SBIdleTimerGlobalCoordinatorDelegate)delegate
{
  return (SBIdleTimerGlobalCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)_setIdleTimerDisableAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerDisableAssertions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerDisableAssertions, 0);
  objc_destroyWeak((id *)&self->_idleTimerProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalDisableAssertionsTestRecipe, 0);
  objc_storeStrong((id *)&self->_clientDisableAssertionsTestRecipe, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_currentDisablingClientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_idleTimerTelemetryEmitter, 0);
  objc_storeStrong((id *)&self->_lastResetSource, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_disableAutoDimAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_enabledIdleTimerDescriptor, 0);
  objc_storeStrong((id *)&self->_enabledIdleTimerProxy, 0);
  objc_storeStrong((id *)&self->_idleTimerProxy, 0);
  objc_storeStrong((id *)&self->_globalStateMonitor, 0);
  objc_storeStrong((id *)&self->_idleTimerDescriptorFactory, 0);
}

- (void)acquireIdleTimerDisableAssertionForReason:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "%{public}@ - Idle timer disable assertion: Requested again for an existing reason without first being invalidated: %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_20();
}

- (void)_setIdleTimerWithDescriptor:(NSObject *)a3 forReason:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ - ignoring attempted set of same idle timer impl (%{public}@)", (uint8_t *)&v8, 0x16u);

  OUTLINED_FUNCTION_20();
}

void __74__SBIdleTimerGlobalCoordinator__registerClientDisableAssertionsTestRecipe__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v7;
  v11 = 2114;
  v12 = v8;
  v13 = 2114;
  v14 = a2;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "%{public}@ - %{public}@ failed to acquire assertion with error: %{public}@]", (uint8_t *)&v9, 0x20u);

}

@end
