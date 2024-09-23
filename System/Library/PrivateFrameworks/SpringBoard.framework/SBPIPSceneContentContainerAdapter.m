@implementation SBPIPSceneContentContainerAdapter

- (SBPIPSceneContentContainerAdapter)initWithSceneContentViewController:(id)a3 contentViewLayoutSettings:(id)a4 stashSettings:(id)a5 shadowSettings:(id)a6 interactionSettings:(id)a7 keyboardArbiterManager:(id)a8 keyboardFocusController:(id)a9 keyboardSuppressionManager:(id)a10 keyboardDismissalManager:(id)a11 deactivationManager:(id)a12 transitionCoordinator:(id)a13 delegate:(id)a14
{
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  SBPIPSceneContentContainerAdapter *v26;
  SBPIPSceneContentContainerAdapter *v27;
  SBPIPStashableWrapperViewController *v28;
  SBPIPSceneContentProviding *sceneContentViewController;
  uint64_t v30;
  SBPIPStashableWrapperViewController *stashableWrappingViewController;
  CGFloat v32;
  CGFloat v33;
  uint64_t v34;
  UIApplicationSceneDeactivationAssertion *sceneDeactivationAssertion;
  uint64_t v36;
  BSInvalidatable *keyboardFocusObserver;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  BSInvalidatable *keyboardDismissalParticipantHandle;
  id v46;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  objc_super v57;

  v55 = a3;
  v56 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v54 = a7;
  v46 = a8;
  v53 = a8;
  v52 = a9;
  v51 = a10;
  v50 = a11;
  v22 = v20;
  v23 = a12;
  v49 = a13;
  v24 = v19;
  v25 = a14;
  v57.receiver = self;
  v57.super_class = (Class)SBPIPSceneContentContainerAdapter;
  v26 = -[SBPIPSceneContentContainerAdapter init](&v57, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeWeak((id *)&v26->_delegate, v25);
    objc_storeStrong((id *)&v27->_interactionSettings, v21);
    objc_storeStrong((id *)&v27->_sceneContentViewController, a3);
    v28 = [SBPIPStashableWrapperViewController alloc];
    sceneContentViewController = v27->_sceneContentViewController;
    objc_msgSend(v56, "defaultCornerRadius");
    v30 = -[SBPIPStashableWrapperViewController initWithContentViewController:cornerRadius:stashVisualSettings:shadowSettings:](v28, "initWithContentViewController:cornerRadius:stashVisualSettings:shadowSettings:", sceneContentViewController, v24, v22);
    stashableWrappingViewController = v27->_stashableWrappingViewController;
    v27->_stashableWrappingViewController = (SBPIPStashableWrapperViewController *)v30;

    -[SBPIPStashableWrapperViewController setDelegate:](v27->_stashableWrappingViewController, "setDelegate:", v27);
    objc_msgSend(v56, "minimumStashedTabSize");
    v27->_minimumStashTabSize.width = v32;
    v27->_minimumStashTabSize.height = v33;
    v34 = objc_msgSend(v23, "newAssertionWithReason:", 12);
    sceneDeactivationAssertion = v27->_sceneDeactivationAssertion;
    v27->_sceneDeactivationAssertion = (UIApplicationSceneDeactivationAssertion *)v34;

    objc_storeStrong((id *)&v27->_keyboardArbiterManager, v46);
    objc_storeStrong((id *)&v27->_keyboardFocusController, a9);
    -[SBKeyboardFocusControlling addKeyboardFocusObserver:](v27->_keyboardFocusController, "addKeyboardFocusObserver:", v27);
    v36 = objc_claimAutoreleasedReturnValue();
    keyboardFocusObserver = v27->_keyboardFocusObserver;
    v27->_keyboardFocusObserver = (BSInvalidatable *)v36;

    objc_storeStrong((id *)&v27->_keyboardSuppressionManager, a10);
    objc_storeStrong((id *)&v27->_transitionCoordinator, a13);
    -[SBLayoutStateTransitionCoordinator addObserver:](v27->_transitionCoordinator, "addObserver:", v27);
    objc_storeStrong((id *)&v27->_keyboardDismissalManager, a11);
    -[SBPIPSceneContentContainerAdapter _hostedAppSceneHandle](v27, "_hostedAppSceneHandle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:", v27);

    -[SBLayoutStateTransitionCoordinator windowScene](v27->_transitionCoordinator, "windowScene");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layoutStateProvider");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layoutState");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "unlockedEnvironmentMode");

    if (-[SBPIPSceneContentContainerAdapter _tapInEnvironmentCanDismiss:](v27, "_tapInEnvironmentCanDismiss:", v42))
    {
      -[SBKeyboardDismissalManager registerKeyboardDismissalParticipant:](v27->_keyboardDismissalManager, "registerKeyboardDismissalParticipant:", v27);
      v43 = objc_claimAutoreleasedReturnValue();
      keyboardDismissalParticipantHandle = v27->_keyboardDismissalParticipantHandle;
      v27->_keyboardDismissalParticipantHandle = (BSInvalidatable *)v43;

    }
  }

  return v27;
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPSceneContentContainerAdapter.m"), 108, CFSTR("Attempting to dealloc without invalidating."));

  }
  SBLogPIP();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing", buf, 0xCu);

  }
  v7.receiver = self;
  v7.super_class = (Class)SBPIPSceneContentContainerAdapter;
  -[SBPIPSceneContentContainerAdapter dealloc](&v7, sel_dealloc);
}

- (id)bundleIdentifierForContainerViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SBPIPSceneContentContainerAdapter _hostedAppSceneHandle](self, "_hostedAppSceneHandle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)scenePersistenceIdentifierForContainerViewController:(id)a3
{
  void *v3;
  void *v4;

  -[SBPIPSceneContentContainerAdapter _hostedAppSceneHandle](self, "_hostedAppSceneHandle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistenceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contentViewControllerForContainerViewController:(id)a3
{
  return self->_stashableWrappingViewController;
}

- (int)processIdentifierForContainerViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[SBPIPSceneContentContainerAdapter _hostedAppSceneHandle](self, "_hostedAppSceneHandle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "pid");
  else
    v6 = -1;

  return v6;
}

- (void)setContainerViewController:(id)a3
{
  SBPIPContainerViewControllerAdapterContextProviding **p_containerViewController;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_containerViewController = &self->_containerViewController;
  WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_containerViewController, obj);
    v6 = obj;
  }

}

- (id)hostedAppSceneHandleForContainerViewController:(id)a3
{
  return (id)-[SBPIPSceneContentProviding sceneHandle](self->_sceneContentViewController, "sceneHandle", a3);
}

- (void)containerViewController:(id)a3 handleDestructionRequestForSceneHandle:(id)a4
{
  SBPIPSceneContentContainerAdapterDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "contentContainerAdapter:handleDestructionRequestForSceneHandle:", self, v6);

}

- (BOOL)containerViewControllerShouldRequireMedusaKeyboard:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  __int16 v11;
  char v12;
  BOOL v13;

  v4 = -[SBPIPInteractionSettings usesKeyboards](self->_interactionSettings, "usesKeyboards", a3);
  -[SBPIPSceneContentContainerAdapter _hostedAppSceneHandle](self, "_hostedAppSceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isForeground");

    objc_msgSend(v7, "uiSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "deactivationReasons");

    if ((v11 & 0x100) != 0)
      v12 = 0;
    else
      v12 = v9;
  }
  else
  {
    v12 = 1;
  }
  v13 = v4 & v12;

  return v13;
}

