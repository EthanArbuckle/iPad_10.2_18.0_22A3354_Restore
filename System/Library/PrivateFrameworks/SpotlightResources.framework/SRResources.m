@implementation SRResources

- (void)dealloc
{
  id v2;
  NSObject *v4;
  NSString *client;
  char *v6;
  void *v7;
  NSMutableDictionary *options;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  os_signpost_id_t v13;
  const char *v14;
  NSLocale *locale;
  const char *v16;
  const char *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  SRLogCategoryGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    client = self->_client;
    -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = client;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_24798C000, v4, OS_LOG_TYPE_DEFAULT, "SRResources dealloc (%@, %@)", buf, 0x16u);

  }
  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unregisterDelegate:", self);

  options = self->_options;
  if (options)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", CFSTR("SRResourcesOwner"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  SRLogCategorySignpost();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = dealloc_index;
  v13 = ++dealloc_index;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v14 = -[NSString UTF8String](self->_client, "UTF8String");
    locale = self->_locale;
    if (locale)
    {
      -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
      v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = (const char *)objc_msgSend(v2, "UTF8String");
      if (v9)
      {
LABEL_10:
        v17 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
        goto LABEL_13;
      }
    }
    else
    {
      v16 = "none";
      if (v9)
        goto LABEL_10;
    }
    v17 = "unknown";
LABEL_13:
    *(_DWORD *)buf = 136315650;
    v20 = (void *)v14;
    v21 = 2080;
    v22 = v16;
    v23 = 2080;
    v24 = v17;
    _os_signpost_emit_with_name_impl(&dword_24798C000, v11, OS_SIGNPOST_EVENT, v13, "SRResourcesDestroy", "client=%s, locale=%s, caller=%s", buf, 0x20u);
    if (locale)

  }
  v18.receiver = self;
  v18.super_class = (Class)SRResources;
  -[SRResources dealloc](&v18, sel_dealloc);
}

- (id)filePathArrayForKey:(id)a3 didFailWithError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void **v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v19;
  id v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_overrides, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "isFilePath"))
      {
        objc_msgSend(v8, "getFilePathValue");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          SRLogCategoryGeneral();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[SRResources BOOLeanForKey:didFailWithError:].cold.1();

          *a4 = 0;
          v22[0] = v10;
          v12 = (void *)MEMORY[0x24BDBCE30];
          v13 = (void **)v22;
          goto LABEL_19;
        }
      }
    }

  }
  -[SRResources fetchFilePathParameter:](self, "fetchFilePathParameter:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (v14 && objc_msgSend(v14, "isFilePath") && (objc_msgSend(v8, "isNil") & 1) == 0)
  {
    *a4 = 0;
    objc_msgSend(v8, "getFilePathValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v10;
    v12 = (void *)MEMORY[0x24BDBCE30];
    v13 = &v21;
LABEL_19:
    objc_msgSend(v12, "arrayWithObjects:count:", v13, 1);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  -[SRResources assetPathsForContentType:](self, "assetPathsForContentType:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    *a4 = 0;
    v15 = v10;
    v10 = v15;
LABEL_20:
    v17 = v15;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SpotlightResourcesErrorDomain"), -1, 0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  SRLogCategoryGeneral();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v6;
    _os_log_impl(&dword_24798C000, v16, OS_LOG_TYPE_DEFAULT, "SpotlightResources could not find file paths parameter %@", (uint8_t *)&v19, 0xCu);
  }

  v17 = 0;
LABEL_21:

  return v17;
}

- (id)fetchFilePathParameter:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SRResources fetchParameter:checkForPositive:](self, "fetchParameter:checkForPositive:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isFilePath"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (int64_t)longForKey:(id)a3
{
  uint64_t v4;

  v4 = 0;
  return -[SRResources longForKey:didFailWithError:](self, "longForKey:didFailWithError:", a3, &v4);
}

- (int64_t)longForKey:(id)a3 didFailWithError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_overrides, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "isLong"))
      {
        objc_msgSend(v8, "getLongValue");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          SRLogCategoryGeneral();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[SRResources BOOLeanForKey:didFailWithError:].cold.1();

          *a4 = 0;
          v12 = objc_msgSend(v10, "longValue");

          goto LABEL_17;
        }
      }
    }

  }
  -[SRResources fetchLongParameter:](self, "fetchLongParameter:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v13
    && objc_msgSend(v13, "isLong")
    && (objc_msgSend(v8, "getLongValue"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = v14;
    *a4 = 0;
    v12 = objc_msgSend(v14, "longValue");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SpotlightResourcesErrorDomain"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    SRLogCategoryGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_24798C000, v16, OS_LOG_TYPE_DEFAULT, "SpotlightResources could not find long parameter %@", (uint8_t *)&v18, 0xCu);
    }

    v12 = 0;
  }
LABEL_17:

  return v12;
}

