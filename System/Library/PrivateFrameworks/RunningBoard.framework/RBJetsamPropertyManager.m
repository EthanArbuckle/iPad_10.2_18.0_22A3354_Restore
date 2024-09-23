@implementation RBJetsamPropertyManager

- (id)_jetsamPropertiesForExtensionProcess:(void *)a3 identity:(void *)a4 bundleProperties:
{
  id v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = objc_msgSend(v7, "isExternal");
    objc_msgSend(v8, "extensionPointIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 48;
    if (v9)
      v11 = 64;
    v12 = 56;
    if (v9)
      v12 = 72;
    -[RBJetsamPropertyManager _jetsamPropertiesForProcess:identifier:properties:global:](a1, a2, v10, *(void **)(a1 + v11), *(void **)(a1 + v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)jetsamPropertiesForProcess:(int)a3 identity:(id)a4 bundleProperties:(id)a5 isPlatformBinary:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;

  v6 = a6;
  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  if (os_variant_has_internal_content())
  {
    objc_msgSend(v10, "embeddedApplicationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.runningboard.test.limePuppet")))
    {
      +[RBJetsamPropertyManager testJetsamProperties](RBJetsamPropertyManager, "testJetsamProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }

  }
  if (objc_msgSend(v10, "isApplication"))
  {
    -[RBJetsamPropertyManager _jetsamPropertiesForAppProcess:identity:bundleProperties:isPlatformBinary:]((uint64_t)self, v8, v14, v11, v6);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v10, "osServiceType") == 2)
  {
    -[RBJetsamPropertyManager _jetsamPropertiesForDaemonProcess:identity:bundleProperties:]((uint64_t)self, v8, v10);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v10, "osServiceType") == 3)
  {
    -[RBJetsamPropertyManager _jetsamPropertiesForAngelProcess:identity:bundleProperties:]((uint64_t)self, v8, v10);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v10, "isExtension"))
  {
    -[RBJetsamPropertyManager _jetsamPropertiesForExtensionProcess:identity:bundleProperties:]((uint64_t)self, v8, v10, v11);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v10, "isXPCService"))
  {
    -[RBJetsamPropertyManager _jetsamPropertiesForServiceProcess:identity:bundleProperties:isPlatformBinary:]((uint64_t)self, v8, v16, v11, v6);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    rbs_jetsam_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[RBJetsamPropertyManager jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:].cold.1();

    v18 = -[RBJetsamPropertyManager _taskLimitForProcess:]((uint64_t)self);
    -[RBJetsamPropertyManager _jetsamPropertiesWithTaskLimit:](self, v18);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v15;
LABEL_19:

  return v13;
}

