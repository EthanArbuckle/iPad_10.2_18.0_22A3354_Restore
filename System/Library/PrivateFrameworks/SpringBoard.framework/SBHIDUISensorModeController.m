@implementation SBHIDUISensorModeController

- (SBHIDUISensorModeController)init
{
  void *v3;
  SBHIDUISensorModeController *v4;

  objc_msgSend(MEMORY[0x1E0D00D58], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBHIDUISensorModeController initWithSensorService:](self, "initWithSensorService:", v3);

  return v4;
}

- (SBHIDUISensorModeController)initWithSensorService:(id)a3
{
  id v5;
  SBHIDUISensorModeController *v6;
  SBHIDUISensorModeController *v7;
  NSMutableArray *v8;
  NSMutableArray *assertions;
  uint64_t v10;
  SBAVSystemControllerCache *avCache;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BSCompoundAssertion *digitizerModeBaselineAssertion;
  void *v16;
  uint64_t v17;
  BSCompoundAssertion *proximityModeAssertion;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBHIDUISensorModeController;
  v6 = -[SBHIDUISensorModeController init](&v25, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sensorService, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assertions = v7->_assertions;
    v7->_assertions = v8;

    +[SBAVSystemControllerCache sharedInstance](SBAVSystemControllerCache, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    avCache = v7->_avCache;
    v7->_avCache = (SBAVSystemControllerCache *)v10;

    -[SBAVSystemControllerCache addObserver:](v7->_avCache, "addObserver:", v7);
    objc_initWeak(&location, v7);
    v12 = (void *)MEMORY[0x1E0D01718];
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __53__SBHIDUISensorModeController_initWithSensorService___block_invoke;
    v22[3] = &unk_1E8EA3688;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v12, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("digitizerModeBaseline"), v22);
    v14 = objc_claimAutoreleasedReturnValue();
    digitizerModeBaselineAssertion = v7->_digitizerModeBaselineAssertion;
    v7->_digitizerModeBaselineAssertion = (BSCompoundAssertion *)v14;

    v16 = (void *)MEMORY[0x1E0D01718];
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __53__SBHIDUISensorModeController_initWithSensorService___block_invoke_2;
    v20[3] = &unk_1E8EA3688;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v16, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("proximityMode"), v20);
    v17 = objc_claimAutoreleasedReturnValue();
    proximityModeAssertion = v7->_proximityModeAssertion;
    v7->_proximityModeAssertion = (BSCompoundAssertion *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __53__SBHIDUISensorModeController_initWithSensorService___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reevaluateLockStateForSource:", 0);

}

void __53__SBHIDUISensorModeController_initWithSensorService___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reevaluateLockStateForSource:", 0);

}

- (void)invalidate
{
  BSCompoundAssertion *digitizerModeBaselineAssertion;
  BSCompoundAssertion *proximityModeAssertion;
  BSInvalidatable *proximityDetectionModeAssertion;

  -[BSCompoundAssertion invalidate](self->_digitizerModeBaselineAssertion, "invalidate");
  digitizerModeBaselineAssertion = self->_digitizerModeBaselineAssertion;
  self->_digitizerModeBaselineAssertion = 0;

  -[BSCompoundAssertion invalidate](self->_proximityModeAssertion, "invalidate");
  proximityModeAssertion = self->_proximityModeAssertion;
  self->_proximityModeAssertion = 0;

  -[BSInvalidatable invalidate](self->_proximityDetectionModeAssertion, "invalidate");
  proximityDetectionModeAssertion = self->_proximityDetectionModeAssertion;
  self->_proximityDetectionModeAssertion = 0;

}

