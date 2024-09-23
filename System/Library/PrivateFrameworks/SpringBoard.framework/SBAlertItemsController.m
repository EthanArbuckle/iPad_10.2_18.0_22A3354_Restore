@implementation SBAlertItemsController

+ (SBAlertItemsController)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_45);
  return (SBAlertItemsController *)(id)sharedInstance___instance;
}

- (void)setForceAlertsToPend:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsController.m"), 1106, CFSTR("a valid reason must be given for changing the pending state"));

  }
  SBLogAlertItems();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v9)
      -[SBAlertItemsController setForceAlertsToPend:forReason:].cold.1((uint64_t)v7, v8, v10, v11, v12, v13, v14, v15);

    -[NSMutableSet addObject:](self->_forceAlertsToPendReasons, "addObject:", v7);
  }
  else
  {
    if (v9)
      -[SBAlertItemsController setForceAlertsToPend:forReason:].cold.2((uint64_t)v7, v8, v10, v11, v12, v13, v14, v15);

    v16 = -[NSMutableSet count](self->_forceAlertsToPendReasons, "count");
    -[NSMutableSet removeObject:](self->_forceAlertsToPendReasons, "removeObject:", v7);
    if (v16 && !-[NSMutableSet count](self->_forceAlertsToPendReasons, "count"))
      -[SBAlertItemsController activatePendedAlertsIfNecessary](self, "activatePendedAlertsIfNecessary");
  }

}

- (void)activatePendedAlertsIfNecessary
{
  BSDispatchQueueAssertMain();
  -[SBAlertItemsController _processAlertItemQueuesAnimated:](self, "_processAlertItemQueuesAnimated:", 1);
}

- (void)moveActiveUnlockedAlertsToPendingWithAnimation:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = -[NSMutableOrderedSet count](self->_alertItemPresentations, "count");
  v8 = -[NSMutableOrderedSet count](self->_superModalAlertItemPresentations, "count") + v7;
  if (-[NSMutableSet count](self->_forceAlertsToPendReasons, "count"))
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v6)
      v6[2](v6);
  }
  else
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D016E8], "sentinelWithQueue:signalCount:completion:", MEMORY[0x1E0C80D38], v8, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke;
    v12[3] = &unk_1E8E9EE00;
    v14 = v4;
    v12[4] = self;
    v13 = v10;
    v11 = v10;
    -[SBAlertItemsController _performBatchActions:animated:processQueue:](self, "_performBatchActions:animated:processQueue:", v12, v4, 0);

  }
}

- (id)alertItemsOfClass:(Class)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  Class v12;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (-[SBAlertItemsObjectQueue hasObjectOfClass:](self->_superModalItemsQueue, "hasObjectOfClass:", a3))
  {
    -[SBAlertItemsObjectQueue objectsOfClass:](self->_superModalItemsQueue, "objectsOfClass:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v6);

  }
  if (-[SBAlertItemsObjectQueue hasObjectOfClass:](self->_alertItemsQueue, "hasObjectOfClass:", a3))
  {
    -[SBAlertItemsObjectQueue objectsOfClass:](self->_alertItemsQueue, "objectsOfClass:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v7);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__SBAlertItemsController_alertItemsOfClass___block_invoke;
  v10[3] = &unk_1E8EA40D0;
  v12 = a3;
  v8 = v5;
  v11 = v8;
  -[SBAlertItemsController _enumeratePresentationsWithType:usingBlock:](self, "_enumeratePresentationsWithType:usingBlock:", 3, v10);

  return v8;
}

- (void)_enumerateWithDirection:(unint64_t)a3 presentationsWithType:(unint64_t)a4 usingBlock:(id)a5
{
  char v5;
  void (**v8)(id, void *, void *, _BYTE *);
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v5 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *, void *, _BYTE *))a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  if ((v5 & 2) != 0)
  {
    -[NSMutableOrderedSet array](self->_superModalAlertItemPresentations, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v10);

  }
  if ((v5 & 1) != 0)
  {
    -[NSMutableOrderedSet array](self->_alertItemPresentations, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v11);

  }
  v24 = 0;
  if (a3)
    objc_msgSend(v9, "reverseObjectEnumerator");
  else
    objc_msgSend(v9, "objectEnumerator");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
LABEL_10:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
      objc_msgSend(v17, "alertItem", (_QWORD)v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "presenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v18, v19, &v24);

      if (v24)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v14)
          goto LABEL_10;
        break;
      }
    }
  }

}

- (void)_enumeratePresentationsWithType:(unint64_t)a3 usingBlock:(id)a4
{
  -[SBAlertItemsController _enumerateWithDirection:presentationsWithType:usingBlock:](self, "_enumerateWithDirection:presentationsWithType:usingBlock:", 0, a3, a4);
}

- (void)_processAlertItemQueuesAnimated:(BOOL)a3
{
  _BOOL8 v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;

  if (!self->_isProcessingQueue && !self->_delayProcessingQueue)
  {
    v4 = a3;
    self->_isProcessingQueue = 1;
    v5 = -[SBAlertItemsObjectQueue hasObject](self->_superModalItemsQueue, "hasObject");
    v6 = 16;
    if (v5)
      v6 = 24;
    v7 = *(id *)((char *)&self->super.isa + v6);
    -[SBAlertItemsController _processAlertItemsFromQueue:animated:](self, "_processAlertItemsFromQueue:animated:", v7, v4);
    self->_isProcessingQueue = 0;

  }
}

- (void)_processAlertItemsFromQueue:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  _BOOL4 v25;
  __int128 v26;
  NSObject *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  NSObject *v39;
  __int16 v40;
  NSObject *v41;
  _BYTE v42[128];
  uint64_t v43;

  v29 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "hasObject"))
  {
    v30 = v5;
    objc_msgSend(v5, "dequeueAllObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (!v7)
      goto LABEL_29;
    v9 = v7;
    v10 = *(_QWORD *)v35;
    *(_QWORD *)&v8 = 138543362;
    v26 = v8;
    v31 = v6;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[SBAlertItemsController _presentationForAlertItem:](self, "_presentationForAlertItem:", v12, v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          SBLogAlertItems();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          objc_msgSend(v12, "_publicDescription");
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "presenter");
          v16 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v15;
          v40 = 2114;
          v41 = v16;
          _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Activation - ignoring activation attempt for %{public}@ because it's already presented by %{public}@.", buf, 0x16u);

          goto LABEL_15;
        }
        v33 = 0;
        v17 = -[SBAlertItemsController _isAlertItemPresentable:outReasonsNotPresentable:](self, "_isAlertItemPresentable:outReasonsNotPresentable:", v12, &v33);
        v14 = v33;
        if (v17)
        {
          v32 = 0;
          v18 = -[SBAlertItemsController _shouldPendAlertItem:outReasonsPended:](self, "_shouldPendAlertItem:outReasonsPended:", v12, &v32);
          v15 = v32;
          if (v18)
          {
            SBLogAlertItems();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v12, "_publicDescription");
              v20 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v39 = v20;
              v40 = 2114;
              v41 = v15;
              _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Activation - Pending activation of %{public}@ due to reason: %{public}@", buf, 0x16u);

              v6 = v31;
            }

            objc_msgSend(v30, "appendObject:", v12);
LABEL_15:

            goto LABEL_27;
          }
          -[SBAlertItemsController _presenterForAlertItem:](self, "_presenterForAlertItem:", v12);
          v23 = objc_claimAutoreleasedReturnValue();
          SBLogAlertItems();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          if (v23)
          {
            if (v25)
            {
              objc_msgSend(v12, "_publicDescription");
              v27 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v39 = v27;
              v40 = 2114;
              v41 = v23;
              _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Activation - Presenting %{public}@ with presenter: %{public}@", buf, 0x16u);

            }
            -[SBAlertItemsController _presentAlertItem:withPresenter:animated:](self, "_presentAlertItem:withPresenter:animated:", v12, v23, v29);
          }
          else
          {
            if (v25)
            {
              objc_msgSend(v12, "_publicDescription");
              v28 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v26;
              v39 = v28;
              _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Activation - Pending activation of %{public}@ because no presenter is capable of presenting it currently.", buf, 0xCu);

            }
            objc_msgSend(v30, "appendObject:", v12);
          }

          v6 = v31;
        }
        else
        {
          SBLogAlertItems();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "_publicDescription");
            v22 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v39 = v22;
            v40 = 2114;
            v41 = v14;
            _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "Activation - Failed to activate %{public}@ because it's not allowed at this time for reason: %{public}@", buf, 0x16u);

          }
          objc_msgSend(v12, "didFailToActivate");
        }
