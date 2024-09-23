@implementation VUIFamilySharingMediaEntitiesDataSource

- (VUIFamilySharingMediaEntitiesDataSource)initWithNSURLRequest:(id)a3
{
  id v5;
  VUIFamilySharingMediaEntitiesDataSource *v6;
  uint64_t v7;
  VUIMediaAPIClient *mediaClient;
  uint64_t v9;
  NSNumber *desiredBatchSize;
  NSMutableArray *v11;
  NSMutableArray *processedEntities;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIFamilySharingMediaEntitiesDataSource;
  v6 = -[VUIFamilySharingMediaEntitiesDataSource init](&v14, sel_init);
  if (v6)
  {
    +[VUIMediaAPIClient initializeWithAppleTVClientIdentifier](VUIMediaAPIClient, "initializeWithAppleTVClientIdentifier");
    +[VUIMediaAPIClient sharedInstance](VUIMediaAPIClient, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    mediaClient = v6->_mediaClient;
    v6->_mediaClient = (VUIMediaAPIClient *)v7;

    objc_storeStrong((id *)&v6->_urlRequest, a3);
    -[VUIFamilySharingMediaEntitiesDataSource _getLimitFromURLRequest](v6, "_getLimitFromURLRequest");
    v9 = objc_claimAutoreleasedReturnValue();
    desiredBatchSize = v6->_desiredBatchSize;
    v6->_desiredBatchSize = (NSNumber *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    processedEntities = v6->_processedEntities;
    v6->_processedEntities = v11;

    v6->_loadingNextBatch = 0;
    v6->_numberOfEntitiesProcessedInBatch = 0;
  }

  return v6;
}

- (void)startFetch
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[VUIFamilySharingMediaEntitiesDataSource mediaClient](self, "mediaClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingMediaEntitiesDataSource urlRequest](self, "urlRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__VUIFamilySharingMediaEntitiesDataSource_startFetch__block_invoke;
  v5[3] = &unk_1E9F9A338;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "fetchContentForUrl:completion:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__VUIFamilySharingMediaEntitiesDataSource_startFetch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  VUIFamilySharingEntityRequestResponseParser *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  char v23;
  _QWORD *v24;
  VUIFamilySharingMediaEntitiesResponseMetadataParser *v25;
  _QWORD v26[2];
  void (*v27)(uint64_t);
  void *v28;
  id v29;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!v6)
  {
    v25 = objc_alloc_init(VUIFamilySharingMediaEntitiesResponseMetadataParser);
    -[VUIFamilySharingMediaEntitiesResponseMetadataParser parseAMSURLResult:](v25, "parseAMSURLResult:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setResponseMetadata:", v9);
    v10 = objc_alloc_init(VUIFamilySharingEntityRequestResponseParser);
    -[VUIFamilySharingEntityRequestResponseParser parseAMSURLResult:](v10, "parseAMSURLResult:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "shouldGroupBySeason"))
    {
      objc_msgSend(WeakRetained, "_groupEpisodesbySeason:", v11);
      objc_msgSend(WeakRetained, "_orderEpisodesInGroupings");
    }
    if (objc_msgSend(WeakRetained, "shouldCoalesceEpisodesToShows"))
    {
      objc_msgSend(WeakRetained, "_coalesceEpisodesToShowsFromParsedEntities:", v11);
    }
    else if (objc_msgSend(WeakRetained, "shouldCoalesceEpisodesToSeasons"))
    {
      objc_msgSend(WeakRetained, "_coalesceEpisodesToSeasonsFromParsedEntities:", v11);
      objc_msgSend(WeakRetained, "_orderSeasonsBySeasonNumber");
    }
    else
    {
      v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(WeakRetained, "mediaEntities");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v15, "addObjectsFromArray:", v11);
      objc_msgSend(WeakRetained, "setProcessedEntities:", v15);

    }
    objc_msgSend(WeakRetained, "processedEntities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    objc_msgSend(WeakRetained, "mediaEntities");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17 - objc_msgSend(v18, "count");

    objc_msgSend(WeakRetained, "setNumberOfEntitiesProcessedInBatch:", v19 + objc_msgSend(WeakRetained, "numberOfEntitiesProcessedInBatch"));
    objc_msgSend(WeakRetained, "processedEntities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setMediaEntities:", v20);

  }
  if (objc_msgSend(WeakRetained, "loadingNextBatch"))
    objc_msgSend(WeakRetained, "setLoadingNextBatch:", 0);
  objc_msgSend(WeakRetained, "_applyContentRestrictionsFilter");
  objc_msgSend(WeakRetained, "_filterEntitiesBySeasonIdentifierIfNecessary");
  objc_msgSend(WeakRetained, "_filterGroupingsBySeasonIdentifierIfNecessary");
  objc_msgSend(WeakRetained, "_orderEpisodesIfNecessary");
  objc_msgSend(WeakRetained, "_limitEntitiesReturnedIfNecessary");
  v21 = objc_msgSend(WeakRetained, "numberOfEntitiesProcessedInBatch");
  objc_msgSend(WeakRetained, "desiredBatchSize");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 < objc_msgSend(v22, "unsignedIntegerValue") || objc_msgSend(WeakRetained, "fetchAllEntities"))
  {
    v23 = objc_msgSend(WeakRetained, "_hasNextBatch");

    if ((v23 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "loadNextEntityBatch");
      goto LABEL_21;
    }
  }
  else
  {

  }
  objc_msgSend(WeakRetained, "setNumberOfEntitiesProcessedInBatch:", 0);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v27 = __53__VUIFamilySharingMediaEntitiesDataSource_startFetch__block_invoke_2;
  v28 = &unk_1E9F99C98;
  objc_copyWeak(&v29, v7);
  v24 = v26;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v27((uint64_t)v24);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v24);

  objc_destroyWeak(&v29);
LABEL_21:

}