- (id)_jetsamPropertiesForAppProcess:(uint64_t)a3 identity:(void *)a4 bundleProperties:(int)a5 isPlatformBinary:
{
  void *v8;
  void **v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void *v15;

  if (a1)
  {
    objc_msgSend(a4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void **)(a1 + 96);
    objc_msgSend(*(id *)(a1 + 96), "valueForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = 104;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 80), "valueForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 88;
      if (a5)
        v13 = (void **)(a1 + 96);
      else
        v13 = (void **)(a1 + 80);
      v14 = 88;
      if (a5)
        v14 = 104;
      if (v12)
        v9 = (void **)(a1 + 80);
      else
        v9 = v13;
      if (!v12)
        v11 = v14;
    }
    -[RBJetsamPropertyManager _jetsamPropertiesForProcess:identifier:properties:global:](a1, a2, v8, *v9, *(void **)(a1 + v11));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)_jetsamPropertiesForProcess:(void *)a3 identifier:(void *)a4 properties:(void *)a5 global:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  if (a1)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    v11 = -[RBJetsamPropertyManager _taskLimitForProcess:](a1);
    v12 = -[RBJetsamPropertyManager _unLimitForProcess:](a1);
    objc_msgSend(v9, "valueForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(v13, "copy");
    +[RBJetsamProperties jetsamPropertiesForProperties:globalProperties:taskLimit:unLimit:](RBJetsamProperties, "jetsamPropertiesForProperties:globalProperties:taskLimit:unLimit:", v14, v8, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (uint64_t)_unLimitForProcess:(uint64_t)a1
{
  uint64_t v1;
  NSObject *v2;

  if (!a1)
    return 0;
  v1 = memorystatus_control();
  if ((int)v1 <= 0)
  {
    rbs_jetsam_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[RBJetsamPropertyManager _unLimitForProcess:].cold.1();

    return +[RBJetsamPropertyManager _taskLimit]();
  }
  return v1;
}

- (uint64_t)_taskLimitForProcess:(uint64_t)a1
{
  uint64_t v1;
  NSObject *v2;

  if (!a1)
    return 0;
  v1 = memorystatus_control();
  if ((int)v1 <= 0)
  {
    rbs_jetsam_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[RBJetsamPropertyManager _taskLimitForProcess:].cold.1();

    return +[RBJetsamPropertyManager _taskLimit]();
  }
  return v1;
}

- (id)_jetsamPropertiesForDaemonProcess:(uint64_t)a1 identity:(uint64_t)a2 bundleProperties:(void *)a3
{
  void *v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(a3, "consistentLaunchdJobLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBJetsamPropertyManager _jetsamPropertiesForProcess:identifier:properties:global:](a1, a2, v5, *(void **)(a1 + 112), *(void **)(a1 + 120));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (uint64_t)_taskLimit
{
  objc_opt_self();
  if (_taskLimit_onceToken != -1)
    dispatch_once(&_taskLimit_onceToken, &__block_literal_global_10);
  return _taskLimit_taskLimit;
}

void __37__RBJetsamPropertyManager__taskLimit__block_invoke()
{
  int v0;
  NSObject *v1;
  NSObject *v2;
  size_t v3;
  int v4;
  uint8_t buf[4];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v3 = 4;
  v0 = sysctlbyname("kern.max_task_pmem", &v4, &v3, 0, 0);
  rbs_jetsam_log();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __37__RBJetsamPropertyManager__taskLimit__block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v6 = v4;
    _os_log_impl(&dword_21A8B4000, v2, OS_LOG_TYPE_DEFAULT, "Jetsam database _kern_max_task_pmem=%d", buf, 8u);
  }

  _taskLimit_taskLimit = v4;
}

- (__CFString)_jetsamTargetType
{
  int v1;
  NSObject *v2;
  int v3;
  int v4;
  NSObject *v5;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  _BYTE *v11;
  void *v12;
  size_t size;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  size_t v17;
  _BYTE v18[16];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return (__CFString *)0;
  size = 16;
  v1 = sysctlbyname("hw.targettype", v18, &size, 0, 0);
  if (v1)
  {
    rbs_jetsam_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[RBJetsamPropertyManager _jetsamTargetType].cold.2((uint64_t *)&size, v1, v2);

  }
  if (size)
  {
    if (!v1)
      goto LABEL_10;
    return &stru_24DD48378;
  }
  size = 16;
  *__error() = 12;
  if (v1)
    return &stru_24DD48378;
  if (size != 16 || *__error() != 12)
    goto LABEL_23;
LABEL_10:
  v3 = sysctlbyname("hw.targettype", 0, &size, 0, 0);
  if (v3)
  {
    v4 = v3;
    rbs_jetsam_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[RBJetsamPropertyManager _jetsamTargetType].cold.1((uint64_t *)&size, v4, v5);

    return &stru_24DD48378;
  }
  if (size >= 0x11)
  {
    v7 = malloc_type_malloc(size, 0xCCB9267FuLL);
    v8 = sysctlbyname("hw.targettype", v7, &size, 0, 0);
    if (v8)
    {
      v9 = v8;
      rbs_jetsam_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v15 = v9;
        v16 = 2048;
        v17 = size;
        _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "SyscallError: getJetsamPriorityBandFromSystem getJetsamPropertyInfo sysctlbyname try 3 -> %d, %zu", buf, 0x12u);
      }

    }
    v11 = v7;
  }
  else
  {
LABEL_23:
    v7 = 0;
    v11 = v18;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v11);
  if (v7)
    free(v7);
  return (__CFString *)v12;
}

- (id)_jetsamTryPath:(void *)a3 target:(void *)a4 extension:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = (void *)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%@.%@.%@"), v9, v8, v7);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v10);
  if (v11)
  {
    rbs_jetsam_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_DEFAULT, "Loaded jetsamproperties from %@", buf, 0xCu);
    }

  }
  return v11;
}

