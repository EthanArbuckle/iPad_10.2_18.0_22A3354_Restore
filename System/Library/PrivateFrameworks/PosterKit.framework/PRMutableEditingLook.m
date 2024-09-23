@implementation PRMutableEditingLook

- (PRMutableEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFontConfiguration:(id)a5 initialTitleColor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PRMutableEditingLook *v15;
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
  PRMutableEditingLook *result;
  void *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)PRMutableEditingLook;
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
    -[PRMutableEditingLook initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:].cold.1(a2);
  objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
  result = (PRMutableEditingLook *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PRTimeFontConfiguration)initialTimeFontConfiguration
{
  void *v2;
  void *v3;

  -[PRMutableEditingLook initialProperties](self, "initialProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeFontConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRTimeFontConfiguration *)v3;
}

- (id)initialTitleColor
{
  void *v2;
  void *v3;

  -[PRMutableEditingLook initialProperties](self, "initialProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titlePosterColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setInitialTimeFontConfiguration:(id)a3
{
  id v4;
  PREditingLookProperties *v5;
  void *v6;
  void *v7;
  PREditingLookProperties *v8;

  v4 = a3;
  v5 = [PREditingLookProperties alloc];
  -[PRMutableEditingLook initialProperties](self, "initialProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titlePosterColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PREditingLookProperties initWithTimeFontConfiguration:titlePosterColor:](v5, "initWithTimeFontConfiguration:titlePosterColor:", v4, v7);

  -[PRMutableEditingLook setInitialProperties:](self, "setInitialProperties:", v8);
}

- (void)setInitialTitleColor:(id)a3
{
  char isKindOfClass;
  char v6;
  PRPosterColor *v7;
  PRPosterColor *v8;
  PREditingLookProperties *v9;
  void *v10;
  void *v11;
  PREditingLookProperties *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0 || !v14 || (v6 & 1) != 0)
  {
    if (v14)
    {
      if ((v6 & 1) != 0)
        v7 = (PRPosterColor *)v14;
      else
        v7 = -[PRPosterColor initWithColor:preferredStyle:]([PRPosterColor alloc], "initWithColor:preferredStyle:", v14, 2);
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    v9 = [PREditingLookProperties alloc];
    -[PRMutableEditingLook initialProperties](self, "initialProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeFontConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PREditingLookProperties initWithTimeFontConfiguration:titlePosterColor:](v9, "initWithTimeFontConfiguration:titlePosterColor:", v11, v8);

    -[PRMutableEditingLook setInitialProperties:](self, "setInitialProperties:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("isValidColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRMutableEditingLook setInitialTitleColor:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PREditingLook initWithLook:]([PRImmutableEditingLook alloc], "initWithLook:", self);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PREditingLookProperties)initialProperties
{
  return self->_initialProperties;
}

- (void)setInitialProperties:(id)a3
{
  objc_storeStrong((id *)&self->_initialProperties, a3);
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

- (void)setInitialTitleColor:(const char *)a1 .cold.1(const char *a1)
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
