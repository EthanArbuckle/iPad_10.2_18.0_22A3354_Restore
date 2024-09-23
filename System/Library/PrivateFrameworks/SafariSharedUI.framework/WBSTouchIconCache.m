@implementation WBSTouchIconCache

void __68__WBSTouchIconCache_prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    objc_msgSend(*(id *)(v5 + 32), "objectForKeyedSubscript:", v3);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKeyedSubscript:");
    }
    objc_msgSend(WeakRetained, "addObject:", *(_QWORD *)(a1 + 32));
    v9 = 0;
    objc_msgSend(*(id *)(a1 + 40), "_touchIconForURL:getImageState:", v2, &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "_setUpAndReturnPreparedResponseForRequest:withImage:imageState:didReceiveNewData:", *(_QWORD *)(a1 + 32), v7, v9, 1);
    }
    else if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "_setUpAndReturnDelayedResponseForRequest:", *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 104));
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v8, "_responseForTouchIconRequestWithNoHost:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", v8, v7, 0, 0, *(_QWORD *)(a1 + 32));
  }

}

- (id)_touchIconForURL:(id)a3 getImageState:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = v6;
  if (a4)
    *a4 = 2;
  objc_msgSend(v6, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
    goto LABEL_7;
  v9 = atomic_load((unsigned __int8 *)&self->_didLoadSettings);
  if ((v9 & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_pendingTouchIconRequestHosts, "addObject:", v8);
    if (a4)
    {
      v10 = 0;
      *a4 = 0;
      goto LABEL_14;
    }
LABEL_7:
    v10 = 0;
    goto LABEL_14;
  }
  os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_touchIconsDataForHosts, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
  if ((objc_msgSend(v11, "isIconInCache") & 1) != 0)
  {
    -[WBSSiteMetadataImageCache imageForKeyString:getImageState:](self->_imageCache, "imageForKeyString:getImageState:", v8, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTouchIconCache _didLoadTouchIcon:withCacheSettingsEntry:](self, "_didLoadTouchIcon:withCacheSettingsEntry:", v10, v11);
  }
  else
  {
    if (a4)
      *a4 = 1;
    -[WBSSiteMetadataImageCache setImageState:forKeyString:](self->_imageCache, "setImageState:forKeyString:", 1, v8);
    v10 = 0;
  }

LABEL_14:
  return v10;
}

- (void)siteMetadataImageCache:(id)a3 didFinishLoadingImage:(id)a4 forKeyString:(id)a5
{
  id v7;
  id v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__WBSTouchIconCache_siteMetadataImageCache_didFinishLoadingImage_forKeyString___block_invoke;
  block[3] = &unk_1E5441410;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(internalQueue, block);

}

uint64_t __79__WBSTouchIconCache_siteMetadataImageCache_didFinishLoadingImage_forKeyString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyImageWasLoaded:forHost:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __158__WBSTouchIconCache_initWithCacheDirectoryURL_isReadOnly_protectionType_allowFetchingOverCellularNetwork_fileMappingStyle_canFetchOutsideOfUserLoadedWebpage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUpImageCacheSettingsSQLiteStore");
}

- (id).cxx_construct
{
  *((_BYTE *)self + 16) = 0;
  return self;
}

- (void)setProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_providerDelegate, a3);
}

- (void)_didLoadTouchIcon:(id)a3 withCacheSettingsEntry:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "transparencyAnalysisResult");
  v8 = v7;
  if (v7 >= 6)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WBSTouchIconCache _didLoadTouchIcon:withCacheSettingsEntry:].cold.1(v8, v9, v10);
  }
  else if (v7)
  {
    objc_msgSend(v5, "safari_setTransparencyAnalysisResult:", v7);
  }

}

- (BOOL)canHandleRequest:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_notifyImageWasLoaded:(id)a3 forHost:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = 2;
  }
  else
  {
    v8 = 1;
    -[WBSTouchIconCache _removeTouchIconsDataForHost:ifIconIsInCache:](self, "_removeTouchIconsDataForHost:ifIconIsInCache:", v7, 1);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__WBSTouchIconCache__notifyImageWasLoaded_forHost___block_invoke;
  v11[3] = &unk_1E5446E10;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  v14 = v8;
  -[WBSTouchIconCache _enumerateRequestsForHost:usingBlock:](self, "_enumerateRequestsForHost:usingBlock:", v10, v11);

}

- (void)_enumerateRequestsForHost:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_hostsToRequestSets, "objectForKeyedSubscript:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

