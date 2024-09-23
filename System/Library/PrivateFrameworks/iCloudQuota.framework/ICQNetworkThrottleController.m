@implementation ICQNetworkThrottleController

- (ICQNetworkThrottleController)init
{
  ICQNetworkThrottleController *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQNetworkThrottleController;
  v2 = -[ICQNetworkThrottleController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.cloud.quota"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (BOOL)requestShouldThrottle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  _BOOL4 v12;
  BOOL v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICQNetworkThrottleController defaults](self, "defaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryForKey:", CFSTR("ICQThrottleURLTable"));
    v7 = objc_claimAutoreleasedReturnValue();

    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceNow");
    v10 = v9;
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    v13 = v10 > 0.0;
    if (v10 <= 0.0)
    {
      if (v12)
      {
        v19 = 138412290;
        v20 = v5;
        v15 = "Not throttling request for URL: %@";
        v16 = v11;
        v17 = 12;
        goto LABEL_10;
      }
    }
    else if (v12)
    {
      objc_msgSend(v8, "timeIntervalSinceNow");
      v19 = 138412546;
      v20 = v5;
      v21 = 2048;
      v22 = v14;
      v15 = "Throttling request for URL: %@, throttle seconds remaining:%.0f";
      v16 = v11;
      v17 = 22;
LABEL_10:
      _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, v17);
    }

    goto LABEL_12;
  }
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[ICQNetworkThrottleController requestShouldThrottle:].cold.1(v7);
  v13 = 0;
LABEL_12:

  return v13;
}

- (void)request:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8 != CFSTR("com.apple.icloud.quota"))
  {
    v9 = 0;
LABEL_3:

    goto LABEL_11;
  }
  v10 = objc_msgSend(v7, "code");

  if (v10 == 16)
  {
    objc_msgSend(v7, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("retryAfterDelay"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("retryAfterDelay"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v7, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("retryAfterDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) != 0)
    {
      objc_msgSend(v7, "userInfo");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("retryAfterDate"));
      v20 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v20;
      goto LABEL_3;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_11:
  _ICQGetLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "URL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "absoluteString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412546;
    v32 = v23;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_1CDEBD000, v21, OS_LOG_TYPE_DEFAULT, "Updating throttle for %@, retry after: %@", (uint8_t *)&v31, 0x16u);

  }
  objc_opt_class();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v24);
  -[ICQNetworkThrottleController defaults](self, "defaults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dictionaryForKey:", CFSTR("ICQThrottleURLTable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "mutableCopy");

  if (!v27)
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  objc_msgSend(v6, "URL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "absoluteString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v9, v29);

  -[ICQNetworkThrottleController defaults](self, "defaults");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v27, CFSTR("ICQThrottleURLTable"));

  objc_sync_exit(v24);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

- (void)requestShouldThrottle:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_ERROR, "Attempted to throttle request with no URL", v1, 2u);
}

@end
