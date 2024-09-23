@implementation SBMutableKeyboardFocusPolicy

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBKeyboardFocusPolicy _initWithCopyOf:]((id *)[SBKeyboardFocusPolicy alloc], self);
}

- (void)setKeyboardFocusTarget:(id)a3
{
  void *v6;
  id v7;

  v7 = a3;
  if (v7 && (NSClassFromString(CFSTR("SBKeyboardFocusTarget")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:SBKeyboardFocusTargetClass]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBMutableKeyboardFocusPolicy setKeyboardFocusTarget:].cold.1(a2, (uint64_t)self, (uint64_t)v6);
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->super._keyboardFocusTarget, a3);
      -[BSAuditHistory addItemWithFormat:](self->super._auditHistory, "addItemWithFormat:", CFSTR("Updated Target: %@"), v7);
    }

  }
}

- (void)setAdvicePolicy:(int64_t)a3
{
  BSAuditHistory *auditHistory;
  id v4;

  if (self->super._selectionPolicy != a3)
  {
    self->super._selectionPolicy = a3;
    auditHistory = self->super._auditHistory;
    NSStringFromSBKeyboardFocusAdviceAcceptancePolicy(a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[BSAuditHistory addItemWithFormat:](auditHistory, "addItemWithFormat:", CFSTR("Updated advice: %@"), v4);

  }
}

- (void)setShouldSuppressRemoteDeferring:(BOOL)a3
{
  BSAuditHistory *auditHistory;
  const __CFString *v4;

  if (self->super._shouldSuppressRemoteDeferring != a3)
  {
    self->super._shouldSuppressRemoteDeferring = a3;
    auditHistory = self->super._auditHistory;
    v4 = CFSTR("NO");
    if (a3)
      v4 = CFSTR("YES");
    -[BSAuditHistory addItemWithFormat:](auditHistory, "addItemWithFormat:", CFSTR("Updated should suppress remote deferring to %@"), v4);
  }
}

- (void)setCameraIsHosted:(BOOL)a3
{
  self->super._cameraIsHosted = a3;
}

- (void)setWindowSceneAncestor:(id)a3
{
  SBWindowScene **p_sbWindowSceneAncestor;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_sbWindowSceneAncestor = &self->super._sbWindowSceneAncestor;
  WeakRetained = objc_loadWeakRetained((id *)p_sbWindowSceneAncestor);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_sbWindowSceneAncestor, obj);
    v6 = obj;
  }

}

- (void)setKeyboardFocusTarget:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBKeyboardFocusPolicy.m");
  v16 = 1024;
  v17 = 213;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
