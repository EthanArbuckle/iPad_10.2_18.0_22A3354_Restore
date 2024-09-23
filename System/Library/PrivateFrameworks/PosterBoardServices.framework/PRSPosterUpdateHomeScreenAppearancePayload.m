@implementation PRSPosterUpdateHomeScreenAppearancePayload

- (PRSPosterUpdateHomeScreenAppearancePayload)init
{
  PRSPosterUpdateHomeScreenAppearancePayload *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRSPosterUpdateHomeScreenAppearancePayload;
  result = -[PRSPosterUpdatePayload _init](&v3, sel__init);
  if (result)
    result->_updatedAppearanceType = 0;
  return result;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3
{
  PRSPosterUpdateHomeScreenAppearancePayload *result;
  void *v5;

  result = -[PRSPosterUpdateHomeScreenAppearancePayload init](self, "init");
  if (result)
  {
    if (a3 > 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Undefined apperance type specified %lu"), a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:].cold.1();
      objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      result = (PRSPosterUpdateHomeScreenAppearancePayload *)_bs_set_crash_log_message();
      __break(0);
    }
    else
    {
      result->_updatedAppearanceType = a3;
    }
  }
  return result;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 solidColorAppearance:(id)a4
{
  id v6;
  PRSPosterUpdateHomeScreenAppearancePayload *v7;
  uint64_t v8;
  PRSPosterUpdateColorPayload *solidColorAppearance;
  void *v11;

  v6 = a4;
  NSClassFromString(CFSTR("PRSPosterUpdateColorPayload"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:solidColorAppearance:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BBB50);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateColorPayloadClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:solidColorAppearance:].cold.1();
    goto LABEL_11;
  }

  v7 = -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:](self, "initWithUpdatedAppearanceType:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    solidColorAppearance = v7->_solidColorAppearance;
    v7->_solidColorAppearance = (PRSPosterUpdateColorPayload *)v8;

  }
  return v7;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 gradientColorAppearance:(id)a4
{
  id v6;
  PRSPosterUpdateHomeScreenAppearancePayload *v7;
  uint64_t v8;
  PRSPosterUpdateColorPayload *gradientColorAppearance;
  void *v11;

  v6 = a4;
  NSClassFromString(CFSTR("PRSPosterUpdateColorPayload"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:gradientColorAppearance:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BBCB4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateColorPayloadClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:gradientColorAppearance:].cold.1();
    goto LABEL_11;
  }

  v7 = -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:](self, "initWithUpdatedAppearanceType:", a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    gradientColorAppearance = v7->_gradientColorAppearance;
    v7->_gradientColorAppearance = (PRSPosterUpdateColorPayload *)v8;

  }
  return v7;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 updateSwitcherPoster:(id)a4
{
  id v7;
  PRSPosterUpdateHomeScreenAppearancePayload *v8;
  PRSPosterUpdateHomeScreenAppearancePayload *v9;
  void *v11;

  v7 = a4;
  NSClassFromString(CFSTR("PRSPosterUpdateSessionInfo"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateSwitcherPoster:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BBE1CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateSwitcherPoster:].cold.1();
    goto LABEL_11;
  }

  v8 = -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:](self, "initWithUpdatedAppearanceType:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_switcherProviderUpdateSessionInfo, a4);

  return v9;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 updateHomePoster:(id)a4 homeProviderIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  PRSPosterUpdateHomeScreenAppearancePayload *v13;
  uint64_t v14;
  NSString *homeProviderIdentifier;
  void *v17;
  void *v18;
  void *v19;

  v9 = a4;
  v10 = a5;
  v11 = v9;
  NSClassFromString(CFSTR("PRSPosterUpdateSessionInfo"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:].cold.1();
LABEL_19:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BBFE8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BC04CLL);
  }

  v12 = v10;
  NSClassFromString(CFSTR("NSString"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:].cold.2();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49BC0B0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:].cold.2();
    goto LABEL_19;
  }

  v13 = -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:](self, "initWithUpdatedAppearanceType:", a3);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    homeProviderIdentifier = v13->_homeProviderIdentifier;
    v13->_homeProviderIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_homeProviderUpdateSessionInfo, a4);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithUpdatedAppearanceType:", self->_updatedAppearanceType);
  v5 = -[PRSPosterUpdateColorPayload copy](self->_solidColorAppearance, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[PRSPosterUpdateColorPayload copy](self->_gradientColorAppearance, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  objc_storeStrong((id *)(v4 + 32), self->_switcherProviderUpdateSessionInfo);
  objc_storeStrong((id *)(v4 + 48), self->_homeProviderUpdateSessionInfo);
  v9 = -[NSString copy](self->_homeProviderIdentifier, "copy");
  v10 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v9;

  return (id)v4;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithCoder:(id)a3
{
  id v4;
  PRSPosterUpdateHomeScreenAppearancePayload *v5;
  void *v6;
  uint64_t v7;
  PRSPosterUpdateColorPayload *solidColorAppearance;
  void *v9;
  uint64_t v10;
  PRSPosterUpdateColorPayload *gradientColorAppearance;
  void *v12;
  uint64_t v13;
  PRSPosterUpdateSessionInfo *switcherProviderUpdateSessionInfo;
  void *v15;
  uint64_t v16;
  NSString *homeProviderIdentifier;
  void *v18;
  uint64_t v19;
  PRSPosterUpdateSessionInfo *homeProviderUpdateSessionInfo;

  v4 = a3;
  v5 = -[PRSPosterUpdatePayload _init](self, "_init");
  if (v5)
  {
    v5->_updatedAppearanceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_updatedAppearanceType"));
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_solidColorAppearance"));
    v7 = objc_claimAutoreleasedReturnValue();
    solidColorAppearance = v5->_solidColorAppearance;
    v5->_solidColorAppearance = (PRSPosterUpdateColorPayload *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("_gradientColorAppearance"));
    v10 = objc_claimAutoreleasedReturnValue();
    gradientColorAppearance = v5->_gradientColorAppearance;
    v5->_gradientColorAppearance = (PRSPosterUpdateColorPayload *)v10;

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("_switcherProviderUpdateSessionInfo"));
    v13 = objc_claimAutoreleasedReturnValue();
    switcherProviderUpdateSessionInfo = v5->_switcherProviderUpdateSessionInfo;
    v5->_switcherProviderUpdateSessionInfo = (PRSPosterUpdateSessionInfo *)v13;

    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("_homeProviderIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    homeProviderIdentifier = v5->_homeProviderIdentifier;
    v5->_homeProviderIdentifier = (NSString *)v16;

    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("_homeProviderUpdateSessionInfo"));
    v19 = objc_claimAutoreleasedReturnValue();
    homeProviderUpdateSessionInfo = v5->_homeProviderUpdateSessionInfo;
    v5->_homeProviderUpdateSessionInfo = (PRSPosterUpdateSessionInfo *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t updatedAppearanceType;
  id v5;

  updatedAppearanceType = self->_updatedAppearanceType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", updatedAppearanceType, CFSTR("_updatedAppearanceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_solidColorAppearance, CFSTR("_solidColorAppearance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gradientColorAppearance, CFSTR("_gradientColorAppearance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_switcherProviderUpdateSessionInfo, CFSTR("_switcherProviderUpdateSessionInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeProviderIdentifier, CFSTR("_homeProviderIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeProviderUpdateSessionInfo, CFSTR("_homeProviderUpdateSessionInfo"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  void *v3;
  void *v4;
  void *v5;
  PRSPosterUpdateColorPayload *solidColorAppearance;
  void *v7;
  PRSPosterUpdateColorPayload *gradientColorAppearance;
  void *v9;
  NSString *homeProviderIdentifier;
  void *v11;
  PRSPosterUpdateSessionInfo *switcherProviderUpdateSessionInfo;

  v3 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_updatedAppearanceType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, CFSTR("_updatedAppearanceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  solidColorAppearance = self->_solidColorAppearance;
  if (solidColorAppearance)
  {
    -[PRSPosterUpdateColorPayload color](solidColorAppearance, "color");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("_solidColorAppearance"));

  }
  gradientColorAppearance = self->_gradientColorAppearance;
  if (gradientColorAppearance)
  {
    -[PRSPosterUpdateColorPayload color](gradientColorAppearance, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("_gradientColorAppearance"));

  }
  homeProviderIdentifier = self->_homeProviderIdentifier;
  if (homeProviderIdentifier)
  {
    v11 = (void *)-[NSString copy](homeProviderIdentifier, "copy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("_homeProviderIdentifier"));

  }
  switcherProviderUpdateSessionInfo = self->_switcherProviderUpdateSessionInfo;
  if (switcherProviderUpdateSessionInfo)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", switcherProviderUpdateSessionInfo, CFSTR("_switcherProviderUpdateSessionInfo"));
  if (self->_homeProviderUpdateSessionInfo)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_switcherProviderUpdateSessionInfo, CFSTR("_homeProviderUpdateSessionInfo"));
  return v5;
}

- (unint64_t)updatedAppearanceType
{
  return self->_updatedAppearanceType;
}

- (PRSPosterUpdateColorPayload)solidColorAppearance
{
  return self->_solidColorAppearance;
}

- (PRSPosterUpdateColorPayload)gradientColorAppearance
{
  return self->_gradientColorAppearance;
}

- (PRSPosterUpdateSessionInfo)switcherProviderUpdateSessionInfo
{
  return self->_switcherProviderUpdateSessionInfo;
}

- (NSString)homeProviderIdentifier
{
  return self->_homeProviderIdentifier;
}

- (PRSPosterUpdateSessionInfo)homeProviderUpdateSessionInfo
{
  return self->_homeProviderUpdateSessionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeProviderUpdateSessionInfo, 0);
  objc_storeStrong((id *)&self->_homeProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_switcherProviderUpdateSessionInfo, 0);
  objc_storeStrong((id *)&self->_gradientColorAppearance, 0);
  objc_storeStrong((id *)&self->_solidColorAppearance, 0);
}

- (void)initWithUpdatedAppearanceType:.cold.1()
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

- (void)initWithUpdatedAppearanceType:solidColorAppearance:.cold.1()
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

- (void)initWithUpdatedAppearanceType:gradientColorAppearance:.cold.1()
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

- (void)initWithUpdatedAppearanceType:updateSwitcherPoster:.cold.1()
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

- (void)initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:.cold.1()
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

- (void)initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:.cold.2()
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
