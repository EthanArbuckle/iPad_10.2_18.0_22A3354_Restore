@implementation SBGestureRootSwitcherModifier

- (SBGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3
{
  SBGestureRootSwitcherModifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBGestureRootSwitcherModifier;
  result = -[SBSwitcherModifier init](&v5, sel_init);
  if (result)
    result->_currentEnvironmentMode = a3;
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBGestureRootSwitcherModifier;
  -[SBChainableModifier descriptionBuilderWithMultilinePrefix:](&v10, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBGestureRootSwitcherModifier selectedAppLayout](self, "selectedAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("selectedAppLayout"));

  SBStringForUnlockedEnvironmentMode(self->_currentEnvironmentMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("currentEnvironmentMode"));

  return v4;
}

- (BOOL)completesWhenChildrenComplete
{
  return 1;
}

- (id)handleEvent:(id)a3
{
  id v4;
  SBSwitcherModifier *v5;
  SBSwitcherModifier *transitionModifierBeforeHandlingEvent;
  SBSwitcherModifier *v7;
  SBSwitcherModifier *gestureModifierBeforeHandlingEvent;
  void *v9;
  SBSwitcherModifier *v10;
  SBSwitcherModifier *v11;
  objc_super v13;

  v4 = a3;
  -[SBGestureRootSwitcherModifier transitionModifier](self, "transitionModifier");
  v5 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
  transitionModifierBeforeHandlingEvent = self->_transitionModifierBeforeHandlingEvent;
  self->_transitionModifierBeforeHandlingEvent = v5;

  -[SBGestureRootSwitcherModifier gestureModifier](self, "gestureModifier");
  v7 = (SBSwitcherModifier *)objc_claimAutoreleasedReturnValue();
  gestureModifierBeforeHandlingEvent = self->_gestureModifierBeforeHandlingEvent;
  self->_gestureModifierBeforeHandlingEvent = v7;

  v13.receiver = self;
  v13.super_class = (Class)SBGestureRootSwitcherModifier;
  -[SBChainableModifier handleEvent:](&v13, sel_handleEvent_, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self->_transitionModifierBeforeHandlingEvent;
  self->_transitionModifierBeforeHandlingEvent = 0;

  v11 = self->_gestureModifierBeforeHandlingEvent;
  self->_gestureModifierBeforeHandlingEvent = 0;

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  NSObject *v4;
  void *v5;
  SBSwitcherModifier *gestureModifierBeforeHandlingEvent;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  objc_class *v18;
  NSObject *v19;
  objc_class *v20;
  NSObject *v21;
  NSObject *v22;
  objc_class *v24;
  objc_super v25;
  uint8_t buf[4];
  NSObject *v27;
  __int16 v28;
  NSObject *v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBGestureRootSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v25, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSObject phase](v4, "phase") == 1 && -[NSObject isGestureInitiated](v4, "isGestureInitiated"))
  {
    gestureModifierBeforeHandlingEvent = self->_gestureModifierBeforeHandlingEvent;
    if (!gestureModifierBeforeHandlingEvent)
    {
      if (!-[SBGestureRootSwitcherModifier canTransitionWithoutGestureModifier](self, "canTransitionWithoutGestureModifier"))
      {
        SBLogAppSwitcher();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          goto LABEL_13;
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v12 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v12;
        v28 = 2112;
        v29 = v4;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "[%@]: No gesture modifier to handle gesture initiated transition event %@", buf, 0x16u);
        goto LABEL_12;
      }
      gestureModifierBeforeHandlingEvent = self->_gestureModifierBeforeHandlingEvent;
    }
    -[SBGestureRootSwitcherModifier transitionChildModifierForMainTransitionEvent:activeGestureModifier:](self, "transitionChildModifierForMainTransitionEvent:activeGestureModifier:", v4, gestureModifierBeforeHandlingEvent);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v7, 0, CFSTR("Transition"));
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ handling gesture initiated transition."), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject handleWithReason:](v4, "handleWithReason:", v11);

      SBLogAppSwitcher();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v14;
        v28 = 2112;
        v29 = v7;
        v30 = 2112;
        v31 = v4;
        v15 = "[%@]: Adding transition modifier %@ for event %@";
        v16 = v12;
        v17 = 32;
LABEL_11:
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);

      }
    }
    else
    {
      SBLogAppSwitcher();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v14 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v14;
        v28 = 2112;
        v29 = v4;
        v15 = "[%@]: No transition modifier to handle transition event %@";
        v16 = v12;
        v17 = 22;
        goto LABEL_11;
      }
    }
LABEL_12:

LABEL_13:
  }
  if (-[NSObject phase](v4, "phase") == 1)
  {
    self->_currentEnvironmentMode = -[NSObject toEnvironmentMode](v4, "toEnvironmentMode");
    SBLogAppSwitcher();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = objc_claimAutoreleasedReturnValue();
      SBStringForUnlockedEnvironmentMode(self->_currentEnvironmentMode);
      v22 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v21;
      v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, "[%@] Updating our notion of starting environment to %@", buf, 0x16u);

    }
  }

  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SBAppLayout *v7;
  SBAppLayout *selectedAppLayout;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  const __CFString *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBGestureRootSwitcherModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v15, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 1)
  {
    v6 = objc_msgSend(v4, "gestureType");
    if (v6 == -[SBGestureRootSwitcherModifier gestureType](self, "gestureType"))
    {
      objc_msgSend(v4, "selectedAppLayout");
      v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
      selectedAppLayout = self->_selectedAppLayout;
      self->_selectedAppLayout = v7;

      -[SBGestureRootSwitcherModifier gestureChildModifierForGestureEvent:activeTransitionModifier:](self, "gestureChildModifierForGestureEvent:activeTransitionModifier:", v4, self->_transitionModifierBeforeHandlingEvent);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SBChainableModifier addChildModifier:atLevel:key:](self, "addChildModifier:atLevel:key:", v9, 1, CFSTR("Gesture"));
        SBLogAppSwitcher();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v17 = v12;
          v18 = 2112;
          v19 = v9;
          v20 = 2112;
          v21 = v4;
          _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "[%@]: Adding gesture modifier %@ for event %@", buf, 0x20u);

        }
        if (self->_transitionModifierBeforeHandlingEvent)
          v13 = CFSTR("Continuing gesture");
        else
          v13 = CFSTR("Starting new gesture");
        objc_msgSend(v4, "handleWithReason:", v13);
      }

    }
  }

  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBAppLayout *selectedAppLayout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBGestureRootSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleRemovalEvent:](&v9, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isEqual:](self->_selectedAppLayout, "isEqual:", v6))
  {
    selectedAppLayout = self->_selectedAppLayout;
    self->_selectedAppLayout = 0;

  }
  return v5;
}

- (SBSwitcherModifier)gestureModifier
{
  return (SBSwitcherModifier *)-[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("Gesture"));
}

- (SBSwitcherModifier)transitionModifier
{
  return (SBSwitcherModifier *)-[SBChainableModifier childModifierByKey:](self, "childModifierByKey:", CFSTR("Transition"));
}

- (BOOL)canTransitionWithoutGestureModifier
{
  return 0;
}

- (SBAppLayout)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (int64_t)currentEnvironmentMode
{
  return self->_currentEnvironmentMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_gestureModifierBeforeHandlingEvent, 0);
  objc_storeStrong((id *)&self->_transitionModifierBeforeHandlingEvent, 0);
}

- (int64_t)gestureType
{
  int64_t result;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id result;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id result;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_24();
  return result;
}

@end