- (SBPIPContainerViewController)containerViewController
{
  return (SBPIPContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)containerViewControllerWillBeginSizeChange:(id)a3 behavior:(int)a4
{
  uint64_t v4;
  SBPIPStashableWrapperViewController *stashableWrappingViewController;
  _BOOL8 v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  stashableWrappingViewController = self->_stashableWrappingViewController;
  v7 = a4 != 0;
  v8 = a3;
  -[SBPIPStashableWrapperViewController setInteractivelyResizing:](stashableWrappingViewController, "setInteractivelyResizing:", v7);
  -[SBPIPSceneContentProviding containerViewControllerWillBeginSizeChange:behavior:](self->_sceneContentViewController, "containerViewControllerWillBeginSizeChange:behavior:", v8, v4);

}

- (void)containerViewControllerDidEndSizeChange:(id)a3
{
  SBPIPStashableWrapperViewController *stashableWrappingViewController;
  id v5;

  stashableWrappingViewController = self->_stashableWrappingViewController;
  v5 = a3;
  -[SBPIPStashableWrapperViewController setInteractivelyResizing:](stashableWrappingViewController, "setInteractivelyResizing:", 0);
  -[SBPIPSceneContentProviding containerViewControllerDidEndSizeChange:](self->_sceneContentViewController, "containerViewControllerDidEndSizeChange:", v5);

}

- (void)containerViewController:(id)a3 willBeginInteractionWithGestureRecognizer:(id)a4
{
  SBPIPSceneContentContainerAdapterDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "contentContainerAdapter:willBeginInteractionWithGestureRecognizer:", self, v6);

}

- (void)containerViewControllerDidEndInteraction:(id)a3 targetWindowScene:(id)a4
{
  SBPIPSceneContentContainerAdapterDelegate **p_delegate;
  id v7;
  id WeakRetained;
  id v9;

  p_delegate = &self->_delegate;
  v7 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "contentContainerAdapterDidEndInteraction:targetWindowScene:", self, v7);

  -[SBPIPSceneContentProviding containerViewControllerDidEndInteraction:targetWindowScene:](self->_sceneContentViewController, "containerViewControllerDidEndInteraction:targetWindowScene:", v9, v7);
}

- (void)containerViewControllerPanGestureDidEnd:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "contentContainerAdapterPanGestureDidEnd:", self);

}

- (BOOL)containerViewController:(id)a3 shouldHandleStashingForTransitionContext:(id)a4
{
  return -[SBPIPSceneContentProviding containerViewController:shouldHandleStashingForTransitionContext:](self->_sceneContentViewController, "containerViewController:shouldHandleStashingForTransitionContext:", a3, a4);
}

- (void)loadSubviewsForContainerViewController:(id)a3
{
  SBPIPStashableWrapperViewController *stashableWrappingViewController;
  id WeakRetained;

  -[SBPIPStashableWrapperViewController setMinimumStashTabSize:](self->_stashableWrappingViewController, "setMinimumStashTabSize:", a3, self->_minimumStashTabSize.width, self->_minimumStashTabSize.height);
  stashableWrappingViewController = self->_stashableWrappingViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[SBPIPStashableWrapperViewController setStashed:animated:](stashableWrappingViewController, "setStashed:animated:", objc_msgSend(WeakRetained, "initialStashStateForContentContainerAdapter:", self), 0);

}

- (void)containerViewController:(id)a3 willUpdateStashState:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "contentContainerAdapter:willUpdateStashState:", self, v4);

}

- (void)containerViewController:(id)a3 didSettleOnStashState:(BOOL)a4
{
  -[SBPIPSceneContentProviding containerViewController:didSettleOnStashState:](self->_sceneContentViewController, "containerViewController:didSettleOnStashState:", a3, a4);
}

- (void)containerViewController:(id)a3 didUpdateStashState:(BOOL)a4 springSettings:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  v7 = a5;
  -[SBPIPStashableWrapperViewController setStashed:](self->_stashableWrappingViewController, "setStashed:", v5);
  if (!v5)
    -[SBPIPStashableWrapperViewController setStashTabHidden:left:withSpringBehavior:completion:](self->_stashableWrappingViewController, "setStashTabHidden:left:withSpringBehavior:completion:", 1, 0, v7, 0);

}

