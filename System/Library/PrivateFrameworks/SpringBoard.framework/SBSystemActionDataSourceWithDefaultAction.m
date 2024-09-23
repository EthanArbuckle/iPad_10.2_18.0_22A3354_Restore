@implementation SBSystemActionDataSourceWithDefaultAction

- (id)initWithInnerDataSource:(void *)a3 defaultAction:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!a1)
    goto LABEL_6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("innerDataSource != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionDataSourceWithDefaultAction initWithInnerDataSource:defaultAction:].cold.1(sel_initWithInnerDataSource_defaultAction_);
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0A16624);
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("defaultAction != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionDataSourceWithDefaultAction initWithInnerDataSource:defaultAction:].cold.2(sel_initWithInnerDataSource_defaultAction_);
    goto LABEL_12;
  }
  objc_storeStrong(a1 + 4, a2);
  objc_storeStrong(a1 + 5, a3);
  objc_msgSend(v6, "hostIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = a1;
  v12.super_class = (Class)SBSystemActionDataSourceWithDefaultAction;
  a1 = (id *)objc_msgSendSuper2(&v12, sel_initWithHostIdentifier_, v9);

  if (a1)
    objc_msgSend(v6, "addObserver:", a1);
LABEL_6:

  return a1;
}

- (id)executorForSystemAction:(id)a3
{
  return (id)-[SBSystemActionDataSource executorForSystemAction:](self->_innerDataSource, "executorForSystemAction:", a3);
}

- (void)updateSelectedAction
{
  SBSystemAction *v3;
  SBSystemAction *v4;

  -[SBSystemActionDataSource selectedSystemAction](self->_innerDataSource, "selectedSystemAction");
  v3 = (SBSystemAction *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = self->_defaultAction;
  v4 = v3;
  -[SBSystemActionAbstractDataSource setSelectedSystemAction:](self, "setSelectedSystemAction:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_innerDataSource, 0);
}

- (void)initWithInnerDataSource:(const char *)a1 defaultAction:.cold.1(const char *a1)
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

- (void)initWithInnerDataSource:(const char *)a1 defaultAction:.cold.2(const char *a1)
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
