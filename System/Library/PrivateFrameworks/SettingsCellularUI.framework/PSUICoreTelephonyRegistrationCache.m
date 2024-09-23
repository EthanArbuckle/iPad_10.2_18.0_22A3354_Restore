@implementation PSUICoreTelephonyRegistrationCache

+ (PSUICoreTelephonyRegistrationCache)sharedInstance
{
  if (qword_253E970A0 != -1)
    dispatch_once(&qword_253E970A0, &__block_literal_global_17);
  return (PSUICoreTelephonyRegistrationCache *)(id)_MergedGlobals_69;
}

void __52__PSUICoreTelephonyRegistrationCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUICoreTelephonyRegistrationCache initPrivate]([PSUICoreTelephonyRegistrationCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_69;
  _MergedGlobals_69 = (uint64_t)v0;

}

- (id)initPrivate
{
  PSUICoreTelephonyRegistrationCache *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CoreTelephonyClient *client;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSUICoreTelephonyRegistrationCache;
  v2 = -[PSUICoreTelephonyRegistrationCache init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC2810]);
    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("registration_cache"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithQueue:", v4);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v5;

    -[CoreTelephonyClient setDelegate:](v2->_client, "setDelegate:", v2);
    -[PSUICoreTelephonyRegistrationCache setImsStatusVoiceDict:](v2, "setImsStatusVoiceDict:", 0);
    -[PSUICoreTelephonyRegistrationCache setImsStatusSMSDict:](v2, "setImsStatusSMSDict:", 0);
    -[PSUICoreTelephonyRegistrationCache setRcsStatusDict:](v2, "setRcsStatusDict:", 0);
    -[PSUICoreTelephonyRegistrationCache setRejectCauseCodeDict:](v2, "setRejectCauseCodeDict:", 0);
    -[PSUICoreTelephonyRegistrationCache setSupportedDataRatesDict:](v2, "setSupportedDataRatesDict:", 0);
    -[PSUICoreTelephonyRegistrationCache setMaxDataRateDict:](v2, "setMaxDataRateDict:", 0);
    -[PSUICoreTelephonyRegistrationCache setOperatorNameDict:](v2, "setOperatorNameDict:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_clearCache, *MEMORY[0x24BEBE008], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_clearCache, *MEMORY[0x24BE856C8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_handleDataUsageChanged, *MEMORY[0x24BE856D8], 0);

  }
  return v2;
}

- (PSUICoreTelephonyRegistrationCache)init
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[PSUICoreTelephonyRegistrationCache init]";
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)clearCache
{
  NSObject *v3;
  PSUICoreTelephonyRegistrationCache *v4;
  uint8_t v5[16];

  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Clearing registration cache", v5, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[PSUICoreTelephonyRegistrationCache setImsStatusVoiceDict:](v4, "setImsStatusVoiceDict:", 0);
  -[PSUICoreTelephonyRegistrationCache setImsStatusSMSDict:](v4, "setImsStatusSMSDict:", 0);
  -[PSUICoreTelephonyRegistrationCache setRcsStatusDict:](v4, "setRcsStatusDict:", 0);
  -[PSUICoreTelephonyRegistrationCache setRejectCauseCodeDict:](v4, "setRejectCauseCodeDict:", 0);
  -[PSUICoreTelephonyRegistrationCache setSupportedDataRatesDict:](v4, "setSupportedDataRatesDict:", 0);
  -[PSUICoreTelephonyRegistrationCache setMaxDataRateDict:](v4, "setMaxDataRateDict:", 0);
  -[PSUICoreTelephonyRegistrationCache setOperatorNameDict:](v4, "setOperatorNameDict:", 0);
  objc_sync_exit(v4);

}

- (void)handleDataUsageChanged
{
  PSUICoreTelephonyRegistrationCache *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[PSUICoreTelephonyRegistrationCache setMaxDataRateDict:](v2, "setMaxDataRateDict:", 0);
  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("PSMaxDataRateChangedNotification"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyRegistrationCache getLogger](v2, "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PSUICoreTelephonyRegistrationCache handleDataUsageChanged]";
    v8 = 2112;
    v9 = CFSTR("PSMaxDataRateChangedNotification");
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_postNotification_, v3, 0);

  objc_sync_exit(v2);
}