- (void)containerViewController:(id)a3 wantsStashTabHidden:(BOOL)a4 left:(BOOL)a5 springSettings:(id)a6 completion:(id)a7
{
  -[SBPIPStashableWrapperViewController setStashTabHidden:left:withSpringBehavior:completion:](self->_stashableWrappingViewController, "setStashTabHidden:left:withSpringBehavior:completion:", a4, a5, a6, a7);
}

- (void)containerViewController:(id)a3 didUpdateStashProgress:(double)a4
{
  id WeakRetained;
  void *v7;
  int IsOne;
  UIApplicationSceneDeactivationAssertion *sceneDeactivationAssertion;
  uint64_t v10;
  SBKeyboardSuppressionManager *keyboardSuppressionManager;
  BSInvalidatable *v12;
  BSInvalidatable *keyboardSuppressionAssertion;
  BSInvalidatable *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (!WeakRetained
    || objc_msgSend(WeakRetained, "contentContainerAdapterShouldUpdateUIForStashing:", self))
  {
    -[SBPIPStashableWrapperViewController setStashProgress:](self->_stashableWrappingViewController, "setStashProgress:", a4);
  }
  IsOne = BSFloatIsOne();
  sceneDeactivationAssertion = self->_sceneDeactivationAssertion;
  if (IsOne)
  {
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __84__SBPIPSceneContentContainerAdapter_containerViewController_didUpdateStashProgress___block_invoke;
    v16[3] = &unk_1E8EA3EA0;
    v16[4] = self;
    -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:](sceneDeactivationAssertion, "acquireWithPredicate:transitionContext:", v16, 0);
    keyboardSuppressionManager = self->_keyboardSuppressionManager;
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __84__SBPIPSceneContentContainerAdapter_containerViewController_didUpdateStashProgress___block_invoke_2;
    v15[3] = &unk_1E8EA3EA0;
    v15[4] = self;
    -[SBKeyboardSuppressionManager acquireKeyboardSuppressionAssertionWithReason:predicate:displayIdentity:](keyboardSuppressionManager, "acquireKeyboardSuppressionAssertionWithReason:predicate:displayIdentity:", CFSTR("SBSystemNotesKeyboardSuppressionStashed"), v15, 0);
    v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    keyboardSuppressionAssertion = self->_keyboardSuppressionAssertion;
    self->_keyboardSuppressionAssertion = v12;
LABEL_10:

    goto LABEL_11;
  }
  if (-[UIApplicationSceneDeactivationAssertion isAcquired](sceneDeactivationAssertion, "isAcquired"))
    -[UIApplicationSceneDeactivationAssertion relinquish](self->_sceneDeactivationAssertion, "relinquish");
  v14 = self->_keyboardSuppressionAssertion;
  if (v14)
  {
    -[BSInvalidatable invalidate](v14, "invalidate");
    keyboardSuppressionAssertion = self->_keyboardSuppressionAssertion;
    self->_keyboardSuppressionAssertion = 0;
    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __84__SBPIPSceneContentContainerAdapter_containerViewController_didUpdateStashProgress___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_hostedAppSceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v3);

  return v6;
}

uint64_t __84__SBPIPSceneContentContainerAdapter_containerViewController_didUpdateStashProgress___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_hostedAppSceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v3);

  return v6;
}

- (BOOL)isStashTabHiddenForContainerViewController:(id)a3
{
  return -[SBPIPStashableWrapperViewController isStashTabHidden](self->_stashableWrappingViewController, "isStashTabHidden", a3);
}

- (BOOL)stashableWrapper:(id)a3 didReceivedTapGesture:(id)a4
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "setStashed:", 0);
  v5 = objc_msgSend(WeakRetained, "isStashed") ^ 1;

  return v5;
}

