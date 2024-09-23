@implementation SBUIAnimationController

- (void)_addDebugLogCategory:(id)a3
{
  id v4;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBUIAnimationController;
  -[SBUIAnimationController _addDebugLogCategory:](&v14, sel__addDebugLogCategory_, v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_startTransactionDependencies;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_addDebugLogCategory:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)delayCleanupUntilTransactionFinishes:(id)a3
{
  objc_msgSend(a3, "addChildTransaction:withSchedulingPolicy:", self->_cleanupTransaction, 1);
}

- (SBUIAnimationController)initWithTransitionContextProvider:(id)a3
{
  id v5;
  SBUIAnimationController *v6;
  SBViewControllerTransitionContext *v7;
  SBViewControllerTransitionContext *transition;
  uint64_t v9;
  NSMutableArray *coordinatingChildRelationships;
  uint64_t v11;
  NSMutableArray *steppedCoordinatingChildAnimations;
  id v13;
  uint64_t v14;
  uint64_t v15;
  BSBlockTransaction *animationTransaction;
  id v17;
  uint64_t v18;
  BSBlockTransaction *notifyObserversTransaction;
  id v20;
  uint64_t v21;
  BSBlockTransaction *cleanupTransaction;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SBUIAnimationController;
  v6 = -[SBTransaction init](&v31, sel_init);
  if (v6)
  {
    v7 = (SBViewControllerTransitionContext *)objc_alloc_init(MEMORY[0x1E0DAA670]);
    transition = v6->_transition;
    v6->_transition = v7;

    -[SBViewControllerTransitionContext setDelegate:](v6->_transition, "setDelegate:", v6);
    objc_storeStrong((id *)&v6->_transitionContextProvider, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    coordinatingChildRelationships = v6->_coordinatingChildRelationships;
    v6->_coordinatingChildRelationships = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    steppedCoordinatingChildAnimations = v6->_steppedCoordinatingChildAnimations;
    v6->_steppedCoordinatingChildAnimations = (NSMutableArray *)v11;

    objc_initWeak(&location, v6);
    v13 = objc_alloc(MEMORY[0x1E0D016F0]);
    v14 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke;
    v28[3] = &unk_1E8EAE0A0;
    objc_copyWeak(&v29, &location);
    v15 = objc_msgSend(v13, "initWithBlock:", v28);
    animationTransaction = v6->_animationTransaction;
    v6->_animationTransaction = (BSBlockTransaction *)v15;

    -[BSBlockTransaction setDebugName:](v6->_animationTransaction, "setDebugName:", CFSTR("animation"));
    -[SBUIAnimationController addChildTransaction:withSchedulingPolicy:](v6, "addChildTransaction:withSchedulingPolicy:", v6->_animationTransaction, 0);
    v17 = objc_alloc(MEMORY[0x1E0D016F0]);
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke_2;
    v26[3] = &unk_1E8EAE0A0;
    objc_copyWeak(&v27, &location);
    v18 = objc_msgSend(v17, "initWithBlock:", v26);
    notifyObserversTransaction = v6->_notifyObserversTransaction;
    v6->_notifyObserversTransaction = (BSBlockTransaction *)v18;

    -[BSBlockTransaction setDebugName:](v6->_notifyObserversTransaction, "setDebugName:", CFSTR("notify observers"));
    -[BSBlockTransaction addChildTransaction:withSchedulingPolicy:](v6->_animationTransaction, "addChildTransaction:withSchedulingPolicy:", v6->_notifyObserversTransaction, 1);
    v20 = objc_alloc(MEMORY[0x1E0D016F0]);
    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke_3;
    v24[3] = &unk_1E8EAE0A0;
    objc_copyWeak(&v25, &location);
    v21 = objc_msgSend(v20, "initWithBlock:", v24);
    cleanupTransaction = v6->_cleanupTransaction;
    v6->_cleanupTransaction = (BSBlockTransaction *)v21;

    -[BSBlockTransaction setDebugName:](v6->_cleanupTransaction, "setDebugName:", CFSTR("clean up"));
    -[SBUIAnimationController addChildTransaction:withSchedulingPolicy:](v6, "addChildTransaction:withSchedulingPolicy:", v6->_cleanupTransaction, 0);
    -[BSBlockTransaction addChildTransaction:withSchedulingPolicy:](v6->_notifyObserversTransaction, "addChildTransaction:withSchedulingPolicy:", v6->_cleanupTransaction, 1);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIAnimationController;
  -[SBUIAnimationController removeObserver:](&v3, sel_removeObserver_, a3);
}

- (void)stopDelayingCleanupForTransaction:(id)a3
{
  objc_msgSend(a3, "removeChildTransaction:", self->_cleanupTransaction);
}

void __33__SBUIAnimationController__begin__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "animationController:willBeginAnimation:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

void __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  void (**v4)(id, uint64_t);
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "__cleanupAnimation");
  v4[2](v4, 1);

}

- (void)transitionDidFinish:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  BSBlockTransaction *cleanupTransaction;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBUIAnimationController transition](self, "transition");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    if (objc_msgSend(v4, "transitionWasCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __47__SBUIAnimationController_transitionDidFinish___block_invoke;
      v31[3] = &unk_1E8EAE1C0;
      v7 = v6;
      v32 = v7;
      -[SBUIAnimationController _enumerateCoordinatingChildRelationshipsWithBlock:](self, "_enumerateCoordinatingChildRelationshipsWithBlock:", v31);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      obj = v7;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      if (v20)
      {
        v19 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v28 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v21, "coordinatingChildTransaction");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "coordinatingAnimationControllers");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 0u;
            v24 = 0u;
            v25 = 0u;
            v26 = 0u;
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v24;
              do
              {
                for (j = 0; j != v11; ++j)
                {
                  if (*(_QWORD *)v24 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                  objc_msgSend(v14, "notifyObserversTransaction");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "removeChildTransaction:", self->_notifyObserversTransaction);

                  cleanupTransaction = self->_cleanupTransaction;
                  objc_msgSend(v14, "cleanupTransaction");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  -[BSBlockTransaction removeChildTransaction:](cleanupTransaction, "removeChildTransaction:", v17);

                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
              }
              while (v11);
            }
            -[BSBlockTransaction removeChildTransaction:](self->_animationTransaction, "removeChildTransaction:", v22);
            -[NSMutableArray removeObject:](self->_coordinatingChildRelationships, "removeObject:", v21);

          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        }
        while (v20);
      }

    }
    -[SBUIAnimationController __noteAnimationDidTerminate](self, "__noteAnimationDidTerminate");
  }

}

