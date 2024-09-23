@implementation WBSSearchEnginePreferenceObserver

- (BOOL)isGoogleEnabledSearchEngine
{
  return self->_isGoogleEnabledSearchEngine;
}

+ (void)setUpSharedObserverWithSearchProviderContext:(id)a3
{
  id v3;
  WBSSearchEnginePreferenceObserver *v4;
  void *v5;

  v3 = a3;
  v4 = -[WBSSearchEnginePreferenceObserver initWithSearchProviderContext:]([WBSSearchEnginePreferenceObserver alloc], "initWithSearchProviderContext:", v3);

  v5 = (void *)sharedSearchEngineObserver;
  sharedSearchEngineObserver = (uint64_t)v4;

}

- (WBSSearchEnginePreferenceObserver)initWithSearchProviderContext:(id)a3
{
  id v5;
  WBSSearchEnginePreferenceObserver *v6;
  WBSSearchEnginePreferenceObserver *v7;
  void *v8;
  WBSSearchEnginePreferenceObserver *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSSearchEnginePreferenceObserver;
  v6 = -[WBSSearchEnginePreferenceObserver init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchProviderContext, a3);
    objc_msgSend(MEMORY[0x1E0C99EA0], "sf_safariSharedDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v7, CFSTR("SearchEngineStringSetting"), 3, userDefaultsObserverContext);

    -[WBSSearchEnginePreferenceObserver _updateSearchEnginePreference:](v7, "_updateSearchEnginePreference:", 0);
    v9 = v7;
  }

  return v7;
}

- (void)_updateSearchEnginePreference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 isGoogleEnabledSearchEngine;
  char v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99EA0], "sf_safariSharedDefaults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SearchEngineStringSetting"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[WBSSearchProviderContext defaultSearchProvider](self->_searchProviderContext, "defaultSearchProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortName");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "sf_safariSharedDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("PrivateSearchEngineStringSetting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[WBSSearchProviderContext defaultSeachProviderForPrivateBrowsing](self->_searchProviderContext, "defaultSeachProviderForPrivateBrowsing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_duckDuckGoDefaultSearchEngine = objc_msgSend(CFSTR("DuckDuckGo"), "safari_isCaseInsensitiveEqualToString:", v14);
  isGoogleEnabledSearchEngine = self->_isGoogleEnabledSearchEngine;
  v10 = objc_msgSend(CFSTR("Google"), "safari_isCaseInsensitiveEqualToString:", v14);
  self->_googleIsDefaultSearchEngine = v10;
  if ((v10 & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(CFSTR("Google"), "safari_isCaseInsensitiveEqualToString:", v7);
  self->_isGoogleEnabledSearchEngine = v11;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("WBSTrialGroupManagerDidChangeGroupIdentifier"), self);

  if (self->_isGoogleEnabledSearchEngine || isGoogleEnabledSearchEngine)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("DidChangeSearchProviderToFromGoogle"), 0);

  }
}

- (NSString)defaultSearchEngineShortName
{
  void *v2;
  void *v3;

  -[WBSSearchProviderContext defaultSearchProvider](self->_searchProviderContext, "defaultSearchProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (WBSSearchEnginePreferenceObserver)sharedObserver
{
  if (!sharedSearchEngineObserver)
    +[WBSSearchEnginePreferenceObserver sharedObserver].cold.1();
  return (WBSSearchEnginePreferenceObserver *)(id)sharedSearchEngineObserver;
}

- (BOOL)defaultSearchEngineMatchesExperiment
{
  id WeakRetained;
  uint64_t v4;
  BOOL v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(WeakRetained, "isGoogleABEnabledForSearchEnginePreferenceObserver:", self) & 1) != 0)
  {
    v4 = 17;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || !objc_msgSend(WeakRetained, "isDuckDuckGoABEnabledForSearchEnginePreferenceObserver:", self))
    {
      v5 = 0;
      goto LABEL_9;
    }
    v4 = 16;
  }
  v5 = *((_BYTE *)&self->super.isa + v4) != 0;
LABEL_9:

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  WBSSearchEnginePreferenceObserver *v17;
  objc_super v18;

  v10 = a3;
  if ((void *)userDefaultsObserverContext == a6)
  {
    v12 = *MEMORY[0x1E0CB2CC8];
    v13 = a5;
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v14 = objc_claimAutoreleasedReturnValue();

    if (v11 | v14 && (objc_msgSend((id)v11, "isEqual:", v14) & 1) == 0)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __84__WBSSearchEnginePreferenceObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v15[3] = &unk_1E649B6D8;
      v16 = v10;
      v17 = self;
      dispatch_async(MEMORY[0x1E0C80D38], v15);

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WBSSearchEnginePreferenceObserver;
    v11 = (uint64_t)a5;
    -[WBSSearchEnginePreferenceObserver observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
  }

}

uint64_t __84__WBSSearchEnginePreferenceObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("SearchEngineStringSetting"));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "_updateSearchEnginePreference:", 0);
  return result;
}

- (WBSSearchEnginePreferenceObserverDelegate)delegate
{
  return (WBSSearchEnginePreferenceObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)duckDuckGoDefaultSearchEngine
{
  return self->_duckDuckGoDefaultSearchEngine;
}

- (BOOL)googleIsDefaultSearchEngine
{
  return self->_googleIsDefaultSearchEngine;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchProviderContext, 0);
}

+ (void)sharedObserver
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E64A2498);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariShared/SafariShared/SafariCore/Preferences/WBSSearchEnginePreferenceObserver.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "sharedSearchEngineObserver", "+[WBSSearchEnginePreferenceObserver sharedObserver]", v3, 50, v5);
    v4 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v1, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "sharedSearchEngineObserver", "+[WBSSearchEnginePreferenceObserver sharedObserver]", v3, 50, &stru_1E64A2498);
    v4 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@\n%@"), v4, v6);

  abort();
}

@end