void __51__WBSTouchIconCache__notifyImageWasLoaded_forHost___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldGenerateTouchIconFromTouchIcon:forRequest:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(*(id *)(a1 + 32), "_didLoadTouchIcon:withCacheSettingsEntry:", *(_QWORD *)(a1 + 40), v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setUpAndReturnPreparedResponseForRequest:withImage:imageState:didReceiveNewData:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 1);

}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[4];
  id v10;
  WBSTouchIconCache *v11;
  BOOL v12;

  v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__WBSTouchIconCache_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E54464C8;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  os_unfair_lock_s *p_touchIconsDataForHostsAccessLock;
  void *v12;
  NSObject *v13;
  id *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  id v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;

  v6 = a3;
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_msgSend(v7, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    *a4 = 1;
    -[NSCache objectForKey:](self->_requestsToResponses, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (-[WBSTouchIconCache _canFetchTouchIconForURL:inUserLoadedWebpage:](self, "_canFetchTouchIconForURL:inUserLoadedWebpage:", v7, 0))
      {
        p_touchIconsDataForHostsAccessLock = &self->_touchIconsDataForHostsAccessLock;
        os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_touchIconsDataForHosts, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        os_unfair_lock_unlock(p_touchIconsDataForHostsAccessLock);
        objc_msgSend(v8, "activity");
        if (v12)
        {
          v13 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke_26;
          block[3] = &unk_1E54413C0;
          v14 = &v22;
          v15 = v10;
          v22 = v15;
          v23 = v7;
          os_activity_apply(v13, block);

          v16 = v15;
          v17 = v23;
        }
        else
        {
          v17 = objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke_25;
          v24[3] = &unk_1E54425B0;
          v14 = &v25;
          v25 = v7;
          os_activity_apply(v17, v24);
          v16 = 0;
        }
      }
      else
      {
        objc_msgSend(v8, "activity");
        v18 = objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke;
        v26[3] = &unk_1E54413C0;
        v14 = &v27;
        v19 = v10;
        v27 = v19;
        v28 = v7;
        os_activity_apply(v18, v26);

        v16 = v19;
        v17 = v28;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    *a4 = 0;
    -[WBSTouchIconCache _responseForTouchIconRequestWithNoHost:](self, "_responseForTouchIconRequestWithNoHost:", v8);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)_setUpAndReturnDelayedResponseForRequest:(id)a3
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToDelayedResponses, "objectForKeyedSubscript:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v9, "activity");
    v6 = objc_claimAutoreleasedReturnValue();
    os_activity_apply(v6, &__block_literal_global_49);

    objc_msgSend(v9, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTouchIconCache _touchIconForURL:getImageState:](self, "_touchIconForURL:getImageState:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSTouchIconCache _responseForRequest:withTouchIcon:](self, "_responseForRequest:withTouchIcon:", v9, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestsToDelayedResponses, "setObject:forKeyedSubscript:", v5, v9);
  }
  objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", self, v5, 1, 0, v9);

}

- (void)_setUpAndReturnPreparedResponseForRequest:(id)a3 withImage:(id)a4 imageState:(int64_t)a5 didReceiveNewData:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  BOOL v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSMutableDictionary *touchIconsDataForHosts;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD block[4];
  id v34;
  WBSTouchIconCache *v35;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  -[NSCache objectForKey:](self->_requestsToResponses, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = !v6;
  else
    v13 = 0;
  if (!v13)
  {
    -[WBSTouchIconCache _responseForRequest:withTouchIcon:](self, "_responseForRequest:withTouchIcon:", v10, v11);
    v14 = objc_claimAutoreleasedReturnValue();

    -[NSCache setObject:forKey:](self->_requestsToResponses, "setObject:forKey:", v14, v10);
    v12 = (void *)v14;
    -[NSMutableDictionary removeObjectForKey:](self->_requestsToDelayedResponses, "removeObjectForKey:", v10);
  }
  objc_msgSend(v10, "activity");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__WBSTouchIconCache__setUpAndReturnPreparedResponseForRequest_withImage_imageState_didReceiveNewData___block_invoke;
  block[3] = &unk_1E54413C0;
  v30 = v10;
  v34 = v30;
  v35 = self;
  os_activity_apply(v15, block);

  WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  if ((objc_msgSend(v30, "options") & 2) != 0
    && (objc_msgSend(v30, "url"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = -[WBSTouchIconCache _shouldRequestTouchIconForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:knownImageState:](self, "_shouldRequestTouchIconForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:knownImageState:", v18, 0, 0, a5), v18, v19))
  {
    -[WBSTouchIconCache _blockOperationForRequest:knownImageState:](self, "_blockOperationForRequest:knownImageState:", v30, a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:forRequest:beginOperationUsingBlock:", self, v12, v30, v20);
  }
  else
  {
    objc_msgSend(v30, "activity", v30);
    v21 = objc_claimAutoreleasedReturnValue();
    v31[0] = v16;
    v31[1] = 3221225472;
    v31[2] = __102__WBSTouchIconCache__setUpAndReturnPreparedResponseForRequest_withImage_imageState_didReceiveNewData___block_invoke_28;
    v31[3] = &unk_1E54425B0;
    v22 = WeakRetained;
    v32 = v22;
    os_activity_apply(v21, v31);

    touchIconsDataForHosts = self->_touchIconsDataForHosts;
    objc_msgSend(v30, "url");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "host");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](touchIconsDataForHosts, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "lastResponseStatusCode");
    if (v27 > 399 || (v27 & 0xFFFFFFFFFFFFFFFELL) == 0xCC)
    {
      objc_msgSend(v26, "lastRequestDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dateByAddingTimeInterval:", 604800.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNextIconDownloadRetryDate:", v29);
    }
    else
    {
      objc_msgSend(v26, "lastRequestDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dateByAddingTimeInterval:", 3600.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNextIconDownloadRetryDate:", v29);
    }

    objc_msgSend(v22, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", self, v12, 0, v6, v30);
    v20 = v32;
  }

}

- (id)_responseForRequest:(id)a3 withTouchIcon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v6 = a3;
  v7 = a4;
  if (-[WBSTouchIconCache _shouldGenerateTouchIconFromTouchIcon:forRequest:](self, "_shouldGenerateTouchIconFromTouchIcon:forRequest:", v7, v6))
  {
    +[WBSSiteIconKeyColorExtractor keyColorForIcon:](WBSSiteIconKeyColorExtractor, "keyColorForIcon:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v6, "monogramConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "defaultBackgroundColor");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v8 = v12;

    }
    objc_msgSend((id)objc_opt_class(), "_generateFavoritesIconForRequest:withBackgroundColor:", v6, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSTouchIconResponse responseWithURL:touchIcon:generated:extractedBackgroundColor:](WBSTouchIconResponse, "responseWithURL:touchIcon:generated:extractedBackgroundColor:", v17, v16, 1, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "activity");
    v19 = objc_claimAutoreleasedReturnValue();
    os_activity_apply(v19, &__block_literal_global_43);

    -[WBSTouchIconCache _didGenerateResponse:forRequest:](self, "_didGenerateResponse:forRequest:", v18, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "activity");
    v13 = objc_claimAutoreleasedReturnValue();
    os_activity_apply(v13, &__block_literal_global_40_1);

    objc_msgSend(v6, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSTouchIconResponse responseWithURL:touchIcon:generated:extractedBackgroundColor:](WBSTouchIconResponse, "responseWithURL:touchIcon:generated:extractedBackgroundColor:", v14, v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSTouchIconCache _didGenerateResponse:forRequest:](self, "_didGenerateResponse:forRequest:", v8, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)_shouldGenerateTouchIconFromTouchIcon:(id)a3 forRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && (objc_msgSend(v6, "minimumIconSize"), v9 = v8, v11 = v10, objc_msgSend(v5, "size"), v12 >= v9))
  {
    objc_msgSend(v5, "size");
    v13 = v14 < v11;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (id)_didGenerateResponse:(id)a3 forRequest:(id)a4
{
  return a3;
}

- (BOOL)_shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5 knownImageState:(int64_t)a6
{
  BOOL result;
  char v8;

  v8 = 0;
  result = -[WBSTouchIconCache _shouldRequestTouchIconForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:shouldCheckImageState:](self, "_shouldRequestTouchIconForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:shouldCheckImageState:", a3, a4, a5, &v8);
  if (v8)
    return a6 == 1;
  return result;
}

- (BOOL)_shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5 shouldCheckImageState:(BOOL *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  double v17;
  double v18;

  v8 = a4;
  v10 = a3;
  *a6 = 0;
  if (-[WBSTouchIconCache _canFetchTouchIconForURL:inUserLoadedWebpage:](self, "_canFetchTouchIconForURL:inUserLoadedWebpage:", v10, v8))
  {
    objc_msgSend(v10, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_touchIconsDataForHosts, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
    if (v12)
    {
      if (v8 || self->_canFetchOutsideOfUserLoadedWebpage)
      {
        v13 = objc_msgSend(v12, "requestDidSucceed");
        if (v13 && !objc_msgSend(v12, "higherPriorityIconDownloadFailedDueToNetworkError"))
        {
          if ((objc_msgSend(v12, "lastRequestWasInUserLoadedWebpage") & 1) == 0
            && !self->_canFetchOutsideOfUserLoadedWebpage)
          {
            v15 = 1;
            goto LABEL_20;
          }
          objc_msgSend(v12, "lastRequestDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSinceNow");
          v18 = -345600.0;
        }
        else
        {
          v14 = objc_msgSend(v12, "lastResponseStatusCode");
          if (v14 > 399 || (v14 & 0xFFFFFFFFFFFFFFFELL) == 0xCC)
          {
            objc_msgSend(v12, "lastRequestDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "timeIntervalSinceNow");
            v18 = -604800.0;
          }
          else
          {
            v15 = 1;
            if (a5 || ((v13 ^ 1) & 1) != 0)
              goto LABEL_20;
            objc_msgSend(v12, "lastRequestDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "timeIntervalSinceNow");
            v18 = -3600.0;
          }
        }
        v15 = v17 < v18;

      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
      *a6 = 1;
    }
LABEL_20:

    goto LABEL_21;
  }
  v15 = 0;
LABEL_21:

  return v15;
}

- (BOOL)_canFetchTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (!self->_readOnly && (v7 = atomic_load((unsigned __int8 *)&self->_didLoadSettings), (v7 & 1) != 0))
  {
    objc_msgSend(v5, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "length") != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_generateFavoritesIconForRequest:(id)a3 withBackgroundColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "options") & 1) != 0)
  {
    objc_msgSend(v6, "monogramConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "monogramTitle");
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "monogramConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "fontWeight");
      objc_msgSend(v6, "monogramConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "fontDesign");
      objc_msgSend(v6, "monogramConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fontSize");
      objc_msgSend(a1, "generateFavoritesIconForTitle:url:backgroundColor:shouldRemoveGrammaticalArticles:fontWeight:fontDesign:fontSize:", v10, v11, v7, 0, v13, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "generateFavoritesIconForTitle:url:backgroundColor:", v10, v11, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (WBSTouchIconCache)initWithCacheDirectoryURL:(id)a3 isReadOnly:(BOOL)a4 protectionType:(int64_t)a5 allowFetchingOverCellularNetwork:(BOOL)a6 fileMappingStyle:(int64_t)a7 canFetchOutsideOfUserLoadedWebpage:(BOOL)a8
{
  id v15;
  WBSTouchIconCache *v16;
  WBSTouchIconCache *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;
  const char *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *internalQueue;
  uint64_t v26;
  NSMutableDictionary *hostsToRequestSets;
  uint64_t v28;
  NSMutableArray *pendingSaveTouchIconToDiskBlocks;
  uint64_t v30;
  NSMutableSet *pendingTouchIconRequestHosts;
  NSCache *v32;
  NSCache *requestsToResponses;
  uint64_t v34;
  NSMutableDictionary *requestsToDelayedResponses;
  WBSSiteMetadataImageCache *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  WBSSiteMetadataImageCache *imageCache;
  NSObject *v41;
  WBSTouchIconCache *v42;
  WBSTouchIconCache *v43;
  _QWORD block[4];
  WBSTouchIconCache *v46;
  objc_super v47;

  v15 = a3;
  v47.receiver = self;
  v47.super_class = (Class)WBSTouchIconCache;
  v16 = -[WBSTouchIconCache init](&v47, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_cacheDirectoryURL, a3);
    v17->_readOnly = a4;
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.internalQueue"), v20, v17);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = (const char *)objc_msgSend(v21, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create(v22, v23);
    internalQueue = v17->_internalQueue;
    v17->_internalQueue = (OS_dispatch_queue *)v24;

    v17->_touchIconsDataForHostsAccessLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    hostsToRequestSets = v17->_hostsToRequestSets;
    v17->_hostsToRequestSets = (NSMutableDictionary *)v26;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
    pendingSaveTouchIconToDiskBlocks = v17->_pendingSaveTouchIconToDiskBlocks;
    v17->_pendingSaveTouchIconToDiskBlocks = (NSMutableArray *)v28;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v30 = objc_claimAutoreleasedReturnValue();
    pendingTouchIconRequestHosts = v17->_pendingTouchIconRequestHosts;
    v17->_pendingTouchIconRequestHosts = (NSMutableSet *)v30;

    v32 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    requestsToResponses = v17->_requestsToResponses;
    v17->_requestsToResponses = v32;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v34 = objc_claimAutoreleasedReturnValue();
    requestsToDelayedResponses = v17->_requestsToDelayedResponses;
    v17->_requestsToDelayedResponses = (NSMutableDictionary *)v34;

    v17->_allowFetchingOverCellularNetwork = a6;
    v17->_protectionType = a5;
    v17->_fileMappingStyle = a7;
    v17->_canFetchOutsideOfUserLoadedWebpage = a8;
    v36 = [WBSSiteMetadataImageCache alloc];
    objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", CFSTR("Images"), 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a5 > 2)
      v38 = 0x20000000;
    else
      v38 = qword_1A84E37A0[a5];
    v39 = -[WBSSiteMetadataImageCache initWithImageDirectoryURL:imageType:fileProtectionOptions:](v36, "initWithImageDirectoryURL:imageType:fileProtectionOptions:", v37, 0, v38);
    imageCache = v17->_imageCache;
    v17->_imageCache = (WBSSiteMetadataImageCache *)v39;

    -[WBSSiteMetadataImageCache setDelegate:](v17->_imageCache, "setDelegate:", v17);
    -[WBSSiteMetadataImageCache setUpImageCache](v17->_imageCache, "setUpImageCache");
    v41 = v17->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __158__WBSTouchIconCache_initWithCacheDirectoryURL_isReadOnly_protectionType_allowFetchingOverCellularNetwork_fileMappingStyle_canFetchOutsideOfUserLoadedWebpage___block_invoke;
    block[3] = &unk_1E54425B0;
    v42 = v17;
    v46 = v42;
    dispatch_async(v41, block);
    v43 = v42;

  }
  return v17;
}

void __62__WBSTouchIconCache__setUpAndReturnDelayedResponseForRequest___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A840B000, v0, OS_LOG_TYPE_DEFAULT, "Preparing delayed response for request", v1, 2u);
  }
}

void __102__WBSTouchIconCache__setUpAndReturnPreparedResponseForRequest_withImage_imageState_didReceiveNewData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 98))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v5 = v4;
    v6 = 141558531;
    v7 = 1752392040;
    v8 = 2117;
    v9 = v3;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Determining Touch Icon request eligibility for URL: %{sensitive, mask.hash}@, _canFetchOutsideOfUserLoadedWebpage: %@", (uint8_t *)&v6, 0x20u);

  }
}

void __55__WBSTouchIconCache__responseForRequest_withTouchIcon___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A840B000, v0, OS_LOG_TYPE_DEFAULT, "Declining to generate an icon to satisfy the request", v1, 2u);
  }
}