LABEL_27:

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (!v9)
      {
LABEL_29:

        v5 = v30;
        break;
      }
    }
  }

}

void __40__SBAlertItemsController_sharedInstance__block_invoke()
{
  SBAlertItemsController *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SBAlertItemsController alloc];
  objc_msgSend((id)SBApp, "userSessionController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SBAlertItemsController _initWithUserSessionController:](v0, "_initWithUserSessionController:", v3);
  v2 = (void *)sharedInstance___instance;
  sharedInstance___instance = v1;

}

- (SBAlertItemsController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsController.m"), 106, CFSTR("Unavailable"));

  return 0;
}

- (id)_initWithUserSessionController:(id)a3
{
  id v5;
  SBAlertItemsController *v6;
  SBAlertItemsController *v7;
  SBAlertItemsObjectQueue *v8;
  SBAlertItemsObjectQueue *alertItemsQueue;
  SBAlertItemsObjectQueue *v10;
  SBAlertItemsObjectQueue *superModalItemsQueue;
  NSMutableOrderedSet *v12;
  NSMutableOrderedSet *alertItemPresentations;
  NSMutableOrderedSet *v14;
  NSMutableOrderedSet *superModalAlertItemPresentations;
  NSMutableSet *v16;
  NSMutableSet *pendedAlertsToReenqueuePostDismissal;
  NSMutableSet *v18;
  NSMutableSet *forceAlertsToPendReasons;
  NSMutableSet *v20;
  NSMutableSet *activePresenters;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  BSInvalidatable *stateCaptureBlock;
  id v29;
  id location;
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SBAlertItemsController;
  v6 = -[SBAlertItemsController init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userSessionController, a3);
    v8 = objc_alloc_init(SBAlertItemsObjectQueue);
    alertItemsQueue = v7->_alertItemsQueue;
    v7->_alertItemsQueue = v8;

    v10 = objc_alloc_init(SBAlertItemsObjectQueue);
    superModalItemsQueue = v7->_superModalItemsQueue;
    v7->_superModalItemsQueue = v10;

    v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    alertItemPresentations = v7->_alertItemPresentations;
    v7->_alertItemPresentations = v12;

    v14 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    superModalAlertItemPresentations = v7->_superModalAlertItemPresentations;
    v7->_superModalAlertItemPresentations = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pendedAlertsToReenqueuePostDismissal = v7->_pendedAlertsToReenqueuePostDismissal;
    v7->_pendedAlertsToReenqueuePostDismissal = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    forceAlertsToPendReasons = v7->_forceAlertsToPendReasons;
    v7->_forceAlertsToPendReasons = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activePresenters = v7->_activePresenters;
    v7->_activePresenters = v20;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v7, sel__buddyDidExit, CFSTR("SBSetupBuddyCompletedNotification"), 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v7, sel__activeCallStateDidChange_, *MEMORY[0x1E0DAC2B0], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v7, sel__silencingHardwareButtonPressed_, *MEMORY[0x1E0DAC350], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v7, sel__silencingHardwareButtonPressed_, *MEMORY[0x1E0DAC378], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v7, sel__silencingHardwareButtonPressed_, *MEMORY[0x1E0DAC3F8], 0);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "miscellaneousDefaults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_suppressAlertsForKeynote = objc_msgSend(v24, "suppressAlertsForKeynote");

    objc_initWeak(&location, v7);
    v25 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v29, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v26 = objc_claimAutoreleasedReturnValue();
    stateCaptureBlock = v7->_stateCaptureBlock;
    v7->_stateCaptureBlock = (BSInvalidatable *)v26;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  return v7;
}

id __57__SBAlertItemsController__initWithUserSessionController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_stateCaptureBlock, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBAlertItemsController;
  -[SBAlertItemsController dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[SBAlertItemsController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBAlertItemsController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBAlertItemsController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBAlertItemsController *v11;

  v4 = a3;
  -[SBAlertItemsController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SBAlertItemsController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __64__SBAlertItemsController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t v17;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("superModalItemsQueue"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("alertItemsQueue"), 1);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("superModalPresentations"), 1);
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("presentations"), 1);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "activeMultilinePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __64__SBAlertItemsController_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v15 = &unk_1E8E9E820;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v16 = v8;
  v17 = v9;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Presenters"), v7, &v12);

  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("activePresenters"), 1, v12, v13, v14, v15);
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 92), CFSTR("suppress alerts for keynote"));

}

id __64__SBAlertItemsController_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("lockScreenModalAlertItemPresenter"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), CFSTR("lockScreenNotificationsAlertItemPresenter"), 1);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144), CFSTR("systemApertureAlertItemPresenter"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152), CFSTR("unlockedAlertItemPresenter"), 1);
}

- (void)setUnlockedAlertItemPresenter:(id)a3
{
  SBAlertItemPresenter *v5;

  v5 = (SBAlertItemPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (self->_unlockedAlertItemPresenter != v5)
  {
    objc_storeStrong((id *)&self->_unlockedAlertItemPresenter, a3);
    -[SBAlertItemsController _updateActiveDestinations](self, "_updateActiveDestinations");
  }

}

- (void)setSystemApertureAlertItemPresenter:(id)a3
{
  SBAlertItemPresenter *v5;

  v5 = (SBAlertItemPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (self->_systemApertureAlertItemPresenter != v5)
  {
    objc_storeStrong((id *)&self->_systemApertureAlertItemPresenter, a3);
    -[SBAlertItemsController _updateActiveDestinations](self, "_updateActiveDestinations");
  }

}

- (void)setLockScreenModalAlertItemPresenter:(id)a3
{
  SBAlertItemPresenter *v5;

  v5 = (SBAlertItemPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (self->_lockScreenModalAlertItemPresenter != v5)
  {
    objc_storeStrong((id *)&self->_lockScreenModalAlertItemPresenter, a3);
    -[SBAlertItemsController _updateActiveDestinations](self, "_updateActiveDestinations");
  }

}

- (void)setLockScreenNotificationsAlertItemPresenter:(id)a3
{
  SBAlertItemPresenter *v5;

  v5 = (SBAlertItemPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (self->_lockScreenNotificationsAlertItemPresenter != v5)
  {
    objc_storeStrong((id *)&self->_lockScreenNotificationsAlertItemPresenter, a3);
    -[SBAlertItemsController _updateActiveDestinations](self, "_updateActiveDestinations");
  }

}

- (void)setInUILockedMode:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_inUILockedMode != v3)
  {
    self->_inUILockedMode = v3;
    -[SBAlertItemsController _updateActiveDestinations](self, "_updateActiveDestinations");
  }
}

- (void)setIsContinuityDisplaySceneConnected:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_isContinuityDisplaySceneConnected != v3)
  {
    self->_isContinuityDisplaySceneConnected = v3;
    -[SBAlertItemsController _updateActiveDestinations](self, "_updateActiveDestinations");
  }
}

- (void)convertUnlockedAlertsToLockedAlerts
{
  _QWORD v3[5];

  BSDispatchQueueAssertMain();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke;
  v3[3] = &unk_1E8E9DED8;
  v3[4] = self;
  -[SBAlertItemsController _performBatchActions:animated:processQueue:](self, "_performBatchActions:animated:processQueue:", v3, 1, 1);
}

