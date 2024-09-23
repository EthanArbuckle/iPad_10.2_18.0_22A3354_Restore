@implementation SBAppToAppWorkspaceTransaction

- (void)_beginTransition
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  SBAutoPIPWorkspaceTransaction *v12;
  void *v13;
  SBAutoPIPWorkspaceTransaction *v14;
  SBAutoPIPWorkspaceTransaction *autoPIPTransaction;
  OS_dispatch_group *v16;
  OS_dispatch_group *pipDuringSwitchTransitionTasksGroup;
  int64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disablesAutoPIP");

  if ((v5 & 1) == 0)
  {
    v29 = 0;
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:tetheringMode:reason:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:tetheringMode:reason:", v6, &v29, 2);

    v8 = -[SBToAppsWorkspaceTransaction isGoingToMainSwitcher](self, "isGoingToMainSwitcher");
    if (-[SBToAppsWorkspaceTransaction isGoingToLauncher](self, "isGoingToLauncher"))
    {
      -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "source");

      LOBYTE(v11) = 0;
      if (v10 == 11 && v29 != 1)
        v11 = !SBReduceMotion();
    }
    else
    {
      LOBYTE(v11) = 0;
    }
    if (v7 && !v8 && !v11)
    {
      -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](self->_autoPIPTransaction, "setCompletionBlock:", 0);
      if (-[SBAutoPIPWorkspaceTransaction isRunning](self->_autoPIPTransaction, "isRunning"))
        -[SBAutoPIPWorkspaceTransaction interruptWithReason:](self->_autoPIPTransaction, "interruptWithReason:", CFSTR("NewTransition"));
      v12 = [SBAutoPIPWorkspaceTransaction alloc];
      -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SBAutoPIPWorkspaceTransaction initWithTransitionRequest:includeActiveAppEntity:reason:](v12, "initWithTransitionRequest:includeActiveAppEntity:reason:", v13, 0, 2);
      autoPIPTransaction = self->_autoPIPTransaction;
      self->_autoPIPTransaction = v14;

      v16 = (OS_dispatch_group *)dispatch_group_create();
      pipDuringSwitchTransitionTasksGroup = self->_pipDuringSwitchTransitionTasksGroup;
      self->_pipDuringSwitchTransitionTasksGroup = v16;

      v18 = -[SBAutoPIPWorkspaceTransaction transitionStyle](self->_autoPIPTransaction, "transitionStyle");
      v19 = 1;
      if (v18 == 2)
        v19 = 2;
      self->_autoPIPTransitionOrder = v19;
    }
  }
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "source");

  if (v21 == 53)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = -1;
    -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __50__SBAppToAppWorkspaceTransaction__beginTransition__block_invoke;
    v28[3] = &unk_1E8E9F320;
    v28[4] = &v29;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v28);

    if (v30[3] != -1)
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pipControllerForType:", v30[3]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v24, "hostedAppSceneHandles");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setWithArray:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "handleDestructionRequestForSceneHandles:", v27);
    }
    _Block_object_dispose(&v29, 8);
  }
}

- (void)_clearAnimation
{
  SBUIAnimationController *animation;
  objc_super v4;

  animation = self->_animation;
  self->_animation = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBAppToAppWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction _clearAnimation](&v4, sel__clearAnimation);
}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "retainsSiri");

  if (v4)
    v5 = -9;
  else
    v5 = -1;
  if (objc_msgSend(v2, "shouldPreventEmergencyNotificationBannerDismissal"))
  {
    objc_msgSend((id)SBApp, "notificationDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bannerDestination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isPresentingEmergencyNotification");

    if (v8)
      v5 &= ~0x20uLL;
  }
  if (objc_msgSend(v2, "source") == 56 || objc_msgSend(v2, "source") == 69)
    v5 &= ~0x20uLL;
  v9 = objc_msgSend(v2, "source");
  v10 = objc_msgSend(v2, "source");
  if (v9 == 64 || v10 == 65)
    v12 = v5 & 0xFFFFFFFFFFFFFFFELL;
  else
    v12 = v5;
  v13 = objc_msgSend(v2, "source");
  v14 = objc_msgSend(v2, "source");
  if (v13 == 37 || v14 == 70)
    v16 = 0;
  else
    v16 = v12;
  if (objc_msgSend(v2, "source") == 71)
    v16 &= ~0x20uLL;

  return v16;
}

