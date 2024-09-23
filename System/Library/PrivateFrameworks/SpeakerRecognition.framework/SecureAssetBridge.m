@implementation SecureAssetBridge

- (SecureAssetBridge)init
{

  return 0;
}

- (SecureAssetBridge)initWithAssetType:(unint64_t)a3 configurationPath:(id)a4 configVersion:(id)a5 category:(id)a6 categoryResourceURLPath:(id)a7 categoryConfigFileName:(id)a8 defaultCategoryConfigFileName:(id)a9
{
  id v16;
  id v17;
  SecureAssetBridge *v18;
  SecureAssetBridge *v19;
  uint64_t v20;
  NSURL *resourcePath;
  uint64_t v22;
  NSDictionary *cachedInfo;
  void *v24;
  void *v25;
  SecureAssetBridge *v26;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a4;
  v30 = a5;
  v16 = a6;
  v17 = a7;
  v29 = a8;
  v28 = a9;
  v32.receiver = self;
  v32.super_class = (Class)SecureAssetBridge;
  v18 = -[SecureAssetBridge init](&v32, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_3;
  v18->_assettype = a3;
  objc_msgSend(v31, "URLByDeletingLastPathComponent");
  v20 = objc_claimAutoreleasedReturnValue();
  resourcePath = v19->_resourcePath;
  v19->_resourcePath = (NSURL *)v20;

  objc_storeStrong((id *)&v19->_assetConfigurationPath, a4);
  objc_storeStrong((id *)&v19->_configVersion, a5);
  -[SecureAssetBridge decodedInfo](v19, "decodedInfo");
  v22 = objc_claimAutoreleasedReturnValue();
  cachedInfo = v19->_cachedInfo;
  v19->_cachedInfo = (NSDictionary *)v22;

  objc_storeStrong((id *)&v19->_categoryResourcePathURL, a7);
  objc_storeStrong((id *)&v19->_category, a6);
  objc_storeStrong((id *)&v19->_categoryConfigFileName, a8);
  objc_storeStrong((id *)&v19->_defaultCategoryConfigFileName, a9);
  -[SecureAssetBridge _initializeMemoryIndexForCategory:resourcePath:](v19, "_initializeMemoryIndexForCategory:resourcePath:", v16, v17);
  if (!v19->_memoryIndex)
  {
    v24 = v17;
    v25 = v31;
    v26 = 0;
  }
  else
  {
LABEL_3:
    v24 = v17;
    v25 = v31;
    v26 = v19;
  }

  return v26;
}

- (id)decodedInfo
{
  NSDictionary *cachedInfo;
  NSDictionary **p_cachedInfo;
  void *v5;
  NSURL *assetConfigurationPath;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  p_cachedInfo = &self->_cachedInfo;
  cachedInfo = self->_cachedInfo;
  if (!cachedInfo)
  {
    v5 = (void *)CSLogContextFacilityCoreSpeechExclave;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeechExclave, OS_LOG_TYPE_DEFAULT))
    {
      assetConfigurationPath = self->_assetConfigurationPath;
      v7 = v5;
      -[NSURL absoluteString](assetConfigurationPath, "absoluteString");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = 136315394;
      v13 = "-[SecureAssetBridge decodedInfo]";
      v14 = 2080;
      v15 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Asset Path %s", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", self->_assetConfigurationPath);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v9, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)p_cachedInfo, v10);
      }

    }
    cachedInfo = *p_cachedInfo;
  }
  return cachedInfo;
}

