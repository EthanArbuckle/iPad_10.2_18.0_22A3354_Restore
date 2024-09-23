@implementation IMContentLookupService

- (IMContentLookupService)initWithIds:(id)a3
{
  id v4;
  IMContentLookupService *v5;
  IMContentLookupService *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMContentLookupService;
  v5 = -[IMContentLookupService init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IMContentLookupService setIds:](v5, "setIds:", v4);
    v7 = objc_alloc(MEMORY[0x1E0CFDAF8]);
    +[IMURLBag sharedInstance](IMURLBag, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFDBD0], "currentProcess");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithBag:caller:keyProfile:", v8, v10, v6->_profile);
    -[IMContentLookupService setAmsLookup:](v6, "setAmsLookup:", v11);

    -[IMContentLookupService setVersion:](v6, "setVersion:", 1);
  }

  return v6;
}

- (IMContentLookupService)init
{
  return -[IMContentLookupService initWithIds:](self, "initWithIds:", 0);
}

- (void)request:(id)a3
{
  id v4;
  void *v5;
  AMSLookup *amsLookup;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[IMContentLookupService _configureRequest](self, "_configureRequest");
  -[IMContentLookupService ids](self, "ids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    amsLookup = self->_amsLookup;
    -[IMContentLookupService ids](self, "ids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSLookup performLookupWithBundleIdentifiers:itemIdentifiers:](amsLookup, "performLookupWithBundleIdentifiers:itemIdentifiers:", 0, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __34__IMContentLookupService_request___block_invoke;
    v9[3] = &unk_1E54D0ED0;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v8, "addFinishBlock:", v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, MEMORY[0x1E0C9AA70]);
  }

}

void __34__IMContentLookupService_request___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "ids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "allItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "itemDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v12, "iTunesStoreIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "setObject:forKey:", v13, v15);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_configureRequest
{
  -[AMSLookup setKeyProfile:](self->_amsLookup, "setKeyProfile:", self->_profile);
  -[AMSLookup setImageProfile:](self->_amsLookup, "setImageProfile:", self->_artworkType);
  -[AMSLookup setVersion:](self->_amsLookup, "setVersion:", -[IMContentLookupService version](self, "version"));
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (NSString)artworkType
{
  return self->_artworkType;
}

- (void)setArtworkType:(id)a3
{
  objc_storeStrong((id *)&self->_artworkType, a3);
}

- (NSArray)ids
{
  return self->_ids;
}

- (void)setIds:(id)a3
{
  objc_storeStrong((id *)&self->_ids, a3);
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (AMSLookup)amsLookup
{
  return self->_amsLookup;
}

- (void)setAmsLookup:(id)a3
{
  objc_storeStrong((id *)&self->_amsLookup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsLookup, 0);
  objc_storeStrong((id *)&self->_ids, 0);
  objc_storeStrong((id *)&self->_artworkType, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
