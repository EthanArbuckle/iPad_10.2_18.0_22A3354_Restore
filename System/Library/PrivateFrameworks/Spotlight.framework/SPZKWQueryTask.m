@implementation SPZKWQueryTask

void __34__SPZKWQueryTask_maxSuggestedApps__block_invoke()
{
  void *v0;
  int v1;
  int v2;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "intValue");
  if (v0)
    CFRelease(v0);
  if (v1 == 3)
    v2 = 12;
  else
    v2 = 8;
  maxSuggestedApps_maxSuggestedApps = v2;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE04118], "clientForConsumerType:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)atxClient;
  atxClient = v2;

  objc_msgSend(MEMORY[0x24BEB02F8], "preheat");
}

- (void)start
{
  _QWORD *v3;
  NSObject *v4;
  void (*v5)(void);
  _QWORD *v6;
  uint8_t buf[8];
  _QWORD v8[5];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __23__SPZKWQueryTask_start__block_invoke;
  v8[3] = &unk_24F01BF18;
  v8[4] = self;
  v3 = (_QWORD *)MEMORY[0x22E2A214C](v8, a2);
  kdebug_trace();
  SPLogForSPLogCategoryTelemetry();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2279CC000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "zkwLatency", " enableTelemetry=YES ", buf, 2u);
  }

  -[SPQueryTask queryIdForFeedback](self, "queryIdForFeedback");
  v5 = (void (*)(void))v3[2];
  v6 = v3;
  v5();

}

void __23__SPZKWQueryTask_start__block_invoke_83(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  uint64_t i;
  id obj;
  id obja;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint8_t v85[128];
  uint8_t buf[4];
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v60 = a2;
  v7 = a3;
  v61 = a4;
  v62 = v7;
  objc_msgSend(v7, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = objc_msgSend(*(id *)(a1 + 32), "count");

  if (v9 == v10)
  {
    if (v61)
    {
      SPLogForSPLogCategoryDefault();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __23__SPZKWQueryTask_start__block_invoke_83_cold_1((uint64_t)v61, v11);

    }
    SPLogForSPLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "topics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      objc_msgSend(v62, "results");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      objc_msgSend(v62, "sections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218496;
      v87 = v14;
      v88 = 2048;
      v89 = v16;
      v90 = 2048;
      v91 = objc_msgSend(v17, "count");
      _os_log_impl(&dword_2279CC000, v12, OS_LOG_TYPE_DEFAULT, "zkw parsec response complete: sent %lu topics; got %lu results, %lu sections",
        buf,
        0x20u);

    }
    objc_msgSend(v62, "sections");
    v65 = objc_claimAutoreleasedReturnValue();
    v63 = -[NSObject count](v65, "count");
    v64 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v63)
    {
      for (i = 0; i != v63; ++i)
      {
        objc_msgSend(*(id *)(a1 + 40), "topics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndex:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject objectAtIndexedSubscript:](v65, "objectAtIndexedSubscript:", i);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0250]), "initWithSection:", v67);
        v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        objc_msgSend(v67, "results");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v80;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v80 != v22)
                objc_enumerationMutation(obj);
              v24 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j);
              SPLogForSPLogCategoryDefault();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v26 = objc_opt_class();
                *(_DWORD *)buf = 138412290;
                v87 = v26;
                _os_log_impl(&dword_2279CC000, v25, OS_LOG_TYPE_DEFAULT, "zkw parsec response: result for %@", buf, 0xCu);
              }

              v27 = (void *)MEMORY[0x24BEB02F8];
              objc_msgSend(*(id *)(a1 + 48), "query");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "queryContext");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "updateResult:topic:queryContext:", v24, v19, v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
              {
                objc_msgSend(v20, "addObject:", v30);
              }
              else
              {
                SPLogForSPLogCategoryDefault();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2279CC000, v31, OS_LOG_TYPE_DEFAULT, "zkw result builder: unable to resolve local result", buf, 2u);
                }

              }
            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
          }
          while (v21);
        }

        objc_msgSend(v66, "setResults:", v20);
        objc_msgSend(v64, "addObject:", v66);

      }
    }
    objc_msgSend(*(id *)(a1 + 56), "createSectionsFromServerResults:", v64);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    obja = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v76;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v76 != v33)
            objc_enumerationMutation(obja);
          v35 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
          v36 = (void *)MEMORY[0x24BEB0308];
          objc_msgSend(v35, "bundleIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v36) = objc_msgSend(v36, "isZKWRecentBundle:", v37);

          if ((_DWORD)v36)
          {
            objc_msgSend(MEMORY[0x24BEB0308], "makeClearProactiveCategoryButtonItemWithCategory:shouldClearWholeSection:result:", 1, 1, 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setButton:", v38);

            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("CLEAR"), &stru_24F01C208, CFSTR("SpotlightServices"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "button");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setTitle:", v40);

            objc_msgSend(v35, "button");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setImage:", 0);

          }
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          objc_msgSend(v35, "results");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
          if (v44)
          {
            v45 = *(_QWORD *)v72;
            do
            {
              for (m = 0; m != v44; ++m)
              {
                if (*(_QWORD *)v72 != v45)
                  objc_enumerationMutation(v43);
                v47 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * m);
                objc_msgSend(v47, "setQueryId:", *(_QWORD *)(a1 + 80));
                objc_msgSend(MEMORY[0x24BEB0308], "injectRecentsOptionsIntoResult:", v47);
              }
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
            }
            while (v44);
          }

        }
        v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      }
      while (v32);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "performSelector:", sel_codePathIdTrigger);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
        SSDefaultsLogForTrigger();
    }
    else
    {
      v48 = 0;
    }
    if (objc_msgSend(obja, "count"))
    {
      v58 = *(id *)(a1 + 48);
      objc_sync_enter(v58);
      objc_msgSend(*(id *)(a1 + 48), "mutableSections");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "addObjectsFromArray:", obja);

      objc_sync_exit(v58);
    }

    v50 = v65;
  }
  else
  {
    SPLogForSPLogCategoryDefault();
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      __23__SPZKWQueryTask_start__block_invoke_83_cold_2(v49, v51, v52, v53, v54, v55, v56, v57);
      v50 = v49;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __83__SPZKWQueryTask_addApplicationResultsFromPredictionResponse_toSection_queryIdent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t result;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = a2;
  objc_msgSend(v7, "setQueryId:", v6);
  objc_msgSend(v7, "setSectionBundleIdentifier:", *MEMORY[0x24BE84AE8]);
  objc_msgSend(*(id *)(a1 + 32), "addResults:", v7);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  LODWORD(v6) = *(_DWORD *)(v8 + 24) + 1;
  *(_DWORD *)(v8 + 24) = v6;
  result = objc_msgSend((id)objc_opt_class(), "maxSuggestedApps");
  if ((int)v6 >= (int)result)
    *a4 = 1;
  return result;
}

