@implementation SBWorkspaceTransaction

- (FBSDisplayIdentity)displayIdentity
{
  return -[SBWorkspaceTransitionRequest displayIdentity](self->_transitionRequest, "displayIdentity");
}

- (SBWindowScene)windowScene
{
  return self->_windowScene;
}

- (SBWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  id v5;
  SBWorkspaceTransaction *v6;
  SBWorkspaceTransaction *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SBWindowScene *windowScene;
  uint64_t v12;
  SBLayoutStateTransitionCoordinator *layoutStateTransitionCoordinator;
  uint64_t v14;
  SBSceneManager *sceneManager;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBWorkspaceTransaction;
  v6 = -[SBTransaction init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitionRequest, a3);
    v7->_clearsCompletionAsynchronously = 1;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowSceneForDisplayIdentity:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    windowScene = v7->_windowScene;
    v7->_windowScene = (SBWindowScene *)v10;

    -[SBWindowScene layoutStateTransitionCoordinator](v7->_windowScene, "layoutStateTransitionCoordinator");
    v12 = objc_claimAutoreleasedReturnValue();
    layoutStateTransitionCoordinator = v7->_layoutStateTransitionCoordinator;
    v7->_layoutStateTransitionCoordinator = (SBLayoutStateTransitionCoordinator *)v12;

    -[SBWindowScene sceneManager](v7->_windowScene, "sceneManager");
    v14 = objc_claimAutoreleasedReturnValue();
    sceneManager = v7->_sceneManager;
    v7->_sceneManager = (SBSceneManager *)v14;

    -[SBWorkspaceTransitionRequest finalize](v7->_transitionRequest, "finalize");
  }

  return v7;
}

- (SBWorkspaceTransitionRequest)transitionRequest
{
  return self->_transitionRequest;
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  return self->_layoutStateTransitionCoordinator;
}

- (BOOL)isMainDisplayTransaction
{
  void *v2;
  char v3;

  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMainDisplayWindowScene");

  return v3;
}

- (BOOL)shouldInterceptTransitionRequest:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_layoutStateTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_transitionRequest, 0);
  objc_storeStrong((id *)&self->_transitionRequestForPendingInterruption, 0);
  objc_storeStrong((id *)&self->_suggestedAnimationController, 0);
}

- (SBUIAnimationController)suggestedAnimationController
{
  return self->_suggestedAnimationController;
}

- (BOOL)_isInterruptingForTransitionRequest
{
  return self->_transitionRequestForPendingInterruption != 0;
}

- (void)_didComplete
{
  objc_super v3;

  -[SBWorkspaceTransaction _performDeviceCoherencyCheck](self, "_performDeviceCoherencyCheck");
  v3.receiver = self;
  v3.super_class = (Class)SBWorkspaceTransaction;
  -[SBWorkspaceTransaction _didComplete](&v3, sel__didComplete);
}

- (void)_performDeviceCoherencyCheck
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "transitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compactDescriptionBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v4;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Re-locking because device coherency check failed for transaction %{public}@ with transition request %{public}@", (uint8_t *)&v8, 0x16u);

}

- (id)_childWorkspaceTransactions
{
  void *v2;
  void *v3;

  -[SBWorkspaceTransaction childTransactions](self, "childTransactions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_objectsOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (BOOL)clearsCompletionAsynchronously
{
  return self->_clearsCompletionAsynchronously;
}

- (SBWorkspaceTransaction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceTransaction.m"), 93, CFSTR("use initWithTransitionRequest:"));

  return 0;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return -[SBWorkspaceTransitionRequest displayConfiguration](self->_transitionRequest, "displayConfiguration");
}

- (void)keepAliveForAsyncBlock:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[SBWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("keepAliveForAsyncBlock"));
    -[SBTransaction queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__SBWorkspaceTransaction_keepAliveForAsyncBlock___block_invoke;
    v6[3] = &unk_1E8E9F1E8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __49__SBWorkspaceTransaction_keepAliveForAsyncBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("keepAliveForAsyncBlock"));
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  return 0;
}

- (void)interruptForTransitionRequest:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBWorkspaceTransitionRequest *transitionRequestForPendingInterruption;
  void *v12;
  id v13;

  v13 = a3;
  if (-[SBWorkspaceTransaction isRunning](self, "isRunning")
    && (-[SBWorkspaceTransaction isComplete](self, "isComplete") & 1) == 0
    && (-[SBWorkspaceTransaction isInterrupted](self, "isInterrupted") & 1) == 0)
  {
    v6 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspaceTransaction.m"), 146, CFSTR("Transition request cannot be nil when interrupting."));

      v6 = 0;
    }
    -[SBWorkspaceTransaction _willInterruptForTransitionRequest:](self, "_willInterruptForTransitionRequest:", v6);
    objc_storeStrong((id *)&self->_transitionRequestForPendingInterruption, a3);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "succinctDescriptionBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "build");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Interrupted for transition request: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransaction interruptWithReason:](self, "interruptWithReason:", v10);

    transitionRequestForPendingInterruption = self->_transitionRequestForPendingInterruption;
    self->_transitionRequestForPendingInterruption = 0;

    -[SBWorkspaceTransaction _didInterruptForTransitionRequest:](self, "_didInterruptForTransitionRequest:", v13);
  }

}

- (id)_customizedDescriptionProperties
{
  void *v3;
  void *v4;
  void *v5;

  if (-[SBWorkspaceTransaction _isRootTransaction](self, "_isRootTransaction"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "succinctDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Request"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_transitionRequestForInterruption
{
  return self->_transitionRequestForPendingInterruption;
}

- (void)_willInterruptForTransitionRequest:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  self->_clearsCompletionAsynchronously = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBWorkspaceTransaction _childWorkspaceTransactions](self, "_childWorkspaceTransactions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        objc_storeStrong(v11 + 20, a3);
        objc_msgSend(v11, "_willInterruptForTransitionRequest:", v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_didInterruptForTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBWorkspaceTransaction _childWorkspaceTransactions](self, "_childWorkspaceTransactions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)v10[20];
        v10[20] = 0;

        objc_msgSend(v10, "_didInterruptForTransitionRequest:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)setSuggestedAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedAnimationController, a3);
}

- (void)setClearsCompletionAsynchronously:(BOOL)a3
{
  self->_clearsCompletionAsynchronously = a3;
}

@end
