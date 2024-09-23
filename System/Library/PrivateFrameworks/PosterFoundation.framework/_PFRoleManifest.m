@implementation _PFRoleManifest

- (_PFRoleManifest)initWithPropertyList:(id)a3
{
  id v4;
  _PFRoleManifest *v5;
  _PFRoleManifest *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  _PFRoleManifest *v11;
  void *v13;
  objc_super v14;

  v4 = a3;
  NSClassFromString(CFSTR("LSPropertyList"));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_PFRoleManifest initWithPropertyList:].cold.1();
LABEL_14:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24462CC44);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:LSPropertyListClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_PFRoleManifest initWithPropertyList:].cold.1();
    goto LABEL_14;
  }

  v14.receiver = self;
  v14.super_class = (Class)_PFRoleManifest;
  v5 = -[_PFRoleManifest init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_propertyList, v4);
    v7 = *MEMORY[0x24BDBD288];
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PFRoleManifest objectForKey:ofClass:](v6, "objectForKey:ofClass:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v9;

    if (!v6->_bundleIdentifier)
    {
      v11 = 0;
      goto LABEL_8;
    }
    -[_PFRoleManifest _hydrate](v6, "_hydrate");
    objc_storeWeak((id *)&v6->_propertyList, 0);
  }
  v11 = v6;
LABEL_8:

  return v11;
}

- (_PFRoleManifest)initWithInfoDictionary:(id)a3
{
  id v5;
  _PFRoleManifest *v6;
  _PFRoleManifest *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  NSDictionary *infoDictionary;
  void *v14;
  objc_super v15;

  v5 = a3;
  NSClassFromString(CFSTR("NSDictionary"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_PFRoleManifest initWithInfoDictionary:].cold.1();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24462CE00);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[_PFRoleManifest initWithInfoDictionary:].cold.1();
    goto LABEL_11;
  }

  v15.receiver = self;
  v15.super_class = (Class)_PFRoleManifest;
  v6 = -[_PFRoleManifest init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_infoDictionary, a3);
    v8 = *MEMORY[0x24BDBD288];
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PFRoleManifest objectForKey:ofClass:](v7, "objectForKey:ofClass:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v10;

    -[_PFRoleManifest _hydrate](v7, "_hydrate");
    infoDictionary = v7->_infoDictionary;
    v7->_infoDictionary = 0;

  }
  return v7;
}

- (NSSet)pf_supportedRoles
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[_PFRoleManifest rawSpecifiedDefaultRole](self, "rawSpecifiedDefaultRole");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PFRoleManifest rawSupportedRoles](self, "rawSupportedRoles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if (!v3)
      goto LABEL_8;
  }
  else
  {
    -[_PFRoleManifest knownSupportedRoles](self, "knownSupportedRoles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = v5;

      v4 = v6;
    }

    if (!v3)
      goto LABEL_8;
  }
  if ((objc_msgSend(v4, "containsObject:", v3) & 1) != 0)
  {
LABEL_8:
    v7 = v4;
    goto LABEL_13;
  }
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "setByAddingObject:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
LABEL_13:

  return (NSSet *)v7;
}

- (NSString)pf_defaultRole
{
  void *v3;
  id v4;
  void *v6;
  uint64_t v7;
  void *v8;

  -[_PFRoleManifest rawSpecifiedDefaultRole](self, "rawSpecifiedDefaultRole");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_PFRoleManifest rawSupportedRoles](self, "rawSupportedRoles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 != 1
      || (-[_PFRoleManifest rawSupportedRoles](self, "rawSupportedRoles"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "anyObject"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          !v3))
    {
      -[_PFRoleManifest derivedDefaultRole](self, "derivedDefaultRole");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        -[_PFRoleManifest derivedDefaultRole](self, "derivedDefaultRole");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v4 = v3;

  return (NSString *)v4;
}

- (void)_hydrate
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (NSSet)rawSupportedRoles
{
  NSSet *rawSupportedRoles;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;

  rawSupportedRoles = self->_rawSupportedRoles;
  if (!rawSupportedRoles)
  {
    v4 = (void *)MEMORY[0x24BDBCF20];
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PFRoleManifest objectForKey:ofClass:](self, "objectForKey:ofClass:", CFSTR("PRSupportedRoles"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_91);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v7);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_rawSupportedRoles;
    self->_rawSupportedRoles = v8;

    rawSupportedRoles = self->_rawSupportedRoles;
  }
  return rawSupportedRoles;
}

- (NSSet)knownSupportedRoles
{
  NSSet *knownSupportedRoles;
  uint64_t v5;
  void *v6;
  void *v7;
  NSSet *v8;
  void *v9;
  id v10;
  NSSet *v11;
  NSSet *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  knownSupportedRoles = self->_knownSupportedRoles;
  if (knownSupportedRoles)
    return knownSupportedRoles;
  v5 = *MEMORY[0x24BDBD288];
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PFRoleManifest objectForKey:ofClass:](self, "objectForKey:ofClass:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.PosterBoard")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.PosterTester")) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_opt_new();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __38___PFRoleManifest_knownSupportedRoles__block_invoke;
    v16 = &unk_251543A00;
    v17 = v7;
    v18 = v9;
    v10 = v9;
    PFPosterRoleEnumerateAllRoles(&v13);
    v11 = (NSSet *)objc_msgSend(v10, "copy", v13, v14, v15, v16);
    v12 = self->_knownSupportedRoles;
    self->_knownSupportedRoles = v11;

    v8 = self->_knownSupportedRoles;
  }

  return v8;
}

- (NSString)rawSpecifiedDefaultRole
{
  NSString *rawSpecifiedDefaultRole;
  NSString **p_rawSpecifiedDefaultRole;
  NSString *v4;
  void *v6;
  void *v7;

  p_rawSpecifiedDefaultRole = &self->_rawSpecifiedDefaultRole;
  rawSpecifiedDefaultRole = self->_rawSpecifiedDefaultRole;
  if (rawSpecifiedDefaultRole)
  {
    v4 = rawSpecifiedDefaultRole;
  }
  else
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PFRoleManifest objectForKey:ofClass:](self, "objectForKey:ofClass:", CFSTR("PRDefaultRole"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (PFPosterRoleIsValid(v7))
    {
      objc_storeStrong((id *)p_rawSpecifiedDefaultRole, v7);
      v4 = *p_rawSpecifiedDefaultRole;
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (NSString)derivedDefaultRole
{
  void *v3;
  void *v4;
  void *v5;

  -[_PFRoleManifest knownSupportedRoles](self, "knownSupportedRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[_PFRoleManifest knownSupportedRoles](self, "knownSupportedRoles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  id v6;
  id WeakRetained;
  id v8;
  void *v9;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_propertyList);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_propertyList);
    objc_msgSend(v8, "objectForKey:ofClass:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSDictionary bs_safeObjectForKey:ofType:](self->_infoDictionary, "bs_safeObjectForKey:ofType:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSpecifiedDefaultRole, 0);
  objc_storeStrong((id *)&self->_knownSupportedRoles, 0);
  objc_storeStrong((id *)&self->_rawSupportedRoles, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_destroyWeak((id *)&self->_propertyList);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithInfoDictionary:.cold.1()
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

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
