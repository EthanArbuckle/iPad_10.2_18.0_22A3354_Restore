@implementation SBSystemNotesInteractionManager

- (SBSystemNotesInteractionManager)initWithWorkspace:(id)a3 systemGestureManager:(id)a4 systemPointerInteractionManager:(id)a5 dataSource:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  SBSystemNotesInteractionManager *v15;
  SBSystemNotesInteractionManager *v16;
  uint64_t v17;
  SBPIPControllerCoordinator *pipCoordinator;
  void *v19;
  void *v20;
  uint64_t v21;
  SBFZStackParticipant *zStackParticipant;
  uint64_t v23;
  SBSystemNotesSettings *pipSettings;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  SBSystemNotesInteractionManager *v34;
  id v35;
  void *v36;
  SBSystemNotesInteractionManager *v37;
  void *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  SBSystemNotesInteractionManager *v44;
  objc_super v45;
  _QWORD v46[5];

  v46[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v41 = a5;
  v14 = a6;
  v42 = a7;
  v45.receiver = self;
  v45.super_class = (Class)SBSystemNotesInteractionManager;
  v15 = -[SBSystemNotesInteractionManager init](&v45, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_systemGestureManager, a4);
    objc_storeStrong((id *)&v16->_systemPointerInteractionManager, a5);
    objc_storeStrong((id *)&v16->_dataSource, a6);
    objc_storeStrong((id *)&v16->_delegate, a7);
    objc_msgSend(v12, "pipCoordinator");
    v17 = objc_claimAutoreleasedReturnValue();
    pipCoordinator = v16->_pipCoordinator;
    v16->_pipCoordinator = (SBPIPControllerCoordinator *)v17;

    objc_msgSend((id)SBApp, "windowSceneManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "embeddedDisplayWindowScene");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "zStackResolver");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "acquireParticipantWithIdentifier:delegate:", 4, v16);
    v21 = objc_claimAutoreleasedReturnValue();
    zStackParticipant = v16->_zStackParticipant;
    v16->_zStackParticipant = (SBFZStackParticipant *)v21;

    -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](v16->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("init"));
    +[SBSystemNotesSettingsDomain rootSettings](SBSystemNotesSettingsDomain, "rootSettings");
    v23 = objc_claimAutoreleasedReturnValue();
    pipSettings = v16->_pipSettings;
    v16->_pipSettings = (SBSystemNotesSettings *)v23;

    -[SBSystemNotesInteractionManager _setupPencilGestureRecognizers](v16, "_setupPencilGestureRecognizers");
    -[SBSystemNotesInteractionManager _setupFingerGestureRecognizers](v16, "_setupFingerGestureRecognizers");
    -[SBSystemNotesInteractionManager _updateFailureRequirements](v16, "_updateFailureRequirements");
    -[SBSystemNotesInteractionManager _updateStashPadding](v16, "_updateStashPadding");
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cornerGestureDefaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = v12;
    v27 = v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bottomLeftCornerGestureFeature");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v28;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bottomLeftCornerGestureTouchTypes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v29;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bottomRightCornerGestureFeature");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v30;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "bottomRightCornerGestureTouchTypes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __126__SBSystemNotesInteractionManager_initWithWorkspace_systemGestureManager_systemPointerInteractionManager_dataSource_delegate___block_invoke;
    v43[3] = &unk_1E8E9DED8;
    v33 = v14;
    v34 = v16;
    v44 = v34;
    v35 = (id)objc_msgSend(v26, "observeDefaults:onQueue:withBlock:", v32, MEMORY[0x1E0C80D38], v43);

    v13 = v27;
    v12 = v40;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v34;
    v14 = v33;
    objc_msgSend(v36, "addObserver:selector:name:object:", v37, sel__springBoardBootCompleted_, CFSTR("SBBootCompleteNotification"), 0);

  }
  return v16;
}

uint64_t __126__SBSystemNotesInteractionManager_initWithWorkspace_systemGestureManager_systemPointerInteractionManager_dataSource_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStashPadding");
}

- (void)_springBoardBootCompleted:(id)a3
{
  -[SBSystemNotesInteractionManager _updateFingerGestureEnablement](self, "_updateFingerGestureEnablement", a3);
  -[SBSystemNotesInteractionManager _updateFailureRequirements](self, "_updateFailureRequirements");
}

- (void)peepAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;

  v3 = a3;
  SBLogSystemNotes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBSystemNotesInteractionManager peepAnimated:].cold.1();

  -[SBSystemNotesPositionHyperregionComposer setupForSwipesFromCorners:animated:](self->_positionRegionsComposer, "setupForSwipesFromCorners:animated:", -[SBSystemNotesInteractionManager _cornersForAllSwipes](self, "_cornersForAllSwipes"), v3);
  -[SBSystemNotesPositionHyperregionComposer setupForStandardBehavior](self->_positionRegionsComposer, "setupForStandardBehavior");
}

- (void)expandAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];

  v3 = a3;
  v5 = -[SBSystemNotesInteractionManagerDataSource currentPresentationModeForInteractionManager:](self->_dataSource, "currentPresentationModeForInteractionManager:", self);
  -[SBSystemNotesInteractionManagerDataSource presentedContainerViewControllerForInteractionManager:](self->_dataSource, "presentedContainerViewControllerForInteractionManager:", self);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 != -1 && v6 != 0)
  {
    -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsStartSuppressingKeyboardForReason:](self->_delegate, "interactionManager:requestsStartSuppressingKeyboardForReason:", self, CFSTR("SBSystemNotesKeyboardSuppressionExpandNotes"));
    objc_msgSend(v7, "interactionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBPIPContentViewLayoutMetrics systemNotesMetricsForPresentationMode:](SBPIPContentViewLayoutMetrics, "systemNotesMetricsForPresentationMode:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = SBSystemNotesDefaultWindowSize();
    if (v3)
      v12 = 2;
    else
      v12 = 0;
    objc_msgSend(v9, "setPlatformMetrics:contentSize:animationBehavior:", v10, v12, v11);

    -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsUpdatePresentationMode:](self->_delegate, "interactionManager:requestsUpdatePresentationMode:", self, 0);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__SBSystemNotesInteractionManager_expandAnimated___block_invoke;
    v14[3] = &unk_1E8E9DED8;
    v14[4] = self;
    objc_msgSend(v7, "performAfterInFlightAnimationsComplete:", v14);
    SBLogSystemNotes();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SBSystemNotesInteractionManager peepAnimated:].cold.1();

  }
}

uint64_t __50__SBSystemNotesInteractionManager_expandAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "interactionManager:requestsStopSuppressingKeyboardForReason:", *(_QWORD *)(a1 + 32), CFSTR("SBSystemNotesKeyboardSuppressionExpandNotes"));
}

- (void)collapseAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  _QWORD v13[5];

  v3 = a3;
  v5 = -[SBSystemNotesInteractionManagerDataSource currentPresentationModeForInteractionManager:](self->_dataSource, "currentPresentationModeForInteractionManager:", self);
  -[SBSystemNotesInteractionManagerDataSource presentedContainerViewControllerForInteractionManager:](self->_dataSource, "presentedContainerViewControllerForInteractionManager:", self);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 != -1 && v6 != 0)
  {
    -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsStartSuppressingKeyboardForReason:](self->_delegate, "interactionManager:requestsStartSuppressingKeyboardForReason:", self, CFSTR("SBSystemNotesKeyboardSuppressionDismiss"));
    objc_msgSend(v7, "interactionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBPIPContentViewLayoutMetrics systemNotesMetricsForPresentationMode:](SBPIPContentViewLayoutMetrics, "systemNotesMetricsForPresentationMode:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = SBSystemNotesThumbnailSize();
    if (v3)
      v12 = 2;
    else
      v12 = 0;
    objc_msgSend(v9, "setPlatformMetrics:contentSize:animationBehavior:", v10, v12, v11);

    -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsUpdatePresentationMode:](self->_delegate, "interactionManager:requestsUpdatePresentationMode:", self, 1);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__SBSystemNotesInteractionManager_collapseAnimated___block_invoke;
    v13[3] = &unk_1E8E9DED8;
    v13[4] = self;
    objc_msgSend(v7, "performAfterInFlightAnimationsComplete:", v13);
  }

}

