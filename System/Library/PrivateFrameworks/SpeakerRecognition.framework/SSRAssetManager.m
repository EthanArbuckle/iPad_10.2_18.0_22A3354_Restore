@implementation SSRAssetManager

- (SSRAssetManager)init
{
  SSRAssetManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSString *currentLanguageCode;
  id v7;
  SSRMobileAssetProvider *v8;
  SSRTrialAssetProvider *v9;
  uint64_t v10;
  NSArray *assetProviders;
  SSRAssetManager *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)SSRAssetManager;
  v2 = -[SSRAssetManager init](&v15, sel_init);
  if (!v2)
    goto LABEL_8;
  v3 = dispatch_queue_create("Serial SSRAssetManager queue", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  objc_msgSend(MEMORY[0x24BE28488], "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v5 = objc_claimAutoreleasedReturnValue();
  currentLanguageCode = v2->_currentLanguageCode;
  v2->_currentLanguageCode = (NSString *)v5;

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_alloc_init(SSRMobileAssetProvider);
  if (v8)
    objc_msgSend(v7, "addObject:", v8);
  v9 = objc_alloc_init(SSRTrialAssetProvider);
  if (v9)
    objc_msgSend(v7, "addObject:", v9);
  if (objc_msgSend(v7, "count"))
  {
    v10 = objc_msgSend(v7, "copy");
    assetProviders = v2->_assetProviders;
    v2->_assetProviders = (NSArray *)v10;

LABEL_8:
    v12 = v2;
    goto LABEL_12;
  }
  v13 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SSRAssetManager init]";
    _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create asset providers - Bailing out", buf, 0xCu);
  }

  v12 = 0;
LABEL_12:

  return v12;
}

- (id)installedAssetOfType:(unint64_t)a3 forLanguage:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6530;
  v19 = __Block_byref_object_dispose__6531;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__SSRAssetManager_installedAssetOfType_forLanguage___block_invoke;
  v11[3] = &unk_24CC86048;
  v13 = &v15;
  v14 = a3;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)allInstalledAssetsOfType:(unint64_t)a3 forLanguage:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *);
  void *v15;
  SSRAssetManager *v16;
  id v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6530;
  v24 = __Block_byref_object_dispose__6531;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __56__SSRAssetManager_allInstalledAssetsOfType_forLanguage___block_invoke;
  v15 = &unk_24CC86048;
  v16 = self;
  v19 = a3;
  v8 = v6;
  v17 = v8;
  v18 = &v20;
  dispatch_sync(queue, &v12);
  if (objc_msgSend((id)v21[5], "count", v12, v13, v14, v15, v16))
    v9 = (void *)v21[5];
  else
    v9 = 0;
  v10 = v9;

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (float)_convertVersionStringToFloat:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v8;

  v8 = 0.0;
  v3 = (void *)MEMORY[0x24BDD17A8];
  objc_msgSend(a3, "configVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scannerWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "scanFloat:", &v8);
  v6 = v8;

  return v6;
}

- (id)_latestVersionedAssetOfType:(unint64_t)a3 fromProviders:(id)a4 forLocale:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a4;
  v8 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6530;
  v20 = __Block_byref_object_dispose__6531;
  v21 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__SSRAssetManager__latestVersionedAssetOfType_fromProviders_forLocale___block_invoke;
  v12[3] = &unk_24CC86020;
  v15 = a3;
  v9 = v8;
  v13 = v9;
  v14 = &v16;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (SSRAssetManagerDelegate)delegate
{
  return (SSRAssetManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)assetProviders
{
  return self->_assetProviders;
}

- (void)setAssetProviders:(id)a3
{
  objc_storeStrong((id *)&self->_assetProviders, a3);
}

- (NSString)currentLanguageCode
{
  return self->_currentLanguageCode;
}

- (void)setCurrentLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_currentLanguageCode, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentLanguageCode, 0);
  objc_storeStrong((id *)&self->_assetProviders, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __71__SSRAssetManager__latestVersionedAssetOfType_fromProviders_forLocale___block_invoke(_QWORD *a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  _BYTE v16[24];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "installedAssetOfType:forLanguageCode:", a1[6], a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x24BE284B8];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v7, "configVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "getAssetProviderType");
      v12 = CFSTR("MA");
      *(_QWORD *)&v16[4] = "-[SSRAssetManager _latestVersionedAssetOfType:fromProviders:forLocale:]_block_invoke";
      *(_DWORD *)v16 = 136315650;
      *(_WORD *)&v16[12] = 2112;
      *(_QWORD *)&v16[14] = v10;
      if (v11 == 1)
        v12 = CFSTR("Trial");
      *(_WORD *)&v16[22] = 2112;
      v17 = v12;
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Got asset with version: %@ from provider: %@", v16, 0x20u);

    }
    *a4 = objc_msgSend(v6, "getAssetProviderType", *(_OWORD *)v16, *(_QWORD *)&v16[16]) == 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v7);
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v13 = v8;
    v14 = objc_msgSend(v6, "getAssetProviderType");
    v15 = CFSTR("MA");
    if (v14 == 1)
      v15 = CFSTR("Trial");
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)&v16[4] = "-[SSRAssetManager _latestVersionedAssetOfType:fromProviders:forLocale:]_block_invoke";
    *(_WORD *)&v16[12] = 2112;
    *(_QWORD *)&v16[14] = v15;
    _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: Asset not available from provider: %@", v16, 0x16u);

  }
}

