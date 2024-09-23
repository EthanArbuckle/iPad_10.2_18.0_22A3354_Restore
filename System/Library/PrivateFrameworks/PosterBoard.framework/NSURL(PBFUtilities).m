@implementation NSURL(PBFUtilities)

- (uint64_t)pbf_isExcludedFromBackup
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, *MEMORY[0x1E0C999D8], 0);
  return objc_msgSend(v2, "BOOLValue");
}

- (uint64_t)pbf_isDirectory
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, *MEMORY[0x1E0C999D0], 0);
  return objc_msgSend(v2, "BOOLValue");
}

- (uint64_t)pbf_setExcludedFromBackup:()PBFUtilities error:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "setResourceValue:forKey:error:", v6, *MEMORY[0x1E0C999D8], a4);

  return v7;
}

- (BOOL)pbf_allowSuspendWithOpenFileHandle
{
  id v1;
  ssize_t v2;
  _BOOL8 result;
  char value;

  value = 0;
  v1 = objc_retainAutorelease(a1);
  v2 = getxattr((const char *)objc_msgSend(v1, "fileSystemRepresentation"), "com.apple.runningboard.can-suspend-locked", 0, 0, 0, 0);
  result = 0;
  if (v2 == 1)
  {
    getxattr((const char *)objc_msgSend(objc_retainAutorelease(v1), "fileSystemRepresentation"), "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
    return value != 0;
  }
  return result;
}

- (BOOL)pbf_setAllowSuspendWithOpenFileHandle:()PBFUtilities error:
{
  char value;

  value = a3 << 31 >> 31;
  return setxattr((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0) == 0;
}

- (uint64_t)pbf_isPurgable
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, *MEMORY[0x1E0C99A08], 0);
  return objc_msgSend(v2, "BOOLValue");
}

- (id)pbf_creationDate
{
  id v1;
  id v3;

  v3 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v3, *MEMORY[0x1E0C998E8], 0);
  v1 = v3;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (BOOL)pbf_setPurgable:()PBFUtilities error:
{
  uint64_t v6;
  id v7;
  const char *v8;
  int v9;
  int v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = 98821;
  if (!a3)
    v6 = 0;
  v26 = v6;
  v7 = objc_retainAutorelease(a1);
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  v9 = open(v8, 0);
  if (v9 < 0)
  {
    PBFLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[NSURL(PBFUtilities) pbf_setPurgable:error:].cold.1((uint64_t)v8, v19);

    if (a4)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2FE0];
      v22 = *__error();
      v33 = *MEMORY[0x1E0CB2AA0];
      objc_msgSend(v7, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    v10 = v9;
    v11 = ffsctl(v9, 0xC0084A44uLL, &v26, 0);
    v12 = (_DWORD)v11 == 0;
    if ((_DWORD)v11)
    {
      v13 = v11;
      PBFLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v28 = v7;
        v29 = 1024;
        v30 = a3;
        v31 = 1024;
        v32 = v13;
        _os_log_error_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_ERROR, "Error marking '%{public}@' as purgable: %{BOOL}u - %{darwin.errno}d", buf, 0x18u);
      }

      if (a4)
      {
        v15 = (void *)objc_opt_new();
        objc_msgSend(v7, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v7, "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB3300]);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("errno"));

        objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 0, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    close(v10);
  }
  return v12;
}

- (uint64_t)pbf_setFileProtection:()PBFUtilities error:
{
  id v6;
  uint64_t v7;
  void *v9;

  v6 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[NSURL(PBFUtilities) pbf_setFileProtection:error:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA94D2CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[NSURL(PBFUtilities) pbf_setFileProtection:error:].cold.1();
    goto LABEL_9;
  }

  v7 = objc_msgSend(a1, "setResourceValue:forKey:error:", v6, *MEMORY[0x1E0C99938], a4);
  return v7;
}

- (id)pbf_fileProtectionType
{
  id v2;

  v2 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v2, *MEMORY[0x1E0C99938], 0);
  return v2;
}

- (BOOL)pbf_unarchiveToURL:()PBFUtilities error:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BOMCopierNew();
  objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  v5 = objc_retainAutorelease(v4);
  objc_msgSend(v5, "fileSystemRepresentation");

  v6 = *MEMORY[0x1E0C9AE50];
  v9[0] = CFSTR("extractPKZip");
  v9[1] = CFSTR("sequesterResources");
  v10[0] = v6;
  v10[1] = v6;
  v9[2] = CFSTR("copyResources");
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = BOMCopierCopyWithOptions();
  BOMCopierFree();

  return (_DWORD)a1 == 0;
}

- (void)pbf_setPurgable:()PBFUtilities error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = 136315394;
  v6 = a1;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "Fail to open %s %{darwin.errno}d", (uint8_t *)&v5, 0x12u);
}

- (void)pbf_setFileProtection:()PBFUtilities error:.cold.1()
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
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
