@implementation SBKeyboardFocusArbitrationReason

- (id)_initWithLabel:(id)a3
{
  id v4;
  SBKeyboardFocusArbitrationReason *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKeyboardFocusArbitrationReason;
  v5 = -[SBKeyboardFocusArbitrationReason init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

  }
  return v5;
}

- (id)_initWithName:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  SBKeyboardFocusArbitrationReason *v8;
  uint64_t v9;
  NSString *label;
  uint64_t v11;
  NSString *sourceName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBKeyboardFocusArbitrationReason;
  v8 = -[SBKeyboardFocusArbitrationReason init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    label = v8->_label;
    v8->_label = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    sourceName = v8->_sourceName;
    v8->_sourceName = (NSString *)v11;

  }
  return v8;
}

- (id)_initForKeyboardArbiterWithLabel:(id)a3
{
  id v4;
  SBKeyboardFocusArbitrationReason *v5;
  uint64_t v6;
  NSString *label;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKeyboardFocusArbitrationReason;
  v5 = -[SBKeyboardFocusArbitrationReason init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_fromKeyboardArbiter = 1;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_label, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSString isEqual:](self->_label, "isEqual:", v4[3]);
  else
    v5 = 0;

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

+ (id)didChangeShowingSystemModalAlert
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("didChangeShowingSystemModalAlert"));
}

+ (id)dsahBoardAppViewControllerDidAppear
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("dsahBoardAppViewControllerDidAppear"));
}

+ (id)dsahBoardAppViewControllerDidDisappear
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("dsahBoardAppViewControllerDidDisappear"));
}

+ (id)longLookDidDismissForNotificationViewController
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("longLookDidDismissForNotificationViewController"));
}

+ (id)longLookDidPresentForNotificationViewController
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("longLookDidPresentForNotificationViewController"));
}

+ (id)modalUIFluidDismissGestureDidFinish
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("modalUIFluidDismissGestureDidFinish"));
}

+ (id)showWindowedAccessoryWindow
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("showWindowedAccessoryWindow"));
}

+ (id)spotlightMultiplexingDidBecomeActiveDelegate
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("spotlightMultiplexingDidBecomeActiveDelegate"));
}

+ (id)spotlightMultiplexingDidCreateScene
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("spotlightMultiplexingDidCreateScene"));
}

+ (id)spotlightMultiplexingDidDestroyScene
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("spotlightMultiplexingDidDestroyScene"));
}

+ (id)spotlightMultiplexingViewDidDisappear
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("spotlightMultiplexingViewDidDisappear"));
}

+ (id)transientOverlayDismissAllToAppsWorkspaceTransactionDidComplete
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("transientOverlayDismissAllToAppsWorkspaceTransactionDidComplete"));
}

+ (id)transientOverlayDismissWorkspaceTransactionDidBegin
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("transientOverlayDismissWorkspaceTransactionDidBegin"));
}

+ (id)willPresentTransientOverlayScene
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("willPresentTransientOverlayScene"));
}

+ (id)workspaceDidFinishInitialization
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("workspaceDidFinishInitialization"));
}

+ (id)assistantControllerVisibility
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("assistantControllerVisibility"));
}

+ (id)backlightControllerDidAnimate
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("backlightControllerDidAnimate"));
}

+ (id)keyboardArbiterSuggestion
{
  return -[SBKeyboardFocusArbitrationReason _initForKeyboardArbiterWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initForKeyboardArbiterWithLabel:", CFSTR("keyboardArbiterSuggestion"));
}

+ (id)didResetCoalition
{
  return -[SBKeyboardFocusArbitrationReason _initForKeyboardArbiterWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initForKeyboardArbiterWithLabel:", CFSTR("didResetCoalition"));
}

+ (id)didRemoveKeyboardFocusFromScene
{
  return -[SBKeyboardFocusArbitrationReason _initForKeyboardArbiterWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initForKeyboardArbiterWithLabel:", CFSTR("didRemoveKeyboardFocusFromScene"));
}

+ (id)deferAdditionalEnvironments
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("deferAdditionalEnvironments"));
}

+ (id)keyWindowNotification
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("keyWindowNotification"));
}

+ (id)preventFocusForPID
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("preventFocusForPID"));
}

+ (id)appFocusRedirections
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("appFocusRedirections"));
}

+ (id)accessibility:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  SBKeyboardFocusArbitrationReason *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_opt_class();
  v6 = (objc_class *)objc_opt_class();
  if (!v4)
  {
    NSStringFromClass(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("subreason"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[SBKeyboardFocusArbitrationReason accessibility:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D074B028);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_msgSend(v4, "classForCoder");
    if (!v14)
      v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("subreason"), v15, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[SBKeyboardFocusArbitrationReason accessibility:].cold.1(a2);
    goto LABEL_11;
  }

  v7 = [SBKeyboardFocusArbitrationReason alloc];
  objc_msgSend(CFSTR("accessibility-"), "stringByAppendingString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBKeyboardFocusArbitrationReason _initWithLabel:](v7, "_initWithLabel:", v8);

  return v9;
}

+ (id)keyboardFocusEvaluationSuppression
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("keyboardFocusEvaluationSuppression"));
}

+ (id)removedCoalitionMember
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("removedCoalitionMember"));
}

+ (id)displayDidBecomeActive
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("displayDidBecomeActive"));
}

+ (id)focusLockAssertionsDidChange
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("focusLockAssertionsDidChange"));
}

+ (id)focusRedirectAssertionsDidChange
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("focusRedirectAssertionsDidChange"));
}

+ (id)removedKeyboardArbiterSceneDidRemove
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("removedKeyboardArbiterSceneDidRemove"));
}

+ (id)removedKeyboardArbiterSceneWillRemove
{
  return -[SBKeyboardFocusArbitrationReason _initWithLabel:]([SBKeyboardFocusArbitrationReason alloc], "_initWithLabel:", CFSTR("removedKeyboardArbiterSceneWillRemove"));
}

- (BOOL)isKeyboardArbiterSuggestion
{
  return self->_fromKeyboardArbiter;
}

- (id)annotatedWithSourceName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[SBKeyboardFocusArbitrationReason _initWithName:source:]([SBKeyboardFocusArbitrationReason alloc], "_initWithName:source:", self->_label, v4);

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBKeyboardFocusArbitrationReason *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SBKeyboardFocusArbitrationReason_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

uint64_t __62__SBKeyboardFocusArbitrationReason_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), 0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v3)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", v3, CFSTR("via"));
  return result;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
}

+ (void)accessibility:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
