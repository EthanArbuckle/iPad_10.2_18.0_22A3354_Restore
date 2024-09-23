@implementation SPParsecQuery

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    SPLogInit();
    objc_msgSend(MEMORY[0x24BE84950], "getSharedInstance");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)interface;
    interface = v2;

  }
}

+ (unsigned)searchDomain
{
  return 2;
}

+ (BOOL)isParsecEnabled
{
  return sParsecEnabled;
}

+ (void)parsecEnabled:(BOOL)a3
{
  sParsecEnabled = a3;
  objc_msgSend((id)interface, "setParsecState:");
}

+ (void)activate
{
  id v3;

  if (+[SPParsecQuery isParsecEnabled](SPParsecQuery, "isParsecEnabled"))
  {
    v3 = a1;
    objc_sync_enter(v3);
    ++sCounter;
    objc_msgSend((id)interface, "activate:", CFAbsoluteTimeGetCurrent());
    objc_sync_exit(v3);

    objc_msgSend(MEMORY[0x24BE84980], "updateFeedbackListeners");
  }
}

+ (void)deactivate
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  if (sCounter)
  {
    --sCounter;
    objc_msgSend((id)interface, "deactivate");
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PRSStartedPlaying"), 0);

  objc_sync_exit(obj);
}

+ (void)getFTEStringsWithReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend((id)interface, "searchSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    SPLogForSPLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, v6, v7, "Parsec session is nil in FTE. Trying to create one.", buf, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "activate");
  }
  objc_msgSend((id)interface, "searchSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend((id)interface, "searchSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __40__SPParsecQuery_getFTEStringsWithReply___block_invoke;
    v11[3] = &unk_24F01BC88;
    v13 = a1;
    v12 = v4;
    objc_msgSend(v9, "getFTEStringsWithReply:", v11);

  }
  else
  {
    SPLogForSPLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SPParsecQuery getFTEStringsWithReply:].cold.1(v10);

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0, 0);
  }

}

void __40__SPParsecQuery_getFTEStringsWithReply___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  SPLogForSPLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v15, v16))
  {
    v17 = 138412546;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_2279CC000, v15, v16, "Got FTE reply - fteString %@, learnMore %@", (uint8_t *)&v17, 0x16u);
  }

  if (a6)
  {
    objc_msgSend((id)interface, "setSearchSession:", 0);
    objc_msgSend((id)objc_opt_class(), "activate");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)createResultObject
{
  return objc_alloc_init(MEMORY[0x24BE84948]);
}

- (void)finished
{
  NSObject *v2;
  os_log_type_t v3;
  double Current;
  double v5;
  double timeOut;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  NSObject *v32;
  os_log_type_t v33;
  double v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  id v38;
  qos_class_t v39;
  NSObject *v40;
  qos_class_t v41;
  dispatch_block_t v42;
  NSObject *v43;
  os_log_type_t v44;
  NSObject *v45;
  os_log_type_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  PRSQueryTask *parsecQueryTask;
  SPParsecQuery *v52;
  PRSQueryTask *v53;
  unsigned int v54;
  uint64_t v55;
  id WeakRetained;
  NSArray *obj;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  void *v62;
  _QWORD block[4];
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE buf[12];
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE84B00] ^ 1;
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2279CC000, v2, v3, "#query parsec finished", buf, 2u);
  }

  Current = CFAbsoluteTimeGetCurrent();
  self->_queryEndTime = Current;
  v5 = Current - self->_queryStartTime;
  timeOut = self->_timeOut;
  if (v5 > timeOut)
    -[SPParsecQuery updateParsecBeyondTimeoutCount:](self, "updateParsecBeyondTimeoutCount:", v5 - timeOut <= 0.05);
  WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
  self->_done = 1;
  pthread_mutex_lock(&self->_parsecQueryTaskMutex);
  -[PRSQueryTask category_stats](self->_parsecQueryTask, "category_stats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingConfiguration setSqfData:](self->_rankingInfo, "setSqfData:", v7);

  -[PRSQueryTask server_features](self->_parsecQueryTask, "server_features");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingConfiguration setServerFeatures:](self->_rankingInfo, "setServerFeatures:", v8);

  -[PRSQueryTask serverRelevanceScores](self->_parsecQueryTask, "serverRelevanceScores");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSRankingConfiguration setServerRelevanceScores:](self->_rankingInfo, "setServerRelevanceScores:", v9);

  -[PRSQueryTask serverRelevanceScoreThreshold](self->_parsecQueryTask, "serverRelevanceScoreThreshold");
  -[PRSRankingConfiguration setServerRelevanceScoreThreshold:](self->_rankingInfo, "setServerRelevanceScoreThreshold:");
  v10 = (void *)objc_opt_new();
  -[PRSQueryTask engagementSignal](self->_parsecQueryTask, "engagementSignal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithSFEngagementSignal:", v11);
  -[PRSRankingConfiguration setIFunScores:](self->_rankingInfo, "setIFunScores:", v12);

  pthread_mutex_unlock(&self->_parsecQueryTaskMutex);
  -[PRSRankingConfiguration setParsecCategoryOrder:](self->_rankingInfo, "setParsecCategoryOrder:", self->_parsecResultsCategoryOrder);
  -[SPParsecQuery cepDictionary](self, "cepDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    -[SPParsecQuery cannedCEPValues](self, "cannedCEPValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PRSRankingConfiguration setQueryIndependentCategoryProbabilities:](self->_rankingInfo, "setQueryIndependentCategoryProbabilities:", v14);
  if (!v13)

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v55 = 384;
  obj = self->_parsecResults;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  if (!v15)
  {
    v16 = -1.0;
    goto LABEL_41;
  }
  v58 = *(_QWORD *)v72;
  v59 = v15;
  v16 = -1.0;
  do
  {
    for (i = 0; i != v59; ++i)
    {
      if (*(_QWORD *)v72 != v58)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
      objc_msgSend(v17, "bundleIdentifier", v55);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v17;
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.parsec.itunes.iosSoftware")))
      {

      }
      else
      {
        objc_msgSend(v17, "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "hasPrefix:", CFSTR("com.apple.parsec.app_distr"));

        if (!v20)
          goto LABEL_35;
      }
      v62 = (void *)objc_opt_new();
      v21 = (void *)objc_opt_new();
      objc_msgSend(v17, "results");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count") == 0;

      if (!v23)
        v16 = 0.0;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      objc_msgSend(v61, "results");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v68;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v68 != v26)
              objc_enumerationMutation(v24);
            v28 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
            objc_msgSend(v28, "applicationBundleIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSSet containsObject:](self->_disabledAppSet, "containsObject:", v29))
            {
              SPLogForSPLogCategoryDefault();
              v30 = objc_claimAutoreleasedReturnValue();
              v31 = 2 * (*MEMORY[0x24BE84AF8] == 0);
              if (os_log_type_enabled(v30, v31))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v29;
                _os_log_impl(&dword_2279CC000, v30, v31, "Skip de-duping of disabled app %@", buf, 0xCu);
              }

              objc_msgSend(v21, "addObject:", v28);
            }
            else if (-[NSSet containsObject:](self->_setOfVisibleApps, "containsObject:", v29))
            {
              SPLogForSPLogCategoryDefault();
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = 2 * (*MEMORY[0x24BE84AF8] == 0);
              if (os_log_type_enabled(v32, v33))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v29;
                _os_log_impl(&dword_2279CC000, v32, v33, "De-dupped app with bundle id: %@", buf, 0xCu);
              }

              objc_msgSend(v62, "addObject:", v28);
              v16 = v16 + 1.0;
            }

          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
        }
        while (v25);
      }

      objc_msgSend(v61, "removeResultsInArray:", v62);
      objc_msgSend(v61, "removeResultsInArray:", v21);
      objc_msgSend(v61, "setHiddenExtResults:", v62);

LABEL_35:
      if (objc_msgSend(v61, "domain") != 1)
        objc_msgSend(v61, "setDomain:", 2);
    }
    v59 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  }
  while (v59);
LABEL_41:

  *(float *)&v34 = v16;
  -[PRSRankingConfiguration setNumAppsDeduped:](self->_rankingInfo, "setNumAppsDeduped:", v34);
  if (self->_canceled)
    v35 = "finish_canceled";
  else
    v35 = "finished";
  query_analytics_log_timing(WeakRetained, v35, "parsec", self->_startTime);
  if (!self->_canceled)
  {
    SPLogForSPLogCategoryDefault();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (id)objc_opt_class();
      v39 = qos_class_self();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v38;
      v76 = 1024;
      LODWORD(v77) = v39;
      _os_log_impl(&dword_2279CC000, v36, v37, "QOS %@ finished: %d", buf, 0x12u);

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    +[SPQueryTask queryQueue](SPQueryTask, "queryQueue");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = qos_class_self();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __25__SPParsecQuery_finished__block_invoke;
    block[3] = &unk_24F01B378;
    objc_copyWeak(&v66, (id *)buf);
    v65 = WeakRetained;
    v42 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v41, 0, block);
    dispatch_async(v40, v42);

    objc_destroyWeak(&v66);
    objc_destroyWeak((id *)buf);
  }
  SPLogForSPLogCategoryDefault();
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v43, v44))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2279CC000, v43, v44, "#query parsec done", buf, 2u);
  }

  SPLogForSPLogCategoryDefault();
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v45, v46))
  {
    objc_msgSend(WeakRetained, "query");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "queryContext");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "searchString");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v55), "valueForKey:", CFSTR("title"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v49;
    v76 = 2112;
    v77 = v50;
    _os_log_impl(&dword_2279CC000, v45, v46, "Parsec query: %@ returned results: %@", buf, 0x16u);

  }
  pthread_mutex_lock(&self->_parsecQueryTaskMutex);
  parsecQueryTask = self->_parsecQueryTask;
  if (parsecQueryTask)
  {
    -[PRSQueryTask invalidateHandler](parsecQueryTask, "invalidateHandler");
    v52 = self;
    v53 = self->_parsecQueryTask;
  }
  else
  {
    v53 = 0;
    v52 = self;
  }
  v52->_parsecQueryTask = 0;

  pthread_mutex_unlock(&self->_parsecQueryTaskMutex);
  objc_storeWeak((id *)&self->_resultPipe, 0);
  do
    v54 = __ldaxr(&sOutstandingQueries);
  while (__stlxr(v54 - 1, &sOutstandingQueries));
}

