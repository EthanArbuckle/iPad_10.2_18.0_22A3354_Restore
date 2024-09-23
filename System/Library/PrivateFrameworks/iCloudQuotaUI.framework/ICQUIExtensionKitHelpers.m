@implementation ICQUIExtensionKitHelpers

+ (BOOL)isExtensionKitFlagEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isExtensionKitURL:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v3, 1);
    -[NSObject queryItems](v18, "queryItems");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v9, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("useExtensionKit")) & 1) != 0)
          {
            objc_msgSend(v9, "value");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("false"));

            if (v12)
            {
              _ICQGetLogSystem();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v24 = v3;
                _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Upsell URL ExtensionKit query param is set to false in URL: %@", buf, 0xCu);
              }

              v13 = 0;
              goto LABEL_22;
            }
          }
          else
          {

          }
        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v6)
          continue;
        break;
      }
    }

    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v3;
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Upsell URL does not contain ExtensionKit query param, defaulting to new ExtensionKit flow. URL: %@", buf, 0xCu);
    }
    v13 = 1;
LABEL_22:
    v14 = v18;

  }
  else
  {
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[ICQUIExtensionKitHelpers isExtensionKitURL:].cold.1(v14);
    v13 = 0;
  }

  return v13;
}

+ (BOOL)isExtensionKitProcess
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.iCloudQuotaUI.RemoteiCloudQuotaUI"));

  return v4;
}

+ (void)isExtensionKitURL:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "+[ICQUIExtensionKitHelpers isExtensionKitURL:]";
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "nil URL was passed to %s", (uint8_t *)&v1, 0xCu);
}

@end
