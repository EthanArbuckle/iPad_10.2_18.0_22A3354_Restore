@implementation SHClusterQuery

+ (id)clusterForType:(int64_t)a3
{
  const char *v3;

  if (a3 == 2)
  {
    objc_msgSend(a1, "artistsCluster");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    objc_msgSend(a1, "tracksCluster");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

+ (id)artistsCluster
{
  if (artistsCluster_onceToken != -1)
    dispatch_once(&artistsCluster_onceToken, &__block_literal_global);
  return (id)artistsCluster_artistCluster;
}

void __32__SHClusterQuery_artistsCluster__block_invoke()
{
  SHClusterQuery *v0;
  void *v1;

  v0 = -[SHClusterQuery initWithType:sourceURL:destinationURL:]([SHClusterQuery alloc], "initWithType:sourceURL:destinationURL:", 2, 0, 0);
  v1 = (void *)artistsCluster_artistCluster;
  artistsCluster_artistCluster = (uint64_t)v0;

}

+ (id)tracksCluster
{
  if (tracksCluster_onceToken != -1)
    dispatch_once(&tracksCluster_onceToken, &__block_literal_global_1);
  return (id)tracksCluster_trackCluster;
}

void __31__SHClusterQuery_tracksCluster__block_invoke()
{
  SHClusterQuery *v0;
  void *v1;

  v0 = -[SHClusterQuery initWithType:sourceURL:destinationURL:]([SHClusterQuery alloc], "initWithType:sourceURL:destinationURL:", 1, 0, 0);
  v1 = (void *)tracksCluster_trackCluster;
  tracksCluster_trackCluster = (uint64_t)v0;

}

- (SHClusterQuery)initWithType:(int64_t)a3 sourceURL:(id)a4 destinationURL:(id)a5
{
  id v9;
  id v10;
  SHClusterQuery *v11;
  SHClusterQuery *v12;
  NSURL *v13;
  NSURL *destinationURL;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SHClusterQuery;
  v11 = -[SHClusterQuery init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceURL, a4);
    if (v10)
    {
      v13 = (NSURL *)v10;
    }
    else if (a3 == 1)
    {
      +[SHClusterController trackClusterDefaultLocationURL](SHClusterController, "trackClusterDefaultLocationURL");
      v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 2)
        goto LABEL_5;
      +[SHClusterController artistClusterDefaultLocationURL](SHClusterController, "artistClusterDefaultLocationURL");
      v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    destinationURL = v12->_destinationURL;
    v12->_destinationURL = v13;

LABEL_5:
    v12->_type = a3;
  }

  return v12;
}

- (void)controllerForType:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  SHClusterLoaderRequest *v7;
  void *v8;
  void *v9;
  SHClusterLoaderRequest *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = [SHClusterLoaderRequest alloc];
  -[SHClusterQuery sourceURL](self, "sourceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHClusterQuery destinationURL](self, "destinationURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SHClusterLoaderRequest initWithType:sourceURL:outputURL:](v7, "initWithType:sourceURL:outputURL:", a3, v8, v9);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__SHClusterQuery_controllerForType_withCompletionHandler___block_invoke;
  v12[3] = &unk_24DCD22E0;
  v13 = v6;
  v11 = v6;
  +[SHClusterLoader loadDataForRequest:completionHandler:](SHClusterLoader, "loadDataForRequest:completionHandler:", v10, v12);

}

void __58__SHClusterQuery_controllerForType_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  SHClusterController *v7;
  id v8;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (v5)
  {
    v7 = -[SHClusterController initWithDataStore:]([SHClusterController alloc], "initWithDataStore:", v5);
    (*(void (**)(uint64_t, SHClusterController *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v6, 0, a3);
  }

}

- (void)filterMediaItemQueryCollection:(id)a3 bySeedCollection:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[SHClusterQuery type](self, "type");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __84__SHClusterQuery_filterMediaItemQueryCollection_bySeedCollection_completionHandler___block_invoke;
  v15[3] = &unk_24DCD2480;
  v17 = v9;
  v18 = v10;
  v16 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[SHClusterQuery controllerForType:withCompletionHandler:](self, "controllerForType:withCompletionHandler:", v11, v15);

}

uint64_t __84__SHClusterQuery_filterMediaItemQueryCollection_bySeedCollection_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "affinityGroupsFromQueryCollection:filteredBySeedCollection:completionHandler:", a1[4], a1[5], a1[6]);
  else
    return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)mediaItemsWithHighCohesionToValue:(id)a3 forProperty:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[SHClusterQuery type](self, "type");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __82__SHClusterQuery_mediaItemsWithHighCohesionToValue_forProperty_completionHandler___block_invoke;
  v15[3] = &unk_24DCD2480;
  v17 = v9;
  v18 = v10;
  v16 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  -[SHClusterQuery controllerForType:withCompletionHandler:](self, "controllerForType:withCompletionHandler:", v11, v15);

}

