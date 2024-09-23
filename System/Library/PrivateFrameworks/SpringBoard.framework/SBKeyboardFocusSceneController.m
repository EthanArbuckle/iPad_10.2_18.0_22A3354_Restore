@implementation SBKeyboardFocusSceneController

- (SBKeyboardFocusSceneController)initWithWindowScene:(id)a3 dependencies:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBKeyboardFocusScenePolicyEnforcer *v16;
  void *v17;
  void *v18;
  SBKeyboardFocusScenePolicyEnforcer *v19;
  SBSystemKeyCommandScenePolicyEnforcer *v20;
  void *v21;
  void *v22;
  SBSystemKeyCommandScenePolicyEnforcer *v23;
  SBKeyboardFocusPolicyEnforcerPipeline *v24;
  void *v25;
  SBKeyboardFocusPolicyEnforcerPipeline *v26;
  SBKeyboardFocusSceneController *v27;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "_FBSScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Scene-%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "_FBSScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("SBSystemKeyCommandPolicyEnforcer-Scene-%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [SBKeyboardFocusScenePolicyEnforcer alloc];
  objc_msgSend(v7, "deliveryManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventDeferringSystemShellBehaviorDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SBKeyboardFocusScenePolicyEnforcer initWithDeliveryManager:debugName:systemShellDelegate:](v16, "initWithDeliveryManager:debugName:systemShellDelegate:", v17, v11, v18);

  v20 = [SBSystemKeyCommandScenePolicyEnforcer alloc];
  objc_msgSend(v7, "sceneProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deliveryManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SBSystemKeyCommandScenePolicyEnforcer initWithSceneProvider:debugName:deliveryManager:](v20, "initWithSceneProvider:debugName:deliveryManager:", v21, v15, v22);

  v24 = [SBKeyboardFocusPolicyEnforcerPipeline alloc];
  v29[0] = v19;
  v29[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SBKeyboardFocusPolicyEnforcerPipeline initWithEnforcers:](v24, "initWithEnforcers:", v25);

  v27 = -[SBKeyboardFocusSceneController initWithWindowScene:policyEnforcer:pipelineFactory:dependencies:](self, "initWithWindowScene:policyEnforcer:pipelineFactory:dependencies:", v8, v26, 0, v7);
  return v27;
}

- (SBKeyboardFocusSceneController)initWithWindowScene:(id)a3 policyEnforcer:(id)a4 pipelineFactory:(id)a5 dependencies:(id)a6
{
  id v10;
  id v11;
  SBKeyboardFocusSceneController *v12;
  id v13;
  SBKeyboardFocusSceneController *v14;
  SBKeyboardFocusSceneController *v15;
  SBKeyboardFocusSceneController *v16;
  SBKeyboardFocusSceneController *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  SBKeyboardFocusTarget *sbWindowSceneFocusTarget;
  void *v22;
  uint64_t v23;
  NSString *debugName;
  _SBRecentlyUsedSceneIdentityCache *v25;
  _SBRecentlyUsedSceneIdentityCache *recentlyUsedScenes;
  uint64_t v27;
  SBKeyboardFocusResolutionPipeline *pipeline;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  BKSHIDEventDeferringPredicate *bufferingPredicate;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  BSInvalidatable *stateCaptureAssertion;
  SBKeyboardFocusSceneController *v48;
  id v50;
  id v51;
  id location;
  objc_super v53;

  v10 = a3;
  v11 = a4;
  v12 = (SBKeyboardFocusSceneController *)a5;
  v13 = a6;
  v53.receiver = self;
  v53.super_class = (Class)SBKeyboardFocusSceneController;
  v14 = -[SBKeyboardFocusSceneController init](&v53, sel_init);
  v15 = v14;
  if (v14)
  {
    v50 = v11;
    if (v12)
      v16 = v12;
    else
      v16 = v14;
    v17 = v16;

    objc_storeWeak((id *)&v15->_sbWindowScene, v10);
    objc_msgSend(v10, "_FBSScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identityToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", v19, getpid());
    v20 = objc_claimAutoreleasedReturnValue();
    sbWindowSceneFocusTarget = v15->_sbWindowSceneFocusTarget;
    v15->_sbWindowSceneFocusTarget = (SBKeyboardFocusTarget *)v20;

    objc_storeStrong((id *)&v15->_dependencies, a6);
    objc_storeStrong((id *)&v15->_policyEnforcer, a4);
    objc_msgSend(v10, "_FBSScene");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = objc_claimAutoreleasedReturnValue();
    debugName = v15->_debugName;
    v15->_debugName = (NSString *)v23;

    v25 = objc_alloc_init(_SBRecentlyUsedSceneIdentityCache);
    recentlyUsedScenes = v15->_recentlyUsedScenes;
    v15->_recentlyUsedScenes = v25;

    v27 = -[SBKeyboardFocusSceneController newPipeline](v17, "newPipeline");
    pipeline = v15->_pipeline;
    v15->_pipeline = (SBKeyboardFocusResolutionPipeline *)v27;

    v15->_coalitionAffinity = objc_msgSend(v10, "keyboardFocusCoalitionAffinity");
    v29 = objc_alloc_init(MEMORY[0x1E0D00D80]);
    objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setEnvironment:", v30);

    objc_msgSend(v10, "_FBSScene");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "settings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sb_displayConfigurationForSceneManagers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isExternal");
    v35 = (void *)MEMORY[0x1E0D00CF8];
    if ((v34 & 1) != 0)
    {
      objc_msgSend(v33, "hardwareIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "displayWithHardwareIdentifier:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v29, "setDisplay:", v37);
    -[SBKeyboardFocusTarget sceneIdentityToken](v15->_sbWindowSceneFocusTarget, "sceneIdentityToken");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForString:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setToken:", v40);

    v41 = objc_msgSend(v29, "copy");
    bufferingPredicate = v15->_bufferingPredicate;
    v15->_bufferingPredicate = (BKSHIDEventDeferringPredicate *)v41;

    objc_msgSend(v10, "sceneManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:", v15);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SpringBoard - KeyboardFocus - SceneController - %@"), v15->_debugName);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v15);
    v45 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v51, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v46 = objc_claimAutoreleasedReturnValue();
    stateCaptureAssertion = v15->_stateCaptureAssertion;
    v15->_stateCaptureAssertion = (BSInvalidatable *)v46;

    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);

    v12 = v17;
    v11 = v50;
  }
  v48 = v15;

  return v48;
}

id __98__SBKeyboardFocusSceneController_initWithWindowScene_policyEnforcer_pipelineFactory_dependencies___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (SBWindowScene)sbWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_sbWindowScene);
}