uint64_t __52__SBSystemNotesInteractionManager_collapseAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "interactionManager:requestsStopSuppressingKeyboardForReason:", *(_QWORD *)(a1 + 32), CFSTR("SBSystemNotesKeyboardSuppressionDismiss"));
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  BSInvalidatable *edgeProtectStashAssertion;
  void *v17;
  _QWORD v18[5];
  id v19;
  void (**v20)(_QWORD);
  SEL v21;
  unsigned int v22;
  _QWORD v23[4];
  NSObject *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  unsigned int v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(_QWORD))a4;
  -[SBSystemNotesInteractionManagerDataSource presentedContainerViewControllerForInteractionManager:](self->_dataSource, "presentedContainerViewControllerForInteractionManager:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemNotesInteractionManagerDataSource presentedPIPContentViewControllerForInteractionManager:](self->_dataSource, "presentedPIPContentViewControllerForInteractionManager:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_edgeProtectState = 0;
  if ((objc_msgSend(v8, "isStashed") & 1) != 0 || !v4)
  {
    SBLogSystemNotes();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[SBSystemNotesInteractionManager dismissAnimated:completion:].cold.2();

    v7[2](v7);
    self->_cornerDismissState = 0;
    -[BSInvalidatable invalidate](self->_edgeProtectStashAssertion, "invalidate");
    edgeProtectStashAssertion = self->_edgeProtectStashAssertion;
    self->_edgeProtectStashAssertion = 0;

    SBLogSystemNotes();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[SBSystemNotesInteractionManager dismissAnimated:completion:].cold.1();
  }
  else if (v8 && v9)
  {
    -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsStartSuppressingKeyboardForReason:](self->_delegate, "interactionManager:requestsStartSuppressingKeyboardForReason:", self, CFSTR("SBSystemNotesKeyboardSuppressionDismiss"));
    self->_isDismissingNonInteractively = 1;
    v10 = self->_nonInteractiveDismissGenCount + 1;
    self->_nonInteractiveDismissGenCount = v10;
    SBLogSystemNotes();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      _SBFLoggingMethodProem();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 1024;
      v28 = v10;
      _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%u][Begin] animated dismiss", buf, 0x12u);

    }
    -[SBSystemNotesPositionHyperregionComposer setupForSwipesFromCorners:animated:](self->_positionRegionsComposer, "setupForSwipesFromCorners:animated:", -[SBSystemNotesInteractionManager _cornersForAllSwipes](self, "_cornersForAllSwipes"), 1);
    objc_msgSend(v8, "setInteractionsEnabled:", 0);
    v12 = (void *)MEMORY[0x1E0CEABB0];
    v13 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke;
    v23[3] = &unk_1E8E9DED8;
    v24 = v9;
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_2;
    v18[3] = &unk_1E8EC0398;
    v18[4] = self;
    v21 = a2;
    v22 = v10;
    v19 = v8;
    v20 = v7;
    objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 0, v23, v18, 0.5, 0.0);

    v14 = v24;
  }
  else if (v8)
  {
    if (v9)
      goto LABEL_13;
    SBLogSystemNotes();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBSystemNotesInteractionManager dismissAnimated:completion:].cold.4();
  }
  else
  {
    SBLogSystemNotes();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBSystemNotesInteractionManager dismissAnimated:completion:].cold.3();
  }

LABEL_13:
}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  objc_msgSend(v2, "setTransform:", &v4);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;
  int v8;

  SBLogSystemNotes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_2_cold_1();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_20;
  v6[3] = &unk_1E8EC0370;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_DWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v3, "performAfterInFlightAnimationsComplete:", v6);

}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  SBLogSystemNotes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_20_cold_2();

  v3 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "interactionManager:requestsStopSuppressingKeyboardForReason:", *(_QWORD *)(a1 + 32), CFSTR("SBSystemNotesKeyboardSuppressionDismiss"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 108) && *(_DWORD *)(a1 + 56) == *(_DWORD *)(v4 + 112))
  {
    *(_BYTE *)(v4 + 108) = 0;
    v4 = *v3;
  }
  objc_msgSend(*(id *)(v4 + 152), "invalidate");
  v5 = *(void **)(*v3 + 152);
  *(_QWORD *)(*v3 + 152) = 0;

  SBLogSystemNotes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_20_cold_1();

}

- (BOOL)canHandlePresentationRequests:(id *)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString **v8;
  uint64_t *v9;
  void *v10;
  void *v12;
  int v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (-[SBSystemNotesInteractionManager _isSystemNotesForegroundActive](self, "_isSystemNotesForegroundActive"))
  {
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInSetupMode");

    if (v5)
    {
      if (a3)
      {
        v6 = (void *)MEMORY[0x1E0CB35C8];
        v16 = *MEMORY[0x1E0CB2D50];
        v17 = CFSTR("cannot handle presentation as we're in buddy");
        v7 = (void *)MEMORY[0x1E0C99D80];
        v8 = &v17;
        v9 = &v16;
LABEL_7:
        objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("SBPIPSceneContentPresentationErrorDomain"), 7, v10);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isUILocked");

      if (!v13)
        return 1;
      if (a3)
      {
        v6 = (void *)MEMORY[0x1E0CB35C8];
        v14 = *MEMORY[0x1E0CB2D50];
        v15 = CFSTR("cannot handle presentation as we're UI locked");
        v7 = (void *)MEMORY[0x1E0C99D80];
        v8 = &v15;
        v9 = &v14;
        goto LABEL_7;
      }
    }
  }
  else if (a3)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("cannot handle presentation as we're currently obscured");
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = (const __CFString **)v19;
    v9 = &v18;
    goto LABEL_7;
  }
  return 0;
}

- (void)zStackParticipantDidChange:(id)a3
{
  if (!-[SBSystemNotesInteractionManager _isSystemNotesForegroundActive](self, "_isSystemNotesForegroundActive", a3))
  {
    -[SBSystemNotesInteractionManager _cancelGestureIfNecessary:reason:](self, "_cancelGestureIfNecessary:reason:", self->_leftFingerSystemCornerGestureRecognizer, CFSTR("canceling system notes gesture as zStack has marked us as not foreground active"));
    -[SBSystemNotesInteractionManager _cancelGestureIfNecessary:reason:](self, "_cancelGestureIfNecessary:reason:", self->_rightFingerSystemCornerGestureRecognizer, CFSTR("canceling system notes gesture as zStack has marked us as not foreground active"));
    -[SBSystemNotesInteractionManager _cancelGestureIfNecessary:reason:](self, "_cancelGestureIfNecessary:reason:", self->_leftPencilSystemCornerGestureRecognizer, CFSTR("canceling system notes gesture as zStack has marked us as not foreground active"));
    -[SBSystemNotesInteractionManager _cancelGestureIfNecessary:reason:](self, "_cancelGestureIfNecessary:reason:", self->_rightPencilSystemCornerGestureRecognizer, CFSTR("canceling system notes gesture as zStack has marked us as not foreground active"));
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  objc_msgSend(a4, "setActivationPolicyForParticipantsBelow:", 0);
}

- (BOOL)_isSystemNotesForegroundActive
{
  return -[SBFZStackParticipant activationState](self->_zStackParticipant, "activationState") == 0;
}

- (BOOL)initialStashStateForContentContainerAdapter:(id)a3
{
  return self->_edgeProtectState == 1;
}

- (void)contentContainerAdapter:(id)a3 willUpdateStashState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BSInvalidatable *edgeProtectStashAssertion;
  BSInvalidatable *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v9 = v6;
    -[SBSystemNotesPositionHyperregionComposer setupForStandardBehavior](self->_positionRegionsComposer, "setupForStandardBehavior");
LABEL_7:
    v6 = v9;
    goto LABEL_8;
  }
  edgeProtectStashAssertion = self->_edgeProtectStashAssertion;
  if (edgeProtectStashAssertion)
  {
    v9 = v6;
    ++self->_edgeProtectGenCount;
    if (self->_edgeProtectState == 2)
    {
      -[SBSystemNotesPositionHyperregionComposer setupForStandardBehavior](self->_positionRegionsComposer, "setupForStandardBehavior");
      edgeProtectStashAssertion = self->_edgeProtectStashAssertion;
    }
    self->_edgeProtectState = 0;
    -[BSInvalidatable invalidate](edgeProtectStashAssertion, "invalidate");
    v8 = self->_edgeProtectStashAssertion;
    self->_edgeProtectStashAssertion = 0;

    goto LABEL_7;
  }
LABEL_8:

}

- (void)contentContainerAdapterDidEndInteraction:(id)a3 targetWindowScene:(id)a4
{
  unint64_t cornerDismissState;
  void *v6;
  char v7;

  cornerDismissState = self->_cornerDismissState;
  if (-[SBSystemNotesInteractionManagerDataSource currentPresentationModeForInteractionManager:](self->_dataSource, "currentPresentationModeForInteractionManager:", self, a4) == 1)
  {
    -[SBSystemNotesInteractionManagerDataSource presentedContainerViewControllerForInteractionManager:](self->_dataSource, "presentedContainerViewControllerForInteractionManager:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isStashed");

    if ((v7 & 1) == 0 && cornerDismissState <= 1)
      goto LABEL_4;
  }
  else if (cornerDismissState < 2)
  {
LABEL_4:
    -[SBSystemNotesPositionHyperregionComposer setupForStandardBehavior](self->_positionRegionsComposer, "setupForStandardBehavior");
    return;
  }
  -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsNotesDismissalForSource:animated:](self->_delegate, "interactionManager:requestsNotesDismissalForSource:animated:", self, cornerDismissState > 1, cornerDismissState < 2);
}

- (void)contentContainerAdapterPanGestureDidEnd:(id)a3
{
  _BOOL4 panGestureIsSystemGesture;
  id v5;

  if (-[SBSystemNotesInteractionManagerDataSource currentPresentationModeForInteractionManager:](self->_dataSource, "currentPresentationModeForInteractionManager:", self) == 1)
  {
    -[SBSystemNotesInteractionManagerDataSource presentedContainerViewControllerForInteractionManager:](self->_dataSource, "presentedContainerViewControllerForInteractionManager:", self);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isStashed"))
    {

    }
    else
    {
      panGestureIsSystemGesture = self->_panGestureIsSystemGesture;

      if (panGestureIsSystemGesture)
        -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsNotesDismissalForSource:animated:](self->_delegate, "interactionManager:requestsNotesDismissalForSource:animated:", self, 2, 1);
    }
  }
}

