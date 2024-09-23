@implementation SBPhysicalButtonCompletionHandler

- (_QWORD)initWithIdentifier:(uint64_t)a3 button:(void *)a4 block:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  objc_super v16;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (!a1)
    goto LABEL_6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier != ((void *)0)"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBPhysicalButtonCompletionHandler initWithIdentifier:button:block:].cold.1(sel_initWithIdentifier_button_block_);
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D08DD93CLL);
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block != ((void *)0)"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBPhysicalButtonCompletionHandler initWithIdentifier:button:block:].cold.2(sel_initWithIdentifier_button_block_);
    goto LABEL_12;
  }
  v16.receiver = a1;
  v16.super_class = (Class)SBPhysicalButtonCompletionHandler;
  a1 = objc_msgSendSuper2(&v16, sel_init);
  if (a1)
  {
    v10 = objc_msgSend(v7, "copy");
    v11 = (void *)a1[3];
    a1[3] = v10;

    a1[2] = a3;
    v12 = objc_msgSend(v9, "copy");
    v13 = (void *)a1[1];
    a1[1] = v12;

  }
LABEL_6:

  return a1;
}

- (void)dealloc
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
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (BOOL)completeWithResult:(unint64_t)a3
{
  id block;
  NSObject *v6;
  void *v7;
  void *v8;
  NSString *identifier;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  block = self->_block;
  if (block)
  {
    SBLogButtonsInteraction();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringFromUIPhysicalButton();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBPhysicalButtonResult(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      v13 = 138543874;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = identifier;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Button completion %{public}@-%{public}@ for '%{public}@'", (uint8_t *)&v13, 0x20u);

    }
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](self->_block);
    v11 = self->_block;
    self->_block = 0;

    ((void (**)(_QWORD, SBPhysicalButtonCompletionHandler *, unint64_t))v10)[2](v10, self, a3);
  }
  return block != 0;
}

- (id)descriptionWithMultilinePrefix:(uint64_t)a1
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[SBPhysicalButtonCompletionHandler succinctDescriptionBuilder](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "build");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)succinctDescriptionBuilder
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _NSStringFromUIPhysicalButton();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendString:withName:", v3, CFSTR("button"));

    objc_msgSend(v2, "appendString:withName:", *(_QWORD *)(a1 + 24), CFSTR("identifier"));
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)descriptionBuilderWithMultilinePrefix:(void *)a1
{
  if (a1)
  {
    -[SBPhysicalButtonCompletionHandler succinctDescriptionBuilder]((uint64_t)a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (unint64_t)button
{
  return self->_button;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_block, 0);
}

- (void)initWithIdentifier:(const char *)a1 button:block:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIdentifier:(const char *)a1 button:block:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