- (BOOL)_hasPreAnimationTasks
{
  SBAutoPIPWorkspaceTransaction *autoPIPTransaction;
  void *v4;
  BOOL v5;

  autoPIPTransaction = self->_autoPIPTransaction;
  if (!autoPIPTransaction)
    return 0;
  -[SBAutoPIPWorkspaceTransaction entityToPIP](autoPIPTransaction, "entityToPIP");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = self->_autoPIPTransitionOrder == 0;
  else
    v5 = 0;

  return v5;
}

- (unint64_t)_concurrentOverlayDismissalOptions
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "source");

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "source");

  v8 = v6 == 70 || v4 == 37;
  return v8 << 63 >> 63;
}

- (BOOL)shouldAnimateOrientationChangeOnCompletion
{
  return 1;
}

- (void)_begin
{
  objc_super v3;

  -[SBToAppsWorkspaceTransaction activateApplications](self, "activateApplications");
  v3.receiver = self;
  v3.super_class = (Class)SBAppToAppWorkspaceTransaction;
  -[SBAppToAppWorkspaceTransaction _begin](&v3, sel__begin);
}

- (void)_animationWillBegin:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SBAutoPIPWorkspaceTransaction *autoPIPTransaction;
  void *v11;
  unint64_t autoPIPTransitionOrder;
  OS_dispatch_group *v13;
  SBAutoPIPWorkspaceTransaction *v14;
  OS_dispatch_group *v15;
  _QWORD v16[4];
  OS_dispatch_group *v17;

  if (a3)
  {
    -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[SBToAppsWorkspaceTransaction fromApplicationSceneEntities](self, "fromApplicationSceneEntities");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (!v6)
        objc_msgSend((id)SBApp, "_accessibilityActivationAnimationWillBegin");
    }
    else
    {

    }
    -[SBToAppsWorkspaceTransaction fromApplicationSceneEntities](self, "fromApplicationSceneEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (!v9)
        objc_msgSend((id)SBApp, "_accessibilityDeactivationAnimationWillBegin");
    }
    else
    {

    }
  }
  autoPIPTransaction = self->_autoPIPTransaction;
  if (autoPIPTransaction)
  {
    -[SBAutoPIPWorkspaceTransaction entityToPIP](autoPIPTransaction, "entityToPIP");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      autoPIPTransitionOrder = self->_autoPIPTransitionOrder;

      if (autoPIPTransitionOrder == 1)
      {
        v13 = self->_pipDuringSwitchTransitionTasksGroup;
        dispatch_group_enter((dispatch_group_t)v13);
        v14 = self->_autoPIPTransaction;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __54__SBAppToAppWorkspaceTransaction__animationWillBegin___block_invoke;
        v16[3] = &unk_1E8E9E980;
        v17 = v13;
        v15 = v13;
        -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](v14, "setCompletionBlock:", v16);
        -[SBAppToAppWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_autoPIPTransaction);

      }
    }
  }
}

- (id)_setupAnimation
{
  void *v3;
  void *v4;
  void *v5;

  -[SBToAppsWorkspaceTransaction fromApplicationSceneEntities](self, "fromApplicationSceneEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppToAppWorkspaceTransaction _setupAnimationFrom:to:](self, "_setupAnimationFrom:to:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_animation, v5);
  return v5;
}

- (BOOL)_shouldResignActiveForAnimation
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAppToAppWorkspaceTransaction;
  v3 = -[SBToAppsWorkspaceTransaction _shouldResignActiveForAnimation](&v5, sel__shouldResignActiveForAnimation);
  if (v3)
    LOBYTE(v3) = -[SBToAppsWorkspaceTransaction toAndFromAppsDiffer](self, "toAndFromAppsDiffer");
  return v3;
}

