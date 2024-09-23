@implementation SBAffordancePresenceController

- (void)setAutoHideAffordance:(BOOL)a3
{
  if (self->_autoHideAffordance != a3)
  {
    self->_autoHideAffordance = a3;
    -[SBAffordancePresenceController _updateIdleTouchAwarenessClient](self, "_updateIdleTouchAwarenessClient");
  }
}

- (SBAffordancePresenceController)initWithDelegate:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  SBAffordancePresenceController *v8;
  SBAffordancePresenceController *v9;
  uint64_t v10;
  SBAppSwitcherSettings *appSwitcherSettings;
  uint64_t v12;
  SBFHomeGrabberSettings *homeGrabberSettings;
  id v14;
  void *v15;
  void *v16;
  SBAttentionAwarenessClient *v17;
  SBAttentionAwarenessClient *idleTouchAwarenessClient;
  void *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBAffordancePresenceController;
  v8 = -[SBAffordancePresenceController init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SBAffordancePresenceController setDelegate:](v8, "setDelegate:", v6);
    v9->_autoHideAffordance = 0;
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v10 = objc_claimAutoreleasedReturnValue();
    appSwitcherSettings = v9->_appSwitcherSettings;
    v9->_appSwitcherSettings = (SBAppSwitcherSettings *)v10;

    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v12 = objc_claimAutoreleasedReturnValue();
    homeGrabberSettings = v9->_homeGrabberSettings;
    v9->_homeGrabberSettings = (SBFHomeGrabberSettings *)v12;

    -[SBFHomeGrabberSettings addKeyPathObserver:](v9->_homeGrabberSettings, "addKeyPathObserver:", v9);
    v14 = objc_alloc_init(MEMORY[0x1E0CFEC08]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIdentifier:", v16);

    objc_msgSend(v14, "setEventMask:", 8);
    -[SBFHomeGrabberSettings autoHideTime](v9->_homeGrabberSettings, "autoHideTime");
    objc_msgSend(v14, "setAttentionLostTimeout:");
    v17 = objc_alloc_init(SBAttentionAwarenessClient);
    idleTouchAwarenessClient = v9->_idleTouchAwarenessClient;
    v9->_idleTouchAwarenessClient = v17;

    -[SBAttentionAwarenessClient setDelegate:](v9->_idleTouchAwarenessClient, "setDelegate:", v9);
    -[SBAttentionAwarenessClient setConfiguration:](v9->_idleTouchAwarenessClient, "setConfiguration:", v14);
    objc_storeWeak((id *)&v9->_windowScene, v7);
    objc_msgSend(v7, "transientUIInteractionManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerParticipantForTapToUnhide:", v9);

  }
  return v9;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "affordance=%p stopped observing touch idleness - dealloc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (int64_t)_calculatePresence
{
  int64_t touchState;

  if (-[NSMutableSet count](self->_hiddenOverrides, "count"))
    return 2;
  if (!-[SBAttentionAwarenessClient isEnabled](self->_idleTouchAwarenessClient, "isEnabled"))
    return 0;
  touchState = self->_touchState;
  if (touchState == 2)
    return 1;
  else
    return 2 * (touchState == 1);
}

- (id)_animationSettingsForTransitionFromPresence:(int64_t)a3 toPresence:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  if (!a3 || !a4)
  {
    if (a3 && !a4 || !a4 || a3)
    {
      -[SBFHomeGrabberSettings unhideAnimationSettings](self->_homeGrabberSettings, "unhideAnimationSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[NSMutableSet count](self->_hiddenOverrides, "count"))
      {
        -[SBAppSwitcherSettings animationSettings](self->_appSwitcherSettings, "animationSettings");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "statusBarFadeOutSettings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "BSAnimationSettings");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      -[SBFHomeGrabberSettings hideAnimationSettings](self->_homeGrabberSettings, "hideAnimationSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    objc_msgSend(v6, "BSAnimationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    return v5;
  }
  v5 = 0;
  return v5;
}

- (void)_updatePresence
{
  int64_t v3;
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBAffordancePresenceController _updatePresence]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBAffordancePresenceController.m"), 136, CFSTR("this call must be made on the main thread"));

  }
  v3 = -[SBAffordancePresenceController _calculatePresence](self, "_calculatePresence");
  -[SBAffordancePresenceController _animationSettingsForTransitionFromPresence:toPresence:](self, "_animationSettingsForTransitionFromPresence:toPresence:", self->_presence, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAffordancePresenceController _updatePresence:withAnimationSettings:](self, "_updatePresence:withAnimationSettings:", v3, v6);

}

- (void)_updateIdleTouchAwarenessClient
{
  _BOOL4 autoHideAffordance;
  _BOOL4 v4;

  autoHideAffordance = self->_autoHideAffordance;
  v4 = -[SBAttentionAwarenessClient isEnabled](self->_idleTouchAwarenessClient, "isEnabled");
  if (autoHideAffordance)
  {
    if (!v4)
    {
      -[SBAttentionAwarenessClient resetAttentionLostTimeout](self->_idleTouchAwarenessClient, "resetAttentionLostTimeout");
      -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 1);
      ++self->_lastInitialHideToken;
    }
  }
  else if (v4)
  {
    -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0);
    if (self->_touchState == 1)
    {
      self->_touchState = 0;
      -[SBAffordancePresenceController _updatePresence](self, "_updatePresence");
    }
  }
}

