@implementation PUJoiningDataSourceManager

- (PUJoiningDataSourceManager)initWithDataSourceManagers:(id)a3
{
  id v5;
  PUJoiningDataSourceManager *v6;
  PUJoiningDataSourceManager *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUJoiningDataSourceManager;
  v6 = -[PUJoiningDataSourceManager init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManagers, a3);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "setDelegate:", v7, (_QWORD)v14);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v10);
    }

    -[PUJoiningDataSourceManager _update](v7, "_update");
  }

  return v7;
}

- (void)_scheduleUpdate
{
  void *v3;
  _QWORD block[4];
  id v5[2];
  id location;

  v3 = (void *)(-[PUJoiningDataSourceManager _currentUpdateID](self, "_currentUpdateID") + 1);
  -[PUJoiningDataSourceManager _setCurrentUpdateId:](self, "_setCurrentUpdateId:", v3);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PUJoiningDataSourceManager__scheduleUpdate__block_invoke;
  block[3] = &unk_1E58A79B8;
  objc_copyWeak(v5, &location);
  v5[1] = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

- (void)_handleScheduledUpdateWithID:(int64_t)a3
{
  if (-[PUJoiningDataSourceManager _currentUpdateID](self, "_currentUpdateID") == a3)
    -[PUJoiningDataSourceManager _update](self, "_update");
}

- (void)_update
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PUJoiningAssetsDataSource *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[PUJoiningDataSourceManager dataSourceManagers](self, "dataSourceManagers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PUJoiningDataSourceManager dataSourceManagers](self, "dataSourceManagers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "assetsDataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12 = -[PUJoiningAssetsDataSource initWithDataSources:]([PUJoiningAssetsDataSource alloc], "initWithDataSources:", v5);
  -[PUAssetsDataSourceManager setAssetsDataSource:](self, "setAssetsDataSource:", v12);

}

- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3
{
  void *v4;
  void *v5;

  -[PUAssetsDataSourceManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetsDataSourceManagerInterestingAssetReferences:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)dataSourceManagers
{
  return self->_dataSourceManagers;
}

- (int64_t)_currentUpdateID
{
  return self->__currentUpdateID;
}

- (void)_setCurrentUpdateId:(int64_t)a3
{
  self->__currentUpdateID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManagers, 0);
}

void __45__PUJoiningDataSourceManager__scheduleUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleScheduledUpdateWithID:", *(_QWORD *)(a1 + 40));

}

@end
