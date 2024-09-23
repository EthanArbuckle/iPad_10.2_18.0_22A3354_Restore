@implementation WLKOfferListing

- (WLKOfferListing)initWithMAPIDictionaries:(id)a3
{
  id v4;
  WLKOfferListing *v5;
  WLKOfferListing *v6;
  uint64_t v7;
  NSArray *storeOffers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WLKOfferListing;
  v5 = -[WLKOfferListing init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WLKOfferListing _storeOffersFromMAPIDictionaries:](v5, "_storeOffersFromMAPIDictionaries:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    storeOffers = v6->_storeOffers;
    v6->_storeOffers = (NSArray *)v7;

  }
  return v6;
}

- (WLKStoreOffer)bestStoreBuyOffer
{
  return (WLKStoreOffer *)-[WLKOfferListing _bestStoreOfferForOfferType:](self, "_bestStoreOfferForOfferType:", 1);
}

- (WLKStoreOffer)bestStoreRentalOffer
{
  return (WLKStoreOffer *)-[WLKOfferListing _bestStoreOfferForOfferType:](self, "_bestStoreOfferForOfferType:", 2);
}

- (WLKStoreOffer)bestStoreGetOffer
{
  return (WLKStoreOffer *)-[WLKOfferListing _bestStoreOfferForOfferType:](self, "_bestStoreOfferForOfferType:", 5);
}

- (WLKStoreOffer)bestStoreRedownloadOffer
{
  return (WLKStoreOffer *)-[WLKOfferListing _bestStoreOfferForOfferType:](self, "_bestStoreOfferForOfferType:", 6);
}

- (id)_storeOffersFromMAPIDictionaries:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WLKStoreOffer *v11;
  WLKStoreOffer *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [WLKStoreOffer alloc];
        v12 = -[WLKStoreOffer initWithMAPIDictionary:](v11, "initWithMAPIDictionary:", v10, (_QWORD)v15);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v13 = (void *)objc_msgSend(v4, "copy");
  else
    v13 = 0;

  return v13;
}

- (id)_filteredStoreContentSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (-[WLKOfferListing _prefersSD](self, "_prefersSD"))
  {
    -[WLKOfferListing _standardDefinitionPredicate](self, "_standardDefinitionPredicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_6;
  }
  -[WLKOfferListing _highDefinitionPredicate](self, "_highDefinitionPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
  {
    -[WLKOfferListing _standardDefinitionPredicate](self, "_standardDefinitionPredicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_standardDefinitionPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dictionary.variant = 'SD'"));
}

- (id)_highDefinitionPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dictionary.variant = 'HD'"));
}

- (BOOL)_prefersSD
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.videos-preferences"));
  objc_msgSend(v2, "objectForKey:", CFSTR("PreferredPurchaseResolution"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "integerValue") == 1;
  }
  else
  {
    NSLog(CFSTR("[WLKOfferListing] No video quality preference applied"));
    v4 = 0;
  }

  return v4;
}

- (id)_bestStoreOfferForOfferType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("offerType = %d"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKOfferListing storeOffers](self, "storeOffers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WLKOfferListing _filteredStoreContentSource:](self, "_filteredStoreContentSource:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)storeOffers
{
  return self->_storeOffers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeOffers, 0);
}

@end
