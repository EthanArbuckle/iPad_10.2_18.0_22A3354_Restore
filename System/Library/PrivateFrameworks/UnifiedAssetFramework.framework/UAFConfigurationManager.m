@implementation UAFConfigurationManager

- (id)getAssetSet:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  UAFGetLogCategory((id *)&UAFLogContextConfiguration);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  UAFGetLogCategory((id *)&UAFLogContextConfiguration);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v19 = 138543362;
    v20 = v4;
    _os_signpost_emit_with_name_impl(&dword_229282000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "AssetSet Configuration", "%{public}@", (uint8_t *)&v19, 0xCu);
  }

  -[UAFConfigurationManager assetSetCache](self, "assetSetCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  -[UAFConfigurationManager assetSetCache](self, "assetSetCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v19 = 138543362;
      v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_229282000, v14, OS_SIGNPOST_INTERVAL_END, v6, "AssetSet Configuration", "%{public}@", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    -[UAFConfigurationManager assetSetCacheMiss:](self, "assetSetCacheMiss:", v4);
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v15 = objc_claimAutoreleasedReturnValue();
    v14 = v15;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v19 = 138543362;
      v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_229282000, v14, OS_SIGNPOST_INTERVAL_END, v6, "AssetSet Configuration", "%{public}@", (uint8_t *)&v19, 0xCu);
    }
  }

  -[UAFConfigurationManager assetSetCache](self, "assetSetCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v10);
  return v17;
}

- (NSArray)baseURLs
{
  return self->_baseURLs;
}