- (void)_reevaluateLockStateForSource:(int64_t)a3
{
  SBHIDUISensorModeController *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  int v22;
  SBHIDUISensorModeController *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  BKSHIDUISensorMode *v34;
  char v35;
  NSObject *v36;
  _BOOL4 v37;
  BKSHIDUISensorMode *sensorMode;
  BKSHIDUISensorService *sensorService;
  BSInvalidatable *v40;
  uint64_t v41;
  BSInvalidatable *sensorModeAssertion;
  SBHIDUISensorModeController *v43;
  _BOOL8 v44;
  void *v45;
  _QWORD v46[7];
  int v47;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  BKSHIDUISensorMode *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (self->_sensorModeTransactionCount)
    return;
  v4 = self;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", CFSTR("SB"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v5 = v4->_assertions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (!v6)
  {

    LOBYTE(v9) = 0;
    v8 = 0;
    v21 = a3 == 3;
    goto LABEL_23;
  }
  v7 = v6;
  v43 = v4;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v54;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v54 != v12)
        objc_enumerationMutation(v5);
      v14 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
      v15 = objc_msgSend(v14, "digitizerMode");
      if (v15 > v11)
        v11 = v15;
      v16 = objc_msgSend(v14, "displayState");
      if (qword_1D0E8C010[v16] > qword_1D0E8C010[v8])
        v8 = v16;
      v10 |= objc_msgSend(v14, "suspendProximitySensor");
      v9 |= objc_msgSend(v14, "pocketTouchesExpected");
      objc_msgSend(v14, "reason");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addObject:", v17);

    }
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  }
  while (v7);

  v4 = v43;
  if ((unint64_t)(v11 - 1) <= 2
    && -[BSCompoundAssertion isActive](v43->_digitizerModeBaselineAssertion, "isActive"))
  {
    -[BSCompoundAssertion context](v43->_digitizerModeBaselineAssertion, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bs_reduce:block:", &unk_1E91D2408, &__block_literal_global_409);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v19, "integerValue");
    if (v11 == 4)
      v8 = 1;
    -[BSCompoundAssertion reasons](v43->_digitizerModeBaselineAssertion, "reasons");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "unionSet:", v20);

  }
  v21 = a3 == 3;
  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      v22 = 20;
      goto LABEL_37;
    }
LABEL_23:
    if (-[BSCompoundAssertion isActive](v4->_proximityModeAssertion, "isActive"))
    {
      v44 = v21;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v23 = v4;
      -[BSCompoundAssertion orderedContext](v4->_proximityModeAssertion, "orderedContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v25)
      {
        v26 = v25;
        v22 = 0;
        v27 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v50 != v27)
              objc_enumerationMutation(v24);
            v29 = objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "intValue");
            v30 = BKSHIDServicesProximityDetectionModePriority();
            if (v30 > BKSHIDServicesProximityDetectionModePriority())
              v22 = v29;
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        }
        while (v26);
      }
      else
      {
        v22 = 0;
      }

      v4 = v23;
      -[BSCompoundAssertion reasons](v23->_proximityModeAssertion, "reasons");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "unionSet:", v31);

      v11 = 0;
      v21 = v44;
    }
    else
    {
      v11 = 0;
      v22 = 0;
    }
    goto LABEL_37;
  }
  v22 = 5;
