@implementation SBExclusiveMultiDisplayCoalition

- (void)addedMember:(id)a3
{
  SBKeyboardFocusCoalitionMember *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  SBKeyboardFocusCoalitionMember *embeddedMember;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (SBKeyboardFocusCoalitionMember *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SBExclusiveMultiDisplayCoalition;
  -[SBKeyboardFocusCoalition addedMember:](&v18, sel_addedMember_, v5);
  -[SBKeyboardFocusCoalitionMember sbWindowScene](v5, "sbWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sbDisplayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isMainDisplay");

  if (v9)
  {
    embeddedMember = self->_embeddedMember;
    self->_embeddedMember = v5;

    SBLogKeyboardFocus();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[SBKeyboardFocusCoalition debugName](self, "debugName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      v13 = "[%{public}@] added embedded display member";
LABEL_7:
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);

    }
  }
  else
  {
    if (self->_externalMember)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      -[SBKeyboardFocusCoalitionMember uniqueIdentifier](v5, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBKeyboardFocusCoalitionMember uniqueIdentifier](self->_externalMember, "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Trying to add external member %@ but already tracking %@"), v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBExclusiveMultiDisplayCoalition addedMember:].cold.1(a2);
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0A69584);
    }
    self->_externalMember = v5;

    SBLogKeyboardFocus();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[SBKeyboardFocusCoalition debugName](self, "debugName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      v13 = "[%{public}@] added external display member";
      goto LABEL_7;
    }
  }

}

- (void)setNeedsArbitrationForReason:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBExclusiveMultiDisplayCoalition;
  v4 = a3;
  -[SBKeyboardFocusCoalition setNeedsArbitrationForReason:](&v5, sel_setNeedsArbitrationForReason_, v4);
  -[SBExclusiveMultiDisplayCoalition _arbitrateWithRequestingMember:reason:](self, "_arbitrateWithRequestingMember:reason:", 0, v4, v5.receiver, v5.super_class);

}

- (void)memberRequestsArbitration:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBExclusiveMultiDisplayCoalition;
  v6 = a4;
  v7 = a3;
  -[SBKeyboardFocusCoalition memberRequestsArbitration:forReason:](&v8, sel_memberRequestsArbitration_forReason_, v7, v6);
  -[SBExclusiveMultiDisplayCoalition _arbitrateWithRequestingMember:reason:](self, "_arbitrateWithRequestingMember:reason:", v7, v6, v8.receiver, v8.super_class);

}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBExclusiveMultiDisplayCoalition;
  -[SBKeyboardFocusCoalition invalidate](&v2, sel_invalidate);
}

- (SBKeyboardFocusCoalitionMember)initiallyFocusedMember
{
  return self->_embeddedMember;
}

- (id)updatePolicyForArbitrationRequestFromMember:(id)a3 reason:(id)a4
{
  return self->_embeddedMember;
}

