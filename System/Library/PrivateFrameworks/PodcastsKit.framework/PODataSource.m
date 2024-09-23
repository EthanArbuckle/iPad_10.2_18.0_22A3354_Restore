@implementation PODataSource

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__PODataSource_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_predicate != -1)
    dispatch_once(&sharedInstance_predicate, block);
  return (id)sharedInstance_sharedInstance;
}

void __30__PODataSource_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (PODataSource)init
{
  return -[PODataSource initWithPlistPath:](self, "initWithPlistPath:", 0);
}

- (PODataSource)initWithPlistPath:(id)a3
{
  id v4;
  PODataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  PODataSource *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PODataSource;
  v5 = -[PODataSource init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PODataSource setPodcastCollectionsByUUID:](v5, "setPodcastCollectionsByUUID:", v6);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PODataSource setPodcastStationsByUUID:](v5, "setPodcastStationsByUUID:", v7);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PODataSource setPodcastRevisions:](v5, "setPodcastRevisions:", v8);

    -[PODataSource setPlistBasePath:](v5, "setPlistBasePath:", v4);
    -[PODataSource initializeDataFromDictionary](v5, "initializeDataFromDictionary");
  }
  POLogInitIfNeeded();
  if (POLogContextSync)
    v9 = POLogContextSync;
  else
    v9 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_22FB0C000, v9, OS_LOG_TYPE_INFO, "Data source is %@", buf, 0xCu);
  }

  return v5;
}

- (id)arrayFromPlistURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, 0, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (!v8)
    {
      v9 = 0;
      if (v7)
        goto LABEL_14;
    }
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  POLogInitIfNeeded();
  if (POLogContextSync)
    v10 = POLogContextSync;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[PODataSource arrayFromPlistURL:].cold.2();
  _MTLogCategorySiri();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[PODataSource arrayFromPlistURL:].cold.1();

  v9 = v8;
LABEL_14:

  return v7;
}

- (BOOL)isPodcastsInstalled
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.podcasts"), 0, &v6);
  v3 = v6;
  if (v3)
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v4 = POLogContextSync;
    else
      v4 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_22FB0C000, v4, OS_LOG_TYPE_INFO, "Could not load application record. If the Podcasts app is actually installed, this represents an error: %@.", buf, 0xCu);
    }
  }

  return v2 != 0;
}

- (void)getURLs:(id)a3
{
  void (**v4)(id, void *, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, void *, void *, _QWORD);

  v4 = (void (**)(id, void *, void *, _QWORD))a3;
  -[PODataSource plistBasePath](self, "plistBasePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PODataSource plistBasePath](self, "plistBasePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("PodcastsDB.plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PODataSource plistBasePath](self, "plistBasePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("PodcastsDiff.plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v7, v9, 0);
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __24__PODataSource_getURLs___block_invoke;
    v10[3] = &unk_24FD62BA0;
    v11 = v4;
    -[PODataSource getContainerURL:](self, "getContainerURL:", v10);

  }
}

void __24__PODataSource_getURLs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Documents/PodcastsDB.plist"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Documents/PodcastsDiff.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getDatabaseURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__PODataSource_getDatabaseURL___block_invoke;
  v6[3] = &unk_24FD62BC8;
  v7 = v4;
  v5 = v4;
  -[PODataSource getURLs:](self, "getURLs:", v6);

}

uint64_t __31__PODataSource_getDatabaseURL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getRevisionURL:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__PODataSource_getRevisionURL___block_invoke;
  v6[3] = &unk_24FD62BC8;
  v7 = v4;
  v5 = v4;
  -[PODataSource getURLs:](self, "getURLs:", v6);

}

