@implementation SSRVoiceProfileStore

- (id)initStore
{
  SSRVoiceProfileStore *v2;
  uint64_t v3;
  SSRVoiceProfileStorePrefs *storePrefs;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSRVoiceProfileStore;
  v2 = -[SSRVoiceProfileStore init](&v8, sel_init);
  if (v2)
  {
    +[SSRVoiceProfileStorePrefs sharedStorePrefs](SSRVoiceProfileStorePrefs, "sharedStorePrefs");
    v3 = objc_claimAutoreleasedReturnValue();
    storePrefs = v2->_storePrefs;
    v2->_storePrefs = (SSRVoiceProfileStorePrefs *)v3;

    -[SSRVoiceProfileStore _loadVoiceProfiles](v2, "_loadVoiceProfiles");
    v5 = dispatch_queue_create("com.apple.corespeech.voiceprofilestore", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (id)userVoiceProfilesForAppDomain:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[SSRVoiceProfileStore _loadVoiceProfiles](self, "_loadVoiceProfiles");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_voiceProfileArray;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "appDomain", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
      v14 = v5;
    else
      v14 = 0;
    v15 = v14;

  }
  else
  {
    v16 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[SSRVoiceProfileStore userVoiceProfilesForAppDomain:]";
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s ERR: appDomain passed as nil", buf, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

- (id)userVoiceProfilesForAppDomain:(id)a3 forLocale:(id)a4
{
  void *v4;
  id v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SSRVoiceProfileStore _loadVoiceProfiles](self, "_loadVoiceProfiles");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = self->_voiceProfileArray;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v10)
    goto LABEL_19;
  v11 = v10;
  v12 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      if (v7)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "appDomain");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "isEqualToString:", v7) & 1) == 0)
        {

          continue;
        }
        if (!v8)
        {

LABEL_16:
          objc_msgSend(v20, "addObject:", v14);
          continue;
        }
      }
      else if (!v8)
      {
        goto LABEL_16;
      }
      objc_msgSend(v14, "locale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v8);

      if (!v7)
      {
        if (!v16)
          continue;
        goto LABEL_16;
      }

      if ((v16 & 1) != 0)
        goto LABEL_16;
    }
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v11);
LABEL_19:

  if (objc_msgSend(v20, "count"))
    v17 = v20;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

- (id)userVoiceProfilesForLocale:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[SSRVoiceProfileStore _loadVoiceProfiles](self, "_loadVoiceProfiles");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_voiceProfileArray;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "locale", (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v4);

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
      v14 = v5;
    else
      v14 = 0;
    v15 = v14;

  }
  else
  {
    v16 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[SSRVoiceProfileStore userVoiceProfilesForLocale:]";
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s ERR: locale passed as nil", buf, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

- (id)userVoiceProfileForVoiceProfileID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[SSRVoiceProfileStore _loadVoiceProfiles](self, "_loadVoiceProfiles");
    v5 = self->_voiceProfileArray;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "profileID", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if ((v12 & 1) != 0)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)migrateVoiceProfilesIfNeededWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__SSRVoiceProfileStore_migrateVoiceProfilesIfNeededWithCompletionBlock___block_invoke;
  block[3] = &unk_24CC86148;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (BOOL)cleanupDuplicatedProfiles
{
  NSObject *queue;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (CSIsIOS())
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__SSRVoiceProfileStore_cleanupDuplicatedProfiles__block_invoke;
    v6[3] = &unk_24CC864E8;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(queue, v6);
  }
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)cleanupInvalidSiriProfilesFromPersonalDevicesForLanguage:(id)a3 appDomain:(id)a4
{
  id v4;
  SSRVoiceProfileStoreCleaner *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = objc_alloc_init(SSRVoiceProfileStoreCleaner);
  objc_msgSend(MEMORY[0x24BE28488], "getSiriLanguageWithFallback:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfileStoreCleaner deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:appDomain:](v5, "deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:appDomain:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v7, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[SSRVoiceProfileStore cleanupInvalidSiriProfilesFromPersonalDevicesForLanguage:appDomain:]";
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Deleted invalid Siri profile with err: %{public}@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)cleanupVoiceProfileStore:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke;
  block[3] = &unk_24CC86148;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)cleanupVoiceProfileModelFilesForLocale:(id)a3 withAsset:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SSRVoiceProfileStore *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__SSRVoiceProfileStore_cleanupVoiceProfileModelFilesForLocale_withAsset___block_invoke;
  block[3] = &unk_24CC861E0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (void)_synchronizeSiriVoiceProfilesWithAssistant
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SSRVoiceProfileStore__synchronizeSiriVoiceProfilesWithAssistant__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)isImplicitTrainingRequiredToVoiceProfile:(id)a3 withAsset:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  SSRVoiceProfileStore *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __86__SSRVoiceProfileStore_isImplicitTrainingRequiredToVoiceProfile_withAsset_completion___block_invoke;
  v15[3] = &unk_24CC86358;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (void)addImplicitUtterance:(id)a3 toVoiceProfile:(id)a4 withAsset:(id)a5 withTriggerSource:(id)a6 withAudioInput:(id)a7 withCompletion:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  SSRVoiceProfileStore *v23;
  id v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a8;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke;
  block[3] = &unk_24CC86288;
  v22 = v14;
  v23 = self;
  v25 = v12;
  v26 = v15;
  v24 = v13;
  v17 = v12;
  v18 = v15;
  v19 = v13;
  v20 = v14;
  dispatch_async(queue, block);

}

- (void)logVoiceProfileConfusionWithCleanup:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__SSRVoiceProfileStore_logVoiceProfileConfusionWithCleanup___block_invoke;
  v4[3] = &unk_24CC862B0;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)_logVoiceProfileConfusionWithCleanup:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SSRVoiceProfileRetrainingContext *v16;
  SSRVoiceProfileRetrainingContext *v17;
  id v18;
  SSRVoiceProfileRetrainerFactory *v19;
  void *v20;
  SSRVoiceProfileRetrainingContext *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  SSRVoiceProfileStore *v27;
  uint64_t v29;
  _QWORD v30[4];
  SSRVoiceProfileRetrainingContext *v31;
  SSRVoiceProfileStore *v32;
  uint64_t v33;
  id v34;
  BOOL v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  _QWORD v42[5];
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE28488], "getSiriLanguageWithFallback:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "installedAssetOfType:forLanguage:", 3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SSRVoiceProfileStore userVoiceProfilesForAppDomain:forLocale:](self, "userVoiceProfilesForAppDomain:forLocale:", CFSTR("com.apple.siri"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      v27 = self;
      v24 = v7;
      v25 = v4;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v9 = v7;
      v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v29)
      {
        v26 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v38 != v26)
              objc_enumerationMutation(v9);
            v11 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            v12 = (void *)MEMORY[0x212BE17E4]();
            CSIsIOS();
            v41[0] = CFSTR("SSRVoiceRetrainingVoiceProfile");
            v41[1] = CFSTR("SSRVoiceRetrainingCompareVoiceProfiles");
            v42[0] = v11;
            v42[1] = v9;
            v41[2] = CFSTR("SSRVoiceRetrainingCompareVoiceProfilesSpIdType");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v42[2] = v13;
            v42[3] = v6;
            v41[3] = CFSTR("SSRVoiceRetrainingAsset");
            v41[4] = CFSTR("SSRVoiceRetrainingSpIdType");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v42[4] = v14;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 5);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = [SSRVoiceProfileRetrainingContext alloc];
            v36 = 0;
            v17 = -[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:](v16, "initWithVoiceRetrainingContext:error:", v15, &v36);
            v18 = v36;
            v19 = objc_alloc_init(SSRVoiceProfileRetrainerFactory);
            -[SSRVoiceProfileRetrainerFactory voiceRetrainersWithContext:](v19, "voiceRetrainersWithContext:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v30[0] = MEMORY[0x24BDAC760];
            v30[1] = 3221225472;
            v30[2] = __61__SSRVoiceProfileStore__logVoiceProfileConfusionWithCleanup___block_invoke;
            v30[3] = &unk_24CC86300;
            v35 = a3;
            v31 = v17;
            v32 = v27;
            v33 = v11;
            v34 = v6;
            v21 = v17;
            objc_msgSend(v20, "enumerateObjectsUsingBlock:", v30);

            objc_autoreleasePoolPop(v12);
          }
          v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v29);
      }

      v8 = v24;
      v4 = v25;
    }
    else
    {
      v23 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[SSRVoiceProfileStore _logVoiceProfileConfusionWithCleanup:]";
        _os_log_error_impl(&dword_2117D4000, v23, OS_LOG_TYPE_ERROR, "%s assetForLocale is nil - Bail out", buf, 0xCu);
      }
    }

  }
  else
  {
    v22 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[SSRVoiceProfileStore _logVoiceProfileConfusionWithCleanup:]";
      _os_log_error_impl(&dword_2117D4000, v22, OS_LOG_TYPE_ERROR, "%s Locale is nil - Bail out", buf, 0xCu);
    }
  }

}

- (BOOL)evaluateImplicitAdditionPolicyWithScores:(id)a3 forProfile:(id)a4 withImplicitThreshold:(float)a5 withDeltaThreshold:(float)a6
{
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  void *v20;
  float v21;
  float v22;
  NSObject *v23;
  BOOL v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  NSObject *v36;
  double v37;
  int v38;
  const char *v39;
  __int16 v40;
  double v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v10 = COERCE_DOUBLE(a3);
  v11 = a4;
  v12 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(*(id *)&v10, "objectForKeyedSubscript:", CFSTR("spIdKnownUserScores"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSRVoiceProfileStore _getTopScoringProfileIdFromScores:](self, "_getTopScoringProfileIdFromScores:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v18 = v17;

    objc_msgSend(v14, "removeObjectForKey:", v15);
    -[SSRVoiceProfileStore _getTopScoringProfileIdFromScores:](self, "_getTopScoringProfileIdFromScores:", v14);
    v19 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (v19 == 0.0)
    {
      v22 = 0.0;
    }
    else
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)&v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21;

    }
    objc_msgSend(v11, "profileID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v15, "isEqualToString:", v25);

    v27 = (void *)*MEMORY[0x24BE284B8];
    v28 = *MEMORY[0x24BE284B8];
    if ((v26 & 1) == 0)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v36 = v27;
        objc_msgSend(v11, "profileID");
        v37 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v38 = 136316418;
        v39 = "-[SSRVoiceProfileStore evaluateImplicitAdditionPolicyWithScores:forProfile:withImplicitThreshold:withDeltaThreshold:]";
        v40 = 2050;
        v41 = v18;
        v42 = 2114;
        v43 = v15;
        v44 = 2050;
        v45 = v22;
        v46 = 2114;
        v47 = v19;
        v48 = 2114;
        v49 = v37;
        _os_log_error_impl(&dword_2117D4000, v36, OS_LOG_TYPE_ERROR, "%s ERR: Utterance scored %{public}f (%{public}@) with next top score %{public}f (%{public}@) for profileId %{public}@", (uint8_t *)&v38, 0x3Eu);

      }
      v24 = 0;
      goto LABEL_21;
    }
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v19 == 0.0)
    {
      if (!v29)
        goto LABEL_18;
      v30 = v27;
      objc_msgSend(v11, "profileID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 136316162;
      v39 = "-[SSRVoiceProfileStore evaluateImplicitAdditionPolicyWithScores:forProfile:withImplicitThreshold:withDeltaThreshold:]";
      v40 = 2050;
      v41 = v18;
      v42 = 2114;
      v43 = v31;
      v44 = 2050;
      v45 = a5;
      v46 = 2050;
      v47 = a6;
      v32 = "%s Utterance scored %{public}f for %{public}@ and thresholds (%{public}f, %{public}f)";
      v33 = v30;
      v34 = 52;
    }
    else
    {
      if (!v29)
        goto LABEL_18;
      v30 = v27;
      objc_msgSend(v11, "profileID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 136316674;
      v39 = "-[SSRVoiceProfileStore evaluateImplicitAdditionPolicyWithScores:forProfile:withImplicitThreshold:withDeltaThreshold:]";
      v40 = 2050;
      v41 = v18;
      v42 = 2114;
      v43 = v31;
      v44 = 2050;
      v45 = v22;
      v46 = 2114;
      v47 = v19;
      v48 = 2050;
      v49 = a5;
      v50 = 2050;
      v51 = a6;
      v32 = "%s Utterance scored %{public}f (%{public}@) with next top score %{public}f (%{public}@) and thresholds (%{pu"
            "blic}f, %{public}f)";
      v33 = v30;
      v34 = 72;
    }
    _os_log_impl(&dword_2117D4000, v33, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v38, v34);

LABEL_18:
    v24 = (float)(v18 - v22) > a6 && v18 > a5;
LABEL_21:

    goto LABEL_22;
  }
  v23 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v38 = 136315394;
    v39 = "-[SSRVoiceProfileStore evaluateImplicitAdditionPolicyWithScores:forProfile:withImplicitThreshold:withDeltaThreshold:]";
    v40 = 2114;
    v41 = v10;
    _os_log_error_impl(&dword_2117D4000, v23, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get top scorer in %{public}@ - Bailing out", (uint8_t *)&v38, 0x16u);
  }
  v24 = 0;
LABEL_22:

  return v24;
}