- (id)_jetsamTryBasePath:(void *)a3 target:(void *)a4 extension:
{
  id v7;
  id v8;
  void *v9;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    -[RBJetsamPropertyManager _jetsamTryPath:target:extension:](a1, v7, a3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[RBJetsamPropertyManager _jetsamTryPath:target:extension:](a1, v7, CFSTR("NonUI"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_loadJetsamProperties
{
  void *v2;
  int is_darwinos;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  NSObject *v7;

  if (a1)
  {
    -[RBJetsamPropertyManager _jetsamTargetType](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    is_darwinos = os_variant_is_darwinos();
    v4 = CFSTR("plist");
    if (is_darwinos)
      v4 = CFSTR("darwin.plist");
    v5 = v4;
    if (!os_variant_has_internal_content()
      || (-[RBJetsamPropertyManager _jetsamTryBasePath:target:extension:](a1, CFSTR("/AppleInternal/Library/LaunchDaemons/com.apple.jetsamproperties"), v2, v5), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[RBJetsamPropertyManager _jetsamTryBasePath:target:extension:](a1, CFSTR("/System/Library/LaunchDaemons/com.apple.jetsamproperties"), v2, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        rbs_jetsam_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[RBJetsamPropertyManager _loadJetsamProperties].cold.1((uint64_t)v2, (uint64_t)v5, v7);

        v6 = 0;
      }
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_isNotValidProperties:(_BOOL8)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3 && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || objc_msgSend(v4, "count")))
    {
      objc_opt_class();
      a1 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "unsignedLongLongValue") == 0;
    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

- (void)_prepareJetsamData:(id *)a1
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v83 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v82 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v84 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v3)
    {
      RBSDictionaryForKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, CFSTR("Extension"), v9, v5);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Global"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = a1[7];
        a1[7] = (id)v10;

        v12 = v82;
        if (-[RBJetsamPropertyManager _isNotValidProperties:]((_BOOL8)a1, a1[7]))
        {
          v13 = a1[7];
          a1[7] = &unk_24DD5F918;

        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, CFSTR("ExternalExtension"), v9, v6);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Global"));
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = a1[9];
        a1[9] = (id)v14;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((_BOOL8)a1, a1[9]))
        {
          v16 = a1[9];
          a1[9] = &unk_24DD5F918;

        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, CFSTR("XPCService"), v9, v83);
        objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("Global"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = a1[3];
        a1[3] = (id)v17;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((_BOOL8)a1, a1[3]))
        {
          v19 = a1[3];
          a1[3] = &unk_24DD5F918;

        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, CFSTR("SystemXPCService"), v9, v4);
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Global"));
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = a1[5];
        a1[5] = (id)v20;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((_BOOL8)a1, a1[5]))
        {
          v22 = a1[5];
          a1[5] = &unk_24DD5F918;

        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, CFSTR("App"), v9, v7);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Global"));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = a1[11];
        a1[11] = (id)v23;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((_BOOL8)a1, a1[11]))
        {
          v25 = a1[11];
          a1[11] = &unk_24DD5F918;

        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, CFSTR("SystemApp"), v9, v8);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Global"));
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = a1[13];
        a1[13] = (id)v26;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((_BOOL8)a1, a1[13]))
        {
          v28 = a1[13];
          a1[13] = &unk_24DD5F918;

        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, CFSTR("Angel"), v9, v82);
        objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("Global"));
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = a1[17];
        a1[17] = (id)v29;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((_BOOL8)a1, a1[17]))
        {
          v31 = a1[17];
          a1[17] = &unk_24DD5F918;

        }
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:]((uint64_t)a1, CFSTR("Daemon"), v9, v84);
        objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("Global"));
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = a1[15];
        a1[15] = (id)v32;

        if (-[RBJetsamPropertyManager _isNotValidProperties:]((_BOOL8)a1, a1[15]))
        {
          v34 = a1[15];
          a1[15] = &unk_24DD5F918;

        }
        v35 = objc_msgSend(v83, "copy");
        v36 = a1[2];
        a1[2] = (id)v35;

        v37 = objc_msgSend(v4, "copy");
        v38 = a1[4];
        a1[4] = (id)v37;

        v39 = objc_msgSend(v5, "copy");
        v40 = a1[6];
        a1[6] = (id)v39;

        v41 = objc_msgSend(v6, "copy");
        v42 = a1[8];
        a1[8] = (id)v41;

        v43 = objc_msgSend(v7, "copy");
        v44 = a1[10];
        a1[10] = (id)v43;

        v45 = objc_msgSend(v8, "copy");
        v46 = a1[12];
        a1[12] = (id)v45;

        v47 = objc_msgSend(v82, "copy");
        v48 = a1[16];
        a1[16] = (id)v47;

        v49 = objc_msgSend(v84, "copy");
        v50 = a1[14];
        a1[14] = (id)v49;

        rbs_jetsam_log();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v81 = objc_msgSend(a1[2], "count");
          v80 = objc_msgSend(a1[4], "count");
          v79 = objc_msgSend(a1[6], "count");
          v78 = objc_msgSend(a1[8], "count");
          v77 = objc_msgSend(a1[10], "count");
          v76 = objc_msgSend(a1[12], "count");
          v75 = objc_msgSend(a1[16], "count");
          v74 = objc_msgSend(a1[14], "count");
          v52 = objc_msgSend(a1[2], "count");
          v53 = objc_msgSend(a1[4], "count") + v52;
          v54 = objc_msgSend(a1[6], "count");
          v55 = v53 + v54 + objc_msgSend(a1[8], "count");
          v56 = objc_msgSend(a1[10], "count");
          v57 = v56 + objc_msgSend(a1[12], "count");
          v58 = v55 + v57 + objc_msgSend(a1[16], "count");
          v59 = v58 + objc_msgSend(a1[14], "count");
          v12 = v82;
          *(_DWORD *)buf = 134220288;
          v86 = v81;
          v87 = 2048;
          v88 = v80;
          v89 = 2048;
          v90 = v79;
          v91 = 2048;
          v92 = v78;
          v93 = 2048;
          v94 = v77;
          v95 = 2048;
          v96 = v76;
          v97 = 2048;
          v98 = 0;
          v99 = 2048;
          v100 = v75;
          v101 = 2048;
          v102 = v74;
          v103 = 2048;
          v104 = v59;
          _os_log_impl(&dword_21A8B4000, v51, OS_LOG_TYPE_DEFAULT, "Jetsam Properties Loaded x:%lu xs:%lu e:%lu ee:%lu a:%lu as:%lu ai:%lu g:%lu d:%lu T:%lu", buf, 0x66u);
        }
      }
      else
      {
        rbs_jetsam_log();
        v51 = objc_claimAutoreleasedReturnValue();
        v12 = v82;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          -[RBJetsamPropertyManager _prepareJetsamData:].cold.2(v51, v67, v68, v69, v70, v71, v72, v73);
        v9 = 0;
      }
    }
    else
    {
      rbs_jetsam_log();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        -[RBJetsamPropertyManager _prepareJetsamData:].cold.1(v51, v60, v61, v62, v63, v64, v65, v66);
      v9 = 0;
      v12 = v82;
    }

    v3 = v9;
  }

}

