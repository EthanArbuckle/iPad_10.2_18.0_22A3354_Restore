@implementation PSUICoreTelephonyCallCache

+ (PSUICoreTelephonyCallCache)sharedInstance
{
  if (qword_253E97090 != -1)
    dispatch_once(&qword_253E97090, &__block_literal_global_16);
  return (PSUICoreTelephonyCallCache *)(id)_MergedGlobals_68;
}

void __44__PSUICoreTelephonyCallCache_sharedInstance__block_invoke()
{
  PSUICoreTelephonyCallCache *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PSUICoreTelephonyCallCache alloc];
  v3 = objc_alloc_init(MEMORY[0x24BDB7898]);
  v1 = -[PSUICoreTelephonyCallCache initPrivate:](v0, "initPrivate:");
  v2 = (void *)_MergedGlobals_68;
  _MergedGlobals_68 = v1;

}

- (id)initPrivate:(id)a3
{
  id v5;
  PSUICoreTelephonyCallCache *v6;
  PSUICoreTelephonyCallCache *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUICoreTelephonyCallCache;
  v6 = -[PSUICoreTelephonyCallCache init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_callObserver, a3);

  return v7;
}

- (PSUICoreTelephonyCallCache)init
{
  NSObject *v2;
  uint8_t v3[16];

  -[PSUICoreTelephonyCallCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (BOOL)isAnyCallActive
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PSUICoreTelephonyCallCache callObserver](self, "callObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)isAnyVOIPCallActive
{
  _BOOL4 v3;

  v3 = -[PSUICoreTelephonyCallCache isAnyCallActive](self, "isAnyCallActive");
  if (v3)
    LOBYTE(v3) = !-[PSUICoreTelephonyCallCache isAnyCallActiveForProviderIdentifier:](self, "isAnyCallActiveForProviderIdentifier:", CFSTR("com.apple.coretelephony"));
  return v3;
}

- (BOOL)isAnyTelephonyCallActive
{
  return -[PSUICoreTelephonyCallCache isAnyCallActiveForProviderIdentifier:](self, "isAnyCallActiveForProviderIdentifier:", CFSTR("com.apple.coretelephony"));
}

- (BOOL)isAnyCallActiveForProviderIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PSUICoreTelephonyCallCache callObserver](self, "callObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v20;
    *(_QWORD *)&v8 = 138412290;
    v18 = v8;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[PSUICoreTelephonyCallCache getLogger](self, "getLogger", v18);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "providerIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v18;
          v24 = v13;
          _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_INFO, "Call provider identifier: %@", buf, 0xCu);

        }
        objc_msgSend(v11, "providerIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if ((v15 & 1) != 0)
        {
          v16 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (BOOL)isActiveCallVoLTE
{
  return -[PSUICoreTelephonyCallCache isActiveCallSubtype:](self, "isActiveCallSubtype:", *MEMORY[0x24BDC3140]);
}

- (BOOL)isActiveCallVoNR
{
  return -[PSUICoreTelephonyCallCache isActiveCallSubtype:](self, "isActiveCallSubtype:", *MEMORY[0x24BDC3148]);
}

- (BOOL)isActiveCallSubtype:(const char *)a3
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__PSUICoreTelephonyCallCache_isActiveCallSubtype___block_invoke;
  v8[3] = &unk_24D5022E0;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend(v5, "callPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

uint64_t __50__PSUICoreTelephonyCallCache_isActiveCallSubtype___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "providerContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("kCallSubType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Call subtype: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  return v8;
}

- (id)localizedPhoneNumber:(id)a3 context:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  const void *v10;
  __CFString *String;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  int v18;
  __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (v7)
  {
    +[PSUICoreTelephonySubscriberCache sharedInstance](PSUICoreTelephonySubscriberCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isoCountryCode:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = (const void *)CFPhoneNumberCreate();
  if (v10)
  {
    String = (__CFString *)CFPhoneNumberCreateString();
    if (!String)
    {
      -[PSUICoreTelephonyCallCache getLogger](self, "getLogger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v18 = 138412546;
        v19 = v6;
        v20 = 2112;
        v21 = v7;
        _os_log_error_impl(&dword_2161C6000, v12, OS_LOG_TYPE_ERROR, "Failed to localize CF phone number %@, %@", (uint8_t *)&v18, 0x16u);
      }

    }
    CFRelease(v10);
  }
  else
  {
    -[PSUICoreTelephonyCallCache getLogger](self, "getLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_error_impl(&dword_2161C6000, v13, OS_LOG_TYPE_ERROR, "Failed to allocate CF phone number for %@, %@", (uint8_t *)&v18, 0x16u);
    }

    String = 0;
  }
  v14 = -[__CFString length](String, "length");
  v15 = &stru_24D5028C8;
  if (v6)
    v15 = v6;
  if (v14)
    v15 = String;
  v16 = v15;

  return v16;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CallCache"));
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);
}

@end
