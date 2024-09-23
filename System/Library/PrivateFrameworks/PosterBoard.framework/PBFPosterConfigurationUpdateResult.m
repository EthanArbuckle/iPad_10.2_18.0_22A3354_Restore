@implementation PBFPosterConfigurationUpdateResult

- (PBFPosterConfigurationUpdateResult)initWithIncomingPosterConfiguration:(id)a3 incomingAssocPosterConfiguration:(id)a4 postersToDelete:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  PBFPosterConfigurationUpdateResult *v13;
  PBFPosterConfigurationUpdateResult *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  BSInvalidatable *pathValidityExtension;
  void *v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  BSInvalidatable *assocPathValidityExtension;
  void *v26;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("incomingPosterConfiguration != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterConfigurationUpdateResult initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA65AC4);
  }
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("postersToDelete != nil"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterConfigurationUpdateResult initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:].cold.2();
    goto LABEL_11;
  }
  v27.receiver = self;
  v27.super_class = (Class)PBFPosterConfigurationUpdateResult;
  v13 = -[PBFPosterConfigurationUpdateResult init](&v27, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_incomingPosterConfiguration, a3);
    objc_storeStrong((id *)&v14->_incomingAssocPosterConfiguration, a4);
    objc_storeStrong((id *)&v14->_postersToDelete, a5);
    objc_msgSend(v9, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extendValidityForReason:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    pathValidityExtension = v14->_pathValidityExtension;
    v14->_pathValidityExtension = (BSInvalidatable *)v18;

    objc_msgSend(v10, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "extendValidityForReason:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    assocPathValidityExtension = v14->_assocPathValidityExtension;
    v14->_assocPathValidityExtension = (BSInvalidatable *)v23;

  }
  return v14;
}

- (PBFPosterConfigurationUpdateResult)initWithConfiguration:(id)a3 updates:(id)a4 changes:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  PBFPosterConfigurationUpdateResult *v13;
  PBFPosterConfigurationUpdateResult *v14;
  uint64_t v15;
  NSArray *updates;
  uint64_t v17;
  NSArray *roleCoordinatorChanges;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  NSClassFromString(CFSTR("PRPosterConfiguration"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterConfigurationUpdateResult initWithConfiguration:updates:changes:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA65C9CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterConfigurationUpdateResult initWithConfiguration:updates:changes:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA65D00);
  }

  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[updates count] > 0"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterConfigurationUpdateResult initWithConfiguration:updates:changes:].cold.2();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA65D64);
  }
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[roleCoordinatorChanges count] > 0"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterConfigurationUpdateResult initWithConfiguration:updates:changes:].cold.3();
    goto LABEL_19;
  }
  v23.receiver = self;
  v23.super_class = (Class)PBFPosterConfigurationUpdateResult;
  v13 = -[PBFPosterConfigurationUpdateResult init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_configuration, a3);
    v15 = objc_msgSend(v10, "copy");
    updates = v14->_updates;
    v14->_updates = (NSArray *)v15;

    v17 = objc_msgSend(v11, "copy");
    roleCoordinatorChanges = v14->_roleCoordinatorChanges;
    v14->_roleCoordinatorChanges = (NSArray *)v17;

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_pathValidityExtension, "invalidate");
  -[BSInvalidatable invalidate](self->_assocPathValidityExtension, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterConfigurationUpdateResult;
  -[PBFPosterConfigurationUpdateResult dealloc](&v3, sel_dealloc);
}

- (PRIncomingPosterConfiguration)incomingPosterConfiguration
{
  return self->_incomingPosterConfiguration;
}

- (PRIncomingPosterConfiguration)incomingAssocPosterConfiguration
{
  return self->_incomingAssocPosterConfiguration;
}

- (NSArray)postersToDelete
{
  return self->_postersToDelete;
}

- (PRPosterConfiguration)configuration
{
  return self->_configuration;
}

- (NSArray)updates
{
  return self->_updates;
}

- (NSArray)roleCoordinatorChanges
{
  return self->_roleCoordinatorChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleCoordinatorChanges, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_postersToDelete, 0);
  objc_storeStrong((id *)&self->_incomingAssocPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_incomingPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_assocPathValidityExtension, 0);
  objc_storeStrong((id *)&self->_pathValidityExtension, 0);
}

- (void)initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:.cold.1()
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

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIncomingPosterConfiguration:incomingAssocPosterConfiguration:postersToDelete:.cold.2()
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

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfiguration:updates:changes:.cold.1()
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

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfiguration:updates:changes:.cold.2()
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

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithConfiguration:updates:changes:.cold.3()
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

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
