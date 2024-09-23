@implementation SBSharedModalAlertItemPresenter

- (SBAlertItem)currentlyPresentedAlertItem
{
  void *v2;
  void *v3;

  -[SBModalViewControllerStack topViewController](self->_modalViewControllerStack, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBAlertItem *)v3;
}

- (SBSharedModalAlertItemPresenter)initWithLockOutProvider:(id)a3 systemGestureManager:(id)a4 reachabilityManager:(id)a5 alertLayoutPresentationVerifier:(id)a6 windowScene:(id)a7
{
  return -[SBSharedModalAlertItemPresenter initWithLockOutProvider:systemGestureManager:reachabilityManager:alertLayoutPresentationVerifier:windowScene:enableGestures:](self, "initWithLockOutProvider:systemGestureManager:reachabilityManager:alertLayoutPresentationVerifier:windowScene:enableGestures:", a3, a4, a5, a6, a7, 1);
}

- (SBSharedModalAlertItemPresenter)initWithLockOutProvider:(id)a3 systemGestureManager:(id)a4 reachabilityManager:(id)a5 alertLayoutPresentationVerifier:(id)a6 windowScene:(id)a7 enableGestures:(BOOL)a8
{
  _BOOL8 v8;
  id v15;
  id v16;
  id v17;
  SBSharedModalAlertItemPresenter *v18;
  SBSharedModalAlertItemPresenter *v19;
  uint64_t v20;
  SBFZStackResolver *zStackResolver;
  int v22;
  __objc2_class **v23;
  uint64_t v24;
  SBWindow *window;
  SBWindow *v26;
  void *v27;
  SBBarSwipeAffordanceView *v28;
  SBBarSwipeAffordanceView *v29;
  void *v30;
  SBBarSwipeAffordanceView *barSwipeView;
  SBBarSwipeAffordanceView *v32;
  SBModalViewControllerStack *v33;
  void *v34;
  uint64_t v35;
  SBModalViewControllerStack *modalViewControllerStack;
  id v38;
  id v39;
  objc_super v40;

  v8 = a8;
  v39 = a3;
  v15 = a4;
  v38 = a5;
  v16 = a6;
  v17 = a7;
  v40.receiver = self;
  v40.super_class = (Class)SBSharedModalAlertItemPresenter;
  v18 = -[SBSharedModalAlertItemPresenter init](&v40, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_lockOutProvider, a3);
    objc_storeStrong((id *)&v19->_systemGestureManager, a4);
    objc_msgSend(v17, "zStackResolver", v38, v39);
    v20 = objc_claimAutoreleasedReturnValue();
    zStackResolver = v19->_zStackResolver;
    v19->_zStackResolver = (SBFZStackResolver *)v20;

    v22 = SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleAlert"));
    v23 = off_1E8E94948;
    if (!v22)
      v23 = off_1E8E97210;
    v24 = objc_msgSend(objc_alloc(*v23), "initWithWindowScene:role:debugName:alertLayoutPresentationVerifier:", v17, CFSTR("SBTraitsParticipantRoleAlert"), CFSTR("SBAlertItemWindow"), v16);
    window = v19->_window;
    v19->_window = (SBWindow *)v24;

    -[SBWindow setOpaque:](v19->_window, "setOpaque:", 0);
    v26 = v19->_window;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWindow setBackgroundColor:](v26, "setBackgroundColor:", v27);

    -[SBWindow setWindowLevel:](v19->_window, "setWindowLevel:", *MEMORY[0x1E0CEBE20]);
    -[SBWindow setHidden:](v19->_window, "setHidden:", 1);
    objc_storeStrong((id *)&v19->_alertLayoutPresentationVerifier, a6);
    objc_msgSend(v16, "setAlertItemWindow:", v19->_window);
    objc_msgSend(v16, "setAlertPresenter:", v19);
    objc_storeStrong((id *)&v19->_reachabilityManager, a5);
    -[SBReachabilityManager addObserver:](v19->_reachabilityManager, "addObserver:", v19);
    v28 = [SBBarSwipeAffordanceView alloc];
    -[SBWindow bounds](v19->_window, "bounds");
    v29 = -[SBBarSwipeAffordanceView initWithFrame:systemGestureManager:enableGestures:](v28, "initWithFrame:systemGestureManager:enableGestures:", v15, v8);
    -[SBBarSwipeAffordanceView setAutoresizingMask:](v29, "setAutoresizingMask:", 18);
    -[SBBarSwipeAffordanceView setDelegate:](v29, "setDelegate:", v19);
    -[SBBarSwipeAffordanceView setPointerClickDelegate:](v29, "setPointerClickDelegate:", v19);
    -[SBBarSwipeAffordanceView addObserver:](v29, "addObserver:", v19);
    -[SBBarSwipeAffordanceView setActive:](v29, "setActive:", 0);
    -[SBBarSwipeAffordanceView setUserInteractionEnabled:](v29, "setUserInteractionEnabled:", 0);
    -[SBWindow addSubview:](v19->_window, "addSubview:", v29);
    -[SBBarSwipeAffordanceView layer](v29, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setZPosition:", 1.0);

    barSwipeView = v19->_barSwipeView;
    v19->_barSwipeView = v29;
    v32 = v29;

    v33 = [SBModalViewControllerStack alloc];
    -[SBWindow rootViewController](v19->_window, "rootViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[SBModalViewControllerStack initWithPresentingViewController:](v33, "initWithPresentingViewController:", v34);
    modalViewControllerStack = v19->_modalViewControllerStack;
    v19->_modalViewControllerStack = (SBModalViewControllerStack *)v35;

    -[SBModalViewControllerStack setDelegate:](v19->_modalViewControllerStack, "setDelegate:", v19);
  }

  return v19;
}

