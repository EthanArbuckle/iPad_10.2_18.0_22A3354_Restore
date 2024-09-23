@implementation WLKFavoritesRequest

- (void)makeRequestWithCompletion:(id)a3
{
  id v4;
  WLKSportsFavoriteRequestOperation *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id from;
  id location;

  v4 = a3;
  if (v4)
  {
    v5 = -[WLKSportsFavoriteRequestOperation initWithAction:ids:]([WLKSportsFavoriteRequestOperation alloc], "initWithAction:ids:", 0, 0);
    objc_initWeak(&location, v5);
    objc_initWeak(&from, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__WLKFavoritesRequest_makeRequestWithCompletion___block_invoke;
    v7[3] = &unk_1E68A7D38;
    objc_copyWeak(&v9, &location);
    objc_copyWeak(&v10, &from);
    v8 = v4;
    -[WLKSportsFavoriteRequestOperation setCompletionBlock:](v5, "setCompletionBlock:", v7);
    objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addOperation:", v5);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

void __49__WLKFavoritesRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "favorites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "convertToWLKFavorite:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (WLKIsTVApp())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
    WLKTVAppBundleID();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithSuiteName:", v8);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("WLKSettingsLastSyncDate"));

  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v5, v11);

}

- (id)convertToWLKFavorite:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  WLKFavorite *v11;
  void *v12;
  void *v13;
  void *v14;
  WLKFavorite *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = [WLKFavorite alloc];
        objc_msgSend(v10, "ID", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "leagueId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[WLKFavorite initWithID:name:leagueID:](v11, "initWithID:name:leagueID:", v12, v13, v14);
        objc_msgSend(v4, "addObject:", v15);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

@end
