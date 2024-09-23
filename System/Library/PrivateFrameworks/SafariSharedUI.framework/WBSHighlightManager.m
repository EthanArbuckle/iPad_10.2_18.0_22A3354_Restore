@implementation WBSHighlightManager

- (void)_setHighlights:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *highlights;
  void *v8;
  NSObject *v9;
  NSArray *v10;
  NSObject *v11;
  id WeakRetained;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &__block_literal_global_23);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != self->_highlights)
  {
    if (-[NSArray count](v4, "count") > 0x18)
    {
      -[NSArray subarrayWithRange:](v5, "subarrayWithRange:", 0, 24);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (NSArray *)-[NSArray copy](v5, "copy");
    }
    highlights = self->_highlights;
    self->_highlights = v6;

    -[WBSHighlightManager _updateAttributionViews](self, "_updateAttributionViews");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("WBSHighlightsContentDidChangeNotification"), self);

    v9 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = self->_highlights;
      v11 = v9;
      v13 = 134217984;
      v14 = -[NSArray count](v10, "count");
      _os_log_impl(&dword_1A840B000, v11, OS_LOG_TYPE_INFO, "Received %lu highlights for suggestions", (uint8_t *)&v13, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsProviderDelegate);
    objc_msgSend(WeakRetained, "startPageSuggestionsProvider:didUpdateSuggestions:", self, self->_highlights);

  }
}

- (void)_updateAttributionViews
{
  NSMutableDictionary *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *highlightToAttributionViewMap;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[WBSHighlightManager highlights](self, "highlights", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_highlightToAttributionViewMap, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, v10);
        }
        else
        {
          v12 = (void *)objc_msgSend(objc_alloc((Class)getSLAttributionViewClass()), "initWithHighlight:", v9);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  highlightToAttributionViewMap = self->_highlightToAttributionViewMap;
  self->_highlightToAttributionViewMap = v3;

}

- (NSArray)highlights
{
  return self->_highlights;
}

- (void)_didFetchHighlights
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *deferredAttributionPresenters;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_deferredAttributionPresenters;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[WBSHighlightManager _showBannerIfNeededForPresenter:](self, "_showBannerIfNeededForPresenter:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  deferredAttributionPresenters = self->_deferredAttributionPresenters;
  self->_deferredAttributionPresenters = 0;

  self->_isFetchingHighlights = 0;
}

- (WBSHighlightManager)init
{
  WBSHighlightManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  NSObject *v5;
  WBSHighlightManager *v6;
  NSCache *v7;
  NSCache *linkDataCache;
  WBSHighlightManager *v9;
  _QWORD block[4];
  WBSHighlightManager *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WBSHighlightManager;
  v2 = -[WBSHighlightManager init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Safari.HighlightManager", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__WBSHighlightManager_init__block_invoke;
    block[3] = &unk_1E5441CB8;
    v6 = v2;
    v12 = v6;
    dispatch_async(v5, block);
    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    linkDataCache = v6->_linkDataCache;
    v6->_linkDataCache = v7;

    -[WBSHighlightManager _updateHighlights](v6, "_updateHighlights");
    -[WBSHighlightManager _enableNewSLAttributionViewAppereance](v6, "_enableNewSLAttributionViewAppereance");
    v9 = v6;

  }
  return v2;
}

