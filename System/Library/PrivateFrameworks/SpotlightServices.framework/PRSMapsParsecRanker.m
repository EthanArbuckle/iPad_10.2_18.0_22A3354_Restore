@implementation PRSMapsParsecRanker

+ (id)sharedMapsParsecRanker
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!sharedMapsParsecRanker_mapsParsecRanker)
  {
    v3 = objc_opt_new();
    v4 = (void *)sharedMapsParsecRanker_mapsParsecRanker;
    sharedMapsParsecRanker_mapsParsecRanker = v3;

  }
  objc_sync_exit(v2);

  return (id)sharedMapsParsecRanker_mapsParsecRanker;
}

- (PRSMapsParsecRanker)init
{
  PRSMapsParsecRanker *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  int v7;
  id v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  PRSMapsParsecRanker *v24;
  uint64_t v25;
  IQFMapsPersonalizationRanker *iqfRanker;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)PRSMapsParsecRanker;
  v2 = -[PRSMapsParsecRanker init](&v34, sel_init);
  if (!v2)
  {
LABEL_26:
    v24 = v2;
    goto LABEL_27;
  }
  SSDefaultsGetResources();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v33 = 0;
  v5 = objc_msgSend(v3, "BOOLeanForKey:didFailWithError:", CFSTR("MapsParsecRankerEnabled"), &v33);
  v6 = v33;
  if (v6)
    objc_msgSend(v4, "addObject:", CFSTR("MapsParsecRankerEnabled"));
  else
    v2->_rankerEnabled = v5;
  v32 = v6;
  v7 = objc_msgSend(v3, "BOOLeanForKey:didFailWithError:", CFSTR("MapsParsecRankerEntityRelevanceEnabled"), &v32);
  v8 = v32;

  if (v8)
    objc_msgSend(v4, "addObject:", CFSTR("MapsParsecRankerEntityRelevanceEnabled"));
  else
    v2->_entityRelevanceEnabled = v7;
  v31 = v8;
  objc_msgSend(v3, "doubleForKey:didFailWithError:", CFSTR("MapsParsecRankerVisitCountThreshold"), &v31);
  v10 = v9;
  v11 = v31;

  if (v11)
    objc_msgSend(v4, "addObject:", CFSTR("MapsParsecRankerVisitCountThreshold"));
  else
    v2->_visitCountThreshold = v10;
  v30 = v11;
  objc_msgSend(v3, "doubleForKey:didFailWithError:", CFSTR("MapsParsecRankerLastVisitDaysThreshold"), &v30);
  v13 = v12;
  v14 = v30;

  if (v14)
    objc_msgSend(v4, "addObject:", CFSTR("MapsParsecRankerLastVisitDaysThreshold"));
  else
    v2->_lastVisitDaysThreshold = v13;
  v29 = v14;
  objc_msgSend(v3, "doubleForKey:didFailWithError:", CFSTR("MapsParsecRankerVisitCountGivenLocationThreshold"), &v29);
  v16 = v15;
  v17 = v29;

  if (v17)
    objc_msgSend(v4, "addObject:", CFSTR("MapsParsecRankerVisitCountGivenLocationThreshold"));
  else
    v2->_visitCountGivenLocationThreshold = v16;
  v28 = v17;
  objc_msgSend(v3, "doubleForKey:didFailWithError:", CFSTR("MapsParsecRankerEntityRelevanceThreshold"), &v28);
  v19 = v18;
  v20 = v28;

  if (!v20)
    v2->_entityRelevanceThreshold = v19;
  v21 = objc_msgSend(v4, "count");
  PRSLogCategoryDefault();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110400;
      v36 = v5;
      v37 = 1024;
      v38 = v7;
      v39 = 2048;
      v40 = v19;
      v41 = 2048;
      v42 = v10;
      v43 = 2048;
      v44 = v13;
      v45 = 2048;
      v46 = v16;
      _os_log_impl(&dword_1B86C5000, v23, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker - Successfully loaded resources: rankerEnabled=%u, entityRelevanceEnabled=%u, entityRelevanceThreshold=%f, visitCountThreshold=%f, lastVisitDaysThreshold=%f, visitCountGivenLocationThreshold=%f", buf, 0x36u);
    }

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3AAD8]), "initWithVisitCountThreshold:lastVisitDaysThreshold:visitCountGivenLocationThreshold:entityRelevanceThreshold:enableEntityRelevance:", v2->_entityRelevanceEnabled, v2->_visitCountThreshold, v2->_lastVisitDaysThreshold, v2->_visitCountGivenLocationThreshold, v2->_entityRelevanceThreshold);
    iqfRanker = v2->_iqfRanker;
    v2->_iqfRanker = (IQFMapsPersonalizationRanker *)v25;

    goto LABEL_26;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[PRSMapsParsecRanker init].cold.1();

  v24 = 0;
LABEL_27:

  return v24;
}