- (void)fetchIMSStatus
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  __CFString *v10;
  CoreTelephonyClient *client;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  _BOOL4 v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  PSUICoreTelephonyRegistrationCache *v22;
  __int128 v23;
  id v24;
  id v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  __CFString *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[PSUICoreTelephonyRegistrationCache fetchIMSStatus]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v29;
    *(_QWORD *)&v7 = 136315906;
    v23 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(__CFString **)(*((_QWORD *)&v28 + 1) + 8 * i);
        client = self->_client;
        v27 = 0;
        -[CoreTelephonyClient getIMSRegistrationStatus:error:](client, "getIMSRegistrationStatus:error:", v10, &v27, v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (__CFString *)v27;
        -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136315650;
            v33 = "-[PSUICoreTelephonyRegistrationCache fetchIMSStatus]";
            v34 = 2112;
            v35 = v13;
            v36 = 2112;
            v37 = v10;
            _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch failed: %@, %@", buf, 0x20u);
          }
        }
        else
        {
          if (v15)
          {
            if (objc_msgSend(v12, "isRegisteredForVoice"))
              v16 = CFSTR("YES");
            else
              v16 = CFSTR("NO");
            v17 = objc_msgSend(v12, "isRegisteredForSMS");
            *(_DWORD *)buf = v23;
            v18 = CFSTR("NO");
            if (v17)
              v18 = CFSTR("YES");
            v33 = "-[PSUICoreTelephonyRegistrationCache fetchIMSStatus]";
            v34 = 2112;
            v35 = v16;
            v36 = 2112;
            v37 = v18;
            v38 = 2112;
            v39 = v10;
            _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %@, %@, %@", buf, 0x2Au);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "isRegisteredForVoice"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[__CFString slotID](v10, "slotID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v19, v20);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "isRegisteredForSMS"));
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[__CFString slotID](v10, "slotID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v14, v21);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v6);
  }

  v22 = self;
  objc_sync_enter(v22);
  -[PSUICoreTelephonyRegistrationCache setImsStatusVoiceDict:](v22, "setImsStatusVoiceDict:", v25);
  -[PSUICoreTelephonyRegistrationCache setImsStatusSMSDict:](v22, "setImsStatusSMSDict:", v24);
  objc_sync_exit(v22);

}

- (BOOL)IMSStatusVoice:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonyRegistrationCache *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[PSUICoreTelephonyRegistrationCache imsStatusVoiceDict](self, "imsStatusVoiceDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonyRegistrationCache fetchIMSStatus](self, "fetchIMSStatus");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonyRegistrationCache imsStatusVoiceDict](v6, "imsStatusVoiceDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "BOOLValue");
  else
    v10 = 0;

  objc_sync_exit(v6);
  return v10;
}

- (BOOL)IMSStatusSMS:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonyRegistrationCache *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[PSUICoreTelephonyRegistrationCache imsStatusSMSDict](self, "imsStatusSMSDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonyRegistrationCache fetchIMSStatus](self, "fetchIMSStatus");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonyRegistrationCache imsStatusSMSDict](v6, "imsStatusSMSDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "BOOLValue");
  else
    v10 = 0;

  objc_sync_exit(v6);
  return v10;
}

- (void)fetchRCSStatus
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CoreTelephonyClient *client;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  PSUICoreTelephonyRegistrationCache *v20;
  __int128 v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Fetching RCS status", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v25;
    *(_QWORD *)&v8 = 138412546;
    v21 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        client = self->_client;
        v23 = 0;
        -[CoreTelephonyClient getSystemConfiguration:withError:](client, "getSystemConfiguration:withError:", v11, &v23, v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        if (v14)
        {
          -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v29 = v14;
            v30 = 2112;
            v31 = (uint64_t)v11;
            _os_log_error_impl(&dword_2161C6000, v15, OS_LOG_TYPE_ERROR, "RCS status fetch failed: %@, %@", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(v13, "operationStatus");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "registrationState");

          -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v29 = v11;
            v30 = 2048;
            v31 = v17;
            _os_log_impl(&dword_2161C6000, v18, OS_LOG_TYPE_DEFAULT, "RCS status fetch succeeded, context: %@, registration state: %ld", buf, 0x16u);
          }

          if (v17 == 1)
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          else
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "slotID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, v19);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v7);
  }

  v20 = self;
  objc_sync_enter(v20);
  -[PSUICoreTelephonyRegistrationCache setRcsStatusDict:](v20, "setRcsStatusDict:", v22);
  objc_sync_exit(v20);

}