void __53__VUIFamilySharingMediaEntitiesDataSource_startFetch__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "dataSourceDidFinishFetching:", WeakRetained);

}

- (void)loadNextEntityBatch
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  if (!-[VUIFamilySharingMediaEntitiesDataSource loadingNextBatch](self, "loadingNextBatch"))
  {
    if (-[VUIFamilySharingMediaEntitiesDataSource _hasNextBatch](self, "_hasNextBatch"))
    {
      -[VUIFamilySharingMediaEntitiesDataSource resultLimit](self, "resultLimit");
      v3 = objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_5;
      v4 = (void *)v3;
      -[VUIMediaEntitiesDataSource mediaEntities](self, "mediaEntities");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      -[VUIFamilySharingMediaEntitiesDataSource resultLimit](self, "resultLimit");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");

      if (v6 < v8)
      {
LABEL_5:
        -[VUIFamilySharingMediaEntitiesDataSource setLoadingNextBatch:](self, "setLoadingNextBatch:", 1);
        -[VUIFamilySharingMediaEntitiesDataSource _appendNextOffsetToURLRequest](self, "_appendNextOffsetToURLRequest");
        -[VUIFamilySharingMediaEntitiesDataSource startFetch](self, "startFetch");
      }
    }
  }
}

- (void)setShouldGroupBySeason:(BOOL)a3
{
  self->_shouldGroupBySeason = a3;
  if (a3)
    self->_fetchAllEntities = 1;
}

- (void)setShouldCoalesceEpisodesToSeasons:(BOOL)a3
{
  self->_shouldCoalesceEpisodesToSeasons = a3;
  if (a3)
    self->_fetchAllEntities = 1;
}

