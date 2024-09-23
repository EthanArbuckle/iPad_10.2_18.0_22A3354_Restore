@implementation SBPPTRunner

- (BOOL)runTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  NSString *v12;
  SEL v13;
  BOOL v14;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogPPT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "-[SBPPTRunner runTestWithName:%@ options:%@]", buf, 0x16u);
  }

  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "runTest:options:delegate:", v6, v7, self);

  if ((v11 & 1) == 0
    && !-[SBPPTRunner _runCoverSheetTestWithName:options:](self, "_runCoverSheetTestWithName:options:", v6, v7)
    && !-[SBPPTRunner _runDashBoardTestWithName:options:](self, "_runDashBoardTestWithName:options:", v6, v7))
  {
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("Siri")))
    {
      -[SBPPTRunner _runSiriTestWithName:options:](self, "_runSiriTestWithName:options:", v6, v7);
    }
    else if (objc_msgSend((id)objc_opt_class(), "isAppLibraryTest:", v6))
    {
      -[SBPPTRunner _runAppLibraryTestWithName:options:](self, "_runAppLibraryTestWithName:options:", v6, v7);
    }
    else if (objc_msgSend((id)objc_opt_class(), "isFocusModeTest:", v6))
    {
      -[SBPPTRunner _runFocusModeTestWithName:options:](self, "_runFocusModeTestWithName:options:", v6, v7);
    }
    else if (objc_msgSend((id)objc_opt_class(), "isPageManagementTest:", v6))
    {
      -[SBPPTRunner _runPageManagementTestWithName:options:](self, "_runPageManagementTestWithName:options:", v6, v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_run%@TestWithOptions:"), v6);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      v13 = NSSelectorFromString(v12);

      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v14 = 0;
        goto LABEL_17;
      }
      ((void (*)(SBPPTRunner *, SEL, id))-[SBPPTRunner methodForSelector:](self, "methodForSelector:", v13))(self, v13, v7);
    }
  }
  v14 = 1;
LABEL_17:

  return v14;
}

+ (BOOL)isAppLibraryTest:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isAppLibraryTest__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isAppLibraryTest__onceToken, &__block_literal_global_403);
  v5 = objc_msgSend((id)isAppLibraryTest__appLibraryTests, "containsObject:", v4);

  return v5;
}

- (BOOL)_runCoverSheetTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("CoverSheetPresent")))
  {
    -[SBPPTRunner _runCoverSheetPresentTestWithOptions:](self, "_runCoverSheetPresentTestWithOptions:", v7);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("CoverSheetPresentOverSafari")))
  {
    -[SBPPTRunner _runCoverSheetPresentOverSafariTestWithOptions:](self, "_runCoverSheetPresentOverSafariTestWithOptions:", v7);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("CoverSheetDismiss")))
  {
    -[SBPPTRunner _runCoverSheetDismissTestWithOptions:](self, "_runCoverSheetDismissTestWithOptions:", v7);
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("CoverSheetDismissToSafari")))
    {
      v8 = 0;
      goto LABEL_10;
    }
    -[SBPPTRunner _runCoverSheetDismissToSafariTestWithOptions:](self, "_runCoverSheetDismissToSafariTestWithOptions:", v7);
  }
  v8 = 1;
LABEL_10:

  return v8;
}

+ (BOOL)isFocusModeTest:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isFocusModeTest__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isFocusModeTest__onceToken, &__block_literal_global_263);
  v5 = objc_msgSend((id)isFocusModeTest__focusModePPTTests, "containsObject:", v4);

  return v5;
}

- (BOOL)_runDashBoardTestWithName:(id)a3 options:(id)a4
{
  id v6;
  int v7;

  v6 = a4;
  v7 = objc_msgSend(a3, "isEqualToString:", CFSTR("DashBoardSwipeDismissWhileAuthenticated"));
  if (v7)
    -[SBPPTRunner _runDashBoardDismissTestWithOptions:](self, "_runDashBoardDismissTestWithOptions:", v6);

  return v7;
}

+ (BOOL)isPageManagementTest:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isPageManagementTest__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isPageManagementTest__onceToken, &__block_literal_global_264);
  v5 = objc_msgSend((id)isPageManagementTest__pageManagementPPTTests, "containsObject:", v4);

  return v5;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SBPPTRunner_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once_13 != -1)
    dispatch_once(&sharedInstance___once_13, block);
  return (id)sharedInstance___sharedInstance_29;
}

