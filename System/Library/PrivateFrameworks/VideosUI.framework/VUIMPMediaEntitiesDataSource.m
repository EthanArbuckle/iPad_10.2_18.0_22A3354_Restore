@implementation VUIMPMediaEntitiesDataSource

void __79__VUIMPMediaEntitiesDataSource_controller_fetchRequests_didCompleteWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __63__VUIMPMediaEntitiesDataSource__notifyDelegateFetchDidComplete__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "dataSourceDidFinishFetching:", WeakRetained);

}

- (void)startFetch
{
  VUIMediaEntitiesFetchController *v3;
  void *v4;
  void *v5;
  void *v6;
  VUIMediaEntitiesFetchController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = [VUIMediaEntitiesFetchController alloc];
  -[VUIMPMediaEntitiesDataSource mediaLibrary](self, "mediaLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntitiesDataSource fetchRequest](self, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VUIMediaEntitiesFetchController initWithMediaLibrary:fetchRequests:](v3, "initWithMediaLibrary:fetchRequests:", v4, v6);
  -[VUIMPMediaEntitiesDataSource setFetchController:](self, "setFetchController:", v7);

  -[VUIMPMediaEntitiesDataSource fetchController](self, "fetchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[VUILibraryDataSource setHasCompletedInitialFetch:](self, "setHasCompletedInitialFetch:", 0);
  -[VUIMPMediaEntitiesDataSource mediaLibrary](self, "mediaLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:](VUIMediaLibraryFetchControllerQueue, "defaultQueueWithMediaLibrary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesDataSource fetchController](self, "fetchController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addFetchController:", v11);

}

- (void)setRequestedRange:(_NSRange)a3
{
  self->_requestedRange = a3;
}

- (void)setMediaEntitiesToFetch:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEntitiesToFetch, a3);
}

- (void)setMediaEntitiesSet:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEntitiesSet, a3);
}

- (void)setFetchController:(id)a3
{
  objc_storeStrong((id *)&self->_fetchController, a3);
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (VUIMPMediaEntitiesDataSource)initWithMediaLibrary:(id)a3 fetchRequest:(id)a4
{
  id v7;
  VUIMPMediaEntitiesDataSource *v8;
  VUIMPMediaEntitiesDataSource *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIMPMediaEntitiesDataSource;
  v8 = -[VUIMediaEntitiesDataSource initWithFetchRequest:](&v11, sel_initWithFetchRequest_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaLibrary, a3);
    v9->_requestedRange = (_NSRange)xmmword_1DA1C1A80;
    v9->_inFlightArtworkRequests = 0;
  }

  return v9;
}

- (VUIMediaEntitiesFetchController)fetchController
{
  return self->_fetchController;
}

