@implementation PFPosterPath

- (NSString)descriptorIdentifier
{
  void *descriptorIdentifier;
  void *v4;
  NSString *v5;

  -[PFServerPosterIdentity descriptorIdentifier](self->_serverIdentity, "descriptorIdentifier");
  descriptorIdentifier = (void *)objc_claimAutoreleasedReturnValue();
  v4 = descriptorIdentifier;
  if (!descriptorIdentifier)
    descriptorIdentifier = self->_descriptorIdentifier;
  v5 = descriptorIdentifier;

  return v5;
}

- (PFPosterPath)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  PFPosterPath *result;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  PFPosterPath *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is not allowed on %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v14 = v9;
    v15 = 2114;
    v16 = v11;
    v17 = 2048;
    v18 = self;
    v19 = 2114;
    v20 = CFSTR("PFPosterPath.m");
    v21 = 1024;
    v22 = 119;
    v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_24462A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  result = (PFPosterPath *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)_initWithContentsURL:(void *)a3 role:(char)a4 options:(void *)a5 serverIdentity:(void *)a6 descriptorIdentifier:(uint64_t)a7 sandboxExtensionHandle:(void *)a8 sandboxExtensionURL:(void *)a9 sandboxExtensionAuditToken:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  objc_super v41;

  v16 = a2;
  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  if (!a1)
  {
LABEL_11:

    return;
  }
  v41.receiver = a1;
  v41.super_class = (Class)PFPosterPath;
  v22 = objc_msgSendSuper2(&v41, sel_init);
  if (v22)
  {
    v23 = (uint64_t)v22;
    v24 = objc_msgSend(v16, "copy");
    v25 = *(void **)(v23 + 8);
    *(_QWORD *)(v23 + 8) = v24;

    *(_BYTE *)(v23 + 76) = a4;
    v26 = objc_msgSend(v17, "copy");
    v27 = *(void **)(v23 + 32);
    *(_QWORD *)(v23 + 32) = v26;

    v28 = objc_msgSend(v18, "copy");
    v29 = *(void **)(v23 + 16);
    *(_QWORD *)(v23 + 16) = v28;

    v30 = objc_msgSend(v19, "copy");
    v31 = *(void **)(v23 + 24);
    *(_QWORD *)(v23 + 24) = v30;

    *(_DWORD *)(v23 + 72) = 0;
    *(_QWORD *)(v23 + 64) = a7;
    v32 = objc_msgSend(v20, "copy");
    v33 = *(void **)(v23 + 48);
    *(_QWORD *)(v23 + 48) = v32;

    v34 = objc_msgSend(v21, "copy");
    v35 = *(void **)(v23 + 56);
    *(_QWORD *)(v23 + 56) = v34;

    if (*(_QWORD *)(v23 + 8))
    {
      os_unfair_lock_lock(&__allPathsLock);
      v36 = (void *)__allPaths;
      if (!__allPaths)
      {
        objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)__allPaths;
        __allPaths = v37;

        v36 = (void *)__allPaths;
      }
      objc_msgSend(v36, "addObject:", v23);
      os_unfair_lock_unlock(&__allPathsLock);
    }
    if ((*(_BYTE *)(v23 + 76) & 1) != 0)
    {
      PFLogPosterContents();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:].cold.2(v23, v39, v40);

    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:].cold.1(sel__initWithContentsURL_role_options_serverIdentity_descriptorIdentifier_sandboxExtensionHandle_sandboxExtensionURL_sandboxExtensionAuditToken_);
  __break(0);
}

- (void)dealloc
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

- (void)_invalidate
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 72);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if (!*(_BYTE *)(a1 + 79))
    {
      *(_BYTE *)(a1 + 79) = 1;
      -[PFPosterPath _lock_purgeIfPossible](a1);
    }
    os_unfair_lock_unlock(v2);
  }
}

