@implementation VUIMPMediaEntitiesSingleFetchOperation

- (void)_populatePrefetchProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[VUIMPMediaEntitiesSingleFetchOperation prefetchProperties](self, "prefetchProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesSingleFetchOperation mediaEntityKind](self, "mediaEntityKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "propertyDescriptorForName:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "retrievesSourcePropertiesAtFetch"))
          objc_msgSend(v3, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)_collectionsFetchResponseWithMediaQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  VUIMPMediaEntitiesSingleFetchOperation *v21;
  void *v22;
  void *v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIMPMediaEntitiesSingleFetchOperation mediaLibrary](self, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VUIMediaEntityType mediaCollectionType](self->_currentFetchMediaEntityType, "mediaCollectionType");
  v21 = self;
  if (v7 == 1 || v7 == 2)
  {
    v8 = (objc_class *)objc_opt_class();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpected media collection type!"));
    v8 = 0;
  }
  v22 = v6;
  objc_msgSend(v6, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "collections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  objc_msgSend(v4, "collectionSections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15);
        v17 = (void *)objc_msgSend([v8 alloc], "initWithMediaLibrary:mediaItemCollection:requestedProperties:", v5, v16, v9);
        if (v17)
        {
          objc_msgSend(v25, "addObject:", v17);
        }
        else
        {
          VUIDefaultLogObject();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v16;
            _os_log_error_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_ERROR, "Unable to create VUIMediaCollection for MPMediaItemCollection: %@", buf, 0xCu);
          }

          v11 = 0;
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v13);
  }

  -[VUIMPMediaEntitiesSingleFetchOperation _fetchResponseWithMediaEntities:mediaQuerySections:](v21, "_fetchResponseWithMediaEntities:mediaQuerySections:", v25, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)setResponse:(id)a3
{
  id v4;
  VUIMediaEntityFetchResponse *v5;
  VUIMediaEntityFetchResponse *response;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_response)
  {
    -[VUIMPMediaEntitiesSingleFetchOperation _coalesceResponses:](self, "_coalesceResponses:", v4);
    v5 = (VUIMediaEntityFetchResponse *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (VUIMediaEntityFetchResponse *)v4;
  }
  response = self->_response;
  self->_response = v5;

}

- (void)setProcessRangeAfterFetch:(BOOL)a3
{
  self->_processRangeAfterFetch = a3;
}

- (void)setPostFetchSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_postFetchSortDescriptors, a3);
}

- (void)setMediaQuerySortOrderingProperties:(id)a3
{
  objc_storeStrong((id *)&self->_mediaQuerySortOrderingProperties, a3);
}

- (void)setMediaQuerySortOrderingDirectionMappings:(id)a3
{
  objc_storeStrong((id *)&self->_mediaQuerySortOrderingDirectionMappings, a3);
}

- (void)setMediaQueryPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_mediaQueryPredicate, a3);
}

- (void)setMediaEntityKind:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEntityKind, a3);
}

- (VUIMediaEntityFetchResponse)response
{
  return self->_response;
}

- (VUIMediaEntityFetchRequest)request
{
  return self->_request;
}

- (BOOL)processRangeAfterFetch
{
  return self->_processRangeAfterFetch;
}

- (BOOL)processPredicateAfterFetch
{
  return self->_processPredicateAfterFetch;
}

- (NSMutableSet)prefetchProperties
{
  return self->_prefetchProperties;
}

- (NSArray)postFetchSortDescriptors
{
  return self->_postFetchSortDescriptors;
}

- (NSArray)mediaQuerySortOrderingProperties
{
  return self->_mediaQuerySortOrderingProperties;
}

- (NSDictionary)mediaQuerySortOrderingDirectionMappings
{
  return self->_mediaQuerySortOrderingDirectionMappings;
}

- (MPMediaPredicate)mediaQueryPredicate
{
  return self->_mediaQueryPredicate;
}

