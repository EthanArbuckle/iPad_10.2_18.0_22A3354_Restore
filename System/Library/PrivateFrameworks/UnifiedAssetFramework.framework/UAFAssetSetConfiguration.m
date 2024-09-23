@implementation UAFAssetSetConfiguration

+ (BOOL)isValid:(id)a3 error:(id *)a4
{
  return +[UAFAssetSetConfiguration isValid:fileURL:error:](UAFAssetSetConfiguration, "isValid:fileURL:error:", a3, 0, a4);
}

- (id)getAssets:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  id obj;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  -[UAFAssetSetConfiguration getFilteredUsages:](self, "getFilteredUsages:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[UAFAssetSetConfiguration assets](self, "assets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v42 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v44 != v42)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (!v7)
          v7 = (void *)objc_opt_new();
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v9, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

        }
        objc_msgSend(v9, "getAutoAssetSpecifier:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[UAFAssetSetConfiguration autoAssetType](self, "autoAssetType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[UAFAssetSetConfiguration autoAssetType](self, "autoAssetType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, CFSTR("AutoAssetType"));

            objc_msgSend(v9, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("AssetSpecifier"));

          }
        }
        -[UAFAssetSetConfiguration trialProject](self, "trialProject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[UAFAssetSetConfiguration trialProject](self, "trialProject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v22, CFSTR("TrialProject"));

        }
        objc_msgSend(v9, "trialNamespace");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v9, "trialNamespace");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, CFSTR("TrialNamespace"));

        }
        objc_msgSend(v9, "trialMAAssetType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v9, "trialMAAssetType");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v30, CFSTR("TrialMAAssetType"));

        }
        objc_msgSend(v9, "getTrialFactorName:", v4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          objc_msgSend(v9, "name");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v33, CFSTR("TrialFactor"));

          objc_msgSend(v9, "getTrialFactorFallbackName:", v4);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKeyedSubscript:", v36, CFSTR("TrialFactorFallback"));

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)trialProject
{
  return self->_trialProject;
}

- (NSString)autoAssetType
{
  return self->_autoAssetType;
}

- (id)getFilteredUsages:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && self->_usageValues)
  {
    v17 = v4;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_usageValues;
    v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[NSDictionary objectForKeyedSubscript:](self->_usageValues, "objectForKeyedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "containsObject:", v13);

            if ((v15 & 1) == 0)
              objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v12);
          }

        }
        v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v5 = v17;
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (NSArray)assets
{
  return self->_assets;
}

+ (id)supportedFileVersions
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("1.0.0");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fromContentsOfURL:(id)a3 applyFeatureFlags:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  UAFAssetSetConfiguration *v16;
  UAFAssetSetConfiguration *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (a5)
    *a5 = 0;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v7, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  v10 = v9;
  if (a5)
    *a5 = objc_retainAutorelease(v9);
  if (v8)
    v11 = v10 == 0;
  else
    v11 = 0;
  if (!v11)
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "+[UAFAssetSetConfiguration fromContentsOfURL:applyFeatureFlags:error:]";
      v22 = 2112;
      v23 = v7;
      v24 = 2112;
      v25 = v10;
      v13 = "%s Failed to load UAFAssetSetConfiguration dictionary from \"%@\": %@";
      v14 = v12;
      v15 = 32;
LABEL_19:
      _os_log_error_impl(&dword_229282000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!+[UAFAssetSetConfiguration isValid:fileURL:error:](UAFAssetSetConfiguration, "isValid:fileURL:error:", v8, v7, a5))
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[UAFAssetSetConfiguration fromContentsOfURL:applyFeatureFlags:error:]";
      v22 = 2112;
      v23 = v7;
      v13 = "%s Failed to validate UAFAssetSetConfiguration dictionary from \"%@\";
      v14 = v12;
      v15 = 22;
      goto LABEL_19;
    }