- (id)siteMetadataImageCache:(id)a3 customFileNameForKeyString:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  if (self->_fileMappingStyle == 1)
  {
    os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_touchIconsDataForHosts, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
    if (!v6)
    {
      -[WBSSiteMetadataImageCacheSettingsSQLiteStore entryWithHost:](self->_cacheSettingsStore, "entryWithHost:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_setUpImageCacheSettingsSQLiteStore
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  NSMutableArray *pendingSaveTouchIconToDiskBlocks;
  NSMutableSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  uint64_t v18;
  void *v19;
  int v20;
  WBSSiteMetadataImageCache *imageCache;
  id v22;
  NSMutableSet *pendingTouchIconRequestHosts;
  void *v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[WBSTouchIconCache _ensureCacheDirectory](self, "_ensureCacheDirectory");
  -[WBSTouchIconCache _openCacheSettingsDatabaseIfNeeded](self, "_openCacheSettingsDatabaseIfNeeded");
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore allEntries](self->_cacheSettingsStore, "allEntries");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_cacheSettingsStore && !objc_msgSend(v24, "count"))
    -[WBSSiteMetadataImageCache removeAllImages](self->_imageCache, "removeAllImages");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v25;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v36 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v7, "host");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v8);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v4);
  }

  os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
  objc_storeStrong((id *)&self->_touchIconsDataForHosts, v3);
  os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = self->_pendingSaveTouchIconToDiskBlocks;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v9);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j) + 16))();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v10);
  }

  pendingSaveTouchIconToDiskBlocks = self->_pendingSaveTouchIconToDiskBlocks;
  self->_pendingSaveTouchIconToDiskBlocks = 0;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = self->_pendingTouchIconRequestHosts;
  v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k);
        os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_touchIconsDataForHosts, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
        v20 = objc_msgSend(v19, "isIconInCache");
        imageCache = self->_imageCache;
        if (v20)
        {
          v22 = -[WBSSiteMetadataImageCache imageForKeyString:getImageState:](imageCache, "imageForKeyString:getImageState:", v18, 0);
        }
        else
        {
          -[WBSSiteMetadataImageCache setImageState:forKeyString:](imageCache, "setImageState:forKeyString:", 1, v18);
          -[WBSTouchIconCache _notifyImageWasLoaded:forHost:](self, "_notifyImageWasLoaded:forHost:", 0, v18);
        }

      }
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v15);
  }

  pendingTouchIconRequestHosts = self->_pendingTouchIconRequestHosts;
  self->_pendingTouchIconRequestHosts = 0;

  atomic_store(1u, (unsigned __int8 *)&self->_didLoadSettings);
}