uint64_t __31__PODataSource_getRevisionURL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getContainerURL:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t path;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, _QWORD, void *))a3;
  if (v3)
  {
    v4 = container_query_create();
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    v5 = xpc_string_create("com.apple.podcasts");
    container_query_set_identifiers();
    if (!container_query_get_single_result())
    {
      if (container_query_get_last_error() && (v17 = container_error_copy_unlocalized_description()) != 0)
      {
        v18 = (void *)v17;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v17);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
        {
          v29 = *MEMORY[0x24BDD0BA0];
          v30[0] = v19;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }
        free(v18);
      }
      else
      {
        v20 = 0;
        v21 = 0;
      }
      _MTLogCategorySiri();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v27 = 138412290;
        v28 = (uint64_t)v20;
        _os_log_impl(&dword_22FB0C000, v25, OS_LOG_TYPE_INFO, "We could not access the podcasts container. This probably means the app isn't installed. Description: '%@'", (uint8_t *)&v27, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PODataSourceErrorDomain"), 1, v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, 0, v26);

      goto LABEL_39;
    }
    v6 = container_copy_sandbox_token();
    if (!v6)
      goto LABEL_9;
    v7 = (void *)v6;
    v8 = sandbox_extension_consume();
    _MTLogCategorySiri();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v27 = 134217984;
      v28 = v8;
      _os_log_impl(&dword_22FB0C000, v9, OS_LOG_TYPE_INFO, "Consumed sandbox token and received handle %lli", (uint8_t *)&v27, 0xCu);
    }

    free(v7);
    if (v8)
    {
      path = container_get_path();
      if (v8 == -1)
      {
        _MTLogCategorySiri();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_22FB0C000, v23, OS_LOG_TYPE_ERROR, "Something went wrong with getting the sandbox extension.", (uint8_t *)&v27, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PODataSourceErrorDomain"), 2, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v3[2](v3, 0, v24);

        if (!v4)
          goto LABEL_39;
LABEL_29:
        container_query_free();
LABEL_39:

        goto LABEL_40;
      }
      v11 = path;
    }
    else
    {
LABEL_9:
      _MTLogCategorySiri();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_22FB0C000, v12, OS_LOG_TYPE_INFO, "Handle is 0. Maybe we were not issued a token, the app is not sandboxed, or this extension is not needed to access the container.", (uint8_t *)&v27, 2u);
      }

      v11 = container_get_path();
      v8 = 0;
    }
    _MTLogCategorySiri();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v14)
      {
        v27 = 136315138;
        v28 = v11;
        _os_log_impl(&dword_22FB0C000, v13, OS_LOG_TYPE_INFO, "Found container path %s", (uint8_t *)&v27, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v3)[2](v3, v16, 0);

    }
    else
    {
      if (v14)
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_22FB0C000, v13, OS_LOG_TYPE_INFO, "We could not access the podcasts container. This probably means the app isn't installed.", (uint8_t *)&v27, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PODataSourceErrorDomain"), 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, 0, v15);
    }

    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      _MTLogCategorySiri();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v27 = 134217984;
        v28 = v8;
        _os_log_impl(&dword_22FB0C000, v22, OS_LOG_TYPE_INFO, "Releasing sandbox extension %lli", (uint8_t *)&v27, 0xCu);
      }

      sandbox_extension_release();
    }
    if (!v4)
      goto LABEL_39;
    goto LABEL_29;
  }
LABEL_40:

}

- (BOOL)isPodcastRevisionDataStale
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__PODataSource_isPodcastRevisionDataStale__block_invoke;
  v4[3] = &unk_24FD62BF0;
  v4[4] = self;
  v4[5] = &v5;
  -[PODataSource getRevisionURL:](self, "getRevisionURL:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __42__PODataSource_isPodcastRevisionDataStale__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributesOfItemAtPath:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileModificationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "revisionsDataPlistLastModified");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v10, "isEqual:", v11) ^ 1;

  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v12 = POLogContextSync;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __42__PODataSource_isPodcastRevisionDataStale__block_invoke_cold_1();
  }

}

- (BOOL)isPodcastDataStale
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__PODataSource_isPodcastDataStale__block_invoke;
  v4[3] = &unk_24FD62BF0;
  v4[4] = self;
  v4[5] = &v5;
  -[PODataSource getDatabaseURL:](self, "getDatabaseURL:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__PODataSource_isPodcastDataStale__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributesOfItemAtPath:error:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileModificationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "podcastDataPlistLastModified");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v10, "isEqual:", v11) ^ 1;

  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v12 = POLogContextSync;
    else
      v12 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __34__PODataSource_isPodcastDataStale__block_invoke_cold_1();
  }

}