- (void)dealloc
{
  objc_super v3;

  -[SBReachabilityManager removeObserver:](self->_reachabilityManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBSharedModalAlertItemPresenter;
  -[SBSharedModalAlertItemPresenter dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v2;
  void *v3;
  id v4;
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
  -[SBModalViewControllerStack viewControllers](self->_modalViewControllerStack, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_map:", &__block_literal_global_207);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "deactivateForReason:", 4, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

uint64_t __45__SBSharedModalAlertItemPresenter_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "alertItem");
}

- (SBWindowScene)windowScene
{
  return -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
}

- (void)presentAlertItem:(id)a3 isLocked:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  SBModalViewControllerStack *modalViewControllerStack;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v7 = a5;
  v8 = a4;
  v11 = a3;
  v12 = a6;
  BSDispatchQueueAssertMain();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSharedModalAlertItemPresenter.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alertItem"));

  }
  objc_msgSend(v11, "_prepareNewAlertControllerWithLockedState:requirePasscodeForActions:", v8, -[SBFLockOutStatusProvider isLockedOut](self->_lockOutProvider, "isLockedOut"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSharedModalAlertItemPresenter.m"), 270, CFSTR("Attempt to present an alert item without an alertController - alertItem: %@"), v11);

  }
  objc_msgSend(v13, "setCoordinatedActionPerformingDelegate:", self);
  modalViewControllerStack = self->_modalViewControllerStack;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __81__SBSharedModalAlertItemPresenter_presentAlertItem_isLocked_animated_completion___block_invoke;
  v18[3] = &unk_1E8E9F1C0;
  v19 = v12;
  v15 = v12;
  -[SBModalViewControllerStack addViewController:animated:completion:](modalViewControllerStack, "addViewController:animated:completion:", v13, v7, v18);

}

uint64_t __81__SBSharedModalAlertItemPresenter_presentAlertItem_isLocked_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  SBModalViewControllerStack *modalViewControllerStack;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  BSDispatchQueueAssertMain();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSharedModalAlertItemPresenter.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alertItem"));

  }
  objc_msgSend(v9, "_alertController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSharedModalAlertItemPresenter.m"), 287, CFSTR("Attempting to dismiss an alert item without an alertController - alertItem: %@"), v9);

  }
  modalViewControllerStack = self->_modalViewControllerStack;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__SBSharedModalAlertItemPresenter_dismissAlertItem_animated_completion___block_invoke;
  v17[3] = &unk_1E8E9F230;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  -[SBModalViewControllerStack removeViewController:animated:completion:](modalViewControllerStack, "removeViewController:animated:completion:", v11, v6, v17);

}