- (SBAppToAppWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  id v4;
  SBAppToAppWorkspaceTransaction *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBAppToAppWorkspaceTransaction;
  v5 = -[SBToAppsWorkspaceTransaction initWithTransitionRequest:](&v16, sel_initWithTransitionRequest_, v4);
  if (v5 && SBMainWorkspaceTransitionSourceIsUserEventDriven(objc_msgSend(v4, "source")))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SBToAppsWorkspaceTransaction allLayoutTransactions](v5, "allLayoutTransactions", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "setOptions:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "options") | 2);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (void)_didComplete
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[SBAppToAppWorkspaceTransaction _cleanUpAfterAnimation](self, "_cleanUpAfterAnimation");
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowIconRotation:forReason:", 1, v5);

  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHomeScreenAutorotatesEvenWhenIconIsDragging:", 0);

  if (!-[SBAppToAppWorkspaceTransaction preventWhitePointAdaptationStrengthUpdateOnComplete](self, "preventWhitePointAdaptationStrengthUpdateOnComplete"))
  {
    +[SBSceneLayoutWhitePointAdaptationController sharedInstance](SBSceneLayoutWhitePointAdaptationController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateWhitePointAdaptationStrength");

  }
  v8.receiver = self;
  v8.super_class = (Class)SBAppToAppWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction _didComplete](&v8, sel__didComplete);
}

void __57__SBAppToAppWorkspaceTransaction__setupAnimationFrom_to___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  +[SBSceneLayoutWhitePointAdaptationController sharedInstance](SBSceneLayoutWhitePointAdaptationController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWhitePointAdaptationStrengthWithWorkspaceTransitionRequest:animationTransitionContext:", *(_QWORD *)(a1 + 32), v3);

}

