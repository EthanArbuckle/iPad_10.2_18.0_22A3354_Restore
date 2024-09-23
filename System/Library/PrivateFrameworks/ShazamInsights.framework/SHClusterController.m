@implementation SHClusterController

- (SHClusterController)initWithDataStore:(id)a3
{
  id v5;
  SHClusterController *v6;
  SHClusterController *v7;
  SHClusterStatementRunner *v8;
  void *v9;
  uint64_t v10;
  SHClusterStatementRunner *query;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SHClusterController;
  v6 = -[SHClusterController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataStore, a3);
    v8 = [SHClusterStatementRunner alloc];
    -[SHClusterSQLiteDataStore databaseFilePathURL](v7->_dataStore, "databaseFilePathURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SHClusterStatementRunner initWithDatabaseURL:](v8, "initWithDatabaseURL:", v9);
    query = v7->_query;
    v7->_query = (SHClusterStatementRunner *)v10;

  }
  return v7;
}

- (void)mediaItemsSimilarToValue:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, id);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, id))a5;
  -[SHClusterController dataStore](self, "dataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "loadStatus");

  if (v13 == 1)
  {
    -[SHClusterController query](self, "query");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v14, "mediaItemsSimilarToMediaItemValue:forKey:error:", v8, v9, &v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v19;

    objc_msgSend(v15, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v17, v16);

  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 200, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v18);

  }
}

- (void)mediaItemsForPropertyCollection:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  -[SHClusterController dataStore](self, "dataStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "loadStatus");

  if (v10 == 1)
  {
    -[SHClusterController query](self, "query");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v11, "mediaItemsFromPropertyCollection:error:", v6, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;

    objc_msgSend(v12, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v14, v13);

  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 200, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v15);

  }
}

- (void)resultsFromQueryBlock:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void (**v12)(void);

  v12 = (void (**)(void))a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[SHClusterController dataStore](self, "dataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "loadStatus");

  if (v9 == 1)
  {
    v12[2]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11, 0);

    v6 = (void (**)(id, uint64_t, _QWORD))v11;
  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 200, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v10);
  }

}

- (void)affinityGroupsFromQueryCollection:(id)a3 filteredBySeedCollection:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  SHClusterStatementRunner *v13;
  void *v14;
  void *v15;
  SHClusterStatementRunner *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  -[SHClusterController dataStore](self, "dataStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "loadStatus");

  if (v12 == 1)
  {
    v13 = [SHClusterStatementRunner alloc];
    -[SHClusterController dataStore](self, "dataStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "databaseFilePathURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SHClusterStatementRunner initWithDatabaseURL:](v13, "initWithDatabaseURL:", v15);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHClusterController affinityGroupsAtCohesionLevel:forQuery:queryCollection:filteredBy:](self, "affinityGroupsAtCohesionLevel:forQuery:queryCollection:filteredBy:", 1, v16, v23, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v17, "addObject:", v18);
    -[SHClusterController filterQueryCollection:byItemsWithinCluster:](self, "filterQueryCollection:byItemsWithinCluster:", v23, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHClusterController affinityGroupsAtCohesionLevel:forQuery:queryCollection:filteredBy:](self, "affinityGroupsAtCohesionLevel:forQuery:queryCollection:filteredBy:", 2, v16, v19, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v17, "addObject:", v20);
    -[SHClusterController filterQueryCollection:byItemsWithinCluster:](self, "filterQueryCollection:byItemsWithinCluster:", v19, v20);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    -[SHClusterController affinityGroupsAtCohesionLevel:forQuery:queryCollection:filteredBy:](self, "affinityGroupsAtCohesionLevel:forQuery:queryCollection:filteredBy:", 3, v16, v23, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v17, "addObject:", v21);
    v22 = (void *)objc_msgSend(v17, "copy");
    v9[2](v9, v22, 0);

  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 200, 0);
    v16 = (SHClusterStatementRunner *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, SHClusterStatementRunner *))v9)[2](v9, 0, v16);
    v17 = v9;
  }

}

- (id)filterQueryCollection:(id)a3 byItemsWithinCluster:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  SHMediaItemPropertyCollection *v15;
  void *v16;
  void *v17;
  void *v18;
  SHMediaItemPropertyCollection *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "collection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "mediaItems", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13), "appleMusicID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v15 = [SHMediaItemPropertyCollection alloc];
  v16 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "property");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SHMediaItemPropertyCollection initWithArray:representingProperty:](v15, "initWithArray:representingProperty:", v17, v18);

  return v19;
}

- (id)affinityGroupsAtCohesionLevel:(int64_t)a3 forQuery:(id)a4 queryCollection:(id)a5 filteredBy:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SHAffinityGroup *v16;
  void *v17;
  void *v18;
  SHAffinityGroup *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "collection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(v10, "mediaItemsAtCohesionLevel:forQueryMediaIDs:filteredBySeedMediaIDs:error:", a3, v11, v12, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      v16 = [SHAffinityGroup alloc];
      -[SHClusterController dataStore](self, "dataStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dataStatus");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SHAffinityGroup initWithType:cohesionLevel:](v16, "initWithType:cohesionLevel:", objc_msgSend(v18, "clusterType"), a3);

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v15, "allObjects", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v27;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v27 != v23)
              objc_enumerationMutation(v20);
            -[SHAffinityGroup appendMediaItem:](v19, "appendMediaItem:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v24++));
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v22);
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)artistClusterDefaultLocationURL
{
  return (id)objc_msgSend(a1, "databaseURLForName:", CFSTR("artists"));
}

+ (id)trackClusterDefaultLocationURL
{
  return (id)objc_msgSend(a1, "databaseURLForName:", CFSTR("tracks"));
}

+ (id)databaseURLForName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[SHClusterImporterUtils cachesDirectory](SHClusterImporterUtils, "cachesDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("db"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SHClusterStatementRunner)query
{
  return self->_query;
}

- (SHClusterSQLiteDataStore)dataStore
{
  return self->_dataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
