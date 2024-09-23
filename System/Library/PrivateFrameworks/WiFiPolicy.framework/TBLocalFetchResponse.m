@implementation TBLocalFetchResponse

+ (id)responseWithResultsByBSSID:(id)a3
{
  id v3;
  TBLocalFetchResponse *v4;

  v3 = a3;
  v4 = -[TBLocalFetchResponse initWithResultsByBSSID:]([TBLocalFetchResponse alloc], "initWithResultsByBSSID:", v3);

  return v4;
}

- (TBLocalFetchResponse)initWithResultsByBSSID:(id)a3
{
  id v5;
  TBLocalFetchResponse *v6;
  TBLocalFetchResponse *v7;
  uint64_t v8;
  NSArray *results;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TBLocalFetchResponse;
  v6 = -[TBLocalFetchResponse init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resultsByBSSID, a3);
    objc_msgSend(v5, "allValues");
    v8 = objc_claimAutoreleasedReturnValue();
    results = v7->_results;
    v7->_results = (NSArray *)v8;

  }
  return v7;
}

- (NSError)error
{
  return self->error;
}

- (NSArray)results
{
  return self->_results;
}

- (NSDictionary)resultsByBSSID
{
  return self->_resultsByBSSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsByBSSID, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->error, 0);
}

+ (id)responseWithResults:(id)a3 entityDescription:(id)a4
{
  id v5;
  id v6;
  TBLocalFetchResponse *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TBLocalFetchResponse initWithResults:entityDescription:]([TBLocalFetchResponse alloc], "initWithResults:entityDescription:", v6, v5);

  return v7;
}

- (TBLocalFetchResponse)initWithResults:(id)a3 entityDescription:(id)a4
{
  id v6;
  id v7;
  TBLocalFetchResponse *v8;
  TBLocalFetchResponse *v9;
  void *v10;
  void *v11;
  int v12;
  NSDictionary *v13;
  NSArray *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *results;
  NSArray *tiles;
  NSDictionary *resultsByBSSID;
  void *v27;
  void *v28;
  int v29;
  NSArray *v30;
  void *v31;
  void *v32;
  int v33;
  NSSet *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  TBLocalFetchTileItem *v40;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)TBLocalFetchResponse;
  v8 = -[TBLocalFetchResponse init](&v51, sel_init);
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBAccessPointMO entityName](TBAccessPointMO, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v42 = v6;
      v15 = v6;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v48 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v20, "network");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v14, "addObject:", v21);

            objc_msgSend(v20, "network");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "BSSID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKey:](v13, "setObject:forKey:", v22, v23);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        }
        while (v17);
      }

      results = v9->_results;
      v9->_results = v14;
      tiles = v14;

      resultsByBSSID = v9->_resultsByBSSID;
      v9->_resultsByBSSID = v13;

      v6 = v42;
      goto LABEL_23;
    }
    objc_msgSend(v7, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBNetworkMO entityName](TBNetworkMO, "entityName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqualToString:", v28);

    if (v29)
    {
      v30 = (NSArray *)v6;
      tiles = v9->_results;
      v9->_results = v30;
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(v7, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBTileMO entityName](TBTileMO, "entityName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqualToString:", v32);

    if (v33)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v34 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v35 = v6;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v44 != v38)
              objc_enumerationMutation(v35);
            v40 = -[TBLocalFetchTileItem initWithTile:error:]([TBLocalFetchTileItem alloc], "initWithTile:error:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j), 0);
            -[NSSet addObject:](v34, "addObject:", v40);

          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        }
        while (v37);
      }

      tiles = (NSArray *)v9->_tiles;
      v9->_tiles = v34;
      goto LABEL_23;
    }
  }
LABEL_24:

  return v9;
}

- (NSSet)tiles
{
  return self->_tiles;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void)setResultsByBSSID:(id)a3
{
  objc_storeStrong((id *)&self->_resultsByBSSID, a3);
}

@end
