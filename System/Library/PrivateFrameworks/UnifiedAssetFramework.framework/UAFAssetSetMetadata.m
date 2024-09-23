@implementation UAFAssetSetMetadata

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
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void **v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[2];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[3];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[UAFAssetSetMetadata supportedFileVersions](UAFAssetSetMetadata, "supportedFileVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[UAFConfiguration isValid:fileType:fileVersions:error:](UAFConfiguration, "isValid:fileType:fileVersions:error:", v5, CFSTR("AssetSetMetadata"), v6, a4);

  if (!v7)
    goto LABEL_25;
  v8 = 0;
  if (+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, CFSTR("MinOSVersion"), objc_opt_class(), 0, a4))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MinOSVersion"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MinOSVersion"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[UAFPlatform versionComponentsFromString:](UAFPlatform, "versionComponentsFromString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        if (a4)
        {
          v17 = (void *)MEMORY[0x24BDD1540];
          if (*a4)
          {
            v52[0] = *MEMORY[0x24BDD0FC8];
            v18 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MinOSVersion"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("MinOSVersion \"%@\" is not a valid version"), v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v52[1] = *MEMORY[0x24BDD1398];
            v21 = *a4;
            v53[0] = v20;
            v53[1] = v21;
            v22 = (void *)MEMORY[0x24BDBCE70];
            v23 = (void **)v53;
            v24 = v52;
            v25 = 2;
          }
          else
          {
            v50 = *MEMORY[0x24BDD0FC8];
            v34 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MinOSVersion"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "stringWithFormat:", CFSTR("MinOSVersion \"%@\" is not a valid version"), v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v20;
            v22 = (void *)MEMORY[0x24BDBCE70];
            v23 = &v51;
            v24 = &v50;
            v25 = 1;
          }
          objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v35);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v36 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MinOSVersion"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v47 = "+[UAFAssetSetMetadata isValid:error:]";
        v48 = 2112;
        v49 = v37;
        v38 = "%s MinOSVersion \"%@\" is not a valid version";
LABEL_23:
        _os_log_impl(&dword_229282000, v36, OS_LOG_TYPE_DEFAULT, v38, buf, 0x16u);

LABEL_24:
LABEL_25:
        v8 = 0;
        goto LABEL_26;
      }
    }
    v8 = 0;
    if (+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v5, CFSTR("MaxOSVersion"), objc_opt_class(), 0, a4))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxOSVersion"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_8;
      v14 = (void *)v13;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxOSVersion"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UAFPlatform versionComponentsFromString:](UAFPlatform, "versionComponentsFromString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
LABEL_8:
        v8 = 1;
        goto LABEL_26;
      }
      if (a4)
      {
        v26 = (void *)MEMORY[0x24BDD1540];
        if (*a4)
        {
          v44[0] = *MEMORY[0x24BDD0FC8];
          v27 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxOSVersion"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("MaxOSVersion \"%@\" is not a valid version"), v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v44[1] = *MEMORY[0x24BDD1398];
          v45[0] = v29;
          v45[1] = *a4;
          v30 = (void *)MEMORY[0x24BDBCE70];
          v31 = (void **)v45;
          v32 = v44;
          v33 = 2;
        }
        else
        {
          v42 = *MEMORY[0x24BDD0FC8];
          v39 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxOSVersion"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("MaxOSVersion \"%@\" is not a valid version"), v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v29;
          v30 = (void *)MEMORY[0x24BDBCE70];
          v31 = &v43;
          v32 = &v42;
          v33 = 1;
        }
        objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, v33);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v40);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      UAFGetLogCategory((id *)&UAFLogContextConfiguration);
      v36 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxOSVersion"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v47 = "+[UAFAssetSetMetadata isValid:error:]";
      v48 = 2112;
      v49 = v37;
      v38 = "%s MaxOSVersion \"%@\" is not a valid version";
      goto LABEL_23;
    }
  }
LABEL_26:

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
  UAFAssetSetMetadata *v14;
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
      v18 = "+[UAFAssetSetMetadata fromContentsOfURL:error:]";
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v8;
      v11 = "%s Failed to load UAFAssetSetMetadata dictionary from \"%@\": %@";
      v12 = v10;
      v13 = 32;
LABEL_17:
      _os_log_error_impl(&dword_229282000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!+[UAFAssetSetMetadata isValid:error:](UAFAssetSetMetadata, "isValid:error:", v6, a4))
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[UAFAssetSetMetadata fromContentsOfURL:error:]";
      v19 = 2112;
      v20 = v5;
      v11 = "%s Failed to validate UAFAssetSetMetadata dictionary from \"%@\";
      v12 = v10;
      v13 = 22;
      goto LABEL_17;
    }
LABEL_14:

    v14 = 0;
    goto LABEL_15;
  }
  v14 = -[UAFAssetSetMetadata initWithDictionary:]([UAFAssetSetMetadata alloc], "initWithDictionary:", v6);
LABEL_15:

  return v14;
}

+ (id)fromAssetDir:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("metadata.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAssetSetMetadata fromContentsOfURL:error:](UAFAssetSetMetadata, "fromContentsOfURL:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)OSVersion
{
  if (qword_2540B1C48 != -1)
    dispatch_once(&qword_2540B1C48, &__block_literal_global_3);
  return (id)_MergedGlobals_1;
}

void __32__UAFAssetSetMetadata_OSVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;

}

- (UAFAssetSetMetadata)initWithDictionary:(id)a3
{
  id v4;
  UAFAssetSetMetadata *v5;
  uint64_t v6;
  NSString *minOSVersion;
  uint64_t v8;
  NSString *maxOSVersion;
  UAFAssetSetMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UAFAssetSetMetadata;
  v5 = -[UAFAssetSetMetadata init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinOSVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    minOSVersion = v5->_minOSVersion;
    v5->_minOSVersion = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MaxOSVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    maxOSVersion = v5->_maxOSVersion;
    v5->_maxOSVersion = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (BOOL)OSSupported
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_minOSVersion && !self->_maxOSVersion)
    return 1;
  +[UAFAssetSetMetadata OSVersion](UAFAssetSetMetadata, "OSVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFPlatform versionComponentsFromString:](UAFPlatform, "versionComponentsFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      +[UAFAssetSetMetadata OSVersion](UAFAssetSetMetadata, "OSVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[UAFAssetSetMetadata OSSupported]";
      v14 = 2112;
      v15 = v11;
      _os_log_error_impl(&dword_229282000, v9, OS_LOG_TYPE_ERROR, "%s Current OS Version \"%@\" is not a valid version", (uint8_t *)&v12, 0x16u);

    }
    return 1;
  }
  if (self->_minOSVersion)
  {
    +[UAFAssetSetMetadata OSVersion](UAFAssetSetMetadata, "OSVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[UAFPlatform compareVersion:with:](UAFPlatform, "compareVersion:with:", v5, self->_minOSVersion);

    if (v6 == -1)
      return 0;
  }
  if (!self->_maxOSVersion)
    return 1;
  +[UAFAssetSetMetadata OSVersion](UAFAssetSetMetadata, "OSVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[UAFPlatform compareVersion:with:](UAFPlatform, "compareVersion:with:", v7, self->_maxOSVersion) != 1;

  return v8;
}

- (NSString)minOSVersion
{
  return self->_minOSVersion;
}

- (void)setMinOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_minOSVersion, a3);
}

- (NSString)maxOSVersion
{
  return self->_maxOSVersion;
}

- (void)setMaxOSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_maxOSVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxOSVersion, 0);
  objc_storeStrong((id *)&self->_minOSVersion, 0);
}

@end