- (id)_getTopScoringProfileIdFromScores:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6860;
  v13 = __Block_byref_object_dispose__6861;
  v14 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__6860;
  v7[4] = __Block_byref_object_dispose__6861;
  v8 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__SSRVoiceProfileStore__getTopScoringProfileIdFromScores___block_invoke;
  v6[3] = &unk_24CC86330;
  v6[4] = v7;
  v6[5] = &v9;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v10[5];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)addUserVoiceProfile:(id)a3 withContext:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  SSRVoiceProfileStore *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__SSRVoiceProfileStore_addUserVoiceProfile_withContext_withCompletion___block_invoke;
  v15[3] = &unk_24CC86358;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (id)deleteUserVoiceProfile:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6860;
  v16 = __Block_byref_object_dispose__6861;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SSRVoiceProfileStore_deleteUserVoiceProfile___block_invoke;
  block[3] = &unk_24CC86380;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_deleteUserVoiceProfile:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (os_log_t *)MEMORY[0x24BE284B8];
    v6 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[SSRVoiceProfileStore _deleteUserVoiceProfile:]";
      v36 = 2114;
      v37 = v4;
      _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s Deleting VoiceProfile %{public}@", buf, 0x16u);
    }
    objc_msgSend(v4, "voiceProfileBasePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "voiceProfileBasePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      objc_msgSend(v8, "removeItemAtPath:error:", v9, &v27);
      v10 = v27;

      if (!v10)
      {
        v17 = 0;
        goto LABEL_17;
      }
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v4, "voiceProfileBasePath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Deleting profile data at %@ failed with error %@"), v12, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[SSRVoiceProfileStore _deleteUserVoiceProfile:]";
        v36 = 2112;
        v37 = v13;
        _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s Err: %@", buf, 0x16u);
      }
      v15 = (void *)MEMORY[0x24BDD1540];
      v30 = CFSTR("reason");
      v31 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 706, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Profile path is nil!"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[SSRVoiceProfileStore _deleteUserVoiceProfile:]";
        v36 = 2114;
        v37 = v13;
        _os_log_error_impl(&dword_2117D4000, v24, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
      }
      v25 = (void *)MEMORY[0x24BDD1540];
      v28 = CFSTR("reason");
      v29 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 725, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_17:
    -[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:](self, "_updateTrainedUsersWithAction:UserVoiceProfile:", 0, v4);
    v23 = v17;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Profile is nil!"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[SSRVoiceProfileStore _deleteUserVoiceProfile:]";
    v36 = 2114;
    v37 = v18;
    _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
  }
  v20 = (void *)MEMORY[0x24BDD1540];
  v32 = CFSTR("reason");
  v33 = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 724, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v22;
LABEL_18:

  return v23;
}

- (BOOL)checkIfVoiceProfile:(id)a3 needsUpdatedWith:(id)a4 withCategory:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "voiceProfileIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("enrollment_version.json"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[SSRUtils getVoiceProfileIdentityFromVersionFilePath:](SSRUtils, "getVoiceProfileIdentityFromVersionFilePath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a5 == 5 && v11 && (!v9 || (objc_msgSend(v11, "isEqualToString:", v9) & 1) == 0))
  {
    v19 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v7, "profileID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 136316162;
      v26 = "-[SSRVoiceProfileStore checkIfVoiceProfile:needsUpdatedWith:withCategory:]";
      v27 = 2114;
      v28 = v21;
      v29 = 2114;
      v30 = v9;
      v31 = 2114;
      v32 = v12;
      v33 = 1026;
      v34 = 5;
      _os_log_impl(&dword_2117D4000, v20, OS_LOG_TYPE_DEFAULT, "%s Needs Retraining Profile %{public}@ - existing {%{public}@} downloaded {%{public}@, %{public}d}", (uint8_t *)&v25, 0x30u);

    }
    goto LABEL_13;
  }
  v13 = objc_msgSend(v7, "profileLocallyAvailable");
  v14 = (void *)*MEMORY[0x24BE284B8];
  v15 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) == 0)
  {
    if (v15)
    {
      v22 = v14;
      objc_msgSend(v7, "profileID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 136316162;
      v26 = "-[SSRVoiceProfileStore checkIfVoiceProfile:needsUpdatedWith:withCategory:]";
      v27 = 2114;
      v28 = v23;
      v29 = 2114;
      v30 = v9;
      v31 = 2114;
      v32 = v12;
      v33 = 1026;
      v34 = a5;
      _os_log_impl(&dword_2117D4000, v22, OS_LOG_TYPE_DEFAULT, "%s Needs Retraining storage for Profile %{public}@ - existing {%{public}@} downloaded {%{public}@, %{public}d}", (uint8_t *)&v25, 0x30u);

    }
LABEL_13:
    v18 = 1;
    goto LABEL_14;
  }
  if (v15)
  {
    v16 = v14;
    objc_msgSend(v7, "profileID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 136316162;
    v26 = "-[SSRVoiceProfileStore checkIfVoiceProfile:needsUpdatedWith:withCategory:]";
    v27 = 2114;
    v28 = v17;
    v29 = 2114;
    v30 = v9;
    v31 = 2114;
    v32 = v12;
    v33 = 1026;
    v34 = a5;
    _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s Skipping Profile %{public}@ - existing {%{public}@} downloaded {%{public}@, %{public}d}", (uint8_t *)&v25, 0x30u);

  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (BOOL)_checkIfRetrainingRequiredForProfile:(id)a3
{
  id v3;
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  char v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__SSRVoiceProfileStore__checkIfRetrainingRequiredForProfile___block_invoke;
  v8[3] = &unk_24CC863B0;
  v9 = v3;
  v4 = v3;
  v5 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x212BE197C](v8);
  if ((v5[2](v5, 3) & 1) != 0)
    v6 = 1;
  else
    v6 = v5[2](v5, 4);

  return v6;
}

- (void)retrainVoiceProfile:(id)a3 withContext:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  SSRVoiceProfileStore *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__SSRVoiceProfileStore_retrainVoiceProfile_withContext_withCompletion___block_invoke;
  v15[3] = &unk_24CC86358;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)_loadVoiceProfiles
{
  NSMutableArray *v3;
  NSMutableArray *voiceProfileArray;

  -[SSRVoiceProfileStore _enrolledVoiceProfiles](self, "_enrolledVoiceProfiles");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  voiceProfileArray = self->_voiceProfileArray;
  self->_voiceProfileArray = v3;

}

- (id)_enrolledVoiceProfiles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_t *v8;
  uint64_t i;
  SSRVoiceProfile *v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfileStorePrefs loadKnownUserVoiceProfiles](self->_storePrefs, "loadKnownUserVoiceProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = (os_log_t *)MEMORY[0x24BE284B8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = -[SSRVoiceProfile initWithDictionary:]([SSRVoiceProfile alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        if (v10)
        {
          objc_msgSend(v3, "addObject:", v10);
        }
        else
        {
          v11 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v18 = "-[SSRVoiceProfileStore _enrolledVoiceProfiles]";
            _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s voiceProfile is nil!", buf, 0xCu);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_updateTrainedUsersWithAction:(unint64_t)a3 UserVoiceProfile:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[SSRVoiceProfileStore _enrolledVoiceProfiles](self, "_enrolledVoiceProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__SSRVoiceProfileStore__updateTrainedUsersWithAction_UserVoiceProfile___block_invoke;
  v17[3] = &unk_24CC863D8;
  v8 = v6;
  v18 = v8;
  v19 = &v25;
  v20 = &v21;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);
  if (a3 - 1 < 2)
  {
    if (*((_BYTE *)v26 + 24))
    {
      objc_msgSend(v7, "objectAtIndex:", v22[3]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v30 = "-[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:]";
        v31 = 2112;
        v32 = (unint64_t)v8;
        v33 = 2112;
        v34 = v9;
        _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Updating User Voice Profile to %@ from %@", buf, 0x20u);
      }
      objc_msgSend(v7, "removeObjectAtIndex:", v22[3]);
      objc_msgSend(v7, "addObject:", v8);

    }
    else
    {
      v16 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:]";
        v31 = 2112;
        v32 = (unint64_t)v8;
        _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s Adding User Voice Profile %@", buf, 0x16u);
      }
      objc_msgSend(v7, "addObject:", v8);
    }
LABEL_16:
    -[SSRVoiceProfileStore _saveTrainedUsers:](self, "_saveTrainedUsers:", v7);
    -[SSRVoiceProfileStore _loadVoiceProfiles](self, "_loadVoiceProfiles");
    goto LABEL_17;
  }
  if (!a3)
  {
    v11 = *MEMORY[0x24BE284B8];
    v12 = *MEMORY[0x24BE284B8];
    if (*((_BYTE *)v26 + 24))
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:]";
        v31 = 2112;
        v32 = (unint64_t)v8;
        _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s Deleting User Voice Profile %@", buf, 0x16u);
      }
      objc_msgSend(v7, "removeObjectAtIndex:", v22[3]);
      goto LABEL_16;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136315394;
    v30 = "-[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:]";
    v31 = 2112;
    v32 = (unint64_t)v8;
    v14 = "%s User Voice Profile not found %@ - Bailing out";
    v15 = v11;
LABEL_20:
    _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
    goto LABEL_17;
  }
  v13 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:]";
    v31 = 2048;
    v32 = a3;
    v14 = "%s ERR: UserVoiceProfile Action undefined %ld - Bailing out";
    v15 = v13;
    goto LABEL_20;
  }
LABEL_17:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

}

- (void)_saveTrainedUsers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "dictionaryRepresentation", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[SSRVoiceProfileStorePrefs setVoiceProfileStoreVersion:](self->_storePrefs, "setVoiceProfileStoreVersion:", 1);
  -[SSRVoiceProfileStorePrefs saveKnownUserVoiceProfiles:](self->_storePrefs, "saveKnownUserVoiceProfiles:", v5);

}

- (id)updateVoiceProfile:(id)a3 withUserName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "profileID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfileStore userVoiceProfileForVoiceProfileID:](self, "userVoiceProfileForVoiceProfileID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "setUserName:", v7);
    v10 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v6, "profileID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v22 = "-[SSRVoiceProfileStore updateVoiceProfile:withUserName:]";
      v23 = 2114;
      v24 = v12;
      v25 = 2114;
      v26 = v7;
      _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s Updating profile %{public}@ with userName %{public}@", buf, 0x20u);

    }
    -[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:](self, "_updateTrainedUsersWithAction:UserVoiceProfile:", 2, v9);
    v13 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "profileID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Voice Profile not found for profileId: %@ - Bailing out"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SSRVoiceProfileStore updateVoiceProfile:withUserName:]";
      v23 = 2114;
      v24 = v16;
      _os_log_error_impl(&dword_2117D4000, v17, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    v18 = (void *)MEMORY[0x24BDD1540];
    v27 = CFSTR("reason");
    v28[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 731, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)updateVoiceProfile:(id)a3 withUserName:(id)a4 withBasePathExclave:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "profileID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfileStore userVoiceProfileForVoiceProfileID:](self, "userVoiceProfileForVoiceProfileID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (v10)
    {
      objc_msgSend(v12, "setUserName:", v9);
      objc_msgSend(v12, "updateVoiceProfilePathExclave:", v10);
      v13 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        objc_msgSend(v8, "profileID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v25 = "-[SSRVoiceProfileStore updateVoiceProfile:withUserName:withBasePathExclave:]";
        v26 = 2114;
        v27 = v15;
        v28 = 2114;
        v29 = v10;
        _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s Updating profile %{public}@ with basePath %{public}@", buf, 0x20u);

      }
      -[SSRVoiceProfileStore _updateTrainedUsersWithAction:UserVoiceProfile:](self, "_updateTrainedUsersWithAction:UserVoiceProfile:", 2, v12);
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 758, &unk_24CC9A090);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "profileID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Voice Profile not found for profileId: %@ - Bailing out"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[SSRVoiceProfileStore updateVoiceProfile:withUserName:withBasePathExclave:]";
      v26 = 2114;
      v27 = v19;
      _os_log_error_impl(&dword_2117D4000, v20, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    v21 = (void *)MEMORY[0x24BDD1540];
    v30 = CFSTR("reason");
    v31[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 731, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)_retrainLiveOnOnboardedProfilesForLanguage:(id)a3 withForceRetrain:(BOOL)a4 withCompletion:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SSRVoiceProfileRetrainingContext *v17;
  SSRVoiceProfileRetrainingContext *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id obj;
  void (**v43)(id, void *);
  uint64_t v44;
  _BOOL4 v45;
  uint64_t v46;
  SSRVoiceProfileStore *v47;
  void *v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  double v60;
  __int16 v61;
  double v62;
  const __CFString *v63;
  void *v64;
  _QWORD v65[3];
  _QWORD v66[3];
  _BYTE v67[128];
  uint64_t v68;

  v45 = a4;
  v68 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v43 = (void (**)(id, void *))a5;
  v47 = self;
  -[SSRVoiceProfileStore userVoiceProfilesForAppDomain:forLocale:](self, "userVoiceProfilesForAppDomain:forLocale:", CFSTR("com.apple.siridebug"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v56 = "-[SSRVoiceProfileStore _retrainLiveOnOnboardedProfilesForLanguage:withForceRetrain:withCompletion:]";
    v57 = 2114;
    v58 = v7;
    v59 = 1024;
    LODWORD(v60) = v45;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Retraining for locale %{public}@ with force %d", buf, 0x1Cu);
  }
  v41 = v7;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v8;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
  v10 = 0;
  if (v46)
  {
    v49 = 0;
    v44 = *(_QWORD *)v52;
    do
    {
      v11 = 0;
      v12 = v10;
      do
      {
        if (*(_QWORD *)v52 != v44)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = CFSTR("SSRVoiceRetrainingVoiceProfile");
        v65[1] = CFSTR("SSRVoiceRetrainingFilterToVoiceTriggerUtterances");
        v66[0] = v13;
        v66[1] = MEMORY[0x24BDBD1C8];
        v65[2] = CFSTR("SSRVoiceRetrainingForce");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v45);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v66[2] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = [SSRVoiceProfileRetrainingContext alloc];
        v50 = v12;
        v18 = -[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:](v17, "initWithVoiceRetrainingContext:error:", v16, &v50);
        v10 = v50;

        if (v10)
        {
          v19 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v13, "profileID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("Failed to init retrainCtxt for profileID %@ with error %@"), v20, v10);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v56 = "-[SSRVoiceProfileStore _retrainLiveOnOnboardedProfilesForLanguage:withForceRetrain:withCompletion:]";
            v57 = 2112;
            v58 = v48;
            _os_log_error_impl(&dword_2117D4000, v21, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
          }
          if (v43)
          {
            v22 = (void *)MEMORY[0x24BDD1540];
            v63 = CFSTR("reason");
            v64 = v48;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 756, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v43[2](v43, v24);

          }
          -[SSRVoiceProfileStore _retrainVoiceProfile:withContext:](v47, "_retrainVoiceProfile:withContext:", v13, v18);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "timeIntervalSinceDate:", v14);
          v28 = v27 * 1000.0;
          v29 = (void *)*MEMORY[0x24BE284B8];
          v30 = *MEMORY[0x24BE284B8];
          if (v25)
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v31 = v29;
              objc_msgSend(v13, "profileID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v56 = "-[SSRVoiceProfileStore _retrainLiveOnOnboardedProfilesForLanguage:withForceRetrain:withCompletion:]";
              v57 = 2114;
              v58 = v32;
              v59 = 2114;
              v60 = *(double *)&v25;
              v61 = 2050;
              v62 = v28;
              _os_log_error_impl(&dword_2117D4000, v31, OS_LOG_TYPE_ERROR, "%s ERR: Retraining failed for %{public}@ with error %{public}@ in %{public}fms", buf, 0x2Au);

            }
          }
          else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v33 = v29;
            objc_msgSend(v13, "profileID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v56 = "-[SSRVoiceProfileStore _retrainLiveOnOnboardedProfilesForLanguage:withForceRetrain:withCompletion:]";
            v57 = 2114;
            v58 = v34;
            v59 = 2050;
            v60 = v28;
            _os_log_impl(&dword_2117D4000, v33, OS_LOG_TYPE_DEFAULT, "%s Retraining successfully finished for %{public}@ in %{public}fms", buf, 0x20u);

          }
        }
        else
        {
          v25 = v49;
        }
        -[SSRVoiceProfileStore _retrainVoiceProfile:withContext:](v47, "_retrainVoiceProfile:withContext:", v13, v18);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "timeIntervalSinceDate:", v14);
        v37 = v36;
        v38 = (void *)*MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          v39 = v38;
          objc_msgSend(v13, "profileID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v56 = "-[SSRVoiceProfileStore _retrainLiveOnOnboardedProfilesForLanguage:withForceRetrain:withCompletion:]";
          v57 = 2112;
          v58 = v40;
          v59 = 2112;
          v60 = *(double *)&v49;
          v61 = 2048;
          v62 = v37 * 1000.0;
          _os_log_impl(&dword_2117D4000, v39, OS_LOG_TYPE_DEFAULT, "%s Retraining finished for %@ with error %@ in %fms", buf, 0x2Au);

        }
        ++v11;
        v12 = v10;
      }
      while (v46 != v11);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    }
    while (v46);
  }
  else
  {
    v49 = 0;
  }

  if (v43)
    v43[2](v43, v49);

}