LABEL_16:
    v17 = 0;
    goto LABEL_17;
  }
  v16 = -[UAFAssetSetConfiguration initWithDictionary:]([UAFAssetSetConfiguration alloc], "initWithDictionary:", v8);
  v17 = v16;
  if (v6)
    -[UAFAssetSetConfiguration applyFeatureFlags](v16, "applyFeatureFlags");
  objc_msgSend(v7, "URLByResolvingSymlinksInPath");
  v12 = objc_claimAutoreleasedReturnValue();
  -[UAFAssetSetConfiguration setOriginatingURL:](v17, "setOriginatingURL:", v12);
LABEL_17:

  return v17;
}

- (UAFAssetSetConfiguration)initWithDictionary:(id)a3
{
  id v4;
  UAFAssetSetConfiguration *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSArray *usageTypes;
  uint64_t v10;
  NSDictionary *usageValues;
  uint64_t v12;
  NSString *trialProject;
  uint64_t v14;
  NSString *autoAssetType;
  uint64_t v16;
  NSString *metadataAsset;
  uint64_t v18;
  NSArray *usageLimits;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  UAFAssetConfiguration *v27;
  void *v28;
  UAFExperimentalAssetsConfiguration *v29;
  void *v30;
  uint64_t v31;
  UAFExperimentalAssetsConfiguration *experimentalAssets;
  UAFAssetSetConfiguration *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)UAFAssetSetConfiguration;
  v5 = -[UAFAssetSetConfiguration init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AssetSetName"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UsageTypes"));
    v8 = objc_claimAutoreleasedReturnValue();
    usageTypes = v5->_usageTypes;
    v5->_usageTypes = (NSArray *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UsageValues"));
    v10 = objc_claimAutoreleasedReturnValue();
    usageValues = v5->_usageValues;
    v5->_usageValues = (NSDictionary *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrialProject"));
    v12 = objc_claimAutoreleasedReturnValue();
    trialProject = v5->_trialProject;
    v5->_trialProject = (NSString *)v12;

    v5->_isTrialAvailable = v5->_trialProject != 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AutoAssetType"));
    v14 = objc_claimAutoreleasedReturnValue();
    autoAssetType = v5->_autoAssetType;
    v5->_autoAssetType = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MetadataAsset"));
    v16 = objc_claimAutoreleasedReturnValue();
    metadataAsset = v5->_metadataAsset;
    v5->_metadataAsset = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UsageLimits"));
    v18 = objc_claimAutoreleasedReturnValue();
    usageLimits = v5->_usageLimits;
    v5->_usageLimits = (NSArray *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EnableCellular"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enableCellular = objc_msgSend(v35, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisableAssetRemoval"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_disableAssetRemoval = objc_msgSend(v20, "BOOLValue");
    v21 = (void *)objc_opt_new();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Assets"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          v27 = -[UAFAssetConfiguration initWithDictionary:]([UAFAssetConfiguration alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v26));
          objc_msgSend(v21, "addObject:", v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v24);
    }

    objc_storeStrong((id *)&v5->_assets, v21);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExperimentalAssets"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = [UAFExperimentalAssetsConfiguration alloc];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExperimentalAssets"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[UAFExperimentalAssetsConfiguration initWithDictionary:](v29, "initWithDictionary:", v30);
      experimentalAssets = v5->_experimentalAssets;
      v5->_experimentalAssets = (UAFExperimentalAssetsConfiguration *)v31;

    }
    v33 = v5;

  }
  return v5;
}