LABEL_37:
  objc_msgSend(v45, "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "componentsJoinedByString:", CFSTR(" + "));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __61__SBHIDUISensorModeController__reevaluateLockStateForSource___block_invoke_2;
  v46[3] = &__block_descriptor_61_e35_v16__0__BKSMutableHIDUISensorMode_8l;
  v47 = v22;
  v46[4] = v8;
  v46[5] = v11;
  v48 = v9 & 1;
  v46[6] = v21;
  objc_msgSend(MEMORY[0x1E0D00D50], "buildModeForReason:builder:", v33, v46);
  v34 = (BKSHIDUISensorMode *)objc_claimAutoreleasedReturnValue();
  v35 = -[BKSHIDUISensorMode isEqual:](v4->_sensorMode, "isEqual:", v34);
  SBLogProximitySensor();
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  if ((v35 & 1) != 0)
  {
    if (v37)
    {
      sensorMode = v4->_sensorMode;
      *(_DWORD *)buf = 138543362;
      v58 = sensorMode;
      _os_log_impl(&dword_1D0540000, v36, OS_LOG_TYPE_DEFAULT, "reevalute: no change -- %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v37)
    {
      *(_DWORD *)buf = 138543362;
      v58 = v34;
      _os_log_impl(&dword_1D0540000, v36, OS_LOG_TYPE_DEFAULT, "reevalute: -> %{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v4->_sensorMode, v34);
    -[BKSHIDUISensorService suppressUISensorChangesForReason:](v4->_sensorService, "suppressUISensorChangesForReason:", CFSTR("SB transaction"));
    v36 = objc_claimAutoreleasedReturnValue();
    sensorService = v4->_sensorService;
    v40 = v4->_sensorModeAssertion;
    -[BKSHIDUISensorService requestUISensorMode:](sensorService, "requestUISensorMode:", v34);
    v41 = objc_claimAutoreleasedReturnValue();
    sensorModeAssertion = v4->_sensorModeAssertion;
    v4->_sensorModeAssertion = (BSInvalidatable *)v41;

    -[BSInvalidatable invalidate](v40, "invalidate");
    -[NSObject invalidate](v36, "invalidate");
  }

}

id __61__SBHIDUISensorModeController__reevaluateLockStateForSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "integerValue");
  if (v6 <= objc_msgSend(v4, "integerValue"))
    v7 = v4;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

void __61__SBHIDUISensorModeController__reevaluateLockStateForSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setProximityDetectionMode:", *(unsigned int *)(a1 + 56));
    v3 = v4;
    if (*(_DWORD *)(a1 + 56) == 13)
    {
      objc_msgSend(v4, "setPostEventWithCurrentDetectionMask:", 1);
      v3 = v4;
    }
  }
  objc_msgSend(v3, "setDisplayState:", *(_QWORD *)(a1 + 32));
  switch(*(_QWORD *)(a1 + 40))
  {
    case 0:
      objc_msgSend(v4, "setDigitizerEnabled:", 1);
      if (*(_BYTE *)(a1 + 60))
        objc_msgSend(v4, "setPocketTouchesExpected:", 1);
      break;
    case 1:
      objc_msgSend(v4, "setTapToWakeEnabled:", 1);
      break;
    case 2:
      objc_msgSend(v4, "setTapToWakeEnabled:", 1);
      goto LABEL_10;
    case 3:
      objc_msgSend(v4, "setWakeOnTapThroughEnabled:", 1);
LABEL_10:
      objc_msgSend(v4, "setWakeOnSwipeEnabled:", 1);
      objc_msgSend(v4, "setCoverGestureEnabled:", 1);
      break;
    default:
      break;
  }
  objc_msgSend(v4, "setChangeSource:", *(_QWORD *)(a1 + 48));

}

- (id)_requestSensorModeAssertionForReason:(id)a3 source:(int64_t)a4 builder:(id)a5
{
  void (**v8)(id, SBHIDUISensorModeAssertion *);
  id v9;
  SBHIDUISensorModeAssertion *v10;
  NSObject *v11;
  int v13;
  SBHIDUISensorModeAssertion *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, SBHIDUISensorModeAssertion *))a5;
  v9 = a3;
  v10 = objc_alloc_init(SBHIDUISensorModeAssertion);
  -[SBHIDUISensorModeAssertion setSensorModeController:](v10, "setSensorModeController:", self);
  -[SBHIDUISensorModeAssertion setReason:](v10, "setReason:", v9);

  -[SBHIDUISensorModeAssertion setSource:](v10, "setSource:", a4);
  v8[2](v8, v10);

  -[NSMutableArray addObject:](self->_assertions, "addObject:", v10);
  SBLogProximitySensor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v10;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "add: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  -[SBHIDUISensorModeController _reevaluateLockStateForSource:](self, "_reevaluateLockStateForSource:", a4);
  return v10;
}

- (BOOL)pocketTouchesExpected
{
  BSDispatchQueueAssertMain();
  return self->_pocketTouchesAssertion != 0;
}

- (void)setPocketTouchesExpected:(BOOL)a3
{
  _BOOL4 v3;
  SBHIDUISensorModeAssertion *pocketTouchesAssertion;
  SBHIDUISensorModeAssertion *v6;
  SBHIDUISensorModeAssertion *v7;
  SBHIDUISensorModeAssertion *v8;

  v3 = a3;
  BSDispatchQueueAssertMain();
  pocketTouchesAssertion = self->_pocketTouchesAssertion;
  if ((((pocketTouchesAssertion == 0) ^ v3) & 1) == 0)
  {
    if (v3)
    {
      v6 = objc_alloc_init(SBHIDUISensorModeAssertion);
      -[SBHIDUISensorModeAssertion setSensorModeController:](v6, "setSensorModeController:", self);
      -[SBHIDUISensorModeAssertion setReason:](v6, "setReason:", CFSTR("pocketTouches"));
      -[SBHIDUISensorModeAssertion setSource:](v6, "setSource:", 0);
      -[SBHIDUISensorModeAssertion setPocketTouchesExpected:](v6, "setPocketTouchesExpected:", 1);
      v7 = self->_pocketTouchesAssertion;
      self->_pocketTouchesAssertion = v6;
      v8 = v6;

      -[NSMutableArray addObject:](self->_assertions, "addObject:", self->_pocketTouchesAssertion);
    }
    else
    {
      -[SBHIDUISensorModeAssertion invalidate](pocketTouchesAssertion, "invalidate");
      v8 = self->_pocketTouchesAssertion;
      self->_pocketTouchesAssertion = 0;
    }

    -[SBHIDUISensorModeController _reevaluateLockStateForSource:](self, "_reevaluateLockStateForSource:", 29);
  }
}