- (BOOL)RCSStatus:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonyRegistrationCache *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[PSUICoreTelephonyRegistrationCache rcsStatusDict](self, "rcsStatusDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonyRegistrationCache fetchRCSStatus](self, "fetchRCSStatus");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonyRegistrationCache rcsStatusDict](v6, "rcsStatusDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "BOOLValue");
  else
    v10 = 0;

  objc_sync_exit(v6);
  return v10;
}

- (void)imsRegistrationChanged:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PSUICoreTelephonyRegistrationCache *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[PSUICoreTelephonyRegistrationCache imsRegistrationChanged:info:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s updating: %@", (uint8_t *)&v10, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  -[PSUICoreTelephonyRegistrationCache setImsStatusVoiceDict:](v9, "setImsStatusVoiceDict:", 0);
  -[PSUICoreTelephonyRegistrationCache setImsStatusSMSDict:](v9, "setImsStatusSMSDict:", 0);
  objc_sync_exit(v9);

}

- (void)fetchRejectCauseCode
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  CoreTelephonyClient *client;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  PSUICoreTelephonyRegistrationCache *v16;
  __int128 v17;
  id v18;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[PSUICoreTelephonyRegistrationCache fetchRejectCauseCode]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 136315650;
    v17 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        client = self->_client;
        v20 = 0;
        -[CoreTelephonyClient getRejectCauseCode:error:](client, "getRejectCauseCode:error:", v10, &v20, v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v20;
        -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136315394;
            v26 = "-[PSUICoreTelephonyRegistrationCache fetchRejectCauseCode]";
            v27 = 2112;
            v28 = v13;
            _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch failed: %@", buf, 0x16u);
          }
        }
        else
        {
          if (v15)
          {
            *(_DWORD *)buf = v17;
            v26 = "-[PSUICoreTelephonyRegistrationCache fetchRejectCauseCode]";
            v27 = 2112;
            v28 = v12;
            v29 = 2112;
            v30 = v10;
            _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %@, %@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "slotID"));
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, v14);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v6);
  }

  v16 = self;
  objc_sync_enter(v16);
  -[PSUICoreTelephonyRegistrationCache setRejectCauseCodeDict:](v16, "setRejectCauseCodeDict:", v18);
  objc_sync_exit(v16);

}

- (id)rejectCauseCode:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonyRegistrationCache *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PSUICoreTelephonyRegistrationCache rejectCauseCodeDict](self, "rejectCauseCodeDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonyRegistrationCache fetchRejectCauseCode](self, "fetchRejectCauseCode");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonyRegistrationCache rejectCauseCodeDict](v6, "rejectCauseCodeDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v9;
}

- (void)fetchSupportedDataRates
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  CoreTelephonyClient *client;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  void *v18;
  PSUICoreTelephonyRegistrationCache *v19;
  __int128 v20;
  id v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[PSUICoreTelephonyRegistrationCache fetchSupportedDataRates]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 136315650;
    v20 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        client = self->_client;
        v23 = 0;
        -[CoreTelephonyClient getSupportedDataRates:error:](client, "getSupportedDataRates:error:", v10, &v23, v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v23;
        -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = 136315394;
            v29 = "-[PSUICoreTelephonyRegistrationCache fetchSupportedDataRates]";
            v30 = 2112;
            v31 = v13;
            _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch failed: %@", buf, 0x16u);
          }
        }
        else
        {
          if (v15)
          {
            objc_msgSend(v12, "rates");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v29 = "-[PSUICoreTelephonyRegistrationCache fetchSupportedDataRates]";
            v30 = 2112;
            v31 = v16;
            v32 = 2112;
            v33 = v10;
            _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %@, %@", buf, 0x20u);

          }
          objc_msgSend(v12, "rates");
          v14 = objc_claimAutoreleasedReturnValue();
          v17 = -[NSObject copy](v14, "copy");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "slotID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, v18);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v6);
  }

  v19 = self;
  objc_sync_enter(v19);
  -[PSUICoreTelephonyRegistrationCache setSupportedDataRatesDict:](v19, "setSupportedDataRatesDict:", v21);
  objc_sync_exit(v19);

}