- (void)_runDashBoardDismissTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToLockInterface](SBPPTOperation, "operationToLockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterfaceFinishingUIUnlock:](SBPPTOperation, "operationToUnlockInterfaceFinishingUIUnlock:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(v4, "objectForKey:", CFSTR("testName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPPTRunner _operationToDismissDashBoardForTestWithName:](self, "_operationToDismissDashBoardForTestWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v9);

}

- (id)_operationToDismissDashBoardForTestWithName:(id)a3
{
  return +[SBPPTOperation operationToMonitorCoverSheetTransitionWithTestName:execute:](SBPPTOperation, "operationToMonitorCoverSheetTransitionWithTestName:execute:", a3, &__block_literal_global_69);
}

void __74__SBPPTRunner_DashBoardPPTs___operationToDismissDashBoardForTestWithName___block_invoke()
{
  id v0;

  SBPPTEventActionsToSwipeUpFromBottomOfInterface();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  SBPPTSynthesizeEventsForEventActions(v0, 0);

}

- (void)prepareForControlCenterPPTHostState:(unint64_t)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __94__SBPPTRunner_ControlCenterPPTSupport__prepareForControlCenterPPTHostState_completionHandler___block_invoke;
  v18 = &unk_1E8EA9E48;
  v6 = v5;
  v19 = v6;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 2uLL:
      +[SBPPTOperation operationToPreventSystemIdle](SBPPTOperation, "operationToPreventSystemIdle", v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v8;
      +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v9;
      +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToActivateApplicationWithBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v10;
      v20[3] = v7;
      +[SBPPTOperation operationToResumeSystemIdle](SBPPTOperation, "operationToResumeSystemIdle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[4] = v11;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = v20;
LABEL_7:
      objc_msgSend(v12, "arrayWithObjects:count:", v13, 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v14);

      goto LABEL_8;
    case 1uLL:
      +[SBPPTOperation operationToPreventSystemIdle](SBPPTOperation, "operationToPreventSystemIdle", v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v8;
      +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v9;
      +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v10;
      v21[3] = v7;
      +[SBPPTOperation operationToResumeSystemIdle](SBPPTOperation, "operationToResumeSystemIdle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[4] = v11;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = v21;
      goto LABEL_7;
    case 0uLL:
      +[SBPPTOperation operationToPreventSystemIdle](SBPPTOperation, "operationToPreventSystemIdle", v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      +[SBPPTOperation operationToLockInterface](SBPPTOperation, "operationToLockInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v9;
      v22[2] = v7;
      +[SBPPTOperation operationToResumeSystemIdle](SBPPTOperation, "operationToResumeSystemIdle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[3] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v11);
LABEL_8:

      break;
  }

}

void __94__SBPPTRunner_ControlCenterPPTSupport__prepareForControlCenterPPTHostState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v3(v2);
  objc_msgSend(v4, "finish");

}

- (void)_runFloatingDockBringupTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  SBPPTRunner *v16;
  id v17;
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToActivateApplicationWithBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  +[SBPPTOperation operationToDismissFloatingDock](SBPPTOperation, "operationToDismissFloatingDock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __64__SBPPTRunner_DockPPTs___runFloatingDockBringupTestWithOptions___block_invoke;
  v15 = &unk_1E8EA9C48;
  v16 = self;
  v17 = v4;
  v8 = v4;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v9;
  +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen", v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v11);

}

void __64__SBPPTRunner_DockPPTs___runFloatingDockBringupTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_mainDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("testName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SBPPTRunner_DockPPTs___runFloatingDockBringupTestWithOptions___block_invoke_2;
  v9[3] = &unk_1E8E9DEB0;
  v10 = v6;
  v11 = v3;
  v7 = v3;
  v8 = v6;
  objc_msgSend(v5, "presentFloatingDockIfDismissedAnimated:completionHandler:", 1, v9);

}

uint64_t __64__SBPPTRunner_DockPPTs___runFloatingDockBringupTestWithOptions___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedTest:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "finish");
}

- (void)_runFloatingDockDismissTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  SBPPTRunner *v16;
  id v17;
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToActivateApplicationWithBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  +[SBPPTOperation operationToPresentFloatingDock](SBPPTOperation, "operationToPresentFloatingDock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __64__SBPPTRunner_DockPPTs___runFloatingDockDismissTestWithOptions___block_invoke;
  v15 = &unk_1E8EA9C48;
  v16 = self;
  v17 = v4;
  v8 = v4;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v9;
  +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen", v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v11);

}

void __64__SBPPTRunner_DockPPTs___runFloatingDockDismissTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_mainDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingDockController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("testName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__SBPPTRunner_DockPPTs___runFloatingDockDismissTestWithOptions___block_invoke_2;
  v9[3] = &unk_1E8E9DEB0;
  v10 = v6;
  v11 = v3;
  v7 = v3;
  v8 = v6;
  objc_msgSend(v5, "dismissFloatingDockIfPresentedAnimated:completionHandler:", 1, v9);

}

uint64_t __64__SBPPTRunner_DockPPTs___runFloatingDockDismissTestWithOptions___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedTest:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "finish");
}

uint64_t __48__SBPPTRunner_DockPPTs___mainDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMainDisplayWindowScene");
}

- (void)_runNotificationShortToLongLookTransitionTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  SBPPTRunner *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  +[SBPPTOperation operationToPresentBannerNotification](SBPPTOperation, "operationToPresentBannerNotification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke;
  v13 = &unk_1E8EA9C48;
  v14 = v4;
  v15 = self;
  v7 = v4;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3, v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v9);

}

void __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  _QWORD v18[4];
  id v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("testName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "notificationDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bannerDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "presentedBanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", *(_QWORD *)(a1 + 40));
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_2;
  v18[3] = &unk_1E8E9DED8;
  v9 = v4;
  v19 = v9;
  objc_msgSend(v7, "setPPTLongLookWillPresentBlock:", v18);
  objc_initWeak(&location, v7);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_4;
  v14[3] = &unk_1E8EA7838;
  v10 = v9;
  v15 = v10;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "setPPTLongLookDidPresentBlock:", v14);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_5;
  v12[3] = &unk_1E8E9DED8;
  v11 = v3;
  v13 = v11;
  objc_msgSend(v7, "setPPTLongLookDidDismissBlock:", v12);
  objc_msgSend(v7, "_recapSwipePresentLongLook");

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_2(uint64_t a1)
{
  id *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  v3 = *v2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_3;
  v4[3] = &unk_1E8E9DED8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "installCACommitCompletionBlock:", v4);

}

uint64_t __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_3(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
}