- (void)_coalesceEpisodesToShowsFromParsedEntities:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v32;
    v8 = &off_1E9F96000;
    v29 = *(_QWORD *)v32;
    v30 = v4;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v10, "type", v29);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8[442], "episode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 != v12)
        {
          -[VUIFamilySharingMediaEntitiesDataSource processedEntities](self, "processedEntities");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v10);
          goto LABEL_18;
        }
        objc_msgSend(v10, "showIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[VUIFamilySharingMediaEntitiesDataSource _processedEntitiesContainsEntityWithIdentifier:](self, "_processedEntitiesContainsEntityWithIdentifier:", v13))
        {
          -[VUIFamilySharingMediaEntitiesDataSource _getEntityInProcessedEntitiesWithIdentifier:](self, "_getEntityInProcessedEntitiesWithIdentifier:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "seasonNumber");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            v17 = objc_msgSend(v15, "integerValue");
            objc_msgSend(v14, "seasonNumber");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "integerValue");

            if (v17 > v19)
            {
              -[VUIFamilySharingMediaEntitiesDataSource processedEntities](self, "processedEntities");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "indexOfObject:", v14);

              +[VUIFamilySharingMediaEntitiesDataSource mediaCollectionWithAMSMediaItem:](VUIFamilySharingMediaEntitiesDataSource, "mediaCollectionWithAMSMediaItem:", v10);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "seasonNumbers");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[VUIFamilySharingMediaEntitiesDataSource _addSeasonNumber:toCollectionSeasonNumbers:](self, "_addSeasonNumber:toCollectionSeasonNumbers:", v16, v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v22, "setSeasonNumbers:", v24);
              -[VUIFamilySharingMediaEntitiesDataSource processedEntities](self, "processedEntities");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "replaceObjectAtIndex:withObject:", v21, v22);

              v7 = v29;
LABEL_16:
              v8 = &off_1E9F96000;

              v4 = v30;
              goto LABEL_17;
            }
            objc_msgSend(v14, "seasonNumbers");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "containsObject:", v16);

            v7 = v29;
            if ((v27 & 1) == 0)
            {
              objc_msgSend(v14, "seasonNumbers");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[VUIFamilySharingMediaEntitiesDataSource _addSeasonNumber:toCollectionSeasonNumbers:](self, "_addSeasonNumber:toCollectionSeasonNumbers:", v16, v28);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "setSeasonNumbers:", v22);
              goto LABEL_16;
            }
            v4 = v30;
            v8 = &off_1E9F96000;
          }
        }
        else
        {
          +[VUIFamilySharingMediaEntitiesDataSource mediaCollectionWithAMSMediaItem:](VUIFamilySharingMediaEntitiesDataSource, "mediaCollectionWithAMSMediaItem:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIFamilySharingMediaEntitiesDataSource processedEntities](self, "processedEntities");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v14);
        }
LABEL_17:

LABEL_18:
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v6);
  }

}