+ (id)_temporaryDirectoryURLWithContainerPath:(void *)a3 basenamePrefix:
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  char *v14;
  char *v15;
  char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int *v33;
  void *v34;
  char *v35;
  int *v36;
  void *v37;
  void *v38;
  id v39;
  char __strerrbuf[256];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = v4;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.1();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244639B54);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.1();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244639BB8);
  }

  v7 = v5;
  NSClassFromString(CFSTR("NSString"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.2();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244639C1CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.2();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244639C80);
  }

  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("basenamePrefix must not be empty"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.3();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244639CD8);
  }
  v8 = (void *)MEMORY[0x249514230]();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-XXXXXX"), v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to make temp directory basenameTemplate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.4();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244639D2CLL);
  }
  v10 = (void *)v9;
  objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to make temp directory template"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.5();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244639D80);
  }
  v12 = (void *)v11;
  *__error() = 0;
  v13 = objc_retainAutorelease(v12);
  v14 = strdup((const char *)objc_msgSend(v13, "fileSystemRepresentation"));
  if (!v14)
  {
    v33 = __error();
    strerror_r(*v33, __strerrbuf, 0x100uLL);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to make templateUTF8String with errno=%i (%s) : template='%@'"), *__error(), __strerrbuf, v13);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.6();
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244639E64);
  }
  v15 = v14;
  *__error() = 0;
  v16 = mkdtemp(v15);
  if (v16 != v15)
  {
    v35 = v16;
    v36 = __error();
    strerror_r(*v36, __strerrbuf, 0x100uLL);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unexpected mkdtemp result with errno=%i (%s) : template(%p)=%@ result=%p"), *__error(), __strerrbuf, v15, v13, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.9();
    objc_msgSend(objc_retainAutorelease(v37), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244639EF8);
  }
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "stringWithFileSystemRepresentation:length:", v15, strlen(v15));
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to wrap pathUTF8String : pathUTF8String=%s"), v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.7();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244639DDCLL);
  }
  v19 = (void *)v18;
  free(v15);
  PFPosterPathFileAttributes();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v21 = objc_msgSend(v17, "setAttributes:ofItemAtPath:error:", v20, v19, &v39);
  v22 = v39;

  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed to set necessary attributes of path=%@ : error=%@"), v19, v22);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:].cold.8();
    objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244639F50);
  }

  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v19, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (uint64_t)_reportSandboxExtensionError:(uint64_t)a3 withCode:(void *)a4 reason:(uint64_t)a5
{
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = (objc_class *)objc_opt_self();
  if (!objc_msgSend(v11, "length"))
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(sel__reportSandboxExtensionError_withCode_reason_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("bad format string for %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath _reportSandboxExtensionError:withCode:reason:].cold.1();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463A16CLL);
  }
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v11, &a9);
  PFLogPosterContents();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v13;
    v26 = 2048;
    v27 = a3;
    v28 = 2114;
    v29 = v14;
    _os_log_error_impl(&dword_24462A000, v15, OS_LOG_TYPE_ERROR, "SandboxExtensionError: domain=%{publid}@ code=%lli reason=%{public}@", buf, 0x20u);
  }

  if (a2)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FD8];
    v23 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v13, a3, v17);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (void)_extendReadAccessForURL:(void *)a3 toAuditToken:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void **result;
  void *v17;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (!a1)
  {
LABEL_8:

    return a1;
  }
  if (v7)
  {
    if (v8 && objc_msgSend(v8, "isInvalid"))
    {
      +[PFPosterPath _reportSandboxExtensionError:withCode:reason:]((uint64_t)PFPosterPath, a4, 1, CFSTR("cannot extend access of %@ with invalid auditToken %@"), v10, v11, v12, v13, (uint64_t)a1);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = objc_alloc((Class)objc_opt_class());
      -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v15, a1[1], a1[4], 2, a1[2], a1[3], -1, v7, v9);
    }
    a1 = (void **)v14;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("extensionURL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[PFPosterPath _extendReadAccessForURL:toAuditToken:error:].cold.1();
  objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
  result = (void **)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)_lock_purgeIfPossible
{
  int v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = *__error();
  -[PFPosterPath _lock_descriptionWithDebugInfo:](a2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109634;
  v8[1] = v6;
  v9 = 2082;
  v10 = a1;
  v11 = 2114;
  v12 = v7;
  _os_log_error_impl(&dword_24462A000, a3, OS_LOG_TYPE_ERROR, "failed to release sandboxExtensionHandle with errno=%i (%{public}s) : %{public}@", (uint8_t *)v8, 0x1Cu);

}

- (id)_lock_descriptionWithDebugInfo:(const os_unfair_lock *)a1
{
  id *v2;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  __CFString *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v2 = (id *)a1;
  v51 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return v2;
  os_unfair_lock_assert_owner(a1 + 18);
  v4 = &stru_2515444D8;
  if (*((_BYTE *)v2 + 80))
    v5 = CFSTR(":purged");
  else
    v5 = &stru_2515444D8;
  v6 = v5;
  v7 = &stru_2515444D8;
  if (a2)
  {
    if (v2[8] == (id)-1)
    {
      if (!v2[6])
      {
        v7 = &stru_2515444D8;
LABEL_9:
        if (*((_BYTE *)v2 + 78))
        {
          v40 = v7;
          v41 = v6;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v9 = v2[5];
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v47;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v47 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "reason");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v8, "objectForKey:", v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue") + 1);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKey:", v17, v14);

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
            }
            while (v11);
          }

          objc_msgSend(v8, "allKeys");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = MEMORY[0x24BDAC760];
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __47__PFPosterPath__lock_descriptionWithDebugInfo___block_invoke;
          v44[3] = &unk_251543E78;
          v20 = v8;
          v45 = v20;
          objc_msgSend(v18, "sortedArrayUsingComparator:", v44);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v42[0] = v19;
          v42[1] = 3221225472;
          v42[2] = __47__PFPosterPath__lock_descriptionWithDebugInfo___block_invoke_2;
          v42[3] = &unk_251543EA0;
          v43 = v20;
          v22 = v20;
          objc_msgSend(v21, "bs_map:", v42);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x24BDD16A8];
          v25 = *((unsigned __int8 *)v2 + 77);
          v26 = *((unsigned __int8 *)v2 + 78);
          objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR(" eCount=%u(%u) eReasons=%@"), v25, v26, v27);
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v7 = v40;
          v6 = v41;
        }
        goto LABEL_18;
      }
      v36 = v2[7];
      if (v36)
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" sURL=%@ sDest=%@"), v2[6], v36);
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" sURL=%@"), v2[6], v38);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" sHandle=%lli"), v2[8], v38);
    }
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_18:
  if (v2[2])
  {
    v28 = (void *)MEMORY[0x24BDD17C8];
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@:%p%@ %@%@%@>"), v30, v2, v6, v2[2], v7, v4);
    v2 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "descriptorIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD17C8];
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v2[4];
    v35 = objc_msgSend(v2[1], "fileSystemRepresentation");
    if (v30)
      objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@:%p%@ descriptor='%@' role='%@' contents='%s'%@%@>"), v33, v2, v6, v30, v34, v35, v7, v4);
    else
      objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@:%p%@ role='%@' contents='%s'%@%@>"), v33, v2, v6, v34, v35, v7, v4, v39);
    v2 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (uint64_t)_isPersistable
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v1 = a1;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 8)
      && *(_QWORD *)(a1 + 16)
      && *(_BYTE *)(a1 + 76) == 2
      && !*(_QWORD *)(a1 + 48)
      && !*(_QWORD *)(a1 + 56))
    {
      v3 = (os_unfair_lock_s *)(a1 + 72);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
      v1 = !*(_BYTE *)(v1 + 79) && !*(_BYTE *)(v1 + 80) && *(_QWORD *)(v1 + 64) == -1;
      os_unfair_lock_unlock(v3);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (uint64_t)_isEqualToPersistable:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  if (a1)
  {
    if (!-[PFPosterPath _isPersistable](a1))
      goto LABEL_9;
    if ((id)a1 == v3)
    {
      a1 = 1;
      goto LABEL_17;
    }
    if (-[PFPosterPath _isPersistable]((uint64_t)v3))
    {
      objc_msgSend((id)a1, "contentsURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "contentsURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        objc_msgSend((id)a1, "role");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "role");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          objc_msgSend((id)a1, "serverIdentity");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "serverIdentity");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualObjects())
          {
            objc_msgSend((id)a1, "descriptorIdentifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "descriptorIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            a1 = BSEqualObjects();

          }
          else
          {
            a1 = 0;
          }

        }
        else
        {
          a1 = 0;
        }

      }
      else
      {
        a1 = 0;
      }

    }
    else
    {
LABEL_9:
      a1 = 0;
    }
  }
