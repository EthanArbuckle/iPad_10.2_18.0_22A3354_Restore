@implementation ISURLBag

+ (id)_sharedBagBackend
{
  if (_sharedBagBackend_onceToken != -1)
    dispatch_once(&_sharedBagBackend_onceToken, &__block_literal_global_4);
  return (id)_sharedBagBackend_sharedBagBackend;
}

void __29__ISURLBag__sharedBagBackend__block_invoke()
{
  ISURLBagBackend *v0;
  void *v1;

  v0 = objc_alloc_init(ISURLBagBackend);
  v1 = (void *)_sharedBagBackend_sharedBagBackend;
  _sharedBagBackend_sharedBagBackend = (uint64_t)v0;

}

- (ISURLBag)init
{
  ISURLBag *v3;
  uint64_t v4;
  ISURLBagBackend *bagBackend;
  void *v6;
  uint64_t v7;
  NSString *bagBackendKey;
  objc_super v10;

  __ISRecordSPIClassUsage(self);
  v10.receiver = self;
  v10.super_class = (Class)ISURLBag;
  v3 = -[ISURLBag init](&v10, sel_init);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_sharedBagBackend");
    v4 = objc_claimAutoreleasedReturnValue();
    bagBackend = v3->_bagBackend;
    v3->_bagBackend = (ISURLBagBackend *)v4;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    bagBackendKey = v3->_bagBackendKey;
    v3->_bagBackendKey = (NSString *)v7;

    v3->_invalidationTime = -1.79769313e308;
  }
  return v3;
}