- (void)_ensureCacheDirectory
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_9(&dword_1A840B000, a3, (uint64_t)a3, "Error \"%{public}@\" trying to create image cache folder.", (uint8_t *)a2);

}

- (void)_openCacheSettingsDatabaseIfNeeded
{
  WBSTouchIconCacheSettingsSQLiteStore *v3;
  WBSTouchIconCacheSettingsSQLiteStore *v4;
  WBSTouchIconCacheSettingsSQLiteStore *cacheSettingsStore;
  id v6;

  if (!self->_cacheSettingsStore)
  {
    v3 = [WBSTouchIconCacheSettingsSQLiteStore alloc];
    -[WBSTouchIconCache _imageCacheSettingsDatabaseURL](self, "_imageCacheSettingsDatabaseURL");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = -[WBSSiteMetadataImageCacheSettingsSQLiteStore initWithDatabaseURL:protectionType:](v3, "initWithDatabaseURL:protectionType:");
    cacheSettingsStore = self->_cacheSettingsStore;
    self->_cacheSettingsStore = v4;

  }
}

- (id)_imageCacheSettingsDatabaseURL
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];
  uint8_t buf[16];

  -[WBSTouchIconCache cacheDirectoryURL](self, "cacheDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A840B000, v3, OS_LOG_TYPE_DEFAULT, "Using on-disk database for Icon Fetching.", v8, 2u);
    }
    objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("TouchIconCacheSettings.db"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_DEFAULT, "Using in-memory database for Icon Fetching.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0D8A1B0], "inMemoryDatabaseURL");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;

  return v6;
}

- (NSURL)cacheDirectoryURL
{
  return self->_cacheDirectoryURL;
}

- (WBSTouchIconCache)initWithCacheDirectoryURL:(id)a3 isReadOnly:(BOOL)a4
{
  return -[WBSTouchIconCache initWithCacheDirectoryURL:isReadOnly:protectionType:allowFetchingOverCellularNetwork:fileMappingStyle:canFetchOutsideOfUserLoadedWebpage:](self, "initWithCacheDirectoryURL:isReadOnly:protectionType:allowFetchingOverCellularNetwork:fileMappingStyle:canFetchOutsideOfUserLoadedWebpage:", a3, a4, 0, 1, 0, 0);
}

+ (UIColor)defaultBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.576470588, 0.584313725, 0.631372549, 1.0);
}

+ (UIColor)defaultGlyphColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
}