- (id)_setupAnimationFrom:(id)a3 to:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  objc_class *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v31[4];
  id v32;

  -[SBWorkspaceTransaction suggestedAnimationController](self, "suggestedAnimationController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBWorkspaceTransaction setSuggestedAnimationController:](self, "setSuggestedAnimationController:", 0);
    v6 = v5;
  }
  else
  {
    -[SBToAppsWorkspaceTransaction _transitionContext](self, "_transitionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBToAppsWorkspaceTransaction isGoingToLauncher](self, "isGoingToLauncher"))
    {
      +[SBUIController sharedInstance](SBUIController, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHomeScreenAutorotatesEvenWhenIconIsDragging:", 1);

      objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:logMessage:", objc_msgSend(v7, "interfaceOrientationOrPreferredOrientation"), CFSTR("AppToApp setting up animation to launcher / switcher"));
      v9 = objc_opt_class();
      objc_msgSend(v7, "previousEntityForLayoutRole:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast(v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectForDeactivationSetting:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 0.0;
      if (v12)
      {
        objc_msgSend(v12, "doubleValue");
        v16 = v15;
        if (v15 <= 3.0)
        {
          v14 = v15;
        }
        else
        {
          SBLogCommon();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[SBAppToAppWorkspaceTransaction _setupAnimationFrom:to:].cold.1((uint64_t)v11, v17, v16);

        }
      }
      objc_msgSend((id)SBApp, "_accessibilityDeactivationAnimationStartDelay");
      if (v14 + v20 > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forDeactivationSetting:", v21, 2);

      }
    }
    else
    {
      if (-[SBToAppsWorkspaceTransaction isGoingToMainSwitcher](self, "isGoingToMainSwitcher"))
      {
        +[SBUIController sharedInstance](SBUIController, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setHomeScreenAutorotatesEvenWhenIconIsDragging:", 1);

        objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:logMessage:", objc_msgSend(v7, "interfaceOrientationOrPreferredOrientation"), CFSTR("AppToApp setting up animation to launcher / switcher"));
      }
      +[SBUIController sharedInstance](SBUIController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAllowIconRotation:forReason:", 0, v13);
    }

    -[SBWorkspaceTransaction windowScene](self, "windowScene");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "switcherController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "switcherCoordinator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBToAppsWorkspaceTransaction ancillaryTransitionRequests](self, "ancillaryTransitionRequests");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "animationControllerForTransitionRequest:ancillaryTransitionRequests:", v25, v26);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionCoordinator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __57__SBAppToAppWorkspaceTransaction__setupAnimationFrom_to___block_invoke;
    v31[3] = &unk_1E8EB85C0;
    v32 = v27;
    v29 = v27;
    objc_msgSend(v28, "animateAlongsideTransition:completion:", v31, 0);

  }
  return v6;
}

- (BOOL)preventWhitePointAdaptationStrengthUpdateOnComplete
{
  return self->_preventWhitePointAdaptationStrengthUpdateOnComplete;
}

- (void)_cleanUpAfterAnimation
{
  -[SBAppToAppWorkspaceTransaction _clearAnimation](self, "_clearAnimation");
  -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](self->_autoPIPTransaction, "setCompletionBlock:", 0);
  -[SBToAppsWorkspaceTransaction performToAppStateCleanup](self, "performToAppStateCleanup");
}

- (BOOL)_canBeInterrupted
{
  BOOL v3;
  void *v4;

  if (-[SBWorkspaceTransaction _isInterruptingForTransitionRequest](self, "_isInterruptingForTransitionRequest"))
    return 1;
  -[SBToAppsWorkspaceTransaction animationController](self, "animationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 == 0;

  return v3;
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "canInterruptTransaction:forTransitionRequest:", self, v4);

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipDuringSwitchTransitionTasksGroup, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_autoPIPTransaction, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](self->_autoPIPTransaction, "setCompletionBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBAppToAppWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldPerformToAppStateCleanupOnCompletion
{
  return 0;
}

- (BOOL)_hasPostAnimationTasks
{
  SBAutoPIPWorkspaceTransaction *autoPIPTransaction;
  BOOL v4;
  void *v5;

  autoPIPTransaction = self->_autoPIPTransaction;
  if (!autoPIPTransaction || (-[SBAutoPIPWorkspaceTransaction isComplete](autoPIPTransaction, "isComplete") & 1) != 0)
    return 0;
  -[SBAutoPIPWorkspaceTransaction entityToPIP](self->_autoPIPTransaction, "entityToPIP");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v4 = self->_autoPIPTransitionOrder - 1 < 2;
  else
    v4 = 0;

  return v4;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBAppToAppWorkspaceTransaction;
  -[SBAppToAppWorkspaceTransaction debugDescription](&v10, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBToAppsWorkspaceTransaction fromApplicationSceneEntities](self, "fromApplicationSceneEntities");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("SpringBoard");
  -[SBToAppsWorkspaceTransaction animationController](self, "animationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n\tfromApps = %@\n\tanimation = %@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __50__SBAppToAppWorkspaceTransaction__beginTransition__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;

  objc_msgSend(a2, "objectForActivationSetting:", 57);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v5, "integerValue");
    v5 = v6;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != -1)
    *a3 = 1;

}

- (BOOL)_transitionWasCancelled
{
  return -[SBUIAnimationController transitionWasCancelled](self->_animation, "transitionWasCancelled");
}

- (void)_performPreAnimationTasksWithCompletion:(id)a3
{
  id v4;
  SBAutoPIPWorkspaceTransaction *autoPIPTransaction;
  void *v6;
  unint64_t autoPIPTransitionOrder;
  SBAutoPIPWorkspaceTransaction *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  autoPIPTransaction = self->_autoPIPTransaction;
  if (autoPIPTransaction)
  {
    -[SBAutoPIPWorkspaceTransaction entityToPIP](autoPIPTransaction, "entityToPIP");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      autoPIPTransitionOrder = self->_autoPIPTransitionOrder;

      if (!autoPIPTransitionOrder)
      {
        v8 = self->_autoPIPTransaction;
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __74__SBAppToAppWorkspaceTransaction__performPreAnimationTasksWithCompletion___block_invoke;
        v9[3] = &unk_1E8E9F1C0;
        v10 = v4;
        -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](v8, "setCompletionBlock:", v9);
        -[SBAppToAppWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_autoPIPTransaction);

      }
    }
  }

}

