@implementation TVStoreApplicationSetupHelper

- (TVStoreApplicationSetupHelper)init
{
  return -[TVStoreApplicationSetupHelper initWithDefaultBootURL:](self, "initWithDefaultBootURL:", 0);
}

- (TVStoreApplicationSetupHelper)initWithDefaultBootURL:(id)a3
{
  return -[TVStoreApplicationSetupHelper initWithDefaultBootURL:bagCache:](self, "initWithDefaultBootURL:bagCache:", a3, 0);
}

- (TVStoreApplicationSetupHelper)initWithDefaultBootURL:(id)a3 bagCache:(id)a4
{
  id v6;
  id v7;
  TVStoreApplicationSetupHelper *v8;
  IKURLBagCache *v9;
  IKURLBagCache *bagCache;
  uint64_t v11;
  NSURL *defaultBootURL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVStoreApplicationSetupHelper;
  v8 = -[TVStoreApplicationSetupHelper init](&v14, sel_init);
  if (v8)
  {
    if (v7)
    {
      v9 = (IKURLBagCache *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE51A18], "sharedCache");
      v9 = (IKURLBagCache *)objc_claimAutoreleasedReturnValue();
    }
    bagCache = v8->_bagCache;
    v8->_bagCache = v9;

    v11 = objc_msgSend(v6, "copy");
    defaultBootURL = v8->_defaultBootURL;
    v8->_defaultBootURL = (NSURL *)v11;

  }
  return v8;
}

- (void)obtainBootURLWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[TVStoreApplicationSetupHelper bagCache](self, "bagCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__TVStoreApplicationSetupHelper_obtainBootURLWithCompletion___block_invoke;
  v7[3] = &unk_24EB851D8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "loadValueForKey:completion:", CFSTR("itml-app-url"), v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __61__TVStoreApplicationSetupHelper_obtainBootURLWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (id)TVMLKitLogObject;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __61__TVStoreApplicationSetupHelper_obtainBootURLWithCompletion___block_invoke_cold_1((uint64_t)v5, (uint64_t)v6, v9);

      v8 = 0;
    }
    v10 = (void *)objc_opt_class();
    objc_msgSend(WeakRetained, "defaultBootURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bootURLWithBagBootURL:defaultBootURL:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (id)defaultBagBootLaunchContextWithOptions:(id)a3 useCache:(BOOL)a4
{
  return (id)objc_msgSend(a1, "launchContextWithLaunchOptions:bagBootURLKey:useCache:", a3, CFSTR("itml-app-url"), a4);
}

+ (id)launchContextWithLaunchOptions:(id)a3 bagBootURLKey:(id)a4 useCache:(BOOL)a5
{
  return (id)objc_msgSend(a1, "launchContextWithLaunchOptions:bootURL:bagBootURLKey:useCache:", a3, 0, a4, a5);
}

+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4 useCache:(BOOL)a5
{
  return (id)objc_msgSend(a1, "launchContextWithLaunchOptions:bootURL:bagBootURLKey:useCache:", a3, a4, 0, a5);
}

+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4 bagBootURLKey:(id)a5 useCache:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  TVApplicationControllerContext *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init(TVApplicationControllerContext);
  -[TVApplicationControllerContext setBagBootURLKey:](v13, "setBagBootURLKey:", v11);

  -[TVApplicationControllerContext setJavaScriptApplicationURL:](v13, "setJavaScriptApplicationURL:", v10);
  v14 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("reqApp"));

  objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDF7550]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("refApp"));
  objc_msgSend(a1, "_parsedQueryParametersForURL:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
    objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("query"));
  v19 = (void *)objc_msgSend(v14, "copy");
  -[TVApplicationControllerContext setLaunchOptions:](v13, "setLaunchOptions:", v19);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingPathComponent:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVApplicationControllerContext setAppJSCachePath:](v13, "setAppJSCachePath:", v25);

  }
  return v13;
}

+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4
{
  return (id)objc_msgSend(a1, "launchContextWithLaunchOptions:bootURL:useCache:", a3, a4, 0);
}

+ (id)launchContextWithLaunchOptions:(id)a3 bootURL:(id)a4 appLocalBootURL:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR))
    +[TVStoreApplicationSetupHelper launchContextWithLaunchOptions:bootURL:appLocalBootURL:].cold.1(v10);
  objc_msgSend(a1, "launchContextWithLaunchOptions:bootURL:useCache:", v8, v9, a5 != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)preferredBootURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("boot-url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)fallbackBootURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("TVBootURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)bootURLWithBagBootURL:(id)a3 defaultBootURL:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  const char *v10;
  id v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "preferredBootURL");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (id)v7;
    v9 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v8;
      v10 = "Started application with defaults boot-url: %@";
LABEL_7:
      _os_log_impl(&dword_222D98000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v11 = v5;
    if (v11)
    {
      v8 = v11;
      v9 = TVMLKitLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v8;
        v10 = "Started application with URLBag boot-url: %@";
        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "fallbackBootURL");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8)
        v8 = v6;
    }
  }

  return v8;
}

+ (id)_parsedQueryParametersForURL:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v5);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "stringByRemovingPercentEncoding", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("="));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v13, "count") == 2)
          {
            objc_msgSend(v13, "objectAtIndex:", 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndex:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKey:", v14, v15);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v16 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSURL)defaultBootURL
{
  return self->_defaultBootURL;
}

- (void)setDefaultBootURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (IKURLBagCache)bagCache
{
  return self->_bagCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagCache, 0);
  objc_storeStrong((id *)&self->_defaultBootURL, 0);
}

void __61__TVStoreApplicationSetupHelper_obtainBootURLWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  void *v6;
  objc_class *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_222D98000, log, OS_LOG_TYPE_ERROR, "Unexpected type for bagBootURL -> %@: %@", (uint8_t *)&v8, 0x16u);
  if (a1)

}

+ (void)launchContextWithLaunchOptions:(os_log_t)log bootURL:appLocalBootURL:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222D98000, log, OS_LOG_TYPE_ERROR, "appLocalBootURL is no longer in use!", v1, 2u);
}

@end
