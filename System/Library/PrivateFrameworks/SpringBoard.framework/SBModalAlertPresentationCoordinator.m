@implementation SBModalAlertPresentationCoordinator

- (void)_removeModalAlertPresenter:(id)a3
{
  SBModalAlertPresenter *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (SBModalAlertPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (v4 && -[NSMutableSet containsObject:](self->_activeModalAlertPresenters, "containsObject:", v4))
  {
    SBLogAlertItems();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SBModalAlertPresenter scene](v4, "scene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identityToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Removing modal alert presenter %@", (uint8_t *)&v9, 0xCu);

    }
    -[NSMutableSet removeObject:](self->_activeModalAlertPresenters, "removeObject:", v4);
    if (self->_springBoardModalAlertPresenter == v4)
      -[SBModalAlertPresentationCoordinator _noteSpringBoardModalAlertStateChanged:](self, "_noteSpringBoardModalAlertStateChanged:", 0);
  }

}

- (BOOL)canShowApplicationModalAlerts
{
  return !-[SBModalAlertPresentationCoordinator isShowingSystemModalAlert](self, "isShowingSystemModalAlert");
}

- (BOOL)isShowingSystemModalAlert
{
  return -[SBModalAlertPresenter isShowingModalAlert](self->_springBoardModalAlertPresenter, "isShowingModalAlert");
}

- (SBModalAlertPresentationCoordinator)initWithSceneDeactivationManager:(id)a3
{
  id v5;
  SBModalAlertPresentationCoordinator *v6;
  NSMutableSet *v7;
  NSMutableSet *activeModalAlertPresenters;
  NSMutableSet *v9;
  NSMutableSet *hideApplicationModalAlertAssertions;
  id v11;
  uint64_t v12;
  BSInvalidatable *sysdiagnoseStateHandler;
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBModalAlertPresentationCoordinator;
  v6 = -[SBModalAlertPresentationCoordinator init](&v17, sel_init);
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeModalAlertPresenters = v6->_activeModalAlertPresenters;
    v6->_activeModalAlertPresenters = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    hideApplicationModalAlertAssertions = v6->_hideApplicationModalAlertAssertions;
    v6->_hideApplicationModalAlertAssertions = v9;

    objc_storeStrong((id *)&v6->_sceneDeactivationManager, a3);
    objc_initWeak(&location, v6);
    v11 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v15, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v12 = objc_claimAutoreleasedReturnValue();
    sysdiagnoseStateHandler = v6->_sysdiagnoseStateHandler;
    v6->_sysdiagnoseStateHandler = (BSInvalidatable *)v12;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

id __72__SBModalAlertPresentationCoordinator_initWithSceneDeactivationManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)isShowingModalAlert
{
  return -[NSMutableSet count](self->_activeModalAlertPresenters, "count") != 0;
}

- (id)hideApplicationModalAlertsForReason:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v6 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C80D38];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __75__SBModalAlertPresentationCoordinator_hideApplicationModalAlertsForReason___block_invoke;
  v13 = &unk_1E8E9E468;
  objc_copyWeak(&v14, &location);
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("HideApplicationModalAlertsAssertion"), v4, v6, &v10);

  -[NSMutableSet addObject:](self->_hideApplicationModalAlertAssertions, "addObject:", v8, v10, v11, v12, v13);
  if (-[NSMutableSet count](self->_hideApplicationModalAlertAssertions, "count") == 1)
    -[SBModalAlertPresentationCoordinator _adjustApplicationSceneSettingsForModalAlertsAndFence:](self, "_adjustApplicationSceneSettingsForModalAlertsAndFence:", 1);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __75__SBModalAlertPresentationCoordinator_hideApplicationModalAlertsForReason___block_invoke(uint64_t a1, void *a2)
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
    if (!objc_msgSend(v4[6], "count") && (objc_msgSend(v4, "isShowingSystemModalAlert") & 1) == 0)
      objc_msgSend(v4, "_adjustApplicationSceneSettingsForModalAlertsAndFence:", 0);
  }

}

- (void)_addModalAlertPresenterIfNecessary:(id)a3
{
  SBModalAlertPresenter *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (SBModalAlertPresenter *)a3;
  BSDispatchQueueAssertMain();
  if (v4 && (-[NSMutableSet containsObject:](self->_activeModalAlertPresenters, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_activeModalAlertPresenters, "addObject:", v4);
    SBLogAlertItems();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SBModalAlertPresenter scene](v4, "scene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identityToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Adding modal alert presenter for %@", (uint8_t *)&v9, 0xCu);

    }
    if (self->_springBoardModalAlertPresenter == v4)
      -[SBModalAlertPresentationCoordinator _noteSpringBoardModalAlertStateChanged:](self, "_noteSpringBoardModalAlertStateChanged:", 1);
  }

}

