@implementation RBLaunchdProperties

uint64_t __64__RBLaunchdProperties__parseEndpoints_withAdditionalProperties___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (MEMORY[0x22074C57C]() != MEMORY[0x24BDACF80])
  {
    if (MEMORY[0x22074C57C](v5) != MEMORY[0x24BDACFF0])
    {
      rbs_process_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)a1[4];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_string_get_string_ptr(v5));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v9 = (void *)a1[6];
      if (v10)
      {
        objc_msgSend(v9, "setObject:forKey:", v6, v10);
LABEL_14:
        v13 = 1;
        goto LABEL_15;
      }
LABEL_13:
      -[NSObject name](v6, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v6, v14);

      v10 = 0;
      goto LABEL_14;
    }
    goto LABEL_18;
  }
  if (xpc_BOOL_get_value(v5))
  {
    v7 = (void *)a1[4];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v9 = (void *)a1[6];
      goto LABEL_13;
    }
    v10 = 0;
LABEL_18:
    v13 = 1;
    goto LABEL_16;
  }
  rbs_process_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
LABEL_19:
    v16 = *(_QWORD *)(a1[5] + 32);
    objc_msgSend(v5, "debugDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v16;
    v20 = 2080;
    v21 = a2;
    v22 = 2112;
    v23 = v17;
    _os_log_error_impl(&dword_21A8B4000, v6, OS_LOG_TYPE_ERROR, "%{public}@: LaunchRequestEndpointIdentifiers entry (%s) is malformed (expect only true or string mappings) - ignoring %@", (uint8_t *)&v18, 0x20u);

  }
LABEL_12:
  v10 = 0;
  v13 = 0;
LABEL_15:

LABEL_16:
  return v13;
}

- (NSString)tmpDirectory
{
  return self->_tmpDirectory;
}

- (NSDictionary)managedEndpointByLaunchIdentifier
{
  return self->_managedEndpointByLaunchIdentifier;
}

- (NSString)homeDirectory
{
  return self->_homeDirectory;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (BOOL)doesOverrideManagement
{
  return self->_doesOverrideManagement;
}

- (NSString)beforeTranslocationBundlePath
{
  return self->_beforeTranslocationBundlePath;
}

- (NSString)underlyingAssertion
{
  return self->_underlyingAssertion;
}

- (unsigned)overrideManageFlags
{
  return self->_overrideManageFlags;
}

+ (id)propertiesForPid:(int)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  objc_msgSend(MEMORY[0x24BE043A8], "propertiesForPid:error:", *(_QWORD *)&a3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v6)
  {
    rbs_general_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v12 = a3;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_DEFAULT, "Launchd didn't have information for pid %d, reason: %{public}@", buf, 0x12u);
    }

    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "_instanceWithProperties:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)_instanceWithProperties:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[RBLaunchdProperties _initWithProperties:]([RBLaunchdProperties alloc], "_initWithProperties:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_initWithProperties:(id)a3
{
  id v4;
  void *v5;
  RBLaunchdProperties *v6;
  void *v7;
  char v8;
  char v9;
  char v10;
  uint64_t *p_jobLabel;
  void *v12;
  uint64_t v13;
  NSString *jobLabel;
  NSObject *v15;
  RBLaunchdProperties *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  objc_super v28;
  uint64_t v29;
  uint8_t buf[88];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    -[RBLaunchdProperties _initWithProperties:].cold.1(&v29, buf);
  v5 = v4;
  v28.receiver = self;
  v28.super_class = (Class)RBLaunchdProperties;
  v6 = -[RBLaunchdProperties init](&v28, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "xpcBundle");
    if ((v8 & 1) != 0)
    {
      v9 = 0;
      v10 = 0;
    }
    else
    {
      objc_msgSend(v7, "pathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "isEqualToString:", CFSTR("plist"));

      v10 = v9 ^ 1;
    }
    objc_msgSend(v5, "label");
    v13 = objc_claimAutoreleasedReturnValue();
    p_jobLabel = (uint64_t *)&v6->_jobLabel;
    jobLabel = v6->_jobLabel;
    v6->_jobLabel = (NSString *)v13;

    -[RBLaunchdProperties _parseLASSProperties:](v6, "_parseLASSProperties:", v5);
    switch(objc_msgSend(v5, "serviceType"))
    {
      case 1:
      case 2:
        if ((v9 & 1) == 0)
        {
          rbs_process_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            -[RBLaunchdProperties _initWithProperties:].cold.5();

        }
        v16 = v6;
        v17 = v5;
        v18 = v7;
        v19 = 0;
        goto LABEL_28;
      case 3:
        if ((v9 & 1) == 0)
        {
          rbs_process_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
            -[RBLaunchdProperties _initWithProperties:].cold.4();

        }
        if (!v6->_doesOverrideHasBackoff)
          v6->_hasBackoff = 1;
        v16 = v6;
        v17 = v5;
        v18 = v7;
        v19 = 1;
LABEL_28:
        -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:](v16, "_configureDaemonOrAngelWithProperties:path:isAngel:", v17, v18, v19);
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 4:
        if (v6->_specifiedIdentity)
        {
          if ((v10 & 1) == 0)
          {
            rbs_process_log();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
              -[RBLaunchdProperties _initWithProperties:].cold.3();

          }
          -[RBLaunchdProperties _configureAppWithProperties:](v6, "_configureAppWithProperties:", v5);
          v21 = objc_claimAutoreleasedReturnValue();
LABEL_29:
          p_jobLabel = (uint64_t *)v21;
        }
        else
        {
          rbs_process_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = *p_jobLabel;
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v27;
            _os_log_impl(&dword_21A8B4000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: RunningBoard doesn't recognize submitted process - treating as a anonymous process", buf, 0xCu);
          }

          p_jobLabel = 0;
        }
LABEL_30:

        break;
      case 5:
      case 6:
        if ((v8 & 1) == 0)
        {
          rbs_process_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            -[RBLaunchdProperties _initWithProperties:].cold.6();

        }
        -[RBLaunchdProperties _configureXPCServiceWithProperties:](v6, "_configureXPCServiceWithProperties:", v5);
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      default:
        rbs_process_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          -[RBLaunchdProperties _initWithProperties:].cold.2((uint64_t)&v6->_jobLabel, v5, v22);

        goto LABEL_30;
    }
  }
  else
  {
    p_jobLabel = 0;
  }

  return p_jobLabel;
}