- (SBKeyboardFocusTarget)sbWindowSceneFocusTarget
{
  return self->_sbWindowSceneFocusTarget;
}

- (BOOL)controlsScene:(id)a3
{
  SBWindowScene **p_sbWindowScene;
  id v4;
  id WeakRetained;
  char v6;

  if (!a3)
    return 0;
  p_sbWindowScene = &self->_sbWindowScene;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sbWindowScene);
  v6 = BSEqualObjects();

  return v6;
}

- (void)setCoalition:(id)a3
{
  id v5;
  NSObject *v6;
  NSString *debugName;
  void *v8;
  SBKeyboardFocusCoalitionMember *coalitionMember;
  id WeakRetained;
  SBKeyboardFocusCoalitionMember *v11;
  SBKeyboardFocusCoalitionMember *v12;
  NSObject *v13;
  NSString *v14;
  void *v15;
  void *v16;
  int v17;
  NSString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_coalitionMember)
  {
    SBLogKeyboardFocus();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      debugName = self->_debugName;
      -[SBKeyboardFocusCoalitionMember uniqueIdentifier](self->_coalitionMember, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = debugName;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidating current participant: %{public}@", (uint8_t *)&v17, 0x16u);

    }
    -[SBKeyboardFocusCoalitionMember invalidate](self->_coalitionMember, "invalidate");
    coalitionMember = self->_coalitionMember;
    self->_coalitionMember = 0;

  }
  objc_storeStrong((id *)&self->_coalition, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(v5, "acquireMemberForWindowScene:delegate:", WeakRetained, self);
  v11 = (SBKeyboardFocusCoalitionMember *)objc_claimAutoreleasedReturnValue();
  v12 = self->_coalitionMember;
  self->_coalitionMember = v11;

  SBLogKeyboardFocus();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_debugName;
    objc_msgSend(v5, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoalitionMember uniqueIdentifier](self->_coalitionMember, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v14;
    v19 = 2114;
    v20 = v15;
    v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] participating in coalition %{public}@ - participant: %{public}@", (uint8_t *)&v17, 0x20u);

  }
}

- (id)redirectSpringBoardLockFocusForReason:(id)a3 toProcessidentifier:(int)a4 toSceneIdentityToken:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  SBKeyboardFocusRedirection *v10;
  void *v11;
  void *v12;
  void *v13;
  BSCompoundAssertion *v14;
  BSCompoundAssertion *springBoardFocusRedirections;
  BSCompoundAssertion *v16;
  void *v17;
  NSObject *v18;
  NSString *debugName;
  void *v20;
  NSString *v21;
  _QWORD v23[4];
  id v24;
  _BYTE location[12];
  __int16 v26;
  _BYTE v27[14];
  uint64_t v28;

  v6 = *(_QWORD *)&a4;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = objc_alloc_init(SBKeyboardFocusRedirection);
    -[SBKeyboardFocusRedirection setReason:](v10, "setReason:", v8);
    -[SBKeyboardFocusRedirection setFromProcessIdentifier:](v10, "setFromProcessIdentifier:", -[SBKeyboardFocusTarget pid](self->_sbWindowSceneFocusTarget, "pid"));
    -[SBKeyboardFocusTarget sceneIdentityToken](self->_sbWindowSceneFocusTarget, "sceneIdentityToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusRedirection setFromToken:](v10, "setFromToken:", v11);

    -[SBKeyboardFocusRedirection setToProcessIdentifier:](v10, "setToProcessIdentifier:", v6);
    -[SBKeyboardFocusRedirection setToToken:](v10, "setToToken:", v9);
    if (!self->_springBoardFocusRedirections)
    {
      objc_initWeak((id *)location, self);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-springBoardFocusRedirections"), self->_debugName);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D01718];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __113__SBKeyboardFocusSceneController_redirectSpringBoardLockFocusForReason_toProcessidentifier_toSceneIdentityToken___block_invoke;
      v23[3] = &unk_1E8EA3688;
      objc_copyWeak(&v24, (id *)location);
      objc_msgSend(v13, "assertionWithIdentifier:stateDidChangeHandler:", v12, v23);
      v14 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
      springBoardFocusRedirections = self->_springBoardFocusRedirections;
      self->_springBoardFocusRedirections = v14;

      v16 = self->_springBoardFocusRedirections;
      SBLogKeyboardFocus();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSCompoundAssertion setLog:](v16, "setLog:", v17);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)location);
    }
    SBLogKeyboardFocus();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      debugName = self->_debugName;
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = debugName;
      v26 = 1024;
      *(_DWORD *)v27 = v6;
      *(_WORD *)&v27[4] = 2114;
      *(_QWORD *)&v27[6] = v8;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] redirectSpringBoardLockFocusForReason: deferring focus to pid %d for reason: %{public}@ ", location, 0x1Cu);
    }

    -[BSCompoundAssertion acquireForReason:withContext:](self->_springBoardFocusRedirections, "acquireForReason:withContext:", v8, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBLogKeyboardFocus();
    v10 = (SBKeyboardFocusRedirection *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_debugName;
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v21;
      v26 = 2114;
      *(_QWORD *)v27 = v8;
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = v6;
      _os_log_impl(&dword_1D0540000, &v10->super, OS_LOG_TYPE_DEFAULT, "[%{public}@] error: redirectSpringBoardLockFocusForReason %{public}@ request with pid %d and no token; PID-only "
        "rules are not valid",
        location,
        0x1Cu);
    }
    v20 = 0;
  }

  return v20;
}

