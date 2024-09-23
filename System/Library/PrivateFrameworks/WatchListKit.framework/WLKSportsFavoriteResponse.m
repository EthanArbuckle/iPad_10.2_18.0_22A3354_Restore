@implementation WLKSportsFavoriteResponse

- (WLKSportsFavoriteResponse)initWithDictionary:(id)a3
{
  id v4;
  WLKSportsFavoriteResponse *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *favorites;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WLKSportsFavoriteResponse;
  v5 = -[WLKSportsFavoriteResponse init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v4, "wlk_arrayForKey:", CFSTR("data"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[WLKSportsFavoriteFactory favoriteFromDictionary:](WLKSportsFavoriteFactory, "favoriteFromDictionary:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v6, "addObject:", v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }

    v14 = objc_msgSend(v6, "copy");
    favorites = v5->_favorites;
    v5->_favorites = (NSArray *)v14;

  }
  return v5;
}

- (NSArray)favorites
{
  return self->_favorites;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favorites, 0);
}

@end