- (NSMutableDictionary)podcastCollectionsByUUID
{
  NSMutableDictionary *v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = self->_podcastCollectionsByUUID;
  objc_sync_enter(v3);
  if (-[PODataSource isPodcastDataStale](self, "isPodcastDataStale")
    && !-[PODataSource constructingData](self, "constructingData"))
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v4 = POLogContextSync;
    else
      v4 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22FB0C000, v4, OS_LOG_TYPE_INFO, "Podcast data is stale, going to reinitialize from plist.", v6, 2u);
    }
    -[PODataSource initializeDataFromDictionary](self, "initializeDataFromDictionary");
  }
  objc_sync_exit(v3);

  return self->_podcastCollectionsByUUID;
}

- (NSMutableDictionary)podcastStationsByUUID
{
  NSMutableDictionary *v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = self->_podcastStationsByUUID;
  objc_sync_enter(v3);
  if (-[PODataSource isPodcastDataStale](self, "isPodcastDataStale")
    && !-[PODataSource constructingData](self, "constructingData"))
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v4 = POLogContextSync;
    else
      v4 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22FB0C000, v4, OS_LOG_TYPE_INFO, "Podcast data is stale, going to reinitialize from plist.", v6, 2u);
    }
    -[PODataSource initializeDataFromDictionary](self, "initializeDataFromDictionary");
  }
  objc_sync_exit(v3);

  return self->_podcastStationsByUUID;
}

- (id)validity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PODataSource databaseUUID](self, "databaseUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PODataSource firstRevisionUUID](self, "firstRevisionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableArray)podcastRevisions
{
  NSMutableArray *v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = self->_podcastRevisions;
  objc_sync_enter(v3);
  if (-[PODataSource isPodcastRevisionDataStale](self, "isPodcastRevisionDataStale")
    && !-[PODataSource constructingData](self, "constructingData"))
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v4 = POLogContextSync;
    else
      v4 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22FB0C000, v4, OS_LOG_TYPE_INFO, "Podcast revision data is stale, going to reinitialize from plist.", v6, 2u);
    }
    -[PODataSource initializeDataFromDictionary](self, "initializeDataFromDictionary");
  }
  objc_sync_exit(v3);

  return self->_podcastRevisions;
}

- (void)initializeDataFromDictionary
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_4(&dword_22FB0C000, a1, a3, "Recursive call to initializeData while constructing. This is a programming error.  Please fix.", v3);
}

void __44__PODataSource_initializeDataFromDictionary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;

  v7 = a4;
  if (v7)
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v8 = POLogContextSync;
    else
      v8 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __44__PODataSource_initializeDataFromDictionary__block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_withExtensionParseDataDictionary:revisionDictionary:", a2, a3);
  }

}

