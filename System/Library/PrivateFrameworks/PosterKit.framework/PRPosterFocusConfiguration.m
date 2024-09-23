@implementation PRPosterFocusConfiguration

- (PRPosterFocusConfiguration)initWithActivityIdentifier:(id)a3 activityUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  PRPosterFocusConfiguration *v10;
  uint64_t v11;
  NSString *activityIdentifier;
  uint64_t v13;
  NSUUID *activityUUID;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("NSString"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterFocusConfiguration initWithActivityIdentifier:activityUUID:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6DE4ECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterFocusConfiguration initWithActivityIdentifier:activityUUID:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6DE550);
  }

  v9 = v7;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterFocusConfiguration initWithActivityIdentifier:activityUUID:].cold.2();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18B6DE5B4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRPosterFocusConfiguration initWithActivityIdentifier:activityUUID:].cold.2();
    goto LABEL_19;
  }

  v19.receiver = self;
  v19.super_class = (Class)PRPosterFocusConfiguration;
  v10 = -[PRPosterFocusConfiguration init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    activityIdentifier = v10->_activityIdentifier;
    v10->_activityIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    activityUUID = v10->_activityUUID;
    v10->_activityUUID = (NSUUID *)v13;

  }
  return v10;
}

- (PRPosterFocusConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PRPosterFocusConfiguration *v9;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("activityIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("activityUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PRPosterFocusConfiguration initWithActivityIdentifier:activityUUID:](self, "initWithActivityIdentifier:activityUUID:", v6, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRPosterFocusConfiguration activityIdentifier](self, "activityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activityIdentifier"));

  -[PRPosterFocusConfiguration activityUUID](self, "activityUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("activityUUID"));

}

- (BOOL)isEqual:(id)a3
{
  PRPosterFocusConfiguration *v4;
  BOOL v5;

  v4 = (PRPosterFocusConfiguration *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PRPosterFocusConfiguration isEqualToFocusConfiguration:](self, "isEqualToFocusConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToFocusConfiguration:(id)a3
{
  PRPosterFocusConfiguration *v4;
  PRPosterFocusConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (PRPosterFocusConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4)
  {
    -[PRPosterFocusConfiguration activityIdentifier](self, "activityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterFocusConfiguration activityIdentifier](v5, "activityIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSEqualObjects())
    {
      -[PRPosterFocusConfiguration activityUUID](self, "activityUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterFocusConfiguration activityUUID](v5, "activityUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;

  -[PRPosterFocusConfiguration activityIdentifier](self, "activityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterFocusConfiguration activityUUID](self, "activityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendString:", v3);
  v7 = (id)objc_msgSend(v5, "appendObject:", v4);
  v8 = objc_msgSend(v5, "hash");

  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterFocusConfiguration activityUUID](self, "activityUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("activityUUID"));

  -[PRPosterFocusConfiguration activityIdentifier](self, "activityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("activityIdentifier"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterFocusConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PRPosterFocusConfiguration *v9;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("activityIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("activityUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PRPosterFocusConfiguration initWithActivityIdentifier:activityUUID:](self, "initWithActivityIdentifier:activityUUID:", v6, v8);
  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PRPosterFocusConfiguration activityIdentifier](self, "activityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activityIdentifier"));

  -[PRPosterFocusConfiguration activityUUID](self, "activityUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("activityUUID"));

}

- (id)encodeJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterFocusConfiguration activityIdentifier](self, "activityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, CFSTR("activityIdentifier"));

  -[PRPosterFocusConfiguration activityUUID](self, "activityUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, CFSTR("activityUUID"));

  -[PRPosterFocusConfiguration attributeType](self, "attributeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v7, CFSTR("attributeType"));

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (v9)
  {
    PRLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PRPosterMetadata encodeJSON].cold.1((uint64_t)self, (uint64_t)v9, v10);

  }
  return v8;
}

+ (id)decodeObjectWithJSON:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  PRPosterFocusConfiguration *v8;
  void *v9;
  PRPosterFocusConfiguration *v10;
  id v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("activityUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithUUIDString:", v6);

    v8 = [PRPosterFocusConfiguration alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("activityIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PRPosterFocusConfiguration initWithActivityIdentifier:activityUUID:](v8, "initWithActivityIdentifier:activityUUID:", v9, v7);

  }
  else
  {
    PRLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[PRPosterMetadata decodeObjectWithJSON:].cold.1((uint64_t)v4, v7);
    v10 = 0;
  }

  return v10;
}

- (NSString)attributeType
{
  return (NSString *)CFSTR("PRPosterRoleAttributeTypeFocusConfiguration");
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

- (void)initWithActivityIdentifier:activityUUID:.cold.1()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithActivityIdentifier:activityUUID:.cold.2()
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

  OUTLINED_FUNCTION_5();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_18B634000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
