@implementation PRSActivePosterConfiguration

- (PRSActivePosterConfiguration)initWithLockScreenPosterConfiguration:(id)a3 homeScreenPosterConfiguration:(id)a4
{
  id v8;
  id v9;
  id v10;
  id v11;
  PRSActivePosterConfiguration *v12;
  PRSActivePosterConfiguration *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  NSClassFromString(CFSTR("PRSPosterConfiguration"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSActivePosterConfiguration initWithLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.1(a2);
LABEL_16:
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49CB1A4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSActivePosterConfiguration initWithLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49CB208);
  }

  v11 = v9;
  if (v11)
  {
    NSClassFromString(CFSTR("PRSPosterConfiguration"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSActivePosterConfiguration initWithLockScreenPosterConfiguration:homeScreenPosterConfiguration:].cold.2(a2);
      goto LABEL_16;
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)PRSActivePosterConfiguration;
  v12 = -[PRSActivePosterConfiguration init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_lockScreenPosterConfiguration, a3);
    objc_storeStrong((id *)&v13->_homeScreenPosterConfiguration, a4);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSActivePosterConfiguration)initWithCoder:(id)a3
{
  id v4;
  PRSActivePosterConfiguration *v5;
  uint64_t v6;
  PRSPosterConfiguration *lockScreenPosterConfiguration;
  uint64_t v8;
  PRSPosterConfiguration *homeScreenPosterConfiguration;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSActivePosterConfiguration;
  v5 = -[PRSActivePosterConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lockScreenPosterConfiguration"));
    v6 = objc_claimAutoreleasedReturnValue();
    lockScreenPosterConfiguration = v5->_lockScreenPosterConfiguration;
    v5->_lockScreenPosterConfiguration = (PRSPosterConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeScreenPosterConfiguration"));
    v8 = objc_claimAutoreleasedReturnValue();
    homeScreenPosterConfiguration = v5->_homeScreenPosterConfiguration;
    v5->_homeScreenPosterConfiguration = (PRSPosterConfiguration *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PRSPosterConfiguration *lockScreenPosterConfiguration;
  id v5;

  lockScreenPosterConfiguration = self->_lockScreenPosterConfiguration;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lockScreenPosterConfiguration, CFSTR("_lockScreenPosterConfiguration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeScreenPosterConfiguration, CFSTR("_homeScreenPosterConfiguration"));

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  PRSPosterConfiguration *lockScreenPosterConfiguration;
  id v5;

  lockScreenPosterConfiguration = self->_lockScreenPosterConfiguration;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lockScreenPosterConfiguration, CFSTR("_lockScreenPosterConfiguration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeScreenPosterConfiguration, CFSTR("_homeScreenPosterConfiguration"));

}

- (PRSActivePosterConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRSActivePosterConfiguration *v5;
  uint64_t v6;
  PRSPosterConfiguration *lockScreenPosterConfiguration;
  uint64_t v8;
  PRSPosterConfiguration *homeScreenPosterConfiguration;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSActivePosterConfiguration;
  v5 = -[PRSActivePosterConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lockScreenPosterConfiguration"));
    v6 = objc_claimAutoreleasedReturnValue();
    lockScreenPosterConfiguration = v5->_lockScreenPosterConfiguration;
    v5->_lockScreenPosterConfiguration = (PRSPosterConfiguration *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_homeScreenPosterConfiguration"));
    v8 = objc_claimAutoreleasedReturnValue();
    homeScreenPosterConfiguration = v5->_homeScreenPosterConfiguration;
    v5->_homeScreenPosterConfiguration = (PRSPosterConfiguration *)v8;

  }
  return v5;
}

- (PRSPosterConfiguration)lockScreenPosterConfiguration
{
  return self->_lockScreenPosterConfiguration;
}

- (PRSPosterConfiguration)homeScreenPosterConfiguration
{
  return self->_homeScreenPosterConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_lockScreenPosterConfiguration, 0);
}

- (void)initWithLockScreenPosterConfiguration:(const char *)a1 homeScreenPosterConfiguration:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithLockScreenPosterConfiguration:(const char *)a1 homeScreenPosterConfiguration:.cold.2(const char *a1)
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