- (void)_parseLASSProperties:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *uuid;
  NSObject *v7;
  _BOOL4 multiInstance;
  NSString *v9;
  NSString *executablePath;
  NSObject *v11;
  NSString *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSString *jobLabel;
  NSObject *v17;
  uint64_t v18;
  int v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "instance");
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v5;

  self->_multiInstance = self->_uuid != 0;
  rbs_general_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    multiInstance = self->_multiInstance;
    v19 = 67109120;
    LODWORD(v20) = multiInstance;
    _os_log_impl(&dword_21A8B4000, v7, OS_LOG_TYPE_INFO, "_multiInstance = %d", (uint8_t *)&v19, 8u);
  }

  objc_msgSend(v4, "program");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  executablePath = self->_executablePath;
  self->_executablePath = v9;

  rbs_general_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = self->_executablePath;
    v19 = 138543362;
    v20 = v12;
    _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_INFO, "_executablePath = %{public}@", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(v4, "additionalProperties");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13 && MEMORY[0x22074C57C](v13) == MEMORY[0x24BDACFA0])
  {
    rbs_general_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[RBLaunchdProperties _parseLASSProperties:].cold.1((uint64_t)self, v14, v17);

    -[RBLaunchdProperties _parseAdditionalProperties:](self, "_parseAdditionalProperties:", v14);
    objc_msgSend(v4, "endpoints");
    v18 = objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if (v18 && MEMORY[0x22074C57C](v18) == MEMORY[0x24BDACF78] && xpc_array_get_count(v15))
      -[RBLaunchdProperties _parseEndpoints:withAdditionalProperties:](self, "_parseEndpoints:withAdditionalProperties:", v15, v14);
  }
  else
  {
    rbs_general_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      jobLabel = self->_jobLabel;
      v19 = 138412290;
      v20 = jobLabel;
      _os_log_impl(&dword_21A8B4000, v15, OS_LOG_TYPE_INFO, "no additional launch properties found for %@", (uint8_t *)&v19, 0xCu);
    }
  }

}

