@implementation SBSystemActionDefaultsDataSource

- (id)initWithDefaults:(void *)a3 instanceIdentity:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (a1)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("defaults != ((void *)0)"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionDefaultsDataSource initWithDefaults:instanceIdentity:].cold.1(sel_initWithDefaults_instanceIdentity_);
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D087F208);
    }
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("instanceIdentity != ((void *)0)"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBSystemActionDefaultsDataSource initWithDefaults:instanceIdentity:].cold.2(sel_initWithDefaults_instanceIdentity_);
      objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D087F26CLL);
    }
    objc_storeStrong(a1 + 5, a2);
    v9 = objc_msgSend(v8, "copyWithZone:", 0);
    v10 = a1[6];
    a1[6] = (id)v9;

    objc_msgSend(v8, "hostIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22.receiver = a1;
    v22.super_class = (Class)SBSystemActionDefaultsDataSource;
    a1 = (id *)objc_msgSendSuper2(&v22, sel_initWithHostIdentifier_, v11);

    if (a1)
    {
      objc_initWeak(&location, a1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "configuredActionArchive");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C80D38];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __70__SBSystemActionDefaultsDataSource_initWithDefaults_instanceIdentity___block_invoke;
      v19[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v20, &location);
      v15 = (id)objc_msgSend(v6, "observeDefaults:onQueue:withBlock:", v13, MEMORY[0x1E0C80D38], v19);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __70__SBSystemActionDefaultsDataSource_initWithDefaults_instanceIdentity___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateSelectedAction");

}

- (id)executorForSystemAction:(id)a3
{
  return (id)objc_msgSend(a3, "newExecutor");
}

- (void)updateSelectedAction
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "(%{public}@) Error unarchiving configured action: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceIdentity, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)initWithDefaults:(const char *)a1 instanceIdentity:.cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_8_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDefaults:(const char *)a1 instanceIdentity:.cold.2(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_8_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
