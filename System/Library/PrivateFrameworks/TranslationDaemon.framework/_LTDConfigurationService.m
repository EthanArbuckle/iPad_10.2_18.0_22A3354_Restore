@implementation _LTDConfigurationService

+ (id)fileNameForType:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
    return &stru_251A15610;
  else
    return off_251A11A18[a3];
}

+ (id)cache
{
  if (cache_onceToken != -1)
    dispatch_once(&cache_onceToken, &__block_literal_global_3);
  return (id)cache_cache;
}

+ (id)_queue
{
  if (_queue_onceToken != -1)
    dispatch_once(&_queue_onceToken, &__block_literal_global_20);
  return (id)_queue__queue;
}

+ (void)configurationForType:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  int64_t v12;

  v6 = a4;
  objc_msgSend(a1, "_queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60___LTDConfigurationService_configurationForType_completion___block_invoke;
  block[3] = &unk_251A11970;
  v11 = a1;
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

+ (id)configurationForType:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  uint8_t buf[4];
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForType:error:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v11 = objc_msgSend(v10, "lt_ensureTypesForKeys:values:", v9, 0), v12 = v10, (v11 & 1) == 0))
  {

    v12 = 0;
  }

  if (v12)
  {
    v13 = v12;
    v14 = v13;
    goto LABEL_54;
  }
  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "urlForType:source:", 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "urlForType:source:", 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "urlForType:source:", 0, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 1:
      v18 = a1;
      v19 = 1;
      goto LABEL_13;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
      objc_msgSend(a1, "urlForType:source:", a3, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "urlForType:source:", a3, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      goto LABEL_14;
    case 7:
      v18 = a1;
      v19 = 7;
LABEL_13:
      objc_msgSend(v18, "urlForType:source:", v19, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v16 = 0;
      goto LABEL_14;
    case 9:
      v37 = _LTOSLogAssets();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        +[_LTDConfigurationService configurationForType:error:].cold.7(v37, v38, v39, v40, v41, v42, v43, v44);
      objc_msgSend(a1, "cache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForType:", 9);
      v13 = 0;
      v14 = 0;
      goto LABEL_53;
    default:
      v17 = 0;
      v16 = 0;
      v15 = 0;
LABEL_14:
      objc_msgSend(a1, "fileNameForType:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v21 = _LTOSLogAssets();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          +[_LTDConfigurationService configurationForType:error:].cold.6();
        v57 = 0;
        objc_msgSend(a1, "deserializedPlistContentsOf:error:", v15, &v57);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v22 = v57;
        if (v22)
        {
          v23 = v22;
          v24 = _LTOSLogAssets();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            +[_LTDConfigurationService configurationForType:error:].cold.5();
            if (!a4)
              goto LABEL_21;
          }
          else if (!a4)
          {
LABEL_21:
            objc_msgSend(a1, "cache");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "removeObjectForType:", a3);

            v14 = 0;
            goto LABEL_52;
          }
          *a4 = objc_retainAutorelease(v23);
          goto LABEL_21;
        }
      }
      else
      {
        v13 = 0;
      }
      v53 = v17;
      if (!v17)
        goto LABEL_32;
      v26 = _LTOSLogAssets();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        +[_LTDConfigurationService configurationForType:error:].cold.4();
      v56 = 0;
      objc_msgSend(a1, "deserializedPlistContentsOf:error:", v17, &v56);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v56;
      if (v28)
      {
        v29 = _LTOSLogAssets();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          if (!a4)
            goto LABEL_31;
          goto LABEL_29;
        }
        +[_LTDConfigurationService configurationForType:error:].cold.3();
        if (a4)
LABEL_29:
          *a4 = objc_retainAutorelease(v28);
      }
      else
      {
        objc_msgSend(a1, "overlay:with:", v13, v27);
        v30 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v30;
      }
LABEL_31:

LABEL_32:
      if (!v16)
        goto LABEL_49;
      v31 = _LTOSLogAssets();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        +[_LTDConfigurationService configurationForType:error:].cold.2();
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __55___LTDConfigurationService_configurationForType_error___block_invoke;
      v55[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
      v55[4] = a1;
      +[_LTDAssetService refreshCatalogIfNeededWithCompletion:](_LTDAssetService, "refreshCatalogIfNeededWithCompletion:", v55);
      v54 = 0;
      objc_msgSend(a1, "deserializedPlistContentsOf:error:", v16, &v54);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v54;
      if (!v33)
      {
        objc_msgSend(a1, "overlay:with:", v13, v32);
        v36 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v36;
        goto LABEL_48;
      }
      v34 = _LTOSLogAssets();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v33;
        _os_log_impl(&dword_2491B9000, v34, OS_LOG_TYPE_INFO, "Failed to retrieve managed configuration %@", buf, 0xCu);
      }
      objc_msgSend(v33, "domain", v20);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35 != (void *)*MEMORY[0x24BDD0B88])
        goto LABEL_39;
      v45 = objc_msgSend(v33, "code");

      if (v45 == 260)
      {
        v46 = _LTOSLogAssets();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          v47 = v46;
          objc_msgSend(v16, "path");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v59 = v35;
          _os_log_impl(&dword_2491B9000, v47, OS_LOG_TYPE_INFO, "File not installed at: %{public}@", buf, 0xCu);

LABEL_39:
        }
      }
      v20 = v52;