- (void)_updateHighlights
{
  NSObject *internalQueue;
  _QWORD block[5];
  id v5;
  id location;

  self->_isFetchingHighlights = 1;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__WBSHighlightManager__updateHighlights__block_invoke;
  block[3] = &unk_1E5442448;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(internalQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_enableNewSLAttributionViewAppereance
{
  if (_enableNewSLAttributionViewAppereance_once != -1)
    dispatch_once(&_enableNewSLAttributionViewAppereance_once, &__block_literal_global_14_1);
}

void __40__WBSHighlightManager__updateHighlights__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__WBSHighlightManager__updateHighlights__block_invoke_2;
  v3[3] = &unk_1E5443FD8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v2 = (void *)MEMORY[0x1A85D45E4](v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fetchHighlights:", v2);

  objc_destroyWeak(&v4);
}

uint64_t __60__WBSHighlightManager__enableNewSLAttributionViewAppereance__block_invoke()
{
  id SLAttributionViewClass;
  uint64_t result;

  SLAttributionViewClass = getSLAttributionViewClass();
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(SLAttributionViewClass, "useNewDefaultBackgroundStyle");
  return result;
}

uint64_t __27__WBSHighlightManager_init__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getSLHighlightCenterClass_softClass;
  v12 = getSLHighlightCenterClass_softClass;
  if (!getSLHighlightCenterClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getSLHighlightCenterClass_block_invoke;
    v8[3] = &unk_1E54424C0;
    v8[4] = &v9;
    __getSLHighlightCenterClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  v4 = objc_alloc_init(v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:");
}

void __40__WBSHighlightManager__updateHighlights__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = WBS_LOG_CHANNEL_PREFIXInterstellar();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __40__WBSHighlightManager__updateHighlights__block_invoke_2_cold_1(v8, v6);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__WBSHighlightManager__updateHighlights__block_invoke_25;
    block[3] = &unk_1E5441F48;
    v9 = &v15;
    objc_copyWeak(&v15, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = v8;
      *(_DWORD *)buf = 134217984;
      v17 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1A840B000, v10, OS_LOG_TYPE_INFO, "Fetched %ld Highlights.", buf, 0xCu);

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__WBSHighlightManager__updateHighlights__block_invoke_26;
    v11[3] = &unk_1E5442448;
    v9 = &v13;
    objc_copyWeak(&v13, (id *)(a1 + 32));
    v12 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  objc_destroyWeak(v9);

}

+ (void)initialize
{
  Class v2;
  objc_class *v3;
  void (*v4)(void);

  if ((id)objc_opt_class() == a1)
  {
    v2 = NSClassFromString(CFSTR("SLHighlight"));
    if (v2)
    {
      v3 = v2;
      v4 = imp_implementationWithBlock(&__block_literal_global_16);
      class_addMethod(v3, sel_suggestionIdentifier, v4, "@@:");
    }
  }
}

uint64_t __33__WBSHighlightManager_initialize__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)fetchMetadataForHighlight:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  WBSHighlightManager *v15;
  id v16;
  void (**v17)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](self->_linkDataCache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v7[2](v7, v9);
  }
  else
  {
    objc_msgSend(v6, "attributions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke;
    v13[3] = &unk_1E5443F48;
    v14 = v6;
    v15 = self;
    v16 = v8;
    v17 = v7;
    -[WBSHighlightManager loadLinkMetadataForMessageWithGUID:completionHandler:](self, "loadLinkMetadataForMessageWithGUID:completionHandler:", v12, v13);

  }
}

void __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke_cold_1((uint64_t)v7, v9, v6);
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v7;
      _os_log_impl(&dword_1A840B000, v9, OS_LOG_TYPE_INFO, "Highlight <%{public}@> has no metadata", buf, 0xCu);
    }
    v5 = objc_alloc_init(MEMORY[0x1E0CC11A8]);

  }
  objc_msgSend(v5, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "resourceURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setURL:", v11);

    objc_msgSend(v5, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOriginalURL:", v12);

  }
  objc_msgSend(v5, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v5, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safari_canonicalURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safari_originalDataAsString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v17);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke_18;
  block[3] = &unk_1E5443638;
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(void **)(a1 + 48);
  v23 = v6;
  v24 = v18;
  v25 = v5;
  v26 = v19;
  v27 = *(id *)(a1 + 56);
  v20 = v5;
  v21 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke_18(_QWORD *a1)
{
  if (!a1[4])
    objc_msgSend(*(id *)(a1[5] + 24), "setObject:forKey:", a1[6], a1[7]);
  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

- (void)updateHighlightForAttributionPresenter:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSMutableArray *deferredAttributionPresenters;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint8_t v10[16];

  v4 = a3;
  if (self->_isFetchingHighlights)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_INFO, "Defer checking for Highlight until the Highlight Center finishes fetching.", v10, 2u);
    }
    v6 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[WBSHighlightManager updateHighlightForAttributionPresenter:].cold.1(v6, v4);
    deferredAttributionPresenters = self->_deferredAttributionPresenters;
    if (!deferredAttributionPresenters)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v9 = self->_deferredAttributionPresenters;
      self->_deferredAttributionPresenters = v8;

      deferredAttributionPresenters = self->_deferredAttributionPresenters;
    }
    -[NSMutableArray addObject:](deferredAttributionPresenters, "addObject:", v4);
  }
  else
  {
    -[WBSHighlightManager _showBannerIfNeededForPresenter:](self, "_showBannerIfNeededForPresenter:", v4);
  }

}

- (void)_showBannerIfNeededForPresenter:(id)a3
{
  id v4;
  NSArray *highlights;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;

  v4 = a3;
  highlights = self->_highlights;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__WBSHighlightManager__showBannerIfNeededForPresenter___block_invoke;
  v11[3] = &unk_1E5443F70;
  v6 = v4;
  v12 = v6;
  -[NSArray safari_firstObjectPassingTest:](highlights, "safari_firstObjectPassingTest:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A840B000, v8, OS_LOG_TYPE_INFO, "Found a matching Highlight", v10, 2u);
    }
    v9 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[WBSHighlightManager _showBannerIfNeededForPresenter:].cold.1(v9, v6);
  }
  objc_msgSend(v6, "displayAttributionBannerForHighlightIfNeeded:", v7);

}

