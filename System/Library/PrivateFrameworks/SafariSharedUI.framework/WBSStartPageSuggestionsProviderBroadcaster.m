@implementation WBSStartPageSuggestionsProviderBroadcaster

- (WBSStartPageSuggestionsProviderBroadcaster)initWithSuggestionsProvider:(id)a3
{
  id v4;
  WBSStartPageSuggestionsProviderBroadcaster *v5;
  WBSStartPageSuggestionsProviderBroadcaster *v6;
  uint64_t v7;
  NSHashTable *proxies;
  WBSStartPageSuggestionsProviderBroadcaster *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSStartPageSuggestionsProviderBroadcaster;
  v5 = -[WBSStartPageSuggestionsProviderBroadcaster init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_suggestionsProvider, v4);
    v6->_providerSupportsAttributionViews = objc_opt_respondsToSelector() & 1;
    objc_msgSend(v4, "setSuggestionsProviderDelegate:", v6);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    proxies = v6->_proxies;
    v6->_proxies = (NSHashTable *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)createSuggestionProviderProxy
{
  _WBSStartPageSuggestionsProviderProxy *v3;

  v3 = objc_alloc_init(_WBSStartPageSuggestionsProviderProxy);
  -[_WBSStartPageSuggestionsProviderProxy setOwner:](v3, "setOwner:", self);
  -[NSHashTable addObject:](self->_proxies, "addObject:", v3);
  return v3;
}

- (void)startPageSuggestionsProvider:(id)a3 didUpdateSuggestions:(id)a4
{
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_proxies;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "suggestionsProviderDelegate", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startPageSuggestionsProvider:didUpdateSuggestions:", v11, v5);

      }
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)startPageSuggestionsProvider:(id)a3 forceReloadSuggestions:(id)a4
{
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_proxies;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "suggestionsProviderDelegate", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startPageSuggestionsProvider:forceReloadSuggestions:", v11, v5);

      }
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (WBSStartPageSuggestionsProvider)suggestionsProvider
{
  return (WBSStartPageSuggestionsProvider *)objc_loadWeakRetained((id *)&self->_suggestionsProvider);
}

- (BOOL)providerSupportsAttributionViews
{
  return self->_providerSupportsAttributionViews;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionsProvider);
  objc_storeStrong((id *)&self->_proxies, 0);
}

@end
