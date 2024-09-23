@implementation TVRUIUpNextController

- (TVRUIUpNextController)init
{
  TVRUIUpNextController *v2;
  TVRUIUpNextController *v3;
  NSArray *infos;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVRUIUpNextController;
  v2 = -[TVRUIUpNextController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    infos = v2->_infos;
    v2->_infos = (NSArray *)MEMORY[0x24BDBD1A8];

    *(_WORD *)&v3->_shouldPrewarmData = 256;
  }
  return v3;
}

- (TVRCUpNextController)upNextController
{
  TVRCUpNextController *upNextController;
  TVRCUpNextController *v4;
  TVRCUpNextController *v5;

  upNextController = self->_upNextController;
  if (!upNextController)
  {
    v4 = (TVRCUpNextController *)objc_alloc_init(MEMORY[0x24BEB40E8]);
    v5 = self->_upNextController;
    self->_upNextController = v4;

    upNextController = self->_upNextController;
  }
  return upNextController;
}

- (void)setActiveDevice:(id)a3
{
  id v4;
  char v5;
  TVRUIDevice *activeDevice;

  v4 = a3;
  v5 = objc_msgSend(v4, "isEqualToDevice:", self->_activeDevice);
  activeDevice = self->_activeDevice;
  self->_activeDevice = (TVRUIDevice *)v4;

  if ((v5 & 1) == 0)
  {
    -[TVRUIUpNextController setInfos:](self, "setInfos:", MEMORY[0x24BDBD1A8]);
    if (-[TVRUIUpNextController shouldPrewarmData](self, "shouldPrewarmData"))
      -[TVRUIUpNextController refresh](self, "refresh");
  }
}