void __25__SPParsecQuery_finished__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  uint8_t v10[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0260]), "initWithQueryID:sections:", objc_msgSend(WeakRetained, "queryGroupId"), WeakRetained[48]);
    objc_msgSend(WeakRetained, "responseHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v3);

    SPLogForSPLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, v5, v6, "#query parsec sending results", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "externalID");
    kdebug_trace();
    SPLogForSPLogCategoryTelemetry();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "externalID");
    if (v8)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)v10 = 0;
        _os_signpost_emit_with_name_impl(&dword_2279CC000, v7, OS_SIGNPOST_INTERVAL_END, v9, "parsecLatency", " enableTelemetry=YES ", v10, 2u);
      }
    }

  }
}

- (void)queryDidFinishLoading:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t spanid;
  uint64_t v9;
  NSObject *queue;
  id v11;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v4 = a3;
  v5 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v6 = *(_OWORD *)(v5 + 16);
  v17 = *(_OWORD *)v5;
  v18 = v6;
  v19 = *(_QWORD *)(v5 + 32);
  v7 = *(_QWORD *)v5;
  spanid = si_tracing_calc_next_spanid();
  v9 = *(_QWORD *)(v5 + 8);
  *(_QWORD *)v5 = v7;
  *(_QWORD *)(v5 + 8) = spanid;
  *(_QWORD *)(v5 + 16) = v9;
  *(_BYTE *)(v5 + 28) = 102;
  *(_QWORD *)(v5 + 32) = "-[SPParsecQuery queryDidFinishLoading:]";
  si_tracing_log_span_begin();
  location = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __39__SPParsecQuery_queryDidFinishLoading___block_invoke;
  v13[3] = &unk_24F01BB38;
  objc_copyWeak(&v15, &location);
  v13[4] = self;
  v14 = v4;
  v11 = v4;
  dispatch_async(queue, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  si_tracing_log_span_end();

  v12 = v18;
  *(_OWORD *)v5 = v17;
  *(_OWORD *)(v5 + 16) = v12;
  *(_QWORD *)(v5 + 32) = v19;
}

void __39__SPParsecQuery_queryDidFinishLoading___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && !WeakRetained[265])
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 200));
    v4 = *(void **)(a1 + 40);
    if (v4 == (void *)v3[47])
    {
      objc_msgSend(v4, "category_stats");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v3[35];
      v3[35] = v5;

      objc_msgSend(*(id *)(a1 + 40), "server_features");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v3[36];
      v3[36] = v7;

      *((_BYTE *)v3 + 267) = 1;
      PRSLogCategoryDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __39__SPParsecQuery_queryDidFinishLoading___block_invoke_cold_1(v9);

    }
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 200));
    if (*((_BYTE *)v3 + 267))
    {
      +[SPQueryTask queryQueue](SPQueryTask, "queryQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __39__SPParsecQuery_queryDidFinishLoading___block_invoke_72;
      v11[3] = &unk_24F01BB60;
      v11[4] = *(_QWORD *)(a1 + 32);
      v12 = v3;
      dispatch_async(v10, v11);

    }
  }

}

void __39__SPParsecQuery_queryDidFinishLoading___block_invoke_72(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "resultPipe");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeWillComplete:", *(_QWORD *)(a1 + 40));

}

- (void)_setScore:(SPParsecQuery *)self forResult:(SEL)a2
{
  void *v2;

  objc_msgSend(v2, "setScore:");
}

- (void)geoUserSessionEntityString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPParsecQuery resultPipe](self, "resultPipe");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGeoUserSessionEntityString:", v4);

}