- (void)contentContainerAdapter:(id)a3 willBeginInteractionWithGestureRecognizer:(id)a4
{
  SBCornerFingerPanGestureRecognizer *v6;
  BOOL v7;
  id v8;

  v8 = a3;
  v6 = (SBCornerFingerPanGestureRecognizer *)a4;
  ++self->_edgeProtectGenCount;
  if (self->_edgeProtectState == 2)
    -[SBSystemNotesPositionHyperregionComposer setupForStandardBehavior](self->_positionRegionsComposer, "setupForStandardBehavior");
  self->_edgeProtectState = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_initialInteractorPanPresentationMode = -[SBSystemNotesInteractionManager _presentationModeForGestureBegin](self, "_presentationModeForGestureBegin");
    v7 = self->_leftFingerSystemCornerGestureRecognizer == v6
      || self->_rightFingerSystemCornerGestureRecognizer == v6
      || (SBCornerFingerPanGestureRecognizer *)self->_leftPencilSystemCornerGestureRecognizer == v6
      || self->_rightPencilSystemCornerGestureRecognizer == (SBCornerPencilPanGestureRecognizer *)v6;
    self->_panGestureIsSystemGesture = v7;
  }

}

- (BOOL)contentContainerAdapterShouldUpdateUIForStashing:(id)a3
{
  return self->_initialInteractorPanPresentationMode != 1;
}

- (void)contentContainerAdapter:(id)a3 handleDestructionRequestForSceneHandle:(id)a4
{
  SBSystemNotesInteractionManagerDataSource *dataSource;
  id v6;
  void *v7;
  void *v8;
  int v9;

  dataSource = self->_dataSource;
  v6 = a4;
  -[SBSystemNotesInteractionManagerDataSource presentedContainerViewControllerForInteractionManager:](dataSource, "presentedContainerViewControllerForInteractionManager:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostedAppSceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
    -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsNotesDismissalForSource:animated:](self->_delegate, "interactionManager:requestsNotesDismissalForSource:animated:", self, 4, 1);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v5, "shouldReceiveTouch:", v6);
  else
    v7 = 1;

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  v5 = -[SBSystemNotesInteractionManager _cornerForGestureRecognizer:](self, "_cornerForGestureRecognizer:", v4);
  v6 = -[SBSystemNotesInteractionManager _touchTypeForGestureRecognizer:](self, "_touchTypeForGestureRecognizer:", v4);

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cornerGestureDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "bottomLeftCornerGestureFeature") == 1
    && (v6 & ~objc_msgSend(v8, "bottomLeftCornerGestureTouchTypes")) == 0;
  v10 = objc_msgSend(v8, "bottomRightCornerGestureFeature") == 1
     && (v6 & ~objc_msgSend(v8, "bottomRightCornerGestureTouchTypes")) == 0;
  if (v5 == 8)
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v11 = v9;
    else
      v11 = v10;
    if (!v11)
      goto LABEL_19;
    goto LABEL_16;
  }
  if (v5 != 4)
  {
LABEL_19:
    v15 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") != 1)
  {
    if (v9)
      goto LABEL_16;
    goto LABEL_19;
  }
  if (!v10)
    goto LABEL_19;
LABEL_16:
  -[SBSystemNotesInteractionManagerDataSource launchApplicationIdentityForInteractionManager:](self->_dataSource, "launchApplicationIdentityForInteractionManager:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "privacyPreflightController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "requiresPreflightForApplication:", v12);

  v15 = (v14 & 1) == 0
     && -[SBSystemNotesInteractionManager canHandlePresentationRequests:](self, "canHandlePresentationRequests:", 0);

LABEL_22:
  return v15;
}

- (unint64_t)_cornersForAllSwipes
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v3 = -[SBSystemNotesInteractionManager _cornersForTouchType:](self, "_cornersForTouchType:", 0);
  v4 = -[SBSystemNotesInteractionManager _cornersForTouchType:](self, "_cornersForTouchType:", 2) | v3;
  if (!v4)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cornerGestureDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "bottomLeftCornerGestureTouchTypes");
    v8 = objc_msgSend(v6, "bottomRightCornerGestureTouchTypes");
    v9 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v10 = 8;
    if (v9 == 1)
      v11 = 4;
    else
      v11 = 8;
    if (v9 != 1)
      v10 = 4;
    if (v7)
      v12 = 1;
    else
      v12 = v8 == 0;
    if (v12)
      v4 = v11;
    else
      v4 = v10;

  }
  return v4;
}

- (unint64_t)_cornersForTouchType:(int64_t)a3
{
  int v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a3)
    v3 = 2 * (a3 == 2);
  else
    v3 = 1;
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cornerGestureDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "bottomLeftCornerGestureFeature") != 1
    || (~objc_msgSend(v5, "bottomLeftCornerGestureTouchTypes") & v3) != 0)
  {
    v6 = 0;
  }
  else if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    v6 = 8;
  }
  else
  {
    v6 = 4;
  }
  if (objc_msgSend(v5, "bottomRightCornerGestureFeature") == 1
    && (~objc_msgSend(v5, "bottomRightCornerGestureTouchTypes") & v3) == 0)
  {
    v7 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v8 = 8;
    if (v7 == 1)
      v8 = 4;
    v6 |= v8;
  }

  return v6;
}

- (id)_gestureSettingsForRecognizer:(id)a3
{
  return -[SBSystemNotesSettings cornerSwipeMetricSettings](self->_pipSettings, "cornerSwipeMetricSettings", a3);
}

- (double)_panDistanceBeforeScalingForGestureRecognizer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[SBSystemNotesInteractionManager _gestureSettingsForRecognizer:](self, "_gestureSettingsForRecognizer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "panDistanceBeforeScaling");
  v5 = v4;

  return v5;
}

- (double)_cornerDistanceBeforeScalingForDismissGestureRecognizer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[SBSystemNotesInteractionManager _gestureSettingsForRecognizer:](self, "_gestureSettingsForRecognizer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cornerDistanceBeforeScalingForDismiss");
  v5 = v4;

  return v5;
}

- (double)_panInitialThumbnailScaleForGestureRecognizer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[SBSystemNotesInteractionManager _gestureSettingsForRecognizer:](self, "_gestureSettingsForRecognizer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "panInitialThumbnailScale");
  v5 = v4;

  return v5;
}

- (double)_panDistancePer1xScalingForGestureRecognizer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[SBSystemNotesInteractionManager _gestureSettingsForRecognizer:](self, "_gestureSettingsForRecognizer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "panDistancePer1xScaling");
  v5 = v4;

  return v5;
}

- (double)_scaleThresholdBeforeFullSizeForGestureRecognizer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[SBSystemNotesInteractionManager _gestureSettingsForRecognizer:](self, "_gestureSettingsForRecognizer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaleThresholdBeforeFullSize");
  v5 = v4;

  return v5;
}

- (double)_absoluteScaleForInteractiveSystemNotesGesture:(id)a3
{
  SBSystemGestureManager *systemGestureManager;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  systemGestureManager = self->_systemGestureManager;
  v5 = a3;
  -[SBSystemGestureManager windowForSystemGestures](systemGestureManager, "windowForSystemGestures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[SBSystemNotesInteractionManager _orientedLocationForReferenceLocation:](self, "_orientedLocationForReferenceLocation:", v8, v10);
  -[SBSystemNotesInteractionManager _pointForGestureCorner:](self, "_pointForGestureCorner:", -[SBSystemNotesInteractionManager _cornerForGestureRecognizer:](self, "_cornerForGestureRecognizer:", v5));
  UIDistanceBetweenPoints();
  v12 = v11;
  -[SBSystemNotesInteractionManager _panDistanceBeforeScalingForGestureRecognizer:](self, "_panDistanceBeforeScalingForGestureRecognizer:", v5);
  v14 = v12 - v13;
  if (v14 >= 0.0)
    v15 = v14;
  else
    v15 = 0.0;
  -[SBSystemNotesInteractionManager _panDistancePer1xScalingForGestureRecognizer:](self, "_panDistancePer1xScalingForGestureRecognizer:", v5);
  v17 = v15 / v16;
  -[SBSystemNotesInteractionManager _panInitialThumbnailScaleForGestureRecognizer:](self, "_panInitialThumbnailScaleForGestureRecognizer:", v5);
  v19 = v18;

  return v19 + v17;
}

- (double)_absoluteScaleThresholdBeforeFullSizeForGestureRecognizer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  v5 = SBSystemNotesDefaultWindowSize();
  v6 = v5 / SBSystemNotesThumbnailSize();
  -[SBSystemNotesInteractionManager _scaleThresholdBeforeFullSizeForGestureRecognizer:](self, "_scaleThresholdBeforeFullSizeForGestureRecognizer:", v4);
  v8 = v7;

  return v8 * v6;
}

- (double)_flickVelocityThresholdForGestureRecognizer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[SBSystemNotesInteractionManager _gestureSettingsForRecognizer:](self, "_gestureSettingsForRecognizer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flickVelocityThreshold");
  v5 = v4;

  return v5;
}