- (id)_retrainVoiceProfile:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  os_log_t *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id *v16;
  const __CFString **v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  SSRVoiceProfileRetrainingContext *v59;
  void *v60;
  void *v61;
  void *v62;
  os_log_t *v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  unint64_t v81;
  void *contexta;
  void *context;
  int v84;
  void *v85;
  void *v86;
  id v87;
  SSRVoiceProfileStore *v88;
  void *v89;
  void *v90;
  id v91;
  const __CFString *v92;
  void *v93;
  _QWORD v94[3];
  _QWORD v95[3];
  uint8_t buf[4];
  const char *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  id v101;
  __int16 v102;
  void *v103;
  const __CFString *v104;
  id v105;
  const __CFString *v106;
  id v107;
  const __CFString *v108;
  _QWORD v109[3];

  v109[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "appDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.siri"));

  v10 = (os_log_t *)MEMORY[0x24BE284B8];
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VoiceProfile is nil - Bailing out"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v18 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
      v98 = 2112;
      v99 = (uint64_t)v12;
      _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    v108 = CFSTR("reason");
    v109[0] = v12;
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = (id *)v109;
    v17 = &v108;
    goto LABEL_13;
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("context is nil - Bailing out"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v19 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
      v98 = 2112;
      v99 = (uint64_t)v12;
      _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    v106 = CFSTR("reason");
    v107 = v12;
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = &v107;
    v17 = &v106;
    goto LABEL_13;
  }
  v11 = objc_msgSend(v7, "spIdType");
  if ((unint64_t)(v11 - 6) > 0xFFFFFFFFFFFFFFFALL)
  {
    v84 = v9;
    v88 = self;
    v23 = +[SSRUtils explicitSpIdTypeForSpId:](SSRUtils, "explicitSpIdTypeForSpId:", v11);
    objc_msgSend(v6, "getEnrollmentUtterancesForModelType:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v23;
    objc_msgSend(v6, "getEnrollmentUtterancesForModelType:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v20, "mutableCopy");
    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "profileID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("SSRVoiceProfileStore retrainer - %@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_retainAutorelease(v28);
    objc_msgSend(v29, "UTF8String");
    v30 = os_transaction_create();
    v31 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
      v98 = 2048;
      v99 = v30;
      v100 = 2114;
      v101 = v29;
      _os_log_impl(&dword_2117D4000, v31, OS_LOG_TYPE_DEFAULT, "%s Creating OS Transaction %p for %{public}@", buf, 0x20u);
    }
    v32 = (void *)MEMORY[0x212BE17E4]();
    v86 = (void *)v30;
    v87 = v29;
    if (!objc_msgSend(v7, "filterToVoiceTriggerUtterances"))
    {
LABEL_31:
      objc_autoreleasePoolPop(v32);
      context = (void *)MEMORY[0x212BE17E4]();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = (void *)v25;
      -[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:](v88, "_retrainVoiceProfile:withContext:withUtterances:", v6, v7, v25);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "timeIntervalSinceDate:", v44);
      v48 = v47;
      objc_msgSend(v7, "logAggregator");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setRetrainingWaitTime:", v48);

      if (v45)
      {
        v50 = objc_msgSend(v45, "code");
        objc_msgSend(v7, "logAggregator");
        v51 = v24;
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setVoiceProfileRetrainingFailureReasonCode:", v50);

        v24 = v51;
        v53 = (void *)*MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          v74 = v53;
          v24 = v51;
          +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v11);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
          v98 = 2114;
          v99 = (uint64_t)v75;
          v100 = 2114;
          v101 = v6;
          v102 = 2114;
          v103 = v45;
          _os_log_error_impl(&dword_2117D4000, v74, OS_LOG_TYPE_ERROR, "%s ERR: Failed training %{public}@ of %{public}@ with error %{public}@", buf, 0x2Au);

        }
      }
      objc_msgSend(v7, "logAggregator");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "pushAnalytics");

      objc_autoreleasePoolPop(context);
      v55 = (void *)MEMORY[0x212BE17E4]();
      if (v84)
      {
        v85 = v24;
        v95[0] = v6;
        v94[0] = CFSTR("SSRVoiceRetrainingVoiceProfile");
        v94[1] = CFSTR("SSRVoiceRetrainingSpIdType");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v81);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v95[1] = v56;
        v94[2] = CFSTR("SSRVoiceRetrainingAsset");
        objc_msgSend(v7, "asset");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v95[2] = v57;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, v94, 3);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        v91 = v45;
        v59 = -[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]([SSRVoiceProfileRetrainingContext alloc], "initWithVoiceRetrainingContext:error:", v58, &v91);
        v12 = v91;

        if (v12)
        {
          v60 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v6, "profileID");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "stringWithFormat:", CFSTR("Failed to init retrainCtxt for profileID %@ with error %@"), v61, v12);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = (os_log_t *)MEMORY[0x24BE284B8];
          v64 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
            v98 = 2112;
            v99 = (uint64_t)v62;
            _os_log_error_impl(&dword_2117D4000, v64, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
          }

          v65 = *v63;
          if (os_log_type_enabled(*v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
            v98 = 2114;
            v99 = (uint64_t)v87;
            _os_log_impl(&dword_2117D4000, v65, OS_LOG_TYPE_DEFAULT, "%s Releasing OS Transaction %{public}@", buf, 0x16u);
          }
          v66 = (void *)MEMORY[0x24BDD1540];
          v92 = CFSTR("reason");
          v93 = v62;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 756, v67);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v55);
          v24 = v85;
          v68 = v90;
          v69 = v87;
LABEL_49:

          goto LABEL_14;
        }
        -[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:](v88, "_retrainVoiceProfile:withContext:withUtterances:", v6, v59, v85);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v90;
        if (v70)
        {
          v71 = (void *)*MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            v78 = v71;
            +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v81);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "siriProfileId");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
            v98 = 2114;
            v99 = (uint64_t)v79;
            v100 = 2114;
            v101 = v70;
            v102 = 2114;
            v103 = v80;
            _os_log_error_impl(&dword_2117D4000, v78, OS_LOG_TYPE_ERROR, "%s Failed to create %{public}@ model with error %{public}@ for profile %{public}@", buf, 0x2Au);

            v68 = v90;
          }
        }

        v45 = 0;
        v24 = v85;
      }
      else
      {
        v68 = v90;
      }
      objc_autoreleasePoolPop(v55);

      v72 = *MEMORY[0x24BE284B8];
      v69 = v87;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
        v98 = 2114;
        v99 = (uint64_t)v87;
        _os_log_impl(&dword_2117D4000, v72, OS_LOG_TYPE_DEFAULT, "%s Releasing OS Transaction %{public}@", buf, 0x16u);
      }
      v12 = v45;
      v21 = v12;
      goto LABEL_49;
    }
    v89 = (void *)v25;
    +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locale");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "installedAssetOfType:forLanguage:", 0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      v43 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v76 = v43;
        objc_msgSend(v6, "locale");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
        v98 = 2114;
        v99 = (uint64_t)v77;
        _os_log_error_impl(&dword_2117D4000, v76, OS_LOG_TYPE_ERROR, "%s ERR: ignoring filtering option as VTAssets not found on %{public}@", buf, 0x16u);

      }
      v25 = (uint64_t)v89;
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v20);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "mutableCopy");

    if (objc_msgSend(v37, "count") && objc_msgSend(v24, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v24);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "minusSet:", v38);

      if (objc_msgSend(v37, "count"))
      {
        objc_msgSend(v37, "allObjects");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "locale");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSRTriggerPhraseDetector filterVTAudioFiles:withLocale:withAsset:](SSRTriggerPhraseDetector, "filterVTAudioFiles:withLocale:withAsset:", v39, v40, v35);
        contexta = (void *)objc_claimAutoreleasedReturnValue();

        v41 = (void *)objc_msgSend(v24, "mutableCopy");
        objc_msgSend(v41, "addObjectsFromArray:", contexta);

        v25 = (uint64_t)v41;
LABEL_26:

LABEL_30:
        goto LABEL_31;
      }
      v73 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
        _os_log_impl(&dword_2117D4000, v73, OS_LOG_TYPE_DEFAULT, "%s No Implicit audio - ignoring filterToVoiceTriggerUtterances", buf, 0xCu);
      }
    }
    else
    {
      v42 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
        v98 = 2114;
        v99 = (uint64_t)v37;
        v100 = 2114;
        v101 = v24;
        _os_log_error_impl(&dword_2117D4000, v42, OS_LOG_TYPE_ERROR, "%s ERR: ignoring filtering option as %{public}@ or %{public}@ is nil", buf, 0x20u);
      }
    }
    v25 = (uint64_t)v89;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid spIdType %d - Bailing out"), v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v97 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:]";
    v98 = 2112;
    v99 = (uint64_t)v12;
    _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
  }
  v14 = (void *)MEMORY[0x24BDD1540];
  v104 = CFSTR("reason");
  v105 = v12;
  v15 = (void *)MEMORY[0x24BDBCE70];
  v16 = &v105;
  v17 = &v104;
LABEL_13:
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 730, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v21;
}

