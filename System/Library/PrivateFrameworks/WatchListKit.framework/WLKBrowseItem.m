@implementation WLKBrowseItem

+ (id)browseItemsWithDictionaries:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  WLKBrowseItem *v15;
  WLKBrowseItem *v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1B5E47E50](v9);
        v15 = [WLKBrowseItem alloc];
        v16 = -[WLKBrowseItem initWithDictionary:context:](v15, "initWithDictionary:context:", v13, v6, (_QWORD)v20);
        if (v16)
          objc_msgSend(v7, "addObject:", v16);

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v10 = v9;
    }
    while (v9);
  }

  if (objc_msgSend(v7, "count"))
    v17 = v7;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

- (WLKBrowseItem)initWithDictionary:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  WLKBrowseItem *v8;
  WLKBasicContentMetadata *v9;
  WLKBasicContentMetadata *content;
  void *v11;
  uint64_t v12;
  NSArray *playables;
  void *v14;
  WLKBrowseItem *v15;
  WLKBrowseItem *currentEpisode;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  WLKComingSoonInfo *contentComingSoonInfo;
  WLKBrowseItem *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v24.receiver = self;
    v24.super_class = (Class)WLKBrowseItem;
    v8 = -[WLKBrowseItem init](&v24, sel_init);
    if (v8)
    {
      v9 = -[WLKBasicContentMetadata initWithDictionary:]([WLKBasicContentMetadata alloc], "initWithDictionary:", v6);
      content = v8->_content;
      v8->_content = v9;

      objc_msgSend(v6, "wlk_arrayForKey:", CFSTR("playables"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        +[WLKPlayable playablesWithDictionaries:context:](WLKPlayable, "playablesWithDictionaries:context:", v11, v7);
        v12 = objc_claimAutoreleasedReturnValue();
        playables = v8->_playables;
        v8->_playables = (NSArray *)v12;

      }
      objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("currentEpisode"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = -[WLKBrowseItem initWithDictionary:context:]([WLKBrowseItem alloc], "initWithDictionary:context:", v14, v7);
        currentEpisode = v8->_currentEpisode;
        v8->_currentEpisode = v15;

      }
      v8->_watchlisted = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("isWatchlisted"), 0);
      v8->_watchlistable = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("isWatchlistable"), 0);
      objc_msgSend(v6, "wlk_arrayForKey:", CFSTR("availableChannels"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[WLKComingSoonInfo comingSoonItemsWithDictionaries:](WLKComingSoonInfo, "comingSoonItemsWithDictionaries:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "firstObject");
        v20 = objc_claimAutoreleasedReturnValue();
        contentComingSoonInfo = v8->_contentComingSoonInfo;
        v8->_contentComingSoonInfo = (WLKComingSoonInfo *)v20;

      }
    }
    self = v8;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)preferredComingSoonInfo
{
  WLKComingSoonInfo *contentComingSoonInfo;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  contentComingSoonInfo = self->_contentComingSoonInfo;
  if (contentComingSoonInfo)
    return contentComingSoonInfo;
  -[WLKBrowseItem playables](self, "playables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    -[WLKBrowseItem currentEpisode](self, "currentEpisode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playables");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "comingSoonInfo", (_QWORD)v15);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          goto LABEL_15;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (WLKBasicContentMetadata)content
{
  return self->_content;
}

- (WLKBrowseItem)currentEpisode
{
  return self->_currentEpisode;
}

- (NSArray)playables
{
  return self->_playables;
}

- (BOOL)isWatchlisted
{
  return self->_watchlisted;
}

- (BOOL)isWatchlistable
{
  return self->_watchlistable;
}

- (WLKComingSoonInfo)contentComingSoonInfo
{
  return self->_contentComingSoonInfo;
}

- (void)setContentComingSoonInfo:(id)a3
{
  objc_storeStrong((id *)&self->_contentComingSoonInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentComingSoonInfo, 0);
  objc_storeStrong((id *)&self->_playables, 0);
  objc_storeStrong((id *)&self->_currentEpisode, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