- (void)invalidate
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BSInvalidatable *keyboardFocusObserver;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPIPSceneContentContainerAdapter.m"), 264, CFSTR("Attempting to -invalidate twice; this is unsupported."));

  }
  SBLogPIP();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidating", (uint8_t *)&v14, 0xCu);

  }
  self->_invalidated = 1;
  -[SBPIPSceneContentContainerAdapter _hostedAppSceneHandle](self, "_hostedAppSceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "application");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogPIP();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Removing our sceneIdentifier from %{public}@ dataStore; sceneIdentifier: %{public}@",
        (uint8_t *)&v14,
        0x16u);

    }
    objc_msgSend(v8, "_dataStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeSceneStoreForIdentifier:", v7);

  }
  -[SBLayoutStateTransitionCoordinator removeObserver:](self->_transitionCoordinator, "removeObserver:", self);
  -[UIApplicationSceneDeactivationAssertion relinquish](self->_sceneDeactivationAssertion, "relinquish");
  -[BSInvalidatable invalidate](self->_keyboardSuppressionAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_keyboardFocusObserver, "invalidate");
  keyboardFocusObserver = self->_keyboardFocusObserver;
  self->_keyboardFocusObserver = 0;

  -[BSInvalidatable invalidate](self->_keyboardDismissalParticipantHandle, "invalidate");
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  -[SBPIPSceneContentContainerAdapter _dismissKeyboardIfNecessaryForTransitionContext:](self, "_dismissKeyboardIfNecessaryForTransitionContext:", a4);
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6;
  BSInvalidatable *keyboardDismissalParticipantHandle;
  BSInvalidatable *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  keyboardDismissalParticipantHandle = self->_keyboardDismissalParticipantHandle;
  if (keyboardDismissalParticipantHandle)
  {
    -[BSInvalidatable invalidate](keyboardDismissalParticipantHandle, "invalidate");
    v8 = self->_keyboardDismissalParticipantHandle;
    self->_keyboardDismissalParticipantHandle = 0;

  }
  if (-[SBPIPSceneContentContainerAdapter _tapInEnvironmentCanDismiss:](self, "_tapInEnvironmentCanDismiss:", -[SBPIPSceneContentContainerAdapter _effectiveEnvironmentModeForTransitionContext:](self, "_effectiveEnvironmentModeForTransitionContext:", v6)))
  {
    -[SBKeyboardDismissalManager registerKeyboardDismissalParticipant:](self->_keyboardDismissalManager, "registerKeyboardDismissalParticipant:", self);
    v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_keyboardDismissalParticipantHandle;
    self->_keyboardDismissalParticipantHandle = v9;

  }
}

- (void)sceneHandle:(id)a3 didUpdatePairingStatusForExternalSceneIdentifiers:(id)a4
{
  -[SBPIPSceneContentContainerAdapter _updateDisplayLayoutElementKeyboardFocus:](self, "_updateDisplayLayoutElementKeyboardFocus:", objc_msgSend(a3, "isPairedWithExternalSceneWithIdentifier:", *MEMORY[0x1E0D42708], a4));
}

- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPSceneContentContainerAdapter _hostedAppSceneHandle](self, "_hostedAppSceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  -[SBPIPSceneContentContainerAdapter _updateDisplayLayoutElementKeyboardFocus:](self, "_updateDisplayLayoutElementKeyboardFocus:", v8);
}

- (BOOL)keyboardDismissalManager:(id)a3 shouldPreventDismissalForTouch:(id)a4 inWindow:(id)a5
{
  id v7;
  id v8;
  BOOL v9;

  v7 = a4;
  v8 = a5;
  if (-[SBPIPSceneContentContainerAdapter _hostedSceneIsPresentingKeyboard](self, "_hostedSceneIsPresentingKeyboard"))
    v9 = -[SBPIPSceneContentContainerAdapter _hitTestTouch:inWindow:](self, "_hitTestTouch:inWindow:", v7, v8);
  else
    v9 = 0;

  return v9;
}

