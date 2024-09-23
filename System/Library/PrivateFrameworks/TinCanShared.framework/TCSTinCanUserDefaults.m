@implementation TCSTinCanUserDefaults

+ (NSString)allowListKey
{
  if (allowListKey_onceToken != -1)
    dispatch_once(&allowListKey_onceToken, &__block_literal_global_5);
  return (NSString *)(id)allowListKey_TCSDefaultsAllowlistKey;
}

void __37__TCSTinCanUserDefaults_allowListKey__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(CFSTR("tel"), "mutableCopy");
  objc_msgSend(v2, "appendString:", CFSTR("ist"));
  objc_msgSend(v2, "insertString:atIndex:", CFSTR("Whi"), 0);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)allowListKey_TCSDefaultsAllowlistKey;
  allowListKey_TCSDefaultsAllowlistKey = v0;

}

+ (NSString)storeDemoAllowlistKey
{
  void *v2;
  uint64_t v3;
  id v4;
  NSString *v5;
  _QWORD block[4];
  id v8;

  objc_msgSend(a1, "allowListKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__TCSTinCanUserDefaults_storeDemoAllowlistKey__block_invoke;
  block[3] = &unk_24CFC2498;
  v8 = v2;
  v3 = storeDemoAllowlistKey_onceToken;
  v4 = v2;
  if (v3 != -1)
    dispatch_once(&storeDemoAllowlistKey_onceToken, block);
  v5 = (NSString *)(id)storeDemoAllowlistKey_TCSDefaultsStoreDemoAllowlistKey;

  return v5;
}

void __46__TCSTinCanUserDefaults_storeDemoAllowlistKey__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v3, "insertString:atIndex:", CFSTR("StoreDemo"), 0);
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)storeDemoAllowlistKey_TCSDefaultsStoreDemoAllowlistKey;
  storeDemoAllowlistKey_TCSDefaultsStoreDemoAllowlistKey = v1;

}

+ (NSString)suggestionExpiryReasonAllowlistedValue
{
  void *v2;
  uint64_t v3;
  id v4;
  NSString *v5;
  _QWORD block[4];
  id v8;

  objc_msgSend(a1, "allowListKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__TCSTinCanUserDefaults_suggestionExpiryReasonAllowlistedValue__block_invoke;
  block[3] = &unk_24CFC2498;
  v8 = v2;
  v3 = suggestionExpiryReasonAllowlistedValue_onceToken;
  v4 = v2;
  if (v3 != -1)
    dispatch_once(&suggestionExpiryReasonAllowlistedValue_onceToken, block);
  v5 = (NSString *)(id)suggestionExpiryReasonAllowlistedValue_TCSDefaultsSuggestionExpiryReasonAllowlistedValue;

  return v5;
}

void __63__TCSTinCanUserDefaults_suggestionExpiryReasonAllowlistedValue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v3, "appendString:", CFSTR("ed"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)suggestionExpiryReasonAllowlistedValue_TCSDefaultsSuggestionExpiryReasonAllowlistedValue;
  suggestionExpiryReasonAllowlistedValue_TCSDefaultsSuggestionExpiryReasonAllowlistedValue = v1;

}

+ (id)defaults
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v12[16];

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("com.apple.tincan"), "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(a1, "standardUserDefaults");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(objc_alloc((Class)a1), "initWithSuiteName:", CFSTR("com.apple.tincan"));
  }
  v7 = (void *)v6;
  if (+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot](TCSBehavior, "isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot"))
  {
    objc_msgSend(v7, "_tcsEnsureProtectionClass");
  }
  else
  {
    _TCSInitializeLogging();
    v8 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21342E000, v8, OS_LOG_TYPE_DEFAULT, "TCSTinCanUserDefaults waiting for first-unlock.", v12, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCSBehavior sharedBehavior](TCSBehavior, "sharedBehavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v7, sel__tcsHandleDeviceFirstUnlock, CFSTR("TCSFirstUnlockNotification"), v10);

  }
  return v7;
}

- (void)clearUserData
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TCSTinCanUserDefaults clearUserData]";
  _os_log_error_impl(&dword_21342E000, log, OS_LOG_TYPE_ERROR, "%s: attempt to clear user data before first device unlock.", (uint8_t *)&v1, 0xCu);
}

void __38__TCSTinCanUserDefaults_clearUserData__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEF0];
  +[TCSTinCanUserDefaults allowListKey](TCSTinCanUserDefaults, "allowListKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", CFSTR("Unavailable"), v3, CFSTR("Suggestions"), CFSTR("SuggestionsFirstGenerated"), CFSTR("SuggestionsPreviouslyGenerated"), CFSTR("ContactPhotoHashes"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _TCSInitializeLogging();
  v5 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21342E000, v5, OS_LOG_TYPE_DEFAULT, "Clearing Walkie-Talkie user data from defaults.", buf, 2u);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(CFSTR("AppIsInstalled"), "isEqualToString:", v11) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  if (NPSHasCompletedInitialSync())
  {
    objc_msgSend(v6, "removeObject:", CFSTR("ContactPhotoHashes"));
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.tincan"), v6);

  }
}

@end
