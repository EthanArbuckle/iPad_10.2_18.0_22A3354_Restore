@implementation WBSForYouRecentParsecResultsManager

- (void)appendResultsIfApplicable:(id)a3
{
  -[WBSForYouRecentParsecResultsManager appendResultsIfApplicable:withDelayedExistenceCheck:](self, "appendResultsIfApplicable:withDelayedExistenceCheck:", a3, 1);
}

- (void)appendResultsIfApplicable:(id)a3 withDelayedExistenceCheck:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  WBSForYouLinkRecommendation *v27;
  void *v28;
  WBSForYouLinkRecommendation *v29;
  void *v30;
  void *v31;
  void *v32;
  WBSForYouLinkRecommendation *v33;
  dispatch_time_t v34;
  void *v35;
  void *v36;
  id v37;
  id obj;
  _QWORD block[5];
  WBSForYouLinkRecommendation *v41;
  id v42;
  id v43;
  id from;
  _QWORD v45[4];
  WBSForYouLinkRecommendation *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id location;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  if ((unint64_t)objc_msgSend(v37, "count") <= 2)
    v5 = objc_msgSend(v37, "count");
  else
    v5 = 2;
  objc_msgSend(v37, "subarrayWithRange:", 0, v5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "count"))
  {
    objc_initWeak(&location, self);
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    v48 = 0u;
    obj = v36;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (!v6)
      goto LABEL_37;
    v7 = *(_QWORD *)v49;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v49 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (-[WBSForYouRecentParsecResultsManager _hasPermissibleResultTypeForResult:](self, "_hasPermissibleResultTypeForResult:", v9))
        {
          objc_msgSend(v9, "url");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (!v10 || (objc_msgSend(v10, "safari_isHTTPFamilyURL") & 1) == 0)
            goto LABEL_34;
          v12 = v9;
          objc_msgSend(v12, "sectionBundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.parsec.web_index"));

          if (v14)
          {
            objc_msgSend(v12, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              objc_msgSend(v15, "descriptions");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "firstObject");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "text");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v19)
              {
                objc_msgSend(v16, "title");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "text");
                v19 = (void *)objc_claimAutoreleasedReturnValue();

              }
              if (objc_msgSend(v19, "length"))
              {
                objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = (void *)objc_msgSend(v21, "mutableCopy");

                objc_msgSend(v22, "addCharactersInString:", CFSTR("—"));
                objc_msgSend(v19, "stringByTrimmingCharactersInSet:", v22);
              }
              else
              {
                objc_msgSend(v12, "title");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "text");
              }
              v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
LABEL_28:

              if (objc_msgSend(v25, "length"))
              {
                v27 = [WBSForYouLinkRecommendation alloc];
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = -[WBSForYouLinkRecommendation initWithTitle:url:lastSeenDate:source:topicSource:](v27, "initWithTitle:url:lastSeenDate:source:topicSource:", v25, v11, v28, 2, 0);

                _WBSLocalizedString();
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[WBSForYouLinkRecommendation setFootnote:](v29, "setFootnote:", v30);

                objc_msgSend(v12, "identifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[WBSForYouLinkRecommendation setSourceID:](v29, "setSourceID:", v31);

                -[WBSForYouRecentParsecResultsManager _bestAcceptableImageForSFResult:](self, "_bestAcceptableImageForSFResult:", v12);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v45[0] = MEMORY[0x1E0C809B0];
                v45[1] = 3221225472;
                v45[2] = __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke;
                v45[3] = &unk_1E5443918;
                v33 = v29;
                v46 = v33;
                objc_copyWeak(&v47, &location);
                objc_msgSend(v32, "loadImageDataWithCompletionHandler:", v45);
                if (a4)
                {
                  objc_initWeak(&from, v12);
                  v34 = dispatch_time(0, 200000000);
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke_3;
                  block[3] = &unk_1E5443940;
                  objc_copyWeak(&v43, &from);
                  block[4] = self;
                  v41 = v33;
                  v42 = v11;
                  dispatch_after(v34, MEMORY[0x1E0C80D38], block);

                  objc_destroyWeak(&v43);
                  objc_destroyWeak(&from);
                }
                else
                {
                  -[WBSForYouRecentParsecResultsManager _cacheEnsuringExistence](self, "_cacheEnsuringExistence");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "setObject:forKey:", v33, v11);

                }
                objc_destroyWeak(&v47);

              }