uint64_t __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint8_t buf[16];

  SBLogAlertItems();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Converting unlocked alerts to locked alerts.", buf, 2u);
  }

  v3 = MEMORY[0x1E0C809B0];
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke_44;
  v8[3] = &unk_1E8EA3F28;
  v8[4] = v4;
  objc_msgSend(v4, "_enumerateWithDirection:presentationsWithType:usingBlock:", 1, 1, v8);
  v5 = *(void **)(a1 + 32);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke_2;
  v7[3] = &unk_1E8EA3F28;
  v7[4] = v5;
  return objc_msgSend(v5, "_enumeratePresentationsWithType:usingBlock:", 2, v7);
}

void __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unlockedAlertItemPresenter");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((id)v6 == v5)
  {

  }
  else
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "systemApertureAlertItemPresenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v5)
      goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "deactivateAlertItem:reason:animated:", v9, 0, 0);
  if (objc_msgSend(v9, "reappearsAfterLock"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "prependObject:", v9);
LABEL_7:

}

void __61__SBAlertItemsController_convertUnlockedAlertsToLockedAlerts__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unlockedAlertItemPresenter");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((id)v6 == v5)
  {

  }
  else
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "systemApertureAlertItemPresenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v5)
      goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "deactivateAlertItem:reason:animated:", v9, 0, 0);
  if (objc_msgSend(v9, "reappearsAfterLock"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "appendObject:", v9);
LABEL_7:

}

- (void)convertLockedAlertsToUnlockedAlerts
{
  _QWORD v3[5];

  BSDispatchQueueAssertMain();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke;
  v3[3] = &unk_1E8E9DED8;
  v3[4] = self;
  -[SBAlertItemsController _performBatchActions:animated:processQueue:](self, "_performBatchActions:animated:processQueue:", v3, 1, 0);
}

uint64_t __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint8_t buf[16];

  SBLogAlertItems();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Converting locked alerts to unlocked alerts.", buf, 2u);
  }

  v3 = MEMORY[0x1E0C809B0];
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke_46;
  v8[3] = &unk_1E8EA3F28;
  v8[4] = v4;
  objc_msgSend(v4, "_enumerateWithDirection:presentationsWithType:usingBlock:", 1, 1, v8);
  v5 = *(void **)(a1 + 32);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke_2;
  v7[3] = &unk_1E8EA3F28;
  v7[4] = v5;
  return objc_msgSend(v5, "_enumeratePresentationsWithType:usingBlock:", 2, v7);
}

void __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "lockScreenModalAlertItemPresenter");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((id)v6 == v5)
  {

  }
  else
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "lockScreenNotificationsAlertItemPresenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v5)
      goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "deactivateAlertItem:reason:animated:", v9, 6, 0);
  if (objc_msgSend(v9, "reappearsAfterUnlock"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "prependObject:", v9);
LABEL_7:

}

void __61__SBAlertItemsController_convertLockedAlertsToUnlockedAlerts__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "lockScreenModalAlertItemPresenter");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((id)v6 == v5)
  {

  }
  else
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "lockScreenNotificationsAlertItemPresenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v5)
      goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "deactivateAlertItem:reason:animated:", v9, 6, 0);
  if (objc_msgSend(v9, "reappearsAfterUnlock"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "appendObject:", v9);
LABEL_7:

}

- (void)activateAlertItem:(id)a3
{
  -[SBAlertItemsController activateAlertItem:animated:](self, "activateAlertItem:animated:", a3, 1);
}

- (void)activateAlertItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  SBAlertItemsObjectQueue **p_alertItemsQueue;
  int v12;
  void *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BSDispatchQueueAssertMain();
  if (!v6)
    goto LABEL_13;
  SBLogAlertItems();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "_publicDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Received request to activate alertItem: %{public}@", (uint8_t *)&v12, 0xCu);

  }
  if (!self->_suppressAlertsForKeynote || !objc_msgSend(v6, "suppressForKeynote"))
  {
    if (objc_msgSend(v6, "behavesSuperModally"))
    {
      -[SBAlertItemsObjectQueue appendObject:](self->_superModalItemsQueue, "appendObject:", v6);
      p_alertItemsQueue = &self->_alertItemsQueue;
      if (!-[SBAlertItemsObjectQueue containsObject:](self->_alertItemsQueue, "containsObject:", v6))
      {
LABEL_12:
        -[SBAlertItemsController _processAlertItemQueuesAnimated:](self, "_processAlertItemQueuesAnimated:", v4);
        goto LABEL_13;
      }
    }
    else
    {
      -[SBAlertItemsObjectQueue appendObject:](self->_alertItemsQueue, "appendObject:", v6);
      p_alertItemsQueue = &self->_superModalItemsQueue;
      if (!-[SBAlertItemsObjectQueue containsObject:](self->_superModalItemsQueue, "containsObject:", v6))
        goto LABEL_12;
    }
    -[SBAlertItemsObjectQueue removeObject:](*p_alertItemsQueue, "removeObject:", v6);
    goto LABEL_12;
  }
  SBLogAlertItems();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "_publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Supressing alertItem: %{public}@, for keynote", (uint8_t *)&v12, 0xCu);

  }
LABEL_13:

}

- (void)deactivateAlertItem:(id)a3
{
  -[SBAlertItemsController deactivateAlertItem:reason:](self, "deactivateAlertItem:reason:", a3, 5);
}

- (void)deactivateAlertItem:(id)a3 reason:(int)a4
{
  -[SBAlertItemsController deactivateAlertItem:reason:animated:](self, "deactivateAlertItem:reason:animated:", a3, *(_QWORD *)&a4, 1);
}

- (void)deactivateAlertItem:(id)a3 reason:(int)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  void *v9;
  id v10;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v10 = a3;
  BSDispatchQueueAssertMain();
  if ((_DWORD)v6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsController.m"), 355, CFSTR("Only the SBAlertItemsController can deactivate for pended reasons."));

  }
  -[SBAlertItemsController _deactivateAlertItem:reason:animated:](self, "_deactivateAlertItem:reason:animated:", v10, v6, v5);

}

- (void)windowSceneDidConnect:(id)a3 withSharedModalAlertItemPresenter:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SBAlertItemsController lockScreenModalAlertItemPresenter](self, "lockScreenModalAlertItemPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SBAlertItemsController lockScreenModalAlertItemPresenter](self, "lockScreenModalAlertItemPresenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowSceneDidConnect:withSharedModalAlertItemPresenter:", v13, v6);

  }
  -[SBAlertItemsController unlockedAlertItemPresenter](self, "unlockedAlertItemPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SBAlertItemsController unlockedAlertItemPresenter](self, "unlockedAlertItemPresenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowSceneDidConnect:withSharedModalAlertItemPresenter:", v13, v6);

  }
  if (objc_msgSend(v13, "isContinuityDisplayWindowScene"))
    -[SBAlertItemsController setIsContinuityDisplaySceneConnected:](self, "setIsContinuityDisplaySceneConnected:", 1);

}

- (void)windowSceneDidDisconnect:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SBAlertItemsController lockScreenModalAlertItemPresenter](self, "lockScreenModalAlertItemPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SBAlertItemsController lockScreenModalAlertItemPresenter](self, "lockScreenModalAlertItemPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowSceneDidDisconnect:", v10);

  }
  -[SBAlertItemsController unlockedAlertItemPresenter](self, "unlockedAlertItemPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SBAlertItemsController unlockedAlertItemPresenter](self, "unlockedAlertItemPresenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowSceneDidDisconnect:", v10);

  }
  if (objc_msgSend(v10, "isContinuityDisplayWindowScene"))
    -[SBAlertItemsController setIsContinuityDisplaySceneConnected:](self, "setIsContinuityDisplaySceneConnected:", 0);

}

