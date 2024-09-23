@implementation WBSBookmarkFolderTouchIconProvider

- (void)setProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_providerDelegate, a3);
}

- (WBSBookmarkFolderTouchIconProvider)init
{
  WBSBookmarkFolderTouchIconProvider *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *internalQueue;
  uint64_t v8;
  NSMutableDictionary *bookmarkFolderIdentifiersToRequestSets;
  uint64_t v10;
  NSMutableDictionary *requestsToRequestInfos;
  uint64_t v12;
  NSMutableDictionary *folderUUIDsToTouchIconInfo;
  WBSBookmarkFolderTouchIconProvider *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WBSBookmarkFolderTouchIconProvider;
  v2 = -[WBSBookmarkFolderTouchIconProvider init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.WBSBookmarkFolderTouchIconProvider.%@.%p._internalQueue"), objc_opt_class(), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    bookmarkFolderIdentifiersToRequestSets = v2->_bookmarkFolderIdentifiersToRequestSets;
    v2->_bookmarkFolderIdentifiersToRequestSets = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    requestsToRequestInfos = v2->_requestsToRequestInfos;
    v2->_requestsToRequestInfos = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    folderUUIDsToTouchIconInfo = v2->_folderUUIDsToTouchIconInfo;
    v2->_folderUUIDsToTouchIconInfo = (NSMutableDictionary *)v12;

    v14 = v2;
  }

  return v2;
}

- (WBSBookmarkFolderTouchIconConfiguration)configuration
{
  if (defaultConfiguration_onceToken != -1)
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_188);
  return (WBSBookmarkFolderTouchIconConfiguration *)(id)defaultConfiguration_configuration;
}

- (NSArray)allFolderUUIDs
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_folderUUIDsToTouchIconInfo;
  objc_sync_enter(v3);
  -[NSMutableDictionary allKeys](self->_folderUUIDsToTouchIconInfo, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (id)cachedImageForFolderUUID:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self->_folderUUIDsToTouchIconInfo;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_folderUUIDsToTouchIconInfo, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "touchIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)contentOfFolderDidUpdateWithUUID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__WBSBookmarkFolderTouchIconProvider_contentOfFolderDidUpdateWithUUID___block_invoke;
  v7[3] = &unk_1E5441848;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __71__WBSBookmarkFolderTouchIconProvider_contentOfFolderDidUpdateWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_prepareResponseForRequest:allowDelayedResponse:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)requestsWithFolderUUIDsDidBecomeInvalid:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__WBSBookmarkFolderTouchIconProvider_requestsWithFolderUUIDsDidBecomeInvalid___block_invoke;
  v7[3] = &unk_1E5441848;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __78__WBSBookmarkFolderTouchIconProvider_requestsWithFolderUUIDsDidBecomeInvalid___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v3, "unionSet:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "_stopWatchingUpdatesForRequests:", v3);
}

- (BOOL)canHandleRequest:(id)a3
{
  return 0;
}

- (id)defaultFolderIconForRequest:(id)a3
{
  return 0;
}

- (id)folderUUIDForRequest:(id)a3
{
  return 0;
}

- (id)subrequestsForRequest:(id)a3 maximumNumberOfSubrequests:(unint64_t)a4
{
  return 0;
}

- (BOOL)canProvideUpdatesForRequest:(id)a3
{
  return 1;
}

