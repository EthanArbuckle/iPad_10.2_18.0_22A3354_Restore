@implementation SBUISwitcherAnimationController

- (id)animationSettings
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);
  objc_msgSend(WeakRetained, "defaultTransitionAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SBUISwitcherAnimationController)initWithWorkspaceTransitionRequest:(id)a3 contentViewController:(id)a4 childAnimationControllers:(id)a5 animationBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBUISwitcherAnimationController *v15;
  SBUISwitcherAnimationController *v16;
  uint64_t v17;
  id animationBlock;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISwitcherAnimationController.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentViewController"));

    if (v14)
      goto LABEL_4;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISwitcherAnimationController.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workspaceTransitionRequest"));

  if (!v12)
    goto LABEL_15;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUISwitcherAnimationController.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("animationBlock"));

LABEL_4:
  v33.receiver = self;
  v33.super_class = (Class)SBUISwitcherAnimationController;
  v15 = -[SBUIWorkspaceAnimationController initWithWorkspaceTransitionRequest:](&v33, sel_initWithWorkspaceTransitionRequest_, v11);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_contentViewController, v12);
    v17 = MEMORY[0x1D17E5550](v14);
    animationBlock = v16->_animationBlock;
    v16->_animationBlock = (id)v17;

    *(&v16->_interruptible + 6) = 1;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v24, "addObserver:", v16);
          -[SBUIAnimationController addCoordinatingChildTransaction:withSchedulingPolicy:](v16, "addCoordinatingChildTransaction:withSchedulingPolicy:", v24, 0);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v21);
    }

    -[SBUIAnimationController addObserver:](v16, "addObserver:", v16);
  }

  return v16;
}

- (void)_didComplete
{
  id animationBlock;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v20;
  void *v21;
  objc_super v22;

  animationBlock = self->_animationBlock;
  self->_animationBlock = 0;

  if ((-[SBUISwitcherAnimationController isInterrupted](self, "isInterrupted") & 1) == 0)
  {
    -[SBUIWorkspaceAnimationController workspaceTransitionRequest](self, "workspaceTransitionRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUISwitcherAnimationController _layoutState](self, "_layoutState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unlockedEnvironmentMode");
    v7 = objc_msgSend(v5, "unlockedEnvironmentMode");
    v8 = objc_msgSend(v4, "source");
    v9 = v6 == 1 && v8 == 15;
    if (v9 || v7 != 3)
      goto LABEL_26;
    -[SBUISwitcherAnimationController _windowScene](self, "_windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeScreenController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "iconManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v11, "iconManager");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;

    objc_msgSend(v16, "presentHomeScreenIconsAnimated:", 0);
    -[SBUISwitcherAnimationController _previousLayoutState](self, "_previousLayoutState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unlockedEnvironmentMode");
    v20 = objc_msgSend(v4, "source") == 2 && v18 == 1;
    if (v12)
    {
      if ((objc_msgSend(v12, "isTodayOverlaySpotlightVisible") & 1) != 0)
      {
LABEL_18:
        v21 = v12;
LABEL_24:
        objc_msgSend(v21, "dismissTodayOverlayAnimated:", 0);
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
    }
    else if ((objc_msgSend(v11, "isTodayOverlaySpotlightVisible") & 1) != 0)
    {
      goto LABEL_23;
    }
    if (!v20 || !objc_msgSend(v16, "isOverlayTodayViewVisible"))
      goto LABEL_25;
    if (v12)
      goto LABEL_18;
LABEL_23:
    v21 = v11;
    goto LABEL_24;
  }
LABEL_27:
  v22.receiver = self;
  v22.super_class = (Class)SBUISwitcherAnimationController;
  -[SBUISwitcherAnimationController _didComplete](&v22, sel__didComplete);
}

- (void)_addSignpostsAndBeginAnimationTrackingForAnimationStart
{
  void *v3;
  void *v4;
  NSObject *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  -[SBUISwitcherAnimationController _layoutState](self, "_layoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISwitcherAnimationController _previousLayoutState](self, "_previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "unlockedEnvironmentMode") == 1)
  {
    if (objc_msgSend(v3, "unlockedEnvironmentMode") == 3)
    {
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_TO_APP_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
      }
      v6 = CFSTR("HomeToApp");
    }
    else
    {
      if (objc_msgSend(v3, "unlockedEnvironmentMode") != 2)
        goto LABEL_36;
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_HOME_TO_SWITCHER_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v16, 2u);
      }
      v6 = CFSTR("HomeToSwitcher");
    }
  }
  else if (objc_msgSend(v4, "unlockedEnvironmentMode") == 2)
  {
    if (objc_msgSend(v3, "unlockedEnvironmentMode") == 3)
    {
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)v15 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_SWITCHER_TO_APP_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v15, 2u);
      }
      v6 = CFSTR("SwitcherToApp");
    }
    else
    {
      if (objc_msgSend(v3, "unlockedEnvironmentMode") != 1)
        goto LABEL_36;
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)v14 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_SWITCHER_TO_HOME_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v14, 2u);
      }
      v6 = CFSTR("SwitcherToHome");
    }
  }
  else
  {
    if (objc_msgSend(v4, "unlockedEnvironmentMode") != 3)
      goto LABEL_36;
    if (objc_msgSend(v3, "unlockedEnvironmentMode") == 1)
    {
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_APP_TO_HOME_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v13, 2u);
      }
      v6 = CFSTR("AppToHome");
    }
    else if (objc_msgSend(v3, "unlockedEnvironmentMode") == 3)
    {
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_APP_TO_APP_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v12, 2u);
      }
      v6 = CFSTR("AppToApp");
    }
    else
    {
      if (objc_msgSend(v3, "unlockedEnvironmentMode") != 2)
        goto LABEL_36;
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)v11 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_APP_TO_SWITCHER_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", v11, 2u);
      }
      v6 = CFSTR("AppToSwitcher");
    }
  }

  kdebug_trace();
  if (-[SBUIAnimationController isInteractive](self, "isInteractive"))
    v7 = CFSTR("-Dragging");
  else
    v7 = CFSTR("-Animating");
  -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginActivityWithOptions:reason:", 0x200000000000, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISwitcherAnimationController setActivityToken:](self, "setActivityToken:", v10);

