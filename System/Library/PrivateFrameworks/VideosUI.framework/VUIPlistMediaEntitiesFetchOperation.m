@implementation VUIPlistMediaEntitiesFetchOperation

- (VUIPlistMediaEntitiesFetchOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIPlistMediaEntitiesFetchOperation)initWithMediaLibrary:(id)a3 requests:(id)a4
{
  id v7;
  id v8;
  void *v9;
  VUIPlistMediaEntitiesFetchOperation *v10;
  uint64_t v11;
  NSArray *requests;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaLibrary"));
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("requests"));
LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)VUIPlistMediaEntitiesFetchOperation;
  v10 = -[VUIPlistMediaEntitiesFetchOperation init](&v14, sel_init);
  if (v10)
  {
    objc_msgSend(v9, "vui_deepCopy");
    v11 = objc_claimAutoreleasedReturnValue();
    requests = v10->_requests;
    v10->_requests = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_mediaLibrary, a3);
  }

  return v10;
}

- (void)executionDidBegin
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  void *v18;
  id obj;
  VUIPlistMediaEntitiesFetchOperation *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self;
  -[VUIPlistMediaEntitiesFetchOperation requests](self, "requests");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v24;
    while (2)
    {
      v8 = 0;
      v9 = v6;
      do
      {
        v10 = v3;
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        objc_msgSend(v11, "mediaEntityTypes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "subtype");

        if (v15 == 1)
        {
          v21 = v9;
          v16 = &v21;
          -[VUIPlistMediaEntitiesFetchOperation _collectionsFetchResponseWithRequest:error:](v20, "_collectionsFetchResponseWithRequest:error:", v11, &v21);
          v17 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v15)
          {
            v6 = v9;
            v3 = v10;
LABEL_16:

            v3 = 0;
            goto LABEL_17;
          }
          v22 = v9;
          v16 = &v22;
          -[VUIPlistMediaEntitiesFetchOperation _itemsFetchResponseWithRequest:error:](v20, "_itemsFetchResponseWithRequest:error:", v11, &v22);
          v17 = objc_claimAutoreleasedReturnValue();
        }
        v18 = (void *)v17;
        v6 = *v16;

        v3 = v10;
        if (!v18)
          goto LABEL_16;
        objc_msgSend(v10, "addObject:", v18);

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_17:

  -[VUIPlistMediaEntitiesFetchOperation setResponses:](v20, "setResponses:", v3);
  -[VUIPlistMediaEntitiesFetchOperation setError:](v20, "setError:", v6);
  -[VUIAsynchronousOperation finishExecutionIfPossible](v20, "finishExecutionIfPossible");

}

- (id)_mediaEntityKindForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "_isItemsFetch"))
  {
    VUIPlistMediaItemKind();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "_isShowsFetch"))
  {
    VUIPlistShowMediaKind();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "_isSeasonsFetch"))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to determine the VUIMediaEntityKind to use for this request: %@"), v3);
      v5 = 0;
      goto LABEL_8;
    }
    VUIPlistSeasonMediaKind();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_8:

  return v5;
}