LABEL_48:

LABEL_49:
      objc_msgSend(a1, "preferenceOverridesFor:", a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "overlay:with:", v13, v23);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = _LTOSLogAssets();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        +[_LTDConfigurationService configurationForType:error:].cold.1();
      objc_msgSend(a1, "cache");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setObject:forType:", v48, a3);

      v13 = v48;
      v14 = v13;
      v17 = v53;
LABEL_52:

LABEL_53:
LABEL_54:

      return v14;
  }
}

+ (id)urlForType:(int64_t)a3 source:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v16;

  objc_msgSend(a1, "fileNameForType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 2:
      v9 = _LTOSLogAssets();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        +[_LTDConfigurationService urlForType:source:].cold.4(v9);
      break;
    case 1:
      v16 = 0;
      +[_LTDAssetService configAssetIfAvailableWithError:](_LTDAssetService, "configAssetIfAvailableWithError:", &v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      if (v6 && (objc_msgSend(v6, "isInstalled") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 8, CFSTR("Not installed"), 0);
        v12 = objc_claimAutoreleasedReturnValue();

        v7 = 0;
        v10 = (id)v12;
      }
      else if (v10)
      {
        v11 = _LTOSLogAssets();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          +[_LTDConfigurationService urlForType:source:].cold.3();
        v7 = 0;
      }
      else
      {
        objc_msgSend(v6, "getLocalFileUrl");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URLByAppendingPathComponent:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLByAppendingPathExtension:", CFSTR("plist"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = _LTOSLogAssets();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          +[_LTDConfigurationService urlForType:source:].cold.2();
      }

      goto LABEL_19;
    case 0:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("plist"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = _LTOSLogAssets();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[_LTDConfigurationService urlForType:source:].cold.1();
LABEL_19:

      goto LABEL_20;
  }
  v7 = 0;
LABEL_20:

  return v7;
}

+ (id)preferenceOverridesFor:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  char v8;
  void *v9;

  objc_msgSend(a1, "fileNameForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (!v7
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v8 = objc_msgSend(v7, "lt_ensureTypesForKeys:values:", v6, 0), v9 = v7, (v8 & 1) == 0))
  {

    v9 = 0;
  }

  return v9;
}

+ (id)overlay:(id)a3 with:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "addEntriesFromDictionary:", v6);
    v8 = (id)objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = v5;
  }

  return v8;
}

+ (id)deserializedPlistContentsOf:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid configuration URL: %@"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 12, v8, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[_LTDConfigurationService deserializedPlistContentsOf:error:].cold.1();
    goto LABEL_9;
  }
  v6 = _LTOSLogAssets();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[_LTDConfigurationService deserializedPlistContentsOf:error:].cold.5();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v5, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*a4)
  {
    v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[_LTDConfigurationService deserializedPlistContentsOf:error:].cold.4();
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 10, CFSTR("Failed to read configuration file"), MEMORY[0x24BDBD1B8]);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v16 = _LTOSLogAssets();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[_LTDConfigurationService deserializedPlistContentsOf:error:].cold.2();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v8, 0, 0, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (*a4)
  {
    v15 = _LTOSLogAssets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[_LTDConfigurationService deserializedPlistContentsOf:error:].cold.3();
    v11 = 0;
  }
  else
  {
    v11 = v13;
  }

LABEL_10:
  return v11;
}

