@implementation _LTDTTSAssetModel

- (_LTDTTSAssetModel)initWithAssetIdentifier:(id)a3
{
  id v5;
  _LTDTTSAssetModel *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *language;
  NSObject *v12;
  uint64_t v13;
  TTSAsset *ttsAsset;
  TTSAsset *v15;
  void *v16;
  NSString *assetName;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _LTAssetProgress *progress;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _LTDTTSAssetModel *v26;
  NSObject *v27;
  NSString *ltIdentifier;
  NSString *v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  NSString *v35;
  __int16 v36;
  NSString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_LTDTTSAssetModel;
  v6 = -[_LTDTTSAssetModel init](&v31, sel_init);
  if (v6)
  {
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("TTS-")) & 1) != 0)
    {
      objc_storeStrong((id *)&v6->_assetName, a3);
      objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("TTS-"), "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&v6->_ltIdentifier, v8);
      _LTLocaleIdentifierMappedForTTS();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
      v10 = objc_claimAutoreleasedReturnValue();
      language = v6->_language;
      v6->_language = (NSString *)v10;

      v12 = _LTOSLogAssets();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        ltIdentifier = v6->_ltIdentifier;
        v30 = v6->_language;
        *(_DWORD *)buf = 138412802;
        v33 = v9;
        v34 = 2112;
        v35 = ltIdentifier;
        v36 = 2112;
        v37 = v30;
        _os_log_debug_impl(&dword_2491B9000, v12, OS_LOG_TYPE_DEBUG, "Initializing LTDTTSAssetModel with: ttsIdentifier %@ | _ltIdentifier %@ | _language %@", buf, 0x20u);
      }
      +[_LTDTTSAssetService ttsAssetForLocaleIdentifier:](_LTDTTSAssetService, "ttsAssetForLocaleIdentifier:", v9);
      v13 = objc_claimAutoreleasedReturnValue();
      ttsAsset = v6->_ttsAsset;
      v6->_ttsAsset = (TTSAsset *)v13;

      v15 = v6->_ttsAsset;
      if (!v15)
      {
        v27 = _LTOSLogAssets();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[_LTDTTSAssetModel initWithAssetIdentifier:].cold.1((uint64_t)v5, (uint64_t *)&v6->_ltIdentifier, v27);
        v26 = 0;
        goto LABEL_21;
      }
      v16 = (void *)MEMORY[0x24BDF63B8];
      assetName = v6->_assetName;
      -[TTSAsset diskSize](v15, "diskSize");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "integerValue");

      if (v19 <= 100)
        v20 = 100;
      else
        v20 = v19;
      objc_msgSend(v16, "discreteProgressWithIdentifier:totalUnitCount:", assetName, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      progress = v6->_progress;
      v6->_progress = (_LTAssetProgress *)v21;

      v23 = -[_LTDTTSAssetModel state](v6, "state");
      if (v23 == 1)
      {
        v24 = 2;
      }
      else
      {
        if (v23 != 2)
        {
LABEL_20:
          v26 = v6;
LABEL_21:

          goto LABEL_22;
        }
        v24 = 1;
      }
      -[_LTAssetProgress setOfflineState:](v6->_progress, "setOfflineState:", v24);
      goto LABEL_20;
    }
    v25 = _LTOSLogAssets();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[_LTDTTSAssetModel initWithAssetIdentifier:].cold.2((uint64_t)v5, v25);
  }
  v26 = 0;
LABEL_22:

  return v26;
}

+ (id)modelFromAsset:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)assetLanguage
{
  return self->_ltIdentifier;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (NSString)coreAssetName
{
  return self->_assetName;
}

- (NSString)assetTypeName
{
  return (NSString *)CFSTR("TTS");
}

- (unint64_t)assetType
{
  return 8;
}

- (int64_t)assetVersion
{
  return -[TTSAsset versionNumber](self->_ttsAsset, "versionNumber");
}

- (NSString)assetBuild
{
  return 0;
}

- (int64_t)contentVersion
{
  return 0;
}

- (int64_t)downloadSize
{
  return -[_LTAssetProgress totalUnitCount](self->_progress, "totalUnitCount");
}

- (int64_t)formatVersion
{
  return 0;
}

- (NSURL)getLocalFileUrl
{
  return 0;
}

- (BOOL)isPremiumTextLID
{
  return 0;
}

- (NSString)managedAssetType
{
  return (NSString *)CFSTR("com.apple.MobileAsset.Trial.Siri.SiriTextToSpeech");
}

- (int64_t)requiredCapabilityIdentifier
{
  return 0;
}

- (unint64_t)state
{
  if ((-[TTSAsset locallyAvailable](self->_ttsAsset, "locallyAvailable") & 1) != 0)
    return 1;
  if (-[TTSAsset downloading](self->_ttsAsset, "downloading"))
    return 2;
  return 3;
}

- (NSArray)supportedLanguages
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = self->_language;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)unarchivedSize
{
  return -[_LTAssetProgress totalUnitCount](self->_progress, "totalUnitCount");
}

- (BOOL)canBePurged
{
  void *v2;
  char v3;

  -[_LTDTTSAssetModel ttsAsset](self, "ttsAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "purgeable");

  return v3;
}

- (BOOL)isAvailable
{
  return -[_LTDTTSAssetModel state](self, "state") == 3;
}

- (BOOL)isDownloading
{
  return -[_LTDTTSAssetModel state](self, "state") == 2;
}

- (BOOL)isInstalled
{
  return -[_LTDTTSAssetModel state](self, "state") == 1;
}

- (_LTAssetProgress)progress
{
  return self->_progress;
}

- (TTSAsset)ttsAsset
{
  return self->_ttsAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttsAsset, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_ltIdentifier, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (void)initWithAssetIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "Failed  initialize a LTDTTSAssetModel for %{public}@ via LT identifier: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)initWithAssetIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2491B9000, a2, OS_LOG_TYPE_ERROR, "Cannot initialize a LTDTTSAssetModel using a non-TTS identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
