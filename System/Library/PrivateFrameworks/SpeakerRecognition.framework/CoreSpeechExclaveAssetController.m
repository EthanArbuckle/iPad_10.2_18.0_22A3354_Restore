@implementation CoreSpeechExclaveAssetController

- (CoreSpeechExclaveAssetController)init
{
  CoreSpeechExclaveAssetController *v2;
  CoreSpeechExclaveAssetController *v3;
  NSString *currentHardwarePlatform;
  NSString *fallbackHardwarePlatform;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CoreSpeechExclaveAssetController;
  v2 = -[CoreSpeechExclaveAssetController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CoreSpeechExclaveAssetController _initializeCurrentDevicePlatform](v2, "_initializeCurrentDevicePlatform");
    -[CoreSpeechExclaveAssetController _initializePreInstalledSecureAssetBundle](v3, "_initializePreInstalledSecureAssetBundle");
    currentHardwarePlatform = v3->_currentHardwarePlatform;
    v3->_currentHardwarePlatform = (NSString *)&stru_24CC88468;

    fallbackHardwarePlatform = v3->_fallbackHardwarePlatform;
    v3->_fallbackHardwarePlatform = (NSString *)&stru_24CC88468;

  }
  return v3;
}

- (id)_assetCategoryPathKeyForAssetType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return off_24CC85850[a3 - 1];
}

- (id)_assetCategoryForAssetType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return off_24CC85878[a3 - 1];
}

- (id)_configFileNameForPreInstalledAssetTypes:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return off_24CC858A0[a3 - 1];
}

- (id)_defaultConfigFileNameForPreInstalledAssetType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 0;
  else
    return off_24CC858C8[a3 - 1];
}

- (void)_initializeCurrentDevicePlatform
{
  NSString *currentHardwarePlatform;
  NSString *fallbackHardwarePlatform;

  currentHardwarePlatform = self->_currentHardwarePlatform;
  self->_currentHardwarePlatform = (NSString *)CFSTR("t8132");

  fallbackHardwarePlatform = self->_fallbackHardwarePlatform;
  self->_fallbackHardwarePlatform = (NSString *)CFSTR("t8140");

}

- (void)_initializePreInstalledSecureAssetBundle
{
  SecureAssetPreInstalledBundleBridge *v3;
  SecureAssetPreInstalledBundleBridge *preInstalledBundle;
  NSObject *v5;
  NSString *fallbackHardwarePlatform;
  SecureAssetPreInstalledBundleBridge *v7;
  SecureAssetPreInstalledBundleBridge *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = -[SecureAssetPreInstalledBundleBridge initWithHardwarePlatform:]([SecureAssetPreInstalledBundleBridge alloc], "initWithHardwarePlatform:", self->_currentHardwarePlatform);
  preInstalledBundle = self->_preInstalledBundle;
  self->_preInstalledBundle = v3;

  if (!self->_preInstalledBundle)
  {
    v5 = CSLogContextFacilityCoreSpeechExclave;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
    {
      fallbackHardwarePlatform = self->_fallbackHardwarePlatform;
      v9 = 136315394;
      v10 = "-[CoreSpeechExclaveAssetController _initializePreInstalledSecureAssetBundle]";
      v11 = 2112;
      v12 = fallbackHardwarePlatform;
      _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Preinstall bundle is nil. Falling back to hardware %@", (uint8_t *)&v9, 0x16u);
    }
    v7 = -[SecureAssetPreInstalledBundleBridge initWithHardwarePlatform:]([SecureAssetPreInstalledBundleBridge alloc], "initWithHardwarePlatform:", self->_fallbackHardwarePlatform);
    v8 = self->_preInstalledBundle;
    self->_preInstalledBundle = v7;

  }
}

- (id)fetchSecureAssetForLocale:(id)a3 assetType:(unint64_t)a4
{
  NSObject *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  int v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  SecureAssetBridge *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7 || !self->_preInstalledBundle)
    goto LABEL_19;
  -[CoreSpeechExclaveAssetController _assetCategoryForAssetType:](self, "_assetCategoryForAssetType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreSpeechExclaveAssetController _assetCategoryPathKeyForAssetType:](self, "_assetCategoryPathKeyForAssetType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreSpeechExclaveAssetController _configFileNameForPreInstalledAssetTypes:](self, "_configFileNameForPreInstalledAssetTypes:", a4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreSpeechExclaveAssetController _defaultConfigFileNameForPreInstalledAssetType:](self, "_defaultConfigFileNameForPreInstalledAssetType:", a4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)CSLogContextFacilityCoreSpeechExclave;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v7);
    v12 = v10;
    v4 = objc_msgSend(v11, "UTF8String");
    *(_DWORD *)buf = 136315906;
    v33 = "-[CoreSpeechExclaveAssetController fetchSecureAssetForLocale:assetType:]";
    v34 = 2080;
    v35 = (uint64_t)v4;
    v36 = 2080;
    v37 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    v38 = 2080;
    v39 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s locale:%s category: %s, resourcePath: %s", buf, 0x2Au);

  }
  -[SecureAssetPreInstalledBundleBridge fetchAssetMetaDataForLocale:categoryResourcePathKey:](self->_preInstalledBundle, "fetchAssetMetaDataForLocale:categoryResourcePathKey:", v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)CSLogContextFacilityCoreSpeechExclave;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v7);
    v16 = v14;
    v4 = objc_msgSend(v15, "UTF8String");
    objc_msgSend(v13, "description");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "UTF8String");
    *(_DWORD *)buf = 136315650;
    v33 = "-[CoreSpeechExclaveAssetController fetchSecureAssetForLocale:assetType:]";
    v34 = 2080;
    v35 = (uint64_t)v4;
    v36 = 2080;
    v37 = v18;
    _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s locale:%s asset meta data: %s", buf, 0x20u);

  }
  v19 = 1;
  if (v13 && v9 && v8)
  {
    objc_msgSend(v13, "assetPathURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CSLogContextFacilityCoreSpeechExclave;
    v21 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v21)
      {
        v22 = v4;
        objc_msgSend(v20, "absoluteString");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = objc_msgSend(v23, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v33 = "-[CoreSpeechExclaveAssetController fetchSecureAssetForLocale:assetType:]";
        v34 = 2080;
        v35 = v24;
        _os_log_impl(&dword_2117D4000, v22, OS_LOG_TYPE_DEFAULT, "%s Asset config path: %s", buf, 0x16u);

      }
      v25 = [SecureAssetBridge alloc];
      objc_msgSend(v13, "configVersion");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resourcePath");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[SecureAssetBridge initWithAssetType:configurationPath:configVersion:category:categoryResourceURLPath:categoryConfigFileName:defaultCategoryConfigFileName:](v25, "initWithAssetType:configurationPath:configVersion:category:categoryResourceURLPath:categoryConfigFileName:defaultCategoryConfigFileName:", a4, v20, v26, v8, v27, v31, v30);

      v28 = CSLogContextFacilityCoreSpeechExclave;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[CoreSpeechExclaveAssetController fetchSecureAssetForLocale:assetType:]";
        v34 = 2048;
        v35 = (uint64_t)v4;
        _os_log_impl(&dword_2117D4000, v28, OS_LOG_TYPE_DEFAULT, "%s New asset %p", buf, 0x16u);
      }

      v19 = 0;
    }
    else if (v21)
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[CoreSpeechExclaveAssetController fetchSecureAssetForLocale:assetType:]";
      _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Missing asset config path", buf, 0xCu);
    }
  }

  if (v19)
