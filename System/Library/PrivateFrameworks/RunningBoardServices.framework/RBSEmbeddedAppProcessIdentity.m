@implementation RBSEmbeddedAppProcessIdentity

- (id)embeddedApplicationIdentifier
{
  return self->_embeddedApplicationIdentifier;
}

- (RBSEmbeddedAppProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  RBSEmbeddedAppProcessIdentity *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_embeddedApplicationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_personaString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && _os_feature_enabled_impl())
  {
    rbs_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[RBSEmbeddedAppProcessIdentity initWithRBSXPCCoder:].cold.1();

  }
  v8 = (RBSEmbeddedAppProcessIdentity *)-[RBSEmbeddedAppProcessIdentity _initEmbeddedApp:personaString:](self, "_initEmbeddedApp:personaString:", v5, v6);

  return v8;
}

- (id)_initEmbeddedApp:(id)a3 personaString:(id)a4
{
  id v6;
  id v7;
  _DWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _DWORD *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RBSEmbeddedAppProcessIdentity;
  v8 = -[RBSProcessIdentity _init](&v18, sel__init);
  v9 = v8;
  if (v8)
  {
    v8[2] = 0;
    v10 = objc_msgSend(v7, "copy");
    v11 = (void *)*((_QWORD *)v9 + 8);
    *((_QWORD *)v9 + 8) = v10;

    v12 = objc_msgSend(v6, "copy");
    v13 = (void *)*((_QWORD *)v9 + 7);
    *((_QWORD *)v9 + 7) = v12;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("app<%@(%@)>"), *((_QWORD *)v9 + 7), *((_QWORD *)v9 + 8));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v9 + 2);
    *((_QWORD *)v9 + 2) = v14;

    *((_QWORD *)v9 + 3) = objc_msgSend(*((id *)v9 + 7), "hash");
    v16 = v9;
  }

  return v9;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  NSString *embeddedApplicationIdentifier;
  id v5;

  embeddedApplicationIdentifier = self->_embeddedApplicationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", embeddedApplicationIdentifier, CFSTR("_embeddedApplicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personaString, CFSTR("_personaString"));

}

- (BOOL)isApplication
{
  return 1;
}

- (BOOL)isAnonymous
{
  return 0;
}

- (id)encodeForJob
{
  xpc_object_t empty;
  NSString *embeddedApplicationIdentifier;
  NSString *personaString;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 2);
  embeddedApplicationIdentifier = self->_embeddedApplicationIdentifier;
  if (embeddedApplicationIdentifier)
    xpc_dictionary_set_string(empty, "EAI", -[NSString UTF8String](embeddedApplicationIdentifier, "UTF8String"));
  personaString = self->_personaString;
  if (personaString)
    xpc_dictionary_set_string(empty, "PERS", -[NSString UTF8String](personaString, "UTF8String"));
  return empty;
}

- (BOOL)isEqual:(id)a3
{
  RBSEmbeddedAppProcessIdentity *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (RBSEmbeddedAppProcessIdentity *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class() && -[RBSProcessIdentity isEqualToIdentity:](self, "isEqualToIdentity:", v4);
  }

  return v6;
}

- (BOOL)_matchesIdentity:(id)a3
{
  id v4;
  NSString *embeddedApplicationIdentifier;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  NSString *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  int v17;
  char v18;
  char v20;

  v4 = a3;
  embeddedApplicationIdentifier = self->_embeddedApplicationIdentifier;
  objc_msgSend(v4, "embeddedApplicationIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (embeddedApplicationIdentifier == (NSString *)v6)
  {

    goto LABEL_10;
  }
  v7 = v6;
  if (embeddedApplicationIdentifier)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    LOBYTE(v9) = 0;
LABEL_48:

    goto LABEL_49;
  }
  v9 = -[NSString isEqual:](embeddedApplicationIdentifier, "isEqual:", v6);

  if (v9)
  {
LABEL_10:
    v10 = self->_personaString;
    objc_msgSend(v4, "personaString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v12 = v11;
    if (v7 | v12)
    {
      v13 = (void *)_personalPersonaUniqueStringOverride;
      if (!_personalPersonaUniqueStringOverride)
      {
        if (_personalPersonaString_onceToken != -1)
          dispatch_once(&_personalPersonaString_onceToken, &__block_literal_global_11);
        v13 = (void *)_personalPersonaString_personalPersonaString;
      }
      v14 = v13;
      v15 = v14;
      if (v7)
        v16 = v14 == (id)v7;
      else
        v16 = 1;
      if (v16)
      {
        v17 = 1;
      }
      else
      {
        if (!v14)
        {
          if (!v12)
            goto LABEL_42;
          v18 = 0;
          LOBYTE(v17) = 0;
          goto LABEL_34;
        }
        v17 = objc_msgSend((id)v7, "isEqualToString:", v14);
      }
      v18 = 1;
      if (v12 && v15 != (id)v12)
      {
        if (v15)
        {
          v18 = objc_msgSend((id)v12, "isEqualToString:", v15);
          goto LABEL_28;
        }
        v18 = 0;
LABEL_34:
        if ((v17 & 1) == 0 && (v18 & 1) == 0)
        {
          if (v7 == v12)
          {
LABEL_30:

            goto LABEL_46;
          }
          if (v7 && v12 != 0)
          {
            v20 = objc_msgSend((id)v7, "isEqualToString:", v12);

            if ((v20 & 1) != 0)
              goto LABEL_46;
            goto LABEL_43;
          }
        }
LABEL_42:

LABEL_43:
        if ((_os_feature_enabled_impl() & 1) != 0)
        {
          LOBYTE(v9) = 0;
LABEL_47:

          goto LABEL_48;
        }
LABEL_46:
        LOBYTE(v9) = 1;
        goto LABEL_47;
      }
    }
    else
    {
      v15 = 0;
      v17 = 1;
      v18 = 1;
    }
LABEL_28:
    if (v17 && (v18 & 1) != 0)
      goto LABEL_30;
    goto LABEL_34;
  }
LABEL_49:

  return v9;
}

- (id)personaString
{
  return self->_personaString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaString, 0);
  objc_storeStrong((id *)&self->_embeddedApplicationIdentifier, 0);
}