uint64_t __72__SBSharedModalAlertItemPresenter_dismissAlertItem_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "doCleanupAfterDeactivationAnimation");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)modalViewControllerStack:(id)a3 willPresentViewController:(id)a4
{
  -[SBWindow setHidden:](self->_window, "setHidden:", 0, a4);
  -[SBFWindow makeKeyWindow](self->_window, "makeKeyWindow");
  -[SBSharedModalAlertItemPresenter _updateHomeGestureParticipant](self, "_updateHomeGestureParticipant");
}

- (void)modalViewControllerStack:(id)a3 didPresentViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setAlertControllerDelegate:", self);
  objc_msgSend(v5, "alertItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setPresented:", 1);
  -[SBSharedModalAlertItemPresenter _updateBarSwipeViewWithAlertController:](self, "_updateBarSwipeViewWithAlertController:", v5);

  -[SBAlertLayoutPresentationVerifier scheduleAlertLayoutVerificationForReason:](self->_alertLayoutPresentationVerifier, "scheduleAlertLayoutVerificationForReason:", CFSTR("didPresent alertController"));
}

- (void)modalViewControllerStack:(id)a3 willDismissViewController:(id)a4 animated:(BOOL)a5
{
  SBAlertLayoutPresentationVerifier *alertLayoutPresentationVerifier;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  alertLayoutPresentationVerifier = self->_alertLayoutPresentationVerifier;
  v9 = a3;
  -[SBAlertLayoutPresentationVerifier scheduleAlertLayoutVerificationForReason:](alertLayoutPresentationVerifier, "scheduleAlertLayoutVerificationForReason:", CFSTR("willDismiss alertController"));
  objc_msgSend(v11, "setAlertControllerDelegate:", 0);
  -[SBSharedModalAlertItemPresenter _updateHomeGestureParticipant](self, "_updateHomeGestureParticipant");
  objc_msgSend(v9, "topViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSharedModalAlertItemPresenter _updateBarSwipeViewWithAlertController:](self, "_updateBarSwipeViewWithAlertController:", v10);
  if (!v10 && !a5)
  {
    -[SBFWindow resignAsKeyWindow](self->_window, "resignAsKeyWindow");
    -[SBWindow setHidden:](self->_window, "setHidden:", 1);
  }

}

- (void)modalViewControllerStack:(id)a3 didDismissViewController:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "alertItem", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setPresented:", 0);

  -[SBModalViewControllerStack topViewController](self->_modalViewControllerStack, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[SBFWindow resignAsKeyWindow](self->_window, "resignAsKeyWindow");
    -[SBWindow setHidden:](self->_window, "setHidden:", 1);
    -[SBSharedModalAlertItemPresenter _updateHomeGestureParticipant](self, "_updateHomeGestureParticipant");
  }
}

- (void)_performActionForAlertController:(id)a3 invokeActionBlock:(id)a4 dismissControllerBlock:(id)a5
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)alertControllerDidDisappear:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SBModalViewControllerStack viewControllers](self->_modalViewControllerStack, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v9);

  if (v6)
  {
    objc_msgSend(v9, "alertItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSharedModalAlertItemPresenter.m"), 384, CFSTR("Unexpectedly dismissed alert controller (%@), please file a radar to PEP SpringBoard about this bad citizen: %@"), v9, v7);

  }
}

