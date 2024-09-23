@implementation WBSProcessProxyOverride

+ (void)overrideSystemProxiesIfNeeded:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "stringForKey:", CFSTR("DebugHTTPProxy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v5, "stringForKey:", CFSTR("WebKit2HTTPProxy"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "stringForKey:", CFSTR("DebugHTTPSProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v5, "stringForKey:", CFSTR("WebKit2HTTPSProxy"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[WBSProcessProxyOverride overrideSystemHTTPProxy:HTTPSProxy:](WBSProcessProxyOverride, "overrideSystemHTTPProxy:HTTPSProxy:", v3, v4);

}

+ (void)overrideSystemHTTPProxy:(id)a3 HTTPSProxy:(id)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v13 = (unint64_t)a3;
  v5 = (unint64_t)a4;
  if (v13 | v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "host");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C93220]);
        objc_msgSend(v7, "port");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C93228]);

      }
      else
      {
        NSLog(CFSTR("Malformed HTTP Proxy URL \"%@\".  Expected \"http://<hostname>[:<port>]\"\n"), v13);
      }

    }
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithDataAsString:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "host");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C93238]);
        objc_msgSend(v10, "port");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C93240]);

      }
      else
      {
        NSLog(CFSTR("Malformed HTTPS Proxy URL \"%@\".  Expected \"https://<hostname>[:<port>]\"\n"), v5);
      }

    }
    if (objc_msgSend(v6, "count"))
      _CFNetworkSetOverrideSystemProxySettings();

  }
}

@end
