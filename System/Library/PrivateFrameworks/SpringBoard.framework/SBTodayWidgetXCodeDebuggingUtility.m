@implementation SBTodayWidgetXCodeDebuggingUtility

- (SBTodayWidgetXCodeDebuggingUtility)init
{
  SBTodayWidgetXCodeDebuggingUtility *v2;
  uint64_t v3;
  SBLockScreenManager *lockScreenManager;
  void *v5;
  uint64_t v6;
  SBMainDisplayPolicyAggregator *policyAggregator;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBTodayWidgetXCodeDebuggingUtility;
  v2 = -[SBTodayWidgetXCodeDebuggingUtility init](&v9, sel_init);
  if (v2)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    lockScreenManager = v2->_lockScreenManager;
    v2->_lockScreenManager = (SBLockScreenManager *)v3;

    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "policyAggregator");
    v6 = objc_claimAutoreleasedReturnValue();
    policyAggregator = v2->_policyAggregator;
    v2->_policyAggregator = (SBMainDisplayPolicyAggregator *)v6;

  }
  return v2;
}

- (void)launchTodayViewFromCurrentContextWithCompletion:(id)a3
{
  id v4;
  SBDismissOverlaysAnimationController *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  SBTodayWidgetXCodeDebuggingUtility *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBDismissOverlaysAnimationController initWithTransitionContextProvider:options:]([SBDismissOverlaysAnimationController alloc], "initWithTransitionContextProvider:options:", 0, -1);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __86__SBTodayWidgetXCodeDebuggingUtility_launchTodayViewFromCurrentContextWithCompletion___block_invoke;
  v12 = &unk_1E8E9F230;
  v13 = self;
  v14 = v4;
  v6 = v4;
  -[SBDismissOverlaysAnimationController setCompletionBlock:](v5, "setCompletionBlock:", &v9);
  -[SBDismissOverlaysAnimationController begin](v5, "begin", v9, v10, v11, v12, v13);
  SBLogDashBoard();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[SBDismissOverlaysAnimationController debugDescription](v5, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "dismissOverlaysAnimationController: %@", buf, 0xCu);

  }
}

uint64_t __86__SBTodayWidgetXCodeDebuggingUtility_launchTodayViewFromCurrentContextWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "dismiss overlays animation controller finished.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_reallyLaunchTodayViewFromCurrentContextWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_reallyLaunchTodayViewFromCurrentContextWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  _BOOL4 v5;
  SBMainDisplayPolicyAggregator *policyAggregator;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  void *v17;
  const __CFString **v18;
  uint64_t *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(id, _QWORD, void *);
  _QWORD v23[4];
  id v24;
  void (**v25)(id, _QWORD, void *);
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = -[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked");
  policyAggregator = self->_policyAggregator;
  if (v5)
  {
    if (-[SBMainDisplayPolicyAggregator allowsCapability:](policyAggregator, "allowsCapability:", 22))
    {
      -[SBLockScreenManager lockScreenEnvironment](self->_lockScreenManager, "lockScreenEnvironment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rootViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (v4 && (isKindOfClass & 1) == 0)
      {
        v10 = (void *)MEMORY[0x1E0CB35C8];
        v28 = *MEMORY[0x1E0CB2D50];
        v29 = CFSTR("DashBoard is required to work in the lock-screen.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("SBTodayWidgetLaunchErrorDomain"), 2, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, 0, v12);

      }
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke;
      v23[3] = &unk_1E8EA02D8;
      v13 = v8;
      v24 = v13;
      v25 = v4;
      v14 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v23);
      +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isCoverSheetHostingAnApp"))
        objc_msgSend(v15, "setCoverSheetPresented:animated:withCompletion:", 1, 1, v14);
      else
        v14[2](v14);

      goto LABEL_17;
    }
    if (v4)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2D50];
      v31[0] = CFSTR("Today view is restricted.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = (const __CFString **)v31;
      v19 = &v30;
LABEL_14:
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("SBTodayWidgetLaunchErrorDomain"), 1, v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v20);

      goto LABEL_17;
    }
  }
  else
  {
    if (-[SBMainDisplayPolicyAggregator allowsCapability:](policyAggregator, "allowsCapability:", 23))
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_3;
      v21[3] = &unk_1E8E9F1C0;
      v22 = v4;
      SBWorkspaceForceToSpringBoard(v21);
      v13 = v22;
LABEL_17:

      goto LABEL_18;
    }
    if (v4)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27 = CFSTR("Today view is restricted.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = &v27;
      v19 = &v26;
      goto LABEL_14;
    }
  }
LABEL_18:

}

void __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_2;
  v3[3] = &unk_1E8E9E8D0;
  v1 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v2 = v1;
  objc_msgSend(v2, "activateTodayViewWithCompletion:", v3);

}

uint64_t __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

void __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_4;
  v3[3] = &unk_1E8E9E8D0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "activateTodayViewWithCompletion:", v3);

}

uint64_t __93__SBTodayWidgetXCodeDebuggingUtility__reallyLaunchTodayViewFromCurrentContextWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyAggregator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

@end