- (void)didCreateTouchIcon:(id)a3
{
  objc_msgSend(a3, "safari_setTransparencyAnalysisResult:", 3);
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.5);
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  *a4 = -[WBSBookmarkFolderTouchIconProvider canProvideUpdatesForRequest:](self, "canProvideUpdatesForRequest:", v6);
  -[WBSBookmarkFolderTouchIconProvider folderUUIDForRequest:](self, "folderUUIDForRequest:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_folderUUIDsToTouchIconInfo;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKey:](self->_folderUUIDsToTouchIconInfo, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "touchIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  if (v10
    || (-[WBSBookmarkFolderTouchIconProvider defaultFolderIconForRequest:](self, "defaultFolderIconForRequest:", v6),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WBSBookmarkFolderTouchIconProvider backgroundColor](self, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSTouchIconResponse responseWithURL:touchIcon:generated:extractedBackgroundColor:](WBSTouchIconResponse, "responseWithURL:touchIcon:generated:extractedBackgroundColor:", 0, v10, 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__WBSBookmarkFolderTouchIconProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E54418B8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __85__WBSBookmarkFolderTouchIconProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareResponseForRequest:allowDelayedResponse:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__WBSBookmarkFolderTouchIconProvider_stopWatchingUpdatesForRequest___block_invoke;
  v7[3] = &unk_1E5441848;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __68__WBSBookmarkFolderTouchIconProvider_stopWatchingUpdatesForRequest___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_stopWatchingUpdatesForRequests:", v2);

}

- (void)_stopWatchingUpdatesForRequests:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  id WeakRetained;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v11, (_QWORD)v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "subrequestTokens");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "unionSet:", v14);

          -[NSMutableDictionary removeObjectForKey:](self->_requestsToRequestInfos, "removeObjectForKey:", v11);
          -[WBSBookmarkFolderTouchIconProvider folderUUIDForRequest:](self, "folderUUIDForRequest:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_bookmarkFolderIdentifiersToRequestSets, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObject:", v11);
          v17 = objc_msgSend(v16, "count");
          if (v15)
            v18 = v17 == 0;
          else
            v18 = 0;
          if (v18)
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bookmarkFolderIdentifiersToRequestSets, "setObject:forKeyedSubscript:", 0, v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
    objc_msgSend(WeakRetained, "siteMetadataProvider:cancelRequestsWithTokens:", self, v5);

  }
}

+ (BOOL)_appUsesLeftToRightLayout
{
  if (_appUsesLeftToRightLayout_onceToken != -1)
    dispatch_once(&_appUsesLeftToRightLayout_onceToken, &__block_literal_global_4);
  return _appUsesLeftToRightLayout_usesLeftToRight;
}

void __63__WBSBookmarkFolderTouchIconProvider__appUsesLeftToRightLayout__block_invoke()
{
  dispatch_sync(MEMORY[0x1E0C80D38], &__block_literal_global_7_0);
}

void __63__WBSBookmarkFolderTouchIconProvider__appUsesLeftToRightLayout__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _appUsesLeftToRightLayout_usesLeftToRight = objc_msgSend(v0, "userInterfaceLayoutDirection") == 0;

}

- (void)_prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  _WBSBookmarkFolderTouchIconProviderRequestInfo *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;

  v4 = a4;
  v25 = a3;
  -[WBSBookmarkFolderTouchIconProvider configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSBookmarkFolderTouchIconProvider subrequestsForRequest:maximumNumberOfSubrequests:](self, "subrequestsForRequest:maximumNumberOfSubrequests:", v25, objc_msgSend(v6, "maximumNumberOfThumbnailIcons"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subrequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToArray:", v7);

  if ((v10 & 1) == 0)
  {
    v11 = objc_msgSend(v7, "count");
    -[WBSBookmarkFolderTouchIconProvider defaultFolderIconForRequest:](self, "defaultFolderIconForRequest:", v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSBookmarkFolderTouchIconProvider backgroundColor](self, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSTouchIconResponse responseWithURL:touchIcon:generated:extractedBackgroundColor:](WBSTouchIconResponse, "responseWithURL:touchIcon:generated:extractedBackgroundColor:", 0, v12, 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
    v16 = WeakRetained;
    if (v11)
    {
      if (v4)
        objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", self, v14, 1, 0, v25);
      v17 = objc_alloc_init(_WBSBookmarkFolderTouchIconProviderRequestInfo);
      -[_WBSBookmarkFolderTouchIconProviderRequestInfo setSubrequests:](v17, "setSubrequests:", v7);
      -[WBSBookmarkFolderTouchIconProvider _registerInfo:forRequest:](self, "_registerInfo:forRequest:", v17, v25);
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __86__WBSBookmarkFolderTouchIconProvider__prepareResponseForRequest_allowDelayedResponse___block_invoke;
      v26[3] = &unk_1E5441948;
      v26[4] = self;
      v19 = v16;
      v27 = v19;
      v28 = v25;
      v29 = v18;
      v20 = v18;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v26);
      -[_WBSBookmarkFolderTouchIconProviderRequestInfo setSubrequestTokens:](v17, "setSubrequestTokens:", v20);
      objc_msgSend(v8, "subrequestTokens");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "siteMetadataProvider:cancelRequestsWithTokens:", self, v21);

    }
    else
    {
      objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", self, v14, 0, 1, v25);
      -[WBSBookmarkFolderTouchIconProvider configuration](self, "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "backgroundColorForEmptySlots");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
LABEL_9:

        goto LABEL_10;
      }
      v17 = objc_alloc_init(_WBSBookmarkFolderTouchIconProviderRequestInfo);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WBSBookmarkFolderTouchIconProviderRequestInfo setSubrequestTokens:](v17, "setSubrequestTokens:", v24);

      -[WBSBookmarkFolderTouchIconProvider _registerInfo:forRequest:](self, "_registerInfo:forRequest:", v17, v25);
      -[WBSBookmarkFolderTouchIconProvider _dispatchResponseForRequest:](self, "_dispatchResponseForRequest:", v25);
    }

    goto LABEL_9;
  }
