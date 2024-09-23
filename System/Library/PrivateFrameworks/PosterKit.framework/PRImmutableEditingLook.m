@implementation PRImmutableEditingLook

- (PRImmutableEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFontConfiguration:(id)a5 initialTitleColor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PRImmutableEditingLook *v15;
  uint64_t v16;
  NSString *displayName;
  uint64_t v18;
  NSString *identifier;
  char isKindOfClass;
  char v21;
  PRPosterColor *v22;
  PRPosterColor *v23;
  PREditingLookProperties *v24;
  uint64_t v25;
  PREditingLookProperties *initialProperties;
  PRImmutableEditingLook *result;
  void *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)PRImmutableEditingLook;
  v15 = -[PREditingLook initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:](&v29, sel_initWithIdentifier_displayName_initialTimeFontConfiguration_initialTitleColor_, v11, v12, v13, v14);
  if (!v15)
  {
LABEL_12:

    return v15;
  }
  v16 = objc_msgSend(v12, "copy");
  displayName = v15->_displayName;
  v15->_displayName = (NSString *)v16;

  v18 = objc_msgSend(v11, "copy");
  identifier = v15->_identifier;
  v15->_identifier = (NSString *)v18;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v21 = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0 || !v14 || (v21 & 1) != 0)
  {
    if (v14)
    {
      if ((v21 & 1) != 0)
        v22 = (PRPosterColor *)v14;
      else
        v22 = -[PRPosterColor initWithColor:preferredStyle:]([PRPosterColor alloc], "initWithColor:preferredStyle:", v14, 2);
      v23 = v22;
    }
    else
    {
      v23 = 0;
    }
    v24 = -[PREditingLookProperties initWithTimeFontConfiguration:titlePosterColor:]([PREditingLookProperties alloc], "initWithTimeFontConfiguration:titlePosterColor:", v13, v23);
    v25 = -[PREditingLookProperties copy](v24, "copy");
    initialProperties = v15->_initialProperties;
    v15->_initialProperties = (PREditingLookProperties *)v25;

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("isValidColor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[PRImmutableEditingLook initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
  result = (PRImmutableEditingLook *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)displayName
{
  return self->_displayName;
}

- (id)initialProperties
{
  return self->_initialProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialProperties, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(const char *)a1 displayName:initialTimeFontConfiguration:initialTitleColor:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