uint64_t __74__SBAppToAppWorkspaceTransaction__performPreAnimationTasksWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_performPostAnimationTasksWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  SBAutoPIPWorkspaceTransaction *autoPIPTransaction;
  void *v6;
  unint64_t autoPIPTransitionOrder;
  NSObject *pipDuringSwitchTransitionTasksGroup;
  void *v9;
  void *v10;
  unint64_t v11;
  SBAutoPIPWorkspaceTransaction *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  void (**v17)(_QWORD);
  _QWORD block[4];
  void (**v19)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  autoPIPTransaction = self->_autoPIPTransaction;
  if (autoPIPTransaction)
  {
    -[SBAutoPIPWorkspaceTransaction entityToPIP](autoPIPTransaction, "entityToPIP");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      autoPIPTransitionOrder = self->_autoPIPTransitionOrder;

      if (autoPIPTransitionOrder == 1)
      {
        pipDuringSwitchTransitionTasksGroup = self->_pipDuringSwitchTransitionTasksGroup;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __75__SBAppToAppWorkspaceTransaction__performPostAnimationTasksWithCompletion___block_invoke;
        block[3] = &unk_1E8E9E8D0;
        v19 = v4;
        dispatch_group_notify(pipDuringSwitchTransitionTasksGroup, MEMORY[0x1E0C80D38], block);
        v9 = v19;
LABEL_8:

        goto LABEL_11;
      }
    }
    -[SBAutoPIPWorkspaceTransaction entityToPIP](self->_autoPIPTransaction, "entityToPIP");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = self->_autoPIPTransitionOrder;

      if (v11 == 2)
      {
        v12 = self->_autoPIPTransaction;
        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __75__SBAppToAppWorkspaceTransaction__performPostAnimationTasksWithCompletion___block_invoke_2;
        v16 = &unk_1E8E9F1C0;
        v17 = v4;
        -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](v12, "setCompletionBlock:", &v13);
        -[SBAppToAppWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_autoPIPTransaction, v13, v14, v15, v16);
        v9 = v17;
        goto LABEL_8;
      }
    }
  }
  if (v4)
    v4[2](v4);
LABEL_11:

}

uint64_t __75__SBAppToAppWorkspaceTransaction__performPostAnimationTasksWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __75__SBAppToAppWorkspaceTransaction__performPostAnimationTasksWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_handleApplicationDidNotChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SBToAppsWorkspaceTransaction toApplicationSceneEntities](self, "toApplicationSceneEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v10, "BOOLForActivationSetting:", 41) & 1) != 0
          || (objc_msgSend(v10, "BOOLForActivationSetting:", 54) & 1) != 0)
        {
          objc_msgSend((id)SBApp, "windowSceneManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "sceneHandle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "windowSceneForSceneHandle:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)SBApp, "bannerManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "dismissAllBannersInWindowScene:animated:reason:", v13, 1, CFSTR("appToAppFromBanner"));

          v5 = (void *)v13;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  v15.receiver = self;
  v15.super_class = (Class)SBAppToAppWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction _handleApplicationDidNotChange:](&v15, sel__handleApplicationDidNotChange_, v4);

}

- (void)_handleApplicationUpdateScenesTransactionFailed:(id)a3
{
  id v4;

  -[SBToAppsWorkspaceTransaction animationController](self, "animationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "waitingToStart"))
  {
    objc_msgSend(v4, "interrupt");
    -[SBAppToAppWorkspaceTransaction _cleanUpAfterAnimation](self, "_cleanUpAfterAnimation");
  }

}

void __54__SBAppToAppWorkspaceTransaction__animationWillBegin___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setPreventWhitePointAdaptationStrengthUpdateOnComplete:(BOOL)a3
{
  self->_preventWhitePointAdaptationStrengthUpdateOnComplete = a3;
}

- (void)_setupAnimationFrom:(double)a3 to:.cold.1(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a3;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Ignoring too long suspension animation delay %f for %@", (uint8_t *)&v3, 0x16u);
}

@end