- (BOOL)shouldApplyFeatureFlags
{
  UAFConfigurationManager *v3;

  +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
  v3 = (UAFConfigurationManager *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v3 == self;

  return (char)self;
}

+ (id)defaultManager
{
  if (_MergedGlobals_9 != -1)
    dispatch_once(&_MergedGlobals_9, &__block_literal_global_10);
  return (id)qword_2540B1D10;
}

void __41__UAFConfigurationManager_defaultManager__block_invoke()
{
  UAFConfigurationManager *v0;
  void *v1;

  v0 = -[UAFConfigurationManager initWithURLs:]([UAFConfigurationManager alloc], "initWithURLs:", 0);
  v1 = (void *)qword_2540B1D10;
  qword_2540B1D10 = (uint64_t)v0;

}

+ (id)getConfigurationDirURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[UAFCommonUtilities rootDirectory](UAFCommonUtilities, "rootDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getAssetNameFromPath:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(a3, "URLByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    v5 = &stru_24F1F9848;

  return v5;
}

- (UAFConfigurationManager)initWithURLs:(id)a3
{
  id v5;
  UAFConfigurationManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *assetSetCache;
  UAFConfigurationManager *v9;
  NSArray *v10;
  void *v11;
  void *v12;
  NSArray *baseURLs;
  UAFConfigurationManager *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UAFConfigurationManager;
  v6 = -[UAFConfigurationManager init](&v16, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetSetCache = v6->_assetSetCache;
    v6->_assetSetCache = v7;

    if (v5)
    {
      objc_storeStrong((id *)&v6->_baseURLs, a3);
      v9 = v6;
    }
    else
    {
      v10 = (NSArray *)objc_opt_new();
      if (+[UAFCommonUtilities isInternalInstall](UAFCommonUtilities, "isInternalInstall"))
      {
        +[UAFConfigurationManager getConfigurationDirURL:](UAFConfigurationManager, "getConfigurationDirURL:", CFSTR("/AppleInternal/Library/UnifiedAssetFramework"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          -[NSArray addObject:](v10, "addObject:", v11);

      }
      +[UAFConfigurationManager getConfigurationDirURL:](UAFConfigurationManager, "getConfigurationDirURL:", CFSTR("/System/Library/UnifiedAssetFramework"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[NSArray addObject:](v10, "addObject:", v12);
      baseURLs = v6->_baseURLs;
      v6->_baseURLs = v10;

      v14 = v6;
    }
  }

  return v6;
}

- (void)invalidateCache
{
  void *v3;
  id obj;

  -[UAFConfigurationManager assetSetCache](self, "assetSetCache");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v3 = (void *)objc_opt_new();
  -[UAFConfigurationManager setAssetSetCache:](self, "setAssetSetCache:", v3);

  objc_sync_exit(obj);
}

- (void)assetSetCacheMiss:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  BOOL v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  UAFConfigurationManager *v23;
  NSObject *obj;
  uint64_t v25;
  id v26;
  unsigned __int8 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = self;
  -[UAFConfigurationManager baseURLs](self, "baseURLs");
  obj = objc_claimAutoreleasedReturnValue();
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v25 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "URLByAppendingPathComponent:", CFSTR("AssetSets"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v4;
        objc_msgSend(v9, "URLByAppendingPathComponent:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "URLByAppendingPathExtension:", CFSTR("plist"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 0;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "absoluteURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v14, &v27);
        v16 = v27;

        if (v15)
          v17 = v16 == 0;
        else
          v17 = 0;
        if (v17)
        {
          v26 = 0;
          +[UAFAssetSetConfiguration fromContentsOfURL:applyFeatureFlags:error:](UAFAssetSetConfiguration, "fromContentsOfURL:applyFeatureFlags:error:", v7, -[UAFConfigurationManager shouldApplyFeatureFlags](v23, "shouldApplyFeatureFlags"), &v26);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v26;
          v4 = v10;
          if (!v18)
          {
            UAFGetLogCategory((id *)&UAFLogContextConfiguration);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              v33 = "-[UAFConfigurationManager assetSetCacheMiss:]";
              v34 = 2114;
              v35 = v10;
              v36 = 2114;
              v37 = v7;
              v38 = 2114;
              v39 = v19;
              _os_log_error_impl(&dword_229282000, v20, OS_LOG_TYPE_ERROR, "%s Could not load asset set %{public}@ from URL %{public}@: %{public}@", buf, 0x2Au);
            }

          }
          -[UAFConfigurationManager assetSetCache](v23, "assetSetCache");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setValue:forKey:", v18, v10);

          goto LABEL_21;
        }
        v4 = v10;
      }
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  UAFGetLogCategory((id *)&UAFLogContextConfiguration);
  obj = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
  {
    -[UAFConfigurationManager baseURLs](v23, "baseURLs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v33 = "-[UAFConfigurationManager assetSetCacheMiss:]";
    v34 = 2112;
    v35 = v4;
    v36 = 2112;
    v37 = v22;
    _os_log_debug_impl(&dword_229282000, obj, OS_LOG_TYPE_DEBUG, "%s '%@' does not exist in %@", buf, 0x20u);

  }
LABEL_21:

}

- (id)getAllAssetSets
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id *v8;
  const __CFString *v9;
  uint64_t i;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t j;
  __CFString *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  UAFConfigurationManager *v25;
  const __CFString *v26;
  void *v27;
  id *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  os_signpost_id_t spid;
  unint64_t v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  NSObject *v57;
  __int16 v58;
  const __CFString *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextConfiguration);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  UAFGetLogCategory((id *)&UAFLogContextConfiguration);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  spid = v4;
  v35 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_229282000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "AssetSet Configuration", (const char *)&unk_2292ECD19, buf, 2u);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[UAFConfigurationManager baseURLs](self, "baseURLs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  v7 = 0;
  if (v39)
  {
    v38 = *(_QWORD *)v49;
    v37 = *MEMORY[0x24BDBCC98];
    v8 = (id *)&UAFLogContextConfiguration;
    v9 = CFSTR("plist");
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v49 != v38)
          objc_enumerationMutation(obj);
        v11 = *(NSObject **)(*((_QWORD *)&v48 + 1) + 8 * i);
        -[NSObject URLByAppendingPathComponent:](v11, "URLByAppendingPathComponent:", CFSTR("AssetSets"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v41 = i;
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v37;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v12;
          objc_msgSend(v13, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v14, 0, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v16 = v15;
          v43 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (v43)
          {
            v17 = *(_QWORD *)v45;
            v42 = *(_QWORD *)v45;
            do
            {
              for (j = 0; j != v43; ++j)
              {
                if (*(_QWORD *)v45 != v17)
                  objc_enumerationMutation(v16);
                v19 = *(__CFString **)(*((_QWORD *)&v44 + 1) + 8 * j);
                -[__CFString pathExtension](v19, "pathExtension");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "isEqualToString:", v9);

                if ((v21 & 1) != 0)
                {
                  objc_msgSend((id)objc_opt_class(), "getAssetNameFromPath:", v19);
                  v22 = objc_claimAutoreleasedReturnValue();
                  -[UAFConfigurationManager getAssetSet:](self, "getAssetSet:", v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v23)
                  {
                    if (!v7)
                      v7 = (void *)objc_opt_new();
                    if ((objc_msgSend(v7, "containsObject:", v23) & 1) == 0)
                      objc_msgSend(v7, "addObject:", v23);
                  }
                  else
                  {
                    v24 = v16;
                    v25 = self;
                    v26 = v9;
                    v27 = v7;
                    v28 = v8;
                    UAFGetLogCategory(v8);
                    v29 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315650;
                      v55 = "-[UAFConfigurationManager getAllAssetSets]";
                      v56 = 2112;
                      v57 = v22;
                      v58 = 2112;
                      v59 = v19;
                      _os_log_error_impl(&dword_229282000, v29, OS_LOG_TYPE_ERROR, "%s Asset with name %@ could not be loaded from %@.", buf, 0x20u);
                    }

                    v8 = v28;
                    v7 = v27;
                    v9 = v26;
                    self = v25;
                    v16 = v24;
                    v17 = v42;
                  }

                }
                else
                {
                  UAFGetLogCategory(v8);
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v55 = "-[UAFConfigurationManager getAllAssetSets]";
                    v56 = 2112;
                    v57 = v19;
                    _os_log_impl(&dword_229282000, v22, OS_LOG_TYPE_DEFAULT, "%s Not trying to load %@ as an asset set configuration file as it lacks the \"plist\" extension", buf, 0x16u);
                  }
                }

              }
              v43 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            }
            while (v43);
          }

          v12 = v40;
          i = v41;
        }
        else
        {
          UAFGetLogCategory(v8);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v55 = "-[UAFConfigurationManager getAllAssetSets]";
            v56 = 2112;
            v57 = v11;
            v58 = 2112;
            v59 = CFSTR("AssetSets");
            _os_log_error_impl(&dword_229282000, v16, OS_LOG_TYPE_ERROR, "%s Could not create URL from %@ by appending %@", buf, 0x20u);
          }
        }

      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v39);
  }

  UAFGetLogCategory((id *)&UAFLogContextConfiguration);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_229282000, v31, OS_SIGNPOST_INTERVAL_END, spid, "AssetSet Configuration", (const char *)&unk_2292ECD19, buf, 2u);
  }

  objc_msgSend(v7, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)getUsageAlias:(id)a3
{
  void *v4;
  uint64_t i;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  UAFConfigurationManager *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  id v31;
  unsigned __int8 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[UAFConfigurationManager baseURLs](self, "baseURLs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v30)
  {
    v27 = self;
    v4 = 0;
    v29 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = os_signpost_id_generate(v7);

        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = v8 - 1;
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_229282000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "UsageAlias Configuration", (const char *)&unk_2292ECD19, buf, 2u);
        }

        objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("UsageAliases"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "URLByAppendingPathComponent:", v31);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "URLByAppendingPathExtension:", CFSTR("plist"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = 0;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "absoluteURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v16, &v32);
        v18 = v32;

        if (v17)
          v19 = v18 == 0;
        else
          v19 = 0;
        if (v19)
        {
          +[UAFUsageAliasConfiguration fromContentsOfURL:assetSetManager:error:](UAFUsageAliasConfiguration, "fromContentsOfURL:assetSetManager:error:", v4, v27, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          UAFGetLogCategory((id *)&UAFLogContextConfiguration);
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_229282000, v25, OS_SIGNPOST_INTERVAL_END, v8, "UsageAlias Configuration", (const char *)&unk_2292ECD19, buf, 2u);
          }

          goto LABEL_27;
        }
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v38 = "-[UAFConfigurationManager getUsageAlias:]";
          v39 = 2112;
          v40 = v4;
          _os_log_debug_impl(&dword_229282000, v20, OS_LOG_TYPE_DEBUG, "%s %@ does not exist or is not a regular file", buf, 0x16u);
        }

        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_229282000, v22, OS_SIGNPOST_INTERVAL_END, v8, "UsageAlias Configuration", (const char *)&unk_2292ECD19, buf, 2u);
        }

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v30)
        continue;
      break;
    }
  }
  else
  {
    v4 = 0;
  }
  v23 = 0;
