@implementation SPRecommendationQuery

+ (unsigned)searchDomain
{
  return 11;
}

- (void)begin:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  dispatch_semaphore_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  NSObject *v29;
  NSObject *v30;
  unsigned int v31;
  unsigned int v32;
  void *v33;
  NSObject *v34;
  unsigned int v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v43;
  NSObject *v44;
  id v45;
  id v46[6];
  id v47;
  uint8_t v48[8];
  _QWORD v49[4];
  NSObject *v50;
  _QWORD v51[5];
  uint8_t buf[8];
  uint8_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  id v58[2];

  v3 = a3;
  objc_msgSend(v3, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "getTrimmedSearchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create("Query Queue", v9);

  v58[0] = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB01D8]), "initWithLocale:queue:error:", v8, v10, v58);
  v12 = v58[0];
  if (objc_msgSend(v11, "isMusicRecEligible:", v7))
  {
    SSDefaultsGetResources();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("6ee794d6-a63f-11ed-afa1-0242ac120002"));
    objc_msgSend(v13, "logForTrigger:queryID:", v14, objc_msgSend(v5, "queryIdent"));

    LODWORD(v13) = SSShowMusicRec();
    logForCSLogCategoryRecs();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v13)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2279CC000, v15, OS_LOG_TYPE_DEFAULT, "Starting Music recommendation retrieval.", buf, 2u);
      }

      v17 = dispatch_semaphore_create(0);
      *(_QWORD *)buf = 0;
      v53 = buf;
      v54 = 0x3032000000;
      v55 = __Block_byref_object_copy_;
      v56 = __Block_byref_object_dispose_;
      v57 = 0;
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __31__SPRecommendationQuery_begin___block_invoke;
      v51[3] = &unk_24F01BAE8;
      v51[4] = buf;
      objc_msgSend(v11, "setCandidatesHandler:", v51);
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __31__SPRecommendationQuery_begin___block_invoke_59;
      v49[3] = &unk_24F01BB10;
      v18 = v17;
      v50 = v18;
      objc_msgSend(v11, "setCompletionHandler:", v49);
      objc_msgSend(v3, "query");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "retrieveMusicWithQuery:queryID:", v7, objc_msgSend(v19, "queryIdent"));

      logForCSLogCategoryRecs();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[SPRecommendationQuery begin:].cold.2();

      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      logForCSLogCategoryRecs();
      v21 = objc_claimAutoreleasedReturnValue();
      v41 = v12;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v48 = 0;
        _os_log_impl(&dword_2279CC000, v21, OS_LOG_TYPE_DEFAULT, "Music recommendation retrieval ended.", v48, 2u);
      }

      SPLogForSPLogCategoryTelemetry();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v3, "externalID");
      if (v23 && os_signpost_enabled(v22))
      {
        *(_WORD *)v48 = 0;
        _os_signpost_emit_with_name_impl(&dword_2279CC000, v22, OS_SIGNPOST_INTERVAL_END, v23, "recommendationSpotlightLatency", " enableTelemetry=YES ", v48, 2u);
      }

      *(_QWORD *)v48 = 0;
      objc_initWeak((id *)v48, v3);
      v24 = (void *)*((_QWORD *)v53 + 5);
      if (v24 && objc_msgSend(v24, "count"))
      {
        -[SPRecommendationQuery buildSearchResultWithRecommendations:query:](self, "buildSearchResultWithRecommendations:query:", *((_QWORD *)v53 + 5), v3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_opt_new();
        objc_msgSend(v25, "setPinToTop:", 1);
        v26 = v25;
        objc_msgSend(v26, "setMaxInitiallyVisibleResults:", 1);
        objc_msgSend(v26, "setBundleIdentifier:", *MEMORY[0x24BEB0498]);
        objc_msgSend(v26, "setTitle:", CFSTR("Apple Music"));
        objc_msgSend(v26, "setResults:", v40);
        objc_msgSend(v3, "query");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "cancelled");

        if ((v28 & 1) != 0)
        {
          logForCSLogCategoryRecs();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[SPRecommendationQuery begin:].cold.1();

        }
        else
        {
          +[SPQueryTask queryQueue](SPFederatedQueryTask, "queryQueue");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_copyWeak(v46, (id *)v48);
          v45 = v26;
          md_tracing_dispatch_async_propagating();

          objc_destroyWeak(v46);
        }

      }
      else
      {
        +[SPQueryTask queryQueue](SPQueryTask, "queryQueue");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v46[1] = (id)MEMORY[0x24BDAC760];
        v46[2] = (id)3221225472;
        v46[3] = __31__SPRecommendationQuery_begin___block_invoke_62;
        v46[4] = &unk_24F01B378;
        objc_copyWeak(&v47, (id *)v48);
        v46[5] = self;
        md_tracing_dispatch_async_propagating();

        objc_destroyWeak(&v47);
      }
      objc_destroyWeak((id *)v48);

      _Block_object_dispose(buf, 8);
      v12 = v41;
    }
    else
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2279CC000, v15, OS_LOG_TYPE_DEFAULT, "*warn* Music recommendation retrieval disabled from Trial.", buf, 2u);
      }

      SPLogForSPLogCategoryTelemetry();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v3, "externalID");
      if (v35)
      {
        v36 = v35;
        if (os_signpost_enabled(v34))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_2279CC000, v34, OS_SIGNPOST_INTERVAL_END, v36, "recommendationSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
        }
      }

      +[SPQueryTask queryQueue](SPFederatedQueryTask, "queryQueue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v3;
      md_tracing_dispatch_async_propagating();

      v18 = v44;
    }
  }
  else
  {
    SPLogForSPLogCategoryTelemetry();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v3, "externalID");
    if (v31)
    {
      v32 = v31;
      if (os_signpost_enabled(v30))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2279CC000, v30, OS_SIGNPOST_INTERVAL_END, v32, "recommendationSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
      }
    }

    +[SPQueryTask queryQueue](SPFederatedQueryTask, "queryQueue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v3;
    md_tracing_dispatch_async_propagating();

    v18 = v43;
  }

}