- (VUIMPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (VUIMediaEntityKind)mediaEntityKind
{
  return self->_mediaEntityKind;
}

- (VUIMPMediaEntitiesSingleFetchOperation)initWithMediaLibrary:(id)a3 request:(id)a4
{
  id v7;
  id v8;
  void *v9;
  VUIMPMediaEntitiesSingleFetchOperation *v10;
  VUIMPMediaEntitiesSingleFetchOperation *v11;
  NSMutableSet *v12;
  NSMutableSet *prefetchProperties;
  objc_super v15;

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
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("request"));
LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)VUIMPMediaEntitiesSingleFetchOperation;
  v10 = -[VUIMPMediaEntitiesSingleFetchOperation init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_request, a4);
    objc_storeStrong((id *)&v11->_mediaLibrary, a3);
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    prefetchProperties = v11->_prefetchProperties;
    v11->_prefetchProperties = v12;

  }
  return v11;
}

- (void)executionDidBegin
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  VUIMediaEntityFetchResponse *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "options");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v15, "vui_BOOLForKey:defaultValue:", CFSTR("CheckHasItems"), 0);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaEntityTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_storeStrong((id *)&self->_currentFetchMediaEntityType, *(id *)(*((_QWORD *)&v17 + 1) + 8 * v9));
        -[VUIMPMediaEntitiesSingleFetchOperation _mediaEntityKind](self, "_mediaEntityKind");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMPMediaEntitiesSingleFetchOperation setMediaEntityKind:](self, "setMediaEntityKind:", v10);
        -[VUIMPMediaEntitiesSingleFetchOperation _populatePrefetchProperties](self, "_populatePrefetchProperties");
        -[VUIMPMediaEntitiesSingleFetchOperation _processRange](self, "_processRange");
        -[VUIMPMediaEntitiesSingleFetchOperation _processSortDescriptors](self, "_processSortDescriptors");
        -[VUIMPMediaEntitiesSingleFetchOperation _processPredicate](self, "_processPredicate");
        -[VUIMPMediaEntitiesSingleFetchOperation _mediaQuery](self, "_mediaQuery");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[VUIMediaEntityType subtype](self->_currentFetchMediaEntityType, "subtype"))
        {
          if (v3)
          {
            v12 = objc_alloc_init(VUIMediaEntityFetchResponse);
            v13 = objc_msgSend(v11, "_hasCollections");
LABEL_11:
            -[VUIMediaEntityFetchResponse setHasDataForCheckHasItemsOption:](v12, "setHasDataForCheckHasItemsOption:", v13);
            goto LABEL_15;
          }
          -[VUIMPMediaEntitiesSingleFetchOperation _collectionsFetchResponseWithMediaQuery:](self, "_collectionsFetchResponseWithMediaQuery:", v11);
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v3)
          {
            v12 = objc_alloc_init(VUIMediaEntityFetchResponse);
            v13 = objc_msgSend(v11, "_hasItems");
            goto LABEL_11;
          }
          -[VUIMPMediaEntitiesSingleFetchOperation _itemsFetchResponseWithMediaQuery:](self, "_itemsFetchResponseWithMediaQuery:", v11);
          v14 = objc_claimAutoreleasedReturnValue();
        }
        v12 = (VUIMediaEntityFetchResponse *)v14;