- (id)fetchLongParameter:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SRResources fetchParameter:checkForPositive:](self, "fetchParameter:checkForPositive:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isLong"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)fetchParameter:(id)a3 checkForPositive:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  char v13;
  char v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  char v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  _BOOL4 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v51 = a4;
  v62 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRResources client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parametersOfNamespaceWithName:client:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "allValues");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9 || !-[NSObject count](v9, "count"))
    {
      SRLogCategoryGeneral();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[SRResources fetchParameter:checkForPositive:].cold.2();
      v15 = 0;
      goto LABEL_66;
    }
    -[NSObject objectAtIndex:](v10, "objectAtIndex:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      SRLogCategoryGeneral();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[SRResources fetchParameter:checkForPositive:].cold.3();
      v15 = 0;
      goto LABEL_65;
    }
    v13 = -[NSObject flag](v11, "flag");
    v14 = v13;
    v50 = v10;
    v47 = v13;
    if ((v13 & 2) == 0)
    {
      v15 = 0;
LABEL_38:
      v48 = v12;
      v49 = v8;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v29 = v8;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
      if (v30)
      {
        v31 = v30;
        v52 = *(_QWORD *)v54;
        while (2)
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v54 != v52)
              objc_enumerationMutation(v29);
            v33 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_msgSend(v29, "objectForKeyedSubscript:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            os_unfair_lock_lock((os_unfair_lock_t)&sTrialParameterListLock);
            objc_msgSend((id)sTrialParameterList, "objectForKeyedSubscript:", v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v5;
            objc_msgSend(v35, "objectForKeyedSubscript:", v5);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v37, "hasValueFromTrial"))
            {
              objc_msgSend(v37, "parameter");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "copy");

              SRLogCategoryGeneral();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v58 = v36;
                v59 = 2112;
                v60 = v33;
                _os_log_debug_impl(&dword_24798C000, v40, OS_LOG_TYPE_DEBUG, "Parameter %@ has value from Trial namespace %@", buf, 0x16u);
              }

              v34 = (void *)v39;
            }
            os_unfair_lock_unlock((os_unfair_lock_t)&sTrialParameterListLock);
            if (v34
              && (objc_msgSend(v34, "isNil") & 1) == 0
              && (!objc_msgSend(v34, "isLong") || !v51 || (objc_msgSend(v34, "isPositiveLong") & 1) != 0))
            {
              v16 = v34;

              v15 = v16;
              v5 = v36;
              v8 = v49;
              v10 = v50;
              v12 = v48;
              goto LABEL_65;
            }
            objc_msgSend(v29, "objectForKeyedSubscript:", v33);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v41, "copy");

            v5 = v36;
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
          if (v31)
            continue;
          break;
        }
      }

      if ((~v47 & 0xA) != 0)
      {
        v8 = v49;
        v10 = v50;
        v12 = v48;
      }
      else
      {
        os_unfair_lock_lock(&sUserDefaultsParameterListLock);
        objc_msgSend((id)sUserDefaultsParameterList, "objectForKeyedSubscript:", v5);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v49;
        v10 = v50;
        if (v42)
        {
          objc_msgSend((id)sUserDefaultsParameterList, "objectForKeyedSubscript:", v5);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "copy");

          SRLogCategoryGeneral();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            -[SRResources fetchParameter:checkForPositive:].cold.4();

          v15 = (void *)v44;
        }
        v12 = v48;
        os_unfair_lock_unlock(&sUserDefaultsParameterListLock);
        if (v15 && (objc_msgSend(v15, "isNil") & 1) == 0 && objc_msgSend(v15, "isLong") && v51)
          objc_msgSend(v15, "isPositiveLong");
      }
      goto LABEL_66;
    }
    if ((v13 & 0x10) != 0)
    {
      os_unfair_lock_lock(&sUserDefaultsParameterListLock);
      objc_msgSend((id)sUserDefaultsParameterList, "objectForKeyedSubscript:", v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend((id)sUserDefaultsParameterList, "objectForKeyedSubscript:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v18, "copy");

        SRLogCategoryGeneral();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[SRResources fetchParameter:checkForPositive:].cold.4();

        os_unfair_lock_unlock(&sUserDefaultsParameterListLock);
        if (v15
          && (objc_msgSend(v15, "isNil") & 1) == 0
          && (!objc_msgSend(v15, "isLong") || !v51 || (objc_msgSend(v15, "isPositiveLong") & 1) != 0))
        {
          goto LABEL_66;
        }
LABEL_28:
        if ((v14 & 4) == 0)
          goto LABEL_38;
        -[SRResources client](self, "client");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSTrialManager currentTrialManagerForClient:](SSTrialManager, "currentTrialManagerForClient:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v21, "namespaceId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_lock((os_unfair_lock_t)&sTrialParameterListLock);
          objc_msgSend((id)sTrialParameterList, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v5);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v24, "hasValueFromTrial"))
          {
            v25 = v5;
            objc_msgSend(v24, "parameter");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "copy");

            SRLogCategoryGeneral();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              -[SRResources fetchParameter:checkForPositive:].cold.5();

            v15 = (void *)v27;
            v5 = v25;
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&sTrialParameterListLock);
          if (v15
            && (objc_msgSend(v15, "isNil") & 1) == 0
            && (!objc_msgSend(v15, "isLong") || !v51 || (objc_msgSend(v15, "isPositiveLong") & 1) != 0))
          {
            v16 = v15;

            v15 = v16;
LABEL_65:

LABEL_66:
            goto LABEL_67;
          }

        }
        goto LABEL_38;
      }
      os_unfair_lock_unlock(&sUserDefaultsParameterListLock);
    }
    v15 = 0;
    goto LABEL_28;
  }
  SRLogCategoryGeneral();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SRResources fetchParameter:checkForPositive:].cold.1();
  v15 = 0;
