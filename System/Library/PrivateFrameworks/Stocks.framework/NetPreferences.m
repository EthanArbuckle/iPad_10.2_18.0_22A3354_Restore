@implementation NetPreferences

+ (id)sharedPreferences
{
  id v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&_accessLock);
  if (!_instance)
  {
    v2 = objc_alloc_init((Class)objc_opt_class());
    v3 = (void *)_instance;
    _instance = (uint64_t)v2;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_accessLock);
  return (id)_instance;
}

+ (void)clearSharedPreferences
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_accessLock);
  v2 = (void *)_instance;
  _instance = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_accessLock);
}

- (NetPreferences)init
{
  NetPreferences *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *productVersion;
  uint64_t v10;
  NSString *buildVersion;
  void *v12;
  uint64_t v13;
  NSString *UUID;
  void *v15;
  uint64_t v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)NetPreferences;
  v2 = -[NetPreferences init](&v22, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.stocks.plist"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("ServiceDebugging"));
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    v2->_serviceDebugging = objc_msgSend(v5, "BOOLValue");
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
    objc_msgSend(v7, "objectForKey:", CFSTR("ProductVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    productVersion = v2->_productVersion;
    v2->_productVersion = (NSString *)v8;

    objc_msgSend(v7, "objectForKey:", CFSTR("ProductBuildVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    buildVersion = v2->_buildVersion;
    v2->_buildVersion = (NSString *)v10;

    +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("UUID"));
    v13 = objc_claimAutoreleasedReturnValue();
    UUID = v2->_UUID;
    v2->_UUID = (NSString *)v13;

    if (!v2->_UUID)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v2->_UUID;
      v2->_UUID = (NSString *)v16;

      +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v2->_UUID, CFSTR("UUID"));
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("UUIDTimestamp"));

      objc_msgSend(v18, "synchronize");
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v2, sel_resetLocale, *MEMORY[0x24BDBCA70], 0);

  }
  return v2;
}

- (NSString)requestCountryCode
{
  NetPreferences *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_requestCountryCode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRequestCountryCode:(id)a3
{
  NSString *v4;
  NSString *requestCountryCode;
  NetPreferences *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  requestCountryCode = obj->_requestCountryCode;
  obj->_requestCountryCode = v4;

  objc_sync_exit(obj);
}

- (NSString)requestLanguageCode
{
  NetPreferences *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_requestLanguageCode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRequestLanguageCode:(id)a3
{
  NSString *v4;
  NSString *requestLanguageCode;
  NetPreferences *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  requestLanguageCode = obj->_requestLanguageCode;
  obj->_requestLanguageCode = v4;

  objc_sync_exit(obj);
}

- (NSString)acceptLanguageCode
{
  NetPreferences *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_acceptLanguageCode;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAcceptLanguageCode:(id)a3
{
  NSString *v4;
  NSString *acceptLanguageCode;
  NetPreferences *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  acceptLanguageCode = obj->_acceptLanguageCode;
  obj->_acceptLanguageCode = v4;

  objc_sync_exit(obj);
}

- (void)resetLocale
{
  -[NetPreferences setRequestCountryCode:](self, "setRequestCountryCode:", 0);
  -[NetPreferences setRequestLanguageCode:](self, "setRequestLanguageCode:", 0);
  -[NetPreferences setAcceptLanguageCode:](self, "setAcceptLanguageCode:", 0);
}

- (BOOL)isNetworkReachable
{
  NSObject *v3;
  const char *v4;
  void *v5;
  const char *v6;
  char v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  StocksLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isNetworkReachable)
      v4 = "YES";
    else
      v4 = "NO";
    objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isNetworkReachable"))
      v6 = "YES";
    else
      v6 = "NO";
    v10 = 136315394;
    v11 = v4;
    v12 = 2080;
    v13 = v6;
    _os_log_impl(&dword_21736B000, v3, OS_LOG_TYPE_DEFAULT, "#NetPreferences isNetworkReachable (host reachable: %s) (any reachable: %s)", (uint8_t *)&v10, 0x16u);

  }
  if (self->_isNetworkReachable)
    return 1;
  objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "isNetworkReachable");

  return v7;
}