LABEL_36:
}

- (id)_previousLayoutState
{
  void *v2;
  void *v3;
  void *v4;

  -[SBUIWorkspaceAnimationController workspaceTransitionRequest](self, "workspaceTransitionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_startAnimation
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "SBUISwitcherAnimationController had to enable UIView animations because they were disabled", v1, 2u);
}

- (id)_layoutState
{
  void *v2;
  void *v3;
  void *v4;

  -[SBUIWorkspaceAnimationController workspaceTransitionRequest](self, "workspaceTransitionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updatePPTsForAnimationStart
{
  id *v2;
  int v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  int v9;
  id v10;
  int v11;
  id v12;
  int v13;
  id v14;
  int v15;
  id v16;
  int v17;
  id v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  void *v30;
  _QWORD v31[4];
  void *v32;

  v2 = (id *)MEMORY[0x1E0CEB258];
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "isRunningTest"))
  {
    v3 = objc_msgSend(*v2, "isRunningTest:", CFSTR("AppOpen"));
    v4 = *v2;
    if (v3)
    {
      objc_msgSend(v4, "finishedSubTest:forTest:", CFSTR("workspaceActivate"), CFSTR("AppOpen"));
      v5 = *v2;
      v6 = &__block_literal_global_50;
LABEL_18:
      objc_msgSend(v5, "installCACommitCompletionBlock:", v6);
      return;
    }
    v7 = objc_msgSend(v4, "isRunningTest:", CFSTR("AppClose"));
    v8 = *v2;
    if (v7)
    {
      objc_msgSend(v8, "finishedSubTest:forTest:", CFSTR("workspaceDeactivate"), CFSTR("AppClose"));
      v5 = *v2;
      v6 = &__block_literal_global_35_0;
      goto LABEL_18;
    }
    v9 = objc_msgSend(v8, "isRunningTest:", CFSTR("AppOpenInFolder"));
    v10 = *v2;
    if (v9)
    {
      objc_msgSend(v10, "finishedSubTest:forTest:", CFSTR("workspaceActivate"), CFSTR("AppOpenInFolder"));
      v5 = *v2;
      v6 = &__block_literal_global_36;
      goto LABEL_18;
    }
    v11 = objc_msgSend(v10, "isRunningTest:", CFSTR("AppCloseInFolder"));
    v12 = *v2;
    if (v11)
    {
      objc_msgSend(v12, "finishedSubTest:forTest:", CFSTR("workspaceDeactivate"), CFSTR("AppCloseInFolder"));
      v5 = *v2;
      v6 = &__block_literal_global_37;
      goto LABEL_18;
    }
    v13 = objc_msgSend(v12, "isRunningTest:", CFSTR("AppOpenCenterZoom"));
    v14 = *v2;
    if (v13)
    {
      objc_msgSend(v14, "finishedSubTest:forTest:", CFSTR("workspaceActivate"), CFSTR("AppOpenCenterZoom"));
      v5 = *v2;
      v6 = &__block_literal_global_38;
      goto LABEL_18;
    }
    v15 = objc_msgSend(v14, "isRunningTest:", CFSTR("AppCloseCenterZoom"));
    v16 = *v2;
    if (v15)
    {
      objc_msgSend(v16, "finishedSubTest:forTest:", CFSTR("workspaceDeactivate"), CFSTR("AppCloseCenterZoom"));
      v5 = *v2;
      v6 = &__block_literal_global_39;
      goto LABEL_18;
    }
    v17 = objc_msgSend(v16, "isRunningTest:", CFSTR("AppOpenInScreenTime"));
    v18 = *v2;
    if (v17)
    {
      objc_msgSend(v18, "finishedSubTest:forTest:", CFSTR("workspaceActivate"), CFSTR("AppOpenInScreenTime"));
      v5 = *v2;
      v6 = &__block_literal_global_40;
      goto LABEL_18;
    }
    v19 = objc_msgSend(v18, "isRunningTest:", CFSTR("AppCloseInScreenTime"));
    v20 = *v2;
    if (v19)
    {
      objc_msgSend(v20, "finishedSubTest:forTest:", CFSTR("workspaceDeactivate"), CFSTR("AppCloseInScreenTime"));
      v5 = *v2;
      v6 = &__block_literal_global_41_1;
      goto LABEL_18;
    }
    if ((objc_msgSend(v20, "isRunningTest:", CFSTR("AppSliderBringup")) & 1) != 0
      || (objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderBringupRotated")) & 1) != 0
      || (objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderBringupOverApp")) & 1) != 0
      || (objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderBringupOverAppRotated")) & 1) != 0
      || (objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderBringupOverAppInScreenTime")) & 1) != 0
      || objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderBringupOverAppInScreenTimeRotated")))
    {
      +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentTestName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = *v2;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_9;
      v31[3] = &unk_1E8E9DED8;
      v32 = v22;
      v24 = v22;
      objc_msgSend(v23, "installCACommitCompletionBlock:", v31);
      v25 = v32;
LABEL_26:

      return;
    }
    if ((objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismiss")) & 1) != 0
      || (objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismissRotated")) & 1) != 0
      || (objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismissOverApp")) & 1) != 0
      || (objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismissOverAppRotated")) & 1) != 0
      || (objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismissOverAppInScreenTime")) & 1) != 0
      || objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderDismissOverAppInScreenTimeRotated")))
    {
      +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "currentTestName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = *v2;
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_10;
      v29[3] = &unk_1E8E9DED8;
      v30 = v27;
      v24 = v27;
      objc_msgSend(v28, "installCACommitCompletionBlock:", v29);
      v25 = v30;
      goto LABEL_26;
    }
  }
}

- (void)setActivityToken:(id)a3
{
  objc_storeStrong((id *)&self->_activityToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityToken, 0);
  objc_storeStrong(&self->_animationBlock, 0);
  objc_destroyWeak((id *)&self->_contentViewController);
}

- (void)animationControllerDidFinishAnimation:(id)a3
{
  if (self == a3)
  {
    -[SBUISwitcherAnimationController _addSignpostsAndEndAnimationTrackingForAnimationEnd](self, "_addSignpostsAndEndAnimationTrackingForAnimationEnd");
    -[SBUISwitcherAnimationController _updatePPTsForAnimationEnd](self, "_updatePPTsForAnimationEnd");
  }
}

- (void)_updatePPTsForAnimationEnd
{
  id *v2;
  const __CFString *v3;
  int v4;
  id v5;
  const __CFString *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v2 = (id *)MEMORY[0x1E0CEB258];
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "isRunningTest"))
  {
    v3 = CFSTR("AppOpen");
    v4 = objc_msgSend(*v2, "isRunningTest:", CFSTR("AppOpen"));
    v5 = *v2;
    if (v4)
    {
LABEL_3:
      v6 = CFSTR("AppOpenAnimation");
LABEL_6:
      objc_msgSend(v5, "finishedSubTest:forTest:", v6, v3);
      return;
    }
    v3 = CFSTR("AppClose");
    v7 = objc_msgSend(v5, "isRunningTest:", CFSTR("AppClose"));
    v5 = *v2;
    if (v7)
      goto LABEL_5;
    v3 = CFSTR("AppOpenInFolder");
    v8 = objc_msgSend(v5, "isRunningTest:", CFSTR("AppOpenInFolder"));
    v5 = *v2;
    if (v8)
      goto LABEL_3;
    v3 = CFSTR("AppCloseInFolder");
    v9 = objc_msgSend(v5, "isRunningTest:", CFSTR("AppCloseInFolder"));
    v5 = *v2;
    if (v9)
      goto LABEL_5;
    v3 = CFSTR("AppOpenCenterZoom");
    v10 = objc_msgSend(v5, "isRunningTest:", CFSTR("AppOpenCenterZoom"));
    v5 = *v2;
    if (v10)
    {
      v6 = CFSTR("AppOpenCenterZoomAnimation");
      goto LABEL_6;
    }
    v3 = CFSTR("AppCloseCenterZoom");
    v11 = objc_msgSend(v5, "isRunningTest:", CFSTR("AppCloseCenterZoom"));
    v5 = *v2;
    if (v11)
    {
      v6 = CFSTR("AppCloseCenterZoomAnimation");
      goto LABEL_6;
    }
    v3 = CFSTR("AppOpenInScreenTime");
    v12 = objc_msgSend(v5, "isRunningTest:", CFSTR("AppOpenInScreenTime"));
    v5 = *v2;
    if (v12)
      goto LABEL_3;
    v3 = CFSTR("AppCloseInScreenTime");
    v13 = objc_msgSend(v5, "isRunningTest:", CFSTR("AppCloseInScreenTime"));
    v5 = *v2;
    if (v13)
    {
LABEL_5:
      v6 = CFSTR("AppCloseAnimation");
      goto LABEL_6;
    }
    if ((objc_msgSend(v5, "isRunningTest:", CFSTR("AppSliderBringup")) & 1) != 0
      || (objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderBringupRotated")) & 1) != 0
      || (objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderBringupOverApp")) & 1) != 0
      || (objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderBringupOverAppRotated")) & 1) != 0
      || (objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderBringupOverAppInScreenTime")) & 1) != 0
      || objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderBringupOverAppInScreenTimeRotated")))
    {
      +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentTestName");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*v2, "finishedSubTest:forTest:", CFSTR("AppSliderBringupAnimation"), v18);
      v15 = *v2;
LABEL_22:
      objc_msgSend(v15, "finishedTest:", v18);
LABEL_23:

      return;
    }
    if ((objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderDismiss")) & 1) != 0
      || objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderDismissRotated")))
    {
      +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentTestName");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)SBApp, "finishedSubTest:forTest:", CFSTR("animation"), v18);
      v15 = (id)SBApp;
      goto LABEL_22;
    }
    if ((objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderDismissOverApp")) & 1) != 0
      || (objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderDismissOverAppRotated")) & 1) != 0
      || (objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderDismissOverAppInScreenTime")) & 1) != 0
      || objc_msgSend(*v2, "isRunningTest:", CFSTR("AppSliderDismissOverAppInScreenTimeRotated")))
    {
      +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentTestName");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)SBApp, "finishedSubTest:forTest:", CFSTR("animation"), v18);
      objc_msgSend((id)SBApp, "finishedTest:", v18);
      SBWorkspaceSuspendActiveDisplay();
      goto LABEL_23;
    }
    if (objc_msgSend((id)SBApp, "isRunningTest:", CFSTR("AppSliderTapContinuityBanner")))
      objc_msgSend(*v2, "finishedTest:", CFSTR("AppSliderTapContinuityBanner"));
  }
}

- (void)_addSignpostsAndEndAnimationTrackingForAnimationEnd
{
  void *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int16 v12;
  uint8_t buf[16];
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;

  -[SBUISwitcherAnimationController _layoutState](self, "_layoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUISwitcherAnimationController _previousLayoutState](self, "_previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "unlockedEnvironmentMode") == 1)
  {
    if (objc_msgSend(v3, "unlockedEnvironmentMode") != 3)
    {
      if (objc_msgSend(v3, "unlockedEnvironmentMode") != 2)
        goto LABEL_28;
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v5))
        goto LABEL_27;
      v16 = 0;
      v6 = "SB_HOME_TO_SWITCHER_ANIMATION";
      v7 = (uint8_t *)&v16;
      goto LABEL_26;
    }
    SBLogTelemetrySignposts();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      v17 = 0;
      v6 = "SB_HOME_TO_APP_ANIMATION";
      v7 = (uint8_t *)&v17;
LABEL_26:
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v6, " enableTelemetry=YES  isAnimation=YES ", v7, 2u);
    }
  }
  else if (objc_msgSend(v4, "unlockedEnvironmentMode") == 2)
  {
    if (objc_msgSend(v3, "unlockedEnvironmentMode") != 3)
    {
      if (objc_msgSend(v3, "unlockedEnvironmentMode") != 1)
        goto LABEL_28;
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v5))
        goto LABEL_27;
      v14 = 0;
      v6 = "SB_SWITCHER_TO_HOME_ANIMATION";
      v7 = (uint8_t *)&v14;
      goto LABEL_26;
    }
    SBLogTelemetrySignposts();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      v15 = 0;
      v6 = "SB_SWITCHER_TO_APP_ANIMATION";
      v7 = (uint8_t *)&v15;
      goto LABEL_26;
    }
  }
  else
  {
    if (objc_msgSend(v4, "unlockedEnvironmentMode") != 3)
      goto LABEL_28;
    if (objc_msgSend(v3, "unlockedEnvironmentMode") == 1)
    {
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_APP_TO_HOME_ANIMATION", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
      }
      goto LABEL_27;
    }
    if (objc_msgSend(v3, "unlockedEnvironmentMode") == 3)
    {
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        v12 = 0;
        v6 = "SB_APP_TO_APP_ANIMATION";
        v7 = (uint8_t *)&v12;
        goto LABEL_26;
      }
    }
    else
    {
      if (objc_msgSend(v3, "unlockedEnvironmentMode") != 2)
        goto LABEL_28;
      SBLogTelemetrySignposts();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v5))
      {
        LOWORD(v11) = 0;
        v6 = "SB_APP_TO_SWITCHER_ANIMATION";
        v7 = (uint8_t *)&v11;
        goto LABEL_26;
      }
    }
  }
LABEL_27:

  kdebug_trace();
LABEL_28:
  -[SBUISwitcherAnimationController activityToken](self, "activityToken", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((-[SBUISwitcherAnimationController isInterrupted](self, "isInterrupted") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUISwitcherAnimationController activityToken](self, "activityToken");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endActivity:", v10);

    }
    -[SBUISwitcherAnimationController setActivityToken:](self, "setActivityToken:", 0);
  }

}

- (NSObject)activityToken
{
  return self->_activityToken;
}

- (BOOL)isReasonableMomentToInterrupt
{
  return 1;
}

- (BOOL)isInterruptible
{
  id WeakRetained;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUISwitcherAnimationController;
  if (!-[SBUISwitcherAnimationController isInterruptible](&v6, sel_isInterruptible)
    || !-[SBUISwitcherAnimationController _isInterruptible](self, "_isInterruptible"))
  {
    return 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);
  v4 = objc_msgSend(WeakRetained, "canInterruptActiveTransition");

  return v4;
}

- (BOOL)shouldResignActiveForAnimation
{
  return 0;
}

- (id)_windowScene
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "_sbWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIWorkspaceAnimationController workspaceTransitionRequest](self, "workspaceTransitionRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowSceneForDisplayIdentity:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppOpenAnimation"), CFSTR("AppOpen"));
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_2()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppCloseAnimation"), CFSTR("AppClose"));
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_3()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppOpenAnimation"), CFSTR("AppOpenInFolder"));
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_4()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppCloseAnimation"), CFSTR("AppCloseInFolder"));
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_5()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppOpenCenterZoomAnimation"), CFSTR("AppOpenCenterZoom"));
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_6()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppCloseCenterZoomAnimation"), CFSTR("AppCloseCenterZoom"));
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_7()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppOpenAnimation"), CFSTR("AppOpenInScreenTime"));
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_8()
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "startedSubTest:forTest:", CFSTR("AppCloseAnimation"), CFSTR("AppCloseInScreenTime"));
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_9(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("AppSliderBringupAnimation"), *(_QWORD *)(a1 + 32));
}

uint64_t __63__SBUISwitcherAnimationController__updatePPTsForAnimationStart__block_invoke_10(uint64_t a1)
{
  id *v2;

  v2 = (id *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "finishedSubTest:forTest:", CFSTR("delay"), *(_QWORD *)(a1 + 32));
  return objc_msgSend(*v2, "startedSubTest:forTest:", CFSTR("animation"), *(_QWORD *)(a1 + 32));
}

- (BOOL)_isInterruptible
{
  return *(&self->_interruptible + 6);
}

- (void)_setInterruptible:(BOOL)a3
{
  *(&self->_interruptible + 6) = a3;
}

- (SBSwitcherContentViewControlling)contentViewController
{
  return (SBSwitcherContentViewControlling *)objc_loadWeakRetained((id *)&self->_contentViewController);
}

- (void)setContentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_contentViewController, a3);
}

- (id)animationBlock
{
  return self->_animationBlock;
}

- (void)setAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

@end