+ (int)maxSuggestedApps
{
  if (maxSuggestedApps_onceToken != -1)
    dispatch_once(&maxSuggestedApps_onceToken, &__block_literal_global_9);
  return maxSuggestedApps_maxSuggestedApps;
}

- (id)unsafeSessionEntityString
{
  return 0;
}

void __23__SPZKWQueryTask_start__block_invoke_83_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2279CC000, a2, OS_LOG_TYPE_ERROR, "zkw parsec response completed with error: %@", (uint8_t *)&v2, 0xCu);
}

void __23__SPZKWQueryTask_start__block_invoke(uint64_t a1, dispatch_qos_class_t a2, void *a3)
{
  void *v4;
  id v5;
  dispatch_block_t v6;
  NSObject *queue;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "queryProcessor");
  queue = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, a2, 0, v5);

  dispatch_async(queue, v6);
}

- (void)addApplicationResultsFromPredictionResponse:(id)a3 toSection:(id)a4 queryIdent:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SPZKWQueryTask *v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD v16[3];
  int v17;

  v8 = a3;
  v9 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__SPZKWQueryTask_addApplicationResultsFromPredictionResponse_toSection_queryIdent___block_invoke;
  v11[3] = &unk_24F01BED0;
  v15 = a5;
  v10 = v9;
  v13 = self;
  v14 = v16;
  v12 = v10;
  objc_msgSend(v8, "enumerateAtxSearchResults:", v11);

  _Block_object_dispose(v16, 8);
}

