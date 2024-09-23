@implementation SSItem

- (void)dealloc
{
  objc_super v3;

  -[NSArray makeObjectsPerformSelector:withObject:](self->_offers, "makeObjectsPerformSelector:withObject:", sel__setOfferItem_, 0);

  -[SSRequest setDelegate:](self->_tellAFriendRequest, "setDelegate:", 0);
  -[SSRequest cancel](self->_tellAFriendRequest, "cancel");

  v3.receiver = self;
  v3.super_class = (Class)SSItem;
  -[SSItem dealloc](&v3, sel_dealloc);
}

- (NSArray)allItemOffers
{
  return (NSArray *)-[SSItem _offers](self, "_offers");
}

- (NSString)artistName
{
  id v3;

  v3 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("artist-name"));
  if (!v3)
    v3 = (id)objc_msgSend(-[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("company")), "objectForKey:", CFSTR("title"));
  return (NSString *)v3;
}

- (float)averageUserRating
{
  id v2;
  float result;

  v2 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("average-user-rating"));
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0.0;
  objc_msgSend(v2, "floatValue");
  return result;
}

- (SSItemOffer)defaultItemOffer
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SSItemOffer *result;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = +[SSItemOffer _preferredOfferIdentifiers](SSItemOffer, "_preferredOfferIdentifiers");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v3);
      result = -[SSItem itemOfferForIdentifier:](self, "itemOfferForIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
      if (result)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = -[SSItem _offers](self, "_offers");
    result = (SSItemOffer *)objc_msgSend(v9, "count");
    if (result)
      return (SSItemOffer *)(id)objc_msgSend(v9, "objectAtIndex:", 0);
  }
  return result;
}

- (SSItemImageCollection)imageCollection
{
  id v2;
  SSItemImageCollection *v3;

  v2 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("artwork-urls"));
  v3 = (SSItemImageCollection *)objc_msgSend(v2, "count");
  if (v3)
    v3 = -[SSItemImageCollection initWithImageCollection:]([SSItemImageCollection alloc], "initWithImageCollection:", v2);
  return v3;
}

- (BOOL)isGameCenterEnabled
{
  id v2;

  v2 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("game-center-enabled"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (BOOL)isRestricted
{
  uint64_t v3;
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  int v8;
  unint64_t v9;
  id v10;
  void *v11;
  int v12;
  void *v14;
  int v15;

  v3 = 1000;
  v4 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("rating"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("rank"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (int)objc_msgSend(v5, "intValue");
  }
  v6 = -[SSItem itemKind](self, "itemKind");
  if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("software"))
    || -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("newsstand")))
  {
    v7 = (void *)SBSCopyDisplayIdentifiers();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.AppStore"));
    v9 = 0;
    goto LABEL_7;
  }
  if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("movie")))
  {
    v7 = (void *)SBSCopyDisplayIdentifiers();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.MobileStore"));
    v9 = 1;
    goto LABEL_7;
  }
  if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("tv-episode"))
    || -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("tv-season")))
  {
    v7 = (void *)SBSCopyDisplayIdentifiers();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.MobileStore"));
    v9 = 2;
LABEL_7:

    v10 = SSRestrictionsCopyRankForMediaType(v9);
    if (v10)
    {
      v11 = v10;
      if (v8)
        LOBYTE(v12) = objc_msgSend(v10, "integerValue") < v3;
      else
        LOBYTE(v12) = 1;

    }
    else
    {
      LOBYTE(v12) = v8 ^ 1;
    }
    return v12;
  }
  if (!-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("album"))
    && !-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("mix"))
    && !-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("podcast"))
    && !-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("podcast-episode"))
    && !-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("music-video"))
    && !-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("song")))
  {
    if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("artist"))
      || -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("audiobook"))
      || -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("booklet")))
    {
      return SSApplicationWithIdentifierIsAvailable((uint64_t)CFSTR("com.apple.MobileStore")) ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
    return v12;
  }
  v14 = (void *)SBSCopyDisplayIdentifiers();
  v15 = objc_msgSend(v14, "containsObject:", CFSTR("com.apple.MobileStore"));

  if (v3 == 200)
    LOBYTE(v12) = 1;
  else
    LOBYTE(v12) = v15 ^ 1;
  if (v3 != 200 || !v15)
    return v12;
  return MGGetBoolAnswer();
}