void __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "finishedTest:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_recapDismissLongLookViaTapOutside");

}

uint64_t __90__SBPPTRunner_NotificationPPTs___runNotificationShortToLongLookTransitionTestWithOptions___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

- (void)_runNotificationReParkLongLookTransitionTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  SBPPTRunner *v17;
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  +[SBPPTOperation operationToActivateNullOffscreenApp](SBPPTOperation, "operationToActivateNullOffscreenApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  +[SBPPTOperation operationToPresentBannerNotification](SBPPTOperation, "operationToPresentBannerNotification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke;
  v15 = &unk_1E8EA9C48;
  v16 = v4;
  v17 = self;
  v8 = v4;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v9;
  +[SBPPTOperation operationToTerminateNullOffscreenApp](SBPPTOperation, "operationToTerminateNullOffscreenApp", v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v11);

}

void __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("testName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "notificationDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bannerDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "presentedBanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", *(_QWORD *)(a1 + 40));
  objc_initWeak(&location, v7);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_2;
  v15[3] = &unk_1E8EA7838;
  v9 = v4;
  v16 = v9;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "setPPTLongLookDidPresentBlock:", v15);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_4;
  v12[3] = &unk_1E8E9E820;
  v10 = v9;
  v13 = v10;
  v11 = v3;
  v14 = v11;
  objc_msgSend(v7, "setPPTLongLookDidDismissBlock:", v12);
  objc_msgSend(v7, "_recapSwipePresentLongLook");

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_2(uint64_t a1)
{
  id *v2;
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  v3 = *v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_3;
  v5[3] = &unk_1E8E9DED8;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "installCACommitCompletionBlock:", v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_recapDismissLongLookViaTapOutside");

}

uint64_t __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_3(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
}

uint64_t __89__SBPPTRunner_NotificationPPTs___runNotificationReParkLongLookTransitionTestWithOptions___block_invoke_4(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "finishedTest:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "finish");
}

- (void)_runNotificationClearLongLookTransitionTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  SBPPTRunner *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  +[SBPPTOperation operationToPresentBannerNotification](SBPPTOperation, "operationToPresentBannerNotification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke;
  v13 = &unk_1E8EA9C48;
  v14 = v4;
  v15 = self;
  v7 = v4;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3, v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v9);

}

void __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("testName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "notificationDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bannerDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "presentedBanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", *(_QWORD *)(a1 + 40));
  objc_initWeak(&location, v7);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_2;
  v15[3] = &unk_1E8EA7838;
  v9 = v4;
  v16 = v9;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "setPPTLongLookDidPresentBlock:", v15);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_4;
  v12[3] = &unk_1E8E9E820;
  v10 = v9;
  v13 = v10;
  v11 = v3;
  v14 = v11;
  objc_msgSend(v7, "setPPTLongLookDidDismissBlock:", v12);
  objc_msgSend(v7, "_recapSwipePresentLongLook");

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_2(uint64_t a1)
{
  id *v2;
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  v3 = *v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_3;
  v5[3] = &unk_1E8E9DED8;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "installCACommitCompletionBlock:", v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_recapDismissLongLookViaPullDown");

}

uint64_t __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_3(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
}

uint64_t __88__SBPPTRunner_NotificationPPTs___runNotificationClearLongLookTransitionTestWithOptions___block_invoke_4(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "finishedTest:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "finish");
}

- (void)_runNotificationBannerTransitionTestWithOptions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke;
  v9[3] = &unk_1E8EA9C70;
  v10 = v3;
  v5 = v3;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  +[SBPPTOperation operationToDismissBannerNotification](SBPPTOperation, "operationToDismissBannerNotification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v8);

}

void __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("testName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "notificationDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bannerDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBNotificationBannerDestination _test_notificationRequestForBannerWithIcon](SBNotificationBannerDestination, "_test_notificationRequestForBannerWithIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", v4);
  objc_msgSend(*v8, "startedSubTest:forTest:", CFSTR("delay"), v4);
  v9 = *v8;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke_2;
  v14[3] = &unk_1E8E9F108;
  v15 = v4;
  v16 = v6;
  v17 = v7;
  v18 = v3;
  v10 = v3;
  v11 = v7;
  v12 = v6;
  v13 = v4;
  objc_msgSend(v9, "installCACommitCompletionBlock:", v14);

}

void __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke_3;
  v5[3] = &unk_1E8E9E820;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_test_postNotificationRequest:completion:", v3, v5);

}

uint64_t __81__SBPPTRunner_NotificationPPTs___runNotificationBannerTransitionTestWithOptions___block_invoke_3(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "finishedTest:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "finish");
}

- (void)longLookWillPresentForNotificationViewController:(id)a3
{
  void (**v3)(_QWORD);
  id v4;

  v4 = a3;
  objc_msgSend(v4, "pptLongLookWillPresentBlock");
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v4, "setPPTLongLookWillPresentBlock:", 0);
    v3[2](v3);
  }

}

- (void)longLookDidPresentForNotificationViewController:(id)a3
{
  void (**v3)(_QWORD);
  id v4;

  v4 = a3;
  objc_msgSend(v4, "pptLongLookDidPresentBlock");
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v4, "setPPTLongLookDidPresentBlock:", 0);
    v3[2](v3);
  }

}

- (void)longLookWillDismissForNotificationViewController:(id)a3
{
  void (**v3)(_QWORD);
  id v4;

  v4 = a3;
  objc_msgSend(v4, "pptLongLookWillDismissBlock");
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v4, "setPPTLongLookWillDismissBlock:", 0);
    v3[2](v3);
  }

}