- (void)setInfos:(id)a3
{
  id v5;
  _QWORD block[5];

  objc_storeStrong((id *)&self->_infos, a3);
  v5 = a3;
  if (-[TVRUIUpNextController shouldPrewarmImages](self, "shouldPrewarmImages"))
    -[TVRUIUpNextController _prewarmImagesAsNeeded](self, "_prewarmImagesAsNeeded");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__TVRUIUpNextController_setInfos___block_invoke;
  block[3] = &unk_24DE2C198;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __34__TVRUIUpNextController_setInfos___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("TVRUIUpNextInfosDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)setNeedsRefresh
{
  -[TVRUIUpNextController setRefreshNeeded:](self, "setRefreshNeeded:", 1);
}

- (void)refreshIfNeeded
{
  _BOOL4 v3;

  if (!-[TVRUIUpNextController isFetchingUpNextInfos](self, "isFetchingUpNextInfos"))
  {
    v3 = -[TVRUIUpNextController isDataStale](self, "isDataStale");
    if (-[TVRUIUpNextController refreshNeeded](self, "refreshNeeded") || v3)
      -[TVRUIUpNextController refresh](self, "refresh");
  }
}

- (void)requestMore
{
  id v3;

  if (!-[TVRUIUpNextController isFetchingUpNextInfos](self, "isFetchingUpNextInfos"))
  {
    if (-[TVRUIUpNextController hasMoreInfo](self, "hasMoreInfo"))
    {
      -[TVRUIUpNextController paginationToken](self, "paginationToken");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[TVRUIUpNextController _remoteFetchUpNextInfosWithPaginationToken:completion:](self, "_remoteFetchUpNextInfosWithPaginationToken:completion:", v3, 0);

    }
  }
}

- (void)refresh
{
  -[TVRUIUpNextController setPaginationToken:](self, "setPaginationToken:", 0);
  -[TVRUIUpNextController _remoteFetchUpNextInfosWithPaginationToken:completion:](self, "_remoteFetchUpNextInfosWithPaginationToken:completion:", 0, 0);
}

+ (double)staleDataTimeInterval
{
  return 300.0;
}

+ (double)refreshVisibleUpNextTimeInterval
{
  return 60.0;
}

+ (double)refreshDelayOnMediaDidChangeTimeInterval
{
  return 2.5;
}

- (BOOL)hasMoreInfo
{
  void *v2;
  BOOL v3;

  -[TVRUIUpNextController paginationToken](self, "paginationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (NSURLSession)urlSession
{
  NSURLSession *urlSession;
  void *v4;
  NSURLSession *v5;
  NSURLSession *v6;

  urlSession = self->_urlSession;
  if (!urlSession)
  {
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHTTPMaximumConnectionsPerHost:", 30);
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v4);
    v5 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    v6 = self->_urlSession;
    self->_urlSession = v5;

    urlSession = self->_urlSession;
  }
  return urlSession;
}

- (NSMutableDictionary)cachedImages
{
  NSMutableDictionary *cachedImages;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  cachedImages = self->_cachedImages;
  if (!cachedImages)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = self->_cachedImages;
    self->_cachedImages = v4;

    cachedImages = self->_cachedImages;
  }
  return cachedImages;
}

- (NSMutableDictionary)pendingImageRequestCompletionHandlers
{
  NSMutableDictionary *pendingImageRequestCompletionHandlers;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  pendingImageRequestCompletionHandlers = self->_pendingImageRequestCompletionHandlers;
  if (!pendingImageRequestCompletionHandlers)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = self->_pendingImageRequestCompletionHandlers;
    self->_pendingImageRequestCompletionHandlers = v4;

    pendingImageRequestCompletionHandlers = self->_pendingImageRequestCompletionHandlers;
  }
  return pendingImageRequestCompletionHandlers;
}

- (BOOL)isDataStale
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  -[TVRUIUpNextController lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIUpNextController lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  +[TVRUIUpNextController staleDataTimeInterval](TVRUIUpNextController, "staleDataTimeInterval");
  return v7 > v8;
}

- (void)_remoteFetchUpNextInfosWithPaginationToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[TVRUIUpNextController activeDevice](self, "activeDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TVRUIUpNextController setIsFetchingUpNextInfos:](self, "setIsFetchingUpNextInfos:", 1);
    objc_initWeak(&location, self);
    -[TVRUIUpNextController activeDevice](self, "activeDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke;
    v11[3] = &unk_24DE2C1E8;
    objc_copyWeak(&v14, &location);
    v12 = v6;
    v13 = v7;
    objc_msgSend(v10, "fetchUpNextInfoWithPaginationToken:completion:", v12, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "setIsFetchingUpNextInfos:", 0);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke_2;
  v14[3] = &unk_24DE2C1C0;
  v15 = v9;
  v16 = v8;
  v17 = a1[4];
  v11 = v8;
  v12 = v9;
  objc_copyWeak(&v20, a1 + 6);
  v18 = v7;
  v19 = a1[5];
  v13 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

  objc_destroyWeak(&v20);
}

void __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = *(_QWORD *)(a1 + 64);
    if (v3)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, MEMORY[0x24BDBD1A8]);
    _TVRUINowPlayingLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke_2_cold_1(v2, v26);
  }
  else
  {
    v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v25 = a1;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x24BEB4150]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = (void *)MEMORY[0x24BDD1620];
            v11 = objc_opt_class();
            v27 = 0;
            objc_msgSend(v10, "unarchivedObjectOfClass:fromData:error:", v11, v9, &v27);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v27;
            v14 = v13;
            if (v12)
              v15 = v13 == 0;
            else
              v15 = 0;
            if (v15)
            {
              -[NSObject addObject:](v26, "addObject:", v12);
            }
            else
            {
              _TVRUINowPlayingLog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v33 = v14;
                _os_log_error_impl(&dword_21B042000, v16, OS_LOG_TYPE_ERROR, "Error unarchiving UpNext info: %{public}@", buf, 0xCu);
              }

            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v6);
    }
    v17 = objc_msgSend(*(id *)(v25 + 48), "length");
    WeakRetained = objc_loadWeakRetained((id *)(v25 + 72));
    v19 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "setPaginationToken:", *(_QWORD *)(v25 + 56));
      objc_msgSend(v19, "setRefreshNeeded:", 0);
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setLastRefreshTimestamp:", v20);

      objc_msgSend(v19, "setHasFetchedInfos:", 1);
      if (v17)
      {
        objc_msgSend(v19, "infos");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "arrayByAddingObjectsFromArray:", v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setInfos:", v22);

      }
      else
      {
        objc_msgSend(v19, "setInfos:", v26);
      }
      objc_msgSend(v19, "infos");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = (void *)MEMORY[0x24BDBD1A8];
    }
    v24 = *(_QWORD *)(v25 + 64);
    if (v24)
      (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v24 + 16))(v24, *(_QWORD *)(v25 + 56), v23, *(_QWORD *)(v25 + 32));

  }
}