+ (void)flushCache
{
  id v2;

  objc_msgSend(a1, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

+ (id)asrConfigurationWithError:(id *)a3
{
  void *v3;
  _LTDASRConfigurationModel *v4;

  objc_msgSend(a1, "configurationForType:error:", 8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_LTDASRConfigurationModel initWithDictionary:]([_LTDASRConfigurationModel alloc], "initWithDictionary:", v3);

  return v4;
}

+ (void)asrConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59___LTDConfigurationService_asrConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_251A119B8;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (id)offlineConfigurationWithError:(id *)a3
{
  void *v3;
  _LTDOfflineConfigurationModel *v4;

  objc_msgSend(a1, "configurationForType:error:", 2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_LTDOfflineConfigurationModel initWithDictionary:]([_LTDOfflineConfigurationModel alloc], "initWithDictionary:", v3);

  return v4;
}

+ (void)offlineConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63___LTDConfigurationService_offlineConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_251A119B8;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (id)siriConfigurationWithError:(id *)a3
{
  void *v3;
  _LTDSiriConfigurationModel *v4;

  objc_msgSend(a1, "configurationForType:error:", 5, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_LTDSiriConfigurationModel initWithDictionary:]([_LTDSiriConfigurationModel alloc], "initWithDictionary:", v3);

  return v4;
}

+ (void)siriConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60___LTDConfigurationService_siriConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_251A119B8;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (id)textStreamingConfigurationWithError:(id *)a3
{
  void *v3;
  _LTDTextStreamingConfigurationModel *v4;

  objc_msgSend(a1, "configurationForType:error:", 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_LTDTextStreamingConfigurationModel initWithDictionary:]([_LTDTextStreamingConfigurationModel alloc], "initWithDictionary:", v3);

  return v4;
}

+ (void)textStreamingConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69___LTDConfigurationService_textStreamingConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_251A119B8;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (id)assetConfigurationWithError:(id *)a3
{
  void *v3;
  _LTDAssetConfigurationModel *v4;

  objc_msgSend(a1, "configurationForType:error:", 1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_LTDAssetConfigurationModel initWithDictionary:]([_LTDAssetConfigurationModel alloc], "initWithDictionary:", v3);

  return v4;
}

+ (void)assetConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61___LTDConfigurationService_assetConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_251A119B8;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (id)aneConfigurationWithError:(id *)a3
{
  void *v3;
  _LTDANEConfigurationModel *v4;

  +[_LTDConfigurationService configurationForType:error:](_LTDConfigurationService, "configurationForType:error:", 7, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_LTDANEConfigurationModel initWithDictionary:]([_LTDANEConfigurationModel alloc], "initWithDictionary:", v3);

  return v4;
}

+ (void)aneConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59___LTDConfigurationService_aneConfigurationWithCompletion___block_invoke;
  v7[3] = &unk_251A119B8;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (id)supportedLocalePairsForTask:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v4 = 3;
  if (a3 == 4)
    v4 = 5;
  if (a3 == 2)
    v5 = 4;
  else
    v5 = v4;
  v10 = 0;
  +[_LTDConfigurationService configurationForType:error:](_LTDConfigurationService, "configurationForType:error:", v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LanguagePairs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v7 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v7, "lt_ensureElementType:", objc_opt_class()))
  {
LABEL_11:
    v8 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_12;
  }
  objc_msgSend(v7, "_ltCompactMap:", &__block_literal_global_49);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v8;
}

+ (void)supportedLocalePairsForTask:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  int64_t v12;

  v6 = a4;
  objc_msgSend(a1, "_queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67___LTDConfigurationService_supportedLocalePairsForTask_completion___block_invoke;
  block[3] = &unk_251A11970;
  v11 = a1;
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

+ (void)configurationForType:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "Caching config for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)configurationForType:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "Retrieve managed config for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)configurationForType:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to retrieve overlay configuration %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)configurationForType:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "Retrieve overlay config for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)configurationForType:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to retrieve bundled configuration %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)configurationForType:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "Retrieve bundled config for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)configurationForType:(uint64_t)a3 error:(uint64_t)a4 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_2491B9000, a1, a3, "Invalid configuration base type %zd", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

+ (void)urlForType:source:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2491B9000, v0, v1, "URL for type: %{public}@ source: bundled result: %{public}@");
  OUTLINED_FUNCTION_1_2();
}

+ (void)urlForType:source:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_2491B9000, v0, v1, "URL for type: %{public}@ source: config result: %{public}@");
  OUTLINED_FUNCTION_1_2();
}

+ (void)urlForType:source:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_2491B9000, v1, OS_LOG_TYPE_ERROR, "Config source URL for type: %{public}@ lookup failure: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_2();
}

+ (void)urlForType:(os_log_t)log source:.cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2491B9000, log, OS_LOG_TYPE_FAULT, "Invalid configuration source request", v1, 2u);
}

+ (void)deserializedPlistContentsOf:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_2491B9000, v0, v1, "Failed to get asset URL for installed MobileAsset; will attempt to fall back to bundled asset %@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)deserializedPlistContentsOf:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Empty plist %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)deserializedPlistContentsOf:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to deserialize plist %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)deserializedPlistContentsOf:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read plist %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)deserializedPlistContentsOf:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_2491B9000, v0, v1, "Reading configuration plist at URL: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