- (ISURLBag)initWithContentsOfFile:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  ISURLBag *v7;

  v4 = (objc_class *)MEMORY[0x24BDBCE70];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithContentsOfFile:", v5);

  if (v6)
  {
    v7 = -[ISURLBag initWithRawDictionary:](self, "initWithRawDictionary:", v6);
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (ISURLBag)initWithRawDictionary:(id)a3
{
  id v4;
  ISURLBag *v5;
  ISURLBag *v6;
  uint64_t v7;
  NSArray *guidPatterns;
  uint64_t v9;
  NSSet *guidSchemes;
  uint64_t v11;
  NSDictionary *headerPatterns;

  v4 = a3;
  v5 = -[ISURLBag init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[ISURLBag _setBagBackendWithDictionary:](v5, "_setBagBackendWithDictionary:", v4);
    v7 = -[ISURLBag _copyGUIDPatternsFromBagBackend](v6, "_copyGUIDPatternsFromBagBackend");
    guidPatterns = v6->_guidPatterns;
    v6->_guidPatterns = (NSArray *)v7;

    v9 = -[ISURLBag _copyGUIDSchemesFromBagBackend](v6, "_copyGUIDSchemesFromBagBackend");
    guidSchemes = v6->_guidSchemes;
    v6->_guidSchemes = (NSSet *)v9;

    v11 = -[ISURLBag _copyHeaderPatternsFromBagBackend](v6, "_copyHeaderPatternsFromBagBackend");
    headerPatterns = v6->_headerPatterns;
    v6->_headerPatterns = (NSDictionary *)v11;

    v6->_invalidationTime = 1.79769313e308;
  }

  return v6;
}

- (ISURLBag)initWithURLBagContext:(id)a3
{
  id v4;
  ISURLBag *v5;
  uint64_t v6;
  SSURLBagContext *context;
  id v8;
  void *v9;
  SSNetworkConstraints *v10;
  SSNetworkConstraints *defaultConstraints;

  v4 = a3;
  if (objc_msgSend(v4, "bagType") != 2)
  {
    v5 = 0;
LABEL_6:

    goto LABEL_7;
  }
  v5 = -[ISURLBag init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    context = v5->_context;
    v5->_context = (SSURLBagContext *)v6;

    v5->_invalidationTime = 1.79769313e308;
    v8 = objc_alloc(MEMORY[0x24BDBCE70]);
    -[ISURLBag _networkConstraintsCachePath](v5, "_networkConstraintsCachePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = (ISURLBag *)objc_msgSend(v8, "initWithContentsOfFile:", v9);

    -[ISURLBag _setBagBackendWithDictionary:](v5, "_setBagBackendWithDictionary:", self);
    if (!self)
    {
      v10 = (SSNetworkConstraints *)objc_alloc_init(MEMORY[0x24BEB1F38]);
      defaultConstraints = v5->_defaultConstraints;
      v5->_defaultConstraints = v10;

      -[SSNetworkConstraints disableCellularNetworkTypes](v5->_defaultConstraints, "disableCellularNetworkTypes");
    }
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[ISURLBag _setBagBackendWithDictionary:](self, "_setBagBackendWithDictionary:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ISURLBag;
  -[ISURLBag dealloc](&v3, sel_dealloc);
}

- (id)copyExtraHeadersForURL:(id)a3
{
  ISURLBag *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  ISURLBag *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSDictionary *obj;
  id v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!self->_headerPatterns)
    return 0;
  v3 = self;
  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3->_headerPatterns;
  v19 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v8 = v3;
        -[NSDictionary objectForKey:](v3->_headerPatterns, "objectForKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "rangeOfFirstMatchInString:options:range:", v4, 0, 0, v5) != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v17, "addObject:", v7);
                goto LABEL_17;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_17:

        v3 = v8;
      }
      v19 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  return v17;
}

- (BOOL)loadFromDictionary:(id)a3 returningError:(id *)a4
{
  id v6;
  NSArray *guidPatterns;
  NSSet *guidSchemes;
  NSDictionary *headerPatterns;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  NSArray *v24;
  NSArray *v25;
  NSSet *v26;
  NSSet *v27;
  NSDictionary *v28;
  NSDictionary *v29;
  uint64_t v30;
  int v31;
  void *v32;
  __int16 v33;
  int64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ISURLBag _setBagBackendWithDictionary:](self, "_setBagBackendWithDictionary:", 0);
  guidPatterns = self->_guidPatterns;
  self->_guidPatterns = 0;

  guidSchemes = self->_guidSchemes;
  self->_guidSchemes = 0;

  headerPatterns = self->_headerPatterns;
  self->_headerPatterns = 0;

  objc_msgSend(v6, "objectForKey:", CFSTR("bag"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v10, 0, 0, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("urlBag"));
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = v6;

    v10 = v13;
  }
  -[ISURLBag _setBagBackendWithDictionary:](self, "_setBagBackendWithDictionary:", v10);
  -[ISURLBag URLBagDictionary](self, "URLBagDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (-[ISURLBag versionIdentifier](self, "versionIdentifier") > 370303295)
    {
      v24 = -[ISURLBag _copyGUIDPatternsFromBagBackend](self, "_copyGUIDPatternsFromBagBackend");
      v25 = self->_guidPatterns;
      self->_guidPatterns = v24;

      v26 = -[ISURLBag _copyGUIDSchemesFromBagBackend](self, "_copyGUIDSchemesFromBagBackend");
      v27 = self->_guidSchemes;
      self->_guidSchemes = v26;

      v28 = -[ISURLBag _copyHeaderPatternsFromBagBackend](self, "_copyHeaderPatternsFromBagBackend");
      v29 = self->_headerPatterns;
      self->_headerPatterns = v28;

      -[ISURLBag _writeNetworkConstraintsCacheFile](self, "_writeNetworkConstraintsCacheFile");
      if (SSIsDaemon())
      {
        -[ISURLBag _writeURLResolutionCacheFile](self, "_writeURLResolutionCacheFile");
        -[ISURLBag _toggleStopSendingLocalCookies](self, "_toggleStopSendingLocalCookies");
      }
      v22 = 1;
      if (a4)
        goto LABEL_22;
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      v17 &= 2u;
    if (v17)
    {
      v19 = (void *)objc_opt_class();
      v20 = v19;
      v31 = 138412546;
      v32 = v19;
      v33 = 2048;
      v34 = -[ISURLBag versionIdentifier](self, "versionIdentifier");
      LODWORD(v30) = 22;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v31, v30);
      v18 = objc_claimAutoreleasedReturnValue();
      free(v21);
      SSFileLog();
    }

    goto LABEL_20;
  }
LABEL_21:
  v22 = 0;
  if (a4)
LABEL_22:
    *a4 = 0;
LABEL_23:

  return v22;
}

- (void)_toggleStopSendingLocalCookies
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  CFPropertyListRef *v20;
  const __CFString *v21;
  NSObject *v22;
  uint64_t v23;
  _BYTE v24[22];
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (v5)
  {
    *(_DWORD *)v24 = 138543362;
    *(_QWORD *)&v24[4] = objc_opt_class();
    v7 = *(id *)&v24[4];
    LODWORD(v23) = 12;
    v22 = v24;
    v8 = (void *)_os_log_send_and_compose_impl();

    if (!v8)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, v24, v23, *(_OWORD *)v24);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    v22 = v6;
    SSFileLog();
  }

LABEL_12:
  -[ISURLBag valueForKey:](self, "valueForKey:", CFSTR("stop-including-local-cookies"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v9, "BOOLValue");
  else
    v10 = 0;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedDaemonConfig", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    v13 = v12 | 2;
  else
    v13 = v12;
  objc_msgSend(v11, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    v13 &= 2u;
  if (v13)
  {
    v15 = (void *)objc_opt_class();
    v16 = (void *)MEMORY[0x24BDD16E0];
    v17 = v15;
    objc_msgSend(v16, "numberWithBool:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v24 = 138543874;
    *(_QWORD *)&v24[4] = v15;
    *(_WORD *)&v24[12] = 2114;
    *(_QWORD *)&v24[14] = v18;
    v25 = 2114;
    v26 = v9;
    LODWORD(v23) = 32;
    v19 = (void *)_os_log_send_and_compose_impl();

    if (!v19)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v19, 4, v24, v23);
    v14 = objc_claimAutoreleasedReturnValue();
    free(v19);
    SSFileLog();
  }

LABEL_26:
  v20 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!(_DWORD)v10)
    v20 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  v21 = (const __CFString *)*MEMORY[0x24BEB2C88];
  CFPreferencesSetAppValue(CFSTR("stopIncludingLocalCookies"), *v20, (CFStringRef)*MEMORY[0x24BEB2C88]);
  CFPreferencesAppSynchronize(v21);

}

+ (void)_loadItemKindURLBagKeyMap
{
  if (_loadItemKindURLBagKeyMap_sOnce != -1)
    dispatch_once(&_loadItemKindURLBagKeyMap_sOnce, &__block_literal_global_72);
}

void __37__ISURLBag__loadItemKindURLBagKeyMap__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x24BDBCE30]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x24BEB2650], *MEMORY[0x24BEB2658], *MEMORY[0x24BEB2660], *MEMORY[0x24BEB2668], *MEMORY[0x24BEB2678], *MEMORY[0x24BEB2688], *MEMORY[0x24BEB2690], *MEMORY[0x24BEB2698], *MEMORY[0x24BEB26A0], *MEMORY[0x24BEB26A8], *MEMORY[0x24BEB26B0], *MEMORY[0x24BEB26B8], *MEMORY[0x24BEB26C0], *MEMORY[0x24BEB26C8], *MEMORY[0x24BEB26D0], *MEMORY[0x24BEB26D8], *MEMORY[0x24BEB26F0],
         *MEMORY[0x24BEB26E0],
         *MEMORY[0x24BEB26E8],
         *MEMORY[0x24BEB26F8],
         0);
  v2 = (void *)__ItemKinds;
  __ItemKinds = v1;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("viewArtist"), CFSTR("audiobooks"), CFSTR("podcasts"), CFSTR("itunes-u"), CFSTR("music"), CFSTR("movies"), CFSTR("music-videos"), CFSTR("newsstand"), CFSTR("podcasts"), CFSTR("podcasts"), CFSTR("podcasts"), CFSTR("ringtones"), CFSTR("apps"), CFSTR("apps"), CFSTR("music"), CFSTR("ringtones"), CFSTR("tv-shows"),
         CFSTR("tv-shows"),
         CFSTR("music"),
         0);
  v4 = (void *)__URLBagKeys;
  __URLBagKeys = v3;

}

