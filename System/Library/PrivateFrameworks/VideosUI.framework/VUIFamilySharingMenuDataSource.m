@implementation VUIFamilySharingMenuDataSource

- (VUIFamilySharingMenuDataSource)initWithValidCategories:(id)a3
{
  VUIFamilySharingMenuDataSource *v3;
  uint64_t v4;
  VUIMediaAPIClient *mediaClient;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIFamilySharingMenuDataSource;
  v3 = -[VUILibraryMenuDataSource initWithValidCategories:](&v7, sel_initWithValidCategories_, a3);
  if (v3)
  {
    +[VUIMediaAPIClient initializeWithAppleTVClientIdentifier](VUIMediaAPIClient, "initializeWithAppleTVClientIdentifier");
    +[VUIMediaAPIClient sharedInstance](VUIMediaAPIClient, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    mediaClient = v3->_mediaClient;
    v3->_mediaClient = (VUIMediaAPIClient *)v4;

    v3->_hasFetchedRecentPurchases = 0;
    v3->_hasFetchedGenres = 0;
    v3->_hasFetchedMovies = 0;
    v3->_hasFetchedShows = 0;
    v3->_hasRecentPurchases = 0;
    v3->_hasMovies = 0;
    v3->_hasShows = 0;
  }
  return v3;
}

- (void)startFetch
{
  -[VUIFamilySharingMenuDataSource _fetchGenres](self, "_fetchGenres");
  -[VUIFamilySharingMenuDataSource _fetchRecentPurchases](self, "_fetchRecentPurchases");
  -[VUIFamilySharingMenuDataSource _fetchMovies](self, "_fetchMovies");
  -[VUIFamilySharingMenuDataSource _fetchShows](self, "_fetchShows");
}

- (id)getGenreByGenreTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VUIFamilySharingMenuDataSource genres](self, "genres", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "genreTitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_fetchGenres
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[VUIFamilySharingMenuDataSource ownerIdentifier](self, "ownerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory genresRequestWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "genresRequestWithOwnerIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[VUIFamilySharingMenuDataSource mediaClient](self, "mediaClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__VUIFamilySharingMenuDataSource__fetchGenres__block_invoke;
  v6[3] = &unk_1E9F9A338;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "fetchContentForUrl:completion:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __46__VUIFamilySharingMenuDataSource__fetchGenres__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  VUIGenresRequestResponseParser *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHasFetchedGenres:", 1);
  if (!a3)
  {
    v6 = objc_alloc_init(VUIGenresRequestResponseParser);
    -[VUIGenresRequestResponseParser parseAMSURLResult:](v6, "parseAMSURLResult:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setGenres:", v7);

  }
  if (objc_msgSend(WeakRetained, "_hasCompletedAllFetches"))
  {
    objc_msgSend(WeakRetained, "_constructVUIMenuDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setMenuItems:", v8);
    objc_msgSend(WeakRetained, "_notifyDelegatesFetchDidComplete");

  }
}

- (void)_fetchRecentPurchases
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[VUIFamilySharingMenuDataSource ownerIdentifier](self, "ownerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory recentPurchasesRequestWithOwnerIdentifier:](VUIMediaAPIRequestFactory, "recentPurchasesRequestWithOwnerIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[VUIFamilySharingMenuDataSource mediaClient](self, "mediaClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__VUIFamilySharingMenuDataSource__fetchRecentPurchases__block_invoke;
  v6[3] = &unk_1E9F9A338;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "fetchContentForUrl:completion:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __55__VUIFamilySharingMenuDataSource__fetchRecentPurchases__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  VUIFamilySharingEntityRequestResponseParser *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHasFetchedRecentPurchases:", 1);
  if (!a3)
  {
    v6 = objc_alloc_init(VUIFamilySharingEntityRequestResponseParser);
    -[VUIFamilySharingEntityRequestResponseParser parseAMSURLResult:](v6, "parseAMSURLResult:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setHasRecentPurchases:", objc_msgSend(v7, "count") != 0);

  }
  if (objc_msgSend(WeakRetained, "_hasCompletedAllFetches"))
  {
    objc_msgSend(WeakRetained, "_constructVUIMenuDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setMenuItems:", v8);
    objc_msgSend(WeakRetained, "_notifyDelegatesFetchDidComplete");

  }
}

- (void)_fetchMovies
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[VUIFamilySharingMenuDataSource ownerIdentifier](self, "ownerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory moviesPurchasesRequestWithOwnerIdentifier:sortType:](VUIMediaAPIRequestFactory, "moviesPurchasesRequestWithOwnerIdentifier:sortType:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[VUIFamilySharingMenuDataSource mediaClient](self, "mediaClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__VUIFamilySharingMenuDataSource__fetchMovies__block_invoke;
  v6[3] = &unk_1E9F9A338;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "fetchContentForUrl:completion:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __46__VUIFamilySharingMenuDataSource__fetchMovies__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  VUIFamilySharingEntityRequestResponseParser *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHasFetchedMovies:", 1);
  if (!a3)
  {
    v6 = objc_alloc_init(VUIFamilySharingEntityRequestResponseParser);
    -[VUIFamilySharingEntityRequestResponseParser parseAMSURLResult:](v6, "parseAMSURLResult:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setHasMovies:", objc_msgSend(v7, "count") != 0);

  }
  if (objc_msgSend(WeakRetained, "_hasCompletedAllFetches"))
  {
    objc_msgSend(WeakRetained, "_constructVUIMenuDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setMenuItems:", v8);
    objc_msgSend(WeakRetained, "_notifyDelegatesFetchDidComplete");

  }
}

- (void)_fetchShows
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[VUIFamilySharingMenuDataSource ownerIdentifier](self, "ownerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaAPIRequestFactory showsPurchasesRequestWithOwnerIdentifier:sortType:](VUIMediaAPIRequestFactory, "showsPurchasesRequestWithOwnerIdentifier:sortType:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[VUIFamilySharingMenuDataSource mediaClient](self, "mediaClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__VUIFamilySharingMenuDataSource__fetchShows__block_invoke;
  v6[3] = &unk_1E9F9A338;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "fetchContentForUrl:completion:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __45__VUIFamilySharingMenuDataSource__fetchShows__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  VUIFamilySharingEntityRequestResponseParser *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHasFetchedShows:", 1);
  if (!a3)
  {
    v6 = objc_alloc_init(VUIFamilySharingEntityRequestResponseParser);
    -[VUIFamilySharingEntityRequestResponseParser parseAMSURLResult:](v6, "parseAMSURLResult:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setHasShows:", objc_msgSend(v7, "count") != 0);

  }
  if (objc_msgSend(WeakRetained, "_hasCompletedAllFetches"))
  {
    objc_msgSend(WeakRetained, "_constructVUIMenuDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setMenuItems:", v8);
    objc_msgSend(WeakRetained, "_notifyDelegatesFetchDidComplete");

  }
}

- (BOOL)_hasCompletedAllFetches
{
  return self->_hasFetchedRecentPurchases
      && self->_hasFetchedMovies
      && self->_hasFetchedShows
      && self->_hasFetchedGenres;
}

- (id)_constructVUIMenuDataSource
{
  void *v3;
  void *v4;
  VUIMenuDataSource *v5;
  void *v6;

  -[VUIFamilySharingMenuDataSource _constructMainMenuItems](self, "_constructMainMenuItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingMenuDataSource _constructGenreMenuItems](self, "_constructGenreMenuItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VUIMenuDataSource initWithMainMenuItems:genreMenuItems:]([VUIMenuDataSource alloc], "initWithMainMenuItems:genreMenuItems:", v3, v4);
  -[VUIFamilySharingMenuDataSource _constructGenreTypes](self, "_constructGenreTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMenuDataSource setGenreTypes:](v5, "setGenreTypes:", v6);

  return v5;
}

- (id)_constructMainMenuItems
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[VUIFamilySharingMenuDataSource hasRecentPurchases](self, "hasRecentPurchases"))
    objc_msgSend(v3, "addObject:", &unk_1EA0B9100);
  if (-[VUIFamilySharingMenuDataSource hasMovies](self, "hasMovies"))
    objc_msgSend(v3, "addObject:", &unk_1EA0B9118);
  if (-[VUIFamilySharingMenuDataSource hasShows](self, "hasShows"))
    objc_msgSend(v3, "addObject:", &unk_1EA0B9130);
  -[VUIFamilySharingMenuDataSource _categoryTypesSortComparator](self, "_categoryTypesSortComparator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingComparator:", v4);

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (id)_constructGenreMenuItems
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VUIFamilySharingMenuDataSource genres](self, "genres", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "genreTitle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (id)_constructGenreTypes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[VUIFamilySharingMenuDataSource genres](self, "genres", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "genreIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          v11 = VUILibraryGenreFromGenreID(objc_msgSend(v10, "integerValue"));
        else
          v11 = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

- (id)_categoryTypesSortComparator
{
  return &__block_literal_global_13;
}

uint64_t __62__VUIFamilySharingMenuDataSource__categoryTypesSortComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_notifyDelegatesFetchDidComplete
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
  v5 = __66__VUIFamilySharingMenuDataSource__notifyDelegatesFetchDidComplete__block_invoke;
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

void __66__VUIFamilySharingMenuDataSource__notifyDelegatesFetchDidComplete__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "dataSourceDidFinishFetching:", WeakRetained);

}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (void)setOwnerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ownerIdentifier, a3);
}

