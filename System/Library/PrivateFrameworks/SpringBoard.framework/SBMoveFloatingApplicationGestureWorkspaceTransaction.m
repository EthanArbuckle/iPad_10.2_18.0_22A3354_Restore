@implementation SBMoveFloatingApplicationGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 4;
}

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction _begin](&v26, sel__begin);
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "layoutContainsRole:", 3);
  self->_tryPreemptiveFloatingApplicationActivation = v6 ^ 1;
  self->_didAddActivateFloatingApplicationTransaction = 0;
  objc_msgSend(v3, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "switcherContentController:frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", v3, objc_msgSend(v5, "interfaceOrientation"), objc_msgSend(v5, "floatingConfiguration"));
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  self->_initialFloatingApplicationFrame.origin.x = v8;
  self->_initialFloatingApplicationFrame.origin.y = v9;
  self->_initialFloatingApplicationFrame.size.width = v10;
  self->_initialFloatingApplicationFrame.size.height = v11;
  if ((v6 & 1) == 0)
  {
    -[SBMoveFloatingApplicationGestureWorkspaceTransaction _startSuppressingKeyboardForFloatingApplication](self, "_startSuppressingKeyboardForFloatingApplication");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v5, "elements", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16), "workspaceEntity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "deviceApplicationSceneEntity");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v18, "sceneHandle");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setKeyboardContextMaskStyle:", 2);

          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }

    -[SBWorkspaceTransaction windowScene](self, "windowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "medusaHostedKeyboardWindowController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateMedusaHostedKeyboardWindow");

  }
}

- (void)_didComplete
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction _didComplete](&v3, sel__didComplete);
  -[SBMoveFloatingApplicationGestureWorkspaceTransaction _stopSuppressingKeyboard](self, "_stopSuppressingKeyboard");
}

- (void)_beginWithGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_firstObjectPassingTest:", &__block_literal_global_395);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFluidSwitcherGestureWorkspaceTransaction setSelectedAppLayout:](self, "setSelectedAppLayout:", v7);
  v8.receiver = self;
  v8.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction _beginWithGesture:](&v8, sel__beginWithGesture_, v4);

}

BOOL __74__SBMoveFloatingApplicationGestureWorkspaceTransaction__beginWithGesture___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environment") == 2;
}

- (void)_updateWithGesture:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[SBMoveFloatingApplicationGestureWorkspaceTransaction _tryPreemptiveFloatingApplicationActivationIfNecessaryWithGesture:](self, "_tryPreemptiveFloatingApplicationActivationIfNecessaryWithGesture:", v4);
  v5.receiver = self;
  v5.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction _updateWithGesture:](&v5, sel__updateWithGesture_, v4);

}

- (void)_finishWithGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  SBMoveFloatingApplicationGestureWorkspaceTransaction *v13;

  v4 = a3;
  -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_didAddActivateFloatingApplicationTransaction && objc_msgSend(v5, "isTransitioning"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__SBMoveFloatingApplicationGestureWorkspaceTransaction__finishWithGesture___block_invoke;
    v11[3] = &unk_1E8E9E820;
    v12 = v6;
    v13 = self;
    -[SBMoveFloatingApplicationGestureWorkspaceTransaction _performBlockWithLiveContentOverlayUpdatesSuspended:](self, "_performBlockWithLiveContentOverlayUpdatesSuspended:", v11);

  }
  v10.receiver = self;
  v10.super_class = (Class)SBMoveFloatingApplicationGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction _finishWithGesture:](&v10, sel__finishWithGesture_, v4);
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "layoutContainsRole:", 3) & 1) == 0)
    -[SBMoveFloatingApplicationGestureWorkspaceTransaction _startSuppressingKeyboardForFloatingApplication](self, "_startSuppressingKeyboardForFloatingApplication");

}

void *__75__SBMoveFloatingApplicationGestureWorkspaceTransaction__finishWithGesture___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.springboard.moveFloatingApplicationTransaction"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTransitionWithError:", v3);

  result = *(void **)(*(_QWORD *)(a1 + 40) + 432);
  if (result)
    return (void *)objc_msgSend(result, "interruptWithReason:", CFSTR("Finished Move Gesture"));
  return result;
}

