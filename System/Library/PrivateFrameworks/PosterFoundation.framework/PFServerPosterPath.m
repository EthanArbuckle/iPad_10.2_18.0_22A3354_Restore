@implementation PFServerPosterPath

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

+ (id)_cachedPathWithContentsURL:(void *)a3 identity:(void *)a4 allocedInstance:
{
  id v6;
  id v7;
  PFServerPosterPath *v8;
  PFServerPosterPath *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("contentsURL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterPath _cachedPathWithContentsURL:identity:allocedInstance:].cold.1();
LABEL_27:
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463C90CLL);
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterPath _cachedPathWithContentsURL:identity:allocedInstance:].cold.2();
    goto LABEL_27;
  }
  if (__disableUniquing_0)
  {
    if (!v8)
      v8 = [PFServerPosterPath alloc];
    v9 = v8;
    objc_msgSend(v7, "role");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v9, v6, v10, 2, v7, 0, -1, 0, 0);
    v12 = v11;

  }
  else
  {
    os_unfair_lock_lock(&__cachedServerPathsByIdentityByURLLock);
    objc_msgSend((id)__cachedServerPathsByIdentityByURL, "objectForKey:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v9 = v8;
      objc_msgSend(v7, "role");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v9, 0, v14, 2, 0, 0, -1, 0, 0);
      v16 = (void *)v15;
      -[PFPosterPath _invalidate](v15);
    }
    else
    {
      objc_msgSend((id)__cachedServerPathsByIdentityByURL, "objectForKey:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v17;
      if (v17)
      {
        objc_msgSend(v17, "objectEnumerator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "nextObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v19, "contentsURL");
          v20 = objc_claimAutoreleasedReturnValue();

          v6 = (id)v20;
        }

      }
      if (!v8)
        v8 = [PFServerPosterPath alloc];
      v9 = v8;
      objc_msgSend(v7, "role");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v9, v6, v21, 2, v7, 0, -1, 0, 0);
      v12 = v22;

      if (!v14)
      {
        if (!__cachedServerPathsByIdentityByURL)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)__cachedServerPathsByIdentityByURL;
          __cachedServerPathsByIdentityByURL = v23;

        }
        objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, 5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)__cachedServerPathsByIdentityByURL;
        objc_msgSend(v12, "contentsURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v14, v26);

      }
      objc_msgSend(v12, "identity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v12, v16);
    }

    os_unfair_lock_unlock(&__cachedServerPathsByIdentityByURLLock);
  }

  return v12;
}

+ (id)pathWithContainerURL:(id)a3 identity:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  NSClassFromString(CFSTR("NSURL"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterPath pathWithContainerURL:identity:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463DB40);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterPath pathWithContainerURL:identity:].cold.1();
LABEL_14:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463DADCLL);
  }

  if (!objc_msgSend(v8, "isFileURL") || (objc_msgSend(v8, "hasDirectoryPath") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("containerURL must be a fileURL directory : %@"), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterPath pathWithContainerURL:identity:].cold.2();
    goto LABEL_14;
  }
  objc_msgSend(v7, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "pathWithProviderURL:identity:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)pathWithProviderURL:(id)a3 identity:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  NSClassFromString(CFSTR("NSURL"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterPath pathWithProviderURL:identity:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463DDACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterPath pathWithProviderURL:identity:].cold.1();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463DE10);
  }

  if (!objc_msgSend(v7, "isFileURL") || (objc_msgSend(v7, "hasDirectoryPath") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("providerURL must be a fileURL directory : %@"), v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterPath pathWithProviderURL:identity:].cold.5();
LABEL_26:
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463DD48);
  }
  v8 = v6;
  NSClassFromString(CFSTR("PFServerPosterIdentity"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterPath pathWithProviderURL:identity:].cold.2();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463DE74);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterIdentityClass]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterPath pathWithProviderURL:identity:].cold.2();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463DED8);
  }

  v9 = objc_msgSend(v8, "type");
  v10 = objc_msgSend(v8, "version");
  objc_msgSend(v8, "posterUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "pf_posterPathContentsURLForProviderURL:type:posterUUID:version:", v7, v9, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to construct contentsURL from '%@' and %@"), v7, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFServerPosterPath pathWithProviderURL:identity:].cold.3();
    goto LABEL_26;
  }
  v13 = v12;
  +[PFServerPosterPath _cachedPathWithContentsURL:identity:allocedInstance:]((uint64_t)PFServerPosterPath, v12, v8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (PFServerPosterIdentity)identity
{
  return self->super._serverIdentity;
}

- (id)containerURL
{
  void *v2;
  void *v3;

  -[PFServerPosterPath providerURL](self, "providerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)providerURL
{
  void *v2;
  void *v3;

  -[PFServerPosterPath typeURL](self, "typeURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)typeURL
{
  void *v2;
  void *v3;

  -[PFServerPosterPath identifierURL](self, "identifierURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)identifierURL
{
  void *v2;
  void *v3;

  -[PFServerPosterPath versionsURL](self, "versionsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)versionsURL
{
  void *v2;
  void *v3;

  -[PFServerPosterPath instanceURL](self, "instanceURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)instanceURL
{
  return -[NSURL URLByDeletingLastPathComponent](self->super._contentsURL, "URLByDeletingLastPathComponent");
}

- (NSURL)supplementURL
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCF48];
  -[PFServerPosterPath instanceURL](self, "instanceURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pf_posterPathSupplementURLForInstanceURL:supplement:", v4, -[PFServerPosterIdentity supplement](self->super._serverIdentity, "supplement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (NSString)identityPathComponent
{
  void *v2;
  PFServerPosterIdentity *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x24BDBCF48];
  v3 = self->super._serverIdentity;
  -[PFServerPosterIdentity provider](v3, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PFServerPosterIdentity type](v3, "type");
  v7 = -[PFServerPosterIdentity version](v3, "version");
  -[PFServerPosterIdentity posterUUID](v3, "posterUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "pf_posterPathInstanceURLForProviderURL:type:posterUUID:version:", v5, v6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)stablePersistenceIdentifier
{
  return -[PFServerPosterIdentity stablePersistenceIdentifier](self->super._serverIdentity, "stablePersistenceIdentifier");
}

- (id)extendInstanceReadAccessToAuditToken:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PFServerPosterPath instanceURL](self, "instanceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterPath _extendReadAccessForURL:toAuditToken:error:]((void **)&self->super.super.isa, v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)extendContentsReadAccessToAuditToken:(id)a3 error:(id *)a4
{
  return -[PFPosterPath _extendReadAccessForURL:toAuditToken:error:]((void **)&self->super.super.isa, self->super._contentsURL, a3, a4);
}

- (BOOL)isEqualToPersistable:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = -[PFPosterPath _isEqualToPersistable:]((uint64_t)self, v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isServerPosterPath
{
  return 1;
}

+ (void)_cachedPathWithContentsURL:identity:allocedInstance:.cold.1()
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
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)_cachedPathWithContentsURL:identity:allocedInstance:.cold.2()
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
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pathWithContainerURL:identity:.cold.1()
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

+ (void)pathWithContainerURL:identity:.cold.2()
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
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pathWithProviderURL:identity:.cold.1()
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

+ (void)pathWithProviderURL:identity:.cold.2()
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

+ (void)pathWithProviderURL:identity:.cold.3()
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
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)pathWithProviderURL:identity:.cold.5()
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
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