+ (id)mediaCollectionWithAMSMediaItem:(id)a3
{
  id v3;
  void *v4;
  VUIFamilySharingEntity *v5;
  void *v6;
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
  VUIFamilySharingRelationships *v17;
  void *v18;
  VUIFamilySharingMediaCollection *v19;
  void *v20;
  void *v21;
  VUIFamilySharingMediaCollection *v22;

  v3 = a3;
  objc_msgSend(v3, "relationships");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(VUIFamilySharingEntity);
  objc_msgSend(v3, "showTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingEntity setShowTitle:](v5, "setShowTitle:", v6);

  objc_msgSend(v4, "show");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingEntity setIdentifier:](v5, "setIdentifier:", v8);

  objc_msgSend(v3, "artworkURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "artworkURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "artworkURL");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  -[VUIFamilySharingEntity setArtworkURL:](v5, "setArtworkURL:", v9);
  objc_msgSend(v7, "standardDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingEntity setStandardDescription:](v5, "setStandardDescription:", v12);

  objc_msgSend(v7, "contentRating");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingEntity setContentRating:](v5, "setContentRating:", v13);

  objc_msgSend(v3, "seasonNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingEntity setSeasonNumber:](v5, "setSeasonNumber:", v14);

  objc_msgSend(v7, "releaseDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingEntity setReleaseDate:](v5, "setReleaseDate:", v15);

  objc_msgSend(v7, "genreTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingEntity setGenreTitle:](v5, "setGenreTitle:", v16);

  v17 = objc_alloc_init(VUIFamilySharingRelationships);
  objc_msgSend(v4, "show");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingRelationships setShow:](v17, "setShow:", v18);

  -[VUIFamilySharingEntity setRelationships:](v5, "setRelationships:", v17);
  v19 = [VUIFamilySharingMediaCollection alloc];
  VUIMediaEntityFetchRequestAllPropertiesSet();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType show](VUIMediaEntityType, "show");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[VUIFamilySharingMediaCollection initWithAMSEntity:requestedProperties:mediaEntityType:](v19, "initWithAMSEntity:requestedProperties:mediaEntityType:", v5, v20, v21);

  return v22;
}

- (id)_addSeasonNumber:(id)a3 toCollectionSeasonNumbers:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithArray:", v6);

  objc_msgSend(v8, "addObject:", v7);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (void)_coalesceEpisodesToSeasonsFromParsedEntities:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UNKNOWN **v14;
  void *v15;
  void *v16;
  VUIFamilySharingEntity *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  VUIFamilySharingRelationships *v28;
  void *v29;
  void *v30;
  VUIFamilySharingMediaCollection *v31;
  void *v32;
  _UNKNOWN **v33;
  void *v34;
  VUIFamilySharingMediaCollection *v35;
  void *v36;
  uint64_t v37;
  id v38;
  VUIFamilySharingMediaEntitiesDataSource *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v43;
    v8 = &off_1E9F96000;
    v38 = v4;
    v39 = self;
    v37 = *(_QWORD *)v43;
    do
    {
      v9 = 0;
      v40 = v6;
      do
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v9);
        objc_msgSend(v10, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8[442], "episode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v12)
        {
          objc_msgSend(v10, "seasonIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[VUIFamilySharingMediaEntitiesDataSource _processedEntitiesContainsEntityWithIdentifier:](self, "_processedEntitiesContainsEntityWithIdentifier:", v13))
          {
            v14 = v8;
            objc_msgSend(v10, "relationships");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "season");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_alloc_init(VUIFamilySharingEntity);
            objc_msgSend(v10, "showTitle");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIFamilySharingEntity setShowTitle:](v17, "setShowTitle:", v18);

            objc_msgSend(v16, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIFamilySharingEntity setIdentifier:](v17, "setIdentifier:", v19);

            objc_msgSend(v10, "artworkURL");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "artworkURL");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              objc_msgSend(v16, "artworkURL");
              v22 = objc_claimAutoreleasedReturnValue();

              v20 = (void *)v22;
            }
            -[VUIFamilySharingEntity setArtworkURL:](v17, "setArtworkURL:", v20);
            objc_msgSend(v16, "standardDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIFamilySharingEntity setStandardDescription:](v17, "setStandardDescription:", v23);

            objc_msgSend(v16, "contentRating");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIFamilySharingEntity setContentRating:](v17, "setContentRating:", v24);

            objc_msgSend(v10, "seasonNumber");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIFamilySharingEntity setSeasonNumber:](v17, "setSeasonNumber:", v25);

            objc_msgSend(v16, "releaseDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIFamilySharingEntity setReleaseDate:](v17, "setReleaseDate:", v26);

            objc_msgSend(v16, "genreTitle");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIFamilySharingEntity setGenreTitle:](v17, "setGenreTitle:", v27);

            v28 = objc_alloc_init(VUIFamilySharingRelationships);
            objc_msgSend(v15, "show");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIFamilySharingRelationships setShow:](v28, "setShow:", v29);

            objc_msgSend(v15, "season");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIFamilySharingRelationships setSeason:](v28, "setSeason:", v30);

            -[VUIFamilySharingEntity setRelationships:](v17, "setRelationships:", v28);
            v31 = [VUIFamilySharingMediaCollection alloc];
            VUIMediaEntityFetchRequestAllPropertiesSet();
            v41 = v15;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v14;
            objc_msgSend(v14[442], "season");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[VUIFamilySharingMediaCollection initWithAMSEntity:requestedProperties:mediaEntityType:](v31, "initWithAMSEntity:requestedProperties:mediaEntityType:", v17, v32, v34);

            self = v39;
            -[VUIFamilySharingMediaEntitiesDataSource processedEntities](v39, "processedEntities");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "addObject:", v35);

            v8 = v33;
            v7 = v37;
            v4 = v38;
            v6 = v40;
          }
        }
        else
        {
          -[VUIFamilySharingMediaEntitiesDataSource processedEntities](self, "processedEntities");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v10);
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v6);
  }

}