uint64_t __55__WBSHighlightManager__showBannerIfNeededForPresenter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  WBSURLForHighlight(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_canonicalURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_userVisibleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attributionPresenterURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_canonicalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_userVisibleString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  return v9;
}

- (void)sendFeedbackForHighlight:(id)a3 withType:(unint64_t)a4 inPrivateBrowsing:(BOOL)a5
{
  id v8;
  NSObject *v9;

  v8 = a3;
  if (!a5)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[WBSHighlightManager sendFeedbackForHighlight:withType:inPrivateBrowsing:].cold.1(v9, v8, a4);
    -[SLHighlightCenter feedbackForHighlight:withType:completionBlock:](self->_highlightCenter, "feedbackForHighlight:withType:completionBlock:", v8, a4, 0);
  }

}

- (id)attributionViewForHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_highlightToAttributionViewMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)getSLAttributionViewClass()), "initWithHighlight:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_highlightToAttributionViewMap, "setObject:forKeyedSubscript:", v6, v5);
  }
  v7 = v6;

  return v7;
}

uint64_t __38__WBSHighlightManager__setHighlights___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "resourceURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_isSharedTabGroupURL") ^ 1;

  return v3;
}

void __40__WBSHighlightManager__updateHighlights__block_invoke_25(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_didFetchHighlights");
    WeakRetained = v2;
  }

}

void __40__WBSHighlightManager__updateHighlights__block_invoke_26(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_setHighlights:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_didFetchHighlights");
    WeakRetained = v3;
  }

}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WBSHighlightManager *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke;
  v7[3] = &unk_1E5441848;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXInterstellar();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    *(_DWORD *)buf = 134217984;
    v18 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_INFO, "%ld Highlight(s) removed.", buf, 0xCu);

  }
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke_28;
  v16[3] = &unk_1E5444000;
  v6 = *(void **)(a1 + 32);
  v16[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "safari_setByApplyingBlock:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_handleRemovalOfHighlights:", v7);
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
  v11 = v5;
  v12 = 3221225472;
  v13 = __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke_2;
  v14 = &unk_1E5443F70;
  v15 = v7;
  v9 = v7;
  objc_msgSend(v8, "safari_filterObjectsUsingBlock:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_setHighlights:", v10, v11, v12, v13, v14);

}

id __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke_28(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", v3);
  return v3;
}

uint64_t __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__WBSHighlightManager_highlightCenterDidAddHighlights___block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __55__WBSHighlightManager_highlightCenterDidAddHighlights___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXInterstellar();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_INFO, "Highlight Center did add Highlights.", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateHighlights");
}

- (NSString)providerSectionIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0D8A660];
}

- (NSArray)suggestions
{
  return self->_highlights;
}

- (WBSStartPageSuggestionsProviderDelegate)suggestionsProviderDelegate
{
  return (WBSStartPageSuggestionsProviderDelegate *)objc_loadWeakRetained((id *)&self->_suggestionsProviderDelegate);
}

- (void)setSuggestionsProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionsProviderDelegate, a3);
}

- (BOOL)isFetchingHighlights
{
  return self->_isFetchingHighlights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_destroyWeak((id *)&self->_suggestionsProviderDelegate);
  objc_storeStrong((id *)&self->_highlightToAttributionViewMap, 0);
  objc_storeStrong((id *)&self->_deferredAttributionPresenters, 0);
  objc_storeStrong((id *)&self->_linkDataCache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_highlightCenter, 0);
}

void __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1A840B000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch metadata for Highlight <%{public}@>: %{public}@", v6, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

- (void)updateHighlightForAttributionPresenter:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend(a2, "attributionPresenterURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_userVisibleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A840B000, v6, v7, "Defer checking for Highlight for tab with URL: %{private}@", v8, v9, v10, v11, 3u);

  OUTLINED_FUNCTION_2_0();
}

- (void)_showBannerIfNeededForPresenter:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend(a2, "attributionPresenterURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_userVisibleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A840B000, v6, v7, "Found a matching Highlight for tab with URL: %{private}@", v8, v9, v10, v11, 3u);

  OUTLINED_FUNCTION_2_0();
}

- (void)sendFeedbackForHighlight:(void *)a1 withType:(void *)a2 inPrivateBrowsing:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint8_t v9[24];

  v5 = OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("Other");
  if (a3 == 1)
    v7 = CFSTR("Interacted");
  if (!a3)
    v7 = CFSTR("Displayed");
  v8 = v7;
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1A840B000, v5, OS_LOG_TYPE_DEBUG, "Sending feedback for highlight <%{public}@>: <%{public}@>", v9, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

void __40__WBSHighlightManager__updateHighlights__block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Failed to fetch highlights: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
