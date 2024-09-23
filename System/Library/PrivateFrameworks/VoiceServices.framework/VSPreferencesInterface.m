@implementation VSPreferencesInterface

+ (VSPreferencesInterface)defaultInstance
{
  if (defaultInstance_onceToken != -1)
    dispatch_once(&defaultInstance_onceToken, &__block_literal_global_2811);
  return (VSPreferencesInterface *)(id)defaultInstance_defaultInstance;
}

- (id)subscribedVoicesForClientID:(id)a3 accessoryID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  VSVoiceAsset *v22;
  void *v23;
  uint64_t v24;
  VSVoiceSubscription *v25;
  void *v27;
  id obj;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  id v54;
  _BYTE v55[128];
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSUserDefaults dictionaryForKey:](self->_defaults, "dictionaryForKey:", CFSTR("subscribedAssets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v27 = v7;
  if (v7)
  {
    v56[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v9;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v32)
  {
    v29 = *(_QWORD *)v49;
    v30 = v8;
    v31 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v49 != v29)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v10);
        objc_msgSend(v8, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v33 = v10;
        if (v6)
        {
          v54 = v6;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
        }
        else
        {
          objc_msgSend(v12, "allKeys");
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v34 = v14;
        v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v37)
        {
          v35 = *(_QWORD *)v45;
          v36 = v13;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v45 != v35)
                objc_enumerationMutation(v34);
              v38 = v15;
              v16 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v15);
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              objc_msgSend(v13, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
              if (v18)
              {
                v19 = v18;
                v20 = *(_QWORD *)v41;
                do
                {
                  for (i = 0; i != v19; ++i)
                  {
                    if (*(_QWORD *)v41 != v20)
                      objc_enumerationMutation(v17);
                    v22 = -[VSVoiceAsset initWithDictionaryRepresentation:]([VSVoiceAsset alloc], "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
                    -[VSVoiceAsset languages](v22, "languages");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = objc_msgSend(v23, "count");

                    if (v24)
                    {
                      v25 = -[VSVoiceSubscription initWithClient:accessory:voice:]([VSVoiceSubscription alloc], "initWithClient:accessory:voice:", v16, v11, v22);
                      objc_msgSend(v39, "addObject:", v25);

                    }
                  }
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
                }
                while (v19);
              }

              v15 = v38 + 1;
              v13 = v36;
            }
            while (v38 + 1 != v37);
            v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          }
          while (v37);
        }

        v10 = v33 + 1;
        v8 = v30;
        v6 = v31;
      }
      while (v33 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v32);
  }

  return v39;
}

- (VSPreferencesInterface)initWithSuiteName:(id)a3
{
  id v4;
  VSPreferencesInterface *v5;
  VSPreferencesInterface *v6;
  NSObject *v7;
  uint64_t v8;
  NSUserDefaults *defaults;
  uint8_t v11[16];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VSPreferencesInterface;
  v5 = -[VSPreferencesInterface init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    pthread_mutex_init(&v5->_lock, 0);
    if (geteuid() != 501)
    {
      VSGetLogDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_error_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_ERROR, "process is not running as user Mobile: it won't share the same UserDefaults as voiced", v11, 2u);
      }

    }
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v4);
    defaults = v6->_defaults;
    v6->_defaults = (NSUserDefaults *)v8;

    -[VSPreferencesInterface migrateDefaults](v6, "migrateDefaults");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)VSPreferencesInterface;
  -[VSPreferencesInterface dealloc](&v3, sel_dealloc);
}

- (void)migrateDefaults
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  -[NSUserDefaults arrayForKey:](self->_defaults, "arrayForKey:", CFSTR("Auto Downloaded Assets"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[NSUserDefaults dictionaryForKey:](self->_defaults, "dictionaryForKey:", CFSTR("autoDownloadedAssets"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("com.apple.AssistantServices"));
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v7, CFSTR("autoDownloadedAssets"));
    -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("Auto Downloaded Assets"));

  }
  -[NSUserDefaults dictionaryForKey:](self->_defaults, "dictionaryForKey:", CFSTR("autoDownloadedAssets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSUserDefaults dictionaryForKey:](self->_defaults, "dictionaryForKey:", CFSTR("subscribedAssets"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, &stru_1EA8B0C98);
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v13, CFSTR("subscribedAssets"));
    -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("autoDownloadedAssets"));

  }
}