LABEL_27:

  return v23;
}

- (id)getPrestage:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[UAFConfigurationManager baseURLs](self, "baseURLs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v34 = *(_QWORD *)v38;
    v33 = *MEMORY[0x24BDD0D30];
    v31 = (void *)*MEMORY[0x24BDD0D40];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = os_signpost_id_generate(v9);

        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = v10 - 1;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_229282000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Prestage Configuration", (const char *)&unk_2292ECD19, buf, 2u);
        }

        objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("Prestage"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "URLByAppendingPathComponent:", v35);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "URLByAppendingPathExtension:", CFSTR("plist"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        objc_msgSend(v16, "attributesOfItemAtPath:error:", v17, &v36);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v36;

        if (v18)
          v20 = v19 == 0;
        else
          v20 = 0;
        if (v20)
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", v33);
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            objc_msgSend(v18, "objectForKeyedSubscript:", v33);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23 == v31)
            {
              +[UAFPrestageConfiguration fromContentsOfURL:error:](UAFPrestageConfiguration, "fromContentsOfURL:error:", v6, 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              UAFGetLogCategory((id *)&UAFLogContextConfiguration);
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = v28;
              if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_229282000, v29, OS_SIGNPOST_INTERVAL_END, v10, "Prestage Configuration", (const char *)&unk_2292ECD19, buf, 2u);
              }

              goto LABEL_30;
            }
          }
        }
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v42 = "-[UAFConfigurationManager getPrestage:]";
          v43 = 2112;
          v44 = v6;
          _os_log_debug_impl(&dword_229282000, v24, OS_LOG_TYPE_DEBUG, "%s %@ does not exist or is not a regular file", buf, 0x16u);
        }

        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_229282000, v26, OS_SIGNPOST_INTERVAL_END, v10, "Prestage Configuration", (const char *)&unk_2292ECD19, buf, 2u);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
  v27 = 0;