- (void)applyFeatureFlags
{
  NSString *autoAssetType;

  if (self->_isTrialAvailable)
  {
    if (!+[UAFConfiguration trialFeatureEnabled:](UAFConfiguration, "trialFeatureEnabled:", self->_name))
      self->_isTrialAvailable = 0;
    if (!+[UAFConfiguration autoAssetFeatureEnabled:](UAFConfiguration, "autoAssetFeatureEnabled:", self->_name))
    {
      autoAssetType = self->_autoAssetType;
      self->_autoAssetType = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingURL, 0);
  objc_storeStrong((id *)&self->_experimentalAssets, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_usageLimits, 0);
  objc_storeStrong((id *)&self->_metadataAsset, 0);
  objc_storeStrong((id *)&self->_autoAssetType, 0);
  objc_storeStrong((id *)&self->_trialProject, 0);
  objc_storeStrong((id *)&self->_usageValues, 0);
  objc_storeStrong((id *)&self->_usageTypes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)isValid:(id)a3 fileURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  __CFString *v11;
  void *v12;
  char v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  __CFString *v17;
  void *v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void **v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  __CFString *v36;
  __CFString *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  +[UAFAssetSetConfiguration supportedFileVersions](UAFAssetSetConfiguration, "supportedFileVersions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[UAFConfiguration isValid:fileType:fileVersions:error:](UAFConfiguration, "isValid:fileType:fileVersions:error:", v7, CFSTR("AssetSetConfiguration"), v9, a5);

  if (!v10
    || !+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("AssetSetName"), objc_opt_class(), 1, a5))
  {
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  if (v8)
  {
    +[UAFConfigurationManager getAssetNameFromPath:](UAFConfigurationManager, "getAssetNameFromPath:", v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetSetName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", v12);

    if ((v13 & 1) == 0)
    {
      UAFGetLogCategory((id *)&UAFLogContextConfiguration);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetSetName"));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v51 = "+[UAFAssetSetConfiguration isValid:fileURL:error:]";
        v52 = 2112;
        v53 = v17;
        v54 = 2112;
        v55 = v11;
        _os_log_impl(&dword_229282000, v16, OS_LOG_TYPE_DEFAULT, "%s AssetSetName (\"%@\") must match filename (\"%@\")", buf, 0x20u);

      }
      goto LABEL_14;
    }

  }
  v14 = 0;
  if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("UsageTypes"), objc_opt_class(), 0, a5))goto LABEL_15;
  v14 = 0;
  if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("EnableCellular"), objc_opt_class(), 0, a5))goto LABEL_15;
  v14 = 0;
  if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("UsageValues"), objc_opt_class(), 0, a5))goto LABEL_15;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TrialProject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

    goto LABEL_17;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AutoAssetType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if (a5)
    {
      v27 = (void *)MEMORY[0x24BDD1540];
      if (*a5)
      {
        v48[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("One of keys %@ and %@ must have a value"), CFSTR("TrialProject"), CFSTR("AutoAssetType"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = *MEMORY[0x24BDD1398];
        v49[0] = v28;
        v49[1] = *a5;
        v29 = (void *)MEMORY[0x24BDBCE70];
        v30 = (void **)v49;
        v31 = v48;
        v32 = 2;
      }
      else
      {
        v46 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("One of keys %@ and %@ must have a value"), CFSTR("TrialProject"), CFSTR("AutoAssetType"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v28;
        v29 = (void *)MEMORY[0x24BDBCE70];
        v30 = &v47;
        v31 = &v46;
        v32 = 1;
      }
      objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v33);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v51 = "+[UAFAssetSetConfiguration isValid:fileURL:error:]";
      v52 = 2112;
      v53 = CFSTR("TrialProject");
      v54 = 2112;
      v55 = CFSTR("AutoAssetType");
      _os_log_impl(&dword_229282000, v34, OS_LOG_TYPE_DEFAULT, "%s One of keys %@ and %@ must have a value", buf, 0x20u);
    }

    goto LABEL_14;
  }
LABEL_17:
  v14 = 0;
  if (+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("TrialProject"), objc_opt_class(), 0, a5))
  {
    v14 = 0;
    if (+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("AutoAssetType"), objc_opt_class(), 0, a5))
    {
      v14 = 0;
      if (+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("MetadataAsset"), objc_opt_class(), 0, a5))
      {
        v14 = 0;
        if (+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("Assets"), objc_opt_class(), 0, a5))
        {
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Assets"));
          obj = (id)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          if (v40)
          {
            v39 = *(_QWORD *)v42;
            while (2)
            {
              for (i = 0; i != v40; ++i)
              {
                if (*(_QWORD *)v42 != v39)
                  objc_enumerationMutation(obj);
                v21 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  UAFGetLogCategory((id *)&UAFLogContextConfiguration);
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    v36 = (__CFString *)objc_opt_class();
                    *(_DWORD *)buf = 136315394;
                    v51 = "+[UAFAssetSetConfiguration isValid:fileURL:error:]";
                    v52 = 2112;
                    v53 = v36;
                    v37 = v36;
                    _os_log_impl(&dword_229282000, v35, OS_LOG_TYPE_DEFAULT, "%s Asset is not expected kind \"%@\", buf, 0x16u);

                  }
LABEL_47:

                  goto LABEL_14;
                }
                objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UsageTypes"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = +[UAFAssetConfiguration isValid:validUsageTypes:error:](UAFAssetConfiguration, "isValid:validUsageTypes:error:", v21, v22, a5);

                if (!v23)
                  goto LABEL_47;
              }
              v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
              if (v40)
                continue;
              break;
            }
          }

          v14 = 0;
          if (+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("DisableAssetRemoval"), objc_opt_class(), 0, a5))
          {
            v14 = 0;
            if (+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("AutoAssetType"), objc_opt_class(), 0, a5))
            {
              v14 = 0;
              if (+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("ExperimentalAssets"), objc_opt_class(), 0, a5))
              {
                objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ExperimentalAssets"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v24
                  || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ExperimentalAssets")),
                      v25 = (void *)objc_claimAutoreleasedReturnValue(),
                      v26 = +[UAFExperimentalAssetsConfiguration isValid:error:](UAFExperimentalAssetsConfiguration, "isValid:error:", v25, a5), v25, v26))
                {
                  v14 = 1;
                  goto LABEL_15;
                }
                goto LABEL_14;
              }
            }
          }
        }
      }
    }
  }