void __113__SBKeyboardFocusSceneController_redirectSpringBoardLockFocusForReason_toProcessidentifier_toSceneIdentityToken___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[SBKeyboardFocusArbitrationReason focusRedirectAssertionsDidChange](SBKeyboardFocusArbitrationReason, "focusRedirectAssertionsDidChange");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_requestPolicyReevaluationForReason:", v1);

}

- (id)focusLockSpringBoardWindow:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  NSString *debugName;
  void *v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "_sbWindowScene");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);

    if (v8 != WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[window _sbWindowScene] == _sbWindowScene"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBKeyboardFocusSceneController focusLockSpringBoardWindow:forReason:].cold.1();
      objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0C0AE58);
    }
    -[SBKeyboardFocusSceneController _focusLockSpringBoardWindow:forReason:](self, "_focusLockSpringBoardWindow:forReason:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SBLogKeyboardFocus();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      debugName = self->_debugName;
      *(_DWORD *)buf = 138543618;
      v16 = debugName;
      v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] error: focusLockSpringBoardWindow for reason %{public}@ with nil window", buf, 0x16u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)focusLockSpringBoardForReason:(id)a3
{
  return -[SBKeyboardFocusSceneController _focusLockSpringBoardWindow:forReason:](self, "_focusLockSpringBoardWindow:forReason:", 0, a3);
}

- (BOOL)shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    -[BSCompoundAssertion context](self->_springBoardFocusLockAssertions, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __93__SBKeyboardFocusSceneController_shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow___block_invoke;
    v8[3] = &unk_1E8EBBC70;
    v9 = v4;
    v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL __93__SBKeyboardFocusSceneController_shouldAllowInteractionTrackingKeyboardFocusUpdateForWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 16);
  else
    v2 = 0;
  return v2 == *(_QWORD *)(a1 + 32);
}

- (void)keyboardArbiterSuggestedFocusTarget:(id)a3
{
  void *v4;
  char v5;
  SBKeyboardFocusTarget *v6;
  SBKeyboardFocusTarget *v7;
  SBKeyboardFocusTarget *lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
  SBKeyboardFocusTarget *v9;

  v9 = (SBKeyboardFocusTarget *)a3;
  if (-[SBKeyboardFocusTarget isEqual:](v9, "isEqual:", self->_sbWindowSceneFocusTarget))
  {
    -[BSCompoundAssertion context](self->_springBoardFocusLockAssertions, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "bs_containsObjectPassingTest:", &__block_literal_global_326);

    v6 = v9;
    if ((v5 & 1) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = v9;
  if (v9)
  {
LABEL_5:
    v7 = v9;
    lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks = self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
    self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks = v9;

    v6 = v9;
  }
LABEL_6:

}

BOOL __70__SBKeyboardFocusSceneController_keyboardArbiterSuggestedFocusTarget___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 16);
  else
    v2 = 0;
  return v2 != 0;
}

- (id)bufferEventsForReason:(id)a3 generation:(unint64_t)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  NSString *debugName;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  unint64_t v30;
  uint8_t buf[4];
  NSString *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_opt_class();
  v8 = (objc_class *)objc_opt_class();
  if (!v6)
  {
    NSStringFromClass(v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("reason"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusSceneController bufferEventsForReason:generation:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0C0B23CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_msgSend(v6, "classForCoder");
    if (!v22)
      v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("reason"), v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusSceneController bufferEventsForReason:generation:].cold.1();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0C0B2E4);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BufferingRequest (%ld) - %@"), a4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogKeyboardFocus();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    debugName = self->_debugName;
    *(_DWORD *)buf = 138543874;
    v32 = debugName;
    v33 = 2114;
    v34 = v6;
    v35 = 2048;
    v36 = a4;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "[%{public}@] bufferEventsForReason: %{public}@ <%lu>- begin", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bufferEventsMatchingPredicate:withReason:", self->_bufferingPredicate, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0D01868]);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__SBKeyboardFocusSceneController_bufferEventsForReason_generation___block_invoke;
  v27[3] = &unk_1E8EBBCD8;
  v27[4] = self;
  v28 = v6;
  v29 = v13;
  v30 = a4;
  v15 = v13;
  v16 = v6;
  v17 = (void *)objc_msgSend(v14, "initWithIdentifier:forReason:invalidationBlock:", v9, v16, v27);

  return v17;
}

uint64_t __67__SBKeyboardFocusSceneController_bufferEventsForReason_generation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogKeyboardFocus();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v5 = *(_QWORD *)(a1 + 56);
    v7 = 138543874;
    v8 = v4;
    v9 = 2114;
    v10 = v3;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "[%{public}@] bufferEventsForReason: %{public}@ <%lu> - end", (uint8_t *)&v7, 0x20u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

- (BOOL)removeKeyboardFocusFromScene:(id)a3
{
  return -[SBKeyboardFocusSceneController _removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:reason:](self, "_removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:reason:", a3, CFSTR("removeKeyboardFocusFromScene"));
}

