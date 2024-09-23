@implementation PowerUIChargingController

- (void)setNumber:(id)a3 forPreferenceKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, CFSTR("com.apple.smartcharging.topoffprotection"));
}

- (id)readNumberForPreferenceKey:(id)a3
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.smartcharging.topoffprotection"));
}

- (PowerUIChargingController)init
{
  PowerUIChargingController *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  NSMutableDictionary *tokenDict;
  NSLock *v7;
  NSLock *chargeLimitLock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PowerUIChargingController;
  v2 = -[PowerUIChargingController init](&v10, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.powerui.smartcharging", "chargingcontroller");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    tokenDict = v2->_tokenDict;
    v2->_tokenDict = (NSMutableDictionary *)v5;

    v7 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    chargeLimitLock = v2->_chargeLimitLock;
    v2->_chargeLimitLock = v7;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_7);
  return (id)sharedInstance_instance_0;
}

void __43__PowerUIChargingController_sharedInstance__block_invoke()
{
  PowerUIChargingController *v0;
  void *v1;

  if (!sharedInstance_instance_0)
  {
    v0 = objc_alloc_init(PowerUIChargingController);
    v1 = (void *)sharedInstance_instance_0;
    sharedInstance_instance_0 = (uint64_t)v0;

  }
}

- (__CFString)loadChargeLimitTokenForPreferenceKey:(id)a3 forReason:(id)a4
{
  __CFString *v6;
  id v7;
  __CFString *v8;
  NSObject *log;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  __CFString *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_tokenDict, "objectForKeyedSubscript:", v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Charge limit token already exists: %@", buf, 0xCu);
    }
  }
  else
  {
    +[PowerUISmartChargeUtilities readStringForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "readStringForPreferenceKey:inDomain:", v6, CFSTR("com.apple.smartcharging.topoffprotection"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v21 = v6;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v10 = (id)IOPSCopyBatteryLevelLimits();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("chargeSocLimitReason"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v7);

            if ((v16 & 1) != 0)
            {

              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tokenDict, "setObject:forKeyedSubscript:", v8, v7);
              v18 = self->_log;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v28 = v8;
                _os_log_impl(&dword_215A71000, v18, OS_LOG_TYPE_DEFAULT, "Loaded charge limit token from defaults: %@", buf, 0xCu);
              }

              v6 = v21;
              goto LABEL_22;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v12)
            continue;
          break;
        }
      }

      v17 = self->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v8;
        _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "Token %@ does not seem to exist anymore", buf, 0xCu);
      }

      v6 = v21;
    }
    else
    {
      v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v6;
        _os_log_impl(&dword_215A71000, v19, OS_LOG_TYPE_DEFAULT, "Did not get string value for key %@", buf, 0xCu);
      }
    }

    v8 = 0;
  }
LABEL_22:

  return v8;
}

- (__CFString)registerNewTokenForPreferenceKey:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  NSObject *log;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = IOPSLimitBatteryLevelRegister();
  if (v8)
  {
    v9 = v8;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[PowerUIChargingController registerNewTokenForPreferenceKey:forReason:].cold.2(v9, log);
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PowerUIChargingController registerNewTokenForPreferenceKey:forReason:].cold.1(v11);
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tokenDict, "setObject:forKeyedSubscript:", 0, v7);

    +[PowerUISmartChargeUtilities setString:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setString:forPreferenceKey:inDomain:", 0, v6, CFSTR("com.apple.smartcharging.topoffprotection"));
    v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = 0;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "Created new charge limit token: %@ for reason: %@", buf, 0x16u);
    }
  }

  return 0;
}

- (void)clearChargeLimitForLimitType:(unint64_t)a3
{
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  NSObject *log;
  _BOOL4 v10;
  NSMutableDictionary *tokenDict;
  NSObject *v12;
  __CFString *v13;
  int v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_chargeLimitLock, "lock");
  v5 = a3 - 1;
  if (a3 - 1 >= 5)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[PowerUIChargingController clearChargeLimitForLimitType:].cold.1();
  }
  else
  {
    v6 = off_24D3FBEF8[v5];
    v7 = off_24D3FBF20[v5];
    -[PowerUIChargingController loadChargeLimitTokenForPreferenceKey:forReason:](self, "loadChargeLimitTokenForPreferenceKey:forReason:", v7, v6);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_tokenDict, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    log = self->_log;
    v10 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        tokenDict = self->_tokenDict;
        v12 = log;
        -[NSMutableDictionary objectForKeyedSubscript:](tokenDict, "objectForKeyedSubscript:", v6);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "Clearing current charge limit token for (%@)", (uint8_t *)&v14, 0xCu);

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_tokenDict, "objectForKeyedSubscript:", v6);
      objc_claimAutoreleasedReturnValue();
      IOPSLimitBatteryLevelCancel();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tokenDict, "setObject:forKeyedSubscript:", 0, v6);
    }
    else if (v10)
    {
      v14 = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "No token to clear for preferencekey %@, reason %@", (uint8_t *)&v14, 0x16u);
    }
    +[PowerUISmartChargeUtilities setString:forPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "setString:forPreferenceKey:inDomain:", 0, v7, CFSTR("com.apple.smartcharging.topoffprotection"));
  }
  -[NSLock unlock](self->_chargeLimitLock, "unlock");
}