- (id)_retrainVoiceProfile:(id)a3 withContext:(id)a4 withUtterances:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  SSRVoiceProfileRetrainerFactory *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  _QWORD v44[4];
  id v45;
  void *v46;
  id v47;
  uint64_t *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _BYTE location[12];
  __int16 v61;
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  _QWORD v71[4];

  v71[1] = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v7 = a4;
  v8 = a5;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__6860;
  v58 = __Block_byref_object_dispose__6861;
  v59 = 0;
  v41 = v7;
  v42 = objc_msgSend(v7, "spIdType");
  objc_msgSend(v43, "appDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.siri")))
  {
    if (!v8)
    {

LABEL_29:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Too less (%d) audio files in %@ "), objc_msgSend(v8, "count"), v8);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(_QWORD *)&location[4] = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]";
        v61 = 2112;
        v62 = v40;
        _os_log_error_impl(&dword_2117D4000, v36, OS_LOG_TYPE_ERROR, "%s ERR: %@", location, 0x16u);
      }
      objc_msgSend(MEMORY[0x24BE28400], "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "submitVoiceIdIssueReport:", *MEMORY[0x24BE28500]);

      v38 = (void *)MEMORY[0x24BDD1540];
      v70 = CFSTR("reason");
      v71[0] = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 728);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    v10 = (unint64_t)objc_msgSend(v8, "count") < 3;

    if (v10)
      goto LABEL_29;
  }
  else
  {

  }
  v11 = objc_alloc_init(SSRVoiceProfileRetrainerFactory);
  -[SSRVoiceProfileRetrainerFactory voiceRetrainersWithContext:](v11, "voiceRetrainersWithContext:", v41);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v40 = v11;
  if (v12)
  {
    v14 = v12;
    v15 = objc_msgSend(v12, "count");
    v13 = v14;
    if (v15)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
      if (!v17)
        goto LABEL_24;
      v18 = *(_QWORD *)v51;
      while (1)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if ((objc_msgSend(v20, "needsRetrainingWithAudioFiles:", v8) & 1) != 0)
          {
            if ((objc_msgSend(v20, "resetModelForRetraining") & 1) != 0)
            {
              objc_initWeak((id *)location, v20);
              v44[0] = MEMORY[0x24BDAC760];
              v44[1] = 3221225472;
              v44[2] = __72__SSRVoiceProfileStore__retrainVoiceProfile_withContext_withUtterances___block_invoke;
              v44[3] = &unk_24CC86408;
              v48 = &v54;
              objc_copyWeak(&v49, (id *)location);
              v45 = v43;
              v46 = v20;
              v47 = v41;
              objc_msgSend(v20, "addUtterances:withPolicy:withCompletion:", v8, 0, v44);

              objc_destroyWeak(&v49);
              objc_destroyWeak((id *)location);
              continue;
            }
            v21 = (id)*MEMORY[0x24BE284B8];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v43, "profileID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v42);
              v26 = (id)objc_claimAutoreleasedReturnValue();
              +[SSRUtils stringForVoiceProfileRetrainerType:](SSRUtils, "stringForVoiceProfileRetrainerType:", objc_msgSend(v20, "retrainerType"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)location = 136315906;
              *(_QWORD *)&location[4] = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]";
              v61 = 2114;
              v62 = v25;
              v63 = 2114;
              v64 = v26;
              v65 = 2114;
              v66 = v27;
              _os_log_error_impl(&dword_2117D4000, v21, OS_LOG_TYPE_ERROR, "%s ERR: Failed resetting for %{public}@ - for {%{public}@, %{public}@}", location, 0x2Au);

            }
          }
          else
          {
            v21 = (id)*MEMORY[0x24BE284B8];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v43, "profileID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", v42);
              v23 = (id)objc_claimAutoreleasedReturnValue();
              +[SSRUtils stringForVoiceProfileRetrainerType:](SSRUtils, "stringForVoiceProfileRetrainerType:", objc_msgSend(v20, "retrainerType"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)location = 136315906;
              *(_QWORD *)&location[4] = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]";
              v61 = 2114;
              v62 = v22;
              v63 = 2114;
              v64 = v23;
              v65 = 2114;
              v66 = v24;
              _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s Skipping retraining for %{public}@ - for {%{public}@, %{public}@}", location, 0x2Au);

            }
          }

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
        if (!v17)
        {
LABEL_24:

          v28 = (id)v55[5];
          v29 = v16;
          goto LABEL_32;
        }
      }
    }
  }
  v29 = v13;
  v30 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v43, "profileID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("Failed to init retrainers for profileID %@ with ctxt %@"), v31, v41);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 136315394;
    *(_QWORD *)&location[4] = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]";
    v61 = 2112;
    v62 = v32;
    _os_log_error_impl(&dword_2117D4000, v33, OS_LOG_TYPE_ERROR, "%s ERR: %@", location, 0x16u);
  }
  v34 = (void *)MEMORY[0x24BDD1540];
  v68 = CFSTR("reason");
  v69 = v32;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 756, v35);
  v28 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
  _Block_object_dispose(&v54, 8);

  return v28;
}

- (id)copyAudioFiles:(id)a3 toProfile:(id)a4 forModelType:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v31;
  id obj;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(a4, "voiceProfileAudioDirPathForSpidType:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v8);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v7;
  v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (!v10)
  {
    v20 = v9;
    goto LABEL_19;
  }
  v31 = v8;
  obj = v9;
  v11 = *(_QWORD *)v37;
  v12 = v33;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v37 != v11)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v14, "URLByDeletingPathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLByAppendingPathExtension:", CFSTR("json"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLByAppendingPathComponent:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend(v19, "copyItemAtURL:toURL:error:", v16, v18, &v35);
      v20 = v35;

      if (v20)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to copy %@ to %@ with error %@"), v16, v18, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[SSRVoiceProfileStore copyAudioFiles:toProfile:forModelType:]";
          v46 = 2112;
          v47 = v22;
          _os_log_error_impl(&dword_2117D4000, v24, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
        }
        v25 = (void *)MEMORY[0x24BDD1540];
        v42 = CFSTR("reason");
        v43 = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 721, v26);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      objc_msgSend(v14, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLByAppendingPathComponent:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      objc_msgSend(v23, "copyItemAtURL:toURL:error:", v14, v22, &v34);
      v20 = v34;

      if (v20)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to copy %@ to %@ with error %@"), v14, v22, v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "-[SSRVoiceProfileStore copyAudioFiles:toProfile:forModelType:]";
          v46 = 2112;
          v47 = v26;
          _os_log_error_impl(&dword_2117D4000, v27, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
        }
        v28 = (void *)MEMORY[0x24BDD1540];
        v40 = CFSTR("reason");
        v41 = v26;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 721, v29);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
        v8 = v31;
        v9 = obj;

        goto LABEL_19;
      }

      v12 = v33;
    }
    v9 = obj;
    v10 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v10)
      continue;
    break;
  }
  v20 = obj;
  v8 = v31;
LABEL_19:

  return v10;
}

- (NSMutableArray)voiceProfileArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setVoiceProfileArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SSRVoiceProfileStorePrefs)storePrefs
{
  return self->_storePrefs;
}

- (void)setStorePrefs:(id)a3
{
  objc_storeStrong((id *)&self->_storePrefs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePrefs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_voiceProfileArray, 0);
}

void __72__SSRVoiceProfileStore__retrainVoiceProfile_withContext_withUtterances___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  os_log_t *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_log_t *v25;
  uint64_t i;
  os_log_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_log_t *v41;
  uint64_t v42;
  os_log_t v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v12 = WeakRetained;
  v56 = a1;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v52 = v8;
    v53 = v10;
    v55 = WeakRetained;
    objc_msgSend(WeakRetained, "modelFilePath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URLByDeletingLastPathComponent");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v51 = v9;
    obj = v9;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v64;
      v25 = (os_log_t *)MEMORY[0x24BE284B8];
      v54 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v64 != v24)
            objc_enumerationMutation(obj);
          v27 = *v25;
          if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
          {
            v28 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
            v29 = v27;
            objc_msgSend(v28, "lastPathComponent");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v56 + 32), "profileID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", objc_msgSend(*(id *)(v56 + 48), "spIdType"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "modelFilePath");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "lastPathComponent");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "lastPathComponent");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "objectForKeyedSubscript:", v28);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316674;
            v69 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]_block_invoke";
            v70 = 2114;
            v71 = v30;
            v72 = 2114;
            v73 = v31;
            v74 = 2114;
            v75 = v32;
            v76 = 2114;
            v77 = v34;
            v78 = 2114;
            v79 = v35;
            v80 = 2114;
            v81 = v36;
            _os_log_impl(&dword_2117D4000, v29, OS_LOG_TYPE_DEFAULT, "%s Added utterance %{public}@ to {%{public}@, %{public}@, %{public}@, %{public}@} with score %{public}@", buf, 0x48u);

            v24 = v54;
            v25 = (os_log_t *)MEMORY[0x24BE284B8];

          }
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
      }
      while (v23);
    }

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v37 = v53;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v60;
      v41 = (os_log_t *)MEMORY[0x24BE284B8];
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v60 != v40)
            objc_enumerationMutation(v37);
          v43 = *v41;
          if (os_log_type_enabled(*v41, OS_LOG_TYPE_ERROR))
          {
            v44 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v42);
            v45 = v43;
            objc_msgSend(v37, "objectForKeyedSubscript:", v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v69 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]_block_invoke";
            v70 = 2114;
            v71 = v44;
            v72 = 2114;
            v73 = v46;
            _os_log_error_impl(&dword_2117D4000, v45, OS_LOG_TYPE_ERROR, "%s Rejected utterance %{public}@ with error %{public}@", buf, 0x20u);

          }
          ++v42;
        }
        while (v39 != v42);
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      }
      while (v39);
    }

    v9 = v51;
    v8 = v52;
    v10 = v53;
    v12 = v55;
    goto LABEL_26;
  }
  v13 = (os_log_t *)MEMORY[0x24BE284B8];
  v14 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v47 = *(void **)(v56 + 32);
    v48 = v14;
    objc_msgSend(v47, "profileID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = *(void **)(*(_QWORD *)(*(_QWORD *)(v56 + 56) + 8) + 40);
    *(_DWORD *)buf = 136315650;
    v69 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]_block_invoke";
    v70 = 2114;
    v71 = v49;
    v72 = 2114;
    v73 = v50;
    _os_log_error_impl(&dword_2117D4000, v48, OS_LOG_TYPE_ERROR, "%s ERR: Failed in retraining %{public}@ with error %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(v56 + 40), "modelFilePath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v57 = (void *)v17;
  if (v17)
  {
    v18 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      objc_msgSend(v12, "modelFilePath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v69 = "-[SSRVoiceProfileStore _retrainVoiceProfile:withContext:withUtterances:]_block_invoke";
      v70 = 2114;
      v71 = v20;
      _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete the model at %{public}@", buf, 0x16u);

    }
LABEL_26:

  }
}

void __71__SSRVoiceProfileStore__updateTrainedUsersWithAction_UserVoiceProfile___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "profileID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profileID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
}

void __71__SSRVoiceProfileStore_retrainVoiceProfile_withContext_withCompletion___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  os_log_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  int v32;
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE284B8];
  v3 = (void *)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "profileID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 136315650;
    v33 = "-[SSRVoiceProfileStore retrainVoiceProfile:withContext:withCompletion:]_block_invoke";
    v34 = 2114;
    v35 = v6;
    v36 = 2114;
    v37 = *(double *)&v7;
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Retraining %{public}@ for locale %{public}@", (uint8_t *)&v32, 0x20u);

  }
  if (CSIsCommunalDevice())
  {
    objc_msgSend(*(id *)(a1 + 32), "appDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.siri")) & 1) != 0)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "profileLocallyAvailable");

      if ((v9 & 1) == 0)
      {
        v10 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(void **)(a1 + 32);
          v12 = v10;
          objc_msgSend(v11, "profileID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 136315394;
          v33 = "-[SSRVoiceProfileStore retrainVoiceProfile:withContext:withCompletion:]_block_invoke";
          v34 = 2114;
          v35 = v13;
          _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Needs retraining %{public}@ - Triggering voice profiles download", (uint8_t *)&v32, 0x16u);

        }
        objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "postNotificationName:object:", CFSTR("com.apple.voicetrigger.PHSProfileDownloadTrigger"), 0);

        v15 = *(_QWORD *)(a1 + 56);
        if (v15)
          (*(void (**)(uint64_t, _QWORD))(v15 + 16))(v15, 0);
        return;
      }
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_retrainVoiceProfile:withContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v16);
  v20 = v19 * 1000.0;
  v21 = *v2;
  if (v17)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = *(void **)(a1 + 32);
      v23 = v21;
      objc_msgSend(v22, "profileID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 136315906;
      v33 = "-[SSRVoiceProfileStore retrainVoiceProfile:withContext:withCompletion:]_block_invoke";
      v34 = 2114;
      v35 = v24;
      v36 = 2114;
      v37 = *(double *)&v17;
      v38 = 2050;
      v39 = v20;
      _os_log_error_impl(&dword_2117D4000, v23, OS_LOG_TYPE_ERROR, "%s ERR: Retraining failed for %{public}@ with error %{public}@ in %{public}fms", (uint8_t *)&v32, 0x2Au);
LABEL_16:

    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(void **)(a1 + 32);
    v23 = v21;
    objc_msgSend(v25, "profileID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 136315650;
    v33 = "-[SSRVoiceProfileStore retrainVoiceProfile:withContext:withCompletion:]_block_invoke";
    v34 = 2114;
    v35 = v24;
    v36 = 2050;
    v37 = v20;
    _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s Retraining successfully finished for %{public}@ in %{public}fms", (uint8_t *)&v32, 0x20u);
    goto LABEL_16;
  }
  if (objc_msgSend(MEMORY[0x24BE28488], "isExclaveHardware"))
  {
    v27 = *(void **)(a1 + 32);
    v26 = *(void **)(a1 + 40);
    objc_msgSend(v27, "userName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "voiceProfilePathExclave");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v26, "updateVoiceProfile:withUserName:withBasePathExclave:", v27, v28, v29);

  }
  v31 = *(_QWORD *)(a1 + 56);
  if (v31)
    (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v17);

}

uint64_t __61__SSRVoiceProfileStore__checkIfRetrainingRequiredForProfile___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SSRVoiceProfileRetrainingContext *v8;
  id v9;
  void *v10;
  void *v11;
  SSRVoiceProfileRetrainerFactory *v12;
  NSObject *v13;
  unsigned int v14;
  int v15;
  void *v16;
  void *v17;
  SSRVoiceProfileRetrainerFactory *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  SSRVoiceProfileRetrainerFactory *v28;
  void *v29;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  SSRVoiceProfileRetrainerFactory *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  _QWORD v45[2];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x212BE17E4]();
  v5 = *(_QWORD *)(a1 + 32);
  v45[0] = CFSTR("SSRVoiceRetrainingVoiceProfile");
  v45[1] = CFSTR("SSRVoiceRetrainingSpIdType");
  v46[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  v8 = -[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]([SSRVoiceProfileRetrainingContext alloc], "initWithVoiceRetrainingContext:error:", v7, &v37);
  v9 = v37;
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "profileID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Failed to init retrainCtxt for profileID %@ with error %@"), v11, v9);
    v12 = (SSRVoiceProfileRetrainerFactory *)objc_claimAutoreleasedReturnValue();

    v13 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[SSRVoiceProfileStore _checkIfRetrainingRequiredForProfile:]_block_invoke";
      v40 = 2112;
      v41 = v12;
      _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
    }
    v14 = 0;
    v15 = 1;
  }
  else
  {
    v12 = objc_alloc_init(SSRVoiceProfileRetrainerFactory);
    -[SSRVoiceProfileRetrainerFactory voiceRetrainersWithContext:](v12, "voiceRetrainersWithContext:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 && objc_msgSend(v16, "count"))
    {
      v32 = v4;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v18 = v17;
      v19 = -[SSRVoiceProfileRetrainerFactory countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      if (v19)
      {
        v20 = v19;
        v31 = v17;
        v21 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v18);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "needsRetrainingWithAudioFiles:", 0))
            {
              v26 = (void *)*MEMORY[0x24BE284B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
              {
                v27 = v26;
                +[SSRUtils stringForCSSpIdType:](SSRUtils, "stringForCSSpIdType:", a2);
                v28 = (SSRVoiceProfileRetrainerFactory *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "profileID");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315650;
                v39 = "-[SSRVoiceProfileStore _checkIfRetrainingRequiredForProfile:]_block_invoke";
                v40 = 2114;
                v41 = v28;
                v42 = 2114;
                v43 = v29;
                _os_log_impl(&dword_2117D4000, v27, OS_LOG_TYPE_DEFAULT, "%s Needs Retraining %{public}@ model update for profile %{public}@ ", buf, 0x20u);

              }
              v15 = 1;
              v14 = 1;
              goto LABEL_22;
            }
          }
          v20 = -[SSRVoiceProfileRetrainerFactory countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
          v14 = 1;
          if (v20)
            continue;
          break;
        }
        v15 = 0;
LABEL_22:
        v17 = v31;
        v4 = v32;
      }
      else
      {
        v15 = 0;
        v14 = 1;
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "profileID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Failed to init retrainers for profileID %@ with ctxt %@"), v24, v8);
      v18 = (SSRVoiceProfileRetrainerFactory *)objc_claimAutoreleasedReturnValue();

      v25 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[SSRVoiceProfileStore _checkIfRetrainingRequiredForProfile:]_block_invoke";
        v40 = 2112;
        v41 = v18;
        _os_log_error_impl(&dword_2117D4000, v25, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
      }
      v14 = 0;
      v15 = 1;
    }

  }
  objc_autoreleasePoolPop(v4);
  if (v15)
    return v14;
  else
    return 0;
}