- (void)displayDidBecomeActive
{
  id v3;

  if (-[BSCompoundAssertion isActive](self->_springBoardFocusLockAssertions, "isActive"))
  {
    +[SBKeyboardFocusArbitrationReason displayDidBecomeActive](SBKeyboardFocusArbitrationReason, "displayDidBecomeActive");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusSceneController _requestPolicyReevaluationForReason:](self, "_requestPolicyReevaluationForReason:", v3);

  }
}

- (id)_focusLockSpringBoardWindow:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BSCompoundAssertion *v9;
  BSCompoundAssertion *springBoardFocusLockAssertions;
  BSCompoundAssertion *v11;
  void *v12;
  _SBKeyboardFocusAssertionContext *v13;
  NSObject *v14;
  NSString *debugName;
  void *v16;
  BSCompoundAssertion *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  uint8_t buf[4];
  NSString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_springBoardFocusLockAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-springBoardFocusLockAssertions"), self->_debugName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __72__SBKeyboardFocusSceneController__focusLockSpringBoardWindow_forReason___block_invoke;
    v21[3] = &unk_1E8EB3470;
    v21[4] = self;
    objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:stateDidChangeHandler:", v8, v21);
    v9 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    springBoardFocusLockAssertions = self->_springBoardFocusLockAssertions;
    self->_springBoardFocusLockAssertions = v9;

    v11 = self->_springBoardFocusLockAssertions;
    SBLogKeyboardFocus();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v11, "setLog:", v12);

  }
  v13 = objc_alloc_init(_SBKeyboardFocusAssertionContext);
  -[SBKeyboardClientSettingObserverContext setScene:]((uint64_t)v13, v7);
  -[SBKeyboardClientSettingObserverContext setOldClientSettings:]((uint64_t)v13, v6);
  SBLogKeyboardFocus();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    debugName = self->_debugName;
    objc_msgSend(v6, "_debugName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = debugName;
    v24 = 2114;
    v25 = v16;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] focusLockSpringBoardWindow: %{public}@ for reason: %{public}@", buf, 0x20u);

  }
  v17 = self->_springBoardFocusLockAssertions;
  objc_msgSend(v7, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](v17, "acquireForReason:withContext:", v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __72__SBKeyboardFocusSceneController__focusLockSpringBoardWindow_forReason___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  +[SBKeyboardFocusArbitrationReason focusLockAssertionsDidChange](SBKeyboardFocusArbitrationReason, "focusLockAssertionsDidChange");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsArbitrationForReason:", v2);

}

- (void)_requestPolicyReevaluationForReason:(id)a3
{
  id v4;
  SBKeyboardFocusCoalitionMember *coalitionMember;
  void *v6;
  id v7;

  v4 = a3;
  coalitionMember = self->_coalitionMember;
  if (coalitionMember)
  {
    v7 = v4;
    -[SBKeyboardFocusCoalitionMember requestArbitration:](coalitionMember, "requestArbitration:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't function without a coalition"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusSceneController _requestPolicyReevaluationForReason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (id)_updatePolicyForReason:(id)a3
{
  id v4;
  SBMutableKeyboardFocusPolicy *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  SBMutableKeyboardFocusPolicy *v10;
  NSString *debugName;
  SBKeyboardFocusTarget *lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
  NSString *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = objc_alloc_init(SBMutableKeyboardFocusPolicy);
  -[SBMutableKeyboardFocusPolicy setKeyboardFocusTarget:](v5, "setKeyboardFocusTarget:", self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks);
  -[SBMutableKeyboardFocusPolicy setAdvicePolicy:](v5, "setAdvicePolicy:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  -[SBMutableKeyboardFocusPolicy setWindowSceneAncestor:](v5, "setWindowSceneAncestor:", WeakRetained);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__SBKeyboardFocusSceneController__updatePolicyForReason___block_invoke;
  v16[3] = &unk_1E8EBBD00;
  v16[4] = self;
  +[SBKeyboardFocusResolutionContext build:](SBKeyboardFocusResolutionContext, "build:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogKeyboardFocus();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    debugName = self->_debugName;
    lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks = self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
    *(_DWORD *)buf = 138543874;
    v18 = debugName;
    v19 = 2114;
    v20 = v4;
    v21 = 2114;
    v22 = lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
    _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] - generating new policy for reason: %{public}@ - last non-SB keyboard arbiter suggestion: %{public}@]", buf, 0x20u);
  }

  -[SBKeyboardFocusResolutionPipeline generateKeyboardFocusPolicy:resolutionContext:](self->_pipeline, "generateKeyboardFocusPolicy:resolutionContext:", v5, v7);
  SBLogKeyboardFocus();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = self->_debugName;
    -[SBKeyboardFocusPolicy auditHistory](v5, "auditHistory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v18 = v14;
    v19 = 2114;
    v20 = v4;
    v21 = 2114;
    v22 = v5;
    v23 = 2114;
    v24 = v15;
    _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] - generated policy for reason: %{public}@ - %{public}@ : %{public}@]", buf, 0x2Au);

  }
  v10 = v5;

  return v10;
}

void __57__SBKeyboardFocusSceneController__updatePolicyForReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v4 = a2;
  objc_msgSend(v4, "setScreenDim:", objc_msgSend(v3, "isScreenDim"));
  objc_msgSend(v4, "setSiriVisible:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isSiriVisible"));
  objc_msgSend(v4, "setSpotlightVisible:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isSpotlightVisible"));

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "debugStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SBKeyboardFocusSceneController *v10;
  _QWORD v11[4];
  id v12;
  SBKeyboardFocusSceneController *v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__SBKeyboardFocusSceneController_appendDescriptionToStream___block_invoke;
  v11[3] = &unk_1E8E9E820;
  v6 = v4;
  v12 = v6;
  v13 = self;
  objc_msgSend(v6, "appendProem:block:", self, v11);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __60__SBKeyboardFocusSceneController_appendDescriptionToStream___block_invoke_2;
  v8[3] = &unk_1E8E9E820;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(v7, "appendBodySectionWithName:block:", 0, v8);

}