- (id)findLocalCopies:(id)a3 alternativeResults:(id)a4 withQueryString:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSSet *disabledAppSet;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  NSSet *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v45;
  id v46;
  void *v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v45 = v9;
    v47 = v8;
    v52 = (void *)objc_opt_new();
    v54 = (void *)objc_opt_new();
    v53 = objc_opt_new();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v46 = v7;
    obj = v7;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (!v50)
      goto LABEL_24;
    v49 = *(_QWORD *)v65;
    v10 = *MEMORY[0x24BEB0418];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v65 != v49)
          objc_enumerationMutation(obj);
        v51 = v11;
        v12 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v11);
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        objc_msgSend(v12, "results");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v61 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
              objc_msgSend(v18, "sectionBundleIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v19, "isEqualToString:", v10) & 1) != 0)
              {
                disabledAppSet = self->_disabledAppSet;
                objc_msgSend(v18, "applicationBundleIdentifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(disabledAppSet) = -[NSSet containsObject:](disabledAppSet, "containsObject:", v21);

                if ((disabledAppSet & 1) == 0)
                {
                  objc_msgSend(v18, "title");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "text");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "addObject:", v23);

                  objc_msgSend(v18, "applicationBundleIdentifier");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = (void *)v53;
LABEL_19:
                  objc_msgSend(v25, "addObject:", v24);

                  continue;
                }
              }
              else
              {

              }
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v18, "storeIdentifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (v26)
                {
                  objc_msgSend(v18, "storeIdentifier");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = v52;
                  goto LABEL_19;
                }
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
          }
          while (v15);
        }

        ++v11;
      }
      while (v51 + 1 != v50);
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v50);
LABEL_24:

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v27 = v47;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v57;
      v31 = *MEMORY[0x24BEB0418];
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v57 != v30)
            objc_enumerationMutation(v27);
          v33 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          objc_msgSend(v33, "sectionBundleIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v34, "isEqualToString:", v31) & 1) != 0)
          {
            v35 = self->_disabledAppSet;
            objc_msgSend(v33, "applicationBundleIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v35) = -[NSSet containsObject:](v35, "containsObject:", v36);

            if ((v35 & 1) == 0)
            {
              objc_msgSend(v33, "title");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "text");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "addObject:", v38);

              objc_msgSend(v33, "applicationBundleIdentifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = (void *)v53;
LABEL_36:
              objc_msgSend(v40, "addObject:", v39);

              continue;
            }
          }
          else
          {

          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v33, "storeIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
            {
              objc_msgSend(v33, "storeIdentifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v52;
              goto LABEL_36;
            }
          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      }
      while (v29);
    }

    if (objc_msgSend(v52, "count") || objc_msgSend(v54, "count"))
    {
      v42 = (void *)v53;
      v9 = v45;
      -[SPParsecQuery findLocalCopies:appIdentifiers:adamIDs:alternativeResults:withQueryString:](self, "findLocalCopies:appIdentifiers:adamIDs:alternativeResults:withQueryString:", v54, v53, v52, v27, v45);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v46;
    }
    else
    {
      v43 = 0;
      v9 = v45;
      v7 = v46;
      v42 = (void *)v53;
    }

    v8 = v47;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (id)findLocalCopies:(id)a3 appIdentifiers:(id)a4 adamIDs:(id)a5 alternativeResults:(id)a6 withQueryString:(id)a7
{
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  id v48;
  void *v49;
  CFAbsoluteTime Current;
  uint64_t i;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  dispatch_time_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  NSObject *v68;
  os_log_type_t v69;
  id v70;
  uint64_t v71;
  id WeakRetained;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  BOOL v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  dispatch_group_t group;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  __CFString *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  unint64_t v116;
  void *v117;
  id v118;
  id obj;
  id obja;
  id v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD v130[4];
  id v131;
  id v132;
  _QWORD v133[4];
  id v134;
  id v135;
  _QWORD v136[4];
  id v137;
  _QWORD *v138;
  id v139;
  _QWORD v140[4];
  dispatch_group_t v141;
  id v142;
  _QWORD *v143;
  _QWORD *v144;
  _QWORD v145[4];
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  NSObject *v152;
  _QWORD *v153;
  CFAbsoluteTime v154;
  _QWORD v155[3];
  char v156;
  _QWORD v157[4];
  id v158;
  id v159;
  _QWORD *v160;
  uint64_t v161;
  _QWORD v162[3];
  char v163;
  _QWORD v164[3];
  char v165;
  _QWORD v166[3];
  _QWORD v167[3];
  _BYTE location[12];
  _BYTE v169[128];
  uint64_t v170;
  _QWORD v171[3];

  v171[1] = *MEMORY[0x24BDAC8D0];
  v108 = a3;
  v124 = a4;
  v11 = a5;
  v96 = a6;
  v122 = a7;
  obj = (id)objc_opt_new();
  v95 = v11;
  _makeQueryStringForField(CFSTR("kMDItemAdamID"), v11);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  _makeQueryStringForField(CFSTR("kMDItemDisplayName"), v108);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  _makeQueryStringForField(CFSTR("kMDItemAlternateNames"), v108);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (v105 && v104)
  {
    objc_msgSend(&stru_24F01C208, "stringByAppendingFormat:", CFSTR("(%@) || (%@)"), v105, v104);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v106)
    {
      v14 = v12;
      goto LABEL_8;
    }
    -[__CFString stringByAppendingString:](v12, "stringByAppendingString:", CFSTR(" || "));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v14 = &stru_24F01C208;
  if (v106)
  {
LABEL_6:
    v15 = v14;
    -[__CFString stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR("(%@)"), v106);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:
  if (-[__CFString length](v14, "length"))
  {
    v107 = v14;
  }
  else
  {

    v107 = CFSTR("false");
  }
  -[SPParsecQuery resultPipe](self, "resultPipe");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "query");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");

  v18 = objc_alloc(MEMORY[0x24BEB0238]);
  objc_msgSend(v109, "query");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "queryContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "keyboardLanguage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "query");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "queryContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -v17;
  objc_msgSend(v23, "currentTime");
  v103 = (void *)objc_msgSend(v18, "initWithSearchString:queryID:language:currentTime:", v122, v24, v21);

  objc_msgSend(v109, "query");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "queryContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "queryKind");
  objc_msgSend(v109, "query");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "queryContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "keyboardLanguage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v89) = 0;
  objc_msgSend(v103, "rankingConfigurationWithMeContact:emailAddresses:phoneFavorites:vipList:clientBundle:isScopedSearch:spotlightQuery:userQuery:tokenString:queryKind:isPeopleSearch:keyboardLanguage:", 0, 0, 0, 0, *MEMORY[0x24BEB04C0], 0, v107, v122, 0, v27, v89, v30);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  v110 = objc_alloc_init(MEMORY[0x24BDC2468]);
  objc_msgSend(v110, "setQueryID:", v24);
  v171[0] = *MEMORY[0x24BDD0CE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v171, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setProtectionClasses:", v31);

  objc_msgSend(v110, "setEntitledAttributes:", 1);
  rankingPrefetchedAttributesArray();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setFetchAttributes:", v32);

  objc_msgSend(v112, "rankingQueries");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setRankingQueries:", v33);

  v123 = *MEMORY[0x24BE849A8];
  v170 = *MEMORY[0x24BE849A8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v170, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setBundleIDs:", v34);

  objc_msgSend(v110, "setPriorityIndexQuery:", 1);
  objc_msgSend(v109, "query");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "queryContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "currentTime");
  v38 = v37;

  if (findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__onceToken != -1)
    dispatch_once(&findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__onceToken, &__block_literal_global_8);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 66307, 0, 256);
  objc_msgSend(v110, "fetchAttributes");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v111, "count");
  objc_msgSend(v109, "query");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "queryContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "currentTime");
  v43 = v42;

  v164[0] = 0;
  v164[1] = v164;
  v164[2] = 0x2020000000;
  v165 = 0;
  v162[0] = 0;
  v162[1] = v162;
  v162[2] = 0x2020000000;
  v163 = 0;
  v44 = (void *)-[NSSet copy](self->_disabledAppSet, "copy");
  v45 = MEMORY[0x24BDAC760];
  v157[0] = MEMORY[0x24BDAC760];
  v157[1] = 3221225472;
  v157[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2;
  v157[3] = &unk_24F01BCD0;
  v118 = v44;
  v158 = v118;
  v161 = v43;
  v46 = v39;
  v159 = v46;
  v160 = v162;
  v99 = (void *)MEMORY[0x22E2A214C](v157);
  v47 = dispatch_group_create();
  dispatch_group_enter(v47);
  v48 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v49 = (void *)objc_opt_new();
  Current = CFAbsoluteTimeGetCurrent();
  if (v40)
  {
    for (i = 0; i != v40; ++i)
    {
      objc_msgSend(v112, "requiredAttributes");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "objectAtIndexedSubscript:", i);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "containsObject:", v53);

      if (v54)
        objc_msgSend(v48, "addIndex:", i);
    }
  }
  objc_msgSend(v110, "fetchAttributes");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v155[0] = 0;
  v155[1] = v155;
  v155[2] = 0x2020000000;
  v156 = 0;
  v145[0] = v45;
  v145[1] = 3221225472;
  v145[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3;
  v145[3] = &unk_24F01BD20;
  v92 = v46;
  v146 = v92;
  v94 = v55;
  v147 = v94;
  v93 = v48;
  v148 = v93;
  v90 = v124;
  v149 = v90;
  v91 = obj;
  v150 = v91;
  v101 = v49;
  v151 = v101;
  v153 = v155;
  v56 = v47;
  v152 = v56;
  v154 = Current;
  v140[0] = v45;
  v140[1] = 3221225472;
  v140[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_119;
  v140[3] = &unk_24F01BD48;
  v143 = v162;
  v144 = v155;
  v97 = (id)MEMORY[0x22E2A214C](v145);
  v142 = v97;
  group = v56;
  v141 = group;
  v98 = (void *)MEMORY[0x22E2A214C](v140);
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2460]), "initWithQueryString:queryContext:", v107, v110);
  v113 = v57;
  if (v57)
  {
    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, self);
    v136[0] = v45;
    v136[1] = 3221225472;
    v136[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_122;
    v136[3] = &unk_24F01BD98;
    v138 = v164;
    objc_copyWeak(&v139, (id *)location);
    v137 = v99;
    objc_msgSend(v57, "setFoundItemsHandler:", v136);
    v133[0] = v45;
    v133[1] = 3221225472;
    v133[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_4_124;
    v133[3] = &unk_24F01BDE8;
    objc_copyWeak(&v135, (id *)location);
    v134 = v97;
    objc_msgSend(v57, "setPriorityGatherEndedHandler:", v133);
    v130[0] = v45;
    v130[1] = 3221225472;
    v130[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_6;
    v130[3] = &unk_24F01BE10;
    objc_copyWeak(&v132, (id *)location);
    v131 = v98;
    objc_msgSend(v57, "setCompletionHandler:", v130);
    objc_msgSend(v57, "start");

    objc_destroyWeak(&v132);
    objc_destroyWeak(&v135);

    objc_destroyWeak(&v139);
    objc_destroyWeak((id *)location);
    v58 = group;
  }
  else
  {
    v58 = group;
    dispatch_group_leave(group);
  }
  v59 = dispatch_time(0, 500000000);
  dispatch_group_wait(v58, v59);
  objc_msgSend(v101, "allValues");
  v114 = (id)objc_claimAutoreleasedReturnValue();
  v116 = 0;
LABEL_22:
  if (objc_msgSend(v114, "count") > v116)
  {
    objc_msgSend(v114, "objectAtIndexedSubscript:");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "results");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v60, "copy");

    v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v61, "count"));
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    obja = v61;
    v62 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v126, v169, 16);
    if (!v62)
      goto LABEL_46;
    v125 = *(_QWORD *)v127;
    while (1)
    {
      for (j = 0; j != v62; ++j)
      {
        if (*(_QWORD *)v127 != v125)
          objc_enumerationMutation(obja);
        v64 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
        objc_msgSend(v64, "bundleID");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v65, "isEqualToString:", v123) & 1) != 0)
        {
          objc_msgSend(v64, "identifier");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v118, "containsObject:", v66);

          if (v67)
          {
            SPLogForSPLogCategoryDefault();
            v68 = objc_claimAutoreleasedReturnValue();
            v69 = 2 * (*MEMORY[0x24BE84AF8] == 0);
            if (os_log_type_enabled(v68, v69))
            {
              objc_msgSend(v64, "identifier");
              v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v71 = objc_msgSend(v70, "UTF8String");
              *(_DWORD *)location = 136315138;
              *(_QWORD *)&location[4] = v71;
              _os_log_impl(&dword_2279CC000, v68, v69, "[ProtectedApps] skipping local copy for disabled app %s", location, 0xCu);

            }
            goto LABEL_44;
          }
        }
        else
        {

        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
        objc_msgSend(WeakRetained, "query");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "queryContext");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "resultWithTime:searchString:isCorrectedQuery:withQueryContext:", v122, 0, v74, v38);
        v68 = objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          -[NSObject setType:](v68, "setType:", 26);
          objc_msgSend(v64, "rankingItem");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "L2FeatureVector");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          if (v64)
            v77 = v76 == 0;
          else
            v77 = 1;
          v78 = !v77;

          if (v78)
          {
            v166[0] = CFSTR("score");
            v79 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v75, "score");
            objc_msgSend(v79, "numberWithFloat:");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v167[0] = v80;
            v166[1] = CFSTR("raw score");
            v81 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v75, "rawScore");
            objc_msgSend(v81, "numberWithFloat:");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            v167[1] = v82;
            v166[2] = CFSTR("original score");
            v83 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v75, "L2FeatureVector");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "originalL2Score");
            objc_msgSend(v83, "numberWithFloat:");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v167[2] = v85;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v167, v166, 3);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setLocalFeatures:](v68, "setLocalFeatures:", v86);

          }
          objc_msgSend(v117, "addObject:", v68);
          objc_msgSend(v64, "rankingItem");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "score");
          -[NSObject setL2score:](v68, "setL2score:");

        }
        objc_msgSend(v64, "clearClientData");
