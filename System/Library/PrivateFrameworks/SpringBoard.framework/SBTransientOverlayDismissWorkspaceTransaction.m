@implementation SBTransientOverlayDismissWorkspaceTransaction

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  SBTransientOverlayDismissWorkspaceTransaction *v21;
  _QWORD v22[5];
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SBTransientOverlayDismissWorkspaceTransaction;
  -[SBTransientOverlayDismissWorkspaceTransaction _begin](&v23, sel__begin);
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientOverlayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "switcherController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "appLayoutForWorkspaceTransientOverlay:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    -[SBTransientOverlayDismissWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("_SBTransientOverlayDismissWorkspaceTransactionMilestoneSwitcherTransition"));
    objc_msgSend(v3, "applicationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __55__SBTransientOverlayDismissWorkspaceTransaction__begin__block_invoke;
    v22[3] = &unk_1E8E9E980;
    v22[4] = self;
    objc_msgSend(v9, "performTransitionWithContext:animated:completion:", v12, 0, v22);

  }
  +[SBTransientOverlayDismissalRequest dismissalRequestForViewController:](SBMutableTransientOverlayDismissalRequest, "dismissalRequestForViewController:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAnimated:", objc_msgSend(v4, "isAnimated"));
  -[SBTransientOverlayDismissWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("_SBTransientOverlayDismissWorkspaceTransactionMilestoneDismissalAnimation"));
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __55__SBTransientOverlayDismissWorkspaceTransaction__begin__block_invoke_2;
  v17[3] = &unk_1E8E9F108;
  v18 = v9;
  v19 = v5;
  v20 = v6;
  v21 = self;
  v14 = v6;
  v15 = v5;
  v16 = v9;
  objc_msgSend(v13, "setCompletionHandler:", v17);
  objc_msgSend(v7, "performDismissalRequest:", v13);

}

uint64_t __55__SBTransientOverlayDismissWorkspaceTransaction__begin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("_SBTransientOverlayDismissWorkspaceTransactionMilestoneSwitcherTransition"));
}

void __55__SBTransientOverlayDismissWorkspaceTransaction__begin__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "appLayoutForWorkspaceTransientOverlay:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addAcquiredTransientOverlayViewController:forAppLayout:", *(_QWORD *)(a1 + 48), v5);
  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason transientOverlayDismissWorkspaceTransactionDidBegin](SBKeyboardFocusArbitrationReason, "transientOverlayDismissWorkspaceTransactionDidBegin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestArbitrationForSBWindowScene:forReason:", v3, v4);

  objc_msgSend(*(id *)(a1 + 56), "removeMilestone:", CFSTR("_SBTransientOverlayDismissWorkspaceTransactionMilestoneDismissalAnimation"));
}

- (void)_didComplete
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayDismissWorkspaceTransaction;
  -[SBMainWorkspaceTransaction _didComplete](&v4, sel__didComplete);
  SBWTErrorCreateForTransaction(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransientOverlayDismissWorkspaceTransaction _sendActivationResultWithError:](self, "_sendActivationResultWithError:", v3);

}

- (void)_sendActivationResultWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "needsToSendActivationResult"))
  {
    objc_msgSend(v5, "sendActivationResultError:", v7);
    if (-[SBTransientOverlayDismissWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
    {
      objc_msgSend(v7, "localizedFailureReason");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransientOverlayDismissWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Sent activation result; error = %@"),
        v6);

    }
  }

}

+ (BOOL)isValidForTransitionRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v3 = a3;
  objc_msgSend(v3, "transientOverlayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "transitionType") == 1)
  {
    objc_msgSend(v4, "presentationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transientOverlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)SBApp, "windowSceneManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "displayIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "windowSceneForDisplayIdentity:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "switcherController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "hasAppLayoutForTransientOverlayViewController:", v11) & 1) != 0)
        v12 = 1;
      else
        v12 = objc_msgSend(v5, "isPresentingViewController:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
