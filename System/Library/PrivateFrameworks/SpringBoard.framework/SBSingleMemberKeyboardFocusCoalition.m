@implementation SBSingleMemberKeyboardFocusCoalition

- (SBSingleMemberKeyboardFocusCoalition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  return (SBSingleMemberKeyboardFocusCoalition *)-[SBKeyboardFocusCoalition _initWithDebugName:](&v3, sel__initWithDebugName_, CFSTR("Single Member Coalition"));
}

- (void)addedMember:(id)a3
{
  SBKeyboardFocusCoalitionMember *v5;
  SBKeyboardFocusCoalitionMember *member;
  void *v7;
  void *v8;
  objc_super v9;

  v5 = (SBKeyboardFocusCoalitionMember *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  -[SBKeyboardFocusCoalition addedMember:](&v9, sel_addedMember_, v5);
  if (self->_member)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoalitionMember uniqueIdentifier](v5, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSingleMemberKeyboardFocusCoalition.m"), 27, CFSTR("Trying to add %@ but already tracking %@"), v8, self->_member);

  }
  member = self->_member;
  self->_member = v5;

}

- (void)removedMember:(id)a3
{
  SBKeyboardFocusCoalitionMember *v5;
  SBKeyboardFocusCoalitionMember *member;
  void *v7;
  void *v8;
  objc_super v9;

  v5 = (SBKeyboardFocusCoalitionMember *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  -[SBKeyboardFocusCoalition removedMember:](&v9, sel_removedMember_, v5);
  member = v5;
  if (self->_member != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoalitionMember uniqueIdentifier](v5, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSingleMemberKeyboardFocusCoalition.m"), 33, CFSTR("Trying to remove a member: %@ that I'm not tracking"), v8);

    member = self->_member;
  }
  self->_member = 0;

}

- (void)setNeedsArbitrationForReason:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  v4 = a3;
  -[SBKeyboardFocusCoalition setNeedsArbitrationForReason:](&v5, sel_setNeedsArbitrationForReason_, v4);
  -[SBSingleMemberKeyboardFocusCoalition _arbitrateForReason:](self, "_arbitrateForReason:", v4, v5.receiver, v5.super_class);

}

- (void)memberRequestsArbitration:(id)a3 forReason:(id)a4
{
  SBKeyboardFocusCoalitionMember *v7;
  id v8;
  void *v9;
  objc_super v10;

  v7 = (SBKeyboardFocusCoalitionMember *)a3;
  v8 = a4;
  if (self->_member != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSingleMemberKeyboardFocusCoalition.m"), 43, CFSTR("member requested arbitration but it isn't the one i'm tracking"));

  }
  v10.receiver = self;
  v10.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  -[SBKeyboardFocusCoalition memberRequestsArbitration:forReason:](&v10, sel_memberRequestsArbitration_forReason_, v7, v8);
  -[SBSingleMemberKeyboardFocusCoalition _arbitrateForReason:](self, "_arbitrateForReason:", v8);

}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBSingleMemberKeyboardFocusCoalition;
  -[SBKeyboardFocusCoalition invalidate](&v2, sel_invalidate);
}

- (void)_arbitrateForReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  SBKeyboardFocusCoalitionMember *member;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBKeyboardFocusCoalition isKeyboardFocusEvaluationSuppressed](self, "isKeyboardFocusEvaluationSuppressed"))
  {
    SBLogKeyboardFocus();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SBKeyboardFocusCoalition debugName](self, "debugName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBKeyboardFocusCoalition keyboardFocusEvaluationSupressionReasons](self, "keyboardFocusEvaluationSupressionReasons");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v6;
      v18 = 2114;
      v19 = v4;
      v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _abritrateForReason: %{public}@ - but we are supressing keyboard focus evaluation for reasons: %{public}@", (uint8_t *)&v16, 0x20u);

LABEL_16:
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (-[SBKeyboardFocusCoalition isInvalidated](self, "isInvalidated"))
  {
    SBLogKeyboardFocus();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    -[SBKeyboardFocusCoalition debugName](self, "debugName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v8;
    v18 = 2114;
    v19 = v4;
    v9 = "[%{public}@] _abritrateForReason: %{public}@ - but we invalidated";
LABEL_13:
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, 0x16u);

    goto LABEL_17;
  }
  member = self->_member;
  if (member)
  {
    -[SBKeyboardFocusCoalitionMember updateCoalitionPreferencesWithReason:](member, "updateCoalitionPreferencesWithReason:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject policy](v5, "policy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusCoalition enforcedPolicy](self, "enforcedPolicy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v6);

    if (v12)
    {
      SBLogKeyboardFocus();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[SBKeyboardFocusCoalition debugName](self, "debugName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v14;
        v18 = 2114;
        v19 = v4;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] _abritrateForReason: %{public}@ - new policy is unchanged", (uint8_t *)&v16, 0x16u);

      }
    }
    else
    {
      -[SBKeyboardFocusCoalition policyEnforcer](self, "policyEnforcer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "enforce:", v6);

      -[SBKeyboardFocusCoalition setEnforcedPolicy:](self, "setEnforcedPolicy:", v6);
      -[SBKeyboardFocusCoalitionMember setHasFocus:](self->_member, "setHasFocus:", 1);
      -[SBKeyboardFocusCoalitionMember focusPolicyDidChange](self->_member, "focusPolicyDidChange");
      -[SBKeyboardFocusCoalition delegate](self, "delegate");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject keyboardFocusCoalitionDidUpdateEnforcedPolicy:](v13, "keyboardFocusCoalitionDidUpdateEnforcedPolicy:", self);
    }

    goto LABEL_16;
  }
  SBLogKeyboardFocus();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SBKeyboardFocusCoalition debugName](self, "debugName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v8;
    v18 = 2114;
    v19 = v4;
    v9 = "[%{public}@] _abritrateForReason: %{public}@ - but we have no member";
    goto LABEL_13;
  }
LABEL_17:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_member, 0);
}

@end
