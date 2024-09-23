@implementation SBTransientOverlayDismissToAppsWorkspaceTransaction

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __objc2_class **v8;
  SBTransientOverlayDismissAllToAppsWorkspaceTransaction *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBTransientOverlayDismissToAppsWorkspaceTransaction;
  -[SBTransientOverlayDismissToAppsWorkspaceTransaction _begin](&v10, sel__begin);
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend((id)objc_opt_class(), "isValidForTransitionRequest:", v3))
    goto LABEL_9;
  objc_msgSend(v3, "transientOverlayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "presentationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "presentedViewControllerCount");
    v8 = off_1E8E98C70;
    if (v7 <= 1)
      v8 = off_1E8E98C58;
    v9 = (SBTransientOverlayDismissAllToAppsWorkspaceTransaction *)objc_msgSend(objc_alloc(*v8), "initWithTransitionRequest:", v3);

  }
  else
  {
    v9 = -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction initWithTransitionRequest:]([SBTransientOverlayDismissAllToAppsWorkspaceTransaction alloc], "initWithTransitionRequest:", v3);
  }

  if (v9)
  {
    -[SBTransientOverlayDismissToAppsWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v9, 0);

  }
  else
  {
LABEL_9:
    -[SBTransientOverlayDismissToAppsWorkspaceTransaction _evaluateCompletion](self, "_evaluateCompletion");
  }

}

- (void)_didComplete
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayDismissToAppsWorkspaceTransaction;
  -[SBMainWorkspaceTransaction _didComplete](&v4, sel__didComplete);
  SBWTErrorCreateForTransaction(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransientOverlayDismissToAppsWorkspaceTransaction _sendActivationResultWithError:](self, "_sendActivationResultWithError:", v3);

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
    if (-[SBTransientOverlayDismissToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
    {
      objc_msgSend(v7, "localizedFailureReason");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransientOverlayDismissToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Sent activation result; error = %@"),
        v6);

    }
  }

}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBTransientOverlayDismissToAppsWorkspaceTransaction childTransactions](self, "childTransactions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && !objc_msgSend(v10, "canInterruptForTransitionRequest:", v4))
        {
          v11 = 0;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_12:

  return v11;
}

+ (BOOL)isValidForTransitionRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __objc2_class **v6;
  char v7;

  v3 = a3;
  objc_msgSend(v3, "transientOverlayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = off_1E8E98C60;
  if (v5)
    v6 = off_1E8E98C70;
  v7 = -[__objc2_class isValidForTransitionRequest:](*v6, "isValidForTransitionRequest:", v3);

  return v7;
}

@end