- (void)_setupPencilGestureRecognizers
{
  SBCornerPencilPanGestureRecognizer *v3;
  SBCornerPencilPanGestureRecognizer *leftPencilSystemCornerGestureRecognizer;
  SBCornerPencilPanGestureRecognizer *v5;
  SBCornerPencilPanGestureRecognizer *rightPencilSystemCornerGestureRecognizer;
  id v7;

  -[SBSystemNotesSettings pencilSwipeGestureTuningSettings](self->_pipSettings, "pencilSwipeGestureTuningSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SBCornerPencilPanGestureRecognizer interactiveCornerPanGestureRecognizerWithSettings:corner:target:action:](SBCornerPencilPanGestureRecognizer, "interactiveCornerPanGestureRecognizerWithSettings:corner:target:action:", v7, 4, self, sel__handleInteractiveSystemNotesGesture_);
  v3 = (SBCornerPencilPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  leftPencilSystemCornerGestureRecognizer = self->_leftPencilSystemCornerGestureRecognizer;
  self->_leftPencilSystemCornerGestureRecognizer = v3;

  -[SBCornerPencilPanGestureRecognizer setDelegate:](self->_leftPencilSystemCornerGestureRecognizer, "setDelegate:", self);
  -[SBCornerPencilPanGestureRecognizer setName:](self->_leftPencilSystemCornerGestureRecognizer, "setName:", CFSTR("SBSystemNotesManager.pencil.corner.left"));
  -[SBSystemGestureManager addGestureRecognizer:withType:](self->_systemGestureManager, "addGestureRecognizer:withType:", self->_leftPencilSystemCornerGestureRecognizer, 117);
  +[SBCornerPencilPanGestureRecognizer interactiveCornerPanGestureRecognizerWithSettings:corner:target:action:](SBCornerPencilPanGestureRecognizer, "interactiveCornerPanGestureRecognizerWithSettings:corner:target:action:", v7, 8, self, sel__handleInteractiveSystemNotesGesture_);
  v5 = (SBCornerPencilPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  rightPencilSystemCornerGestureRecognizer = self->_rightPencilSystemCornerGestureRecognizer;
  self->_rightPencilSystemCornerGestureRecognizer = v5;

  -[SBCornerPencilPanGestureRecognizer setDelegate:](self->_rightPencilSystemCornerGestureRecognizer, "setDelegate:", self);
  -[SBCornerPencilPanGestureRecognizer setName:](self->_rightPencilSystemCornerGestureRecognizer, "setName:", CFSTR("SBSystemNotesManager.pencil.corner.right"));
  -[SBSystemGestureManager addGestureRecognizer:withType:](self->_systemGestureManager, "addGestureRecognizer:withType:", self->_rightPencilSystemCornerGestureRecognizer, 118);

}

- (void)_setupFingerGestureRecognizers
{
  void *v3;
  SBCornerFingerGestureClassifier *v4;
  SBCornerFingerPanGestureRecognizer *v5;
  SBCornerFingerPanGestureRecognizer *leftFingerSystemCornerGestureRecognizer;
  SBCornerFingerGestureClassifier *v7;
  SBCornerFingerPanGestureRecognizer *v8;
  SBCornerFingerPanGestureRecognizer *rightFingerSystemCornerGestureRecognizer;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[SBSystemNotesSettings fingerSwipeGestureTuningSettings](self->_pipSettings, "fingerSwipeGestureTuningSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBCornerFingerGestureClassifier initWithSettings:]([SBCornerFingerGestureClassifier alloc], "initWithSettings:", v3);
  v5 = -[SBCornerFingerPanGestureRecognizer initWithTarget:action:corner:classifier:]([SBCornerFingerPanGestureRecognizer alloc], "initWithTarget:action:corner:classifier:", self, sel__handleInteractiveSystemNotesGesture_, 4, v4);
  leftFingerSystemCornerGestureRecognizer = self->_leftFingerSystemCornerGestureRecognizer;
  self->_leftFingerSystemCornerGestureRecognizer = v5;

  -[SBCornerFingerPanGestureRecognizer setDelegate:](self->_leftFingerSystemCornerGestureRecognizer, "setDelegate:", self);
  -[SBCornerFingerPanGestureRecognizer setName:](self->_leftFingerSystemCornerGestureRecognizer, "setName:", CFSTR("SBSystemNotesManager.finger.corner.left"));
  v7 = -[SBCornerFingerGestureClassifier initWithSettings:]([SBCornerFingerGestureClassifier alloc], "initWithSettings:", v3);
  v8 = -[SBCornerFingerPanGestureRecognizer initWithTarget:action:corner:classifier:]([SBCornerFingerPanGestureRecognizer alloc], "initWithTarget:action:corner:classifier:", self, sel__handleInteractiveSystemNotesGesture_, 8, v7);
  rightFingerSystemCornerGestureRecognizer = self->_rightFingerSystemCornerGestureRecognizer;
  self->_rightFingerSystemCornerGestureRecognizer = v8;

  -[SBCornerFingerPanGestureRecognizer setDelegate:](self->_rightFingerSystemCornerGestureRecognizer, "setDelegate:", self);
  -[SBCornerFingerPanGestureRecognizer setName:](self->_rightFingerSystemCornerGestureRecognizer, "setName:", CFSTR("SBSystemNotesManager.finger.corner.right"));
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appSwitcherDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisWindowingEnabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__SBSystemNotesInteractionManager__setupFingerGestureRecognizers__block_invoke;
  v15[3] = &unk_1E8E9DED8;
  v15[4] = self;
  v14 = (id)objc_msgSend(v11, "observeDefaults:onQueue:withBlock:", v13, MEMORY[0x1E0C80D38], v15);

  -[SBSystemNotesInteractionManager _updateFingerGestureEnablement](self, "_updateFingerGestureEnablement");
}

uint64_t __65__SBSystemNotesInteractionManager__setupFingerGestureRecognizers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFingerGestureEnablement");
}

- (void)_updateFingerGestureEnablement
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "embeddedDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switcherController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v9, "windowManagementStyle");
  -[SBCornerFingerPanGestureRecognizer view](self->_rightFingerSystemCornerGestureRecognizer, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == 2)
  {
    if (v6)
      -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:", self->_rightFingerSystemCornerGestureRecognizer);
    -[SBCornerFingerPanGestureRecognizer view](self->_leftFingerSystemCornerGestureRecognizer, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:", self->_leftFingerSystemCornerGestureRecognizer);
  }
  else
  {
    if (!v6)
      -[SBSystemGestureManager addGestureRecognizer:withType:](self->_systemGestureManager, "addGestureRecognizer:withType:", self->_rightFingerSystemCornerGestureRecognizer, 120);
    -[SBCornerFingerPanGestureRecognizer view](self->_leftFingerSystemCornerGestureRecognizer, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      -[SBSystemGestureManager addGestureRecognizer:withType:](self->_systemGestureManager, "addGestureRecognizer:withType:", self->_leftFingerSystemCornerGestureRecognizer, 119);
  }

}

- (void)_updateStashPadding
{
  unint64_t v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = -[SBSystemNotesInteractionManager _cornersForTouchType:](self, "_cornersForTouchType:", 0);
  v4 = -[SBSystemNotesInteractionManager _cornersForTouchType:](self, "_cornersForTouchType:", 2);
  v5 = *MEMORY[0x1E0CEB4B0];
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[SBSystemNotesSettings fingerSwipeGestureTuningSettings](self->_pipSettings, "fingerSwipeGestureTuningSettings");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "maximumActiveDistance:", 1);
  v10 = v9;
  objc_msgSend(v22, "maximumActiveDistance:", 0);
  v12 = ceil(fmax(v10, v11) * SBMainScreenPointsPerMillimeter());
  -[SBSystemNotesSettings pencilSwipeGestureTuningSettings](self->_pipSettings, "pencilSwipeGestureTuningSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cornerVerticalEdgeLength");
  v15 = v14;

  v16 = fmax(v15, v12);
  if (v3)
    v17 = v12;
  else
    v17 = v8;
  if (!v3)
    v16 = v15;
  if (v4)
    v18 = v16;
  else
    v18 = v17;
  objc_msgSend((id)SBApp, "windowSceneManager", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "embeddedDisplayWindowScene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pictureInPictureManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "applyStashedPictureInPicturePadding:forPIPSource:", 1, v5, v6, v18, v7);
}

- (void)_cancelGestureIfNecessary:(id)a3 reason:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)(objc_msgSend(v4, "state") - 1) <= 1)
  {
    SBLogSystemNotes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(v4, "setState:", 4);
  }

}

- (void)_updateFailureRequirements
{
  void (**v3)(_QWORD, _QWORD);
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SBSystemNotesInteractionManager__updateFailureRequirements__block_invoke;
  v4[3] = &unk_1E8EC03C0;
  v4[4] = self;
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v4, a2);
  ((void (**)(_QWORD, SBCornerFingerPanGestureRecognizer *))v3)[2](v3, self->_leftFingerSystemCornerGestureRecognizer);
  ((void (**)(_QWORD, SBCornerFingerPanGestureRecognizer *))v3)[2](v3, self->_rightFingerSystemCornerGestureRecognizer);

}

void __61__SBSystemNotesInteractionManager__updateFailureRequirements__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v4 = a2;
  SBCornerFingerGestureUpdateFailureRequirements(v4, v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 117, v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "gestureRecognizerOfType:shouldBeRequiredToFailByGestureRecognizer:", 118, v4);

}

- (CGPoint)_orientedLocationForReferenceLocation:(CGPoint)a3
{
  void *v4;
  double v5;
  double v6;
  CGPoint result;

  objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  -[SBSystemGestureManager windowForSystemGestures](self->_systemGestureManager, "windowForSystemGestures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");

  _UIWindowConvertPointFromOrientationToOrientation();
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)_pointForGestureCorner:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  -[SBSystemGestureManager windowForSystemGestures](self->_systemGestureManager, "windowForSystemGestures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");

  _UIWindowConvertRectFromOrientationToOrientation();
  v8 = v7;
  if (a3 == 8 || (v9 = 0.0, a3 == 2))
    v9 = v6;
  result.y = v8;
  result.x = v9;
  return result;
}