void __23__SPZKWQueryTask_start__block_invoke_61(uint64_t a1)
{
  __uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  dispatch_group_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  _BOOL4 v38;
  const char *v39;
  NSObject *v40;
  id v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void (**v50)(_QWORD, _QWORD, _QWORD);
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[5];
  void (**v56)(_QWORD, _QWORD, _QWORD);
  id v57;
  uint64_t v58;
  _QWORD v59[5];
  NSObject *v60;
  id v61;
  _QWORD v62[5];
  uint8_t buf[4];
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v2 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FE0]), "initWithInput:triggerEvent:searchType:indexType:queryId:", &stru_24F01C208, 9, 1, 3, *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x24BE84968], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didStartSearch:", v3);

  objc_msgSend(*(id *)(a1 + 32), "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deviceAuthenticationState");

  if (v7 == 2)
  {
    SPLogForSPLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, v8, OS_LOG_TYPE_DEFAULT, "Skipping app predictions because in biometry lockout", buf, 2u);
    }

    v9 = 0;
    v10 = 0;
  }
  else
  {
    objc_msgSend((id)atxClient, "appPredictionsForConsumerSubType:limit:", 9, objc_msgSend((id)objc_opt_class(), "maxSuggestedApps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v10, "predictedApps");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE84E20]), "initWithStartSearch:", v3);
  objc_msgSend(MEMORY[0x24BE84968], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v12;
  objc_msgSend(v13, "didEndSearch:", v12);

  sp_analytics_log_timing((uint64_t)"com.apple.searchd.query.ZKW", "finish", v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x24BEB0250]);
  v52 = (void *)v14;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DOMAIN_ZKWS"), &stru_24F01C208, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v17);

  objc_msgSend(v15, "setBundleIdentifier:", *MEMORY[0x24BE84AE8]);
  if (v7 == 2
    || (objc_msgSend(v10, "error"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, !v18))
  {
    objc_msgSend(v10, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setResultSetIdentifier:", v20);

    objc_msgSend(*(id *)(a1 + 32), "addApplicationResultsFromPredictionResponse:toSection:queryIdent:", v10, v15, *(_QWORD *)(a1 + 48));
    v21 = objc_msgSend(v9, "count");
    ++_MergedGlobals;
    if (!v21)
    {
      ++dword_253E9386C;
      SPLogForSPLogCategoryDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __23__SPZKWQueryTask_start__block_invoke_61_cold_1(v22);

    }
  }
  v54 = v9;
  v23 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setMutableSections:", v23);

  objc_msgSend(v15, "results");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    objc_msgSend(*(id *)(a1 + 32), "mutableSections");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v15);

    v27 = *(void **)(a1 + 32);
    objc_msgSend(v27, "mutableSections");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "updateResultsThroughDelegate:state:sections:", 0, 2, v28);

  }
  objc_msgSend(*(id *)(a1 + 32), "query");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "queryContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "deviceAuthenticationState");

  v32 = dispatch_group_create();
  v33 = MEMORY[0x24BDAC760];
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __23__SPZKWQueryTask_start__block_invoke_74;
  v62[3] = &unk_24F01B428;
  v62[4] = *(_QWORD *)(a1 + 32);
  v34 = (void *)MEMORY[0x22E2A214C](v62);
  objc_msgSend(v15, "results");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  SPLogForSPLogCategoryDefault();
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
  if (v36)
  {
    if (!v38)
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v39 = "zkw has apps";
  }
  else
  {
    if (!v38)
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v39 = "zkw has no apps";
  }
  _os_log_impl(&dword_2279CC000, v37, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
LABEL_22:

  v59[0] = v33;
  v59[1] = 3221225472;
  v59[2] = __23__SPZKWQueryTask_start__block_invoke_78;
  v59[3] = &unk_24F01BF40;
  v59[4] = *(_QWORD *)(a1 + 32);
  v40 = v32;
  v60 = v40;
  v41 = v34;
  v61 = v41;
  v42 = (void *)MEMORY[0x22E2A214C](v59);
  if (v31)
  {
    SPLogForSPLogCategoryDefault();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "mutableSections");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");
      *(_DWORD *)buf = 134217984;
      v64 = v45;
      _os_log_impl(&dword_2279CC000, v43, OS_LOG_TYPE_DEFAULT, "zkw sending %ld sections", buf, 0xCu);

    }
    v46 = *(void **)(a1 + 32);
    objc_msgSend(v46, "mutableSections");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "updateResultsThroughDelegate:state:sections:", 0, 4, v47);

    kdebug_trace();
    SPLogForSPLogCategoryTelemetry();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v48))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2279CC000, v48, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "zkwLatency", " enableTelemetry=YES ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "queryProcessor");
    v49 = objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v40, v49, v41);

  }
  else
  {
    v55[0] = v33;
    v55[1] = 3221225472;
    v55[2] = __23__SPZKWQueryTask_start__block_invoke_79;
    v55[3] = &unk_24F01BF90;
    v50 = *(void (***)(_QWORD, _QWORD, _QWORD))(a1 + 40);
    v51 = *(_QWORD *)(a1 + 32);
    v58 = *(_QWORD *)(a1 + 48);
    v55[4] = v51;
    v56 = v50;
    v57 = v42;
    ((void (**)(_QWORD, uint64_t, _QWORD *))v50)[2](v56, 25, v55);

  }
}

void __23__SPZKWQueryTask_start__block_invoke_74(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "mutableSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  v19 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
        v8 = (void *)objc_opt_new();
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v7, "results");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v21;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v21 != v11)
                objc_enumerationMutation(v9);
              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F60]), "initWithResult:hiddenResults:duplicateResults:localResultPosition:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12), 0, 0, 0);
              objc_msgSend(v8, "addObject:", v13);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v10);
        }

        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FC8]), "initWithResults:section:localSectionPosition:personalizationScore:", v8, v7, 0, 0.0);
        objc_msgSend(v19, "addObject:", v14);

        ++v6;
      }
      while (v6 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F40]), "initWithSections:blendingDuration:", v19, 0.0);
  objc_msgSend(MEMORY[0x24BE84968], "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "didRankSections:", v15);

}