- (BOOL)_hitTestTouch:(id)a3 inWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  BOOL v19;

  v6 = a3;
  v7 = a4;
  -[SBPIPSceneContentContainerAdapter containerViewController](self, "containerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewIfLoaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fixedCoordinateSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v13);
    objc_msgSend(v7, "convertPoint:toCoordinateSpace:", v12);
    v15 = v14;
    v17 = v16;

    objc_msgSend(v10, "convertPoint:fromCoordinateSpace:", v12, v15, v17);
    objc_msgSend(v10, "hitTest:withEvent:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 != 0;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_updateDisplayLayoutElementKeyboardFocus:(BOOL)a3
{
  id WeakRetained;
  _QWORD v5[4];
  BOOL v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__SBPIPSceneContentContainerAdapter__updateDisplayLayoutElementKeyboardFocus___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__SBSDisplayLayoutElement_8l;
  v6 = a3;
  objc_msgSend(WeakRetained, "updateDisplayLayoutElementWithBuilder:", v5);

}

uint64_t __78__SBPIPSceneContentContainerAdapter__updateDisplayLayoutElementKeyboardFocus___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHasKeyboardFocus:", *(unsigned __int8 *)(a1 + 32));
}

- (id)_hostedAppSceneHandle
{
  return (id)-[SBPIPSceneContentProviding sceneHandle](self->_sceneContentViewController, "sceneHandle");
}

- (void)_dismissKeyboardIfNecessaryForTransitionContext:(id)a3
{
  NSObject *v4;
  void *v5;
  Class v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[SBPIPSceneContentContainerAdapter _effectiveEnvironmentModeForTransitionContext:](self, "_effectiveEnvironmentModeForTransitionContext:", a3) == 1&& -[SBPIPInteractionSettings keyboardDismissesOnTransitionToHomescreen](self->_interactionSettings, "keyboardDismissesOnTransitionToHomescreen")&& -[SBPIPSceneContentContainerAdapter _hostedSceneIsPresentingKeyboard](self, "_hostedSceneIsPresentingKeyboard"))
  {
    SBLogSystemNotes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing keyboard for transition to homescreen", (uint8_t *)&v8, 0xCu);

    }
    v6 = NSClassFromString(CFSTR("UIKeyboardArbiterManager"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[objc_class performSelector:](v6, "performSelector:", sel_sharedArbiterManager);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v7, "forceKeyboardAway");

  }
}

- (int64_t)_effectiveEnvironmentModeForTransitionContext:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "toLayoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unlockedEnvironmentMode");

  return v4;
}

- (BOOL)_hostedSceneIsPresentingKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SBKeyboardFocusControlling externalSceneWithFocus](self->_keyboardFocusController, "externalSceneWithFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identityToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPIPSceneContentContainerAdapter _hostedAppSceneHandle](self, "_hostedAppSceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqual:", v4))
    v8 = v5;
  else
    v8 = 0;

  return v8 != 0;
}

- (BOOL)_tapInEnvironmentCanDismiss:(int64_t)a3
{
  BOOL v5;
  BOOL result;

  v5 = -[SBPIPInteractionSettings keyboardDismissesOnOutsideUserInteractionOnHomescreen](self->_interactionSettings, "keyboardDismissesOnOutsideUserInteractionOnHomescreen");
  result = -[SBPIPInteractionSettings keyboardDismissesOnOutsideUserInteractionOutsideHomescreen](self->_interactionSettings, "keyboardDismissesOnOutsideUserInteractionOutsideHomescreen");
  if (a3 == 1 && v5)
    return 1;
  if (a3 == 1)
    return 0;
  return result;
}

- (SBPIPSceneContentProviding)sceneContentViewController
{
  return self->_sceneContentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_keyboardSuppressionManager, 0);
  objc_storeStrong((id *)&self->_keyboardDismissalParticipantHandle, 0);
  objc_storeStrong((id *)&self->_keyboardDismissalManager, 0);
  objc_storeStrong((id *)&self->_keyboardFocusObserver, 0);
  objc_storeStrong((id *)&self->_keyboardFocusController, 0);
  objc_storeStrong((id *)&self->_keyboardArbiterManager, 0);
  objc_storeStrong((id *)&self->_keyboardSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_sceneDeactivationAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneContentViewController, 0);
  objc_storeStrong((id *)&self->_stashableWrappingViewController, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
}

@end
