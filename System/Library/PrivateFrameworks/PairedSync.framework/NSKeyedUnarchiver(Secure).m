@implementation NSKeyedUnarchiver(Secure)

+ (id)secureUnarchiveObjectOfClasses:()Secure withFile:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if (v9)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v7, 0, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    if (v11)
    {
      psd_log();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (v13)
      {
        psd_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          +[NSKeyedUnarchiver(Secure) secureUnarchiveObjectOfClasses:withFile:].cold.1((uint64_t)v7, v11, v14);

      }
      v15 = 0;
    }
    else
    {
      objc_msgSend(a1, "secureUnarchiveObjectOfClasses:withData:", v6, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)secureUnarchiveObjectOfClasses:()Secure withData:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend([a1 alloc], "initForReadingFromData:error:", v7, 0);
  objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v6, *MEMORY[0x24BDD0E88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishDecoding");
  v10 = v9;

  return v10;
}

+ (void)secureUnarchiveObjectOfClasses:()Secure withFile:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "psy_safeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_0_0(&dword_20CFE4000, a3, v6, "Failed to read data from file %{public}@ with error %{public}@", (uint8_t *)&v7);

}

+ (void)secureUnarchiveObjectOfClasses:()Secure withData:.cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_0(&dword_20CFE4000, a4, a3, "Failed to unarchive data of type %{public}@ with exception %{public}@", (uint8_t *)a3);

}

@end
