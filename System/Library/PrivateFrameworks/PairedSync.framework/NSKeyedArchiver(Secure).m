@implementation NSKeyedArchiver(Secure)

+ (id)secureArchivedDataWithRootObject:()Secure
{
  id v3;
  void *v4;
  id v5;
  id v7;

  v3 = a3;
  if (v3)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if (v5)
      objc_exception_throw(objc_retainAutorelease(v5));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (uint64_t)secureArchiveRootObject:()Secure toFile:
{
  return objc_msgSend(a1, "secureArchiveRootObject:toFile:withOptions:", a3, a4, 1);
}

+ (uint64_t)secureArchiveRootObject:()Secure toFile:withOptions:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v30;
  objc_class *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "secureArchivedDataWithRootObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "stringByDeletingLastPathComponent");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

    if ((v13 & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend(v22, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v35);
      v14 = v35;

      if (v14)
      {
        psd_log();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

        if (v24)
        {
          psd_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "psy_safeDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v37 = v30;
            v38 = 2114;
            v39 = v11;
            v40 = 2112;
            v41 = v32;
            _os_log_error_impl(&dword_20CFE4000, v25, OS_LOG_TYPE_ERROR, "Error (%{public}@) creating directory (%{public}@) for (%@)", buf, 0x20u);

          }
        }
      }
    }

    v34 = 0;
    v18 = objc_msgSend(v10, "writeToFile:options:error:", v9, a5, &v34);
    v21 = v34;
    if (v21)
    {
      psd_log();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

      if (v27)
      {
        psd_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          +[NSKeyedArchiver(Secure) secureArchiveRootObject:toFile:withOptions:].cold.2(v21);

      }
    }
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "fileExistsAtPath:", v9);

  if (!v16)
  {
    v18 = 1;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v17, "removeItemAtPath:error:", v9, &v33);
  v11 = v33;

  v18 = v11 == 0;
  if (v11)
  {
    psd_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (!v20)
    {
      v18 = 0;
      goto LABEL_21;
    }
    psd_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[NSKeyedArchiver(Secure) secureArchiveRootObject:toFile:withOptions:].cold.1(v11);
    v18 = 0;
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  return v18;
}

+ (void)secureArchiveRootObject:()Secure toFile:withOptions:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "psy_safeDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_20CFE4000, v2, v3, "Error (%{public}@) deleting file (%{public}@)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

+ (void)secureArchiveRootObject:()Secure toFile:withOptions:.cold.2(void *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "psy_safeDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_20CFE4000, v3, v4, "Error (%{public}@) writing encoded data for (%@)", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1();
}

@end