- (void)_clearAllQueuedAlertItems
{
  id v3;
  id v4;

  v3 = -[SBAlertItemsObjectQueue dequeueAllObjects](self->_alertItemsQueue, "dequeueAllObjects");
  v4 = -[SBAlertItemsObjectQueue dequeueAllObjects](self->_superModalItemsQueue, "dequeueAllObjects");
}

- (void)_updateActiveDestinations
{
  -[NSMutableSet removeAllObjects](self->_activePresenters, "removeAllObjects");
  if (self->_inUILockedMode)
  {
    if (self->_lockScreenModalAlertItemPresenter)
      -[NSMutableSet addObject:](self->_activePresenters, "addObject:");
    if (self->_lockScreenNotificationsAlertItemPresenter)
      -[NSMutableSet addObject:](self->_activePresenters, "addObject:");
    if (self->_isContinuityDisplaySceneConnected)
    {
      if (!self->_unlockedAlertItemPresenter
        || (-[NSMutableSet addObject:](self->_activePresenters, "addObject:"), self->_isContinuityDisplaySceneConnected))
      {
        if (self->_systemApertureAlertItemPresenter)
LABEL_10:
          -[NSMutableSet addObject:](self->_activePresenters, "addObject:");
      }
    }
  }
  else
  {
    if (self->_systemApertureAlertItemPresenter)
      -[NSMutableSet addObject:](self->_activePresenters, "addObject:");
    if (self->_unlockedAlertItemPresenter)
      goto LABEL_10;
  }
}

- (void)_performBatchActions:(id)a3 animated:(BOOL)a4 processQueue:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void (**v8)(void);
  void (**v9)(void);

  v5 = a5;
  v6 = a4;
  v8 = (void (**)(void))a3;
  if (v8)
  {
    self->_delayProcessingQueue = 1;
    v9 = v8;
    v8[2]();
    v8 = v9;
    self->_delayProcessingQueue = 0;
    if (v5)
    {
      -[SBAlertItemsController _processAlertItemQueuesAnimated:](self, "_processAlertItemQueuesAnimated:", v6);
      v8 = v9;
    }
  }

}

- (BOOL)_isAlertItemPresentable:(id)a3 outReasonsNotPresentable:(id *)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  int v9;
  void *v10;
  BOOL v11;
  char v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75__SBAlertItemsController__isAlertItemPresentable_outReasonsNotPresentable___block_invoke;
  v14[3] = &unk_1E8EA3F50;
  v14[4] = &v15;
  v14[5] = a4;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v14);
  objc_msgSend((id)SBApp, "restartManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPendingExit");

  if (v9)
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("The system is shutting down or pending a restart."));
  if (objc_msgSend(v6, "ignoreIfAlreadyDisplaying")
    && -[SBAlertItemsController hasAlertOfClass:](self, "hasAlertOfClass:", objc_opt_class()))
  {
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("Already presenting an item of this class type."));
  }
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isInSetupMode") && (objc_msgSend(v6, "allowInSetup") & 1) == 0)
  {
    v13 = objc_msgSend(v6, "pendInSetupIfNotAllowed");

    if ((v13 & 1) == 0)
      ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("Alert cannot show while we're in Setup."));
  }
  else
  {

  }
  if (-[SBUserSessionController isLoginSession](self->_userSessionController, "isLoginSession")
    && (objc_msgSend(v6, "allowInLoginWindow") & 1) == 0)
  {
    ((void (**)(_QWORD, const __CFString *))v7)[2](v7, CFSTR("Alert cannot show in the login window session."));
  }
  v11 = objc_msgSend((id)v16[5], "count") == 0;

  _Block_object_dispose(&v15, 8);
  return v11;
}

void __75__SBAlertItemsController__isAlertItemPresentable_outReasonsNotPresentable___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      **(_QWORD **)(a1 + 40) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v4, "addObject:", v8);
    v3 = v8;
  }

}

- (BOOL)_hasPresentationForPresenter:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SBAlertItemsController__hasPresentationForPresenter___block_invoke;
  v7[3] = &unk_1E8EA3F78;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBAlertItemsController _enumeratePresentationsWithType:usingBlock:](self, "_enumeratePresentationsWithType:usingBlock:", 3, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __55__SBAlertItemsController__hasPresentationForPresenter___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(result + 32) == a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

- (id)_presentedAlertItemForPresenter:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SBAlertItemsController__presentedAlertItemForPresenter___block_invoke;
  v8[3] = &unk_1E8EA3F78;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SBAlertItemsController _enumeratePresentationsWithType:usingBlock:](self, "_enumeratePresentationsWithType:usingBlock:", 3, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __58__SBAlertItemsController__presentedAlertItemForPresenter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = v7;
  }

}

- (BOOL)_shouldPendAlertItem:(id)a3 outReasonsPended:(id *)a4
{
  void *v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  char v37;
  BOOL v38;
  int v40;
  void *v41;
  void (**v42)(_QWORD, _QWORD);
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__11;
  v59 = __Block_byref_object_dispose__11;
  v60 = 0;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke;
  v54[3] = &unk_1E8EA3F50;
  v54[4] = &v55;
  v54[5] = a4;
  v42 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v54);
  if (-[NSMutableSet count](self->_forceAlertsToPendReasons, "count")
    && (!objc_msgSend(v45, "allowDuringTransitionAnimations")
     || (-[NSMutableSet bs_containsObjectPassingTest:](self->_forceAlertsToPendReasons, "bs_containsObjectPassingTest:", &__block_literal_global_65) & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Forced to pend for reasons: %@"), self->_forceAlertsToPendReasons);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v42)[2](v42, v5);

  }
  v6 = -[NSMutableOrderedSet count](self->_superModalAlertItemPresentations, "count");
  v7 = objc_msgSend(v45, "behavesSuperModally");
  v8 = v7;
  if (v6)
    v9 = v7;
  else
    v9 = 1;
  if ((v9 & 1) == 0)
    ((void (**)(_QWORD, const __CFString *))v42)[2](v42, CFSTR("Restricted because we have a currently visible super modal presentation."));
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isInSetupMode"))
  {
    v11 = objc_msgSend(v45, "allowInSetup");

    if ((v11 & 1) == 0)
      ((void (**)(_QWORD, const __CFString *))v42)[2](v42, CFSTR("Restricted because we're in Setup."));
  }
  else
  {

  }
  objc_msgSend(v45, "allowedBundleIDs");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) == 0 && objc_msgSend(v44, "count"))
  {
    SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "count"))
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v12 = v41;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v51;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v51 != v14)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "application");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "bundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17 && (objc_msgSend(v44, "containsObject:", v17) & 1) != 0)
            {

              v18 = 0;
              goto LABEL_29;
            }

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
          if (v13)
            continue;
          break;
        }
      }
      v18 = 1;
LABEL_29:

    }
    else
    {
      v18 = objc_msgSend(v44, "containsObject:", CFSTR("com.apple.springboard")) ^ 1;
    }
    v40 = v18;
    if (!v18)
      goto LABEL_45;
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v20 = v44;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v47;
      while (2)
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v47 != v22)
            objc_enumerationMutation(v20);
          v24 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
          +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "applicationWithBundleIdentifier:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "isApplicationRunningAsViewService:", v26))
          {
            v27 = (void *)MEMORY[0x1E0D01828];
            objc_msgSend(v26, "processState");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "processHandleForPID:bundleID:", objc_msgSend(v28, "pid"), v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "transientOverlayPresentationManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v27) = objc_msgSend(v30, "hasActivePresentationFromProcess:", v29);

            if ((v27 & 1) != 0)
            {

              v40 = 0;
              goto LABEL_43;
            }
          }

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
        if (v21)
          continue;
        break;
      }
    }
    else
    {
      v40 = 1;
    }
LABEL_43:

    if (v40)
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v45, "allowedBundleIDs");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("Restricted to only appear over the following bundle ids: %@"), v41);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v42)[2](v42, v32);