- (id)supportedDataRates:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonyRegistrationCache *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PSUICoreTelephonyRegistrationCache supportedDataRatesDict](self, "supportedDataRatesDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonyRegistrationCache fetchSupportedDataRates](self, "fetchSupportedDataRates");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonyRegistrationCache supportedDataRatesDict](v6, "supportedDataRatesDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v9;
}

- (void)fetchMaxDataRate
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CoreTelephonyClient *client;
  uint64_t v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  PSUICoreTelephonyRegistrationCache *v19;
  __int128 v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[PSUICoreTelephonyRegistrationCache fetchMaxDataRate]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v24;
    *(_QWORD *)&v8 = 136315650;
    v20 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        client = self->_client;
        v22 = 0;
        v13 = -[CoreTelephonyClient getMaxDataRate:error:](client, "getMaxDataRate:error:", v11, &v22, v20);
        v14 = v22;
        -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136315394;
            v28 = "-[PSUICoreTelephonyRegistrationCache fetchMaxDataRate]";
            v29 = 2112;
            v30 = (uint64_t)v14;
            _os_log_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEFAULT, "%s fetch failed: %@", buf, 0x16u);
          }
        }
        else
        {
          if (v16)
          {
            v17 = CTDataRateAsString();
            *(_DWORD *)buf = v20;
            v28 = "-[PSUICoreTelephonyRegistrationCache fetchMaxDataRate]";
            v29 = 2080;
            v30 = v17;
            v31 = 2112;
            v32 = v11;
            _os_log_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %s, %@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "slotID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, v18);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v7);
  }

  v19 = self;
  objc_sync_enter(v19);
  -[PSUICoreTelephonyRegistrationCache setMaxDataRateDict:](v19, "setMaxDataRateDict:", v21);
  objc_sync_exit(v19);

}

- (int64_t)maxDataRate:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonyRegistrationCache *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  -[PSUICoreTelephonyRegistrationCache maxDataRateDict](self, "maxDataRateDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonyRegistrationCache fetchMaxDataRate](self, "fetchMaxDataRate");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonyRegistrationCache maxDataRateDict](v6, "maxDataRateDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  v10 = objc_msgSend(v9, "integerValue");

  return v10;
}

- (void)setMaxDataRate:(id)a3 dataRate:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id location;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[PSUICoreTelephonyRegistrationCache setMaxDataRate:dataRate:]";
    v18 = 2048;
    v19 = a4;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "%s setting: %li, %@", buf, 0x20u);
  }

  location = 0;
  objc_initWeak(&location, self);
  -[CoreTelephonyClient setMaxDataRate:rate:](self->_client, "setMaxDataRate:rate:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[PSUICoreTelephonyRegistrationCache setMaxDataRate:dataRate:]";
      v18 = 2112;
      v19 = (int64_t)v8;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "%s set failed: %@", buf, 0x16u);
    }
  }
  else
  {
    -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "-[PSUICoreTelephonyRegistrationCache setMaxDataRate:dataRate:]";
      v18 = 2048;
      v19 = a4;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "%s set succeeded: %li, %@", buf, 0x20u);
    }

    v9 = objc_loadWeakRetained(&location);
    objc_sync_enter(v9);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained(&location);
    objc_msgSend(v12, "maxDataRateDict");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "slotID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v14);

    objc_sync_exit(v9);
  }

  objc_destroyWeak(&location);
}