- (BOOL)containsKey:(id)a3 category:(id)a4
{
  id v6;
  NSDictionary *cachedInfo;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  cachedInfo = self->_cachedInfo;
  if (cachedInfo)
  {
    -[NSDictionary objectForKeyedSubscript:](cachedInfo, "objectForKeyedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "objectForKey:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 != 0;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)containsCategory:(id)a3
{
  NSDictionary *cachedInfo;
  void *v4;
  char isKindOfClass;

  cachedInfo = self->_cachedInfo;
  if (cachedInfo)
  {
    -[NSDictionary objectForKeyedSubscript:](cachedInfo, "objectForKeyedSubscript:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (float)getFloat:(id)a3 category:(id)a4 defaultValue:(float)a5
{
  id v8;
  id v9;
  NSDictionary *cachedInfo;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  float v15;

  v8 = a3;
  v9 = a4;
  cachedInfo = self->_cachedInfo;
  if (cachedInfo)
  {
    -[NSDictionary objectForKeyedSubscript:](cachedInfo, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_cachedInfo, "objectForKeyedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "floatValue");
          a5 = v15;
        }
      }

    }
  }

  return a5;
}

- (unint64_t)getUnsignedLongLongValue:(id)a3 category:(id)a4 defaultValue:(unint64_t)a5
{
  id v8;
  id v9;
  NSDictionary *cachedInfo;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  cachedInfo = self->_cachedInfo;
  if (cachedInfo)
  {
    -[NSDictionary objectForKeyedSubscript:](cachedInfo, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_cachedInfo, "objectForKeyedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          a5 = objc_msgSend(v14, "unsignedLongLongValue");
      }

    }
  }

  return a5;
}

- (id)getString:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  NSDictionary *cachedInfo;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  cachedInfo = self->_cachedInfo;
  if (!cachedInfo)
    goto LABEL_6;
  -[NSDictionary objectForKeyedSubscript:](cachedInfo, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  -[NSDictionary objectForKeyedSubscript:](self->_cachedInfo, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_6:
    v12 = 0;
  }

  return v12;
}

- (id)getString:(id)a3 category:(id)a4 defaultValue:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a5;
  -[SecureAssetBridge getString:category:](self, "getString:category:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = v8;
  v11 = v9;

  return v11;
}

- (BOOL)getBool:(id)a3 category:(id)a4 defaultValue:(BOOL)a5
{
  id v8;
  id v9;
  NSDictionary *cachedInfo;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  cachedInfo = self->_cachedInfo;
  if (cachedInfo)
  {
    -[NSDictionary objectForKeyedSubscript:](cachedInfo, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_cachedInfo, "objectForKeyedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          a5 = objc_msgSend(v14, "BOOLValue");
      }

    }
  }

  return a5;
}

- (id)getStringArray:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  NSDictionary *cachedInfo;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  cachedInfo = self->_cachedInfo;
  if (!cachedInfo)
    goto LABEL_6;
  -[NSDictionary objectForKeyedSubscript:](cachedInfo, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  -[NSDictionary objectForKeyedSubscript:](self->_cachedInfo, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_6:
    v12 = 0;
  }

  return v12;
}

- (id)getDictionaryArray:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  NSDictionary *cachedInfo;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  cachedInfo = self->_cachedInfo;
  if (!cachedInfo)
    goto LABEL_6;
  -[NSDictionary objectForKeyedSubscript:](cachedInfo, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  -[NSDictionary objectForKeyedSubscript:](self->_cachedInfo, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_6:
    v12 = 0;
  }

  return v12;
}

- (id)getDictionary:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  NSDictionary *cachedInfo;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  cachedInfo = self->_cachedInfo;
  if (!cachedInfo)
    goto LABEL_6;
  -[NSDictionary objectForKeyedSubscript:](cachedInfo, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  -[NSDictionary objectForKeyedSubscript:](self->_cachedInfo, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_6:
    v12 = 0;
  }

  return v12;
}

- (id)hashFromResourcePath
{
  return CFSTR("nohash");
}

- (void)_initializeMemoryIndexForCategory:(id)a3 resourcePath:(id)a4
{
  id v6;
  void *v7;
  SecureMemoryIndex *v8;
  SecureMemoryIndex *memoryIndex;
  NSData *v10;
  NSData *cachedConfigInfo;
  void *v12;
  void *v13;
  SecureMemoryIndex *v14;
  SecureMemoryIndex *satMemoryIndex;
  NSData *v16;
  NSData *cachedConfigSatInfo;
  id v18;

  v18 = a3;
  v6 = a4;
  -[SecureAssetBridge getStringArray:category:](self, "getStringArray:category:", CFSTR("mindex"), v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[SecureMemoryIndex initWithResourcePath:memoryIndexes:]([SecureMemoryIndex alloc], "initWithResourcePath:memoryIndexes:", v6, v7);
    memoryIndex = self->_memoryIndex;
    self->_memoryIndex = v8;

    -[SecureAssetBridge _configData:defaultName:](self, "_configData:defaultName:", self->_categoryConfigFileName, self->_defaultCategoryConfigFileName);
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    cachedConfigInfo = self->_cachedConfigInfo;
    self->_cachedConfigInfo = v10;

  }
  -[SecureAssetBridge getStringArray:category:](self, "getStringArray:category:", CFSTR("mindex_sat"), v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "count"))
  {
    v14 = -[SecureMemoryIndex initWithResourcePath:memoryIndexes:]([SecureMemoryIndex alloc], "initWithResourcePath:memoryIndexes:", v6, v13);
    satMemoryIndex = self->_satMemoryIndex;
    self->_satMemoryIndex = v14;

  }
  if (self->_assettype == 5)
  {
    -[SecureAssetBridge _configData:defaultName:](self, "_configData:defaultName:", CFSTR("config_sat.txt"), 0);
    v16 = (NSData *)objc_claimAutoreleasedReturnValue();
    cachedConfigSatInfo = self->_cachedConfigSatInfo;
    self->_cachedConfigSatInfo = v16;

  }
}