LABEL_10:

}

void __86__WBSBookmarkFolderTouchIconProvider__prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20[2];
  id location;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "maximumNumberOfThumbnailIcons");

  if (v9 <= (unint64_t)a3)
  {
    *a4 = 1;
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __86__WBSBookmarkFolderTouchIconProvider__prepareResponseForRequest_allowDelayedResponse___block_invoke_2;
    v18 = &unk_1E5441920;
    objc_copyWeak(v20, &location);
    v19 = *(id *)(a1 + 48);
    v20[1] = a3;
    objc_msgSend(v10, "siteMetadataProvider:registerSubrequest:forRequests:queue:responseHandler:", v11, v7, v12, v13, &v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v14, v15, v16, v17, v18);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }

}

void __86__WBSBookmarkFolderTouchIconProvider__prepareResponseForRequest_allowDelayedResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = v8;
    objc_msgSend(WeakRetained[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setThumbnailImage:atIndex:", v6, *(_QWORD *)(a1 + 48));

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "isGenerated"))
    {
      objc_msgSend(v4, "extractedBackgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v5, "setBackgroundColor:atIndex:", v7, *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "_coalesceResponseDispatchForRequest:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_registerInfo:(id)a3 forRequest:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestsToRequestInfos, "setObject:forKeyedSubscript:", a3, v8);
  -[WBSBookmarkFolderTouchIconProvider folderUUIDForRequest:](self, "folderUUIDForRequest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_bookmarkFolderIdentifiersToRequestSets, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bookmarkFolderIdentifiersToRequestSets, "setObject:forKeyedSubscript:", v7, v6);
    }
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (void)_coalesceResponseDispatchForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *internalQueue;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "hasScheduledCoalescedUpdate") & 1) == 0)
  {
    objc_msgSend(v6, "setHasScheduledCoalescedUpdate:", 1);
    objc_initWeak(&location, self);
    v7 = dispatch_time(0, 10000000);
    internalQueue = self->_internalQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__WBSBookmarkFolderTouchIconProvider__coalesceResponseDispatchForRequest___block_invoke;
    v9[3] = &unk_1E5441970;
    objc_copyWeak(&v12, &location);
    v10 = v4;
    v11 = v6;
    dispatch_after(v7, internalQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

uint64_t __74__WBSBookmarkFolderTouchIconProvider__coalesceResponseDispatchForRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_dispatchResponseForRequest:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 40), "setHasScheduledCoalescedUpdate:", 0);
}

- (void)_dispatchResponseForRequest:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  _WBSBookmarkFolderTouchIconProviderInfo *v21;
  NSMutableDictionary *v22;
  id v23;

  v23 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v23, "sizeForDrawing");
    v6 = v5;
    v8 = v7;
    -[WBSBookmarkFolderTouchIconProvider folderUUIDForRequest:](self, "folderUUIDForRequest:", v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_folderUUIDsToTouchIconInfo;
    objc_sync_enter(v10);
    -[NSMutableDictionary objectForKey:](self->_folderUUIDsToTouchIconInfo, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v10);

    objc_msgSend(v4, "thumbnailImages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "containsObject:", v13);

    if ((v14 & 1) != 0)
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v4, "backgroundColors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqual:", v15))
    {
      objc_msgSend(v11, "thumbnailImages");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToArray:", v12);

      if (!v18)
      {
LABEL_10:
        -[WBSBookmarkFolderTouchIconProvider _drawTouchIconForRequest:](self, "_drawTouchIconForRequest:", v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[_WBSBookmarkFolderTouchIconProviderInfo initWithThumbnailImages:backgroundColors:touchIcon:]([_WBSBookmarkFolderTouchIconProviderInfo alloc], "initWithThumbnailImages:backgroundColors:touchIcon:", v12, v15, v16);
        if (v9)
        {
          v22 = self->_folderUUIDsToTouchIconInfo;
          objc_sync_enter(v22);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_folderUUIDsToTouchIconInfo, "setObject:forKeyedSubscript:", v21, v9);
          objc_sync_exit(v22);

        }
        -[WBSBookmarkFolderTouchIconProvider _dispatchResponseForRequest:touchIcon:](self, "_dispatchResponseForRequest:touchIcon:", v23, v16);

        goto LABEL_13;
      }
      objc_msgSend(v11, "touchIcon");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "size");
      if (v16 && v19 >= v6 && v20 >= v8)
      {
        -[WBSBookmarkFolderTouchIconProvider _dispatchResponseForRequest:touchIcon:](self, "_dispatchResponseForRequest:touchIcon:", v23, v16);
LABEL_13:

        goto LABEL_14;
      }
    }

    goto LABEL_10;
  }
