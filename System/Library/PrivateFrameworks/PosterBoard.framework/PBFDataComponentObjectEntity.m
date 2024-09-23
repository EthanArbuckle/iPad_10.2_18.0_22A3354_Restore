@implementation PBFDataComponentObjectEntity

- (PBFDataComponentObjectEntity)initWithComponent:(id)a3 object:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  PBFDataComponentObjectEntity *v15;
  PBFDataComponentObjectEntity *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  NSClassFromString(CFSTR("NSString"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFDataComponentObjectEntity initWithComponent:object:context:].cold.1();
LABEL_27:
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD6854);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFDataComponentObjectEntity initWithComponent:object:context:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD68B8);
  }

  v13 = v10;
  NSClassFromString(CFSTR("NSObject"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFDataComponentObjectEntity initWithComponent:object:context:].cold.2();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD691CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSObjectClass]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFDataComponentObjectEntity initWithComponent:object:context:].cold.2();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD6980);
  }

  v14 = v11;
  NSClassFromString(CFSTR("PBFDataRefreshContext"));
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFDataComponentObjectEntity initWithComponent:object:context:].cold.3();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAD69E4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFDataRefreshContextClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFDataComponentObjectEntity initWithComponent:object:context:].cold.3();
    goto LABEL_27;
  }

  v23.receiver = self;
  v23.super_class = (Class)PBFDataComponentObjectEntity;
  v15 = -[PBFDataComponentObjectEntity init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_component, a3);
    objc_storeStrong(&v16->_object, a4);
    objc_storeStrong((id *)&v16->_context, a5);
  }

  return v16;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_component, CFSTR("component"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_object, CFSTR("object"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)determineRefreshState
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  PBFDataRefreshState *v12;
  const __CFString *v13;
  double v14;
  double v15;
  void *v16;
  double v18;

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[PBFDataComponentObjectEntity context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBFDataComponentObjectEntity context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastRefreshDate");
    v3 = (id)objc_claimAutoreleasedReturnValue();

    -[PBFDataComponentObjectEntity context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "component");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBFDefaultUpdateIntervalForDataComponent(v9);
    v11 = v10;

    if (v11 == 1.79769313e308)
    {
      v12 = [PBFDataRefreshState alloc];
      v13 = CFSTR("Expiration interval is forever.  So no update is needed.");
    }
    else
    {
      objc_msgSend(v4, "timeIntervalSinceDate:", v3);
      v15 = v14;
      v12 = [PBFDataRefreshState alloc];
      if (v15 > v11)
      {
        v5 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v12, "initWithNeedsRefresh:reason:", 1, CFSTR("Entity has exceeded expiration interval %f seconds; needs update"),
               *(_QWORD *)&v11);
        goto LABEL_9;
      }
      v18 = v11 - v15;
      v13 = CFSTR("Entity is up to date, update needed in %f seconds");
    }
    v5 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v12, "initWithNeedsRefresh:reason:", 0, v13, *(_QWORD *)&v18);
    goto LABEL_9;
  }
  v3 = self->_object;
  -[PBFDataComponentObjectEntity context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "determineRefreshStateWithContext:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v16 = (void *)v5;

  return v16;
}

- (id)object
{
  return self->_object;
}

- (NSString)component
{
  return self->_component;
}

- (PBFDataRefreshContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong(&self->_object, 0);
}

- (void)initWithComponent:object:context:.cold.1()
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

- (void)initWithComponent:object:context:.cold.2()
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

- (void)initWithComponent:object:context:.cold.3()
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

@end