+ (id)storeFrontURLBagKeyForItemKind:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_loadItemKindURLBagKeyMap");
  v4 = objc_msgSend((id)__ItemKinds, "count");
  if (v4 < 1)
  {
LABEL_5:
    v9 = 0;
  }
  else
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      objc_msgSend((id)__ItemKinds, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v3, "isEqualToString:", v7);

      if (v8)
        break;
      if (v5 == ++v6)
        goto LABEL_5;
    }
    objc_msgSend((id)__URLBagKeys, "objectAtIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSSet)availableStorefrontItemKinds
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_loadItemKindURLBagKeyMap");
  v4 = objc_msgSend((id)__URLBagKeys, "count");
  if (v4 >= 1)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend((id)__URLBagKeys, "objectAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISURLBag urlForKey:](self, "urlForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend((id)__ItemKinds, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
    }
  }
  -[ISURLBag networkConstraintsForDownloadKind:](self, "networkConstraintsForDownloadKind:", *MEMORY[0x24BEB2288]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isAnyNetworkTypeEnabled"))
    objc_msgSend(v3, "addObject:", *MEMORY[0x24BEB2670]);

  return (NSSet *)v3;
}

- (BOOL)isValid
{
  double v3;
  double v4;
  int64_t v5;
  uint64_t v6;

  -[ISURLBag invalidationTime](self, "invalidationTime");
  v4 = v3;
  v5 = -[ISURLBag versionIdentifier](self, "versionIdentifier");
  if (v4 <= -1.79769313e308)
    return 0;
  v6 = v5;
  return CFAbsoluteTimeGetCurrent() < v4 && v6 > 370303295;
}

- (id)networkConstraintsForDownloadKind:(id)a3
{
  void *v4;
  ISURLBagBackend *bagBackend;
  NSString *bagBackendKey;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SSNetworkConstraints *defaultConstraints;
  id v12;

  v4 = (void *)MEMORY[0x24BEB1F38];
  bagBackend = self->_bagBackend;
  bagBackendKey = self->_bagBackendKey;
  v7 = a3;
  -[ISURLBagBackend dictionaryRepresentationForBagWithKey:](bagBackend, "dictionaryRepresentationForBagWithKey:", bagBackendKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "newNetworkConstraintsByDownloadKindFromURLBag:", v8);

  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    defaultConstraints = self->_defaultConstraints;
    if (defaultConstraints)
      v12 = (id)-[SSNetworkConstraints copy](defaultConstraints, "copy");
    else
      v12 = objc_alloc_init(MEMORY[0x24BEB1F38]);
    v10 = v12;
  }

  return v10;
}