- (id)_configData:(id)a3 defaultName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x212BE17E4]();
  -[NSURL URLByAppendingPathComponent:](self->_resourcePath, "URLByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v7 && !v10)
  {
    -[NSURL URLByAppendingPathComponent:](self->_resourcePath, "URLByAppendingPathComponent:", v7);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)v12;
  }
  if (v11)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v11, 4);
    objc_msgSend(CFSTR("CONFIGSTR: "), "stringByAppendingString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDBCE50];
    v16 = objc_retainAutorelease(v14);
    objc_msgSend(v15, "dataWithBytes:length:", objc_msgSend(v16, "UTF8String"), objc_msgSend(v16, "length"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  objc_autoreleasePoolPop(v8);
  return v17;
}

- (id)configData
{
  NSData *cachedConfigInfo;
  NSData *v3;

  cachedConfigInfo = self->_cachedConfigInfo;
  if (cachedConfigInfo)
    v3 = cachedConfigInfo;
  return cachedConfigInfo;
}

- (id)configDataSat
{
  NSData *cachedConfigSatInfo;
  NSData *v3;

  cachedConfigSatInfo = self->_cachedConfigSatInfo;
  if (cachedConfigSatInfo)
    v3 = cachedConfigSatInfo;
  return cachedConfigSatInfo;
}

- (unint64_t)assettype
{
  return self->_assettype;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (NSURL)assetConfigurationPath
{
  return self->_assetConfigurationPath;
}

- (NSURL)resourcePath
{
  return self->_resourcePath;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)categoryConfigFileName
{
  return self->_categoryConfigFileName;
}

- (NSString)defaultCategoryConfigFileName
{
  return self->_defaultCategoryConfigFileName;
}

- (NSURL)categoryResourcePathURL
{
  return self->_categoryResourcePathURL;
}

- (NSDictionary)cachedInfo
{
  return self->_cachedInfo;
}

- (SecureMemoryIndex)memoryIndex
{
  return self->_memoryIndex;
}

- (SecureMemoryIndex)satMemoryIndex
{
  return self->_satMemoryIndex;
}

- (NSData)cachedConfigInfo
{
  return self->_cachedConfigInfo;
}

- (void)setCachedConfigInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConfigInfo, a3);
}

- (NSData)cachedConfigSatInfo
{
  return self->_cachedConfigSatInfo;
}

- (void)setCachedConfigSatInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cachedConfigSatInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConfigSatInfo, 0);
  objc_storeStrong((id *)&self->_cachedConfigInfo, 0);
  objc_storeStrong((id *)&self->_satMemoryIndex, 0);
  objc_storeStrong((id *)&self->_memoryIndex, 0);
  objc_storeStrong((id *)&self->_cachedInfo, 0);
  objc_storeStrong((id *)&self->_categoryResourcePathURL, 0);
  objc_storeStrong((id *)&self->_defaultCategoryConfigFileName, 0);
  objc_storeStrong((id *)&self->_categoryConfigFileName, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_assetConfigurationPath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
}

@end