- (void)clearAllChargeLimits
{
  -[PowerUIChargingController clearChargeLimitForLimitType:](self, "clearChargeLimitForLimitType:", 1);
  -[PowerUIChargingController clearChargeLimitForLimitType:](self, "clearChargeLimitForLimitType:", 2);
  -[PowerUIChargingController clearChargeLimitForLimitType:](self, "clearChargeLimitForLimitType:", 3);
  -[PowerUIChargingController clearChargeLimitForLimitType:](self, "clearChargeLimitForLimitType:", 4);
  -[PowerUIChargingController clearChargeLimitForLimitType:](self, "clearChargeLimitForLimitType:", 5);
}

- (BOOL)setChargeLimitTo:(int64_t)a3 forLimitType:(unint64_t)a4
{
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  BOOL v11;
  int v12;
  NSObject *log;
  int v15;
  int64_t v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_chargeLimitLock, "lock");
  v7 = a4 - 1;
  if (a4 - 1 >= 5)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[PowerUIChargingController setChargeLimitTo:forLimitType:].cold.2();
    goto LABEL_10;
  }
  v8 = off_24D3FBEF8[v7];
  v9 = off_24D3FBF20[v7];
  v10 = -[PowerUIChargingController loadChargeLimitTokenForPreferenceKey:forReason:](self, "loadChargeLimitTokenForPreferenceKey:forReason:", v9, v8);
  v11 = v10 == 0;
  if (!v10
    && !-[PowerUIChargingController registerNewTokenForPreferenceKey:forReason:](self, "registerNewTokenForPreferenceKey:forReason:", v9, v8))
  {
LABEL_10:
    -[NSLock unlock](self->_chargeLimitLock, "unlock");
    return 0;
  }
  v12 = IOPSLimitBatteryLevel();
  log = self->_log;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[PowerUIChargingController setChargeLimitTo:forLimitType:].cold.1(log);
    -[NSLock unlock](self->_chargeLimitLock, "unlock");
    -[PowerUIChargingController clearChargeLimitForLimitType:](self, "clearChargeLimitForLimitType:", a4);
    return 0;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218242;
    v16 = a3;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Limited charging to %lu for reason '%@'", (uint8_t *)&v15, 0x16u);
  }
  -[NSLock unlock](self->_chargeLimitLock, "unlock");
  return v11;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableDictionary)tokenDict
{
  return self->_tokenDict;
}

- (void)setTokenDict:(id)a3
{
  objc_storeStrong((id *)&self->_tokenDict, a3);
}

- (NSLock)chargeLimitLock
{
  return self->_chargeLimitLock;
}

- (void)setChargeLimitLock:(id)a3
{
  objc_storeStrong((id *)&self->_chargeLimitLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargeLimitLock, 0);
  objc_storeStrong((id *)&self->_tokenDict, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)registerNewTokenForPreferenceKey:(void *)a1 forReason:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v1, v3, "Error code string value: %s", v4);

  OUTLINED_FUNCTION_4_0();
}

- (void)registerNewTokenForPreferenceKey:(int)a1 forReason:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_215A71000, a2, OS_LOG_TYPE_ERROR, "Could not get charge limit token, error code: %d", (uint8_t *)v2, 8u);
}

- (void)clearChargeLimitForLimitType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v0, v1, "trying to clear invalid charge token: %lu", v2);
}

- (void)setChargeLimitTo:(void *)a1 forLimitType:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v1, v3, "Error trying to limit the battery level: %s", v4);

  OUTLINED_FUNCTION_4_0();
}

- (void)setChargeLimitTo:forLimitType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_215A71000, v0, v1, "trying to set invalid charge token: %lu", v2);
}

@end