LABEL_15:

  return v14;
}

+ (id)fromContentsOfURL:(id)a3 error:(id *)a4
{
  return +[UAFAssetSetConfiguration fromContentsOfURL:applyFeatureFlags:error:](UAFAssetSetConfiguration, "fromContentsOfURL:applyFeatureFlags:error:", a3, 0, a4);
}

- (id)getTrialAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UAFAssetSetConfiguration getAssets:](self, "getAssets:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v33 = v4;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v35 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    v7 = 0;
    if (v35)
    {
      v34 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v37 != v34)
            objc_enumerationMutation(v6);
          v9 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TrialProject"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            if (!v7)
              v7 = (void *)objc_opt_new();
            objc_msgSend(v7, "objectForKeyedSubscript:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12)
            {
              v13 = (void *)objc_opt_new();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v9);

            }
            objc_msgSend(v6, "objectForKeyedSubscript:", v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("TrialProject"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", v9);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("TrialProject"));

            objc_msgSend(v6, "objectForKeyedSubscript:", v9);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TrialNamespace"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", v9);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("TrialNamespace"));

            objc_msgSend(v6, "objectForKeyedSubscript:", v9);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("TrialMAAssetType"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectForKeyedSubscript:", v9);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("TrialMAAssetType"));

            objc_msgSend(v6, "objectForKeyedSubscript:", v9);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("TrialFactor"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", v9);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("TrialFactor"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKeyedSubscript:", v9);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("TrialFactor"));

              objc_msgSend(v6, "objectForKeyedSubscript:", v9);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("TrialFactorFallback"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKeyedSubscript:", v9);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("TrialFactorFallback"));

            }
          }
        }
        v35 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v35);
    }
    v31 = v7;
    v4 = v33;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)getAutoAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UAFAssetSetConfiguration getAssets:](self, "getAssets:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v26 = v4;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v27 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v27)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AutoAssetType"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            if (!v9)
              v9 = (void *)objc_opt_new();
            objc_msgSend(v9, "objectForKeyedSubscript:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v14)
            {
              v15 = (void *)objc_opt_new();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v11);

            }
            objc_msgSend(v6, "objectForKeyedSubscript:", v11);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AutoAssetType"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKeyedSubscript:", v11);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("AutoAssetType"));

            objc_msgSend(v6, "objectForKeyedSubscript:", v11);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AssetSpecifier"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", v11);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AssetSpecifier"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "objectForKeyedSubscript:", v11);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("AssetSpecifier"));

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    v24 = v9;
    v4 = v26;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (int)_usageCountForUsageType:(id)a3 usingUsages:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", v5, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = objc_msgSend(v7, "count");
  return v16;
}