LABEL_17:

  return a1;
}

uint64_t __47__PFPosterPath__lock_descriptionWithDebugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v8 == v10)
  {
    v11 = objc_msgSend(v5, "compare:", v6);
  }
  else if (v8 < v10)
  {
    v11 = -1;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

id __47__PFPosterPath__lock_descriptionWithDebugInfo___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:%lu"), v4, objc_msgSend(v5, "unsignedIntegerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)debugDescription
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x249514230](a1, a2);
  os_unfair_lock_lock(&__allPathsLock);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend((id)__cachedServerPathsByIdentityByURL, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v57;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v57 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v8);
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        objc_msgSend(v9, "objectEnumerator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v53;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v53 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v14++));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_85);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v18 = (id)__allPaths;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v49;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v49 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v22);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "containsObject:", v23) & 1) == 0)
          objc_msgSend(v17, "addObject:", v23);
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    }
    while (v20);
  }

  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_89);
  os_unfair_lock_unlock(&__allPathsLock);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("cachedServerPaths = %llu {"), objc_msgSend(v16, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v25 = v16;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v45;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v45 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v29);
        objc_msgSend(v24, "appendString:", CFSTR("\n\t"));
        objc_msgSend(v30, "debugDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "appendString:", v31);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v61, 16);
    }
    while (v27);
  }

  objc_msgSend(v24, "appendFormat:", CFSTR("\n}\notherPaths = %llu {"), objc_msgSend(v17, "count"));
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v32 = v17;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v41;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v41 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v36);
        objc_msgSend(v24, "appendString:", CFSTR("\n\t"));
        objc_msgSend(v37, "debugDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "appendString:", v38);

        ++v36;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v60, 16);
    }
    while (v34);
  }

  objc_msgSend(v24, "appendString:", CFSTR("\n}"));
  objc_autoreleasePoolPop(v2);
  return v24;
}

uint64_t __32__PFPosterPath_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __32__PFPosterPath_debugDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "serverIdentity");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverIdentity");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = objc_msgSend((id)v6, "compare:", v7);
    v10 = -1;
    if (v4 >= v5)
      v10 = 1;
    if (v4 == v5)
      v10 = 0;
    if (v9)
      v11 = v9;
    else
      v11 = v10;
  }
  else
  {
    if (v6)
      v11 = -1;
    else
      v11 = 1;
    if (!(v6 | v7))
    {
      objc_msgSend(v4, "contentsURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentsURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "absoluteString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "compare:", v15);

      if (!v11)
      {
        if (v4 == v5)
        {
          v11 = 0;
        }
        else if (v4 < v5)
        {
          v11 = -1;
        }
        else
        {
          v11 = 1;
        }
      }
    }
  }

  return v11;
}