- (id)searchQueryParametersForClientIdentifier:(id)a3 networkType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;

  v6 = a3;
  -[ISURLBagBackend valueForKey:forBagWithKey:](self->_bagBackend, "valueForKey:forBagWithKey:", CFSTR("p2-search-parameters"), self->_bagBackendKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __GetDictionaryValueForNetworkType(v8, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = v7;
    goto LABEL_19;
  }
  -[ISURLBag valueForKey:](self, "valueForKey:", CFSTR("mobile-connection-type-allows"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __GetDictionaryValueForNetworkType(v10, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("eBooks")) & 1) != 0
        || objc_msgSend(v6, "isEqualToString:", CFSTR("Books")))
      {
        v11 = CFSTR("eBook-search-parameters");
        goto LABEL_9;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("WiFi-Music")))
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("p2-store-ns-search-parameters"));
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_10;
        objc_msgSend(v8, "objectForKey:", CFSTR("p2-store-search-parameters"));
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_10;
        v11 = CFSTR("p2-music-search-parameters");
LABEL_9:
        objc_msgSend(v8, "objectForKey:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v9 = (void *)v12;
LABEL_19:

        goto LABEL_20;
      }
    }
    v9 = 0;
    goto LABEL_19;
  }
  v9 = 0;
LABEL_20:

  return v9;
}

