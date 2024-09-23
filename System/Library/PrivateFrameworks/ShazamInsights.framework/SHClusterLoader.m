@implementation SHClusterLoader

+ (void)loadDataForRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__SHClusterLoader_loadDataForRequest_completionHandler___block_invoke;
  v9[3] = &unk_24DCD2308;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "sourceURLWithCompletion:", v9);

}

void __56__SHClusterLoader_loadDataForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  SHClusterSQLiteDataStore *v10;
  uint64_t v11;
  void *v12;
  SHClusterSQLiteDataStore *v13;
  SHClusterLoader *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v7 = a2;
  v8 = a3;
  if (v7)
  {
    +[SHDataFetcherFileInfo dataFetcherForSourceURL:](SHDataFetcherFileInfo, "dataFetcherForSourceURL:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [SHClusterSQLiteDataStore alloc];
    v11 = objc_msgSend(*(id *)(a1 + 32), "type");
    objc_msgSend(*(id *)(a1 + 32), "outputURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SHClusterSQLiteDataStore initWithClusterType:databaseMaxAge:forStorefront:databaseFilePathURL:](v10, "initWithClusterType:databaseMaxAge:forStorefront:databaseFilePathURL:", v11, v8, v12, a4);

    v14 = -[SHClusterLoader initWithDataFetcher:dataStore:]([SHClusterLoader alloc], "initWithDataFetcher:dataStore:", v9, v13);
    v15 = objc_msgSend(*(id *)(a1 + 32), "type");
    v16 = objc_msgSend(*(id *)(a1 + 32), "shouldDeleteExistingDatabaseAtOutputURL") ^ 1;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __56__SHClusterLoader_loadDataForRequest_completionHandler___block_invoke_2;
    v17[3] = &unk_24DCD22E0;
    v18 = *(id *)(a1 + 40);
    -[SHClusterLoader loadFromURL:type:storefront:reuseExistingData:completion:](v14, "loadFromURL:type:storefront:reuseExistingData:completion:", v7, v15, v8, v16, v17);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __56__SHClusterLoader_loadDataForRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v10, "dataStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "loadStatus");

  if (v7 == 1)
  {
    v8 = v10;
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v9 = v5;
  }
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v8, v9);

}

- (SHClusterLoader)initWithDataFetcher:(id)a3 dataStore:(id)a4
{
  id v7;
  id v8;
  SHClusterLoader *v9;
  SHClusterLoader *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHClusterLoader;
  v9 = -[SHClusterLoader init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataFetcher, a3);
    objc_storeStrong((id *)&v10->_dataStore, a4);
  }

  return v10;
}

- (void)loadFromURL:(id)a3 type:(int64_t)a4 storefront:(id)a5 reuseExistingData:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(id, void *, _QWORD);
  _QWORD v25[5];
  id v26;
  id v27[2];
  id buf[2];

  v8 = a6;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  -[SHClusterLoader dataStore](self, "dataStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataStatus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isDataValid");

  if (v17 && v8)
  {
    sh_log_object();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21A508000, v18, OS_LOG_TYPE_DEBUG, "Cluster data already loaded", (uint8_t *)buf, 2u);
    }

    -[SHClusterLoader dataStore](self, "dataStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v19, 0);

  }
  else
  {
    objc_initWeak(buf, self);
    -[SHClusterLoader dataFetcher](self, "dataFetcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHClusterLoader dataStore](self, "dataStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dataStatus");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "uniqueHash");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __76__SHClusterLoader_loadFromURL_type_storefront_reuseExistingData_completion___block_invoke;
    v25[3] = &unk_24DCD2330;
    objc_copyWeak(v27, buf);
    v24 = v14;
    v27[1] = (id)a4;
    v25[4] = self;
    v26 = v24;
    objc_msgSend(v20, "fetchClusterURL:forCurrentStorefront:cachedUniqueHash:completionHandler:", v12, v13, v23, v25);

    objc_destroyWeak(v27);
    objc_destroyWeak(buf);
  }

}

void __76__SHClusterLoader_loadFromURL_type_storefront_reuseExistingData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  SHDataFetcherFileInfo *v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  SHClusterMetadata *v11;
  SHClusterMetadata *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  SHDataFetcherFileInfo *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.ShazamInsightsDataFetcher")))
  {
    v9 = objc_msgSend(v6, "code");

    if (v9 == 100)
    {
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(WeakRetained, "dataStore");
      v11 = (SHClusterMetadata *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, SHClusterMetadata *, _QWORD))(v10 + 16))(v10, v11, 0);
LABEL_18:

      goto LABEL_19;
    }
  }
  else
  {

  }
  if (v5)
  {
    v12 = [SHClusterMetadata alloc];
    v13 = *(_QWORD *)(a1 + 56);
    -[SHDataFetcherFileInfo storefront](v5, "storefront");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHDataFetcherFileInfo uniqueHash](v5, "uniqueHash");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHDataFetcherFileInfo creationDate](v5, "creationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SHClusterMetadata initWithType:storefront:uniqueHash:creationDate:](v12, "initWithType:storefront:uniqueHash:creationDate:", v13, v14, v15, v16);

    if (-[SHDataFetcherFileInfo compressionType](v5, "compressionType"))
    {
      v33 = 0;
      +[SHClusterImporterUtils buildTemporaryClusterURLWithError:](SHClusterImporterUtils, "buildTemporaryClusterURLWithError:", &v33);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v33;
      if (v18
        || (v19 = (void *)MEMORY[0x24BE90528],
            -[SHDataFetcherFileInfo dataFilePathURL](v5, "dataFilePathURL"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = 0,
            v21 = objc_msgSend(v19, "decompressFile:withAlgorithm:toLocation:error:", v20, -[SHDataFetcherFileInfo compressionType](v5, "compressionType"), v17, &v32), v18 = v32, v20, (v21 & 1) == 0))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_17:

        goto LABEL_18;
      }
      v22 = -[SHDataFetcherFileInfo initWithDataURL:]([SHDataFetcherFileInfo alloc], "initWithDataURL:", v17);

      v5 = v22;
    }
    +[SHClusterImporterUtils importerForFile:](SHClusterImporterUtils, "importerForFile:", v5);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "dataStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "databaseFilePathURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v25 = objc_msgSend(v18, "loadDataFromFileInfo:withMetadata:toDestinationURL:error:", v5, v11, v24, &v31);
    v17 = v31;

    if ((v25 & 1) == 0)
    {
      sh_log_object();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v17;
        _os_log_impl(&dword_21A508000, v26, OS_LOG_TYPE_ERROR, "Failed to load the datastore %@", buf, 0xCu);
      }

    }
    v27 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "dataStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v27 + 16))(v27, v28, v17);

    goto LABEL_17;
  }
  v29 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "dataStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v29 + 16))(v29, v30, v6);

LABEL_19:
}

- (SHClusterSQLiteDataStore)dataStore
{
  return self->_dataStore;
}

- (SHDataFetcher)dataFetcher
{
  return self->_dataFetcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFetcher, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
