@implementation SBKeyboardFocusCoalitionMemberPreferences

+ (id)preferencesWithPolicy:(id)a3 lockReasons:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__SBKeyboardFocusCoalitionMemberPreferences_preferencesWithPolicy_lockReasons___block_invoke;
  v12[3] = &unk_1E8EA5588;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "build:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __79__SBKeyboardFocusCoalitionMemberPreferences_preferencesWithPolicy_lockReasons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setPolicy:", v3);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v4, "setLockReasons:", v5);

}

+ (id)build:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;

  v3 = (void (**)(id, id))a3;
  v4 = -[SBKeyboardFocusCoalitionMemberPreferences _init]([SBMutableKeyboardFocusCoalitionPreferences alloc], "_init");
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

+ (id)new
{
  objc_opt_class();
  return (id)objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_init");
}

- (id)_init
{
  uint64_t v3;
  uint64_t v4;
  id result;
  void *v6;
  objc_super v7;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class() || (v4 = objc_opt_class(), v4 == objc_opt_class()))
  {
    v7.receiver = self;
    v7.super_class = (Class)SBKeyboardFocusCoalitionMemberPreferences;
    return -[SBKeyboardFocusCoalitionMemberPreferences init](&v7, sel_init);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBKeyboardFocusCoalitionMemberPreferences cannot be subclassed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBKeyboardFocusCoalitionMemberPreferences _init].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)_initWithCopyOf:(id)a3
{
  id *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = (id *)a3;
  v5 = -[SBKeyboardFocusCoalitionMemberPreferences _init](self, "_init");
  if (v5)
  {
    v6 = objc_msgSend(v4[1], "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = objc_msgSend(v4[2], "copy");
    v9 = (void *)v5[2];
    v5[2] = v8;

  }
  return v5;
}

- (unint64_t)hash
{
  NSSet *lockReasons;

  -[SBKeyboardFocusPolicy hash](self->_policy, "hash");
  lockReasons = self->_lockReasons;
  if (lockReasons)
    -[NSSet hash](lockReasons, "hash");
  return BSHashPurifyNS();
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  id v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (BSEqualObjects())
      v5 = BSEqualObjects();
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBKeyboardFocusCoalitionMemberPreferences _initWithCopyOf:]([SBKeyboardFocusCoalitionMemberPreferences alloc], "_initWithCopyOf:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBKeyboardFocusCoalitionMemberPreferences _initWithCopyOf:]([SBMutableKeyboardFocusCoalitionPreferences alloc], "_initWithCopyOf:", self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBKeyboardFocusCoalitionMemberPreferences *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__SBKeyboardFocusCoalitionMemberPreferences_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendBodySectionWithName:block:", 0, v6);

}

id __71__SBKeyboardFocusCoalitionMemberPreferences_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("policy"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("lockReasons"));
}

- (SBKeyboardFocusPolicy)policy
{
  return self->_policy;
}

- (NSSet)lockReasons
{
  return self->_lockReasons;
}

- (int64_t)focusLockReasonStrength
{
  if (-[SBKeyboardFocusPolicy advicePolicy](self->_policy, "advicePolicy"))
    return 0;
  else
    return +[SBKeyboardFocusLockReason maximumStrengthInSet:](SBKeyboardFocusLockReason, "maximumStrengthInSet:", self->_lockReasons);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockReasons, 0);
  objc_storeStrong((id *)&self->_policy, 0);
}

- (void)_init
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

@end