LABEL_44:

      }
      v62 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v126, v169, 16);
      if (!v62)
      {
LABEL_46:

        objc_msgSend(v115, "setResults:", v117);
        ++v116;
        v57 = v113;
        goto LABEL_22;
      }
    }
  }

  _Block_object_dispose(v155, 8);
  _Block_object_dispose(v162, 8);
  _Block_object_dispose(v164, 8);

  return v114;
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD0CD0];
  v4[0] = *MEMORY[0x24BDD0CF8];
  v4[1] = v0;
  v1 = *MEMORY[0x24BDD0CE0];
  v4[2] = *MEMORY[0x24BDD0CD8];
  v4[3] = v1;
  v4[4] = *MEMORY[0x24BDD0CE8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__protectionClasses;
  findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__protectionClasses = v2;

}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  unsigned int *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFAllocator *allocator;
  uint64_t v25;
  uint64_t v26;
  id obj;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a2;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v31;
    v5 = *MEMORY[0x24BE849A8];
    v28 = *MEMORY[0x24BDC1AE8];
    allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v26 = *MEMORY[0x24BE849A8];
    do
    {
      v6 = 0;
      v25 = v3;
      do
      {
        if (*(_QWORD *)v31 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
        objc_msgSend(v7, "bundleID", allocator);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", v5) & 1) != 0)
        {
          v9 = *(void **)(a1 + 32);
          objc_msgSend(v7, "uniqueIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10);

          if ((v9 & 1) != 0)
            goto LABEL_22;
        }
        else
        {

        }
        objc_msgSend(v7, "attributeSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "attributeDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v28);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = (const void *)objc_msgSend(v13, "UTF8String");

        if (v14)
        {
          objc_msgSend(v7, "attributeSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "expirationDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16 || (objc_msgSend(v16, "timeIntervalSinceReferenceDate"), v17 >= *(double *)(a1 + 56)))
          {
            v18 = v4;
            v19 = SPResultValueItemCreate2(v7);
            os_unfair_lock_lock((os_unfair_lock_t)&findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__heapLock);
            v20 = NSMapGet(*(NSMapTable **)(a1 + 40), v14);
            if (!v20)
            {
              v20 = CFBinaryHeapCreate(allocator, 0, &sResultArrayBinaryHeapCallbacks, 0);
              NSMapInsert(*(NSMapTable **)(a1 + 40), v14, v20);
              CFRelease(v20);
            }
            v21 = (void *)findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__protectionClasses;
            if (!findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__protectionClasses)
              __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_cold_1();
            objc_msgSend(v7, "protection");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v21, "containsObject:", v22) & 1) == 0)
            {
              objc_msgSend(v7, "protection");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v23, "isEqualToString:", CFSTR("Priority")) & 1) == 0)
                __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_cold_2();

            }
            CFBinaryHeapAddValue((CFBinaryHeapRef)v20, v19);
            sprvreleaseCallback(0, (uint64_t)v19);
            os_unfair_lock_unlock((os_unfair_lock_t)&findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString__heapLock);
            v4 = v18;
            v3 = v25;
          }

          v5 = v26;
        }

LABEL_22:
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v3);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  CFIndex Count;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  SPSearchCSResult *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  BOOL v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  CFIndex v51;
  int v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  const void **v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  void *v71;
  __CFBinaryHeap *v72;
  NSMapEnumerator v73;
  uint8_t buf[4];
  double v75;
  _BYTE v76[128];
  uint64_t v77;

  v1 = a1;
  v77 = *MEMORY[0x24BDAC8D0];
  memset(&v73, 0, sizeof(v73));
  NSEnumerateMapTable(&v73, *(NSMapTable **)(a1 + 32));
  v71 = 0;
  v72 = 0;
  if (NSNextMapEnumeratorPair(&v73, &v71, (void **)&v72))
  {
    v52 = 0;
    v2 = *MEMORY[0x24BDC1B90];
    v54 = *MEMORY[0x24BDC1B90];
    v55 = v1;
    while (1)
    {
      Count = CFBinaryHeapGetCount(v72);
      v4 = objc_alloc(MEMORY[0x24BDD17C8]);
      v5 = (id)objc_msgSend(v4, "initWithCString:encoding:", v71, 4);
      v48 = (uint64_t)&v48;
      bzero((char *)&v48 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0), 8 * Count);
      v56 = (const void **)((char *)&v48 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
      CFBinaryHeapGetValues(v72, v56);
      v6 = SPL1Threshold();
      v49 = v7;
      v50 = v6;
      if (Count >= 1)
        break;
LABEL_36:

      if (!NSNextMapEnumeratorPair(&v73, &v71, (void **)&v72))
        goto LABEL_39;
    }
    v8 = 0;
    v51 = Count;
    v53 = v5;
    while (1)
    {
      v9 = v1;
      v10 = v56[v8];
      v11 = *((_QWORD *)v10 + 3);
      v58 = *((_QWORD *)v10 + 2);
      v59 = v11;
      v12 = *((id *)v10 + 4);
      v61 = *((id *)v10 + 8);
      objc_msgSend(v61, "attributeSet");
      v60 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "attributeDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v2);
      v14 = v2;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v62 = v15;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      v23 = v61;
      v2 = v14;
      v1 = v9;
LABEL_35:

      if (++v8 == Count)
        goto LABEL_36;
    }
    v57 = v12;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    objc_msgSend(*(id *)(v9 + 40), "objectsAtIndexes:", *(_QWORD *)(v9 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v68 != v20)
            objc_enumerationMutation(v16);
          objc_msgSend(v13, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
            ++v19;
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      }
      while (v18);
    }

    v24 = SSCompactRankingAttrsAlloc();
    v1 = v55;
    v25 = *(void **)(v55 + 48);
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_4;
    v63[3] = &unk_24F01BCF8;
    v64 = v13;
    v65 = *(id *)(v1 + 40);
    v66 = v24;
    objc_msgSend(v25, "enumerateIndexesUsingBlock:", v63);
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0228]), "initWithAttrs:isServerAlternativeResult:", v24, 1);
    v5 = v53;
    v27 = objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.application"));
    v2 = v54;
    if (v27)
    {
      v28 = *(void **)(v1 + 56);
      objc_msgSend(v26, "identifier");
      v29 = (SPSearchCSResult *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v28, "containsObject:", v29))
      {
        v12 = v57;
LABEL_33:
        v23 = v61;

        goto LABEL_34;
      }
      v30 = *(void **)(v1 + 64);
      objc_msgSend(v26, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v30) = objc_msgSend(v30, "containsObject:", v31);

      if ((v30 & 1) != 0)
      {
        v5 = v53;
        v12 = v57;
        v23 = v61;
LABEL_34:

        Count = v51;
        goto LABEL_35;
      }
      v32 = *(void **)(v1 + 64);
      objc_msgSend(v26, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v33);

      v5 = v53;
    }
    v29 = -[SPSearchCSResult initWithRankingItem:clientData:]([SPSearchCSResult alloc], "initWithRankingItem:clientData:", v26, v10);
    v34 = v58;
    v35 = v26;
    v36 = v59;
    -[SPSearchResult setScore:](v29, "setScore:", v58, v59);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", *((double *)v10 + 5));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchResult setInterestingDate:](v29, "setInterestingDate:", v37);

    -[SPSearchResult setBundleID:](v29, "setBundleID:", v5);
    v12 = v57;
    -[SPSearchResult setDataclass:](v29, "setDataclass:", v57);
    v38 = __PAIR128__(v36, v34) >= __PAIR128__(v49, v50);
    v26 = v35;
    if (!v38)
      objc_msgSend(v35, "setEligibleForDemotion:", 1);
    v39 = objc_msgSend(v62, "hasPrefix:", CFSTR("com.apple.siri."));
    v1 = v55;
    if (v39)
    {
      -[SPSearchResult rankingItem](v29, "rankingItem");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "L2FeatureVector");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setIsSiriAction:", 1);

      v12 = v57;
    }
    objc_msgSend(*(id *)(v1 + 72), "objectForKey:", v5);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v54;
    if (!v42)
    {
      v42 = (void *)objc_opt_new();
      objc_msgSend(v42, "setDomain:", 1);
      objc_msgSend(v42, "setBundleIdentifier:", v5);
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.application")))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("DOMAIN_APPLICATION"), &stru_24F01C208, CFSTR("Search"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setTitle:", v44);

        v5 = v53;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE84938], "displayNameForBundleIdentifer:", v5);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setTitle:", v43);
      }

      objc_msgSend(*(id *)(v1 + 72), "setObject:forKey:", v42, v5);
      v12 = v57;
    }
    objc_msgSend(v42, "addResults:", v29);
    ++v52;

    goto LABEL_33;
  }
  v52 = 0;
LABEL_39:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 88) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(v1 + 80));
  v45 = CFAbsoluteTimeGetCurrent() - *(double *)(v1 + 96);
  SPLogForSPLogCategoryDefault();
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v45 * 1000000000.0 <= 500000000.0)
  {
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v75 = v45;
      _os_log_impl(&dword_2279CC000, v47, OS_LOG_TYPE_DEFAULT, "Local copy query took %lf seconds", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3_cold_1(v52, v47, v45);
  }

}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    SSCompactRankingAttrsInsertValue();
    v4 = v5;
  }

}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_119(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && !v3
    && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = 0;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v4 = v3;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    v3 = v4;
  }

}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_122(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[42];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3_123;
    v7[3] = &unk_24F01BD70;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3_123(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_4_124(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[42];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_5;
    block[3] = &unk_24F01BDC0;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);

  }
}

