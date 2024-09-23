@implementation SBInteractiveScreenshotGestureManager

- (SBInteractiveScreenshotGestureManager)initWithWindowScene:(id)a3 workspace:(id)a4 appInteractionEventSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBInteractiveScreenshotGestureManager *v12;
  SBInteractiveScreenshotGestureManager *v13;
  uint64_t v14;
  UIScreen *screen;
  uint64_t v16;
  SBSystemGestureManager *systemGestureManager;
  uint64_t v18;
  SBInteractiveScreenshotSettings *settings;
  void *v20;
  uint64_t v21;
  SBCornerPencilPanGestureRecognizer *bottomLeftPencilGestureRecognizer;
  void *v23;
  uint64_t v24;
  SBCornerPencilPanGestureRecognizer *bottomRightPencilGestureRecognizer;
  void *v26;
  SBCornerFingerGestureClassifier *v27;
  SBCornerFingerPanGestureRecognizer *v28;
  SBCornerFingerPanGestureRecognizer *bottomLeftFingerGestureRecognizer;
  SBCornerFingerGestureClassifier *v30;
  SBCornerFingerPanGestureRecognizer *v31;
  SBCornerFingerPanGestureRecognizer *bottomRightFingerGestureRecognizer;
  void *v33;
  objc_super v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v35.receiver = self;
  v35.super_class = (Class)SBInteractiveScreenshotGestureManager;
  v12 = -[SBInteractiveScreenshotGestureManager init](&v35, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lastApplicationTouchTime = -1.79769313e308;
    objc_msgSend(v9, "screen");
    v14 = objc_claimAutoreleasedReturnValue();
    screen = v13->_screen;
    v13->_screen = (UIScreen *)v14;

    objc_storeStrong((id *)&v13->_appInteractionEventSource, a5);
    objc_storeStrong((id *)&v13->_windowScene, a3);
    objc_msgSend(v9, "systemGestureManager");
    v16 = objc_claimAutoreleasedReturnValue();
    systemGestureManager = v13->_systemGestureManager;
    v13->_systemGestureManager = (SBSystemGestureManager *)v16;

    objc_storeStrong((id *)&v13->_workspace, a4);
    +[SBInteractiveScreenshotDomain rootSettings](SBInteractiveScreenshotDomain, "rootSettings");
    v18 = objc_claimAutoreleasedReturnValue();
    settings = v13->_settings;
    v13->_settings = (SBInteractiveScreenshotSettings *)v18;

    -[SBInteractiveScreenshotSettings pencilGestureSettings](v13->_settings, "pencilGestureSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBCornerPencilPanGestureRecognizer interactiveCornerPanGestureRecognizerWithSettings:corner:target:action:](SBCornerPencilPanGestureRecognizer, "interactiveCornerPanGestureRecognizerWithSettings:corner:target:action:", v20, 4, v13, sel__handleInteractiveScreenshotGesture_);
    v21 = objc_claimAutoreleasedReturnValue();
    bottomLeftPencilGestureRecognizer = v13->_bottomLeftPencilGestureRecognizer;
    v13->_bottomLeftPencilGestureRecognizer = (SBCornerPencilPanGestureRecognizer *)v21;

    -[SBCornerPencilPanGestureRecognizer setDelegate:](v13->_bottomLeftPencilGestureRecognizer, "setDelegate:", v13);
    -[SBSystemGestureManager addGestureRecognizer:withType:](v13->_systemGestureManager, "addGestureRecognizer:withType:", v13->_bottomLeftPencilGestureRecognizer, 102);
    -[SBInteractiveScreenshotSettings pencilGestureSettings](v13->_settings, "pencilGestureSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBCornerPencilPanGestureRecognizer interactiveCornerPanGestureRecognizerWithSettings:corner:target:action:](SBCornerPencilPanGestureRecognizer, "interactiveCornerPanGestureRecognizerWithSettings:corner:target:action:", v23, 8, v13, sel__handleInteractiveScreenshotGesture_);
    v24 = objc_claimAutoreleasedReturnValue();
    bottomRightPencilGestureRecognizer = v13->_bottomRightPencilGestureRecognizer;
    v13->_bottomRightPencilGestureRecognizer = (SBCornerPencilPanGestureRecognizer *)v24;

    -[SBCornerPencilPanGestureRecognizer setDelegate:](v13->_bottomRightPencilGestureRecognizer, "setDelegate:", v13);
    -[SBSystemGestureManager addGestureRecognizer:withType:](v13->_systemGestureManager, "addGestureRecognizer:withType:", v13->_bottomRightPencilGestureRecognizer, 103);
    -[SBInteractiveScreenshotSettings fingerGestureSettings](v13->_settings, "fingerGestureSettings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[SBCornerFingerGestureClassifier initWithSettings:]([SBCornerFingerGestureClassifier alloc], "initWithSettings:", v26);
    v28 = -[SBCornerFingerPanGestureRecognizer initWithTarget:action:corner:classifier:]([SBCornerFingerPanGestureRecognizer alloc], "initWithTarget:action:corner:classifier:", v13, sel__handleInteractiveScreenshotGesture_, 4, v27);
    bottomLeftFingerGestureRecognizer = v13->_bottomLeftFingerGestureRecognizer;
    v13->_bottomLeftFingerGestureRecognizer = v28;

    -[SBCornerFingerPanGestureRecognizer setDelegate:](v13->_bottomLeftFingerGestureRecognizer, "setDelegate:", v13);
    -[SBSystemGestureManager addGestureRecognizer:withType:](v13->_systemGestureManager, "addGestureRecognizer:withType:", v13->_bottomLeftFingerGestureRecognizer, 104);
    v30 = -[SBCornerFingerGestureClassifier initWithSettings:]([SBCornerFingerGestureClassifier alloc], "initWithSettings:", v26);
    v31 = -[SBCornerFingerPanGestureRecognizer initWithTarget:action:corner:classifier:]([SBCornerFingerPanGestureRecognizer alloc], "initWithTarget:action:corner:classifier:", v13, sel__handleInteractiveScreenshotGesture_, 8, v30);
    bottomRightFingerGestureRecognizer = v13->_bottomRightFingerGestureRecognizer;
    v13->_bottomRightFingerGestureRecognizer = v31;

    -[SBCornerFingerPanGestureRecognizer setDelegate:](v13->_bottomRightFingerGestureRecognizer, "setDelegate:", v13);
    -[SBSystemGestureManager addGestureRecognizer:withType:](v13->_systemGestureManager, "addGestureRecognizer:withType:", v13->_bottomRightFingerGestureRecognizer, 105);
    -[SBInteractiveScreenshotGestureManager _updateFailureRequirements](v13, "_updateFailureRequirements");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v13, sel__springBoardBootCompleted_, CFSTR("SBBootCompleteNotification"), 0);

    -[SBDisplayAppInteractionEventSource addObserver:](v13->_appInteractionEventSource, "addObserver:", v13);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[SBInteractiveScreenshotCommitWorkspaceTransaction removeObserver:](self->_commitTransaction, "removeObserver:", self);
  -[SBDisplayAppInteractionEventSource removeObserver:](self->_appInteractionEventSource, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBInteractiveScreenshotGestureManager;
  -[SBInteractiveScreenshotGestureManager dealloc](&v3, sel_dealloc);
}

- (void)_updateFailureRequirements
{
  SBCornerFingerGestureUpdateFailureRequirements(self->_bottomLeftFingerGestureRecognizer, self->_systemGestureManager);
  SBCornerFingerGestureUpdateFailureRequirements(self->_bottomRightFingerGestureRecognizer, self->_systemGestureManager);
}

- (void)transactionDidComplete:(id)a3
{
  BSInvalidatable *commitTransactionDisableGestureAssertion;
  SBInteractiveScreenshotCommitWorkspaceTransaction *commitTransaction;

  if (self->_commitTransaction == a3)
  {
    self->_hasInitiatedCommit = 0;
    -[BSInvalidatable invalidate](self->_commitTransactionDisableGestureAssertion, "invalidate");
    commitTransactionDisableGestureAssertion = self->_commitTransactionDisableGestureAssertion;
    self->_commitTransactionDisableGestureAssertion = 0;

    commitTransaction = self->_commitTransaction;
    self->_commitTransaction = 0;

  }
}

- (void)interactiveScreenshotCommitWorkspaceTransactionRequestsPlaceholderChromeRemoval:(id)a3
{
  NSMutableDictionary *sessionIDToSession;
  void *v4;
  void *v5;
  id v6;

  if (self->_commitTransaction == a3)
  {
    sessionIDToSession = self->_sessionIDToSession;
    objc_msgSend(a3, "gestureSessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](sessionIDToSession, "objectForKey:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removePlaceholderChrome");

  }
}

- (void)interactiveScreenshotCommitWorkspaceTransactionRequestsGestureWindowInvalidation:(id)a3
{
  id v4;

  if (self->_commitTransaction == a3)
  {
    objc_msgSend(a3, "gestureSessionID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBInteractiveScreenshotGestureManager _invalidateSessionID:](self, "_invalidateSessionID:", v4);

  }
}

- (void)interactiveScreenshotGestureRootViewController:(id)a3 gestureDidCompleteWithIntent:(int64_t)a4
{
  id v6;
  void *v7;
  NSUUID *activeGestureSessionID;
  NSUUID *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSUUID *v13;
  _QWORD *v14;
  UIScreen *screen;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, uint64_t);
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  NSUUID *v23;
  BSInvalidatable *v24;
  BSInvalidatable *commitTransactionDisableGestureAssertion;
  _QWORD v26[5];
  id v27;
  id v28;
  NSUUID *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  NSUUID *v34;

  v6 = a3;
  -[SBWorkspace eventQueue](self->_workspace, "eventQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelEventsWithName:", CFSTR("BInteractiveScreenshotGestureCommit"));

  activeGestureSessionID = self->_activeGestureSessionID;
  if (activeGestureSessionID)
  {
    v9 = activeGestureSessionID;
    -[NSMutableDictionary objectForKey:](self->_sessionIDToSession, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke;
    v32[3] = &unk_1E8EAC028;
    v32[4] = self;
    v12 = v6;
    v33 = v12;
    v13 = v9;
    v34 = v13;
    v14 = (_QWORD *)MEMORY[0x1D17E5550](v32);
    screen = self->_screen;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIScreen isEqual:](screen, "isEqual:", v16))
      v17 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
    else
      v17 = 0;

    if (v17 <= 1)
      v18 = 1;
    else
      v18 = v17;
    if (a4 == 1)
    {
      v20 = objc_msgSend(v12, "gestureStyle");
      v19 = (void (*)(_QWORD *, uint64_t))v14[2];
      if (v20 != 1)
      {
        v21 = v14;
        v22 = 1;
        goto LABEL_14;
      }
    }
    else
    {
      if (a4 == 2 && !self->_hasInitiatedCommit)
      {
        v23 = self->_activeGestureSessionID;
        self->_activeGestureSessionID = 0;

        *(_WORD *)&self->_hasInitiatedCommit = 257;
        -[SBInteractiveScreenshotGestureManager acquireDisableGestureAssertionWithReason:](self, "acquireDisableGestureAssertionWithReason:", CFSTR("CommitTransaction"));
        v24 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        commitTransactionDisableGestureAssertion = self->_commitTransactionDisableGestureAssertion;
        self->_commitTransactionDisableGestureAssertion = v24;

        v26[0] = v11;
        v26[1] = 3221225472;
        v26[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_3;
        v26[3] = &unk_1E8EB61D8;
        v26[4] = self;
        v30 = v14;
        v27 = v12;
        v31 = v18;
        v28 = v10;
        v29 = v13;
        objc_msgSend(v27, "captureScreenshotWithInterfaceOrientation:completion:", v18, v26);

        goto LABEL_15;
      }
      v19 = (void (*)(_QWORD *, uint64_t))v14[2];
    }
    v21 = v14;
    v22 = 0;
LABEL_14:
    v19(v21, v22);
LABEL_15:

  }
}

void __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_performPendingCommitWorkspaceTransactionBlocksWithTransaction:", 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_2;
  v5[3] = &unk_1E8EA46C0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "cancelInteractionWithStyle:settlingCompletionHandler:", a2, v5);

}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_2(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_invalidateSessionID:", *(_QWORD *)(result + 40));
  return result;
}

void __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SBInteractiveScreenshotGestureHostRootViewController *v13;
  SBInteractiveScreenshotGestureHostWindow *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  SBInteractiveScreenshotGestureHostWindow *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  _QWORD v30[5];
  _QWORD v31[4];
  uint64_t v32;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 89) = 0;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D8C0E0]);
    v5 = objc_alloc_init(MEMORY[0x1E0D8C0D8]);
    objc_msgSend(v5, "setPreparedImage:", v3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setExternalFlashLayerRenderID:", objc_msgSend(*(id *)(a1 + 40), "flashViewLayerRenderID"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "setExternalFlashLayerContextID:", objc_msgSend(*(id *)(a1 + 40), "flashViewLayerContextID"));
    objc_msgSend(v4, "setScreenshotOptions:forScreen:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "_screenshotPresentationOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "interactiveScreenshotGestureManager:requestsScreenshotWithOptionsCollection:presentationOptions:", v7, v4, v8);

    v9 = *(_QWORD *)(a1 + 72);
    v10 = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_4;
    v31[3] = &unk_1E8EA46E8;
    v11 = *(void **)(a1 + 40);
    v32 = *(_QWORD *)(a1 + 32);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_6;
    v30[3] = &unk_1E8EA46E8;
    v30[4] = v32;
    v31[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(v11, "commitInteractionWithScreenshotImage:screenshotInterfaceOrientation:settlingCompletionHandler:flashCompletionHandler:", v3, v9, v31, v30);
    objc_msgSend(*(id *)(a1 + 48), "hostWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = -[SBInteractiveScreenshotGestureHostRootViewController initWithScreen:]([SBInteractiveScreenshotGestureHostRootViewController alloc], "initWithScreen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));
      v14 = [SBInteractiveScreenshotGestureHostWindow alloc];
      v15 = *(_QWORD **)(a1 + 32);
      v16 = v15[20];
      objc_msgSend(v15, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:](v14, "initWithWindowScene:rootViewController:role:debugName:", v16, v13, CFSTR("SBTraitsParticipantRoleInteractiveScreenshotGesture"), v17);

      -[SBInteractiveScreenshotGestureHostWindow setWindowLevel:](v18, "setWindowLevel:", *MEMORY[0x1E0CEB660] + 2.0);
      objc_msgSend(*(id *)(a1 + 48), "setHostWindow:", v18);

    }
    objc_msgSend(*(id *)(a1 + 48), "hostRootViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "rootWindow");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHostingContextID:pid:", objc_msgSend(v20, "_contextId"), getpid());

    objc_msgSend(*(id *)(a1 + 48), "hostWindow");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidden:", 0);

    v22 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    v27[0] = v10;
    v27[1] = 3221225472;
    v27[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_9;
    v27[3] = &unk_1E8EAAC50;
    v23 = *(id *)(a1 + 56);
    v24 = *(_QWORD *)(a1 + 32);
    v28 = v23;
    v29 = v24;
    objc_msgSend(v22, "requestTransitionWithOptions:builder:validator:", 0, &__block_literal_global_27_1, v27);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 72);
    *(_QWORD *)(v25 + 72) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performCommitWorkspaceTransactionBlock:", &__block_literal_global_249);
}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHasFinishedSettlingAnimation:", 1);
}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performCommitWorkspaceTransactionBlock:", &__block_literal_global_23_5);
}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHasFinishedFlashAnimation:", 1);
}

