@implementation UAFAssetSetExperimentConfiguration

+ (id)supportedFileVersions
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("1.0.0");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isValid:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  BOOL v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  +[UAFAssetSetExperimentConfiguration supportedFileVersions](UAFAssetSetExperimentConfiguration, "supportedFileVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[UAFConfiguration isValid:fileType:fileVersions:error:](UAFConfiguration, "isValid:fileType:fileVersions:error:", v5, CFSTR("AssetSetExperiment"), v6, a4);

  if (v7
    && +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, CFSTR("AutoAssetSpecifiers"), objc_opt_class(), 1, a4))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 1;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AutoAssetSpecifiers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __52__UAFAssetSetExperimentConfiguration_isValid_error___block_invoke;
    v11[3] = &unk_24F1F7CC0;
    v11[4] = &v12;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

    v9 = *((_BYTE *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __52__UAFAssetSetExperimentConfiguration_isValid_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;
  id v9;

  v9 = a3;
  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

+ (id)fromContentsOfURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  UAFAssetSetExperimentConfiguration *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a4)
    *a4 = 0;
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v5, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (a4)
    *a4 = objc_retainAutorelease(v7);
  if (v6)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (!v9)
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "+[UAFAssetSetExperimentConfiguration fromContentsOfURL:error:]";
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v8;
      v11 = "%s Failed to load UAFAssetSetExperimentConfiguration dictionary from \"%@\": %@";
      v12 = v10;
      v13 = 32;
LABEL_17:
      _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!+[UAFAssetSetExperimentConfiguration isValid:error:](UAFAssetSetExperimentConfiguration, "isValid:error:", v6, a4))
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[UAFAssetSetExperimentConfiguration fromContentsOfURL:error:]";
      v19 = 2112;
      v20 = v5;
      v11 = "%s Failed to validate UAFAssetSetExperimentConfiguration dictionary from \"%@\";
      v12 = v10;
      v13 = 22;
      goto LABEL_17;
    }
LABEL_14:

    v14 = 0;
    goto LABEL_15;
  }
  v14 = -[UAFAssetSetExperimentConfiguration initWithDictionary:]([UAFAssetSetExperimentConfiguration alloc], "initWithDictionary:", v6);
LABEL_15:

  return v14;
}

- (UAFAssetSetExperimentConfiguration)initWithDictionary:(id)a3
{
  id v4;
  UAFAssetSetExperimentConfiguration *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSDictionary *assetSpecifiers;
  UAFAssetSetExperimentConfiguration *v11;
  _QWORD v13[4];
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UAFAssetSetExperimentConfiguration;
  v5 = -[UAFAssetSetExperimentConfiguration init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AutoAssetSpecifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __57__UAFAssetSetExperimentConfiguration_initWithDictionary___block_invoke;
    v13[3] = &unk_24F1F7CE8;
    v14 = v6;
    v8 = v6;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);

    v9 = objc_msgSend(v8, "copy");
    assetSpecifiers = v5->_assetSpecifiers;
    v5->_assetSpecifiers = (NSDictionary *)v9;

    v11 = v5;
  }

  return v5;
}

void __57__UAFAssetSetExperimentConfiguration_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = *(void **)(a1 + 32);
      v8 = v5;
      objc_msgSend(v7, "setObject:forKey:", v8, v6);

    }
  }
  else
  {
    v6 = 0;
  }

}

- (NSDictionary)assetSpecifiers
{
  return self->_assetSpecifiers;
}

- (void)setAssetSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_assetSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSpecifiers, 0);
}

@end
