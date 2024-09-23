@implementation NSURL(PosterFoundation)

+ (id)pf_temporaryDirectoryURL
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDBCF48];
  PFTemporaryDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:isDirectory:", v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)pf_posterPathTypeURLForProviderURL:()PosterFoundation type:
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  NSClassFromString(CFSTR("NSURL"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[NSURL(PosterFoundation) pf_posterPathTypeURLForProviderURL:type:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x24463296CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSURLClass]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[NSURL(PosterFoundation) pf_posterPathTypeURLForProviderURL:type:].cold.1();
    goto LABEL_9;
  }

  PFServerPosterTypeToDirectoryName(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)pf_posterPathIdentifierURLProviderURL:()PosterFoundation type:posterUUID:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v8 = a3;
  v9 = a5;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[NSURL(PosterFoundation) pf_posterPathIdentifierURLProviderURL:type:posterUUID:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244632B00);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[NSURL(PosterFoundation) pf_posterPathIdentifierURLProviderURL:type:posterUUID:].cold.1();
    goto LABEL_9;
  }

  objc_msgSend(a1, "pf_posterPathTypeURLForProviderURL:type:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)pf_posterPathVersionsURLForProviderURL:()PosterFoundation type:posterUUID:
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pf_posterPathIdentifierURLProviderURL:type:posterUUID:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("versions"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)pf_posterPathInstanceURLForProviderURL:()PosterFoundation type:posterUUID:version:
{
  void *v8;
  void *v9;

  objc_msgSend(a1, "pf_posterPathVersionsURLForProviderURL:type:posterUUID:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pf_posterPathInstanceURLForVersionsURL:version:", v8, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)pf_posterPathInstanceURLForVersionsURL:()PosterFoundation version:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%llu"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)pf_posterPathContentsURLForProviderURL:()PosterFoundation type:posterUUID:version:
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pf_posterPathInstanceURLForProviderURL:type:posterUUID:version:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pf_posterPathContentsURLForInstanceURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)pf_posterPathContentsURLForInstanceURL:()PosterFoundation
{
  return objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("contents"), 1);
}

+ (uint64_t)pf_posterPathSupplementContainerURLForInstanceURL:()PosterFoundation
{
  return objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("supplements"));
}

+ (id)pf_posterPathSupplementURLForInstanceURL:()PosterFoundation supplement:
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "pf_posterPathSupplementContainerURLForInstanceURL:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)pf_loadFromPlistWithError:()PosterFoundation
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id result;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  if ((objc_msgSend(a1, "isFileURL") & 1) != 0)
  {
    v6 = (void *)MEMORY[0x249514230]();
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", a1, 1, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;
    v9 = v8;
    if (v7)
    {
      v18 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v7, 0, 0, &v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v18;
      if (v11)
      {
        PFLogPosterContents();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[NSURL(PosterFoundation) pf_loadFromPlistWithError:].cold.1();

        v13 = v11;
      }

    }
    else
    {
      v11 = v8;
      v10 = 0;
    }

    objc_autoreleasePoolPop(v6);
    if (a3)
    {
      if (v11)
        *a3 = objc_retainAutorelease(v11);
    }

    return v10;
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ must be called on a fileURL : %@"), v16, a1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NSURL(PosterFoundation) pf_loadFromPlistWithError:].cold.2();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (uint64_t)pf_storeToPlist:()PosterFoundation error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("plistable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NSURL(PosterFoundation) pf_storeToPlist:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244633194);
  }
  v8 = v7;
  if ((objc_msgSend(a1, "isFileURL") & 1) == 0)
  {
    v23 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ must be called on a fileURL : %@"), v24, a1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NSURL(PosterFoundation) pf_storeToPlist:error:].cold.4();
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244633208);
  }
  v9 = (void *)MEMORY[0x249514230]();
  v27 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;
  if (v11)
  {
    PFLogPosterContents();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NSURL(PosterFoundation) pf_storeToPlist:error:].cold.3();

    v13 = v11;
  }
  if (v10)
  {
    v26 = 0;
    v14 = objc_msgSend(v10, "writeToURL:options:error:", a1, 268435457, &v26);
    v15 = v26;
    PFLogPosterContents();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[NSURL(PosterFoundation) pf_storeToPlist:error:].cold.2();

      v18 = v15;
      v17 = v11;
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "URLByDeletingLastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v19;
        v30 = 2112;
        v31 = v20;
        _os_log_impl(&dword_24462A000, v17, OS_LOG_TYPE_DEFAULT, "saved '%@'': (path=%@)", buf, 0x16u);

      }
      v18 = v11;
    }

  }
  else
  {
    v14 = 0;
    v18 = v11;
  }

  objc_autoreleasePoolPop(v9);
  if (a4 && v18)
    *a4 = objc_retainAutorelease(v18);

  return v14;
}

+ (void)pf_posterPathTypeURLForProviderURL:()PosterFoundation type:.cold.1()
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

+ (void)pf_posterPathIdentifierURLProviderURL:()PosterFoundation type:posterUUID:.cold.1()
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

- (void)pf_loadFromPlistWithError:()PosterFoundation .cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_10();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_24462A000, v4, v5, "Error during dict-plist deserializing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

- (void)pf_loadFromPlistWithError:()PosterFoundation .cold.2()
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

- (void)pf_storeToPlist:()PosterFoundation error:.cold.1()
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

- (void)pf_storeToPlist:()PosterFoundation error:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_10();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_24462A000, v4, v5, "Error during dict-plist writing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

- (void)pf_storeToPlist:()PosterFoundation error:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_10();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_0(&dword_24462A000, v4, v5, "Error during dict-plist serializing of '%@': %{public}@ (path=%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7_0();
}

- (void)pf_storeToPlist:()PosterFoundation error:.cold.4()
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