void __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setSource:", 11);
  objc_msgSend(v2, "setEventLabel:", CFSTR("BInteractiveScreenshotGestureCommit"));

}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_9(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_10;
  v7[3] = &unk_1E8EAB0A0;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  objc_msgSend(a2, "setTransactionProvider:", v7);

  return 1;
}

SBInteractiveScreenshotCommitWorkspaceTransaction *__117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  SBInteractiveScreenshotCommitWorkspaceTransaction *v4;

  v3 = a2;
  v4 = -[SBInteractiveScreenshotCommitWorkspaceTransaction initWithTransitionRequest:gestureSessionID:]([SBInteractiveScreenshotCommitWorkspaceTransaction alloc], "initWithTransitionRequest:gestureSessionID:", v3, *(_QWORD *)(a1 + 32));

  -[SBInteractiveScreenshotCommitWorkspaceTransaction addObserver:](v4, "addObserver:", *(_QWORD *)(a1 + 40));
  -[SBInteractiveScreenshotCommitWorkspaceTransaction setInteractiveScreenshotCommitDelegate:](v4, "setInteractiveScreenshotCommitDelegate:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 64), v4);
  objc_msgSend(*(id *)(a1 + 40), "_performPendingCommitWorkspaceTransactionBlocksWithTransaction:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
  return v4;
}

- (void)interactiveScreenshotGestureRootViewControllerRequestsGestureRecognizerCancellation:(id)a3
{
  -[SBCornerPencilPanGestureRecognizer setEnabled:](self->_bottomLeftPencilGestureRecognizer, "setEnabled:", 0);
  -[SBCornerPencilPanGestureRecognizer setEnabled:](self->_bottomRightPencilGestureRecognizer, "setEnabled:", 0);
  -[SBCornerFingerPanGestureRecognizer setEnabled:](self->_bottomLeftFingerGestureRecognizer, "setEnabled:", 0);
  -[SBCornerFingerPanGestureRecognizer setEnabled:](self->_bottomRightFingerGestureRecognizer, "setEnabled:", 0);
  -[SBCornerPencilPanGestureRecognizer setEnabled:](self->_bottomLeftPencilGestureRecognizer, "setEnabled:", 1);
  -[SBCornerPencilPanGestureRecognizer setEnabled:](self->_bottomRightPencilGestureRecognizer, "setEnabled:", 1);
  -[SBCornerFingerPanGestureRecognizer setEnabled:](self->_bottomLeftFingerGestureRecognizer, "setEnabled:", 1);
  -[SBCornerFingerPanGestureRecognizer setEnabled:](self->_bottomRightFingerGestureRecognizer, "setEnabled:", 1);
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4
{
  double v5;

  if (a4)
  {
    BSContinuousMachTimeNow();
    self->_lastApplicationTouchTime = v5;
  }
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;

  v3 = a3;
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerGestureDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  v7 = v3;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appSwitcherDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "chamoisWindowingEnabled") ^ 1;

    v13 = objc_msgSend(v9, "corner");
  }
  else
  {
    v14 = objc_opt_class();
    v15 = v7;
    if (v14)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v17 = v16;

    v13 = objc_msgSend(v17, "corner");
    v12 = 2;
  }
  if (objc_msgSend(v5, "bottomLeftCornerGestureFeature"))
    v18 = 0;
  else
    v18 = (objc_msgSend(v5, "bottomLeftCornerGestureTouchTypes") & v12) != 0;
  if (objc_msgSend(v5, "bottomRightCornerGestureFeature"))
    v19 = 0;
  else
    v19 = (objc_msgSend(v5, "bottomRightCornerGestureTouchTypes") & v12) != 0;
  if (v13 != 8)
  {
    if (v13 == 4)
    {
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      {
        if (!v19)
          goto LABEL_24;
      }
      else if (!v18)
      {
        goto LABEL_24;
      }
      v20 = 1;
      goto LABEL_30;
    }
LABEL_24:
    v20 = 0;
    goto LABEL_30;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v20 = v18;
  else
    v20 = v19;
LABEL_30:

  return v20;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  char v8;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id WeakRetained;
  char v18;

  v6 = a3;
  v7 = a4;
  if (-[SBInteractiveScreenshotSettings isEnabled](self->_settings, "isEnabled")
    && !self->_isCapturingScreenshot
    && (self->_lastApplicationTouchTime == -1.79769313e308
     || (BSContinuousMachTimeNow(),
         v11 = v10 - self->_lastApplicationTouchTime,
         -[SBInteractiveScreenshotSettings applicationTouchDelayHysteresis](self->_settings, "applicationTouchDelayHysteresis"), v11 > v12)))
  {
    v13 = objc_opt_class();
    v14 = v6;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    if (v16 && !objc_msgSend(v16, "shouldReceiveTouch:", v7))
    {
      v8 = 0;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v18 = objc_msgSend(WeakRetained, "interactiveScreenshotGestureManagerShouldPreventGestureRecognition:", self);

      v8 = v18 ^ 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)handleRemoteTransientOverlayPresentationRequest:(id)a3 forSession:(id)a4
{
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (objc_msgSend(v5, "isScreenshotMarkup") && self->_hasInitiatedCommit)
  {
    objc_msgSend(v5, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __100__SBInteractiveScreenshotGestureManager_handleRemoteTransientOverlayPresentationRequest_forSession___block_invoke;
    v10[3] = &unk_1E8EB6200;
    v11 = v6;
    v7 = v6;
    -[SBInteractiveScreenshotGestureManager _performCommitWorkspaceTransactionBlock:](self, "_performCommitWorkspaceTransactionBlock:", v10);

    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __100__SBInteractiveScreenshotGestureManager_handleRemoteTransientOverlayPresentationRequest_forSession___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setScreenshotMarkupTransientOverlayViewController:", *(_QWORD *)(a1 + 32));
}

- (id)acquireDisableGestureAssertionWithReason:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSMutableSet *disableGestureAssertions;
  id v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __82__SBInteractiveScreenshotGestureManager_acquireDisableGestureAssertionWithReason___block_invoke;
  v15 = &unk_1E8E9E468;
  objc_copyWeak(&v16, &location);
  v6 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.SpringBoard.SBInteractiveScreenshotGestureManager.disableGesture"), v4, &v12);
  disableGestureAssertions = self->_disableGestureAssertions;
  if (!disableGestureAssertions)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99E20]);
    v9 = (NSMutableSet *)objc_msgSend(v8, "initWithCapacity:", 1, v12, v13, v14, v15);
    v10 = self->_disableGestureAssertions;
    self->_disableGestureAssertions = v9;

    disableGestureAssertions = self->_disableGestureAssertions;
  }
  -[NSMutableSet addObject:](disableGestureAssertions, "addObject:", v6, v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

void __82__SBInteractiveScreenshotGestureManager_acquireDisableGestureAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[10], "removeObject:", v6);
    if (!objc_msgSend(v4[10], "count"))
    {
      v5 = v4[10];
      v4[10] = 0;

    }
  }

}