- (void)__noteAnimationDidTerminate
{
  int animationState;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, uint64_t);

  animationState = self->_animationState;
  if ((animationState - 1) >= 2)
  {
    if ((animationState - 3) < 2)
      return;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ or %@)"), CFSTR("waiting"), CFSTR("running"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _SBUIAnimationStateDescription(self->_animationState);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 790, CFSTR(" %s : unexpected animation state : expected=%@ actual=%@"), "-[SBUIAnimationController __noteAnimationDidTerminate]", v6, v7);

  }
  -[SBUIAnimationController animationTransactionCompletion](self, "animationTransactionCompletion");
  v8 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SBUIAnimationController setAnimationTransactionCompletion:](self, "setAnimationTransactionCompletion:", 0);
    v8[2](v8, 1);
  }
  else if ((-[BSBlockTransaction hasStarted](self->_animationTransaction, "hasStarted") & 1) == 0)
  {
    -[SBUIAnimationController failWithReason:](self, "failWithReason:", CFSTR("Animation completed before it started"));
  }

}

void __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void (*v5)(void);
  _QWORD *v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_animationState") != 1)
  {
    v5 = (void (*)(void))v6[2];
LABEL_6:
    v5();
    goto LABEL_7;
  }
  if (!objc_msgSend(WeakRetained, "__animationShouldStart"))
  {
    v5 = (void (*)(void))v6[2];
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "setAnimationTransactionCompletion:", v6);
  objc_msgSend(WeakRetained, "_prepareAnimation");
  objc_msgSend(WeakRetained, "__startAnimation");
LABEL_7:

}

- (void)setAnimationTransactionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (int)_animationState
{
  return self->_animationState;
}

- (BOOL)__animationShouldStart
{
  return self->_animationState == 1;
}

- (id)animationTransactionCompletion
{
  return self->_animationTransactionCompletion;
}

- (void)__cleanupAnimation
{
  int animationState;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  animationState = self->_animationState;
  if ((animationState - 5) <= 0xFFFFFFFD)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ or %@)"), CFSTR("finished"), CFSTR("cleanedUp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _SBUIAnimationStateDescription(self->_animationState);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 815, CFSTR(" %s : unexpected animation state : expected=%@ actual=%@"), "-[SBUIAnimationController __cleanupAnimation]", v12, v13);

    animationState = self->_animationState;
  }
  if (animationState == 3)
  {
    -[SBUIAnimationController transition](self, "transition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isTransitioning");

    if (v5)
      -[SBUIAnimationController _noteAnimationDidFail](self, "_noteAnimationDidFail");
    -[SBUIAnimationController _setHidden:](self, "_setHidden:", 1);
    -[UIView removeFromSuperview](self->_transitionContainer, "removeFromSuperview");
    -[SBAnimationStepper invalidate](self->_stepper, "invalidate");
    -[SBUIAnimationController _cleanupAnimation](self, "_cleanupAnimation");
    -[SBUIAnimationController _cleanupEntityObservers](self, "_cleanupEntityObservers");
    -[SBUIAnimationController __alertItemsController](self, "__alertItemsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIAnimationController _animationIdentifier](self, "_animationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setForceAlertsToPend:forReason:", 0, v7);

    v8 = (void *)objc_opt_class();
    -[SBUIAnimationController _animationIdentifier](self, "_animationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_removeAlertItemsPendingReason:", v9);

    objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawing");
    self->_animationState = 4;
  }
}