- (void)_handleInteractiveSystemNotesGesture:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t edgeProtectState;
  uint64_t v15;
  void *v16;
  int v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  v6 = -[SBSystemNotesInteractionManager _touchTypeForGestureRecognizer:](self, "_touchTypeForGestureRecognizer:", v4);
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cornerGestureDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "cornerGestureRequiresEducation") & v6) != 0)
  {
    if (v5 == 1)
    {
      v9 = -[SBSystemNotesInteractionManager _cornerForGestureRecognizer:](self, "_cornerForGestureRecognizer:", v4);
      SBLogSystemGesture();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 134217984;
        v18 = v9;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "System notes gesture recognized for corner %lu that requires education", (uint8_t *)&v17, 0xCu);
      }

      if (v9 == 8)
      {
        v11 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
        v12 = 10;
        v13 = 8;
      }
      else
      {
        if (v9 != 4)
        {
          v15 = 0;
LABEL_20:
          objc_msgSend((id)SBApp, "productivityGestureEducationController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "gestureActivatedForType:", v15);

          goto LABEL_22;
        }
        v11 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
        v12 = 8;
        v13 = 10;
      }
      if (v11)
        v15 = v13;
      else
        v15 = v12;
      goto LABEL_20;
    }
  }
  else
  {
    edgeProtectState = self->_edgeProtectState;
    if (edgeProtectState != 3)
    {
      if (v5 == 1)
      {
        self->_initialInteractorPanPresentationMode = -[SBSystemNotesInteractionManager _presentationModeForGestureBegin](self, "_presentationModeForGestureBegin");
        edgeProtectState = self->_edgeProtectState;
        if (!edgeProtectState)
        {
          edgeProtectState = -[SBSystemNotesInteractionManager _shouldEdgeProtectGestureRecognizer:](self, "_shouldEdgeProtectGestureRecognizer:", v4);
          self->_edgeProtectState = edgeProtectState;
        }
      }
      if (!self->_initialInteractorPanPresentationMode || edgeProtectState)
        -[SBSystemNotesInteractionManager _handleNonInteractiveSwipeInGesture:](self, "_handleNonInteractiveSwipeInGesture:", v4);
      else
        -[SBSystemNotesInteractionManager _handleInteractiveSwipeInGesture:](self, "_handleInteractiveSwipeInGesture:", v4);
    }
  }
LABEL_22:

}

- (void)_handleInteractiveSwipeInGesture:(id)a3
{
  SBCornerFingerPanGestureRecognizer *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  SBSystemNotesPositionConfiguration *v16;
  uint64_t v17;
  SBSystemNotesPositionConfiguration *v18;
  SBSystemNotesContentPresentationContext *v19;
  void *v20;
  SBSystemNotesContentPresentationContext *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (SBCornerFingerPanGestureRecognizer *)a3;
  -[SBSystemNotesInteractionManagerDataSource presentedPIPContentViewControllerForInteractionManager:](self->_dataSource, "presentedPIPContentViewControllerForInteractionManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemNotesInteractionManagerDataSource presentedContainerViewControllerForInteractionManager:](self->_dataSource, "presentedContainerViewControllerForInteractionManager:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBSystemNotesInteractionManagerDataSource currentPresentationModeForInteractionManager:](self->_dataSource, "currentPresentationModeForInteractionManager:", self);
  v8 = -[SBCornerFingerPanGestureRecognizer state](v4, "state");
  if (v8 == 2)
    goto LABEL_2;
  v10 = v8;
  SBLogSystemNotes();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SBSystemGestureRecognizerStateDescription(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v14;
    v28 = 2114;
    v29 = v15;
    _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture] state: %{public}@", (uint8_t *)&v26, 0x16u);

  }
  if (v10 - 4 < 2)
  {
    -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsStopSuppressingKeyboardForReason:](self->_delegate, "interactionManager:requestsStopSuppressingKeyboardForReason:", self, CFSTR("SBSystemNotesKeyboardSuppressionGesture"));
    objc_msgSend(v6, "interactionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleExternalPanGesture:", v4);

    -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsNotesDismissalForSource:animated:](self->_delegate, "interactionManager:requestsNotesDismissalForSource:animated:", self, 2, 1);
    goto LABEL_27;
  }
  if (v10 == 3)
  {
    -[SBSystemNotesPositionHyperregionComposer setupForInteractiveCornerGestureEnd](self->_positionRegionsComposer, "setupForInteractiveCornerGestureEnd");
    -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsStopSuppressingKeyboardForReason:](self->_delegate, "interactionManager:requestsStopSuppressingKeyboardForReason:", self, CFSTR("SBSystemNotesKeyboardSuppressionGesture"));
LABEL_2:
    objc_msgSend(v6, "interactionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleExternalPanGesture:", v4);

    goto LABEL_27;
  }
  if (v10 == 1)
  {
    if (v7 != 1)
    {
      if (self->_leftFingerSystemCornerGestureRecognizer == v4)
      {
        v12 = 5;
      }
      else if (self->_rightFingerSystemCornerGestureRecognizer == v4)
      {
        v12 = 5;
      }
      else
      {
        v12 = 4;
      }
      v16 = [SBSystemNotesPositionConfiguration alloc];
      if (self->_leftFingerSystemCornerGestureRecognizer == v4)
      {
        v17 = 1;
      }
      else if ((SBCornerFingerPanGestureRecognizer *)self->_leftPencilSystemCornerGestureRecognizer == v4)
      {
        v17 = 1;
      }
      else
      {
        v17 = 2;
      }
      v18 = -[SBSystemNotesPositionConfiguration initWithEdgeProtectEnabled:position:](v16, "initWithEdgeProtectEnabled:position:", 0, v17);
      v19 = [SBSystemNotesContentPresentationContext alloc];
      -[SBSystemNotesInteractionManagerDataSource launchBundleIDForInteractionManager:](self->_dataSource, "launchBundleIDForInteractionManager:", self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SBSystemNotesContentPresentationContext initWithLaunchBundleID:presentationMode:source:positionConfiguration:](v19, "initWithLaunchBundleID:presentationMode:source:positionConfiguration:", v20, 1, v12, v18);

      if (!-[SBSystemNotesInteractionManagerDelegate interactionManager:requestsPresentationWithContext:](self->_delegate, "interactionManager:requestsPresentationWithContext:", self, v21))
      {
        -[SBCornerFingerPanGestureRecognizer setState:](v4, "setState:", 4);

        goto LABEL_27;
      }
      SBLogSystemNotes();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[SBSystemNotesInteractionManager _handleInteractiveSwipeInGesture:].cold.1();

      -[SBSystemNotesInteractionManagerDataSource presentedContainerViewControllerForInteractionManager:](self->_dataSource, "presentedContainerViewControllerForInteractionManager:", self);
      v23 = objc_claimAutoreleasedReturnValue();

      -[SBSystemNotesInteractionManagerDataSource presentedPIPContentViewControllerForInteractionManager:](self->_dataSource, "presentedPIPContentViewControllerForInteractionManager:", self);
      v24 = objc_claimAutoreleasedReturnValue();

      -[SBSystemNotesInteractionManagerDataSource currentPresentationModeForInteractionManager:](self->_dataSource, "currentPresentationModeForInteractionManager:", self);
      v6 = (void *)v23;
      v5 = (void *)v24;
    }
    objc_msgSend(v6, "interactionController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleExternalPanGesture:", v4);

    -[SBSystemNotesPositionHyperregionComposer setupForInteractiveCornerGesture](self->_positionRegionsComposer, "setupForInteractiveCornerGesture");
    -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsStartSuppressingKeyboardForReason:](self->_delegate, "interactionManager:requestsStartSuppressingKeyboardForReason:", self, CFSTR("SBSystemNotesKeyboardSuppressionGesture"));
  }
LABEL_27:

}