LABEL_67:

  return v15;
}

- (NSString)client
{
  return self->_client;
}

- (id)assetPathsForContentType:(id)a3
{
  id v4;
  SRResources *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SRAssetBundle assetsWithContentType:](v5->_liveAssetBundle, "assetsWithContentType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (SRResources)initWithClient:(id)a3 locale:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  SRResources *v14;
  SRResources *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *options;
  uint64_t v18;
  NSMutableData *feedbackData;
  NSString *experimentNamespaceId;
  NSString *experimentId;
  NSString *experimentTreatmentId;
  NSDictionary *overrides;
  uint64_t v24;
  NSDictionary *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  SRAssetBundle *liveAssetBundle;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  objc_super v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  SRLogCategoryGeneral();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "localeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v39 = v9;
    v40 = 2112;
    v41 = v13;
    _os_log_impl(&dword_24798C000, v12, OS_LOG_TYPE_DEFAULT, "SRResources init (%@, %@)", buf, 0x16u);

  }
  v37.receiver = self;
  v37.super_class = (Class)SRResources;
  v14 = -[SRResources init](&v37, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_client, a3);
    if (v11)
      v16 = (NSMutableDictionary *)objc_msgSend(v11, "mutableCopy");
    else
      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    options = v15->_options;
    v15->_options = v16;

    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v18 = objc_claimAutoreleasedReturnValue();
    feedbackData = v15->_feedbackData;
    v15->_feedbackData = (NSMutableData *)v18;

    experimentNamespaceId = v15->_experimentNamespaceId;
    v15->_experimentNamespaceId = 0;

    experimentId = v15->_experimentId;
    v15->_experimentId = 0;

    experimentTreatmentId = v15->_experimentTreatmentId;
    v15->_experimentTreatmentId = 0;

    v15->_hasUpdates = 0;
    objc_storeStrong((id *)&v15->_locale, a4);
    overrides = v15->_overrides;
    v15->_overrides = 0;

    if (SRIsAppleInternalInstall() && sUsingOverrides)
    {
      objc_msgSend((id)sOverrideList, "objectForKeyedSubscript:", v9);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v15->_overrides;
      v15->_overrides = (NSDictionary *)v24;

    }
    +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setOptions:", v11);

    +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "registerDelegate:", v15);

    +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "assetBundleForLocale:client:", v15->_locale, v15->_client);
    v29 = objc_claimAutoreleasedReturnValue();
    liveAssetBundle = v15->_liveAssetBundle;
    v15->_liveAssetBundle = (SRAssetBundle *)v29;

    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("autoUpdateLocale"));
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = (void *)v31;
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("autoUpdateLocale"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "BOOLValue");

        if (v34)
        {
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObserver:selector:name:object:", v15, sel_updateLocale, *MEMORY[0x24BDBCA70], 0);

        }
      }
    }
  }

  return v15;
}