- (void)setInvalidationTime:(double)a3
{
  if (self->_invalidationTime != a3)
    self->_invalidationTime = a3;
}

- (void)setInvalidationTimeWithExprationInterval:(double)a3
{
  -[ISURLBag setInvalidationTime:](self, "setInvalidationTime:", fmax(a3, 60.0) + CFAbsoluteTimeGetCurrent());
}

- (BOOL)shouldSendAnonymousMachineIdentifierForURL:(id)a3
{
  id v4;
  void *v5;
  char ShouldSendAMDForURL;

  v4 = a3;
  -[ISURLBag valueForKey:](self, "valueForKey:", *MEMORY[0x24BEB2BA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    ShouldSendAMDForURL = SSVURLBagShouldSendAMDForURL();
  else
    ShouldSendAMDForURL = 0;

  return ShouldSendAMDForURL;
}

- (BOOL)shouldSendGUIDForURL:(id)a3
{
  id v4;
  BOOL v5;
  NSSet *guidSchemes;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((SSDebugAlwaysSendGUID() & 1) != 0)
    goto LABEL_2;
  guidSchemes = self->_guidSchemes;
  objc_msgSend(v4, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(guidSchemes) = -[NSSet containsObject:](guidSchemes, "containsObject:", v7);

  if (!(_DWORD)guidSchemes)
  {
    v5 = 0;
    goto LABEL_17;
  }
  if (!-[NSArray count](self->_guidPatterns, "count"))
  {
LABEL_2:
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = self->_guidPatterns;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "rangeOfFirstMatchInString:options:range:", v8, 0, 0, v9, (_QWORD)v16) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v5 = 1;
            goto LABEL_16;
          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v12)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_16:

  }
LABEL_17:

  return v5;
}

- (id)urlForKey:(id)a3
{
  void *v3;
  void *v4;

  -[ISURLBag valueForKey:](self, "valueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)urlIsTrusted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_19;
  objc_msgSend(v4, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("data"));

  if ((v7 & 1) != 0)
  {
    v8 = 1;
    goto LABEL_22;
  }
  objc_msgSend(v5, "host");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_19:
    v8 = 0;
    goto LABEL_22;
  }
  v10 = (void *)v9;
  -[ISURLBag valueForKey:](self, "valueForKey:", CFSTR("trustedDomains"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v16, "length", (_QWORD)v18))
        {
          if (objc_msgSend(v16, "hasPrefix:", CFSTR(".")))
          {
            if ((objc_msgSend(v10, "hasSuffix:", v16) & 1) != 0)
              goto LABEL_20;
          }
          else if (!objc_msgSend(v10, "caseInsensitiveCompare:", v16))
          {
LABEL_20:
            v8 = 1;
            goto LABEL_21;
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_21:

LABEL_22:
  return v8;
}

- (id)URLForURL:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  int v13;
  __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  int v18;
  const __CFString *v19;

  v6 = a3;
  v7 = a4;
  -[ISURLBag valueForKey:](self, "valueForKey:", CFSTR("p2-client-url-schemes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v6, "scheme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("https"));

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Software")))
    {
      v14 = CFSTR("itms-apps");
      v15 = CFSTR("itms-appss");
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("MusicPlayer")))
    {
      v14 = CFSTR("its-music");
      v15 = CFSTR("its-musics");
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("VideoPlayer")))
    {
      v14 = CFSTR("its-videos");
      v15 = CFSTR("its-videoss");
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("eBooks")) & 1) != 0
           || objc_msgSend(v7, "isEqualToString:", CFSTR("Books")))
    {
      v14 = CFSTR("itms-books");
      v15 = CFSTR("itms-bookss");
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("GameCenter")))
    {
      v14 = CFSTR("itms-gc");
      v15 = CFSTR("itms-gcs");
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("iTunesU")))
    {
      v14 = CFSTR("itms-itunesu");
      v15 = CFSTR("itms-itunesus");
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Podcasts")))
      {
        v18 = objc_msgSend(v7, "isEqualToString:", CFSTR("Newsstand"));
        v14 = CFSTR("itms");
        if (v13)
          v14 = CFSTR("itmss");
        v19 = CFSTR("itms-newss");
        if (!v13)
          v19 = CFSTR("itms-news");
        if (v18)
          v14 = (__CFString *)v19;
        goto LABEL_16;
      }
      v14 = CFSTR("itms-podcasts");
      v15 = CFSTR("itms-podcastss");
    }
    if (v13)
      v14 = (__CFString *)v15;
