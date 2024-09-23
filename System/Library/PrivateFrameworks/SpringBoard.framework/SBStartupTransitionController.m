@implementation SBStartupTransitionController

- (SBStartupTransitionController)initWithInitialRestartState:(id)a3
{
  id v5;
  SBStartupTransitionController *v6;
  NSObject *v7;
  SBStartupTransitionFactory *v8;
  SBStartupTransitionFactory *transitionFactory;
  SBStartupTransitionContextPersistence *v10;
  void *v11;
  uint64_t v12;
  SBStartupTransitionContextPersistence *transitionContextPersistence;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBStartupTransitionController;
  v6 = -[SBStartupTransitionController init](&v15, sel_init);
  if (v6)
  {
    SBLogWorkspace();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Startup transition controller initialized with initial state: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_initialRestartState, a3);
    v8 = -[SBStartupTransitionFactory initWithInitialRestartState:]([SBStartupTransitionFactory alloc], "initWithInitialRestartState:", v6->_initialRestartState);
    transitionFactory = v6->_transitionFactory;
    v6->_transitionFactory = v8;

    v10 = [SBStartupTransitionContextPersistence alloc];
    -[SBInitialRestartState bootDefaults](v6->_initialRestartState, "bootDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBStartupTransitionContextPersistence initWithBootDefaults:loginSession:](v10, "initWithBootDefaults:loginSession:", v11, -[SBInitialRestartState isLoginSession](v6->_initialRestartState, "isLoginSession"));
    transitionContextPersistence = v6->_transitionContextPersistence;
    v6->_transitionContextPersistence = (SBStartupTransitionContextPersistence *)v12;

  }
  return v6;
}

- (void)initializeAndRunStartupTransition:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  SBStartupTransition *v8;
  SBStartupTransition *transition;
  SBStartupTransition *v10;
  NSSet *v11;
  NSSet *renderOverlayDismissActions;
  id v13;
  NSSet *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  NSSet *v26;
  NSSet *v27;
  NSObject *v28;
  void *v29;
  SBStartupTransition *v30;
  void *v31;
  void *v32;
  void (**v33)(id, BSTransactionBlockObserver *, SBStartupTransition *);
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  id v44;
  id location;
  unint64_t v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  SBStartupTransition *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v33 = (void (**)(id, BSTransactionBlockObserver *, SBStartupTransition *))a3;
  kdebug_trace();
  BSDispatchQueueAssertMain();
  if (self->_ranOnce)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionController.m"), 60, CFSTR("We've already run once, and can't run the startup transition again."));

  }
  self->_ranOnce = 1;
  -[SBStartupTransitionContextPersistence readTransitionContext](self->_transitionContextPersistence, "readTransitionContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v34;
  if (objc_msgSend(v34, "hasUserSwitchOverlayMismatch"))
  {
    objc_msgSend(v34, "overlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissWithAnimation:", v7);

    v5 = v34;
  }
  v46 = 0;
  -[SBStartupTransitionFactory transitionForContext:outDestination:](self->_transitionFactory, "transitionForContext:outDestination:", v5, &v46);
  v8 = (SBStartupTransition *)objc_claimAutoreleasedReturnValue();
  transition = self->_transition;
  self->_transition = v8;

  if (!self->_transition)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionController.m"), 72, CFSTR("A startup transition is required."));

  }
  objc_initWeak(&location, self);
  v10 = self->_transition;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke;
  v43[3] = &unk_1E8EAC900;
  objc_copyWeak(&v44, &location);
  v43[4] = self;
  -[SBStartupTransition registerBlockObserver:](v10, "registerBlockObserver:", v43);
  objc_msgSend(MEMORY[0x1E0D00C80], "dismissActions");
  v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
  renderOverlayDismissActions = self->_renderOverlayDismissActions;
  self->_renderOverlayDismissActions = v11;

  if (-[NSSet count](self->_renderOverlayDismissActions, "count") >= 2)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = self->_renderOverlayDismissActions;
    v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
    if (v15)
    {
      v16 = 0;
      v17 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v19, "overlayDescriptor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isInterstitial");

          if (v21)
            objc_msgSend(v13, "addObject:", v19);
          else
            v16 = 1;
        }
        v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
      }
      while (v15);

      if ((v16 & 1) == 0 || !objc_msgSend(v13, "count"))
        goto LABEL_29;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v22 = v13;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "dismiss");
          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
        }
        while (v23);
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->_renderOverlayDismissActions);
      v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
      -[NSSet minusSet:](v14, "minusSet:", v22);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v14);
      v26 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v27 = self->_renderOverlayDismissActions;
      self->_renderOverlayDismissActions = v26;

    }