id __60__SBKeyboardFocusSceneController_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "hasFocus"), CFSTR("hasFocus"));
}

void __60__SBKeyboardFocusSceneController_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160), CFSTR("lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), CFSTR("springBoardFocusLockAssertions"));
  v4 = objc_msgSend(*(id *)(a1 + 32), "hasDebugStyle");
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(v5 + 144), CFSTR("preferredPolicy"));
    v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152), CFSTR("enforcedPolicy"));
  }
  else
  {
    objc_msgSend(*(id *)(v5 + 144), "keyboardFocusTarget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v6, "appendObject:withName:", v9, CFSTR("preferredKeyboardFocusTarget"));

    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "keyboardFocusTarget");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "appendObject:withName:", v13, CFSTR("enforcedKeyboardFocusTarget"));

  }
}

- (void)invalidate
{
  -[BSCompoundAssertion invalidate](self->_springBoardFocusRedirections, "invalidate");
  -[BSCompoundAssertion invalidate](self->_springBoardFocusLockAssertions, "invalidate");
  -[BSCompoundAssertion invalidate](self->_suppressKeyboardFocusEvaluationAssertion, "invalidate");
  -[SBKeyboardFocusPolicyEnforcer invalidate](self->_policyEnforcer, "invalidate");
  -[SBKeyboardFocusCoalitionMember invalidate](self->_coalitionMember, "invalidate");
  -[BSInvalidatable invalidate](self->_stateCaptureAssertion, "invalidate");
}

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSString *debugName;
  _SBRecentlyUsedSceneIdentityCache *recentlyUsedScenes;
  int v14;
  NSString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _SBRecentlyUsedSceneIdentityCache *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v5, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identityToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pid");

  if ((int)v10 >= 1)
  {
    -[_SBRecentlyUsedSceneIdentityCache addSceneIdentityToken:forPID:](self->_recentlyUsedScenes, "addSceneIdentityToken:forPID:", v7, v10);
    SBLogKeyboardFocus();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      debugName = self->_debugName;
      recentlyUsedScenes = self->_recentlyUsedScenes;
      v14 = 138544130;
      v15 = debugName;
      v16 = 1024;
      v17 = v10;
      v18 = 2114;
      v19 = v7;
      v20 = 2114;
      v21 = recentlyUsedScenes;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] didAddExternalForegroundApplicationSceneHandle pid:%d scene:%{public}@ now:%{public}@", (uint8_t *)&v14, 0x26u);
    }

  }
}

- (void)sceneManager:(id)a3 willRemoveExternalForegroundApplicationSceneHandle:(id)a4 withReason:(int64_t)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v6, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = -[SBKeyboardFocusSceneController _removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:reason:](self, "_removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:reason:", v7, CFSTR("willRemoveExternalForegroundApplicationSceneHandle"));
  if ((_DWORD)v6)
  {
    +[SBKeyboardFocusArbitrationReason removedKeyboardArbiterSceneWillRemove](SBKeyboardFocusArbitrationReason, "removedKeyboardArbiterSceneWillRemove");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusSceneController _requestPolicyReevaluationForReason:](self, "_requestPolicyReevaluationForReason:", v8);

  }
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  id v9;

  v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v9, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isValid"))
  {
    objc_msgSend(v9, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBKeyboardFocusSceneController _removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:reason:](self, "_removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:reason:", v6, CFSTR("didRemoveExternalForegroundApplicationSceneHandle"));

    if (v7)
    {
      +[SBKeyboardFocusArbitrationReason removedKeyboardArbiterSceneDidRemove](SBKeyboardFocusArbitrationReason, "removedKeyboardArbiterSceneDidRemove");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBKeyboardFocusSceneController _requestPolicyReevaluationForReason:](self, "_requestPolicyReevaluationForReason:", v8);

    }
  }

}

- (BOOL)_removeSceneFromRecentsAndUpdateKeyboardFocusTargetIfNeeded:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSString *debugName;
  SBKeyboardFocusTarget **p_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSString *v22;
  void *v23;
  int v24;
  const char *v25;
  BOOL v26;
  NSObject *v27;
  NSString *v28;
  int v29;
  SBKeyboardFocusTarget *v31;
  NSString *v32;
  int v33;
  NSString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identityToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "processHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "pid");

  SBLogKeyboardFocus();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    debugName = self->_debugName;
    v33 = 138544130;
    v34 = debugName;
    v35 = 2114;
    v36 = v8;
    v37 = 1024;
    v38 = v11;
    v39 = 2114;
    v40 = v6;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing scene: %{public}@ pid: %d for reason: %{public}@", (uint8_t *)&v33, 0x26u);
  }

  -[_SBRecentlyUsedSceneIdentityCache removeSceneIdentityToken:forPID:](self->_recentlyUsedScenes, "removeSceneIdentityToken:forPID:", v8, v11);
  p_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks = &self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
  -[SBKeyboardFocusTarget sceneIdentityToken](self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, "sceneIdentityToken");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[SBKeyboardFocusTarget sceneIdentityToken](*p_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, "sceneIdentityToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = BSEqualObjects();

    if (v18)
    {
      -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForPID:]((uint64_t)self->_recentlyUsedScenes, v11);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = v19;
        objc_storeStrong((id *)&self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, v19);
        SBLogKeyboardFocus();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = self->_debugName;
          -[SBKeyboardFocusTarget sceneIdentityToken](self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, "sceneIdentityToken");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[SBKeyboardFocusTarget pid](self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, "pid");
          v33 = 138543874;
          v34 = v22;
          v35 = 2114;
          v36 = v23;
          v37 = 1024;
          v38 = v24;
          v25 = "[%{public}@] setting keyboard arbiter suggested scene to %{public}@ in same pid %d";
LABEL_12:
          _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v33, 0x1Cu);

        }
      }
      else
      {
        -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForAnyProcess]((id *)&self->_recentlyUsedScenes->super.isa);
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          v31 = *p_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
          *p_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks = 0;

          SBLogKeyboardFocus();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v32 = self->_debugName;
            v33 = 138543362;
            v34 = v32;
            _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] no available fallbacks for keyboard arbiter suggested scene", (uint8_t *)&v33, 0xCu);
          }
          goto LABEL_14;
        }
        v20 = v27;
        objc_storeStrong((id *)&self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, v27);
        SBLogKeyboardFocus();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v28 = self->_debugName;
          -[SBKeyboardFocusTarget sceneIdentityToken](self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, "sceneIdentityToken");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[SBKeyboardFocusTarget pid](self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, "pid");
          v33 = 138543874;
          v34 = v28;
          v35 = 2114;
          v36 = v23;
          v37 = 1024;
          v38 = v29;
          v25 = "[%{public}@] setting keyboard arbiter suggested scene to %{public}@ in MRU pid %d";
          goto LABEL_12;
        }
      }

