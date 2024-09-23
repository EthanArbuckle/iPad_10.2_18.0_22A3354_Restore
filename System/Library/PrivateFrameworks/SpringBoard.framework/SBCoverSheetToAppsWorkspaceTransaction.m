@implementation SBCoverSheetToAppsWorkspaceTransaction

- (SBCoverSheetToAppsWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  SBCoverSheetToAppsWorkspaceTransaction *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  SBTransientOverlayDismissAllWorkspaceTransaction *v16;
  SBTransientOverlayDismissAllWorkspaceTransaction *transientOverlayTransaction;
  void *v19;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  _QWORD v23[4];
  char v24;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCoverSheetToAppsWorkspaceTransaction.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transientOverlayPresentationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "hasActivePresentation");
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __68__SBCoverSheetToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke;
  v23[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  v24 = v8 ^ 1;
  objc_msgSend(v5, "modifyApplicationContext:", v23);
  v22.receiver = self;
  v22.super_class = (Class)SBCoverSheetToAppsWorkspaceTransaction;
  v10 = -[SBToAppsWorkspaceTransaction initWithTransitionRequest:](&v22, sel_initWithTransitionRequest_, v5);
  if (v10)
  {
    if (SBMainWorkspaceTransitionSourceIsUserEventDriven(objc_msgSend(v5, "source")))
    {
      -[SBToAppsWorkspaceTransaction layoutTransaction](v10, "layoutTransaction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "options");

      -[SBToAppsWorkspaceTransaction layoutTransaction](v10, "layoutTransaction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setOptions:", v12 | 2);

    }
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createRequestWithOptions:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __68__SBCoverSheetToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke_2;
    v20[3] = &unk_1E8EA1EB8;
    v21 = v7;
    objc_msgSend(v15, "modifyTransientOverlayContext:", v20);
    if (+[SBTransientOverlayDismissAllWorkspaceTransaction isValidForTransitionRequest:](SBTransientOverlayDismissAllWorkspaceTransaction, "isValidForTransitionRequest:", v15))
    {
      v16 = -[SBTransientOverlayDismissAllWorkspaceTransaction initWithTransitionRequest:]([SBTransientOverlayDismissAllWorkspaceTransaction alloc], "initWithTransitionRequest:", v15);
      transientOverlayTransaction = v10->_transientOverlayTransaction;
      v10->_transientOverlayTransaction = v16;

    }
    -[SBToAppsWorkspaceTransaction _setShouldSerialDismissOverlays:](v10, "_setShouldSerialDismissOverlays:", 0);

  }
  return v10;
}

void __68__SBCoverSheetToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setWaitsForSceneUpdates:", 0);
  objc_msgSend(v3, "setAnimationDisabled:", *(unsigned __int8 *)(a1 + 32));
  objc_msgSend(v3, "setAlwaysRunsWatchdog:", 1);

}

void __68__SBCoverSheetToAppsWorkspaceTransaction_initWithTransitionRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setAnimated:", 1);
  objc_msgSend(v3, "setPresentationManager:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTransitionType:", 1);

}

- (void)dealloc
{
  objc_super v3;

  -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](self->_autoPIPTransaction, "setCompletionBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBCoverSheetToAppsWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction dealloc](&v3, sel_dealloc);
}

- (void)_begin
{
  void *v3;
  char v4;
  SBTransientOverlayDismissAllWorkspaceTransaction *transientOverlayTransaction;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lockState");

  transientOverlayTransaction = self->_transientOverlayTransaction;
  if (transientOverlayTransaction)
    -[SBCoverSheetToAppsWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_transientOverlayTransaction);
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v4 & 2) == 0
    && objc_msgSend(v6, "isVisible")
    && (objc_msgSend(v7, "isAnyGestureActivelyRecognized") & 1) == 0)
  {
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCoverSheetPresented:animated:options:withCompletion:", 0, transientOverlayTransaction == 0, 2, 0);

  }
  -[SBCoverSheetToAppsWorkspaceTransaction _dismissOverlaysIfNeeded](self, "_dismissOverlaysIfNeeded");
  -[SBToAppsWorkspaceTransaction activateApplications](self, "activateApplications");
  -[SBCoverSheetToAppsWorkspaceTransaction _autoPIPIfNeeded](self, "_autoPIPIfNeeded");
  v9.receiver = self;
  v9.super_class = (Class)SBCoverSheetToAppsWorkspaceTransaction;
  -[SBCoverSheetToAppsWorkspaceTransaction _begin](&v9, sel__begin);

}