- (void)_begin
{
  UIWindow *v3;
  UIWindow *transitionWindow;
  id v5;
  UIView *v6;
  UIView *transitionContainer;
  void *v8;
  UIWindow *v9;
  void *v10;
  UIWindow *v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  NSSet *startTransactionDependencies;
  NSSet *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t n;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  UIWindow *v69;
  id obj;
  id obja;
  NSSet *v72;
  objc_super v73;
  _QWORD v74[5];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[5];
  BOOL v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint8_t v101[128];
  uint8_t buf[4];
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  if (self->_animationState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    _SBUIAnimationStateDescription(self->_animationState);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 458, CFSTR(" %s : unexpected animation state : expected=%@ actual=%@"), "-[SBUIAnimationController _begin]", CFSTR("none"), v66);

  }
  -[SBUIAnimationController _getTransitionWindow](self, "_getTransitionWindow");
  v3 = (UIWindow *)objc_claimAutoreleasedReturnValue();
  transitionWindow = self->_transitionWindow;
  self->_transitionWindow = v3;

  v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[UIWindow bounds](self->_transitionWindow, "bounds");
  v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
  transitionContainer = self->_transitionContainer;
  self->_transitionContainer = v6;

  -[UIView setUserInteractionEnabled:](self->_transitionContainer, "setUserInteractionEnabled:", 0);
  -[UIView setHidden:](self->_transitionContainer, "setHidden:", 1);
  -[UIWindow rootViewController](self->_transitionWindow, "rootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_transitionWindow;
  if (v8)
  {
    -[UIWindow rootViewController](v9, "rootViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (UIWindow *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v9;
  }

  -[UIWindow addSubview:](v11, "addSubview:", self->_transitionContainer);
  v12 = -[SBUIAnimationController _willAnimate](self, "_willAnimate");
  v13 = v12;
  if (v12)
  {
    -[SBUIAnimationController __alertItemsController](self, "__alertItemsController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIAnimationController _animationIdentifier](self, "_animationIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setForceAlertsToPend:forReason:", 1, v15);

    v16 = (void *)objc_opt_class();
    -[SBUIAnimationController _animationIdentifier](self, "_animationIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_addAlertItemsPendingReason:", v17);

  }
  SBLogWorkspace();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    NSStringFromBOOL();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v103 = v19;
    _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "[SBUIAnimationController] begin: willAnimate: %{public}@", buf, 0xCu);

  }
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __33__SBUIAnimationController__begin__block_invoke;
  v95[3] = &unk_1E8EAE198;
  v95[4] = self;
  v96 = v13;
  -[SBUIAnimationController _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v95);
  objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
  v69 = v11;
  if (self->_stepper)
  {
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    -[SBUIAnimationController _viewsForAnimationStepping](self, "_viewsForAnimationStepping");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v92 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
          -[SBAnimationStepper startSteppingAnimationsInView:](self->_stepper, "startSteppingAnimationsInView:", v25);
          if (-[SBUIAnimationController isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
          {
            objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBUIAnimationController _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Stepping animations in view: %@"), v26);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
      }
      while (v22);
    }

  }
  -[SBUIAnimationController _setHidden:](self, "_setHidden:", 0);
  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawing");
  -[SBUIAnimationController _willSetupStartDependencies](self, "_willSetupStartDependencies");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIAnimationController _progressDependencies](self, "_progressDependencies");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    objc_msgSend(v27, "unionSet:", v28);
  -[SBUIAnimationController toApplicationSceneEntities](self, "toApplicationSceneEntities");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
  v67 = v28;
  if (objc_msgSend(v68, "count")
    && -[SBUIAnimationController _waitsForActivatingSceneContentAvailableIfNecessary](self, "_waitsForActivatingSceneContentAvailableIfNecessary"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v72 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    obj = v68;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v88 != v32)
            objc_enumerationMutation(obj);
          v34 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j);
          -[SBUIAnimationController __startTransactionDependencyForEntity:](self, "__startTransactionDependencyForEntity:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            v36 = v27;
            objc_msgSend(v27, "addObject:", v34);
            v85 = 0u;
            v86 = 0u;
            v83 = 0u;
            v84 = 0u;
            -[SBUIAnimationController _debugLogCategories](self, "_debugLogCategories");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
            if (v38)
            {
              v39 = v38;
              v40 = *(_QWORD *)v84;
              do
              {
                for (k = 0; k != v39; ++k)
                {
                  if (*(_QWORD *)v84 != v40)
                    objc_enumerationMutation(v37);
                  objc_msgSend(v35, "_addDebugLogCategory:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k));
                }
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
              }
              while (v39);
            }

            -[NSSet addObject:](v72, "addObject:", v35);
            v27 = v36;
          }

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
      }
      while (v31);
    }

    v29 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
    startTransactionDependencies = self->_startTransactionDependencies;
    self->_startTransactionDependencies = v72;

    v11 = v69;
    v28 = v67;
  }
  objc_storeStrong((id *)&self->_entitiesToObserve, v27);
  if (-[NSSet count](self->_entitiesToObserve, "count")
    && -[SBUIAnimationController __wantsInitialProgressStateChange](self, "__wantsInitialProgressStateChange"))
  {
    v81 = 0u;
    v82 = 0u;
    v80 = 0u;
    v79 = 0u;
    v43 = self->_entitiesToObserve;
    v44 = -[NSSet countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v80;
      do
      {
        for (m = 0; m != v45; ++m)
        {
          if (*(_QWORD *)v80 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * m);
          objc_msgSend(v48, "application");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "processState");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBUIAnimationController _application:processStateDidChange:](self, "_application:processStateDidChange:", v49, v50);

          objc_msgSend(v48, "sceneHandle");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "sceneIfExists");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v52;
          if (v52)
            v54 = objc_msgSend(v52, "contentState");
          else
            v54 = 0;
          -[SBUIAnimationController _sceneHandle:didUpdateContentState:](self, "_sceneHandle:didUpdateContentState:", v51, v54);

        }
        v45 = -[NSSet countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v79, v98, 16);
      }
      while (v45);
    }

    v11 = v69;
    v28 = v67;
    v29 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
  }
  -[SBUIAnimationController _willBeginWaitingForStartDependencies](self, "_willBeginWaitingForStartDependencies");
  -[SBUIAnimationController _setAnimationState:](self, "_setAnimationState:", 1);
  v55 = v29[420];
  if (objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v55), "count"))
  {
    obja = v27;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v56 = *(id *)((char *)&self->super.super.super.isa + v55);
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v76;
      do
      {
        for (n = 0; n != v58; ++n)
        {
          if (*(_QWORD *)v76 != v59)
            objc_enumerationMutation(v56);
          v61 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * n);
          SBLogWorkspace();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v61, "_descriptionProem");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v103 = v63;
            _os_log_impl(&dword_1D0540000, v62, OS_LOG_TYPE_INFO, "Monitoring animation start dependency: %{public}@", buf, 0xCu);

          }
          objc_msgSend(v61, "addChildTransaction:withSchedulingPolicy:", self->_animationTransaction, 1);
          -[SBUIAnimationController addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v61, 0);
        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v75, v97, 16);
      }
      while (v58);
    }

    v11 = v69;
    v27 = obja;
    v28 = v67;
  }
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __33__SBUIAnimationController__begin__block_invoke_83;
  v74[3] = &unk_1E8EAE1C0;
  v74[4] = self;
  -[SBUIAnimationController _enumerateCoordinatingChildRelationshipsWithBlock:](self, "_enumerateCoordinatingChildRelationshipsWithBlock:", v74);
  -[SBUIAnimationController _registerEntityObserversIfNecessary](self, "_registerEntityObserversIfNecessary");
  v73.receiver = self;
  v73.super_class = (Class)SBUIAnimationController;
  -[SBUIAnimationController _begin](&v73, sel__begin);

}

