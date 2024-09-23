@implementation SBINAppIntent

- (SBINAppIntent)initWithIdentifier:(id)a3 systemContext:(id)a4
{
  id v8;
  id v9;
  void *v10;
  SBINAppIntent *v11;
  SBINAppIntent *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier != ((void *)0)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SBINAppIntent initWithIdentifier:systemContext:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2479BB578);
  }
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("systemContext != ((void *)0)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SBINAppIntent initWithIdentifier:systemContext:].cold.2(a2);
    goto LABEL_11;
  }
  v15.receiver = self;
  v15.super_class = (Class)SBINAppIntent;
  v11 = -[SBINAppIntent init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_systemContext, a4);
  }

  return v12;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "appendString:withName:", self->_identifier, CFSTR("identifier"));
  v4 = (id)objc_msgSend(v5, "appendObject:withName:", self->_systemContext, CFSTR("systemContext"));

}

- (BOOL)isEqual:(id)a3
{
  SBINAppIntent *v4;
  void *v5;
  char isKindOfClass;
  SBINAppIntent *v7;
  char v8;

  v4 = (SBINAppIntent *)a3;
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
        v8 = BSEqualObjects();
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[SBINAppIntentSystemContext hash](self->_systemContext, "hash") ^ v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE0BE10], "descriptionForRootObject:", self);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SBINAppIntentSystemContext)systemContext
{
  return self->_systemContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemContext, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(const char *)a1 systemContext:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_1(&dword_2479B8000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIdentifier:(const char *)a1 systemContext:.cold.2(const char *a1)
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
  OUTLINED_FUNCTION_1(&dword_2479B8000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
