@implementation SBSystemActionInstanceIdentity

- (_QWORD)initWithHostIdentifier:(void *)a3 configurationIdentifier:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;
  objc_super v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
    goto LABEL_6;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("hostIdentifier != ((void *)0)"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionInstanceIdentity initWithHostIdentifier:configurationIdentifier:].cold.1(sel_initWithHostIdentifier_configurationIdentifier_);
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0A9FDECLL);
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("configurationIdentifier != ((void *)0)"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionInstanceIdentity initWithHostIdentifier:configurationIdentifier:].cold.2(sel_initWithHostIdentifier_configurationIdentifier_);
    goto LABEL_12;
  }
  v14.receiver = a1;
  v14.super_class = (Class)SBSystemActionInstanceIdentity;
  a1 = objc_msgSendSuper2(&v14, sel_init);
  if (a1)
  {
    v8 = objc_msgSend(v5, "copy");
    v9 = (void *)a1[1];
    a1[1] = v8;

    v10 = objc_msgSend(v7, "copy");
    v11 = (void *)a1[2];
    a1[2] = v10;

  }
LABEL_6:

  return a1;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBSystemActionInstanceIdentity *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__SBSystemActionInstanceIdentity_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

uint64_t __63__SBSystemActionInstanceIdentity_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("hostIdentifier"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("configurationIdentifier"));
}

- (BOOL)isEqual:(id)a3
{
  SBSystemActionInstanceIdentity *v4;
  void *v5;
  char isKindOfClass;
  SBSystemActionInstanceIdentity *v7;
  char v8;

  v4 = (SBSystemActionInstanceIdentity *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      if (BSEqualStrings())
        v8 = BSEqualStrings();
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", self->_hostIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", self->_configurationIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

- (void)initWithHostIdentifier:(const char *)a1 configurationIdentifier:.cold.1(const char *a1)
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

- (void)initWithHostIdentifier:(const char *)a1 configurationIdentifier:.cold.2(const char *a1)
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