- (id)_itemsFetchResponseWithRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  VUIPlistMediaItem *v24;
  void *v25;
  void *v27;
  VUIPlistMediaEntitiesFetchOperation *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = self;
  -[VUIPlistMediaEntitiesFetchOperation mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaEntityTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();

  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)v10;
  if ((void *)v10 == v11)
  {
    objc_msgSend(v7, "movies");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((void *)v10 == v12)
    {
      objc_msgSend(v7, "movieRentals");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((void *)v10 == v13)
      {
        objc_msgSend(v7, "homeVideos");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((void *)v10 != v14)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpected media entity type!"));
          v15 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v7, "episodes");
        v16 = objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v15 = (void *)v16;
LABEL_11:
  v29 = v7;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = v15;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v24 = -[VUIPlistMediaItem initWithMediaLibrary:databaseItem:requestedProperties:]([VUIPlistMediaItem alloc], "initWithMediaLibrary:databaseItem:requestedProperties:", v6, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v23), v18);
        objc_msgSend(v17, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v21);
  }

  -[VUIPlistMediaEntitiesFetchOperation _fetchResponseWithMediaEntities:request:](v28, "_fetchResponseWithMediaEntities:request:", v17, v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_collectionsFetchResponseWithRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  VUIPlistShowMediaCollection *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  VUIPlistSeasonMediaCollection *v25;
  void *v26;
  void *v27;
  void *v29;
  VUIPlistMediaEntitiesFetchOperation *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[VUIPlistMediaEntitiesFetchOperation mediaLibrary](self, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "mediaEntityTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIMediaEntityType show](VUIMediaEntityType, "show");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v13)
  {
    v29 = v12;
    v30 = self;
    v31 = v7;
    objc_msgSend(v7, "shows");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          v20 = -[VUIPlistShowMediaCollection initWithMediaLibrary:databaseShow:requestedProperties:]([VUIPlistShowMediaCollection alloc], "initWithMediaLibrary:databaseShow:requestedProperties:", v6, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), v8);
          objc_msgSend(v9, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v17);
    }
    goto LABEL_19;
  }
  +[VUIMediaEntityType season](VUIMediaEntityType, "season");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v14)
  {
    v29 = v12;
    v30 = self;
    v31 = v7;
    objc_msgSend(v7, "seasons");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v21 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v15);
          v25 = -[VUIPlistSeasonMediaCollection initWithMediaLibrary:databaseSeason:requestedProperties:]([VUIPlistSeasonMediaCollection alloc], "initWithMediaLibrary:databaseSeason:requestedProperties:", v6, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j), v8);
          objc_msgSend(v9, "addObject:", v25);

        }
        v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v22);
    }
LABEL_19:

    self = v30;
    v7 = v31;
    v12 = v29;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpected media entity type!"));
LABEL_20:
  v26 = (void *)objc_msgSend(v9, "copy");
  -[VUIPlistMediaEntitiesFetchOperation _fetchResponseWithMediaEntities:request:](self, "_fetchResponseWithMediaEntities:request:", v26, v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_fetchResponseWithMediaEntities:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  VUIMediaEntityFetchResponse *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "predicate");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v9;
  v11 = v9;
  if (v8)
  {
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v33 = v10;
  -[VUIPlistMediaEntitiesFetchOperation _mediaEntityKindForRequest:](self, "_mediaEntityKindForRequest:", v7);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_manualSortDescriptorsWithMediaEntityKind:propertiesRequiredForSort:", v12, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v11;
  v15 = v14;
  v16 = v14;
  if (v13)
  {
    objc_msgSend(v14, "sortedArrayUsingDescriptors:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v29 = (void *)v13;
  objc_msgSend(v7, "_sortIndexPropertyKeyWithMediaEntityKind:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    +[VUIMediaLibraryUtilities sortIndexesForMediaEntities:sortIndexPropertyKey:](VUIMediaLibraryUtilities, "sortIndexesForMediaEntities:sortIndexPropertyKey:", v16, v17);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  v30 = v15;
  v31 = (void *)v12;
  objc_msgSend(v7, "groupingKeyPath", v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v8;
  if (!v18)
  {
    v20 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "groupingSortComparator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaLibraryUtilities groupingForMediaEntities:groupingKeyPath:groupingSortComparator:performDefaultSort:sortIndexPropertyKey:](VUIMediaLibraryUtilities, "groupingForMediaEntities:groupingKeyPath:groupingSortComparator:performDefaultSort:sortIndexPropertyKey:", v16, v18, v19, 1, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "_shouldGenerateGroupingSortIndexes"))
  {
LABEL_12:
    v21 = 0;
    goto LABEL_13;
  }
  +[VUIMediaLibraryUtilities sortIndexesForGrouping:](VUIMediaLibraryUtilities, "sortIndexesForGrouping:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v22 = objc_alloc_init(VUIMediaEntityFetchResponse);
  objc_msgSend(v7, "mediaEntityTypes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchResponse setMediaEntitySubtype:](v22, "setMediaEntitySubtype:", objc_msgSend(v25, "subtype"));

  -[VUIMediaEntityFetchResponse setMediaEntities:](v22, "setMediaEntities:", v16);
  -[VUIMediaEntityFetchResponse setSortIndexes:](v22, "setSortIndexes:", v28);
  -[VUIMediaEntityFetchResponse setGrouping:](v22, "setGrouping:", v20);
  -[VUIMediaEntityFetchResponse setGroupingSortIndexes:](v22, "setGroupingSortIndexes:", v21);

  return v22;
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
  objc_storeStrong((id *)&self->_responses, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (VUIPlistMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
