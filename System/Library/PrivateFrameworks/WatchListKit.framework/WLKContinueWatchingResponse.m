@implementation WLKContinueWatchingResponse

- (WLKContinueWatchingResponse)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKContinueWatchingResponse"), CFSTR("-init is not supported"));

  return 0;
}

- (WLKContinueWatchingResponse)initWithDictionary:(id)a3
{
  id v4;
  WLKContinueWatchingResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  WLKContinuationMetadata *v17;
  uint64_t v18;
  NSArray *items;
  void *v20;
  WLKContinueWatchingCollection *v21;
  WLKContinueWatchingCollection *featured;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  const __CFString *v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WLKContinueWatchingResponse;
  v5 = -[WLKContinueWatchingResponse init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKChannelsResponse parseChannelsFromPayload:](WLKChannelsResponse, "parseChannelsFromPayload:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v26 = v4;
    v24 = (void *)v7;
    if (v7)
    {
      v33 = CFSTR("WLKModelContextKeyChannels");
      v34[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = v6;
    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("shelf"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wlk_arrayForKey:", CFSTR("items"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = -[WLKContinuationMetadata initWithDictionary:context:]([WLKContinuationMetadata alloc], "initWithDictionary:context:", v16, v8);
            if (v17)
              objc_msgSend(v9, "addObject:", v17);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v13);
    }

    v18 = objc_msgSend(v9, "copy");
    items = v5->_items;
    v5->_items = (NSArray *)v18;

    objc_msgSend(v25, "wlk_dictionaryForKey:", CFSTR("featured"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = -[WLKContinueWatchingCollection initWithDictionary:]([WLKContinueWatchingCollection alloc], "initWithDictionary:", v20);
      featured = v5->_featured;
      v5->_featured = v21;

    }
    v4 = v26;
  }

  return v5;
}

- (NSArray)items
{
  return self->_items;
}

- (WLKContinueWatchingCollection)featured
{
  return self->_featured;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featured, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