- (void)_withExtensionParseDataDictionary:(id)a3 revisionDictionary:(id)a4
{
  NSMutableArray *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSMutableArray *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSMutableArray *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t i;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  NSMutableArray *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSMutableArray *podcastRevisions;
  NSMutableArray *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  PODataSource *v67;
  uint8_t v68;
  char v69[15];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[128];
  uint8_t buf[4];
  NSMutableArray *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v6 = (NSMutableArray *)a3;
  v7 = a4;
  -[PODataSource arrayFromPlistURL:](self, "arrayFromPlistURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PODataSource arrayFromPlistURL:](self, "arrayFromPlistURL:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  POLogInitIfNeeded();
  if (POLogContextSync)
    v10 = POLogContextSync;
  else
    v10 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v76 = v6;
    _os_log_impl(&dword_22FB0C000, v10, OS_LOG_TYPE_INFO, "Constructing data source from %@", buf, 0xCu);
  }
  v67 = self;
  if (!v8)
    goto LABEL_38;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("children"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    POLogInitIfNeeded();
    if (POLogContextSync)
      v31 = POLogContextSync;
    else
      v31 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[PODataSource _withExtensionParseDataDictionary:revisionDictionary:].cold.3();
    goto LABEL_20;
  }
  if (objc_msgSend(v12, "count") == 2)
  {
    v60 = v9;
    v62 = v8;
    v64 = v7;
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("children"));
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("children"));
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)v15;
    -[PODataSource constructModelObjectsFromDictionaries:withIndexPath:modelObjectClass:](self, "constructModelObjectsFromDictionaries:withIndexPath:modelObjectClass:", v15, v18, objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary removeAllObjects](self->_podcastCollectionsByUUID, "removeAllObjects");
    -[NSMutableDictionary addEntriesFromDictionary:](self->_podcastCollectionsByUUID, "addEntriesFromDictionary:", v19);
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)v17;
    -[PODataSource constructModelObjectsFromDictionaries:withIndexPath:modelObjectClass:](self, "constructModelObjectsFromDictionaries:withIndexPath:modelObjectClass:", v17, v20, objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary removeAllObjects](self->_podcastStationsByUUID, "removeAllObjects");
    -[NSMutableDictionary addEntriesFromDictionary:](self->_podcastStationsByUUID, "addEntriesFromDictionary:", v22);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v6;
    -[NSMutableArray path](v6, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "attributesOfItemAtPath:error:", v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fileModificationDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PODataSource setPodcastDataPlistLastModified:](v67, "setPodcastDataPlistLastModified:", v27);

    self = v67;
    POLogInitIfNeeded();
    if (POLogContextSync)
      v28 = POLogContextSync;
    else
      v28 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = v28;
      -[PODataSource podcastDataPlistLastModified](v67, "podcastDataPlistLastModified");
      v30 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v76 = v30;
      _os_log_impl(&dword_22FB0C000, v29, OS_LOG_TYPE_INFO, "Podcast data last modified is %@", buf, 0xCu);

    }
    v6 = v24;
    v8 = v62;
    v7 = v64;
    v9 = v60;
LABEL_20:
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("uuid"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      -[PODataSource setDatabaseUUID:](self, "setDatabaseUUID:", v32);
      POLogInitIfNeeded();
      if (POLogContextSync)
        v33 = POLogContextSync;
      else
        v33 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = v33;
        -[PODataSource databaseUUID](self, "databaseUUID");
        v35 = v9;
        v36 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v76 = v36;
        _os_log_impl(&dword_22FB0C000, v34, OS_LOG_TYPE_INFO, "Database UUID is %@", buf, 0xCu);

        v9 = v35;
        self = v67;

      }
    }
    else
    {
      POLogInitIfNeeded();
      if (POLogContextSync)
        v38 = POLogContextSync;
      else
        v38 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[PODataSource _withExtensionParseDataDictionary:revisionDictionary:].cold.2();
    }

LABEL_38:
    if (v9)
    {
      v63 = v8;
      v65 = v7;
      v59 = v6;
      -[NSMutableArray removeAllObjects](self->_podcastRevisions, "removeAllObjects");
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v61 = v9;
      v39 = v9;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v71;
        v43 = 1;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v71 != v42)
              objc_enumerationMutation(v39);
            v45 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
            if ((v43 & 1) != 0)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("uuid"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (v46)
              {
                -[PODataSource setFirstRevisionUUID:](self, "setFirstRevisionUUID:", v46);
                POLogInitIfNeeded();
                if (POLogContextSync)
                  v47 = POLogContextSync;
                else
                  v47 = MEMORY[0x24BDACB70];
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  v48 = v47;
                  -[PODataSource firstRevisionUUID](v67, "firstRevisionUUID");
                  v49 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v76 = v49;
                  _os_log_impl(&dword_22FB0C000, v48, OS_LOG_TYPE_INFO, "First Revision UUID is %@", buf, 0xCu);

                }
              }
              else
              {
                POLogInitIfNeeded();
                if (POLogContextSync)
                  v50 = POLogContextSync;
                else
                  v50 = MEMORY[0x24BDACB70];
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  -[PODataSource _withExtensionParseDataDictionary:revisionDictionary:].cold.1(&v68, v69, v50);
              }

              self = v67;
            }
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("podcasts"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
              -[PODataSource constructRevisionsFromDictionary:isPodcastCollections:](self, "constructRevisionsFromDictionary:isPodcastCollections:", v51, 1);
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("stations"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (v52)
              -[PODataSource constructRevisionsFromDictionary:isPodcastCollections:](self, "constructRevisionsFromDictionary:isPodcastCollections:", v52, 0);

            v43 = 0;
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
          v43 = 0;
        }
        while (v41);
      }

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v65;
      objc_msgSend(v65, "path");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "attributesOfItemAtPath:error:", v54, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "fileModificationDate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[PODataSource setRevisionsDataPlistLastModified:](self, "setRevisionsDataPlistLastModified:", v56);

      POLogInitIfNeeded();
      if (POLogContextSync)
        v57 = POLogContextSync;
      else
        v57 = MEMORY[0x24BDACB70];
      v6 = v59;
      v9 = v61;
      v8 = v63;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        podcastRevisions = self->_podcastRevisions;
        *(_DWORD *)buf = 138412290;
        v76 = podcastRevisions;
        _os_log_impl(&dword_22FB0C000, v57, OS_LOG_TYPE_INFO, "Podcast revisions are %@", buf, 0xCu);
      }
    }
    goto LABEL_68;
  }
  POLogInitIfNeeded();
  if (POLogContextSync)
    v37 = POLogContextSync;
  else
    v37 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    -[PODataSource _withExtensionParseDataDictionary:revisionDictionary:].cold.4();