- (NSString)description
{
  return (NSString *)-[SBModalAlertPresentationCoordinator descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBModalAlertPresentationCoordinator succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBModalAlertPresentationCoordinator descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  SBModalAlertPresentationCoordinator *v11;

  -[SBModalAlertPresentationCoordinator succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__SBModalAlertPresentationCoordinator_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

id __77__SBModalAlertPresentationCoordinator_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("systemModalAlertPresenter"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("activeModalAlertPresenters"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("sceneDeactivationAssertion"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("hideAllApplicationModalAlertsAssertions"));
}

- (void)_noteSpringBoardModalAlertStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  BSInvalidatable *hideApplicationModalAlertsAssertionWhileSBModalAlertsActive;
  BSInvalidatable *v7;
  BSInvalidatable *v8;
  UIApplicationSceneDeactivationAssertion *v9;
  UIApplicationSceneDeactivationAssertion *systemModalAlertsActiveSceneDeactivationAssertion;
  UIApplicationSceneDeactivationAssertion *v11;
  BSInvalidatable *v12;
  UIApplicationSceneDeactivationAssertion *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v3 = a3;
  BSDispatchQueueAssertMain();
  hideApplicationModalAlertsAssertionWhileSBModalAlertsActive = self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive;
  if (v3)
  {
    if (hideApplicationModalAlertsAssertionWhileSBModalAlertsActive
      || self->_systemModalAlertsActiveSceneDeactivationAssertion)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalAlertPresentationCoordinator.m"), 182, CFSTR("We shouldn't have any assertions at this point."));

    }
    -[SBModalAlertPresentationCoordinator hideApplicationModalAlertsForReason:](self, "hideApplicationModalAlertsForReason:", CFSTR("SystemModalAlertActive"));
    v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive;
    self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive = v7;

    v9 = (UIApplicationSceneDeactivationAssertion *)-[UIApplicationSceneDeactivationManager newAssertionWithReason:](self->_sceneDeactivationManager, "newAssertionWithReason:", 13);
    systemModalAlertsActiveSceneDeactivationAssertion = self->_systemModalAlertsActiveSceneDeactivationAssertion;
    self->_systemModalAlertsActiveSceneDeactivationAssertion = v9;

    v11 = self->_systemModalAlertsActiveSceneDeactivationAssertion;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __78__SBModalAlertPresentationCoordinator__noteSpringBoardModalAlertStateChanged___block_invoke;
    v17[3] = &unk_1E8EA3EA0;
    v17[4] = self;
    -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:](v11, "acquireWithPredicate:transitionContext:", v17, 0);
  }
  else
  {
    -[BSInvalidatable invalidate](hideApplicationModalAlertsAssertionWhileSBModalAlertsActive, "invalidate");
    v12 = self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive;
    self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive = 0;

    -[UIApplicationSceneDeactivationAssertion relinquish](self->_systemModalAlertsActiveSceneDeactivationAssertion, "relinquish");
    v13 = self->_systemModalAlertsActiveSceneDeactivationAssertion;
    self->_systemModalAlertsActiveSceneDeactivationAssertion = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "modalAlertPresentationCoordinator:didChangeShowingSystemModalAlert:", self, v3);

}

uint64_t __78__SBModalAlertPresentationCoordinator__noteSpringBoardModalAlertStateChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "modalAlertPresentationCoordinatorRequestedForegroundScenes:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "sceneIfExists", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v3)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_fencingTransitionContext:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = a3;
  BSDispatchQueueAssertMain();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CEA350], "transitionContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAnimationFence:", v4);
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_adjustApplicationSceneSettingsForModalAlertsAndFence:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v20 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "modalAlertPresentationCoordinatorRequestedForegroundScenes:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[SBModalAlertPresentationCoordinator isShowingSystemModalAlert](self, "isShowingSystemModalAlert");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11), "sceneIfExists");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[SBModalAlertPresentationCoordinator _fencingTransitionContext:](self, "_fencingTransitionContext:", v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_opt_class();
          objc_msgSend(v9, "settings");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "mutableCopy");
          SBSafeCast(v14, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            if (v19)
            {
              objc_msgSend(v17, "setCanShowAlerts:", 0);
              v18 = objc_msgSend(v17, "deactivationReasons") | 0x2000;
            }
            else
            {
              objc_msgSend(v17, "setCanShowAlerts:", -[NSMutableSet count](self->_hideApplicationModalAlertAssertions, "count") == 0);
              v18 = objc_msgSend(v17, "deactivationReasons") & 0xFFFFFFFFFFFFDFFFLL;
            }
            objc_msgSend(v17, "setDeactivationReasons:", v18);
            objc_msgSend(v9, "updateSettings:withTransitionContext:", v17, v13);
          }

        }
        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);

  }
}

- (SBModalAlertPresentationCoordinatorDelegate)delegate
{
  return (SBModalAlertPresentationCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBModalAlertPresenter)_getSpringBoardPresenter
{
  return self->_springBoardModalAlertPresenter;
}

- (void)_setSpringBoardPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_springBoardModalAlertPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sysdiagnoseStateHandler, 0);
  objc_storeStrong((id *)&self->_hideApplicationModalAlertsAssertionWhileSBModalAlertsActive, 0);
  objc_storeStrong((id *)&self->_hideApplicationModalAlertAssertions, 0);
  objc_storeStrong((id *)&self->_systemModalAlertsActiveSceneDeactivationAssertion, 0);
  objc_storeStrong((id *)&self->_springBoardModalAlertPresenter, 0);
  objc_storeStrong((id *)&self->_activeModalAlertPresenters, 0);
  objc_storeStrong((id *)&self->_sceneDeactivationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