- (void)_addJetsamValuesForSection:(void *)a3 fromPlist:(void *)a4 toDatabase:
{
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v26 = a2;
  v7 = a3;
  v24 = a1;
  v25 = a4;
  if (a1)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__addJetsamValuesForSection_fromPlist_toDatabase_, a1, CFSTR("RBJetsamPropertyManager.m"), 401, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("plist != nil"));

    }
    if (!v25)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__addJetsamValuesForSection_fromPlist_toDatabase_, a1, CFSTR("RBJetsamPropertyManager.m"), 402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("database != nil"));

    }
    RBSDictionaryForKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      RBSDictionaryForKey();
      v9 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v9, "count"))
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v10 = v9;
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        if (v11)
        {
          v12 = v11;
          v23 = v8;
          v13 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v33 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              RBSDictionaryForKey();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                v27[0] = MEMORY[0x24BDAC760];
                v27[1] = 3221225472;
                v27[2] = __75__RBJetsamPropertyManager__addJetsamValuesForSection_fromPlist_toDatabase___block_invoke;
                v27[3] = &unk_24DD46C80;
                v18 = v16;
                v28 = v18;
                v19 = v17;
                v29 = v19;
                v30 = v26;
                v31 = v15;
                objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v27);
                if (-[NSObject count](v19, "count"))
                {
                  -[RBJetsamPropertyManager _encodedValue:](v24, v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setValue:forKey:", v20, v15);

                }
              }
              else
              {
                rbs_jetsam_log();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v37 = v15;
                  _os_log_error_impl(&dword_21A8B4000, v19, OS_LOG_TYPE_ERROR, "Jetsam database entry for %@ not a dictionary, skipping", buf, 0xCu);
                }
              }

            }
            v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
          }
          while (v12);
          v8 = v23;
        }
      }
      else
      {
        rbs_jetsam_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:].cold.2(v10);
      }

    }
    else
    {
      rbs_jetsam_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[RBJetsamPropertyManager _addJetsamValuesForSection:fromPlist:toDatabase:].cold.1();
    }

  }
}

