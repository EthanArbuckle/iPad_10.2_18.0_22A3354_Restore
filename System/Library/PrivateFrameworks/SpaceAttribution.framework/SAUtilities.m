@implementation SAUtilities

+ (id)splitArray:(id)a3 into:(int)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  void *v13;

  v5 = a3;
  if (objc_msgSend(v5, "count") < (unint64_t)a4)
  {
    SALog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SAUtilities splitArray:into:].cold.1(v5, a4, v6);
LABEL_15:

    v7 = 0;
    goto LABEL_16;
  }
  if (a4 <= 0)
  {
    SALog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SAUtilities splitArray:into:].cold.2(a4, v6);
    goto LABEL_15;
  }
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(v5, "count");
  v9 = 0;
  v10 = 0;
  v11 = v8 / a4;
  do
  {
    if ((int)v11 >= v8)
      v12 = v8;
    else
      v12 = v11;
    if (v10 >= a4 - 1)
      v12 = v8;
    objc_msgSend(v5, "subarrayWithRange:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);

    v9 += v11;
    ++v10;
    v8 -= v11;
  }
  while (a4 != v10);
LABEL_16:

  return v7;
}

+ (void)getFileSize:(id)a3 reply:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(id, uint64_t, id);
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  __CFString *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCF48];
  v7 = (void (**)(id, uint64_t, id))a4;
  objc_msgSend(v6, "fileURLWithPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v9 = *MEMORY[0x24BDBCC00];
  v16 = 0;
  objc_msgSend(v8, "getResourceValue:forKey:error:", &v17, v9, &v16);
  v10 = v17;
  v11 = v16;
  if (v11)
    v12 = 1;
  else
    v12 = v10 == 0;
  if (v12)
  {
    SALog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" with error %@"), v11);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = &stru_2518F3CC8;
      }
      *(_DWORD *)buf = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = v15;
      _os_log_error_impl(&dword_2478E3000, v13, OS_LOG_TYPE_ERROR, "Failed to get physical size for file (%@)%@", buf, 0x16u);
      if (v11)

    }
    v14 = 0;
  }
  else
  {
    v14 = objc_msgSend(v10, "unsignedLongValue");
  }
  v7[2](v7, v14, v11);

}

+ (id)createCommaSeparatedString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)breakCommaSeparatedStringToComponents:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int)killSADaemon
{
  void *v2;
  int v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setLaunchPath:", CFSTR("/usr/bin/pkill"));
  objc_msgSend(v2, "setArguments:", &unk_2518F7678);
  objc_msgSend(v2, "launchAndReturnError:", 0);
  objc_msgSend(v2, "waitUntilExit");
  v3 = objc_msgSend(v2, "terminationStatus");

  return v3;
}

+ (int)loadSADaemon
{
  void *v2;
  int v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setLaunchPath:", CFSTR("/bin/launchctl"));
  objc_msgSend(v2, "setArguments:", &unk_2518F7690);
  objc_msgSend(v2, "launchAndReturnError:", 0);
  objc_msgSend(v2, "waitUntilExit");
  v3 = objc_msgSend(v2, "terminationStatus");

  return v3;
}

+ (void)splitArray:(NSObject *)a3 into:.cold.1(void *a1, int a2, NSObject *a3)
{
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = 136315650;
  v5 = "+[SAUtilities splitArray:into:]";
  v6 = 1024;
  v7 = a2;
  v8 = 1024;
  v9 = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_2478E3000, a3, OS_LOG_TYPE_ERROR, "%s: number of parts (%d) is higher than the supplied array count (%d). can't split array", (uint8_t *)&v4, 0x18u);
}

+ (void)splitArray:(int)a1 into:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "+[SAUtilities splitArray:into:]";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_2478E3000, a2, OS_LOG_TYPE_ERROR, "%s: number of parts (%d) must be > 0", (uint8_t *)&v2, 0x12u);
}

@end
