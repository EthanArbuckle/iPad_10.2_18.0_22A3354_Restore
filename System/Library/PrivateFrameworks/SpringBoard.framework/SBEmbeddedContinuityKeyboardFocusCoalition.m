@implementation SBEmbeddedContinuityKeyboardFocusCoalition

- (SBEmbeddedContinuityKeyboardFocusCoalition)init
{
  SBEmbeddedContinuityKeyboardFocusCoalition *v2;
  SBKeyboardFocusCoalitionPolicyEnforcer *v3;
  SBSystemKeyCommandCoalitionPolicyEnforcer *v4;
  SBCameraButtonPolicyEnforcer *v5;
  SBKeyboardFocusPolicyEnforcerPipeline *v6;
  void *v7;
  SBKeyboardFocusPolicyEnforcerPipeline *v8;
  objc_super v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SBEmbeddedContinuityKeyboardFocusCoalition;
  v2 = -[SBKeyboardFocusCoalition _initWithDebugName:](&v10, sel__initWithDebugName_, CFSTR("Embedded+Continuity Coalition"));
  if (v2)
  {
    v3 = objc_alloc_init(SBKeyboardFocusCoalitionPolicyEnforcer);
    v4 = objc_alloc_init(SBSystemKeyCommandCoalitionPolicyEnforcer);
    v5 = objc_alloc_init(SBCameraButtonPolicyEnforcer);
    v6 = [SBKeyboardFocusPolicyEnforcerPipeline alloc];
    v11[0] = v3;
    v11[1] = v4;
    v11[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBKeyboardFocusPolicyEnforcerPipeline initWithEnforcers:](v6, "initWithEnforcers:", v7);

    -[SBKeyboardFocusCoalition setPolicyEnforcer:](v2, "setPolicyEnforcer:", v8);
  }
  return v2;
}

- (id)updatePolicyForArbitrationRequestFromMember:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBExclusiveMultiDisplayCoalition embeddedMember](self, "embeddedMember");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBExclusiveMultiDisplayCoalition externalMember](self, "externalMember");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "updateCoalitionPreferencesWithReason:", v7);
  v11 = (id)objc_msgSend(v9, "updateCoalitionPreferencesWithReason:", v7);
  objc_msgSend(v8, "preferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  if (objc_msgSend(v7, "isKeyboardArbiterSuggestion") && v8 == v6)
  {
    objc_msgSend(v12, "policy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "advicePolicy") == 1)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v12, "lockReasons");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v15, "bs_containsObjectPassingTest:", &__block_literal_global_248) ^ 1;

    }
  }
  if (v6 && (objc_msgSend(v7, "isKeyboardArbiterSuggestion") ^ 1 | v13) != 1)
  {
    v17 = v6;
  }
  else
  {
    if (objc_msgSend(v9, "hasFocus"))
      v16 = v9;
    else
      v16 = v8;
    v17 = v16;
    SBLogKeyboardFocus();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[SBKeyboardFocusCoalition debugName](self, "debugName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uniqueIdentifier");
      v24 = v12;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniqueIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v26 = v19;
      v27 = 2114;
      v28 = v20;
      v29 = 2114;
      v30 = v21;
      v31 = 2114;
      v32 = v7;
      v33 = 1024;
      v34 = v13;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: selecting member %{public}@, original requester %{public}@, reason: %{public}@, was overruled by hard focus lock: %d", buf, 0x30u);

      v12 = v24;
    }

  }
  v22 = v17;

  return v22;
}

BOOL __97__SBEmbeddedContinuityKeyboardFocusCoalition_updatePolicyForArbitrationRequestFromMember_reason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "strength") == 1;
}

@end