- (BOOL)isUsageLimitExceeded:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  NSString *name;
  NSArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_usageLimits;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UsageType"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MaxUsageValues"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");

        if (-[UAFAssetSetConfiguration _usageCountForUsageType:usingUsages:](self, "_usageCountForUsageType:usingUsages:", v10, v4) > v12)
        {
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            name = self->_name;
            *(_DWORD *)buf = 136315906;
            v23 = "-[UAFAssetSetConfiguration isUsageLimitExceeded:]";
            v24 = 2112;
            v25 = name;
            v26 = 2112;
            v27 = v10;
            v28 = 1024;
            v29 = v12;
            _os_log_impl(&dword_229282000, v14, OS_LOG_TYPE_DEFAULT, "%s Usage limit exceeded for asset set %@ of usage type %@ with limit of %d", buf, 0x26u);
          }

          v13 = 1;
          goto LABEL_13;
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  UAFAssetSetConfiguration *v4;
  UAFAssetSetConfiguration *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (UAFAssetSetConfiguration *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v4 == self)
    {
      v8 = 1;
    }
    else
    {
      v5 = v4;
      -[UAFAssetSetConfiguration name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAFAssetSetConfiguration name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[UAFAssetSetConfiguration name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)usageTypes
{
  return self->_usageTypes;
}

- (void)setUsageTypes:(id)a3
{
  objc_storeStrong((id *)&self->_usageTypes, a3);
}

- (NSDictionary)usageValues
{
  return self->_usageValues;
}

- (void)setUsageValues:(id)a3
{
  objc_storeStrong((id *)&self->_usageValues, a3);
}

- (void)setTrialProject:(id)a3
{
  objc_storeStrong((id *)&self->_trialProject, a3);
}

- (void)setAutoAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_autoAssetType, a3);
}

- (NSString)metadataAsset
{
  return self->_metadataAsset;
}

- (void)setMetadataAsset:(id)a3
{
  objc_storeStrong((id *)&self->_metadataAsset, a3);
}

- (NSArray)usageLimits
{
  return self->_usageLimits;
}

- (void)setUsageLimits:(id)a3
{
  objc_storeStrong((id *)&self->_usageLimits, a3);
}

- (BOOL)disableAssetRemoval
{
  return self->_disableAssetRemoval;
}

- (void)setDisableAssetRemoval:(BOOL)a3
{
  self->_disableAssetRemoval = a3;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (UAFExperimentalAssetsConfiguration)experimentalAssets
{
  return self->_experimentalAssets;
}

- (void)setExperimentalAssets:(id)a3
{
  objc_storeStrong((id *)&self->_experimentalAssets, a3);
}

- (BOOL)isTrialAvailable
{
  return self->_isTrialAvailable;
}

- (void)setIsTrialAvailable:(BOOL)a3
{
  self->_isTrialAvailable = a3;
}

- (NSURL)originatingURL
{
  return self->_originatingURL;
}

- (void)setOriginatingURL:(id)a3
{
  objc_storeStrong((id *)&self->_originatingURL, a3);
}

- (BOOL)enableCellular
{
  return self->_enableCellular;
}

- (void)setEnableCellular:(BOOL)a3
{
  self->_enableCellular = a3;
}

@end