+ (id)temporaryDescriptorPathWithIdentifier:(id)a3 role:(id)a4
{
  id v5;
  id v6;
  id v7;
  PFPosterPath *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  NSClassFromString(CFSTR("NSString"));
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath temporaryDescriptorPathWithIdentifier:role:].cold.1();
LABEL_13:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463B430);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath temporaryDescriptorPathWithIdentifier:role:].cold.1();
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463B494);
  }

  if ((PFPosterRoleIsValid(v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PFPosterRoleIsValid(role)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath temporaryDescriptorPathWithIdentifier:role:].cold.2();
    goto LABEL_13;
  }
  v8 = [PFPosterPath alloc];
  PFTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:]((uint64_t)PFPosterPath, v9, CFSTR("com.apple.posterkit.provider.path.descriptor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v8, v10, v6, 1, 0, v7, -1, 0, 0);
  v12 = v11;

  return v12;
}

+ (id)temporaryPathForRole:(id)a3
{
  id v3;
  PFPosterPath *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id result;
  void *v10;

  v3 = a3;
  if ((PFPosterRoleIsValid(v3) & 1) != 0)
  {
    v4 = [PFPosterPath alloc];
    PFTemporaryDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PFPosterPath _temporaryDirectoryURLWithContainerPath:basenamePrefix:]((uint64_t)PFPosterPath, v5, CFSTR("com.apple.posterkit.provider.path.generic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](v4, v6, v3, 1, 0, 0, -1, 0, 0);
    v8 = v7;

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PFPosterRoleIsValid(role)"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[PFPosterPath temporaryPathForRole:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)temporaryPathForURL:(id)a3 role:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:]([PFPosterPath alloc], v6, v5, 0, 0, 0, -1, 0, 0);
  v8 = v7;

  return v8;
}

- (BOOL)copyContentsOfPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v12;
  id v13;
  id v14;
  BOOL v15;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "role");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFPosterPath temporaryPathForRole:](PFPosterPath, "temporaryPathForRole:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __41__PFPosterPath_copyContentsOfPath_error___block_invoke;
  v19[3] = &unk_251543F70;
  v10 = v7;
  v20 = v10;
  v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2495143E0](v19);
  v18 = 0;
  v12 = ((uint64_t (**)(_QWORD, id, void *, id *))v11)[2](v11, v6, v9, &v18);
  v13 = v18;
  v14 = v13;
  if (v12 && !v13)
  {
    v17 = 0;
    LOBYTE(v12) = ((uint64_t (**)(_QWORD, id, PFPosterPath *, id *))v11)[2](v11, v6, self, &v17);
    v14 = v17;
  }
  objc_msgSend(v9, "invalidate");
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);
  if (v14)
    v15 = 0;
  else
    v15 = v12;

  return v15;
}

uint64_t __41__PFPosterPath_copyContentsOfPath_error___block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD *v29;
  void *v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  const __CFString *v45;
  _BYTE v46[128];
  uint64_t v47;

  v29 = a4;
  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  v8 = *(void **)(a1 + 32);
  v30 = v6;
  objc_msgSend(v6, "contentsURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __41__PFPosterPath_copyContentsOfPath_error___block_invoke_104;
  v37[3] = &unk_251543F48;
  v37[4] = &v38;
  objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, 0, 17, v37);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(obj);
        if (v39[5])
          goto LABEL_18;
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v14, "relativePath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "contentsURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "fileURLWithPath:relativeToURL:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "absoluteURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "checkResourceIsReachableAndReturnError:", 0))
          objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", v19, 0);
        v20 = *(void **)(a1 + 32);
        v32 = 0;
        v21 = objc_msgSend(v20, "copyItemAtURL:toURL:error:", v14, v19, &v32, v29);
        v22 = v32;
        v23 = v22;
        if ((v21 & 1) == 0)
        {
          if (v22)
          {
            *v29 = objc_retainAutorelease(v22);
          }
          else
          {
            v25 = (void *)MEMORY[0x24BDD1540];
            v44 = *MEMORY[0x24BDD0FD8];
            v45 = CFSTR("Unable to copy files");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "pf_errorWithCode:userInfo:", 1, v26);
            v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *v29 = v27;

          }
LABEL_18:
          v24 = 0;
          goto LABEL_19;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      v24 = 1;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v24 = 1;
  }
LABEL_19:

  _Block_object_dispose(&v38, 8);
  return v24;
}

uint64_t __41__PFPosterPath_copyContentsOfPath_error___block_invoke_104(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

- (NSURL)containerURL
{
  return -[NSURL URLByDeletingLastPathComponent](self->_contentsURL, "URLByDeletingLastPathComponent");
}

- (NSString)role
{
  void *role;
  void *v4;
  NSString *v5;

  -[PFServerPosterIdentity role](self->_serverIdentity, "role");
  role = (void *)objc_claimAutoreleasedReturnValue();
  v4 = role;
  if (!role)
    role = self->_role;
  v5 = role;

  return v5;
}

- (BOOL)ensureContentsURLIsReachableAndReturnError:(id *)a3
{
  void *v5;
  NSURL *contentsURL;
  BOOL v7;
  id v8;
  char v9;
  NSURL *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;
  id v16;

  v5 = (void *)objc_opt_new();
  contentsURL = self->_contentsURL;
  v16 = 0;
  v7 = -[NSURL checkResourceIsReachableAndReturnError:](contentsURL, "checkResourceIsReachableAndReturnError:", &v16);
  v8 = v16;
  if (v7)
  {
    v9 = 1;
  }
  else
  {
    v10 = self->_contentsURL;
    PFPosterPathFileAttributes();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v9 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, v11, &v15);
    v12 = v15;

    if ((v9 & 1) == 0 && a3)
    {
      if (v12)
        v13 = v12;
      else
        v13 = v8;
      *a3 = objc_retainAutorelease(v13);
    }

  }
  return v9;
}