- (id)_encodedValue:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_23;
  }
  v5 = objc_msgSend(v3, "count");
  objc_msgSend(v4, "valueForKey:", CFSTR("ActiveHardMemoryLimit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 - (v6 != 0);
  objc_msgSend(v4, "valueForKey:", CFSTR("ActiveSoftMemoryLimit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 - (v8 != 0);
  objc_msgSend(v4, "valueForKey:", CFSTR("InactiveHardMemoryLimit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 - (v10 != 0);
  objc_msgSend(v4, "valueForKey:", CFSTR("InactiveSoftMemoryLimit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 != (v12 != 0))
    goto LABEL_21;
  if (!v6 || v8)
  {
    if (v6 || !v8)
    {
      v13 = 0;
      if (v6 && v8)
        goto LABEL_21;
    }
    else
    {
      v13 = ((objc_msgSend(v8, "unsignedLongLongValue") & 0x3FFFFFFF) << 32) | 0x8000000000000000;
    }
  }
  else
  {
    v13 = (objc_msgSend(v6, "unsignedLongLongValue") << 32) | 0xC000000000000000;
  }
  if (!v10 || v12)
  {
    if (!v10 && v12)
    {
      v14 = 0x80000000;
      v15 = v12;
      goto LABEL_17;
    }
    v16 = 0;
    if (!v10 || !v12)
      goto LABEL_18;
LABEL_21:
    v17 = objc_msgSend(v4, "copy");
    goto LABEL_22;
  }
  v14 = 3221225472;
  v15 = v10;
LABEL_17:
  v16 = objc_msgSend(v15, "unsignedLongLongValue") & 0x3FFFFFFF | v14;
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v16 | v13);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v18 = (void *)v17;

LABEL_23:
  return v18;
}

void __75__RBJetsamPropertyManager__addJetsamValuesForSection_fromPlist_toDatabase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "hasSuffix:", CFSTR("MemoryLimit")))
  {
    RBSNumberForKey();
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v4, v3);
      rbs_jetsam_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = *(_QWORD *)(a1 + 48);
        v7 = *(_QWORD *)(a1 + 56);
        v13 = 138413058;
        v14 = v6;
        v15 = 2112;
        v16 = v3;
        v17 = 2112;
        v18 = v7;
        v19 = 2112;
        v20 = v4;
        _os_log_debug_impl(&dword_21A8B4000, v5, OS_LOG_TYPE_DEBUG, "In %@ Setting %@ for %@ to %@", (uint8_t *)&v13, 0x2Au);
      }
    }
    else
    {
      rbs_jetsam_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __75__RBJetsamPropertyManager__addJetsamValuesForSection_fromPlist_toDatabase___block_invoke_cold_1();
    }

LABEL_11:
    goto LABEL_12;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("FreezerEligible")))
  {
    v8 = RBSBoolForKey();
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v10, v3);

    rbs_jetsam_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      v13 = 138413058;
      v14 = v11;
      v15 = 2112;
      v16 = v3;
      v17 = 2112;
      v18 = v12;
      v19 = 1024;
      LODWORD(v20) = v8;
      _os_log_debug_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEBUG, "In %@ Setting %@ for %@ to %hhd", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_11;
  }