+ (id)generateFavoritesIconForTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5
{
  objc_msgSend(a1, "generateFavoritesIconForTitle:url:backgroundColor:shouldRemoveGrammaticalArticles:", a3, a4, a5, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)generateFavoritesIconForTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5 shouldRemoveGrammaticalArticles:(BOOL)a6
{
  objc_msgSend(a1, "generateFavoritesIconForTitle:url:backgroundColor:shouldRemoveGrammaticalArticles:fontWeight:fontDesign:fontSize:", a3, a4, a5, a6, 0, 0, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)generateFavoritesIconForTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5 shouldRemoveGrammaticalArticles:(BOOL)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 fontSize:(double)a9
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;

  v12 = a6;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  objc_msgSend(a1, "_monogramConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v18);
  objc_msgSend(v19, "setFontWeight:", a7);
  objc_msgSend(v19, "setFontDesign:", a8);
  if (a9 != 0.0)
    objc_msgSend(v19, "setFontSize:", a9);
  +[WBSTemplateIconMonogramGenerator monogramWithTitle:url:monogramConfiguration:shouldRemoveGrammaticalArticles:](WBSTemplateIconMonogramGenerator, "monogramWithTitle:url:monogramConfiguration:shouldRemoveGrammaticalArticles:", v16, v17, v19, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    objc_msgSend(a1, "_generateDefaultFavoritesIcon");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  return v23;
}

+ (UIImage)_generateDefaultFavoritesIcon
{
  return 0;
}

+ (WBSTemplateIconMonogramConfiguration)_monogramConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSTemplateIconMonogramConfiguration configurationWithBackgroundColor:](WBSTemplateIconMonogramConfiguration, "configurationWithBackgroundColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSTemplateIconMonogramConfiguration *)v3;
}

- (WBSTouchIconCache)init
{
  return -[WBSTouchIconCache initWithCacheDirectoryURL:](self, "initWithCacheDirectoryURL:", 0);
}

- (WBSTouchIconCache)initWithCacheDirectoryURL:(id)a3
{
  return -[WBSTouchIconCache initWithCacheDirectoryURL:isReadOnly:](self, "initWithCacheDirectoryURL:isReadOnly:", a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[WBSSiteMetadataImageCacheSettingsSQLiteStore close](self->_cacheSettingsStore, "close");
  v3.receiver = self;
  v3.super_class = (Class)WBSTouchIconCache;
  -[WBSTouchIconCache dealloc](&v3, sel_dealloc);
}

- (NSDictionary)uuidStringToHost
{
  NSObject *internalQueue;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__25;
  v21 = __Block_byref_object_dispose__25;
  v22 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__WBSTouchIconCache_uuidStringToHost__block_invoke;
  block[3] = &unk_1E5445F38;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(internalQueue, block);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)v18[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "UUIDString", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v8, "host");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v17, 8);
  return (NSDictionary *)v3;
}

void __37__WBSTouchIconCache_uuidStringToHost__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_openCacheSettingsDatabaseIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allEntries");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_saveTouchIconToDisk:(id)a3 forHost:(id)a4 requestDidSucceed:(BOOL)a5 statusCode:(int64_t)a6 isUserLoadedWebpageRequest:(BOOL)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  unsigned __int8 v20;
  NSMutableArray *pendingSaveTouchIconToDiskBlocks;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  int64_t v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;

  v14 = a3;
  v15 = a4;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __156__WBSTouchIconCache__saveTouchIconToDisk_forHost_requestDidSucceed_statusCode_isUserLoadedWebpageRequest_higherPriorityIconDownloadFailedDueToNetworkError___block_invoke;
  v24[3] = &unk_1E5446C98;
  v24[4] = self;
  v16 = v14;
  v25 = v16;
  v17 = v15;
  v28 = a5;
  v26 = v17;
  v27 = a6;
  v29 = a7;
  v30 = a8;
  v18 = (void (**)(_QWORD))MEMORY[0x1A85D45E4](v24);
  v19 = v18;
  v20 = atomic_load((unsigned __int8 *)&self->_didLoadSettings);
  if ((v20 & 1) != 0)
  {
    v18[2](v18);
  }
  else
  {
    pendingSaveTouchIconToDiskBlocks = self->_pendingSaveTouchIconToDiskBlocks;
    v22 = (void *)objc_msgSend(v18, "copy");
    v23 = (void *)MEMORY[0x1A85D45E4]();
    -[NSMutableArray addObject:](pendingSaveTouchIconToDiskBlocks, "addObject:", v23);

  }
}

void __156__WBSTouchIconCache__saveTouchIconToDisk_forHost_requestDidSucceed_statusCode_isUserLoadedWebpageRequest_higherPriorityIconDownloadFailedDueToNetworkError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_resizedImage:forHost:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)v2 + 128) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateTouchIconsDataForHost:image:requestDidSucceed:statusCode:isUserLoadedWebpageRequest:higherPriorityIconDownloadFailedDueToNetworkError:UUIDString:", *(_QWORD *)(a1 + 48), v3, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 65), *(unsigned __int8 *)(a1 + 66), v5);
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 141558275;
      v9 = 1752392040;
      v10 = 2117;
      v11 = v7;
      _os_log_impl(&dword_1A840B000, v6, OS_LOG_TYPE_DEFAULT, "Touch Icon saved to cache; host=%{sensitive, mask.hash}@",
        buf,
        0x16u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "saveImageToDisk:forKeyString:completionHandler:", v3, *(_QWORD *)(a1 + 48), 0);
  }

}

- (void)cacheFirstAvailableTouchIcon:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 allowFetchingOverCellularNetwork;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!self->_readOnly)
  {
    objc_msgSend(v7, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      +[WBSImageFetchingURLSessionTaskManager sharedManager](WBSImageFetchingURLSessionTaskManager, "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      allowFetchingOverCellularNetwork = self->_allowFetchingOverCellularNetwork;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke;
      v12[3] = &unk_1E5446CE8;
      v12[4] = self;
      v13 = v9;
      objc_msgSend(v10, "downloadFirstValidImageWithURLs:options:completionHandler:", v6, allowFetchingOverCellularNetwork, v12);

    }
  }

}

void __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;

  v9 = a2;
  v10 = a5;
  v11 = a6;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v14 = *(NSObject **)(v12 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke_2;
  block[3] = &unk_1E5444F28;
  v19 = v11;
  v20 = v12;
  v21 = v9;
  v22 = v13;
  v23 = v10;
  v15 = v10;
  v16 = v9;
  v17 = v11;
  dispatch_async(v14, block);

}

void __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke_3;
  v7[3] = &unk_1E5446CC0;
  v7[4] = &v8;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v7);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = objc_msgSend(*(id *)(a1 + 64), "statusCode");
  objc_msgSend(v3, "_saveTouchIconToDisk:forHost:requestDidSucceed:statusCode:isUserLoadedWebpageRequest:higherPriorityIconDownloadFailedDueToNetworkError:", v4, v5, 1, v6, 1, *((unsigned __int8 *)v9 + 24));
  _Block_object_dispose(&v8, 8);
}

uint64_t __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "safari_isOrContainsClientSideNetworkError");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)retainTouchIconForURLString:(id)a3
{
  id v4;
  WBSSiteMetadataImageCache *imageCache;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  imageCache = self->_imageCache;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__WBSTouchIconCache_retainTouchIconForURLString___block_invoke;
  v7[3] = &unk_1E5446B58;
  v8 = v4;
  v6 = v4;
  -[WBSSiteMetadataImageCache retainImageWithKeyStringProvider:](imageCache, "retainImageWithKeyStringProvider:", v7);

}

