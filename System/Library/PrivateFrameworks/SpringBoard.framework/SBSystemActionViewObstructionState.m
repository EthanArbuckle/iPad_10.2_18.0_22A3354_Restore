@implementation SBSystemActionViewObstructionState

- (SBSystemActionViewObstructionState)initWithEvent:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  SBSystemActionViewObstructionState *v9;
  SBSystemActionViewObstructionState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSystemActionViewObstructionState;
  v9 = -[SBSystemActionViewObstructionState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

+ (id)emptyState
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithEvent:error:", 0, 0);
}

+ (id)stateWithEvent:(uint64_t)a1
{
  id v2;
  objc_class *v3;
  void *v4;
  id result;
  void *v6;

  v2 = a2;
  v3 = (objc_class *)objc_opt_self();
  if (v2)
  {
    v4 = (void *)objc_msgSend([v3 alloc], "initWithEvent:error:", v2, 0);

    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("event != ((void *)0)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[SBSystemActionViewObstructionState stateWithEvent:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)stateWithError:(uint64_t)a1
{
  id v2;
  objc_class *v3;
  void *v4;
  id result;
  void *v6;

  v2 = a2;
  v3 = (objc_class *)objc_opt_self();
  if (v2)
  {
    v4 = (void *)objc_msgSend([v3 alloc], "initWithEvent:error:", 0, v2);

    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("error != ((void *)0)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[SBSystemActionViewObstructionState stateWithError:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SBSystemActionViewObstructionState *v4;
  SBSystemActionViewObstructionState *v5;
  SBSystemActionViewObstructionState *v6;
  char v7;

  v4 = (SBSystemActionViewObstructionState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (BSEqualObjects())
      v7 = BSEqualObjects();
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

+ (void)stateWithEvent:.cold.1()
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
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)stateWithError:.cold.1()
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
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