- (void)_parseAdditionalProperties:(id)a3
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSString *v16;
  NSString *underlyingAssertion;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  RBSProcessIdentity *v25;
  RBSProcessIdentity *specifiedIdentity;
  uint64_t v27;
  void *v28;
  NSString *v29;
  NSString *beforeTranslocationBundlePath;
  uint64_t v31;
  void *v32;
  NSString *v33;
  NSString *homeDirectory;
  uint64_t v35;
  void *v36;
  NSString *v37;
  NSString *tmpDirectory;
  NSObject *v39;
  _BOOL4 doesOverrideManagement;
  int overrideManageFlags;
  _BOOL4 variableEUID;
  NSString *v43;
  RBSProcessIdentity *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v48;
  uint8_t buf[4];
  _BOOL4 v50;
  __int16 v51;
  int v52;
  __int16 v53;
  NSString *v54;
  __int16 v55;
  _BOOL4 v56;
  __int16 v57;
  RBSProcessIdentity *v58;
  __int16 v59;
  NSString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  xpc_dictionary_get_value(a3, "RunningBoard");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4 && MEMORY[0x22074C57C](v4) == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_value(v5, "Managed");
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = v7;
    v8 = MEMORY[0x24BDACF80];
    if (v7)
    {
      if (MEMORY[0x22074C57C](v7) == v8)
      {
        self->_doesOverrideManagement = 1;
        if (xpc_BOOL_get_value(v6))
          self->_overrideManageFlags = -1;
      }
    }
    xpc_dictionary_get_value(v5, "Reported");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      if (MEMORY[0x22074C57C](v9) == v8)
      {
        self->_doesOverrideManagement = 1;
        if (xpc_BOOL_get_value(v10))
          self->_overrideManageFlags |= 2u;
      }
    }
    v48 = v10;
    xpc_dictionary_get_value(v5, "ExplicitAng");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11 && MEMORY[0x22074C57C](v11) == v8)
      self->_explicitAngelFlag = xpc_BOOL_get_value(v12);
    v47 = v12;
    xpc_dictionary_get_value(v5, "UnderlyingAssertion");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = MEMORY[0x24BDACFF0];
    if (v13 && MEMORY[0x22074C57C](v13) == v15)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_string_get_string_ptr(v14));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      underlyingAssertion = self->_underlyingAssertion;
      self->_underlyingAssertion = v16;

    }
    v46 = v14;
    xpc_dictionary_get_value(v5, "VariableEUID");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18 && MEMORY[0x22074C57C](v18) == v8)
      self->_variableEUID = xpc_BOOL_get_value(v19);
    xpc_dictionary_get_value(v5, "Backoff");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20 && MEMORY[0x22074C57C](v20) == v8)
    {
      self->_doesOverrideHasBackoff = 1;
      self->_hasBackoff = xpc_BOOL_get_value(v21);
    }
    xpc_dictionary_get_value(v5, "RunningBoardLaunchedIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)MEMORY[0x24BE80C98];
      -[RBLaunchdProperties uuid](self, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "decodeFromJob:uuid:", v22, v24);
      v25 = (RBSProcessIdentity *)objc_claimAutoreleasedReturnValue();
      specifiedIdentity = self->_specifiedIdentity;
      self->_specifiedIdentity = v25;

    }
    xpc_dictionary_get_value(v5, "BeforeTranslocationBundlePath");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27 && MEMORY[0x22074C57C](v27) == v15)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_string_get_string_ptr(v28));
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      beforeTranslocationBundlePath = self->_beforeTranslocationBundlePath;
      self->_beforeTranslocationBundlePath = v29;

    }
    xpc_dictionary_get_value(v5, "HOME");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v31 && MEMORY[0x22074C57C](v31) == v15)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_string_get_string_ptr(v32));
      v33 = (NSString *)objc_claimAutoreleasedReturnValue();
      homeDirectory = self->_homeDirectory;
      self->_homeDirectory = v33;

    }
    xpc_dictionary_get_value(v5, "TMPDIR");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v35;
    if (v35 && MEMORY[0x22074C57C](v35) == v15)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_string_get_string_ptr(v36));
      v37 = (NSString *)objc_claimAutoreleasedReturnValue();
      tmpDirectory = self->_tmpDirectory;
      self->_tmpDirectory = v37;

    }
    rbs_general_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      doesOverrideManagement = self->_doesOverrideManagement;
      overrideManageFlags = self->_overrideManageFlags;
      variableEUID = self->_variableEUID;
      v43 = self->_underlyingAssertion;
      v44 = self->_specifiedIdentity;
      v45 = self->_beforeTranslocationBundlePath;
      *(_DWORD *)buf = 67110402;
      v50 = doesOverrideManagement;
      v51 = 1024;
      v52 = overrideManageFlags;
      v53 = 2114;
      v54 = v43;
      v55 = 1024;
      v56 = variableEUID;
      v57 = 2114;
      v58 = v44;
      v59 = 2114;
      v60 = v45;
      _os_log_impl(&dword_21A8B4000, v39, OS_LOG_TYPE_INFO, "_doesOverrideManagement = %d, _overrideManageFlags = %d, _underlyingAssertion = %{public}@, _variableEUID = %d, _specifiedIdenity = %{public}@ _beforeTranslocationBundlePath = %{public}@", buf, 0x32u);
    }

  }
  else
  {
    rbs_general_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A8B4000, v6, OS_LOG_TYPE_INFO, "_parseAdditionalProperties no RBProperties", buf, 2u);
    }
  }

}

