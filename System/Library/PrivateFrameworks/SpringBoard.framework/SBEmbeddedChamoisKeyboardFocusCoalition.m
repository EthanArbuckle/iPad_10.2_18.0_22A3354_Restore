@implementation SBEmbeddedChamoisKeyboardFocusCoalition

- (SBEmbeddedChamoisKeyboardFocusCoalition)init
{
  SBEmbeddedChamoisKeyboardFocusCoalition *v2;
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
  v10.super_class = (Class)SBEmbeddedChamoisKeyboardFocusCoalition;
  v2 = -[SBKeyboardFocusCoalition _initWithDebugName:](&v10, sel__initWithDebugName_, CFSTR("Embedded+Chamois Coalition"));
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
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v6 = a3;
  v7 = a4;
  -[SBExclusiveMultiDisplayCoalition embeddedMember](self, "embeddedMember");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBExclusiveMultiDisplayCoalition externalMember](self, "externalMember");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateCoalitionPreferencesWithReason:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateCoalitionPreferencesWithReason:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "hasFocus"))
    v14 = v9;
  else
    v14 = v8;
  v15 = v14;
  v16 = objc_msgSend(v13, "focusLockReasonStrength");
  v17 = objc_msgSend(v12, "focusLockReasonStrength");
  v44 = v15;
  if (v6
    || ((v20 = v15, v6 = v20, v20 != v9) || (v21 = v9, v17 != 2)) && (v20 != v8 || (v21 = v8, v16 != 2))
    || (v22 = v21, (v19 = v6) == 0))
  {
    if (v16 != 2 || v17 == 2)
    {
      if (v16 == 2 || v17 != 2)
      {
        if (v16 == 2)
        {
          v41 = v11;
          objc_msgSend(v13, "lockReasons");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[SBKeyboardFocusLockReason mostRecentReasonInSet:strength:](SBKeyboardFocusLockReason, "mostRecentReasonInSet:strength:", v23, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "lockReasons");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[SBKeyboardFocusLockReason mostRecentReasonInSet:strength:](SBKeyboardFocusLockReason, "mostRecentReasonInSet:strength:", v25, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_msgSend(v24, "isMoreRecentThanReason:", v26) ? v8 : v9;
          v19 = v27;

          v11 = v41;
          if (v19)
            goto LABEL_47;
        }
LABEL_24:
        v43 = v10;
        objc_msgSend(v13, "lockReasons");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBKeyboardFocusLockReason mostRecentReasonInSet:strength:](SBKeyboardFocusLockReason, "mostRecentReasonInSet:strength:", v28, 1);
        v29 = v11;
        v30 = objc_claimAutoreleasedReturnValue();

        v42 = v29;
        objc_msgSend(v29, "lockReasons");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBKeyboardFocusLockReason mostRecentReasonInSet:strength:](SBKeyboardFocusLockReason, "mostRecentReasonInSet:strength:", v31, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = v32;
        if (v32
          && objc_msgSend(v32, "isEqual:", v30, v32)
          && (objc_msgSend((id)v30, "isMoreRecentThanReason:", v32) & 1) == 0)
        {

          v30 = 0;
        }
        objc_msgSend(v12, "lockReasons", v39);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBKeyboardFocusLockReason mostRecentReasonInSet:strength:](SBKeyboardFocusLockReason, "mostRecentReasonInSet:strength:", v33, 1);
        v34 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "lockReasons");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBKeyboardFocusLockReason mostRecentReasonInSet:strength:](SBKeyboardFocusLockReason, "mostRecentReasonInSet:strength:", v35, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36
          && objc_msgSend(v36, "isEqual:", v34)
          && (objc_msgSend((id)v34, "isMoreRecentThanReason:", v36) & 1) == 0)
        {

          v34 = 0;
          v19 = 0;
          v37 = v8;
          v10 = v43;
          if (!v30)
            goto LABEL_44;
        }
        else
        {
          if (v30 && v34)
          {
            if (objc_msgSend((id)v30, "isMoreRecentThanReason:", v34))
              v37 = v8;
            else
              v37 = v9;
          }
          else
          {
            if (v30)
              v37 = v8;
            else
              v37 = v9;
            if (!(v30 | v34))
            {
              v19 = 0;
              v10 = v43;
              goto LABEL_44;
            }
          }
          v10 = v43;
        }
        v19 = v37;

LABEL_44:
        if (!v19)
        {
          v6 = v6;
          v19 = v6;
        }
        v11 = v42;
        goto LABEL_47;
      }
      v18 = v9;
    }
    else
    {
      v18 = v8;
    }
    v19 = v18;
    if (v18)
      goto LABEL_47;
    goto LABEL_24;
  }
LABEL_47:

  return v19;
}

@end