LABEL_30:

  return v27;
}

- (id)minVersions:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  id obj;
  uint64_t v44;
  id v45;
  uint64_t v46;
  os_signpost_id_t spid;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  id v81;
  _BYTE v82[128];
  uint64_t v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[UAFConfigurationManager baseURLs](self, "baseURLs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
  v4 = 0;
  if (v46)
  {
    v44 = *(_QWORD *)v72;
    v5 = *MEMORY[0x24BDBCC98];
    v51 = *MEMORY[0x24BDBCC98];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v72 != v44)
          objc_enumerationMutation(obj);
        v50 = v6;
        v7 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v6);
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = os_signpost_id_generate(v8);

        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v10;
        spid = v9;
        v49 = v9 - 1;
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_229282000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MinVersion Configuration", (const char *)&unk_2292ECD19, buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v45, CFSTR(".minversion."));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("MinVersions"));
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v5;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v83, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)v12;
        objc_msgSend(v13, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v14, 0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v54 = v15;
        v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
        if (v57)
        {
          v55 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v57; ++i)
            {
              if (*(_QWORD *)v68 != v55)
                objc_enumerationMutation(v54);
              v58 = i;
              v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
              objc_msgSend(v17, "path");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "lastPathComponent");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "hasPrefix:", v56);

              if (v20)
              {
                objc_msgSend(v17, "path");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "pathExtension");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("plist"));

                if (v23)
                {
                  v65 = 0;
                  v66 = 0;
                  v24 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v66, v5, &v65);
                  v25 = v66;
                  v26 = v65;
                  if (v24 && !v26)
                  {
                    if (objc_msgSend(v25, "BOOLValue"))
                    {
                      v52 = v25;
                      v64 = 0;
                      +[UAFMinVersionConfiguration fromContentsOfURL:error:](UAFMinVersionConfiguration, "fromContentsOfURL:error:", v17, &v64);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v53 = v64;
                      if (v27)
                      {
                        v62 = 0u;
                        v63 = 0u;
                        v60 = 0u;
                        v61 = 0u;
                        objc_msgSend(v27, "minVersions");
                        v59 = objc_claimAutoreleasedReturnValue();
                        v28 = -[NSObject countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
                        if (v28)
                        {
                          v29 = v28;
                          v30 = *(_QWORD *)v61;
                          do
                          {
                            for (j = 0; j != v29; ++j)
                            {
                              if (*(_QWORD *)v61 != v30)
                                objc_enumerationMutation(v59);
                              v32 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j);
                              if (!v4)
                                v4 = (void *)objc_opt_new();
                              objc_msgSend(v4, "objectForKeyedSubscript:", v32);
                              v33 = (void *)objc_claimAutoreleasedReturnValue();

                              if (!v33)
                                goto LABEL_29;
                              objc_msgSend(v4, "objectForKeyedSubscript:", v32);
                              v34 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v27, "minVersions");
                              v35 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v35, "objectForKeyedSubscript:", v32);
                              v36 = (void *)objc_claimAutoreleasedReturnValue();
                              v37 = +[UAFPlatform compareVersion:with:](UAFPlatform, "compareVersion:with:", v34, v36);

                              if (v37 == 1)
                              {
LABEL_29:
                                objc_msgSend(v27, "minVersions");
                                v38 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v38, "objectForKeyedSubscript:", v32);
                                v39 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, v32);

                              }
                            }
                            v29 = -[NSObject countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
                          }
                          while (v29);
                          v5 = v51;
                        }
                      }
                      else
                      {
                        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
                        v59 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 136315650;
                          v77 = "-[UAFConfigurationManager minVersions:]";
                          v78 = 2112;
                          v79 = v17;
                          v80 = 2112;
                          v81 = v53;
                          _os_log_error_impl(&dword_229282000, v59, OS_LOG_TYPE_ERROR, "%s Failed to load %@:%@", buf, 0x20u);
                        }
                      }

                      i = v58;
                      v25 = v52;
                      v26 = v53;
                    }
                    else
                    {
                      v26 = 0;
                    }
                  }

                }
              }
            }
            v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
          }
          while (v57);
        }

        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = v40;
        if (v49 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_229282000, v41, OS_SIGNPOST_INTERVAL_END, spid, "MinVersion Configuration", (const char *)&unk_2292ECD19, buf, 2u);
        }

        v6 = v50 + 1;
      }
      while (v50 + 1 != v46);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
    }
    while (v46);
  }

  return v4;
}

