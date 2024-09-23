@implementation _LTDAssetConfigurationModel

- (_LTDAssetConfigurationModel)initWithDictionary:(id)a3
{
  id v4;
  _LTDAssetConfigurationModel *v5;
  uint64_t v6;
  NSDictionary *root;
  void *v8;
  int v9;
  void *v10;
  NSArray *v11;
  NSArray *speechTranslationAssetTypes;
  void *v13;
  int v14;
  void *v15;
  NSArray *v16;
  NSArray *speechEndpointAssetTypes;
  void *v18;
  int v19;
  void *v20;
  NSArray *v21;
  NSArray *assetDirectoryNames;
  _LTDAssetConfigurationModel *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_LTDAssetConfigurationModel;
  v5 = -[_LTDAssetConfigurationModel init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ManagedAssetTypes"));
    v6 = objc_claimAutoreleasedReturnValue();
    root = v5->_root;
    v5->_root = (NSDictionary *)v6;

    -[NSDictionary objectForKeyedSubscript:](v5->_root, "objectForKeyedSubscript:", CFSTR("SpeechTranslation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = objc_msgSend(v8, "lt_ensureElementType:", objc_opt_class());
      v10 = (void *)MEMORY[0x24BDBD1A8];
      if (v9)
        v10 = v8;
    }
    else
    {

      v8 = 0;
      v10 = (void *)MEMORY[0x24BDBD1A8];
    }
    v11 = v10;

    speechTranslationAssetTypes = v5->_speechTranslationAssetTypes;
    v5->_speechTranslationAssetTypes = v11;

    -[NSDictionary objectForKeyedSubscript:](v5->_root, "objectForKeyedSubscript:", CFSTR("SpeechEndpoint"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = objc_msgSend(v13, "lt_ensureElementType:", objc_opt_class());
      v15 = (void *)MEMORY[0x24BDBD1A8];
      if (v14)
        v15 = v13;
    }
    else
    {

      v13 = 0;
      v15 = (void *)MEMORY[0x24BDBD1A8];
    }
    v16 = v15;

    speechEndpointAssetTypes = v5->_speechEndpointAssetTypes;
    v5->_speechEndpointAssetTypes = v16;

    -[NSDictionary objectForKeyedSubscript:](v5->_root, "objectForKeyedSubscript:", CFSTR("AssetDirectory"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = objc_msgSend(v18, "lt_ensureElementType:", objc_opt_class());
      v20 = (void *)MEMORY[0x24BDBD1A8];
      if (v19)
        v20 = v18;
    }
    else
    {

      v18 = 0;
      v20 = (void *)MEMORY[0x24BDBD1A8];
    }
    v21 = v20;

    assetDirectoryNames = v5->_assetDirectoryNames;
    v5->_assetDirectoryNames = v21;

    v23 = v5;
  }

  return v5;
}

- (id)currentSpeechTranslationAssetType
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  _LTPreferencesOverrideDefaultCatalog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_LTDAssetConfigurationModel currentSpeechTranslationAssetType].cold.2((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    -[_LTDAssetConfigurationModel speechTranslationAssetTypes](self, "speechTranslationAssetTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_LTDAssetConfigurationModel currentSpeechTranslationAssetType].cold.1((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
  }
  v20 = v4;

  return v20;
}

- (id)currentEndpointAssetType
{
  void *v2;
  void *v3;

  -[_LTDAssetConfigurationModel speechEndpointAssetTypes](self, "speechEndpointAssetTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentAssetDirectoryName
{
  void *v2;
  void *v3;

  -[_LTDAssetConfigurationModel assetDirectoryNames](self, "assetDirectoryNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescription
{
  return (id)-[NSDictionary debugDescription](self->_root, "debugDescription");
}

- (NSString)config
{
  return self->_config;
}

- (NSArray)speechTranslationAssetTypes
{
  return self->_speechTranslationAssetTypes;
}

- (NSArray)speechEndpointAssetTypes
{
  return self->_speechEndpointAssetTypes;
}

- (NSArray)assetDirectoryNames
{
  return self->_assetDirectoryNames;
}

- (NSDictionary)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
  objc_storeStrong((id *)&self->_root, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_assetDirectoryNames, 0);
  objc_storeStrong((id *)&self->_speechEndpointAssetTypes, 0);
  objc_storeStrong((id *)&self->_speechTranslationAssetTypes, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)currentSpeechTranslationAssetType
{
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, a2, a3, "Current translation asset catalog is %{public}@ from OverrideDefaultCatalog", a5, a6, a7, a8, 2u);
}

@end