- (void)_handleInteractiveScreenshotGesture:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  SBAsynchronousRenderingAssertion *v14;
  SBAsynchronousRenderingAssertion *asynchronousRenderingAssertion;
  id WeakRetained;
  NSUUID *v17;
  NSUUID *activeGestureSessionID;
  _SBInteractiveScreenshotGestureSession *v19;
  void *v20;
  SBInteractiveScreenshotGestureRootWindow *v21;
  uint64_t v22;
  void *v23;
  SBInteractiveScreenshotGestureRootWindow *v24;
  NSHashTable *weakReusableGestureRootWindows;
  void *v26;
  SBInteractiveScreenshotGestureRootViewController *v27;
  NSMutableDictionary *sessionIDToSession;
  NSMutableDictionary *v29;
  NSMutableDictionary *v30;
  uint64_t v31;
  _BOOL4 IsReduceMotionEnabled;
  uint64_t v33;
  int v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cornerGestureDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBInteractiveScreenshotGestureManager _touchTypeForGestureRecognizer:](self, "_touchTypeForGestureRecognizer:", v4);
  if ((objc_msgSend(v7, "cornerGestureRequiresEducation") & v8) != 0)
  {
    if (v5 == 1)
    {
      v9 = objc_msgSend(v4, "corner");
      SBLogSystemGesture();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v41 = 134217984;
        v42 = v9;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Interactive screenshot gesture recognized for corner %lu that requires education", (uint8_t *)&v41, 0xCu);
      }

      if (v9 == 8)
      {
        v11 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
        v12 = 9;
        v13 = 7;
      }
      else
      {
        if (v9 != 4)
        {
          v22 = 0;
LABEL_24:
          objc_msgSend((id)SBApp, "productivityGestureEducationController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "gestureActivatedForType:", v22);

          goto LABEL_45;
        }
        v11 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
        v12 = 7;
        v13 = 9;
      }
      if (v11)
        v22 = v13;
      else
        v22 = v12;
      goto LABEL_24;
    }
  }
  else
  {
    if (v5 == 1)
    {
      if (!self->_asynchronousRenderingAssertion
        && -[SBInteractiveScreenshotSettings shouldAsynchronouslyRender](self->_settings, "shouldAsynchronouslyRender"))
      {
        v14 = -[SBAsynchronousRenderingAssertion initWithReason:]([SBAsynchronousRenderingAssertion alloc], "initWithReason:", CFSTR("SBInteractiveScreenshotGestureManager"));
        asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
        self->_asynchronousRenderingAssertion = v14;

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (!self->_activeGestureSessionID
        && (objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"),
            v17 = (NSUUID *)objc_claimAutoreleasedReturnValue(),
            activeGestureSessionID = self->_activeGestureSessionID,
            self->_activeGestureSessionID = v17,
            activeGestureSessionID,
            !self->_activeGestureSessionID)
        || (-[NSMutableDictionary objectForKey:](self->_sessionIDToSession, "objectForKey:"),
            (v19 = (_SBInteractiveScreenshotGestureSession *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[NSHashTable anyObject](self->_weakReusableGestureRootWindows, "anyObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          -[NSHashTable removeObject:](self->_weakReusableGestureRootWindows, "removeObject:", v20);
          v21 = v20;
        }
        else
        {
          v21 = -[_UIRootWindow initWithScreen:]([SBInteractiveScreenshotGestureRootWindow alloc], "initWithScreen:", self->_screen);
        }
        v24 = v21;
        if (!-[NSHashTable count](self->_weakReusableGestureRootWindows, "count"))
        {
          weakReusableGestureRootWindows = self->_weakReusableGestureRootWindows;
          self->_weakReusableGestureRootWindows = 0;

        }
        -[SBInteractiveScreenshotGestureRootWindow rootViewController](v24, "rootViewController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          v27 = -[SBInteractiveScreenshotGestureRootViewController initWithWindowScene:]([SBInteractiveScreenshotGestureRootViewController alloc], "initWithWindowScene:", self->_windowScene);
          -[SBInteractiveScreenshotGestureRootViewController setDelegate:](v27, "setDelegate:", self);
          -[SBInteractiveScreenshotGestureRootWindow setRootViewController:](v24, "setRootViewController:", v27);

        }
        v19 = -[_SBInteractiveScreenshotGestureSession initWithSessionID:]([_SBInteractiveScreenshotGestureSession alloc], "initWithSessionID:", self->_activeGestureSessionID);
        -[_SBInteractiveScreenshotGestureSession setRootWindow:](v19, "setRootWindow:", v24);
        sessionIDToSession = self->_sessionIDToSession;
        if (!sessionIDToSession)
        {
          v29 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
          v30 = self->_sessionIDToSession;
          self->_sessionIDToSession = v29;

          sessionIDToSession = self->_sessionIDToSession;
        }
        -[NSMutableDictionary setObject:forKey:](sessionIDToSession, "setObject:forKey:", v19, self->_activeGestureSessionID);

      }
      v31 = -[NSMutableSet count](self->_disableGestureAssertions, "count");
      IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      v33 = 2;
      if (v31)
      {
        v33 = 3;
        v34 = IsReduceMotionEnabled;
      }
      else
      {
        v34 = 1;
      }
      if (IsReduceMotionEnabled)
        v35 = v33;
      else
        v35 = v31 != 0;
      -[_SBInteractiveScreenshotGestureSession rootViewController](v19, "rootViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setGestureStyle:", v35);

      -[_SBInteractiveScreenshotGestureSession rootWindow](v19, "rootWindow");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setHidden:", 0);
      objc_msgSend(v37, "layoutIfNeeded");
      v38 = -[SBInteractiveScreenshotSettings shouldPreheat](self->_settings, "shouldPreheat");
      if (v34 == 1 && v38)
      {
        -[SBInteractiveScreenshotGestureManager _screenshotPresentationOptions](self, "_screenshotPresentationOptions");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "interactiveScreenshotGestureManager:requestsScreenshotPreheatWithPresentationOptions:", self, v39);

      }
    }
    else if (self->_activeGestureSessionID)
    {
      -[NSMutableDictionary objectForKey:](self->_sessionIDToSession, "objectForKey:");
      v19 = (_SBInteractiveScreenshotGestureSession *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    -[_SBInteractiveScreenshotGestureSession rootViewController](v19, "rootViewController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handlePanGestureRecognizerAction:", v4);

  }
LABEL_45:

}

- (void)_invalidateSessionID:(id)a3
{
  NSUUID *activeGestureSessionID;
  id v5;
  NSUUID *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSHashTable *weakReusableGestureRootWindows;
  NSHashTable *v12;
  NSHashTable *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *sessionIDToSession;
  SBAsynchronousRenderingAssertion *asynchronousRenderingAssertion;
  id v18;

  if (a3)
  {
    activeGestureSessionID = self->_activeGestureSessionID;
    v5 = a3;
    if (-[NSUUID isEqual:](activeGestureSessionID, "isEqual:", v5))
    {
      v6 = self->_activeGestureSessionID;
      self->_activeGestureSessionID = 0;

    }
    -[NSMutableDictionary objectForKey:](self->_sessionIDToSession, "objectForKey:", v5);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_sessionIDToSession, "removeObjectForKey:", v5);

    objc_msgSend(v18, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    objc_msgSend(v18, "hostRootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    objc_msgSend(v18, "rootWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setHidden:", 1);
      objc_msgSend(v10, "setRootViewController:", 0);
      weakReusableGestureRootWindows = self->_weakReusableGestureRootWindows;
      if (!weakReusableGestureRootWindows)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v12 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v13 = self->_weakReusableGestureRootWindows;
        self->_weakReusableGestureRootWindows = v12;

        weakReusableGestureRootWindows = self->_weakReusableGestureRootWindows;
      }
      -[NSHashTable addObject:](weakReusableGestureRootWindows, "addObject:", v10);
    }
    objc_msgSend(v18, "hostWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "setHidden:", 1);
      objc_msgSend(v15, "setRootViewController:", 0);
    }
    if (!-[NSMutableDictionary count](self->_sessionIDToSession, "count"))
    {
      sessionIDToSession = self->_sessionIDToSession;
      self->_sessionIDToSession = 0;

      -[BSSimpleAssertion invalidate](self->_asynchronousRenderingAssertion, "invalidate");
      asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
      self->_asynchronousRenderingAssertion = 0;

    }
  }
}

- (void)_performCommitWorkspaceTransactionBlock:(id)a3
{
  id v4;
  SBInteractiveScreenshotCommitWorkspaceTransaction *commitTransaction;
  NSMutableArray *pendingCommitWorkspaceTransactionBlocks;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_hasInitiatedCommit)
  {
    commitTransaction = self->_commitTransaction;
    if (commitTransaction)
    {
      (*((void (**)(id, SBInteractiveScreenshotCommitWorkspaceTransaction *))v4 + 2))(v4, commitTransaction);
    }
    else
    {
      pendingCommitWorkspaceTransactionBlocks = self->_pendingCommitWorkspaceTransactionBlocks;
      if (!pendingCommitWorkspaceTransactionBlocks)
      {
        v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
        v8 = self->_pendingCommitWorkspaceTransactionBlocks;
        self->_pendingCommitWorkspaceTransactionBlocks = v7;

        pendingCommitWorkspaceTransactionBlocks = self->_pendingCommitWorkspaceTransactionBlocks;
      }
      v9 = (void *)MEMORY[0x1D17E5550](v10);
      -[NSMutableArray addObject:](pendingCommitWorkspaceTransactionBlocks, "addObject:", v9);

    }
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)_performPendingCommitWorkspaceTransactionBlocksWithTransaction:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *pendingCommitWorkspaceTransactionBlocks;
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
  v4 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_pendingCommitWorkspaceTransactionBlocks, "copy");
  pendingCommitWorkspaceTransactionBlocks = self->_pendingCommitWorkspaceTransactionBlocks;
  self->_pendingCommitWorkspaceTransactionBlocks = 0;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)_screenshotPresentationOptions
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D8C0D0]);
  objc_msgSend(v2, "setPresentationMode:", 2);
  return v2;
}

- (unint64_t)_touchTypeForGestureRecognizer:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    v8 = 1;
  }
  else
  {
    v9 = objc_opt_class();
    v10 = v5;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = (uint64_t)v10;
      else
        v9 = 0;
    }

    v8 = 2 * (v9 != 0);
  }

  return v8;
}

- (SBInteractiveScreenshotGestureManagerDelegate)delegate
{
  return (SBInteractiveScreenshotGestureManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_weakReusableGestureRootWindows, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sessionIDToSession, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_pendingCommitWorkspaceTransactionBlocks, 0);
  objc_storeStrong((id *)&self->_disableGestureAssertions, 0);
  objc_storeStrong((id *)&self->_commitTransactionDisableGestureAssertion, 0);
  objc_storeStrong((id *)&self->_commitTransaction, 0);
  objc_storeStrong((id *)&self->_bottomRightFingerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomRightPencilGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomLeftFingerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomLeftPencilGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_appInteractionEventSource, 0);
  objc_storeStrong((id *)&self->_activeGestureSessionID, 0);
}

@end