LABEL_45:
    }
  }
  if (objc_msgSend(v45, "pendWhileKeyBagLocked"))
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isAuthenticated");

    if ((v34 & 1) == 0)
      ((void (**)(_QWORD, const __CFString *))v42)[2](v42, CFSTR("Restricted while the keybag is locked."));
  }
  -[SBAlertItemsController _presenterForAlertItem:](self, "_presenterForAlertItem:", v45);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
    ((void (**)(_QWORD, const __CFString *))v42)[2](v42, CFSTR("Restricted because there's no presenter that can handle this alert item at this time."));
  if (objc_msgSend(v45, "_didEverActivate")
    && (objc_msgSend(v35, "canPresentMultipleAlertItemsSimultaneously") & 1) == 0
    && -[SBAlertItemsController _hasPresentationForPresenter:](self, "_hasPresentationForPresenter:", v35))
  {
    ((void (**)(_QWORD, const __CFString *))v42)[2](v42, CFSTR("Restricted because the presenter for this alert item is busy."));
  }
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "isEmergencyCallActive"))
  {
    v37 = objc_msgSend(v45, "shouldShowInEmergencyCall");

    if ((v37 & 1) == 0)
      ((void (**)(_QWORD, const __CFString *))v42)[2](v42, CFSTR("Restricted while in an emergency call."));
  }
  else
  {

  }
  if (objc_msgSend((id)SBApp, "caseIsEnabledAndLatched"))
  {
    objc_msgSend(v45, "playPresentationSound");
    ((void (**)(_QWORD, const __CFString *))v42)[2](v42, CFSTR("Restricted while the smart cover is on."));
  }
  v38 = objc_msgSend((id)v56[5], "count") != 0;

  _Block_object_dispose(&v55, 8);
  return v38;
}

void __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v3;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      **(_QWORD **)(a1 + 40) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v4, "addObject:", v8);
    v3 = v8;
  }

}

uint64_t __64__SBAlertItemsController__shouldPendAlertItem_outReasonsPended___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[SBUIAnimationController isPendingAlertItemsWithReason:](SBUIAnimationController, "isPendingAlertItemsWithReason:", a2) ^ 1;
}

- (id)_presenterForAlertItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;
  char v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  -[SBAlertItemsController lockScreenModalAlertItemPresenter](self, "lockScreenModalAlertItemPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItemsController lockScreenNotificationsAlertItemPresenter](self, "lockScreenNotificationsAlertItemPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItemsController systemApertureAlertItemPresenter](self, "systemApertureAlertItemPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItemsController unlockedAlertItemPresenter](self, "unlockedAlertItemPresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_inUILockedMode
    && objc_msgSend(v4, "shouldShowInLockScreen")
    && !self->_isContinuityDisplaySceneConnected;
  if (!-[SBUserSessionController isLoginSession](self->_userSessionController, "isLoginSession"))
  {
    if (!v9)
      goto LABEL_14;
    goto LABEL_10;
  }
  v10 = objc_msgSend(v4, "allowInLoginWindow");
  if (((v9 | v10) & 1) == 0)
    goto LABEL_14;
  if ((v10 & 1) == 0)
  {
LABEL_10:
    if (!objc_msgSend(v4, "forcesModalAlertAppearance"))
      goto LABEL_12;
  }
  v11 = -[NSMutableSet containsObject:](self->_activePresenters, "containsObject:", v5);
  v12 = v5;
  if ((v11 & 1) != 0)
    goto LABEL_13;
LABEL_12:
  v13 = -[NSMutableSet containsObject:](self->_activePresenters, "containsObject:", v6);
  v12 = v6;
  if (v13)
  {
LABEL_13:
    v14 = v12;
    if (v14)
      goto LABEL_20;
  }
LABEL_14:
  if (!-[NSMutableSet containsObject:](self->_activePresenters, "containsObject:", v7)
    || (objc_msgSend(v4, "_systemApertureElement"), (v15 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v16 = (void *)v15, v14 = v7, v16, !v14))
  {
    if (-[NSMutableSet containsObject:](self->_activePresenters, "containsObject:", v8))
      v14 = v8;
    else
      v14 = 0;
  }
LABEL_20:

  return v14;
}

- (id)_activePresenterForAlertItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  if (objc_msgSend(v4, "behavesSuperModally"))
    v5 = 2;
  else
    v5 = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SBAlertItemsController__activePresenterForAlertItem___block_invoke;
  v9[3] = &unk_1E8EA3F78;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[SBAlertItemsController _enumeratePresentationsWithType:usingBlock:](self, "_enumeratePresentationsWithType:usingBlock:", v5, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__SBAlertItemsController__activePresenterForAlertItem___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a3;
  if (*(_QWORD *)(a1 + 32) == a2)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    v8 = v9;
    *a4 = 1;
  }

}

- (void)_presentAlertItem:(id)a3 withPresenter:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  SBAlertItemPresentation *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  int v17;
  uint64_t v18;
  SBModalAlertPresenter *systemModalAlertPresenter;
  objc_class *v20;
  void *v21;
  BSInvalidatable *v22;
  BSInvalidatable *systemModalAlertVisibleAssertion;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  SBAlertItemPresentation *v38;
  uint64_t v39;

  v5 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsController.m"), 727, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alertItem"));

    if (v11)
      goto LABEL_3;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsController.m"), 728, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_17;
LABEL_3:
  if ((objc_msgSend(v11, "canPresentMultipleAlertItemsSimultaneously") & 1) == 0
    && -[SBAlertItemsController _hasPresentationForPresenter:](self, "_hasPresentationForPresenter:", v11))
  {
    do
    {
      -[SBAlertItemsController _presentedAlertItemForPresenter:](self, "_presentedAlertItemForPresenter:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAlertItemsController _deactivateAlertItem:reason:animated:](self, "_deactivateAlertItem:reason:animated:", v12, 1, 0);

    }
    while (-[SBAlertItemsController _hasPresentationForPresenter:](self, "_hasPresentationForPresenter:", v11));
  }
  v13 = -[SBAlertItemPresentation initWithAlertItem:presenter:]([SBAlertItemPresentation alloc], "initWithAlertItem:presenter:", v9, v11);
  SBLogAlertItems();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = v11;
    v37 = 2114;
    v38 = v13;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Activation - Presenter:%{public}@ will present presentation: %{public}@", buf, 0x16u);
  }

  objc_msgSend(v9, "willActivate");
  v15 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke;
  v33[3] = &unk_1E8EA3FE0;
  v33[4] = self;
  v16 = v9;
  v34 = v16;
  -[SBAlertItemsController _notifyObservers:](self, "_notifyObservers:", v33);
  -[NSMutableOrderedSet removeObject:](self->_superModalAlertItemPresentations, "removeObject:", v13);
  -[NSMutableOrderedSet removeObject:](self->_alertItemPresentations, "removeObject:", v13);
  v17 = objc_msgSend(v16, "behavesSuperModally");
  v18 = 40;
  if (v17)
    v18 = 48;
  objc_msgSend(*(id *)((char *)&self->super.isa + v18), "addObject:", v13);
  if (!self->_systemModalAlertVisibleAssertion
    && -[SBAlertItemsController _hasActivePresentationsThatPresentModally](self, "_hasActivePresentationsThatPresentModally"))
  {
    systemModalAlertPresenter = self->_systemModalAlertPresenter;
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalAlertPresenter acquireVisibleModalAlertAssertionWithDescription:](systemModalAlertPresenter, "acquireVisibleModalAlertAssertionWithDescription:", v21);
    v22 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    systemModalAlertVisibleAssertion = self->_systemModalAlertVisibleAssertion;
    self->_systemModalAlertVisibleAssertion = v22;

  }
  objc_msgSend(v16, "_setPresentationState:", 1);
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke_2;
  v31[3] = &unk_1E8E9DED8;
  v24 = v16;
  v32 = v24;
  objc_msgSend(v11, "presentAlertItem:animated:completion:", v24, v5, v31);
  v29[0] = v15;
  v29[1] = 3221225472;
  v29[2] = __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke_3;
  v29[3] = &unk_1E8EA3FE0;
  v29[4] = self;
  v25 = v24;
  v30 = v25;
  -[SBAlertItemsController _notifyObservers:](self, "_notifyObservers:", v29);
  objc_msgSend(v25, "didActivate");
  SBLogAlertItems();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = v11;
    v37 = 2114;
    v38 = v13;
    _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "Activation - Presenter:%{public}@ did present presentation: %{public}@", buf, 0x16u);
  }

}