- (PRSMapsParsecRanker)initWithRankerEnabled:(BOOL)a3 visitCountThreshold:(double)a4 visitCountGivenLocationThreshold:(double)a5 lastVisitDaysThreshold:(double)a6 entityRelevanceThreshold:(double)a7 enableEntityRelevance:(BOOL)a8
{
  PRSMapsParsecRanker *v14;
  PRSMapsParsecRanker *v15;
  uint64_t v16;
  IQFMapsPersonalizationRanker *iqfRanker;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PRSMapsParsecRanker;
  v14 = -[PRSMapsParsecRanker init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_rankerEnabled = a3;
    v14->_visitCountThreshold = a4;
    v14->_visitCountGivenLocationThreshold = a5;
    v14->_lastVisitDaysThreshold = a6;
    v14->_entityRelevanceThreshold = a7;
    v14->_entityRelevanceEnabled = a8;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3AAD8]), "initWithVisitCountThreshold:lastVisitDaysThreshold:visitCountGivenLocationThreshold:entityRelevanceThreshold:enableEntityRelevance:", v14->_entityRelevanceEnabled, v14->_visitCountThreshold, v14->_lastVisitDaysThreshold, v14->_visitCountGivenLocationThreshold, v14->_entityRelevanceThreshold);
    iqfRanker = v15->_iqfRanker;
    v15->_iqfRanker = (IQFMapsPersonalizationRanker *)v16;

  }
  return v15;
}

- (id)rerankMapsResultsWithLocalSignals:(id)a3 forQueryId:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  dispatch_semaphore_t v13;
  dispatch_time_t v14;
  IQFMapsPersonalizationRanker *iqfRanker;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[8];
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[4];
  id v32;
  PRSMapsParsecRanker *v33;
  id v34;
  id v35;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v9 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke;
  v31[3] = &unk_1E6E52A10;
  v10 = v6;
  v32 = v10;
  v33 = self;
  v11 = v8;
  v34 = v11;
  v12 = v7;
  v35 = v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v31);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
  v30 = 0;
  v30 = (id)objc_opt_new();
  v13 = dispatch_semaphore_create(0);
  v14 = dispatch_time(0, 400000000);
  iqfRanker = self->_iqfRanker;
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke_30;
  v22[3] = &unk_1E6E52A38;
  v24 = &v25;
  v16 = v13;
  v23 = v16;
  -[IQFMapsPersonalizationRanker rankedEventsForLocations:completionHandler:](iqfRanker, "rankedEventsForLocations:completionHandler:", v12, v22);
  if (dispatch_semaphore_wait(v16, v14))
  {
    PRSLogCategoryDefault();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B86C5000, v17, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: Timed out waiting for results from IQFRanker", buf, 2u);
    }

  }
  -[PRSMapsParsecRanker _logTriggerIfNecessary:queryId:](self, "_logTriggerIfNecessary:queryId:", v26[5], a4);
  -[PRSMapsParsecRanker _rerankMapsResults:withRankedEvents:withMuidToResultIndex:](self, "_rerankMapsResults:withRankedEvents:withMuidToResultIndex:", v10, v26[5], v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v25, 8);
  return v18;
}

void __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  objc_msgSend(v5, "resultEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "resultEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maps_encrypted_muid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_parseMUIDFromResultIdentifier:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  if (objc_msgSend(v9, "length"))
  {
    PRSLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1B86C5000, v13, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: location with name: %@, muid: %@", (uint8_t *)&v16, 0x16u);
    }

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3AAD0]), "initWithMUID:name:", v9, v7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v15, v9);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v14);
  }

}

void __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PRSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke_30_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_parseMUIDFromResultIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("m:")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("m:"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rangeOfString:", CFSTR(":"));
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "substringToIndex:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
  }
  else
  {
    PRSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PRSMapsParsecRanker _parseMUIDFromResultIdentifier:].cold.1();

    v4 = 0;
  }

  return v4;
}

- (id)_rerankMapsResults:(id)a3 withRankedEvents:(id)a4 withMuidToResultIndex:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 rankerEnabled;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  id v27;
  id v28;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  unsigned int v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[PRSMapsParsecRanker _tagSearchResults:withTopMatchFromEvents:muidToResultIndex:](self, "_tagSearchResults:withTopMatchFromEvents:muidToResultIndex:", a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  rankerEnabled = self->_rankerEnabled;
  PRSLogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (rankerEnabled)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B86C5000, v12, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: Proceeding to rerank as _rankerEnabled == 1", buf, 2u);
    }

    objc_msgSend(v8, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") && v14)
    {
      if ((-[IQFMapsPersonalizationRanker isResultCandidateForPromotion:](self->_iqfRanker, "isResultCandidateForPromotion:", v14) & 1) != 0)
      {
        objc_msgSend(v14, "muid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 && (v17 = objc_msgSend(v16, "unsignedIntegerValue"), v17 < objc_msgSend(v10, "count")))
        {
          v18 = objc_msgSend(v16, "isEqualToNumber:", &unk_1E6E9A0F8);
          PRSLogCategoryDefault();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if (!v18)
          {
            if (v20)
            {
              *(_DWORD *)buf = 138412290;
              v43 = v16;
              _os_log_impl(&dword_1B86C5000, v19, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: promoting entity in rank %@ to first", buf, 0xCu);
            }

            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v30, "preferTopPlatter");

            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "topHit") != 0;

            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "placement") != 0;

            objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v16, "unsignedIntegerValue"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "removeObjectAtIndex:", objc_msgSend(v16, "unsignedIntegerValue"));
            objc_msgSend(v10, "insertObject:atIndex:", v35, 0);
            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setPreferTopPlatter:", v41);

            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setTopHit:", v32);

            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setPlacement:", v34);

            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setDidRerankPersonalResult:", 1);

            -[PRSMapsParsecRanker _emitRerankSuccessfulSignpost](self, "_emitRerankSuccessfulSignpost");
            v40 = v10;

            goto LABEL_24;
          }
          if (v20)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B86C5000, v19, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: the entity we want promote is already ranked first", buf, 2u);
          }
        }
        else
        {
          PRSLogCategoryDefault();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            -[PRSMapsParsecRanker _rerankMapsResults:withRankedEvents:withMuidToResultIndex:].cold.1(v14, (uint64_t)v16, v19);
        }

        -[PRSMapsParsecRanker _emitRerankNotNeededSignpost](self, "_emitRerankNotNeededSignpost");
        v28 = v10;
