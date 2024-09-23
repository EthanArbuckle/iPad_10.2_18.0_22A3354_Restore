@implementation SESConfig

- (SESConfig)initWithDeviceClass:(id)a3 productVersion:(float)a4
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  SESConfig *v10;

  v6 = (void *)MEMORY[0x24BDBCF48];
  v7 = a3;
  objc_msgSend(v6, "fileURLWithPath:", CFSTR("/private/var/mobile/Library/SecureElementService/Asset/"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = a4;
  v10 = -[SESConfig initWithDeviceClass:productVersion:path:](self, "initWithDeviceClass:productVersion:path:", v7, v8, v9);

  return v10;
}

- (SESConfig)initWithDeviceClass:(id)a3 productVersion:(float)a4 path:(id)a5
{
  id v8;
  id v9;
  SESConfig *v10;
  SESConfig *v11;
  NSString *minOSKey;
  const __CFString *v13;
  NSString *cachedFileName;
  NSDictionary *cache;
  SESConfig *v16;
  NSObject *v18;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SESConfig;
  v10 = -[SESConfig init](&v19, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_7;
  objc_storeStrong((id *)&v10->_path, a5);
  if (objc_msgSend(CFSTR("iPhone"), "isEqualToString:", v8))
  {
    minOSKey = v11->_minOSKey;
    v13 = CFSTR("MinOSPhone");
LABEL_6:
    v11->_minOSKey = &v13->isa;

    v11->_productVersion = a4;
    v11->_cachedComponent = 0;
    cachedFileName = v11->_cachedFileName;
    v11->_cachedFileName = 0;

    cache = v11->_cache;
    v11->_cache = 0;

LABEL_7:
    v16 = v11;
    goto LABEL_8;
  }
  if (objc_msgSend(CFSTR("Watch"), "isEqualToString:", v8))
  {
    minOSKey = v11->_minOSKey;
    v13 = CFSTR("MinOSWatch");
    goto LABEL_6;
  }
  SESDefaultLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_24B9C8000, v18, OS_LOG_TYPE_ERROR, "Unknown device class %@", buf, 0xCu);
  }

  v16 = 0;
LABEL_8:

  return v16;
}

- (id)getConfigForManufacturer:(id)a3 component:(unint64_t)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  NSString *minOSKey;
  __CFString *v23;
  id v25;

  v25 = 0;
  -[SESConfig getContentsOfAssetFile:component:error:](self, "getContentsOfAssetFile:component:error:", a3, a4, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", self->_minOSKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[SESConfigUtilities getVersion:error:](SESConfigUtilities, "getVersion:error:", v11, 0);
        v13 = v12;
        if (v12 <= self->_productVersion)
        {
          v10 = v7;
          goto LABEL_17;
        }
        if (a5)
        {
          SESDefaultLogObject();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          SESCreateAndLogError(0, v14, SESErrorDomain, 6, CFSTR("MinOS not satisfied config %f > %f current"), v15, v16, v17, COERCE__INT64(v13));
LABEL_15:
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_16:
        v10 = 0;
LABEL_17:

        goto LABEL_18;
      }
      if (!a5)
        goto LABEL_16;
      SESDefaultLogObject();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = SESErrorDomain;
      minOSKey = self->_minOSKey;
      v23 = CFSTR("Wrong class for key %@");
    }
    else
    {
      if (!a5)
        goto LABEL_16;
      SESDefaultLogObject();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = SESErrorDomain;
      minOSKey = self->_minOSKey;
      v23 = CFSTR("Missing key %@");
    }
    SESCreateAndLogError(0, v14, v21, 0, v23, v18, v19, v20, (uint64_t)minOSKey);
    goto LABEL_15;
  }
  v10 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v8);
LABEL_18:

  return v10;
}

- (id)getContentsOfAssetFile:(id)a3 component:(unint64_t)a4 error:(id *)a5
{
  id v9;
  void *v10;
  NSDictionary *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  id v22;

  v9 = a3;
  v10 = v9;
  if (self->_cachedComponent == a4 && objc_msgSend(v9, "isEqualToString:", self->_cachedFileName))
  {
    v11 = self->_cache;
    goto LABEL_21;
  }
  if (a4 == 1)
  {
    v22 = 0;
    -[SESConfig readContentsOfPlist:component:isProfile:error:](self, "readContentsOfPlist:component:isProfile:error:", v10, CFSTR("DCK"), 1, &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    if (v13)
    {
      v14 = v13;
      if (objc_msgSend(v13, "code") != 4)
      {
        if (a5)
        {
          v14 = objc_retainAutorelease(v14);
          v11 = 0;
          *a5 = v14;
        }
        else
        {
          v11 = 0;
        }
        goto LABEL_20;
      }

      v21 = 0;
      -[SESConfig readContentsOfPlist:component:isProfile:error:](self, "readContentsOfPlist:component:isProfile:error:", v10, CFSTR("DCK"), 0, &v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v21;

      v12 = v15;
      if (v14)
      {
        if (!a5)
        {
LABEL_10:
          v11 = v15;
          v12 = v11;
LABEL_20:

          goto LABEL_21;
        }
LABEL_9:
        *a5 = objc_retainAutorelease(v14);
        goto LABEL_10;
      }
    }
    else
    {
      v15 = v12;
    }
    objc_storeStrong((id *)&self->_cachedFileName, a3);
    self->_cachedComponent = 1;
    objc_storeStrong((id *)&self->_cache, v12);
    v14 = 0;
    if (!a5)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (a5)
  {
    SESDefaultLogObject();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v16, SESErrorDomain, 1, CFSTR("Invalid component"), v17, v18, v19, (uint64_t)v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = 0;
LABEL_21:

  return v11;
}

- (id)readContentsOfPlist:(id)a3 component:(id)a4 isProfile:(BOOL)a5 error:(id *)a6
{
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = &stru_251CC71A0;
  if (a5)
    v8 = CFSTR("profile_");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@%@.plist"), a4, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](self->_path, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isReadableFileAtPath:", v12);

  if ((v13 & 1) != 0)
  {
    v31 = 0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v10, &v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v31;
    if (v15)
    {
      if (a6)
      {
        SESDefaultLogObject();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = SESErrorDomain;
        objc_msgSend(v10, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError(v15, v16, v17, 0, CFSTR("Failed to load contents from %@"), v19, v20, v21, (uint64_t)v18);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        a6 = 0;
      }
    }
    else
    {
      SESDefaultLogObject();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "path");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v33 = v29;
        _os_log_impl(&dword_24B9C8000, v28, OS_LOG_TYPE_INFO, "Contents retrieved from %@", buf, 0xCu);

      }
      a6 = v14;
    }

  }
  else if (a6)
  {
    SESDefaultLogObject();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = SESErrorDomain;
    objc_msgSend(v10, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError(0, v22, v23, 4, CFSTR("File not found %@"), v25, v26, v27, (uint64_t)v24);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return a6;
}

- (NSString)cachedFileName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFileName, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_minOSKey, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