- (void)_handleNonInteractiveSwipeInGesture:(id)a3
{
  SBCornerFingerPanGestureRecognizer *v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  SBCornerFingerPanGestureRecognizer *leftFingerSystemCornerGestureRecognizer;
  uint64_t v12;
  uint64_t v13;
  SBSystemNotesPositionConfiguration *v14;
  void *v15;
  void *v16;
  SBSystemNotesContentPresentationContext *v17;
  void *v18;
  SBSystemNotesContentPresentationContext *v19;
  BSInvalidatable *v20;
  BSInvalidatable *edgeProtectStashAssertion;
  unsigned int v22;
  unint64_t edgeProtectState;
  dispatch_time_t v24;
  BSInvalidatable *v25;
  _QWORD v26[5];
  unsigned int v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (SBCornerFingerPanGestureRecognizer *)a3;
  v5 = -[SBCornerFingerPanGestureRecognizer state](v4, "state");
  if (v5 != 2)
  {
    v6 = v5;
    SBLogSystemNotes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      _SBFLoggingMethodProem();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SBSystemGestureRecognizerStateDescription(v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      v30 = 2114;
      v31 = v16;
      _os_log_debug_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture] state: %{public}@", buf, 0x16u);

    }
    if (v6 == 3)
    {
      -[SBSystemNotesInteractionManager _absoluteScaleForInteractiveSystemNotesGesture:](self, "_absoluteScaleForInteractiveSystemNotesGesture:", v4);
      v9 = v8;
      -[SBSystemNotesInteractionManager _absoluteScaleThresholdBeforeFullSizeForGestureRecognizer:](self, "_absoluteScaleThresholdBeforeFullSizeForGestureRecognizer:", v4);
      if (v9 > v10
        || -[SBSystemNotesInteractionManager _panRecognizerOverFlickThreshold:](self, "_panRecognizerOverFlickThreshold:", v4))
      {
        leftFingerSystemCornerGestureRecognizer = self->_leftFingerSystemCornerGestureRecognizer;
        if (leftFingerSystemCornerGestureRecognizer == v4)
        {
          v12 = 5;
        }
        else if (self->_rightFingerSystemCornerGestureRecognizer == v4)
        {
          v12 = 5;
        }
        else
        {
          v12 = 4;
        }
        if (self->_edgeProtectState)
        {
          if (self->_rightFingerSystemCornerGestureRecognizer != v4
            && (SBCornerFingerPanGestureRecognizer *)self->_rightPencilSystemCornerGestureRecognizer != v4
            && (leftFingerSystemCornerGestureRecognizer == v4
             || (SBCornerFingerPanGestureRecognizer *)self->_leftPencilSystemCornerGestureRecognizer == v4))
          {
            v13 = 1;
          }
          else
          {
            v13 = 2;
          }
          v14 = -[SBSystemNotesPositionConfiguration initWithEdgeProtectEnabled:position:]([SBSystemNotesPositionConfiguration alloc], "initWithEdgeProtectEnabled:position:", 1, v13);
        }
        else
        {
          v14 = 0;
        }
        v17 = [SBSystemNotesContentPresentationContext alloc];
        -[SBSystemNotesInteractionManagerDataSource launchBundleIDForInteractionManager:](self->_dataSource, "launchBundleIDForInteractionManager:", self);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[SBSystemNotesContentPresentationContext initWithLaunchBundleID:presentationMode:source:positionConfiguration:](v17, "initWithLaunchBundleID:presentationMode:source:positionConfiguration:", v18, 0, v12, v14);

        if (self->_edgeProtectState == 1)
        {
          -[SBSystemNotesInteractionManagerDelegate interactionManager:requestsStashAssertionForReason:](self->_delegate, "interactionManager:requestsStashAssertionForReason:", self, CFSTR("edgelord"));
          v20 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
          edgeProtectStashAssertion = self->_edgeProtectStashAssertion;
          self->_edgeProtectStashAssertion = v20;

        }
        if (-[SBSystemNotesInteractionManagerDelegate interactionManager:requestsPresentationWithContext:](self->_delegate, "interactionManager:requestsPresentationWithContext:", self, v19))
        {
          v22 = self->_edgeProtectGenCount + 1;
          self->_edgeProtectGenCount = v22;
          edgeProtectState = self->_edgeProtectState;
          if (edgeProtectState)
          {
            if (edgeProtectState == 1)
            {
              self->_edgeProtectState = 2;
              v24 = dispatch_time(0, 2000000000);
              v26[0] = MEMORY[0x1E0C809B0];
              v26[1] = 3221225472;
              v26[2] = __71__SBSystemNotesInteractionManager__handleNonInteractiveSwipeInGesture___block_invoke;
              v26[3] = &unk_1E8EA1BB8;
              v27 = v22;
              v26[4] = self;
              dispatch_after(v24, MEMORY[0x1E0C80D38], v26);
              -[SBSystemNotesPositionHyperregionComposer setupForStandardBehavior](self->_positionRegionsComposer, "setupForStandardBehavior");
              -[SBSystemNotesPositionHyperregionComposer setupForEdgeProtectCornerSwipe](self->_positionRegionsComposer, "setupForEdgeProtectCornerSwipe");
            }
          }
          else
          {
            -[SBSystemNotesPositionHyperregionComposer setupForSwipesFromCorners:animated:](self->_positionRegionsComposer, "setupForSwipesFromCorners:animated:", -[SBSystemNotesInteractionManager _cornersForAllSwipes](self, "_cornersForAllSwipes"), 0);
            -[SBSystemNotesPositionHyperregionComposer setupForStandardBehavior](self->_positionRegionsComposer, "setupForStandardBehavior");
          }
        }
        else
        {
          self->_edgeProtectState = 0;
          -[BSInvalidatable invalidate](self->_edgeProtectStashAssertion, "invalidate");
          v25 = self->_edgeProtectStashAssertion;
          self->_edgeProtectStashAssertion = 0;

        }
      }
    }
  }

}

uint64_t __71__SBSystemNotesInteractionManager__handleNonInteractiveSwipeInGesture___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(result + 40) == *(_DWORD *)(v1 + 144) && *(_QWORD *)(v1 + 136) == 2)
  {
    *(_QWORD *)(v1 + 136) = 3;
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 8), "interactionManager:requestsNotesDismissalForSource:animated:", *(_QWORD *)(result + 32), 3, 1);
  }
  return result;
}

- (int64_t)_presentationModeForGestureBegin
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  NSObject *v6;
  void *v8;
  unint64_t cornerDismissState;
  _BOOL4 isDismissingNonInteractively;
  int v11;
  void *v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[SBSystemNotesInteractionManagerDataSource currentPresentationModeForInteractionManager:](self->_dataSource, "currentPresentationModeForInteractionManager:", self);
  v4 = v3;
  if (v3 == -1 || self->_cornerDismissState > 1 || (v5 = v3, self->_isDismissingNonInteractively))
    v5 = 1;
  SBLogSystemNotes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    cornerDismissState = self->_cornerDismissState;
    isDismissingNonInteractively = self->_isDismissingNonInteractively;
    v11 = 138544386;
    v12 = v8;
    v13 = 2048;
    v14 = v5;
    v15 = 2048;
    v16 = v4;
    v17 = 2048;
    v18 = cornerDismissState;
    v19 = 1024;
    v20 = isDismissingNonInteractively;
    _os_log_debug_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture] result: %lu {currentPresentationMode: %lu; cornerDismissState: %lu; isDismissingNonInteractively: %{BOOL}u}",
      (uint8_t *)&v11,
      0x30u);

  }
  return v5;
}

- (BOOL)_shouldEdgeProtectGestureRecognizer:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  if (-[SBSystemNotesInteractionManagerDataSource currentPresentationModeForInteractionManager:](self->_dataSource, "currentPresentationModeForInteractionManager:", self) == -1)
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "embeddedDisplayWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "switcherController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_opt_class();
    v10 = v4;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    objc_msgSend(v8, "layoutStatePrimaryElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "workspaceEntity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "applicationSceneEntity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sceneHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "screenEdgesDeferringSystemGestures");

    v18 = objc_msgSend(v12, "edges");
    v5 = (v18 & v17) != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return 0;
}

- (id)debugName
{
  return CFSTR("System Notes");
}

- (id)layoutSettings
{
  return (id)-[SBSystemNotesInteractionManagerDataSource currentContentViewLayoutSettingsForInteractionManager:](self->_dataSource, "currentContentViewLayoutSettingsForInteractionManager:", self);
}

- (id)defaultPositionHyperregionComposers
{
  SBSystemNotesPositionHyperregionComposer *positionRegionsComposer;
  SBPIPDefaultPositionHyperregionComposer *v4;
  SBSystemNotesPositionHyperregionComposer *v5;
  SBSystemNotesPositionHyperregionComposer *v6;
  BOOL v7;
  unint64_t edgeProtectState;
  SBSystemNotesPositionHyperregionComposer *v9;
  SBSystemNotesPositionHyperregionComposer *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[SBSystemNotesPositionHyperregionComposer invalidate](self->_positionRegionsComposer, "invalidate");
  positionRegionsComposer = self->_positionRegionsComposer;
  self->_positionRegionsComposer = 0;

  v4 = objc_alloc_init(SBPIPDefaultPositionHyperregionComposer);
  v5 = objc_alloc_init(SBSystemNotesPositionHyperregionComposer);
  v6 = self->_positionRegionsComposer;
  self->_positionRegionsComposer = v5;

  if (-[SBSystemNotesInteractionManager _cornersForTouchType:](self, "_cornersForTouchType:", 0))
    v7 = 0;
  else
    v7 = -[SBSystemNotesInteractionManager _cornersForTouchType:](self, "_cornersForTouchType:", 2) == 0;
  edgeProtectState = self->_edgeProtectState;
  if (edgeProtectState != 1 && !v7)
  {
    v9 = self->_positionRegionsComposer;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__SBSystemNotesInteractionManager_defaultPositionHyperregionComposers__block_invoke;
    v13[3] = &unk_1E8E9DED8;
    v13[4] = self;
    -[SBSystemNotesPositionHyperregionComposer performActionsWithTransientStateChange:](v9, "performActionsWithTransientStateChange:", v13);
    edgeProtectState = self->_edgeProtectState;
  }
  if (edgeProtectState == 1)
    -[SBSystemNotesPositionHyperregionComposer setupForEdgeProtectCornerSwipe](self->_positionRegionsComposer, "setupForEdgeProtectCornerSwipe");
  v10 = self->_positionRegionsComposer;
  v14[0] = v4;
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __70__SBSystemNotesInteractionManager_defaultPositionHyperregionComposers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setupForSwipesFromCorners:animated:", objc_msgSend(*(id *)(a1 + 32), "_cornersForAllSwipes"), 0);
}

