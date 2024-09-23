@implementation IOKRegistryEntry(daemon_iokit_get_property_proxy)

- (id)iodProperties
{
  id v2;
  void *v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (InitIORegistryPropertyProxy_onceToken != -1)
    dispatch_once(&InitIORegistryPropertyProxy_onceToken, &__block_literal_global_0);
  if (gIORegistryProxyEnabled)
  {
    v2 = (id)gProxyDaemonServiceClient;
    if (v2)
    {
      objc_msgSend(v2, "propertiesForRegistryEntryID:", objc_msgSend(a1, "entryID"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136316418;
        v6 = "daemonServiceClient != nil";
        v7 = 2048;
        v8 = 0;
        v9 = 2048;
        v10 = 0;
        v11 = 2080;
        v12 = "";
        v13 = 2080;
        v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/IOKRegistryEntryExtendedFramework.m";
        v15 = 1024;
        v16 = 51;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
      }
      v3 = 0;
    }

  }
  else
  {
    objc_msgSend(a1, "properties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)iodPropertyForKey:()daemon_iokit_get_property_proxy
{
  id v4;
  id v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (InitIORegistryPropertyProxy_onceToken != -1)
    dispatch_once(&InitIORegistryPropertyProxy_onceToken, &__block_literal_global_0);
  if (gIORegistryProxyEnabled)
  {
    v5 = (id)gProxyDaemonServiceClient;
    if (v5)
    {
      objc_msgSend(v5, "propertyForRegistryEntryID:key:", objc_msgSend(a1, "entryID"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136316418;
        v9 = "daemonServiceClient != nil";
        v10 = 2048;
        v11 = 0;
        v12 = 2048;
        v13 = 0;
        v14 = 2080;
        v15 = "";
        v16 = 2080;
        v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/IOKRegistryEntryExtendedFramework.m";
        v18 = 1024;
        v19 = 72;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
      }
      v6 = 0;
    }

  }
  else
  {
    objc_msgSend(a1, "propertyForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end