LABEL_16:
    v11 = v14;
LABEL_17:
    objc_msgSend(v6, "urlByReplacingSchemeWithScheme:", v11);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = v11;
    v6 = (id)v16;
    goto LABEL_18;
  }
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_19;
    goto LABEL_17;
  }
LABEL_18:

LABEL_19:
  return v6;
}

- (id)valueForKey:(id)a3
{
  return -[ISURLBagBackend valueForKey:forBagWithKey:](self->_bagBackend, "valueForKey:forBagWithKey:", a3, self->_bagBackendKey);
}

- (id)sanitizedURLForURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[ISURLBag valueForKey:](self, "valueForKey:", CFSTR("externalURLReplaceKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISURLBag valueForKey:](self, "valueForKey:", CFSTR("externalURLSearchKey"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = v4;
  if (v4)
  {
    v8 = v4;
    if (v5)
    {
      v8 = v4;
      if (v6)
      {
        v9 = objc_alloc(MEMORY[0x24BDD16A8]);
        objc_msgSend(v4, "absoluteString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithString:", v10);

        v13 = objc_msgSend(v11, "rangeOfString:", v7);
        v8 = v4;
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v11, "replaceCharactersInRange:withString:", v13, v12, v5);
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }

  return v8;
}

- (void)setURLBagContext:(id)a3
{
  SSURLBagContext *v4;
  SSURLBagContext *context;

  if (self->_context != a3)
  {
    v4 = (SSURLBagContext *)objc_msgSend(a3, "copy");
    context = self->_context;
    self->_context = v4;

  }
}

- (SSURLBagContext)URLBagContext
{
  return (SSURLBagContext *)(id)-[SSURLBagContext copy](self->_context, "copy");
}

- (NSDictionary)URLBagDictionary
{
  return (NSDictionary *)-[ISURLBagBackend dictionaryRepresentationForBagWithKey:](self->_bagBackend, "dictionaryRepresentationForBagWithKey:", self->_bagBackendKey);
}

- (int64_t)versionIdentifier
{
  void *v2;
  double v3;
  int64_t v4;

  -[ISURLBag valueForKey:](self, "valueForKey:", CFSTR("timestamp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    v4 = (uint64_t)v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v16;
  id v17;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDD1770];
  -[ISURLBag URLBagDictionary](self, "URLBagDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v9, "dataWithPropertyList:format:options:error:", v10, 200, 0, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;

  if (v11)
  {
    v16 = v12;
    v13 = objc_msgSend(v11, "writeToFile:options:error:", v8, a4, &v16);
    v14 = v16;

    v12 = v14;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v13 = 0;
    if (!a5)
      goto LABEL_7;
  }
  if ((v13 & 1) == 0)
    *a5 = objc_retainAutorelease(v12);
LABEL_7:

  return v13;
}

+ (id)copyExtraHeadersForURL:(id)a3 inBagContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLBagForContext:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "copyExtraHeadersForURL:", v6);
  return v9;
}

+ (id)networkConstraintsForDownloadKind:(id)a3 inBagContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLBagForContext:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "networkConstraintsForDownloadKind:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)shouldSendGUIDForURL:(id)a3 inBagContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLBagForContext:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "shouldSendGUIDForURL:", v6);
  return (char)v7;
}

+ (id)urlBagForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBagForContext:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)urlForKey:(id)a3 inBagContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLBagForContext:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "urlForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)urlIsTrusted:(id)a3 inBagContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLBagForContext:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "urlIsTrusted:", v6);
  return (char)v7;
}

