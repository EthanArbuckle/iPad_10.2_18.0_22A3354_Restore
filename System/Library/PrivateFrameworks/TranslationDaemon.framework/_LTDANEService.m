@implementation _LTDANEService

+ (void)setDataProvider:(Class)a3
{
  _dataProvider = (uint64_t)a3;
}

+ (Class)dataProvider
{
  return (Class)(id)_dataProvider;
}

+ (void)initialize
{
  _dataProvider = objc_opt_class();
}

+ (int64_t)capability
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (!objc_msgSend((id)objc_msgSend(a1, "dataProvider"), "isAvailable"))
    return 0;
  objc_msgSend((id)objc_msgSend(a1, "dataProvider"), "subType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v4 = objc_msgSend(a1, "capabilityForSubType:error:", v3, &v7);
  v5 = v7;

  if (v5)
    return 0;
  else
    return v4;
}

+ (int64_t)capabilityForSubType:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    +[_LTDConfigurationService aneConfigurationWithError:](_LTDConfigurationService, "aneConfigurationWithError:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "capabilityForSubType:", v5);
    if (v7)
    {
      v8 = v7;
LABEL_4:
      v9 = 0;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v5, "substringToIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    if (v13 - 1 < 0)
    {
LABEL_12:

    }
    else
    {
      v14 = v13;
      while (1)
      {
        objc_msgSend(v12, "objectAtIndex:", --v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "hasPrefix:", v11) & 1) != 0)
          break;

        if (v14 <= 0)
          goto LABEL_12;
      }
      v8 = objc_msgSend(v6, "capabilityForSubType:", v15);

      if (v8)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 1, CFSTR("Unhandled ANE subtype"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v16 = _LTOSLogAssets();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      +[_LTDANEService capabilityForSubType:error:].cold.2();
      if (a4)
        goto LABEL_15;
    }
    else if (a4)
    {
LABEL_15:
      v9 = objc_retainAutorelease(v9);
      v8 = 0;
      *a4 = v9;
      goto LABEL_22;
    }
    v8 = 0;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 1, CFSTR("Unhandled ANE subtype"), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    +[_LTDANEService capabilityForSubType:error:].cold.1();
    if (a4)
      goto LABEL_7;
LABEL_19:
    v8 = 0;
    goto LABEL_23;
  }
  if (!a4)
    goto LABEL_19;
LABEL_7:
  v9 = objc_retainAutorelease(v9);
  v8 = 0;
  *a4 = v9;
LABEL_23:

  return v8;
}

+ (void)capabilityForSubType:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Invalid ANE subtype, assuming none for %{public}@: %@");
}

+ (void)capabilityForSubType:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "Unhandled ANE subtype, assuming none for %{public}@: %@");
}

@end
