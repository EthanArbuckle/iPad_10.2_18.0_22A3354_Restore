@implementation PBFPosterExtensionDataStorePrewarmPlan

- (PBFPosterExtensionDataStorePrewarmPlan)init
{
  PBFPosterExtensionDataStorePrewarmPlan *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PBFPosterExtensionDataStorePrewarmPlan;
  v2 = -[PBFPosterExtensionDataStorePrewarmPlan init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99E40];
    v11[0] = CFSTR("PBFPrewarmPhaseReloadDescriptors");
    v11[1] = CFSTR("PBFPrewarmPhasePushToProactive");
    v11[2] = CFSTR("PBFPrewarmPhaseAcquireNewGallery");
    v11[3] = CFSTR("PBFPrewarmPhaseSnapshotGallery");
    v11[4] = CFSTR("PBFPrewarmPhaseSnapshotSwitcher");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "orderedSetWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStorePrewarmPlan setPrewarmPhasePlan:](v2, "setPrewarmPhasePlan:", v5);

    -[PBFPosterExtensionDataStorePrewarmPlan setDefaultPhaseTimeoutInterval:](v2, "setDefaultPhaseTimeoutInterval:", 120.0);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringToIndex:", 7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStorePrewarmPlan setIdentifier:](v2, "setIdentifier:", v8);

  }
  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PBFMutablePosterExtensionDataStorePrewarmPlan *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[PBFPosterExtensionDataStorePrewarmPlan init](+[PBFMutablePosterExtensionDataStorePrewarmPlan allocWithZone:](PBFMutablePosterExtensionDataStorePrewarmPlan, "allocWithZone:", a3), "init");
  -[PBFPosterExtensionDataStorePrewarmPlan prewarmPhasePlan](self, "prewarmPhasePlan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStorePrewarmPlan setPrewarmPhasePlan:](v4, "setPrewarmPhasePlan:", v5);

  -[PBFPosterExtensionDataStorePrewarmPlan phaseToPrewarmTimeout](self, "phaseToPrewarmTimeout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStorePrewarmPlan setPhaseToPrewarmTimeout:](v4, "setPhaseToPrewarmTimeout:", v6);

  -[PBFPosterExtensionDataStorePrewarmPlan defaultPhaseTimeoutInterval](self, "defaultPhaseTimeoutInterval");
  -[PBFPosterExtensionDataStorePrewarmPlan setDefaultPhaseTimeoutInterval:](v4, "setDefaultPhaseTimeoutInterval:");
  -[PBFPosterExtensionDataStorePrewarmPlan phaseToExecutionBlock](self, "phaseToExecutionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStorePrewarmPlan setPhaseToExecutionBlock:](v4, "setPhaseToExecutionBlock:", v7);

  -[PBFPosterExtensionDataStorePrewarmPlan identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterExtensionDataStorePrewarmPlan setIdentifier:](v4, "setIdentifier:", v8);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[PBFPosterExtensionDataStorePrewarmPlan prewarmPhasePlan](self, "prewarmPhasePlan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrewarmPhasePlan:", v5);

  -[PBFPosterExtensionDataStorePrewarmPlan phaseToPrewarmTimeout](self, "phaseToPrewarmTimeout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhaseToPrewarmTimeout:", v6);

  -[PBFPosterExtensionDataStorePrewarmPlan defaultPhaseTimeoutInterval](self, "defaultPhaseTimeoutInterval");
  objc_msgSend(v4, "setDefaultPhaseTimeoutInterval:");
  -[PBFPosterExtensionDataStorePrewarmPlan phaseToExecutionBlock](self, "phaseToExecutionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhaseToExecutionBlock:", v7);

  -[PBFPosterExtensionDataStorePrewarmPlan identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v8);

  return v4;
}

- (double)timeoutIntervalForPhase:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double result;
  void *v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    -[PBFPosterExtensionDataStorePrewarmPlan phaseToPrewarmTimeout](self, "phaseToPrewarmTimeout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v8, "doubleValue");
    else
      -[PBFPosterExtensionDataStorePrewarmPlan defaultPhaseTimeoutInterval](self, "defaultPhaseTimeoutInterval");
    v10 = v9;

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("phase"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStorePrewarmPlan timeoutIntervalForPhase:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)executionBlockForPhase:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id result;
  void *v10;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    -[PBFPosterExtensionDataStorePrewarmPlan phaseToExecutionBlock](self, "phaseToExecutionBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("phase"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStorePrewarmPlan executionBlockForPhase:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (NSOrderedSet)prewarmPhasePlan
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrewarmPhasePlan:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (double)defaultPhaseTimeoutInterval
{
  return self->_defaultPhaseTimeoutInterval;
}

- (void)setDefaultPhaseTimeoutInterval:(double)a3
{
  self->_defaultPhaseTimeoutInterval = a3;
}

- (NSDictionary)phaseToPrewarmTimeout
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPhaseToPrewarmTimeout:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDictionary)phaseToExecutionBlock
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPhaseToExecutionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phaseToExecutionBlock, 0);
  objc_storeStrong((id *)&self->_phaseToPrewarmTimeout, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_prewarmPhasePlan, 0);
}

- (void)timeoutIntervalForPhase:(const char *)a1 .cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)executionBlockForPhase:(const char *)a1 .cold.1(const char *a1)
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