- (void)_didComplete
{
  objc_super v3;

  -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](self->_autoPIPTransaction, "setCompletionBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBCoverSheetToAppsWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction _didComplete](&v3, sel__didComplete);
}

- (void)_dismissOverlaysIfNeeded
{
  unint64_t v3;
  SBDismissOverlaysAnimationController *v4;
  void *v5;
  SBDismissOverlaysAnimationController *v6;
  SBDismissOverlaysAnimationController *dismissOverlaysAnimationController;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[SBCoverSheetToAppsWorkspaceTransaction _dismissOverlaysOptions](self, "_dismissOverlaysOptions");
  if (+[SBDismissOverlaysAnimationController willDismissOverlaysForDismissOptions:](SBDismissOverlaysAnimationController, "willDismissOverlaysForDismissOptions:", v3)&& !self->_dismissOverlaysAnimationController)
  {
    v4 = [SBDismissOverlaysAnimationController alloc];
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBDismissOverlaysAnimationController initWithTransitionContextProvider:options:](v4, "initWithTransitionContextProvider:options:", v5, v3);
    dismissOverlaysAnimationController = self->_dismissOverlaysAnimationController;
    self->_dismissOverlaysAnimationController = v6;

    -[SBCoverSheetToAppsWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", self->_dismissOverlaysAnimationController, 0);
    SBLogDashBoard();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[SBDismissOverlaysAnimationController debugDescription](self->_dismissOverlaysAnimationController, "debugDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "dismissOverlaysAnimationController: %@", (uint8_t *)&v10, 0xCu);

    }
  }
}

- (unint64_t)_dismissOverlaysOptions
{
  if (-[SBCoverSheetToAppsWorkspaceTransaction preservesBanners](self, "preservesBanners"))
    return -33;
  else
    return -1;
}

- (void)_autoPIPIfNeeded
{
  SBAutoPIPWorkspaceTransaction **p_autoPIPTransaction;
  SBAutoPIPWorkspaceTransaction *v4;
  SBAutoPIPWorkspaceTransaction *v5;
  void *v6;
  SBAutoPIPWorkspaceTransaction *v7;
  void *v8;
  id v9;

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (+[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:reason:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:reason:"))
  {
    p_autoPIPTransaction = &self->_autoPIPTransaction;
    -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](self->_autoPIPTransaction, "setCompletionBlock:", 0);
    if (-[SBAutoPIPWorkspaceTransaction isRunning](self->_autoPIPTransaction, "isRunning"))
      -[SBAutoPIPWorkspaceTransaction interruptWithReason:](*p_autoPIPTransaction, "interruptWithReason:", CFSTR("NewTransition"));
    v4 = *p_autoPIPTransaction;
    *p_autoPIPTransaction = 0;

    v5 = [SBAutoPIPWorkspaceTransaction alloc];
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBAutoPIPWorkspaceTransaction initWithTransitionRequest:](v5, "initWithTransitionRequest:", v6);

    -[SBAutoPIPWorkspaceTransaction entityToPIP](v7, "entityToPIP");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_storeStrong((id *)&self->_autoPIPTransaction, v7);
      -[SBCoverSheetToAppsWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", *p_autoPIPTransaction, 0);
    }

  }
}

- (BOOL)preservesBanners
{
  return self->_preservesBanners;
}

- (void)setPreservesBanners:(BOOL)a3
{
  self->_preservesBanners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoPIPTransaction, 0);
  objc_storeStrong((id *)&self->_transientOverlayTransaction, 0);
  objc_storeStrong((id *)&self->_dismissOverlaysAnimationController, 0);
}

@end