void __31__SPRecommendationQuery_begin___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  logForCSLogCategoryRecs();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __31__SPRecommendationQuery_begin___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

intptr_t __31__SPRecommendationQuery_begin___block_invoke_59(uint64_t a1)
{
  NSObject *v2;

  logForCSLogCategoryRecs();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __31__SPRecommendationQuery_begin___block_invoke_59_cold_1();

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __31__SPRecommendationQuery_begin___block_invoke_62(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "storeCompletedSearch:withSections:", *(_QWORD *)(a1 + 32), MEMORY[0x24BDBD1A8]);

}

void __31__SPRecommendationQuery_begin___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "storeCompletedSearch:withSections:", v3, v4);

}

uint64_t __31__SPRecommendationQuery_begin___block_invoke_69(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "storeCompletedSearch:withSections:", *(_QWORD *)(a1 + 40), MEMORY[0x24BDBD1A8]);
}

uint64_t __31__SPRecommendationQuery_begin___block_invoke_70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "storeCompletedSearch:withSections:", *(_QWORD *)(a1 + 40), MEMORY[0x24BDBD1A8]);
}

- (id)buildSearchResultWithRecommendations:(id)a3 query:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  os_signpost_id_t v51;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  void *v62;
  _QWORD v63[3];
  void *v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v57 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v55 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v54 = *MEMORY[0x24BEB0498];
  v58 = v5;
  do
  {
    if (v6 >= objc_msgSend(v5, "count"))
      break;
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v7, "trackId"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "appendString:");
    objc_msgSend(v56, "appendString:", CFSTR(" "));
    v8 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("media:%ld"), objc_msgSend(v7, "trackId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v9);

    v10 = (void *)MEMORY[0x24BE85018];
    objc_msgSend(v7, "trackName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v12);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://music.apple.com/us/album/close-friends/%ld?i=%ld"), objc_msgSend(v7, "collectionId"), objc_msgSend(v7, "trackId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCompletion:", v13);

    v14 = objc_alloc(MEMORY[0x24BDBCF48]);
    objc_msgSend(v8, "completion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithString:", v15);
    objc_msgSend(v8, "setUrl:", v16);

    objc_msgSend(v8, "setStoreIdentifier:", CFSTR("278911476"));
    objc_msgSend(v8, "setSectionBundleIdentifier:", v54);
    objc_msgSend(v8, "setSectionHeader:", CFSTR("Apple Music"));
    objc_msgSend(v8, "setDomainName:", CFSTR("media"));
    objc_msgSend(v8, "setMinimumRankOfTopHitToSuppressResult:", 15);
    objc_msgSend(v8, "setResultType:", CFSTR("media"));
    objc_msgSend(v8, "setResultTemplate:", CFSTR("generic"));
    objc_msgSend(v8, "setType:", 1);
    objc_msgSend(v57, "query");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setQueryId:", objc_msgSend(v17, "queryIdent"));

    v18 = objc_alloc_init(MEMORY[0x24BE84D80]);
    v19 = objc_alloc_init(MEMORY[0x24BE84E08]);
    v65[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v18;
    objc_msgSend(v18, "setCardSections:", v20);

    v21 = objc_alloc_init(MEMORY[0x24BE84F18]);
    objc_msgSend(v19, "setCommand:", v21);
    objc_msgSend(v21, "setCommandDetail:", CFSTR("open_media"));
    v22 = objc_alloc_init(MEMORY[0x24BE84F38]);
    objc_msgSend(v21, "setPunchout:", v22);

    objc_msgSend(v21, "punchout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBundleIdentifier:", CFSTR("com.apple.Music"));

    objc_msgSend(v8, "url");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "punchout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setUrls:", v25);

    objc_msgSend(v19, "setType:", CFSTR("detailed_row"));
    v27 = objc_alloc(MEMORY[0x24BE85030]);
    v28 = objc_alloc(MEMORY[0x24BDBCF48]);
    objc_msgSend(v7, "artworkURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithString:", v29);
    v31 = (void *)objc_msgSend(v27, "initWithURL:", v30);
    objc_msgSend(v19, "setThumbnail:", v31);

    v32 = objc_alloc_init(MEMORY[0x24BE84F78]);
    objc_msgSend(v19, "setTitle:", v32);

    objc_msgSend(v19, "title");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setStarRating:", 0.0);

    objc_msgSend(v19, "title");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setMaxLines:", 2);

    objc_msgSend(v19, "title");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trackName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setText:", v36);

    v37 = objc_alloc_init(MEMORY[0x24BE84F78]);
    objc_msgSend(v7, "artistName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setText:", v38);

    v39 = objc_alloc_init(MEMORY[0x24BE84F78]);
    objc_msgSend(v7, "collectionName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", v40);

    v41 = objc_alloc_init(MEMORY[0x24BE84F78]);
    objc_msgSend(v41, "setMaxLines:", 0);
    if (objc_msgSend(v7, "trackExplicitness"))
      objc_msgSend(v41, "setContentAdvisory:", CFSTR("Explicit"));
    v42 = objc_msgSend(v7, "trackTimeMillis");
    v5 = v58;
    if (v42 >= 1000)
    {
      v43 = v42 / 1000;
      if ((unint64_t)(v42 / 1000) >> 7 <= 0x2A2)
      {
        if (v43 >= 0xE10)
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu:%02lu:%02lu"), v43 / 0xE10, v43 % 0xE10 / 0x3C, v43 % 0x3C);
        else
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu:%02lu"), v43 % 0xE10 / 0x3C, v43 % 0x3C, v53);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_alloc_init(MEMORY[0x24BE84F78]);
        objc_msgSend(v19, "setFootnote:", v45);

        objc_msgSend(v19, "footnote");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setText:", v44);

        objc_msgSend(v19, "footnote");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setMaxLines:", 1);

        v5 = v58;
      }
    }
    v63[0] = v37;
    v63[1] = v39;
    v63[2] = v41;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDescriptions:", v48);

    objc_msgSend(v8, "setInlineCard:", v59);
    objc_msgSend(v55, "addObject:", v8);

    ++v6;
  }
  while (v6 != 3);
  v49 = os_log_create("com.apple.Spotlight", "recs");
  objc_msgSend(v57, "query");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "queryIdent");

  if (v51 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v49))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v56;
    _os_signpost_emit_with_name_impl(&dword_2279CC000, v49, OS_SIGNPOST_EVENT, v51, "SRERenderingResults", "AdamIDs: %@", buf, 0xCu);
  }

  return v55;
}