uint64_t __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[42];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_7;
    v7[3] = &unk_24F01BD70;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)query:(id)a3 didFinishWithResults:(id)a4 withSuggestions:(id)a5 withCorrections:(id)a6 withAlternativeResults:(id)a7 suggestionsAreBlended:(BOOL)a8
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSSet *disabledAppSet;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  _BOOL4 v40;
  uint64_t v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t n;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t ii;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  BOOL v79;
  void *v80;
  void *v81;
  id WeakRetained;
  NSObject *v83;
  os_log_type_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *queue;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  id v106;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  id v113;
  id v114;
  id *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id obj;
  id obja;
  uint64_t v129;
  id v130;
  uint64_t v131;
  void *v132;
  id v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  void *i;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  _QWORD v154[4];
  id v155;
  id v156;
  id v157;
  id v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  _QWORD block[5];
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  uint64_t *v184;
  id v185[3];
  char v186;
  id location;
  uint64_t v188;
  uint64_t *v189;
  uint64_t v190;
  uint64_t (*v191)(uint64_t, uint64_t);
  void (*v192)(uint64_t);
  id v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  _QWORD v198[4];
  id v199;
  id v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  uint8_t buf[4];
  id v210;
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  uint64_t v218;

  v218 = *MEMORY[0x24BDAC8D0];
  v108 = a3;
  v12 = a4;
  v116 = a5;
  v114 = a6;
  v110 = a7;
  v112 = objc_msgSend(v12, "count");
  v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v112);
  v149 = (void *)objc_opt_new();
  v146 = (void *)objc_opt_new();
  v143 = (void *)objc_opt_new();
  v205 = 0u;
  v206 = 0u;
  v207 = 0u;
  v208 = 0u;
  obj = v12;
  v133 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v205, v217, 16);
  if (v133)
  {
    v131 = *(_QWORD *)v206;
    v129 = *MEMORY[0x24BEB0700];
    v125 = *MEMORY[0x24BEB0668];
    v123 = *MEMORY[0x24BEB0670];
    v121 = *MEMORY[0x24BEB06B0];
    v119 = *MEMORY[0x24BEB06A8];
    v117 = *MEMORY[0x24BEB0678];
    v115 = (id *)*MEMORY[0x24BEB0680];
    v103 = *MEMORY[0x24BEB0690];
    v105 = *MEMORY[0x24BEB0688];
    v135 = *MEMORY[0x24BEB0418];
    do
    {
      for (i = 0; i != v133; i = (char *)i + 1)
      {
        if (*(_QWORD *)v206 != v131)
          objc_enumerationMutation(obj);
        v141 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v141, "bundleIdentifier");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v151, "isEqualToString:", v129) & 1) != 0
          || (objc_msgSend(v151, "isEqualToString:", v125) & 1) != 0
          || (objc_msgSend(v151, "isEqualToString:", v123) & 1) != 0
          || (objc_msgSend(v151, "isEqualToString:", v121) & 1) != 0
          || (objc_msgSend(v151, "isEqualToString:", v119) & 1) != 0
          || (objc_msgSend(v151, "isEqualToString:", v117) & 1) != 0
          || (objc_msgSend(v151, "hasPrefix:", CFSTR("com.apple.parsec.itunes.")) & 1) != 0
          || (objc_msgSend(v151, "isEqualToString:", v115) & 1) != 0
          || (objc_msgSend(v151, "isEqualToString:", v105) & 1) != 0
          || (objc_msgSend(v151, "isEqualToString:", v103) & 1) != 0
          || objc_msgSend(v151, "isEqualToString:", v135))
        {
          objc_msgSend(v137, "setObject:forKey:", v141, v151);
        }
        if (objc_msgSend(v151, "isEqualToString:", v135))
        {
          objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          v203 = 0u;
          v204 = 0u;
          v201 = 0u;
          v202 = 0u;
          objc_msgSend(v141, "results");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v201, v216, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v202;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v202 != v16)
                  objc_enumerationMutation(v14);
                v18 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * j);
                disabledAppSet = self->_disabledAppSet;
                objc_msgSend(v18, "applicationBundleIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(disabledAppSet) = -[NSSet containsObject:](disabledAppSet, "containsObject:", v20);

                if ((_DWORD)disabledAppSet)
                {
                  objc_msgSend(v13, "addIndex:", 0);
                }
                else
                {
                  objc_msgSend(v18, "title");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "text");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v22)
                  {
                    objc_msgSend(v18, "applicationBundleIdentifier");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = v23 == 0;

                    if (!v24)
                    {
                      objc_msgSend(v18, "title");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "text");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v146, "addObject:", v26);

                      objc_msgSend(v18, "applicationBundleIdentifier");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v143, "addObject:", v27);

                    }
                  }
                  else
                  {

                  }
                }
              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v201, v216, 16);
            }
            while (v15);
          }

          if (objc_msgSend(v13, "count"))
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "results");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v198[0] = MEMORY[0x24BDAC760];
            v198[1] = 3221225472;
            v198[2] = __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke;
            v198[3] = &unk_24F01BE38;
            v13 = v13;
            v199 = v13;
            v30 = v28;
            v200 = v30;
            objc_msgSend(v29, "enumerateObjectsUsingBlock:", v198);

            if (objc_msgSend(v30, "count"))
            {
              v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0250]), "initWithResultSection:", v141);
              objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithArray:", v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setResultSet:", v32);

              objc_msgSend(v137, "setObject:forKey:", v31, v135);
            }
            else
            {
              objc_msgSend(v137, "removeObjectForKey:", v135);
            }

          }
        }
        else
        {
          v196 = 0u;
          v197 = 0u;
          v194 = 0u;
          v195 = 0u;
          objc_msgSend(v141, "results");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v194, v215, 16);
          if (v33)
          {
            v34 = *(_QWORD *)v195;
            do
            {
              for (k = 0; k != v33; ++k)
              {
                if (*(_QWORD *)v195 != v34)
                  objc_enumerationMutation(v13);
                v36 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * k);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v36, "storeIdentifier");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = v37 == 0;

                  if (!v38)
                  {
                    objc_msgSend(v36, "storeIdentifier");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v149, "addObject:", v39);

                  }
                }
              }
              v33 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v194, v215, 16);
            }
            while (v33);
          }
        }

      }
      v133 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v205, v217, 16);
    }
    while (v133);
  }

  if (objc_msgSend(v149, "count"))
    v40 = 1;
  else
    v40 = objc_msgSend(v146, "count") != 0;
  v41 = *MEMORY[0x24BEB0418];
  objc_msgSend(v137, "objectForKey:", *MEMORY[0x24BEB0418]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
    v43 = 0;
  else
    v43 = v40;
  if (v43)
  {
    objc_msgSend(MEMORY[0x24BEB0250], "mutableSectionWithBundleId:", v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "setObject:forKey:", v44, v41);

  }
  if (query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended__onceToken != -1)
    dispatch_once(&query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended__onceToken, &__block_literal_global_138);
  v45 = (void *)objc_msgSend(v137, "count");
  objc_msgSend(v137, "allKeys");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v112);
  v188 = 0;
  v189 = &v188;
  v190 = 0x3032000000;
  v191 = __Block_byref_object_copy__0;
  v192 = __Block_byref_object_dispose__0;
  v193 = 0;
  v48 = SSEnableSpotlightTopHitPersonalizedRanking();
  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke_139;
  block[3] = &unk_24F01BE80;
  objc_copyWeak(v185, &location);
  v185[2] = v45;
  v185[1] = (id)1;
  block[4] = self;
  v113 = v46;
  v176 = v113;
  v102 = v137;
  v177 = v102;
  v186 = v48;
  v152 = v108;
  v178 = v152;
  v130 = v47;
  v179 = v130;
  v184 = &v188;
  v106 = v146;
  v180 = v106;
  v109 = v143;
  v181 = v109;
  v104 = v149;
  v182 = v104;
  v111 = v110;
  v183 = v111;
  dispatch_apply((size_t)v45, 0, block);
  v132 = (void *)objc_opt_new();
  v150 = (void *)objc_opt_new();
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v134 = obj;
  v140 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v171, v214, 16);
  if (v140)
  {
    v138 = *(_QWORD *)v172;
    v136 = *MEMORY[0x24BEB06B8];
    v147 = *MEMORY[0x24BEB06A0];
    obja = (id)*MEMORY[0x24BEB0700];
    v126 = *MEMORY[0x24BEB0668];
    v124 = *MEMORY[0x24BEB0670];
    v122 = *MEMORY[0x24BEB06B0];
    v120 = *MEMORY[0x24BEB06A8];
    v118 = *MEMORY[0x24BEB0678];
    v101 = *MEMORY[0x24BEB0680];
    do
    {
      v142 = 0;
      do
      {
        if (*(_QWORD *)v172 != v138)
          objc_enumerationMutation(v134);
        v49 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v142);
        objc_msgSend(v49, "bundleIdentifier");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v144, "isEqualToString:", v136))
        {
          v169 = 0u;
          v170 = 0u;
          v167 = 0u;
          v168 = 0u;
          objc_msgSend(v49, "results");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v167, v213, 16);
          if (v51)
          {
            v52 = *(_QWORD *)v168;
            do
            {
              for (m = 0; m != v51; ++m)
              {
                if (*(_QWORD *)v168 != v52)
                  objc_enumerationMutation(v50);
                v54 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * m);
                v55 = (void *)MEMORY[0x24BEB0318];
                objc_msgSend(v152, "queryContext");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "buildResultWithResult:queryContext:", v54, v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v150, "addObject:", v57);
              }
              v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v167, v213, 16);
            }
            while (v51);
          }
          goto LABEL_94;
        }
        if (objc_msgSend(v144, "isEqualToString:", v147))
        {
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0250]), "initWithResultSection:", v49);
          v58 = (void *)objc_opt_new();
          v165 = 0u;
          v166 = 0u;
          v163 = 0u;
          v164 = 0u;
          objc_msgSend(v49, "results");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v163, v212, 16);
          if (v60)
          {
            v61 = *(_QWORD *)v164;
            do
            {
              for (n = 0; n != v60; ++n)
              {
                if (*(_QWORD *)v164 != v61)
                  objc_enumerationMutation(v59);
                v63 = *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * n);
                v64 = (void *)MEMORY[0x24BEB0318];
                objc_msgSend(v152, "queryContext");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "buildResultWithResult:queryContext:", v63, v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v66, "setSectionBundleIdentifier:", v147);
                objc_msgSend(v58, "addObject:", v66);

              }
              v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v163, v212, 16);
            }
            while (v60);
          }

          objc_msgSend(v50, "setResults:", v58);
          objc_msgSend(v132, "addObject:", v50);

          goto LABEL_94;
        }
        if ((objc_msgSend(v144, "isEqualToString:", obja) & 1) != 0
          || (objc_msgSend(v144, "isEqualToString:", v126) & 1) != 0
          || (objc_msgSend(v144, "isEqualToString:", v124) & 1) != 0
          || (objc_msgSend(v144, "isEqualToString:", v122) & 1) != 0
          || (objc_msgSend(v144, "isEqualToString:", v120) & 1) != 0
          || (objc_msgSend(v144, "isEqualToString:", v118) & 1) != 0
          || (objc_msgSend(v144, "hasPrefix:", CFSTR("com.apple.parsec.itunes.")) & 1) != 0
          || objc_msgSend(v144, "isEqualToString:", v101))
        {
          objc_msgSend(v130, "objectForKey:", v144);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (v50)
            objc_msgSend(v132, "addObject:", v50);
          else
            objc_msgSend(v132, "addObject:", v49);
LABEL_94:

          goto LABEL_95;
        }
        objc_msgSend(v132, "addObject:", v49);
