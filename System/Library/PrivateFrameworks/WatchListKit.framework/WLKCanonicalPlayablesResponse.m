@implementation WLKCanonicalPlayablesResponse

- (WLKCanonicalPlayablesResponse)initWithDictionary:(id)a3
{
  id v4;
  WLKCanonicalPlayablesResponse *v5;
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
  uint64_t v29;
  NSArray *playables;
  void *v32;
  void *v33;
  WLKCanonicalPlayablesResponse *v34;
  id v35;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  uint8_t buf[4];
  _BOOL4 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)WLKCanonicalPlayablesResponse;
  v5 = -[WLKCanonicalPlayablesResponse init](&v42, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v34 = v5;
    v5->_dictionary = (NSDictionary *)v6;

    v35 = v4;
    objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("content"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("channels"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("contentPersonalizedInfo"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v8, "wlk_arrayForKey:", CFSTR("smartPlayables"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("playables"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "wlk_stringForKey:", CFSTR("playableId"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "wlk_dictionaryForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v11);
    }
    v18 = +[WLKNetworkRequestUtilities isGDPRAccepted](WLKNetworkRequestUtilities, "isGDPRAccepted");
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ams_activeiTunesAccount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v36, "wlk_BOOLForKey:defaultValue:", CFSTR("isAddToUpNextEnabled"), 0) & v18;
    if (!v20)
      LOBYTE(v21) = 0;
    v5 = v34;
    v34->_watchListable = v21;
    WLKSystemLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v44 = v18;
      _os_log_impl(&dword_1B515A000, v22, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesResponse - isGDPRAccepted:%d", buf, 8u);
    }

    WLKSystemLogObject();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v44 = v20 != 0;
      _os_log_impl(&dword_1B515A000, v23, OS_LOG_TYPE_DEFAULT, "WLKCanonicalPlayablesResponse - isAccountPresent:%d", buf, 8u);
    }

    v34->_watchListed = objc_msgSend(v36, "wlk_BOOLForKey:defaultValue:", CFSTR("inUpNext"), 0);
    +[WLKCanonicalPlayablesResponse _parseChannelsFromPayload:](WLKCanonicalPlayablesResponse, "_parseChannelsFromPayload:", v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "wlk_stringForKey:", CFSTR("id"));
    v25 = objc_claimAutoreleasedReturnValue();
    canonicalID = v34->_canonicalID;
    v34->_canonicalID = (NSString *)v25;

    objc_msgSend(v33, "wlk_stringForKey:", CFSTR("type"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34->_contentType = +[WLKBasicContentMetadata contentTypeForString:](WLKBasicContentMetadata, "contentTypeForString:", v27);

    v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (-[NSString length](v34->_canonicalID, "length"))
      objc_msgSend(v28, "setObject:forKey:", v34->_canonicalID, CFSTR("WLKModelContextKeyCanonicalID"));
    v4 = v35;
    if (v24)
      objc_msgSend(v28, "setObject:forKey:", v24, CFSTR("WLKModelContextKeyChannels"));
    +[WLKPlayable playablesWithDictionaries:context:](WLKPlayable, "playablesWithDictionaries:context:", v9, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    playables = v34->_playables;
    v34->_playables = (NSArray *)v29;

  }
  return v5;
}

- (WLKCanonicalPlayablesResponse)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKCanonicalPlayablesResponse"), CFSTR("-init is not supported"));

  return 0;
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
  v9[2] = __59__WLKCanonicalPlayablesResponse__parseChannelsFromPayload___block_invoke;
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

void __59__WLKCanonicalPlayablesResponse__parseChannelsFromPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (WLKCanonicalPlayablesResponse)initWithSiriResponse:(id)a3 statsID:(id)a4
{
  id v6;
  id v7;
  WLKCanonicalPlayablesResponse *v8;
  WLKCanonicalPlayablesResponse *v9;
  WLKCanonicalPlayablesSiriResponse *v10;
  void *v11;
  uint64_t v12;
  NSArray *playables;
  void *v14;
  uint64_t v15;
  NSDictionary *dictionary;
  void *v17;
  uint64_t v18;
  NSString *canonicalID;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WLKCanonicalPlayablesResponse;
  v8 = -[WLKCanonicalPlayablesResponse init](&v21, sel_init);
  v9 = v8;
  if (v6 && v8)
  {
    v10 = -[WLKCanonicalPlayablesSiriResponse initWithDictionary:statsID:]([WLKCanonicalPlayablesSiriResponse alloc], "initWithDictionary:statsID:", v6, v7);
    -[WLKCanonicalPlayablesSiriResponse playables](v10, "playables");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    playables = v9->_playables;
    v9->_playables = (NSArray *)v12;

    -[WLKCanonicalPlayablesSiriResponse dictionary](v10, "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    dictionary = v9->_dictionary;
    v9->_dictionary = (NSDictionary *)v15;

    v9->_watchListed = -[WLKCanonicalPlayablesSiriResponse isWatchListed](v10, "isWatchListed");
    v9->_watchListable = -[WLKCanonicalPlayablesSiriResponse isWatchListable](v10, "isWatchListable");
    v9->_contentType = -[WLKCanonicalPlayablesSiriResponse contentType](v10, "contentType");
    -[WLKCanonicalPlayablesSiriResponse canonicalID](v10, "canonicalID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    canonicalID = v9->_canonicalID;
    v9->_canonicalID = (NSString *)v18;

  }
  return v9;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (BOOL)isWatchListable
{
  return self->_watchListable;
}

- (BOOL)isWatchListed
{
  return self->_watchListed;
}

- (NSArray)playables
{
  return self->_playables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playables, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