- (void)controller:(id)a3 fetchRequests:(id)a4 didCompleteWithResult:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  VUIMPMediaEntitiesDataSource *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v23 = self;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "[VUIMPMediaEntitiesDataSource %p] - Fetch completed successfully", buf, 0xCu);
  }

  objc_msgSend(v6, "fetchResponses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaEntities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "grouping");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__VUIMPMediaEntitiesDataSource_controller_fetchRequests_didCompleteWithResult___block_invoke;
  v20[3] = &unk_1E9F9A730;
  v14 = v13;
  v21 = v14;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v20);
  objc_msgSend(v14, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VUIMediaEntitiesDataSource shouldAutoFetchArtworkInfoDictionaries](self, "shouldAutoFetchArtworkInfoDictionaries"))
  {
    -[VUIMPMediaEntitiesDataSource mediaEntitiesSet](self, "mediaEntitiesSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)objc_msgSend(v14, "mutableCopy");
      -[VUIMPMediaEntitiesDataSource mediaEntitiesSet](self, "mediaEntitiesSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "minusOrderedSet:", v18);

      objc_msgSend(v17, "array");
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = v15;
    }
  }
  else
  {
    v19 = 0;
  }
  -[VUIMPMediaEntitiesDataSource setMediaEntitiesSet:](self, "setMediaEntitiesSet:", v14);
  -[VUIMediaEntitiesDataSource setMediaEntities:](self, "setMediaEntities:", v15);
  -[VUIMPMediaEntitiesDataSource setMediaEntitiesToFetch:](self, "setMediaEntitiesToFetch:", v19);
  -[VUIMPMediaEntitiesDataSource setRequestedRange:](self, "setRequestedRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[VUIMediaEntitiesDataSource setGrouping:](self, "setGrouping:", v12);
  -[VUIMPMediaEntitiesDataSource _fetchArtworkInfoIfNecessary](self, "_fetchArtworkInfoIfNecessary");
  -[VUILibraryDataSource setHasCompletedInitialFetch:](self, "setHasCompletedInitialFetch:", 1);
  -[VUIMPMediaEntitiesDataSource _notifyDelegateFetchDidComplete](self, "_notifyDelegateFetchDidComplete");

}

- (void)_notifyDelegateFetchDidComplete
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __63__VUIMPMediaEntitiesDataSource__notifyDelegateFetchDidComplete__block_invoke;
  v6 = &unk_1E9F99C98;
  objc_copyWeak(&v7, &location);
  v2 = &v3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v3, v4))
    v5((uint64_t)v2);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_fetchArtworkInfoIfNecessary
{
  NSUInteger location;
  NSUInteger v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (!self->_shouldPauseAutoFetchingArtworkInfoDictionaries && -[NSArray count](self->_mediaEntitiesToFetch, "count"))
  {
    location = self->_requestedRange.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
      v4 = 0;
    else
      v4 = location + self->_requestedRange.length + 1;
    -[VUIMPMediaEntitiesDataSource _getPurchaseHistoryIdsFromMediaEntities:inRange:](self, "_getPurchaseHistoryIdsFromMediaEntities:inRange:", self->_mediaEntitiesToFetch, v4, 74);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v8 = v5;
      v7 = objc_msgSend(v5, "count");
      v6 = v8;
      if (v7)
      {
        self->_requestedRange.location = v4;
        self->_requestedRange.length = 74;
        -[VUIMPMediaEntitiesDataSource _loadImageUrlsByPurchaseHistoryIds:](self, "_loadImageUrlsByPurchaseHistoryIds:", v8);
        v6 = v8;
      }
    }

  }
}

- (void)setShouldPauseAutoFetchingArtworkInfoDictionaries:(BOOL)a3
{
  _BOOL4 shouldPauseAutoFetchingArtworkInfoDictionaries;

  shouldPauseAutoFetchingArtworkInfoDictionaries = self->_shouldPauseAutoFetchingArtworkInfoDictionaries;
  self->_shouldPauseAutoFetchingArtworkInfoDictionaries = a3;
  if (shouldPauseAutoFetchingArtworkInfoDictionaries && !a3 && !self->_inFlightArtworkRequests)
    -[VUIMPMediaEntitiesDataSource _fetchArtworkInfoIfNecessary](self, "_fetchArtworkInfoIfNecessary");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[VUIMPMediaEntitiesDataSource fetchController](self, "fetchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIMPMediaEntitiesDataSource mediaLibrary](self, "mediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:](VUIMediaLibraryFetchControllerQueue, "defaultQueueWithMediaLibrary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMPMediaEntitiesDataSource fetchController](self, "fetchController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFetchController:", v6);

    -[VUIMPMediaEntitiesDataSource fetchController](self, "fetchController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", 0);

  }
  v8.receiver = self;
  v8.super_class = (Class)VUIMPMediaEntitiesDataSource;
  -[VUIMPMediaEntitiesDataSource dealloc](&v8, sel_dealloc);
}

- (void)controller:(id)a3 fetchRequests:(id)a4 didFailWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C9AA60];
  -[VUIMediaEntitiesDataSource setMediaEntities:](self, "setMediaEntities:", MEMORY[0x1E0C9AA60]);
  -[VUIMediaEntitiesDataSource setGrouping:](self, "setGrouping:", v11);
  -[VUILibraryDataSource setHasCompletedInitialFetch:](self, "setHasCompletedInitialFetch:", 1);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __74__VUIMPMediaEntitiesDataSource_controller_fetchRequests_didFailWithError___block_invoke;
  v16 = &unk_1E9F99C98;
  objc_copyWeak(&v17, &location);
  v12 = &v13;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v13, v14))
    v15((uint64_t)v12);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __74__VUIMPMediaEntitiesDataSource_controller_fetchRequests_didFailWithError___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "dataSourceDidFinishFetching:", WeakRetained);

}