+ (id)valueForKey:(id)a3 inBagContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLBagForContext:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_copyGUIDPatternsFromBagBackend
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ISURLBag valueForKey:](self, "valueForKey:", CFSTR("guid-urls"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("regex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v16;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
            v12 = objc_alloc(MEMORY[0x24BDD1798]);
            v13 = (void *)objc_msgSend(v12, "initWithPattern:options:error:", v11, 1, 0, (_QWORD)v15);
            if (v13)
              objc_msgSend(v3, "addObject:", v13);

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v8);
      }

    }
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("/WebObjects/MZ(Buy|Finance|FastFinance)[.]woa/"), 1, 0);
    if (v5)
      objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyGUIDSchemesFromBagBackend
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[ISURLBag valueForKey:](self, "valueForKey:", CFSTR("guid-urls"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("schemes"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    v5 = v4;

    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("https"), 0);
    if (!v5)
    {
LABEL_8:
      v6 = 0;
      goto LABEL_9;
    }
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v5);
LABEL_9:

  return v6;
}

- (id)_copyHeaderPatternsFromBagBackend
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[ISURLBag valueForKey:](self, "valueForKey:", CFSTR("send-content-restrictions-header"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          v12 = objc_alloc(MEMORY[0x24BDD1798]);
          v13 = (void *)objc_msgSend(v12, "initWithPattern:options:error:", v11, 1, 0, (_QWORD)v15);
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("X-Apple-Restrictions"));

  }
  if (!objc_msgSend(v3, "count"))
  {

    return 0;
  }
  return v3;
}

- (id)_networkConstraintsCachePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v3, CFSTR("com.apple.iTunesStore"), CFSTR("network-constraints.plist"), 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_preprocessURLResolutionCacheDictionary:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("p2-url-resolution"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  v25 = v3;
  obj = v4;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("p2-url-section-name"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ((objc_msgSend(v10, "isEqualToString:", CFSTR("AppleMusicSubscriber")) & 1) != 0
             || (objc_msgSend(v10, "isEqualToString:", CFSTR("AppleMusicUndecided")) & 1) != 0
             || (objc_msgSend(v10, "isEqualToString:", CFSTR("AppleMusicDisabled")) & 1) != 0))
          {

            v12 = CFSTR("AppleMusicSubscriber");
            v11 = CFSTR("AppleMusicUndecided");
            v13 = CFSTR("AppleMusicDisabled");
            v4 = obj;
            goto LABEL_17;
          }

        }
      }
      v4 = obj;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v6)
        continue;
      break;
    }
    v11 = CFSTR("Music");
    v12 = CFSTR("Music");
    v13 = CFSTR("MusicNS");
  }
  else
  {
    v11 = CFSTR("Music");
    v13 = CFSTR("MusicNS");
    v12 = CFSTR("Music");
  }
LABEL_17:

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", v12, v11, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (CFPreferencesGetAppBooleanValue(CFSTR("UserRequestedSubscriptionHidden"), CFSTR("com.apple.mobileipod"), 0))
  {
    objc_msgSend(v14, "removeObject:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB2088], "sharedCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastKnownStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "accountStatus") != 3 && objc_msgSend(v16, "accountStatus") != 4)
      v12 = v11;
    objc_msgSend(v14, "removeObject:", v12);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(v4, "mutableCopy");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = v4;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v22, "objectForKey:", CFSTR("p2-url-section-name"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "containsObject:", v23))
              objc_msgSend(v27, "removeObject:", v22);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v19);
    }

    v24 = objc_msgSend(v27, "count");
    v3 = v25;
    if (v24 != objc_msgSend(v17, "count"))
      objc_msgSend(v25, "setObject:forKey:", v27, CFSTR("p2-url-resolution"));

    v4 = obj;
  }

}