- (void)_groupEpisodesbySeason:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _UNKNOWN **v10;
  __objc2_class **p_superclass;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  VUIFamilySharingMediaEntitiesDataSource *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[VUIMediaEntitiesDataSource grouping](self, "grouping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v4;
  v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v27)
  {
    v9 = *(_QWORD *)v29;
    v10 = &off_1E9F96000;
    p_superclass = VUICollectionHeaderView.superclass;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v13, "type");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10[442], "episode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == v15)
        {
          objc_msgSend(v13, "seasonIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIFamilySharingMediaEntitiesDataSource _getGroupingFrom:groupingIdentifier:](self, "_getGroupingFrom:groupingIdentifier:", v7, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!-[VUIFamilySharingMediaEntitiesDataSource _grouping:containsMediaEntity:](self, "_grouping:containsMediaEntity:", v17, v13))
            {
              objc_msgSend(v17, "mediaEntities");
              v18 = v9;
              v19 = v8;
              v20 = v7;
              v21 = self;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)objc_msgSend(v22, "mutableCopy");

              self = v21;
              v7 = v20;
              v8 = v19;
              v9 = v18;
              v10 = &off_1E9F96000;
              objc_msgSend(v23, "addObject:", v13);
              v24 = (void *)objc_msgSend(v23, "copy");
              objc_msgSend(v17, "setMediaEntities:", v24);

              goto LABEL_11;
            }
          }
          else
          {
            v23 = (void *)objc_msgSend(objc_alloc((Class)(p_superclass + 444)), "initWithIdentifier:", v16);
            v32 = v13;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setMediaEntities:", v25);

            objc_msgSend(v7, "addObject:", v23);
LABEL_11:

            p_superclass = (__objc2_class **)(VUICollectionHeaderView + 8);
          }

          continue;
        }
      }
      v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v27);
  }

  v26 = (void *)objc_msgSend(v7, "copy");
  -[VUIMediaEntitiesDataSource setGrouping:](self, "setGrouping:", v26);

}