void __56__SSRAssetManager_allInstalledAssetsOfType_forLanguage___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __56__SSRAssetManager_allInstalledAssetsOfType_forLanguage___block_invoke_2;
  v6[3] = &unk_24CC86020;
  v9 = a1[7];
  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 16);
  v6[1] = 3221225472;
  v4 = v2;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

}

void __56__SSRAssetManager_allInstalledAssetsOfType_forLanguage___block_invoke_2(_QWORD *a1, void *a2)
{
  __CFString *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  os_log_t *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[__CFString getAssetProviderType](v3, "getAssetProviderType");
  v5 = CFSTR("MA");
  if (v4 == 1)
    v5 = CFSTR("Trial");
  v6 = v5;
  v7 = (os_log_t *)MEMORY[0x24BE284B8];
  v8 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = "-[SSRAssetManager allInstalledAssetsOfType:forLanguage:]_block_invoke_2";
    v17 = 2112;
    v18 = v3;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s parsing provider: %@ name: %@", (uint8_t *)&v15, 0x20u);
  }
  v9 = -[__CFString getAssetProviderType](v3, "getAssetProviderType");
  v10 = a1[6];
  v11 = a1[4];
  if (v9 != 1)
  {
    -[__CFString allInstalledAssetsOfType:forLanguage:](v3, "allInstalledAssetsOfType:forLanguage:", v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (v13 && objc_msgSend(v13, "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObjectsFromArray:", v12);
      goto LABEL_14;
    }
    v14 = *v7;
    if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
LABEL_15:
    v15 = 136315394;
    v16 = "-[SSRAssetManager allInstalledAssetsOfType:forLanguage:]_block_invoke";
    v17 = 2112;
    v18 = v6;
    _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s ERR: got nil assets from provider: %@", (uint8_t *)&v15, 0x16u);
    goto LABEL_14;
  }
  -[__CFString installedAssetOfType:forLanguageCode:](v3, "installedAssetOfType:forLanguageCode:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v14 = *v7;
    if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "insertObject:atIndex:", v12, 0);
LABEL_14:

}

void __52__SSRAssetManager_installedAssetOfType_forLanguage___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVoiceTriggerAssetOverridingEnabled");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fakeVoiceTriggerAssetPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileExistsAtPath:", v5);

    if (v8)
    {
      v9 = *MEMORY[0x24BE28368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315138;
        v17 = "-[SSRAssetManager installedAssetOfType:forLanguage:]_block_invoke";
        _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Retuning the override asset", (uint8_t *)&v16, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BE28388], "assetForAssetType:resourcePath:configVersion:assetProvider:", 0, v6, CFSTR("override-asset"), 1);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_latestVersionedAssetOfType:fromProviders:forLocale:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_6561);
  return (id)sharedManager_sharedManager;
}

void __32__SSRAssetManager_sharedManager__block_invoke()
{
  SSRAssetManager *v0;
  void *v1;

  SSRLogInitIfNeeded();
  v0 = objc_alloc_init(SSRAssetManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

@end