- (BOOL)isDaemon
{
  return self->_type == 2;
}

- (int)hostPid
{
  return self->_hostPid;
}

- (BOOL)isAngel
{
  return self->_type == 4;
}

- (BOOL)hasBackoff
{
  return self->_hasBackoff;
}

- (id)_configureAppWithProperties:(id)a3
{
  *((_QWORD *)self + 1) = 1;
  return self;
}

- (void)_parseEndpoints:(id)a3 withAdditionalProperties:(id)a4
{
  id v5;
  size_t v6;
  void *v7;
  void *v8;
  void *v9;
  const char *string;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSDictionary *v28;
  NSDictionary *managedEndpointByLaunchIdentifier;
  xpc_object_t xdict;
  xpc_object_t xarray;
  _QWORD applier[4];
  id v34;
  RBLaunchdProperties *v35;
  id v36;

  xarray = a3;
  v5 = a4;
  if (xpc_array_get_count(xarray))
  {
    xdict = v5;
    v6 = 0;
    v7 = 0;
    v8 = xarray;
    do
    {
      xpc_array_get_dictionary(v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      string = xpc_dictionary_get_string(v9, "XPCServiceEndpointName");
      v11 = xpc_dictionary_get_BOOL(v9, "XPCServiceEndpointNonLaunching");
      xpc_dictionary_get_value(v9, "XPCServiceEndpointPort");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (string && v12)
      {
        v14 = objc_alloc(MEMORY[0x24BE80C08]);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "_initWithName:nonLaunching:port:", v15, v11, v13);

        if (v7)
        {
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v16, v17);
        }
        else
        {
          v18 = (void *)MEMORY[0x24BDBCED8];
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "dictionaryWithObject:forKey:", v16, v17);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      v19 = xpc_array_get_count(xarray) > ++v6;
      v8 = xarray;
    }
    while (v19);
    v5 = xdict;
    if (v7)
    {
      xpc_dictionary_get_dictionary(xdict, "RunningBoard");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
      {
        v22 = MEMORY[0x22074C57C](v20);
        v23 = MEMORY[0x24BDACFA0];
        if (v22 == MEMORY[0x24BDACFA0])
        {
          xpc_dictionary_get_dictionary(v21, "LaunchRequestEndpointIdentifiers");
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v24;
          if (v24 && MEMORY[0x22074C57C](v24) == v23)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", xpc_dictionary_get_count(v25));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            applier[0] = MEMORY[0x24BDAC760];
            applier[1] = 3221225472;
            applier[2] = __64__RBLaunchdProperties__parseEndpoints_withAdditionalProperties___block_invoke;
            applier[3] = &unk_24DD47170;
            v34 = v7;
            v35 = self;
            v27 = v26;
            v36 = v27;
            if (xpc_dictionary_apply(v25, applier) && objc_msgSend(v27, "count"))
            {
              v28 = (NSDictionary *)objc_msgSend(v27, "copy");
              managedEndpointByLaunchIdentifier = self->_managedEndpointByLaunchIdentifier;
              self->_managedEndpointByLaunchIdentifier = v28;

            }
          }

        }
      }

    }
  }

}