LABEL_95:

        ++v142;
      }
      while (v142 != v140);
      v67 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v171, v214, 16);
      v140 = v67;
    }
    while (v67);
  }

  if (objc_msgSend((id)v189[5], "count"))
  {
    objc_msgSend(v132, "arrayByAddingObjectsFromArray:", v189[5]);
    v68 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v68 = v132;
  }
  v69 = v68;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = (void *)objc_opt_new();
  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  v70 = v69;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v159, v211, 16);
  if (v71)
  {
    v72 = *(_QWORD *)v160;
    do
    {
      for (ii = 0; ii != v71; ++ii)
      {
        if (*(_QWORD *)v160 != v72)
          objc_enumerationMutation(v70);
        v74 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * ii);
        v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0250]), "initWithResultSection:", v74);
        objc_msgSend(v75, "setSource:", 2);
        objc_msgSend(v148, "addObject:", v75);
        objc_msgSend(v74, "bundleIdentifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (v76)
        {
          objc_msgSend(v74, "bundleIdentifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v74, "results");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v77)
            goto LABEL_115;
          objc_msgSend(v74, "results");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v78, "count") == 0;

          if (v79)
          {
            v77 = 0;
            goto LABEL_115;
          }
          objc_msgSend(v74, "results");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "objectAtIndex:", 0);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "sectionBundleIdentifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v77)
        {
          objc_msgSend(v74, "setBundleIdentifier:", v77);
          objc_msgSend(v145, "addObject:", v77);
        }
LABEL_115:

      }
      v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v159, v211, 16);
    }
    while (v71);
  }

  if (!objc_msgSend(v148, "count") && !objc_msgSend(v116, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_resultPipe);
    query_analytics_log_timing(WeakRetained, "finish_zero", "parsec", self->_startTime);

  }
  if (v116)
  {
    SPLogForSPLogCategoryDefault();
    v83 = objc_claimAutoreleasedReturnValue();
    v84 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v83, v84))
    {
      *(_DWORD *)buf = 138412290;
      v210 = v116;
      _os_log_impl(&dword_2279CC000, v83, v84, "Received suggestions: %@", buf, 0xCu);
    }

  }
  -[SPParsecQuery resultPipe](self, "resultPipe");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "query");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "disabledBundles");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v87, "count"))
  {
    v88 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v85, "query");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "disabledBundles");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setWithArray:", v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v91 = 0;
  }

  if (!self->_canceled)
  {
    PRSLogCategoryDefault();
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v152, "category_stats");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPParsecQuery query:didFinishWithResults:withSuggestions:withCorrections:withAlternativeResults:suggestionsAreBlended:].cold.1(v93, (uint64_t)buf, v92);
    }

    objc_msgSend(v152, "category_stats");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPParsecQuery setCategory_stats:](self, "setCategory_stats:", v94);

    objc_msgSend(v152, "server_features");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPParsecQuery setServer_features:](self, "setServer_features:", v95);

  }
  if (objc_msgSend(v145, "count"))
  {
    v96 = (void *)objc_msgSend(v145, "copy");
    -[SPParsecQuery setParsecResultsCategoryOrder:](self, "setParsecResultsCategoryOrder:", v96);

  }
  -[SPParsecQuery setQuerySuggestionResults:](self, "setQuerySuggestionResults:", v150);
  self->_suggestionsAreBlended = a8;
  queue = self->_queue;
  v154[0] = MEMORY[0x24BDAC760];
  v154[1] = 3221225472;
  v154[2] = __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke_147;
  v154[3] = &unk_24F01BEA8;
  objc_copyWeak(&v158, &location);
  v98 = v148;
  v155 = v98;
  v99 = v91;
  v156 = v99;
  v100 = v152;
  v157 = v100;
  dispatch_async(queue, v154);
  objc_msgSend(v85, "addQueryCorrections:", v114);

  objc_destroyWeak(&v158);
  objc_destroyWeak(v185);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v188, 8);

}

void __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3) & 1) != 0)
  {
    SPLogForSPLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v6, v7))
    {
      objc_msgSend(v5, "applicationBundleIdentifier");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = 136315138;
      v10 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_2279CC000, v6, v7, "[ProtectedApps] filtered out app store result for %s", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

void __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke_139(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  uint64_t v37;
  id WeakRetained;
  void *context;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x22E2A1F9C]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 120);
    v6 = v5 * a2;
    v7 = v6 + v5;
    if (v7 >= *(_QWORD *)(a1 + 128))
      v7 = *(_QWORD *)(a1 + 128);
    v42 = v7;
    if (v6 < v7)
    {
      v41 = *MEMORY[0x24BEB0418];
      v37 = *MEMORY[0x24BEB0670];
      *(_QWORD *)&v4 = 138412290;
      v36 = v4;
      do
      {
        v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 368));
        objc_msgSend(v8, "query");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "cancelled");

        if ((v10 & 1) != 0)
          break;
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_BYTE *)(a1 + 136))
          objc_msgSend(MEMORY[0x24BEB02F0], "prepareServerSectionRankingItemsForTopHitNomination:", v12);
        if ((objc_msgSend(v11, "isEqualToString:", v41, v36) & 1) != 0)
        {
          v13 = *(void **)(a1 + 32);
          v14 = *(_QWORD *)(a1 + 72);
          v15 = *(_QWORD *)(a1 + 80);
          v16 = *(_QWORD *)(a1 + 88);
          v17 = *(_QWORD *)(a1 + 96);
          objc_msgSend(*(id *)(a1 + 56), "queryString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "findLocalCopies:appIdentifiers:adamIDs:alternativeResults:withQueryString:", v14, v15, v16, v17, v18);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
          v21 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v19;

        }
        else
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0250]), "initWithResultSection:", v12);
          if (_os_feature_enabled_impl())
          {
            if (objc_msgSend(v11, "isEqualToString:", v37))
            {
              objc_msgSend(*(id *)(a1 + 32), "mapsParsecRanker");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22)
              {
                SPLogForSPLogCategoryDefault();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2279CC000, v23, OS_LOG_TYPE_DEFAULT, "Geo personalization enabled, reranking geo results with local signals", buf, 2u);
                }

                v24 = *(void **)(a1 + 32);
                objc_msgSend(v12, "results");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "rerankMapsResultsWithLocalSignals:forQueryId:", v25, objc_msgSend(*(id *)(a1 + 56), "queryIdent"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setResults:", v26);

              }
            }
          }
          if (*(_BYTE *)(a1 + 136))
          {
            v40 = v12;
            SPLogForSPLogCategoryDefault();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v18, "bundleIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v36;
              v44 = v28;
              _os_log_impl(&dword_2279CC000, v27, OS_LOG_TYPE_DEFAULT, "TopHit nomination for server results based on local engagement and personalization signals. Server section: %@", buf, 0xCu);

            }
            v29 = (void *)MEMORY[0x24BEB02F0];
            objc_msgSend(*(id *)(a1 + 56), "queryString");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "resultPipe");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "query");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "queryContext");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "keyboardLanguage");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "nominateServerTopHitForSection:queryString:language:", v18, v30, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setResults:", v35);

            v12 = v40;
          }
          objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v18, v11);
        }

        ++v6;
      }
      while (v42 != v6);
    }
  }

  objc_autoreleasePoolPop(context);
}

void __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke_147(id *a1)
{
  _BYTE *WeakRetained;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v3 = WeakRetained;
  if (WeakRetained && !WeakRetained[265])
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = a1[4];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v10, "bundleIdentifier", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11 || (objc_msgSend(a1[5], "containsObject:", v11) & 1) == 0)
            objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    if (a1[6] == *((id *)v3 + 47))
    {
      PRSLogCategoryDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke_147_cold_1(v4, v12);

      objc_msgSend(a1[6], "feedbackQueryIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)*((_QWORD *)v3 + 37);
      *((_QWORD *)v3 + 37) = v13;

      objc_storeStrong((id *)v3 + 48, v4);
    }
    if (*((_QWORD *)v3 + 48) || !*((_QWORD *)v3 + 47))
      objc_msgSend(v3, "finished", (_QWORD)v15);

  }
}

- (id)rerankMapsResultsWithLocalSignals:(id)a3 forQueryId:(int64_t)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  v6 = a3;
  logForCSLogCategoryPersonalization();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2279CC000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "rerankMapsResultsWithLocalSignals", " enableTelemetry=YES ", buf, 2u);
  }

  -[SPParsecQuery mapsParsecRanker](self, "mapsParsecRanker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rerankMapsResultsWithLocalSignals:forQueryId:", v6, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v10;
  v14 = v13;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_2279CC000, v14, OS_SIGNPOST_INTERVAL_END, v8, "rerankMapsResultsWithLocalSignals", ", v16, 2u);
  }

  return v12;
}

- (SPParsecQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6
{
  SPParsecQuery *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  SDNetworkQualityInquiry *networkConditions;
  uint64_t v13;
  PRSMapsParsecRanker *mapsParsecRanker;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SPParsecQuery;
  v6 = -[SPKQuery initWithUserQuery:queryGroupId:options:queryContext:](&v16, sel_initWithUserQuery_queryGroupId_options_queryContext_, a3, a4, 0, a6);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create(0, v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x24BE84940], "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    networkConditions = v6->_networkConditions;
    v6->_networkConditions = (SDNetworkQualityInquiry *)v11;

    v13 = objc_opt_new();
    mapsParsecRanker = v6->_mapsParsecRanker;
    v6->_mapsParsecRanker = (PRSMapsParsecRanker *)v13;

    -[SPParsecQuery checkParsecState](v6, "checkParsecState");
    pthread_mutex_init(&v6->_parsecQueryTaskMutex, 0);

  }
  return v6;
}