- (void)handleReachabilityYOffsetDidChange
{
  SBWindow *window;
  double v4;
  CGAffineTransform v5;

  -[SBReachabilityManager effectiveReachabilityYOffset](self->_reachabilityManager, "effectiveReachabilityYOffset");
  window = self->_window;
  CGAffineTransformMakeTranslation(&v5, 0.0, v4 * -0.5);
  -[SBWindow setTransform:](window, "setTransform:", &v5);
}

- (void)_updateHomeGestureParticipant
{
  void *v3;
  SBFZStackParticipant *zStackParticipant;
  BOOL v5;
  BOOL v6;
  SBFZStackParticipant *v7;
  SBFZStackParticipant *v8;
  SBFZStackParticipant *v9;

  -[SBModalViewControllerStack topViewController](self->_modalViewControllerStack, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  zStackParticipant = self->_zStackParticipant;
  if (v3)
    v5 = zStackParticipant == 0;
  else
    v5 = 0;
  if (v5)
  {
    -[SBFZStackResolver acquireParticipantWithIdentifier:delegate:](self->_zStackResolver, "acquireParticipantWithIdentifier:delegate:", 24, self);
    v7 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
    v8 = self->_zStackParticipant;
    self->_zStackParticipant = v7;

    -[SBSharedModalAlertItemPresenter zStackParticipantDidChange:](self, "zStackParticipantDidChange:", self->_zStackParticipant);
  }
  else
  {
    if (zStackParticipant)
      v6 = v3 == 0;
    else
      v6 = 0;
    if (v6)
    {
      -[SBFZStackParticipant invalidate](zStackParticipant, "invalidate");
      v9 = self->_zStackParticipant;
      self->_zStackParticipant = 0;

    }
  }
}

- (void)_updateBarSwipeViewWithAlertController:(id)a3
{
  SBBarSwipeAffordanceView *barSwipeView;
  void *v5;
  id v6;

  v6 = a3;
  barSwipeView = self->_barSwipeView;
  if ((-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture") & 1) != 0)
  {
    objc_msgSend(v6, "alertItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBarSwipeAffordanceView setActive:](barSwipeView, "setActive:", objc_msgSend(v5, "allowMenuButtonDismissal"));

  }
  else
  {
    -[SBBarSwipeAffordanceView setActive:](barSwipeView, "setActive:", 0);
  }

}

- (void)zStackParticipantDidChange:(id)a3
{
  id v4;

  -[SBModalViewControllerStack topViewController](self->_modalViewControllerStack, "topViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSharedModalAlertItemPresenter _updateBarSwipeViewWithAlertController:](self, "_updateBarSwipeViewWithAlertController:", v4);

}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  objc_msgSend(a4, "setActivationPolicyForParticipantsBelow:", 1);
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2)
    return 0;
  else
    return qword_1D0E89FB8[a4 - 1];
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  id v3;

  -[SBSharedModalAlertItemPresenter currentlyPresentedAlertItem](self, "currentlyPresentedAlertItem", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivate");

}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  id v4;
  SBFZStackParticipant *zStackParticipant;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant)
  {
    v8 = v4;
    v6 = -[SBFZStackParticipant ownsHomeGesture](zStackParticipant, "ownsHomeGesture");
    v4 = v8;
    if (v6)
    {
      -[SBSharedModalAlertItemPresenter currentlyPresentedAlertItem](self, "currentlyPresentedAlertItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deactivate");

      v4 = v8;
    }
  }

}

- (SBModalViewControllerStack)_modalViewControllerStack
{
  return self->_modalViewControllerStack;
}

- (void)_setModalViewControllerStack:(id)a3
{
  objc_storeStrong((id *)&self->_modalViewControllerStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_modalViewControllerStack, 0);
  objc_storeStrong((id *)&self->_barSwipeView, 0);
  objc_storeStrong((id *)&self->_alertLayoutPresentationVerifier, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_zStackResolver, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_lockOutProvider, 0);
}

@end