uint64_t __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alertItemsController:willActivateAlertItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPresentationState:", 2);
}

uint64_t __67__SBAlertItemsController__presentAlertItem_withPresenter_animated___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alertItemsController:didActivateAlertItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_deactivateAlertItem:(id)a3 reason:(int)a4 animated:(BOOL)a5
{
  -[SBAlertItemsController _deactivateAlertItem:reason:animated:alertDismissCompletion:](self, "_deactivateAlertItem:reason:animated:alertDismissCompletion:", a3, *(_QWORD *)&a4, a5, 0);
}

- (void)_deactivateAlertItem:(id)a3 reason:(int)a4 animated:(BOOL)a5 alertDismissCompletion:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  char v17;
  NSMutableSet *pendedAlertsToReenqueuePostDismissal;
  uint64_t v19;
  id v20;
  void *v21;
  void (**v22)(_QWORD);
  _QWORD v23[4];
  id v24;
  SBAlertItemsController *v25;
  id v26;
  _BYTE *v27;
  SEL v28;
  int v29;
  BOOL v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _BYTE *v34;
  int v35;
  char v36;
  _BYTE buf[24];
  char v38;
  uint64_t v39;

  v8 = *(_QWORD *)&a4;
  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = v12;
  if (v11)
  {
    SBLogAlertItems();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      SBStringFromAlertItemDeactivateReason();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Will deactivate alertItem: %{public}@ for reason: %{public}@", buf, 0x16u);

    }
    v16 = -[SBAlertItemsObjectQueue containsObject:](self->_alertItemsQueue, "containsObject:", v11);
    v17 = v16;
    if (v16)
    {
      -[SBAlertItemsObjectQueue removeObject:](self->_alertItemsQueue, "removeObject:", v11);
      -[SBAlertItemsController _reallyDeactivateAlertItem:forReason:deactivateBlock:](self, "_reallyDeactivateAlertItem:forReason:deactivateBlock:", v11, v8, 0);
    }
    if (-[SBAlertItemsObjectQueue containsObject:](self->_superModalItemsQueue, "containsObject:", v11))
    {
      -[SBAlertItemsObjectQueue removeObject:](self->_superModalItemsQueue, "removeObject:", v11);
      -[SBAlertItemsController _reallyDeactivateAlertItem:forReason:deactivateBlock:](self, "_reallyDeactivateAlertItem:forReason:deactivateBlock:", v11, v8, 0);
      v17 = 1;
    }
    pendedAlertsToReenqueuePostDismissal = self->_pendedAlertsToReenqueuePostDismissal;
    if ((_DWORD)v8 == 1)
      -[NSMutableSet addObject:](pendedAlertsToReenqueuePostDismissal, "addObject:", v11);
    else
      -[NSMutableSet removeObject:](pendedAlertsToReenqueuePostDismissal, "removeObject:", v11);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v38 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke;
    v31[3] = &unk_1E8EA4030;
    v36 = v17;
    v34 = buf;
    v31[4] = self;
    v20 = v11;
    v32 = v20;
    v35 = v8;
    v33 = v13;
    v21 = (void *)MEMORY[0x1D17E5550](v31);
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_100;
    v23[3] = &unk_1E8EA4058;
    v27 = buf;
    v28 = a2;
    v24 = v20;
    v25 = self;
    v29 = v8;
    v30 = a5;
    v22 = v21;
    v26 = v22;
    -[SBAlertItemsController _enumeratePresentationsWithType:usingBlock:](self, "_enumeratePresentationsWithType:usingBlock:", 3, v23);
    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      v22[2](v22);

    _Block_object_dispose(buf, 8);
  }
  else if (v12)
  {
    (*((void (**)(id))v12 + 2))(v12);
  }

}

uint64_t __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id *v4;
  int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t result;
  _QWORD v11[4];
  id v12;
  id v13;
  int v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 68) || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_2;
    v11[3] = &unk_1E8EA4008;
    v2 = *(void **)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    v13 = v2;
    v14 = *(_DWORD *)(a1 + 64);
    objc_msgSend(v12, "_notifyObservers:", v11);
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", *(_QWORD *)(a1 + 40));
    v4 = *(id **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4[4], "removeObject:", *(_QWORD *)(a1 + 40));
      v5 = objc_msgSend(*(id *)(a1 + 40), "behavesSuperModally");
      v6 = *(_QWORD *)(a1 + 32);
      if (v5)
        v7 = *(void **)(v6 + 24);
      else
        v7 = *(void **)(v6 + 16);
      objc_msgSend(v7, "appendObject:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      objc_msgSend(v4, "_processAlertItemQueuesAnimated:", 1);
    }

  }
  SBLogAlertItems();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "_publicDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Deactivated alertItem: %{public}@", buf, 0xCu);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alertItemsController:didDeactivateAlertItem:forReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_100(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a2;
  v6 = a3;
  if (*(id *)(a1 + 32) == v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v7 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("SBAlertItemsController.m"), 852, CFSTR("We must have only one presentation for an alert item (alertItem: %@)."), *(_QWORD *)(a1 + 32));

      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    *(_BYTE *)(v7 + 24) = 1;
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v10 = *(unsigned int *)(a1 + 72);
    v11 = *(unsigned __int8 *)(a1 + 76);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_2_103;
    v13[3] = &unk_1E8E9E8D0;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v8, "_dismissAlertItem:fromPresenter:forReason:animated:completion:", v9, v6, v10, v11, v13);

  }
}

uint64_t __86__SBAlertItemsController__deactivateAlertItem_reason_animated_alertDismissCompletion___block_invoke_2_103(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_hasActivePresentationsThatPresentModally
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = self->_alertItemPresentations;
  v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v6)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v7), "presenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "presentsAlertItemsModally");

      if ((v9 & 1) != 0)
        goto LABEL_18;
      if (v5 == ++v7)
      {
        v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_superModalAlertItemPresentations;
  v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
LABEL_11:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "presenter", (_QWORD)v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "presentsAlertItemsModally");

      if ((v14 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v10) = 1;
  }
LABEL_19:

  return v10;
}

- (void)_dismissAlertItem:(id)a3 fromPresenter:(id)a4 forReason:(int)a5 animated:(BOOL)a6 completion:(id)a7
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v9 = *(_QWORD *)&a5;
  v36 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsController.m"), 879, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alertItem"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsController.m"), 880, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenter"));

LABEL_3:
  -[SBAlertItemsController _presentationForAlertItem:](self, "_presentationForAlertItem:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsController.m"), 883, CFSTR("We must have a presentation for an alert item to dismiss it (alertItem: %@)."), v13);

  }
  SBLogAlertItems();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v33 = v14;
    v34 = 2114;
    v35 = v16;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Deactivation - Presenter:%{public}@ will dismiss presentation: %{public}@.", buf, 0x16u);
  }

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __88__SBAlertItemsController__dismissAlertItem_fromPresenter_forReason_animated_completion___block_invoke;
  v26[3] = &unk_1E8EA4080;
  v26[4] = self;
  v18 = v16;
  v27 = v18;
  v28 = v13;
  v19 = v14;
  v31 = a6;
  v29 = v19;
  v30 = v15;
  v20 = v15;
  v21 = v13;
  -[SBAlertItemsController _reallyDeactivateAlertItem:forReason:deactivateBlock:](self, "_reallyDeactivateAlertItem:forReason:deactivateBlock:", v21, v9, v26);
  SBLogAlertItems();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v33 = v19;
    v34 = 2114;
    v35 = v18;
    _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "Deactivation - Presenter:%{public}@ did dismiss presentation: %{public}@.", buf, 0x16u);
  }

}