- (void)setNetworkReachable:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  self->_isNetworkReachable = a3;
  StocksLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "NO";
    if (v3)
      v5 = "YES";
    v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_21736B000, v4, OS_LOG_TYPE_DEFAULT, "#NetPreferences setNetworkReachable: %s", (uint8_t *)&v6, 0xCu);
  }

}

- (id)_stocksUserAgent
{
  if (_stocksUserAgent_onceToken != -1)
    dispatch_once(&_stocksUserAgent_onceToken, &__block_literal_global_5);
  return (id)_stocksUserAgent_stocksUserAgent;
}

void __34__NetPreferences__stocksUserAgent__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD2A0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("AppleStocks/%@ Version/%@"), v1, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_stocksUserAgent_stocksUserAgent;
  _stocksUserAgent_stocksUserAgent = v4;

}

- (id)stocksCountryCode
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[NetPreferences requestCountryCode](self, "requestCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = (uint64_t)v5;
    else
      v6 = DefaultStocksCountryCode;
    -[NetPreferences setRequestCountryCode:](self, "setRequestCountryCode:", v6);

  }
  return -[NetPreferences requestCountryCode](self, "requestCountryCode");
}

- (id)stocksLanguageCode
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[NetPreferences requestLanguageCode](self, "requestLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(MEMORY[0x24BDBCEA0], "systemLanguages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mostPreferredLanguageOf:forUsage:options:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "languageCode");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    -[NetPreferences stocksLanguageCodeForLanguage:](self, "stocksLanguageCodeForLanguage:", v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)stocksLanguageCodeForLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NetPreferences requestLanguageCode](self, "requestLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[NetPreferences setRequestLanguageCode:](self, "setRequestLanguageCode:", v4);
  -[NetPreferences requestLanguageCode](self, "requestLanguageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stocksAcceptLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NetPreferences acceptLanguageCode](self, "acceptLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(", *"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NetPreferences setAcceptLanguageCode:](self, "setAcceptLanguageCode:", v6);

    }
    else
    {
      -[NetPreferences setAcceptLanguageCode:](self, "setAcceptLanguageCode:", CFSTR("en, *"));
    }

  }
  return -[NetPreferences acceptLanguageCode](self, "acceptLanguageCode");
}

- (void)addStocksHeadersToPostRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", CFSTR("text/xml"), CFSTR("Content-Type"));
  -[NetPreferences _stocksUserAgent](self, "_stocksUserAgent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v4, CFSTR("User-Agent"));

  -[NetPreferences stocksCountryCode](self, "stocksCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v5, CFSTR("X-Country-Code"));

  -[NetPreferences _stocksAcceptLanguage](self, "_stocksAcceptLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v6, CFSTR("Accept-Language"));

  objc_msgSend(v7, "setHTTPShouldHandleCookies:", 0);
}

- (id)financeRequestAttributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__NetPreferences_financeRequestAttributes__block_invoke;
  block[3] = &unk_24D74B7C0;
  block[4] = self;
  if (financeRequestAttributes_onceToken != -1)
    dispatch_once(&financeRequestAttributes_onceToken, block);
  return (id)financeRequestAttributes_RequestAttr;
}

void __42__NetPreferences_financeRequestAttributes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "length")+ 2 * objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "length")+ 155);
  objc_msgSend(v4, "appendString:", CFSTR("devtype=\"Apple iPhone v"));
  objc_msgSend(v4, "appendString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v4, "appendString:", CFSTR("\" deployver=\"Apple iPhone v"));
  objc_msgSend(v4, "appendString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v4, "appendString:", CFSTR("\" app=\"YGoiPhoneClient\" appver=\"1.0.1."));
  objc_msgSend(v4, "appendString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v4, "appendString:", CFSTR("\" api=\"finance\" apiver=\"1.0.1\" acknotification=\"0000\"));
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)financeRequestAttributes_RequestAttr;
  financeRequestAttributes_RequestAttr = v2;

}