- (BOOL)isHighDefinition
{
  id v2;

  v2 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("high-definition"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (NSString)itemKind
{
  id v3;
  NSString *v4;

  v3 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("type"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("link")))
  {
    v4 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("link-type"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v4;
  }
  return (NSString *)v3;
}

- (id)itemOfferForIdentifier:(id)a3
{
  id v5;
  id result;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid offer identifier"));
  v5 = -[SSItem _offers](self, "_offers");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  result = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9);
        if (objc_msgSend((id)objc_msgSend(v10, "offerIdentifier"), "isEqualToString:", a3))
          return v10;
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      result = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (NSString)itemTitle
{
  NSString *result;

  result = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("unmodified-title"));
  if (!result)
    return (NSString *)-[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("title"));
  return result;
}

- (NSNumber)ITunesStoreIdentifier
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", SSGetItemIdentifierFromValue(-[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("item-id"))));
}

- (void)loadTellAFriendMessageWithCompletionHandler:(id)a3
{
  SSItem *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SSMutableURLRequestProperties *v10;
  SSURLConnectionRequest *v11;
  SSItem *v12;
  uint64_t v13;
  id v14;

  if (-[SSItem tellAFriendBody](self, "tellAFriendBody"))
  {
    if (a3)
    {
      v5 = self;
      (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
    }
  }
  else
  {
    v6 = objc_msgSend(-[SSItem _tellAFriendDictionary](self, "_tellAFriendDictionary"), "objectForKey:", CFSTR("body-url"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6)) != 0)
    {
      v14 = (id)v7;
      if (!self->_tellAFriendHandlers)
        self->_tellAFriendHandlers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = objc_msgSend(a3, "copy");
      if (v8)
      {
        v9 = (void *)v8;
        -[NSMutableArray addObject:](self->_tellAFriendHandlers, "addObject:", v8);

      }
      if (!self->_tellAFriendRequest)
      {
        v10 = objc_alloc_init(SSMutableURLRequestProperties);
        -[SSMutableURLRequestProperties setITunesStoreRequest:](v10, "setITunesStoreRequest:", 1);
        -[SSMutableURLRequestProperties setURL:](v10, "setURL:", v14);
        v11 = -[SSURLConnectionRequest initWithRequestProperties:]([SSURLConnectionRequest alloc], "initWithRequestProperties:", v10);
        self->_tellAFriendRequest = v11;
        -[SSRequest setDelegate:](v11, "setDelegate:", self);
        -[SSRequest setShouldCancelAfterTaskExpiration:](self->_tellAFriendRequest, "setShouldCancelAfterTaskExpiration:", 1);
        -[SSURLConnectionRequest start](self->_tellAFriendRequest, "start");

      }
    }
    else if (a3)
    {
      v12 = self;
      v13 = SSError((uint64_t)CFSTR("SSErrorDomain"), 106, 0, 0);
      (*((void (**)(id, uint64_t))a3 + 2))(a3, v13);
    }
  }
}

- (int64_t)numberOfPrintedPages
{
  id v2;

  v2 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("number-of-pages"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "integerValue");
  else
    return 0;
}