- (id)_animationIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_setHidden:(BOOL)a3
{
  -[UIView setHidden:](self->_transitionContainer, "setHidden:", a3);
}

- (id)__alertItemsController
{
  return +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
}

+ (void)_addAlertItemsPendingReason:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v3 = _addAlertItemsPendingReason__onceToken;
  v4 = a3;
  v6 = v4;
  if (v3 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&_addAlertItemsPendingReason__onceToken, &__block_literal_global_67);
    v5 = v6;
  }
  objc_msgSend((id)__animationControllerPendingAlertItemsReasons, "addObject:", v5);

}

- (NSSet)toApplicationSceneEntities
{
  return (NSSet *)-[SBUIAnimationControllerTransitionContextProvider toApplicationSceneEntities](self->_transitionContextProvider, "toApplicationSceneEntities");
}

- (BOOL)_willAnimate
{
  BOOL v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v9 = !-[SBUIAnimationController _isNullAnimation](self, "_isNullAnimation");
  if (*((_BYTE *)v7 + 24))
  {
    v3 = 1;
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__SBUIAnimationController__willAnimate__block_invoke;
    v5[3] = &unk_1E8E9E040;
    v5[4] = &v6;
    -[SBUIAnimationController _enumerateCoordinatingAnimationsWithBlock:](self, "_enumerateCoordinatingAnimationsWithBlock:", v5);
    v3 = *((_BYTE *)v7 + 24) != 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_registerEntityObserversIfNecessary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSSet *sceneHandlesBeingObserved;
  NSSet *obj;
  NSSet *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSSet count](self->_entitiesToObserve, "count") && self->_animationState != 3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = self->_entitiesToObserve;
    v3 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v16;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v16 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "application");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__processStateDidChange_, CFSTR("SBApplicationProcessStateDidChange"), v9);

          objc_msgSend(v7, "sceneHandle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            objc_msgSend(v10, "addObserver:", self);
            -[NSSet addObject:](v14, "addObject:", v11);
          }

          ++v6;
        }
        while (v4 != v6);
        v4 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v4);
    }

    sceneHandlesBeingObserved = self->_sceneHandlesBeingObserved;
    self->_sceneHandlesBeingObserved = v14;

  }
}

- (id)_progressDependencies
{
  return 0;
}

- (BOOL)_isNullAnimation
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (id)_getTransitionWindow
{
  return 0;
}

- (void)_enumerateCoordinatingChildRelationshipsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  if (v4)
  {
    v14 = 0;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_coordinatingChildRelationships;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
        if (v14)
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void)__startAnimation
{
  void *v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_animationState != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _SBUIAnimationStateDescription(self->_animationState);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 358, CFSTR(" %s : unexpected animation state : expected=%@ actual=%@"), "-[SBUIAnimationController __startAnimation]", CFSTR("waiting"), v6);

  }
  -[SBUIAnimationController _setAnimationState:](self, "_setAnimationState:", 2);
  -[SBUIAnimationController transition](self, "transition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUIAnimationController _transitionAnimator](self, "_transitionAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnimator:", v3);

  if (-[SBUIAnimationController isStepped](self, "isStepped"))
    objc_msgSend(v7, "setInteractor:", self);
  objc_msgSend(v7, "startTransition");

}

- (SBViewControllerTransitionContext)transition
{
  return self->_transition;
}

- (void)_setAnimationState:(int)a3
{
  self->_animationState = a3;
}

- (BOOL)isStepped
{
  return self->_stepper != 0;
}

- (id)_transitionAnimator
{
  SBUIAnimationControllerSteppedAnimator *v2;

  if (self->_stepper)
    v2 = -[SBUIAnimationControllerSteppedAnimator initWithAnimationController:stepper:]([SBUIAnimationControllerSteppedAnimator alloc], "initWithAnimationController:stepper:", self, self->_stepper);
  else
    v2 = -[SBUIAnimationControllerAnimator initWithAnimationController:]([SBUIAnimationControllerAnimator alloc], "initWithAnimationController:", self);
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[16];

  if ((self->_animationState & 0xFFFFFFFB) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ or %@)"), CFSTR("none"), CFSTR("cleanedUp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _SBUIAnimationStateDescription(self->_animationState);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 179, CFSTR(" %s : unexpected animation state : expected=%@ actual=%@"), "-[SBUIAnimationController dealloc]", v6, v7);

  }
  SBLogWorkspace();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBUIAnimationController] dealloc", buf, 2u);
  }

  -[SBUIAnimationController _cleanupEntityObservers](self, "_cleanupEntityObservers");
  -[UIView removeFromSuperview](self->_transitionContainer, "removeFromSuperview");
  v8.receiver = self;
  v8.super_class = (Class)SBUIAnimationController;
  -[SBUIAnimationController dealloc](&v8, sel_dealloc);
}