id __49__WBSTouchIconCache_retainTouchIconForURLString___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)retainTouchIconForHost:(id)a3
{
  -[WBSSiteMetadataImageCache retainImageForKeyString:](self->_imageCache, "retainImageForKeyString:", a3);
}

- (void)retainTouchIconsForHosts:(id)a3
{
  -[WBSSiteMetadataImageCache retainImagesForKeyStrings:](self->_imageCache, "retainImagesForKeyStrings:", a3);
}

- (void)releaseTouchIconForURLString:(id)a3
{
  id v4;
  WBSSiteMetadataImageCache *imageCache;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  imageCache = self->_imageCache;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__WBSTouchIconCache_releaseTouchIconForURLString___block_invoke;
  v7[3] = &unk_1E5446B58;
  v8 = v4;
  v6 = v4;
  -[WBSSiteMetadataImageCache releaseImageWithKeyStringProvider:](imageCache, "releaseImageWithKeyStringProvider:", v7);

}

id __50__WBSTouchIconCache_releaseTouchIconForURLString___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)releaseTouchIconForHost:(id)a3
{
  -[WBSSiteMetadataImageCache releaseImageForKeyString:](self->_imageCache, "releaseImageForKeyString:", a3);
}

- (void)releaseTouchIconsForHosts:(id)a3
{
  -[WBSSiteMetadataImageCache releaseImagesForKeyStrings:](self->_imageCache, "releaseImagesForKeyStrings:", a3);
}

- (BOOL)hasDeterminedIconAvailabilityForURL:(id)a3
{
  WBSSiteMetadataImageCache *imageCache;
  void *v4;

  imageCache = self->_imageCache;
  objc_msgSend(a3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(imageCache) = -[WBSSiteMetadataImageCache imageStateForKeyString:](imageCache, "imageStateForKeyString:", v4) != 0;

  return (char)imageCache;
}

- (BOOL)shouldRequestTouchIconForWebPageNavigationFromBookmarkInteractionForURL:(id)a3
{
  return -[WBSTouchIconCache _shouldRequestTouchIconWithTimeoutForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:](self, "_shouldRequestTouchIconWithTimeoutForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:", a3, 1, 1);
}

- (BOOL)shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4
{
  return -[WBSTouchIconCache _shouldRequestTouchIconWithTimeoutForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:](self, "_shouldRequestTouchIconWithTimeoutForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:", a3, a4, 0);
}

- (BOOL)_shouldRequestTouchIconWithTimeoutForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  BOOL v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    v10 = -[WBSTouchIconCache _shouldRequestTouchIconForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:](self, "_shouldRequestTouchIconForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:", v8, v6, v5);
  else
    v10 = 0;

  return v10;
}

- (BOOL)_shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  BOOL v9;
  WBSSiteMetadataImageCache *imageCache;
  void *v11;
  BOOL v12;
  char v14;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v14 = 0;
  v9 = -[WBSTouchIconCache _shouldRequestTouchIconForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:shouldCheckImageState:](self, "_shouldRequestTouchIconForURL:inUserLoadedWebpage:initiatedFromBookmarkInteraction:shouldCheckImageState:", v8, v6, v5, &v14);
  if (v14)
  {
    imageCache = self->_imageCache;
    objc_msgSend(v8, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WBSSiteMetadataImageCache imageStateForKeyString:](imageCache, "imageStateForKeyString:", v11) == 1;

  }
  else
  {
    v12 = v9;
  }

  return v12;
}

void __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 141558787;
    v6 = 1752392040;
    v7 = 2117;
    v8 = v3;
    v9 = 2160;
    v10 = 1752392040;
    v11 = 2117;
    v12 = v4;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Returning response %{sensitive, mask.hash}@ for URL %{sensitive, mask.hash}@", (uint8_t *)&v5, 0x2Au);
  }
}

void __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke_25(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 141558275;
    v5 = 1752392040;
    v6 = 2117;
    v7 = v3;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Icon should be fetched for URL %{sensitive, mask.hash}@", (uint8_t *)&v4, 0x16u);
  }
}

void __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 141558787;
    v6 = 1752392040;
    v7 = 2117;
    v8 = v3;
    v9 = 2160;
    v10 = 1752392040;
    v11 = 2117;
    v12 = v4;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Returning response %{sensitive, mask.hash}@ for URL %{sensitive, mask.hash}@", (uint8_t *)&v5, 0x2Au);
  }
}

- (id)_responseForTouchIconRequestWithNoHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_generateFavoritesIconForRequest:withBackgroundColor:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSTouchIconResponse responseWithURL:touchIcon:generated:extractedBackgroundColor:](WBSTouchIconResponse, "responseWithURL:touchIcon:generated:extractedBackgroundColor:", 0, v6, 1, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSTouchIconCache _didGenerateResponse:forRequest:](self, "_didGenerateResponse:forRequest:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __102__WBSTouchIconCache__setUpAndReturnPreparedResponseForRequest_withImage_imageState_didReceiveNewData___block_invoke_28(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Will not attempt to request an icon; returning successful response to %@",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *internalQueue;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__WBSTouchIconCache_stopWatchingUpdatesForRequest___block_invoke;
    block[3] = &unk_1E5441410;
    block[4] = self;
    v9 = v6;
    v10 = v4;
    dispatch_async(internalQueue, block);

  }
}

void __51__WBSTouchIconCache_stopWatchingUpdatesForRequest___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", a1[6]);
  if (!objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(a1[4] + 32), "removeObjectForKey:", a1[5]);

}

- (id)_blockOperationForRequest:(id)a3 knownImageState:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke;
  v10[3] = &unk_1E5446D80;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a4;
  v8 = (void *)MEMORY[0x1A85D45E4](v10);
  objc_destroyWeak(v12);

  objc_destroyWeak(&location);
  return v8;
}

id __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10[2];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke_2;
  v8[3] = &unk_1E5446D58;
  objc_copyWeak(v10, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  v5 = *(void **)(a1 + 56);
  v9 = v4;
  v10[1] = v5;
  objc_msgSend(v2, "_operationWithRequest:completionHandler:", v3, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));

  objc_destroyWeak(v10);
  return v6;
}

void __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke_3;
    v9[3] = &unk_1E5446D30;
    v9[4] = WeakRetained;
    v10 = v3;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 48);
    v11 = v7;
    v12 = v8;
    dispatch_async(v6, v9);

  }
}

uint64_t __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveTouchIconToDiskWithResult:forRequest:knownImageState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)emptyCaches
{
  NSObject *internalQueue;
  _QWORD block[5];

  if (!self->_readOnly)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__WBSTouchIconCache_emptyCaches__block_invoke;
    block[3] = &unk_1E54425B0;
    block[4] = self;
    dispatch_async(internalQueue, block);
  }
}