LABEL_24:

        goto LABEL_25;
      }
      PRSLogCategoryDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v24 = "PRSMapsParsecRanker: the first ranked event is not a candidate for promotion. Not re-ranking";
        v25 = v22;
        v26 = 2;
        goto LABEL_19;
      }
    }
    else
    {
      PRSLogCategoryDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->_rankerEnabled;
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = v23;
        v24 = "PRSMapsParsecRanker: Skipping reranking as no relevant events found (_rankerEnabled == %d)";
        v25 = v22;
        v26 = 8;
LABEL_19:
        _os_log_impl(&dword_1B86C5000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
      }
    }

    -[PRSMapsParsecRanker _emitRerankNotNeededSignpost](self, "_emitRerankNotNeededSignpost");
    v27 = v10;
LABEL_25:

    goto LABEL_26;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B86C5000, v12, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: Skipping reranking as _rankerEnabled == 0", buf, 2u);
  }

  -[PRSMapsParsecRanker _emitRerankNotNeededSignpost](self, "_emitRerankNotNeededSignpost");
  v21 = v10;
LABEL_26:

  return v10;
}

- (id)_tagSearchResults:(id)a3 withTopMatchFromEvents:(id)a4 muidToResultIndex:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__PRSMapsParsecRanker__tagSearchResults_withTopMatchFromEvents_muidToResultIndex___block_invoke;
  v14[3] = &unk_1E6E52A60;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v10 = v8;
  objc_msgSend(a4, "enumerateObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

void __82__PRSMapsParsecRanker__tagSearchResults_withTopMatchFromEvents_muidToResultIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v13 = v3;
  objc_msgSend(v3, "muid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  if (v6)
  {
    v8 = v7;
    if (v7 < objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsPersonalResult");

      if ((v10 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setContainsPersonalResult:", 1);

        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setMapsPersonalizationResult:", v13);

      }
    }
  }

}

- (void)_logTriggerIfNecessary:(id)a3 queryId:(int64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    PRSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1B86C5000, v6, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: Logging trigger because successfully matched %lu rankedEvents", (uint8_t *)&v9, 0xCu);
    }

    SSDefaultsGetResources();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("3df1e6fb-2140-56db-8a1a-e96280d7a49b"));
    objc_msgSend(v7, "logForTrigger:queryID:", v8, a4);

  }
}

- (void)_emitRerankSuccessfulSignpost
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  logForCSLogCategoryPersonalization();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B86C5000, v5, OS_SIGNPOST_EVENT, v3, "rerankMapsResultsWithLocalSignalsSuccessful", (const char *)&unk_1B8810841, v6, 2u);
  }

}

- (void)_emitRerankNotNeededSignpost
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  logForCSLogCategoryPersonalization();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B86C5000, v5, OS_SIGNPOST_EVENT, v3, "rerankMapsResultsWithLocalSignalsNotNeeded", (const char *)&unk_1B8810841, v6, 2u);
  }

}

- (BOOL)isResultCandidateForPromotion:(id)a3
{
  return -[IQFMapsPersonalizationRanker isResultCandidateForPromotion:](self->_iqfRanker, "isResultCandidateForPromotion:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iqfRanker, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, v0, v1, "PRSMapsParsecRanker - Expected resources failed to load: %@. Disabling Geo Personalization!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, v0, v1, "PRSMapsParsecRanker: error fetching ranked events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_parseMUIDFromResultIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, v0, v1, "PRSMapsParsecRanker: unable to fetch MUID from result identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_rerankMapsResults:(void *)a1 withRankedEvents:(uint64_t)a2 withMuidToResultIndex:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "muid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1B86C5000, a3, OS_LOG_TYPE_ERROR, "PRSMapsParsecRanker: failed to match muid (%@) to valid indexForPromotion (%@)", v6, 0x16u);

}

@end
