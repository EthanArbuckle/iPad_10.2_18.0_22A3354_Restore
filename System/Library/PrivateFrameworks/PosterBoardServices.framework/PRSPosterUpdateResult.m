@implementation PRSPosterUpdateResult

- (PRSPosterUpdateResult)initWithUpdate:(id)a3
{
  id v5;
  PRSPosterUpdateResult *v6;
  PRSPosterUpdateResult *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  NSClassFromString(CFSTR("PRSPosterUpdate"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateResult initWithUpdate:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BC790);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateResult initWithUpdate:].cold.1();
    goto LABEL_11;
  }

  v10.receiver = self;
  v10.super_class = (Class)PRSPosterUpdateResult;
  v6 = -[PRSPosterUpdateResult init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_update, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterUpdateResult)initWithCoder:(id)a3
{
  id v4;
  PRSPosterUpdateResult *v5;
  void *v6;
  uint64_t v7;
  NSError *error;
  void *v9;
  uint64_t v10;
  PRSPosterUpdate *update;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRSPosterUpdateResult;
  v5 = -[PRSPosterUpdateResult init](&v13, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_error"));
    v7 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("_update"));
    v10 = objc_claimAutoreleasedReturnValue();
    update = v5->_update;
    v5->_update = (PRSPosterUpdate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PRSPosterUpdate *update;
  id v5;

  update = self->_update;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", update, CFSTR("_update"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("_error"));

}

+ (id)successfulUpdateResultForUpdate:(id)a3
{
  id v3;
  PRSPosterUpdateResult *v4;
  void *v6;

  v3 = a3;
  NSClassFromString(CFSTR("PRSPosterUpdate"));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdateResult successfulUpdateResultForUpdate:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BCA10);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateClass]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdateResult successfulUpdateResultForUpdate:].cold.1();
    goto LABEL_9;
  }

  v4 = -[PRSPosterUpdateResult initWithUpdate:]([PRSPosterUpdateResult alloc], "initWithUpdate:", v3);
  return v4;
}

+ (id)failedUpdateResultForUpdate:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSError *v8;
  PRSPosterUpdateResult *v9;
  NSError *error;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  NSClassFromString(CFSTR("PRSPosterUpdate"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdateResult failedUpdateResultForUpdate:error:].cold.1();
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BCBA8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdateResult failedUpdateResultForUpdate:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BCC0CLL);
  }

  v8 = (NSError *)v6;
  NSClassFromString(CFSTR("NSError"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdateResult failedUpdateResultForUpdate:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BCC70);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSErrorClass]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PRSPosterUpdateResult failedUpdateResultForUpdate:error:].cold.2();
    goto LABEL_17;
  }

  v9 = -[PRSPosterUpdateResult initWithUpdate:]([PRSPosterUpdateResult alloc], "initWithUpdate:", v7);
  error = v9->_error;
  v9->_error = v8;

  return v9;
}

- (id)requestedValue
{
  void *v2;
  void *v3;

  -[PRSPosterUpdate payload](self->_update, "payload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_error, CFSTR("error"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_update, CFSTR("update"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PRSPosterUpdate)update
{
  return self->_update;
}

- (NSError)error
{
  return self->_error;
}

- (id)initialValue
{
  return self->_initialValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_update, 0);
}

- (void)initWithUpdate:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)successfulUpdateResultForUpdate:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)failedUpdateResultForUpdate:error:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

+ (void)failedUpdateResultForUpdate:error:.cold.2()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