void __47__SSRVoiceProfileStore_deleteUserVoiceProfile___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_deleteUserVoiceProfile:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __71__SSRVoiceProfileStore_addUserVoiceProfile_withContext_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  SSRPitchExtractor *v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  NSObject *v26;
  double v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  id v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Profile is nil!"));
    v7 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[SSRVoiceProfileStore addUserVoiceProfile:withContext:withCompletion:]_block_invoke";
      v32 = 2114;
      v33 = v7;
      _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    v9 = (void *)MEMORY[0x24BDD1540];
    v36 = CFSTR("reason");
    *(double *)v37 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 726, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v11);

    goto LABEL_29;
  }
  objc_msgSend(*(id *)(a1 + 40), "_updateTrainedUsersWithAction:UserVoiceProfile:", 1);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BE28488], "getSiriLanguageWithFallback:", 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(*(id *)(a1 + 32), "locale");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v29, "isEqualToString:", v2);

      if ((v3 & 1) == 0)
      {
        v13 = (void *)*MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(void **)(a1 + 32);
          v15 = v13;
          objc_msgSend(v14, "locale");
          v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 136315650;
          v31 = "-[SSRVoiceProfileStore addUserVoiceProfile:withContext:withCompletion:]_block_invoke";
          v32 = 2114;
          v33 = v16;
          v34 = 2114;
          v35 = v29;
          _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s Skipping retraining for language %{public}@, current %{public}@", buf, 0x20u);

        }
        v17 = *(_QWORD *)(a1 + 56);
        if (v17)
          (*(void (**)(uint64_t, uint64_t, _QWORD))(v17 + 16))(v17, 1, 0);

        return;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_retrainVoiceProfile:withContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = *(_QWORD *)(a1 + 56);
      if (v6)
        (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v5);

      return;
    }

  }
  v18 = *(_QWORD *)(a1 + 56);
  if (v18)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v18 + 16))(v18, 1, 0);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "appDomain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqual:", CFSTR("com.apple.siri"));

    if (v20)
    {
      v21 = [SSRPitchExtractor alloc];
      objc_msgSend(*(id *)(a1 + 48), "asset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = COERCE_DOUBLE((uint64_t)-[SSRPitchExtractor initWithAsset:](v21, "initWithAsset:", v22));

      if (v7 != 0.0)
      {
        objc_msgSend(*(id *)(a1 + 32), "getExplicitEnrollmentUtterancesForType:", objc_msgSend(*(id *)(a1 + 48), "spIdType"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)&v7, "getPitchForUtteranceAudioFiles:", v23);
        v25 = v24;
        v26 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v31 = "-[SSRVoiceProfileStore addUserVoiceProfile:withContext:withCompletion:]_block_invoke";
          v32 = 2050;
          v33 = v25;
          _os_log_impl(&dword_2117D4000, v26, OS_LOG_TYPE_DEFAULT, "%s Detected mean pitch for explicit utterances = %{public}f Hz", buf, 0x16u);
        }
        *(float *)&v27 = v25;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setProfilePitch:", v28);

        objc_msgSend(*(id *)(a1 + 40), "_updateTrainedUsersWithAction:UserVoiceProfile:", 2, *(_QWORD *)(a1 + 32));
      }
      objc_msgSend(*(id *)(a1 + 40), "_logVoiceProfileConfusionWithCleanup:", CSIsCommunalDevice());
LABEL_29:

    }
  }
}

void __58__SSRVoiceProfileStore__getTopScoringProfileIdFromScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v8 + 40))
    goto LABEL_4;
  if (objc_msgSend(v6, "compare:") == 1)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v8 + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

void __61__SSRVoiceProfileStore__logVoiceProfileConfusionWithCleanup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  id v18;
  char v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __61__SSRVoiceProfileStore__logVoiceProfileConfusionWithCleanup___block_invoke_2;
  v14 = &unk_24CC862D8;
  v4 = v3;
  v15 = v4;
  v16 = *(id *)(a1 + 32);
  v19 = *(_BYTE *)(a1 + 64);
  v17 = *(_OWORD *)(a1 + 40);
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v4, "purgeConfusionInformationWithPolicy:", &v11);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (*(_BYTE *)(a1 + 64))
  {
    if (v5)
    {
      v7 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v8 = *(void **)(a1 + 48);
        v9 = v7;
        objc_msgSend(v8, "profileID", v11, v12, v13, v14, v15, v16, v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v21 = "-[SSRVoiceProfileStore _logVoiceProfileConfusionWithCleanup:]_block_invoke";
        v22 = 2114;
        v23 = v10;
        v24 = 2114;
        v25 = v6;
        _os_log_error_impl(&dword_2117D4000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed purging profile %{public}@ with error - %{public}@", buf, 0x20u);

      }
    }
  }

}

uint64_t __61__SSRVoiceProfileStore__logVoiceProfileConfusionWithCleanup___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  double v13;
  double v14;
  uint64_t v15;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if (objc_msgSend(v3, "retrainerType") == 2)
    v5 = v4;
  else
    v5 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "retrainerType") == 1)
    v6 = v4;
  else
    v6 = 0;
  objc_msgSend(*(id *)(a1 + 40), "combinationWeight");
  +[SSRUtils combineScoreFromPSR:fromSAT:withCombinedWt:](SSRUtils, "combineScoreFromPSR:fromSAT:withCombinedWt:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 72))
  {
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "satImplicitProfileThreshold");
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 64), "satImplicitProfileDeltaThreshold");
    LODWORD(v13) = v12;
    LODWORD(v14) = v11;
    v15 = objc_msgSend(v8, "evaluateImplicitAdditionPolicyWithScores:forProfile:withImplicitThreshold:withDeltaThreshold:", v7, v9, v14, v13);
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

uint64_t __60__SSRVoiceProfileStore_logVoiceProfileConfusionWithCleanup___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logVoiceProfileConfusionWithCleanup:", *(unsigned __int8 *)(a1 + 40));
}