LABEL_12:

}

- (RBJetsamPropertyManager)initWithEntitlementManager:(id)a3
{
  id v4;
  void *v5;
  RBJetsamPropertyManager *v6;

  v4 = a3;
  -[RBJetsamPropertyManager _loadJetsamProperties]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RBJetsamPropertyManager initWithEntitlementManager:properties:](self, "initWithEntitlementManager:properties:", v4, v5);

  return v6;
}

- (RBJetsamPropertyManager)initWithEntitlementManager:(id)a3 properties:(id)a4
{
  id v7;
  id v8;
  RBJetsamPropertyManager *v9;
  RBJetsamPropertyManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RBJetsamPropertyManager;
  v9 = -[RBJetsamPropertyManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entitlementManager, a3);
    -[RBJetsamPropertyManager _prepareJetsamData:]((id *)&v10->super.isa, v8);
  }

  return v10;
}

- (id)_jetsamPropertiesForAngelProcess:(uint64_t)a1 identity:(uint64_t)a2 bundleProperties:(void *)a3
{
  void *v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(a3, "consistentLaunchdJobLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBJetsamPropertyManager _jetsamPropertiesForProcess:identifier:properties:global:](a1, a2, v5, *(void **)(a1 + 128), *(void **)(a1 + 136));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_jetsamPropertiesForServiceProcess:(uint64_t)a3 identity:(void *)a4 bundleProperties:(int)a5 isPlatformBinary:
{
  void *v8;
  void **v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void *v15;

  if (a1)
  {
    objc_msgSend(a4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = 40;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 16), "valueForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 24;
      if (a5)
        v13 = (void **)(a1 + 32);
      else
        v13 = (void **)(a1 + 16);
      v14 = 24;
      if (a5)
        v14 = 40;
      if (v12)
        v9 = (void **)(a1 + 16);
      else
        v9 = v13;
      if (!v12)
        v11 = v14;
    }
    -[RBJetsamPropertyManager _jetsamPropertiesForProcess:identifier:properties:global:](a1, a2, v8, *v9, *(void **)(a1 + v11));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)_jetsamPropertiesWithTaskLimit:(void *)a1
{
  if (a1)
  {
    +[RBJetsamProperties jetsamPropertiesForProperties:globalProperties:taskLimit:unLimit:](RBJetsamProperties, "jetsamPropertiesForProperties:globalProperties:taskLimit:unLimit:", &unk_24DD5F940, MEMORY[0x24BDBD1B8], a2, a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (int)testTaskLimitForPid:(int)a3
{
  int v3;
  NSObject *v4;

  v3 = memorystatus_control();
  if (v3 <= 0)
  {
    rbs_jetsam_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[RBJetsamPropertyManager _taskLimitForProcess:].cold.1();

    return +[RBJetsamPropertyManager _taskLimit]();
  }
  return v3;
}

+ (id)testJetsamProperties
{
  uint64_t v2;

  v2 = +[RBJetsamPropertyManager _taskLimit]();
  return +[RBJetsamProperties jetsamPropertiesForProperties:globalProperties:taskLimit:unLimit:](RBJetsamProperties, "jetsamPropertiesForProperties:globalProperties:taskLimit:unLimit:", &unk_24DD5F968, MEMORY[0x24BDBD1B8], v2, +[RBJetsamPropertyManager _taskLimit]());
}

+ (id)unmanagedJetsamProperties
{
  uint64_t v2;

  v2 = +[RBJetsamPropertyManager _taskLimit]();
  return +[RBJetsamProperties jetsamPropertiesForProperties:globalProperties:taskLimit:unLimit:](RBJetsamProperties, "jetsamPropertiesForProperties:globalProperties:taskLimit:unLimit:", &unk_24DD5F990, MEMORY[0x24BDBD1B8], v2, +[RBJetsamPropertyManager _taskLimit]());
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_angelsGlobal, 0);
  objc_storeStrong((id *)&self->_angels, 0);
  objc_storeStrong(&self->_daemonsGlobal, 0);
  objc_storeStrong((id *)&self->_daemons, 0);
  objc_storeStrong(&self->_applicationsSysGlobal, 0);
  objc_storeStrong((id *)&self->_applicationsSys, 0);
  objc_storeStrong(&self->_applicationsGlobal, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong(&self->_externalExtensionPointsGlobal, 0);
  objc_storeStrong((id *)&self->_externalExtensionPoints, 0);
  objc_storeStrong(&self->_extensionPointsGlobal, 0);
  objc_storeStrong((id *)&self->_extensionPoints, 0);
  objc_storeStrong(&self->_xpcServicesSysGlobal, 0);
  objc_storeStrong((id *)&self->_xpcServicesSys, 0);
  objc_storeStrong(&self->_xpcServicesGlobal, 0);
  objc_storeStrong((id *)&self->_xpcServices, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
}

void __37__RBJetsamPropertyManager__taskLimit__block_invoke_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_4_0();
  v0 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_5(&dword_21A8B4000, v1, v2, "SyscallError: kern.max_task_pmem %d %d (%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)_jetsamTargetType
{
  uint64_t v5;
  int v6;
  int *v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = *__error();
  v7 = __error();
  v8[0] = 67109890;
  v8[1] = a2;
  v9 = 2048;
  v10 = v5;
  v11 = 1024;
  v12 = v6;
  v13 = 2080;
  v14 = OUTLINED_FUNCTION_7(v7);
  _os_log_error_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_ERROR, "SyscallError: getJetsamPriorityBandFromSystem getJetsamPropertyInfo sysctlbyname, try 1 -> %d, %zu, %d (%s)", (uint8_t *)v8, 0x22u);
  OUTLINED_FUNCTION_1_4();
}

- (void)_loadJetsamProperties
{
  int has_internal_content;
  __CFString *v7;
  __CFString *v8;
  uint8_t v9[12];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  has_internal_content = os_variant_has_internal_content();
  v7 = CFSTR("/System/Library/LaunchDaemons/com.apple.jetsamproperties");
  if (has_internal_content)
    v7 = CFSTR("/AppleInternal/Library/LaunchDaemons/com.apple.jetsamproperties");
  v8 = v7;
  OUTLINED_FUNCTION_2();
  v10 = 2112;
  v11 = a1;
  v12 = 2112;
  v13 = a2;
  _os_log_error_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_ERROR, "Can't find jetsamproperties ('%@' | '%@' | '%@')", v9, 0x20u);

  OUTLINED_FUNCTION_1_4();
}

- (void)_prepareJetsamData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21A8B4000, a1, a3, "Unable to load jetsam database!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_prepareJetsamData:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_21A8B4000, a1, a3, "Jetsam database parse error !(Version4)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_addJetsamValuesForSection:fromPlist:toDatabase:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Jetsam database parse error: no section found for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_addJetsamValuesForSection:(os_log_t)log fromPlist:toDatabase:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "Jetsam database parse error !(Override)", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __75__RBJetsamPropertyManager__addJetsamValuesForSection_fromPlist_toDatabase___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Jetsam database entry for %@ not a number, skipping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_taskLimitForProcess:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_4_0();
  v0 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_5(&dword_21A8B4000, v1, v2, "memorystatus_control error: MEMORYSTATUS_CMD_CONVERT_MEMLIMIT_MB(-1) returned %d %d (%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)_unLimitForProcess:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_4_0();
  v0 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_1_5(&dword_21A8B4000, v1, v2, "memorystatus_control error: MEMORYSTATUS_CMD_CONVERT_MEMLIMIT_MB(0) returned %d %d (%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

- (void)jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21A8B4000, v0, OS_LOG_TYPE_DEBUG, "Unknown process type for %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

@end