LABEL_19:
    v4 = 0;

  return v4;
}

- (id)secureOTAAssetForLocale:(id)a3 assetType:(unint64_t)a4 resourcePath:(id)a5 configVersion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  SecureAssetBridge *v18;
  void *v19;
  void *v20;
  void *v21;
  SecureAssetBridge *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  if (v10)
  {
    v12 = a6;
    -[CoreSpeechExclaveAssetController _assetCategoryForAssetType:](self, "_assetCategoryForAssetType:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    -[CoreSpeechExclaveAssetController _configFileNameForPreInstalledAssetTypes:](self, "_configFileNameForPreInstalledAssetTypes:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreSpeechExclaveAssetController _defaultConfigFileNameForPreInstalledAssetType:](self, "_defaultConfigFileNameForPreInstalledAssetType:", a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)CSLogContextFacilityCoreSpeechExclave;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v10);
      v17 = v15;
      *(_DWORD *)buf = 136315906;
      v28 = "-[CoreSpeechExclaveAssetController secureOTAAssetForLocale:assetType:resourcePath:configVersion:]";
      v29 = 2080;
      v30 = objc_msgSend(v16, "UTF8String");
      v31 = 2080;
      v32 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      v33 = 2080;
      v34 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s locale:%s category: %s, resourcePath: %s", buf, 0x2Au);

    }
    v18 = [SecureAssetBridge alloc];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLByAppendingPathComponent:", CFSTR("corespeech.json"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SecureAssetBridge initWithAssetType:configurationPath:configVersion:category:categoryResourceURLPath:categoryConfigFileName:defaultCategoryConfigFileName:](v18, "initWithAssetType:configurationPath:configVersion:category:categoryResourceURLPath:categoryConfigFileName:defaultCategoryConfigFileName:", a4, v20, v12, v13, v21, v25, v26);

    v23 = CSLogContextFacilityCoreSpeechExclave;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[CoreSpeechExclaveAssetController secureOTAAssetForLocale:assetType:resourcePath:configVersion:]";
      v29 = 2048;
      v30 = (uint64_t)v22;
      _os_log_impl(&dword_2117D4000, v23, OS_LOG_TYPE_DEFAULT, "%s New asset %p", buf, 0x16u);
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (NSString)currentHardwarePlatform
{
  return self->_currentHardwarePlatform;
}

- (void)setCurrentHardwarePlatform:(id)a3
{
  objc_storeStrong((id *)&self->_currentHardwarePlatform, a3);
}

- (NSString)fallbackHardwarePlatform
{
  return self->_fallbackHardwarePlatform;
}

- (void)setFallbackHardwarePlatform:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackHardwarePlatform, a3);
}

- (SecureAssetPreInstalledBundleBridge)preInstalledBundle
{
  return self->_preInstalledBundle;
}

- (void)setPreInstalledBundle:(id)a3
{
  objc_storeStrong((id *)&self->_preInstalledBundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preInstalledBundle, 0);
  objc_storeStrong((id *)&self->_fallbackHardwarePlatform, 0);
  objc_storeStrong((id *)&self->_currentHardwarePlatform, 0);
}

+ (id)sharedInstance
{
  void *v2;
  CoreSpeechExclaveAssetController *v3;
  void *v4;

  if (CSSecureLogInitIfNeeded_once != -1)
    dispatch_once(&CSSecureLogInitIfNeeded_once, &__block_literal_global);
  v2 = (void *)sharedInstance_controller;
  if (!sharedInstance_controller)
  {
    v3 = objc_alloc_init(CoreSpeechExclaveAssetController);
    v4 = (void *)sharedInstance_controller;
    sharedInstance_controller = (uint64_t)v3;

    v2 = (void *)sharedInstance_controller;
  }
  return v2;
}

@end
