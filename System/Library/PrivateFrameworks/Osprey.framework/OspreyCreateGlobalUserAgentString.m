@implementation OspreyCreateGlobalUserAgentString

void __OspreyCreateGlobalUserAgentString_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "infoDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0C9AE78]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "processName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    ospreyDeviceName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ospreyProductType();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ospreyProductName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ospreyProductVersion();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ospreyBuildVersion();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0C9AE88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0C9AE90]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ (%@/%@; %@/%@/%@; %@/%@)"), v3, v4, v5, v6, v7, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)OspreyCreateGlobalUserAgentString_globalUserAgent;
    OspreyCreateGlobalUserAgentString_globalUserAgent = v11;

    if (!v2)
    {

    }
    OspreyLoggingInit();
    v13 = OspreyLogContextRequest;
    if (os_log_type_enabled((os_log_t)OspreyLogContextRequest, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "OspreyCreateGlobalUserAgentString_block_invoke";
      v21 = 2112;
      v22 = OspreyCreateGlobalUserAgentString_globalUserAgent;
      _os_log_impl(&dword_1B97C2000, v13, OS_LOG_TYPE_INFO, "%s User agent string: %@", buf, 0x16u);
    }
  }
  else
  {
    OspreyLoggingInit();
    v14 = OspreyLogContextRequest;
    if (os_log_type_enabled((os_log_t)OspreyLogContextRequest, OS_LOG_TYPE_ERROR))
      __OspreyCreateGlobalUserAgentString_block_invoke_cold_1(v14);
  }

}

void __OspreyCreateGlobalUserAgentString_block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "OspreyCreateGlobalUserAgentString_block_invoke";
  _os_log_error_impl(&dword_1B97C2000, log, OS_LOG_TYPE_ERROR, "%s Info.plist not found in main bundle.", (uint8_t *)&v1, 0xCu);
}

@end