LABEL_14:
      v26 = 1;
      goto LABEL_15;
    }
  }
  v26 = 0;
LABEL_15:

  return v26;
}

- (id)newPipeline
{
  SBKeyboardFocusAccessibilityResolutionStage *v3;
  SBKeyboardArbiterResolutionStage *v4;
  SBSystemUISceneResolutionStage *v5;
  SBSpringBoardFocusLockResolutionStage *v6;
  SBFocusRedirectResolutionStage *v7;
  SBSpringBoardOutboundFocusResolutionStage *v8;
  SBKeyboardFocusResolutionPipeline *v9;
  void *v10;
  SBKeyboardFocusResolutionPipeline *v11;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(SBKeyboardFocusAccessibilityResolutionStage);
  -[SBKeyboardFocusAccessibilityResolutionStage setDelegate:](v3, "setDelegate:", self);
  -[SBKeyboardFocusAccessibilityResolutionStage setSceneProvider:](v3, "setSceneProvider:", self);
  v4 = objc_alloc_init(SBKeyboardArbiterResolutionStage);
  -[SBKeyboardArbiterResolutionStage setDelegate:](v4, "setDelegate:", self);
  -[SBKeyboardArbiterResolutionStage setSceneProvider:](v4, "setSceneProvider:", self);
  v5 = objc_alloc_init(SBSystemUISceneResolutionStage);
  -[SBSystemUISceneResolutionStage setDelegate:](v5, "setDelegate:", self);
  -[SBSystemUISceneResolutionStage setSceneProvider:](v5, "setSceneProvider:", self);
  v6 = objc_alloc_init(SBSpringBoardFocusLockResolutionStage);
  -[SBSpringBoardFocusLockResolutionStage setDelegate:](v6, "setDelegate:", self);
  -[SBSpringBoardFocusLockResolutionStage setSceneProvider:](v6, "setSceneProvider:", self);
  v7 = objc_alloc_init(SBFocusRedirectResolutionStage);
  -[SBFocusRedirectResolutionStage setDelegate:](v7, "setDelegate:", self);
  -[SBFocusRedirectResolutionStage setSceneProvider:](v7, "setSceneProvider:", self);
  v8 = objc_alloc_init(SBSpringBoardOutboundFocusResolutionStage);
  -[SBSpringBoardOutboundFocusResolutionStage setSceneProvider:](v8, "setSceneProvider:", self);
  v9 = [SBKeyboardFocusResolutionPipeline alloc];
  v13[0] = v3;
  v13[1] = v4;
  v13[2] = v5;
  v13[3] = v6;
  v13[4] = v7;
  v13[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBKeyboardFocusResolutionPipeline initWithResolutionStages:](v9, "initWithResolutionStages:", v10);

  return v11;
}

- (id)accessibilityKeyboardFocusOverrideTarget
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "accessibilityOverrideTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mostRecentKeyboardArbiterSuggestedTarget
{
  return -[_SBRecentlyUsedSceneIdentityCache mostRecentFocusTargetForAnyProcess]((id *)&self->_recentlyUsedScenes->super.isa);
}

- (BOOL)shouldPreventFocusForSceneWithIdentityToken:(id)a3
{
  SBKeyboardFocusSceneControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;
  void *v6;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v4, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(WeakRetained, "shouldPreventFocusForSceneWithIdentityTokenStringRepresentation:", v6);
  return (char)v4;
}

- (SBKeyboardFocusTarget)springBoardSceneFocusTarget
{
  return self->_sbWindowSceneFocusTarget;
}