- (int64_t)compareDescriptorIdentifiers:(id)a3
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int64_t v10;

  objc_msgSend(a3, "descriptorIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_2515444D8;
  -[PFPosterPath descriptorIdentifier](self, "descriptorIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_2515444D8;
  v10 = -[__CFString compare:](v6, "compare:", v9);

  return v10;
}

- (id)loadUserInfoWithError:(id *)a3
{
  PFPosterPath *v4;
  NSDictionary *userInfo;
  NSDictionary *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *v13;

  v4 = self;
  objc_sync_enter(v4);
  userInfo = v4->_userInfo;
  if (userInfo)
  {
    v6 = userInfo;
  }
  else
  {
    -[NSURL URLByAppendingPathComponent:isDirectory:](v4->_contentsURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.contents.userInfo"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pf_loadFromPlistWithError:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    v10 = v8;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    v13 = v4->_userInfo;
    v4->_userInfo = v12;

    v6 = v4->_userInfo;
  }
  objc_sync_exit(v4);

  return v6;
}

- (BOOL)storeUserInfo:(id)a3 error:(id *)a4
{
  id v7;
  PFPosterPath *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *userInfo;
  int v12;
  void *v13;
  NSDictionary *v14;
  NSObject *v15;
  id v16;
  void *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  PFPosterPath *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (v7)
  {
    NSClassFromString(CFSTR("NSDictionary"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[PFPosterPath storeUserInfo:error:].cold.1(a2);
      objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x24463C064);
    }
  }

  v8 = self;
  objc_sync_enter(v8);
  -[NSURL URLByAppendingPathComponent:isDirectory:](v8->_contentsURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.posterkit.provider.contents.userInfo"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (-[PFPosterPath ensureContentsURLIsReachableAndReturnError:](v8, "ensureContentsURLIsReachableAndReturnError:", a4)&& objc_msgSend(v9, "pf_storeToPlist:error:", v7, a4))
    {
      v10 = objc_msgSend(v7, "copy");
      userInfo = v8->_userInfo;
      v8->_userInfo = (NSDictionary *)v10;

      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    v13 = (void *)objc_opt_new();
    v12 = objc_msgSend(v13, "removeItemAtURL:error:", v9, a4);

    v14 = v8->_userInfo;
    v8->_userInfo = 0;

    PFLogPosterContents();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v16 = *a4;
      else
        v16 = 0;
      *(_DWORD *)buf = 67240706;
      v20 = v12;
      v21 = 2114;
      v22 = v16;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_24462A000, v15, OS_LOG_TYPE_DEFAULT, "erasing userInfo: %{public}i %{public}@ (path=%@)", buf, 0x1Cu);
    }

  }
  objc_sync_exit(v8);

  return v12;
}

- (id)extendValidityForReason:(id)a3
{
  id v5;
  int lock_validityExtensions;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  NSHashTable *lock_allExtensions;
  NSHashTable *v15;
  NSHashTable *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_validityExtensions = self->_lock_validityExtensions;
  if (self->_lock_invalidated && lock_validityExtensions == 0)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    -[PFPosterPath _lock_descriptionWithDebugInfo:]((const os_unfair_lock *)self, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("cannot extend validity after invalidation of %@"), v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFPosterPath extendValidityForReason:].cold.1();
LABEL_22:
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463C254);
  }
  if (lock_validityExtensions == 255)
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    -[PFPosterPath _lock_descriptionWithDebugInfo:]((const os_unfair_lock *)self, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("validity overflow of %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFPosterPath extendValidityForReason:].cold.2();
    goto LABEL_22;
  }
  if (self->_lock_sandboxExtensionHandle == -1 && (self->_options & 3) == 2)
  {
    v12 = 0;
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x24BE0BE98]);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __40__PFPosterPath_extendValidityForReason___block_invoke;
    v23[3] = &unk_251543F98;
    v23[4] = self;
    v23[5] = a2;
    v12 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", v11, v5, v23);

    v13 = self->_lock_validityExtensions + 1;
    self->_lock_validityExtensions = v13;
    if (self->_lock_validityExtensionsHigh < v13)
      self->_lock_validityExtensionsHigh = v13;
    lock_allExtensions = self->_lock_allExtensions;
    if (!lock_allExtensions)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v15 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v16 = self->_lock_allExtensions;
      self->_lock_allExtensions = v15;

      lock_allExtensions = self->_lock_allExtensions;
    }
    -[NSHashTable addObject:](lock_allExtensions, "addObject:", v12);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v12;
}

