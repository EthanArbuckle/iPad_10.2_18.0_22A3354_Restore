@implementation WLKCanonicalContainerResponse

- (WLKCanonicalContainerResponse)initWithDictionary:(id)a3
{
  id v5;
  WLKCanonicalContainerResponse *v6;
  WLKCanonicalContainerResponse *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *canonicalID;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  WLKCanonicalContainerResponse *v25;
  id v26;
  id v27;
  id v28;
  WLKCanonicalContainerResponse *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSDictionary *defaultSeason;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  WLKCanonicalContainerResponse *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD block[4];
  WLKCanonicalContainerResponse *v59;
  id v60;
  id v61;
  id v62;
  objc_super v63;
  const __CFString *v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v63.receiver = self;
  v63.super_class = (Class)WLKCanonicalContainerResponse;
  v6 = -[WLKCanonicalContainerResponse init](&v63, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v50 = v5;
    objc_msgSend(v5, "wlk_dictionaryForKey:", CFSTR("data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("content"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("channels"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("contentPersonalizedInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_arrayForKey:", CFSTR("howToWatch"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("smartEpisode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("playables"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_arrayForKey:", CFSTR("smartEpisodePlayables"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("seasons"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v13;
    objc_msgSend(v13, "wlk_stringForKey:", CFSTR("seasonId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "wlk_dictionaryForKey:", v15);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "wlk_dictionaryForKey:", CFSTR("seasons"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_watchListable = objc_msgSend(v11, "wlk_BOOLForKey:defaultValue:", CFSTR("isAddToUpNextEnabled"), 0);
    v47 = v11;
    v7->_watchListed = objc_msgSend(v11, "wlk_BOOLForKey:defaultValue:", CFSTR("inUpNext"), 0);
    v48 = (void *)v10;
    +[WLKCanonicalContainerResponse parseChannelsFromPayload:](WLKCanonicalContainerResponse, "parseChannelsFromPayload:", v10);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wlk_stringForKey:", CFSTR("id"));
    v18 = objc_claimAutoreleasedReturnValue();
    canonicalID = v7->_canonicalID;
    v7->_canonicalID = (NSString *)v18;

    v49 = v9;
    objc_msgSend(v9, "wlk_stringForKey:", CFSTR("type"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_contentType = +[WLKBasicContentMetadata contentTypeForString:](WLKBasicContentMetadata, "contentTypeForString:", v20);

    v46 = (void *)v17;
    if (v17)
    {
      v64 = CFSTR("WLKModelContextKeyChannels");
      v65[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    v22 = dispatch_group_create();
    dispatch_get_global_queue(0, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__WLKCanonicalContainerResponse_initWithDictionary___block_invoke;
    block[3] = &unk_1E68A8E10;
    v25 = v7;
    v59 = v25;
    v26 = v12;
    v60 = v26;
    v27 = v21;
    v61 = v27;
    v28 = v16;
    v62 = v28;
    dispatch_group_async(v22, v23, block);

    v51[0] = v24;
    v51[1] = 3221225472;
    v51[2] = __52__WLKCanonicalContainerResponse_initWithDictionary___block_invoke_2;
    v51[3] = &unk_1E68A8E38;
    v29 = v25;
    v52 = v29;
    v39 = v41;
    v53 = v39;
    v42 = v27;
    v54 = v42;
    v30 = v44;
    v55 = v30;
    v31 = v43;
    v56 = v31;
    v32 = v40;
    v57 = v32;
    dispatch_group_async(v22, v23, v51);

    dispatch_group_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
    if (v26 && objc_msgSend(v26, "count", v39))
    {
      v45 = v28;
      objc_msgSend(v26, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "wlk_arrayForKey:", CFSTR("seasons"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34 && objc_msgSend(v34, "count"))
      {
        objc_msgSend(v35, "firstObject");
        v36 = objc_claimAutoreleasedReturnValue();
        defaultSeason = v29->_defaultSeason;
        v29->_defaultSeason = (NSDictionary *)v36;

      }
      v28 = v45;
    }

    v5 = v50;
  }

  return v7;
}

void __52__WLKCanonicalContainerResponse_initWithDictionary___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[WLKChannel channelsWithDictionaries:context:seasons:](WLKChannel, "channelsWithDictionaries:context:seasons:", a1[5], a1[6], a1[7]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

void __52__WLKCanonicalContainerResponse_initWithDictionary___block_invoke_2(_QWORD *a1)
{
  WLKBasicEpisodeMetadata *v2;
  uint64_t v3;
  void *v4;

  v2 = -[WLKBasicEpisodeMetadata initWithDictionary:context:playablesDict:playablesId:seasonsDict:]([WLKBasicEpisodeMetadata alloc], "initWithDictionary:context:playablesDict:playablesId:seasonsDict:", a1[5], a1[6], a1[7], a1[8], a1[9]);
  v3 = a1[4];
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)parseChannelsFromPayload:(id)a3
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
  v9[2] = __58__WLKCanonicalContainerResponse_parseChannelsFromPayload___block_invoke;
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

void __58__WLKCanonicalContainerResponse_parseChannelsFromPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (WLKCanonicalContainerResponse)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKCanonicalContainerResponse"), CFSTR("-init is not supported"));

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

- (WLKBasicEpisodeMetadata)currentEpisode
{
  return self->_currentEpisode;
}

- (NSDictionary)defaultSeason
{
  return self->_defaultSeason;
}

- (NSArray)channels
{
  return self->_channels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_defaultSeason, 0);
  objc_storeStrong((id *)&self->_currentEpisode, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