- (void)longLookDidDismissForNotificationViewController:(id)a3
{
  void (**v3)(_QWORD);
  id v4;

  v4 = a3;
  objc_msgSend(v4, "pptLongLookDidDismissBlock");
  v3 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v4, "setPPTLongLookDidDismissBlock:", 0);
    v3[2](v3);
  }

}

- (void)_runSiriTestWithName:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "policyAggregator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowsCapability:", 5);

  if (v9)
  {
    if (objc_msgSend(v15, "hasPrefix:", CFSTR("SiriBringup")))
    {
      +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:", self);

      objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedIPTest:", v15);
    }
    v11 = (void *)MEMORY[0x1E0C9AA70];
    if (v6)
      v11 = v6;
    v12 = v11;
    v13 = (void *)objc_opt_new();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D97848]), "initWithPPTContext:", v12);

    objc_msgSend(v13, "activateWithContext:", v14);
  }

}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTestName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)*MEMORY[0x1E0CEB258];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SBPPTRunner_SiriPPTSupport__assistantWillAppear_windowScene___block_invoke;
  v8[3] = &unk_1E8E9DED8;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "_performBlockAfterCATransactionCommits:", v8);

}

uint64_t __63__SBPPTRunner_SiriPPTSupport__assistantWillAppear_windowScene___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("appear"), *(_QWORD *)(a1 + 32));
}

- (void)assistantDidAppear:(id)a3 windowScene:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SBPPTRunner *v12;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTestName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("appear"), v7);
  v8 = dispatch_time(0, 2000000000);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v11 = v7;
  v12 = self;
  v9 = v7;
  dispatch_after(v8, MEMORY[0x1E0C80D38], v10);

}

void __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = (void *)*MEMORY[0x1E0CEB258];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke_2;
  v5[3] = &unk_1E8E9E820;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "_performBlockAfterCATransactionCommits:", v5);

}

void __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke_2(int8x16_t *a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("disappear"), a1[2].i64[0]);
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke_3;
  v5[3] = &unk_1E8E9E820;
  v4 = a1[2];
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  objc_msgSend(v2, "dismissAssistantViewInEverySceneIfNecessaryWithAnimation:completion:", 1, v5);

}

uint64_t __62__SBPPTRunner_SiriPPTSupport__assistantDidAppear_windowScene___block_invoke_3(uint64_t a1)
{
  void *v2;
  id *v3;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(a1 + 32));

  v3 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("disappear"), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*v3, "finishedTest:", *(_QWORD *)(a1 + 40));
}

void __52__SBPPTRunner_FocusModePPTSupport__isFocusModeTest___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("FocusMode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isFocusModeTest__focusModePPTTests;
  isFocusModeTest__focusModePPTTests = v2;

}

- (void)_runFocusModeTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("FocusMode")))
    -[SBPPTRunner _runFocusModePresentTestWithName:options:](self, "_runFocusModePresentTestWithName:options:", v7, v6);

}

- (void)_runFocusModePresentTestWithName:(id)a3 options:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  +[SBPPTOperation operationToStartTest:](SBPPTOperation, "operationToStartTest:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  +[SBPPTOperation operationToUpdateHomeScreenPagesForActiveFocusModeForTestWithName:](SBPPTOperation, "operationToUpdateHomeScreenPagesForActiveFocusModeForTestWithName:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v8;
  +[SBPPTOperation operationToFinishTest:](SBPPTOperation, "operationToFinishTest:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v10);

}

void __62__SBPPTRunner_PageManagementPPTSupport__isPageManagementTest___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("PresentPageManagement");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isPageManagementTest__pageManagementPPTTests;
  isPageManagementTest__pageManagementPPTTests = v2;

}

- (void)_runPageManagementTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PresentPageManagement")))
    -[SBPPTRunner _runPageManagementPresentTestWithName:options:](self, "_runPageManagementPresentTestWithName:options:", v7, v6);

}