- (void)cancel
{
  NSObject *v3;
  os_log_type_t v4;
  NSObject *queue;
  _QWORD block[4];
  id v7;
  uint8_t buf[8];

  self->_canceled = 1;
  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2279CC000, v3, v4, "#query parsec cancel", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__SPParsecQuery_cancel__block_invoke;
  block[3] = &unk_24F01B3A0;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __23__SPParsecQuery_cancel__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  qos_class_t v8;
  id *v9;
  id v10;
  dispatch_block_t v11;
  unsigned int v12;
  _QWORD v13[4];
  id v14;
  id *v15;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 46);
    query_analytics_log_timing(v3, "cancel", "parsec", (uint64_t)v2[50]);
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 25));
    v4 = v2[47];
    if (v4)
    {
      objc_msgSend(v4, "invalidateHandler");
      v5 = v2[48];
      v2[48] = 0;

      v6 = v2[47];
      v2[47] = 0;

    }
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 25));
    +[SPQueryTask queryQueue](SPQueryTask, "queryQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = qos_class_self();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __23__SPParsecQuery_cancel__block_invoke_2;
    v13[3] = &unk_24F01BB60;
    v14 = v3;
    v9 = v2;
    v15 = v9;
    v10 = v3;
    v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, v13);
    dispatch_async(v7, v11);

    if (!*((_BYTE *)v9 + 266))
    {
      do
        v12 = __ldaxr(&sOutstandingQueries);
      while (__stlxr(v12 - 1, &sOutstandingQueries));
    }

  }
}

void __23__SPParsecQuery_cancel__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cancelled");

  if ((v3 & 1) == 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0260]), "initWithQueryID:sections:", objc_msgSend(*(id *)(a1 + 40), "queryGroupId"), 0);
    objc_msgSend(*(id *)(a1 + 40), "responseHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v4);

  }
  SPLogForSPLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v6, v7))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2279CC000, v6, v7, "#query parsec sending cancel", v8, 2u);
  }

}

- (BOOL)shouldReturnEarly
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPParsecQuery;
  if (-[SPKQuery shouldReturnEarly](&v3, sel_shouldReturnEarly))
    return 1;
  else
    return objc_msgSend((id)objc_opt_class(), "isParsecEnabled") ^ 1;
}

- (BOOL)available
{
  void *v2;
  BOOL v3;

  if (!objc_msgSend((id)objc_opt_class(), "isParsecEnabled"))
    return 0;
  objc_msgSend((id)interface, "searchSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)checkParsecState
{
  void *v2;
  char v3;
  id v4;

  SPGetDisabledDomainSet();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  sParsecEnabled = objc_msgSend(v4, "containsObject:", CFSTR("DOMAIN_PARSEC")) ^ 1;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSpotlightInternetResultsAllowed");

  if ((v3 & 1) == 0)
    sParsecEnabled = 0;

}

- (void)start
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t spanid;
  uint64_t v7;
  __uint64_t v8;
  const char *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  NSObject *v14;
  unsigned int v15;
  __uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  unsigned int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  PRSRankingConfiguration *v27;
  PRSRankingConfiguration *rankingInfo;
  NSSet *setOfVisibleApps;
  NSSet *v30;
  NSSet *v31;
  NSSet *setOfHiddenApps;
  NSSet *v33;
  NSSet *v34;
  void *v35;
  void *v36;
  NSSet *v37;
  NSSet *disabledAppSet;
  void *v39;
  _BOOL4 v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  os_log_type_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  objc_super v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v60.receiver = self;
  v60.super_class = (Class)SPParsecQuery;
  -[SPKQuery start](&v60, sel_start);
  if (!-[SPKQuery sendEmptyResponseIfNecessary](self, "sendEmptyResponseIfNecessary"))
  {
    -[SPKQuery delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v54 = *(_OWORD *)v4;
    v56 = *(_OWORD *)(v4 + 16);
    v58 = *(_QWORD *)(v4 + 32);
    v5 = *(_QWORD *)v4;
    spanid = si_tracing_calc_next_spanid();
    v7 = *(_QWORD *)(v4 + 8);
    *(_QWORD *)v4 = v5;
    *(_QWORD *)(v4 + 8) = spanid;
    *(_QWORD *)(v4 + 16) = v7;
    *(_BYTE *)(v4 + 28) = 102;
    *(_QWORD *)(v4 + 32) = "-[SPParsecQuery start]";
    si_tracing_log_span_begin();
    if ((objc_msgSend(v3, "isPeopleSearch") & 1) != 0 || objc_msgSend(v3, "isScopedAppSearch"))
    {
      if (objc_msgSend(v3, "isPeopleSearch", v54, v56, v58))
      {
        v8 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        v9 = "people";
      }
      else
      {
        v8 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        v9 = "appscoped";
      }
      query_analytics_log_timing(v3, v9, "parsec", v8);
      v10 = objc_alloc(MEMORY[0x24BEB0260]);
      v11 = -[SPKQuery queryGroupId](self, "queryGroupId");
      v12 = (void *)objc_msgSend(v10, "initWithQueryID:sections:", v11, MEMORY[0x24BDBD1A8]);
      -[SPKQuery responseHandler](self, "responseHandler");
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v13)[2](v13, v12);

    }
    objc_msgSend(v3, "externalID", v54, v56, v58);
    kdebug_trace();
    SPLogForSPLogCategoryTelemetry();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v3, "externalID");
    if (v15 && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2279CC000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "parsecLatency", " enableTelemetry=YES ", buf, 2u);
    }

    v16 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    SPLogForSPLogCategoryDefault();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, v17, v18, "#query parsec start", buf, 2u);
    }

    do
      v19 = __ldaxr(&sOutstandingQueries);
    while (__stlxr(v19 + 1, &sOutstandingQueries));
    if (!v19)
      -[SPParsecQuery preheat](self, "preheat");
    objc_msgSend(v3, "query");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "queryContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    PRSLogCategoryDefault();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (id)objc_opt_class();
      objc_msgSend(v21, "searchString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v62 = v23;
      v63 = 2112;
      v64 = v24;
      _os_log_impl(&dword_2279CC000, v22, OS_LOG_TYPE_INFO, "%@ Perform query %@", buf, 0x16u);

    }
    objc_msgSend(v21, "disabledDomains");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "containsObject:", &unk_24F025100);

    if ((v26 & 1) == 0)
    {
      v27 = (PRSRankingConfiguration *)objc_opt_new();
      rankingInfo = self->_rankingInfo;
      self->_rankingInfo = v27;

      setOfVisibleApps = self->_setOfVisibleApps;
      if (setOfVisibleApps)
      {
        v30 = setOfVisibleApps;
      }
      else
      {
        SPCopyVisibleApps();
        v30 = (NSSet *)objc_claimAutoreleasedReturnValue();
      }
      v31 = self->_setOfVisibleApps;
      self->_setOfVisibleApps = v30;

      setOfHiddenApps = self->_setOfHiddenApps;
      if (setOfHiddenApps)
      {
        v33 = setOfHiddenApps;
      }
      else
      {
        SPFastHiddenAppsGetNoBuild();
        v33 = (NSSet *)objc_claimAutoreleasedReturnValue();
      }
      v34 = self->_setOfHiddenApps;
      self->_setOfHiddenApps = v33;

      v35 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v21, "disabledApps");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setWithArray:", v36);
      v37 = (NSSet *)objc_claimAutoreleasedReturnValue();
      disabledAppSet = self->_disabledAppSet;
      self->_disabledAppSet = v37;

      pthread_mutex_lock(&self->_parsecQueryTaskMutex);
      if (sParsecEnabled)
      {
        objc_msgSend((id)interface, "searchSession");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39 == 0;

        if (v40)
        {
          objc_msgSend((id)objc_opt_class(), "activate");
          objc_msgSend((id)interface, "searchSession");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41 == 0;

          if (v42)
            query_analytics_log_timing(v3, "failed", "parsec", v16);
        }
        objc_msgSend(v21, "searchEntities");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "count"))
        {
          objc_msgSend(v21, "searchEntities");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "lastObject");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "currentSearchString");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v21, "searchString");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend((id)interface, "searchSession");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v3, "externalID");
        objc_msgSend(v3, "query");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "queryTaskWithString:externalId:handler:queryContext:queryIdent:", v46, v48, self, v21, objc_msgSend(v49, "queryIdent"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          SPLogForSPLogCategoryDefault();
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = 2 * (*MEMORY[0x24BE84AF8] == 0);
          if (os_log_type_enabled(v51, v52))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2279CC000, v51, v52, "#query parsec start - parsec", buf, 2u);
          }

          objc_msgSend(v50, "setParsecState:", objc_msgSend((id)objc_opt_class(), "isParsecEnabled"));
          objc_msgSend(v50, "setRepresentedObject:", v3);
          objc_storeStrong((id *)&self->_parsecQueryTask, v50);
        }

      }
      pthread_mutex_unlock(&self->_parsecQueryTaskMutex);
    }
    objc_msgSend((id)interface, "searchSession");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "searchRenderTimeout");
    -[SPParsecQuery resumeWithTimeout:](self, "resumeWithTimeout:");

    si_tracing_log_span_end();
    *(_OWORD *)v4 = v55;
    *(_OWORD *)(v4 + 16) = v57;
    *(_QWORD *)(v4 + 32) = v59;

  }
}