LABEL_29:

  }
  if (v33)
    v33[2](v33, self->_transitionObserver, self->_transition);
  SBLogWorkspace();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromStartupTransitionDestination(v46);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = self->_transition;
    *(_DWORD *)buf = 138543874;
    v48 = v29;
    v49 = 2114;
    v50 = v30;
    v51 = 2114;
    v52 = v34;
    _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "Startup transition destination: %{public}@, with transition: %{public}@ (context=%{public}@).", buf, 0x20u);

  }
  -[SBStartupTransition begin](self->_transition, "begin");
  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

}

void __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke_2;
  v13[3] = &unk_1E8EAC8D8;
  v9 = WeakRetained;
  v14 = v9;
  objc_msgSend(v7, "addTransactionDidBeginBlock:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke_3;
  v11[3] = &unk_1E8EAC8D8;
  v12 = v9;
  v10 = v9;
  objc_msgSend(v7, "addTransactionDidCompleteBlock:", v11);

}

uint64_t __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transactionDidBegin:", a2);
}

uint64_t __67__SBStartupTransitionController_initializeAndRunStartupTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transactionDidComplete:", a2);
}

- (void)_saveContextFromTransitionContext:(id)a3
{
  -[SBStartupTransitionContextPersistence saveContext:](self->_transitionContextPersistence, "saveContext:", a3);
}

- (NSString)description
{
  return (NSString *)-[SBStartupTransitionController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBStartupTransitionController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBStartupTransitionController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBStartupTransitionController *v11;

  -[SBStartupTransitionController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__SBStartupTransitionController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

id __71__SBStartupTransitionController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("startupTransition"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("initialResetState"));
}

- (void)transactionDidBegin:(id)a3
{
  SBStartupTransition *v5;
  void *v6;
  void *v7;
  SBStartupTransition *v8;

  v5 = (SBStartupTransition *)a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionController.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transition"));

    v5 = 0;
  }
  if (self->_transition != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionController.m"), 176, CFSTR("Startup transition differs from what we expect."));

  }
  -[SBStartupTransitionContextPersistence saveContext:](self->_transitionContextPersistence, "saveContext:", 0);

}

- (void)transactionDidComplete:(id)a3
{
  SBStartupTransition *v5;
  NSObject *v6;
  SBStartupTransition *transition;
  BSTransactionBlockObserver *transitionObserver;
  void *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[16];

  v5 = (SBStartupTransition *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionController.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transition"));

  }
  if (self->_transition != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionController.m"), 184, CFSTR("Startup transition differs from what we expect."));

  }
  SBLogWorkspace();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Startup transition completed.", buf, 2u);
  }

  transition = self->_transition;
  self->_transition = 0;

  transitionObserver = self->_transitionObserver;
  self->_transitionObserver = 0;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SBStartupTransitionController_transactionDidComplete___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __56__SBStartupTransitionController_transactionDidComplete___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = (void *)*MEMORY[0x1E0CEB258];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__SBStartupTransitionController_transactionDidComplete___block_invoke_2;
  v3[3] = &unk_1E8E9DED8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v1, "_performBlockAfterCATransactionCommits:", v3);
}

uint64_t __56__SBStartupTransitionController_transactionDidComplete___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    v5 = *MEMORY[0x1E0CD3048];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "overlayDescriptor", (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isInterstitial");

        v10 = (void *)MEMORY[0x1E0D016B0];
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "settingsWithDuration:timingFunction:", v11, 0.75);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "dismissWithAnimation:", v12);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 1.0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "dismissWithAnimation:", v11);
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

  return kdebug_trace();
}

- (SBStartupTransition)startupTransition
{
  return self->_transition;
}

- (SBStartupTransitionContextPersistence)_transitionContextPersistence
{
  return self->_transitionContextPersistence;
}

- (void)_setTransitionContextPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContextPersistence, a3);
}

- (SBStartupTransitionFactory)_transitionFactory
{
  return self->_transitionFactory;
}

- (void)_setTransitionFactory:(id)a3
{
  objc_storeStrong((id *)&self->_transitionFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderOverlayDismissActions, 0);
  objc_storeStrong((id *)&self->_transitionObserver, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_transitionFactory, 0);
  objc_storeStrong((id *)&self->_transitionContextPersistence, 0);
  objc_storeStrong((id *)&self->_initialRestartState, 0);
}

@end