void __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke(uint64_t a1)
{
  id v2;
  float v3;
  float v4;
  int v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  os_log_t *v24;
  uint64_t i;
  void *v26;
  float v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  int v67;
  int v68;
  int v69;
  double v70;
  double v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t j;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  id *v91;
  void *v92;
  void *v93;
  SSRVoiceProfileRetrainingContext *v94;
  id v95;
  id v96;
  SSRVoiceProfileRetrainerFactory *v97;
  void *v98;
  void *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[4];
  id v114;
  id v115;
  id v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  _QWORD v124[4];
  id v125;
  id v126;
  _BYTE *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  id v132;
  const __CFString *v133;
  void *v134;
  uint8_t v135[4];
  const char *v136;
  __int16 v137;
  void *v138;
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;
  uint8_t v142[128];
  _BYTE buf[24];
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  id v146;
  const __CFString *v147;
  void *v148;
  uint64_t v149;
  const __CFString *v150;
  void *v151;
  _BYTE v152[128];
  const __CFString *v153;
  SSRVoiceProfileRetrainerFactory *v154;
  _QWORD v155[4];
  _QWORD v156[4];
  _QWORD v157[6];
  _QWORD v158[9];

  v158[6] = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  if (CSIsCommunalDevice())
  {

    v91 = (id *)(a1 + 48);
LABEL_9:
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "appDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userVoiceProfilesForAppDomain:forLocale:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD *)(a1 + 48);
    v157[0] = CFSTR("SSRVoiceRetrainingVoiceProfile");
    v157[1] = CFSTR("SSRVoiceRetrainingCompareVoiceProfiles");
    v158[0] = v11;
    v158[1] = v10;
    v157[2] = CFSTR("SSRVoiceRetrainingFilterToVoiceTriggerUtterances");
    v157[3] = CFSTR("SSRVoiceRetrainingAsset");
    v12 = *(_QWORD *)(a1 + 32);
    v158[2] = MEMORY[0x24BDBD1C8];
    v158[3] = v12;
    v157[4] = CFSTR("SSRVoiceRetrainingSpIdType");
    v157[5] = CFSTR("SSRVoiceRetrainingCompareVoiceProfilesSpIdType");
    v158[4] = &unk_24CC9A118;
    v158[5] = &unk_24CC9A130;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v158, v157, 6);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((CSIsIOS() & 1) != 0 || (CSIsAppleSiliconMac() & 1) != 0)
  {
    objc_msgSend(v2, "psrCombinationWeight");
    v4 = v3;
    v5 = objc_msgSend(v2, "useTDTIEnrollment");

    v91 = (id *)(a1 + 48);
    if (v4 == 1.0 && v5 != 0)
      goto LABEL_9;
  }
  else
  {

    v91 = (id *)(a1 + 48);
  }
  v13 = *(_QWORD *)(a1 + 48);
  v155[0] = CFSTR("SSRVoiceRetrainingVoiceProfile");
  v155[1] = CFSTR("SSRVoiceRetrainingFilterToVoiceTriggerUtterances");
  v156[0] = v13;
  v156[1] = MEMORY[0x24BDBD1C8];
  v14 = *(_QWORD *)(a1 + 32);
  v155[2] = CFSTR("SSRVoiceRetrainingAsset");
  v155[3] = CFSTR("SSRVoiceRetrainingSpIdType");
  v156[2] = v14;
  v156[3] = &unk_24CC9A148;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v156, v155, 4);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v132 = 0;
  v94 = -[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]([SSRVoiceProfileRetrainingContext alloc], "initWithVoiceRetrainingContext:error:", v98, &v132);
  v96 = v132;
  if (!v96)
  {
    v97 = objc_alloc_init(SSRVoiceProfileRetrainerFactory);
    -[SSRVoiceProfileRetrainerFactory voiceRetrainersWithContext:](v97, "voiceRetrainersWithContext:", v94);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v95 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v20 = v21;
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v128, v152, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v129;
      v24 = (os_log_t *)MEMORY[0x24BE28368];
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v129 != v23)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * i);
          if (objc_msgSend(v26, "retrainerType") == 1
            && (objc_msgSend(*(id *)(a1 + 32), "psrCombinationWeight"), fabsf(v27 + -1.0) <= 0.00000011921))
          {
            v28 = *v24;
            if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSourc"
                                   "e:withAudioInput:withCompletion:]_block_invoke";
              _os_log_impl(&dword_2117D4000, v28, OS_LOG_TYPE_DEFAULT, "%s Skip SAT retrainer since combination weight is 1", buf, 0xCu);
            }
          }
          else if (objc_msgSend(v26, "implicitTrainingRequired"))
          {
            objc_msgSend(v100, "addObject:", v26);
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v128, v152, 16);
      }
      while (v22);
    }

    if (objc_msgSend(v100, "count"))
    {
      v29 = (void *)MEMORY[0x212BE17E4]();
      v149 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v149, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "locale");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSRTriggerPhraseDetector filterVTAudioFiles:withLocale:withAsset:](SSRTriggerPhraseDetector, "filterVTAudioFiles:withLocale:withAsset:", v30, v31, *(_QWORD *)(a1 + 32));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32 && objc_msgSend(v32, "count"))
      {

        objc_autoreleasePoolPop(v29);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v144 = __Block_byref_object_copy__6860;
        v145 = __Block_byref_object_dispose__6861;
        v146 = 0;
        v33 = MEMORY[0x24BDAC760];
        v124[0] = MEMORY[0x24BDAC760];
        v124[1] = 3221225472;
        v124[2] = __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke_54;
        v124[3] = &unk_24CC86238;
        v125 = *(id *)(a1 + 56);
        v126 = *(id *)(a1 + 48);
        v127 = buf;
        v99 = (void *)MEMORY[0x212BE197C](v124);
        v118 = 0;
        v119 = &v118;
        v120 = 0x3032000000;
        v121 = __Block_byref_object_copy__6860;
        v122 = __Block_byref_object_dispose__6861;
        v123 = 0;
        v113[0] = v33;
        v113[1] = 3221225472;
        v113[2] = __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke_58;
        v113[3] = &unk_24CC86260;
        v117 = &v118;
        v114 = *(id *)(a1 + 56);
        v115 = *(id *)(a1 + 48);
        v116 = 0;
        v34 = (void *)MEMORY[0x212BE197C](v113);
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        v35 = v100;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
        if (v36)
        {
          v92 = 0;
          v93 = 0;
          v37 = *(_QWORD *)v110;
LABEL_35:
          v38 = 0;
          while (1)
          {
            if (*(_QWORD *)v110 != v37)
              objc_enumerationMutation(v35);
            v39 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v38);
            v141 = *(_QWORD *)(a1 + 56);
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v141, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addUtterances:withPolicy:withCompletion:", v40, v99, v34);

            if (v119[5])
              break;
            objc_msgSend(v95, "addObject:", v39);
            v41 = objc_msgSend(v39, "retrainerType");
            v42 = *(void **)(*(_QWORD *)&buf[8] + 40);
            if (v41 == 2)
            {
              v43 = objc_msgSend(v42, "copy");
              v44 = v92;
              v92 = (void *)v43;
            }
            else
            {
              v45 = objc_msgSend(v42, "copy");
              v44 = v93;
              v93 = (void *)v45;
            }

            if (v36 == ++v38)
            {
              v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v109, v142, 16);
              if (v36)
                goto LABEL_35;
              break;
            }
          }
        }
        else
        {
          v92 = 0;
          v93 = 0;
        }

        v63 = objc_msgSend(v35, "count");
        if (v63 == objc_msgSend(v95, "count"))
        {
          -[SSRVoiceProfileRetrainingContext combinationWeight](v94, "combinationWeight");
          +[SSRUtils combineScoreFromPSR:fromSAT:withCombinedWt:](SSRUtils, "combineScoreFromPSR:fromSAT:withCombinedWt:", v92, v93);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = *(void **)(a1 + 40);
          v65 = *(_QWORD *)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 32), "satImplicitProfileThreshold");
          v68 = v67;
          objc_msgSend(*(id *)(a1 + 32), "satImplicitProfileDeltaThreshold");
          LODWORD(v70) = v69;
          LODWORD(v71) = v68;
          if ((objc_msgSend(v66, "evaluateImplicitAdditionPolicyWithScores:forProfile:withImplicitThreshold:withDeltaThreshold:", v64, v65, v71, v70) & 1) != 0)
          {
            v72 = *(_QWORD *)(a1 + 64);
            if (v72)
              (*(void (**)(uint64_t, _QWORD))(v72 + 16))(v72, 0);
          }
          else
          {
            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            v78 = v35;
            v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v101, v139, 16);
            if (v79)
            {
              v80 = *(_QWORD *)v102;
              do
              {
                for (j = 0; j != v79; ++j)
                {
                  if (*(_QWORD *)v102 != v80)
                    objc_enumerationMutation(v78);
                  objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * j), "purgeLastSpeakerEmbedding");
                }
                v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v101, v139, 16);
              }
              while (v79);
            }

            v82 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(*(id *)(a1 + 56), "lastPathComponent");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v91, "profileID");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "stringWithFormat:", CFSTR("Utterance %@ in profile %@ not satisfied the implicit policy"), v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();

            v86 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v135 = 136315394;
              v136 = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudioInp"
                     "ut:withCompletion:]_block_invoke";
              v137 = 2114;
              v138 = v85;
              _os_log_impl(&dword_2117D4000, v86, OS_LOG_TYPE_DEFAULT, "%s %{public}@", v135, 0x16u);
            }
            v87 = *(_QWORD *)(a1 + 64);
            if (v87)
            {
              v88 = (void *)MEMORY[0x24BDD1540];
              v133 = CFSTR("reason");
              v134 = v85;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 735, v89);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, void *))(v87 + 16))(v87, v90);

            }
          }

        }
        else
        {
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v73 = v95;
          v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v105, v140, 16);
          if (v74)
          {
            v75 = *(_QWORD *)v106;
            do
            {
              for (k = 0; k != v74; ++k)
              {
                if (*(_QWORD *)v106 != v75)
                  objc_enumerationMutation(v73);
                objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * k), "purgeLastSpeakerEmbedding");
              }
              v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v105, v140, 16);
            }
            while (v74);
          }

          v77 = *(_QWORD *)(a1 + 64);
          if (v77)
            (*(void (**)(uint64_t, uint64_t))(v77 + 16))(v77, v119[5]);
        }

        _Block_object_dispose(&v118, 8);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        v46 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 56), "lastPathComponent");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "profileID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("Utterance %@ in profile %@ not satisfied the implicit VT policy"), v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:wi"
                               "thAudioInput:withCompletion:]_block_invoke";
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v49;
          _os_log_impl(&dword_2117D4000, v50, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
        }
        v51 = *(_QWORD *)(a1 + 64);
        if (v51)
        {
          v52 = (void *)MEMORY[0x24BDD1540];
          v147 = CFSTR("reason");
          v148 = v49;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 750, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v51 + 16))(v51, v54);

        }
        objc_autoreleasePoolPop(v29);
      }
    }
    else
    {
      v55 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*v91, "profileID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "stringWithFormat:", CFSTR("Profile %@ is full - Ignoring"), v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:with"
                             "AudioInput:withCompletion:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v57;
        _os_log_impl(&dword_2117D4000, v58, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
      }
      v59 = *(_QWORD *)(a1 + 64);
      if (v59)
      {
        v60 = (void *)MEMORY[0x24BDD1540];
        v150 = CFSTR("reason");
        v151 = v57;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 757, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v59 + 16))(v59, v62);

      }
    }

    goto LABEL_84;
  }
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*v91, "profileID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Failed to init retrainCtxt for profileID %@ with error %@"), v16, v96);
  v97 = (SSRVoiceProfileRetrainerFactory *)objc_claimAutoreleasedReturnValue();

  v17 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudi"
                         "oInput:withCompletion:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v97;
    _os_log_error_impl(&dword_2117D4000, v17, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
  }
  v18 = *(_QWORD *)(a1 + 64);
  if (v18)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v153 = CFSTR("reason");
    v154 = v97;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 756, v20);
    v100 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v100);
LABEL_84:

  }
}

id __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke_54(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "profileID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Rejecting Implicit utterance %@ for profile %@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudioInput:withCo"
            "mpletion:]_block_invoke";
      v19 = 2114;
      v20 = v10;
      _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    v12 = (void *)MEMORY[0x24BDD1540];
    v15 = CFSTR("reason");
    v16 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 735, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void __118__SSRVoiceProfileStore_addImplicitUtterance_toVoiceProfile_withAsset_withTriggerSource_withAudioInput_withCompletion___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  NSObject *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  NSObject *v30;
  __int16 v31;
  NSObject *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    v7 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v9 = *(NSObject **)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      v10 = v7;
      objc_msgSend(v8, "profileID");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315906;
      v28 = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudioInput:withCo"
            "mpletion:]_block_invoke";
      v29 = 2114;
      v30 = v9;
      v31 = 2114;
      v32 = v11;
      v33 = 2114;
      v34 = v12;
      _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Failed in adding %{public}@ to %{public}@ with error %{public}@", buf, 0x2Au);
LABEL_7:

LABEL_11:
    }
  }
  else
  {
    if (!objc_msgSend(a3, "count"))
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "profileID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Utterance %@ rejected for profile %@"), v17, v18);
      v10 = objc_claimAutoreleasedReturnValue();

      v19 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudioInput:with"
              "Completion:]_block_invoke";
        v29 = 2114;
        v30 = v10;
        _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
      }
      v20 = (void *)MEMORY[0x24BDD1540];
      v25 = CFSTR("reason");
      v26 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 735, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      goto LABEL_11;
    }
    v13 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(a1 + 32);
      v10 = v13;
      objc_msgSend(v14, "lastPathComponent");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "profileID");
      v15 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[SSRVoiceProfileStore addImplicitUtterance:toVoiceProfile:withAsset:withTriggerSource:withAudioInput:withCo"
            "mpletion:]_block_invoke";
      v29 = 2114;
      v30 = v11;
      v31 = 2114;
      v32 = v15;
      _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Added Implicit SAT vector from %{public}@ to profile %{public}@", buf, 0x20u);

      goto LABEL_7;
    }
  }

}

void __86__SSRVoiceProfileStore_isImplicitTrainingRequiredToVoiceProfile_withAsset_completion___block_invoke(uint64_t a1)
{
  id v2;
  id *v3;
  float v4;
  float v5;
  int v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  SSRVoiceProfileRetrainingContext *v17;
  id v18;
  void *v19;
  void *v20;
  SSRVoiceProfileRetrainerFactory *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  SSRVoiceProfileRetrainerFactory *v40;
  _QWORD v41[4];
  _QWORD v42[4];
  _QWORD v43[6];
  _QWORD v44[7];

  v44[6] = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  if (CSIsCommunalDevice())
  {

    v3 = (id *)(a1 + 48);
LABEL_9:
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "appDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userVoiceProfilesForAppDomain:forLocale:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 48);
    v43[0] = CFSTR("SSRVoiceRetrainingVoiceProfile");
    v43[1] = CFSTR("SSRVoiceRetrainingCompareVoiceProfiles");
    v44[0] = v12;
    v44[1] = v11;
    v43[2] = CFSTR("SSRVoiceRetrainingFilterToVoiceTriggerUtterances");
    v43[3] = CFSTR("SSRVoiceRetrainingAsset");
    v13 = *(_QWORD *)(a1 + 32);
    v44[2] = MEMORY[0x24BDBD1C8];
    v44[3] = v13;
    v43[4] = CFSTR("SSRVoiceRetrainingSpIdType");
    v43[5] = CFSTR("SSRVoiceRetrainingCompareVoiceProfilesSpIdType");
    v44[4] = &unk_24CC9A118;
    v44[5] = &unk_24CC9A130;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if ((CSIsIOS() & 1) != 0 || (CSIsAppleSiliconMac() & 1) != 0)
  {
    objc_msgSend(v2, "psrCombinationWeight");
    v5 = v4;
    v6 = objc_msgSend(v2, "useTDTIEnrollment");

    v3 = (id *)(a1 + 48);
    if (v5 == 1.0 && v6 != 0)
      goto LABEL_9;
  }
  else
  {

    v3 = (id *)(a1 + 48);
  }
  v15 = *(_QWORD *)(a1 + 48);
  v41[0] = CFSTR("SSRVoiceRetrainingVoiceProfile");
  v41[1] = CFSTR("SSRVoiceRetrainingFilterToVoiceTriggerUtterances");
  v42[0] = v15;
  v42[1] = MEMORY[0x24BDBD1C8];
  v16 = *(_QWORD *)(a1 + 32);
  v41[2] = CFSTR("SSRVoiceRetrainingAsset");
  v41[3] = CFSTR("SSRVoiceRetrainingSpIdType");
  v42[2] = v16;
  v42[3] = &unk_24CC9A148;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v35 = 0;
  v17 = -[SSRVoiceProfileRetrainingContext initWithVoiceRetrainingContext:error:]([SSRVoiceProfileRetrainingContext alloc], "initWithVoiceRetrainingContext:error:", v14, &v35);
  v18 = v35;
  if (v18)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*v3, "profileID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Failed to init retrainCtxt for profileID %@ with error %@"), v20, v18);
    v21 = (SSRVoiceProfileRetrainerFactory *)objc_claimAutoreleasedReturnValue();

    v22 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[SSRVoiceProfileStore isImplicitTrainingRequiredToVoiceProfile:withAsset:completion:]_block_invoke";
      v39 = 2112;
      v40 = v21;
      _os_log_error_impl(&dword_2117D4000, v22, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
    }
    v23 = *(_QWORD *)(a1 + 56);
    if (v23)
      (*(void (**)(uint64_t, _QWORD, id))(v23 + 16))(v23, 0, v18);
  }
  else
  {
    v21 = objc_alloc_init(SSRVoiceProfileRetrainerFactory);
    -[SSRVoiceProfileRetrainerFactory voiceRetrainersWithContext:](v21, "voiceRetrainersWithContext:", v17);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(v24);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "implicitTrainingRequired"))
          {
            v30 = *(_QWORD *)(a1 + 56);
            if (v30)
              (*(void (**)(uint64_t, uint64_t, _QWORD))(v30 + 16))(v30, 1, 0);

            goto LABEL_30;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v26)
          continue;
        break;
      }
    }

    v29 = *(_QWORD *)(a1 + 56);
    if (v29)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v29 + 16))(v29, 0, 0);