- (void)_remoteMarkAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[TVRUIUpNextController activeDevice](self, "activeDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TVRUIUpNextController activeDevice](self, "activeDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke;
    v11[3] = &unk_24DE2C238;
    v12 = v6;
    v13 = v7;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v10, "markAsWatchedWithMediaIdentifier:completion:", v12, v11);

    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);

}

void __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    _TVRUINowPlayingLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke_cold_1();

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke_17;
  block[3] = &unk_24DE2C210;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v10);

}

void __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke_17(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "refresh");

}

- (void)_remoteRemoveItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[TVRUIUpNextController activeDevice](self, "activeDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TVRUIUpNextController activeDevice](self, "activeDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke;
    v11[3] = &unk_24DE2C238;
    v12 = v6;
    v13 = v7;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v10, "removeItemWithMediaIdentifier:completion:", v12, v11);

    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);

}

void __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    _TVRUINowPlayingLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke_cold_1();

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke_21;
  block[3] = &unk_24DE2C210;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v10);

}

void __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke_21(uint64_t a1)
{
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "refresh");

}

- (void)_remotePlayItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TVRUIUpNextController activeDevice](self, "activeDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TVRUIUpNextController activeDevice](self, "activeDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke;
    v11[3] = &unk_24DE2C288;
    v12 = v6;
    v13 = v7;
    objc_msgSend(v10, "playItem:completion:", v12, v11);

  }
}

void __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    _TVRUINowPlayingLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke_cold_1();

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke_24;
  v7[3] = &unk_24DE2C260;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)fetchImageForUpNextInfo:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  objc_msgSend(v6, "mediaInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v9, "length"))
  {
    -[TVRUIUpNextController cachedImages](self, "cachedImages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v7[2](v7, v9, v11);
    }
    else if (-[TVRUIUpNextController hasPendingCompletionHandlersForIdentifier:](self, "hasPendingCompletionHandlersForIdentifier:", v9))
    {
      -[TVRUIUpNextController addPendingCompletionHandler:identifier:](self, "addPendingCompletionHandler:identifier:", v7, v9);
    }
    else
    {
      objc_msgSend(v6, "mediaInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageURLTemplate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        -[TVRUIUpNextController addPendingCompletionHandler:identifier:](self, "addPendingCompletionHandler:identifier:", v7, v9);
        objc_msgSend(MEMORY[0x24BEB40A0], "imageTemplateWithString:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "urlForSize:", 400.0, 225.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        -[TVRUIUpNextController urlSession](self, "urlSession");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __60__TVRUIUpNextController_fetchImageForUpNextInfo_completion___block_invoke;
        v18[3] = &unk_24DE2C2D8;
        objc_copyWeak(&v20, &location);
        v19 = v9;
        objc_msgSend(v15, "dataTaskWithURL:completionHandler:", v14, v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "resume");
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);

      }
      else
      {
        v7[2](v7, v9, 0);
      }

    }
  }
  else
  {
    v7[2](v7, (void *)*MEMORY[0x24BEB4148], 0);
  }

}

void __60__TVRUIUpNextController_fetchImageForUpNextInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__TVRUIUpNextController_fetchImageForUpNextInfo_completion___block_invoke_2;
  block[3] = &unk_24DE2C2B0;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __60__TVRUIUpNextController_fetchImageForUpNextInfo_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", *(_QWORD *)(a1 + 32));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "invokeCompletionHandlersForIdentifier:image:", *(_QWORD *)(a1 + 40), v3);

}