- (id)_configureDaemonOrAngelWithProperties:(id)a3 path:(id)a4 isAngel:(BOOL)a5
{
  __CFString *v5;
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _BOOL4 explicitAngelFlag;
  void *v14;
  size_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  NSString *v20;
  __CFString *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  RBLaunchdProperties *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  size_t v38;
  void *v39;
  const char *string;
  NSObject *v41;
  NSString *jobLabel;
  const __CFString *v43;
  NSObject *v44;
  NSString *v45;
  const __CFString *v46;
  __CFString *v48;
  id v49;
  id v50;
  uint8_t buf[4];
  NSString *v52;
  __int16 v53;
  const __CFString *v54;
  uint64_t v55;

  v6 = a5;
  v55 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (v10)
  {
    objc_msgSend(v9, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      objc_storeStrong((id *)&self->_path, a4);
      explicitAngelFlag = self->_explicitAngelFlag;
      if (self->_explicitAngelFlag || v6)
      {
        self->_type = 4;
        if (self->_overrideManageFlags != 255)
        {
          rbs_general_log();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.9();

          self->_overrideManageFlags = -1;
          explicitAngelFlag = self->_explicitAngelFlag;
        }
        if (explicitAngelFlag)
        {
          rbs_general_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.8();

        }
        if (objc_msgSend(v9, "processType") != 256)
        {
          rbs_general_log();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.7((uint64_t)self, v9, v33);

        }
        if (objc_msgSend(v9, "keepAlive"))
        {
          rbs_general_log();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.6();

        }
        if (objc_msgSend(v9, "runAtLoad"))
        {
          rbs_general_log();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.5();

        }
        if (objc_msgSend(v9, "enableTransactions"))
        {
          rbs_general_log();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.4();

        }
        if (objc_msgSend(v9, "enablePressuredExit"))
        {
          rbs_general_log();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.3();

        }
        objc_msgSend(v9, "endpoints");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!xpc_array_get_count(v14) || !xpc_array_get_count(v14))
          goto LABEL_68;
        v49 = v10;
        v50 = v9;
        v38 = 0;
        do
        {
          xpc_array_get_value(v14, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          string = xpc_dictionary_get_string(v39, "XPCServiceEndpointName");
          rbs_general_log();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            jobLabel = self->_jobLabel;
            if (string)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
              v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v43 = v5;
            }
            else
            {
              v43 = CFSTR("<NO-NAME>");
            }
            *(_DWORD *)buf = 138543618;
            v52 = jobLabel;
            v53 = 2114;
            v54 = v43;
            _os_log_impl(&dword_21A8B4000, v41, OS_LOG_TYPE_INFO, "Checking angel %{public}@ for mach service with name %{public}@", buf, 0x16u);
            if (string)

          }
          if (!xpc_dictionary_get_BOOL(v39, "XPCServiceEndpointNonLaunching"))
          {
            rbs_general_log();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
            {
              v45 = self->_jobLabel;
              v46 = CFSTR("<NO-NAME>");
              if (string)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
                v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v46 = v48;
              }
              *(_DWORD *)buf = 138543618;
              v52 = v45;
              v53 = 2114;
              v54 = v46;
              _os_log_fault_impl(&dword_21A8B4000, v44, OS_LOG_TYPE_FAULT, "Angel %{public}@ has the unsupported launching mach service with name %{public}@", buf, 0x16u);
              if (string)

            }
          }

          ++v38;
        }
        while (xpc_array_get_count(v14) > v38);
      }
      else
      {
        self->_type = 2;
        objc_msgSend(v9, "endpoints");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!xpc_array_get_count(v14) || !xpc_array_get_count(v14))
          goto LABEL_68;
        v49 = v10;
        v50 = v9;
        v15 = 0;
        do
        {
          xpc_array_get_value(v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = xpc_dictionary_get_string(v16, "XPCServiceEndpointName");
          if (v17)
          {
            v18 = v17;
            if (!strcmp(v17, "com.apple.frontboard.workspace")
              || !strcmp(v18, "com.apple.frontboard.systemappservices"))
            {
              rbs_general_log();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                v20 = self->_jobLabel;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v18);
                v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v52 = v20;
                v53 = 2114;
                v54 = v21;
                _os_log_impl(&dword_21A8B4000, v19, OS_LOG_TYPE_DEFAULT, "Found FrontBoard mach service for daemon %{public}@ with name %{public}@", buf, 0x16u);

              }
              if (!self->_doesOverrideManagement)
              {
                self->_doesOverrideManagement = 1;
                self->_overrideManageFlags = 2;
              }
            }
          }

          ++v15;
        }
        while (xpc_array_get_count(v14) > v15);
      }
      v10 = v49;
      v9 = v50;