- (void)_tryPreemptiveFloatingApplicationActivationIfNecessaryWithGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SBApplicationSceneUpdateTransaction *v20;
  SBApplicationSceneUpdateTransaction *activateFloatingApplicationTransaction;
  SBApplicationSceneUpdateTransaction *v22;
  _QWORD v23[4];
  id v24;
  id location;

  v4 = a3;
  if (self->_tryPreemptiveFloatingApplicationActivation && !self->_didAddActivateFloatingApplicationTransaction)
  {
    -[SBFluidSwitcherGestureWorkspaceTransaction selectedAppLayout](self, "selectedAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layoutContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layoutState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "translationInView:", v9);
      v11 = v10;

      objc_msgSend(v8, "interfaceOrientation");
      SBLayoutDefaultSideLayoutElementWidth();
      if (fabs(v11) > v12 * 0.3)
      {
        -[SBMoveFloatingApplicationGestureWorkspaceTransaction _transitionRequestForPreemptiveFloatingApplicationActivation](self, "_transitionRequestForPreemptiveFloatingApplicationActivation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "finalize");
        objc_storeStrong((id *)&self->super.super.super.super._transitionRequest, v13);
        -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "beginTransitionForWorkspaceTransaction:", self);

        objc_msgSend(v13, "applicationContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layoutState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "elementWithRole:", 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "workspaceEntity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "applicationSceneEntity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = -[SBApplicationSceneUpdateTransaction initWithApplicationSceneEntity:transitionRequest:]([SBApplicationSceneUpdateTransaction alloc], "initWithApplicationSceneEntity:transitionRequest:", v19, v13);
        activateFloatingApplicationTransaction = self->_activateFloatingApplicationTransaction;
        self->_activateFloatingApplicationTransaction = v20;

        -[FBApplicationUpdateScenesTransaction setWaitsForSceneCommits:](self->_activateFloatingApplicationTransaction, "setWaitsForSceneCommits:", 0);
        objc_initWeak(&location, self);
        v22 = self->_activateFloatingApplicationTransaction;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __122__SBMoveFloatingApplicationGestureWorkspaceTransaction__tryPreemptiveFloatingApplicationActivationIfNecessaryWithGesture___block_invoke;
        v23[3] = &unk_1E8EA1F50;
        objc_copyWeak(&v24, &location);
        -[SBApplicationSceneUpdateTransaction setCompletionBlock:](v22, "setCompletionBlock:", v23);
        -[SBMoveFloatingApplicationGestureWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_activateFloatingApplicationTransaction);
        self->_didAddActivateFloatingApplicationTransaction = 1;
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);

      }
    }
  }

}

void __122__SBMoveFloatingApplicationGestureWorkspaceTransaction__tryPreemptiveFloatingApplicationActivationIfNecessaryWithGesture___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[54];
    WeakRetained[54] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (id)_transitionRequestForPreemptiveFloatingApplicationActivation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "createRequestWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureWorkspaceTransaction selectedAppLayout](self, "selectedAppLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBSwitcherTransitionRequest, "requestForActivatingAppLayout:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "switcherController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "configureRequest:forSwitcherTransitionRequest:withEventLabel:", v5, v7, CFSTR("PreemptiveFloatingApplicationActivation"));
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSource:", objc_msgSend(v10, "source"));

  objc_msgSend(v5, "modifyApplicationContext:", &__block_literal_global_23_10);
  return v5;
}

void __116__SBMoveFloatingApplicationGestureWorkspaceTransaction__transitionRequestForPreemptiveFloatingApplicationActivation__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "applicationSceneEntities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_each:", &__block_literal_global_25_6);

}

uint64_t __116__SBMoveFloatingApplicationGestureWorkspaceTransaction__transitionRequestForPreemptiveFloatingApplicationActivation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFlag:forActivationSetting:", 1, 9);
}

- (void)_performBlockWithLiveContentOverlayUpdatesSuspended:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  id v6;

  v4 = (void (**)(_QWORD))a3;
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "areLiveContentOverlayUpdatesSuspended");
  objc_msgSend(v6, "setLiveContentOverlayUpdatesSuspended:", 1);
  v4[2](v4);

  objc_msgSend(v6, "setLiveContentOverlayUpdatesSuspended:", v5);
}

- (void)_startSuppressingKeyboardForFloatingApplication
{
  void *v3;
  _QWORD v4[5];

  +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __103__SBMoveFloatingApplicationGestureWorkspaceTransaction__startSuppressingKeyboardForFloatingApplication__block_invoke;
  v4[3] = &unk_1E8EA3EA0;
  v4[4] = self;
  objc_msgSend(v3, "startSuppressingKeyboardWithReason:predicate:displayIdentity:", CFSTR("SBMoveFloatingApplicationKeyboardSuppressionReason"), v4, 0);

}

uint64_t __103__SBMoveFloatingApplicationGestureWorkspaceTransaction__startSuppressingKeyboardForFloatingApplication__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedAppLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForLayoutRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  return v8;
}

- (void)_stopSuppressingKeyboard
{
  id v2;

  +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopSuppressingKeyboardWithReason:", CFSTR("SBMoveFloatingApplicationKeyboardSuppressionReason"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activateFloatingApplicationTransaction, 0);
}

@end
