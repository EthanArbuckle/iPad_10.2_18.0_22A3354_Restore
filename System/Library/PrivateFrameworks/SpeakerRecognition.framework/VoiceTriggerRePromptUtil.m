@implementation VoiceTriggerRePromptUtil

- (id)initAndLoadImpactedAssistantIdsForRePrompt
{
  SSRMobileAssetProvider *v3;
  void *v4;
  VoiceTriggerRePromptUtil *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SSRMobileAssetProvider);
  -[SSRMobileAssetProvider installedAssetOfType:forLanguageCode:](v3, "installedAssetOfType:forLanguageCode:", 8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = (VoiceTriggerRePromptUtil *)-[VoiceTriggerRePromptUtil initAndLoadImpactedAssistantIdsForRePromptWithAsset:](self, "initAndLoadImpactedAssistantIdsForRePromptWithAsset:", v4);
    v5 = self;
  }
  else
  {
    v6 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[VoiceTriggerRePromptUtil initAndLoadImpactedAssistantIdsForRePrompt]";
      _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, "%s No asset found, nothing to do", (uint8_t *)&v8, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (id)initAndLoadImpactedAssistantIdsForRePromptWithAsset:(id)a3
{
  id v4;
  VoiceTriggerRePromptUtil *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  BloomFilter *bloomFilter;
  NSObject *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  VoiceTriggerRePromptUtil *v22;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VoiceTriggerRePromptUtil;
  v5 = -[VoiceTriggerRePromptUtil init](&v25, sel_init);
  if (!v5)
    goto LABEL_18;
  SSRLogInitIfNeeded();
  objc_msgSend(v4, "blobVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("1")) & 1) == 0)
  {
    v20 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[VoiceTriggerRePromptUtil initAndLoadImpactedAssistantIdsForRePromptWithAsset:]";
      v28 = 2112;
      v29 = v6;
      _os_log_error_impl(&dword_2117D4000, v20, OS_LOG_TYPE_ERROR, "%s Unsupported blob version %@", buf, 0x16u);
    }

    goto LABEL_17;
  }
  objc_msgSend(v4, "blobName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourcePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if ((v11 & 1) != 0)
  {
    v12 = (void *)MEMORY[0x24BDD1620];
    v13 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v12, "unarchivedObjectOfClass:fromData:error:", v13, v14, &v24);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v24;
    bloomFilter = v5->_bloomFilter;
    v5->_bloomFilter = (BloomFilter *)v15;

    if (v16)
    {
      v18 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[VoiceTriggerRePromptUtil initAndLoadImpactedAssistantIdsForRePromptWithAsset:]";
        v28 = 2114;
        v29 = v16;
        _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, "%s Failed to unarchive blob with err: %{public}@", buf, 0x16u);
      }
      v19 = 1;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v21 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[VoiceTriggerRePromptUtil initAndLoadImpactedAssistantIdsForRePromptWithAsset:]";
      v28 = 2114;
      v29 = v9;
      _os_log_error_impl(&dword_2117D4000, v21, OS_LOG_TYPE_ERROR, "%s Blob file not found at path : %{public}@", buf, 0x16u);
    }
    v19 = 1;
  }

  if (!v19)
  {
LABEL_18:
    v22 = v5;
    goto LABEL_19;
  }
LABEL_17:
  v22 = 0;
LABEL_19:

  return v22;
}

- (BOOL)isRePromptableWithAssistantId:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  BloomFilter *bloomFilter;
  void *v10;
  BOOL v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1760];
  v5 = a3;
  objc_msgSend(v4, "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemUptime");
  v8 = v7;

  bloomFilter = self->_bloomFilter;
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[BloomFilter contains:](bloomFilter, "contains:", v10);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "systemUptime");
  v14 = v13;

  v15 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315394;
    v18 = "-[VoiceTriggerRePromptUtil isRePromptableWithAssistantId:]";
    v19 = 2050;
    v20 = (v14 - v8) * 1000.0;
    _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s Bloom filter inference to check if ID exists took %{public}.3fms", (uint8_t *)&v17, 0x16u);
  }
  return v11;
}

- (BloomFilter)bloomFilter
{
  return (BloomFilter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBloomFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bloomFilter, 0);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3597 != -1)
    dispatch_once(&sharedInstance_onceToken_3597, &__block_literal_global_3598);
  return (id)sharedInstance_vtRepromptUtil;
}

void __42__VoiceTriggerRePromptUtil_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VoiceTriggerRePromptUtil initAndLoadImpactedAssistantIdsForRePrompt]([VoiceTriggerRePromptUtil alloc], "initAndLoadImpactedAssistantIdsForRePrompt");
  v1 = (void *)sharedInstance_vtRepromptUtil;
  sharedInstance_vtRepromptUtil = (uint64_t)v0;

}

@end