uint64_t __32__WBSTouchIconCache_emptyCaches__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Emptying Icon Cache", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_openCacheSettingsDatabaseIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "deleteAllEntries");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllImages");
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "emptyCache");
}

- (void)purgeUnneededCacheEntries
{
  void *v3;

  if (!self->_readOnly)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("WBSTouchIconCacheWillPurgeUnneededImagesNotification"), self);

    -[WBSSiteMetadataImageCache purgeUnneededImages](self->_imageCache, "purgeUnneededImages");
  }
}

- (void)savePendingChangesBeforeTermination
{
  NSObject *internalQueue;
  _QWORD block[5];

  if (!self->_readOnly)
    -[WBSSiteMetadataImageCache savePendingChangesBeforeTermination](self->_imageCache, "savePendingChangesBeforeTermination");
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WBSTouchIconCache_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __56__WBSTouchIconCache_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "close");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 88);
  *(_QWORD *)(v2 + 88) = 0;

}

- (void)performMaintenanceWork
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WBSTouchIconCache_performMaintenanceWork__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __43__WBSTouchIconCache_performMaintenanceWork__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "performMaintenanceWork");
}

- (double)_maximumScreenScale
{
  double result;
  void *v3;
  double v4;
  double v5;

    return *(double *)&-[WBSTouchIconCache _maximumScreenScale]::maximumScreenScale;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  result = v5;
  -[WBSTouchIconCache _maximumScreenScale]::maximumScreenScale = *(_QWORD *)&v5;
  return result;
}

- (id)_resizedImage:(id)a3 forHost:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_hostsToRequestSets, "objectForKeyedSubscript:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v28;
      v11 = 0.0;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "maximumIconSize");
          if (v14 <= v12)
            v16 = v12;
          else
            v16 = v14;
          v12 = v16;
          if (v15 <= v11)
            v17 = v11;
          else
            v17 = v15;
          v11 = v17;
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
      v12 = 0.0;
    }

    -[WBSTouchIconCache _maximumScreenScale](self, "_maximumScreenScale");
    v20 = v19;
    v21 = v12 == 0.0;
    if (v11 == 0.0)
      v21 = 1;
    if (v21)
    {
      v12 = 72.0;
      v11 = 72.0;
    }
    objc_msgSend(v6, "size");
    if (v23 > v20 * v12 || v22 > v20 * v11)
    {
      +[WBSImageUtilities imageSizeScalingSize:proportionallyToFitSize:](WBSImageUtilities, "imageSizeScalingSize:proportionallyToFitSize:");
      +[WBSImageUtilities resizedImage:withSize:](WBSImageUtilities, "resizedImage:withSize:", v6);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = v6;
    }
    v18 = v25;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_saveTouchIconToDiskWithResult:(id)a3 forRequest:(id)a4 knownImageState:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  char v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;

  v8 = a3;
  objc_msgSend(a4, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "touchIcon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "statusCode");

  if (a5)
    v14 = v11 == 0;
  else
    v14 = 0;
  v15 = v14;
  -[WBSTouchIconCache _saveTouchIconToDisk:forHost:requestDidSucceed:statusCode:isUserLoadedWebpageRequest:higherPriorityIconDownloadFailedDueToNetworkError:](self, "_saveTouchIconToDisk:forHost:requestDidSucceed:statusCode:isUserLoadedWebpageRequest:higherPriorityIconDownloadFailedDueToNetworkError:", v11, v10, objc_msgSend(v8, "pageRequestDidSucceed"), v13, 0, objc_msgSend(v8, "higherPriorityIconDownloadFailedDueToNetworkError"));
  if ((v15 & 1) != 0 && (objc_msgSend(v8, "failedDueToUnrecoverableNetworkError") & 1) == 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __79__WBSTouchIconCache__saveTouchIconToDiskWithResult_forRequest_knownImageState___block_invoke;
    v16[3] = &unk_1E5446DA8;
    v16[4] = self;
    v17 = 0;
    v18 = 1;
    -[WBSTouchIconCache _enumerateRequestsForHost:usingBlock:](self, "_enumerateRequestsForHost:usingBlock:", v10, v16);

  }
}

uint64_t __79__WBSTouchIconCache__saveTouchIconToDiskWithResult_forRequest_knownImageState___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setUpAndReturnPreparedResponseForRequest:withImage:imageState:didReceiveNewData:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (void)_updateTouchIconsDataForHost:(id)a3 image:(id)a4 requestDidSucceed:(BOOL)a5 statusCode:(int64_t)a6 isUserLoadedWebpageRequest:(BOOL)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8 UUIDString:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v12;
  id v15;
  id v16;
  WBSTouchIconCacheSettingsEntry *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v9 = a8;
  v10 = a7;
  v12 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v22 = a9;
  os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_touchIconsDataForHosts, "objectForKeyedSubscript:", v15);
  v17 = (WBSTouchIconCacheSettingsEntry *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (v16)
    {
LABEL_3:
      v18 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    v17 = -[WBSTouchIconCacheSettingsEntry initWithHost:]([WBSTouchIconCacheSettingsEntry alloc], "initWithHost:", v15);
    if (v16)
      goto LABEL_3;
  }
  v18 = -[WBSTouchIconCacheSettingsEntry isIconInCache](v17, "isIconInCache");
LABEL_6:
  -[WBSTouchIconCacheSettingsEntry entryByAddingRequestInUserLoadedWebPage:isIconInCache:requestDidSucceed:lastResponseStatusCode:transparencyAnalysisResult:higherPriorityIconDownloadFailedDueToNetworkError:UUIDString:](v17, "entryByAddingRequestInUserLoadedWebPage:isIconInCache:requestDidSucceed:lastResponseStatusCode:transparencyAnalysisResult:higherPriorityIconDownloadFailedDueToNetworkError:UUIDString:", v10, v18, v12, a6, -[WBSTouchIconCache _transparencyAnalysisResultForImage:](self, "_transparencyAnalysisResultForImage:", v16), v9, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_touchIconsDataForHosts, "setObject:forKeyedSubscript:", v19, v15);
  os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
  v20 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = CFSTR("failed");
    v24 = 1752392040;
    *(_DWORD *)buf = 141558531;
    if (v12)
      v21 = CFSTR("succeeded");
    v25 = 2117;
    v26 = v19;
    v27 = 2112;
    v28 = v21;
    _os_log_impl(&dword_1A840B000, v20, OS_LOG_TYPE_DEFAULT, "Saved touch icon cache settings %{sensitive, mask.hash}@ request %@", buf, 0x20u);
  }
  -[WBSTouchIconCache saveTouchIconSettings:touchIcon:](self, "saveTouchIconSettings:touchIcon:", v19, v16);

}