LABEL_68:
}

- (void)constructRevisionsFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const __CFString *v27;
  uint64_t v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inserted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        -[PODataSource constructRevisionFromDictionary:isPodcastCollections:isDelete:](self, "constructRevisionFromDictionary:isPodcastCollections:isDelete:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v11++), v4, 0);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deleted"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16);
        v27 = CFSTR("uuid");
        v28 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PODataSource constructRevisionFromDictionary:isPodcastCollections:isDelete:](self, "constructRevisionFromDictionary:isPodcastCollections:isDelete:", v18, v4, 1);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v14);
  }

}

- (void)constructRevisionFromDictionary:(id)a3 isPodcastCollections:(BOOL)a4 isDelete:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setRevisionID:", -[NSMutableArray count](self->_podcastRevisions, "count"));
  if (v5)
    v9 = 2;
  else
    v9 = 0;
  objc_msgSend(v11, "setRevisionType:", v9);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uuid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObjectID:", v10);
  objc_msgSend(v11, "setIsPodcastCollection:", v6);
  -[NSMutableArray addObject:](self->_podcastRevisions, "addObject:", v11);

}

- (id)constructModelObjectOfClass:(Class)a3 fromDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = objc_alloc_init(a3);
  objc_msgSend(v5, "objectForKey:", CFSTR("uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUuid:", v7);

  objc_msgSend(v5, "objectForKey:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

  objc_msgSend(v5, "objectForKey:", CFSTR("feedUrl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFeedUrl:", v9);

  objc_msgSend(v5, "objectForKey:", CFSTR("storeId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setStoreId:", v10);
  return v6;
}

- (id)constructModelObjectsFromDictionaries:(id)a3 withIndexPath:(id)a4 modelObjectClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(obj);
        -[PODataSource constructModelObjectOfClass:fromDictionary:](self, "constructModelObjectOfClass:fromDictionary:", a5, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "indexPathByAddingIndex:", v13 + v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setIndexPath:", v17);

        objc_msgSend(v16, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v18);

        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v13 += v15;
    }
    while (v12);
  }

  return v10;
}

- (id)podcastModelObjectsInArray:(id)a3 matchingString:(id)a4 maxResults:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
      objc_msgSend(v15, "title", (_QWORD)v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "rangeOfString:options:", v8, 1);

      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v9, "addObject:", v15);
      if (a5 >= 1 && objc_msgSend(v9, "count") == a5)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

  return v9;
}