- (id)getTrialTreatmentId
{
  void *v2;
  void *v3;
  void *v4;

  -[SRResources currentExperimentTrialManager](self, "currentExperimentTrialManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "treatmentId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)getTrialExperimentId
{
  void *v2;
  void *v3;
  void *v4;

  -[SRResources currentExperimentTrialManager](self, "currentExperimentTrialManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "experimentId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)currentExperimentTrialManager
{
  return +[SSTrialManager currentTrialManagerForClient:](SSTrialManager, "currentTrialManagerForClient:", self->_client);
}

- (NSLocale)locale
{
  SRResources *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSLocale copy](v2->_locale, "copy");
  objc_sync_exit(v2);

  return (NSLocale *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentTreatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_experimentNamespaceId, 0);
  objc_storeStrong(&self->_parameterUpdates, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_liveAssetBundle, 0);
  objc_storeStrong((id *)&self->_feedbackData, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

- (id)parameterUpdates
{
  return self->_parameterUpdates;
}

- (void)didUpdateDefaults
{
  SRResources *v2;
  void *v3;
  uint64_t v4;
  SRAssetBundle *liveAssetBundle;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v2->_hasUpdates = 1;
  +[SRDefaultsManager sharedDefaultsManager](SRDefaultsManager, "sharedDefaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetBundleForLocale:client:", v2->_locale, v2->_client);
  v4 = objc_claimAutoreleasedReturnValue();
  liveAssetBundle = v2->_liveAssetBundle;
  v2->_liveAssetBundle = (SRAssetBundle *)v4;

  -[SRAssetBundle contentTypes](v2->_liveAssetBundle, "contentTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRResources parameterUpdates](v2, "parameterUpdates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
          -[SRResources parameterUpdates](v2, "parameterUpdates", (_QWORD)v14);
          v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v13[2](v13, v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  objc_sync_exit(v2);

}

- (void)setLocale:(id)a3
{
  NSLocale *v4;
  NSLocale *locale;
  SRResources *obj;

  v4 = (NSLocale *)a3;
  obj = self;
  objc_sync_enter(obj);
  locale = obj->_locale;
  obj->_locale = v4;

  objc_sync_exit(obj);
}

- (void)updateLocale
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRResources setLocale:](self, "setLocale:", v3);

  -[SRResources didUpdateDefaults](self, "didUpdateDefaults");
}

- (BOOL)hasUpdates
{
  SRResources *v2;
  BOOL hasUpdates;

  v2 = self;
  objc_sync_enter(v2);
  hasUpdates = v2->_hasUpdates;
  v2->_hasUpdates = 0;
  objc_sync_exit(v2);

  return hasUpdates;
}

- (id)fetchBooleanParameter:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SRResources fetchParameter:checkForPositive:](self, "fetchParameter:checkForPositive:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isBool"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)fetchDoubleParameter:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SRResources fetchParameter:checkForPositive:](self, "fetchParameter:checkForPositive:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isDouble"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)fetchStringParameter:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[SRResources fetchParameter:checkForPositive:](self, "fetchParameter:checkForPositive:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "isString"))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)BOOLeanForKey:(id)a3 didFailWithError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_overrides, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "isBool"))
      {
        objc_msgSend(v8, "getBooleanValue");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          SRLogCategoryGeneral();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[SRResources BOOLeanForKey:didFailWithError:].cold.1();

          *a4 = 0;
          v12 = objc_msgSend(v10, "BOOLValue");

          goto LABEL_17;
        }
      }
    }

  }
  -[SRResources fetchBooleanParameter:](self, "fetchBooleanParameter:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v13
    && objc_msgSend(v13, "isBool")
    && (objc_msgSend(v8, "getBooleanValue"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v15 = v14;
    *a4 = 0;
    v12 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SpotlightResourcesErrorDomain"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    SRLogCategoryGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_24798C000, v16, OS_LOG_TYPE_DEFAULT, "SpotlightResources could not find BOOLean parameter %@", (uint8_t *)&v18, 0xCu);
    }

    v12 = 0;
  }
LABEL_17:

  return v12;
}