- (BOOL)isEmbeddedApplication
{
  return 1;
}

- (BOOL)supportsLaunchingDirectly
{
  return 1;
}

- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3
{
  return 1;
}

- (unsigned)defaultManageFlags
{
  return -1;
}

- (id)copyWithPersonaString:(id)a3
{
  id v4;
  NSObject *v5;
  _DWORD *v6;

  v4 = a3;
  if (!v4 && _os_feature_enabled_impl())
  {
    rbs_general_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[RBSEmbeddedAppProcessIdentity copyWithPersonaString:].cold.1();

  }
  v6 = -[RBSEmbeddedAppProcessIdentity _initEmbeddedApp:personaString:]([RBSEmbeddedAppProcessIdentity alloc], "_initEmbeddedApp:personaString:", self->_embeddedApplicationIdentifier, v4);
  v6[2] = self->super._pid;

  return v6;
}

- (id)_initEmbeddedAppWithBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    rbs_general_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithBundleID:].cold.1();

  }
  v6 = -[RBSEmbeddedAppProcessIdentity _initEmbeddedApp:personaString:](self, "_initEmbeddedApp:personaString:", v4, 0);

  return v6;
}

- (id)_initEmbeddedAppWithAppInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  RBSEmbeddedAppProcessIdentity *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "personaString");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6 && _os_feature_enabled_impl())
    {
      rbs_general_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithAppInfo:].cold.1();

    }
    self = (RBSEmbeddedAppProcessIdentity *)-[RBSEmbeddedAppProcessIdentity _initEmbeddedApp:personaString:](self, "_initEmbeddedApp:personaString:", v5, v6);
    v8 = self;
  }
  else
  {
    rbs_general_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_190CD6000, v6, OS_LOG_TYPE_DEFAULT, "_initEmbeddedAppWithAppInfoProvider failed - unable to find bundleID for %{public}@", (uint8_t *)&v11, 0xCu);

    }
    v8 = 0;
  }

  return v8;
}

- (id)debugDescription
{
  NSString *v3;
  uint64_t v4;
  NSString *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v3 = self->_embeddedApplicationIdentifier;
  v4 = -[RBSProcessIdentity auid](self, "auid");
  v5 = self->_personaString;
  v6 = (void *)MEMORY[0x1E0CB3940];
  if ((_DWORD)v4)
    v7 = CFSTR(" AUID=");
  else
    v7 = &stru_1E2D183D0;
  if ((_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E2D183D0;
  }
  v9 = CFSTR(" PERS=");
  if (v5)
  {
    v10 = (const __CFString *)v5;
  }
  else
  {
    v9 = &stru_1E2D183D0;
    v10 = &stru_1E2D183D0;
  }
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<type=%@ identifier=%@%@%@%@%@%@%@>"), CFSTR("embeddedApplication"), v3, &stru_1E2D183D0, &stru_1E2D183D0, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v4)

  return v11;
}

- (RBSEmbeddedAppProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *string;
  void *v10;
  const char *v11;
  void *v12;
  RBSEmbeddedAppProcessIdentity *v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    rbs_general_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[RBSEmbeddedAppProcessIdentity initWithDecodeFromJob:uuid:].cold.2((uint64_t)v7, v8);

  }
  string = xpc_dictionary_get_string(v6, "EAI");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = xpc_dictionary_get_string(v6, "PERS");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
LABEL_10:
      self = (RBSEmbeddedAppProcessIdentity *)-[RBSEmbeddedAppProcessIdentity _initEmbeddedApp:personaString:](self, "_initEmbeddedApp:personaString:", v10, v12);
      v13 = self;
      goto LABEL_15;
    }
  }
  else
  {
    v12 = 0;
    if (v10)
      goto LABEL_10;
  }
  rbs_general_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[RBSEmbeddedAppProcessIdentity initWithDecodeFromJob:uuid:].cold.1();

  v13 = 0;
LABEL_15:

  return v13;
}

- (void)_initEmbeddedAppWithBundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_6(&dword_190CD6000, v0, v1, "Creating RBSProcessIdentity from bundle identifier only - result is ambiguous", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_initEmbeddedAppWithAppInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_6(&dword_190CD6000, v0, v1, "Creating RBSProcessIdentity from bundle identifier only - result is ambiguous (infoProvider)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)copyWithPersonaString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_6(&dword_190CD6000, v0, v1, "Creating RBSProcessIdentity from bundle identifier only - result is ambiguous (copy)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithRBSXPCCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_6(&dword_190CD6000, v0, v1, "Creating RBSProcessIdentity from bundle identifier only - result is ambiguous (decoder)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)initWithDecodeFromJob:uuid:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_190CD6000, v0, OS_LOG_TYPE_ERROR, "initWithDecodeFromJob tried to decode embedded app without bundleID", v1, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)initWithDecodeFromJob:(uint64_t)a1 uuid:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_190CD6000, a2, OS_LOG_TYPE_FAULT, "There is no reason an app identity should have a UUID: %@", (uint8_t *)&v2, 0xCu);
}

@end