- (void)_runPageManagementPresentTestWithName:(id)a3 options:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  +[SBPPTOperation operationToStartTest:](SBPPTOperation, "operationToStartTest:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  +[SBPPTOperation operationToPresentPageManagementForTestWithName:](SBPPTOperation, "operationToPresentPageManagementForTestWithName:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v8;
  +[SBPPTOperation operationToWaitForTimeInterval:](SBPPTOperation, "operationToWaitForTimeInterval:", 2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v9;
  +[SBPPTOperation operationToDismissPageManagementForTestWithName:](SBPPTOperation, "operationToDismissPageManagementForTestWithName:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v10;
  +[SBPPTOperation operationToFinishTest:](SBPPTOperation, "operationToFinishTest:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v12);

}

- (void)_runCoverSheetPresentTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(v4, "objectForKey:", CFSTR("testName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPPTRunner _operationToPresentCoverSheetForTestWithName:](self, "_operationToPresentCoverSheetForTestWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  +[SBPPTOperation operationToDismissCoverSheet](SBPPTOperation, "operationToDismissCoverSheet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v10);

}

- (void)_runCoverSheetDismissTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  +[SBPPTOperation operationToPresentCoverSheet](SBPPTOperation, "operationToPresentCoverSheet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(v4, "objectForKey:", CFSTR("testName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPPTRunner _operationToDismissCoverSheetForTestWithName:](self, "_operationToDismissCoverSheetForTestWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v10);

}

- (void)_runCoverSheetPresentOverSafariTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToActivateApplicationWithBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(v4, "objectForKey:", CFSTR("testName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPPTRunner _operationToPresentCoverSheetForTestWithName:](self, "_operationToPresentCoverSheetForTestWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  +[SBPPTOperation operationToDismissCoverSheet](SBPPTOperation, "operationToDismissCoverSheet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v10);

}

- (void)_runCoverSheetDismissToSafariTestWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToActivateApplicationWithBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  +[SBPPTOperation operationToPresentCoverSheet](SBPPTOperation, "operationToPresentCoverSheet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(v4, "objectForKey:", CFSTR("testName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPPTRunner _operationToDismissCoverSheetForTestWithName:](self, "_operationToDismissCoverSheetForTestWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v10);

}

- (id)_operationToPresentCoverSheetForTestWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__SBPPTRunner_CoverSheetPPTs___operationToPresentCoverSheetForTestWithName___block_invoke;
  v8[3] = &unk_1E8EA9C48;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __76__SBPPTRunner_CoverSheetPPTs___operationToPresentCoverSheetForTestWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_setCoverSheetPresentationManagerTransitionCallbacksForTestName:operation:", *(_QWORD *)(a1 + 40), a2);
  SBPPTEventActionsToSwipeDownFromTopOfInterface();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  SBPPTSynthesizeEventsForEventActions(v2, 0);

}

- (id)_operationToDismissCoverSheetForTestWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__SBPPTRunner_CoverSheetPPTs___operationToDismissCoverSheetForTestWithName___block_invoke;
  v8[3] = &unk_1E8EA9C48;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __76__SBPPTRunner_CoverSheetPPTs___operationToDismissCoverSheetForTestWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_setCoverSheetPresentationManagerTransitionCallbacksForTestName:operation:", *(_QWORD *)(a1 + 40), a2);
  SBPPTSynthesizeEventsForCommandString(CFSTR("b h"), 0);
}

- (void)_setCoverSheetPresentationManagerTransitionCallbacksForTestName:(id)a3 operation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = a4;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke;
  v15[3] = &unk_1E8E9DED8;
  v9 = v5;
  v16 = v9;
  objc_msgSend(v7, "setPpt_transitionBeginsCallback:", v15);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke_3;
  v12[3] = &unk_1E8E9E820;
  v13 = v9;
  v14 = v6;
  v10 = v6;
  v11 = v9;
  objc_msgSend(v7, "setPpt_transitionEndsCallback:", v12);

}

void __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedTest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  v3 = *v2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke_2;
  v4[3] = &unk_1E8E9DED8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "installCACommitCompletionBlock:", v4);

}

uint64_t __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke_2(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
}

uint64_t __105__SBPPTRunner_CoverSheetPPTs___setCoverSheetPresentationManagerTransitionCallbacksForTestName_operation___block_invoke_3(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*v2, "finishedTest:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "finish");
}

+ (id)_operationToPutVideoInPIP
{
  return +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &__block_literal_global_336);
}

void __49__SBPPTRunner_PIPPPTs___operationToPutVideoInPIP__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pipControllerForType:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_startPictureInPictureTestActionForApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  objc_msgSend(v2, "finish");

}

+ (id)_operationToRestoreVideoFromPIP
{
  return +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &__block_literal_global_2_1);
}

void __55__SBPPTRunner_PIPPPTs___operationToRestoreVideoFromPIP__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pipControllerForType:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_restorePictureInPictureForTestForApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  objc_msgSend(v2, "finish");

}

+ (id)_operationToStashPIP
{
  return +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &__block_literal_global_3_5);
}

void __44__SBPPTRunner_PIPPPTs___operationToStashPIP__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = a2;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pipControllerForType:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "embeddedDisplayWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acquireStashAssertionForWindowScene:withReason:identifier:", v5, 1, CFSTR("SB-PPT-Testing"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_stashAssertion;
  _stashAssertion = v6;

  objc_msgSend(v2, "finish");
}

+ (id)_operationToUnstashStashedPIP
{
  return +[SBPPTBlockOperation operationWithBlock:](SBPPTBlockOperation, "operationWithBlock:", &__block_literal_global_5_4);
}

void __53__SBPPTRunner_PIPPPTs___operationToUnstashStashedPIP__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)_stashAssertion;
  v4 = a2;
  objc_msgSend(v2, "invalidate");
  v3 = (void *)_stashAssertion;
  _stashAssertion = 0;

  objc_msgSend(v4, "finish");
}

- (void)_runPIPBasicRestoreTestWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v14;
  +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToActivateApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v13;
  objc_msgSend((id)objc_opt_class(), "_operationToPutVideoInPIP");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v12;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsActive"), 0, 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v4;
  objc_msgSend((id)objc_opt_class(), "_operationToRestoreVideoFromPIP");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markStartedTest:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v6;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsNoLongerActive"), 0, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markFinishedTest:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v8;
  +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v9;
  +[SBPPTOperation operationToTerminateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToTerminateApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v11);

}

- (void)_runPIPManualStashTestWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[10];

  v16[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToActivateApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  objc_msgSend((id)objc_opt_class(), "_operationToPutVideoInPIP");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsActive"), 0, 10.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v3;
  objc_msgSend((id)objc_opt_class(), "_operationToStashPIP");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markStartedTest:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v5;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsStashed"), 0, 10.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markFinishedTest:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  objc_msgSend((id)objc_opt_class(), "_operationToUnstashStashedPIP");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v8;
  +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v9;
  +[SBPPTOperation operationToTerminateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToTerminateApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v11);

}