- (void)_updatePresence:(int64_t)a3 withAnimationSettings:(id)a4
{
  id v6;
  int64_t presence;
  void *v8;
  void *v9;
  NSMutableSet *outstandingVisibilityTransitionTokens;
  NSMutableSet *v11;
  NSMutableSet *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  _QWORD v19[6];

  v6 = a4;
  presence = self->_presence;
  if ((a3 != 0) != (presence == 0))
  {
    if (a3 && presence != a3)
    {
      self->_presence = a3;
      if (a3 == 1)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke_3;
        v16[3] = &unk_1E8E9DED8;
        v16[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v16);
      }
      else if (a3 == 2)
      {
        -[NSMutableSet count](self->_outstandingVisibilityTransitionTokens, "count");
      }
    }
  }
  else
  {
    self->_presence = a3;
    v8 = (void *)MEMORY[0x1E0CB37E8];
    ++self->_lastVisibilityTransitionToken;
    objc_msgSend(v8, "numberWithUnsignedInteger:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    outstandingVisibilityTransitionTokens = self->_outstandingVisibilityTransitionTokens;
    if (outstandingVisibilityTransitionTokens)
    {
      -[NSMutableSet addObject:](outstandingVisibilityTransitionTokens, "addObject:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v9);
      v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v12 = self->_outstandingVisibilityTransitionTokens;
      self->_outstandingVisibilityTransitionTokens = v11;

    }
    objc_msgSend(MEMORY[0x1E0D01908], "factoryWithSettings:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsAdditiveAnimations:", 1);
    v14 = (void *)MEMORY[0x1E0D01908];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke;
    v19[3] = &unk_1E8E9DE88;
    v19[4] = self;
    v19[5] = a3;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke_2;
    v17[3] = &unk_1E8E9DEB0;
    v17[4] = self;
    v18 = v9;
    v15 = v9;
    objc_msgSend(v14, "animateWithFactory:options:actions:completion:", v13, 4, v19, v17);

  }
}

void __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "affordancePresenceController:didChangeToPresence:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 72);
    *(_QWORD *)(v2 + 72) = 0;

  }
}

void __72__SBAffordancePresenceController__updatePresence_withAnimationSettings___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "affordancePresenceController:didChangeToPresence:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

}

- (void)_unhideIfAutoHidden
{
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = a1;
  v6 = 2048;
  v7 = a4;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a2, a3, "affordance=%p touch idleness changed - preparing to stop asserting hidden after %fs", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __53__SBAffordancePresenceController__unhideIfAutoHidden__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;

  v2 = (uint64_t *)(result + 32);
  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 16) == 2)
  {
    v3 = result;
    if (*(_QWORD *)(result + 40) == *(_QWORD *)(v1 + 32))
    {
      *(_QWORD *)(v1 + 16) = 0;
      objc_msgSend(*(id *)(*v2 + 8), "resetAttentionLostTimeout");
      SBLogAffordancePresenceController();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __53__SBAffordancePresenceController__unhideIfAutoHidden__block_invoke_cold_1(v2, v3, v4);

      return objc_msgSend((id)*v2, "_updatePresence");
    }
  }
  return result;
}

