@implementation VUITransactionOffer

- (VUITransactionOffer)initWithDictionary:(id)a3
{
  id v5;
  VUITransactionOffer *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *videosPlayables;
  void *v12;
  uint64_t v13;
  NSDictionary *offer;
  uint64_t v15;
  NSURL *sharedWatchUrl;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *canonicalIDs;
  objc_super v34;

  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VUITransactionOffer;
  v6 = -[VUITransactionOffer init](&v34, sel_init);
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&v6->_transactionOfferDict, a3);
      objc_msgSend(v5, "vui_arrayForKey:", CFSTR("videosPlayables"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "vui_dictionaryForKey:", CFSTR("contentMetadata"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIVideosPlayable videosPlayablesFromDictionaries:andMetadataDictionary:](VUIVideosPlayable, "videosPlayablesFromDictionaries:andMetadataDictionary:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      videosPlayables = v6->_videosPlayables;
      v6->_videosPlayables = (NSArray *)v10;

      objc_msgSend(v5, "vui_dictionaryForKey:", CFSTR("offer"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      offer = v6->_offer;
      v6->_offer = (NSDictionary *)v13;

      v6->_initiateFamilySetup = objc_msgSend(v5, "vui_BOOLForKey:defaultValue:", CFSTR("initiateFamilySetup"), 0);
      objc_msgSend(v5, "vui_URLForKey:", CFSTR("sharedWatchUrl"));
      v15 = objc_claimAutoreleasedReturnValue();
      sharedWatchUrl = v6->_sharedWatchUrl;
      v6->_sharedWatchUrl = (NSURL *)v15;

      v17 = (void *)MEMORY[0x1E0C99E20];
      -[NSDictionary vui_arrayForKey:](v6->_offer, "vui_arrayForKey:", CFSTR("canonicalIds"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
        v20 = v18;
      else
        v20 = MEMORY[0x1E0C9AA60];
      objc_msgSend(v17, "setWithArray:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v21, "count") && -[NSArray count](v6->_videosPlayables, "count"))
      {
        -[NSArray firstObject](v6->_videosPlayables, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "metadata");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "showCanonicalId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "length");

        if (v25)
        {
          objc_msgSend(v22, "metadata");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "showCanonicalId");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        objc_msgSend(v22, "canonicalID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "length");

        if (v29)
        {
          objc_msgSend(v22, "canonicalID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v30);

        }
      }
      objc_msgSend(v21, "allObjects");
      v31 = objc_claimAutoreleasedReturnValue();
      canonicalIDs = v6->_canonicalIDs;
      v6->_canonicalIDs = (NSArray *)v31;

    }
  }

  return v6;
}

- (BOOL)playWhenDone
{
  return -[NSDictionary vui_BOOLForKey:defaultValue:](self->_transactionOfferDict, "vui_BOOLForKey:defaultValue:", CFSTR("playWhenDone"), 1);
}

- (NSString)buyParams
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[NSDictionary vui_stringForKey:](self->_transactionOfferDict, "vui_stringForKey:", CFSTR("buyParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "length"))
  {
    -[VUITransactionOffer offer](self, "offer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vui_stringForKey:", CFSTR("buyParams"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return (NSString *)v4;
}

- (NSString)title
{
  return (NSString *)-[NSDictionary vui_stringForKey:](self->_transactionOfferDict, "vui_stringForKey:", CFSTR("title"));
}

- (id)notificationTitle
{
  return (id)-[NSDictionary vui_stringForKey:](self->_transactionOfferDict, "vui_stringForKey:", CFSTR("notificationTitle"));
}

- (id)notificationBody
{
  return (id)-[NSDictionary vui_stringForKey:](self->_transactionOfferDict, "vui_stringForKey:", CFSTR("notificationBody"));
}

- (NSArray)videosPlayables
{
  return self->_videosPlayables;
}

- (NSArray)canonicalIDs
{
  return self->_canonicalIDs;
}

- (NSDictionary)offer
{
  return self->_offer;
}

- (NSURL)sharedWatchUrl
{
  return self->_sharedWatchUrl;
}

- (BOOL)initiateFamilySetup
{
  return self->_initiateFamilySetup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedWatchUrl, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_canonicalIDs, 0);
  objc_storeStrong((id *)&self->_videosPlayables, 0);
  objc_storeStrong((id *)&self->_transactionOfferDict, 0);
}

@end