- (id)getMinVersion:(id)a3 provider:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  id obj;
  uint64_t v23;
  id v24;
  id v25;
  unsigned __int8 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v24 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[UAFConfigurationManager baseURLs](self, "baseURLs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v23 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "URLByAppendingPathComponent:", CFSTR("MinVersions"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), v25, CFSTR(".minversion."), v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "URLByAppendingPathExtension:", CFSTR("plist"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = 0;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "absoluteURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v15, &v26);
        v17 = v26;

        if (v16)
          v18 = v17 == 0;
        else
          v18 = 0;
        if (v18)
        {
          +[UAFMinVersionConfiguration fromContentsOfURL:error:](UAFMinVersionConfiguration, "fromContentsOfURL:error:", v8, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v32 = "-[UAFConfigurationManager getMinVersion:provider:]";
          v33 = 2112;
          v34 = v8;
          _os_log_impl(&dword_229282000, v19, OS_LOG_TYPE_DEFAULT, "%s %@ does not exist or is not a regular file", buf, 0x16u);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
  v20 = 0;
LABEL_18:

  return v20;
}

- (id)applySubscriptions:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  UAFConfigurationManager *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  os_signpost_id_t spid;
  unint64_t v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  UAFConfigurationManager *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  NSObject *log;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t v84[128];
  uint8_t buf[4];
  const char *v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  UAFGetLogCategory((id *)&UAFLogContextConfiguration);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  UAFGetLogCategory((id *)&UAFLogContextConfiguration);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v54 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_229282000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Apply Configuration", (const char *)&unk_2292ECD19, buf, 2u);
  }
  spid = v6;

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v4;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
  v9 = 0;
  if (v57)
  {
    v56 = *(_QWORD *)v81;
    v61 = self;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v81 != v56)
        {
          v11 = v10;
          objc_enumerationMutation(obj);
          v10 = v11;
        }
        v58 = v10;
        v12 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v10);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v66 = v12;
        objc_msgSend(v12, "assetSets", spid);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v77 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
              if (!v9)
                v9 = (void *)objc_opt_new();
              objc_msgSend(v9, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v19)
              {
                v20 = (void *)objc_opt_new();
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, v18);

              }
              objc_msgSend(v66, "assetSets");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", v18);
              v22 = objc_claimAutoreleasedReturnValue();

              if (v22)
                v23 = (void *)v22;
              else
                v23 = (void *)MEMORY[0x24BDBD1B8];
              objc_msgSend(v9, "objectForKeyedSubscript:", v18);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "containsObject:", v23);

              if ((v25 & 1) == 0)
              {
                objc_msgSend(v9, "objectForKeyedSubscript:", v18);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObject:", v23);

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
          }
          while (v15);
        }

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        objc_msgSend(v66, "usageAliases");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v91, 16);
        if (v62)
        {
          v28 = *(_QWORD *)v73;
          v29 = v61;
          v59 = *(_QWORD *)v73;
          v60 = v27;
          do
          {
            v30 = 0;
            do
            {
              if (*(_QWORD *)v73 != v28)
                objc_enumerationMutation(v27);
              v31 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v30);
              objc_msgSend(v66, "usageAliases");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKeyedSubscript:", v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              -[UAFConfigurationManager getUsageAlias:](v29, "getUsageAlias:", v31);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v34;
              if (v34)
              {
                v64 = v30;
                objc_msgSend(v34, "values");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = v33;
                objc_msgSend(v35, "objectForKeyedSubscript:", v33);
                v36 = objc_claimAutoreleasedReturnValue();

                log = v36;
                if (-[NSObject count](v36, "count"))
                {
                  v70 = 0u;
                  v71 = 0u;
                  v68 = 0u;
                  v69 = 0u;
                  v37 = v36;
                  v38 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                  if (v38)
                  {
                    v39 = v38;
                    v40 = *(_QWORD *)v69;
                    do
                    {
                      for (j = 0; j != v39; ++j)
                      {
                        if (*(_QWORD *)v69 != v40)
                          objc_enumerationMutation(v37);
                        v42 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
                        if (!v9)
                          v9 = (void *)objc_opt_new();
                        objc_msgSend(v9, "objectForKeyedSubscript:", v42);
                        v43 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v43)
                        {
                          v44 = (void *)objc_opt_new();
                          objc_msgSend(v9, "setObject:forKeyedSubscript:", v44, v42);

                        }
                        -[NSObject objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", v42);
                        v45 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "objectForKeyedSubscript:", v42);
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        v47 = objc_msgSend(v46, "containsObject:", v45);

                        if ((v47 & 1) == 0)
                        {
                          objc_msgSend(v9, "objectForKeyedSubscript:", v42);
                          v48 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v48, "addObject:", v45);

                        }
                      }
                      v39 = -[NSObject countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                    }
                    while (v39);
                    v27 = v60;
                    v29 = v61;
                    v28 = v59;
                  }
LABEL_49:
                  v33 = v63;
                }
                else
                {
                  UAFGetLogCategory((id *)&UAFLogContextClient);
                  v37 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                    goto LABEL_49;
                  *(_DWORD *)buf = 136315650;
                  v86 = "-[UAFConfigurationManager applySubscriptions:]";
                  v87 = 2114;
                  v88 = v31;
                  v89 = 2114;
                  v90 = v33;
                  _os_log_error_impl(&dword_229282000, v37, OS_LOG_TYPE_ERROR, "%s Could not process subscription for usage alias %{public}@ with value %{public}@", buf, 0x20u);
                }

                v30 = v64;
                goto LABEL_51;
              }
              UAFGetLogCategory((id *)&UAFLogContextClient);
              log = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v86 = "-[UAFConfigurationManager applySubscriptions:]";
                v87 = 2114;
                v88 = v31;
                _os_log_error_impl(&dword_229282000, log, OS_LOG_TYPE_ERROR, "%s Could not process subscription for usage alias %{public}@", buf, 0x16u);
              }
LABEL_51:

              ++v30;
            }
            while (v30 != v62);
            v49 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v91, 16);
            v62 = v49;
          }
          while (v49);
        }

        v10 = v58 + 1;
      }
      while (v58 + 1 != v57);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
    }
    while (v57);
  }

  UAFGetLogCategory((id *)&UAFLogContextConfiguration);
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_229282000, v51, OS_SIGNPOST_INTERVAL_END, spid, "Apply Configuration", (const char *)&unk_2292ECD19, buf, 2u);
  }

  return v9;
}

- (BOOL)isUsageLimitExceeded:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[UAFConfigurationManager getAssetSet:](self, "getAssetSet:", v9, (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isUsageLimitExceeded:", v11);

          if (v12)
          {

            v13 = 1;
            goto LABEL_12;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (void)setBaseURLs:(id)a3
{
  objc_storeStrong((id *)&self->_baseURLs, a3);
}

- (NSMutableDictionary)assetSetCache
{
  return self->_assetSetCache;
}

- (void)setAssetSetCache:(id)a3
{
  objc_storeStrong((id *)&self->_assetSetCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetCache, 0);
  objc_storeStrong((id *)&self->_baseURLs, 0);
}

@end