- (void)setHidden:(BOOL)a3 forReason:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v9;
  uint64_t v10;
  NSMutableSet *hiddenOverrides;
  void *v12;
  void *v13;
  void *v14;
  NSMutableSet *v15;
  NSMutableSet *v16;
  NSObject *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a5;
  v6 = a3;
  v9 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBAffordancePresenceController setHidden:forReason:animated:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("SBAffordancePresenceController.m"), 236, CFSTR("this call must be made on the main thread"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAffordancePresenceController.m"), 237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

LABEL_3:
  v10 = -[NSMutableSet count](self->_hiddenOverrides, "count");
  hiddenOverrides = self->_hiddenOverrides;
  if (v6)
  {
    if (hiddenOverrides)
    {
      v12 = (void *)objc_msgSend(v9, "copy");
      -[NSMutableSet addObject:](hiddenOverrides, "addObject:", v12);

    }
    else
    {
      v13 = (void *)MEMORY[0x1E0C99E20];
      v14 = (void *)objc_msgSend(v9, "copy");
      objc_msgSend(v13, "setWithObject:", v14);
      v15 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v16 = self->_hiddenOverrides;
      self->_hiddenOverrides = v15;

    }
  }
  else
  {
    -[NSMutableSet removeObject:](self->_hiddenOverrides, "removeObject:", v9);
  }
  if ((v10 == 0) == (-[NSMutableSet count](self->_hiddenOverrides, "count") != 0))
  {
    SBLogAffordancePresenceController();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[SBAffordancePresenceController setHidden:forReason:animated:].cold.1();

    v18 = -[SBAffordancePresenceController _calculatePresence](self, "_calculatePresence");
    if (v5)
    {
      -[SBAffordancePresenceController _animationSettingsForTransitionFromPresence:toPresence:](self, "_animationSettingsForTransitionFromPresence:toPresence:", self->_presence, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    -[SBAffordancePresenceController _updatePresence:withAnimationSettings:](self, "_updatePresence:withAnimationSettings:", v18, v19);

  }
}

- (int64_t)currentPresence
{
  return self->_presence;
}

- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6
{
  NSObject *v7;
  void *v8;
  void *v9;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3, a5, a6, a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBAffordancePresenceController client:attentionLostTimeoutDidExpire:forConfigurationGeneration:withAssociatedObject:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SBAffordancePresenceController.m"), 265, CFSTR("this call must be made on the main thread"));

  }
  if (-[SBAttentionAwarenessClient isEnabled](self->_idleTouchAwarenessClient, "isEnabled") && self->_touchState != 1)
  {
    self->_touchState = 1;
    SBLogAffordancePresenceController();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SBAffordancePresenceController client:attentionLostTimeoutDidExpire:forConfigurationGeneration:withAssociatedObject:].cold.1();

    -[SBAffordancePresenceController _updatePresence](self, "_updatePresence");
  }
}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  void *v4;
  id v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3, a4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBAffordancePresenceController clientDidResetForUserAttention:withEvent:]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("SBAffordancePresenceController.m"), 274, CFSTR("this call must be made on the main thread"));

  }
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  -[SBAffordancePresenceController _updatePresence](self, "_updatePresence", a3, a4);
  -[SBAffordancePresenceController _updateIdleTouchAwarenessClient](self, "_updateIdleTouchAwarenessClient");
}

- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4
{
  return 0;
}

- (SBAffordancePresenceControllerDelegate)delegate
{
  return (SBAffordancePresenceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)autoHideAffordance
{
  return self->_autoHideAffordance;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
  objc_storeStrong((id *)&self->_appSwitcherSettings, 0);
  objc_storeStrong((id *)&self->_outstandingVisibilityTransitionTokens, 0);
  objc_storeStrong((id *)&self->_hiddenOverrides, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
}

void __53__SBAffordancePresenceController__unhideIfAutoHidden__block_invoke_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 48);
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a3, (uint64_t)a3, "affordance=%p touch idleness changed - stopped asserting hidden after %fs", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2_0();
}

- (void)setHidden:forReason:animated:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, v1, (uint64_t)v1, "affordance=%p local override - %{public}@ asserting hidden", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)client:attentionLostTimeoutDidExpire:forConfigurationGeneration:withAssociatedObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "affordance=%p touch idleness changed - started asserting hidden", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
