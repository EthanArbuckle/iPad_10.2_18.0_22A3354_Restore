@implementation WBSStartPageSuggestionsManager

- (WBSStartPageSuggestionsManager)initWithSectionManager:(id)a3
{
  id v5;
  WBSStartPageSuggestionsManager *v6;
  WBSStartPageSuggestionsManager *v7;
  NSArray *suggestions;
  uint64_t v9;
  NSMutableArray *providers;
  uint64_t v11;
  NSMapTable *providersToCachedSuggestions;
  uint64_t v13;
  NSMapTable *cachedSuggestionsToProviders;
  void *v15;
  WBSStartPageSuggestionsManager *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSStartPageSuggestionsManager;
  v6 = -[WBSStartPageSuggestionsManager init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sectionManager, a3);
    suggestions = v7->_suggestions;
    v7->_suggestions = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    providers = v7->_providers;
    v7->_providers = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    providersToCachedSuggestions = v7->_providersToCachedSuggestions;
    v7->_providersToCachedSuggestions = (NSMapTable *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    cachedSuggestionsToProviders = v7->_cachedSuggestionsToProviders;
    v7->_cachedSuggestionsToProviders = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel__sectionsDidChange_, *MEMORY[0x1E0D8A668], 0);

    -[WBSStartPageSuggestionsManager _updateDefaultStartPageVisibleProviders](v7, "_updateDefaultStartPageVisibleProviders");
    v16 = v7;
  }

  return v7;
}

- (void)_sectionsDidChange:(id)a3
{
  -[WBSStartPageSuggestionsManager _updateDefaultStartPageVisibleProviders](self, "_updateDefaultStartPageVisibleProviders", a3);
  -[WBSStartPageSuggestionsManager _recomputeCachedSuggestionsForcingReload:](self, "_recomputeCachedSuggestionsForcingReload:", 0);
}

- (void)_updateDefaultStartPageVisibleProviders
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  NSSet *v14;
  NSSet *defaultStartPageVisibleProviders;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[WBSStartPageSectionManager suggestionsDataSourceSections](self->_sectionManager, "suggestionsDataSourceSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_providers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "providerSectionIdentifier", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "containsObject:", v12);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (NSSet *)objc_msgSend(v5, "copy");
  defaultStartPageVisibleProviders = self->_defaultStartPageVisibleProviders;
  self->_defaultStartPageVisibleProviders = v14;

}

id __73__WBSStartPageSuggestionsManager__updateDefaultStartPageVisibleProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isEnabled"))
  {
    objc_msgSend(v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)registerProvider:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "setSuggestionsProviderDelegate:", self);
    -[NSMutableArray addObject:](self->_providers, "addObject:", v4);
    -[WBSStartPageSuggestionsManager _updateDefaultStartPageVisibleProviders](self, "_updateDefaultStartPageVisibleProviders");
    objc_msgSend(v4, "suggestions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[WBSStartPageSuggestionsManager startPageSuggestionsProvider:didUpdateSuggestions:](self, "startPageSuggestionsProvider:didUpdateSuggestions:", v4, v5);

  }
}

- (void)fetchMetadataForSuggestion:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WBSStartPageSuggestionsManager _providerForSuggestion:](self, "_providerForSuggestion:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchMetadataForSuggestion:completionHandler:", v7, v6);

}