- (void)_cleanupEntityObservers
{
  NSSet *v3;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_sceneHandlesBeingObserved;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeObserver:", self, (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("SBApplicationProcessStateDidChange"), 0);

}

- (void)_noteAnimationDidFinish
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  SBLogWorkspace();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBUIAnimationController] noteAnimationDidFinish: Animation succeeded.", v5, 2u);
  }

  -[SBUIAnimationController transition](self, "transition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isTransitioning"))
    objc_msgSend(v4, "completeTransition:", 1);
  else
    -[SBUIAnimationController __noteAnimationDidTerminate](self, "__noteAnimationDidTerminate");

}

+ (void)_removeAlertItemsPendingReason:(id)a3
{
  objc_msgSend((id)__animationControllerPendingAlertItemsReasons, "removeObject:", a3);
}

- (BSTransaction)notifyObserversTransaction
{
  return (BSTransaction *)self->_notifyObserversTransaction;
}

- (id)coordinatingAnimationControllers
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self);
}

- (BSTransaction)cleanupTransaction
{
  return (BSTransaction *)self->_cleanupTransaction;
}

- (BSTransaction)animationTransaction
{
  return (BSTransaction *)self->_animationTransaction;
}

- (BOOL)_waitsForActivatingSceneContentAvailableIfNecessary
{
  return 0;
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIAnimationController;
  -[SBUIAnimationController addObserver:](&v3, sel_addObserver_, a3);
}

- (void)addCoordinatingChildTransaction:(id)a3 withSchedulingPolicy:(unint64_t)a4
{
  void *v7;
  NSMutableArray *coordinatingChildRelationships;
  _SBUIAnimationControllerCoordinatingChildRelationship *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[SBUIAnimationController hasStarted](self, "hasStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 293, CFSTR("Cannot add a coordinating child transaction to an animation controller that's already been started."));

  }
  v7 = v12;
  if (v12)
  {
    if (objc_msgSend(v12, "hasStarted"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 297, CFSTR("Cannot add a coordinating child transaction that's already been started."));

    }
    coordinatingChildRelationships = self->_coordinatingChildRelationships;
    v9 = -[_SBUIAnimationControllerCoordinatingChildRelationship initWithCoordinatingChildTransaction:schedulingPolicy:]([_SBUIAnimationControllerCoordinatingChildRelationship alloc], "initWithCoordinatingChildTransaction:schedulingPolicy:", v12, a4);
    -[NSMutableArray addObject:](coordinatingChildRelationships, "addObject:", v9);

    v7 = v12;
  }

}

- (SBUIAnimationControllerTransitionContextProvider)transitionContextProvider
{
  return self->_transitionContextProvider;
}

- (BOOL)isInteractive
{
  void *v2;
  char v3;

  -[SBUIAnimationController transition](self, "transition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInteractive");

  return v3;
}

void __61__SBUIAnimationController_initWithTransitionContextProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  void (**v4)(id, uint64_t);
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "__reportAnimationCompletion");
  v4[2](v4, 1);

}

- (void)_notifyObserversOfAnimationCompletion
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if ((self->_animationState - 5) <= 0xFFFFFFFD)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ or %@)"), CFSTR("finished"), CFSTR("cleanedUp"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _SBUIAnimationStateDescription(self->_animationState);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 741, CFSTR(" %s : unexpected animation state : expected=%@ actual=%@"), "-[SBUIAnimationController _notifyObserversOfAnimationCompletion]", v5, v6);

  }
  if (!self->_didNotifyObserversOfCompletion)
  {
    self->_didNotifyObserversOfCompletion = 1;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__SBUIAnimationController__notifyObserversOfAnimationCompletion__block_invoke;
    v7[3] = &unk_1E8E9E090;
    v7[4] = self;
    -[SBUIAnimationController _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v7);
  }
}

- (void)__reportAnimationCompletion
{
  void *v4;
  void *v5;

  if (self->_animationState != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _SBUIAnimationStateDescription(self->_animationState);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 805, CFSTR(" %s : unexpected animation state : expected=%@ actual=%@"), "-[SBUIAnimationController __reportAnimationCompletion]", CFSTR("running"), v5);

  }
  self->_animationState = 3;
  -[SBUIAnimationController _notifyObserversOfAnimationCompletion](self, "_notifyObserversOfAnimationCompletion");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationTransactionCompletion, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_transitionContainer, 0);
  objc_storeStrong((id *)&self->_transitionWindow, 0);
  objc_storeStrong((id *)&self->_stepper, 0);
  objc_storeStrong((id *)&self->_steppedCoordinatingChildAnimations, 0);
  objc_storeStrong((id *)&self->_coordinatingChildRelationships, 0);
  objc_storeStrong((id *)&self->_startTransactionDependencies, 0);
  objc_storeStrong((id *)&self->_entitiesToObserve, 0);
  objc_storeStrong((id *)&self->_sceneHandlesBeingObserved, 0);
  objc_storeStrong((id *)&self->_cleanupTransaction, 0);
  objc_storeStrong((id *)&self->_notifyObserversTransaction, 0);
  objc_storeStrong((id *)&self->_animationTransaction, 0);
  objc_storeStrong((id *)&self->_transitionContextProvider, 0);
}