LABEL_15:
        -[VUIMPMediaEntitiesSingleFetchOperation setResponse:](self, "setResponse:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)_shouldSortUsingMediaQuery
{
  void *v3;
  void *v4;
  VUIMediaEntityType *currentFetchMediaEntityType;
  VUIMediaEntityType *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  currentFetchMediaEntityType = self->_currentFetchMediaEntityType;
  +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
  v6 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();
  if (currentFetchMediaEntityType == v6)
  {
    v9 = 1;
  }
  else if (v4)
  {
    -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaEntityTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (unint64_t)objc_msgSend(v8, "count") >= 2 && (unint64_t)objc_msgSend(v4, "count") > 1;

  }
  else
  {
    v9 = 0;
  }

  return !v9;
}

- (void)_processSortDescriptors
{
  VUIMPMediaEntitiesSingleFetchOperation *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  VUIMPMediaEntitiesSingleFetchOperation *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id obj;
  void *v30;
  _BOOL4 v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v2 = self;
  v43 = *MEMORY[0x1E0C80C00];
  -[VUIMPMediaEntitiesSingleFetchOperation mediaEntityKind](self, "mediaEntityKind");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesSingleFetchOperation request](v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v31 = -[VUIMPMediaEntitiesSingleFetchOperation _shouldSortUsingMediaQuery](v2, "_shouldSortUsingMediaQuery");
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      v27 = v3;
      v28 = *MEMORY[0x1E0C99778];
      v25 = v2;
      v26 = v4;
      v30 = v5;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v11, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "propertyDescriptorForName:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v28, CFSTR("Unknown key for sort descriptor! %@"), v12);
          objc_msgSend(v13, "sourcePropertyNames");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (!v31 || (unint64_t)objc_msgSend(v14, "count") >= 2)
          {

            -[VUIMPMediaEntitiesSingleFetchOperation mediaEntityKind](v25, "mediaEntityKind");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 0;
            v3 = v27;
            objc_msgSend(v27, "_manualSortDescriptorsWithMediaEntityKind:propertiesRequiredForSort:", v21, &v33);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v33;

            -[VUIMPMediaEntitiesSingleFetchOperation prefetchProperties](v25, "prefetchProperties");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "unionSet:", v23);

            -[VUIMPMediaEntitiesSingleFetchOperation setPostFetchSortDescriptors:](v25, "setPostFetchSortDescriptors:", v22);
            -[VUIMPMediaEntitiesSingleFetchOperation setProcessRangeAfterFetch:](v25, "setProcessRangeAfterFetch:", 1);

            v4 = v26;
            v5 = v30;
            goto LABEL_20;
          }
          objc_msgSend(v15, "allObjects");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "addObject:", v17);
          if (objc_msgSend(v11, "ascending"))
            v18 = 1;
          else
            v18 = 2;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v19, v17);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        v4 = v26;
        v3 = v27;
        v2 = v25;
        v5 = v30;
        if (v8)
          continue;
        break;
      }
    }

    VUIDefaultLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v39 = v5;
      v40 = 2112;
      v41 = v6;
      _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "Sorting will be performed by MPMediaLibrary using %@ (%@)", buf, 0x16u);
    }

    -[VUIMPMediaEntitiesSingleFetchOperation setMediaQuerySortOrderingProperties:](v2, "setMediaQuerySortOrderingProperties:", v5);
    -[VUIMPMediaEntitiesSingleFetchOperation setMediaQuerySortOrderingDirectionMappings:](v2, "setMediaQuerySortOrderingDirectionMappings:", v6);
LABEL_20:

  }
}

- (void)_processRange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "range");
  v5 = v4;

  if (v5)
    -[VUIMPMediaEntitiesSingleFetchOperation setProcessRangeAfterFetch:](self, "setProcessRangeAfterFetch:", 1);
}

- (void)_processPredicate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  -[VUIMPMediaEntitiesSingleFetchOperation _mediaQueryPredicateForPredicate:](self, "_mediaQueryPredicateForPredicate:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "vui_keyPathsInPredicate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMPMediaEntitiesSingleFetchOperation prefetchProperties](self, "prefetchProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v6);

    -[VUIMPMediaEntitiesSingleFetchOperation setProcessPredicateAfterFetch:](self, "setProcessPredicateAfterFetch:", 1);
LABEL_4:
    v5 = 0;
  }
  v8 = (id)v5;
  -[VUIMPMediaEntitiesSingleFetchOperation setMediaQueryPredicate:](self, "setMediaQueryPredicate:", v5);

}

- (id)_processFetchedMediaEntities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (-[VUIMPMediaEntitiesSingleFetchOperation processPredicateAfterFetch](self, "processPredicateAfterFetch"))
    {
      -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "filteredArrayUsingPredicate:", v6);
        v7 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v7;
      }

    }
    -[VUIMPMediaEntitiesSingleFetchOperation postFetchSortDescriptors](self, "postFetchSortDescriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      VUIDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Sorting media entities returned from MPMediaQuery", buf, 2u);
      }

      objc_msgSend(v4, "sortedArrayUsingDescriptors:", v8);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v10;
    }
    if (-[VUIMPMediaEntitiesSingleFetchOperation processRangeAfterFetch](self, "processRangeAfterFetch"))
    {
      VUIDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "Processing range on media entities returned from MPMediaQuery", v17, 2u);
      }

      -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "range");
      -[VUIMPMediaEntitiesSingleFetchOperation _mediaEntities:subarrayWithRange:](self, "_mediaEntities:subarrayWithRange:", v4, v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v15;
    }

  }
  return v4;
}