- (void)_setBagBackendWithDictionary:(id)a3
{
  void *v4;
  ISURLBagBackend *bagBackend;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F70]), "initWithDictionary:", v7);
    bagBackend = self->_bagBackend;
    objc_msgSend(v4, "dictionaryByEvaluatingConditions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISURLBagBackend addBagValues:forBagWithKey:](bagBackend, "addBagValues:forBagWithKey:", v6, self->_bagBackendKey);

  }
  else
  {
    -[ISURLBagBackend removeBagValuesForBagWithKey:](self->_bagBackend, "removeBagValuesForBagWithKey:", self->_bagBackendKey);
  }

}

- (void)_writeNetworkConstraintsCacheFile
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[ISURLBag _networkConstraintsCachePath](self, "_networkConstraintsCachePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1580]);
    -[ISURLBag valueForKey:](self, "valueForKey:", CFSTR("mobile-connection-type-allows"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
      objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);
      goto LABEL_19;
    }
    objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD0C98]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "timeIntervalSinceNow");
      if (v8 >= -86400.0)
      {
LABEL_17:

LABEL_19:
        goto LABEL_20;
      }
    }
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v5, 200, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

    objc_msgSend(v9, "writeToFile:options:error:", v3, 0, 0);
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      v13 &= 2u;
    if (v13)
    {
      *(_DWORD *)v18 = 138412546;
      *(_QWORD *)&v18[4] = objc_opt_class();
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v3;
      v15 = *(id *)&v18[4];
      LODWORD(v17) = 22;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, v18, v17, *(_OWORD *)v18, *(_QWORD *)&v18[16]);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog();
    }

    goto LABEL_16;
  }
LABEL_20:

}

- (void)_writeURLResolutionCacheFile
{
  id v3;
  uint64_t i;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  for (i = 0; i != 11; ++i)
  {
    v5 = kURLResolutionKeys[i];
    -[ISURLBag valueForKey:](self, "valueForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v3, "setObject:forKey:", v6, v5);

  }
  -[ISURLBag _preprocessURLResolutionCacheDictionary:](self, "_preprocessURLResolutionCacheDictionary:", v3);
  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Caches/com.apple.itunesstored/url-resolution.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    if ((objc_msgSend(v8, "removeItemAtPath:error:", v7, 0) & 1) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  objc_msgSend(v8, "attributesOfItemAtPath:error:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD0C98]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_msgSend(v10, "timeIntervalSinceNow"), v11 >= -60.0)
    || (v12 = (void *)MEMORY[0x24BDD1580],
        objc_msgSend(v7, "stringByDeletingLastPathComponent"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v12) = objc_msgSend(v12, "ensureDirectoryExists:", v13),
        v13,
        !(_DWORD)v12))
  {

    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v24) = objc_msgSend(v14, "writeToFile:options:error:", v7, 0, 0);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v15, "shouldLog");
  if (objc_msgSend(v15, "shouldLogToDisk"))
    v17 = v16 | 2;
  else
    v17 = v16;
  objc_msgSend(v15, "OSLogObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    v19 = v17;
  else
    v19 = v17 & 2;
  if (v19)
  {
    LODWORD(v25) = 138412290;
    *(_QWORD *)((char *)&v25 + 4) = objc_opt_class();
    v20 = *(id *)((char *)&v25 + 4);
    LODWORD(v24) = 12;
    v21 = (void *)_os_log_send_and_compose_impl();

    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v25, v24, v25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      free(v21);
      SSFileLog();

    }
  }
  else
  {

  }
  if (HIDWORD(v24))
  {
LABEL_22:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.itunesstored.changed-url-resolution"), 0, 0, 1u);
  }
LABEL_23:

}

- (double)invalidationTime
{
  return self->_invalidationTime;
}

- (BOOL)loadedFromDiskCache
{
  return self->_loadedFromDiskCache;
}

- (void)setLoadedFromDiskCache:(BOOL)a3
{
  self->_loadedFromDiskCache = a3;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)bagBackendKey
{
  return self->_bagBackendKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_headerPatterns, 0);
  objc_storeStrong((id *)&self->_guidSchemes, 0);
  objc_storeStrong((id *)&self->_guidPatterns, 0);
  objc_storeStrong((id *)&self->_bagBackendKey, 0);
  objc_storeStrong((id *)&self->_bagBackend, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