- (BOOL)BOOLeanForKey:(id)a3
{
  uint64_t v4;

  v4 = 0;
  return -[SRResources BOOLeanForKey:didFailWithError:](self, "BOOLeanForKey:didFailWithError:", a3, &v4);
}

- (double)doubleForKey:(id)a3 didFailWithError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  NSObject *v18;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_overrides, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "isDouble"))
      {
        objc_msgSend(v8, "getDoubleValue");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          SRLogCategoryGeneral();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[SRResources BOOLeanForKey:didFailWithError:].cold.1();

          *a4 = 0;
          objc_msgSend(v10, "doubleValue");
          v13 = v12;

          goto LABEL_17;
        }
      }
    }

  }
  -[SRResources fetchDoubleParameter:](self, "fetchDoubleParameter:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (v14
    && objc_msgSend(v14, "isDouble")
    && (objc_msgSend(v8, "getDoubleValue"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = v15;
    *a4 = 0;
    objc_msgSend(v15, "doubleValue");
    v13 = v17;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SpotlightResourcesErrorDomain"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    SRLogCategoryGeneral();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_impl(&dword_24798C000, v18, OS_LOG_TYPE_DEFAULT, "SpotlightResources could not find double parameter %@", (uint8_t *)&v20, 0xCu);
    }

    v13 = 2.22507386e-308;
  }
LABEL_17:

  return v13;
}

- (double)doubleForKey:(id)a3
{
  double result;
  uint64_t v4;

  v4 = 0;
  -[SRResources doubleForKey:didFailWithError:](self, "doubleForKey:didFailWithError:", a3, &v4);
  return result;
}

