@implementation SBSystemActionSuppressionManager

- (id)initWithSelectedAction:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  SBSystemActionSuppressionManagerStateReducer *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v3 = a2;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)SBSystemActionSuppressionManager;
    a1 = (id *)objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObserver:", a1);
      objc_initWeak(&location, a1);
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __59__SBSystemActionSuppressionManager_initWithSelectedAction___block_invoke;
      v16 = &unk_1E8EA6E60;
      objc_copyWeak(&v17, &location);
      v5 = (void *)MEMORY[0x1D17E5550](&v13);
      v6 = [SBSystemActionSuppressionManagerStateReducer alloc];
      +[SBSystemActionViewObstructionState emptyState]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SBSystemActionSuppressionManagerStateReducer initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:]((id *)&v6->super.isa, v5, (void *)1, v7, v3, 0, (void *)objc_msgSend(v4, "backlightState", v13, v14, v15, v16), objc_msgSend(v4, "isAlwaysOnEnabled"));
      v9 = a1[3];
      a1[3] = v8;

      if (objc_msgSend(MEMORY[0x1E0CA56A8], "isPocketStateAvailable"))
      {
        v10 = objc_alloc_init(MEMORY[0x1E0CA56A8]);
        v11 = a1[2];
        a1[2] = v10;

        objc_msgSend(a1[2], "setDelegate:", a1);
      }
      objc_msgSend(a1, "_updateViewObstructionSubscription");

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);

    }
  }

  return a1;
}

void __59__SBSystemActionSuppressionManager_initWithSelectedAction___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didReduceState:", v3);

}

- (uint64_t)suppressionStatus
{
  if (a1)
  {
    -[SBHomeScreenConfigurationServer listener](a1[4]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)systemActionInteractionDidStartWithLongPressTimeout:(uint64_t)result
{
  _BOOL8 *v3;
  double v4;

  if (result)
  {
    v3 = (_BOOL8 *)result;
    if ((os_variant_has_internal_diagnostics() & 1) != 0
      || (result = -[SBCameraHardwareButton shouldUsePocketStateDetection](v3[4]), (_DWORD)result))
    {
      v4 = a2 + -0.1;
      if (a2 + -0.1 < 0.1)
        v4 = 0.1;
      return objc_msgSend(v3, "_queryPocketStateWithTimeout:", v4);
    }
  }
  return result;
}

- (void)addObserver:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)removeObserver:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "removeObject:", a2);
  return result;
}

- (void)_subscribeToViewObstructionEvents
{
  NSObject *v3;
  CMSuppressionManager *suppressionManager;
  CMSuppressionManager *v5;
  CMSuppressionManager *v6;
  CMSuppressionManager *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  SBSystemActionSuppressionManager *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self->_subscribedToViewObstructionEvents && objc_msgSend(MEMORY[0x1E0CA56D8], "isAvailable"))
  {
    SBLogSystemActionSuppression();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = self;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) subscribing to VO", buf, 0xCu);
    }

    suppressionManager = self->_suppressionManager;
    if (!suppressionManager)
    {
      v5 = (CMSuppressionManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA56D8]), "initWithClientType:", 3);
      v6 = self->_suppressionManager;
      self->_suppressionManager = v5;

      suppressionManager = self->_suppressionManager;
    }
    self->_subscribedToViewObstructionEvents = 1;
    -[CMSuppressionManager startService](suppressionManager, "startService");
    v7 = self->_suppressionManager;
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__SBSystemActionSuppressionManager__subscribeToViewObstructionEvents__block_invoke;
    v9[3] = &unk_1E8EA6E88;
    v9[4] = self;
    -[CMSuppressionManager startSuppressionUpdatesToQueue:withOptions:withHandler:](v7, "startSuppressionUpdatesToQueue:withOptions:withHandler:", v8, 1, v9);

  }
}

void __69__SBSystemActionSuppressionManager__subscribeToViewObstructionEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SBLogSystemActionSuppression();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedFailureReason");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v13;
      v18 = 2114;
      v19 = v5;
      v20 = 2114;
      v21 = v14;
      v22 = 2114;
      v23 = v15;
      _os_log_fault_impl(&dword_1D0540000, v8, OS_LOG_TYPE_FAULT, "(%{public}@) suppression event error - event:%{public}@ error:%{public}@ reason:%{public}@", (uint8_t *)&v16, 0x2Au);

    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    +[SBSystemActionViewObstructionState stateWithError:]((uint64_t)SBSystemActionViewObstructionState, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v9;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) suppression event: %{public}@", (uint8_t *)&v16, 0x16u);
    }

    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    +[SBSystemActionViewObstructionState stateWithEvent:]((uint64_t)SBSystemActionViewObstructionState, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  -[SBSystemActionSuppressionManagerStateReducer setViewObstructionState:](v10, v11);

}

