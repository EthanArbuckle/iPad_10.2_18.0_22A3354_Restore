@implementation WLKPlayActivityMetadata

- (WLKPlayActivityMetadata)initWithKey:(id)a3 dictionary:(id)a4
{
  id v6;
  WLKPlayActivityMetadata *v7;
  WLKPlayActivityMetadata *v8;
  uint64_t v9;
  NSString *externalShowID;
  uint64_t v11;
  NSString *canonicalID;
  uint64_t v13;
  NSString *canonicalShowID;
  uint64_t v15;
  NSString *internalLegID;
  uint64_t v17;
  NSNumber *isShowClosed;
  uint64_t v19;
  NSNumber *isCurrentEpisode;
  uint64_t v21;
  NSString *overrideChannelID;
  void *v23;
  uint64_t v24;
  NSArray *siriActionsCategories;
  void *v26;
  objc_super v28;

  v6 = a4;
  if (objc_msgSend(a3, "rangeOfString:options:", CFSTR(":"), 6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid key provided"));
    v7 = 0;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)WLKPlayActivityMetadata;
    v8 = -[WLKPlayActivityMetadata init](&v28, sel_init);
    if (v8)
    {
      objc_msgSend(v6, "wlk_stringForKey:", CFSTR("externalShowId"));
      v9 = objc_claimAutoreleasedReturnValue();
      externalShowID = v8->_externalShowID;
      v8->_externalShowID = (NSString *)v9;

      objc_msgSend(v6, "wlk_stringForKey:", CFSTR("canonicalId"));
      v11 = objc_claimAutoreleasedReturnValue();
      canonicalID = v8->_canonicalID;
      v8->_canonicalID = (NSString *)v11;

      objc_msgSend(v6, "wlk_stringForKey:", CFSTR("canonicalShowId"));
      v13 = objc_claimAutoreleasedReturnValue();
      canonicalShowID = v8->_canonicalShowID;
      v8->_canonicalShowID = (NSString *)v13;

      objc_msgSend(v6, "wlk_stringForKey:", CFSTR("internalLegId"));
      v15 = objc_claimAutoreleasedReturnValue();
      internalLegID = v8->_internalLegID;
      v8->_internalLegID = (NSString *)v15;

      objc_msgSend(v6, "wlk_numberForKey:", CFSTR("isShowClosed"));
      v17 = objc_claimAutoreleasedReturnValue();
      isShowClosed = v8->_isShowClosed;
      v8->_isShowClosed = (NSNumber *)v17;

      objc_msgSend(v6, "wlk_numberForKey:", CFSTR("isCurrent"));
      v19 = objc_claimAutoreleasedReturnValue();
      isCurrentEpisode = v8->_isCurrentEpisode;
      v8->_isCurrentEpisode = (NSNumber *)v19;

      objc_msgSend(v6, "wlk_stringForKey:", CFSTR("brandId"));
      v21 = objc_claimAutoreleasedReturnValue();
      overrideChannelID = v8->_overrideChannelID;
      v8->_overrideChannelID = (NSString *)v21;

      objc_msgSend(v6, "wlk_arrayForKey:", CFSTR("siriActionsCategories"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      siriActionsCategories = v8->_siriActionsCategories;
      v8->_siriActionsCategories = (NSArray *)v24;

      objc_msgSend(v6, "objectForKey:", CFSTR("contentType"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_contentType = +[WLKBasicContentMetadata contentTypeForString:](WLKBasicContentMetadata, "contentTypeForString:", v26);

    }
    self = v8;
    v7 = self;
  }

  return v7;
}

- (WLKPlayActivityMetadata)initWithDictionary:(id)a3
{
  id v4;
  WLKPlayActivityMetadata *v5;
  uint64_t v6;
  NSString *canonicalID;
  uint64_t v8;
  NSString *url;
  uint64_t v10;
  NSString *nowPlayingPassThrough;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WLKPlayActivityMetadata;
  v5 = -[WLKPlayActivityMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("canonicalId"));
    v6 = objc_claimAutoreleasedReturnValue();
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v6;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("url"));
    v8 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v8;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("nowPlayingPassThrough"));
    v10 = objc_claimAutoreleasedReturnValue();
    nowPlayingPassThrough = v5->_nowPlayingPassThrough;
    v5->_nowPlayingPassThrough = (NSString *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_contentType = +[WLKBasicContentMetadata contentTypeForString:](WLKBasicContentMetadata, "contentTypeForString:", v12);

  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSString)externalShowID
{
  return self->_externalShowID;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSString)canonicalShowID
{
  return self->_canonicalShowID;
}

- (NSString)internalLegID
{
  return self->_internalLegID;
}

- (NSString)overrideChannelID
{
  return self->_overrideChannelID;
}

- (NSArray)siriActionsCategories
{
  return self->_siriActionsCategories;
}

- (NSNumber)isCurrentEpisode
{
  return self->_isCurrentEpisode;
}

- (NSNumber)isShowClosed
{
  return self->_isShowClosed;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)nowPlayingPassThrough
{
  return self->_nowPlayingPassThrough;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingPassThrough, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_isShowClosed, 0);
  objc_storeStrong((id *)&self->_isCurrentEpisode, 0);
  objc_storeStrong((id *)&self->_siriActionsCategories, 0);
  objc_storeStrong((id *)&self->_overrideChannelID, 0);
  objc_storeStrong((id *)&self->_internalLegID, 0);
  objc_storeStrong((id *)&self->_canonicalShowID, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_externalShowID, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