- (id)stringForKey:(id)a3 didFailWithError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_overrides, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "isString"))
      {
        objc_msgSend(v8, "getStringValue");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          SRLogCategoryGeneral();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[SRResources BOOLeanForKey:didFailWithError:].cold.1();

          goto LABEL_14;
        }
      }
    }

  }
  -[SRResources fetchStringParameter:](self, "fetchStringParameter:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v12)
  {
    if (objc_msgSend(v12, "isString"))
    {
      objc_msgSend(v8, "getStringValue");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v10 = (void *)v13;
LABEL_14:
        *a4 = 0;
        goto LABEL_18;
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SpotlightResourcesErrorDomain"), -1, 0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  SRLogCategoryGeneral();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_24798C000, v14, OS_LOG_TYPE_DEFAULT, "SpotlightResources could not find string parameter %@", (uint8_t *)&v16, 0xCu);
  }

  v10 = 0;
LABEL_18:

  return v10;
}

- (id)stringForKey:(id)a3
{
  uint64_t v4;

  v4 = 0;
  -[SRResources stringForKey:didFailWithError:](self, "stringForKey:didFailWithError:", a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filePathForKey:(id)a3 didFailWithError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;

  v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_overrides, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "isFilePath"))
      {
        objc_msgSend(v8, "getFilePathValue");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          SRLogCategoryGeneral();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[SRResources BOOLeanForKey:didFailWithError:].cold.1();

          goto LABEL_14;
        }
      }
    }

  }
  -[SRResources fetchFilePathParameter:](self, "fetchFilePathParameter:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v12)
  {
    if (objc_msgSend(v12, "isFilePath"))
    {
      objc_msgSend(v8, "getFilePathValue");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v10 = (void *)v13;
LABEL_14:
        *a4 = 0;
        goto LABEL_21;
      }
    }
  }
  -[SRResources assetPathsForContentType:](self, "assetPathsForContentType:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    *a4 = 0;
    objc_msgSend(v14, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SpotlightResourcesErrorDomain"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    SRLogCategoryGeneral();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SRResources filePathForKey:didFailWithError:].cold.1();

    v10 = 0;
  }

LABEL_21:
  return v10;
}