LABEL_30:

  }
}

void __66__SSRVoiceProfileStore__synchronizeSiriVoiceProfilesWithAssistant__block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  SSRVoiceProfileStoreCleaner *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE284B8];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[SSRVoiceProfileStore _synchronizeSiriVoiceProfilesWithAssistant]_block_invoke";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Synchronize voiceprofiles with Assistant...", buf, 0xCu);
  }
  v4 = objc_alloc_init(SSRVoiceProfileStoreCleaner);
  -[SSRVoiceProfileStoreCleaner filterInvalidSiriProfilesFrom:](v4, "filterInvalidSiriProfilesFrom:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __66__SSRVoiceProfileStore__synchronizeSiriVoiceProfilesWithAssistant__block_invoke_40;
    v22[3] = &unk_24CC86170;
    v22[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v22);
    objc_msgSend(MEMORY[0x24BE28400], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "submitVoiceIdIssueReport:", *MEMORY[0x24BE284F8]);

  }
  notify_post("com.apple.siri.corespeech.voiceprofilelist.change");
  if (objc_msgSend(v5, "count"))
  {
    v7 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[SSRVoiceProfileStore _synchronizeSiriVoiceProfilesWithAssistant]_block_invoke";
      _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Missing user models - Triggering voice profiles download", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("com.apple.voicetrigger.PHSProfileDownloadTrigger"), 0);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "appDomain", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.siri"));

          if (v15 && (objc_msgSend(v13, "profileLocallyAvailable") & 1) == 0)
          {
            v16 = *v2;
            if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v25 = "-[SSRVoiceProfileStore _synchronizeSiriVoiceProfilesWithAssistant]_block_invoke";
              _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s Needs retraining - Triggering voice profiles download", buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "postNotificationName:object:", CFSTR("com.apple.voicetrigger.PHSProfileDownloadTrigger"), 0);

            goto LABEL_22;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v10)
          continue;
        break;
      }
    }
  }
LABEL_22:

}

void __66__SSRVoiceProfileStore__synchronizeSiriVoiceProfilesWithAssistant__block_invoke_40(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "_deleteUserVoiceProfile:", v5);
  v7 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v8 = 136315650;
    v9 = "-[SSRVoiceProfileStore _synchronizeSiriVoiceProfilesWithAssistant]_block_invoke";
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Deleted stale voiceprofile(%lu): %@", (uint8_t *)&v8, 0x20u);
  }

}

void __73__SSRVoiceProfileStore_cleanupVoiceProfileModelFilesForLocale_withAsset___block_invoke(_QWORD *a1)
{
  SSRVoiceProfileStoreCleaner *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(SSRVoiceProfileStoreCleaner);
  +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allInstalledAssetsOfType:forLanguage:", 3, a1[4]);
  v4 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)v4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a1[5] && v5)
    objc_msgSend(v5, "addObject:");
  v7 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SSRVoiceProfileStore cleanupVoiceProfileModelFilesForLocale:withAsset:]_block_invoke";
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Cleanup model files with assets %{public}@", buf, 0x16u);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = *(id *)(a1[6] + 8);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "locale");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", a1[4]);

        if (v15)
          -[SSRVoiceProfileStoreCleaner cleanupInvalidModelsForProfile:withAssetArray:](v2, "cleanupInvalidModelsForProfile:withAssetArray:", v13, v6);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

void __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke(uint64_t a1)
{
  SSRVoiceProfileStoreCleaner *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  dispatch_time_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(SSRVoiceProfileStoreCleaner);
  -[SSRVoiceProfileStoreCleaner cleanupProfileStore](v2, "cleanupProfileStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:](v2, "filterDuplicatedSiriProfilesFrom:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke_2;
    v19[3] = &unk_24CC86170;
    v19[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v19);
    objc_msgSend(MEMORY[0x24BE28400], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitVoiceIdIssueReport:", *MEMORY[0x24BE284F8]);

    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SSRVoiceProfileStore cleanupVoiceProfileStore:]_block_invoke";
      _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Triggering voice profiles download", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("com.apple.voicetrigger.PHSProfileDownloadTrigger"), 0);

  }
  objc_msgSend(MEMORY[0x24BE28488], "getSiriLanguageWithFallback:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SSRVoiceProfileStoreCleaner deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:appDomain:](v2, "deleteInvalidSiriProfilesFromPersonalDevicesForLanguage:appDomain:", v10, CFSTR("com.apple.siri"));

  if (CSIsCommunalDevice())
  {
    v12 = dispatch_time(0, 120000000000);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 16);
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke_32;
    v18[3] = &unk_24CC864B8;
    v18[4] = v13;
    dispatch_after(v12, v14, v18);
  }
  if ((CSIsCommunalDevice() & 1) != 0
    || CSIsIOS()
    && (objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "voiceTriggerEnabled"),
        v15,
        v16))
  {
    objc_msgSend(*(id *)(a1 + 32), "_logVoiceProfileConfusionWithCleanup:", 0);
  }
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v3);

}

void __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "_deleteUserVoiceProfile:", v5);
  v7 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v8 = 136315650;
    v9 = "-[SSRVoiceProfileStore cleanupVoiceProfileStore:]_block_invoke_2";
    v10 = 2048;
    v11 = a3;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Deleted duplicated voiceprofile(%lu): %{public}@", (uint8_t *)&v8, 0x20u);
  }

}

void __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke_32(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_synchronizeSiriVoiceProfilesWithAssistant");
  if (CSIsInternalBuild())
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BE28488], "getSiriLanguageWithFallback:", CFSTR("en-US"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_retrainLiveOnOnboardedProfilesForLanguage:withForceRetrain:withCompletion:", v3, 1, &__block_literal_global_37);

  }
}

void __49__SSRVoiceProfileStore_cleanupVoiceProfileStore___block_invoke_2_35(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE284B8];
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[SSRVoiceProfileStore cleanupVoiceProfileStore:]_block_invoke_2";
      v6 = 2114;
      v7 = v2;
      _os_log_error_impl(&dword_2117D4000, v3, OS_LOG_TYPE_ERROR, "%s ERR: Failed retraining LiveOn onboarded users with error %{public}@", (uint8_t *)&v4, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SSRVoiceProfileStore cleanupVoiceProfileStore:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Successfully retrained LiveOn onboarded users", (uint8_t *)&v4, 0xCu);
  }

}

void __49__SSRVoiceProfileStore_cleanupDuplicatedProfiles__block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  SSRVoiceProfileStoreCleaner *v4;
  void *v5;
  void *v6;
  os_log_t v7;
  NSObject *v8;
  int v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE284B8];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SSRVoiceProfileStore cleanupDuplicatedProfiles]_block_invoke";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Triggered cleanup duplicated profiles", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_loadVoiceProfiles");
  v4 = objc_alloc_init(SSRVoiceProfileStoreCleaner);
  -[SSRVoiceProfileStoreCleaner filterDuplicatedSiriProfilesFrom:](v4, "filterDuplicatedSiriProfilesFrom:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __49__SSRVoiceProfileStore_cleanupDuplicatedProfiles__block_invoke_27;
    v10[3] = &unk_24CC86170;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x24BE28400], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "submitVoiceIdIssueReport:", *MEMORY[0x24BE284F8]);

  }
  v7 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 136315394;
    v12 = "-[SSRVoiceProfileStore cleanupDuplicatedProfiles]_block_invoke";
    v13 = 1026;
    v14 = v9;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Found %{public}d duplicated profiles", buf, 0x12u);

  }
}

void __49__SSRVoiceProfileStore_cleanupDuplicatedProfiles__block_invoke_27(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "_deleteUserVoiceProfile:", v5);
  v7 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v8 = 136315650;
    v9 = "-[SSRVoiceProfileStore cleanupDuplicatedProfiles]_block_invoke";
    v10 = 2048;
    v11 = a3;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Deleted duplicated voiceprofile(%lu): %{public}@", (uint8_t *)&v8, 0x20u);
  }

}