- (id)_mediaQuery
{
  void *v3;

  -[VUIMPMediaEntitiesSingleFetchOperation _baseMediaQuery](self, "_baseMediaQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VUIMPMediaEntitiesSingleFetchOperation _addEntityLimitToMediaQuery:](self, "_addEntityLimitToMediaQuery:", v3);
    -[VUIMPMediaEntitiesSingleFetchOperation _addPredicateToMediaQuery:](self, "_addPredicateToMediaQuery:", v3);
    -[VUIMPMediaEntitiesSingleFetchOperation _addSortingPropertiesToMediaQuery:](self, "_addSortingPropertiesToMediaQuery:", v3);
    -[VUIMPMediaEntitiesSingleFetchOperation _addPrefetchPropertiesToMediaQuery:](self, "_addPrefetchPropertiesToMediaQuery:", v3);
  }
  return v3;
}

- (id)_mediaQueryPropertyPredicateForComparisonPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "leftExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightExpression");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "expressionType");
  v8 = objc_msgSend(v6, "expressionType");
  if (v7 != 3 || v8)
  {
    if (!objc_msgSend(v5, "vui_isKeyPathBitTestExpression"))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported expressions in comparison predicate: %@"), v4);
      v10 = 0;
      goto LABEL_8;
    }
    -[VUIMPMediaEntitiesSingleFetchOperation _bitTestMediaQueryPropertyPredicateWithKeyPathBitTestExpression:operatorType:constantExpression:](self, "_bitTestMediaQueryPropertyPredicateWithKeyPathBitTestExpression:operatorType:constantExpression:", v5, objc_msgSend(v4, "predicateOperatorType"), v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUIMPMediaEntitiesSingleFetchOperation _keyPathMediaQueryPropertyPredicateWithKeyPathExpression:operatorType:constantExpression:](self, "_keyPathMediaQueryPropertyPredicateWithKeyPathExpression:operatorType:constantExpression:", v5, objc_msgSend(v4, "predicateOperatorType"), v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_8:

  return v10;
}

- (id)_mediaQueryPredicateForPredicate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIMPMediaEntitiesSingleFetchOperation _mediaQueryPredicateForCompoundPredicate:](self, "_mediaQueryPredicateForCompoundPredicate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIMPMediaEntitiesSingleFetchOperation _mediaQueryPropertyPredicateForComparisonPredicate:](self, "_mediaQueryPropertyPredicateForComparisonPredicate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if ((v8 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported predicate: %@"), v4);
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)_mediaQueryPredicateForCompoundPredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "subpredicates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        -[VUIMPMediaEntitiesSingleFetchOperation _mediaQueryPredicateForPredicate:](self, "_mediaQueryPredicateForPredicate:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10));
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {

          goto LABEL_13;
        }
        v12 = (void *)v11;
        objc_msgSend(v5, "vui_addObjectIfNotNil:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }

  v13 = objc_msgSend(v4, "compoundPredicateType");
  if (v13 == 2)
  {
    v14 = (void *)MEMORY[0x1E0CC23C0];
    goto LABEL_15;
  }
  if (v13 == 1)
  {
    v14 = (void *)MEMORY[0x1E0CC23B8];
LABEL_15:
    objc_msgSend(v14, "predicateMatchingPredicates:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported compound predicate: %@"), v4);
LABEL_13:
  v15 = 0;
LABEL_16:

  return v15;
}