LABEL_15:

}

- (void)_dispatchResponseForRequest:(id)a3 touchIcon:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WBSBookmarkFolderTouchIconProvider backgroundColor](self, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSTouchIconResponse responseWithURL:touchIcon:generated:extractedBackgroundColor:](WBSTouchIconResponse, "responseWithURL:touchIcon:generated:extractedBackgroundColor:", 0, v6, 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
    objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", self, v9, 0, 1, v11);

  }
}

- (id)_drawTouchIconForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  WBSBookmarkFolderTouchIconProvider *v40;
  id v41;
  id v42;
  id v43;
  double v44;
  double v45;
  uint64_t v46;
  BOOL v47;

  v4 = a3;
  -[WBSBookmarkFolderTouchIconProvider configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeForDrawing");
  v8 = v7;
  v10 = v9;

  -[WBSBookmarkFolderTouchIconProvider backgroundColor](self, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safari_luminance");
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0CEA478], "safari_colorWithRGBColorComponents:", &unk_1E547BD18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thumbnailImages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundColors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColorForEmptySlots");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSBookmarkFolderTouchIconProvider _arrayByPaddingArray:toMaximumNumberOfThumbnailsWithObject:](self, "_arrayByPaddingArray:toMaximumNumberOfThumbnailsWithObject:", v15, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "backgroundColorForEmptySlots");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSBookmarkFolderTouchIconProvider _arrayByPaddingArray:toMaximumNumberOfThumbnailsWithObject:](self, "_arrayByPaddingArray:toMaximumNumberOfThumbnailsWithObject:", v16, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v21;
    v15 = (void *)v19;
  }
  v22 = +[WBSBookmarkFolderTouchIconProvider _appUsesLeftToRightLayout](WBSBookmarkFolderTouchIconProvider, "_appUsesLeftToRightLayout");
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke;
  v38[3] = &unk_1E5441A00;
  v44 = v8;
  v45 = v10;
  v23 = v5;
  v39 = v23;
  v40 = self;
  v24 = v15;
  v41 = v24;
  v25 = v16;
  v42 = v25;
  v47 = v22;
  v46 = v13;
  v26 = v14;
  v43 = v26;
  v27 = (void *)MEMORY[0x1A85D45E4](v38);
  objc_msgSend(MEMORY[0x1E0CEA638], "safari_imageWithSize:actions:", v27, v8, v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "indexOfObjectPassingTest:", &__block_literal_global_27) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
    v37 = v23;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEAB40], "_currentTraitCollection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v29);
    objc_msgSend(v28, "imageAsset");
    v36 = v26;
    v30 = v24;
    v31 = v6;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "safari_imageWithSize:actions:", v27, v8, v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "registerImage:withTraitCollection:", v33, v29);

    v6 = v31;
    v24 = v30;
    v26 = v36;
    objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v35);

    v23 = v37;
  }
  -[WBSBookmarkFolderTouchIconProvider didCreateTouchIcon:](self, "didCreateTouchIcon:", v28);

  return v28;
}

