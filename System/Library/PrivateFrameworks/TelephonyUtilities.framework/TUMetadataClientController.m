@implementation TUMetadataClientController

- (void)updateMetadataForRecentCalls:(id)a3
{
  -[TUMetadataClientController updateMetadataForRecentCalls:completion:](self, "updateMetadataForRecentCalls:completion:", a3, 0);
}

- (TUMetadataCache)metadataCache
{
  return self->_metadataCache;
}

+ (TUMetadataClientController)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__TUMetadataClientController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (TUMetadataClientController *)(id)sharedInstance_sharedInstance_1;
}

void __44__TUMetadataClientController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v1;

}

- (TUMetadataClientController)init
{
  TUMetadataClientController *v2;
  void *v3;
  TUCallDirectoryMetadataCacheDataProvider *v4;
  TUSuggestionsMetadataCacheDataProvider *v5;
  TUGeoLocationMetadataCacheDataProvider *v6;
  void *v7;
  TUMetadataCache *v8;
  void *v9;
  uint64_t v10;
  TUMetadataCache *metadataCache;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TUMetadataClientController;
  v2 = -[TUMetadataClientController init](&v13, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    v4 = objc_alloc_init(TUCallDirectoryMetadataCacheDataProvider);
    v5 = objc_alloc_init(TUSuggestionsMetadataCacheDataProvider);
    v6 = objc_alloc_init(TUGeoLocationMetadataCacheDataProvider);
    objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [TUMetadataCache alloc];
    v9 = (void *)objc_msgSend(v7, "copy");
    v10 = -[TUMetadataCache initWithDataProviders:](v8, "initWithDataProviders:", v9);
    metadataCache = v2->_metadataCache;
    v2->_metadataCache = (TUMetadataCache *)v10;

  }
  return v2;
}

- (id)suggestionForDestinationID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TUMetadataClientController metadataCache](self, "metadataCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadataForDestinationID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "metadataForProvider:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)locationForDestinationID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TUMetadataClientController metadataCache](self, "metadataCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadataForDestinationID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "metadataForProvider:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)directoryLabelForDestinationID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TUMetadataClientController metadataCache](self, "metadataCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadataForDestinationID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "metadataForProvider:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)suggestionForSearchItem:(id)a3
{
  void *v4;
  void *v5;

  -[TUMetadataClientController _metadataDestinationIdForSearchItem:](self, "_metadataDestinationIdForSearchItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TUMetadataClientController suggestionForDestinationID:](self, "suggestionForDestinationID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)locationForSearchItem:(id)a3
{
  void *v4;
  void *v5;

  -[TUMetadataClientController _metadataDestinationIdForSearchItem:](self, "_metadataDestinationIdForSearchItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TUMetadataClientController locationForDestinationID:](self, "locationForDestinationID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)directoryLabelForSearchItem:(id)a3
{
  void *v4;
  void *v5;

  -[TUMetadataClientController _metadataDestinationIdForSearchItem:](self, "_metadataDestinationIdForSearchItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TUMetadataClientController directoryLabelForDestinationID:](self, "directoryLabelForDestinationID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_metadataDestinationIdForSearchItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  TUMetadataDestinationID *v6;
  uint64_t v7;
  TUMetadataDestinationID *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "recentCall");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCall:](TUMetadataDestinationID, "metadataDestinationIDsForCHRecentCall:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (TUMetadataDestinationID *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v8 = v6;
    goto LABEL_14;
  }
  objc_msgSend(v3, "destinationId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    if (objc_msgSend(v4, "destinationIdIsEmailAddress"))
    {
      +[TUHandle normalizedEmailAddressHandleForValue:](TUHandle, "normalizedEmailAddressHandleForValue:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v4, "destinationIdIsPhoneNumber"))
      {
        objc_msgSend(v3, "isoCountryCode");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:](TUHandle, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v4, v9);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
LABEL_12:
          v6 = -[TUMetadataDestinationID initWithHandle:]([TUMetadataDestinationID alloc], "initWithHandle:", v5);
          goto LABEL_13;
        }
LABEL_9:
        v8 = 0;
LABEL_14:

        goto LABEL_15;
      }
      +[TUHandle normalizedGenericHandleForValue:](TUHandle, "normalizedGenericHandleForValue:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v7;
    if (v7)
      goto LABEL_12;
    goto LABEL_9;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (void)updateMetadataForCall:(id)a3
{
  -[TUMetadataClientController updateMetadataForCall:completion:](self, "updateMetadataForCall:completion:", a3, 0);
}

- (void)updateMetadataForCall:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  +[TUMetadataDestinationID metadataDestinationIDForCall:](TUMetadataDestinationID, "metadataDestinationIDForCall:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[TUMetadataClientController updateMetadataForDestinationID:completion:](self, "updateMetadataForDestinationID:completion:", v6, v7);

}

- (void)updateMetadataForRecentCalls:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCalls:](TUMetadataDestinationID, "metadataDestinationIDsForCHRecentCalls:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[TUMetadataClientController metadataCache](self, "metadataCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateCacheWithDestinationIDs:completion:", v6, v8);

  }
}

- (void)updateMetadataForDestinationID:(id)a3
{
  -[TUMetadataClientController updateMetadataForDestinationID:completion:](self, "updateMetadataForDestinationID:completion:", a3, 0);
}

- (void)updateMetadataForDestinationID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[TUMetadataClientController metadataCache](self, "metadataCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "updateCacheForEmptyDataProvidersWithDestinationIDs:completion:", v9, v6);
}

- (void)setMetadataCache:(id)a3
{
  objc_storeStrong((id *)&self->_metadataCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataCache, 0);
}

@end