- (id)sceneForFocusTarget:(id)a3
{
  _SBKeyboardFocusSceneControllerDependencyProviding *dependencies;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  dependencies = self->_dependencies;
  v4 = a3;
  -[_SBKeyboardFocusSceneControllerDependencyProviding sceneProvider](dependencies, "sceneProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneIdentityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sceneForIdentityToken:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (FBScene)systemUISceneRequestingFocus
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "systemUISceneRequestingFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBScene *)v3;
}

- (NSSet)springBoardFocusLockReasons
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSSet *v10;
  NSSet *previousDependencyReasonsSpringShouldHaveFocus;
  void *v12;
  void *v13;
  NSSet *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  SBKeyboardFocusSceneController *v20;
  id v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __61__SBKeyboardFocusSceneController_springBoardFocusLockReasons__block_invoke;
  v19 = &unk_1E8EBBD28;
  v20 = self;
  v4 = v3;
  v21 = v4;
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](&v16);
  if (-[_SBKeyboardFocusSceneControllerDependencyProviding isShowingSystemModalAlert](self->_dependencies, "isShowingSystemModalAlert", v16, v17, v18, v19, v20))
  {
    +[SBKeyboardFocusLockReason systemModalAlert](SBKeyboardFocusLockReason, "systemModalAlert");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

  }
  if (-[_SBKeyboardFocusSceneControllerDependencyProviding isPresentingModalBannerInLongLook](self->_dependencies, "isPresentingModalBannerInLongLook"))
  {
    +[SBKeyboardFocusLockReason modalBannerInLongLook](SBKeyboardFocusLockReason, "modalBannerInLongLook");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v7);

  }
  if (-[_SBKeyboardFocusSceneControllerDependencyProviding isScreenDim](self->_dependencies, "isScreenDim"))
  {
    +[SBKeyboardFocusLockReason screenIsDim](SBKeyboardFocusLockReason, "screenIsDim");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v8);

  }
  if (-[_SBKeyboardFocusSceneControllerDependencyProviding isCoverSheetHostingAnApp](self->_dependencies, "isCoverSheetHostingAnApp"))
  {
    +[SBKeyboardFocusLockReason coverSheetHostingApp](SBKeyboardFocusLockReason, "coverSheetHostingApp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v9);

  }
  v10 = (NSSet *)objc_msgSend(v4, "copy");
  previousDependencyReasonsSpringShouldHaveFocus = self->_previousDependencyReasonsSpringShouldHaveFocus;
  self->_previousDependencyReasonsSpringShouldHaveFocus = v10;

  -[BSCompoundAssertion context](self->_springBoardFocusLockAssertions, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bs_map:", &__block_literal_global_95_1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "unionSet:", v13);
  v14 = (NSSet *)v4;

  return v14;
}

void __61__SBKeyboardFocusSceneController_springBoardFocusLockReasons__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "member:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }
  v8 = v6;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

id __61__SBKeyboardFocusSceneController_springBoardFocusLockReasons__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(id *)(a2 + 8);
  else
    return 0;
}

- (BOOL)isBannerKitHostingSceneWithIdentityTokenString:(id)a3
{
  return -[_SBKeyboardFocusSceneControllerDependencyProviding isBannerKitHostingSceneWithIdentityTokenString:](self->_dependencies, "isBannerKitHostingSceneWithIdentityTokenString:", a3);
}

- (BOOL)hasActiveTransientOverlayPresentation
{
  return -[_SBKeyboardFocusSceneControllerDependencyProviding hasActiveTransientOverlayPresentation](self->_dependencies, "hasActiveTransientOverlayPresentation");
}

- (BOOL)activeTransientOverlayPresentationShouldUseSceneBasedKeyboardFocus
{
  return -[_SBKeyboardFocusSceneControllerDependencyProviding activeTransientOverlayPresentationShouldUseSceneBasedKeyboardFocus](self->_dependencies, "activeTransientOverlayPresentationShouldUseSceneBasedKeyboardFocus");
}

- (BOOL)isActiveTransientOverlayPresentationFromSceneWithIdentityTokenString:(id)a3
{
  return -[_SBKeyboardFocusSceneControllerDependencyProviding isActiveTransientOverlayPresentationIsFromSceneWithIdentityTokenString:](self->_dependencies, "isActiveTransientOverlayPresentationIsFromSceneWithIdentityTokenString:", a3);
}

- (id)focusTargetForActiveTransientOverlayPresentation
{
  return (id)-[_SBKeyboardFocusSceneControllerDependencyProviding focusTargetForActiveTransientOverlayPresentation](self->_dependencies, "focusTargetForActiveTransientOverlayPresentation");
}

- (BOOL)isCoverSheetHostingAnApp
{
  return -[_SBKeyboardFocusSceneControllerDependencyProviding isCoverSheetHostingAnApp](self->_dependencies, "isCoverSheetHostingAnApp");
}

- (id)focusTargetForCoverSheetHostedAppGetCameraIsHosted:(BOOL *)a3
{
  return (id)-[_SBKeyboardFocusSceneControllerDependencyProviding focusTargetForCoverSheetHostedAppGetCameraIsHosted:](self->_dependencies, "focusTargetForCoverSheetHostedAppGetCameraIsHosted:", a3);
}

- (BOOL)activeTransientOverlayPresentationCanBecomeFirstResponder
{
  return -[_SBKeyboardFocusSceneControllerDependencyProviding activeTransientOverlayPresentationCanBecomeFirstResponder](self->_dependencies, "activeTransientOverlayPresentationCanBecomeFirstResponder");
}

- (BOOL)isSpolightPresentedAsTransientOverlay
{
  return -[_SBKeyboardFocusSceneControllerDependencyProviding isSpolightPresentedAsTransientOverlay](self->_dependencies, "isSpolightPresentedAsTransientOverlay");
}

- (id)keyboardFocusRedirectionForTarget:(id)a3
{
  id v4;
  void *v5;
  void *WeakRetained;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isEqual:", self->_sbWindowSceneFocusTarget))
  {
    -[BSCompoundAssertion orderedContext](self->_springBoardFocusRedirections, "orderedContext");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "appFocusRedirectionForProposedTarget:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (void)coalitionMemberFocusDidChange:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  SBKeyboardFocusPolicy *enforcedPolicy;
  NSString *debugName;
  int v10;
  NSString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "hasFocus"))
  {
    -[SBKeyboardFocusCoalition enforcedPolicy](self->_coalition, "enforcedPolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = BSEqualObjects();
    SBLogKeyboardFocus();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 1) != 0)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SBKeyboardFocusSceneController coalitionMemberFocusDidChange:].cold.1((uint64_t)self, (uint64_t *)&self->_enforcedPolicy, v7);

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        debugName = self->_debugName;
        v10 = 138543618;
        v11 = debugName;
        v12 = 2114;
        v13 = v4;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] coalition says I have focus; enforcing policy: %{public}@",
          (uint8_t *)&v10,
          0x16u);
      }

      objc_storeStrong((id *)&self->_enforcedPolicy, v4);
      -[SBKeyboardFocusPolicyEnforcer enforce:](self->_policyEnforcer, "enforce:", self->_enforcedPolicy);
    }

  }
  else
  {
    -[SBKeyboardFocusPolicyEnforcer stopEnforcing](self->_policyEnforcer, "stopEnforcing");
    enforcedPolicy = self->_enforcedPolicy;
    self->_enforcedPolicy = 0;

  }
}

