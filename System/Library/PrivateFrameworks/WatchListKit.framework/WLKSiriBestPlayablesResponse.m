@implementation WLKSiriBestPlayablesResponse

- (WLKSiriBestPlayablesResponse)init
{
  -[WLKSiriBestPlayablesResponse doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (WLKSiriBestPlayablesResponse)initWithDictionary:(id)a3
{
  id v4;
  WLKSiriBestPlayablesResponse *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  WLKPlayable *v18;
  uint64_t v19;
  NSDictionary *playablesByID;
  WLKSiriBestPlayablesResponse *v22;
  id v23;
  id v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WLKSiriBestPlayablesResponse;
  v5 = -[WLKSiriBestPlayablesResponse init](&v31, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v22 = v5;
    v5->_dictionary = (NSDictionary *)v6;

    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v23 = v4;
    objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKChannelsResponse parseChannelsFromPayload:](WLKChannelsResponse, "parseChannelsFromPayload:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = v8;
    objc_msgSend(v8, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v25, "wlk_dictionaryForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "wlk_stringForKey:", CFSTR("canonicalId"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            if (objc_msgSend(v16, "length"))
              objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("WLKModelContextKeyCanonicalID"));
            if (v9)
              objc_msgSend(v17, "setObject:forKey:", v9, CFSTR("WLKModelContextKeyChannels"));
            v18 = -[WLKPlayable initWithDictionary:context:]([WLKPlayable alloc], "initWithDictionary:context:", v15, v17);
            if (v18)
              objc_msgSend(v24, "setObject:forKey:", v18, v14);

          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }

    v19 = objc_msgSend(v24, "copy");
    v5 = v22;
    playablesByID = v22->_playablesByID;
    v22->_playablesByID = (NSDictionary *)v19;

    v4 = v23;
  }

  return v5;
}

- (id)playableForStatsID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WLKSiriBestPlayablesResponse playablesByID](self, "playablesByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSDictionary)playablesByID
{
  return self->_playablesByID;
}

- (void)setPlayablesByID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playablesByID, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