void __72__SSRVoiceProfileStore_migrateVoiceProfilesIfNeededWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _BOOL4 v3;
  uint64_t v4;
  _UNKNOWN **v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _UNKNOWN **v37;
  uint64_t j;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  os_log_t *v60;
  os_log_t *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  BOOL v71;
  void *v72;
  void *v73;
  id v74;
  BOOL v75;
  NSObject *v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  SSRVoiceProfile *v97;
  const __CFString *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  os_log_t v103;
  NSObject *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  id v114;
  uint64_t v115;
  NSObject *v116;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  id v135;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  id obj;
  id obja;
  void *v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  id v150;
  char v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  id v164;
  _BYTE v165[128];
  const __CFString *v166;
  void *v167;
  uint8_t v168[128];
  uint8_t buf[4];
  const char *v170;
  __int16 v171;
  id v172;
  __int16 v173;
  id v174;
  __int16 v175;
  uint64_t v176;
  _BYTE v177[128];
  _BYTE v178[128];
  const __CFString *v179;
  _QWORD v180[4];

  v180[1] = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getVoiceProfileStoreVersion");
  v2 = *MEMORY[0x24BE284B8];
  v3 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT);
  if (v1 == -1)
  {
    if (v3)
    {
      *(_DWORD *)buf = 136315138;
      v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
      _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s Migration of voice profile is triggered...", buf, 0xCu);
    }
    v5 = &off_24CC84000;
    +[SSRVoiceProfileManager sharedInstance](SSRVoiceProfileManager, "sharedInstance");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "SSRSpeakerProfilesBasePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "fileExistsAtPath:", v6) & 1) == 0)
    {
      v20 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
        v171 = 2112;
        v172 = v6;
        _os_log_impl(&dword_2117D4000, v20, OS_LOG_TYPE_DEFAULT, "%s Sat directory doesnt exist %@", buf, 0x16u);
      }
      v21 = *(_QWORD *)(a1 + 40);
      if (v21)
        (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);
      v10 = 0;
      goto LABEL_120;
    }
    v164 = 0;
    objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v6, &v164);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v164;
    if (v9)
    {
      v10 = v9;
      v11 = v8;
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v9, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Failed to get contents of %@ with error %@"), v6, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
        v171 = 2114;
        v172 = v14;
        _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      v16 = *(_QWORD *)(a1 + 40);
      if (!v16)
      {
        v8 = v11;
LABEL_119:

LABEL_120:
        return;
      }
      v145 = v10;
      v17 = (void *)MEMORY[0x24BDD1540];
      v179 = CFSTR("reason");
      v180[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v180, &v179, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 722, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v19);

      goto LABEL_66;
    }
    v22 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
      v171 = 2114;
      v172 = v8;
      _os_log_impl(&dword_2117D4000, v22, OS_LOG_TYPE_DEFAULT, "%s Migrating voice profiles in languages - %{public}@", buf, 0x16u);
    }
    v135 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    AFPreferencesSupportedLanguages();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v8;
    v129 = v7;
    if (v18)
    {
      v162 = 0u;
      v163 = 0u;
      v160 = 0u;
      v161 = 0u;
      v23 = v8;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v160, v178, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v161;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v161 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * i);
            if ((objc_msgSend(v18, "containsObject:", v28) & 1) != 0)
            {
              objc_msgSend(v135, "addObject:", v28);
            }
            else
            {
              v29 = v18;
              v30 = *MEMORY[0x24BE284B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                v171 = 2114;
                v172 = v28;
                v173 = 2114;
                v174 = v29;
                _os_log_impl(&dword_2117D4000, v30, OS_LOG_TYPE_DEFAULT, "%s Language %{public}@ not supported in %{public}@ - Deleting", buf, 0x20u);
              }
              objc_msgSend(v6, "stringByAppendingPathComponent:", v28);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v31);

              v18 = v29;
            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v160, v178, 16);
        }
        while (v25);
      }

      v8 = v128;
      v7 = v129;
      v5 = &off_24CC84000;
    }
    if (!v135)
    {
      v11 = v8;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Filtered languages is nil - %@"), v8);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
        v171 = 2114;
        v172 = v55;
        _os_log_error_impl(&dword_2117D4000, v56, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
      v57 = *(_QWORD *)(a1 + 40);
      if (v57)
        (*(void (**)(uint64_t, _QWORD))(v57 + 16))(v57, 0);

      v14 = 0;
      v145 = 0;
LABEL_66:
      v8 = v11;
LABEL_118:

      v10 = v145;
      goto LABEL_119;
    }
    v33 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
      v171 = 2114;
      v172 = v135;
      _os_log_impl(&dword_2117D4000, v33, OS_LOG_TYPE_DEFAULT, "%s Migrating voice profiles in languages - %{public}@", buf, 0x16u);
    }
    if ((CSIsIOS() & 1) != 0 || CSIsMac())
    {
      v126 = v18;
      v137 = v6;
      v158 = 0u;
      v159 = 0u;
      v156 = 0u;
      v157 = 0u;
      obj = v135;
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v177, 16);
      if (v34)
      {
        v35 = v34;
        v145 = 0;
        v36 = *(_QWORD *)v157;
        v37 = &off_24CC84000;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v157 != v36)
              objc_enumerationMutation(obj);
            v39 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * j);
            v40 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
              v171 = 2114;
              v172 = v39;
              _os_log_impl(&dword_2117D4000, v40, OS_LOG_TYPE_DEFAULT, "%s Voice profile migration for language - %{public}@", buf, 0x16u);
            }
            objc_msgSend(v137, "stringByAppendingPathComponent:", v39);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend(v138, "newVoiceProfileWithLocale:withAppDomain:", v39, CFSTR("com.apple.siri"));
            v43 = v42;
            if (v42)
            {
              v44 = v37[47];
              objc_msgSend(v42, "voiceProfileBasePath");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "moveContentsOfSrcDirectory:toDestDirectory:", v41, v45);
              v46 = objc_claimAutoreleasedReturnValue();

              if (v46)
              {
                v47 = (void *)*MEMORY[0x24BE284B8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                {
                  v53 = v47;
                  objc_msgSend(v43, "voiceProfileBasePath");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315906;
                  v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                  v171 = 2114;
                  v172 = v41;
                  v173 = 2114;
                  v174 = v54;
                  v175 = 2114;
                  v176 = v46;
                  _os_log_error_impl(&dword_2117D4000, v53, OS_LOG_TYPE_ERROR, "%s Moving contents from %{public}@ to %{public}@ failed with error %{public}@", buf, 0x2Au);

                }
                v145 = (void *)v46;
                v37 = &off_24CC84000;
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 32), "_updateTrainedUsersWithAction:UserVoiceProfile:", 1, v43);
                v49 = (id)objc_msgSend(v37[47], "removeItemAtPath:", v41);
                v50 = (void *)*MEMORY[0x24BE284B8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                {
                  v51 = v50;
                  objc_msgSend(v43, "profileID");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315650;
                  v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                  v171 = 2114;
                  v172 = v52;
                  v173 = 2114;
                  v174 = v39;
                  _os_log_impl(&dword_2117D4000, v51, OS_LOG_TYPE_DEFAULT, "%s Completed migrating voiceprofile for %{public}@ in language %{public}@", buf, 0x20u);

                  v37 = &off_24CC84000;
                }
                v145 = 0;
              }
            }
            else
            {
              v48 = *MEMORY[0x24BE284B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                v171 = 2114;
                v172 = v39;
                _os_log_error_impl(&dword_2117D4000, v48, OS_LOG_TYPE_ERROR, "%s voice profile created is nil!!! - Skipping %{public}@", buf, 0x16u);
              }
            }

          }
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v177, 16);
        }
        while (v35);
        goto LABEL_114;
      }
    }
    else
    {
      if (!CSIsCommunalDevice())
      {
        v145 = 0;
        goto LABEL_115;
      }
      v126 = v18;
      v137 = v6;
      v154 = 0u;
      v155 = 0u;
      v152 = 0u;
      v153 = 0u;
      v127 = v135;
      v131 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v152, v168, 16);
      if (v131)
      {
        v145 = 0;
        v130 = *(_QWORD *)v153;
        v58 = CFSTR("UserVoiceProfileOnboardType");
        while (2)
        {
          v59 = 0;
          v60 = (os_log_t *)MEMORY[0x24BE284B8];
          do
          {
            v61 = v60;
            if (*(_QWORD *)v153 != v130)
              objc_enumerationMutation(v127);
            v62 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * v59);
            objc_msgSend(v5[53], "sharedInstance");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "SSRSpeakerProfilesBasePath");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v142 = v62;
            objc_msgSend(v64, "stringByAppendingPathComponent:", v62);
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            v134 = v65;
            objc_msgSend(v65, "stringByAppendingPathComponent:", CFSTR("spid"));
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "stringByAppendingPathComponent:", CFSTR("trained_users.json"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            v151 = 0;
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v64) = objc_msgSend(v68, "fileExistsAtPath:isDirectory:", v67, &v151);

            objc_msgSend(MEMORY[0x24BDBCE30], "array");
            v69 = objc_claimAutoreleasedReturnValue();
            v70 = (void *)v69;
            if ((_DWORD)v64)
              v71 = v151 == 0;
            else
              v71 = 0;
            if (v71)
            {
              objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v67);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              v150 = 0;
              objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v73, 0, &v150);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = v150;

              if (v72)
                v75 = v74 == 0;
              else
                v75 = 0;
              v60 = v61;
              if (!v75)
              {
                v116 = *v61;
                if (os_log_type_enabled(*v61, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                  v171 = 2112;
                  v172 = v67;
                  v173 = 2112;
                  v174 = v74;
                  _os_log_impl(&dword_2117D4000, v116, OS_LOG_TYPE_DEFAULT, "%s Could not read existing %@ file: err: %@", buf, 0x20u);
                }
                v118 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v74, "localizedDescription");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v118, "stringWithFormat:", CFSTR("Could not read existing %@ file: err: %@"), v67, v119);
                v120 = (void *)objc_claimAutoreleasedReturnValue();

                v121 = *MEMORY[0x24BE284B8];
                v14 = v127;
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                  v171 = 2114;
                  v172 = v120;
                  _os_log_error_impl(&dword_2117D4000, v121, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
                }
                v122 = *(_QWORD *)(a1 + 40);
                if (v122)
                {
                  v123 = (void *)MEMORY[0x24BDD1540];
                  v166 = CFSTR("reason");
                  v167 = v120;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1);
                  v124 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 722, v124);
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  (*(void (**)(uint64_t, void *))(v122 + 16))(v122, v125);

                  v14 = v127;
                }

                v6 = v137;
                v8 = v128;
                v7 = v129;
                v18 = v126;
                goto LABEL_118;
              }

            }
            else
            {
              v72 = (void *)v69;
              v60 = v61;
            }
            v132 = v59;
            v76 = *v60;
            if (os_log_type_enabled(*v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
              v171 = 2114;
              v172 = v142;
              _os_log_impl(&dword_2117D4000, v76, OS_LOG_TYPE_DEFAULT, "%s Voice profile migration for language - %{public}@", buf, 0x16u);
            }
            v133 = v67;
            v77 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v67);
            objc_msgSend(v5[53], "sharedInstance");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "SSRBasePathForAppDomain:", CFSTR("com.apple.siri"));
            v79 = objc_claimAutoreleasedReturnValue();

            v140 = (void *)v79;
            +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v79);
            v148 = 0u;
            v149 = 0u;
            v146 = 0u;
            v147 = 0u;
            obja = v72;
            v80 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v146, v165, 16);
            if (v80)
            {
              v81 = v80;
              v82 = *(_QWORD *)v147;
              v139 = *(_QWORD *)v147;
              do
              {
                v83 = 0;
                v141 = v81;
                do
                {
                  if (*(_QWORD *)v147 != v82)
                    objc_enumerationMutation(obja);
                  v84 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * v83);
                  objc_msgSend(v84, "objectForKeyedSubscript:", v58);
                  v85 = objc_claimAutoreleasedReturnValue();
                  if (v85
                    && (v86 = (void *)v85,
                        objc_msgSend(v84, "objectForKeyedSubscript:", v58),
                        v87 = (void *)objc_claimAutoreleasedReturnValue(),
                        v88 = objc_msgSend(v87, "unsignedIntegerValue"),
                        v87,
                        v86,
                        v88 == 1))
                  {
                    v89 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                    objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("UserVoiceProfileID"));
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v89, "setObject:forKeyedSubscript:", v90, CFSTR("UserVoiceProfileID"));

                    objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("UserSharedSiriID"));
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v89, "setObject:forKeyedSubscript:", v91, CFSTR("UserSharedSiriID"));

                    objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("UserVoiceProfileDateTrained"));
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v89, "setObject:forKeyedSubscript:", v92, CFSTR("UserVoiceProfileDateTrained"));

                    objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("UserVoiceProfileExpSatVecCount"));
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v89, "setObject:forKeyedSubscript:", v93, CFSTR("UserVoiceProfileExpSatVecCount"));

                    objc_msgSend(v89, "setObject:forKeyedSubscript:", v142, CFSTR("UserVoiceProfileLocale"));
                    objc_msgSend(v89, "setObject:forKeyedSubscript:", CFSTR("com.apple.siri"), CFSTR("UserVoiceProfileAppDomain"));
                    objc_msgSend(v140, "stringByAppendingPathComponent:", v142);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("UserVoiceProfileID"));
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v94, "stringByAppendingPathComponent:", v95);
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v89, "setObject:forKeyedSubscript:", v96, CFSTR("UserVoiceProfilePath"));

                    v97 = -[SSRVoiceProfile initWithDictionary:]([SSRVoiceProfile alloc], "initWithDictionary:", v89);
                    if (v97)
                    {
                      v98 = v58;
                      objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("UserVoiceProfilePath"));
                      v99 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SSRVoiceProfile voiceProfileBasePath](v97, "voiceProfileBasePath");
                      v100 = (void *)objc_claimAutoreleasedReturnValue();
                      +[SSRUtils moveContentsOfSrcDirectory:toDestDirectory:](SSRUtils, "moveContentsOfSrcDirectory:toDestDirectory:", v99, v100);
                      v101 = objc_claimAutoreleasedReturnValue();

                      if (v101)
                      {
                        v60 = (os_log_t *)MEMORY[0x24BE284B8];
                        v102 = (void *)*MEMORY[0x24BE284B8];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
                        {
                          v111 = v102;
                          objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("UserVoiceProfilePath"));
                          v112 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SSRVoiceProfile voiceProfileBasePath](v97, "voiceProfileBasePath");
                          v113 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 136315906;
                          v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                          v171 = 2114;
                          v172 = v112;
                          v173 = 2114;
                          v174 = v113;
                          v175 = 2114;
                          v176 = v101;
                          _os_log_error_impl(&dword_2117D4000, v111, OS_LOG_TYPE_ERROR, "%s Moving contents from %{public}@ to %{public}@ failed with error %{public}@", buf, 0x2Au);

                          v60 = (os_log_t *)MEMORY[0x24BE284B8];
                        }
                        v145 = (void *)v101;
                      }
                      else
                      {
                        objc_msgSend(*(id *)(a1 + 32), "_updateTrainedUsersWithAction:UserVoiceProfile:", 1, v97);
                        v60 = (os_log_t *)MEMORY[0x24BE284B8];
                        v108 = (void *)*MEMORY[0x24BE284B8];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
                        {
                          v109 = v108;
                          -[SSRVoiceProfile profileID](v97, "profileID");
                          v110 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 136315650;
                          v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                          v171 = 2114;
                          v172 = v110;
                          v173 = 2114;
                          v174 = v142;
                          _os_log_impl(&dword_2117D4000, v109, OS_LOG_TYPE_DEFAULT, "%s Completed migrating voiceprofile for %{public}@ in language %{public}@", buf, 0x20u);

                        }
                        v145 = 0;
                      }
                      v58 = v98;
                      v82 = v139;
                      v81 = v141;
                    }
                    else
                    {
                      v107 = *v60;
                      v81 = v141;
                      if (os_log_type_enabled(*v60, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315394;
                        v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                        v171 = 2114;
                        v172 = v89;
                        _os_log_error_impl(&dword_2117D4000, v107, OS_LOG_TYPE_ERROR, "%s voice profile created is nil!!! - Skipping %{public}@", buf, 0x16u);
                      }
                      v82 = v139;
                    }

                  }
                  else
                  {
                    v103 = *v60;
                    if (os_log_type_enabled(*v60, OS_LOG_TYPE_DEFAULT))
                    {
                      v104 = v103;
                      objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("UserVoiceProfileID"));
                      v105 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v84, "objectForKeyedSubscript:", v58);
                      v106 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315650;
                      v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
                      v171 = 2114;
                      v172 = v105;
                      v173 = 2114;
                      v174 = v106;
                      _os_log_impl(&dword_2117D4000, v104, OS_LOG_TYPE_DEFAULT, "%s Skipped migrating non-siri landed profile - %{public}@, %{public}@", buf, 0x20u);

                    }
                  }
                  ++v83;
                }
                while (v81 != v83);
                v81 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v146, v165, 16);
              }
              while (v81);
            }

            v114 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v134);
            v59 = v132 + 1;
            v5 = &off_24CC84000;
          }
          while (v132 + 1 != v131);
          v131 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v152, v168, 16);
          if (v131)
            continue;
          goto LABEL_114;
        }
      }
    }
    v145 = 0;
LABEL_114:

    v6 = v137;
    v8 = v128;
    v7 = v129;
    v18 = v126;
LABEL_115:
    v115 = *(_QWORD *)(a1 + 40);
    if (v115)
      (*(void (**)(uint64_t, void *))(v115 + 16))(v115, v145);
    v14 = v135;
    goto LABEL_118;
  }
  if (v3)
  {
    *(_DWORD *)buf = 136315138;
    v170 = "-[SSRVoiceProfileStore migrateVoiceProfilesIfNeededWithCompletionBlock:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s Profiles already migrated - Bailing out", buf, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6990 != -1)
    dispatch_once(&sharedInstance_onceToken_6990, &__block_literal_global_6991);
  return (id)sharedInstance_userStore;
}

void __38__SSRVoiceProfileStore_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  if (CSIsInternalBuild())
    +[SSRUtils cleanupOrphanedVoiceIdGradingFiles](SSRUtils, "cleanupOrphanedVoiceIdGradingFiles");
  v0 = -[SSRVoiceProfileStore initStore]([SSRVoiceProfileStore alloc], "initStore");
  v1 = (void *)sharedInstance_userStore;
  sharedInstance_userStore = (uint64_t)v0;

}

@end