- (void)_performInitialArbitrationWithReason:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBKeyboardFocusCoalition members](self, "members", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "updateCoalitionPreferencesWithReason:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[SBExclusiveMultiDisplayCoalition initiallyFocusedMember](self, "initiallyFocusedMember");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBExclusiveMultiDisplayCoalition _selectMemberPolicy:](self, "_selectMemberPolicy:", v11);

  -[SBKeyboardFocusCoalition delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyboardFocusCoalitionDidUpdateEnforcedPolicy:", self);

}

- (void)_arbitrateWithRequestingMember:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  SBKeyboardFocusCoalitionMember *enforcedMember;
  NSObject *v20;
  void *v21;
  const char *v22;
  void *v23;
  uint8_t buf[4];
  NSObject *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[SBKeyboardFocusCoalition isKeyboardFocusEvaluationSuppressed](self, "isKeyboardFocusEvaluationSuppressed"))
  {
    SBLogKeyboardFocus();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_23:

LABEL_24:
      return;
    }
    -[SBKeyboardFocusCoalition debugName](self, "debugName");
    v10 = objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoalition keyboardFocusEvaluationSupressionReasons](self, "keyboardFocusEvaluationSupressionReasons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v10;
    v26 = 2114;
    v27 = v8;
    v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: %{public}@ - but we are supressing keyboard focus evaluation for reasons: %{public}@", buf, 0x20u);

LABEL_22:
    goto LABEL_23;
  }
  if (-[SBKeyboardFocusCoalition isInvalidated](self, "isInvalidated"))
  {
    SBLogKeyboardFocus();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SBKeyboardFocusCoalition debugName](self, "debugName");
      v12 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v12;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: %{public}@ - but we invalidated", buf, 0x16u);

    }
    goto LABEL_23;
  }
  if (!self->_enforcedMember)
  {
    SBLogKeyboardFocus();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[SBKeyboardFocusCoalition debugName](self, "debugName");
      v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: %{public}@ - performing initial arbitration]", buf, 0x16u);

    }
    -[SBExclusiveMultiDisplayCoalition _performInitialArbitrationWithReason:](self, "_performInitialArbitrationWithReason:", v8);
    goto LABEL_24;
  }
  -[SBExclusiveMultiDisplayCoalition updatePolicyForArbitrationRequestFromMember:reason:](self, "updatePolicyForArbitrationRequestFromMember:reason:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  SBLogKeyboardFocus();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[SBKeyboardFocusCoalition debugName](self, "debugName");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject uniqueIdentifier](v9, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v25 = v14;
    v26 = 2114;
    v27 = v8;
    v28 = 2114;
    v29 = v15;
    v30 = 2114;
    v31 = v16;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: %{public}@ - selecting member:%{public}@ requested by:%{public}@", buf, 0x2Au);

  }
  if (-[SBExclusiveMultiDisplayCoalition _selectMemberPolicy:](self, "_selectMemberPolicy:", v9))
  {
    -[SBKeyboardFocusCoalition delegate](self, "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject keyboardFocusCoalitionDidUpdateEnforcedPolicy:](v10, "keyboardFocusCoalitionDidUpdateEnforcedPolicy:", self);
    goto LABEL_22;
  }
  enforcedMember = self->_enforcedMember;
  if (enforcedMember == self->_embeddedMember)
  {
    SBLogKeyboardFocus();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    -[SBKeyboardFocusCoalition debugName](self, "debugName");
    v20 = objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoalitionMember succinctDescription](self->_enforcedMember, "succinctDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v20;
    v26 = 2114;
    v27 = v8;
    v28 = 2114;
    v29 = v21;
    v22 = "[%{public}@] arbitration: %{public}@ - policy unchanged; embedded member still focused: %{public}@";
    goto LABEL_21;
  }
  if (enforcedMember == self->_externalMember)
  {
    SBLogKeyboardFocus();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    -[SBKeyboardFocusCoalition debugName](self, "debugName");
    v20 = objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoalitionMember succinctDescription](self->_enforcedMember, "succinctDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v20;
    v26 = 2114;
    v27 = v8;
    v28 = 2114;
    v29 = v21;
    v22 = "[%{public}@] arbitration: %{public}@ - policy unchanged; external member still focused: %{public}@";
LABEL_21:
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, v22, buf, 0x20u);

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown member %@ focused"), self->_enforcedMember);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBExclusiveMultiDisplayCoalition _arbitrateWithRequestingMember:reason:].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (BOOL)_selectMemberPolicy:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  uint64_t v29;
  SBExclusiveMultiDisplayCoalition *v30;
  uint64_t v31;
  _BOOL4 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "preferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "policy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBKeyboardFocusCoalitionMember isEqual:](self->_enforcedMember, "isEqual:", v5)
    && -[SBKeyboardFocusCoalitionMemberPreferences isEqual:](self->_enforcedPreferences, "isEqual:", v6))
  {
    SBLogKeyboardFocus();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SBKeyboardFocusCoalition debugName](self, "debugName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: no change", buf, 0xCu);

    }
    v10 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_enforcedMember, a3);
    objc_storeStrong((id *)&self->_enforcedPreferences, v6);
    -[SBKeyboardFocusCoalition policyEnforcer](self, "policyEnforcer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enforce:", v7);

    -[SBKeyboardFocusCoalition setEnforcedPolicy:](self, "setEnforcedPolicy:", v7);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[SBKeyboardFocusCoalition members](self, "members");
    v8 = objc_claimAutoreleasedReturnValue();
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v12)
    {
      v13 = v12;
      v27 = v7;
      v28 = v6;
      v14 = *(_QWORD *)v34;
      v29 = *(_QWORD *)v34;
      v30 = self;
      do
      {
        v15 = 0;
        v31 = v13;
        do
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v8);
          v16 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * v15);
          objc_msgSend(v16, "setHasFocus:", v16 == v5);
          objc_msgSend(v16, "focusPolicyDidChange");
          SBLogKeyboardFocus();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v32 = v16 == v5;
            -[SBKeyboardFocusCoalition debugName](self, "debugName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "succinctDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "preferences");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "policy");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "keyboardFocusTarget");
            v22 = v8;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "sceneIdentityToken");
            v24 = v5;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v38 = v18;
            v39 = 2114;
            v40 = v19;
            v41 = 1024;
            v42 = v32;
            v43 = 2114;
            v44 = v25;
            _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] arbitration: %{public}@ hasFocus: %{BOOL}u -- %{public}@ ", buf, 0x26u);

            v8 = v22;
            self = v30;

            v5 = v24;
            v14 = v29;

            v13 = v31;
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v13);
      v10 = 1;
      v7 = v27;
      v6 = v28;
    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

- (SBKeyboardFocusCoalitionMember)embeddedMember
{
  return self->_embeddedMember;
}

- (SBKeyboardFocusCoalitionMember)externalMember
{
  return self->_externalMember;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcedPreferences, 0);
  objc_storeStrong((id *)&self->_enforcedMember, 0);
  objc_storeStrong((id *)&self->_externalMember, 0);
  objc_storeStrong((id *)&self->_embeddedMember, 0);
}

- (void)addedMember:(const char *)a1 .cold.1(const char *a1)
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
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_arbitrateWithRequestingMember:(const char *)a1 reason:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