void __88__SBAlertItemsController__dismissAlertItem_fromPresenter_forReason_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_setPresentationState:", 3);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v4 = *(unsigned __int8 *)(a1 + 72);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__SBAlertItemsController__dismissAlertItem_fromPresenter_forReason_animated_completion___block_invoke_2;
  v7[3] = &unk_1E8E9F7B8;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v3, "dismissAlertItem:animated:completion:", v5, v4, v7);

}

uint64_t __88__SBAlertItemsController__dismissAlertItem_fromPresenter_forReason_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setPresentationState:", 4);
  if ((objc_msgSend(*(id *)(a1 + 40), "_hasActivePresentationsThatPresentModally") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "invalidate");
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 104);
    *(_QWORD *)(v2 + 104) = 0;

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_reallyDeactivateAlertItem:(id)a3 forReason:(int)a4 deactivateBlock:(id)a5
{
  uint64_t v5;
  id v7;
  void (**v8)(void);

  v5 = *(_QWORD *)&a4;
  v8 = (void (**)(void))a5;
  v7 = a3;
  objc_msgSend(v7, "willDeactivateForReason:", v5);
  if (v8)
    v8[2]();
  objc_msgSend(v7, "didDeactivateForReason:", v5);
  objc_msgSend(v7, "_deactivationCompleted");

}

- (id)_presentationForAlertItem:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  id v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_superModalAlertItemPresentations, self->_alertItemPresentations, 0);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v16, "alertItem");
              v17 = (id)objc_claimAutoreleasedReturnValue();

              if (v17 == v4)
              {
                v18 = v16;

                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v13)
              continue;
            break;
          }
        }

        v8 = v20;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v18 = 0;
    }
    while (v7);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (BOOL)_hasVisibleModalAlertOfType:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SBAlertItemsController__hasVisibleModalAlertOfType___block_invoke;
  v5[3] = &unk_1E8EA40A8;
  v5[4] = &v6;
  -[SBAlertItemsController _enumeratePresentationsWithType:usingBlock:](self, "_enumeratePresentationsWithType:usingBlock:", a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__SBAlertItemsController__hasVisibleModalAlertOfType___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "presentsAlertItemsModally");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_hasVisibleModalAlertOfType:(unint64_t)a3 forWindowScene:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SBAlertItemsController__hasVisibleModalAlertOfType_forWindowScene___block_invoke;
  v9[3] = &unk_1E8EA3F78;
  v7 = v6;
  v10 = v7;
  v11 = &v12;
  -[SBAlertItemsController _enumeratePresentationsWithType:usingBlock:](self, "_enumeratePresentationsWithType:usingBlock:", a3, v9);
  LOBYTE(a3) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return a3;
}

void __69__SBAlertItemsController__hasVisibleModalAlertOfType_forWindowScene___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(a3, "presentsAlertItemsModally"))
  {
    objc_msgSend(v10, "alertController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sbWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

- (BOOL)deactivateAlertItemsOfClass:(Class)a3
{
  return -[SBAlertItemsController deactivateAlertItemsOfClass:reason:](self, "deactivateAlertItemsOfClass:reason:", a3, 5);
}

- (BOOL)deactivateAlertItemsOfClass:(Class)a3 reason:(int)a4
{
  return -[SBAlertItemsController deactivateAlertItemsOfClass:reason:animated:](self, "deactivateAlertItemsOfClass:reason:animated:", a3, *(_QWORD *)&a4, 1);
}

- (BOOL)deactivateAlertItemsOfClass:(Class)a3 reason:(int)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  -[SBAlertItemsController alertItemsOfClass:](self, "alertItemsOfClass:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[SBAlertItemsController deactivateAlertItem:reason:animated:](self, "deactivateAlertItem:reason:animated:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v6, v5);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  v13 = objc_msgSend(v8, "count") != 0;

  return v13;
}

void __44__SBAlertItemsController_alertItemsOfClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (BOOL)hasAlertOfClass:(Class)a3
{
  BOOL v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v12 = -[SBAlertItemsObjectQueue hasObjectOfClass:](self->_superModalItemsQueue, "hasObjectOfClass:");
  if (*((_BYTE *)v10 + 24)
    || (v5 = -[SBAlertItemsObjectQueue hasObjectOfClass:](self->_alertItemsQueue, "hasObjectOfClass:", a3),
        (*((_BYTE *)v10 + 24) = v5) != 0))
  {
    v6 = 1;
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__SBAlertItemsController_hasAlertOfClass___block_invoke;
    v8[3] = &unk_1E8EA40F8;
    v8[4] = &v9;
    v8[5] = a3;
    -[SBAlertItemsController _enumeratePresentationsWithType:usingBlock:](self, "_enumeratePresentationsWithType:usingBlock:", 3, v8);
    v6 = *((_BYTE *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __42__SBAlertItemsController_hasAlertOfClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)hasAlerts
{
  BOOL v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  BOOL result;
  BOOL v8;

  v3 = -[SBAlertItemsObjectQueue hasObject](self->_alertItemsQueue, "hasObject");
  v4 = -[SBAlertItemsObjectQueue hasObject](self->_superModalItemsQueue, "hasObject");
  v5 = -[NSMutableOrderedSet count](self->_alertItemPresentations, "count");
  v6 = -[NSMutableOrderedSet count](self->_superModalAlertItemPresentations, "count");
  result = 1;
  if (!v3)
  {
    v8 = (v5 | v6) != 0;
    return v4 || v8;
  }
  return result;
}

- (BOOL)hasLockScreenModalAlert
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SBAlertItemsController_hasLockScreenModalAlert__block_invoke;
  v4[3] = &unk_1E8EA3F78;
  v4[4] = self;
  v4[5] = &v5;
  -[SBAlertItemsController _enumeratePresentationsWithType:usingBlock:](self, "_enumeratePresentationsWithType:usingBlock:", 3, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __49__SBAlertItemsController_hasLockScreenModalAlert__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  id v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "lockScreenModalAlertItemPresenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)hasVisibleAlert
{
  return -[NSMutableOrderedSet count](self->_alertItemPresentations, "count")
      || -[SBAlertItemsController hasVisibleSuperModalAlert](self, "hasVisibleSuperModalAlert");
}

- (BOOL)hasVisibleAlertForWindowScene:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[NSMutableOrderedSet count](self->_alertItemPresentations, "count"))
    v5 = 1;
  else
    v5 = -[SBAlertItemsController _hasVisibleModalAlertOfType:forWindowScene:](self, "_hasVisibleModalAlertOfType:forWindowScene:", 2, v4);

  return v5;
}

- (BOOL)hasVisibleModalAlert
{
  return -[SBAlertItemsController _hasVisibleModalAlertOfType:](self, "_hasVisibleModalAlertOfType:", 3);
}

- (BOOL)hasVisibleSuperModalAlert
{
  return -[SBAlertItemsController _hasVisibleModalAlertOfType:](self, "_hasVisibleModalAlertOfType:", 2);
}

- (id)visibleAlertItem
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[SBAlertItemsController hasVisibleSuperModalAlert](self, "hasVisibleSuperModalAlert"))
  {
    v3 = 48;
  }
  else
  {
    if (!-[SBAlertItemsController hasVisibleAlert](self, "hasVisibleAlert"))
    {
      v5 = 0;
      return v5;
    }
    v3 = 40;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canDeactivateAlertForMenuClickOrSystemGesture
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBAlertItemsController visibleAlertItem](self, "visibleAlertItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = !v2 || objc_msgSend(v2, "allowMenuButtonDismissal");

  return v4;
}

- (BOOL)deactivateAlertForMenuClickOrSystemGestureWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  -[SBAlertItemsController visibleAlertItem](self, "visibleAlertItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "allowMenuButtonDismissal"))
  {
    -[SBAlertItemsController deactivateAlertItem:reason:animated:](self, "deactivateAlertItem:reason:animated:", v6, 2, v3);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;
  char v5;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke_2;
  v2[3] = &unk_1E8EA4120;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 48);
  v4 = v1;
  objc_msgSend(v3, "_enumeratePresentationsWithType:usingBlock:", 3, v2);

}

void __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "unlockedAlertItemPresenter");
  v7 = objc_claimAutoreleasedReturnValue();
  if ((id)v7 == v6)
  {

    goto LABEL_5;
  }
  v8 = (void *)v7;
  objc_msgSend(*(id *)(a1 + 32), "systemApertureAlertItemPresenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
LABEL_5:
    v10 = *(unsigned __int8 *)(a1 + 48);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke_3;
    v12[3] = &unk_1E8E9DED8;
    v11 = *(void **)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v11, "_deactivateAlertItem:reason:animated:alertDismissCompletion:", v5, 1, v10, v12);

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "signal");
LABEL_6:

}