- (void)saveTouchIconSettings:(id)a3 touchIcon:(id)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_touchIconsDataForHostsAccessLock;
  NSMutableDictionary *touchIconsDataForHosts;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[WBSTouchIconCache _willSaveTouchIcon:withCacheSettingsEntry:](self, "_willSaveTouchIcon:withCacheSettingsEntry:", v6, v11);
  -[WBSTouchIconCache _openCacheSettingsDatabaseIfNeeded](self, "_openCacheSettingsDatabaseIfNeeded");
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore saveEntry:](self->_cacheSettingsStore, "saveEntry:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    p_touchIconsDataForHostsAccessLock = &self->_touchIconsDataForHostsAccessLock;
    os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
    touchIconsDataForHosts = self->_touchIconsDataForHosts;
    objc_msgSend(v11, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](touchIconsDataForHosts, "setObject:forKeyedSubscript:", v7, v10);

    os_unfair_lock_unlock(p_touchIconsDataForHostsAccessLock);
  }

}

- (void)removeTouchIconMetadataForHosts:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  WBSTouchIconCache *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__WBSTouchIconCache_removeTouchIconMetadataForHosts_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __71__WBSTouchIconCache_removeTouchIconMetadataForHosts_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_removeTouchIconsDataForHost:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++), (_QWORD)v7);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_removeTouchIconsDataForHost:(id)a3
{
  -[WBSTouchIconCache _removeTouchIconsDataForHost:ifIconIsInCache:](self, "_removeTouchIconsDataForHost:ifIconIsInCache:", a3, 0);
}

- (void)_removeTouchIconsDataForHost:(id)a3 ifIconIsInCache:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int v7;
  id v8;

  v4 = a4;
  v8 = a3;
  os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
  if (!v4
    || (-[NSMutableDictionary objectForKeyedSubscript:](self->_touchIconsDataForHosts, "objectForKeyedSubscript:", v8),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isIconInCache"),
        v6,
        v7))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_touchIconsDataForHosts, "removeObjectForKey:", v8);
  }
  os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
  -[WBSTouchIconCache _openCacheSettingsDatabaseIfNeeded](self, "_openCacheSettingsDatabaseIfNeeded");
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore deleteEntryWithHost:](self->_cacheSettingsStore, "deleteEntryWithHost:", v8);

}

void __55__WBSTouchIconCache__responseForRequest_withTouchIcon___block_invoke_42()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A840B000, v0, OS_LOG_TYPE_DEFAULT, "Generated an icon to satisfy the request", v1, 2u);
  }
}

- (NSURL)imageDirectoryURL
{
  return -[WBSSiteMetadataImageCache imageDirectoryURL](self->_imageCache, "imageDirectoryURL");
}

- (void)siteMetadataImageCache:(id)a3 didRemoveImageFromCacheForKeyString:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__WBSTouchIconCache_siteMetadataImageCache_didRemoveImageFromCacheForKeyString___block_invoke;
  v8[3] = &unk_1E54413C0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(internalQueue, v8);

}

uint64_t __80__WBSTouchIconCache_siteMetadataImageCache_didRemoveImageFromCacheForKeyString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeTouchIconsDataForHost:", *(_QWORD *)(a1 + 40));
}

- (void)siteMetadataImageCacheDidEmptyCache:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__WBSTouchIconCache_siteMetadataImageCacheDidEmptyCache___block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __57__WBSTouchIconCache_siteMetadataImageCacheDidEmptyCache___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_notifyImageWasLoaded:forHost:", 0, *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++), (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)webViewMetadataFetchOperation:(id)a3 getWebViewOfSize:(CGSize)a4 withConfiguration:(id)a5 completionHandler:(id)a6
{
  double height;
  double width;
  WBSSiteMetadataProviderDelegate **p_providerDelegate;
  id v11;
  id v12;
  id WeakRetained;

  height = a4.height;
  width = a4.width;
  p_providerDelegate = &self->_providerDelegate;
  v11 = a6;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  objc_msgSend(WeakRetained, "siteMetadataProvider:getWebViewOfSize:withConfiguration:completionHandler:", self, v12, v11, width, height);

}

- (void)webViewMetadataFetchOperation:(id)a3 didFinishUsingWebView:(id)a4
{
  WBSSiteMetadataProviderDelegate **p_providerDelegate;
  id v6;
  id WeakRetained;

  p_providerDelegate = &self->_providerDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  objc_msgSend(WeakRetained, "siteMetadataProvider:didFinishUsingWebView:", self, v6);

}

- (id)_operationWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WBSTouchIconFetchOperation *v8;

  v6 = a3;
  v7 = a4;
  v8 = -[WBSTouchIconFetchOperation initWithRequest:allowFetchingOverCellularNetwork:completionHandler:]([WBSTouchIconFetchOperation alloc], "initWithRequest:allowFetchingOverCellularNetwork:completionHandler:", v6, self->_allowFetchingOverCellularNetwork, v7);

  return v8;
}

- (int64_t)_transparencyAnalysisResultForImage:(id)a3
{
  return objc_msgSend(a3, "safari_transparencyAnalysisResult");
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  return (WBSSiteMetadataProviderDelegate *)objc_loadWeakRetained((id *)&self->_providerDelegate);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (int64_t)protectionType
{
  return self->_protectionType;
}

- (int64_t)fileMappingStyle
{
  return self->_fileMappingStyle;
}

- (BOOL)allowFetchingOverCellularNetwork
{
  return self->_allowFetchingOverCellularNetwork;
}

- (BOOL)canFetchOutsideOfUserLoadedWebpage
{
  return self->_canFetchOutsideOfUserLoadedWebpage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_cacheSettingsStore, 0);
  objc_storeStrong((id *)&self->_pendingTouchIconRequestHosts, 0);
  objc_storeStrong((id *)&self->_pendingSaveTouchIconToDiskBlocks, 0);
  objc_storeStrong((id *)&self->_requestsToDelayedResponses, 0);
  objc_storeStrong((id *)&self->_requestsToResponses, 0);
  objc_storeStrong((id *)&self->_touchIconsDataForHosts, 0);
  objc_storeStrong((id *)&self->_hostsToRequestSets, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)_didLoadTouchIcon:(uint64_t)a3 withCacheSettingsEntry:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_9(&dword_1A840B000, a2, a3, "Unexpected value passed to transparencyAnalysisResultFromInteger: %zd", (uint8_t *)&v3);
}

@end