- (id)generateUpdatedPreferencesForCoalitionMember:(id)a3 reason:(id)a4
{
  SBKeyboardFocusPolicy *v5;
  SBKeyboardFocusPolicy *preferredPolicy;
  SBKeyboardFocusPolicy *v7;
  void *v8;
  void *v9;

  -[SBKeyboardFocusSceneController _updatePolicyForReason:](self, "_updatePolicyForReason:", a4);
  v5 = (SBKeyboardFocusPolicy *)objc_claimAutoreleasedReturnValue();
  preferredPolicy = self->_preferredPolicy;
  self->_preferredPolicy = v5;

  v7 = self->_preferredPolicy;
  -[SBKeyboardFocusSceneController springBoardFocusLockReasons](self, "springBoardFocusLockReasons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusCoalitionMemberPreferences preferencesWithPolicy:lockReasons:](SBKeyboardFocusCoalitionMemberPreferences, "preferencesWithPolicy:lockReasons:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)coalitionAffinity
{
  return self->_coalitionAffinity;
}

- (void)setCoalitionAffinity:(int64_t)a3
{
  self->_coalitionAffinity = a3;
}

- (SBKeyboardFocusSceneControllerDelegate)delegate
{
  return (SBKeyboardFocusSceneControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBKeyboardFocusCoalition)coalition
{
  return self->_coalition;
}

- (_SBKeyboardFocusSceneControllerDependencyProviding)dependencies
{
  return self->_dependencies;
}

- (void)setDependencies:(id)a3
{
  objc_storeStrong((id *)&self->_dependencies, a3);
}

- (SBKeyboardFocusResolutionPipeline)pipeline
{
  return self->_pipeline;
}

- (void)setPipeline:(id)a3
{
  objc_storeStrong((id *)&self->_pipeline, a3);
}

- (BSCompoundAssertion)springBoardFocusRedirections
{
  return self->_springBoardFocusRedirections;
}

- (void)setSpringBoardFocusRedirections:(id)a3
{
  objc_storeStrong((id *)&self->_springBoardFocusRedirections, a3);
}

- (BSCompoundAssertion)springBoardFocusLockAssertions
{
  return self->_springBoardFocusLockAssertions;
}

- (void)setSpringBoardFocusLockAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_springBoardFocusLockAssertions, a3);
}

- (NSSet)previousDependencyReasonsSpringShouldHaveFocus
{
  return self->_previousDependencyReasonsSpringShouldHaveFocus;
}

- (void)setPreviousDependencyReasonsSpringShouldHaveFocus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BSCompoundAssertion)suppressKeyboardFocusEvaluationAssertion
{
  return self->_suppressKeyboardFocusEvaluationAssertion;
}

- (void)setSuppressKeyboardFocusEvaluationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suppressKeyboardFocusEvaluationAssertion, a3);
}

- (SBKeyboardFocusPolicyEnforcer)policyEnforcer
{
  return self->_policyEnforcer;
}

- (void)setPolicyEnforcer:(id)a3
{
  objc_storeStrong((id *)&self->_policyEnforcer, a3);
}

- (SBKeyboardFocusPolicy)preferredPolicy
{
  return self->_preferredPolicy;
}

- (void)setPreferredPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_preferredPolicy, a3);
}

- (SBKeyboardFocusPolicy)enforcedPolicy
{
  return self->_enforcedPolicy;
}

- (void)setEnforcedPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_enforcedPolicy, a3);
}

- (SBKeyboardFocusTarget)lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks
{
  return self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks;
}

- (void)setLastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks:(id)a3
{
  objc_storeStrong((id *)&self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, a3);
}

- (_SBRecentlyUsedSceneIdentityCache)recentlyUsedScenes
{
  return self->_recentlyUsedScenes;
}

- (void)setRecentlyUsedScenes:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyUsedScenes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedScenes, 0);
  objc_storeStrong((id *)&self->_lastKeyboardArbiterSuggestedFocusTargetExcludingFocusLocks, 0);
  objc_storeStrong((id *)&self->_enforcedPolicy, 0);
  objc_storeStrong((id *)&self->_preferredPolicy, 0);
  objc_storeStrong((id *)&self->_policyEnforcer, 0);
  objc_storeStrong((id *)&self->_suppressKeyboardFocusEvaluationAssertion, 0);
  objc_storeStrong((id *)&self->_previousDependencyReasonsSpringShouldHaveFocus, 0);
  objc_storeStrong((id *)&self->_springBoardFocusLockAssertions, 0);
  objc_storeStrong((id *)&self->_springBoardFocusRedirections, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_coalition, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_coalitionMember, 0);
  objc_storeStrong((id *)&self->_bufferingPredicate, 0);
  objc_storeStrong((id *)&self->_sbWindowSceneFocusTarget, 0);
  objc_destroyWeak((id *)&self->_sbWindowScene);
}

- (void)focusLockSpringBoardWindow:forReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)bufferEventsForReason:generation:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_requestPolicyReevaluationForReason:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)coalitionMemberFocusDidChange:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *a2;
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "[%{public}@] coalition says I have focus, but enforced policy is the same so not updating anything: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end