- (void)setSubscribedVoices:(id)a3 forClientID:(id)a4 accessoryID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  char v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  VSDownloadMetrics *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  VSDownloadMetrics *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[VSPreferencesInterface dictionaryRepresentationOfVoices:](VSPreferencesInterface, "dictionaryRepresentationOfVoices:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_lock(&self->_lock);
  -[NSUserDefaults dictionaryForKey:](self->_defaults, "dictionaryForKey:", CFSTR("subscribedAssets"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  objc_msgSend(v16, "objectForKeyedSubscript:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v11, v9);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, v10);
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v16, CFSTR("subscribedAssets"));
  pthread_mutex_unlock(&self->_lock);
  if (!objc_msgSend(v10, "length")
    && objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.AssistantServices")))
  {
    soft_BYSetupAssistantNeedsToRun();
    if (v22 && !-[VSPreferencesInterface OOBNeedsToBeMeasured](self, "OOBNeedsToBeMeasured"))
    {
      -[VSPreferencesInterface setOOBNeedsToBeMeasured:](self, "setOOBNeedsToBeMeasured:", 1);
      -[VSPreferencesInterface setOOBTriggeredDate:](self, "setOOBTriggeredDate:", 0);
    }
    else
    {
      soft_BYSetupAssistantNeedsToRun();
      if ((v23 & 1) == 0)
      {
        objc_msgSend(v8, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSPreferencesInterface OOBTriggeredDate](self, "OOBTriggeredDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          VSGetLogEvent();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v24, "languages");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "firstObject");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "name");
            *(_DWORD *)buf = 138412546;
            v55 = v49;
            v56 = 2112;
            v57 = objc_claimAutoreleasedReturnValue();
            v27 = (void *)v57;
            _os_log_impl(&dword_1DE15E000, v26, OS_LOG_TYPE_DEFAULT, "OOB subscription start observed with %@ %@", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSPreferencesInterface setOOBTriggeredDate:](self, "setOOBTriggeredDate:", v28);

        }
        if (-[VSPreferencesInterface OOBNeedsToBeMeasured](self, "OOBNeedsToBeMeasured"))
        {
          +[VSMobileAssetsManager sharedManager](VSMobileAssetsManager, "sharedManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "preferredDownloadForVoice:", v24);
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v30;
          if (v30)
            v32 = (void *)v30;
          else
            v32 = v24;
          v33 = v32;

          +[VSMobileAssetsManager sharedManager](VSMobileAssetsManager, "sharedManager");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "languages");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "firstObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "name");
          v53 = v33;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "selectVoiceForLang:name:type:gender:footprint:", v46, v34, objc_msgSend(v33, "type"), objc_msgSend(v33, "gender"), objc_msgSend(v33, "footprint"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "voiceData");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v36, "footprint") >= 2)
          {
            v48 = [VSDownloadMetrics alloc];
            objc_msgSend(v36, "name");
            v37 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "languages");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "firstObject");
            v51 = v36;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v36, "gender");
            v41 = (void *)v37;
            v42 = -[VSDownloadMetrics initWithVoiceName:languageCode:gender:](v48, "initWithVoiceName:languageCode:gender:", v37, v39, v40);

            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "bundleIdentifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[VSDownloadMetrics setClientBundleIdentifier:](v42, "setClientBundleIdentifier:", v44);

            v36 = v51;
            -[VSDownloadMetrics setDownloadSize:](v42, "setDownloadSize:", &unk_1EA8BE6F8);
            LODWORD(v45) = 1.0;
            -[VSDownloadMetrics setDownloadProgress:](v42, "setDownloadProgress:", v45);
            +[VSAnalytics reportDownloadMetrics:](VSAnalytics, "reportDownloadMetrics:", v42);

          }
          v24 = v53;
        }

      }
    }
  }

}

- (void)removeSubscriptionsForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pthread_mutex_lock(&self->_lock);
  -[NSUserDefaults dictionaryForKey:](self->_defaults, "dictionaryForKey:", CFSTR("subscribedAssets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_DEFAULT, "clearing auto-downloaded voice preferences for accessory %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v6, CFSTR("subscribedAssets"));
  pthread_mutex_unlock(&self->_lock);

}

- (NSDate)OOBTriggeredDate
{
  return (NSDate *)-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("OOBTriggeredDate"));
}

- (void)setOOBTriggeredDate:(id)a3
{
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", a3, CFSTR("OOBTriggeredDate"));
}

- (BOOL)OOBNeedsToBeMeasured
{
  return -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("OOBNeedsToBeMeasured"));
}

- (void)setOOBNeedsToBeMeasured:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", a3, CFSTR("OOBNeedsToBeMeasured"));
}

- (void)setLastTTSRequestDate:(id)a3
{
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", a3, CFSTR("lastTTSRequestDate"));
}

- (NSDate)lastTTSRequestDate
{
  return (NSDate *)-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("lastTTSRequestDate"));
}

- (NSString)deviceUUID
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSUserDefaults stringForKey:](self->_defaults, "stringForKey:", CFSTR("deviceID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v5, CFSTR("deviceID"));
  }

  return (NSString *)v5;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (_opaque_pthread_mutex_t)lock
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->__opaque[24];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[8];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self->__opaque[40];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setLock:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[8];
  v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_lock.__opaque[40] = v5;
  *(_OWORD *)&self->_lock.__sig = v3;
  *(_OWORD *)&self->_lock.__opaque[8] = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

+ (id)dictionaryRepresentationOfVoices:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v31;
    *(_QWORD *)&v5 = 138543618;
    v25 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v9, "languages", v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        +[VSSpeechSynthesizerPreference availableLanguages](VSSpeechSynthesizerPreference, "availableLanguages");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v11);

        if ((v13 & 1) == 0)
        {
          +[VSSpeechSynthesizerPreference fallbackLanguageForLanguage:](VSSpeechSynthesizerPreference, "fallbackLanguageForLanguage:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setLanguages:", v15);

          VSGetLogDefault();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v36 = v11;
            v37 = 2114;
            v38 = v14;
            _os_log_impl(&dword_1DE15E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ is not TTS language, fallback to %{public}@", buf, 0x16u);
          }

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v3;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "dictionaryRepresentation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  return v17;
}

void __41__VSPreferencesInterface_defaultInstance__block_invoke()
{
  VSPreferencesInterface *v0;
  void *v1;

  v0 = -[VSPreferencesInterface initWithSuiteName:]([VSPreferencesInterface alloc], "initWithSuiteName:", CFSTR("com.apple.voiceservices"));
  v1 = (void *)defaultInstance_defaultInstance;
  defaultInstance_defaultInstance = (uint64_t)v0;

}

@end