- (id)_urlStringWithHost:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "URLHostAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v4;
  v9 = v8;

  -[NetPreferences UUID](self, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    -[NetPreferences UUID](self, "UUID");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://%@/dgw?imei=%@&apptype=finance"), v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)fullQuoteURLOverrideForStock:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("FullQuoteURLOverridePrefix"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("FullQuoteURLOverrideSuffix"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "symbol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", objc_msgSend(v8, "length") + objc_msgSend(v5, "length") + objc_msgSend(v7, "length"));
    objc_msgSend(v9, "setString:", v5);
    objc_msgSend(v9, "appendString:", v8);
    if (objc_msgSend(v7, "length"))
      objc_msgSend(v9, "appendString:", v7);
    objc_msgSend(MEMORY[0x24BDBCF48], "stocks_sanitizedURLFromString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)defaultBacksideLogoURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCB18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("http://m.yahoo.com/apple/finance?pintl="), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)backsideLogoURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)MEMORY[0x24BDBCF48];
  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("LogoURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stocks_sanitizedURLFromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB18]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(CFSTR("http://m.yahoo.com/apple/finance?pintl="), "stringByAppendingString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLWithString:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_cacheDirectoryPath
{
  if (_cacheDirectoryPath_onceToken != -1)
    dispatch_once(&_cacheDirectoryPath_onceToken, &__block_literal_global_86);
  return (id)_cacheDirectoryPath_CacheDirectoryPath;
}

void __37__NetPreferences__cacheDirectoryPath__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userLibraryDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Caches/Stocks"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_cacheDirectoryPath_CacheDirectoryPath;
  _cacheDirectoryPath_CacheDirectoryPath = v1;

}

- (id)logoButtonImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("yahooAttributionLogo"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)logoBacksideImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("YahooLogo"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)serviceDebugging
{
  return self->_serviceDebugging;
}

- (id)serviceDebuggingPath
{
  if (serviceDebuggingPath_onceToken != -1)
    dispatch_once(&serviceDebuggingPath_onceToken, &__block_literal_global_96);
  return (id)serviceDebuggingPath_DebuggingPath;
}

void __38__NetPreferences_serviceDebuggingPath__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "userLibraryDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Stocks"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v6, 0);

  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("ServiceDebugging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByResolvingSymlinksInPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)serviceDebuggingPath_DebuggingPath;
  serviceDebuggingPath_DebuggingPath = v4;

}

- (id)stocksYQLBaseURL
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;

  v2 = MGGetBoolAnswer();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.stocks.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("staging"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (v2 && (objc_msgSend(v5, "BOOLValue") & 1) != 0)
    v7 = CFSTR("https://staging-apple-finance.query.yahoo.com/v1/yql");
  else
    v7 = CFSTR("https://apple-finance.query.yahoo.com/v1/yql");
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)signedRequestForURL:(id)a3 parameters:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  objc_msgSend(a3, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ParameterString(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@?%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDB7458];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestWithURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v13, "setHTTPShouldHandleCookies:", 0);
  -[NetPreferences UUID](self, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v14, CFSTR("X-Client-UUID"));

  ClientInfo();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  DeviceInfo();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!objc_msgSend(v15, "length") || !objc_msgSend(v16, "length"))
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NetPreferences signedRequestForURL:parameters:].cold.1();
  }
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v15, CFSTR("X-Client-Info"));
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v16, CFSTR("X-Device-Info"));
  -[NetPreferences _stocksUserAgent](self, "_stocksUserAgent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v17, CFSTR("User-Agent"));

  CreateCredential();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6DF78]), "initWithCredential:", v18);
  objc_msgSend(v19, "signedURLRequestWithRequest:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_acceptLanguageCode, 0);
  objc_storeStrong((id *)&self->_requestLanguageCode, 0);
  objc_storeStrong((id *)&self->_requestCountryCode, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

- (void)signedRequestForURL:parameters:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "#NetPreferences Warning: You must define Client and Device Info.", v0, 2u);
}

@end