- (id)filePathForKey:(id)a3
{
  uint64_t v4;

  v4 = 0;
  -[SRResources filePathForKey:didFailWithError:](self, "filePathForKey:didFailWithError:", a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)filePathArrayForKey:(id)a3
{
  uint64_t v4;

  v4 = 0;
  -[SRResources filePathArrayForKey:didFailWithError:](self, "filePathArrayForKey:didFailWithError:", a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectForKey:(id)a3 withType:(int64_t *)a4 didFailWithError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int64_t v16;
  int64_t v17;

  v8 = a3;
  if (!SRIsAppleInternalInstall() || !sUsingOverrides)
  {
LABEL_9:
    -[SRResources fetchBooleanParameter:](self, "fetchBooleanParameter:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    *a5 = 0;
    if (v14 && objc_msgSend(v14, "isBool") && (objc_msgSend(v10, "isNil") & 1) == 0)
    {
      *a4 = 0;
LABEL_32:
      objc_msgSend(v10, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    -[SRResources fetchLongParameter:](self, "fetchLongParameter:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && objc_msgSend(v15, "isLong") && (objc_msgSend(v15, "isNil") & 1) == 0)
    {
      v16 = 1;
    }
    else
    {
      -[SRResources fetchDoubleParameter:](self, "fetchDoubleParameter:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && objc_msgSend(v10, "isDouble") && (objc_msgSend(v10, "isNil") & 1) == 0)
      {
        v17 = 2;
LABEL_31:
        *a4 = v17;
        goto LABEL_32;
      }
      -[SRResources fetchStringParameter:](self, "fetchStringParameter:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15 || !objc_msgSend(v15, "isString") || (objc_msgSend(v15, "isNil") & 1) != 0)
      {
        -[SRResources fetchFilePathParameter:](self, "fetchFilePathParameter:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10 || !objc_msgSend(v10, "isFilePath") || (objc_msgSend(v10, "isNil") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SpotlightResourcesErrorDomain"), -1, 0);
          v12 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          *a4 = -1;
          goto LABEL_33;
        }
        v17 = 4;
        goto LABEL_31;
      }
      v16 = 3;
    }
    *a4 = v16;
    objc_msgSend(v15, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    goto LABEL_33;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_overrides, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || (objc_msgSend(v9, "value"), (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_9;
  }
  v12 = (void *)v11;
  SRLogCategoryGeneral();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[SRResources BOOLeanForKey:didFailWithError:].cold.1();

  *a5 = 0;
LABEL_33:

  return v12;
}

- (id)objectForKey:(id)a3 didFailWithError:(id *)a4
{
  uint64_t v5;

  v5 = -1;
  -[SRResources objectForKey:withType:didFailWithError:](self, "objectForKey:withType:didFailWithError:", a3, &v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectForKey:(id)a3
{
  uint64_t v4;

  v4 = 0;
  -[SRResources objectForKey:didFailWithError:](self, "objectForKey:didFailWithError:", a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getTrialNamespaceId
{
  void *v2;
  void *v3;
  void *v4;

  -[SRResources currentExperimentTrialManager](self, "currentExperimentTrialManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "namespaceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)getTrialRolloutId
{
  void *v2;
  void *v3;
  void *v4;

  -[SRResources currentExperimentTrialManager](self, "currentExperimentTrialManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "rolloutId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)getTrialExperimentDeploymentId
{
  void *v2;
  void *v3;
  int v4;

  -[SRResources currentExperimentTrialManager](self, "currentExperimentTrialManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "experimentDeploymentId");
  else
    v4 = -1;

  return v4;
}

- (int)getTrialRolloutDeploymentId
{
  void *v2;
  void *v3;
  int v4;

  -[SRResources currentExperimentTrialManager](self, "currentExperimentTrialManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "rolloutDeploymentId");
  else
    v4 = -1;

  return v4;
}

- (void)refreshTrial
{
  id v3;

  +[SRResourcesManager sharedResourcesManager](SRResourcesManager, "sharedResourcesManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshTrialForClient:", self->_client);

}

- (id)getTTRLogs
{
  return +[SSTrialManager getTTRLogsForClient:](SSTrialManager, "getTTRLogsForClient:", self->_client);
}

- (id)getFeedbackData
{
  return self->_feedbackData;
}

- (void)appendFeedbackData:(id)a3
{
  -[NSMutableData appendData:](self->_feedbackData, "appendData:", a3);
}

- (id)updateWithNewOptions:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *options;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    options = self->_options;
    self->_options = v4;

  }
  return self;
}

- (void)logForTrigger:(id)a3 queryID:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSString *client;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSMutableDictionary *options;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  os_signpost_id_t v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  NSString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (+[SRResourcesManager parsecEnabled](SRResourcesManager, "parsecEnabled")
    && (-[NSString isEqualToString:](self->_client, "isEqualToString:", CFSTR("Spotlight"))
     || -[NSString isEqualToString:](self->_client, "isEqualToString:", CFSTR("Mail"))))
  {
    SRLogCategoryGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      client = self->_client;
      *(_DWORD *)buf = 138412802;
      v30 = (uint64_t)v8;
      v31 = 2048;
      v32 = a4;
      v33 = 2112;
      v34 = client;
      _os_log_impl(&dword_24798C000, v7, OS_LOG_TYPE_DEFAULT, "logForTrigger:%@ queryID:%lld client:%@", buf, 0x20u);

    }
    -[SRResources stringForKey:](self, "stringForKey:", CFSTR("codepathIDs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SRLogCategoryGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[SRResources logForTrigger:queryID:].cold.1();

    if (v6)
    {
      if (v10)
      {
        objc_msgSend(v10, "uppercaseString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "containsString:", v13);

        if (v14)
        {
          SRLogCategoryGeneral();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "UUIDString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v30 = (uint64_t)v16;
            _os_log_impl(&dword_24798C000, v15, OS_LOG_TYPE_DEFAULT, "Emitting trigger for codepathID: %@", buf, 0xCu);

          }
          v17 = objc_alloc_init(MEMORY[0x24BE84E40]);
          objc_msgSend(v17, "setQueryId:", a4);
          objc_msgSend(v17, "setCodepathId:", v6);
          options = self->_options;
          if (options)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", CFSTR("SRResourcesOwner"));

          }
          SRLogCategorySignpost();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v19;
          v21 = logForTrigger_queryID__index;
          v22 = ++logForTrigger_queryID__index;
          if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
          {
            objc_msgSend(v6, "UUIDString");
            v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v24 = objc_msgSend(v23, "UTF8String");
            *(_DWORD *)buf = 136315394;
            v30 = v24;
            v31 = 2048;
            v32 = a4;
            _os_signpost_emit_with_name_impl(&dword_24798C000, v20, OS_SIGNPOST_EVENT, v22, "SRResourcesLogForTrigger", "uuid=%s, queryID=%lld", buf, 0x16u);

          }
          dispatch_get_global_queue(25, 0);
          v25 = objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 3221225472;
          v27[2] = __37__SRResources_logForTrigger_queryID___block_invoke;
          v27[3] = &unk_2519084A8;
          v27[4] = self;
          v28 = v17;
          v26 = v17;
          dispatch_async(v25, v27);

        }
      }
    }

  }
}

void __37__SRResources_logForTrigger_queryID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SRPARSession spotlightResourcesPARSessionForClient:](SRPARSession, "spotlightResourcesPARSessionForClient:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "experimentNamespaceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExperimentNamespaceId:", v4);

    objc_msgSend(*(id *)(a1 + 32), "experimentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExperimentId:", v6);

    objc_msgSend(*(id *)(a1 + 32), "experimentTreatmentId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExperimentTreatmentId:", v8);

    v10 = objc_msgSend(*(id *)(a1 + 32), "experimentDeploymentId");
    objc_msgSend(v3, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setExperimentDeploymentId:", v10);

    v12 = objc_msgSend(*(id *)(a1 + 32), "experimentVersion");
    objc_msgSend(v3, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setExperimentVersion:", v12);

    objc_msgSend(v3, "reportEvent:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    SRLogCategoryGeneral();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __37__SRResources_logForTrigger_queryID___block_invoke_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
}

- (NSString)description
{
  const __CFString *client;
  void *v4;
  NSLocale *locale;
  void *v6;
  NSMutableDictionary *options;
  void *v8;
  void *v9;
  void *v10;

  client = (const __CFString *)self->_client;
  if (!client)
    client = CFSTR("none");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("SRResources: { client = %@"), client);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  locale = self->_locale;
  if (locale)
  {
    -[NSLocale localeIdentifier](locale, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(", locale = %@"), v6);

  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(", locale = %@"), CFSTR("none"));
  }
  options = self->_options;
  if (options)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", CFSTR("SRResourcesOwner"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("SRResourcesOwner"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(", owner = %@"), v9);

    }
  }
  objc_msgSend(v4, "appendString:", CFSTR(" }"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)setParameterUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)experimentNamespaceId
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExperimentNamespaceId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)experimentId
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)experimentTreatmentId
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExperimentTreatmentId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (int)experimentDeploymentId
{
  return self->_experimentDeploymentId;
}

- (void)setExperimentDeploymentId:(int)a3
{
  self->_experimentDeploymentId = a3;
}

- (unsigned)experimentVersion
{
  return self->_experimentVersion;
}

- (void)setExperimentVersion:(unsigned int)a3
{
  self->_experimentVersion = a3;
}

- (BOOL)autoUpdatingLocale
{
  return self->_autoUpdatingLocale;
}

- (void)setAutoUpdatingLocale:(BOOL)a3
{
  self->_autoUpdatingLocale = a3;
}

- (void)fetchParameter:checkForPositive:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24798C000, v0, v1, "Parameter %@ not found in defaults manager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchParameter:checkForPositive:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24798C000, v0, v1, "Parameter %@ not found in defaults manager.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchParameter:checkForPositive:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24798C000, v0, v1, "Default parameter for %@ is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchParameter:checkForPositive:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24798C000, v0, v1, "Parameter %@ has value from user defaults", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchParameter:checkForPositive:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_24798C000, v0, v1, "Parameter %@ has value from Trial namespace %@");
  OUTLINED_FUNCTION_1();
}

- (void)BOOLeanForKey:didFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24798C000, v0, v1, "Overriding value of parameter %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)filePathForKey:didFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "SpotlightResources could not find file path parameter %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logForTrigger:queryID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24798C000, v0, v1, "logForTrigger got codepathIDs %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __37__SRResources_logForTrigger_queryID___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_24798C000, a1, a3, "Feedback session is nil", a5, a6, a7, a8, 0);
}

@end