LABEL_68:

      v30 = self;
      goto LABEL_69;
    }
    rbs_general_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.2();
  }
  else
  {
    rbs_general_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
  }

  v30 = 0;
LABEL_69:

  return v30;
}

- (BOOL)isXPCService
{
  return self->_type == 3;
}

- (BOOL)hasVariableEUID
{
  return self->_variableEUID;
}

- (id)resolvedIdentityWithPid:(int)a3 auid:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (!-[RBLaunchdProperties isDaemon](self, "isDaemon"))
  {
    if (-[RBLaunchdProperties isAngel](self, "isAngel"))
    {
      -[RBLaunchdProperties jobLabel](self, "jobLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = (void *)MEMORY[0x24BE80C98];
        -[RBLaunchdProperties jobLabel](self, "jobLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identityForAngelJobLabel:", v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        return v9;
      }
      rbs_general_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[RBLaunchdProperties resolvedIdentityWithPid:auid:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    }
    v9 = 0;
    return v9;
  }
  v7 = (void *)MEMORY[0x24BE80C98];
  -[RBLaunchdProperties jobLabel](self, "jobLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identityForLaunchdJobLabel:isMultiInstance:pid:auid:", v8, -[RBLaunchdProperties isMultiInstance](self, "isMultiInstance"), v5, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)jobLabel
{
  return self->_jobLabel;
}

- (BOOL)isMultiInstance
{
  return self->_multiInstance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_tmpDirectory, 0);
  objc_storeStrong((id *)&self->_homeDirectory, 0);
  objc_storeStrong((id *)&self->_beforeTranslocationBundlePath, 0);
  objc_storeStrong((id *)&self->_specifiedIdentity, 0);
  objc_storeStrong((id *)&self->_underlyingAssertion, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_jobLabel, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (id)_configureXPCServiceWithProperties:(id)a3
{
  self->_hostPid = objc_msgSend(a3, "hostPID");
  self->_type = 3;
  return self;
}

+ (id)processIdentityForEndpoint:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14[0] = 0;
  v14[1] = 0;
  if ((xpc_endpoint_get_bs_job_handle() & 1) != 0)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v14);
    v6 = (void *)objc_msgSend(MEMORY[0x24BE043B8], "copyJobWithHandle:", v5);
    if (v6)
    {
      objc_msgSend(a1, "propertiesForJob:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        -[NSObject specifiedIdentity](v7, "specifiedIdentity");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v11 = v9;
          v10 = v11;
        }
        else
        {
          -[NSObject resolvedIdentity](v8, "resolvedIdentity");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        v12 = v11;
      }
      else
      {
        rbs_general_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          +[RBLaunchdProperties processIdentityForEndpoint:].cold.2();
        v12 = 0;
      }

    }
    else
    {
      rbs_general_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[RBLaunchdProperties processIdentityForEndpoint:].cold.1();
      v12 = 0;
    }

  }
  else
  {
    rbs_general_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[RBLaunchdProperties processIdentityForEndpoint:].cold.3();
    v12 = 0;
  }

  return v12;
}

- (RBSProcessIdentity)specifiedIdentity
{
  return self->_specifiedIdentity;
}

- (id)resolvedIdentity
{
  return -[RBLaunchdProperties resolvedIdentityWithPid:auid:](self, "resolvedIdentityWithPid:auid:", 0, 0);
}

+ (id)propertiesForJob:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;

  v4 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x24BE043A8], "propertiesForJob:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5)
  {
    objc_msgSend(a1, "_instanceWithProperties:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    rbs_general_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[RBLaunchdProperties propertiesForJob:].cold.1();

    v7 = 0;
  }

  return v7;
}