void __40__PFPosterPath_extendValidityForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (uint64_t *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 72));
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 77))
  {
    *(_BYTE *)(v4 + 77) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 77) - 1;
    objc_msgSend(*(id *)(*v3 + 40), "removeObject:", v9);
    if (!objc_msgSend(*(id *)(*v3 + 40), "count"))
    {
      v5 = *(void **)(*v3 + 40);
      *(_QWORD *)(*v3 + 40) = 0;

    }
    -[PFPosterPath _lock_purgeIfPossible](*v3);
    os_unfair_lock_unlock((os_unfair_lock_t)(*v3 + 72));

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[PFPosterPath _lock_descriptionWithDebugInfo:]((const os_unfair_lock *)v4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("validity underflow of %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __40__PFPosterPath_extendValidityForReason___block_invoke_cold_1();
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (id)extendContentsReadAccessToAuditToken:(id)a3 error:(id *)a4
{
  return -[PFPosterPath _extendReadAccessForURL:toAuditToken:error:]((void **)&self->super.isa, self->_contentsURL, a3, a4);
}

+ (void)_setDisableUniquing:(BOOL)a3
{
  __disableUniquing_0 = a3;
}

- (BOOL)isServerPosterPath
{
  return 0;
}

- (uint64_t)_initDecodedWithContentsURL:(void *)a3 role:(void *)a4 serverIdentity:(void *)a5 descriptorIdentifier:(uint64_t)a6 sandboxExtensionHandle:
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  void *v21;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!a1)
    goto LABEL_7;
  if ((PFPosterRoleIsValid(v12) & 1) != 0)
  {
    v15 = objc_opt_class();
    if (v11)
    {
      if (v15 == objc_opt_class())
      {
        if (!v13 || v14)
          goto LABEL_6;
        if (a6 == -1)
        {
          +[PFServerPosterPath _cachedPathWithContentsURL:identity:allocedInstance:]((uint64_t)PFServerPosterPath, v11, v13, a1);
          v18 = objc_claimAutoreleasedReturnValue();

          goto LABEL_14;
        }
        -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](a1, v11, v12, 2, v13, 0, a6, 0, 0);
      }
      else
      {
        if (v13)
          goto LABEL_6;
        -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](a1, v11, v12, 2, 0, v14, a6, 0, 0);
      }
      v18 = v19;
      goto LABEL_14;
    }
LABEL_6:
    -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](a1, 0, v12, 2, 0, 0, -1, 0, 0);
    v17 = (void *)v16;
    -[PFPosterPath _invalidate](v16);

LABEL_7:
    v18 = 0;