void __23__SPZKWQueryTask_start__block_invoke_78(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "mutableSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  SPLogForSPLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_2279CC000, v5, OS_LOG_TYPE_DEFAULT, "zkw sending %ld sections", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateResultsThroughDelegate:state:sections:", 0, 4, v4);
  kdebug_trace();
  SPLogForSPLogCategoryTelemetry();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_2279CC000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "zkwLatency", " enableTelemetry=YES ", (uint8_t *)&v9, 2u);
  }

  v7 = *(NSObject **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "queryProcessor");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v7, v8, *(dispatch_block_t *)(a1 + 48));

}

void __23__SPZKWQueryTask_start__block_invoke_79(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE041D8], "suggestedResultResponseWithLimit:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SPLogForSPLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v53 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2279CC000, v4, OS_LOG_TYPE_DEFAULT, "zkw proactive response: %lu topics", buf, 0xCu);
  }

  v50 = 0u;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  objc_msgSend(v2, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "results");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 += objc_msgSend(v11, "count");

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v7);

    if (v8 && objc_msgSend(v3, "count") >= v8)
    {
      objc_msgSend(MEMORY[0x24BE1FA80], "requestWithTopics:triggerEvent:queryId:", v3, 21, *(_QWORD *)(a1 + 56));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SPPARSession spotlightPARSession](SPPARSession, "spotlightPARSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      SPLogForSPLogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "topics");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");
        *(_DWORD *)buf = 134217984;
        v53 = v16;
        _os_log_impl(&dword_2279CC000, v14, OS_LOG_TYPE_DEFAULT, "zkw parsec response: %lu topics", buf, 0xCu);

      }
      if (v12 && v13)
      {
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __23__SPZKWQueryTask_start__block_invoke_83;
        v39[3] = &unk_24F01BF68;
        v40 = v3;
        v17 = v12;
        v18 = *(_QWORD *)(a1 + 32);
        v41 = v17;
        v42 = v18;
        v19 = v2;
        v20 = *(_QWORD *)(a1 + 56);
        v43 = v19;
        v46 = v20;
        v44 = *(id *)(a1 + 40);
        v45 = *(id *)(a1 + 48);
        objc_msgSend(v13, "taskWithRequest:completion:", v17, v39);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "resume");

      }
      else
      {
        if (!v13)
        {
          SPLogForSPLogCategoryDefault();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            __23__SPZKWQueryTask_start__block_invoke_79_cold_3(v23, v24, v25, v26, v27, v28, v29, v30);

        }
        if (!v12)
        {
          SPLogForSPLogCategoryDefault();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            __23__SPZKWQueryTask_start__block_invoke_79_cold_2(v31, v32, v33, v34, v35, v36, v37, v38);

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

      goto LABEL_21;
    }
  }
  else
  {

    v8 = 0;
  }
  SPLogForSPLogCategoryDefault();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    __23__SPZKWQueryTask_start__block_invoke_79_cold_1(v3, v8, v22);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_21:

}

- (id)unsafeSections
{
  void *v2;
  void *v3;

  -[SPQueryTask mutableSections](self, "mutableSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

void __23__SPZKWQueryTask_start__block_invoke_61_cold_1(os_log_t log)
{
  int v1;
  uint64_t v2;
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = 134218496;
  v2 = 0;
  v3 = 1024;
  v4 = _MergedGlobals;
  v5 = 1024;
  v6 = dword_253E9386C;
  _os_log_error_impl(&dword_2279CC000, log, OS_LOG_TYPE_ERROR, "=====^^^^ AppPredictionClient missing data, count -> applications:%lu requests:%d missingAllDataRequests:%d", (uint8_t *)&v1, 0x18u);
}

void __23__SPZKWQueryTask_start__block_invoke_79_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 134218240;
  v6 = objc_msgSend(a1, "count");
  v7 = 2048;
  v8 = a2;
  _os_log_error_impl(&dword_2279CC000, a3, OS_LOG_TYPE_ERROR, "zkw proactive response mismatch: %lu topics, %lu section results", (uint8_t *)&v5, 0x16u);
}

void __23__SPZKWQueryTask_start__block_invoke_79_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2279CC000, a1, a3, "zkw spotlight unable to create request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __23__SPZKWQueryTask_start__block_invoke_79_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2279CC000, a1, a3, "zkw spotlight unable to create session", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __23__SPZKWQueryTask_start__block_invoke_83_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2279CC000, a1, a3, "zkw parsec response completed with error: result count does not match section count", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