- (id)attributionViewForSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WBSStartPageSuggestionsManager _providerForSuggestion:](self, "_providerForSuggestion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "attributionViewForSuggestion:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_providerForSuggestion:(id)a3
{
  return -[NSMapTable objectForKey:](self->_cachedSuggestionsToProviders, "objectForKey:", a3);
}

- (void)_recomputeCachedSuggestionsForcingReload:(BOOL)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  NSArray *v23;
  NSArray *highlights;
  NSArray *v25;
  NSArray *suggestions;
  NSObject *v27;
  NSArray *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = self->_providers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    v8 = *MEMORY[0x1E0D8A660];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_providersToCachedSuggestions, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSSet containsObject:](self->_defaultStartPageVisibleProviders, "containsObject:", v10))
        {
          objc_msgSend(v33, "addObjectsFromArray:", v11);
          v12 = WBS_LOG_CHANNEL_PREFIXStartPage();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            goto LABEL_12;
          v13 = v12;
          v14 = objc_msgSend(v11, "count");
          v15 = objc_opt_class();
          *(_DWORD *)buf = 134218242;
          v39 = v14;
          v40 = 2114;
          v41 = v15;
          v16 = v13;
          v17 = "Adding %zu suggestions from provider %{public}@ in manager";
        }
        else
        {
          v18 = WBS_LOG_CHANNEL_PREFIXStartPage();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            goto LABEL_12;
          v13 = v18;
          v19 = objc_msgSend(v11, "count");
          v20 = objc_opt_class();
          *(_DWORD *)buf = 134218242;
          v39 = v19;
          v40 = 2114;
          v41 = v20;
          v16 = v13;
          v17 = "Skipping %zu suggestions from provider %{public}@ in manager";
        }
        _os_log_impl(&dword_1A840B000, v16, OS_LOG_TYPE_INFO, v17, buf, 0x16u);

LABEL_12:
        objc_msgSend(v10, "providerSectionIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", v8);

        if (v22)
        {
          v23 = (NSArray *)objc_msgSend(v11, "copy");
          highlights = self->_highlights;
          self->_highlights = v23;

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v6);
  }

  if (a3 || !-[NSArray isEqualToArray:](self->_suggestions, "isEqualToArray:", v33))
  {
    v25 = (NSArray *)objc_msgSend(v33, "copy");
    suggestions = self->_suggestions;
    self->_suggestions = v25;

    v27 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = self->_suggestions;
      v29 = v27;
      v30 = -[NSArray count](v28, "count");
      *(_DWORD *)buf = 134217984;
      v39 = v30;
      _os_log_impl(&dword_1A840B000, v29, OS_LOG_TYPE_INFO, "Recomputed %lu suggestions in manager", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "postNotificationName:object:", CFSTR("WBSStartPageSuggestionsManagerDidUpdateSuggestions"), self);

  }
}

- (void)startPageSuggestionsProvider:(id)a3 didUpdateSuggestions:(id)a4
{
  -[WBSStartPageSuggestionsManager _updateCachedSuggestionsForStartPageSuggestionsProvider:suggestions:](self, "_updateCachedSuggestionsForStartPageSuggestionsProvider:suggestions:", a3, a4);
  -[WBSStartPageSuggestionsManager _recomputeCachedSuggestionsForcingReload:](self, "_recomputeCachedSuggestionsForcingReload:", 0);
}

- (void)startPageSuggestionsProvider:(id)a3 forceReloadSuggestions:(id)a4
{
  -[WBSStartPageSuggestionsManager _updateCachedSuggestionsForStartPageSuggestionsProvider:suggestions:](self, "_updateCachedSuggestionsForStartPageSuggestionsProvider:suggestions:", a3, a4);
  -[WBSStartPageSuggestionsManager _recomputeCachedSuggestionsForcingReload:](self, "_recomputeCachedSuggestionsForcingReload:", 1);
}

- (void)_updateCachedSuggestionsForStartPageSuggestionsProvider:(id)a3 suggestions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMapTable *providersToCachedSuggestions;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[NSMapTable objectForKey:](self->_providersToCachedSuggestions, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        -[NSMapTable removeObjectForKey:](self->_cachedSuggestionsToProviders, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  providersToCachedSuggestions = self->_providersToCachedSuggestions;
  v14 = (void *)objc_msgSend(v7, "copy");
  -[NSMapTable setObject:forKey:](providersToCachedSuggestions, "setObject:forKey:", v14, v6);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMapTable objectForKey:](self->_providersToCachedSuggestions, "objectForKey:", v6, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[NSMapTable setObject:forKey:](self->_cachedSuggestionsToProviders, "setObject:forKey:", v6, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (WBSStartPageSectionManager)sectionManager
{
  return self->_sectionManager;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSArray)highlights
{
  return self->_highlights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_sectionManager, 0);
  objc_storeStrong((id *)&self->_defaultStartPageVisibleProviders, 0);
  objc_storeStrong((id *)&self->_cachedSuggestionsToProviders, 0);
  objc_storeStrong((id *)&self->_providersToCachedSuggestions, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

@end
