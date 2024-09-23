@implementation SCWPreferences

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

  -[SCWPreferences requestLanguageCode](self, "requestLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mostPreferredLanguageOf:forUsage:options:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "languageCode");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    -[SCWPreferences stocksLanguageCodeForLanguage:](self, "stocksLanguageCodeForLanguage:", v8);
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
  -[SCWPreferences requestLanguageCode](self, "requestLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[SCWPreferences setRequestLanguageCode:](self, "setRequestLanguageCode:", v4);
  -[SCWPreferences requestLanguageCode](self, "requestLanguageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)requestLanguageCode
{
  SCWPreferences *v2;
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
  SCWPreferences *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  requestLanguageCode = obj->_requestLanguageCode;
  obj->_requestLanguageCode = v4;

  objc_sync_exit(obj);
}

- (id)stocksCountryCode
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[SCWPreferences requestCountryCode](self, "requestCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = (uint64_t)v5;
    else
      v6 = DefaultStocksCountryCode;
    -[SCWPreferences setRequestCountryCode:](self, "setRequestCountryCode:", v6);

  }
  return -[SCWPreferences requestCountryCode](self, "requestCountryCode");
}

- (NSString)requestCountryCode
{
  SCWPreferences *v2;
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
  SCWPreferences *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  requestCountryCode = obj->_requestCountryCode;
  obj->_requestCountryCode = v4;

  objc_sync_exit(obj);
}

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

- (SCWPreferences)init
{
  SCWPreferences *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *UUID;
  void *v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SCWPreferences;
  v2 = -[SCWPreferences init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.stocks.plist"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCWSharedPreferences sharedPreferences](SCWSharedPreferences, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v2->_UUID;
    v2->_UUID = (NSString *)v6;

    if (!v2->_UUID)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v2->_UUID;
      v2->_UUID = (NSString *)v9;

      +[SCWSharedPreferences sharedPreferences](SCWSharedPreferences, "sharedPreferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v2->_UUID, CFSTR("UUID"));
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("UUIDTimestamp"));

      objc_msgSend(v11, "synchronize");
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_resetLocale, *MEMORY[0x1E0C99720], 0);

  }
  return v2;
}

+ (void)clearSharedPreferences
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_accessLock);
  v2 = (void *)_instance;
  _instance = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_accessLock);
}

- (NSString)acceptLanguageCode
{
  SCWPreferences *v2;
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
  SCWPreferences *obj;

  v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  acceptLanguageCode = obj->_acceptLanguageCode;
  obj->_acceptLanguageCode = v4;

  objc_sync_exit(obj);
}

- (void)resetLocale
{
  -[SCWPreferences setRequestCountryCode:](self, "setRequestCountryCode:", 0);
  -[SCWPreferences setRequestLanguageCode:](self, "setRequestLanguageCode:", 0);
  -[SCWPreferences setAcceptLanguageCode:](self, "setAcceptLanguageCode:", 0);
}

- (id)_stocksAcceptLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SCWPreferences acceptLanguageCode](self, "acceptLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(", *"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCWPreferences setAcceptLanguageCode:](self, "setAcceptLanguageCode:", v6);

    }
    else
    {
      -[SCWPreferences setAcceptLanguageCode:](self, "setAcceptLanguageCode:", CFSTR("en, *"));
    }

  }
  return -[SCWPreferences acceptLanguageCode](self, "acceptLanguageCode");
}

- (id)_stocksUserAgent
{
  if (_stocksUserAgent_onceToken != -1)
    dispatch_once(&_stocksUserAgent_onceToken, &__block_literal_global_0);
  return (id)_stocksUserAgent_stocksUserAgent;
}

void __34__SCWPreferences__stocksUserAgent__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("AppleStocks/%@ Version/%@"), v1, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_stocksUserAgent_stocksUserAgent;
  _stocksUserAgent_stocksUserAgent = v4;

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
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.stocks.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
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
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)signedRequestForURL:(id)a3 parameters:(id)a4
{
  id v6;
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
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ParameterString(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@?%@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB37A8];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestWithURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v14, "setHTTPShouldHandleCookies:", 0);
  -[SCWPreferences UUID](self, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", v15, CFSTR("X-Client-UUID"));

  ClientInfo();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  DeviceInfo();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "length") || !objc_msgSend(v17, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SCWPreferences signedRequestForURL:parameters:].cold.1();
    __assert_rtn("-[SCWPreferences signedRequestForURL:parameters:]", "SCWPreferences.m", 328, "0");
  }
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", v16, CFSTR("X-Client-Info"));
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", v17, CFSTR("X-Device-Info"));
  -[SCWPreferences _stocksUserAgent](self, "_stocksUserAgent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forHTTPHeaderField:", v18, CFSTR("User-Agent"));

  CreateCredential();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64EA8]), "initWithCredential:", v19);
  objc_msgSend(v20, "signedURLRequestWithRequest:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
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
}

- (void)signedRequestForURL:parameters:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1ABCEF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "#SCWPreferences Warning: You must define Client and Device Info.", v0, 2u);
}

@end