- (void)_unsubscribeFromViewObstructionEvents
{
  NSObject *v3;
  SBSystemActionSuppressionManagerStateReducer *stateReducer;
  void *v5;
  int v6;
  SBSystemActionSuppressionManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_subscribedToViewObstructionEvents)
  {
    SBLogSystemActionSuppression();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) unsubscribing from VO", (uint8_t *)&v6, 0xCu);
    }

    -[CMSuppressionManager stopSuppressionUpdates](self->_suppressionManager, "stopSuppressionUpdates");
    -[CMSuppressionManager stopService](self->_suppressionManager, "stopService");
    self->_subscribedToViewObstructionEvents = 0;
    stateReducer = self->_stateReducer;
    +[SBSystemActionViewObstructionState emptyState]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemActionSuppressionManagerStateReducer setViewObstructionState:]((uint64_t)stateReducer, v5);

  }
}

- (void)_updateViewObstructionSubscription
{
  if (-[_SBLoadApplicationResult isSuccess]((_BOOL8)self->_state))
    -[SBSystemActionSuppressionManager _subscribeToViewObstructionEvents](self, "_subscribeToViewObstructionEvents");
  else
    -[SBSystemActionSuppressionManager _unsubscribeFromViewObstructionEvents](self, "_unsubscribeFromViewObstructionEvents");
}

- (void)_queryPocketStateWithTimeout:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  CMPocketStateManager *pocketStateManager;
  id v9;
  _QWORD v10[4];
  id v11[2];
  uint8_t buf[4];
  SBSystemActionSuppressionManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CA56A8], "isPocketStateAvailable"))
  {
    SBLogSystemActionSuppression();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) querying pocket state", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    BSContinuousMachTimeNow();
    v7 = v6;
    pocketStateManager = self->_pocketStateManager;
    v9 = MEMORY[0x1E0C80D38];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__SBSystemActionSuppressionManager__queryPocketStateWithTimeout___block_invoke;
    v10[3] = &unk_1E8EA6EB0;
    objc_copyWeak(v11, (id *)buf);
    v11[1] = v7;
    -[CMPocketStateManager queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:](pocketStateManager, "queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:", MEMORY[0x1E0C80D38], v10, 10.0, a3);

    objc_destroyWeak(v11);
    objc_destroyWeak((id *)buf);
  }
}

void __65__SBSystemActionSuppressionManager__queryPocketStateWithTimeout___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  _QWORD **WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  int v12;
  _QWORD **v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = (_QWORD **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    SBLogSystemActionSuppression();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __65__SBSystemActionSuppressionManager__queryPocketStateWithTimeout___block_invoke_cold_1((uint64_t)WeakRetained, v5, v8);

    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        SBNSStringFromCMPocketStateType(a2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = WeakRetained;
        v14 = 2114;
        v15 = v9;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) pocket state queried: %{public}@", (uint8_t *)&v12, 0x16u);

      }
      -[SBSystemActionSuppressionManagerStateReducer setPocketState:](WeakRetained[3], a2);
    }
    +[SBSystemActionAnalyticsTracker sharedTracker]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    BSContinuousMachTimeNow();
    -[SBSystemActionAnalyticsTracker trackPocketStateQueryWithExecutionTime:error:]((uint64_t)v10, v5, v11 - *(double *)(a1 + 40));

  }
}

- (void)_didReduceState:(id)a3
{
  id v5;
  SBSystemActionSuppressionManagerState *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v6 = self->_state;
    objc_storeStrong((id *)&self->_state, a3);
    -[SBSystemActionSuppressionManager _updateViewObstructionSubscription](self, "_updateViewObstructionSubscription");
    -[SBHomeScreenConfigurationServer listener]((uint64_t)self->_state);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenConfigurationServer listener]((uint64_t)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualObjects();

    if ((v9 & 1) == 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
            -[SBHomeScreenConfigurationServer listener]((uint64_t)self->_state);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "systemActionSuppressionManager:didUpdateSuppressionStatus:", self, v16);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

    }
  }

}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__SBSystemActionSuppressionManager_pocketStateManager_didUpdateState___block_invoke;
  v4[3] = &unk_1E8E9DE88;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

void __70__SBSystemActionSuppressionManager_pocketStateManager_didUpdateState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogSystemActionSuppression();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    SBNSStringFromCMPocketStateType(*(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) pocket state change: %{public}@", (uint8_t *)&v5, 0x16u);

  }
  -[SBSystemActionSuppressionManagerStateReducer setPocketState:](*(_QWORD **)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40));
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  -[SBSystemActionSuppressionManagerStateReducer setDisplayState:](&self->_stateReducer->super.isa, a4);
}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
  -[SBSystemActionSuppressionManagerStateReducer setIsAlwaysOnDisplayEnabled:]((uint64_t)self->_stateReducer, a4);
}

- (void)systemActionDataSource:(id)a3 didUpdateSelectedAction:(id)a4
{
  -[SBSystemActionSuppressionManagerStateReducer setSelectedAction:]((uint64_t)self->_stateReducer, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_stateReducer, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
}

void __65__SBSystemActionSuppressionManager__queryPocketStateWithTimeout___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedFailureReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "(%{public}@) failed to query pocket state - error:%{public}@ reason:%{public}@", (uint8_t *)&v8, 0x20u);

}

@end