- (void)start
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  unint64_t v15;
  void (**v16)(_QWORD, _QWORD);
  NSObject *v17;
  unsigned int v18;
  unsigned int v19;
  uint8_t buf[16];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SPRecommendationQuery;
  -[SPKQuery start](&v21, sel_start);
  if (!-[SPKQuery sendEmptyResponseIfNecessary](self, "sendEmptyResponseIfNecessary"))
  {
    -[SPKQuery userQueryString](self, "userQueryString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if (v4)
    {
      -[SPKQuery delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isPeopleSearch") & 1) == 0 && !objc_msgSend(v5, "isScopedAppSearch"))
      {
        objc_msgSend(v5, "query");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "disabledBundles");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.Music"));

        if (!v8)
        {
          if (start_once != -1)
            dispatch_once(&start_once, &__block_literal_global_4);
          SPLogForSPLogCategoryTelemetry();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v5, "externalID");
          if (v18)
          {
            v19 = v18;
            if (os_signpost_enabled(v17))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_2279CC000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "recommendationSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
            }
          }

          v5 = v5;
          md_tracing_dispatch_async_propagating();

          goto LABEL_11;
        }
        logForCSLogCategoryRecs();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2279CC000, v9, OS_LOG_TYPE_DEFAULT, "Music recommendation disabled by settings.", buf, 2u);
        }

      }
      v10 = objc_alloc(MEMORY[0x24BEB0260]);
      v11 = -[SPKQuery queryGroupId](self, "queryGroupId");
      v12 = (void *)objc_msgSend(v10, "initWithQueryID:sections:", v11, MEMORY[0x24BDBD1A8]);
      -[SPKQuery responseHandler](self, "responseHandler");
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v13)[2](v13, v12);

    }
    else
    {
      v14 = objc_alloc(MEMORY[0x24BEB0260]);
      v15 = -[SPKQuery queryGroupId](self, "queryGroupId");
      v5 = (id)objc_msgSend(v14, "initWithQueryID:sections:", v15, MEMORY[0x24BDBD1A8]);
      -[SPKQuery responseHandler](self, "responseHandler");
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v16)[2](v16, v5);

    }
LABEL_11:

  }
}

void __30__SPRecommendationQuery_start__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("Music Queue", 0);
  v1 = (void *)start_recQueue;
  start_recQueue = (uint64_t)v0;

}

uint64_t __30__SPRecommendationQuery_start__block_invoke_113(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "begin:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return 1;
}

- (void)begin:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_2279CC000, v0, OS_LOG_TYPE_ERROR, "Music recommendation result droped due to data store being canceled.", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)begin:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2279CC000, v0, v1, "Waiting for Music recommendation retrieval.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __31__SPRecommendationQuery_begin___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2279CC000, v0, v1, "Music retrieval candidate got.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __31__SPRecommendationQuery_begin___block_invoke_59_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2279CC000, v0, v1, "Music retrieval complete. Before dispatch_semaphore_signal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