- (void)_runPIPManualUnstashTestWithOptions:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[11];

  v18[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v3 = objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToActivateApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  objc_msgSend((id)objc_opt_class(), "_operationToPutVideoInPIP");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v15;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsActive"), 0, 10.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend((id)objc_opt_class(), "_operationToStashPIP");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v4;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsStashed"), 0, 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v5;
  objc_msgSend((id)objc_opt_class(), "_operationToUnstashStashedPIP");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)v3;
  objc_msgSend(v6, "markStartedTest:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v7;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsNoLongerStashed"), 0, 10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "markFinishedTest:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v9;
  +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v10;
  +[SBPPTOperation operationToTerminateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToTerminateApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v12);

}

- (void)_runPIPAutoStashByEnteringSwitcherTestWithOptions:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[9];

  v16[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v3 = objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToActivateApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  objc_msgSend((id)objc_opt_class(), "_operationToPutVideoInPIP");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsActive"), 0, 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v4;
  +[SBPPTOperation operationToPresentAppSwitcher](SBPPTOperation, "operationToPresentAppSwitcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)v3;
  objc_msgSend(v5, "markStartedTest:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v6;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsStashed"), 0, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markFinishedTest:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v8;
  +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v9;
  +[SBPPTOperation operationToTerminateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToTerminateApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v11);

}

- (void)_runPIPAutoUnstashAndRestoreByExitingSwitcherBackToAppTestWithOptions:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[12];

  v19[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v3 = objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v18;
  +[SBPPTOperation operationToActivateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToActivateApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  objc_msgSend((id)objc_opt_class(), "_operationToPutVideoInPIP");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v16;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsActive"), 0, 10.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v15;
  +[SBPPTOperation operationToPresentAppSwitcher](SBPPTOperation, "operationToPresentAppSwitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v4;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsStashed"), 0, 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v5;
  +[SBPPTOperation operationToWaitForTimeInterval:](SBPPTOperation, "operationToWaitForTimeInterval:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v6;
  +[SBPPTOperation operationToDismissAppSwitcherAndReturnToSource](SBPPTOperation, "operationToDismissAppSwitcherAndReturnToSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)v3;
  objc_msgSend(v7, "markStartedTest:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v8;
  +[SBPPTOperation operationToWaitForNotificationName:object:timeout:](SBPPTOperation, "operationToWaitForNotificationName:object:timeout:", CFSTR("SBApplicationTestingPIPIsNoLongerActive"), 0, 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markFinishedTest:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v10;
  +[SBPPTOperation operationToTransitionToHomeScreen](SBPPTOperation, "operationToTransitionToHomeScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v11;
  +[SBPPTOperation operationToTerminateApplicationWithBundleIdentifier:](SBPPTOperation, "operationToTerminateApplicationWithBundleIdentifier:", CFSTR("com.apple.test.FullscreenVideoPlayer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v13);

}

void __54__SBPPTRunner_AppLibraryPPTSupport__isAppLibraryTest___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("SwipeToDewey");
  v4[1] = CFSTR("SwipeFromDewey");
  v4[2] = CFSTR("ScrollDewey");
  v4[3] = CFSTR("ScrollDeweyLibrarySearch");
  v4[4] = CFSTR("ScrollDeweyWithinExpandedPod");
  v4[5] = CFSTR("DeweyPullToLibrarySearch");
  v4[6] = CFSTR("PresentAppLibraryPad");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isAppLibraryTest__appLibraryTests;
  isAppLibraryTest__appLibraryTests = v2;

}

- (void)_runAppLibraryTestWithName:(id)a3 options:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SwipeToDewey")))
  {
    -[SBPPTRunner _runSwipeToDeweyTestWithOptions:](self, "_runSwipeToDeweyTestWithOptions:", v6);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("SwipeFromDewey")))
  {
    -[SBPPTRunner _runSwipeFromDeweyTestWithOptions:](self, "_runSwipeFromDeweyTestWithOptions:", v6);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ScrollDewey")))
  {
    -[SBPPTRunner _runScrollDeweyTestWithOptions:](self, "_runScrollDeweyTestWithOptions:", v6);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ScrollDeweyLibrarySearch")))
  {
    -[SBPPTRunner _runLibrarySearchTestWithOptions:](self, "_runLibrarySearchTestWithOptions:", v6);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ScrollDeweyWithinExpandedPod")))
  {
    -[SBPPTRunner _runScrollWithinExpandedPodTestWithOptions:](self, "_runScrollWithinExpandedPodTestWithOptions:", v6);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("DeweyPullToLibrarySearch")))
  {
    -[SBPPTRunner _runPullToAppLibrarySearchTestWithOptions:](self, "_runPullToAppLibrarySearchTestWithOptions:", v6);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("PresentAppLibraryPad")))
  {
    -[SBPPTRunner _runAppLibraryPadPresentTestWithOptions:](self, "_runAppLibraryPadPresentTestWithOptions:", v6);
  }

}

- (void)_runAppLibraryPadPresentTestWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:](SBPPTOperation, "dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  +[SBPPTOperation operationToStartTest:](SBPPTOperation, "operationToStartTest:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  +[SBPPTOperation presentAppLibrary:forTestWithName:](SBPPTOperation, "presentAppLibrary:forTestWithName:", 1, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  +[SBPPTOperation dismissAppLibraryPad:forTestWithName:](SBPPTOperation, "dismissAppLibraryPad:forTestWithName:", 1, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v8;
  +[SBPPTOperation operationToFinishTest:](SBPPTOperation, "operationToFinishTest:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v9;
  +[SBPPTOperation resetAndPrepareforNextTest](SBPPTOperation, "resetAndPrepareforNextTest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v11);

}

- (void)_runSwipeToDeweyTestWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:](SBPPTOperation, "dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  +[SBPPTOperation operationToStartTest:](SBPPTOperation, "operationToStartTest:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  +[SBPPTOperation presentAppLibraryPhoneForTestWithName:](SBPPTOperation, "presentAppLibraryPhoneForTestWithName:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  +[SBPPTOperation operationToFinishTest:](SBPPTOperation, "operationToFinishTest:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v8;
  +[SBPPTOperation resetAndPrepareforNextTest](SBPPTOperation, "resetAndPrepareforNextTest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v10);

}

- (void)_runSwipeFromDeweyTestWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:](SBPPTOperation, "dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  +[SBPPTOperation presentAppLibraryForTestWithName:](SBPPTOperation, "presentAppLibraryForTestWithName:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  +[SBPPTOperation operationToStartTest:](SBPPTOperation, "operationToStartTest:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  +[SBPPTOperation dismissAppLibraryOverlay](SBPPTOperation, "dismissAppLibraryOverlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v8;
  +[SBPPTOperation operationToFinishTest:](SBPPTOperation, "operationToFinishTest:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v9;
  +[SBPPTOperation resetAndPrepareforNextTest](SBPPTOperation, "resetAndPrepareforNextTest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v11);

}

- (void)_runScrollDeweyTestWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  SBPPTRunner *v18;
  id v19;
  _QWORD v20[8];

  v20[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:](SBPPTOperation, "dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  +[SBPPTOperation configureAppLibraryForEachAppHavingOwnPod](SBPPTOperation, "configureAppLibraryForEachAppHavingOwnPod");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v7;
  +[SBPPTOperation presentAppLibraryForTestWithName:](SBPPTOperation, "presentAppLibraryForTestWithName:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v8;
  +[SBPPTOperation resetAppLibraryToTop](SBPPTOperation, "resetAppLibraryToTop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v9;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __68__SBPPTRunner_AppLibraryPPTSupport___runScrollDeweyTestWithOptions___block_invoke;
  v17 = &unk_1E8EC0EE8;
  v18 = self;
  v19 = v4;
  v10 = v4;
  +[SBPPTRecapPerformanceTestingOperation scrollViewRecapPerformanceTestOperationWithBlock:](SBPPTRecapPerformanceTestingOperation, "scrollViewRecapPerformanceTestOperationWithBlock:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v11;
  +[SBPPTOperation resetAndPrepareforNextTest](SBPPTBlockOperation, "resetAndPrepareforNextTest", v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v13);

}

id __68__SBPPTRunner_AppLibraryPPTSupport___runScrollDeweyTestWithOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_libraryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ppt_setDisablePullToSearch:", 1);

  objc_msgSend(v2, "podFolderViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_scrollToTopIfPossible:", 0);
  v6 = objc_alloc(MEMORY[0x1E0D83C68]);
  v7 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__SBPPTRunner_AppLibraryPPTSupport___runScrollDeweyTestWithOptions___block_invoke_2;
  v11[3] = &unk_1E8E9DED8;
  v12 = v2;
  v8 = v2;
  v9 = (void *)objc_msgSend(v6, "initWithTestName:scrollView:completionHandler:", v7, v5, v11);
  objc_msgSend(*(id *)(a1 + 32), "_configureParams:forScrollView:", v9, v5);

  return v9;
}

void __68__SBPPTRunner_AppLibraryPPTSupport___runScrollDeweyTestWithOptions___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "containerViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ppt_setDisablePullToSearch:", 0);

}

- (void)_runLibrarySearchTestWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[10];

  v20[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "iconManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rootFolderController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  +[SBPPTOperation dismissOverlaysAndResetHomeScreenToPage:animated:completion:](SBPPTOperation, "dismissOverlaysAndResetHomeScreenToPage:animated:completion:", objc_msgSend(v15, "lastIconPageIndex"), 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v6;
  +[SBPPTOperation presentAppLibraryForTestWithName:](SBPPTOperation, "presentAppLibraryForTestWithName:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v7;
  +[SBPPTOperation presentAppLibrarySearchByTappingSearchField](SBPPTOperation, "presentAppLibrarySearchByTappingSearchField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v8;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__SBPPTRunner_AppLibraryPPTSupport___runLibrarySearchTestWithOptions___block_invoke;
  v18[3] = &unk_1E8EC0EE8;
  v18[4] = self;
  v19 = v4;
  v14 = v4;
  +[SBPPTRecapPerformanceTestingOperation scrollViewRecapPerformanceTestOperationWithBlock:](SBPPTRecapPerformanceTestingOperation, "scrollViewRecapPerformanceTestOperationWithBlock:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v9;
  +[SBPPTOperation operationToWaitForTimeInterval:](SBPPTOperation, "operationToWaitForTimeInterval:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  +[SBPPTOperation dismissAppLibrarySearch](SBPPTBlockOperation, "dismissAppLibrarySearch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v11;
  +[SBPPTOperation resetAndPrepareforNextTest](SBPPTOperation, "resetAndPrepareforNextTest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v13);

}

id __70__SBPPTRunner_AppLibraryPPTSupport___runLibrarySearchTestWithOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_libraryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scrollToTopIfPossible:", 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D83C68]), "initWithTestName:scrollView:completionHandler:", *(_QWORD *)(a1 + 40), v3, 0);
  objc_msgSend(*(id *)(a1 + 32), "_configureParams:forScrollView:", v4, v3);

  return v4;
}

- (void)_runScrollWithinExpandedPodTestWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[12];

  v23[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:](SBPPTOperation, "dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v19;
  +[SBPPTOperation configureAppLibraryForAllAppsInOnePod](SBPPTOperation, "configureAppLibraryForAllAppsInOnePod");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v18;
  +[SBPPTOperation presentAppLibraryForTestWithName:](SBPPTOperation, "presentAppLibraryForTestWithName:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v17;
  +[SBPPTOperation operationToStartTest:](SBPPTOperation, "operationToStartTest:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v16;
  +[SBPPTOperation appLibraryExpandFirstPod](SBPPTOperation, "appLibraryExpandFirstPod");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "markStartSubTest:forTestName:", CFSTR("ExpandPod"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markFinishedSubTest:forTestName:", CFSTR("ExpandPod"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v6;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __80__SBPPTRunner_AppLibraryPPTSupport___runScrollWithinExpandedPodTestWithOptions___block_invoke;
  v21[3] = &unk_1E8EC0EE8;
  v21[4] = self;
  v22 = v4;
  v7 = v4;
  +[SBPPTRecapPerformanceTestingOperation scrollViewRecapPerformanceTestOperationWithBlock:](SBPPTRecapPerformanceTestingOperation, "scrollViewRecapPerformanceTestOperationWithBlock:", v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v8;
  +[SBPPTOperation appLibraryDismissExpandedPod](SBPPTOperation, "appLibraryDismissExpandedPod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markStartSubTest:forTestName:", CFSTR("CollapsePod"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "markFinishedSubTest:forTestName:", CFSTR("CollapsePod"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v11;
  +[SBPPTOperation operationToFinishTest:](SBPPTOperation, "operationToFinishTest:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v12;
  +[SBPPTOperation resetAndPrepareforNextTest](SBPPTBlockOperation, "resetAndPrepareforNextTest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v14);

}

id __80__SBPPTRunner_AppLibraryPPTSupport___runScrollWithinExpandedPodTestWithOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_libraryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scrollToTopIfPossible:", 0);
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("ScrollDeweyExpandedPod"), *(_QWORD *)(a1 + 40));
  v4 = objc_alloc(MEMORY[0x1E0D83C68]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__SBPPTRunner_AppLibraryPPTSupport___runScrollWithinExpandedPodTestWithOptions___block_invoke_2;
  v7[3] = &unk_1E8E9DED8;
  v8 = *(id *)(a1 + 40);
  v5 = (void *)objc_msgSend(v4, "initWithTestName:scrollView:completionHandler:", 0, v3, v7);
  objc_msgSend(*(id *)(a1 + 32), "_configureParams:forScrollView:", v5, v3);

  return v5;
}

uint64_t __80__SBPPTRunner_AppLibraryPPTSupport___runScrollWithinExpandedPodTestWithOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("ScrollDeweyExpandedPod"), *(_QWORD *)(a1 + 32));
}

- (void)_runPullToAppLibrarySearchTestWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[10];

  v14[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("testName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation operationToUnlockInterface](SBPPTOperation, "operationToUnlockInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v13;
  +[SBPPTOperation dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:](SBPPTOperation, "dismissOverlaysAndResetHomeScreenToLastIconPageAnimated:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v12;
  +[SBPPTOperation presentAppLibraryForTestWithName:](SBPPTOperation, "presentAppLibraryForTestWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v4;
  +[SBPPTOperation resetAppLibraryToTop](SBPPTOperation, "resetAppLibraryToTop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v5;
  +[SBPPTOperation operationToStartTest:](SBPPTOperation, "operationToStartTest:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v6;
  +[SBPPTOperation pullToAppLibrarySearch](SBPPTOperation, "pullToAppLibrarySearch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v7;
  +[SBPPTOperation dismissAppLibrarySearch](SBPPTOperation, "dismissAppLibrarySearch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v8;
  +[SBPPTOperation operationToFinishTest:](SBPPTOperation, "operationToFinishTest:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v9;
  +[SBPPTOperation resetAndPrepareforNextTest](SBPPTBlockOperation, "resetAndPrepareforNextTest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPPTOperation enqueueOperations:](SBPPTOperation, "enqueueOperations:", v11);

}

- (void)_configureParams:(id)a3 forScrollView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  CGRect v26;

  v25 = a3;
  v6 = a4;
  objc_msgSend(v25, "setPreventSheetDismissal:", 1);
  RPTAmplitudeFromPagesOfView();
  objc_msgSend(v25, "setAmplitude:");
  -[SBPPTRunner _libraryViewController](self, "_libraryViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "containerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  CGRectGetMaxY(v26);
  UIRectInset();

  UIRectInset();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    UIRectInset();
    v12 = v21;
    v14 = v22;
    v16 = v23;
    v18 = v24;
  }
  objc_msgSend(v25, "setScrollingBounds:", v12, v14, v16, v18);

}

- (id)_mainDisplayWindowScene
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedWindowScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_40_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __60__SBPPTRunner_AppLibraryPPTSupport___mainDisplayWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMainDisplayWindowScene");
}

- (id)_libraryViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isModalAppLibrarySupported"))
  {
    -[SBPPTRunner _mainDisplayWindowScene](self, "_mainDisplayWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modalLibraryController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "overlayLibraryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __29__SBPPTRunner_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance_29;
  sharedInstance___sharedInstance_29 = (uint64_t)v1;

}

@end