- (id)addStartupHIDLockAssertion
{
  SBHIDUISensorModeAssertion *v3;
  NSObject *v4;
  int v6;
  SBHIDUISensorModeAssertion *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(SBHIDUISensorModeAssertion);
  -[SBHIDUISensorModeAssertion setSensorModeController:](v3, "setSensorModeController:", self);
  -[SBHIDUISensorModeAssertion setDigitizerMode:](v3, "setDigitizerMode:", 1);
  -[SBHIDUISensorModeAssertion setSuspendProximitySensor:](v3, "setSuspendProximitySensor:", 1);
  -[SBHIDUISensorModeAssertion setReason:](v3, "setReason:", CFSTR("boot"));
  -[NSMutableArray addObject:](self->_assertions, "addObject:", v3);
  SBLogProximitySensor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "add: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[SBHIDUISensorModeController _reevaluateLockStateForSource:](self, "_reevaluateLockStateForSource:", 15);
  return v3;
}

- (void)_removeHIDUISensorModeAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogProximitySensor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "remove: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableArray removeObject:](self->_assertions, "removeObject:", v4);
  -[SBHIDUISensorModeController _reevaluateLockStateForSource:](self, "_reevaluateLockStateForSource:", 0);

}

- (id)suspendProximityDetectionForSource:(int64_t)a3 reason:(id)a4
{
  return -[SBHIDUISensorModeController _requestSensorModeAssertionForReason:source:builder:](self, "_requestSensorModeAssertionForReason:source:builder:", a4, a3, &__block_literal_global_24_0);
}

uint64_t __73__SBHIDUISensorModeController_suspendProximityDetectionForSource_reason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSuspendProximitySensor:", 1);
}

- (id)suspendProximityDetection:(BOOL)a3 disableDigitizer:(int64_t)a4 source:(int64_t)a5 reason:(id)a6
{
  _QWORD v7[5];
  BOOL v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__SBHIDUISensorModeController_suspendProximityDetection_disableDigitizer_source_reason___block_invoke;
  v7[3] = &__block_descriptor_41_e36_v16__0__SBHIDUISensorModeAssertion_8l;
  v7[4] = a4;
  v8 = a3;
  -[SBHIDUISensorModeController _requestSensorModeAssertionForReason:source:builder:](self, "_requestSensorModeAssertionForReason:source:builder:", a6, a5, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __88__SBHIDUISensorModeController_suspendProximityDetection_disableDigitizer_source_reason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setDigitizerMode:", v3);
  objc_msgSend(v4, "setSuspendProximitySensor:", *(unsigned __int8 *)(a1 + 40));

}

- (id)suspendProximityDetectionAndDisableDigitizer:(int64_t)a3 source:(int64_t)a4 reason:(id)a5
{
  return -[SBHIDUISensorModeController suspendProximityDetection:disableDigitizer:source:reason:](self, "suspendProximityDetection:disableDigitizer:source:reason:", 1, a3, a4, a5);
}

- (id)assertDisplayState:(int64_t)a3 source:(int64_t)a4 reason:(id)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SBHIDUISensorModeController_assertDisplayState_source_reason___block_invoke;
  v6[3] = &__block_descriptor_40_e36_v16__0__SBHIDUISensorModeAssertion_8l;
  v6[4] = a3;
  -[SBHIDUISensorModeController _requestSensorModeAssertionForReason:source:builder:](self, "_requestSensorModeAssertionForReason:source:builder:", a5, a4, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __64__SBHIDUISensorModeController_assertDisplayState_source_reason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisplayState:", *(_QWORD *)(a1 + 32));
}

- (id)assertBaselineDisabledDigitizerMode:(int64_t)a3 source:(int64_t)a4 reason:(id)a5
{
  BSCompoundAssertion *digitizerModeBaselineAssertion;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  digitizerModeBaselineAssertion = self->_digitizerModeBaselineAssertion;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](digitizerModeBaselineAssertion, "acquireForReason:withContext:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sensorModeTransactionForBacklightChangeSource:(int64_t)a3
{
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9[2];
  id location;

  objc_initWeak(&location, self);
  ++self->_sensorModeTransactionCount;
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__SBHIDUISensorModeController_sensorModeTransactionForBacklightChangeSource___block_invoke;
  v8[3] = &unk_1E8E9E4B8;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  v6 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("sensorModeTransaction"), CFSTR("hello"), v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  return v6;
}

void __77__SBHIDUISensorModeController_sensorModeTransactionForBacklightChangeSource___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    --WeakRetained[9];
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_reevaluateLockStateForSource:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (id)requestProximityMode:(int)a3 forReason:(id)a4
{
  uint64_t v4;
  BSCompoundAssertion *proximityModeAssertion;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a3;
  proximityModeAssertion = self->_proximityModeAssertion;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](proximityModeAssertion, "acquireForReason:withContext:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_hasModeAssertions
{
  return -[NSMutableArray count](self->_assertions, "count") != 0;
}

- (void)cache:(id)a3 didUpdateActiveAudioRoute:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a4;
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "inCall") && (objc_msgSend(v7, "isEqualToString:", CFSTR("Receiver")) & 1) != 0)
    v6 = 0;
  else
    v6 = _os_feature_enabled_impl();
  self->_shouldUseLowPowerActiveProxDetectionMode = v6;

}