- (id)podcastCollectionsMatchingString:(id)a3 maxResults:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PODataSource podcastCollections](self, "podcastCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PODataSource podcastModelObjectsInArray:matchingString:maxResults:](self, "podcastModelObjectsInArray:matchingString:maxResults:", v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)podcastStationsMatchingString:(id)a3 maxResults:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PODataSource podcastStations](self, "podcastStations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PODataSource podcastModelObjectsInArray:matchingString:maxResults:](self, "podcastModelObjectsInArray:matchingString:maxResults:", v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)podcastCollectionWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PODataSource podcastCollectionsByUUID](self, "podcastCollectionsByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)podcastCollections
{
  void *v2;
  void *v3;

  -[PODataSource podcastCollectionsByUUID](self, "podcastCollectionsByUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)podcastStationWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PODataSource podcastStationsByUUID](self, "podcastStationsByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)podcastStations
{
  void *v2;
  void *v3;

  -[PODataSource podcastStationsByUUID](self, "podcastStationsByUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)podcastRevisionsSinceAnchor:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PODataSource podcastRevisions](self, "podcastRevisions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "revisionID") >= a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)domainObjectWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PODataSource podcastCollectionsByUUID](self, "podcastCollectionsByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PODataSource podcastStationsByUUID](self, "podcastStationsByUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "SAMPCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)podcastsIndexPath
{
  return (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PODataSource podcastCollectionsByUUID](self, "podcastCollectionsByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PODataSource podcastStationsByUUID](self, "podcastStationsByUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%p) podcast collections: %@, podcast stations: %@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setPodcastCollectionsByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_podcastCollectionsByUUID, a3);
}

- (void)setPodcastStationsByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_podcastStationsByUUID, a3);
}

- (void)setPodcastRevisions:(id)a3
{
  objc_storeStrong((id *)&self->_podcastRevisions, a3);
}

- (NSString)databaseUUID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDatabaseUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)firstRevisionUUID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFirstRevisionUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)podcastDataPlistLastModified
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPodcastDataPlistLastModified:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)revisionsDataPlistLastModified
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRevisionsDataPlistLastModified:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)constructingData
{
  return self->_constructingData;
}

- (void)setConstructingData:(BOOL)a3
{
  self->_constructingData = a3;
}

- (NSURL)plistBasePath
{
  return self->_plistBasePath;
}

- (void)setPlistBasePath:(id)a3
{
  objc_storeStrong((id *)&self->_plistBasePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistBasePath, 0);
  objc_storeStrong((id *)&self->_revisionsDataPlistLastModified, 0);
  objc_storeStrong((id *)&self->_podcastDataPlistLastModified, 0);
  objc_storeStrong((id *)&self->_firstRevisionUUID, 0);
  objc_storeStrong((id *)&self->_databaseUUID, 0);
  objc_storeStrong((id *)&self->_podcastRevisions, 0);
  objc_storeStrong((id *)&self->_podcastStationsByUUID, 0);
  objc_storeStrong((id *)&self->_podcastCollectionsByUUID, 0);
}

- (void)arrayFromPlistURL:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_22FB0C000, v0, OS_LOG_TYPE_FAULT, "Error reading plist from path: %@ - with error: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)arrayFromPlistURL:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22FB0C000, v0, OS_LOG_TYPE_ERROR, "Error reading plist at %@: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __42__PODataSource_isPodcastRevisionDataStale__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22FB0C000, v0, v1, "Failed to get revision URL for PODataSource with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __34__PODataSource_isPodcastDataStale__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22FB0C000, v0, v1, "Failed to get database URL for PODataSource with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __44__PODataSource_initializeDataFromDictionary__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22FB0C000, v0, v1, "Failed to get plist URLs for PODataSource with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_withExtensionParseDataDictionary:(NSObject *)a3 revisionDictionary:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_4(&dword_22FB0C000, a3, (uint64_t)a3, "Unable to get UUID for first revision.", a1);
}

- (void)_withExtensionParseDataDictionary:revisionDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22FB0C000, v0, v1, "Unable to get UUID for root object, sync data will not have proper validity.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_withExtensionParseDataDictionary:revisionDictionary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22FB0C000, v0, v1, "Unable to locate root child array.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_withExtensionParseDataDictionary:revisionDictionary:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22FB0C000, v0, v1, "First child's children isn't of length 2.  Dictionary at URL %@ is malformed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