- (void)_willComplete
{
  int animationState;
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUIAnimationController;
  -[SBUIAnimationController _willComplete](&v6, sel__willComplete);
  animationState = self->_animationState;
  if ((animationState - 3) >= 2)
  {
    SBLogWorkspace();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "[SBUIAnimationController] willComplete: Canceling animation", v5, 2u);
    }

    -[SBUIAnimationController __abortAnimation](self, "__abortAnimation");
    -[SBUIAnimationController _notifyObserversOfAnimationCompletion](self, "_notifyObserversOfAnimationCompletion");
    animationState = self->_animationState;
  }
  if (animationState != 4)
    -[SBUIAnimationController __cleanupAnimation](self, "__cleanupAnimation");
}

void __64__SBUIAnimationController__notifyObserversOfAnimationCompletion__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "animationControllerDidFinishAnimation:", *(_QWORD *)(a1 + 32));

}

- (SBUIAnimationController)init
{
  return -[SBUIAnimationController initWithTransitionContextProvider:](self, "initWithTransitionContextProvider:", 0);
}

- (NSSet)fromApplicationSceneEntities
{
  return (NSSet *)-[SBUIAnimationControllerTransitionContextProvider fromApplicationSceneEntities](self->_transitionContextProvider, "fromApplicationSceneEntities");
}

- (SBApplicationSceneEntity)toApplicationSceneEntity
{
  void *v2;
  void *v3;

  -[SBUIAnimationController toApplicationSceneEntities](self, "toApplicationSceneEntities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBApplicationSceneEntity *)v3;
}

- (SBApplicationSceneEntity)fromApplicationSceneEntity
{
  void *v2;
  void *v3;

  -[SBUIAnimationController fromApplicationSceneEntities](self, "fromApplicationSceneEntities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBApplicationSceneEntity *)v3;
}

- (BOOL)animating
{
  return (self->_animationState - 1) < 2;
}

- (BOOL)transitionSupportsCancelling
{
  void *v3;
  char v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[SBUIAnimationController transition](self, "transition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCancelling");

  v11 = v4;
  if (*((_BYTE *)v9 + 24))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__SBUIAnimationController_transitionSupportsCancelling__block_invoke;
    v7[3] = &unk_1E8E9E040;
    v7[4] = &v8;
    -[SBUIAnimationController _enumerateCoordinatingAnimationsWithSchedulingPolicy:block:](self, "_enumerateCoordinatingAnimationsWithSchedulingPolicy:block:", 0, v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __55__SBUIAnimationController_transitionSupportsCancelling__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v6;
  char v7;

  result = objc_msgSend(a2, "transitionSupportsCancelling");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v6 + 24))
    v7 = result;
  else
    v7 = 0;
  *(_BYTE *)(v6 + 24) = v7;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a3 = 1;
  return result;
}

- (BOOL)transitionSupportsRestarting
{
  void *v3;
  char v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[SBUIAnimationController transition](self, "transition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsRestarting");

  v11 = v4;
  if (*((_BYTE *)v9 + 24))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__SBUIAnimationController_transitionSupportsRestarting__block_invoke;
    v7[3] = &unk_1E8E9E040;
    v7[4] = &v8;
    -[SBUIAnimationController _enumerateCoordinatingAnimationsWithSchedulingPolicy:block:](self, "_enumerateCoordinatingAnimationsWithSchedulingPolicy:block:", 0, v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __55__SBUIAnimationController_transitionSupportsRestarting__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v6;
  char v7;

  result = objc_msgSend(a2, "transitionSupportsRestarting");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v6 + 24))
    v7 = result;
  else
    v7 = 0;
  *(_BYTE *)(v6 + 24) = v7;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a3 = 1;
  return result;
}

- (void)cancelTransition
{
  void *v3;

  -[SBUIAnimationController transition](self, "transition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelTransition");

  -[SBUIAnimationController _enumerateCoordinatingAnimationsWithSchedulingPolicy:block:](self, "_enumerateCoordinatingAnimationsWithSchedulingPolicy:block:", 0, &__block_literal_global_153);
}

uint64_t __43__SBUIAnimationController_cancelTransition__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelTransition");
}

- (void)restartTransition
{
  void *v3;

  -[SBUIAnimationController transition](self, "transition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restartTransition");

  -[SBUIAnimationController _enumerateCoordinatingAnimationsWithSchedulingPolicy:block:](self, "_enumerateCoordinatingAnimationsWithSchedulingPolicy:block:", 0, &__block_literal_global_52);
}

uint64_t __44__SBUIAnimationController_restartTransition__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "restartTransition");
}

- (BOOL)transitionWasCancelled
{
  void *v2;
  char v3;

  -[SBUIAnimationController transition](self, "transition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionWasCancelled");

  return v3;
}

- (BOOL)transitionWasRestarted
{
  void *v2;
  char v3;

  -[SBUIAnimationController transition](self, "transition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionWasRestarted");

  return v3;
}

- (BSAnimationSettings)animationSettings
{
  return 0;
}

- (void)addSteppedCoordinatingChildAnimation:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[SBUIAnimationController isStepped](self, "isStepped"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 304, CFSTR("Cannot add a stepped coordinating child if the parent has stepping disabled."));

  }
  if ((objc_msgSend(v7, "isStepped") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationController.m"), 305, CFSTR("Cannot add a stepped coordinating child if the child has stepping disabled."));

  }
  -[SBUIAnimationController addCoordinatingChildTransaction:withSchedulingPolicy:](self, "addCoordinatingChildTransaction:withSchedulingPolicy:", v7, 0);
  -[NSMutableArray addObject:](self->_steppedCoordinatingChildAnimations, "addObject:", v7);

}

