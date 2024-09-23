@implementation SecureAssetPreInstalledBundleBridge

- (SecureAssetPreInstalledBundleBridge)initWithHardwarePlatform:(id)a3
{
  id v5;
  SecureAssetPreInstalledBundleBridge *v6;
  SecureAssetPreInstalledBundleBridge *v7;
  NSBundle *preinstalledAssetBundle;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSString *rootDirectory;
  NSString *v13;
  _BOOL4 v14;
  NSString *hardwarePlatform;
  SecureAssetPreInstalledBundleBridge *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SecureAssetPreInstalledBundleBridge;
  v6 = -[SecureAssetPreInstalledBundleBridge init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hardwarePlatform, a3);
    -[SecureAssetPreInstalledBundleBridge _initializePreinstalledAssetBundle](v7, "_initializePreinstalledAssetBundle");
    if (v7->_hardwarePlatform)
    {
      preinstalledAssetBundle = v7->_preinstalledAssetBundle;
      v9 = CSLogContextFacilityCoreSpeechExclave;
      v10 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT);
      if (preinstalledAssetBundle)
      {
        if (v10)
        {
          *(_DWORD *)buf = 136315138;
          v23 = "-[SecureAssetPreInstalledBundleBridge initWithHardwarePlatform:]";
          _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Preinstalled bundles initialized", buf, 0xCu);
          preinstalledAssetBundle = v7->_preinstalledAssetBundle;
        }
        -[SecureAssetPreInstalledBundleBridge _getSecureAssetRootDirectory:](v7, "_getSecureAssetRootDirectory:", preinstalledAssetBundle);
        v11 = objc_claimAutoreleasedReturnValue();
        rootDirectory = v7->_rootDirectory;
        v7->_rootDirectory = (NSString *)v11;

        v13 = v7->_rootDirectory;
        v9 = CSLogContextFacilityCoreSpeechExclave;
        v14 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v14)
          {
            hardwarePlatform = v7->_hardwarePlatform;
            *(_DWORD *)buf = 136315394;
            v23 = "-[SecureAssetPreInstalledBundleBridge initWithHardwarePlatform:]";
            v24 = 2112;
            v25 = hardwarePlatform;
            _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Checking for the correct hardware platform (%@) root directory", buf, 0x16u);
          }
          if (-[SecureAssetPreInstalledBundleBridge _isValidHardware](v7, "_isValidHardware"))
            goto LABEL_10;
          v17 = CSLogContextFacilityCoreSpeechExclave;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v23 = "-[SecureAssetPreInstalledBundleBridge initWithHardwarePlatform:]";
            v18 = "%s Failed to fetch the asset meta data";
            goto LABEL_20;
          }
          goto LABEL_22;
        }
        if (!v14)
          goto LABEL_22;
        *(_DWORD *)buf = 136315138;
        v23 = "-[SecureAssetPreInstalledBundleBridge initWithHardwarePlatform:]";
        v18 = "%s Failed to fetch root directory of the pre-installed asset bundle";
      }
      else
      {
        if (!v10)
          goto LABEL_22;
        *(_DWORD *)buf = 136315138;
        v23 = "-[SecureAssetPreInstalledBundleBridge initWithHardwarePlatform:]";
        v18 = "%s Failed to initialize preinstalled bundles";
      }
      v19 = v9;
LABEL_21:
      _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      goto LABEL_22;
    }
    v17 = CSLogContextFacilityCoreSpeechExclave;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[SecureAssetPreInstalledBundleBridge initWithHardwarePlatform:]";
      v18 = "%s Hardware platform is nil. Cannot parse preinstalled assets";
LABEL_20:
      v19 = v17;
      goto LABEL_21;
    }
LABEL_22:
    v16 = 0;
    goto LABEL_23;
  }
LABEL_10:
  v16 = v7;
LABEL_23:

  return v16;
}