- (int64_t)numberOfUserRatings
{
  id v2;

  v2 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("user-rating-count"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (int)objc_msgSend(v2, "intValue");
  else
    return 0;
}

- (id)relatedItemsForRelationType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  SSItem *v12;
  SSItem *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = -[NSDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("related-items"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = (void *)objc_msgSend(v4, "objectForKey:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = -[SSItem initWithItemDictionary:]([SSItem alloc], "initWithItemDictionary:", v11);
          if (v12)
          {
            v13 = v12;
            objc_msgSend(v6, "addObject:", v12);

          }
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  return v6;
}

- (id)tellAFriendBody
{
  NSString *tellAFriendBody;
  void *v4;

  tellAFriendBody = self->_tellAFriendBody;
  if (!tellAFriendBody)
  {
    v4 = (void *)objc_msgSend(-[SSItem _tellAFriendDictionary](self, "_tellAFriendDictionary"), "objectForKey:", CFSTR("body"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      tellAFriendBody = v4;
      self->_tellAFriendBody = tellAFriendBody;
    }
    else
    {
      tellAFriendBody = self->_tellAFriendBody;
    }
  }
  return tellAFriendBody;
}

- (id)tellAFriendBodyMIMEType
{
  NSString *tellAFriendBodyMIMEType;
  void *v4;

  tellAFriendBodyMIMEType = self->_tellAFriendBodyMIMEType;
  if (!tellAFriendBodyMIMEType)
  {
    v4 = (void *)objc_msgSend(-[SSItem _tellAFriendDictionary](self, "_tellAFriendDictionary"), "objectForKey:", CFSTR("body-mime-type"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      tellAFriendBodyMIMEType = v4;
    else
      tellAFriendBodyMIMEType = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", CFSTR("text/plain"));
    self->_tellAFriendBodyMIMEType = tellAFriendBodyMIMEType;
  }
  return tellAFriendBodyMIMEType;
}

- (id)tellAFriendBodyURL
{
  uint64_t v2;

  v2 = objc_msgSend(-[SSItem _tellAFriendDictionary](self, "_tellAFriendDictionary"), "objectForKey:", CFSTR("body-url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  else
    return 0;
}

- (id)tellAFriendSubject
{
  NSString *tellAFriendSubject;
  void *v4;

  tellAFriendSubject = self->_tellAFriendSubject;
  if (!tellAFriendSubject)
  {
    v4 = (void *)objc_msgSend(-[SSItem _tellAFriendDictionary](self, "_tellAFriendDictionary"), "objectForKey:", CFSTR("subject"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      tellAFriendSubject = v4;
      self->_tellAFriendSubject = tellAFriendSubject;
    }
    else
    {
      tellAFriendSubject = self->_tellAFriendSubject;
    }
  }
  return tellAFriendSubject;
}

- (NSArray)thumbnailImages
{
  return -[SSItemImageCollection itemImages](-[SSItem imageCollection](self, "imageCollection"), "itemImages");
}

- (id)tweetInitialText
{
  id v2;
  void *v3;

  v2 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("tweet-info"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "objectForKey:", CFSTR("text"));
  else
    v3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (id)tweetURL
{
  id v2;
  uint64_t v3;

  v2 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("tweet-info"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "objectForKey:", CFSTR("url"));
  else
    v3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  else
    return 0;
}

- (id)valueForProperty:(id)a3
{
  return -[NSDictionary objectForKey:](self->_properties, "objectForKey:", a3);
}

- (NSURL)viewItemURL
{
  NSURL *result;

  result = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("url"));
  if (result)
    return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", result);
  return result;
}

- (id)buyParameters
{
  return -[SSItemOffer buyParameters](-[SSItem defaultItemOffer](self, "defaultItemOffer"), "buyParameters");
}

- (id)playableMedia
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = -[SSItem _offers](self, "_offers");
  if (!objc_msgSend(v2, "count"))
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "playableMedia");
        if (v8)
          objc_msgSend(v3, "addObject:", v8);
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)priceDisplay
{
  return -[SSItemOffer priceDisplay](-[SSItem defaultItemOffer](self, "defaultItemOffer"), "priceDisplay");
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItem;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), -[SSItem description](&v3, sel_description), -[NSDictionary description](self->_properties, "description"));
}

- (SSItem)initWithItemDictionary:(id)a3
{
  SSItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSItem;
  v4 = -[SSItem init](&v6, sel_init);
  if (v4)
    v4->_properties = (NSDictionary *)objc_msgSend(a3, "copy");
  return v4;
}

- (id)artistIdentifier
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("artist-id"));
}

- (id)bundleIdentifier
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("bundle-id"));
}

- (id)bundleVersion
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("version"));
}

- (id)collectionArtistName
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("collection-artist-name"));
}

- (id)collectionIdentifier
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("collection-id"));
}

- (id)collectionIndexInCollectionGroup
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("disc-number"));
}

- (id)collectionName
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("collection-name"));
}

- (id)composerName
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("composer-name"));
}

- (id)contentRating
{
  id v2;

  v2 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("rating"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[SSItemContentRating initWithDictionary:]([SSItemContentRating alloc], "initWithDictionary:", v2);
  else
    return 0;
}

- (id)episodeIdentifier
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("episode-id"));
}

- (id)episodeSortIdentifier
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("episode-sort-id"));
}

- (id)genreIdentifier
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("genre-id"));
}

- (id)genreName
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("genre-name"));
}

- (id)indexInCollection
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("track-number"));
}

- (BOOL)isCompilation
{
  id v2;

  v2 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("is-compilation"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (id)longDescription
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("description"));
}