LABEL_14:

    return v18;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("PFPosterRoleIsValid(role)"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[PFPosterPath _initDecodedWithContentsURL:role:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:].cold.1();
  objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (uint64_t)_sandboxExtensionLevel
{
  if (a1)
    return *MEMORY[0x24BDAC000];
  else
    return 0;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  BSAuditToken *sandboxExtensionAuditToken;
  BSAuditToken *v6;
  const char *v7;
  char *v8;
  xpc_object_t v9;
  NSObject *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char __strerrbuf[256];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentsURL, CFSTR("c"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serverIdentity, CFSTR("i"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_descriptorIdentifier, CFSTR("d"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_role, CFSTR("r"));
  if (self->_sandboxExtensionURL)
  {
    *__error() = 0;
    sandboxExtensionAuditToken = self->_sandboxExtensionAuditToken;
    -[NSURL fileSystemRepresentation](self->_sandboxExtensionURL, "fileSystemRepresentation");
    if (sandboxExtensionAuditToken)
    {
      v6 = self->_sandboxExtensionAuditToken;
      if (v6)
        -[BSAuditToken realToken](v6, "realToken");
      v7 = (const char *)sandbox_extension_issue_file_to_process();
    }
    else
    {
      v7 = (const char *)sandbox_extension_issue_file();
    }
    v8 = (char *)v7;
    if (v7)
    {
      v9 = xpc_string_create(v7);
      free(v8);
      objc_msgSend(v4, "encodeXPCObject:forKey:", v9, CFSTR("t"));
      PFLogPosterContents();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PFPosterPath encodeWithBSXPCCoder:].cold.1();

    }
    else
    {
      v11 = __error();
      strerror_r(*v11, __strerrbuf, 0x100uLL);
      __error();
      v16 = (id)+[PFPosterPath _reportSandboxExtensionError:withCode:reason:]((uint64_t)PFPosterPath, 0, 2, CFSTR("cannot extend access of %@ due to sandbox errno=%i (%s)"), v12, v13, v14, v15, (uint64_t)self);
    }
  }

}

- (PFPosterPath)initWithBSXPCCoder:(id)a3
{
  id v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  PFPosterPath *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  int v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  NSObject *v35;
  int v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  char __strerrbuf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  if (v5 == (objc_class *)objc_opt_class() || v5 == (objc_class *)objc_opt_class())
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("c"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("r"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFF0], CFSTR("t"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v14 = -1;
LABEL_21:
      v8 = (PFPosterPath *)-[PFPosterPath _initDecodedWithContentsURL:role:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:](self, v9, v12, v10, v11, v14);

      goto LABEL_22;
    }
    v38 = v9;
    *__error() = 0;
    xpc_string_get_string_ptr(v13);
    v14 = sandbox_extension_consume();
    objc_msgSend(v10, "descriptorIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v11;
    v18 = v17;

    if (v14 != -1)
    {
      PFLogPosterContents();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v18)
      {
        if (v20)
        {
          NSStringFromClass(v5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__strerrbuf = 138413058;
          v52 = v13;
          v53 = 2114;
          v54 = v21;
          v55 = 2114;
          v56 = v18;
          v57 = 2114;
          v58 = v38;
          v22 = "consumed bsxpc decoded sandboxToken %@ : <%{public}@ %{public}@ path=%{public}@>";
          v23 = v19;
          v24 = 42;
LABEL_24:
          _os_log_debug_impl(&dword_24462A000, v23, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)__strerrbuf, v24);

        }
      }
      else if (v20)
      {
        NSStringFromClass(v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__strerrbuf = 138412802;
        v52 = v13;
        v53 = 2114;
        v54 = v21;
        v55 = 2114;
        v56 = v38;
        v22 = "consumed bsxpc decoded sandboxToken %@ : <%{public}@ path=%{public}@>";
        v23 = v19;
        v24 = 32;
        goto LABEL_24;
      }

LABEL_20:
      v9 = v38;
      goto LABEL_21;
    }
    v25 = __error();
    strerror_r(*v25, __strerrbuf, 0x100uLL);
    PFLogPosterContents();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v27)
      {
        v37 = v18;
        v28 = v26;
        v29 = *__error();
        NSStringFromClass(v5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v40 = v13;
        v41 = 1024;
        v42 = v29;
        v26 = v28;
        v18 = v37;
        v43 = 2082;
        v44 = __strerrbuf;
        v45 = 2114;
        v46 = v30;
        v47 = 2114;
        v48 = v37;
        v49 = 2114;
        v50 = v38;
        v31 = "failed to consume sandboxToken %@ from bsxpc with errno=%i (%{public}s) : <%{public}@ %{public}@ path=%{public}@>";
        v32 = v26;
        v33 = 58;
LABEL_26:
        _os_log_error_impl(&dword_24462A000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);

      }
    }
    else if (v27)
    {
      v35 = v26;
      v36 = *__error();
      NSStringFromClass(v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v40 = v13;
      v41 = 1024;
      v42 = v36;
      v26 = v35;
      v43 = 2082;
      v44 = __strerrbuf;
      v45 = 2114;
      v46 = v30;
      v47 = 2114;
      v18 = 0;
      v48 = v38;
      v31 = "failed to consume sandboxToken %@ from bsxpc with errno=%i (%{public}s) : <%{public}@ path=%{public}@>";
      v32 = v26;
      v33 = 48;
      goto LABEL_26;
    }

    goto LABEL_20;
  }
  -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](self, 0, 0, 2, 0, 0, -1, 0, 0);
  v7 = (void *)v6;
  -[PFPosterPath _invalidate](v6);

  v8 = 0;
LABEL_22:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  char isKindOfClass;
  BSAuditToken *sandboxExtensionAuditToken;
  BSAuditToken *v7;
  const char *v8;
  char *v9;
  xpc_object_t v10;
  NSObject *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  char __strerrbuf[256];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0 && (-[PFPosterPath _isPersistable]((uint64_t)self) & 1) == 0)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@:%p> can only be encoded by %@ rather than %@ : %@"), v28, self, v30, v32, self);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFPosterPath encodeWithCoder:].cold.3();
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463D3B0);
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentsURL, CFSTR("c"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serverIdentity, CFSTR("i"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_descriptorIdentifier, CFSTR("d"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_role, CFSTR("r"));
  if (self->_sandboxExtensionURL)
  {
    if ((isKindOfClass & 1) == 0)
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@:%p> requires %@ rather than %@ : %@"), v20, self, v22, v24, self);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[PFPosterPath encodeWithCoder:].cold.2();
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x24463D300);
    }
    *__error() = 0;
    sandboxExtensionAuditToken = self->_sandboxExtensionAuditToken;
    -[NSURL fileSystemRepresentation](self->_sandboxExtensionURL, "fileSystemRepresentation");
    if (sandboxExtensionAuditToken)
    {
      v7 = self->_sandboxExtensionAuditToken;
      if (v7)
        -[BSAuditToken realToken](v7, "realToken");
      v8 = (const char *)sandbox_extension_issue_file_to_process();
    }
    else
    {
      v8 = (const char *)sandbox_extension_issue_file();
    }
    v9 = (char *)v8;
    if (v8)
    {
      v10 = xpc_string_create(v8);
      free(v9);
      objc_msgSend(v4, "encodeXPCObject:forKey:", v10, CFSTR("t"));
      PFLogPosterContents();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PFPosterPath encodeWithCoder:].cold.1();

    }
    else
    {
      v12 = __error();
      strerror_r(*v12, __strerrbuf, 0x100uLL);
      __error();
      v17 = (id)+[PFPosterPath _reportSandboxExtensionError:withCode:reason:]((uint64_t)PFPosterPath, 0, 2, CFSTR("cannot extend access of %@ due to sandbox errno=%i (%s)"), v13, v14, v15, v16, (uint64_t)self);
    }
  }

}

