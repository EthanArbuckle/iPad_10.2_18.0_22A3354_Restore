@implementation UAFMinVersionConfiguration

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
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void **v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  const char *v35;
  void *v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  id v50;
  uint64_t v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[UAFMinVersionConfiguration supportedFileVersions](UAFMinVersionConfiguration, "supportedFileVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[UAFConfiguration isValid:fileType:fileVersions:error:](UAFConfiguration, "isValid:fileType:fileVersions:error:", v5, CFSTR("MinVersion"), v6, a4);

  if (v7
    && +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, CFSTR("AssetSetName"), objc_opt_class(), 1, a4))
  {
    v8 = 0;
    if (+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, CFSTR("Assets"), objc_opt_class(), 0, a4))
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Assets"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v40 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                v17 = (void *)MEMORY[0x24BDD1540];
                if (*a4)
                {
                  v53[0] = *MEMORY[0x24BDD0FC8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Asset is not expected kind \"%@\"), objc_opt_class());
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v53[1] = *MEMORY[0x24BDD1398];
                  v54[0] = v18;
                  v54[1] = *a4;
                  v19 = (void *)MEMORY[0x24BDBCE70];
                  v20 = (void **)v54;
                  v21 = v53;
                  v22 = 2;
                }
                else
                {
                  v51 = *MEMORY[0x24BDD0FC8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Asset is not expected kind \"%@\"), objc_opt_class());
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = v18;
                  v19 = (void *)MEMORY[0x24BDBCE70];
                  v20 = &v52;
                  v21 = &v51;
                  v22 = 1;
                }
                objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, v22);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v31);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

              }
              UAFGetLogCategory((id *)&UAFLogContextConfiguration);
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = (void *)objc_opt_class();
                *(_DWORD *)buf = 136315394;
                v48 = "+[UAFMinVersionConfiguration isValid:error:]";
                v49 = 2112;
                v50 = v33;
                v34 = v33;
                v35 = "%s Asset is not expected kind \"%@\";
                goto LABEL_33;
              }
LABEL_34:

LABEL_35:
              v8 = 0;
              goto LABEL_36;
            }
            if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v13, CFSTR("AssetName"), objc_opt_class(), 1, a4)|| !+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v13, CFSTR("MinVersion"), objc_opt_class(), 1, a4))
            {
              goto LABEL_35;
            }
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinVersion"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[UAFPlatform versionComponentsFromString:](UAFPlatform, "versionComponentsFromString:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
            {
              if (a4)
              {
                v23 = (void *)MEMORY[0x24BDD1540];
                if (*a4)
                {
                  v45[0] = *MEMORY[0x24BDD0FC8];
                  v24 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinVersion"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "stringWithFormat:", CFSTR("MinVersion \"%@\" is not a valid version"), v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v45[1] = *MEMORY[0x24BDD1398];
                  v46[0] = v26;
                  v46[1] = *a4;
                  v27 = (void *)MEMORY[0x24BDBCE70];
                  v28 = (void **)v46;
                  v29 = v45;
                  v30 = 2;
                }
                else
                {
                  v43 = *MEMORY[0x24BDD0FC8];
                  v36 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinVersion"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "stringWithFormat:", CFSTR("MinVersion \"%@\" is not a valid version"), v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = v26;
                  v27 = (void *)MEMORY[0x24BDBCE70];
                  v28 = &v44;
                  v29 = &v43;
                  v30 = 1;
                }
                objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, v30);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v37);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

              }
              UAFGetLogCategory((id *)&UAFLogContextConfiguration);
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinVersion"));
                v34 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                v48 = "+[UAFMinVersionConfiguration isValid:error:]";
                v49 = 2112;
                v50 = v34;
                v35 = "%s MinVersion \"%@\" is not a valid version";
LABEL_33:
                _os_log_impl(&dword_229282000, v32, OS_LOG_TYPE_DEFAULT, v35, buf, 0x16u);

              }
              goto LABEL_34;
            }
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
          v8 = 1;
          if (v10)
            continue;
          break;
        }
      }
      else
      {
        v8 = 1;
      }
LABEL_36:

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
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
  UAFMinVersionConfiguration *v14;
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
      v18 = "+[UAFMinVersionConfiguration fromContentsOfURL:error:]";
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v8;
      v11 = "%s Failed to load UAFMinVersionConfiguration dictionary from \"%@\": %@";
      v12 = v10;
      v13 = 32;
LABEL_17:
      _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!+[UAFMinVersionConfiguration isValid:error:](UAFMinVersionConfiguration, "isValid:error:", v6, a4))
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[UAFMinVersionConfiguration fromContentsOfURL:error:]";
      v19 = 2112;
      v20 = v5;
      v11 = "%s Failed to validate UAFMinVersionConfiguration dictionary from \"%@\";
      v12 = v10;
      v13 = 22;
      goto LABEL_17;
    }
LABEL_14:

    v14 = 0;
    goto LABEL_15;
  }
  v14 = -[UAFMinVersionConfiguration initWithDictionary:]([UAFMinVersionConfiguration alloc], "initWithDictionary:", v6);
LABEL_15:

  return v14;
}

- (UAFMinVersionConfiguration)initWithDictionary:(id)a3
{
  id v4;
  UAFMinVersionConfiguration *v5;
  uint64_t v6;
  NSString *assetSetName;
  NSDictionary *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSDictionary *minVersions;
  UAFMinVersionConfiguration *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UAFMinVersionConfiguration;
  v5 = -[UAFMinVersionConfiguration init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AssetSetName"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetSetName = v5->_assetSetName;
    v5->_assetSetName = (NSString *)v6;

    v8 = (NSDictionary *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Assets"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MinVersion"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AssetName"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
    }

    minVersions = v5->_minVersions;
    v5->_minVersions = v8;

    v18 = v5;
    v4 = v20;
  }

  return v5;
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (void)setAssetSetName:(id)a3
{
  objc_storeStrong((id *)&self->_assetSetName, a3);
}

- (NSDictionary)minVersions
{
  return self->_minVersions;
}

- (void)setMinVersions:(id)a3
{
  objc_storeStrong((id *)&self->_minVersions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minVersions, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
}

@end
