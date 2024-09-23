@implementation PRSMutablePosterConfiguration

+ (id)mutableConfiguration
{
  void *v3;
  void *v4;

  PFPosterRoleDefaultRoleForCurrentExtensionProcess();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mutableConfigurationWithRole:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mutableConfigurationWithRole:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id result;
  void *v8;

  v4 = a3;
  if ((PFPosterRoleIsValid() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D7F8D0], "temporaryPathForRole:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PRSPosterConfiguration _initWithPath:]([PRSMutablePosterConfiguration alloc], "_initWithPath:", v5);
    objc_msgSend(v5, "invalidate");

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PFPosterRoleIsValid(role)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSMutablePosterConfiguration mutableConfigurationWithRole:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)storeUserInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PRSPosterConfiguration _path](self, "_path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "storeUserInfo:error:", v6, a4);

  return (char)a4;
}

+ (void)mutableConfigurationWithRole:(const char *)a1 .cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