- (void)interactionController:(id)a3 updateScaleInteractor:(id)a4 pipSize:(CGSize)a5 forPanGesture:(id)a6
{
  if (self->_initialInteractorPanPresentationMode == 1)
    -[SBSystemNotesInteractionManager _interactionController:updateScaleInteractorForSwipeToPresent:pipSize:forPanGesture:](self, "_interactionController:updateScaleInteractorForSwipeToPresent:pipSize:forPanGesture:", a3, a4, a6, a5.width, a5.height);
  else
    -[SBSystemNotesInteractionManager _interactionController:updateScaleInteractorForSwipeToDismiss:pipSize:forPanGesture:](self, "_interactionController:updateScaleInteractorForSwipeToDismiss:pipSize:forPanGesture:", a3, a4, a6, a5.width, a5.height);
}

- (UIEdgeInsets)interactionController:(id)a3 edgeInsetsForWindowScene:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v4 = *MEMORY[0x1E0CEB4B0];
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)interactionController:(id)a3 stashedPaddingForWindowScene:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v4 = *MEMORY[0x1E0CEB4B0];
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)interactionControllerConnectedWindowScenes:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[SBSystemNotesInteractionManagerDataSource presentedContainerViewControllerForInteractionManager:](self->_dataSource, "presentedContainerViewControllerForInteractionManager:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sbWindowScene");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)_interactionController:(id)a3 updateScaleInteractorForSwipeToPresent:(id)a4 pipSize:(CGSize)a5 forPanGesture:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = -[SBSystemNotesInteractionManagerDataSource currentPresentationModeForInteractionManager:](self->_dataSource, "currentPresentationModeForInteractionManager:", self);
  v13 = objc_msgSend(v11, "state");
  if ((unint64_t)(v13 - 3) >= 3)
  {
    if (v13 == 2)
    {
      -[SBSystemNotesInteractionManager _absoluteScaleThresholdBeforeFullSizeForGestureRecognizer:](self, "_absoluteScaleThresholdBeforeFullSizeForGestureRecognizer:", v11);
      v17 = v16;
      -[SBSystemNotesInteractionManager _absoluteScaleForInteractiveSystemNotesGesture:](self, "_absoluteScaleForInteractiveSystemNotesGesture:", v11);
      if (v18 <= v17)
      {
        v20 = v18;
        if (v12 != 1 && v18 <= v17 && !v12)
          -[SBSystemNotesInteractionManager collapseAnimated:](self, "collapseAnimated:", 1);
      }
      else
      {
        objc_msgSend(v9, "preferredScale");
        v20 = v19;
        if (v12 == 1)
          -[SBSystemNotesInteractionManager expandAnimated:](self, "expandAnimated:", 1);
      }
      -[SBSystemNotesPositionHyperregionComposer setupForInteractiveCornerGesture](self->_positionRegionsComposer, "setupForInteractiveCornerGesture");
      v21 = v20 + -1.0;
      objc_msgSend(v10, "_copyTranslation:", &v21);
    }
  }
  else
  {
    v21 = 0.0;
    objc_msgSend(v10, "_copyTranslation:", &v21);
    objc_msgSend(v9, "setPreferredNormalizedScale:", 1.0);
    if (v12 == 1)
    {
      objc_msgSend(v9, "targetView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      if (v15 > SBSystemNotesThumbnailSize() * 1.5
        || -[SBSystemNotesInteractionManager _panRecognizerOverFlickThreshold:](self, "_panRecognizerOverFlickThreshold:", v11))
      {
        -[SBSystemNotesInteractionManager expandAnimated:](self, "expandAnimated:", 1);
      }

    }
  }

}

- (CGPoint)_convertReferenceVelocity:(CGPoint)result toOrientation:(int64_t)a4
{
  double y;
  double x;
  void *v8;
  double v9;

  y = result.y;
  x = result.x;
  switch(a4)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemNotesInteractionManager.m"), 930, CFSTR("dealing with unknown orientation"));

      goto LABEL_3;
    case 1:
      break;
    case 2:
      result.x = -result.x;
      y = -result.y;
      break;
    case 3:
      result.x = result.y;
      y = -x;
      break;
    case 4:
      result.x = -result.y;
      y = x;
      break;
    default:
LABEL_3:
      result.x = x;
      break;
  }
  v9 = y;
  result.y = v9;
  return result;
}

- (unint64_t)_cornerForGestureRecognizer:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

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

  v8 = objc_msgSend(v7, "corner");
  if (!v8)
  {
    v9 = objc_opt_class();
    v10 = v5;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    v8 = objc_msgSend(v12, "corner");
  }

  return v8;
}

- (unint64_t)_touchTypeForGestureRecognizer:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = (uint64_t)v5;
    else
      v4 = 0;
  }

  if (v4)
  {
    v6 = 2;
  }
  else
  {
    v7 = objc_opt_class();
    v8 = v5;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = (uint64_t)v8;
      else
        v7 = 0;
    }

    v6 = v7 != 0;
  }

  return v6;
}

- (BOOL)_panRecognizerOverFlickThreshold:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  NSObject *v17;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBSystemNotesInteractionManager _cornerForGestureRecognizer:](self, "_cornerForGestureRecognizer:", v4);
  if (v5)
  {
    v6 = v5;
    -[SBSystemGestureManager windowForSystemGestures](self->_systemGestureManager, "windowForSystemGestures");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "velocityInView:", v7);
    v9 = v8;
    v11 = v10;

    -[SBSystemNotesInteractionManager _convertReferenceVelocity:toOrientation:](self, "_convertReferenceVelocity:toOrientation:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"), v9, v11);
    v14 = v13 * dbl_1D0E8BE50[v6 == 4] * 0.5 + v12 * -1.41421356 * 0.5;
    -[SBSystemNotesInteractionManager _flickVelocityThresholdForGestureRecognizer:](self, "_flickVelocityThresholdForGestureRecognizer:", v4);
    v16 = v14 > v15;
  }
  else
  {
    SBLogSystemNotes();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      _SBFLoggingMethodProem();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v19;
      v22 = 2114;
      v23 = v4;
      _os_log_error_impl(&dword_1D0540000, v17, OS_LOG_TYPE_ERROR, "%{public}@ unexpected recognizer type: %{public}@", (uint8_t *)&v20, 0x16u);

    }
    v16 = 0;
  }

  return v16;
}

- (void)_setupForInteractiveDismissal
{
  if (_setupForInteractiveDismissal_onceToken != -1)
    dispatch_once(&_setupForInteractiveDismissal_onceToken, &__block_literal_global_387);
  self->_cornerDismissState = 1;
  -[SBSystemNotesPositionHyperregionComposer setupForInteractiveDismissalToSize:](self->_positionRegionsComposer, "setupForInteractiveDismissalToSize:", *(double *)&_setupForInteractiveDismissal___toSize_0, *(double *)&_setupForInteractiveDismissal___toSize_1);
}

