@implementation WLKCanonicalPlayablesSiriResponse

- (WLKCanonicalPlayablesSiriResponse)initWithDictionary:(id)a3
{
  id v4;
  WLKCanonicalPlayablesSiriResponse *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSString *canonicalID;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  NSArray *playables;
  void *v33;
  void *v34;
  WLKCanonicalPlayablesSiriResponse *v35;
  id v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  uint8_t buf[4];
  _BOOL4 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)WLKCanonicalPlayablesSiriResponse;
  v5 = -[WLKCanonicalPlayablesSiriResponse init](&v43, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v35 = v5;
    v5->_dictionary = (NSDictionary *)v6;

    v36 = v4;
    objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("content"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("channels"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("contentPersonalizedInfo"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "wlk_arrayForKey:", CFSTR("smartPlayables"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("playables"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "wlk_stringForKey:", CFSTR("playableId"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "wlk_dictionaryForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v11);
    }
    v18 = +[WLKNetworkRequestUtilities isGDPRAccepted](WLKNetworkRequestUtilities, "isGDPRAccepted");
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ams_activeiTunesAccount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v37, "wlk_BOOLForKey:defaultValue:", CFSTR("isWatchlistEnabled"), 0) & v18;
    if (!v20)
      LOBYTE(v21) = 0;
    v5 = v35;
    v35->_watchListable = v21;
    WLKSystemLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v45 = v18;
      _os_log_impl(&dword_1B515A000, v22, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesSiriResponse - isGDPRAccepted:%d", buf, 8u);
    }

    WLKSystemLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v45 = v20 != 0;
      _os_log_impl(&dword_1B515A000, v23, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesSiriResponse - isAccountPresent:%d", buf, 8u);
    }

    v35->_watchListed = objc_msgSend(v37, "wlk_BOOLForKey:defaultValue:", CFSTR("inUpNext"), 0);
    +[WLKCanonicalPlayablesSiriResponse _parseChannelsFromPayload:](WLKCanonicalPlayablesSiriResponse, "_parseChannelsFromPayload:", v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "wlk_stringForKey:", CFSTR("id"));
    v25 = objc_claimAutoreleasedReturnValue();
    canonicalID = v35->_canonicalID;
    v35->_canonicalID = (NSString *)v25;

    objc_msgSend(v34, "wlk_stringForKey:", CFSTR("type"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35->_contentType = +[WLKBasicContentMetadata contentTypeForString:](WLKBasicContentMetadata, "contentTypeForString:", v27);

    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (-[NSString length](v35->_canonicalID, "length"))
      objc_msgSend(v28, "setObject:forKey:", v35->_canonicalID, CFSTR("WLKModelContextKeyCanonicalID"));
    if (v24)
      objc_msgSend(v28, "setObject:forKey:", v24, CFSTR("WLKModelContextKeyChannels"));
    v29 = (void *)objc_msgSend(v9, "copy");
    +[WLKPlayable playablesWithDictionaries:context:](WLKPlayable, "playablesWithDictionaries:context:", v29, v28);
    v30 = objc_claimAutoreleasedReturnValue();
    playables = v35->_playables;
    v35->_playables = (NSArray *)v30;

    v4 = v36;
  }

  return v5;
}

- (WLKCanonicalPlayablesSiriResponse)initWithDictionary:(id)a3 statsID:(id)a4
{
  id v6;
  id v7;
  WLKCanonicalPlayablesSiriResponse *v8;
  WLKCanonicalPlayablesSiriResponse *v9;
  NSString **p_canonicalID;
  uint64_t v11;
  NSDictionary *dictionary;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  WLKPlayable *v18;
  uint64_t v19;
  NSArray *playables;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  objc_super v31;
  uint8_t buf[4];
  _BOOL4 v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WLKCanonicalPlayablesSiriResponse;
  v8 = -[WLKCanonicalPlayablesSiriResponse init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    p_canonicalID = &v8->_canonicalID;
    objc_storeStrong((id *)&v8->_canonicalID, a4);
    v9->_contentType = 5;
    v11 = objc_msgSend(v6, "copy");
    dictionary = v9->_dictionary;
    v9->_dictionary = (NSDictionary *)v11;

    objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("data"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wlk_dictionaryForKey:", CFSTR("playables"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wlk_dictionaryForKey:", CFSTR("channels"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v14 && v15 && *p_canonicalID)
    {
      objc_msgSend(v14, "wlk_dictionaryForKey:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[WLKPlayable initWithDictionary:]([WLKPlayable alloc], "initWithDictionary:", v17);
      v34[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
      v19 = objc_claimAutoreleasedReturnValue();
      playables = v9->_playables;
      v9->_playables = (NSArray *)v19;

      v30 = v17;
      objc_msgSend(v17, "objectForKey:", CFSTR("channelId"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "wlk_dictionaryForKey:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = +[WLKNetworkRequestUtilities isGDPRAccepted](WLKNetworkRequestUtilities, "isGDPRAccepted");
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "ams_activeiTunesAccount");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend(v21, "wlk_BOOLForKey:defaultValue:", CFSTR("isWatchlistEnabled"), 0) & v22;
      if (!v24)
        LOBYTE(v25) = 0;
      v9->_watchListable = v25;
      WLKSystemLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v33 = v22;
        _os_log_impl(&dword_1B515A000, v26, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesSiriResponse - isGDPRAccepted:%d", buf, 8u);
      }

      WLKSystemLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v33 = v24 != 0;
        _os_log_impl(&dword_1B515A000, v27, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesSiriResponse - isAccountPresent:%d", buf, 8u);
      }

      v9->_watchListed = 0;
    }

  }
  return v9;
}

+ (id)_parseChannelsFromPayload:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__WLKCanonicalPlayablesSiriResponse__parseChannelsFromPayload___block_invoke;
  v9[3] = &unk_1E68A8548;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  if (objc_msgSend(v6, "count"))
    v7 = (void *)objc_msgSend(v6, "copy");
  else
    v7 = 0;

  return v7;
}

void __63__WLKCanonicalPlayablesSiriResponse__parseChannelsFromPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  WLKChannelDetails *v6;

  v4 = a3;
  v6 = -[WLKChannelDetails initWithDictionary:]([WLKChannelDetails alloc], "initWithDictionary:", v4);

  -[WLKChannelDetails channelID](v6, "channelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (WLKCanonicalPlayablesSiriResponse)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKCanonicalPlayablesSiriResponse"), CFSTR("-init is not supported"));

  return 0;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (BOOL)isWatchListable
{
  return self->_watchListable;
}

- (void)setWatchListable:(BOOL)a3
{
  self->_watchListable = a3;
}

- (BOOL)isWatchListed
{
  return self->_watchListed;
}

- (void)setWatchListed:(BOOL)a3
{
  self->_watchListed = a3;
}

- (NSArray)playables
{
  return self->_playables;
}

- (void)setPlayables:(id)a3
{
  objc_storeStrong((id *)&self->_playables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playables, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