- (PFPosterPath)initWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  PFPosterPath *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  int v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  NSObject *v35;
  int v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  char __strerrbuf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  if (v5 == (objc_class *)objc_opt_class() || v5 == (objc_class *)objc_opt_class())
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("c"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("r"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = -1;
LABEL_24:
      v8 = (PFPosterPath *)-[PFPosterPath _initDecodedWithContentsURL:role:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:](self, v9, v12, v10, v11, v14);

      goto LABEL_25;
    }
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFF0], CFSTR("t"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v14 = -1;
LABEL_23:

      goto LABEL_24;
    }
    *__error() = 0;
    v38 = v13;
    xpc_string_get_string_ptr(v13);
    v14 = sandbox_extension_consume();
    objc_msgSend(v10, "descriptorIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v11;
    v18 = v17;

    if (v14 != -1)
    {
      PFLogPosterContents();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (v18)
      {
        if (v20)
        {
          NSStringFromClass(v5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)__strerrbuf = 138413058;
          v52 = v38;
          v53 = 2114;
          v54 = v21;
          v55 = 2114;
          v56 = v18;
          v57 = 2114;
          v58 = v9;
          v22 = "consumed nsxpc decoded sandboxToken %@ : <%{public}@ %{public}@ path=%{public}@>";
          v23 = v19;
          v24 = 42;
LABEL_27:
          _os_log_debug_impl(&dword_24462A000, v23, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)__strerrbuf, v24);

        }
      }
      else if (v20)
      {
        NSStringFromClass(v5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)__strerrbuf = 138412802;
        v52 = v38;
        v53 = 2114;
        v54 = v21;
        v55 = 2114;
        v56 = v9;
        v22 = "consumed nsxpc decoded sandboxToken %@ : <%{public}@ path=%{public}@>";
        v23 = v19;
        v24 = 32;
        goto LABEL_27;
      }

LABEL_22:
      v13 = v38;
      goto LABEL_23;
    }
    v25 = __error();
    strerror_r(*v25, __strerrbuf, 0x100uLL);
    PFLogPosterContents();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v27)
      {
        v37 = v18;
        v28 = v26;
        v29 = *__error();
        NSStringFromClass(v5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v40 = v38;
        v41 = 1024;
        v42 = v29;
        v26 = v28;
        v18 = v37;
        v43 = 2082;
        v44 = __strerrbuf;
        v45 = 2114;
        v46 = v30;
        v47 = 2114;
        v48 = v37;
        v49 = 2114;
        v50 = v9;
        v31 = "failed to consume sandboxToken %@ from nsxpc with errno=%i (%{public}s) : <%{public}@ %{public}@ path=%{public}@>";
        v32 = v26;
        v33 = 58;
LABEL_29:
        _os_log_error_impl(&dword_24462A000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);

      }
    }
    else if (v27)
    {
      v35 = v26;
      v36 = *__error();
      NSStringFromClass(v5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v40 = v38;
      v41 = 1024;
      v42 = v36;
      v26 = v35;
      v18 = 0;
      v43 = 2082;
      v44 = __strerrbuf;
      v45 = 2114;
      v46 = v30;
      v47 = 2114;
      v48 = v9;
      v31 = "failed to consume sandboxToken %@ from nsxpc with errno=%i (%{public}s) : <%{public}@ path=%{public}@>";
      v32 = v26;
      v33 = 48;
      goto LABEL_29;
    }

    goto LABEL_22;
  }
  -[PFPosterPath _initWithContentsURL:role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:](self, 0, 0, 2, 0, 0, -1, 0, 0);
  v7 = (void *)v6;
  -[PFPosterPath _invalidate](v6);

  v8 = 0;
LABEL_25:

  return v8;
}

- (void)invalidate
{
  if ((self->_options & 2) == 0)
    -[PFPosterPath _invalidate]((uint64_t)self);
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PFPosterPath _lock_descriptionWithDebugInfo:]((const os_unfair_lock *)self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (NSString)debugDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PFPosterPath _lock_descriptionWithDebugInfo:]((const os_unfair_lock *)self, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (PFServerPosterIdentity)serverIdentity
{
  return self->_serverIdentity;
}

- (NSURL)contentsURL
{
  return self->_contentsURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionAuditToken, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionURL, 0);
  objc_storeStrong((id *)&self->_lock_allExtensions, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);
  objc_storeStrong((id *)&self->_serverIdentity, 0);
  objc_storeStrong((id *)&self->_contentsURL, 0);
}

- (void)_initWithContentsURL:(const char *)a1 role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  __int16 v4;
  int v5;
  void *v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138413314;
  v6 = v1;
  OUTLINED_FUNCTION_12();
  v7 = 0;
  v8 = v4;
  v9 = CFSTR("PFPosterPath.m");
  v10 = 1024;
  v11 = 156;
  _os_log_error_impl(&dword_24462A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v5, 0x30u);

}

- (void)_initWithContentsURL:(uint64_t)a3 role:options:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:sandboxExtensionURL:sandboxExtensionAuditToken:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_7_2(&dword_24462A000, a2, a3, "created purgeable contents=%{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_9_0();
}

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.1()
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

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.2()
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

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.3()
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

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.4()
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

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.5()
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

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.6()
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

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.7()
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

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.8()
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

+ (void)_temporaryDirectoryURLWithContainerPath:basenamePrefix:.cold.9()
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

+ (void)_reportSandboxExtensionError:withCode:reason:.cold.1()
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

- (void)_extendReadAccessForURL:toAuditToken:error:.cold.1()
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

+ (void)temporaryDescriptorPathWithIdentifier:role:.cold.1()
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

+ (void)temporaryDescriptorPathWithIdentifier:role:.cold.2()
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

+ (void)temporaryPathForRole:.cold.1()
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

- (void)storeUserInfo:(const char *)a1 error:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)extendValidityForReason:.cold.1()
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

- (void)extendValidityForReason:.cold.2()
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

void __40__PFPosterPath_extendValidityForReason___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_7();
  NSStringFromSelector(*(SEL *)(v0 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_initDecodedWithContentsURL:role:serverIdentity:descriptorIdentifier:sandboxExtensionHandle:.cold.1()
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

- (void)encodeWithBSXPCCoder:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_8_1(&dword_24462A000, v0, v1, "created and bsxpc encoded sandboxToken %@ : %@");
  OUTLINED_FUNCTION_9_0();
}

- (void)encodeWithCoder:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_8_1(&dword_24462A000, v0, v1, "created and nsxpc encoded sandboxToken %@ : %@");
  OUTLINED_FUNCTION_9_0();
}

- (void)encodeWithCoder:.cold.2()
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

- (void)encodeWithCoder:.cold.3()
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