- (void)activate
{
  int v3;
  uint64_t v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend((id)objc_opt_class(), "isParsecEnabled");
  v5 = "disabled";
  if (v3)
    v5 = "enabled";
  v6 = 136315138;
  v7 = v5;
  OUTLINED_FUNCTION_0_2(&dword_2279CC000, a2, v4, "activate parsec query (%s)", (uint8_t *)&v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)deactivate
{
  unsigned int v2;

  do
    v2 = __ldaxr(&sOutstandingQueries);
  while (__stlxr(v2 - 1, &sOutstandingQueries));
}

- (void)preheat
{
  void *v2;

  if (objc_msgSend((id)objc_opt_class(), "isParsecEnabled"))
  {
    objc_msgSend((id)interface, "searchSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      objc_msgSend((id)objc_opt_class(), "activate");
  }
}

- (double)computeTimeout:(double)a3
{
  unint64_t quality;
  _BOOL4 withinThreshold;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  const char *v9;
  uint8_t *v10;
  double result;
  __int16 v12;
  __int16 v13;

  quality = self->_quality;
  if ((quality & 0xFFFFFFFFFFFFFFFELL) != 2
    || self->_parsecBeyondTimeoutRequestCount < 4
    || self->_lastKnownQuality != quality)
  {
    goto LABEL_11;
  }
  withinThreshold = self->_withinThreshold;
  SPLogForSPLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  v8 = os_log_type_enabled(v6, v7);
  if (withinThreshold)
  {
    a3 = a3 + 0.05;
    if (v8)
    {
      v13 = 0;
      v9 = "[Parsec] Increased timeout";
      v10 = (uint8_t *)&v13;
LABEL_9:
      _os_log_impl(&dword_2279CC000, v6, v7, v9, v10, 2u);
    }
  }
  else
  {
    a3 = a3 * 0.5;
    if (v8)
    {
      v12 = 0;
      v9 = "[Parsec] Cut down timeout";
      v10 = (uint8_t *)&v12;
      goto LABEL_9;
    }
  }

LABEL_11:
  result = 0.2;
  if (a3 > 0.0)
    return a3;
  return result;
}

- (void)resumeWithTimeout:(double)a3
{
  self->_timeOut = a3;
  self->_queryStartTime = CFAbsoluteTimeGetCurrent();
  pthread_mutex_lock(&self->_parsecQueryTaskMutex);
  -[PRSQueryTask resume](self->_parsecQueryTask, "resume");
  pthread_mutex_unlock(&self->_parsecQueryTaskMutex);
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_parsecQueryTaskMutex);
  v3.receiver = self;
  v3.super_class = (Class)SPParsecQuery;
  -[SPParsecQuery dealloc](&v3, sel_dealloc);
}

- (void)updateParsecBeyondTimeoutCount:(BOOL)a3
{
  ++self->_parsecBeyondTimeoutRequestCount;
  if (a3)
    self->_withinThreshold = 1;
}

- (double)searchTimeOut
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;

  objc_msgSend((id)interface, "searchSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)interface, "searchSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchRenderTimeout");
    v6 = v5;

  }
  else
  {
    v6 = 0.2;
  }

  -[SPParsecQuery computeTimeout:](self, "computeTimeout:", v6);
  return result;
}

- (double)suggestionTimeOut
{
  void *v3;
  double v4;
  double v5;
  double result;

  objc_msgSend((id)interface, "searchSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestionsRenderTimeout");
  v5 = v4;

  -[SPParsecQuery computeTimeout:](self, "computeTimeout:", v5);
  return result;
}

- (double)timeOut:(BOOL)a3
{
  double result;

  if (a3)
    -[SPParsecQuery suggestionTimeOut](self, "suggestionTimeOut");
  else
    -[SPParsecQuery searchTimeOut](self, "searchTimeOut");
  return result;
}

- (SSPlistDataReader)cannedCEPValues
{
  void *v2;
  void *v3;

  objc_msgSend((id)interface, "searchSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cannedCEPValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SSPlistDataReader *)v3;
}

- (SSPlistDataReader)cepDictionary
{
  void *v2;
  void *v3;

  objc_msgSend((id)interface, "searchSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cepDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SSPlistDataReader *)v3;
}

- (NSSet)appBlocklist
{
  void *v2;
  void *v3;

  objc_msgSend((id)interface, "searchSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appBlocklist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setParsecState:(BOOL)a3
{
  void *v3;
  char v4;

  objc_msgSend((id)objc_opt_class(), "parsecEnabled:", a3);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSpotlightInternetResultsAllowed");

  if ((v4 & 1) == 0)
    objc_msgSend((id)objc_opt_class(), "parsecEnabled:", 0);
}

- (PRSMapsParsecRanker)mapsParsecRanker
{
  return self->_mapsParsecRanker;
}

- (NSDictionary)category_stats
{
  return self->_category_stats;
}

- (void)setCategory_stats:(id)a3
{
  objc_storeStrong((id *)&self->_category_stats, a3);
}

- (NSDictionary)server_features
{
  return self->_server_features;
}

- (void)setServer_features:(id)a3
{
  objc_storeStrong((id *)&self->_server_features, a3);
}

- (NSString)fbq
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (NSString)web_fbq
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (NSArray)querySuggestionResults
{
  return self->_querySuggestionResults;
}

- (void)setQuerySuggestionResults:(id)a3
{
  objc_storeStrong((id *)&self->_querySuggestionResults, a3);
}

- (BOOL)suggestionsAreBlended
{
  return self->_suggestionsAreBlended;
}

- (void)setSuggestionsAreBlended:(BOOL)a3
{
  self->_suggestionsAreBlended = a3;
}

- (PRSRankingConfiguration)rankingInfo
{
  return (PRSRankingConfiguration *)objc_getProperty(self, a2, 320, 1);
}

- (void)setRankingInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (__MDSimpleQueryEvaluator)queryEval
{
  return self->_queryEval;
}

- (void)setQueryEval:(__MDSimpleQueryEvaluator *)a3
{
  self->_queryEval = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SDNetworkQualityInquiry)networkConditions
{
  return (SDNetworkQualityInquiry *)objc_getProperty(self, a2, 344, 1);
}

- (void)setNetworkConditions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (unint64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(unint64_t)a3
{
  self->_quality = a3;
}

- (unint64_t)lastKnownQuality
{
  return self->_lastKnownQuality;
}

- (void)setLastKnownQuality:(unint64_t)a3
{
  self->_lastKnownQuality = a3;
}

- (SPFederatedQueryTask)resultPipe
{
  return (SPFederatedQueryTask *)objc_loadWeakRetained((id *)&self->_resultPipe);
}

- (void)setResultPipe:(id)a3
{
  objc_storeWeak((id *)&self->_resultPipe, a3);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (PRSQueryTask)parsecQueryTask
{
  return (PRSQueryTask *)objc_getProperty(self, a2, 376, 1);
}

- (void)setParsecQueryTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSArray)parsecResults
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setParsecResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSArray)parsecResultsCategoryOrder
{
  return (NSArray *)objc_getProperty(self, a2, 392, 1);
}

- (void)setParsecResultsCategoryOrder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (BOOL)parsecLoaded
{
  return self->_parsecLoaded;
}

- (void)setParsecLoaded:(BOOL)a3
{
  self->_parsecLoaded = a3;
}

- (BOOL)webSearchLoaded
{
  return self->_webSearchLoaded;
}

- (void)setWebSearchLoaded:(BOOL)a3
{
  self->_webSearchLoaded = a3;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (NSArray)excludedDomainIdentifiers
{
  return self->_excludedDomainIdentifiers;
}

- (void)setExcludedDomainIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_excludedDomainIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_parsecResultsCategoryOrder, 0);
  objc_storeStrong((id *)&self->_parsecResults, 0);
  objc_storeStrong((id *)&self->_parsecQueryTask, 0);
  objc_destroyWeak((id *)&self->_resultPipe);
  objc_storeStrong((id *)&self->_networkConditions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rankingInfo, 0);
  objc_storeStrong((id *)&self->_querySuggestionResults, 0);
  objc_storeStrong((id *)&self->_web_fbq, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_server_features, 0);
  objc_storeStrong((id *)&self->_category_stats, 0);
  objc_storeStrong((id *)&self->_mapsParsecRanker, 0);
  objc_storeStrong((id *)&self->_rankingPatterns, 0);
  objc_storeStrong((id *)&self->_disabledAppSet, 0);
  objc_storeStrong((id *)&self->_setOfHiddenApps, 0);
  objc_storeStrong((id *)&self->_setOfVisibleApps, 0);
}

+ (void)getFTEStringsWithReply:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2279CC000, log, OS_LOG_TYPE_ERROR, "===^^^ Could not create Parsec Session!", v1, 2u);
}

void __39__SPParsecQuery_queryDidFinishLoading___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2279CC000, log, OS_LOG_TYPE_DEBUG, "Got Parsec load", v1, 2u);
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_cold_1()
{
  __assert_rtn("-[SPParsecQuery findLocalCopies:appIdentifiers:adamIDs:alternativeResults:withQueryString:]_block_invoke_2", "SPParsecQuery.m", 567, "protectionClasses");
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_2_cold_2()
{
  __assert_rtn("-[SPParsecQuery findLocalCopies:appIdentifiers:adamIDs:alternativeResults:withQueryString:]_block_invoke_2", "SPParsecQuery.m", 568, "[protectionClasses containsObject:item.protection] || [item.protection isEqualToString:@\"Priority\"]");
}

void __91__SPParsecQuery_findLocalCopies_appIdentifiers_adamIDs_alternativeResults_withQueryString___block_invoke_3_cold_1(int a1, NSObject *a2, double a3)
{
  _DWORD v3[2];
  __int16 v4;
  double v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109632;
  v3[1] = a1;
  v4 = 2048;
  v5 = a3;
  v6 = 2048;
  v7 = 0x3FE0000000000000;
  _os_log_error_impl(&dword_2279CC000, a2, OS_LOG_TYPE_ERROR, "Local copy query took longer than allowed timeout and missed %d results: took %lf seconds but was allowed %lf", (uint8_t *)v3, 0x1Cu);
}

- (void)query:(NSObject *)a3 didFinishWithResults:withSuggestions:withCorrections:withAlternativeResults:suggestionsAreBlended:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_2279CC000, a3, (uint64_t)a3, "Category stats: %@", (uint8_t *)a2);

}

void __121__SPParsecQuery_query_didFinishWithResults_withSuggestions_withCorrections_withAlternativeResults_suggestionsAreBlended___block_invoke_147_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "valueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_2279CC000, a2, v4, "Got Parsec results: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1_1();
}

@end