void __64__SBSystemNotesInteractionManager__setupForInteractiveDismissal__block_invoke()
{
  SBPIPContentViewLayoutSettings *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;

  +[SBPIPContentViewLayoutMetrics systemNotesMetricsForPresentationMode:](SBPIPContentViewLayoutMetrics, "systemNotesMetricsForPresentationMode:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[SBPIPContentViewLayoutSettings initWithPlatformMetrics:contentSize:]([SBPIPContentViewLayoutSettings alloc], "initWithPlatformMetrics:contentSize:", v3, SBSystemNotesThumbnailSize());
  -[SBPIPContentViewLayoutSettings minimumPossibleContentViewSizeForAspectRatio:](v0, "minimumPossibleContentViewSizeForAspectRatio:", SBSystemNotesThumbnailSize());
  _setupForInteractiveDismissal___toSize_0 = v1;
  _setupForInteractiveDismissal___toSize_1 = v2;

}

- (void)_interactionController:(id)a3 updateScaleInteractorForSwipeToDismiss:(id)a4 pipSize:(CGSize)a5 forPanGesture:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int8x8_t v26;
  _QWORD *v27;
  uint8x8_t v28;
  int v29;
  unint64_t v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  double v35;
  unint64_t cornerDismissState;
  _QWORD v37[6];
  double v38;
  _QWORD v39[2];
  uint64_t (*v40)(uint64_t, uint64_t);
  void *v41;
  SBSystemNotesInteractionManager *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double *v47;
  uint64_t v48;
  uint64_t v49;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_msgSend(v11, "state");
  if ((unint64_t)(v12 - 3) >= 3)
  {
    if (v12 != 2 || (objc_msgSend(v9, "isStashed") & 1) != 0)
      goto LABEL_40;
    if ((objc_msgSend(v9, "isPinching") & 1) != 0)
      v14 = 1;
    else
      v14 = objc_msgSend(v9, "isRotating");
    -[SBSystemGestureManager windowForSystemGestures](self->_systemGestureManager, "windowForSystemGestures");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationInView:", v17);
    v19 = v18;
    v21 = v20;

    -[SBSystemNotesInteractionManager _orientedLocationForReferenceLocation:](self, "_orientedLocationForReferenceLocation:", v19, v21);
    v23 = v22;
    v25 = v24;
    v46 = 0;
    v47 = (double *)&v46;
    v48 = 0x2020000000;
    v49 = 0x47EFFFFFE0000000;
    v26 = -[SBSystemNotesInteractionManager _cornersForAllSwipes](self, "_cornersForAllSwipes");
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v40 = __119__SBSystemNotesInteractionManager__interactionController_updateScaleInteractorForSwipeToDismiss_pipSize_forPanGesture___block_invoke;
    v41 = &unk_1E8EC0408;
    v44 = v23;
    v45 = v25;
    v42 = self;
    v43 = &v46;
    v27 = v39;
    if (v26)
    {
      LOBYTE(v38) = 0;
      v28 = (uint8x8_t)vcnt_s8(v26);
      v28.i16[0] = vaddlv_u8(v28);
      v29 = v28.i32[0];
      if (v28.i32[0])
      {
        v30 = 0;
        do
        {
          if (((1 << v30) & *(_QWORD *)&v26) != 0)
          {
            ((void (*)(_QWORD *))v40)(v27);
            --v29;
          }
          if (v30 > 0x3E)
            break;
          ++v30;
        }
        while (v29 > 0);
      }
    }

    if ((v14 & 1) != 0)
    {
      v31 = 0;
    }
    else
    {
      v32 = v47[3];
      -[SBSystemNotesInteractionManager _cornerDistanceBeforeScalingForDismissGestureRecognizer:](self, "_cornerDistanceBeforeScalingForDismissGestureRecognizer:", v11);
      v31 = v32 < v33;
      v38 = 0.0;
      if (v32 < v33)
      {
        -[SBSystemNotesInteractionManager _cornerDistanceBeforeScalingForDismissGestureRecognizer:](self, "_cornerDistanceBeforeScalingForDismissGestureRecognizer:", v11);
        v38 = (v34 - v47[3]) / -50.0;
      }
      objc_msgSend(v10, "_copyTranslation:", &v38);
    }
    v35 = v47[3];
    cornerDismissState = self->_cornerDismissState;
    if (cornerDismissState == 2)
    {
      if (!v14)
      {
        if (v35 >= 100.0)
        {
LABEL_35:
          -[SBSystemNotesInteractionManager _setupForInteractiveDismissal](self, "_setupForInteractiveDismissal", v35);
          goto LABEL_39;
        }
        goto LABEL_39;
      }
    }
    else
    {
      if (cornerDismissState != 1)
      {
        if (!cornerDismissState)
        {
          if ((v14 & 1) == 0)
          {
            if (!v31)
              goto LABEL_39;
            goto LABEL_35;
          }
LABEL_38:
          -[SBSystemNotesPositionHyperregionComposer setupForStandardBehavior](self->_positionRegionsComposer, "setupForStandardBehavior", v35);
        }
LABEL_39:
        _Block_object_dispose(&v46, 8);
        goto LABEL_40;
      }
      if ((v14 & 1) == 0)
      {
        if (v35 < 100.0)
        {
          self->_cornerDismissState = 2;
          -[SBSystemNotesPositionHyperregionComposer setupForSwipesFromCorners:animated:](self->_positionRegionsComposer, "setupForSwipesFromCorners:animated:", -[SBSystemNotesInteractionManager _cornersForAllSwipes](self, "_cornersForAllSwipes"), 1);
        }
        goto LABEL_39;
      }
    }
    self->_cornerDismissState = 0;
    goto LABEL_38;
  }
  if ((objc_msgSend(v9, "isStashed") & 1) == 0)
  {
    v13 = self->_cornerDismissState;
    switch(v13)
    {
      case 2uLL:
        self->_cornerDismissState = 3;
        v15 = self->_cornerDismissGenCount + 1;
        self->_cornerDismissGenCount = v15;
        -[SBSystemNotesInteractionManagerDataSource presentedContainerViewControllerForInteractionManager:](self->_dataSource, "presentedContainerViewControllerForInteractionManager:", self);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __119__SBSystemNotesInteractionManager__interactionController_updateScaleInteractorForSwipeToDismiss_pipSize_forPanGesture___block_invoke_2;
        v37[3] = &unk_1E8E9DE88;
        v37[4] = self;
        v37[5] = v15;
        objc_msgSend(v16, "performAfterInFlightAnimationsComplete:", v37);

        break;
      case 1uLL:
        v46 = 0;
        objc_msgSend(v10, "_copyTranslation:", &v46);
        self->_cornerDismissState = 0;
        -[SBSystemNotesPositionHyperregionComposer setupForInteractiveCornerGestureEnd](self->_positionRegionsComposer, "setupForInteractiveCornerGestureEnd");
        break;
      case 0uLL:
        self->_cornerDismissState = 0;
        -[SBSystemNotesPositionHyperregionComposer setupForStandardBehavior](self->_positionRegionsComposer, "setupForStandardBehavior");
        break;
    }
  }
LABEL_40:

}

uint64_t __119__SBSystemNotesInteractionManager__interactionController_updateScaleInteractorForSwipeToDismiss_pipSize_forPanGesture___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;

  result = objc_msgSend(*(id *)(a1 + 32), "_pointForGestureCorner:", a2);
  v7 = *(double *)(a1 + 48);
  if (a2 == 4)
  {
    if (v7 <= v5)
      goto LABEL_7;
  }
  else if (v7 >= v5)
  {
LABEL_7:
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = fmin(*(double *)(v11 + 24), 0.0);
    goto LABEL_8;
  }
  if (*(double *)(a1 + 56) >= v6)
    goto LABEL_7;
  v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = UIDistanceBetweenPoints();
  v10 = fmin(v8, v9);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_8:
  *(double *)(v11 + 24) = v10;
  return result;
}

uint64_t __119__SBSystemNotesInteractionManager__interactionController_updateScaleInteractorForSwipeToDismiss_pipSize_forPanGesture___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 96) == 3 && *(_QWORD *)(result + 40) == *(_DWORD *)(v1 + 104))
  {
    *(_QWORD *)(v1 + 96) = 0;
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 8), "interactionManager:requestsNotesDismissalForSource:animated:", *(_QWORD *)(result + 32), 1, 0);
  }
  return result;
}

- (BOOL)interactionControllerScalesDuringPanGesture:(id)a3
{
  return 1;
}

- (id)systemGestureManagerForInteractionControllerResizing:(id)a3
{
  return self->_systemGestureManager;
}

- (id)systemPointerInteractionManagerForInteractionController:(id)a3
{
  return self->_systemPointerInteractionManager;
}

- (BOOL)_gestureRecognizerIsActive:(id)a3
{
  return (unint64_t)(objc_msgSend(a3, "state") - 1) < 2;
}

- (BOOL)_gestureIsActive
{
  return -[SBSystemNotesInteractionManager _gestureRecognizerIsActive:](self, "_gestureRecognizerIsActive:", self->_leftPencilSystemCornerGestureRecognizer)|| -[SBSystemNotesInteractionManager _gestureRecognizerIsActive:](self, "_gestureRecognizerIsActive:", self->_rightPencilSystemCornerGestureRecognizer)|| -[SBSystemNotesInteractionManager _gestureRecognizerIsActive:](self, "_gestureRecognizerIsActive:", self->_leftFingerSystemCornerGestureRecognizer)|| -[SBSystemNotesInteractionManager _gestureRecognizerIsActive:](self, "_gestureRecognizerIsActive:", self->_rightFingerSystemCornerGestureRecognizer);
}

- (unint64_t)startingPositionForExternalPresentationRequest
{
  unint64_t v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v11;

  v4 = -[SBSystemNotesInteractionManager _cornersForAllSwipes](self, "_cornersForAllSwipes");
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemNotesInteractionManager.m"), 1140, CFSTR("_cornersForAllSwipes should never return empty result"));

  }
  v5 = (id *)MEMORY[0x1E0CEB258];
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    v6 = 4;
  else
    v6 = 8;
  v7 = objc_msgSend(*v5, "userInterfaceLayoutDirection");
  v8 = 1;
  if (v7 == 1)
    v9 = 1;
  else
    v9 = 2;
  if (v7 == 1)
    v8 = 2;
  if ((v6 & v4) != 0)
    return v9;
  else
    return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeProtectStashAssertion, 0);
  objc_storeStrong((id *)&self->_pipCoordinator, 0);
  objc_storeStrong((id *)&self->_systemPointerInteractionManager, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_pipSettings, 0);
  objc_storeStrong((id *)&self->_leftFingerSystemCornerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightFingerSystemCornerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_leftPencilSystemCornerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightPencilSystemCornerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_positionRegionsComposer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)peepAnimated:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_11();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v1, v2, "[%{public}@][Gesture]", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

- (void)dismissAnimated:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_11();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_19();
  OUTLINED_FUNCTION_0_8(&dword_1D0540000, v1, v2, "[%{public}@][%u][Gesture][End] stashed or non-animated dismiss", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_20();
}

- (void)dismissAnimated:completion:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_11();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_19();
  OUTLINED_FUNCTION_0_8(&dword_1D0540000, v1, v2, "[%{public}@][%u][Gesture][Begin] stashed or non-animated dismiss", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_20();
}

- (void)dismissAnimated:completion:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_11();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v1, v2, "[%{public}@][Gesture] nil container!", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

- (void)dismissAnimated:completion:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_11();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_10(&dword_1D0540000, v1, v2, "[%{public}@][Gesture] nil content!", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_19();
  OUTLINED_FUNCTION_0_8(&dword_1D0540000, v1, v2, "[%{public}@][%u][Gesture] animation completed. waiting for inflight to settle", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_20();
}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_20_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_19();
  OUTLINED_FUNCTION_0_8(&dword_1D0540000, v1, v2, "[%{public}@][Gesture][%u][End] animated dismiss", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_20();
}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_20_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_19();
  OUTLINED_FUNCTION_0_8(&dword_1D0540000, v1, v2, "[%{public}@][%u][Gesture] inflight settled. calling completion", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_20();
}

- (void)_handleInteractiveSwipeInGesture:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_11();
  _SBFLoggingMethodProem();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_8(&dword_1D0540000, v1, v2, "[%{public}@][Gesture] presented?: %{BOOL}u", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_2();
}

@end