- (id)_getLimitFromURLRequest
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[VUIFamilySharingMediaEntitiesDataSource urlRequest](self, "urlRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v3, 0);
  objc_msgSend(v4, "queryItems");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "name", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("limit"));

        if (v12)
        {
          objc_msgSend(v10, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
          objc_msgSend(v15, "numberFromString:", v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)_processedEntitiesContainsEntityWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VUIFamilySharingMediaEntitiesDataSource processedEntities](self, "processedEntities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_getEntityInProcessedEntitiesWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VUIFamilySharingMediaEntitiesDataSource processedEntities](self, "processedEntities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_grouping:(id)a3 containsMediaEntity:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "mediaEntities", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_getGroupingFrom:(id)a3 groupingIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "identifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v6);

        if (v13)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_appendNextOffsetToURLRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[VUIFamilySharingMediaEntitiesDataSource urlRequest](self, "urlRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v9, 0);
  objc_msgSend(v4, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingMediaEntitiesDataSource _updateOffsetQueryItemForQueryItems:](self, "_updateOffsetQueryItemForQueryItems:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setQueryItems:", v6);
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingMediaEntitiesDataSource setUrlRequest:](self, "setUrlRequest:", v8);

}

- (id)_updateOffsetQueryItemForQueryItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "name", (_QWORD)v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("offset"));

        if ((v13 & 1) == 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v14 = objc_alloc(MEMORY[0x1E0CB39D8]);
  -[VUIFamilySharingMediaEntitiesDataSource responseMetadata](self, "responseMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "offset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("offset"), v16);

  objc_msgSend(v5, "addObject:", v17);
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

- (BOOL)_hasNextBatch
{
  void *v2;
  void *v3;
  BOOL v4;

  -[VUIFamilySharingMediaEntitiesDataSource responseMetadata](self, "responseMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "offset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_limitEntitiesReturnedIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[VUIFamilySharingMediaEntitiesDataSource resultLimit](self, "resultLimit");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[VUIMediaEntitiesDataSource mediaEntities](self, "mediaEntities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[VUIFamilySharingMediaEntitiesDataSource resultLimit](self, "resultLimit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if (v6 > v8)
    {
      -[VUIMediaEntitiesDataSource mediaEntities](self, "mediaEntities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFamilySharingMediaEntitiesDataSource resultLimit](self, "resultLimit");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subarrayWithRange:", 0, (int)objc_msgSend(v10, "intValue"));
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_msgSend(v12, "copy");
      -[VUIMediaEntitiesDataSource setMediaEntities:](self, "setMediaEntities:", v11);

    }
  }
}

- (void)_orderSeasonsBySeasonNumber
{
  void *v3;
  void *v4;
  id v5;

  -[VUIFamilySharingMediaEntitiesDataSource processedEntities](self, "processedEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_110);
  v4 = (void *)objc_msgSend(v5, "mutableCopy");
  -[VUIFamilySharingMediaEntitiesDataSource setProcessedEntities:](self, "setProcessedEntities:", v4);

}

uint64_t __70__VUIFamilySharingMediaEntitiesDataSource__orderSeasonsBySeasonNumber__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "seasonNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seasonNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v6)
      v7 = objc_msgSend(v5, "compare:", v6);
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)_orderEpisodesInGroupings
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[VUIFamilySharingMediaEntitiesDataSource _episodeOrderingComparator](self, "_episodeOrderingComparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VUIMediaEntitiesDataSource grouping](self, "grouping", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "mediaEntities");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        objc_msgSend(v11, "sortUsingComparator:", v3);
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(v9, "setMediaEntities:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)_orderEpisodesIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[VUIFamilySharingMediaEntitiesDataSource orderEpisodesByEpisodeNumber](self, "orderEpisodesByEpisodeNumber"))
  {
    -[VUIFamilySharingMediaEntitiesDataSource _episodeOrderingComparator](self, "_episodeOrderingComparator");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntitiesDataSource mediaEntities](self, "mediaEntities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "sortUsingComparator:", v6);
    v5 = (void *)objc_msgSend(v4, "copy");
    -[VUIMediaEntitiesDataSource setMediaEntities:](self, "setMediaEntities:", v5);

  }
}

- (id)_episodeOrderingComparator
{
  return &__block_literal_global_23_1;
}

uint64_t __69__VUIFamilySharingMediaEntitiesDataSource__episodeOrderingComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "episodeNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "episodeNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)_filterEntitiesBySeasonIdentifierIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[VUIFamilySharingMediaEntitiesDataSource seasonIdentifierFilter](self, "seasonIdentifierFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[VUIMediaEntitiesDataSource mediaEntities](self, "mediaEntities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      v8 = &unk_1EDA77000;
      do
      {
        v9 = 0;
        v23 = v6;
        do
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "amsSeasonIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIFamilySharingMediaEntitiesDataSource seasonIdentifierFilter](self, "seasonIdentifierFilter");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqualToString:", v12);

            if (v13)
              objc_msgSend(v24, "addObject:", v10);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = v7;
              v15 = v8;
              v16 = v4;
              objc_msgSend(v10, "relationships");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "season");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(v18, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[VUIFamilySharingMediaEntitiesDataSource seasonIdentifierFilter](self, "seasonIdentifierFilter");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v19, "isEqualToString:", v20);

                if (v21)
                  objc_msgSend(v24, "addObject:", v10);
              }

              v4 = v16;
              v8 = v15;
              v7 = v14;
              v6 = v23;
            }
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v6);
    }

    v22 = (void *)objc_msgSend(v24, "copy");
    -[VUIMediaEntitiesDataSource setMediaEntities:](self, "setMediaEntities:", v22);

  }
}