uint64_t __82__SHClusterQuery_mediaItemsWithHighCohesionToValue_forProperty_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "mediaItemsSimilarToValue:forKey:completionHandler:", a1[4], a1[5], a1[6]);
  else
    return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)mediaItemsMatchingValuesInCollection:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = -[SHClusterQuery type](self, "type");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__SHClusterQuery_mediaItemsMatchingValuesInCollection_completionHandler___block_invoke;
  v11[3] = &unk_24DCD24A8;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[SHClusterQuery controllerForType:withCompletionHandler:](self, "controllerForType:withCompletionHandler:", v8, v11);

}

uint64_t __73__SHClusterQuery_mediaItemsMatchingValuesInCollection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "mediaItemsForPropertyCollection:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)statusWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  SHClusterLoaderRequest *v7;
  SHClusterLoaderRequest *v8;
  _QWORD v9[5];
  SHClusterLoaderRequest *v10;
  id v11;

  v4 = a3;
  -[SHClusterQuery destinationURL](self, "destinationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFileURL");

  if ((v6 & 1) != 0)
  {
    v7 = -[SHClusterLoaderRequest initWithType:]([SHClusterLoaderRequest alloc], "initWithType:", -[SHClusterQuery type](self, "type"));
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__SHClusterQuery_statusWithCompletionHandler___block_invoke;
    v9[3] = &unk_24DCD24F8;
    v10 = v7;
    v11 = v4;
    v9[4] = self;
    v8 = v7;
    -[SHClusterLoaderRequest clusterConfiguration:](v8, "clusterConfiguration:", v9);

  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 200, 0);
    v8 = (SHClusterLoaderRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, SHClusterLoaderRequest *))v4 + 2))(v4, 0, v8);
  }

}

void __46__SHClusterQuery_statusWithCompletionHandler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    if (objc_msgSend(a1[4], "type") == 2)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __46__SHClusterQuery_statusWithCompletionHandler___block_invoke_2;
      v20[3] = &unk_24DCD24D0;
      v21 = a1[5];
      v10 = v8;
      v11 = a1[4];
      v22 = v10;
      v23 = v11;
      v24 = a1[6];
      objc_msgSend(v7, "artistsCachedDataMaxAgeWithCompletionHandler:", v20);

      v12 = v21;
    }
    else
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __46__SHClusterQuery_statusWithCompletionHandler___block_invoke_3;
      v15[3] = &unk_24DCD24D0;
      v16 = a1[5];
      v13 = v8;
      v14 = a1[4];
      v17 = v13;
      v18 = v14;
      v19 = a1[6];
      objc_msgSend(v7, "tracksCachedDataMaxAgeWithCompletionHandler:", v15);

      v12 = v16;
    }

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __46__SHClusterQuery_statusWithCompletionHandler___block_invoke_2(uint64_t a1, double a2)
{
  SHClusterSQLiteDataStore *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  SHClusterSQLiteDataStore *v12;

  v4 = [SHClusterSQLiteDataStore alloc];
  v5 = objc_msgSend(*(id *)(a1 + 32), "type");
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "destinationURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SHClusterSQLiteDataStore initWithClusterType:databaseMaxAge:forStorefront:databaseFilePathURL:](v4, "initWithClusterType:databaseMaxAge:forStorefront:databaseFilePathURL:", v5, v6, v7, a2);

  -[SHClusterSQLiteDataStore dataStatus](v12, "dataStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 200, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = *(_QWORD *)(a1 + 56);
  -[SHClusterSQLiteDataStore dataStatus](v12, "dataStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v11, v9);

}

void __46__SHClusterQuery_statusWithCompletionHandler___block_invoke_3(uint64_t a1, double a2)
{
  SHClusterSQLiteDataStore *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  SHClusterSQLiteDataStore *v12;

  v4 = [SHClusterSQLiteDataStore alloc];
  v5 = objc_msgSend(*(id *)(a1 + 32), "type");
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "destinationURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SHClusterSQLiteDataStore initWithClusterType:databaseMaxAge:forStorefront:databaseFilePathURL:](v4, "initWithClusterType:databaseMaxAge:forStorefront:databaseFilePathURL:", v5, v6, v7, a2);

  -[SHClusterSQLiteDataStore dataStatus](v12, "dataStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 200, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = *(_QWORD *)(a1 + 56);
  -[SHClusterSQLiteDataStore dataStatus](v12, "dataStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v11, v9);

}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end
