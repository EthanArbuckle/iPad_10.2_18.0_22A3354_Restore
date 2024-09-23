@implementation WLKSearchWatchListResponse

- (WLKSearchWatchListResponse)initWithDictionary:(id)a3
{
  id v5;
  WLKSearchWatchListResponse *v6;
  WLKSearchWatchListResponse *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  WLKBasicContentMetadata *v17;
  uint64_t v18;
  NSArray *items;
  void *v21;
  WLKSearchWatchListResponse *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WLKSearchWatchListResponse;
  v6 = -[WLKSearchWatchListResponse init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    v22 = v6;
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "wlk_dictionaryForKey:", CFSTR("data"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "wlk_arrayForKey:", CFSTR("items"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "wlk_dictionaryForKey:", CFSTR("content"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = -[WLKBasicContentMetadata initWithDictionary:]([WLKBasicContentMetadata alloc], "initWithDictionary:", v16);
              if (v17)
                objc_msgSend(v8, "addObject:", v17);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v12);
      }
    }
    v18 = objc_msgSend(v8, "copy");
    v7 = v22;
    items = v22->_items;
    v22->_items = (NSArray *)v18;

  }
  return v7;
}

- (WLKSearchWatchListResponse)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKSearchWatchListResponse"), CFSTR("-init is not supported"));

  return 0;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