- (void)_filterGroupingsBySeasonIdentifierIfNecessary
{
  VUIFamilySharingMediaEntitiesDataSource *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  VUIFamilySharingMediaEntitiesDataSource *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v2 = self;
  v28 = *MEMORY[0x1E0C80C00];
  -[VUIFamilySharingMediaEntitiesDataSource seasonIdentifierFilter](self, "seasonIdentifierFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[VUIMediaEntitiesDataSource grouping](v2, "grouping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      do
      {
        v8 = 0;
        v22 = v6;
        do
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
          objc_msgSend(v9, "mediaEntities");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v11, "relationships");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "season");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
              {
                objc_msgSend(v13, "identifier");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[VUIFamilySharingMediaEntitiesDataSource seasonIdentifierFilter](v2, "seasonIdentifierFilter");
                v15 = v7;
                v16 = v4;
                v17 = v2;
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v14, "isEqualToString:", v18);

                v2 = v17;
                v4 = v16;
                v7 = v15;
                v6 = v22;

                if (v19)
                  objc_msgSend(v21, "addObject:", v9);
              }

            }
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }

    v20 = (void *)objc_msgSend(v21, "copy");
    -[VUIMediaEntitiesDataSource setGrouping:](v2, "setGrouping:", v20);

  }
}

- (void)_applyContentRestrictionsFilter
{
  void *v3;
  void *v4;

  -[VUIMediaEntitiesDataSource mediaEntities](self, "mediaEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFamilySharingMediaEntitiesDataSource _applyContentRestrictionsFilterToMediaEntities:](self, "_applyContentRestrictionsFilterToMediaEntities:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntitiesDataSource setMediaEntities:](self, "setMediaEntities:", v4);

  -[VUIFamilySharingMediaEntitiesDataSource _applyContentRestrictionsFilterToGroupings](self, "_applyContentRestrictionsFilterToGroupings");
}

- (id)_applyContentRestrictionsFilterToMediaEntities:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = (void *)MEMORY[0x1E0CB3880];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__VUIFamilySharingMediaEntitiesDataSource__applyContentRestrictionsFilterToMediaEntities___block_invoke;
  v10[3] = &unk_1E9FA0D08;
  v10[4] = self;
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v6, "filteredArrayUsingPredicate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

uint64_t __90__VUIFamilySharingMediaEntitiesDataSource__applyContentRestrictionsFilterToMediaEntities___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isAllowedToShowMediaItem:", a2);
}

- (void)_applyContentRestrictionsFilterToGroupings
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VUIMediaEntitiesDataSource grouping](self, "grouping", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "mediaEntities");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIFamilySharingMediaEntitiesDataSource _applyContentRestrictionsFilterToMediaEntities:](self, "_applyContentRestrictionsFilterToMediaEntities:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v9, "setMediaEntities:", v11);
          objc_msgSend(v3, "addObject:", v9);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  -[VUIMediaEntitiesDataSource setGrouping:](self, "setGrouping:", v12);

}

- (BOOL)_isAllowedToShowMediaItem:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  BOOL v37;
  BOOL v39;

  v3 = a3;
  objc_msgSend(v3, "contentRating");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rank");
  objc_msgSend(v3, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    VUIDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[VUIFamilySharingMediaEntitiesDataSource _isAllowedToShowMediaItem:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    +[VUISettingsManager sharedInstance](VUISettingsManager, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "maxMovieRank");
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(v3, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v8 != (void *)v9)
  {
    v11 = (void *)v9;
    objc_msgSend(v3, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntityType show](VUIMediaEntityType, "show");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 != (void *)v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v3, "type");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMediaEntityType season](VUIMediaEntityType, "season");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 != v16)
      {
        v17 = 0;
        goto LABEL_15;
      }
      goto LABEL_11;
    }

    v10 = v11;
  }