- (id)mediaKind
{
  return (id)SSItemMediaKindForItemKind(-[SSItem itemKind](self, "itemKind"), -[SSItemOffer offerIdentifier](-[SSItem defaultItemOffer](self, "defaultItemOffer"), "offerIdentifier"));
}

- (id)networkName
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("network-name"));
}

- (id)numberOfCollectionsInCollectionGroup
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("disc-count"));
}

- (id)numberOfItemsInCollection
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("track-count"));
}

- (id)podcastEpisodeGUID
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("episode-guid"));
}

- (id)podcastFeedURL
{
  id result;

  result = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("podcast-feed-url"));
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", result);
  return result;
}

- (id)rawItemDictionary
{
  return self->_properties;
}

- (id)releaseDate
{
  id v2;
  id v3;
  void *v4;

  v2 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("release-date"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss ZZZ"));
    v4 = (void *)objc_msgSend(v3, "dateFromString:", v2);

    return v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v2;
    else
      return 0;
  }
}

- (id)releaseDateString
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("release-date-string"));
}

- (id)preOrderIdentifier
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("preorder-id"));
}

- (id)seasonNumber
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("season-number"));
}

- (id)sendGiftURL
{
  id result;

  result = (id)objc_msgSend(-[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("gifting-button")), "objectForKey:", CFSTR("url"));
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", result);
  return result;
}

- (id)seriesName
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("series-name"));
}

- (void)_setExpirationDate:(id)a3
{
  NSDate *expirationDate;

  expirationDate = self->_expirationDate;
  if (expirationDate != a3)
  {

    self->_expirationDate = (NSDate *)a3;
  }
}

- (id)shortDescription
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("description"));
}

- (id)softwareType
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("software-type"));
}

- (id)videoDetails
{
  return -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("videoDetails"));
}

- (id)viewReviewsURL
{
  id result;

  result = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("view-user-reviews-url"));
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", result);
  return result;
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  if (self->_tellAFriendRequest == a3)
  {
    if (!a4)
      a4 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    -[SSItem _finishTellAFriendLoadWithError:](self, "_finishTellAFriendLoadWithError:", a4);
  }
}

- (void)requestDidFinish:(id)a3
{
  if (self->_tellAFriendRequest == a3)
    -[SSItem _finishTellAFriendLoadWithError:](self, "_finishTellAFriendLoadWithError:", 0);
}

- (void)urlConnectionRequest:(id)a3 didReceiveResponse:(id)a4
{
  const __CFString *v6;
  CFStringEncoding v7;

  if (self->_tellAFriendRequest == a3)
  {

    self->_tellAFriendBodyMIMEType = (NSString *)(id)objc_msgSend(a4, "MIMEType");
    v6 = (const __CFString *)objc_msgSend(a4, "textEncodingName");
    if (v6)
      v7 = CFStringConvertIANACharSetNameToEncoding(v6);
    else
      v7 = 134217984;

    self->_tellAFriendBody = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", objc_msgSend(a4, "bodyData"), CFStringConvertEncodingToNSStringEncoding(v7));
  }
}

- (void)_finishTellAFriendLoadWithError:(id)a3
{
  void *v4;
  SSItem *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[NSMutableArray copy](self->_tellAFriendHandlers, "copy");
  -[SSRequest setDelegate:](self->_tellAFriendRequest, "setDelegate:", 0);

  self->_tellAFriendRequest = 0;
  self->_tellAFriendHandlers = 0;
  v5 = self;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_offers
{
  id result;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  SSItemOffer *v12;
  SSItemOffer *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = self->_offers;
  if (!result)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = -[SSItem valueForProperty:](self, "valueForProperty:", CFSTR("store-offers"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v11 = objc_msgSend(v5, "objectForKey:", v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = -[SSItemOffer initWithOfferIdentifier:dictionary:]([SSItemOffer alloc], "initWithOfferIdentifier:dictionary:", v10, v11);
            if (v12)
            {
              v13 = v12;
              -[SSItemOffer _setOfferItem:](v12, "_setOfferItem:", self);
              objc_msgSend(v4, "addObject:", v13);

            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    self->_offers = (NSArray *)objc_msgSend(v4, "copy");

    return self->_offers;
  }
  return result;
}

- (id)_tellAFriendDictionary
{
  id v2;

  v2 = -[NSDictionary objectForKey:](self->_properties, "objectForKey:", CFSTR("tell-a-friend"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

@end