- (void)setProximityDetectionEnabled:(BOOL)a3
{
  -[SBHIDUISensorModeController setProximityDetectionEnabled:changeSource:](self, "setProximityDetectionEnabled:changeSource:", a3, 0);
}

- (void)setProximityDetectionEnabled:(BOOL)a3 changeSource:(unint64_t)a4
{
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  BSInvalidatable *v15;
  void *v16;
  BSInvalidatable *v17;
  BSInvalidatable *proximityDetectionModeAssertion;
  _QWORD v19[5];
  int v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_proximityDetectionEnabled != a3)
  {
    self->_proximityDetectionEnabled = a3;
    if (-[SBHIDUISensorModeController isProximityDetectionEnabled](self, "isProximityDetectionEnabled"))
    {
      if (self->_shouldUseLowPowerActiveProxDetectionMode)
        v6 = 6;
      else
        v6 = 3;
      v7 = CFSTR("low power mode active");
      if (!self->_shouldUseLowPowerActiveProxDetectionMode)
        v7 = CFSTR("active");
      v8 = v7;
    }
    else
    {
      v6 = 0;
      v8 = CFSTR("inactive");
    }
    v9 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromBKSHIDUISensorChangeSource();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%s Setting prox sensor to: %@ changeSource: %@"), "-[SBHIDUISensorModeController setProximityDetectionEnabled:changeSource:]", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogProximitySensor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    if (v6)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __73__SBHIDUISensorModeController_setProximityDetectionEnabled_changeSource___block_invoke;
      v19[3] = &__block_descriptor_44_e35_v16__0__BKSMutableHIDUISensorMode_8l;
      v20 = v6;
      v19[4] = a4;
      objc_msgSend(MEMORY[0x1E0D00D50], "buildModeForReason:builder:", v11, v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D00D58];
      v15 = self->_proximityDetectionModeAssertion;
      objc_msgSend(v14, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "requestUISensorMode:", v13);
      v17 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      proximityDetectionModeAssertion = self->_proximityDetectionModeAssertion;
      self->_proximityDetectionModeAssertion = v17;

      -[BSInvalidatable invalidate](v15, "invalidate");
    }
    else
    {
      -[BSInvalidatable invalidate](self->_proximityDetectionModeAssertion, "invalidate");
      v13 = self->_proximityDetectionModeAssertion;
      self->_proximityDetectionModeAssertion = 0;
    }

  }
}

void __73__SBHIDUISensorModeController_setProximityDetectionEnabled_changeSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDigitizerEnabled:", 1);
  objc_msgSend(v3, "setProximityDetectionMode:", *(unsigned int *)(a1 + 40));
  objc_msgSend(v3, "setChangeSource:", *(_QWORD *)(a1 + 32));

}

- (BOOL)isProximityDetectionEnabled
{
  return self->_proximityDetectionEnabled;
}

- (BOOL)shouldUseLowPowerActiveProxDetectionMode
{
  return self->_shouldUseLowPowerActiveProxDetectionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avCache, 0);
  objc_storeStrong((id *)&self->_pocketTouchesAssertion, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_proximityModeAssertion, 0);
  objc_storeStrong((id *)&self->_digitizerModeBaselineAssertion, 0);
  objc_storeStrong((id *)&self->_proximityDetectionModeAssertion, 0);
  objc_storeStrong((id *)&self->_sensorModeAssertion, 0);
  objc_storeStrong((id *)&self->_sensorMode, 0);
  objc_storeStrong((id *)&self->_sensorService, 0);
}

@end