LABEL_11:
  VUIDefaultLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[VUIFamilySharingMediaEntitiesDataSource _isAllowedToShowMediaItem:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);

  +[VUISettingsManager sharedInstance](VUISettingsManager, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "maxTVShowRank");
  v27 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v17 = (void *)v27;

LABEL_15:
  v36 = objc_msgSend(v17, "unsignedIntegerValue");
  if (v17)
    v37 = v5 == 0;
  else
    v37 = 1;
  v39 = v37 || v36 >= v5;

  return v39;
}

- (NSNumber)resultLimit
{
  return self->_resultLimit;
}

- (void)setResultLimit:(id)a3
{
  objc_storeStrong((id *)&self->_resultLimit, a3);
}

- (BOOL)shouldCoalesceEpisodesToShows
{
  return self->_shouldCoalesceEpisodesToShows;
}

- (void)setShouldCoalesceEpisodesToShows:(BOOL)a3
{
  self->_shouldCoalesceEpisodesToShows = a3;
}

- (BOOL)shouldCoalesceEpisodesToSeasons
{
  return self->_shouldCoalesceEpisodesToSeasons;
}

- (BOOL)shouldGroupBySeason
{
  return self->_shouldGroupBySeason;
}

- (BOOL)orderEpisodesByEpisodeNumber
{
  return self->_orderEpisodesByEpisodeNumber;
}

- (void)setOrderEpisodesByEpisodeNumber:(BOOL)a3
{
  self->_orderEpisodesByEpisodeNumber = a3;
}

- (NSString)seasonIdentifierFilter
{
  return self->_seasonIdentifierFilter;
}

- (void)setSeasonIdentifierFilter:(id)a3
{
  objc_storeStrong((id *)&self->_seasonIdentifierFilter, a3);
}

- (VUIMediaAPIClient)mediaClient
{
  return self->_mediaClient;
}

- (void)setMediaClient:(id)a3
{
  objc_storeStrong((id *)&self->_mediaClient, a3);
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
  objc_storeStrong((id *)&self->_urlRequest, a3);
}

- (VUIMediaAPIResponseMetadata)responseMetadata
{
  return self->_responseMetadata;
}

- (void)setResponseMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_responseMetadata, a3);
}

- (NSNumber)desiredBatchSize
{
  return self->_desiredBatchSize;
}

- (void)setDesiredBatchSize:(id)a3
{
  objc_storeStrong((id *)&self->_desiredBatchSize, a3);
}

- (NSMutableArray)processedEntities
{
  return self->_processedEntities;
}

- (void)setProcessedEntities:(id)a3
{
  objc_storeStrong((id *)&self->_processedEntities, a3);
}

- (BOOL)loadingNextBatch
{
  return self->_loadingNextBatch;
}

- (void)setLoadingNextBatch:(BOOL)a3
{
  self->_loadingNextBatch = a3;
}

- (BOOL)fetchAllEntities
{
  return self->_fetchAllEntities;
}

- (void)setFetchAllEntities:(BOOL)a3
{
  self->_fetchAllEntities = a3;
}

- (unint64_t)numberOfEntitiesProcessedInBatch
{
  return self->_numberOfEntitiesProcessedInBatch;
}

- (void)setNumberOfEntitiesProcessedInBatch:(unint64_t)a3
{
  self->_numberOfEntitiesProcessedInBatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedEntities, 0);
  objc_storeStrong((id *)&self->_desiredBatchSize, 0);
  objc_storeStrong((id *)&self->_responseMetadata, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_mediaClient, 0);
  objc_storeStrong((id *)&self->_seasonIdentifierFilter, 0);
  objc_storeStrong((id *)&self->_resultLimit, 0);
}

- (void)_isAllowedToShowMediaItem:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIFamilySharingMediaEntitiesDataSource::looking up movie restriction ranking from settings", a5, a6, a7, a8, 0);
}

- (void)_isAllowedToShowMediaItem:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, a1, a3, "VUIFamilySharingMediaEntitiesDataSource::looking up tv show restriction ranking from settings", a5, a6, a7, a8, 0);
}

@end
