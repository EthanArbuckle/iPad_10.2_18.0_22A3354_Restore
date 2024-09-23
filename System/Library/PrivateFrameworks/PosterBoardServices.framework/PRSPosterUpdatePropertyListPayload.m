@implementation PRSPosterUpdatePropertyListPayload

- (PRSPosterUpdatePropertyListPayload)initWithPropertyListData:(id)a3
{
  id v4;
  PRSPosterUpdatePropertyListPayload *v5;
  uint64_t v6;
  NSData *propertyListData;
  void *v9;
  objc_super v10;

  v4 = a3;
  NSClassFromString(CFSTR("NSData"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdatePropertyListPayload initWithPropertyListData:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BB53CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDataClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdatePropertyListPayload initWithPropertyListData:].cold.1();
    goto LABEL_11;
  }

  v10.receiver = self;
  v10.super_class = (Class)PRSPosterUpdatePropertyListPayload;
  v5 = -[PRSPosterUpdatePayload _init](&v10, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    propertyListData = v5->_propertyListData;
    v5->_propertyListData = (NSData *)v6;

  }
  return v5;
}

- (PRSPosterUpdatePropertyListPayload)initWithPropertyList:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  PRSPosterUpdatePropertyListPayload *v9;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  id v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("propertyListRoot"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdatePropertyListPayload initWithPropertyList:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_16:
    JUMPOUT(0x1A49BB6ECLL);
  }
  v6 = v5;
  if ((objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v5, 200) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("propertyListRoot needs to be serializable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdatePropertyListPayload initWithPropertyList:].cold.3();
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BB744);
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("nil == serializationError"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdatePropertyListPayload initWithPropertyList:].cold.2();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_16;
  }
  v14.receiver = self;
  v14.super_class = (Class)PRSPosterUpdatePropertyListPayload;
  v8 = -[PRSPosterUpdatePayload _init](&v14, sel__init);
  v9 = (PRSPosterUpdatePropertyListPayload *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 1, v7);
    objc_storeStrong(&v9->_propertyListRoot, a3);
  }

  return v9;
}

- (id)propertyListRoot
{
  id propertyListRoot;
  void *v4;
  id v5;

  propertyListRoot = self->_propertyListRoot;
  if (!propertyListRoot)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", self->_propertyListData, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_propertyListRoot;
    self->_propertyListRoot = v4;

    propertyListRoot = self->_propertyListRoot;
  }
  return propertyListRoot;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPropertyListData:", self->_propertyListData);
}

- (PRSPosterUpdatePropertyListPayload)initWithCoder:(id)a3
{
  id v4;
  PRSPosterUpdatePropertyListPayload *v5;
  void *v6;
  uint64_t v7;
  NSData *propertyListData;

  v4 = a3;
  v5 = -[PRSPosterUpdatePayload _init](self, "_init");
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_propertyListData"));
    v7 = objc_claimAutoreleasedReturnValue();
    propertyListData = v5->_propertyListData;
    v5->_propertyListData = (NSData *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_propertyListData, CFSTR("_propertyListData"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  return (id)-[NSData copy](self->_propertyListData, "copy");
}

- (NSData)propertyListData
{
  return self->_propertyListData;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_propertyListRoot, 0);
  objc_storeStrong((id *)&self->_propertyListData, 0);
}

- (void)initWithPropertyListData:.cold.1()
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

- (void)initWithPropertyList:.cold.1()
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
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPropertyList:.cold.2()
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
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPropertyList:.cold.3()
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
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