- (NSArray)genres
{
  return self->_genres;
}

- (void)setGenres:(id)a3
{
  objc_storeStrong((id *)&self->_genres, a3);
}

- (BOOL)hasFetchedGenres
{
  return self->_hasFetchedGenres;
}

- (void)setHasFetchedGenres:(BOOL)a3
{
  self->_hasFetchedGenres = a3;
}

- (BOOL)hasFetchedRecentPurchases
{
  return self->_hasFetchedRecentPurchases;
}

- (void)setHasFetchedRecentPurchases:(BOOL)a3
{
  self->_hasFetchedRecentPurchases = a3;
}

- (BOOL)hasFetchedMovies
{
  return self->_hasFetchedMovies;
}

- (void)setHasFetchedMovies:(BOOL)a3
{
  self->_hasFetchedMovies = a3;
}

- (BOOL)hasFetchedShows
{
  return self->_hasFetchedShows;
}

- (void)setHasFetchedShows:(BOOL)a3
{
  self->_hasFetchedShows = a3;
}

- (BOOL)hasRecentPurchases
{
  return self->_hasRecentPurchases;
}

- (void)setHasRecentPurchases:(BOOL)a3
{
  self->_hasRecentPurchases = a3;
}

- (BOOL)hasMovies
{
  return self->_hasMovies;
}

- (void)setHasMovies:(BOOL)a3
{
  self->_hasMovies = a3;
}

- (BOOL)hasShows
{
  return self->_hasShows;
}

- (void)setHasShows:(BOOL)a3
{
  self->_hasShows = a3;
}

- (VUIMediaAPIClient)mediaClient
{
  return self->_mediaClient;
}

- (void)setMediaClient:(id)a3
{
  objc_storeStrong((id *)&self->_mediaClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaClient, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
}

@end