- (id)_fetchJsonDictionaryFromFileURL:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = CSLogContextFacilityCoreSpeechExclave;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEBUG))
    {
      v8 = v4;
      objc_msgSend(v3, "absoluteString");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = 136315394;
      v11 = "-[SecureAssetPreInstalledBundleBridge _fetchJsonDictionaryFromFileURL:]";
      v12 = 2080;
      v13 = objc_msgSend(v9, "UTF8String");
      _os_log_debug_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEBUG, "%s Fetching json dictionary from URL %s", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:

        goto LABEL_12;
      }

    }
    v6 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SecureAssetPreInstalledBundleBridge _fetchJsonDictionaryFromFileURL:]";
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s URL is nil. Exiting json fetch operation", (uint8_t *)&v10, 0xCu);
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (void)_initializePreinstalledAssetBundle
{
  NSBundle *v3;
  NSBundle *preinstalledAssetBundle;

  if (!self->_preinstalledAssetBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/private/preboot/Cryptexes/ExclaveOS/System/ExclaveKit/System/Library/PrivateFrameworks/SecureVoiceTriggerAssets_exclavekit.framework"));
    v3 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    preinstalledAssetBundle = self->_preinstalledAssetBundle;
    self->_preinstalledAssetBundle = v3;

  }
}

- (id)_getSecureAssetRootDirectory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "URLForResource:withExtension:", CFSTR("platforms"), CFSTR("json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SecureAssetPreInstalledBundleBridge _fetchJsonDictionaryFromFileURL:](self, "_fetchJsonDictionaryFromFileURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("platforms"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", self->_hardwarePlatform);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isValidHardware
{
  SecureAssetPreInstalledBundleBridge *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[NSBundle URLForResource:withExtension:subdirectory:](self->_preinstalledAssetBundle, "URLForResource:withExtension:subdirectory:", CFSTR("preinstalledMeta"), CFSTR("json"), self->_rootDirectory);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SecureAssetPreInstalledBundleBridge _fetchJsonDictionaryFromFileURL:](v2, "_fetchJsonDictionaryFromFileURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)fetchAssetConfigFileURL:(id)a3
{
  return -[NSBundle URLForResource:withExtension:subdirectory:](self->_preinstalledAssetBundle, "URLForResource:withExtension:subdirectory:", CFSTR("corespeech"), CFSTR("json"), a3);
}

- (id)fetchCategoryResourceDirURL:(id)a3
{
  NSBundle *preinstalledAssetBundle;
  id v4;
  void *v5;
  void *v6;

  preinstalledAssetBundle = self->_preinstalledAssetBundle;
  v4 = a3;
  -[NSBundle bundleURL](preinstalledAssetBundle, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fetchAssetMetaDataForLocale:(id)a3 categoryResourcePathKey:(id)a4
{
  id v6;
  NSBundle *preinstalledAssetBundle;
  NSString *rootDirectory;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SecureAssetMetaData *v21;
  int v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  preinstalledAssetBundle = self->_preinstalledAssetBundle;
  rootDirectory = self->_rootDirectory;
  v9 = a3;
  -[NSBundle URLForResource:withExtension:subdirectory:](preinstalledAssetBundle, "URLForResource:withExtension:subdirectory:", CFSTR("preinstalledMeta"), CFSTR("json"), rootDirectory);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)CSLogContextFacilityCoreSpeechExclave;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v10, "relativePath");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = 136315394;
    v24 = "-[SecureAssetPreInstalledBundleBridge fetchAssetMetaDataForLocale:categoryResourcePathKey:]";
    v25 = 2080;
    v26 = objc_msgSend(v13, "UTF8String");
    _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Fetching meta data from %s", (uint8_t *)&v23, 0x16u);

  }
  -[SecureAssetPreInstalledBundleBridge _fetchJsonDictionaryFromFileURL:](self, "_fetchJsonDictionaryFromFileURL:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("configVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("relativeResourcePath"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecureAssetPreInstalledBundleBridge fetchAssetConfigFileURL:](self, "fetchAssetConfigFileURL:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecureAssetPreInstalledBundleBridge fetchCategoryResourceDirURL:](self, "fetchCategoryResourceDirURL:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SecureAssetMetaData initWithConfigVersion:resourcePath:assetPathURL:]([SecureAssetMetaData alloc], "initWithConfigVersion:resourcePath:assetPathURL:", v16, v20, v19);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (NSString)hardwarePlatform
{
  return self->_hardwarePlatform;
}

- (NSBundle)preinstalledAssetBundle
{
  return self->_preinstalledAssetBundle;
}

- (NSString)rootDirectory
{
  return self->_rootDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootDirectory, 0);
  objc_storeStrong((id *)&self->_preinstalledAssetBundle, 0);
  objc_storeStrong((id *)&self->_hardwarePlatform, 0);
}

@end