- (void)delayAnimationUntilTransactionFinishes:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = v4;
    v6 = objc_msgSend(v4, "hasStarted");
    v5 = v8;
    if ((v6 & 1) == 0)
    {
      v7 = -[BSBlockTransaction hasStarted](self->_animationTransaction, "hasStarted");
      v5 = v8;
      if ((v7 & 1) == 0)
      {
        objc_msgSend(v8, "addChildTransaction:withSchedulingPolicy:", self->_animationTransaction, 1);
        v5 = v8;
      }
    }
  }

}

- (void)stopDelayingAnimationForTransaction:(id)a3
{
  if (a3)
    objc_msgSend(a3, "removeChildTransaction:", self->_animationTransaction);
}

+ (BOOL)isPendingAlertItemsWithReason:(id)a3
{
  return objc_msgSend((id)__animationControllerPendingAlertItemsReasons, "containsObject:", a3);
}

void __55__SBUIAnimationController__addAlertItemsPendingReason___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)__animationControllerPendingAlertItemsReasons;
  __animationControllerPendingAlertItemsReasons = (uint64_t)v0;

}

- (void)__abortAnimation
{
  -[SBUIAnimationController _setAnimationState:](self, "_setAnimationState:", 3);
  -[SBUIAnimationController _abortAnimation](self, "_abortAnimation");
}

- (BOOL)waitingToStart
{
  return -[BSBlockTransaction hasStarted](self->_animationTransaction, "hasStarted") ^ 1;
}

- (BOOL)isFinishedAnimating
{
  return self->_animationState > 2u;
}

- (BOOL)isReasonableMomentToInterrupt
{
  return 0;
}

- (BOOL)shouldResignActiveForAnimation
{
  return 1;
}

- (void)enableSteppingWithAnimationSettings:(id)a3
{
  id v4;
  SBAnimationStepper *v5;
  SBAnimationStepper *stepper;

  if (!self->_stepper)
  {
    v4 = a3;
    v5 = -[SBAnimationStepper initWithAnimationSettings:]([SBAnimationStepper alloc], "initWithAnimationSettings:", v4);

    stepper = self->_stepper;
    self->_stepper = v5;

  }
}

- (void)_enumerateCoordinatingAnimationsWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SBUIAnimationController__enumerateCoordinatingAnimationsWithBlock___block_invoke;
  v6[3] = &unk_1E8EAE148;
  v7 = v4;
  v5 = v4;
  -[SBUIAnimationController _enumerateCoordinatingChildRelationshipsWithBlock:](self, "_enumerateCoordinatingChildRelationshipsWithBlock:", v6);

}

void __69__SBUIAnimationController__enumerateCoordinatingAnimationsWithBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "coordinatingChildTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinatingAnimationControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v10)
        objc_enumerationMutation(v7);
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
      if (*a3)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_enumerateCoordinatingAnimationsWithSchedulingPolicy:(unint64_t)a3 block:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__SBUIAnimationController__enumerateCoordinatingAnimationsWithSchedulingPolicy_block___block_invoke;
  v8[3] = &unk_1E8EAE170;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[SBUIAnimationController _enumerateCoordinatingChildRelationshipsWithBlock:](self, "_enumerateCoordinatingChildRelationshipsWithBlock:", v8);

}

void __86__SBUIAnimationController__enumerateCoordinatingAnimationsWithSchedulingPolicy_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "schedulingPolicy") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v5, "coordinatingChildTransaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinatingAnimationControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_didInterruptWithReason:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIAnimationController;
  -[SBUIAnimationController _didInterruptWithReason:](&v4, sel__didInterruptWithReason_, a3);
  -[SBUIAnimationController _noteAnimationDidFail](self, "_noteAnimationDidFail");
}

void __33__SBUIAnimationController__begin__block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  int *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  int *v15;
  uint64_t i;
  void *v17;
  void *v18;
  int *v19;
  int *v20;
  int *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "coordinatingChildTransaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinatingAnimationControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v3;
  v6 = objc_msgSend(v3, "schedulingPolicy");
  v7 = *(_QWORD **)(a1 + 32);
  v8 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
  if (v6 == 1)
  {
    v7 = (_QWORD *)v7[20];
    v9 = v4;
    v10 = 1;
  }
  else
  {
    v9 = v4;
    v10 = 0;
  }
  objc_msgSend(v7, "addChildTransaction:withSchedulingPolicy:", v9, v10, v4);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    v14 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
    v15 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
    v28 = a1;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (!v6)
        {
          v18 = *(void **)(*(_QWORD *)(a1 + 32) + v8[413]);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "animationTransaction");
          v19 = v15;
          v20 = v14;
          v21 = v8;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addChildTransaction:withSchedulingPolicy:", v22, 0);

          v8 = v21;
          v14 = v20;
          v15 = v19;
          v6 = 0;
          a1 = v28;
        }
        objc_msgSend(v17, "notifyObserversTransaction");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addChildTransaction:withSchedulingPolicy:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + v14[414]), 1);

        v24 = *(void **)(*(_QWORD *)(a1 + 32) + v15[415]);
        objc_msgSend(v17, "cleanupTransaction");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addChildTransaction:withSchedulingPolicy:", v25, 0);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v12);
  }

}

- (BOOL)__wantsInitialProgressStateChange
{
  return 0;
}

uint64_t __39__SBUIAnimationController__willAnimate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_willAnimate");
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (id)__startTransactionDependencyForEntity:(id)a3
{
  void *v3;
  SBWaitForSceneContentAvailableTransaction *v4;

  objc_msgSend(a3, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SBWaitForSceneContentAvailableTransaction initWithSceneHandle:manualListener:]([SBWaitForSceneContentAvailableTransaction alloc], "initWithSceneHandle:manualListener:", v3, 1);
  else
    v4 = 0;

  return v4;
}

