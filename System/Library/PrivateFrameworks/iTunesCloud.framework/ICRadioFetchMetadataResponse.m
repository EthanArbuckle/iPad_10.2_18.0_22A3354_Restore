@implementation ICRadioFetchMetadataResponse

- (NSArray)allStorePlatformMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  ICStorePlatformMetadata *v13;
  void *v14;
  ICStorePlatformMetadata *v15;
  NSArray *v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[ICRadioResponse contentDictionary](self, "contentDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("results"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v19 = v3;
    -[ICRadioResponse expirationDate](self, "expirationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v4;
    objc_msgSend(v4, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v13 = [ICStorePlatformMetadata alloc];
            -[ICRadioFetchMetadataResponse _storePlatformMetadataDictionaryFromRadioMetadataDictionary:](self, "_storePlatformMetadataDictionaryFromRadioMetadataDictionary:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[ICStorePlatformMetadata initWithMetadataDictionary:expirationDate:](v13, "initWithMetadataDictionary:expirationDate:", v14, v5);

            if (v15)
            {
              if (!v9)
                v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v9, "addObject:", v15);
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v4 = v18;
    v3 = v19;
  }
  else
  {
    v9 = 0;
  }
  v16 = (NSArray *)v9;

  return v16;
}

- (id)storePlatformMetadataForStoreAdamID:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__13143;
  v14 = __Block_byref_object_dispose__13144;
  v15 = 0;
  -[ICRadioResponse contentDictionary](self, "contentDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("results"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__ICRadioFetchMetadataResponse_storePlatformMetadataForStoreAdamID___block_invoke;
    v9[3] = &unk_1E438C1A0;
    v9[5] = &v10;
    v9[6] = a3;
    v9[4] = self;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  }
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)_storePlatformMetadataDictionaryFromRadioMetadataDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("album-id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("collectionId"));
  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v6 = v5;
  else
    v6 = v3;
  v7 = v6;

  return v7;
}

void __68__ICRadioFetchMetadataResponse_storePlatformMetadataForStoreAdamID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  ICStorePlatformMetadata *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && _NSIsNSDictionary()
    && objc_msgSend(v14, "storeAdamID") == *(_QWORD *)(a1 + 48))
  {
    v8 = [ICStorePlatformMetadata alloc];
    objc_msgSend(*(id *)(a1 + 32), "_storePlatformMetadataDictionaryFromRadioMetadataDictionary:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "expirationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICStorePlatformMetadata initWithMetadataDictionary:expirationDate:](v8, "initWithMetadataDictionary:expirationDate:", v9, v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a4 = 1;
  }

}

@end