- (void)dataRatesChanged
{
  NSObject *v3;
  PSUICoreTelephonyRegistrationCache *v4;
  void *v5;
  uint8_t v6[16];

  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Data Rates Changed. Clearing maxDataRate & supportedDataRates cache.", v6, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[PSUICoreTelephonyRegistrationCache setMaxDataRateDict:](v4, "setMaxDataRateDict:", 0);
  -[PSUICoreTelephonyRegistrationCache setSupportedDataRatesDict:](v4, "setSupportedDataRatesDict:", 0);
  objc_sync_exit(v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PSMaxDataRateChangedNotification"), 0);

}

- (void)fetchLocalizedOperatorName
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CoreTelephonyClient *client;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  PSUICoreTelephonyRegistrationCache *v17;
  __int128 v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[PSUICoreTelephonyRegistrationCache fetchLocalizedOperatorName]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v22;
    *(_QWORD *)&v8 = 136315650;
    v18 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        client = self->_client;
        v20 = 0;
        -[CoreTelephonyClient getLocalizedOperatorName:error:](client, "getLocalizedOperatorName:error:", v11, &v20, v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v20;
        -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136315394;
            v26 = "-[PSUICoreTelephonyRegistrationCache fetchLocalizedOperatorName]";
            v27 = 2112;
            v28 = v14;
            _os_log_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEFAULT, "%s fetch failed: %@", buf, 0x16u);
          }
        }
        else
        {
          if (v16)
          {
            *(_DWORD *)buf = v18;
            v26 = "-[PSUICoreTelephonyRegistrationCache fetchLocalizedOperatorName]";
            v27 = 2114;
            v28 = v13;
            v29 = 2112;
            v30 = v11;
            _os_log_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEFAULT, "%s fetch succeeded: %{public}@, %@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "slotID"));
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, v15);
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v7);
  }

  v17 = self;
  objc_sync_enter(v17);
  -[PSUICoreTelephonyRegistrationCache setOperatorNameDict:](v17, "setOperatorNameDict:", v19);
  objc_sync_exit(v17);

}

- (id)localizedOperatorName:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonyRegistrationCache *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PSUICoreTelephonyRegistrationCache operatorNameDict](self, "operatorNameDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonyRegistrationCache fetchLocalizedOperatorName](self, "fetchLocalizedOperatorName");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonyRegistrationCache operatorNameDict](v6, "operatorNameDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v9;
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CoreTelephonyClient *client;
  void *v10;
  id v11;
  NSObject *v12;
  PSUICoreTelephonyRegistrationCache *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[PSUICoreTelephonyRegistrationCache operatorNameChanged:name:]";
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", buf, 0x20u);
  }

  client = self->_client;
  v16 = 0;
  -[CoreTelephonyClient getLocalizedOperatorName:error:](client, "getLocalizedOperatorName:error:", v6, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;

  -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[PSUICoreTelephonyRegistrationCache operatorNameChanged:name:]";
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, "%s localized name: %@, %@", buf, 0x20u);
  }

  if (!v10 || v11)
  {
    -[PSUICoreTelephonyRegistrationCache getLogger](self, "getLogger");
    v13 = (PSUICoreTelephonyRegistrationCache *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "-[PSUICoreTelephonyRegistrationCache operatorNameChanged:name:]";
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      _os_log_error_impl(&dword_2161C6000, &v13->super, OS_LOG_TYPE_ERROR, "%s failed to localize operator name: %@, %@, %@", buf, 0x2Au);
    }
  }
  else
  {
    v13 = self;
    objc_sync_enter(v13);
    -[PSUICoreTelephonyRegistrationCache operatorNameDict](v13, "operatorNameDict");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "slotID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v15);

    objc_sync_exit(v13);
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("RegistrationCache"));
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSMutableDictionary)imsStatusVoiceDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImsStatusVoiceDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)imsStatusSMSDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setImsStatusSMSDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)rcsStatusDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRcsStatusDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)rejectCauseCodeDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRejectCauseCodeDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)supportedDataRatesDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSupportedDataRatesDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)maxDataRateDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMaxDataRateDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)operatorNameDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOperatorNameDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatorNameDict, 0);
  objc_storeStrong((id *)&self->_maxDataRateDict, 0);
  objc_storeStrong((id *)&self->_supportedDataRatesDict, 0);
  objc_storeStrong((id *)&self->_rejectCauseCodeDict, 0);
  objc_storeStrong((id *)&self->_rcsStatusDict, 0);
  objc_storeStrong((id *)&self->_imsStatusSMSDict, 0);
  objc_storeStrong((id *)&self->_imsStatusVoiceDict, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