- (void)_startAnimation
{
  if (!-[SBUIAnimationController isStepped](self, "isStepped"))
    -[SBUIAnimationController _noteAnimationDidFinish](self, "_noteAnimationDidFinish");
}

- (BOOL)_shouldDismissBanner
{
  return 1;
}

- (id)_viewsForAnimationStepping
{
  void *v2;
  void *v3;

  -[SBUIAnimationController _getTransitionWindow](self, "_getTransitionWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SBUIAnimationController_sceneHandle_didUpdateContentState___block_invoke;
  v9[3] = &unk_1E8EA0AF0;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SBUIAnimationController_sceneHandle_didUpdateContentState___block_invoke_2;
  v8[3] = &__block_descriptor_40_e51_v16__0__SBWaitForSceneContentAvailableTransaction_8l;
  v8[4] = a4;
  v7 = v6;
  -[SBUIAnimationController _entityObserverProgressDidChange:waitForSceneContentAvailableTransactionBlock:](self, "_entityObserverProgressDidChange:waitForSceneContentAvailableTransactionBlock:", v9, v8);

}

uint64_t __61__SBUIAnimationController_sceneHandle_didUpdateContentState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sceneHandle:didUpdateContentState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __61__SBUIAnimationController_sceneHandle_didUpdateContentState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "noteSceneContentIsReady:", *(_QWORD *)(a1 + 32) == 2);
}

- (void)_processStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__SBUIAnimationController__processStateDidChange___block_invoke;
  v11[3] = &unk_1E8E9E270;
  v11[4] = self;
  v12 = v4;
  v13 = v5;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __50__SBUIAnimationController__processStateDidChange___block_invoke_2;
  v9[3] = &unk_1E8EAE208;
  v10 = v13;
  v7 = v13;
  v8 = v4;
  -[SBUIAnimationController _entityObserverProgressDidChange:waitForSceneContentAvailableTransactionBlock:](self, "_entityObserverProgressDidChange:waitForSceneContentAvailableTransactionBlock:", v11, v9);

}

uint64_t __50__SBUIAnimationController__processStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_application:processStateDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __50__SBUIAnimationController__processStateDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isRunning") & 1) == 0 && (objc_msgSend(v3, "isComplete") & 1) == 0)
    objc_msgSend(v3, "failWithReason:", CFSTR("Process exited"));

}

- (void)_entityObserverProgressDidChange:(id)a3 waitForSceneContentAvailableTransactionBlock:(id)a4
{
  void (**v6)(_QWORD);
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)-[NSSet copy](self->_startTransactionDependencies, "copy");
  if (-[NSSet count](self->_entitiesToObserve, "count") && self->_animationState != 3)
    v6[2](v6);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7[2](v7, v14);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)_noteAnimationDidRevealApplication
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__SBUIAnimationController__noteAnimationDidRevealApplication__block_invoke;
  v2[3] = &unk_1E8E9E090;
  v2[4] = self;
  -[SBUIAnimationController _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v2);
}

void __61__SBUIAnimationController__noteAnimationDidRevealApplication__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "animationControllerDidRevealApplication:", *(_QWORD *)(a1 + 32));

}

- (void)_noteAnimationDidFail
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  SBLogWorkspace();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBUIAnimationController] noteAnimationDidFail: Animation failed.", v5, 2u);
  }

  -[SBUIAnimationController transition](self, "transition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isTransitioning"))
    objc_msgSend(v4, "completeTransition:", objc_msgSend(v4, "transitionWasCancelled") ^ 1);
  else
    -[SBUIAnimationController __noteAnimationDidTerminate](self, "__noteAnimationDidTerminate");

}

- (double)stepPercentage
{
  double result;

  -[SBAnimationStepper stepPercentage](self->_stepper, "stepPercentage");
  return result;
}

- (void)setStepPercentage:(double)a3
{
  void *v5;
  NSMutableArray *v6;
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
  if (-[SBUIAnimationController isStepped](self, "isStepped"))
  {
    -[SBUIAnimationController transition](self, "transition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateInteractiveTransition:", a3);

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_steppedCoordinatingChildAnimations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setStepPercentage:", a3, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)finishSteppingForwardToEnd
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[SBUIAnimationController isStepped](self, "isStepped"))
  {
    -[SBUIAnimationController transition](self, "transition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishInteractiveTransition");

    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_steppedCoordinatingChildAnimations;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "finishSteppingForwardToEnd", (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)finishSteppingBackwardToStart
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[SBUIAnimationController isStepped](self, "isStepped"))
  {
    -[SBUIAnimationController transition](self, "transition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelInteractiveTransition");

    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_steppedCoordinatingChildAnimations;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "finishSteppingBackwardToStart", (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)startInteractiveTransition:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBUIAnimationController transition](self, "transition");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v6)
  {
    objc_msgSend(v6, "animator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animateTransition:", v6);

  }
}

void __47__SBUIAnimationController_transitionDidFinish___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "schedulingPolicy") == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)setTransitionContextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContextProvider, a3);
}

- (UIView)containerView
{
  return self->_transitionContainer;
}

- (void)setTransition:(id)a3
{
  objc_storeStrong((id *)&self->_transition, a3);
}

- (BOOL)needsCATransactionActivate
{
  return self->_needsCATransactionActivate;
}

- (void)setNeedsCATransactionActivate:(BOOL)a3
{
  self->_needsCATransactionActivate = a3;
}

- (BOOL)isFluidSwitcherAnimationController
{
  return 0;
}

@end