+ (id)propertiesForLabel:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE043B8];
  v6 = (void *)MEMORY[0x24BE043B0];
  v7 = a3;
  objc_msgSend(v6, "currentDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "copyJobWithLabel:domain:", v7, v8);

  if (!v9)
  {
    if (!a4)
    {
      v11 = 0;
      goto LABEL_9;
    }
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BE80E58];
    v21 = *MEMORY[0x24BDD0FD8];
    v22[0] = CFSTR("Could not find launchd job for label");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    goto LABEL_7;
  }
  +[RBLaunchdProperties propertiesForJob:](RBLaunchdProperties, "propertiesForJob:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (a4 && !v10)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BE80E58];
    v19 = *MEMORY[0x24BDD0FD8];
    v20 = CFSTR("Launchd did not have information on this label");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    *a4 = v15;

  }
LABEL_9:

  return v11;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)_initWithProperties:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (void)_initWithProperties:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  uint8_t v6[14];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "serviceType");
  OUTLINED_FUNCTION_12_1();
  v7 = v4;
  OUTLINED_FUNCTION_4_2(&dword_21A8B4000, a3, v5, "%{public}@: Unrecognized launchd process type %d", v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithProperties:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_2_6(&dword_21A8B4000, v0, v1, "%{public}@: RunningBoard legacy process type resolved as %d, new system resolved as an app");
  OUTLINED_FUNCTION_1_1();
}

- (void)_initWithProperties:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_2_6(&dword_21A8B4000, v0, v1, "%{public}@: RunningBoard legacy process type resolved as %d, new system resolved as an angel");
  OUTLINED_FUNCTION_1_1();
}

- (void)_initWithProperties:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_2_6(&dword_21A8B4000, v0, v1, "%{public}@: RunningBoard legacy process type resolved as %d, new system resolved as a daemon");
  OUTLINED_FUNCTION_1_1();
}

- (void)_initWithProperties:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_2_6(&dword_21A8B4000, v0, v1, "%{public}@: RunningBoard legacy process type resolved as %d, new system resolved as an XPC Service");
  OUTLINED_FUNCTION_1_1();
}

+ (void)propertiesForJob:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Launchd didn't have information for job %{public}@, reason: %{public}@");
  OUTLINED_FUNCTION_1_1();
}

+ (void)processIdentityForEndpoint:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "no job for endpoint %@ from looked up handle=%@");
  OUTLINED_FUNCTION_1_1();
}

+ (void)processIdentityForEndpoint:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "no properties found for job %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)processIdentityForEndpoint:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "no job handle found for endpoint %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)resolvedIdentityWithPid:(uint64_t)a3 auid:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, a1, a3, "Resolved angel without job label", a5, a6, a7, a8, 0);
}

- (void)_parseLASSProperties:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "NSRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_DEBUG, "additional launch properties for %@: %@", (uint8_t *)&v6, 0x16u);

}

- (void)_configureDaemonOrAngelWithProperties:(uint64_t)a3 path:(uint64_t)a4 isAngel:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, a1, a3, "attempted to create daemon with no path", a5, a6, a7, a8, 0);
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Ignoring invalid daemon defined at %{public}@ because it has no job label.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, v0, v1, "Angel %{public}@ has the unsupported key 'enablePressuredExit'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, v0, v1, "Angel %{public}@ has the unsupported key 'enableTransactions'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, v0, v1, "Angel %{public}@ has the unsupported key 'runAtLoad'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, v0, v1, "Angel %{public}@ has the unsupported key 'KeepAlive'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_configureDaemonOrAngelWithProperties:(uint64_t)a1 path:(void *)a2 isAngel:(NSObject *)a3 .cold.7(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  uint8_t v6[14];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "processType");
  OUTLINED_FUNCTION_12_1();
  v7 = v4;
  OUTLINED_FUNCTION_4_2(&dword_21A8B4000, a3, v5, "Angel %{public}@ is using a ProcessType other than app: %d", v6);
  OUTLINED_FUNCTION_1();
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, v0, v1, "Angel %{public}@ is using deprecated flag ExplicitAng - move plist to the correct location and remove this flag", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_6(&dword_21A8B4000, v0, v1, "Explicit ang %{public}@ doesn't explicitly state management", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