uint64_t __84__SBAlertItemsController_moveActiveUnlockedAlertsToPendingWithAnimation_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (void)_buddyDidExit
{
  if (!-[NSMutableSet count](self->_forceAlertsToPendReasons, "count"))
    -[SBAlertItemsController activatePendedAlertsIfNecessary](self, "activatePendedAlertsIfNecessary");
}

- (void)_activeCallStateDidChange:(id)a3
{
  void *v4;
  char v5;

  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "inCall");

  if ((v5 & 1) == 0)
    -[SBAlertItemsController _processAlertItemQueuesAnimated:](self, "_processAlertItemQueuesAnimated:", 1);
}

- (void)_silencingHardwareButtonPressed:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__SBAlertItemsController__silencingHardwareButtonPressed___block_invoke;
  v3[3] = &unk_1E8EA3F28;
  v3[4] = self;
  -[SBAlertItemsController _enumeratePresentationsWithType:usingBlock:](self, "_enumeratePresentationsWithType:usingBlock:", 3, v3);
}

void __58__SBAlertItemsController__silencingHardwareButtonPressed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "lockScreenModalAlertItemPresenter");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((id)v6 == v5)
  {

LABEL_5:
    objc_msgSend(v9, "_noteSilencingHardwareButtonPressed");
    goto LABEL_6;
  }
  v7 = (void *)v6;
  objc_msgSend(*(id *)(a1 + 32), "lockScreenNotificationsAlertItemPresenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v5)
    goto LABEL_5;
LABEL_6:

}

- (void)_notifyObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)captureSuppressionAssertion:(id)a3 reason:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSMapTable *suppressionAssertionReasons;
  NSMapTable *v12;
  NSMapTable *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  SBAlertItemsController *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3978];
  v9 = a3;
  if ((objc_msgSend(v8, "isMainThread") & 1) != 0)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBAlertItemsController captureSuppressionAssertion:reason:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("SBAlertItemsController.m"), 1190, CFSTR("this call must be made on the main thread"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAlertItemsController.m"), 1191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sendRight"));

LABEL_3:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01810]), "initWithSendRight:", v9);

  suppressionAssertionReasons = self->_suppressionAssertionReasons;
  if (suppressionAssertionReasons)
  {
    if (v7)
    {
LABEL_5:
      -[NSMapTable setObject:forKey:](suppressionAssertionReasons, "setObject:forKey:", v7, v10);
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v13 = self->_suppressionAssertionReasons;
    self->_suppressionAssertionReasons = v12;

    suppressionAssertionReasons = self->_suppressionAssertionReasons;
    if (v7)
      goto LABEL_5;
  }
  objc_msgSend(v10, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](suppressionAssertionReasons, "setObject:forKey:", v14, v10);

LABEL_8:
  SBLogAlertItems();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Adding alertItemsSuppression assertion : %{public}@", buf, 0xCu);
  }

  -[SBAlertItemsController setForceAlertsToPend:forReason:](self, "setForceAlertsToPend:forReason:", 1, CFSTR("suppressionAssertions"));
  -[SBAlertItemsController moveActiveUnlockedAlertsToPendingWithAnimation:completion:](self, "moveActiveUnlockedAlertsToPendingWithAnimation:completion:", 1, 0);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__SBAlertItemsController_captureSuppressionAssertion_reason___block_invoke;
  v21[3] = &unk_1E8E9E270;
  v22 = v7;
  v23 = self;
  v24 = v10;
  v16 = v10;
  v17 = v7;
  objc_msgSend(v16, "activateWithHandler:", v21);

}

void __61__SBAlertItemsController_captureSuppressionAssertion_reason___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 48);
  BSDispatchMain();

}

uint64_t __61__SBAlertItemsController_captureSuppressionAssertion_reason___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogAlertItems();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Removing alertItemsSuppression assertion : %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "count");
  if (!result)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = 0;

    return objc_msgSend(*(id *)(a1 + 40), "setForceAlertsToPend:forReason:", 0, CFSTR("suppressionAssertions"));
  }
  return result;
}

- (SBModalAlertPresenter)_systemModalAlertPresenter
{
  return self->_systemModalAlertPresenter;
}

- (void)_setSystemModalAlertPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_systemModalAlertPresenter, a3);
}

- (SBWindowSceneManager)windowSceneManager
{
  return (SBWindowSceneManager *)objc_loadWeakRetained((id *)&self->_windowSceneManager);
}

- (void)setWindowSceneManager:(id)a3
{
  objc_storeWeak((id *)&self->_windowSceneManager, a3);
}

- (SBAlertItemPresenter)lockScreenModalAlertItemPresenter
{
  return self->_lockScreenModalAlertItemPresenter;
}

- (SBAlertItemPresenter)lockScreenNotificationsAlertItemPresenter
{
  return self->_lockScreenNotificationsAlertItemPresenter;
}

- (SBAlertItemPresenter)systemApertureAlertItemPresenter
{
  return self->_systemApertureAlertItemPresenter;
}

- (SBAlertItemPresenter)unlockedAlertItemPresenter
{
  return self->_unlockedAlertItemPresenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockedAlertItemPresenter, 0);
  objc_storeStrong((id *)&self->_systemApertureAlertItemPresenter, 0);
  objc_storeStrong((id *)&self->_lockScreenNotificationsAlertItemPresenter, 0);
  objc_storeStrong((id *)&self->_lockScreenModalAlertItemPresenter, 0);
  objc_destroyWeak((id *)&self->_windowSceneManager);
  objc_storeStrong((id *)&self->_systemModalAlertPresenter, 0);
  objc_storeStrong((id *)&self->_systemModalAlertVisibleAssertion, 0);
  objc_storeStrong((id *)&self->_stateCaptureBlock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_suppressionAssertionReasons, 0);
  objc_storeStrong((id *)&self->_forceAlertsToPendReasons, 0);
  objc_storeStrong((id *)&self->_activePresenters, 0);
  objc_storeStrong((id *)&self->_superModalAlertItemPresentations, 0);
  objc_storeStrong((id *)&self->_alertItemPresentations, 0);
  objc_storeStrong((id *)&self->_pendedAlertsToReenqueuePostDismissal, 0);
  objc_storeStrong((id *)&self->_superModalItemsQueue, 0);
  objc_storeStrong((id *)&self->_alertItemsQueue, 0);
  objc_storeStrong((id *)&self->_userSessionController, 0);
}

- (void)setForceAlertsToPend:(uint64_t)a3 forReason:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a2, a3, "Adding pend alert items reason: %@", a5, a6, a7, a8, 2u);
}

- (void)setForceAlertsToPend:(uint64_t)a3 forReason:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a2, a3, "Removing pend alert items reason: %@", a5, a6, a7, a8, 2u);
}

@end