void __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke(uint64_t a1, CGContextRef c)
{
  double *v4;
  double width;
  uint64_t v6;
  double v7;
  double (**v8)(_QWORD, double);
  void *v9;
  const CGPath *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double);
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *, unint64_t);
  void *v34;
  id v35;
  id v36;
  id v37;
  CGContextRef v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  double v43;
  double v44;
  uint64_t v45;
  char v46;
  _QWORD v47[5];
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _QWORD v53[5];
  _QWORD v54[4];
  CGRect v55;

  v54[2] = *MEMORY[0x1E0C80C00];
  v4 = (double *)(a1 + 72);
  width = CGContextConvertSizeToDeviceSpace(c, *(CGSize *)(a1 + 72)).width;
  v6 = MEMORY[0x1E0C809B0];
  v7 = width / *v4;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_2;
  v53[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(double *)&v53[4] = v7;
  v8 = (double (**)(_QWORD, double))MEMORY[0x1A85D45E4](v53);
  if (objc_msgSend(*((id *)v4 - 5), "fillIconWithBackgroundColor"))
  {
    objc_msgSend(*(id *)(a1 + 40), "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFill");

    v55.size.width = *(CGFloat *)(a1 + 72);
    v55.size.height = *(CGFloat *)(a1 + 80);
    v55.origin.x = 0.0;
    v55.origin.y = 0.0;
    v10 = CGPathCreateWithRect(v55, 0);
    CGContextAddPath(c, v10);
    CGContextFillPath(c);
    CGPathRelease(v10);
  }
  v11 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "thumbnailIconInnerMarginScaleFactor");
  v52 = v8[2](v8, v11 * v12);
  v13 = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "thumbnailIconInnerMarginScaleFactor");
  v51 = v8[2](v8, v13 * v14);
  v15 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "thumbnailIconOuterMarginScaleFactor");
  v50 = v8[2](v8, v15 * v16);
  v17 = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 32), "thumbnailIconOuterMarginScaleFactor");
  v49 = v8[2](v8, v17 * v18);
  v19 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "thumbnailIconScaleFactor");
  v21 = v8[2](v8, v19 * v20);
  *(double *)&v47[4] = v7;
  v48 = v21;
  v47[0] = v6;
  v47[1] = 3221225472;
  v47[2] = __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_3;
  v47[3] = &__block_descriptor_40_e23_v48__0d8Q16_d24_d32_d40l;
  v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double))MEMORY[0x1A85D45E4](v47);
  ((void (**)(_QWORD, uint64_t, double *, double *, double *, double))v22)[2](v22, objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfThumbnailsPerRow"), &v49, &v51, &v48, *(double *)(a1 + 80));
  ((void (**)(_QWORD, uint64_t, double *, double *, double *, double))v22)[2](v22, objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfThumbnailsPerRow"), &v50, &v52, &v48, *(double *)(a1 + 72));
  v23 = 0x1E0CEA000uLL;
  objc_msgSend(MEMORY[0x1E0CEAB40], "_traitCollectionWithBackgroundLevel:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "_currentTraitCollection");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  v27 = (void *)MEMORY[0x1E0CEAB40];
  if (v25)
  {
    v54[0] = v25;
    v54[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "traitCollectionWithTraitsFromCollections:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_setCurrentTraitCollection:", v29);

    v23 = 0x1E0CEA000;
    v6 = MEMORY[0x1E0C809B0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "_setCurrentTraitCollection:", v24);
  }
  v31 = v6;
  v32 = 3221225472;
  v33 = __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_4;
  v34 = &unk_1E54419D8;
  v38 = c;
  v30 = *(void **)(a1 + 48);
  v35 = *(id *)(a1 + 56);
  v36 = *(id *)(a1 + 32);
  v46 = *(_BYTE *)(a1 + 96);
  v39 = v50;
  v40 = v52;
  v41 = v48;
  v42 = *(_OWORD *)v4;
  v43 = v49;
  v44 = v51;
  v45 = *(_QWORD *)(a1 + 88);
  v37 = *(id *)(a1 + 64);
  objc_msgSend(v30, "enumerateObjectsUsingBlock:", &v31);
  objc_msgSend(*(id *)(v23 + 2880), "_setCurrentTraitCollection:", v26, v31, v32, v33, v34);

}

double __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_2(uint64_t a1, double a2)
{
  return round(*(double *)(a1 + 32) * a2) / *(double *)(a1 + 32);
}

double __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_3(uint64_t a1, unint64_t a2, double *a3, double *a4, double *a5, double a6)
{
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  BOOL v10;
  double v11;
  double result;

  v6 = *a3;
  v7 = *a4 * (double)(a2 - 1) + *a3 * 2.0 + *a5 * (double)a2 - a6;
  v8 = *(double *)(a1 + 32);
  v9 = llround(v7 / v8);
  if (v9 < 0)
    v9 = -v9;
  v10 = v7 < 0.0;
  v11 = 1.0;
  if (v10)
    v11 = -1.0;
  result = v11 / v8;
  if ((unint64_t)v9 >= 2)
  {
    do
    {
      v6 = v6 - result;
      v9 -= 2;
    }
    while ((unint64_t)v9 > 1);
    *a3 = v6;
  }
  if (v9 == 1)
  {
    *a4 = result + *a4;
    result = *a5 - result;
    *a5 = result;
  }
  return result;
}

void __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  const CGPath *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;

  v23 = a2;
  CGContextSaveGState(*(CGContextRef *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v23)
    v6 = 0;
  else
    v6 = v23;
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
    v10 = 0;
  else
    v10 = v8;
  v11 = v10;

  v12 = a3 / objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfThumbnailsPerRow");
  v13 = a3 % objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfThumbnailsPerRow");
  v14 = *(double *)(a1 + 80);
  if (*(_BYTE *)(a1 + 128))
    v15 = *(double *)(a1 + 64) + (*(double *)(a1 + 72) + v14) * (double)v13;
  else
    v15 = *(double *)(a1 + 88) - (v14 + *(double *)(a1 + 64) + (*(double *)(a1 + 72) + v14) * (double)v13);
  v16 = *(double *)(a1 + 104) + (*(double *)(a1 + 112) + v14) * (double)v12;
  if (v14 <= 60.0)
    v17 = 3.0;
  else
    v17 = 1.0;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", v15, *(double *)(a1 + 104) + (*(double *)(a1 + 112) + v14) * (double)v12, v14, v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addClip");
  if (v11)
  {
    objc_msgSend(v11, "setFill");
    v24.origin.x = v15;
    v24.origin.y = v16;
    v24.size.width = v14;
    v24.size.height = v14;
    v19 = CGPathCreateWithRect(v24, 0);
    CGContextAddPath(*(CGContextRef *)(a1 + 56), v19);
    CGContextFillPath(*(CGContextRef *)(a1 + 56));
    CGPathRelease(v19);
  }
  if (v7)
  {
    objc_msgSend(v7, "drawInRect:", v15, v16, v14, v14);
    objc_msgSend(v7, "safari_computeAverageLuminance");
    if (vabdd_f64(v20, *(double *)(a1 + 120)) < 0.1)
    {
      objc_msgSend(*(id *)(a1 + 40), "colorForDarkeningThumbnailBackground");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        CGContextSetBlendMode(*(CGContextRef *)(a1 + 56), kCGBlendModeDarken);
        CGContextSetAlpha(*(CGContextRef *)(a1 + 56), 0.1);
        objc_msgSend(*(id *)(a1 + 40), "colorForDarkeningThumbnailBackground");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setFill");

        v25.origin.x = v15;
        v25.origin.y = v16;
        v25.size.width = v14;
        v25.size.height = v14;
        CGContextFillRect(*(CGContextRef *)(a1 + 56), v25);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "setStroke");
        objc_msgSend(v18, "stroke");
      }
    }
  }
  CGContextRestoreGState(*(CGContextRef *)(a1 + 56));

}

uint64_t __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = (void *)MEMORY[0x1E0C99E38];
  v3 = a2;
  objc_msgSend(v2, "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1u;
}

- (id)_arrayByPaddingArray:(id)a3 toMaximumNumberOfThumbnailsWithObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[WBSBookmarkFolderTouchIconProvider configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "maximumNumberOfThumbnailIcons");

  if (objc_msgSend(v6, "count") >= v9)
  {
    v14 = v6;
  }
  else
  {
    v10 = (void *)objc_msgSend(v6, "mutableCopy");
    v11 = objc_msgSend(v6, "count");
    v12 = v9 > v11;
    v13 = v9 - v11;
    if (v12)
    {
      do
      {
        objc_msgSend(v10, "addObject:", v7);
        --v13;
      }
      while (v13);
    }
    v14 = (id)objc_msgSend(v10, "copy");

  }
  return v14;
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  return (WBSSiteMetadataProviderDelegate *)objc_loadWeakRetained((id *)&self->_providerDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_folderUUIDsToTouchIconInfo, 0);
  objc_storeStrong((id *)&self->_requestsToRequestInfos, 0);
  objc_storeStrong((id *)&self->_bookmarkFolderIdentifiersToRequestSets, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