- (void)_loadImageUrlsByPurchaseHistoryIds:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id location;
  uint8_t buf[4];
  VUIMPMediaEntitiesDataSource *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  -[VUIMPMediaEntitiesDataSource setInFlightArtworkRequests:](self, "setInFlightArtworkRequests:", -[VUIMPMediaEntitiesDataSource inFlightArtworkRequests](self, "inFlightArtworkRequests") + 1);
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[VUIMPMediaEntitiesDataSource inFlightArtworkRequests](self, "inFlightArtworkRequests");
    *(_DWORD *)buf = 134218240;
    v12 = self;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "[VUIMPMediaEntitiesDataSource %p] - Begining to fetch artwork by purchase history ids number of request %ld", buf, 0x16u);
  }

  +[VUICloudClient sharedInstance](VUICloudClient, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__VUIMPMediaEntitiesDataSource__loadImageUrlsByPurchaseHistoryIds___block_invoke;
  v8[3] = &unk_1E9F9A780;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "loadArtworkURLsForPurchaseHistoryIDs:completionHandler:", v4, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __67__VUIMPMediaEntitiesDataSource__loadImageUrlsByPurchaseHistoryIds___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  char v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v23 = v7;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "[VUIMPMediaEntitiesDataSource %p] - Fetched artwork by purchase history ids", buf, 0xCu);
  }

  v8 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "artworkInfoDictionaryByPurchaseID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (v12)
    {
      objc_msgSend(v10, "setArtworkInfoDictionaryByPurchaseID:", v5);
    }
    else
    {
      objc_msgSend(v10, "artworkInfoDictionaryByPurchaseID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v14, "addEntriesFromDictionary:", v5);
      objc_msgSend(v10, "setArtworkInfoDictionaryByPurchaseID:", v14);

    }
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __67__VUIMPMediaEntitiesDataSource__loadImageUrlsByPurchaseHistoryIds___block_invoke_10;
    v19 = &unk_1E9F9A758;
    objc_copyWeak(&v20, v8);
    v21 = a3;
    v15 = &v16;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v16, v17))
      v18((uint64_t)v15);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v15);

    objc_msgSend(v10, "setHasCompletedInitialFetch:", 1);
    objc_destroyWeak(&v20);
  }

}

void __67__VUIMPMediaEntitiesDataSource__loadImageUrlsByPurchaseHistoryIds___block_invoke_10(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "dataSourceDidFinishFetchingArtwork:", WeakRetained);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "setInFlightArtworkRequests:", objc_msgSend(WeakRetained, "inFlightArtworkRequests") - 1);
    if ((objc_msgSend(WeakRetained, "shouldPauseAutoFetchingArtworkInfoDictionaries") & 1) == 0
      && !objc_msgSend(WeakRetained, "inFlightArtworkRequests"))
    {
      objc_msgSend(WeakRetained, "_fetchArtworkInfoIfNecessary");
    }
  }

}

- (id)_getPurchaseHistoryIdsFromMediaEntities:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = location + length;
  if (location + length > objc_msgSend(v6, "count") - 1)
    v8 = objc_msgSend(v6, "count") - 1;
  while (location <= v8)
  {
    objc_msgSend(v6, "objectAtIndex:", location);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "purchaseHistoryID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v7, "addObject:", v10);

    ++location;
  }
  v11 = (void *)objc_msgSend(v7, "copy");

  return v11;
}

- (BOOL)shouldPauseAutoFetchingArtworkInfoDictionaries
{
  return self->_shouldPauseAutoFetchingArtworkInfoDictionaries;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (NSOrderedSet)mediaEntitiesSet
{
  return self->_mediaEntitiesSet;
}

- (NSArray)mediaEntitiesToFetch
{
  return self->_mediaEntitiesToFetch;
}

- (_NSRange)requestedRange
{
  _NSRange *p_requestedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_requestedRange = &self->_requestedRange;
  location = self->_requestedRange.location;
  length = p_requestedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)inFlightArtworkRequests
{
  return self->_inFlightArtworkRequests;
}

- (void)setInFlightArtworkRequests:(unint64_t)a3
{
  self->_inFlightArtworkRequests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntitiesToFetch, 0);
  objc_storeStrong((id *)&self->_mediaEntitiesSet, 0);
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end