- (void)_prewarmImagesAsNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TVRUIUpNextController infos](self, "infos", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "mediaInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "length"))
        {
          -[TVRUIUpNextController cachedImages](self, "cachedImages");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = -[TVRUIUpNextController hasPendingCompletionHandlersForIdentifier:](self, "hasPendingCompletionHandlersForIdentifier:", v10);
          if (!v12 && !v13)
            -[TVRUIUpNextController fetchImageForUpNextInfo:completion:](self, "fetchImageForUpNextInfo:completion:", v8, &__block_literal_global);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (BOOL)hasPendingCompletionHandlersForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[TVRUIUpNextController pendingImageRequestCompletionHandlers](self, "pendingImageRequestCompletionHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "count") != 0;
  else
    v7 = 0;

  return v7;
}

- (void)addPendingCompletionHandler:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[TVRUIUpNextController pendingImageRequestCompletionHandlers](self, "pendingImageRequestCompletionHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = _Block_copy(v7);
  if (v9)
  {
    objc_msgSend(v9, "arrayByAddingObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[TVRUIUpNextController pendingImageRequestCompletionHandlers](self, "pendingImageRequestCompletionHandlers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v6);

}

- (void)removePendingCompletionHandlersForIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TVRUIUpNextController pendingImageRequestCompletionHandlers](self, "pendingImageRequestCompletionHandlers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)invokeCompletionHandlersForIdentifier:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (v7)
    {
      -[TVRUIUpNextController cachedImages](self, "cachedImages");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

    }
    -[TVRUIUpNextController pendingImageRequestCompletionHandlers](self, "pendingImageRequestCompletionHandlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15) + 16))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15));
            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

    }
    -[TVRUIUpNextController removePendingCompletionHandlersForIdentifier:](self, "removePendingCompletionHandlersForIdentifier:", v6, (_QWORD)v16);

  }
}

- (TVRUIDevice)activeDevice
{
  return self->_activeDevice;
}

- (NSArray)infos
{
  return self->_infos;
}

- (BOOL)hasFetchedInfos
{
  return self->_hasFetchedInfos;
}

- (void)setHasFetchedInfos:(BOOL)a3
{
  self->_hasFetchedInfos = a3;
}

- (void)setUpNextController:(id)a3
{
  objc_storeStrong((id *)&self->_upNextController, a3);
}

- (void)setUrlSession:(id)a3
{
  objc_storeStrong((id *)&self->_urlSession, a3);
}

- (void)setCachedImages:(id)a3
{
  objc_storeStrong((id *)&self->_cachedImages, a3);
}

- (void)setPendingImageRequestCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_pendingImageRequestCompletionHandlers, a3);
}

- (BOOL)refreshNeeded
{
  return self->_refreshNeeded;
}

- (void)setRefreshNeeded:(BOOL)a3
{
  self->_refreshNeeded = a3;
}

- (BOOL)isFetchingUpNextInfos
{
  return self->_isFetchingUpNextInfos;
}

- (void)setIsFetchingUpNextInfos:(BOOL)a3
{
  self->_isFetchingUpNextInfos = a3;
}

- (NSDate)lastRefreshTimestamp
{
  return self->_lastRefreshTimestamp;
}

- (void)setLastRefreshTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastRefreshTimestamp, a3);
}

- (NSString)paginationToken
{
  return self->_paginationToken;
}

- (void)setPaginationToken:(id)a3
{
  objc_storeStrong((id *)&self->_paginationToken, a3);
}

- (BOOL)shouldPrewarmData
{
  return self->_shouldPrewarmData;
}

- (BOOL)shouldPrewarmImages
{
  return self->_shouldPrewarmImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paginationToken, 0);
  objc_storeStrong((id *)&self->_lastRefreshTimestamp, 0);
  objc_storeStrong((id *)&self->_pendingImageRequestCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_cachedImages, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_upNextController, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
}

void __79__TVRUIUpNextController__remoteFetchUpNextInfosWithPaginationToken_completion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_21B042000, a2, OS_LOG_TYPE_ERROR, "Error fetching watch list: %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __76__TVRUIUpNextController__remoteMarkAsWatchedWithMediaIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B042000, v0, v1, "Error marking %{public}@ as watched: %@");
  OUTLINED_FUNCTION_2();
}

void __73__TVRUIUpNextController__remoteRemoveItemWithMediaIdentifier_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B042000, v0, v1, "Error removing %{public}@ from watch list: %@");
  OUTLINED_FUNCTION_2();
}

void __52__TVRUIUpNextController__remotePlayItem_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21B042000, v0, v1, "Error playing %{public}@: %@");
  OUTLINED_FUNCTION_2();
}

@end