- (id)_mediaEntityPropertyDescriptorForFilteringWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIMPMediaEntitiesSingleFetchOperation mediaEntityKind](self, "mediaEntityKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyDescriptorForName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unknown keypath %@ for entity kind %@"), v4, v5);
  if ((objc_msgSend(v6, "sourceSupportsFiltering") & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Filtering is not supported for keypath %@. Predicate cannot be satisfied by the MPMediaLibrary directly", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)_mediaEntityKind
{
  VUIMediaEntityType *currentFetchMediaEntityType;
  VUIMediaEntityType *v4;
  VUIMediaEntityType *v5;
  VUIMediaEntityType *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (-[VUIMediaEntityType subtype](self->_currentFetchMediaEntityType, "subtype"))
  {
    currentFetchMediaEntityType = self->_currentFetchMediaEntityType;
    +[VUIMediaEntityType show](VUIMediaEntityType, "show");
    v4 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

    if (currentFetchMediaEntityType == v4)
    {
      VUIMPShowMediaCollectionKind();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = self->_currentFetchMediaEntityType;
      +[VUIMediaEntityType season](VUIMediaEntityType, "season");
      v6 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

      if (v5 == v6)
      {
        VUIMPSeasonMediaCollectionKind();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99768];
        -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "raise:format:", v8, CFSTR("Unable to determine the VUIMediaEntityKind to use for this request: %@"), v9);

        v10 = 0;
      }
    }
  }
  else
  {
    VUIMPMediaItemKind();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)_mediaEntities:(id)a3 subarrayWithRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  id v8;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v7 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || !length
    || location + length > objc_msgSend(v6, "count")
    || (objc_msgSend(v7, "subarrayWithRange:", location, length), (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = v7;
  }

  return v8;
}

- (id)_keyPathMediaQueryPropertyPredicateWithKeyPathExpression:(id)a3 operatorType:(unint64_t)a4 constantExpression:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a5;
  objc_msgSend(a3, "keyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesSingleFetchOperation _mediaEntityPropertyDescriptorForFilteringWithKeyPath:](self, "_mediaEntityPropertyDescriptorForFilteringWithKeyPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "constantValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sourceFilterValueBlock");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v11);
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
    }
    objc_msgSend(v10, "sourceFilterBlock");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, unint64_t, void *))v15)[2](v15, v16, a4, v11);
    }
    else
    {
      objc_msgSend(v10, "sourcePropertyNames");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CC2430], "vui_mediaPropertyPredicateWithProperty:predicateOperatorType:value:", v16, a4, v11);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_itemsFetchResponseWithMediaQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  VUIMPMediaItem *v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIMPMediaEntitiesSingleFetchOperation mediaLibrary](self, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = v4;
  objc_msgSend(v4, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = -[VUIMPMediaItem initWithMediaLibrary:mediaItem:requestedProperties:]([VUIMPMediaItem alloc], "initWithMediaLibrary:mediaItem:requestedProperties:", v5, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13), v7);
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  objc_msgSend(v18, "itemSections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesSingleFetchOperation _fetchResponseWithMediaEntities:mediaQuerySections:](self, "_fetchResponseWithMediaEntities:mediaQuerySections:", v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)_isSortingBeingPerformedByMediaQuery
{
  void *v2;
  BOOL v3;

  -[VUIMPMediaEntitiesSingleFetchOperation postFetchSortDescriptors](self, "postFetchSortDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)_fetchResponseWithMediaEntities:(id)a3 mediaQuerySections:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  VUIMediaEntityFetchResponse *v17;

  v6 = a4;
  -[VUIMPMediaEntitiesSingleFetchOperation _processFetchedMediaEntities:](self, "_processFetchedMediaEntities:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesSingleFetchOperation mediaEntityKind](self, "mediaEntityKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_sortIndexPropertyKeyWithMediaEntityKind:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_shouldGenerateSortIndexes"))
  {
    if (v6
      && -[VUIMPMediaEntitiesSingleFetchOperation _isSortingBeingPerformedByMediaQuery](self, "_isSortingBeingPerformedByMediaQuery"))
    {
      objc_msgSend((id)objc_opt_class(), "_sortIndexesWithMediaQuerySection:", v6);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v12 = (void *)v11;
      goto LABEL_9;
    }
    if (v10)
    {
      +[VUIMediaLibraryUtilities sortIndexesForMediaEntities:sortIndexPropertyKey:](VUIMediaLibraryUtilities, "sortIndexesForMediaEntities:sortIndexPropertyKey:", v7, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v12 = 0;
LABEL_9:
  objc_msgSend(v8, "groupingKeyPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v15 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v8, "groupingSortComparator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaLibraryUtilities groupingForMediaEntities:groupingKeyPath:groupingSortComparator:performDefaultSort:sortIndexPropertyKey:](VUIMediaLibraryUtilities, "groupingForMediaEntities:groupingKeyPath:groupingSortComparator:performDefaultSort:sortIndexPropertyKey:", v7, v13, v14, 1, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "_shouldGenerateGroupingSortIndexes"))
  {
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  +[VUIMediaLibraryUtilities sortIndexesForGrouping:](VUIMediaLibraryUtilities, "sortIndexesForGrouping:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v17 = objc_alloc_init(VUIMediaEntityFetchResponse);
  -[VUIMediaEntityFetchResponse setMediaEntities:](v17, "setMediaEntities:", v7);
  -[VUIMediaEntityFetchResponse setSortIndexes:](v17, "setSortIndexes:", v12);
  -[VUIMediaEntityFetchResponse setGrouping:](v17, "setGrouping:", v15);
  -[VUIMediaEntityFetchResponse setGroupingSortIndexes:](v17, "setGroupingSortIndexes:", v16);

  return v17;
}

- (id)_bitTestMediaQueryPropertyPredicateWithKeyPathBitTestExpression:(id)a3 operatorType:(unint64_t)a4 constantExpression:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v8 = a3;
  objc_msgSend(a5, "constantValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v9, "unsignedIntegerValue") && (a4 == 5 || a4 == 2))
  {
    objc_msgSend(v8, "arguments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") == 2)
    {
      objc_msgSend(v12, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      if (objc_msgSend(v13, "expressionType") == 3)
      {
        if (objc_msgSend(v14, "expressionType"))
        {
          v10 = 0;
        }
        else
        {
          objc_msgSend(v14, "constantValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "keyPath");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIMPMediaEntitiesSingleFetchOperation _mediaEntityPropertyDescriptorForFilteringWithKeyPath:](self, "_mediaEntityPropertyDescriptorForFilteringWithKeyPath:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "sourcePropertyNames");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "allObjects");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v19, "count") == 1)
            {
              objc_msgSend(v19, "firstObject");
              v21 = v16;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:comparisonType:", v15, v20, 107);
              v10 = (void *)objc_claimAutoreleasedReturnValue();

              v16 = v21;
            }
            else
            {
              v10 = 0;
            }

          }
          else
          {
            v10 = 0;
          }

        }
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_baseMediaQuery
{
  void *v3;
  void *v4;
  VUIMediaEntityType *currentFetchMediaEntityType;
  VUIMediaEntityType *v6;
  VUIMediaEntityType *v7;
  VUIMediaEntityType *v8;
  VUIMediaEntityType *v9;
  VUIMediaEntityType *v10;
  void *v11;
  VUIMediaEntityType *v12;
  VUIMediaEntityType *v13;
  VUIMediaEntityType *v14;
  VUIMediaEntityType *v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;

  -[VUIMPMediaEntitiesSingleFetchOperation mediaLibrary](self, "mediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  currentFetchMediaEntityType = self->_currentFetchMediaEntityType;
  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v6 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

  if (currentFetchMediaEntityType == v6)
  {
    objc_msgSend(MEMORY[0x1E0CC2438], "vui_moviesQueryWithMediaLibrary:", v4);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v7 = self->_currentFetchMediaEntityType;
  +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
  v8 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    objc_msgSend(MEMORY[0x1E0CC2438], "vui_movieRentalsQueryWithMediaLibrary:", v4);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v11 = (void *)v16;
    if (!v16)
      goto LABEL_15;
    goto LABEL_16;
  }
  v9 = self->_currentFetchMediaEntityType;
  +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
  v10 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    objc_msgSend(MEMORY[0x1E0CC2438], "vui_homeVideosQueryWithMediaLibrary:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[VUIMediaEntityType mediaCategoryType](self->_currentFetchMediaEntityType, "mediaCategoryType") != 1)
    {
LABEL_15:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to create MPMediaQuery as the supplied media entity type is not supported: %@"), self->_currentFetchMediaEntityType);
      v11 = 0;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CC2438], "vui_episodesQueryWithMediaLibrary:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VUIMediaEntityType subtype](self->_currentFetchMediaEntityType, "subtype"))
    {
      v12 = self->_currentFetchMediaEntityType;
      +[VUIMediaEntityType season](VUIMediaEntityType, "season");
      v13 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {
        v18 = v11;
        v19 = 9;
      }
      else
      {
        v14 = self->_currentFetchMediaEntityType;
        +[VUIMediaEntityType show](VUIMediaEntityType, "show");
        v15 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

        if (v14 != v15)
        {

          goto LABEL_15;
        }
        v18 = v11;
        v19 = 8;
      }
      objc_msgSend(v18, "setGroupingType:", v19);
      if (v11)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  if (!v11)
    goto LABEL_15;
LABEL_16:
  objc_msgSend(v11, "setIgnoreSystemFilterPredicates:", 1);

  return v11;
}

- (void)_addSortingPropertiesToMediaQuery:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[VUIMPMediaEntitiesSingleFetchOperation _isSortingBeingPerformedByMediaQuery](self, "_isSortingBeingPerformedByMediaQuery");
  v5 = v8;
  if (v4)
  {
    -[VUIMPMediaEntitiesSingleFetchOperation mediaQuerySortOrderingProperties](self, "mediaQuerySortOrderingProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v8, "_setOrderingProperties:", v6);
      -[VUIMPMediaEntitiesSingleFetchOperation mediaQuerySortOrderingDirectionMappings](self, "mediaQuerySortOrderingDirectionMappings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setOrderingDirectionMappings:", v7);

    }
    v5 = v8;
  }

}

- (void)_addPrefetchPropertiesToMediaQuery:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[VUIMPMediaEntitiesSingleFetchOperation mediaEntityKind](self, "mediaEntityKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesSingleFetchOperation prefetchProperties](self, "prefetchProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "propertyDescriptorForName:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sourcePropertyNames");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "unionSet:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  objc_msgSend(v4, "setItemPropertiesToFetch:", v5);

}

- (void)_addPredicateToMediaQuery:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VUIMPMediaEntitiesSingleFetchOperation mediaQueryPredicate](self, "mediaQueryPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "addFilterPredicate:", v4);

}

- (void)_addEntityLimitToMediaQuery:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[VUIMPMediaEntitiesSingleFetchOperation request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[VUIMPMediaEntitiesSingleFetchOperation processRangeAfterFetch](self, "processRangeAfterFetch"))
  {
    objc_msgSend(v4, "range");
    if (v5)
      objc_msgSend(v6, "setEntityLimit:", v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFetchMediaEntityType, 0);
  objc_storeStrong((id *)&self->_postFetchSortDescriptors, 0);
  objc_storeStrong((id *)&self->_mediaQuerySortOrderingDirectionMappings, 0);
  objc_storeStrong((id *)&self->_mediaQuerySortOrderingProperties, 0);
  objc_storeStrong((id *)&self->_mediaQueryPredicate, 0);
  objc_storeStrong((id *)&self->_prefetchProperties, 0);
  objc_storeStrong((id *)&self->_mediaEntityKind, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

+ (id)_sortIndexesWithMediaQuerySection:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  VUIMediaEntitySortIndex *v14;
  void *v15;
  VUIMediaEntitySortIndex *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "range", (_QWORD)v19);
        v13 = v12;
        v14 = [VUIMediaEntitySortIndex alloc];
        objc_msgSend(v10, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[VUIMediaEntitySortIndex initWithTitle:startIndex:count:](v14, "initWithTitle:startIndex:count:", v15, v11, v13);

        objc_msgSend(v4, "addObject:", v16);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_msgSend(v4, "copy");
  return v17;
}

- (VUIMPMediaEntitiesSingleFetchOperation)init
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

- (id)_coalesceResponses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[VUIMPMediaEntitiesSingleFetchOperation _mediaQuery](self, "_mediaQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  -[VUIMediaEntityFetchResponse mediaEntities](self->_response, "mediaEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);
  objc_msgSend(v4, "mediaEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  objc_msgSend(v5, "collectionSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMPMediaEntitiesSingleFetchOperation _fetchResponseWithMediaEntities:mediaQuerySections:](self, "_fetchResponseWithMediaEntities:mediaQuerySections:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[VUIMediaEntityFetchResponse hasDataForCheckHasItemsOption](self->_response, "hasDataForCheckHasItemsOption"))
    v11 = 1;
  else
    v11 = objc_msgSend(v4, "hasDataForCheckHasItemsOption");
  objc_msgSend(v10, "setHasDataForCheckHasItemsOption:", v11);

  return v10;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setMediaLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_mediaLibrary, a3);
}

- (void)setPrefetchProperties:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchProperties, a3);
}

- (void)setProcessPredicateAfterFetch:(BOOL)a3
{
  self->_processPredicateAfterFetch = a3;
}

- (VUIMediaEntityType)currentFetchMediaEntityType
{
  return self->_currentFetchMediaEntityType;
}

- (void)setCurrentFetchMediaEntityType:(id)a3
{
  objc_storeStrong((id *)&self->_currentFetchMediaEntityType, a3);
}

@end