LABEL_34:

              continue;
            }
            objc_msgSend(v12, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v23;
            if (v23)
            {
              objc_msgSend(v23, "leadingText");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "text");
              v24 = objc_claimAutoreleasedReturnValue();
LABEL_25:
              v25 = (void *)v24;
              goto LABEL_26;
            }
            objc_msgSend(v12, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v26;
            if (v26)
            {
              objc_msgSend(v26, "title");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "text");
              v24 = objc_claimAutoreleasedReturnValue();
              goto LABEL_25;
            }
          }
          objc_msgSend(v12, "title");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "text");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (!v6)
      {
LABEL_37:

        objc_destroyWeak(&location);
        break;
      }
    }
  }

}

void __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke_2;
    block[3] = &unk_1E54438F0;
    v7 = *(id *)(a1 + 32);
    v8 = v4;
    v5 = v4;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v9);

  }
}

void __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "notifyImageWasUpdatedForRecommendation:", *(_QWORD *)(a1 + 32));

}

void __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cacheEnsuringExistence");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (id)_bestAcceptableImageForSFResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v3, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "addObject:", v6);

  objc_msgSend(v3, "completionImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "addObject:", v7);

  objc_msgSend(v3, "secondaryTitleImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v4, "addObject:", v8);

  objc_msgSend(v3, "inlineCard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cardSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_14;
  objc_msgSend(v11, "performSelector:", sel_thumbnail);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  if (v12)
    objc_msgSend(v4, "addObject:", v12);
LABEL_15:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = 0;
    v16 = *(_QWORD *)v27;
    v17 = 0.0;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v19, "size");
        if (v21 >= v20)
          v22 = v20;
        else
          v22 = v21;
        if (v22 > v17 && v22 >= 60.0)
        {
          v24 = v19;

          v15 = v24;
          v17 = v22;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_hasPermissibleResultTypeForResult:(id)a3
{
  id v3;
  void *v4;
  char v5;
  unsigned int v6;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("wiki:"));

  if ((v5 & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v7 = +[WBSParsecSearchResult typeForSFSearchResult:](WBSParsecSearchResult, "typeForSFSearchResult:", v3);
    if (v7 >= 6)
      LOBYTE(v6) = 1;
    else
      v6 = (0xAu >> v7) & 1;
  }

  return v6;
}

- (NSArray)recentRecommendations
{
  return (NSArray *)-[NSCache allObjects](self->_cache, "allObjects");
}

- (void)clearAllResults
{
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
}

- (id)_cacheEnsuringExistence
{
  NSCache *cache;
  NSCache *v4;
  NSCache *v5;

  cache = self->_cache;
  if (!cache)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = self->_cache;
    self->_cache = v4;

    -[NSCache setCountLimit:](self->_cache, "setCountLimit:", 200);
    cache = self->_cache;
  }
  return cache;
}

- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSForYouRecentParsecResultsManager;
  -[WBSForYouRecommendationMediatorDataSource emitStartRetrievingRecommendationsPerformanceMarker](&v17, sel_emitStartRetrievingRecommendationsPerformanceMarker);
  -[WBSForYouRecentParsecResultsManager _createInternalQueueIfNecessary](self, "_createInternalQueueIfNecessary");
  -[WBSForYouRecentParsecResultsManager recentRecommendations](self, "recentRecommendations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__WBSForYouRecentParsecResultsManager_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5441B50;
  v15 = v8;
  v16 = v7;
  v14 = v6;
  v10 = v8;
  v11 = v6;
  v12 = v7;
  dispatch_async(internalQueue, block);

}

void __98__WBSForYouRecentParsecResultsManager_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  v1 = a1[6];
  +[WBSForYouRecentParsecResultsManager recommendationsMatchingTopic:fromArray:](WBSForYouRecentParsecResultsManager, "recommendationsMatchingTopic:fromArray:", a1[4], a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)_createInternalQueueIfNecessary
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *internalQueue;

  if (!self->_internalQueue)
  {
    v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Safari.WBSForYouRecentParsecResultsManager.internalQueue", 0);
    internalQueue = self->_internalQueue;
    self->_internalQueue = v3;

  }
}

+ (id)recommendationsMatchingTopic:(id)a3 fromArray:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v24 = a4;
  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(v25, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("title contains[cd] %@"), v23);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("originalQueriesString contains[cd] %@"), v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v25, "associatedTopics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11), "title");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("title contains[cd] %@"), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("originalQueriesString contains[cd] %@"), v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "filteredArrayUsingPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v27;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v20++), "setTopicSource:", objc_msgSend(v25, "source"));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v18);
    }

    v21 = v24;
  }
  else
  {
    v21 = v24;
    v17 = v24;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
