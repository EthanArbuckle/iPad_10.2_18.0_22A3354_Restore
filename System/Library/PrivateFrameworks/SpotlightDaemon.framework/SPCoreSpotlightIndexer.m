@implementation SPCoreSpotlightIndexer

BOOL __30__SPCoreSpotlightIndexer_init__block_invoke_2(uint64_t a1, int a2)
{
  int v3;
  BOOL v4;

  v3 = objc_msgSend((id)sDelegate, "deviceUnlocked");
  deviceUnlocked = v3;
  if (v3)
    v4 = a2 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    wait_for_apfs_kb_state((const char *)sIndexMountPath, 1);
    v3 = deviceUnlocked;
  }
  return v3 == 0;
}

- (void)_enumerateIndexersWithProtectionClasses:(id)a3 inferPriorityIndex:(BOOL)a4 block:(id)a5
{
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:forBundleIds:inferPriorityIndex:block:](self, "_enumerateIndexersWithProtectionClasses:forBundleIds:inferPriorityIndex:block:", a3, 0, a4, a5);
}

- (NSDictionary)concreteIndexers
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "index")
    || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "_indexPath"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, 0),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }
  else
  {
    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "_indexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "*warn* Skipped nil indexer because index path %@ doesn't exist.", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (id)_taskForQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  int v29;
  __objc2_class **v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  OS_dispatch_queue *v39;
  uint64_t v40;
  OS_dispatch_queue *v41;
  id v42;
  id v43;
  void *v44;
  _BOOL4 v45;
  int v46;
  char v47;
  OS_dispatch_queue *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  OS_dispatch_queue *v56;
  void *v57;
  void *v59;
  void *v60;
  id v61;
  BOOL v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  _QWORD v73[4];
  OS_dispatch_queue *v74;
  id v75;
  id v76;
  _QWORD v77[4];
  OS_dispatch_queue *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  _QWORD *v84;
  _BYTE *v85;
  _QWORD *v86;
  id v87;
  BOOL v88;
  _QWORD v89[4];
  OS_dispatch_queue *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  _QWORD *v96;
  _BYTE *v97;
  _QWORD *v98;
  id v99;
  BOOL v100;
  id location;
  _QWORD v102[4];
  OS_dispatch_queue *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  _QWORD *v108;
  _QWORD *v109;
  uint64_t v110;
  char v111;
  _QWORD v112[4];
  OS_dispatch_queue *v113;
  id v114;
  id v115;
  _QWORD *v116;
  _QWORD *v117;
  _QWORD *v118;
  _QWORD v119[4];
  _QWORD v120[4];
  _QWORD v121[4];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[4];
  id v127;
  uint8_t v128[128];
  _BYTE buf[24];
  void *v130;
  __int16 v131;
  void *v132;
  uint64_t v133;

  v133 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v67 = a5;
  v14 = a6;
  v66 = a7;
  v68 = v14;
  if (!v14)
    -[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:].cold.1();
  logForCSLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:].cold.4();

  if (!deviceUnlocked)
    SIResumeForUnlock();
  objc_msgSend(v13, "protectionClasses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  v62 = v17 == 0;
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "clientBundleID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "allProtectionClasses");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v130 = v59;
      v131 = 2112;
      v132 = v60;
      _os_log_debug_impl(&dword_213CF1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "PCS %@ for query %@ from client %@ (available: %@)", buf, 0x2Au);

    }
    v71 = v16;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "allProtectionClasses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(v18, "copy");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:].cold.3((uint64_t)v71, (uint64_t)v12, v13);
  }
  if (objc_msgSend(v13, "internal"))
  {
    objc_msgSend(v13, "clientBundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.searchutil")) & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(v13, "clientBundleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.search"));

      v20 = v22 ^ 1u;
    }

  }
  else
  {
    v20 = 1;
  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
  objc_msgSend(v13, "bundleIDs");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v70, "count"))
  {
    v24 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v13, "bundleIDs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

    goto LABEL_25;
  }
  if ((objc_msgSend(v13, "internal") & 1) == 0)
  {
    objc_msgSend(v13, "clientBundleID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 == 0;

    if (!v27)
    {
      v28 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v13, "clientBundleID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setWithObject:", v25);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
  }
  v69 = 0;
LABEL_25:
  v126[0] = MEMORY[0x24BDAC760];
  v126[1] = 3221225472;
  v126[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke;
  v126[3] = &unk_24D0ECC48;
  v72 = v23;
  v127 = v72;
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:forBundleIds:inferPriorityIndex:block:](self, "_enumerateIndexersWithProtectionClasses:forBundleIds:inferPriorityIndex:block:", v71, v69, v20, v126);
  if (objc_msgSend(v72, "count"))
  {
    v29 = objc_msgSend(v13, "live");
    v30 = off_24D0E9530;
    if (!v29)
      v30 = off_24D0E9538;
    v31 = (void *)objc_msgSend(objc_alloc(*v30), "initWithQueryString:queryContext:", v12, v13);
    v32 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    v33 = v72;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v122, v128, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v123;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v123 != v35)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * i), "knownClients");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject unionSet:](v32, "unionSet:", v37);

        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v122, v128, 16);
      }
      while (v34);
    }

    objc_msgSend(v31, "setKnownBundleIds:", v32);
    objc_msgSend(v13, "clientBundleID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = self->_indexQueue;
    objc_msgSend(v33, "objectEnumerator");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v33, "count");
    v61 = v12;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v130 = 0;
    v121[0] = 0;
    v121[1] = v121;
    v121[2] = 0x2020000000;
    v121[3] = 0;
    v120[0] = 0;
    v120[1] = v120;
    v120[2] = 0x2020000000;
    v120[3] = 0;
    v119[0] = 0;
    v119[1] = v119;
    v119[2] = 0x2020000000;
    v119[3] = 0;
    v112[0] = MEMORY[0x24BDAC760];
    v112[1] = 3221225472;
    v112[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1580;
    v112[3] = &unk_24D0ECF48;
    v41 = v39;
    v113 = v41;
    v42 = v31;
    v114 = v42;
    v43 = v38;
    v115 = v43;
    v116 = v121;
    v117 = v120;
    v118 = v119;
    v64 = (void *)objc_msgSend(v112, "copy");
    if (s_last_memory_pressure_status != 1
      && (objc_msgSend(v13, "rankingQueries"),
          v44 = (void *)objc_claimAutoreleasedReturnValue(),
          v45 = objc_msgSend(v44, "count") == 0,
          v44,
          v45))
    {
      v47 = objc_msgSend(v13, "live");
      v46 = 1;
    }
    else
    {
      v46 = 0;
      v47 = 0;
    }
    v102[0] = MEMORY[0x24BDAC760];
    v102[1] = 3221225472;
    v102[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1582;
    v102[3] = &unk_24D0ECF70;
    v48 = v41;
    v103 = v48;
    v104 = v13;
    v49 = v68;
    v107 = v49;
    v108 = v119;
    v110 = v40;
    v50 = v42;
    v111 = v47;
    v105 = v50;
    v109 = v121;
    v51 = v43;
    v106 = v51;
    v65 = (void *)objc_msgSend(v102, "copy");
    location = 0;
    objc_initWeak(&location, v50);
    if (v46)
    {
      v12 = v61;
      v89[0] = MEMORY[0x24BDAC760];
      v89[1] = 3221225472;
      v89[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1585;
      v89[3] = &unk_24D0ECF98;
      objc_copyWeak(&v99, &location);
      v90 = v48;
      v96 = v121;
      v97 = buf;
      v91 = v63;
      v93 = v64;
      v94 = v67;
      v52 = v65;
      v100 = v62;
      v95 = v52;
      v98 = v120;
      v92 = v51;
      v53 = (void *)MEMORY[0x2199C2F34](v89);

      objc_destroyWeak(&v99);
      objc_destroyWeak(&location);
    }
    else
    {
      v12 = v61;
      v77[0] = MEMORY[0x24BDAC760];
      v77[1] = 3221225472;
      v77[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1586;
      v77[3] = &unk_24D0ECF98;
      objc_copyWeak(&v87, &location);
      v78 = v48;
      v84 = v121;
      v85 = buf;
      v79 = v63;
      v81 = v64;
      v82 = v67;
      v55 = v65;
      v88 = v62;
      v83 = v55;
      v86 = v120;
      v80 = v51;
      v53 = (void *)MEMORY[0x2199C2F34](v77);

      objc_destroyWeak(&v87);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v50, "setWillAsyncStart:", 0);
    objc_msgSend(v50, "setScheduleBlock:", v53);
    v73[0] = MEMORY[0x24BDAC760];
    v73[1] = 3221225472;
    v73[2] = __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1587;
    v73[3] = &unk_24D0ECFC0;
    v56 = v48;
    v74 = v56;
    v75 = v49;
    v76 = v66;
    objc_msgSend(v50, "setCompletionBlock:", v73);
    v57 = v76;
    v54 = v50;

    _Block_object_dispose(v119, 8);
    _Block_object_dispose(v120, 8);
    _Block_object_dispose(v121, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    logForCSLogCategoryDefault();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:].cold.2();
    v54 = 0;
  }

  return v54;
}

uint64_t __33__SPCoreSpotlightIndexer_preheat__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "preheat");
}

+ (id)allProtectionClasses
{
  if (allProtectionClasses_onceToken != -1)
    dispatch_once(&allProtectionClasses_onceToken, &__block_literal_global_1408);
  return (id)allProtectionClasses_sProtectionClasses;
}

uint64_t __61__SPCoreSpotlightIndexer_commitUpdatesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "commitUpdates:", *(_QWORD *)(a1 + 32));
}

void __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = sIndexQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_2;
  v10[3] = &unk_24D0ED2C8;
  v5 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 56);
  v12 = v6;
  v14 = v7;
  v13 = *(id *)(a1 + 32);
  v8 = v3;
  _setup_block(v10, 0, 15090);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, v9);

}

uint64_t __33__SPCoreSpotlightIndexer_shrink___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shrink:", *(_QWORD *)(a1 + 32));
}

uint64_t __85__SPCoreSpotlightIndexer_clientDidCheckin_protectionClass_service_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientDidCheckin:service:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)taskForQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  void *v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  logForCSLogCategoryDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:].cold.2();

  logForCSLogCategoryDefault();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:].cold.1();

  v19 = objc_msgSend(v13, "rankingType");
  if ((_os_feature_enabled_impl() & 1) != 0 || v19 != 1)
  {
    -[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:](self, "_taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v12, v13, v14, v15, v16);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)sDelegate, "taskForTopHitQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v12, v13, v14, v15, v16);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;

  return v21;
}

- (void)startQueryTask:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer startQueryTask:].cold.1();

  if (v3)
  {
    v5 = sIndexQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __41__SPCoreSpotlightIndexer_startQueryTask___block_invoke;
    v7[3] = &unk_24D0EA758;
    v8 = v3;
    _setup_block(v7, objc_msgSend(v8, "critical"), 13640);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, v6);

  }
}

- (id)fileProviderDomainFilterQueries
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_fileProviderMonitor);
  objc_msgSend(WeakRetained, "removedDomainFilterQueries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)dataMigrationStage
{
  return self->_dataMigrationStage;
}

uint64_t __41__SPCoreSpotlightIndexer_startQueryTask___block_invoke(uint64_t a1)
{
  NSObject *v2;

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __41__SPCoreSpotlightIndexer_startQueryTask___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "start");
}

void __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_3;
  v6[3] = &unk_24D0EB7A8;
  v5 = *(_OWORD *)(a1 + 56);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v2, "deleteAllInteractionsWithBundleID:completionHandler:", v3, v6);

}

- (void)deleteAllInteractionsWithBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  qos_class_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  NSObject *v19;
  SPCoreSpotlightIndexer *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _checkUnlock();
  v8 = dispatch_group_create();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v24 = 0;
  v25[0] = *MEMORY[0x24BDD0CE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke;
  v18[3] = &unk_24D0ED2F0;
  v11 = v8;
  v19 = v11;
  v20 = self;
  v12 = v6;
  v21 = v12;
  v22 = v23;
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:block:](self, "_enumerateIndexersWithProtectionClasses:block:", v9, v18);
  if (v7)
  {
    v13 = qos_class_self();
    dispatch_get_global_queue(v13, 2uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_4;
    v15[3] = &unk_24D0ED190;
    v16 = v7;
    v17 = v23;
    dispatch_group_notify(v11, v14, v15);

  }
  _Block_object_dispose(v23, 8);

}

- (void)_enumerateIndexersWithProtectionClasses:(id)a3 block:(id)a4
{
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:](self, "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", a3, 1, a4);
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  -[SPCoreSpotlightIndexer deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:fromClient:options:completionHandler:](self, "deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:fromClient:options:completionHandler:", a3, a4, a5, 0, a6, a7);
}

+ (SPCoreSpotlightIndexer)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1411);
  return (SPCoreSpotlightIndexer *)(id)sharedInstance_sSharedInstance;
}

- (void)fetchLastClientStateWithProtectionClass:(id)a3 forBundleID:(id)a4 clientStateName:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a7;
  _checkUnlock();
  if (v18)
    v14 = v18;
  else
    v14 = (id)*MEMORY[0x24BDD0CE0];
  -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "fetchLastClientStateForBundleID:clientStateName:completionHandler:", v11, v12, v13);
  }
  else if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v17);

  }
}

- (id)concreteIndexerForProtectionClass:(id)a3 andBundleID:(id)a4
{
  __CFString *v6;
  id v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v6 = (__CFString *)a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDD0CF8];
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x24BDD0CF8]))
  {
    v9 = (__CFString *)(id)*MEMORY[0x24BDD0CE0];

    v6 = v9;
  }
  if (sUsePriorityIndex == 1
    && objc_msgSend(v7, "length")
    && ((-[__CFString isEqual:](v6, "isEqual:", *MEMORY[0x24BDD0CE0]) & 1) != 0
     || -[__CFString isEqual:](v6, "isEqual:", v8)))
  {
    if (objc_msgSend((id)sPriorityBundleIds, "containsObject:", v7))
    {

      v6 = CFSTR("Priority");
    }
  }
  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)clientDidCheckin:(id)a3 protectionClass:(id)a4 service:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (sShuttingDown != 1)
  {
    _checkUnlock();
    v16 = (void *)*MEMORY[0x24BDD0CE0];
    if (v11)
      v16 = v11;
    v15 = v16;
    -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v15, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
      -[SPCoreSpotlightIndexer extensionDelegate](self, "extensionDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(MEMORY[0x24BDC24E8], "sharedManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "loadExtensions");

      }
      v20 = sIndexQueue;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __85__SPCoreSpotlightIndexer_clientDidCheckin_protectionClass_service_completionHandler___block_invoke;
      v23[3] = &unk_24D0EB708;
      v24 = v17;
      v25 = v10;
      v26 = v12;
      v27 = v13;
      _setup_block(v23, 0, 14976);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_async(v20, v21);

    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v22);

    }
    goto LABEL_15;
  }
  logForCSLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SPCoreSpotlightIndexer clientDidCheckin:protectionClass:service:completionHandler:].cold.1();

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v15);
LABEL_15:

  }
}

- (CSIndexExtensionDelegate)extensionDelegate
{
  return (CSIndexExtensionDelegate *)objc_loadWeakRetained((id *)&self->extensionDelegate);
}

uint64_t __33__SPCoreSpotlightIndexer_preheat__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateIndexersWithBlock:", &__block_literal_global_1520);
}

uint64_t __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)preheat
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];

  v2 = sIndexQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__SPCoreSpotlightIndexer_preheat__block_invoke;
  v4[3] = &unk_24D0EA758;
  v4[4] = self;
  _setup_block(v4, 0, 12437);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, v3);

}

- (void)commitUpdatesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  dispatch_group_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  dispatch_group_t v12;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
    -[SPCoreSpotlightIndexer commitUpdatesWithCompletionHandler:].cold.1();
  v5 = v4;
  logForCSLogCategoryIndex();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_INFO, "commitUpdatesWithCompletionHandler", buf, 2u);
  }

  v7 = dispatch_group_create();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__SPCoreSpotlightIndexer_commitUpdatesWithCompletionHandler___block_invoke;
  v11[3] = &unk_24D0ECC48;
  v12 = v7;
  v8 = v7;
  -[SPCoreSpotlightIndexer _enumerateIndexersWithBlock:](self, "_enumerateIndexersWithBlock:", v11);
  v9 = sIndexQueue;
  _setup_block(v5, 0, 12469);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v8, v9, v10);

}

- (void)_enumerateIndexersWithBlock:(id)a3
{
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:](self, "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", 0, 1, a3);
}

void __78__SPCoreSpotlightIndexer_deleteAllInteractionsWithBundleID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (void)preheat
{
  if (!deviceUnlocked)
    SIResumeForUnlock();
  objc_msgSend((id)sIndexer, "preheat");
}

void __50__SPCoreSpotlightIndexer__registerForPrefsChanges__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  NSObject *v15;
  NSObject *v16;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x2199C2D78]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    logForCSLogCategoryIndex();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __50__SPCoreSpotlightIndexer__registerForPrefsChanges__block_invoke_cold_1();

    objc_msgSend(WeakRetained, "prefsChangeSource");
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_source_merge_data(v16, 1uLL);

  }
  objc_autoreleasePoolPop(v13);

}

- (OS_dispatch_source)prefsChangeSource
{
  return self->_prefsChangeSource;
}

- (void)_reindexAllItemsOnPrefsChanges
{
  NSSet **p_prefsDisabledBundleIDs;
  NSSet *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  p_prefsDisabledBundleIDs = &self->_prefsDisabledBundleIDs;
  v4 = self->_prefsDisabledBundleIDs;
  objc_msgSend((id)sDelegate, "disabledBundleSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)p_prefsDisabledBundleIDs, v5);
  if (-[NSSet count](v4, "count"))
  {
    v6 = (void *)-[NSSet mutableCopy](v4, "mutableCopy");
    objc_msgSend(v6, "minusSet:", v5);
    if (objc_msgSend(v6, "count"))
    {
      dispatch_suspend((dispatch_object_t)self->_reindexAllQueue);
      objc_msgSend(v6, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __56__SPCoreSpotlightIndexer__reindexAllItemsOnPrefsChanges__block_invoke;
      v8[3] = &unk_24D0EA758;
      v8[4] = self;
      -[SPCoreSpotlightIndexer _reindexAllItemsForBundleIDs:reason:completionHandler:](self, "_reindexAllItemsForBundleIDs:reason:completionHandler:", v7, CFSTR("prefs-changes"), v8);

    }
  }

}

- (void)addInteraction:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9 && v10)
  {
    -[SPCoreSpotlightIndexer interactionHandler](self, "interactionHandler");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleInteraction:bundleID:protectionClass:](v12, "handleInteraction:bundleID:protectionClass:", v8, v9, v11);
  }
  else
  {
    logForCSLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412802;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v11;
      _os_log_debug_impl(&dword_213CF1000, v12, OS_LOG_TYPE_DEBUG, "skipping interaction %@ bundle %@ pc %@", (uint8_t *)&v13, 0x20u);
    }
  }

}

- (SPCoreSpotlightInteractionHandler)interactionHandler
{
  return self->_interactionHandler;
}

uint64_t __33__SPCoreSpotlightIndexer_shrink___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__SPCoreSpotlightIndexer_shrink___block_invoke_2;
  v3[3] = &__block_descriptor_40_e40_v16__0__SPConcreteCoreSpotlightIndexer_8l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "_enumerateIndexersWithProtectionClasses:block:", 0, v3);
}

- (void)shrink:(unint64_t)a3
{
  NSObject *v3;
  void *v4;
  _QWORD v5[6];

  v3 = sIndexQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__SPCoreSpotlightIndexer_shrink___block_invoke;
  v5[3] = &unk_24D0EAAC0;
  v5[4] = self;
  v5[5] = a3;
  _setup_block(v5, 0, 13116);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, v4);

}

+ (void)setMemoryPressureStatus:(unint64_t)a3
{
  s_last_memory_pressure_status = a3;
  _SISetMemoryPressureStatus();
  objc_msgSend(MEMORY[0x24BDC24E8], "setMemoryPressureStatus:", a3);
}

+ (void)initialize
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_source_t v5;
  NSObject *v6;
  NSObject *v7;
  __CFNotificationCenter *LocalCenter;
  _OWORD v9[4];
  unsigned __int8 *(*v10)(unsigned __int8 *, _BYTE *);
  _OWORD v11[2];
  __int128 buf;
  uint64_t (*v13)(uint64_t);
  void *v14;
  dispatch_source_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    memset(v11, 0, sizeof(v11));
    v10 = uuidBytesToString;
    _dyld_images_for_addresses();
    memset(v9, 0, sizeof(v9));
    uuidBytesToString((unsigned __int8 *)v11, v9);
    logForCSLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "initializing %s", (uint8_t *)&buf, 0xCu);
    }

    v3 = dispatch_queue_create("VFSEventQueue", 0);
    v4 = (void *)gVFSEventQueue;
    gVFSEventQueue = (uint64_t)v3;

    v5 = dispatch_source_create(MEMORY[0x24BDACA20], 0, 0x304uLL, (dispatch_queue_t)gVFSEventQueue);
    objc_storeStrong((id *)&gVFSEventSource, v5);
    v6 = gVFSEventSource;
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v13 = __initializeDiskSpaceNotificationListener_block_invoke;
    v14 = &unk_24D0EA758;
    v15 = v5;
    v7 = v5;
    dispatch_source_set_event_handler(v6, &buf);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)handleLowDiskSpace, CFSTR("com.apple.Spotlight.lowdiskspace"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    dispatch_resume((dispatch_object_t)gVFSEventSource);

    sIsInternalInstall = os_variant_has_internal_diagnostics();
  }
}

+ (void)cooldown
{
  objc_msgSend((id)sIndexer, "coolDown");
}

+ (void)sync
{
  objc_msgSend((id)sIndexer, "commitUpdatesWithCompletionHandler:", &__block_literal_global_1404);
}

+ (void)deviceStateWillChange:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "locked";
    if (v3)
      v5 = "unlocked";
    v6 = 136315138;
    v7 = v5;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "### device state %s", (uint8_t *)&v6, 0xCu);
  }

  if (v3)
    SIResumeForUnlock();
}

+ (void)shrink:(unint64_t)a3
{
  objc_msgSend((id)sIndexer, "shrink:", a3);
}

+ (void)deactivate
{
  void *v2;
  id v3;

  objc_msgSend((id)sIndexer, "extensionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDC24E8], "sharedManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadExtensions");

  }
}

+ (void)shutdown
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Shutting down", v4, 2u);
  }

  sShuttingDown = 1;
  objc_msgSend((id)sIndexer, "shutdown");
  v3 = (void *)sIndexer;
  sIndexer = 0;

}

void __46__SPCoreSpotlightIndexer_allProtectionClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCEB8];
  v1 = *MEMORY[0x24BDD0CE8];
  v7[0] = *MEMORY[0x24BDD0CE0];
  v7[1] = v1;
  v2 = *MEMORY[0x24BDD0CD0];
  v7[2] = *MEMORY[0x24BDD0CD8];
  v7[3] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!sPrivate && _os_feature_enabled_impl())
    objc_msgSend(v4, "addObject:", CFSTR("Priority"));
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)allProtectionClasses_sProtectionClasses;
  allProtectionClasses_sProtectionClasses = v5;

}

+ (void)setIndexerDelegate:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  if (v3 && sIndexer)
    +[SPCoreSpotlightIndexer setIndexerDelegate:].cold.1();
  v4 = (void *)sDelegate;
  sDelegate = (uint64_t)v3;
  v7 = v3;

  sPrivate = objc_msgSend(v7, "privateIndex");
  objc_msgSend(v7, "indexQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)sIndexQueue;
  sIndexQueue = v5;

}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke()
{
  SPCoreSpotlightIndexer *v0;
  void *v1;
  id v2;
  const char *v3;
  NSObject *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  __darwin_time_t tv_sec;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  int v26;
  NSObject *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  size_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  stat v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(SPCoreSpotlightIndexer);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

  objc_storeStrong((id *)&sIndexer, v0);
  objc_msgSend((id)sDelegate, "indexDirectory");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "fileSystemRepresentation");

  if (v3)
    sIndexMountPath = (uint64_t)strdup(v3);
  v79 = 8;
  v80 = 0;
  if (sysctlbyname("kern.roots_installed", &v80, &v79, 0, 0))
  {
    __error();
    logForCSLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_5();

  }
  else
  {
    sRootsInstalled = v80 != 0;
  }
  v5 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (!v5
    || (v6 = v5,
        CFDictionaryGetValue(v5, CFSTR("ProductBuildVersion")),
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        CFRelease(v6),
        !v7))
  {
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_4();

    v7 = CFSTR("unknown");
  }
  indexHeartbeatPath();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if (v11)
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v9);
  else
    newHeartbeatDict();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("heartbeat_age"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13
    || (v14 = (void *)v13,
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("heartbeat_age")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "longValue"),
        v15,
        v14,
        v16 < 0))
  {
    memset(&v83, 0, sizeof(v83));
    if (stat((const char *)objc_msgSend(objc_retainAutorelease(v9), "cStringUsingEncoding:", 4), &v83))
    {
      logForCSLogCategoryDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_3();

      v18 = (void *)MEMORY[0x24BDD16E0];
      tv_sec = -1;
    }
    else
    {
      v18 = (void *)MEMORY[0x24BDD16E0];
      tv_sec = v83.st_birthtimespec.tv_sec;
    }
    objc_msgSend(v18, "numberWithLong:", tv_sec);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("heartbeat_age"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("parentDirectory_age"));
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21
    || (v22 = (void *)v21,
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("parentDirectory_age")),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "longValue"),
        v23,
        v22,
        v24 < 0))
  {
    memset(&v83, 0, sizeof(v83));
    objc_msgSend((id)sDelegate, "indexDirectory");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = stat((const char *)objc_msgSend(v25, "cStringUsingEncoding:", 4), &v83);

    if (v26)
    {
      logForCSLogCategoryDefault();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_2();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("parentDirectory_agw");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v83.st_birthtimespec.tv_sec);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("parentDirectory_age");
    }
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v28, v29);

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pcA_wipes_aggregate"));
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30
    || (v31 = (void *)v30,
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pcA_wipes_aggregate")),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v33 = objc_msgSend(v32, "longValue"),
        v32,
        v31,
        v33 < 0))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v34, CFSTR("pcA_wipes_aggregate"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pcB_wipes_aggregate"));
  v35 = objc_claimAutoreleasedReturnValue();
  if (!v35
    || (v36 = (void *)v35,
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pcB_wipes_aggregate")),
        v37 = (void *)objc_claimAutoreleasedReturnValue(),
        v38 = objc_msgSend(v37, "longValue"),
        v37,
        v36,
        v38 < 0))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v39, CFSTR("pcB_wipes_aggregate"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pcC_wipes_aggregate"));
  v40 = objc_claimAutoreleasedReturnValue();
  if (!v40
    || (v41 = (void *)v40,
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pcC_wipes_aggregate")),
        v42 = (void *)objc_claimAutoreleasedReturnValue(),
        v43 = objc_msgSend(v42, "longValue"),
        v42,
        v41,
        v43 < 0))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v44, CFSTR("pcA_wipes_aggregate"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pcCX_wipes_aggregate"));
  v45 = objc_claimAutoreleasedReturnValue();
  if (!v45
    || (v46 = (void *)v45,
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pcCX_wipes_aggregate")),
        v47 = (void *)objc_claimAutoreleasedReturnValue(),
        v48 = objc_msgSend(v47, "longValue"),
        v47,
        v46,
        v48 < 0))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v49, CFSTR("pcCX_wipes_aggregate"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pcPriority_wipes_aggregate"));
  v50 = objc_claimAutoreleasedReturnValue();
  if (!v50
    || (v51 = (void *)v50,
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("pcPriority_wipes_aggregate")),
        v52 = (void *)objc_claimAutoreleasedReturnValue(),
        v53 = objc_msgSend(v52, "longValue"),
        v52,
        v51,
        v53 < 0))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v54, CFSTR("pcPriority_wipes_aggregate"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", sRootsInstalled);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v55, CFSTR("rootsinstalled"));

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("spotlightversion"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("spotlightversion"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("2313.4.2"));

    if ((v58 & 1) != 0)
      goto LABEL_52;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("spotlightversion"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v59, CFSTR("previousspotlightversion"));

    v60 = CFSTR("2313.4.2");
    v61 = v12;
    v62 = CFSTR("spotlightversion");
  }
  else
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("2313.4.2"), CFSTR("spotlightversion"));
    v60 = CFSTR("unknown");
    v62 = CFSTR("previousspotlightversion");
    v61 = v12;
  }
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v60, v62);
LABEL_52:
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("build"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("build"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "isEqualToString:", v7);

    if ((v65 & 1) != 0)
      goto LABEL_57;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("build"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v66, CFSTR("previousbuild"));

    v67 = v12;
    v68 = v7;
    v69 = CFSTR("build");
  }
  else
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("build"));
    v68 = CFSTR("unknown");
    v69 = CFSTR("previousbuild");
    v67 = v12;
  }
  objc_msgSend(v67, "setObject:forKeyedSubscript:", v68, v69);
LABEL_57:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _os_feature_enabled_impl());
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v70, CFSTR("vectorindexon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _os_feature_enabled_impl());
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v71, CFSTR("textsemanticsearchon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _os_feature_enabled_impl());
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v72, CFSTR("embeddingdonationon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", MDBootTime());
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v73, CFSTR("timesinceboot"));

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = *MEMORY[0x24BDD0CF0];
    *(_QWORD *)&v83.st_dev = *MEMORY[0x24BDD0CE0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "createFileAtPath:contents:attributes:", v9, 0, v75);

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0;
  objc_msgSend(v12, "writeToURL:error:", v76, &v81);
  v77 = v81;

  if (v77)
  {
    logForCSLogCategoryDefault();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_1();

  }
  pthread_rwlock_unlock(&sIndexHeartbeatLock);

}

+ (unint64_t)totalIndexDiskSpace
{
  if (totalIndexDiskSpace_onceToken != -1)
    dispatch_once(&totalIndexDiskSpace_onceToken, &__block_literal_global_1413);
  return sTotalIndexDiskSpace;
}

int *__45__SPCoreSpotlightIndexer_totalIndexDiskSpace__block_invoke()
{
  id v0;
  const char *v1;
  int v2;
  NSObject *v3;
  int *result;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  statfs v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  bzero(&v9, 0x878uLL);
  objc_msgSend((id)sDelegate, "indexDirectory");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v0, "cStringUsingEncoding:", 4);

  LODWORD(v0) = statfs(v1, &v9);
  v2 = *__error();
  if ((_DWORD)v0)
  {
    logForCSLogCategoryIndex();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = v1;
      v7 = 1024;
      v8 = v2;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "*warn* Failed to get total index disk space for %s. err=%d", (uint8_t *)&v5, 0x12u);
    }

  }
  else
  {
    sTotalIndexDiskSpace = v9.f_blocks * v9.f_bsize;
  }
  result = __error();
  *result = v2;
  return result;
}

+ (unint64_t)freeIndexDiskSpace
{
  id v2;
  const char *v3;
  int v4;
  NSObject *v5;
  unint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  statfs v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  bzero(&v12, 0x878uLL);
  objc_msgSend((id)sDelegate, "indexDirectory");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "cStringUsingEncoding:", 4);

  LODWORD(v2) = statfs(v3, &v12);
  v4 = *__error();
  if ((_DWORD)v2)
  {
    logForCSLogCategoryIndex();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = v3;
      v10 = 1024;
      v11 = v4;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "*warn* Failed to get free index disk space for %s. err=%d", (uint8_t *)&v8, 0x12u);
    }

    v6 = -1;
  }
  else
  {
    v6 = v12.f_bfree * v12.f_bsize;
  }
  *__error() = v4;
  return v6;
}

- (id)defaultIndexer
{
  void *v2;
  void *v3;

  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD0CE0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)priorityIndexer
{
  void *v2;
  void *v3;

  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("Priority"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)priorityIndexPath
{
  void *v2;
  void *v3;

  objc_msgSend((id)sDelegate, "indexDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Priority"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)priorityIndexAvailableTouchFilePath
{
  void *v2;
  void *v3;

  objc_msgSend((id)sDelegate, "indexDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("priorityIndexAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)spotlightCacheFilePrefix
{
  void *v2;
  void *v3;

  objc_msgSend((id)sDelegate, "indexDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("spotlightcache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)systemSettingsIndexer
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  if (sPrivate)
  {
    v2 = 0;
  }
  else
  {
    v3 = sUsePriorityIndex;
    -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 == 1)
      v6 = CFSTR("Priority");
    else
      v6 = (const __CFString *)*MEMORY[0x24BDD0CE0];
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)contactsIndexer
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  if (sPrivate)
  {
    v2 = 0;
  }
  else
  {
    v3 = sUsePriorityIndex;
    -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 == 1)
      v6 = CFSTR("Priority");
    else
      v6 = (const __CFString *)*MEMORY[0x24BDD0CE0];
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (SPCoreSpotlightIndexer)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  dispatch_queue_t v24;
  void *v25;
  NSObject *v26;
  dispatch_source_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  SPConcreteCoreSpotlightIndexer *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  dispatch_source_t v81;
  void *v82;
  NSObject *v83;
  dispatch_source_t v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  NSObject *v93;
  id obj;
  void *v95;
  _QWORD v96[4];
  id v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;
  _QWORD v102[4];
  id v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  id v107;
  _QWORD v108[4];
  id v109;
  _QWORD v110[4];
  id v111;
  _QWORD v112[4];
  id v113;
  _QWORD v114[4];
  __CFString *v115;
  id v116;
  id v117;
  id v118[5];
  __CFString *v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD handler[4];
  id v126;
  id location;
  _QWORD v128[4];
  id v129;
  objc_super v130;
  uint8_t v131[128];
  uint8_t buf[4];
  const char *v133;
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  v130.receiver = self;
  v130.super_class = (Class)SPCoreSpotlightIndexer;
  v2 = -[SPCoreSpotlightIndexer init](&v130, sel_init);
  if (v2)
  {
    if (!sDelegate)
      -[SPCoreSpotlightIndexer init].cold.1();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v93 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_queue_create("com.apple.searchd.appScoping", v93);
    v4 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v3;

    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global_1421);
    objc_msgSend((id)sDelegate, "indexQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 29);
    *((_QWORD *)v2 + 29) = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.searchd.personaobserver", v8);
    v10 = (void *)*((_QWORD *)v2 + 28);
    *((_QWORD *)v2 + 28) = v9;

    objc_msgSend((id)sDelegate, "firstUnlockQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 30);
    *((_QWORD *)v2 + 30) = v11;

    if (objc_msgSend((id)sDelegate, "indexingEnabled"))
    {
      v13 = objc_alloc(MEMORY[0x24BDBCEF0]);
      v14 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(v2, "personaListURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayWithContentsOfURL:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v13, "initWithArray:", v16);
      v18 = (void *)*((_QWORD *)v2 + 26);
      *((_QWORD *)v2 + 26) = v17;

      if (!sPrivate)
      {
        objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v128[0] = MEMORY[0x24BDAC760];
        v128[1] = 3221225472;
        v128[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_3;
        v128[3] = &unk_24D0EB060;
        v129 = v2;
        objc_msgSend(v19, "registerPersonaListUpdateObserver:withMachService:completionHandler:", v129, CFSTR("com.apple.searchd.personaobserver"), v128);

      }
      v20 = (void *)objc_opt_new();
      objc_msgSend(v2, "setInteractionHandler:", v20);

      v21 = +[SPQueryResultsQueue sharedInstanceDispatchQueue:](SPQueryResultsQueue, "sharedInstanceDispatchQueue:", *((_QWORD *)v2 + 29));
      v22 = +[SPQueryResultsQueue sharedInstanceMaintenanceDispatchQueue:](SPQueryResultsQueue, "sharedInstanceMaintenanceDispatchQueue:", *((_QWORD *)v2 + 29));
      location = 0;
      objc_initWeak(&location, v2);
      if (!sPrivate)
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = dispatch_queue_create("com.apple.spotlight.reindexAll", v23);
        v25 = (void *)*((_QWORD *)v2 + 31);
        *((_QWORD *)v2 + 31) = v24;

        logForCSLogCategoryIndex();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v133 = "com.apple.spotlight.reindexAll";
          _os_log_impl(&dword_213CF1000, v26, OS_LOG_TYPE_INFO, "Suspending \"%s\" queue", buf, 0xCu);
        }

        dispatch_suspend(*((dispatch_object_t *)v2 + 31));
        v27 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, *((dispatch_queue_t *)v2 + 31));
        v28 = (void *)*((_QWORD *)v2 + 18);
        *((_QWORD *)v2 + 18) = v27;

        v29 = *((_QWORD *)v2 + 18);
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1437;
        handler[3] = &unk_24D0EA868;
        objc_copyWeak(&v126, &location);
        dispatch_source_set_event_handler(v29, handler);
        dispatch_resume(*((dispatch_object_t *)v2 + 18));
        objc_destroyWeak(&v126);
      }
      objc_msgSend((id)objc_opt_class(), "allProtectionClasses");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v30, "count") + 1);
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      obj = v30;
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
      if (v31)
      {
        v32 = 0;
        v33 = *(_QWORD *)v122;
        do
        {
          v34 = 0;
          if (v32 <= 5)
            v35 = 5;
          else
            v35 = v32;
          v36 = (v35 - v32);
          v37 = (uint64_t)v2 + 4 * v32 + 8;
          do
          {
            if (*(_QWORD *)v122 != v33)
              objc_enumerationMutation(obj);
            if (v36 == v34)
              __assert_rtn("-[SPCoreSpotlightIndexer init]", "SPCoreSpotlightIndexer.m", 11643, "cancelFlagOffset < MAX_INDEXERS");
            v38 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * v34);
            v39 = -[SPConcreteCoreSpotlightIndexer initWithQueue:protectionClass:cancelPtr:]([SPConcreteCoreSpotlightIndexer alloc], "initWithQueue:protectionClass:cancelPtr:", *((_QWORD *)v2 + 29), v38, v37);
            -[SPConcreteCoreSpotlightIndexer setOwner:](v39, "setOwner:", v2);
            -[SPConcreteCoreSpotlightIndexer setFirstUnlockQueue:](v39, "setFirstUnlockQueue:", *((_QWORD *)v2 + 30));
            objc_msgSend(v95, "setObject:forKey:", v39, v38);

            ++v34;
            v37 += 4;
          }
          while (v31 != v34);
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
          v32 += v34;
        }
        while (v31);
      }

      objc_msgSend(v2, "setConcreteIndexers:", v95);
      if (!sPrivate)
      {
        v40 = objc_alloc_init(MEMORY[0x24BDD1710]);
        objc_msgSend(v40, "setMaxConcurrentOperationCount:", 1);
        objc_msgSend(v40, "setUnderlyingQueue:", *((_QWORD *)v2 + 29));
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v118[1] = (id)MEMORY[0x24BDAC760];
        v118[2] = (id)3221225472;
        v118[3] = __30__SPCoreSpotlightIndexer_init__block_invoke_2_1443;
        v118[4] = &unk_24D0ECA70;
        objc_copyWeak(&v120, &location);
        v119 = CFSTR("com.apple.searchd.indexExtensionMigration.start");
        objc_msgSend(v41, "addObserverForName:object:queue:usingBlock:");
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)*((_QWORD *)v2 + 19);
        *((_QWORD *)v2 + 19) = v42;

        v114[0] = MEMORY[0x24BDAC760];
        v114[1] = 3221225472;
        v114[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1447;
        v114[3] = &unk_24D0ECAB8;
        objc_copyWeak(v118, &location);
        v115 = CFSTR("com.apple.searchd.indexExtensionMigration.finish");
        v44 = v2;
        v116 = v44;
        v117 = obj;
        objc_msgSend(v41, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.searchd.indexExtensionMigration.finish"), 0, v40, v114);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v44[20];
        v44[20] = v45;

        objc_destroyWeak(v118);
        objc_destroyWeak(&v120);

      }
      logForCSLogCategoryIndex();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        -[SPCoreSpotlightIndexer init].cold.5(v47, v48, v49, v50, v51, v52, v53, v54);

      v112[0] = MEMORY[0x24BDAC760];
      v112[1] = 3221225472;
      v112[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1454;
      v112[3] = &unk_24D0ECAE0;
      objc_copyWeak(&v113, &location);
      v55 = (void *)*MEMORY[0x24BDAC5A0];
      xpc_activity_register("com.apple.searchd.expirations", (xpc_object_t)*MEMORY[0x24BDAC5A0], v112);
      v110[0] = MEMORY[0x24BDAC760];
      v110[1] = 3221225472;
      v110[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1456;
      v110[3] = &unk_24D0ECAE0;
      objc_copyWeak(&v111, &location);
      xpc_activity_register("com.apple.searchd.expirations.AB", v55, v110);
      logForCSLogCategoryIndex();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        -[SPCoreSpotlightIndexer init].cold.4(v56, v57, v58, v59, v60, v61, v62, v63);

      v108[0] = MEMORY[0x24BDAC760];
      v108[1] = 3221225472;
      v108[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1466;
      v108[3] = &unk_24D0ECAE0;
      objc_copyWeak(&v109, &location);
      xpc_activity_register("com.apple.searchd.defrag", v55, v108);
      logForCSLogCategoryIndex();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        -[SPCoreSpotlightIndexer init].cold.3(v64, v65, v66, v67, v68, v69, v70, v71);

      v106[0] = MEMORY[0x24BDAC760];
      v106[1] = 3221225472;
      v106[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1469;
      v106[3] = &unk_24D0ECAE0;
      objc_copyWeak(&v107, &location);
      xpc_activity_register("com.apple.searchd.loadtrial", v55, v106);
      logForCSLogCategoryIndex();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        -[SPCoreSpotlightIndexer init].cold.2(v72, v73, v74, v75, v76, v77, v78, v79);

      v104[0] = MEMORY[0x24BDAC760];
      v104[1] = 3221225472;
      v104[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1472;
      v104[3] = &unk_24D0ECAE0;
      objc_copyWeak(&v105, &location);
      xpc_activity_register("com.apple.searchd.heartbeat", v55, v104);
      objc_msgSend(MEMORY[0x24BE0B728], "sharedScheduler");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.searchd.reportStorageUsage"), *((_QWORD *)v2 + 29), &__block_literal_global_1479);

      if (!sPrivate)
      {
        v81 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, *((dispatch_queue_t *)v2 + 31));
        v82 = (void *)*((_QWORD *)v2 + 23);
        *((_QWORD *)v2 + 23) = v81;

        v83 = *((_QWORD *)v2 + 23);
        v102[0] = MEMORY[0x24BDAC760];
        v102[1] = 3221225472;
        v102[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1482;
        v102[3] = &unk_24D0EA868;
        objc_copyWeak(&v103, &location);
        dispatch_source_set_event_handler(v83, v102);
        dispatch_resume(*((dispatch_object_t *)v2 + 23));
        v84 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, *((dispatch_queue_t *)v2 + 31));
        v85 = (void *)*((_QWORD *)v2 + 24);
        *((_QWORD *)v2 + 24) = v84;

        v86 = *((_QWORD *)v2 + 24);
        v100[0] = MEMORY[0x24BDAC760];
        v100[1] = 3221225472;
        v100[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_3_1484;
        v100[3] = &unk_24D0EA868;
        objc_copyWeak(&v101, &location);
        dispatch_source_set_event_handler(v86, v100);
        dispatch_resume(*((dispatch_object_t *)v2 + 24));
        v98[0] = MEMORY[0x24BDAC760];
        v98[1] = 3221225472;
        v98[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_5;
        v98[3] = &unk_24D0ECB48;
        objc_copyWeak(&v99, &location);
        v87 = (void *)MEMORY[0x2199C2F34](v98);
        +[SDEventMonitor sharedInstance](SDEventMonitor, "sharedInstance");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "registerHandler:forEventName:", v87, CFSTR("com.apple.corespotlight.developer.ReindexAllItems"));

        v96[0] = MEMORY[0x24BDAC760];
        v96[1] = 3221225472;
        v96[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_6;
        v96[3] = &unk_24D0ECB48;
        objc_copyWeak(&v97, &location);
        v89 = (void *)MEMORY[0x2199C2F34](v96);
        +[SDEventMonitor sharedInstance](SDEventMonitor, "sharedInstance");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "registerHandler:forEventName:", v89, CFSTR("com.apple.corespotlight.developer.ReindexAllItemsWithIdentifiers"));

        logForCSLogCategoryIndex();
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v133 = "com.apple.spotlight.reindexAll";
          _os_log_impl(&dword_213CF1000, v91, OS_LOG_TYPE_INFO, "Resuming \"%s\" queue", buf, 0xCu);
        }

        dispatch_resume(*((dispatch_object_t *)v2 + 31));
        objc_destroyWeak(&v97);

        objc_destroyWeak(&v99);
        objc_destroyWeak(&v101);
        objc_destroyWeak(&v103);
      }
      objc_destroyWeak(&v105);
      objc_destroyWeak(&v107);
      objc_destroyWeak(&v109);
      objc_destroyWeak(&v111);
      objc_destroyWeak(&v113);

      objc_destroyWeak(&location);
    }

  }
  return (SPCoreSpotlightIndexer *)v2;
}

uint64_t __30__SPCoreSpotlightIndexer_init__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.appple.spotlight.mds-import", v0);
  v2 = (void *)gImportQueue;
  gImportQueue = (uint64_t)v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D0FD048);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)sPriorityBundleIds;
  sPriorityBundleIds = v3;

  if (!sPrivate && _os_feature_enabled_impl())
    sUsePriorityIndex = 1;
  return _SISetGetLockStateCallback();
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[28];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_4;
  v7[3] = &unk_24D0EA9D8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_4(uint64_t a1)
{
  NSObject *v1;

  if (*(_QWORD *)(a1 + 32))
  {
    logForCSLogCategoryDefault();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __30__SPCoreSpotlightIndexer_init__block_invoke_4_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "personaListDidUpdate");
  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1437(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_reindexAllItemsOnPrefsChanges");
    WeakRetained = v2;
  }

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_2_1443(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    logForCSLogCategoryIndex();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138413058;
      v6 = v4;
      v7 = 2048;
      v8 = objc_msgSend(WeakRetained, "dataMigrationStage");
      v9 = 1024;
      v10 = objc_msgSend((id)sDelegate, "deviceFirstUnlockedInMKB");
      v11 = 1024;
      v12 = objc_msgSend((id)sDelegate, "deviceFirstUnlockedInSB");
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_INFO, "Received \"%@\" notification, dataMigrationStage:%lu, (%d:%d)", (uint8_t *)&v5, 0x22u);
    }

    objc_msgSend(WeakRetained, "setDataMigrationStage:", objc_msgSend(WeakRetained, "dataMigrationStage") + 1);
  }

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1447(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    logForCSLogCategoryIndex();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138413314;
      v10 = v8;
      v11 = 2048;
      v12 = objc_msgSend(WeakRetained, "dataMigrationStage");
      v13 = 2112;
      v14 = v6;
      v15 = 1024;
      v16 = objc_msgSend((id)sDelegate, "deviceFirstUnlockedInMKB");
      v17 = 1024;
      v18 = objc_msgSend((id)sDelegate, "deviceFirstUnlockedInSB");
      _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_INFO, "Received \"%@\" notification, dataMigrationStage:%lu, dataMigrationBundleIDs:%@ (%d:%d)", (uint8_t *)&v9, 0x2Cu);
    }

    objc_msgSend(WeakRetained, "setDataMigrationStage:", objc_msgSend(WeakRetained, "dataMigrationStage") + 1);
    objc_msgSend(WeakRetained, "setDataMigrationBundleIDs:", v6);
    objc_msgSend(*(id *)(a1 + 40), "mergeWithProtectionClasses:power:completionHandler:", *(_QWORD *)(a1 + 48), 1, &__block_literal_global_1451);

  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1450()
{
  NSObject *v0;
  uint8_t v1[16];

  logForCSLogCategoryDefault();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_213CF1000, v0, OS_LOG_TYPE_INFO, "Finished post-migration merge", v1, 2u);
  }

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1454(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _xpc_activity_s *v10;
  xpc_activity_state_t v11;
  _QWORD v12[4];
  _xpc_activity_s *v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x2199C2D78]();
  if (xpc_activity_get_state(v3) == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      logForCSLogCategoryIndex();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "com.apple.searchd.expirations";
        _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      if ((objc_msgSend((id)sDelegate, "deviceFirstUnlockedInMKB") & 1) != 0)
      {
        v7 = dispatch_group_create();
        objc_msgSend(WeakRetained, "revokeExpiredItems:protected:", v7, 0);
        objc_msgSend(WeakRetained, "issueDuplicateOidCheckWithGroup:protected:", v7, 0);
        v8 = sIndexQueue;
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1455;
        v12[3] = &unk_24D0EA758;
        v13 = v3;
        _setup_block(v12, 0, 11719);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_notify(v7, v8, v9);

LABEL_10:
        goto LABEL_11;
      }
      v10 = v3;
      v11 = 3;
    }
    else
    {
      v10 = v3;
      v11 = 5;
    }
    xpc_activity_set_state(v10, v11);
    goto LABEL_10;
  }
LABEL_11:
  objc_autoreleasePoolPop(v4);

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1455(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  logForCSLogCategoryIndex();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "com.apple.searchd.expirations";
    _os_log_impl(&dword_213CF1000, v1, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%s as done", (uint8_t *)&v2, 0xCu);
  }

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1456(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  id WeakRetained;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  _xpc_activity_s *v13;
  char *v14;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  CFTypeRef v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x2199C2D78]();
  if (xpc_activity_get_state(v3) == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      logForCSLogCategoryIndex();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "com.apple.searchd.expirations.AB";
        _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      cf = 0;
      v20[0] = CFSTR("MKBAssertionKey");
      v20[1] = CFSTR("MKBAssertionTimeout");
      v21[0] = CFSTR("Other");
      v21[1] = &unk_24D0FD2A0;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v7 = (char *)MKBDeviceLockAssertion();
      logForCSLogCategoryIndex();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v7;
        v18 = 2112;
        v19 = cf;
        _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "Took lock assertion for expirations %@, err: %@", buf, 0x16u);
      }

      if (v7)
      {
        v9 = dispatch_group_create();
        objc_msgSend(WeakRetained, "revokeExpiredItems:protected:", v9, 1);
        objc_msgSend(WeakRetained, "issueDuplicateOidCheckWithGroup:protected:", v9, 1);
        v10 = sIndexQueue;
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1464;
        v12[3] = &unk_24D0EA9D8;
        v13 = v3;
        v14 = v7;
        _setup_block(v12, 0, 11749);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_notify(v9, v10, v11);

      }
      else
      {
        xpc_activity_set_state(v3, 3);
      }

    }
    else
    {
      xpc_activity_set_state(v3, 5);
    }

  }
  objc_autoreleasePoolPop(v4);

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1464(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  logForCSLogCategoryIndex();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "com.apple.searchd.expirations.AB";
    _os_log_impl(&dword_213CF1000, v1, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%s as done", (uint8_t *)&v2, 0xCu);
  }

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1466(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  _xpc_activity_s *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x2199C2D78]();
  if (xpc_activity_get_state(v3) == 2)
  {
    if (xpc_activity_should_defer(v3))
    {
      v5 = xpc_activity_set_state(v3, 3);
      logForCSLogCategoryIndex();
      v6 = objc_claimAutoreleasedReturnValue();
      WeakRetained = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "com.apple.searchd.defrag";
          v16 = 2048;
          v17 = 2;
          _os_log_impl(&dword_213CF1000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Deferring XPC activity:%s, state:%ld", buf, 0x16u);
        }
LABEL_14:

        goto LABEL_15;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __30__SPCoreSpotlightIndexer_init__block_invoke_1466_cold_1();

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      logForCSLogCategoryIndex();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "com.apple.searchd.defrag";
        _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      v9 = dispatch_group_create();
      -[NSObject issueDefrag:group:](WeakRetained, "issueDefrag:group:", 0, v9);
      v10 = sIndexQueue;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1467;
      v12[3] = &unk_24D0EA758;
      v13 = v3;
      _setup_block(v12, 0, 11785);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v9, v10, v11);

    }
    else
    {
      xpc_activity_set_state(v3, 5);
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_autoreleasePoolPop(v4);

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1467(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  logForCSLogCategoryIndex();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "com.apple.searchd.defrag";
    _os_log_impl(&dword_213CF1000, v1, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%s as done", (uint8_t *)&v2, 0xCu);
  }

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1469(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  _xpc_activity_s *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x2199C2D78]();
  if (xpc_activity_get_state(v3) == 2)
  {
    if (xpc_activity_should_defer(v3))
    {
      v5 = xpc_activity_set_state(v3, 3);
      logForCSLogCategoryIndex();
      v6 = objc_claimAutoreleasedReturnValue();
      WeakRetained = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "com.apple.searchd.loadtrial";
          v16 = 2048;
          v17 = 2;
          _os_log_impl(&dword_213CF1000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Deferring XPC activity:%s, state:%ld", buf, 0x16u);
        }
LABEL_14:

        goto LABEL_15;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __30__SPCoreSpotlightIndexer_init__block_invoke_1469_cold_1();

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      logForCSLogCategoryIndex();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "com.apple.searchd.loadtrial";
        _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      v9 = dispatch_group_create();
      -[NSObject issueLoadTrial:](WeakRetained, "issueLoadTrial:", v9);
      v10 = sIndexQueue;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1470;
      v12[3] = &unk_24D0EA758;
      v13 = v3;
      _setup_block(v12, 0, 11818);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v9, v10, v11);

    }
    else
    {
      xpc_activity_set_state(v3, 5);
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_autoreleasePoolPop(v4);

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1470(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  logForCSLogCategoryIndex();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "com.apple.searchd.loadtrial";
    _os_log_impl(&dword_213CF1000, v1, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%s as done", (uint8_t *)&v2, 0xCu);
  }

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1472(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  _xpc_activity_s *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x2199C2D78]();
  if (xpc_activity_get_state(v3) == 2)
  {
    if (xpc_activity_should_defer(v3))
    {
      v5 = xpc_activity_set_state(v3, 3);
      logForCSLogCategoryIndex();
      v6 = objc_claimAutoreleasedReturnValue();
      WeakRetained = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v16 = "com.apple.searchd.heartbeat";
          v17 = 2048;
          v18 = 2;
          _os_log_impl(&dword_213CF1000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Deferring XPC activity:%s, state:%ld", buf, 0x16u);
        }
LABEL_14:

        goto LABEL_15;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __30__SPCoreSpotlightIndexer_init__block_invoke_1472_cold_1();

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      logForCSLogCategoryIndex();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "com.apple.searchd.heartbeat";
        _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      v9 = dispatch_group_create();
      v10 = (id)-[NSObject issueHeartbeat:](WeakRetained, "issueHeartbeat:", v9);
      v11 = sIndexQueue;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1473;
      v13[3] = &unk_24D0EA758;
      v14 = v3;
      _setup_block(v13, 0, 11852);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v9, v11, v12);

    }
    else
    {
      xpc_activity_set_state(v3, 5);
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_autoreleasePoolPop(v4);

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1473(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  logForCSLogCategoryIndex();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315138;
    v3 = "com.apple.searchd.heartbeat";
    _os_log_impl(&dword_213CF1000, v1, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%s as done", (uint8_t *)&v2, 0xCu);
  }

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1477(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = CFSTR("com.apple.searchd.reportStorageUsage");
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "Performing background task:%@", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x2199C2D78]();
  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_1481;
  v8[3] = &unk_24D0EA758;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v2, "setExpirationHandler:", v8);
  objc_msgSend((id)sDelegate, "indexDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectAtPath:", v7);

  if ((objc_msgSend(v6, "canceled") & 1) == 0)
    objc_msgSend(v2, "setTaskCompleted");

  objc_autoreleasePoolPop(v4);
}

uint64_t __30__SPCoreSpotlightIndexer_init__block_invoke_1481(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = CFSTR("com.apple.searchd.reportStorageUsage");
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Task %@ cancelled", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setCanceled:", 1);
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1482(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "reindexAllItemsSource");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v3);

    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_2_1483;
    v4[3] = &unk_24D0EA758;
    v5 = v2;
    objc_msgSend(v5, "_reindexAllItemsWithExtensionsAndCompletionBlock:", v4);

  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_2_1483(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "reindexAllItemsSource");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v1);

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_3_1484(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "reindexAllItemsWithIdentifiersSource");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v3);

    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __30__SPCoreSpotlightIndexer_init__block_invoke_4_1485;
    v4[3] = &unk_24D0EA758;
    v5 = v2;
    objc_msgSend(v5, "_reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock:", v4);

  }
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_4_1485(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "reindexAllItemsWithIdentifiersSource");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v1);

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained;
  NSObject *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a5 && WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "reindexAllItemsSource");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_merge_data(v7, 1uLL);

    WeakRetained = v8;
  }

}

void __30__SPCoreSpotlightIndexer_init__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained;
  NSObject *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a5 && WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "reindexAllItemsWithIdentifiersSource");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_merge_data(v7, 1uLL);

    WeakRetained = v8;
  }

}

- (void)resume
{
  NSObject *v3;
  uint8_t v4[16];

  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "resume from delegate", v4, 2u);
  }

  -[SPCoreSpotlightIndexer _registerForPrefsChanges](self, "_registerForPrefsChanges");
}

- (void)unlock
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "unlock from delegate", v8, 2u);
  }

  if (objc_msgSend((id)sDelegate, "deviceFirstUnlockedInSB"))
  {
    -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CD0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resumeIndex");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CD8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resumeIndex");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CE8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resumeIndex");

  }
  if (self->_updatePersonas)
    -[SPCoreSpotlightIndexer personaListDidUpdate](self, "personaListDidUpdate");
}

- (void)locking
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[16];

  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "locking from delegate enter", buf, 2u);
  }

  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SDTransactionCreate(&unk_24D0FD060);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suspendIndexForDeviceLock:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CD8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspendIndexForDeviceLock:", v6);

  -[SPCoreSpotlightIndexer firstUnlockQueue](self, "firstUnlockQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SPCoreSpotlightIndexer_locking__block_invoke;
  block[3] = &unk_24D0EA758;
  v12 = v5;
  v10 = v5;
  dispatch_group_notify(v6, v9, block);

}

void __33__SPCoreSpotlightIndexer_locking__block_invoke()
{
  id v0;
  NSObject *v1;
  uint8_t v2[16];

  v0 = (id)objc_opt_self();
  logForCSLogCategoryIndex();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_213CF1000, v1, OS_LOG_TYPE_DEFAULT, "locking from delegate exit", v2, 2u);
  }

}

- (void)locked
{
  NSObject *v2;
  uint8_t v3[16];

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "locked from delegate", v3, 2u);
  }

}

- (void)lockingCx
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[16];

  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, "locking Cx from delegate", buf, 2u);
  }

  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SDTransactionCreate(&unk_24D0FD078);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suspendIndexForDeviceLock:", v6);

  -[SPCoreSpotlightIndexer firstUnlockQueue](self, "firstUnlockQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SPCoreSpotlightIndexer_lockingCx__block_invoke;
  block[3] = &unk_24D0EA758;
  v11 = v5;
  v9 = v5;
  dispatch_group_notify(v6, v8, block);

}

id __35__SPCoreSpotlightIndexer_lockingCx__block_invoke()
{
  return (id)objc_opt_self();
}

- (void)lockedCx
{
  NSObject *v2;
  uint8_t v3[16];

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "locked Cx from delegate", v3, 2u);
  }

}

- (OS_dispatch_queue)indexQueue
{
  return (OS_dispatch_queue *)objc_msgSend((id)sDelegate, "indexQueue");
}

- (OS_dispatch_queue)firstUnlockQueue
{
  return (OS_dispatch_queue *)objc_msgSend((id)sDelegate, "firstUnlockQueue");
}

- (id)searchServiceName
{
  return -[NSString stringByAppendingString:](self->_serviceName, "stringByAppendingString:", CFSTR(".search"));
}

- (id)indexServiceName
{
  return -[NSString stringByAppendingString:](self->_serviceName, "stringByAppendingString:", CFSTR(".index"));
}

- (id)delegateServiceName
{
  return -[NSString stringByAppendingString:](self->_serviceName, "stringByAppendingString:", CFSTR(".delegate"));
}

- (void)setServiceName:(id)a3
{
  NSString *v4;
  NSString *serviceName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  serviceName = self->_serviceName;
  self->_serviceName = v4;

}

- (void)_upgradeToPriorityIndex
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "### firstUnlock == NO, can't upgrade to priority index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __49__SPCoreSpotlightIndexer__upgradeToPriorityIndex__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "### _SITransferBundles complete res: %d", (uint8_t *)v5, 8u);
  }

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:sync:", &unk_24D0FD1C8, CFSTR("kSPPriorityIndexVersion"), 0);
    objc_msgSend(*(id *)(a1 + 40), "setProperty:forKey:sync:", &unk_24D0FD1C8, CFSTR("kSPPriorityIndexVersion"), 0);
    sUpgradedForPriorityIndex = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)upgradeCheck
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SPCoreSpotlightIndexer_upgradeCheck__block_invoke;
  block[3] = &unk_24D0EA758;
  block[4] = self;
  if (upgradeCheck_onceToken != -1)
    dispatch_once(&upgradeCheck_onceToken, block);
}

uint64_t __38__SPCoreSpotlightIndexer_upgradeCheck__block_invoke(uint64_t result)
{
  if (sUsePriorityIndex == 1)
    return objc_msgSend(*(id *)(result + 32), "_upgradeToPriorityIndex");
  return result;
}

- (void)start
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SPCoreSpotlightIndexer_start__block_invoke;
  block[3] = &unk_24D0EA758;
  block[4] = self;
  if (start_onceToken != -1)
    dispatch_once(&start_onceToken, block);
}

void __31__SPCoreSpotlightIndexer_start__block_invoke(uint64_t a1)
{
  id v2;
  const char *v3;
  int v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  int v27;
  int v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id WeakRetained;
  id v34;
  NSObject *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD block[5];
  uint8_t v39[8];
  stat buf;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend((id)sDelegate, "indexingEnabled"))
  {
    startIndexAgent(*(void **)(a1 + 32));
    return;
  }
  objc_msgSend((id)sDelegate, "indexDirectory");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v2, "fileSystemRepresentation");

  if (v3)
  {
    v4 = open(v3, 0x100000);
    if (v4 == -1)
    {
      logForCSLogCategoryDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __31__SPCoreSpotlightIndexer_start__block_invoke_cold_2();

    }
    else
    {
      v5 = v4;
      MEMORY[0x2199C24FC]();
      close(v5);
    }
  }
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)MDBootTime());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    buf.st_dev = 138412290;
    *(_QWORD *)&buf.st_mode = v8;
    _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "Noting bootTime:%@", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)sDelegate, "indexDirectory");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "stringWithCString:encoding:", objc_msgSend(v11, "fileSystemRepresentation"), 134217984);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v39 = 0;
  objc_msgSend(v9, "attributesOfFileSystemForPath:error:", v12, v39);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(id *)v39;

  if (v14)
  {
    logForCSLogCategoryDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      buf.st_dev = 138412290;
      *(_QWORD *)&buf.st_mode = v14;
      _os_log_impl(&dword_213CF1000, v15, OS_LOG_TYPE_DEFAULT, "Error retrieving fsProperties: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    if (!v13)
      goto LABEL_15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_15;
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NSFileSystemFreeSize"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (unint64_t)-[NSObject unsignedLongValue](v15, "unsignedLongValue") >> 22 < 0x19)
      {

        logForCSLogCategoryDefault();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf.st_dev) = 0;
          _os_log_impl(&dword_213CF1000, v35, OS_LOG_TYPE_DEFAULT, "Very low disk space detected; opening CoreSpotlight index as read-only",
            (uint8_t *)&buf,
            2u);
        }

        v16 = 1;
        sVeryLowDiskSpace = 1;
        goto LABEL_16;
      }
    }
  }

LABEL_15:
  v16 = 0;
LABEL_16:
  v17 = v16 ^ 1;
  if (isAppleInternalInstall())
  {
    memset(&buf, 0, sizeof(buf));
    if (!stat("/private/var/mobile/spotlightForceLowDisk", &buf))
    {
      logForCSLogCategoryDefault();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __31__SPCoreSpotlightIndexer_start__block_invoke_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);

      v17 = 0;
      v16 = 1;
      sVeryLowDiskSpace = 1;
    }
  }
  memset(&buf, 0, sizeof(buf));
  v26 = (const char *)turboFilePath();
  v27 = stat(v26, &buf);
  sTurboMode = v27 == 0;
  if (!v27)
  {
    _SISetTurboMode();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_213CF1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Start with turbo mode on", v39, 2u);
    }
  }
  v28 = sPrivate;
  objc_msgSend(*(id *)(a1 + 32), "openIndex:forInit:readOnly:", v17, 1, v16);
  if (!v28)
  {
    objc_msgSend(MEMORY[0x24BDC24E8], "sharedManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExtensionDelegate:", v29);

    dispatch_get_global_queue(17, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__SPCoreSpotlightIndexer_start__block_invoke_1510;
    block[3] = &unk_24D0EA758;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v30, block);

    objc_msgSend(MEMORY[0x24BDC23F0], "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 216), v32);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
    v37[0] = v31;
    v37[1] = 3221225472;
    v37[2] = __31__SPCoreSpotlightIndexer_start__block_invoke_3;
    v37[3] = &unk_24D0ECB98;
    v37[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "setDomainCleaner:", v37);

    v34 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 216));
    v36[0] = v31;
    v36[1] = 3221225472;
    v36[2] = __31__SPCoreSpotlightIndexer_start__block_invoke_5;
    v36[3] = &unk_24D0ECBC0;
    v36[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v34, "setProviderMonitor:", v36);

    startAllAgents(*(void **)(a1 + 32));
  }
}

void __31__SPCoreSpotlightIndexer_start__block_invoke_1510(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SPCoreSpotlightIndexer_start__block_invoke_2;
  block[3] = &unk_24D0EA758;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __31__SPCoreSpotlightIndexer_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkIfExtensionsNeedToBeLoaded");
}

uint64_t __31__SPCoreSpotlightIndexer_start__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __31__SPCoreSpotlightIndexer_start__block_invoke_4;
  v9[3] = &unk_24D0EB7A8;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "deleteSearchableItemsWithFileProviderDomains:completionHandler:", v3, v9);
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __31__SPCoreSpotlightIndexer_start__block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __31__SPCoreSpotlightIndexer_start__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "fileProviderActiveProvidersChanged:", a2);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  dispatch_source_cancel((dispatch_source_t)self->_prefsChangeSource);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_dataMigrationFinishObserver);
  objc_msgSend(v3, "removeObserver:", self->_dataMigrationStartObserver);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDC24F0], 0);

  v4.receiver = self;
  v4.super_class = (Class)SPCoreSpotlightIndexer;
  -[SPCoreSpotlightIndexer dealloc](&v4, sel_dealloc);
}

- (void)_enumerateIndexersWithProtectionClasses:(id)a3 forBundleIds:(id)a4 inferPriorityIndex:(BOOL)a5 block:(id)a6
{
  _BOOL4 v7;
  id v10;
  void (**v11)(id, id);
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v7 = a5;
  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v33 = a4;
  v11 = (void (**)(id, id))a6;
  if (!v10)
  {
    objc_msgSend((id)objc_opt_class(), "allProtectionClasses");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (sUsePriorityIndex == 1 && v7)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (!v14)
    {
LABEL_23:

      goto LABEL_24;
    }
    v15 = v14;
    v34 = v10;
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v41;
    v19 = *MEMORY[0x24BDD0CE0];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(v13);
        v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if ((objc_msgSend(v21, "isEqualToString:", v19, v33) & 1) != 0
          || (objc_msgSend(v21, "isEqualToString:", CFSTR("Default")) & 1) != 0)
        {
          v17 = 1;
        }
        else
        {
          v16 |= objc_msgSend(v21, "isEqualToString:", CFSTR("Priority"));
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v15);

    v22 = v16 | ~v17;
    v10 = v34;
    if ((v22 & 1) == 0 && (!v33 || objc_msgSend(v33, "intersectsSet:", sPriorityBundleIds)))
    {
      -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Priority"));
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13)
        v11[2](v11, v13);
      goto LABEL_23;
    }
  }
LABEL_24:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v24 = v10;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v37;
    v35 = *MEMORY[0x24BDD0CE0];
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers", v33);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
        {
          if (!objc_msgSend(v29, "isEqualToString:", CFSTR("Default")))
            continue;
          -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v35);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
            continue;
        }
        v11[2](v11, v31);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v26);
  }

}

- (void)_registerForPrefsChanges
{
  OUTLINED_FUNCTION_0(&dword_213CF1000, a1, a3, "Registering for \"%@\" event", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __56__SPCoreSpotlightIndexer__reindexAllItemsOnPrefsChanges__block_invoke(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 248));
}

- (void)_reindexAllItemsForBundleIDs:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  NSObject *v12;
  void *v13;
  SPCoreSpotlightIndexerTask *v14;
  void *v15;
  SPCoreSpotlightIndexerTask *v16;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") && v11)
  {
    logForCSLogCategoryIndex();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SPCoreSpotlightIndexer _reindexAllItemsForBundleIDs:reason:completionHandler:].cold.1();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 2);
    objc_msgSend(v13, "setReason:", v9);
    v14 = [SPCoreSpotlightIndexerTask alloc];
    objc_msgSend(v11, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:](v14, "initWithIndexJob:indexers:", v13, v15);

    -[SPCoreSpotlightIndexerTask setBundleIDs:](v16, "setBundleIDs:", v8);
    -[SPCoreSpotlightIndexer performIndexerTask:completionHandler:](self, "performIndexerTask:completionHandler:", v16, v10);

  }
  else if (v10)
  {
    v10[2](v10);
  }

}

- (void)flush
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_INFO, "flush", buf, 2u);
  }

  v4 = dispatch_group_create();
  v5 = sIndexQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__SPCoreSpotlightIndexer_flush__block_invoke;
  v7[3] = &unk_24D0EA758;
  v7[4] = self;
  _setup_block(v7, 0, 12453);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v4, v5, v6);

  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __31__SPCoreSpotlightIndexer_flush__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateIndexersWithBlock:", &__block_literal_global_1521);
}

void __31__SPCoreSpotlightIndexer_flush__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "index"))
  {
    objc_msgSend(v2, "index");
    SISyncIndexForLikelyShutdown();
    objc_msgSend(v2, "setDirtyTimeout:", 256);
  }

}

- (void)commitUpdates
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  NSObject *v9;
  uint8_t buf[16];

  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_INFO, "commitUpdates", buf, 2u);
  }

  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = sIndexQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__SPCoreSpotlightIndexer_commitUpdates__block_invoke;
  v8[3] = &unk_24D0EA9D8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  _setup_block(v8, 0, 12483);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v7);

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

void __39__SPCoreSpotlightIndexer_commitUpdates__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __39__SPCoreSpotlightIndexer_commitUpdates__block_invoke_2;
  v2[3] = &unk_24D0EA758;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "commitUpdatesWithCompletionHandler:", v2);

}

void __39__SPCoreSpotlightIndexer_commitUpdates__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)issueSplit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = dispatch_group_create();
  v8 = sIndexQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __37__SPCoreSpotlightIndexer_issueSplit___block_invoke;
  v11[3] = &unk_24D0EA9D8;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  _setup_block(v11, 0, 12498);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v7, v8, v10);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __37__SPCoreSpotlightIndexer_issueSplit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", *(_QWORD *)(a1 + 40), 0, &__block_literal_global_1522);
}

uint64_t __37__SPCoreSpotlightIndexer_issueSplit___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueSplit");
}

- (void)mergeWithProtectionClasses:(id)a3 power:(BOOL)a4 completionHandler:(id)a5
{
  -[SPCoreSpotlightIndexer mergeWithProtectionClasses:power:inferPriorityIndex:completionHandler:](self, "mergeWithProtectionClasses:power:inferPriorityIndex:completionHandler:", a3, a4, 1, a5);
}

- (void)mergeWithProtectionClasses:(id)a3 power:(BOOL)a4 inferPriorityIndex:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  SPCoreSpotlightIndexer *v19;
  id v20;
  BOOL v21;
  BOOL v22;

  v10 = a3;
  v11 = a6;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke;
  v17[3] = &unk_24D0ECD08;
  v18 = v10;
  v19 = self;
  v21 = a5;
  v22 = a4;
  v20 = v11;
  v12 = v11;
  v13 = v10;
  v14 = (void *)MEMORY[0x2199C2F34](v17);
  v15 = sIndexQueue;
  _setup_block(v14, 0, 12545);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v15, v16);

}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_group_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  _QWORD v16[4];
  dispatch_group_t v17;
  id v18;
  char v19;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = dispatch_group_create();
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(unsigned __int8 *)(a1 + 56);
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2;
  v16[3] = &unk_24D0ECCE0;
  v17 = v3;
  v19 = *(_BYTE *)(a1 + 57);
  v8 = v2;
  v18 = v8;
  v9 = v3;
  objc_msgSend(v4, "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", v5, v6, v16);
  dispatch_get_global_queue(17, 2uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_1528;
  block[3] = &unk_24D0EA840;
  v11 = *(id *)(a1 + 48);
  v14 = v8;
  v15 = v11;
  v12 = v8;
  dispatch_group_notify(v9, v10, block);

}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  id *v7;
  id *v8;
  id *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = *(unsigned __int8 *)(a1 + 48);
  logForCSLogCategoryIndex();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
      __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2_cold_2();

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_1523;
    v14[3] = &unk_24D0ECCB8;
    v7 = &v15;
    v15 = v3;
    v8 = &v16;
    v16 = *(id *)(a1 + 40);
    v9 = &v17;
    v17 = *(id *)(a1 + 32);
    objc_msgSend(v3, "scheduleMaintenance:description:forDarkWake:", v14, CFSTR("searchutil forced maintenance"), 1);
  }
  else
  {
    if (v6)
      __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2_cold_1();

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_1527;
    v10[3] = &unk_24D0EC208;
    v7 = &v11;
    v11 = v3;
    v8 = &v12;
    v12 = *(id *)(a1 + 40);
    v9 = &v13;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v3, "mergeWithCompletionHandler:", v10);
  }

}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_1523(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  NSObject *v13;
  id v14;

  v6 = a5;
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_1523_cold_1();

  dispatch_group_enter(v6);
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_1524;
  v10[3] = &unk_24D0ECC90;
  v11 = v8;
  v12 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = *(id *)(a1 + 48);
  v9 = v6;
  objc_msgSend(v11, "mergeWithCompletionHandler:", v10);

}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_1524(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    logForCSLogCategoryIndex();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "dataclass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "*warn* Failed to merge the index for dataclass:%@, error:%@", (uint8_t *)&v10, 0x16u);

    }
  }
  v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3 == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dataclass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  objc_sync_exit(v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_1527(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    logForCSLogCategoryIndex();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "dataclass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "*warn* Failed to merge the index for dataclass:%@, error:%@", (uint8_t *)&v10, 0x16u);

    }
  }
  v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3 == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dataclass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  objc_sync_exit(v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_1528(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2199C2D78]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)mergeWithProtectionClasses:(id)a3 power:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;

  v4 = a4;
  v6 = a3;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power___block_invoke;
  v9[3] = &unk_24D0ECBC0;
  v10 = v7;
  v8 = v7;
  -[SPCoreSpotlightIndexer mergeWithProtectionClasses:power:completionHandler:](self, "mergeWithProtectionClasses:power:completionHandler:", v6, v4, v9);

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

void __59__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)mergeWithProtectionClasses:(id)a3 completionHandler:(id)a4
{
  -[SPCoreSpotlightIndexer mergeWithProtectionClasses:power:completionHandler:](self, "mergeWithProtectionClasses:power:completionHandler:", a3, 1, a4);
}

- (void)cleanupStringsWithProtectionClasses:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  SPCoreSpotlightIndexer *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke;
  v13[3] = &unk_24D0EB758;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x2199C2F34](v13);
  v11 = sIndexQueue;
  _setup_block(v10, 0, 12581);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v11, v12);

}

void __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_group_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  dispatch_group_t v16;
  id v17;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = dispatch_group_create();
  v4 = MEMORY[0x24BDAC760];
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_2;
  v15[3] = &unk_24D0ECD30;
  v16 = v3;
  v7 = v2;
  v17 = v7;
  v8 = v3;
  objc_msgSend(v5, "_enumerateIndexersWithProtectionClasses:block:", v6, v15);
  dispatch_get_global_queue(9, 2uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_1529;
  v12[3] = &unk_24D0EA840;
  v10 = *(id *)(a1 + 48);
  v13 = v7;
  v14 = v10;
  v11 = v7;
  dispatch_group_notify(v8, v9, v12);

}

void __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_3;
  v5[3] = &unk_24D0EC208;
  v6 = v3;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v4 = v3;
  objc_msgSend(v4, "cleanupStringsWithCompletionHandler:", v5);

}

void __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    logForCSLogCategoryIndex();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "dataclass");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "Failed to cleanup the strings for dataclass:%@, error:%@", (uint8_t *)&v10, 0x16u);

    }
  }
  v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3 == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dataclass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  objc_sync_exit(v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __80__SPCoreSpotlightIndexer_cleanupStringsWithProtectionClasses_completionHandler___block_invoke_1529(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2199C2D78]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)issueRepair:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = dispatch_group_create();
  v8 = sIndexQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__SPCoreSpotlightIndexer_issueRepair___block_invoke;
  v11[3] = &unk_24D0EA9D8;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  _setup_block(v11, 0, 12594);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v7, v8, v10);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __38__SPCoreSpotlightIndexer_issueRepair___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", *(_QWORD *)(a1 + 40), 0, &__block_literal_global_1530);
}

uint64_t __38__SPCoreSpotlightIndexer_issueRepair___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueRepair");
}

- (void)issueCleanup:(id)a3 flags:(int)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  int v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  if (v6)
  {
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = dispatch_group_create();
  v9 = sIndexQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __45__SPCoreSpotlightIndexer_issueCleanup_flags___block_invoke;
  v12[3] = &unk_24D0EAB38;
  v12[4] = self;
  v13 = v7;
  v14 = a4;
  v10 = v7;
  _setup_block(v12, 0, 12609);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v8, v9, v11);

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __45__SPCoreSpotlightIndexer_issueCleanup_flags___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[4];
  int v5;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__SPCoreSpotlightIndexer_issueCleanup_flags___block_invoke_2;
  v4[3] = &__block_descriptor_36_e40_v16__0__SPConcreteCoreSpotlightIndexer_8l;
  v5 = *(_DWORD *)(a1 + 48);
  return objc_msgSend(v2, "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", v1, 0, v4);
}

uint64_t __45__SPCoreSpotlightIndexer_issueCleanup_flags___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cleanupStringsWithActivity:group:shouldDefer:flags:", 0, 0, 0, *(unsigned int *)(a1 + 32));
}

- (void)issueDefrag:(id)a3 group:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  dispatch_group_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  NSObject *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v17[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = v7;
  if (!v7)
    v9 = dispatch_group_create();
  v10 = sIndexQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __44__SPCoreSpotlightIndexer_issueDefrag_group___block_invoke;
  v14[3] = &unk_24D0EA8C0;
  v14[4] = self;
  v11 = v8;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  _setup_block(v14, 0, 12627);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v12, v10, v13);

  if (!v7)
    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

}

void __44__SPCoreSpotlightIndexer_issueDefrag_group___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__SPCoreSpotlightIndexer_issueDefrag_group___block_invoke_2;
  v3[3] = &unk_24D0ECC48;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", v2, 0, v3);

}

uint64_t __44__SPCoreSpotlightIndexer_issueDefrag_group___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueDefrag:", *(_QWORD *)(a1 + 32));
}

- (void)issueLoadTrial:(id)a3
{
  objc_msgSend((id)sDelegate, "issueLoadTrial:", a3);
}

- (void)issueSharedDocumentAttributeFixup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "issueSharedDocumentAttributeFixup is not supported on iOS.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)issueDumpReverse:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v6 = a4;
  v7 = sIndexQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__SPCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke;
  v10[3] = &unk_24D0ECDC0;
  v11 = v6;
  v12 = a3;
  v10[4] = self;
  v8 = v6;
  _setup_block(v10, 0, 12749);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v9);

}

void __61__SPCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v8[0] = *MEMORY[0x24BDD0CE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__SPCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke_2;
  v5[3] = &unk_24D0ECD98;
  v4 = (void *)a1[5];
  v7 = a1[6];
  v6 = v4;
  objc_msgSend(v2, "_enumerateIndexersWithProtectionClasses:block:", v3, v5);

}

uint64_t __61__SPCoreSpotlightIndexer_issueDumpReverse_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueDumpReverse:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)issueDumpForward:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v6 = a4;
  v7 = sIndexQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__SPCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke;
  v10[3] = &unk_24D0ECDC0;
  v11 = v6;
  v12 = a3;
  v10[4] = self;
  v8 = v6;
  _setup_block(v10, 0, 12758);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v9);

}

void __61__SPCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v8[0] = *MEMORY[0x24BDD0CE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__SPCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke_2;
  v5[3] = &unk_24D0ECD98;
  v4 = (void *)a1[5];
  v7 = a1[6];
  v6 = v4;
  objc_msgSend(v2, "_enumerateIndexersWithProtectionClasses:block:", v3, v5);

}

uint64_t __61__SPCoreSpotlightIndexer_issueDumpForward_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueDumpForward:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)issueHeartbeat:(id)a3
{
  void *v3;
  void *v4;
  time_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  time_t v30;

  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  indexHeartbeatPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = time(0);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v3);

  v8 = 0;
  v9 = MEMORY[0x24BDAC760];
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __41__SPCoreSpotlightIndexer_issueHeartbeat___block_invoke;
    v27[3] = &unk_24D0ECDE8;
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v4;
    v30 = v5;
    v11 = v28;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v27);
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __41__SPCoreSpotlightIndexer_issueHeartbeat___block_invoke_2;
    v25[3] = &unk_24D0ECE10;
    v8 = v10;
    v26 = v8;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v25);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("pcA_wipes"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("pcB_wipes"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("pcC_wipes"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("pcCX_wipes"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("pcPriority_wipes"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("lastSent"));

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v8, "writeToURL:error:", v18, &v24);
  v19 = v24;

  if (v19)
  {
    logForCSLogCategoryDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SPCoreSpotlightIndexer issueHeartbeat:].cold.1();

  }
  pthread_rwlock_unlock(&sIndexHeartbeatLock);
  v23 = v4;
  AnalyticsSendEventLazy();
  v21 = v23;

  return v21;
}

void __41__SPCoreSpotlightIndexer_issueHeartbeat___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v9;
    if ((objc_msgSend(&unk_24D0FCF58, "containsObject:", v6) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "isEqualToString:", CFSTR("build")) & 1) == 0)
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);
      goto LABEL_11;
    }
    v7 = v5;
    if ((objc_msgSend(v6, "hasSuffix:", CFSTR("_age")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("timesinceboot")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("timesinceupdate")))
    {
      if ((objc_msgSend(v7, "longValue") & 0x8000000000000000) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(_QWORD *)(a1 + 48) - objc_msgSend(v7, "longValue"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v6);

      }
      goto LABEL_9;
    }
    if ((objc_msgSend(v6, "hasSuffix:", CFSTR("_wipes")) & 1) != 0
      || (objc_msgSend(v6, "hasSuffix:", CFSTR("_wipes_aggregate")) & 1) != 0
      || objc_msgSend(v6, "hasSuffix:", CFSTR("_obj_count")))
    {
      if (objc_msgSend(v7, "longValue") < 0)
      {
LABEL_9:

LABEL_11:
        goto LABEL_12;
      }
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("lastSent")) & 1) != 0)
    {
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);
    goto LABEL_9;
  }
LABEL_12:

}

uint64_t __41__SPCoreSpotlightIndexer_issueHeartbeat___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, a2);
}

id __41__SPCoreSpotlightIndexer_issueHeartbeat___block_invoke_1544(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)dumpIndexAgesAtPath:(id)a3
{
  id v3;
  void *v4;
  time_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  time_t v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = time(0);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v3);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __46__SPCoreSpotlightIndexer_dumpIndexAgesAtPath___block_invoke;
    v12[3] = &unk_24D0ECDE8;
    v13 = v9;
    v14 = v4;
    v15 = v5;
    v10 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
    objc_msgSend(v8, "removeObjectsForKeys:", v10);

  }
  return v4;
}

void __46__SPCoreSpotlightIndexer_dumpIndexAgesAtPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v9;
    if ((objc_msgSend(&unk_24D0FCF58, "containsObject:", v6) & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v5;
        if (((objc_msgSend(v6, "hasSuffix:", CFSTR("_age")) & 1) != 0
           || (objc_msgSend(v6, "isEqualToString:", CFSTR("timesinceboot")) & 1) != 0
           || (objc_msgSend(v6, "isEqualToString:", CFSTR("timesinceupdate")) & 1) != 0
           || objc_msgSend(v6, "isEqualToString:", CFSTR("lastSent")))
          && (objc_msgSend(v7, "longValue") & 0x8000000000000000) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(_QWORD *)(a1 + 48) - objc_msgSend(v7, "longValue"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v6);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    }

  }
}

- (id)dumpIndexAges
{
  void *v3;
  void *v4;

  pthread_rwlock_rdlock(&sIndexHeartbeatLock);
  indexHeartbeatPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightIndexer dumpIndexAgesAtPath:](self, "dumpIndexAgesAtPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(&sIndexHeartbeatLock);

  return v4;
}

- (id)dumpIndexAnalyticsAtPath:(id)a3
{
  id v3;
  void *v4;
  time_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  time_t v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = time(0);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v3);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __51__SPCoreSpotlightIndexer_dumpIndexAnalyticsAtPath___block_invoke;
    v12[3] = &unk_24D0ECDE8;
    v13 = v9;
    v14 = v4;
    v15 = v5;
    v10 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
    objc_msgSend(v8, "removeObjectsForKeys:", v10);

  }
  return v4;
}

void __51__SPCoreSpotlightIndexer_dumpIndexAnalyticsAtPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v14;
      v7 = v5;
      if ((objc_msgSend(&unk_24D0FCF70, "containsObject:", v6) & 1) != 0)
      {
        v8 = objc_msgSend(v7, "longValue");
        v9 = (void *)MEMORY[0x24BDD16E0];
        if (v8 < 0)
        {
          v12 = (void *)MEMORY[0x24BDD16E0];
          v11 = -1;
        }
        else
        {
          v10 = *(_QWORD *)(a1 + 48);
          v11 = v10 - objc_msgSend(v7, "longValue");
          v12 = v9;
        }
        objc_msgSend(v12, "numberWithLong:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v6);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      }

    }
  }

}

- (id)dumpIndexAnalytics
{
  void *v3;
  void *v4;

  pthread_rwlock_rdlock(&sIndexOpenRecordLock);
  indexOpenRecordPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightIndexer dumpIndexAnalyticsAtPath:](self, "dumpIndexAnalyticsAtPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(&sIndexOpenRecordLock);

  return v4;
}

- (id)sendAnalytics:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("heartbeat")))
  {
    -[SPCoreSpotlightIndexer issueHeartbeat:](self, "issueHeartbeat:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("indexloss")))
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "indexLossAnalyticsDictWithPreviousIndexCreationDate:size:openingInReadOnly:fullyCreated:forAnalytics:", 0, 0, 0, 1, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

  }
  else
  {
    v5 = &unk_24D0FD338;
  }

  return v5;
}

id __40__SPCoreSpotlightIndexer_sendAnalytics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)fileProviderProtectionClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDD0CE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)deleteSearchableItemsWithFileProviderDomains:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v15 = a4;
  _checkUnlock();
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  v28 = 0;
  v6 = dispatch_group_create();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend((id)objc_opt_class(), "fileProviderProtectionClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        -[NSDictionary objectForKeyedSubscript:](self->_concreteIndexers, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          dispatch_group_enter(v6);
          v20[0] = MEMORY[0x24BDAC760];
          v20[1] = 3221225472;
          v20[2] = __89__SPCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke;
          v20[3] = &unk_24D0EB7A8;
          v22 = v27;
          v21 = v6;
          objc_msgSend(v11, "deleteSearchableItemsWithFileProviderDomains:completionHandler:", v16, v20);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v8);
  }

  self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
  v12 = sIndexQueue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__SPCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2;
  v17[3] = &unk_24D0ECE60;
  v17[4] = self;
  v13 = v15;
  v18 = v13;
  v19 = v27;
  _setup_block(v17, 0, 12962);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v6, v12, v14);

  _Block_object_dispose(v27, 8);
}

void __89__SPCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __89__SPCoreSpotlightIndexer_deleteSearchableItemsWithFileProviderDomains_completionHandler___block_invoke_2(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)issuePathFixup:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = dispatch_group_create();
  v6 = sIndexQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__SPCoreSpotlightIndexer_issuePathFixup___block_invoke;
  v9[3] = &unk_24D0EA9D8;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  _setup_block(v9, 0, 12973);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v5, v6, v8);

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __41__SPCoreSpotlightIndexer_issuePathFixup___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", v2, 0, &__block_literal_global_1557);

}

uint64_t __41__SPCoreSpotlightIndexer_issuePathFixup___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fixupPathTimeouts");
}

- (void)issueResolveFPItem:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1001, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v10 = 0;
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  +[SPConcreteCoreSpotlightIndexer fetchParentsForItemID:recursively:timeout:](SPConcreteCoreSpotlightIndexer, "fetchParentsForItemID:recursively:timeout:", v5, 1, -1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("itemID: %@ parents[%@]"), v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  logForCSLogCategoryIndex();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v10;
    _os_log_impl(&dword_213CF1000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v6)
LABEL_5:
    v6[2](v6, v12, v13);
LABEL_6:

}

- (void)issueResolveFPItemForBundle:(id)a3 domain:(id)a4 identifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v11, "length");
  v15 = (void *)*MEMORY[0x24BDC81A0];
  if (v14)
    v15 = v11;
  v16 = v15;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC82E8]), "initWithProviderID:domainIdentifier:coreSpotlightIdentifier:", v10, v16, v12);
  logForCSLogCategoryIndex();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138413058;
      v21 = v10;
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v12;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_213CF1000, v19, OS_LOG_TYPE_DEFAULT, "bundle: %@ domain: %@ identifier: %@ ->  %@", (uint8_t *)&v20, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v20 = 138412802;
    v21 = v10;
    v22 = 2112;
    v23 = v16;
    v24 = 2112;
    v25 = v12;
    _os_log_error_impl(&dword_213CF1000, v19, OS_LOG_TYPE_ERROR, "Failed to resolve FPItemID for bundle: %@ domain: %@ identifier: %@", (uint8_t *)&v20, 0x20u);
  }

  -[SPCoreSpotlightIndexer issueResolveFPItem:completionHandler:](self, "issueResolveFPItem:completionHandler:", v17, v13);
}

- (void)issueResolveFPItemForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SPConcreteCoreSpotlightIndexer fetchItemForURL:](SPConcreteCoreSpotlightIndexer, "fetchItemForURL:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryIndex();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_213CF1000, v11, OS_LOG_TYPE_DEFAULT, "Resolved %@ ->  %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[SPCoreSpotlightIndexer issueResolveFPItemForURL:completionHandler:].cold.1();
  }

  -[SPCoreSpotlightIndexer issueResolveFPItem:completionHandler:](self, "issueResolveFPItem:completionHandler:", v9, v7);
}

- (void)issueConsistencyCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = dispatch_group_create();
  v8 = sIndexQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__SPCoreSpotlightIndexer_issueConsistencyCheck___block_invoke;
  v11[3] = &unk_24D0EA9D8;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  _setup_block(v11, 0, 13041);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v7, v8, v10);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __48__SPCoreSpotlightIndexer_issueConsistencyCheck___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", *(_QWORD *)(a1 + 40), 0, &__block_literal_global_1562);
}

uint64_t __48__SPCoreSpotlightIndexer_issueConsistencyCheck___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueConsistencyCheck");
}

- (void)issueDuplicateOidCheckWithGroup:(id)a3 protected:(BOOL)a4
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__SPCoreSpotlightIndexer_issueDuplicateOidCheckWithGroup_protected___block_invoke;
  v8[3] = &unk_24D0EAB10;
  v9 = a4;
  v8[4] = self;
  v4 = a3;
  v5 = (void *)MEMORY[0x2199C2F34](v8);
  v6 = sIndexQueue;
  _setup_block(v5, 0, 13067);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v4, v6, v7);

}

void __68__SPCoreSpotlightIndexer_issueDuplicateOidCheckWithGroup_protected___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 40))
  {
    _checkUnlock();
    v2 = *MEMORY[0x24BDD0CD8];
    v8[0] = *MEMORY[0x24BDD0CD0];
    v8[1] = v2;
    v8[2] = *MEMORY[0x24BDD0CE8];
    v3 = (void *)MEMORY[0x24BDBCE30];
    v4 = v8;
    v5 = 3;
  }
  else
  {
    v7 = *MEMORY[0x24BDD0CE0];
    v3 = (void *)MEMORY[0x24BDBCE30];
    v4 = &v7;
    v5 = 1;
  }
  objc_msgSend(v3, "arrayWithObjects:count:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_enumerateIndexersWithProtectionClasses:block:", v6, &__block_literal_global_1563);

}

uint64_t __68__SPCoreSpotlightIndexer_issueDuplicateOidCheckWithGroup_protected___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueDuplicateOidCheck");
}

- (void)issueDuplicateOidCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = dispatch_group_create();
  v8 = sIndexQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__SPCoreSpotlightIndexer_issueDuplicateOidCheck___block_invoke;
  v11[3] = &unk_24D0EA9D8;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  _setup_block(v11, 0, 13079);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v7, v8, v10);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t __49__SPCoreSpotlightIndexer_issueDuplicateOidCheck___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", *(_QWORD *)(a1 + 40), 0, &__block_literal_global_1564);
}

uint64_t __49__SPCoreSpotlightIndexer_issueDuplicateOidCheck___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "issueDuplicateOidCheck");
}

- (void)issueMessagesFixup:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = sIndexQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SPCoreSpotlightIndexer_issueMessagesFixup___block_invoke;
  v8[3] = &unk_24D0EB780;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  _setup_block(v8, 0, 13093);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v7);

}

void __45__SPCoreSpotlightIndexer_issueMessagesFixup___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "concreteIndexerForProtectionClass:andBundleID:", *MEMORY[0x24BDD0CE0], CFSTR("com.apple.MobileSMS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    objc_msgSend(v2, "readyIndex:", 0);
    objc_msgSend(v5, "issueMessagesFixup:", *(_QWORD *)(a1 + 40));
LABEL_5:
    v2 = v5;
    goto LABEL_6;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)coolDown
{
  dispatch_group_t v3;
  NSObject *v4;
  _QWORD v5[4];
  dispatch_group_t v6;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  v3 = dispatch_group_create();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__SPCoreSpotlightIndexer_coolDown__block_invoke;
  v5[3] = &unk_24D0ECC48;
  v6 = v3;
  v4 = v3;
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:block:](self, "_enumerateIndexersWithProtectionClasses:block:", 0, v5);
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

void __34__SPCoreSpotlightIndexer_coolDown__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  NSObject *v10;

  v3 = a2;
  v4 = sIndexQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__SPCoreSpotlightIndexer_coolDown__block_invoke_2;
  v8[3] = &unk_24D0EA9D8;
  v9 = v3;
  v5 = *(NSObject **)(a1 + 32);
  v10 = v5;
  v6 = v3;
  _setup_block(v8, 0, 13105);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v5, v4, v7);

}

uint64_t __34__SPCoreSpotlightIndexer_coolDown__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "coolDown:", *(_QWORD *)(a1 + 40));
}

- (void)_closeIndexWithIndexers:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  CFTypeRef cf;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  CFTypeRef v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  if (!deviceUnlocked)
    SIResumeForUnlock();
  cf = 0;
  v19[0] = CFSTR("MKBAssertionKey");
  v19[1] = CFSTR("MKBAssertionTimeout");
  v20[0] = CFSTR("Other");
  v20[1] = &unk_24D0FD2B8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v5 = (void *)MKBDeviceLockAssertion();
  logForCSLogCategoryIndex();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = cf;
    _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "Took lock assertion for close %@, err: %@", buf, 0x16u);
  }

  v7 = dispatch_group_create();
  v8 = sIndexQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__SPCoreSpotlightIndexer__closeIndexWithIndexers___block_invoke;
  v12[3] = &unk_24D0EA758;
  v9 = v4;
  v13 = v9;
  _setup_block(v12, 0, 13137);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v7, v8, v10);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  logForCSLogCategoryIndex();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_213CF1000, v11, OS_LOG_TYPE_DEFAULT, "Releasing assertion %@", buf, 0xCu);
  }

}

void __50__SPCoreSpotlightIndexer__closeIndexWithIndexers___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "reverseObjectEnumerator", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        if (!deviceUnlocked)
          SIResumeForUnlock();
        objc_msgSend(v6, "closeIndex");
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)closeIndex
{
  void *v3;
  id v4;

  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightIndexer _closeIndexWithIndexers:](self, "_closeIndexWithIndexers:", v3);

}

- (void)shutdown
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightIndexer setConcreteIndexers:](self, "setConcreteIndexers:", 0);
  suspendAllAgents();
  SIWaitForAllIndexShutdown();
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "SPCoreSpotlightIndexer shutdown complete", v5, 2u);
  }

}

- (void)recycleIndex:(BOOL)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[16];

  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "Recycling index", buf, 2u);
  }

  -[SPCoreSpotlightIndexer closeIndex](self, "closeIndex");
  v6 = sIndexQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__SPCoreSpotlightIndexer_recycleIndex___block_invoke;
  v8[3] = &unk_24D0EAB10;
  v8[4] = self;
  v9 = a3;
  _setup_block(v8, 0, 13163);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v6, v7);

}

uint64_t __39__SPCoreSpotlightIndexer_recycleIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openIndex:readOnly:", 0, *(unsigned __int8 *)(a1 + 40));
}

- (void)markIndexPurgeable:(BOOL)a3
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  BOOL v6;

  v3 = sIndexQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__SPCoreSpotlightIndexer_markIndexPurgeable___block_invoke;
  v5[3] = &unk_24D0EAB10;
  v5[4] = self;
  v6 = a3;
  _setup_block(v5, 0, 13179);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, v4);

}

void __45__SPCoreSpotlightIndexer_markIndexPurgeable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "concreteIndexers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (*(_BYTE *)(a1 + 40))
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_shouldPurge"))
          {
            objc_msgSend(v8, "_indexPath");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "markAllFilesPurgeable:purgeableOrNot:", v9, *(unsigned __int8 *)(a1 + 40));

            objc_msgSend(v8, "_createPurgeableTouchFile");
          }
        }
        else if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_hasPurgeableTouchFile"))
        {
          objc_msgSend(v8, "_indexPath");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "markAllFilesPurgeable:purgeableOrNot:", v10, *(unsigned __int8 *)(a1 + 40));

          objc_msgSend(v8, "_removePurgeableTouchFile");
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)recycleAndPurgeIndex
{
  NSObject *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Converting CoreSpotlight index to read-only", (uint8_t *)&v11, 2u);
  }

  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recycleIndex:", 1);

  v4 = +[SPCoreSpotlightIndexer freeIndexDiskSpace](SPCoreSpotlightIndexer, "freeIndexDiskSpace");
  v5 = +[SPCoreSpotlightIndexer totalIndexDiskSpace](SPCoreSpotlightIndexer, "totalIndexDiskSpace");
  if (100 * v4 / v5 < 6 || v4 <= 0x357900000)
  {
    v7 = v5;
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)sDelegate, "indexDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v9;
      v13 = 2048;
      v14 = v4;
      v15 = 2048;
      v16 = v7;
      _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "Marking CoreSpotlight index files purgeable under %@. freeDiskSpace %lu, totalDiskSpace %lu", (uint8_t *)&v11, 0x20u);

    }
    +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "markIndexPurgeable:", 1);

  }
}

- (void)restoreIndexAndClearPurgeable
{
  NSObject *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Converting CoreSpotlight index to read-write", (uint8_t *)&v11, 2u);
  }

  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recycleIndex:", 0);

  v4 = +[SPCoreSpotlightIndexer freeIndexDiskSpace](SPCoreSpotlightIndexer, "freeIndexDiskSpace");
  v5 = +[SPCoreSpotlightIndexer totalIndexDiskSpace](SPCoreSpotlightIndexer, "totalIndexDiskSpace");
  if (100 * v4 / v5 >= 6 && v4 >= 0x357900001)
  {
    v7 = v5;
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)sDelegate, "indexDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v9;
      v13 = 2048;
      v14 = v4;
      v15 = 2048;
      v16 = v7;
      _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "Clearing CoreSpotlight index files purgeable under %@. freeDiskSpace %lu, totalDiskSpace %lu", (uint8_t *)&v11, 0x20u);

    }
    +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "markIndexPurgeable:", 0);

  }
}

- (void)queryPreheat:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = sIndexQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__SPCoreSpotlightIndexer_queryPreheat___block_invoke;
  v8[3] = &unk_24D0EA9D8;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  _setup_block(v8, 0, 13409);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v7);

}

void __39__SPCoreSpotlightIndexer_queryPreheat___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/Library/Spotlight/Assets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = 0,
        objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v12),
        v7 = v12,
        v6,
        !v7))
  {
    objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject fetchAllParametersForLanguages:resourcePath:](v8, "fetchAllParametersForLanguages:resourcePath:", v11, v3);

    v7 = 0;
  }
  else
  {
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __39__SPCoreSpotlightIndexer_queryPreheat___block_invoke_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 32), "_enumerateIndexersWithProtectionClasses:block:", *(_QWORD *)(a1 + 40), &__block_literal_global_1572);
}

uint64_t __39__SPCoreSpotlightIndexer_queryPreheat___block_invoke_1571(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "preheat");
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1580(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;
  int v21;
  _BYTE v22[14];
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!v7)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (!a3)
    {
LABEL_12:
      objc_msgSend(*(id *)(a1 + 40), "schedule");
      goto LABEL_13;
    }
    logForCSLogCategoryIndex();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "queryID");
      v11 = *(void **)(a1 + 48);
      v21 = 67109634;
      *(_DWORD *)v22 = v12;
      *(_WORD *)&v22[4] = 2112;
      *(_QWORD *)&v22[6] = v8;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_DEFAULT, "*warn* Index not available task:%d, dataclass:%@, bundleID:%@", (uint8_t *)&v21, 0x1Cu);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "addJob:", v7))
  {
    objc_msgSend(v7, "cancel");
    logForCSLogCategoryQuery();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "queryID");
      v18 = v17;
      objc_msgSend(v7, "dataclass");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 48);
      v21 = 134218754;
      *(_QWORD *)v22 = v7;
      *(_WORD *)&v22[8] = 1024;
      *(_DWORD *)&v22[10] = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_debug_impl(&dword_213CF1000, v10, OS_LOG_TYPE_DEBUG, "Canceled job:%p, task:%d, dataclass:%@, bundleID:%@", (uint8_t *)&v21, 0x26u);

    }
    goto LABEL_11;
  }
  logForCSLogCategoryQuery();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "queryID");
    v14 = v13;
    objc_msgSend(v7, "dataclass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v21 = 134218754;
    *(_QWORD *)v22 = v7;
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)&v22[10] = v14;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    _os_log_debug_impl(&dword_213CF1000, v9, OS_LOG_TYPE_DEBUG, "Started job:%p, task:%d, dataclass:%@, bundleID:%@", (uint8_t *)&v21, 0x26u);

  }
LABEL_13:

}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1582(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  os_signpost_id_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  if (!v11)
    __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1582_cold_1();
  v12 = v11;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if ((_DWORD)a3 != 2)
  {
    if ((_DWORD)a3 != 1)
    {
      v22 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v12, "dataclass");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(v22 + 16))(v22, a3, a4, a5, a6, v23);

      goto LABEL_20;
    }
    if (!objc_msgSend(*(id *)(a1 + 40), "priorityIndexQuery"))
      goto LABEL_9;
    objc_msgSend(v12, "dataclass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqual:", CFSTR("Priority")))
    {
      v14 = objc_msgSend(*(id *)(a1 + 40), "live");

      if ((v14 & 1) != 0)
      {
LABEL_9:
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        objc_msgSend(*(id *)(a1 + 48), "removeJob:", v12);
        logForCSLogCategoryQuery();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v24 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v12, "dataclass");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = *(_QWORD *)(a1 + 56);
          v27 = 134218754;
          v28 = v12;
          v29 = 2048;
          v30 = v24;
          v31 = 2112;
          v32 = v25;
          v33 = 2112;
          v34 = v26;
          _os_log_debug_impl(&dword_213CF1000, v16, OS_LOG_TYPE_DEBUG, "Finished job:%p, task:%p, dataclass:%@, bundleID:%@", (uint8_t *)&v27, 0x2Au);

        }
LABEL_18:
        objc_msgSend(*(id *)(a1 + 48), "schedule");
        goto LABEL_20;
      }
      v15 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v12, "dataclass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, void *))(v15 + 16))(v15, 2, 0, 0, 0, v13);
    }

    goto LABEL_9;
  }
  v17 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v12, "dataclass");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(v17 + 16))(v17, 2, a4, a5, a6, v18);

  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == *(_QWORD *)(a1 + 88))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    logForCSLogCategoryQuery();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(*(id *)(a1 + 48), "queryID");
    if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v21 = v20;
      if (os_signpost_enabled(v19))
      {
        LOWORD(v27) = 0;
        _os_signpost_emit_with_name_impl(&dword_213CF1000, v19, OS_SIGNPOST_INTERVAL_END, v21, "SPCoreSpotlightLatency", (const char *)&unk_213D89001, (uint8_t *)&v27, 2u);
      }
    }

  }
  if (*(_BYTE *)(a1 + 96))
    goto LABEL_18;
LABEL_20:

}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1585(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  logForCSLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1585_cold_1();

  if ((objc_msgSend(WeakRetained, "canceled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      objc_msgSend(v4, "startQueryWithQueryTask:startHandler:eventHandler:resultsHandler:", WeakRetained, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
LABEL_18:

      goto LABEL_19;
    }
  }
  if ((objc_msgSend(WeakRetained, "willAsyncStart") & 1) == 0 && objc_msgSend(WeakRetained, "siQuery"))
  {
    objc_msgSend(WeakRetained, "siQuery");
    SIQueryRelease();
    objc_msgSend(WeakRetained, "setSiQuery:", 0);
  }
  if ((objc_msgSend(WeakRetained, "finished") & 1) == 0
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                + 24))
  {
    if (*(_BYTE *)(a1 + 112) || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC19B8], -2001, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(WeakRetained, "finishWithError:", v5);
    logForCSLogCategoryQuery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 134218754;
      v11 = v7;
      v12 = 2048;
      v13 = v8;
      v14 = 2048;
      v15 = WeakRetained;
      v16 = 2112;
      v17 = v9;
      _os_log_debug_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEBUG, "Finished all jobs(%ld,%ld), task:%p bundleID:%@", (uint8_t *)&v10, 0x2Au);
    }

    goto LABEL_18;
  }
LABEL_19:

}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1586(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  logForCSLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1585_cold_1();

  if ((objc_msgSend(WeakRetained, "canceled") & 1) == 0)
  {
    v4 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 40), "nextObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        break;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      objc_msgSend(v5, "startQueryWithQueryTask:startHandler:eventHandler:resultsHandler:", WeakRetained, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
      v4 = v5;
    }
    while (!objc_msgSend(WeakRetained, "canceled"));

  }
  if ((objc_msgSend(WeakRetained, "willAsyncStart") & 1) == 0 && objc_msgSend(WeakRetained, "siQuery"))
  {
    objc_msgSend(WeakRetained, "siQuery");
    SIQueryRelease();
    objc_msgSend(WeakRetained, "setSiQuery:", 0);
  }
  if ((objc_msgSend(WeakRetained, "finished") & 1) == 0
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                + 24))
  {
    if (*(_BYTE *)(a1 + 112) || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC19B8], -2001, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(WeakRetained, "finishWithError:", v6);
    logForCSLogCategoryQuery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      v10 = *(_QWORD *)(a1 + 48);
      v11 = 134218754;
      v12 = v8;
      v13 = 2048;
      v14 = v9;
      v15 = 2048;
      v16 = WeakRetained;
      v17 = 2112;
      v18 = v10;
      _os_log_debug_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEBUG, "Finished all jobs(%ld,%ld), task:%p bundleID:%@", (uint8_t *)&v11, 0x2Au);
    }

  }
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1587(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (id)_startQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  logForCSLogCategoryDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer _startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:].cold.1();

  -[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:](self, "_taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v16, v15, v14, v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPCoreSpotlightIndexer startQueryTask:](self, "startQueryTask:", v18);
  return v18;
}

- (id)startQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  logForCSLogCategoryDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:].cold.1();

  -[SPCoreSpotlightIndexer taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:](self, "taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v16, v15, v14, v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPCoreSpotlightIndexer startQueryTask:](self, "startQueryTask:", v18);
  return v18;
}

- (id)taskForTopHitQueryWithQueryString:(id)a3 queryContext:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  logForCSLogCategoryDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer taskForTopHitQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:].cold.1();

  -[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:](self, "_taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v16, v15, v14, v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)startQuery:(id)a3 withContext:(id)a4 eventHandler:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  logForCSLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer startQuery:withContext:eventHandler:handler:].cold.1();

  -[SPCoreSpotlightIndexer _startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:](self, "_startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v13, v12, v11, v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)startQuery:(id)a3 withContext:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  logForCSLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer startQuery:withContext:eventHandler:handler:].cold.1();

  -[SPCoreSpotlightIndexer _startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:](self, "_startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v10, v9, 0, v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)cancelQuery:(id)a3
{
  objc_msgSend(a3, "cancel");
}

- (void)recordEngagementForBundleID:(id)a3 uniqueIdentifier:(id)a4 protectionClass:(id)a5 userQuery:(id)a6 date:(id)a7
{
  objc_msgSend((id)sDelegate, "recordEngagementForBundleID:uniqueIdentifier:protectionClass:userQuery:date:", a3, a4, a5, a6, a7);
}

+ (id)_mergedTokenRewrites:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[4];
  id v31;
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

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v3;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v37;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(obj);
        v28 = v5;
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v5);
        objc_msgSend(v6, "originalToken");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v7);
        v8 = objc_claimAutoreleasedReturnValue();

        v29 = (void *)v8;
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v9 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "originalToken");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)v9;
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v9, v10);

        }
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v6, "variations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v33 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              v17 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v6, "originalToken");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "variation");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringWithFormat:", CFSTR("%@/%@/%ld"), v18, v19, objc_msgSend(v16, "type"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v4, "containsObject:", v20) & 1) == 0)
              {
                objc_msgSend(v4, "addObject:", v20);
                objc_msgSend(v29, "addObject:", v16);
              }

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v13);
        }

        v5 = v28 + 1;
      }
      while (v28 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v26);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __47__SPCoreSpotlightIndexer__mergedTokenRewrites___block_invoke;
  v30[3] = &unk_24D0ECFE8;
  v22 = v21;
  v31 = v22;
  objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v30);

  return v22;
}

void __47__SPCoreSpotlightIndexer__mergedTokenRewrites___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66720]), "initWithOriginalToken:variations:", v5, v6);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
  else
  {
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __47__SPCoreSpotlightIndexer__mergedTokenRewrites___block_invoke_cold_1(v5, v8);

  }
}

- (void)rewriteQueryWithQueryString:(id)a3 context:(id)a4 matchInfo:(id)a5 rewriteHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  dispatch_group_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  char v30;
  qos_class_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  SPCoreSpotlightIndexer *v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  _QWORD v49[4];
  NSObject *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  const __CFString *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v40 = a6;
  v12 = a5;
  v13 = objc_msgSend(v11, "queryID");
  v14 = objc_msgSend(v11, "rankingType");
  logForCSLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    CSRedactString(v10, 0);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    v36 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    v57 = v13;
    v58 = 2112;
    if (v14 == 1)
      v36 = CFSTR("YES");
    v59 = v34;
    v60 = 2112;
    v61 = v36;
    _os_log_debug_impl(&dword_213CF1000, v15, OS_LOG_TYPE_DEBUG, "[rewrite] qid=%ld rewriteQueryWithQueryString=%@ top_hit=%@", buf, 0x20u);

  }
  +[SPConcreteCoreSpotlightIndexer _tokensMaxCountFromMatchInfo:](SPConcreteCoreSpotlightIndexer, "_tokensMaxCountFromMatchInfo:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "userQuery");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPConcreteCoreSpotlightIndexer _setOfTokensToCorrect:tokenMatchInfo:](SPConcreteCoreSpotlightIndexer, "_setOfTokensToCorrect:tokenMatchInfo:", v17, v16);
  v18 = objc_claimAutoreleasedReturnValue();

  v37 = v13;
  v41 = (void *)v18;
  +[SPConcreteCoreSpotlightIndexer _indexIndependentTokenRewritesWithMatchInfo:queryID:setOfTokensToCorrect:](SPConcreteCoreSpotlightIndexer, "_indexIndependentTokenRewritesWithMatchInfo:queryID:setOfTokensToCorrect:", v16, v13, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "protectionClasses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self;
  if (!objc_msgSend(v20, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "allProtectionClasses");
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v21;
  }
  v39 = (void *)v19;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = dispatch_group_create();
  objc_msgSend(v11, "bundleIDs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");
  v26 = MEMORY[0x24BDAC760];
  if (!v25)
  {

    goto LABEL_8;
  }
  objc_msgSend(v11, "bundleIDs");
  v27 = v10;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

  v26 = MEMORY[0x24BDAC760];
  v10 = v27;

  if ((v30 & 1) == 0)
  {
LABEL_8:
    v49[0] = v26;
    v49[1] = 3221225472;
    v49[2] = __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke;
    v49[3] = &unk_24D0ED038;
    v50 = v23;
    v51 = v10;
    v52 = v11;
    v53 = v16;
    v54 = v41;
    v55 = v22;
    -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:block:](v38, "_enumerateIndexersWithProtectionClasses:block:", v20, v49);

  }
  if (v40)
  {
    v31 = qos_class_self();
    dispatch_get_global_queue(v31, 2uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    v42[0] = v26;
    v42[1] = 3221225472;
    v42[2] = __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_4;
    v42[3] = &unk_24D0ED060;
    v43 = v22;
    v44 = v39;
    v45 = v11;
    v48 = v37;
    v47 = v40;
    v46 = v10;
    _setup_block(v42, 0, 13797);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v23, v32, v33);

  }
}

void __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = sIndexQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_2;
  v7[3] = &unk_24D0ED010;
  v8 = v3;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 32);
  v5 = v3;
  _setup_block(v7, 0, 13774);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, v6);

}

void __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_3;
  v7[3] = &unk_24D0EB6E0;
  v6 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  objc_msgSend(v2, "indexDependentTokenRewritesWithQueryString:context:matchInfo:setOfTokensToCorrect:tokenRewritesHandler:", v3, v4, v5, v6, v7);

}

void __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __87__SPCoreSpotlightIndexer_rewriteQueryWithQueryString_context_matchInfo_rewriteHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPCoreSpotlightIndexer _mergedTokenRewrites:](SPCoreSpotlightIndexer, "_mergedTokenRewrites:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v7), "variations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "count");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v5);
  }
  if ((objc_msgSend(*(id *)(a1 + 48), "privateQuery") & 1) == 0)
  {
    logForCSLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 72);
      +[SPConcreteCoreSpotlightIndexer _descriptionWithTokenRewrites:](SPConcreteCoreSpotlightIndexer, "_descriptionWithTokenRewrites:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v25 = v10;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_213CF1000, v9, OS_LOG_TYPE_INFO, "[rewrite] qid:%ld ### Final rewrites: %@", buf, 0x16u);

    }
  }
  if (objc_msgSend(v3, "count"))
  {
    v12 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66718]), "initWithRewrittenTokens:", v3);
    objc_msgSend(v12, "setRewriteContext:", v13);

    v14 = objc_alloc(MEMORY[0x24BE66710]);
    LODWORD(v15) = 0;
    v16 = (void *)objc_msgSend(v14, "initWithSearchQueryString:searchQueryContext:score:", *(_QWORD *)(a1 + 56), v12, v15);
    v17 = *(_QWORD *)(a1 + 64);
    v23 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v17 + 16))(v17, v18, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (id)dateRewritesFromContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  char v24;
  uint64_t v25;
  char v26;
  void *v27;
  id v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  void *v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryUnderstandingOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v7)
  {
    v8 = v7;
    v38 = v5;
    v39 = v3;
    v9 = 0;
    v42 = *(_QWORD *)v55;
    v40 = v6;
    do
    {
      v10 = 0;
      v11 = v9;
      v41 = v8;
      do
      {
        if (*(_QWORD *)v55 != v42)
          objc_enumerationMutation(v6);
        v44 = v10;
        v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v10);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kQPQUOutputToken"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenArgLabels"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 0;
        v43 = v13;
        if (objc_msgSend(v13, "containsObject:", CFSTR("ARG_TIME")))
        {
          +[SPConcreteCoreSpotlightIndexer _sharedSynonyms](SPConcreteCoreSpotlightIndexer, "_sharedSynonyms");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "generateDateSynonymsFromToken:previousToken:isOrdinalToken:", v9, v11, &v53);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 && objc_msgSend(v15, "count"))
          {
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v16 = v15;
            v48 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
            if (v48)
            {
              v17 = *(_QWORD *)v50;
              v47 = *(_QWORD *)v50;
              do
              {
                for (i = 0; i != v48; ++i)
                {
                  if (*(_QWORD *)v50 != v17)
                    objc_enumerationMutation(v16);
                  v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
                  logForCSLogCategoryDefault();
                  v20 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                  {
                    v21 = v11;
                    v22 = v16;
                    v23 = v4;
                    v24 = _os_feature_enabled_impl();
                    v25 = (uint64_t)v9;
                    if ((v24 & 1) == 0)
                    {
                      CSRedactString(v9, 1);
                      v25 = objc_claimAutoreleasedReturnValue();
                      v46 = (void *)v25;
                    }
                    v26 = _os_feature_enabled_impl();
                    v27 = v19;
                    if ((v26 & 1) == 0)
                    {
                      CSRedactString(v19, 1);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = v45;
                    }
                    *(_DWORD *)buf = 138412546;
                    v60 = v25;
                    v61 = 2112;
                    v62 = v27;
                    _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_INFO, "[rewrite] [first pass] adding date synonym = %@ for token = %@", buf, 0x16u);
                    if ((v26 & 1) == 0)

                    v4 = v23;
                    if ((v24 & 1) == 0)

                    v16 = v22;
                    v11 = v21;
                    v17 = v47;
                  }

                  v28 = objc_alloc(MEMORY[0x24BE66728]);
                  LODWORD(v29) = 1050253722;
                  v30 = (void *)objc_msgSend(v28, "initWithVariation:type:confidence:", v19, 4, v29);
                  if (v11 && v53)
                  {
                    objc_msgSend(v11, "stringByAppendingString:", v9);
                    v31 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v31 = v9;
                  }
                  v32 = v31;
                  v33 = objc_alloc(MEMORY[0x24BE66720]);
                  v58 = v30;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = (void *)objc_msgSend(v33, "initWithOriginalToken:variations:", v32, v34);

                  objc_msgSend(v4, "addObject:", v35);
                }
                v48 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
              }
              while (v48);
            }

            v6 = v40;
            v8 = v41;
            v36 = v16;
          }
          else
          {
            v36 = v11;
            v11 = v15;
          }

        }
        v10 = v44 + 1;
        v11 = v9;
      }
      while (v44 + 1 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v8);

    v5 = v38;
    v3 = v39;
  }

  return v4;
}

- (void)processSearchString:(id)a3 intoTrimmedString:(id *)a4 andTokens:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = (void *)MEMORY[0x24BDD14A8];
  v8 = a3;
  objc_msgSend(v7, "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "lowercaseString");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (processSearchString_intoTrimmedString_andTokens__onceToken != -1)
    dispatch_once(&processSearchString_intoTrimmedString_andTokens__onceToken, &__block_literal_global_1604);
  objc_msgSend((id)processSearchString_intoTrimmedString_andTokens__regex, "stringByReplacingMatchesInString:options:range:withTemplate:", v14, 0, 0, objc_msgSend(v14, "length"), &stru_24D0EF078);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = objc_retainAutorelease(v11);
  if (a5)
    *a5 = objc_retainAutorelease(v13);

}

void __74__SPCoreSpotlightIndexer_processSearchString_intoTrimmedString_andTokens___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("[?!\\.,\\-\\+\\*;:\"\\]\\[]+$"),
    0,
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)processSearchString_intoTrimmedString_andTokens__regex;
  processSearchString_intoTrimmedString_andTokens__regex = v0;

}

- (void)rewriteFirstPassQueryWithQueryString:(id)a3 context:(id)a4 trimmedSearchStringTokens:(id)a5 populateDateSynonyms:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  char v27;
  uint64_t v28;
  const char *v29;
  char v30;
  void *v31;
  id v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  SPCoreSpotlightIndexer *v39;
  _BOOL4 v40;
  id v41;
  id v42;
  id obj;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v6 = a6;
  v69 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v42 = a4;
  v10 = a5;
  v11 = v10;
  if (v10 && objc_msgSend(v10, "count"))
  {
    v40 = v6;
    v39 = self;
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = v11;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v47)
    {
      v46 = *(_QWORD *)v60;
      v13 = "Spotlight";
      v44 = v12;
      v45 = v11;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v60 != v46)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          +[SPConcreteCoreSpotlightIndexer _sharedSynonyms](SPConcreteCoreSpotlightIndexer, "_sharedSynonyms");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v15;
          objc_msgSend(v16, "getFirstPassSynonymsForWord:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v49 = i;
            v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v48 = v17;
            v53 = v17;
            v19 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v56;
              do
              {
                v22 = 0;
                v52 = v20;
                do
                {
                  if (*(_QWORD *)v56 != v21)
                    objc_enumerationMutation(v53);
                  v23 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v22);
                  logForCSLogCategoryDefault();
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    v25 = v21;
                    v26 = v18;
                    v27 = _os_feature_enabled_impl();
                    v28 = (uint64_t)v54;
                    if ((v27 & 1) == 0)
                    {
                      CSRedactString(v54, 1);
                      v28 = objc_claimAutoreleasedReturnValue();
                      v51 = (void *)v28;
                    }
                    v29 = v13;
                    v30 = _os_feature_enabled_impl();
                    v31 = v23;
                    if ((v30 & 1) == 0)
                    {
                      CSRedactString(v23, 1);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v31 = v50;
                    }
                    *(_DWORD *)buf = 138412546;
                    v64 = v28;
                    v65 = 2112;
                    v66 = v31;
                    _os_log_impl(&dword_213CF1000, v24, OS_LOG_TYPE_INFO, "[rewrite] [first pass] adding synonym = %@ for token = %@", buf, 0x16u);
                    if ((v30 & 1) == 0)

                    v18 = v26;
                    if ((v27 & 1) == 0)

                    v13 = v29;
                    v21 = v25;
                    v20 = v52;
                  }

                  v32 = objc_alloc(MEMORY[0x24BE66728]);
                  LODWORD(v33) = 1050253722;
                  v34 = (void *)objc_msgSend(v32, "initWithVariation:type:confidence:", v23, 4, v33);
                  objc_msgSend(v18, "addObject:", v34);

                  ++v22;
                }
                while (v20 != v22);
                v20 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
              }
              while (v20);
            }

            v12 = v44;
            i = v49;
            if (objc_msgSend(v18, "count"))
            {
              v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66720]), "initWithOriginalToken:variations:", v54, v18);
              -[NSObject addObject:](v44, "addObject:", v35);

            }
            v11 = v45;
            v17 = v48;
          }

        }
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v47);
    }

    if (v40)
    {
      -[SPCoreSpotlightIndexer dateRewritesFromContext:](v39, "dateRewritesFromContext:", v42);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObjectsFromArray:](v12, "addObjectsFromArray:", v36);

    }
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66718]), "initWithRewrittenTokens:", v12);
    v38 = v42;
    objc_msgSend(v42, "setRewriteContext:", v37);

  }
  else
  {
    logForCSLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v12, OS_LOG_TYPE_INFO, "[rewrite] [first pass] skipping first pass rewrite due to invalid trimmedSearchStringTokens", buf, 2u);
    }
    v38 = v42;
  }

}

- (void)reindexAllItemsWithIndexers:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  unint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (sPrivate)
  {
    if (v10)
      (*((void (**)(id))v10 + 2))(v10);
  }
  else
  {
    v12 = -[SPCoreSpotlightIndexer dataMigrationStage](self, "dataMigrationStage");
    -[SPCoreSpotlightIndexer reindexAllQueue](self, "reindexAllQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke;
    v15[3] = &unk_24D0ED0F8;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    v19 = v12;
    v18 = v11;
    _setup_block(v15, 0, 13952);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v13, v14);

  }
}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const __CFString *v11;
  SPCoreSpotlightIndexerTask *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  SPCoreSpotlightIndexerTask *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  SPCoreSpotlightIndexerTask *v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  _QWORD v35[5];
  SPCoreSpotlightIndexerTask *v36;
  id v37;
  id v38;
  NSObject *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "reindexAllQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

  v27 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v3 = dispatch_group_create();
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 2);
  v4 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "dataclass");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v7);
  }

  v26 = v4;
  objc_msgSend(v28, "setProtectionClasses:", v4);
  if (*(_QWORD *)(a1 + 48))
    v11 = *(const __CFString **)(a1 + 48);
  else
    v11 = CFSTR("triggered by -[SPCoreSpotlightIndexer reindexAllItemsWithIndexers:...]");
  objc_msgSend(v28, "setReason:", v11);
  v12 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:]([SPCoreSpotlightIndexerTask alloc], "initWithIndexJob:indexers:", v28, *(_QWORD *)(a1 + 40));
  -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v12, "setDataMigrationStage:", *(_QWORD *)(a1 + 64));
  -[SPCoreSpotlightIndexerTask setShouldResumeOnFailure:](v12, "setShouldResumeOnFailure:", 1);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = *(id *)(a1 + 40);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
        dispatch_group_enter(v3);
        v19 = sIndexQueue;
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2;
        v35[3] = &unk_24D0EA988;
        v35[4] = v18;
        v36 = v12;
        v37 = v28;
        v38 = v27;
        v39 = v3;
        _setup_block(v35, 0, 13933);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_async(v19, v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v15);
  }

  v21 = sIndexQueue;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_1609;
  v29[3] = &unk_24D0ED0D0;
  v30 = v12;
  v31 = v27;
  v22 = *(void **)(a1 + 40);
  v32 = *(_QWORD *)(a1 + 32);
  v33 = v22;
  v34 = *(id *)(a1 + 56);
  v23 = v27;
  v24 = v12;
  _setup_block(v29, 0, 13951);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v3, v21, v25);

}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v2 = (void *)MEMORY[0x2199C2D78]();
  objc_msgSend(*(id *)(a1 + 32), "startReindexAll");
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_3;
  v7[3] = &unk_24D0ED0A8;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  objc_msgSend(v3, "fetchAllCompletedBundleIDsForIndexerTask:completionHandler:", v4, v7);

  objc_autoreleasePoolPop(v2);
}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    logForCSLogCategoryIndex();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "jobType");
      objc_msgSend(*(id *)(a1 + 40), "dataclass");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218498;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_INFO, "Found already completed bundleIDs from a previously failed job (%ld), dataclass:%@, completedBundleIDs:%@", (uint8_t *)&v8, 0x20u);

    }
    v7 = *(id *)(a1 + 48);
    objc_sync_enter(v7);
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v3);
    objc_sync_exit(v7);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_1609(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCompletedBundleIDs:", v2);

  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "completedBundleIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_INFO, "Reindexing all items, completedBundleIDs:%@", buf, 0xCu);

  }
  v5 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_1610;
  v9[3] = &unk_24D0EB758;
  v6 = *(void **)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = v7;
  v11 = v8;
  v12 = *(id *)(a1 + 64);
  objc_msgSend(v6, "performIndexerTask:completionHandler:", v5, v9);

}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_1610(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v2 = sIndexQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2_1611;
  v7[3] = &unk_24D0EB758;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  _setup_block(v7, 0, 13949);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, v6);

}

void __79__SPCoreSpotlightIndexer_reindexAllItemsWithIndexers_reason_completionHandler___block_invoke_2_1611(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199C2D78]();
  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_INFO, "Done reindexing all items", buf, 2u);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "finishReindexAll", (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "reindexAllQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v9);

  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(void))(v10 + 16))();
  objc_autoreleasePoolPop(v2);
}

- (int)_openIndex:(BOOL)a3 forInit:(BOOL)a4 readOnly:(BOOL)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  _QWORD *v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  _QWORD v23[3];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__SPCoreSpotlightIndexer__openIndex_forInit_readOnly___block_invoke;
  v16[3] = &unk_24D0ED120;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v16[4] = self;
  v18 = &v25;
  v19 = v23;
  v13 = v11;
  v17 = v13;
  objc_msgSend(v12, "enumerateKeysAndObjectsWithOptions:usingBlock:", 1, v16);

  if (objc_msgSend(v13, "count"))
    objc_storeStrong((id *)&self->_reindexIndexers, v11);
  v14 = *((_DWORD *)v26 + 6);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
  return v14;
}

void __54__SPCoreSpotlightIndexer__openIndex_forInit_readOnly___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  _BOOL8 v10;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  int v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  char v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  v10 = *(_BYTE *)(a1 + 64) != 0;
  if (*(_BYTE *)(a1 + 64))
    v11 = *(_BYTE *)(a1 + 65) == 0;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(v8, "dataclass", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0CD8]) & 1) != 0)
    {
LABEL_8:

LABEL_9:
      v10 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v9, "dataclass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD0CE8]) & 1) != 0)
    {
LABEL_7:

      goto LABEL_8;
    }
    objc_msgSend(v9, "dataclass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("Priority")) & 1) != 0)
    {
      if (objc_msgSend((id)sDelegate, "managedIndex"))
      {

        goto LABEL_7;
      }
      v24 = objc_msgSend((id)sDelegate, "privateIndex");

      if ((v24 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v10 = 1;
  }
LABEL_10:
  v14 = objc_msgSend(v9, "openIndex:shouldReindexAll:readOnly:", v10, 0, *(unsigned __int8 *)(a1 + 66));
  if (v14 < 0)
  {
    v17 = *(id *)(a1 + 32);
    objc_sync_enter(v17);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_DWORD *)(v18 + 24) > v14)
      *(_DWORD *)(v18 + 24) = v14;
    *a4 = 1;
    objc_sync_exit(v17);

  }
  else if (objc_msgSend((id)sDelegate, "setupHasComplete"))
  {
    if (v14 == 1 || objc_msgSend(v9, "reindexAllStarted"))
    {
      v15 = *(id *)(a1 + 32);
      objc_sync_enter(v15);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      objc_sync_exit(v15);

      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
    logForCSLogCategoryIndex();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "dataclass");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = CFSTR("NO");
      if (v16)
        v23 = CFSTR("YES");
      v25 = 138412546;
      v26 = v21;
      v27 = 2112;
      v28 = v23;
      _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_INFO, "dataclass:%@, reindexAll:%@", (uint8_t *)&v25, 0x16u);

    }
  }

}

- (void)writeFileProviderBundleMap:(id)a3 fileProviderBundleIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!sPrivate)
  {
    NSHomeDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/Library/Spotlight/ExtensionsCache"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "fileExistsAtPath:", v8) & 1) == 0)
      objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);
    v21[0] = CFSTR("v_n");
    v21[1] = CFSTR("bm_d");
    v10 = MEMORY[0x24BDBD1B8];
    if (v5)
      v11 = v5;
    else
      v11 = (id)MEMORY[0x24BDBD1B8];
    v22[0] = &unk_24D0FD210;
    v22[1] = v11;
    v21[2] = CFSTR("bid_d");
    objc_msgSend(v6, "allObjects");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = v12;
    else
      v14 = v10;
    v22[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("fileProviderBundleMap.plist"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF08], "outputStreamToFileAtPath:append:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "open");
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "writePropertyList:toStream:format:options:error:", v15, v17, 200, 0, &v20);
    v18 = v20;
    objc_msgSend(v17, "close");
    if (v18)
    {
      logForCSLogCategoryIndex();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[SPCoreSpotlightIndexer writeFileProviderBundleMap:fileProviderBundleIDs:].cold.1();

    }
  }

}

- (void)fileProviderInfoSetup
{
  _QWORD block[5];

  if (!sPrivate)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__SPCoreSpotlightIndexer_fileProviderInfoSetup__block_invoke;
    block[3] = &unk_24D0EA758;
    block[4] = self;
    if (fileProviderInfoSetup_onceToken != -1)
      dispatch_once(&fileProviderInfoSetup_onceToken, block);
  }
}

void __47__SPCoreSpotlightIndexer_fileProviderInfoSetup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Library/Spotlight/ExtensionsCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("fileProviderBundleMap.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithFileAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "open");
  v33 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithStream:options:format:error:", v5, 0, 0, &v33);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v33;
  objc_msgSend(v5, "close");
  if (v7)
  {
    logForCSLogCategoryIndex();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __47__SPCoreSpotlightIndexer_fileProviderInfoSetup__block_invoke_cold_1();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_5;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("v_n"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqual:](v8, "isEqual:", &unk_24D0FD210))
    {
      v9 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bid_d"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count"))
      {
        +[SpotlightDaemonServer sharedDaemonServer](SpotlightDaemonServer, "sharedDaemonServer");
        v12 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateFileProviderBundleIDs:", v12);

        v11 = v12;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bm_d"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v4;
        v26 = v3;
        v23 = a1;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v15 = v14;
        v28 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v28)
        {
          v27 = *(_QWORD *)v30;
          v24 = v11;
          while (2)
          {
            for (i = 0; i != v28; ++i)
            {
              v17 = v14;
              if (*(_QWORD *)v30 != v27)
                objc_enumerationMutation(v15);
              v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v11 = v24;
                v14 = v17;
                goto LABEL_23;
              }
              v19 = v15;
              objc_msgSend(v15, "objectForKeyedSubscript:", v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                v11 = v24;
                v14 = v17;
                v15 = v19;
                goto LABEL_23;
              }
              v14 = v17;
              v15 = v19;
            }
            v11 = v24;
            v28 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
            if (v28)
              continue;
            break;
          }
        }

        objc_storeStrong((id *)(*(_QWORD *)(v23 + 32) + 96), v14);
        v22 = *(_QWORD *)(v23 + 32);
        v15 = *(id *)(v22 + 104);
        *(_QWORD *)(v22 + 104) = 0;
LABEL_23:

        v4 = v25;
        v3 = v26;
      }

    }
  }

LABEL_5:
}

- (void)checkIfExtensionsNeedToBeLoaded
{
  void *v3;
  NSArray *reindexIndexers;

  if (self->_reindexIndexers)
  {
    objc_msgSend(MEMORY[0x24BDC24E8], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadExtensions");

    -[SPCoreSpotlightIndexer reindexAllItemsWithIndexers:reason:completionHandler:](self, "reindexAllItemsWithIndexers:reason:completionHandler:", self->_reindexIndexers, CFSTR("loading extensions"), &__block_literal_global_1627);
    reindexIndexers = self->_reindexIndexers;
    self->_reindexIndexers = 0;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC2470], "notifyIndexDelegates");
  }
}

- (void)fileProviderActiveProvidersChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SPCoreSpotlightIndexer *v7;
  NSDictionary *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  NSDictionary *v27;
  NSDictionary *fileProviderExtensionToAppBundleMap;
  void *v29;
  NSDictionary *fileProviderAppToExtensionBundleMap;
  SPCoreSpotlightIndexer *obj;
  id *location;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v35 = v4;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v35, "count"))
  {
    v7 = self;
    objc_sync_enter(v7);
    obj = v7;
    -[SPCoreSpotlightIndexer fileProviderInfoSetup](v7, "fileProviderInfoSetup");
    location = (id *)&v7->_fileProviderAppToExtensionBundleMap;
    v8 = v7->_fileProviderAppToExtensionBundleMap;
    if (-[NSDictionary count](v8, "count"))
    {
      v9 = (void *)objc_opt_new();
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v10 = v35;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v41 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqualToString:", v16);

            if ((v17 & 1) == 0)
              objc_msgSend(v9, "addObject:", v14);
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v11);
      }

      if (objc_msgSend(v9, "count"))
      {
        v18 = (void *)objc_msgSend(v10, "mutableCopy");
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v19 = v9;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v37 != v21)
                objc_enumerationMutation(v19);
              v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
              objc_msgSend(v10, "objectForKeyedSubscript:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, v23);

            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v20);
        }

        v25 = *location;
        *location = v18;
        v26 = v18;

        v27 = (NSDictionary *)*location;
      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      objc_storeStrong(location, a3);
      v27 = (NSDictionary *)*location;
    }

    objc_sync_exit(obj);
  }
  else
  {
    v27 = 0;
  }
  if (objc_msgSend(v35, "count") || objc_msgSend(v34, "count"))
  {
    fileProviderExtensionToAppBundleMap = self->_fileProviderExtensionToAppBundleMap;
    self->_fileProviderExtensionToAppBundleMap = 0;

    if (objc_msgSend(v34, "count"))
    {
      objc_storeStrong((id *)&self->_fileProviderBundleIDs, v34);
      +[SpotlightDaemonServer sharedDaemonServer](SpotlightDaemonServer, "sharedDaemonServer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "updateFileProviderBundleIDs:", v34);

    }
    fileProviderAppToExtensionBundleMap = v27;
    if (!v27)
      fileProviderAppToExtensionBundleMap = self->_fileProviderAppToExtensionBundleMap;
    -[SPCoreSpotlightIndexer writeFileProviderBundleMap:fileProviderBundleIDs:](self, "writeFileProviderBundleMap:fileProviderBundleIDs:", fileProviderAppToExtensionBundleMap, self->_fileProviderBundleIDs);
  }

}

- (NSDictionary)fileProviderAppToExtensionBundleMap
{
  SPCoreSpotlightIndexer *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SPCoreSpotlightIndexer fileProviderInfoSetup](v2, "fileProviderInfoSetup");
  v3 = v2->_fileProviderAppToExtensionBundleMap;
  objc_sync_exit(v2);

  return v3;
}

- (NSDictionary)fileProviderExtensionToAppBundleMap
{
  SPCoreSpotlightIndexer *v2;
  NSDictionary *fileProviderExtensionToAppBundleMap;
  NSDictionary *fileProviderAppToExtensionBundleMap;
  NSDictionary *v5;
  NSDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[SPCoreSpotlightIndexer fileProviderInfoSetup](v2, "fileProviderInfoSetup");
  fileProviderExtensionToAppBundleMap = v2->_fileProviderExtensionToAppBundleMap;
  if (!fileProviderExtensionToAppBundleMap)
  {
    fileProviderAppToExtensionBundleMap = v2->_fileProviderAppToExtensionBundleMap;
    if (fileProviderAppToExtensionBundleMap)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSDictionary count](fileProviderAppToExtensionBundleMap, "count"));
      v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = v2->_fileProviderAppToExtensionBundleMap;
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v6);
            v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
            -[NSDictionary objectForKeyedSubscript:](v2->_fileProviderAppToExtensionBundleMap, "objectForKeyedSubscript:", v10, (_QWORD)v15);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, v11);

          }
          v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v7);
      }

      v12 = v2->_fileProviderExtensionToAppBundleMap;
      v2->_fileProviderExtensionToAppBundleMap = v5;

      fileProviderExtensionToAppBundleMap = v2->_fileProviderExtensionToAppBundleMap;
    }
    else
    {
      fileProviderExtensionToAppBundleMap = 0;
    }
  }
  v13 = fileProviderExtensionToAppBundleMap;
  objc_sync_exit(v2);

  return v13;
}

- (BOOL)isForegroundFileProviderBundleID:(id)a3
{
  id v4;
  SPCoreSpotlightIndexer *v5;
  _BOOL4 v6;
  char v7;

  v4 = a3;
  if (v4
    && (v5 = self,
        objc_sync_enter(v5),
        -[SPCoreSpotlightIndexer fileProviderInfoSetup](v5, "fileProviderInfoSetup"),
        v6 = -[NSSet containsObject:](v5->_fileProviderBundleIDs, "containsObject:", v4),
        objc_sync_exit(v5),
        v5,
        v6))
  {
    v7 = objc_msgSend(MEMORY[0x24BDC8300], "isProviderIDForeground:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)openIndex:(BOOL)a3 readOnly:(BOOL)a4
{
  return -[SPCoreSpotlightIndexer _openIndex:forInit:readOnly:](self, "_openIndex:forInit:readOnly:", a3, 0, a4);
}

- (int)openIndex:(BOOL)a3 forInit:(BOOL)a4 readOnly:(BOOL)a5
{
  NSObject *indexQueue;
  int v6;
  _QWORD block[6];
  BOOL v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  indexQueue = self->_indexQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SPCoreSpotlightIndexer_openIndex_forInit_readOnly___block_invoke;
  block[3] = &unk_24D0ED168;
  block[4] = self;
  block[5] = &v12;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  dispatch_sync(indexQueue, block);
  v6 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __53__SPCoreSpotlightIndexer_openIndex_forInit_readOnly___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_openIndex:forInit:readOnly:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)openIndex:(BOOL)a3
{
  return -[SPCoreSpotlightIndexer openIndex:readOnly:](self, "openIndex:readOnly:", a3, 0);
}

- (BOOL)writeData:(id)a3 toFile:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "writeData:", v5);

  return 1;
}

- (void)indexFromBundle:(id)a3 protectionClass:(id)a4 personaID:(id)a5 options:(int64_t)a6 items:(id)a7 itemsText:(id)a8 itemsHTML:(id)a9 clientState:(id)a10 expectedClientState:(id)a11 clientStateName:(id)a12 deletes:(id)a13 canCreateNewIndex:(BOOL)a14 completionHandler:(id)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(id, void *);
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v40;
  id v41;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  __int16 v53;
  int64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v44 = a4;
  v20 = a5;
  v21 = a7;
  v43 = a8;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = (void (**)(id, void *))a15;
  _checkUnlock();
  logForCSLogCategoryIndex();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v46 = v19;
    v47 = 2112;
    v48 = v24;
    v49 = 2048;
    v50 = objc_msgSend(v22, "length");
    v51 = 2112;
    v52 = v44;
    v53 = 2048;
    v54 = a6;
    _os_log_debug_impl(&dword_213CF1000, v27, OS_LOG_TYPE_DEBUG, "indexFromBundle, bundleID:%@, clientState:%@/%lu, protectionClass:%@, options:0x%lx", buf, 0x34u);
  }

  v28 = v20;
  if (v19)
  {
    if (!objc_msgSend((id)sDelegate, "blocklistCheck:withOptions:", v19, a6))
    {
      v40 = v25;
      v41 = v24;
      v29 = v22;
      v30 = v21;
      v35 = (void *)*MEMORY[0x24BDD0CE0];
      if (v44)
        v35 = v44;
      v34 = v35;
      -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v34, v19);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
        LOBYTE(v38) = 1;
        objc_msgSend(v36, "indexFromBundle:personaID:options:items:itemsText:clientState:expectedClientState:clientStateName:deletes:canCreateNewIndex:completionHandler:", v19, v20, a6, v30, v43, v29, v23, v24, v40, v38, v26);
      }
      else if (v26)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v26[2](v26, v37);

        v28 = v20;
      }

      goto LABEL_17;
    }
    if (v26)
    {
      v40 = v25;
      v41 = v24;
      v29 = v22;
      v30 = v21;
      v31 = (void *)MEMORY[0x24BDD1540];
      v32 = *MEMORY[0x24BDC1950];
      v33 = -1000;
LABEL_9:
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, v33, 0);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v26[2](v26, v34);
LABEL_17:

      v21 = v30;
      v22 = v29;
      v25 = v40;
      v24 = v41;
    }
  }
  else if (v26)
  {
    v40 = v25;
    v41 = v24;
    v29 = v22;
    v30 = v21;
    v31 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDC1950];
    v33 = -1;
    goto LABEL_9;
  }

}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v15 = a9;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  v19 = a3;
  _checkUnlock();
  -[SPCoreSpotlightIndexer indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:completionHandler:", v19, v18, 0, 0, v17, v16, a8, v15);

}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10
{
  -[SPCoreSpotlightIndexer indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:protectionClass:forBundleID:options:completionHandler:](self, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:protectionClass:forBundleID:options:completionHandler:", a3, a4, a5, 0, a6, a7, a8, a9, a10);
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 clientStateName:(id)a7 protectionClass:(id)a8 forBundleID:(id)a9 options:(int64_t)a10 completionHandler:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, void *);
  NSObject *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  int64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v32 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = (void (**)(id, void *))a11;
  logForCSLogCategoryIndex();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413826;
    v34 = v21;
    v35 = 2112;
    v36 = v19;
    v37 = 2048;
    v38 = objc_msgSend(v17, "length");
    v39 = 2112;
    v40 = v20;
    v41 = 2048;
    v42 = objc_msgSend(v16, "count");
    v43 = 2048;
    v44 = objc_msgSend(v32, "count");
    v45 = 2048;
    v46 = a10;
    _os_log_debug_impl(&dword_213CF1000, v23, OS_LOG_TYPE_DEBUG, "indexSearchableItems, bundleID:%@, clientState:%@/%ld, protectionClass:%@, itemCount:%ld, deleteIdentifiersCount:%ld, options:0x%lx", buf, 0x48u);
  }

  _checkUnlock();
  if (v21)
  {
    if (!objc_msgSend((id)sDelegate, "blocklistCheck:withOptions:", v21, a10))
    {
      v27 = (void *)*MEMORY[0x24BDD0CE0];
      v30 = v20;
      if (v20)
        v27 = v20;
      v26 = v27;
      -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v26, v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
        objc_msgSend(v28, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:forBundleID:options:completionHandler:", v16, v32, v17, v18, v19, v21, a10, v22);
      }
      else if (v22)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v22[2](v22, v29);

      }
      v20 = v30;
      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v26 = (id)v24;
    v22[2](v22, (void *)v24);
LABEL_16:

    goto LABEL_17;
  }
  if (v22)
  {
    v25 = objc_alloc(MEMORY[0x24BDD1540]);
    v24 = objc_msgSend(v25, "initWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    goto LABEL_8;
  }
LABEL_17:

}

- (void)prepareIndexingWhileLocked:(id)a3 protectionClass:(id)a4 holdAssertionFor:(double)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a6;
  _checkUnlock();
  if (v13 && objc_msgSend((id)sDelegate, "blocklistCheck:withOptions:", v13, 0))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v12 = (void *)v10;
    v9[2](v9, v10);

    goto LABEL_7;
  }
  if (v9)
  {
    v11 = objc_alloc(MEMORY[0x24BDD1540]);
    v10 = objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)finishIndexingWhileLocked:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  _checkUnlock();
  if (v12 && objc_msgSend((id)sDelegate, "blocklistCheck:withOptions:", v12, 0))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v9;
    v8[2](v8, v9);

    goto LABEL_7;
  }
  if (v8)
  {
    v10 = objc_alloc(MEMORY[0x24BDD1540]);
    v9 = objc_msgSend(v10, "initWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)validateIndexers:(id)a3 outFileDescriptor:(int)a4
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__SPCoreSpotlightIndexer_validateIndexers_outFileDescriptor___block_invoke;
  v4[3] = &__block_descriptor_36_e40_v16__0__SPConcreteCoreSpotlightIndexer_8l;
  v5 = a4;
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:block:](self, "_enumerateIndexersWithProtectionClasses:block:", a3, v4);
}

void __61__SPCoreSpotlightIndexer_validateIndexers_outFileDescriptor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned int *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "validateConcreteIndexer:outFileDescriptor:", 0, v3);
  objc_msgSend(v4, "validateConcreteIndexer:outFileDescriptor:", 1, *(unsigned int *)(a1 + 32));

}

- (void)validateVectors:(id)a3 outFileDescriptor:(int)a4
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__SPCoreSpotlightIndexer_validateVectors_outFileDescriptor___block_invoke;
  v4[3] = &__block_descriptor_36_e40_v16__0__SPConcreteCoreSpotlightIndexer_8l;
  v5 = a4;
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:block:](self, "_enumerateIndexersWithProtectionClasses:block:", a3, v4);
}

uint64_t __60__SPCoreSpotlightIndexer_validateVectors_outFileDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "validateVectors:", *(unsigned int *)(a1 + 32));
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 fromClient:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *);
  id v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *))a8;
  _checkUnlock();
  if (v13)
    v17 = v13;
  else
    v17 = (id)*MEMORY[0x24BDD0CE0];
  -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v18, "deleteSearchableItemsWithDomainIdentifiers:forBundleID:fromClient:reason:completionHandler:", v20, v14, v15, 0, v16);
  }
  else if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v19);

  }
}

- (void)deleteSearchableItemsWithPersonaIds:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v17 = a4;
  _checkUnlock();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy_;
  v29[4] = __Block_byref_object_dispose_;
  v30 = 0;
  v6 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  v10 = MEMORY[0x24BDAC760];
  if (v9)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        dispatch_group_enter(v6);
        v22[0] = v10;
        v22[1] = 3221225472;
        v22[2] = __80__SPCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke;
        v22[3] = &unk_24D0EB7A8;
        v24 = v29;
        v23 = v6;
        objc_msgSend(v13, "deleteSearchableItemsWithPersonaIds:completionHandler:", v18, v22, v17);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v9);
  }

  self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
  v14 = sIndexQueue;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __80__SPCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_2;
  v19[3] = &unk_24D0ECE60;
  v19[4] = self;
  v15 = v17;
  v20 = v15;
  v21 = v29;
  _setup_block(v19, 0, 14721);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v6, v14, v16);

  _Block_object_dispose(v29, 8);
}

void __80__SPCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __80__SPCoreSpotlightIndexer_deleteSearchableItemsWithPersonaIds_completionHandler___block_invoke_2(uint64_t a1)
{
  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3 fromClient:(id)a4 protectionClass:(id)a5 shouldGC:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[4];
  NSObject *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  _checkUnlock();
  v16 = (void *)*MEMORY[0x24BDD0CE0];
  if (v14)
    v16 = v14;
  v17 = v16;
  -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v17, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
    -[SPCoreSpotlightIndexer fileProviderAppToExtensionBundleMap](self, "fileProviderAppToExtensionBundleMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = dispatch_group_create();
      dispatch_group_enter(v21);
      dispatch_group_enter(v21);
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3032000000;
      v36[3] = __Block_byref_object_copy_;
      v36[4] = __Block_byref_object_dispose_;
      v22 = MEMORY[0x24BDAC760];
      v37 = 0;
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke;
      v33[3] = &unk_24D0EB7A8;
      v35 = v36;
      v23 = v21;
      v34 = v23;
      objc_msgSend(v18, "deleteAllSearchableItemsForBundleID:fromClient:shouldGC:completionHandler:", v12, v13, v8, v33);
      v30[0] = v22;
      v30[1] = 3221225472;
      v30[2] = __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke_2;
      v30[3] = &unk_24D0EB7A8;
      v32 = v36;
      v24 = v23;
      v31 = v24;
      objc_msgSend(v18, "deleteAllSearchableItemsForBundleID:fromClient:shouldGC:completionHandler:", v20, v13, v8, v30);
      v25 = sIndexQueue;
      v27[0] = v22;
      v27[1] = 3221225472;
      v27[2] = __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke_3;
      v27[3] = &unk_24D0ED190;
      v28 = v15;
      v29 = v36;
      _setup_block(v27, 0, 14760);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_group_notify(v24, v25, v26);

      _Block_object_dispose(v36, 8);
    }
    else
    {
      objc_msgSend(v18, "deleteAllSearchableItemsForBundleID:fromClient:shouldGC:completionHandler:", v12, v13, v8, v15);
    }
    goto LABEL_9;
  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v15 + 2))(v15, v20);
LABEL_9:

  }
}

void __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  id v5;

  v2 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!a2)
    a2 = *(void **)(v4 + 40);
  objc_storeStrong((id *)(v4 + 40), a2);
  v5 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  id v5;

  v2 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!a2)
    a2 = *(void **)(v4 + 40);
  objc_storeStrong((id *)(v4 + 40), a2);
  v5 = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __117__SPCoreSpotlightIndexer_deleteAllSearchableItemsWithBundleID_fromClient_protectionClass_shouldGC_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3 protectionClass:(id)a4 shouldGC:(BOOL)a5 completionHandler:(id)a6
{
  -[SPCoreSpotlightIndexer deleteAllSearchableItemsWithBundleID:fromClient:protectionClass:shouldGC:completionHandler:](self, "deleteAllSearchableItemsWithBundleID:fromClient:protectionClass:shouldGC:completionHandler:", a3, 0, a4, a5, a6);
}

- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  -[SPCoreSpotlightIndexer deleteAllSearchableItemsWithBundleID:protectionClass:shouldGC:completionHandler:](self, "deleteAllSearchableItemsWithBundleID:protectionClass:shouldGC:completionHandler:", a4, a3, 1, a6);
}

- (void)deleteSearchableItemsSinceDate:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, void *);
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a7;
  _checkUnlock();
  if (v11)
    v14 = v11;
  else
    v14 = (id)*MEMORY[0x24BDD0CE0];
  -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v15, "deleteSearchableItemsSinceDate:forBundleID:completionHandler:", v17, v12, v13);
  }
  else if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v16);

  }
}

- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 protectionClass:(id)a5 forBundleID:(id)a6 forUTIType:(id)a7 options:(int64_t)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v16 = a3;
  v12 = a5;
  v13 = a6;
  _checkUnlock();
  if (v12)
    v14 = v12;
  else
    v14 = (id)*MEMORY[0x24BDD0CE0];
  -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v15, "changeStateOfSearchableItemsWithUIDs:toState:forBundleID:", v16, a4, v13);
  }

}

- (void)userPerformedAction:(id)a3 withItem:(id)a4 protectionClass:(id)a5 forBundleID:(id)a6 personaID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  SPUAProgressItem *v27;
  id v28;
  SPUAProgressItem *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  SPUAProgressItem *v43;
  BOOL v44;
  _QWORD v45[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  void *v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (deviceUnlocked)
  {
    if (!v13)
      goto LABEL_23;
  }
  else
  {
    SIResumeForUnlock();
    if (!v13)
      goto LABEL_23;
  }
  if ((objc_msgSend((id)sDelegate, "blocklistCheck:withOptions:", v15, 0) & 1) == 0)
  {
    objc_msgSend(v13, "attributeSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "relatedUniqueIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "uniqueIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)*MEMORY[0x24BDD0CE0];
    if (v14)
      v18 = v14;
    v19 = v18;
    v34 = v19;
    if (v35)
    {
      objc_msgSend((id)objc_opt_class(), "allProtectionClasses");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
    }
    else
    {
      v51[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = objc_msgSend(v13, "noIndex");
    logForCSLogCategoryIndex();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
    if (v20)
    {
      if (v22)
        -[SPCoreSpotlightIndexer userPerformedAction:withItem:protectionClass:forBundleID:personaID:].cold.1();
    }
    else
    {
      if (v22)
        -[SPCoreSpotlightIndexer userPerformedAction:withItem:protectionClass:forBundleID:personaID:].cold.2();

      self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
      v21 = objc_alloc_init(MEMORY[0x24BDC23B8]);
      -[NSObject beginArray](v21, "beginArray");
      objc_msgSend(v13, "attributeSet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject encodeObject:](v21, "encodeObject:", v23);

      -[NSObject endArray](v21, "endArray");
      -[NSObject data](v21, "data");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v24, "copy");

      v26 = MEMORY[0x24BDAC760];
      if (v35)
      {
        v46 = 0;
        v47 = &v46;
        v48 = 0x2020000000;
        v49 = 0;
        v45[0] = MEMORY[0x24BDAC760];
        v45[1] = 3221225472;
        v45[2] = __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke;
        v45[3] = &unk_24D0ED1B8;
        v45[4] = &v46;
        -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:block:](self, "_enumerateIndexersWithProtectionClasses:block:", v33, v45);
        v27 = -[SPUAProgressItem initWithBundleID:uaID:relatedID:]([SPUAProgressItem alloc], "initWithBundleID:uaID:relatedID:", v15, v31, v35);
        -[SPUAProgressItem setExpectedCount:](v27, "setExpectedCount:", *((unsigned int *)v47 + 6));
        -[SPUAProgressItem add](v27, "add");
        _Block_object_dispose(&v46, 8);
        v26 = MEMORY[0x24BDAC760];
      }
      else
      {
        v27 = 0;
      }
      v39[0] = v26;
      v39[1] = 3221225472;
      v39[2] = __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_2;
      v39[3] = &unk_24D0ED1E0;
      v28 = v15;
      v40 = v28;
      v41 = v16;
      v30 = v25;
      v42 = v30;
      v44 = v35 != 0;
      v29 = v27;
      v43 = v29;
      -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:block:](self, "_enumerateIndexersWithProtectionClasses:block:", v33, v39);
      if (objc_msgSend(v32, "count"))
      {
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_1630;
        v36[3] = &unk_24D0ECD30;
        v37 = v31;
        v38 = v28;
        -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:block:](self, "_enumerateIndexersWithProtectionClasses:block:", v32, v36);

      }
    }

  }
LABEL_23:

}

uint64_t __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 64);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_3;
  v8[3] = &unk_24D0EB060;
  v6 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  LOBYTE(v7) = v5;
  objc_msgSend(a2, "indexFromBundle:personaID:options:items:itemsText:clientState:expectedClientState:clientStateName:deletes:canCreateNewIndex:completionHandler:", v3, v4, 0, v6, 0, 0, 0, 0, 0, v7, v8);

}

void __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    logForCSLogCategoryIndex();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_3_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "update:", 0xFFFFFFFFLL);
  }

}

void __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_1630(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_backgroundDeleteItems:bundleID:completionHandler:", v5, *(_QWORD *)(a1 + 40), &__block_literal_global_1632, v6, v7);

}

void __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_2_1631(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (v2)
  {
    logForCSLogCategoryIndex();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_INFO, "Error deleting possible user activity %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)willModifySearchableItemsWithIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *))a7;
  _checkUnlock();
  if (objc_msgSend((id)sDelegate, "blocklistCheck:withOptions:", v13, a6))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v15);
  }
  else
  {
    if (v12)
      v16 = v12;
    else
      v16 = (id)*MEMORY[0x24BDD0CE0];
    -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v16, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      self->_lastUpdateTime = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v15, "willModifySearchableItemsWithIdentifiers:forBundleID:completionHandler:", v18, v13, v14);
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v17);

    }
  }

}

- (void)deleteAllUserActivities:(id)a3 fromClient:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_group_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  qos_class_t v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  SPCoreSpotlightIndexer *v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _checkUnlock();
  v11 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy_;
  v28[4] = __Block_byref_object_dispose_;
  v29 = 0;
  v12 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke;
  v22[3] = &unk_24D0ED250;
  v13 = v11;
  v23 = v13;
  v24 = self;
  v14 = v8;
  v25 = v14;
  v15 = v9;
  v26 = v15;
  v27 = v28;
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:block:](self, "_enumerateIndexersWithProtectionClasses:block:", 0, v22);
  if (v10)
  {
    v16 = qos_class_self();
    dispatch_get_global_queue(v16, 2uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_4;
    v19[3] = &unk_24D0ED190;
    v20 = v10;
    v21 = v28;
    _setup_block(v19, 0, 15004);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v13, v17, v18);

  }
  _Block_object_dispose(v28, 8);

}

void __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = sIndexQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_2;
  v10[3] = &unk_24D0ED228;
  v5 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v13 = v6;
  v15 = v7;
  v14 = *(id *)(a1 + 32);
  v8 = v3;
  _setup_block(v10, 0, 14998);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, v9);

}

void __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_3;
  v7[3] = &unk_24D0EB7A8;
  v6 = *(_OWORD *)(a1 + 64);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(v2, "deleteAllUserActivities:fromClient:completionHandler:", v3, v4, v7);

}

void __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __79__SPCoreSpotlightIndexer_deleteAllUserActivities_fromClient_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)deleteActionsBeforeTime:(double)a3 completionHandler:(id)a4
{
  id v6;
  dispatch_group_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  qos_class_t v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  NSObject *v18;
  SPCoreSpotlightIndexer *v19;
  _QWORD *v20;
  double v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _checkUnlock();
  v7 = dispatch_group_create();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v23 = 0;
  v24[0] = *MEMORY[0x24BDD0CE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke;
  v17[3] = &unk_24D0ED2A0;
  v10 = v7;
  v18 = v10;
  v19 = self;
  v21 = a3;
  v20 = v22;
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:block:](self, "_enumerateIndexersWithProtectionClasses:block:", v8, v17);
  if (v6)
  {
    v11 = qos_class_self();
    dispatch_get_global_queue(v11, 2uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_4;
    v14[3] = &unk_24D0ED190;
    v15 = v6;
    v16 = v22;
    _setup_block(v14, 0, 15036);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v10, v12, v13);

  }
  _Block_object_dispose(v22, 8);

}

void __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = sIndexQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_2;
  v8[3] = &unk_24D0ED278;
  v5 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v12 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v6 = v3;
  _setup_block(v8, 0, 15030);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, v7);

}

void __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  v2 = *(void **)(a1 + 40);
  v3 = *(double *)(a1 + 64);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_3;
  v6[3] = &unk_24D0EB7A8;
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v2, "deleteActionsBeforeTime:completionHandler:", v6, v3);

}

void __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __68__SPCoreSpotlightIndexer_deleteActionsBeforeTime_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)deleteActionsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_group_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  qos_class_t v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  SPCoreSpotlightIndexer *v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _checkUnlock();
  v8 = dispatch_group_create();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  v25 = 0;
  v26[0] = *MEMORY[0x24BDD0CE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke;
  v19[3] = &unk_24D0ED2F0;
  v11 = v8;
  v20 = v11;
  v21 = self;
  v12 = v6;
  v22 = v12;
  v23 = v24;
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:block:](self, "_enumerateIndexersWithProtectionClasses:block:", v9, v19);
  if (v7)
  {
    v13 = qos_class_self();
    dispatch_get_global_queue(v13, 2uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_4;
    v16[3] = &unk_24D0ED190;
    v17 = v7;
    v18 = v24;
    _setup_block(v16, 0, 15066);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v11, v14, v15);

  }
  _Block_object_dispose(v24, 8);

}

void __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = sIndexQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_2;
  v10[3] = &unk_24D0ED2C8;
  v5 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 56);
  v12 = v6;
  v14 = v7;
  v13 = *(id *)(a1 + 32);
  v8 = v3;
  _setup_block(v10, 0, 15060);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, v9);

}

void __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 32) = CFAbsoluteTimeGetCurrent();
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_3;
  v6[3] = &unk_24D0EB7A8;
  v5 = *(_OWORD *)(a1 + 56);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v2, "deleteActionsWithIdentifiers:completionHandler:", v3, v6);

}

void __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __73__SPCoreSpotlightIndexer_deleteActionsWithIdentifiers_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

+ (BOOL)writeDiagnostic:(id)a3 bundleID:(id)a4 identifier:(id)a5 logQuery:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFArray *v22;
  CFDictionaryRef v23;
  void *v24;
  void *v25;
  int v26;
  unint64_t v27;
  BOOL v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t i;
  void *v35;
  void *v36;
  void **v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  const __CFArray *v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;

  v6 = a6;
  v9 = a3;
  v66 = a4;
  v65 = a5;
  v64 = _CFCopySystemVersionDictionary();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("System Version - %@\n\n"), v64);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void **)&off_24D0E9000;
  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "writeData:toFile:", v13, v9);

  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Preferred Languages - %@\n\n"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataUsingEncoding:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = objc_msgSend(v18, "writeData:toFile:", v19, v9);

    if ((_DWORD)v16)
    {
      v20 = (const __CFString *)*MEMORY[0x24BDBD590];
      v21 = (const __CFString *)*MEMORY[0x24BDBD570];
      v22 = CFPreferencesCopyKeyList(CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
      if (-[__CFArray count](v22, "count"))
      {
        v23 = CFPreferencesCopyMultiple(v22, CFSTR("com.apple.spotlightui"), v20, v21);
        if (-[__CFDictionary count](v23, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Preferences - %@\n\n"), v23);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dataUsingEncoding:", 4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "writeData:toFile:", v25, v9);

          if (!v26)
          {

            v28 = 0;
LABEL_38:
            v29 = (void *)v64;

            goto LABEL_39;
          }
          v17 = v10;
        }
        v27 = 0x24BDD1000;

      }
      else
      {
        v27 = 0x24BDD1000uLL;
      }
      v30 = +[SpotlightSender copyDiagnosticInfo](SpotlightSender, "copyDiagnosticInfo");
      v63 = v30;
      if (objc_msgSend(v30, "count"))
      {
        objc_msgSend(*(id *)(v27 + 1992), "stringWithFormat:", CFSTR("Spotlight Receivers - %@\n\n"), v30);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dataUsingEncoding:", 4);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "writeData:toFile:", v32, v9);

        if (!v33)
        {
          v28 = 0;
LABEL_37:

          goto LABEL_38;
        }
      }
      else
      {
        v10 = v17;
      }
      v62 = v22;
      for (i = 0; i != 4; ++i)
      {
        if (i != 2 || v6)
        {
          v35 = (void *)MEMORY[0x2199C2D78]();
          SDTraceDescription(i);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v36, "length"))
          {
            objc_msgSend(v11[163], "sharedInstance");
            v37 = v11;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "dataUsingEncoding:", 4);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v38, "writeData:toFile:", v39, v9);

            if (!v40)
              goto LABEL_31;
            objc_msgSend(v37[163], "sharedInstance");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v41, "writeData:toFile:", v42, v9);

            v11 = v37;
            if (!v43)
            {
LABEL_31:

              objc_autoreleasePoolPop(v35);
              v28 = 0;
              v22 = v62;
              goto LABEL_37;
            }
          }

          objc_autoreleasePoolPop(v35);
        }
      }
      v72 = 0;
      v73 = &v72;
      v74 = 0x2020000000;
      v75 = 1;
      objc_msgSend(v11[163], "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "concreteIndexers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = MEMORY[0x24BDAC760];
      v67[1] = 3221225472;
      v67[2] = __71__SPCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier_logQuery___block_invoke;
      v67[3] = &unk_24D0ED318;
      v71 = &v72;
      v46 = v9;
      v68 = v46;
      v69 = v66;
      v70 = v65;
      objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v67);

      v47 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11[163], "sharedInstance");
      v22 = v62;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "dumpIndexAges");
      v49 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("\nCoreSpotlight Indexes Age Info:\n%@\n"), v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11[163], "sharedInstance");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "dataUsingEncoding:", 4);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v49) = objc_msgSend(v51, "writeData:toFile:", v52, v46);

      if ((v49 & 1) != 0)
      {
        v53 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v11[163], "sharedInstance");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "dumpIndexAnalytics");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "stringWithFormat:", CFSTR("\nCoreSpotlight Indexes Analytics Info:\n%@\n"), v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11[163], "sharedInstance");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "dataUsingEncoding:", 4);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v53) = objc_msgSend(v57, "writeData:toFile:", v58, v46);

        if ((v53 & 1) != 0)
        {
          if (sDelegate)
          {
            objc_msgSend((id)sDelegate, "extraTTRInfo");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (v59)
            {
              objc_msgSend(v11[163], "sharedInstance");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "writeData:toFile:", v59, v46);

            }
          }
          v28 = *((_BYTE *)v73 + 24) != 0;
        }
        else
        {
          v28 = 0;
        }

      }
      else
      {
        v28 = 0;
      }

      _Block_object_dispose(&v72, 8);
      goto LABEL_37;
    }
    v28 = 0;
    v10 = v17;
  }
  else
  {
    v28 = 0;
  }
  v29 = (void *)v64;
LABEL_39:

  return v28;
}

uint64_t __71__SPCoreSpotlightIndexer_writeDiagnostic_bundleID_identifier_logQuery___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "writeDiagnostic:bundleID:identifier:", a1[4], a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    *a4 = 1;
  return result;
}

- (void)getDBLogsWithCompletionHandler:(id)a3
{
  objc_class *v3;
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x24BDBCF50];
  v4 = (void (**)(id, uint64_t))a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.searchd"));
  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "concreteIndexers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__SPCoreSpotlightIndexer_getDBLogsWithCompletionHandler___block_invoke;
  v9[3] = &unk_24D0ED340;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  v4[2](v4, 1);
}

void __57__SPCoreSpotlightIndexer_getDBLogsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("lastQueryString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __57__SPCoreSpotlightIndexer_getDBLogsWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_24D0EAD20;
    v9 = v6;
    v7 = v6;
    objc_msgSend(v4, "dumpAllRankingDiagnosticInformationForQuery:withCompletionHandler:", v5, v8);
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  }
}

void __57__SPCoreSpotlightIndexer_getDBLogsWithCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_issueDiagnose:(int)a3 logQuery:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);

  v33 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer _issueDiagnose:logQuery:completionHandler:].cold.1();

  objc_msgSend((id)sDelegate, "dumpTTRDebugFiles");
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v11, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm-ss"));
  v34 = v11;
  objc_msgSend(v11, "stringFromDate:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  if ((v5 & 0x80000000) != 0)
  {
    SPLogDirectory();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "fileExistsAtPath:", v15);

    if ((v17 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v15, 0);

    }
    objc_msgSend(CFSTR("Spotlight_"), "stringByAppendingFormat:", CFSTR("%@.log"), v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v19);
    v14 = (__CFString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)-[__CFString fileSystemRepresentation](v14, "fileSystemRepresentation");
    v5 = open(v13, 522, 384);

  }
  else
  {
    v13 = 0;
    v14 = CFSTR("corespotlight.log");
  }
  v35 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if ((int)v5 < 1)
    v20 = 0;
  else
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:closeOnDealloc:", v5, 1);
  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v12;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("=== Spotlight Diagnostic (%d) %@\n\n"), getpid(), v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dataUsingEncoding:", 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v21, "writeData:toFile:", v24, v20);

  if (v25
    && +[SPCoreSpotlightIndexer writeDiagnostic:bundleID:identifier:logQuery:](SPCoreSpotlightIndexer, "writeDiagnostic:bundleID:identifier:logQuery:", v20, 0, 0, v33))
  {
    +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("=== Spotlight Diagnostic End\n"), "dataUsingEncoding:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "writeData:toFile:", v27, v20);

  }
  else
  {
    v28 = 0;
  }
  v29 = v22;
  if (v13 && (v28 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeItemAtPath:error:", v31, 0);

    v29 = v22;
  }
  objc_msgSend(v20, "closeFile");
  objc_msgSend(v9, "addObject:", v14);
  if (!objc_msgSend(v9, "count"))
  {
    v32 = 0;
    if (!v35)
      goto LABEL_21;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v9, 200, 0, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
LABEL_20:
    ((void (**)(_QWORD, void *, _QWORD))v35)[2](v35, v32, 0);

  }
LABEL_21:

}

- (void)_issueCacheCommand:(id)a3 xpc:(id)a4 searchContext:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  BOOL v24;
  dispatch_queue_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  NSObject *indexQueue;
  NSObject *v57;
  NSObject *queuea;
  dispatch_queue_t queue;
  void *v60;
  void *v61;
  _QWORD v62[4];
  dispatch_queue_t v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  NSObject *v68;
  NSObject *v69;
  id v70;
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  NSObject *v75;
  NSObject *v76;
  id v77;
  id v78;
  id v79;
  _QWORD block[4];
  id v81;
  NSObject *v82;
  id v83;
  NSObject *v84;
  id v85;
  _QWORD v86[4];
  NSObject *v87;
  id v88;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  logForCSLogCategoryIndex();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer _issueCacheCommand:xpc:searchContext:completionHandler:].cold.1();

  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");
  if (!v14)
    goto LABEL_35;
  v15 = v14;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("erase"));

  if (v17)
  {
    if (v15 >= 2)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = (void *)*MEMORY[0x24BDD0CE0];
      if (v18)
        v20 = (void *)v18;
      v21 = v20;
      -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v21, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = v22 != 0;
      if (!v22)
      {
LABEL_44:

        if (!v11)
          goto LABEL_49;
        goto LABEL_45;
      }
      v86[0] = MEMORY[0x24BDAC760];
      v86[1] = 3221225472;
      v86[2] = __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke;
      v86[3] = &unk_24D0ED368;
      v23 = v22;
      v87 = v23;
      v88 = v11;
      -[NSObject closeCache:](v23, "closeCache:", v86);

      v11 = 0;
      v24 = 1;
      v25 = v87;
LABEL_43:

      goto LABEL_44;
    }
    goto LABEL_37;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("lookup"));

  if (v27)
  {
    if (v15 >= 4)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
      v23 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)*MEMORY[0x24BDD0CE0];
      v60 = (void *)v28;
      if (v28)
        v30 = (void *)v28;
      v31 = v30;
      -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v31, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v24 = v32 != 0;
      if (v32)
      {
        queuea = self->_indexQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_1667;
        block[3] = &unk_24D0ED0D0;
        v81 = v32;
        v82 = v23;
        v83 = v29;
        v34 = v31;
        v84 = v31;
        v85 = v11;
        dispatch_sync(queuea, block);

        v11 = 0;
      }
      else
      {
        v34 = v31;
      }
      v21 = v29;
      v19 = v60;

      v25 = v34;
      goto LABEL_43;
    }
    goto LABEL_37;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("insert"));

  if (v36)
  {
    if (v15 >= 5)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 4);
      queue = (dispatch_queue_t)objc_claimAutoreleasedReturnValue();
      v39 = (void *)*MEMORY[0x24BDD0CE0];
      v61 = (void *)v37;
      if (v37)
        v39 = (void *)v37;
      v40 = v39;
      -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v40, v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      v24 = v41 != 0;
      if (v41)
      {
        indexQueue = self->_indexQueue;
        v73[0] = MEMORY[0x24BDAC760];
        v73[1] = 3221225472;
        v73[2] = __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_2;
        v73[3] = &unk_24D0ED390;
        v74 = v41;
        v75 = v23;
        v76 = queue;
        v43 = v38;
        v77 = v38;
        v78 = v40;
        v79 = v11;
        dispatch_sync(indexQueue, v73);

        v44 = v74;
LABEL_28:

        v11 = 0;
LABEL_42:
        v19 = v61;

        v25 = queue;
        v21 = v43;
        goto LABEL_43;
      }
      goto LABEL_41;
    }
    goto LABEL_37;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("delete"));

  if (!v46)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "isEqualToString:", CFSTR("fileDescriptor"));

    if (v51)
    {
      if (v15 >= 3)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v52 = (void *)*MEMORY[0x24BDD0CE0];
        if (v19)
          v52 = v19;
        v23 = v52;
        -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v23, v21);
        v53 = objc_claimAutoreleasedReturnValue();
        v25 = v53;
        v24 = v53 != 0;
        if (v53)
        {
          v54 = self->_indexQueue;
          v62[0] = MEMORY[0x24BDAC760];
          v62[1] = 3221225472;
          v62[2] = __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_4;
          v62[3] = &unk_24D0EB758;
          v25 = v53;
          v63 = v25;
          v64 = v10;
          v65 = v11;
          dispatch_sync(v54, v62);

          v11 = 0;
          v24 = 1;
        }
        goto LABEL_43;
      }
      goto LABEL_37;
    }
LABEL_35:
    v24 = 1;
    if (!v11)
      goto LABEL_49;
    goto LABEL_45;
  }
  if (v15 >= 5)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v47 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 4);
    queue = (dispatch_queue_t)objc_claimAutoreleasedReturnValue();
    v48 = (void *)*MEMORY[0x24BDD0CE0];
    v61 = (void *)v47;
    if (v47)
      v48 = (void *)v47;
    v40 = v48;
    -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v40, v38);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v49;
    v24 = v49 != 0;
    if (v49)
    {
      v57 = self->_indexQueue;
      v66[0] = MEMORY[0x24BDAC760];
      v66[1] = 3221225472;
      v66[2] = __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_3;
      v66[3] = &unk_24D0ED390;
      v67 = v49;
      v68 = v23;
      v69 = queue;
      v43 = v38;
      v70 = v38;
      v71 = v40;
      v72 = v11;
      dispatch_sync(v57, v66);

      v44 = v67;
      goto LABEL_28;
    }
LABEL_41:
    v43 = v38;
    goto LABEL_42;
  }
LABEL_37:
  v24 = 0;
  if (!v11)
    goto LABEL_49;
LABEL_45:
  if (v24)
  {
    v55 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -2005, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v55);

LABEL_49:
}

void __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v1 = a1;
  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_indexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    v24 = v1;
    v25 = v2;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDBCC60];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", *MEMORY[0x24BDBCCD0], *MEMORY[0x24BDBCC60], *MEMORY[0x24BDBCC48], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v3;
    objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v9, 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v26 = 0;
          objc_msgSend(v16, "getResourceValue:forKey:error:", &v26, v8, 0);
          v17 = v26;
          if ((objc_msgSend(v17, "BOOLValue") & 1) == 0)
          {
            objc_msgSend(v16, "absoluteString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "containsString:", CFSTR("spotlightcache"));

            if (v19)
            {
              logForCSLogCategoryIndex();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v16, "absoluteString");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v32 = v21;
                _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_INFO, "Spotlight cache erase %@", buf, 0xCu);

              }
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "removeItemAtURL:error:", v16, 0);

            }
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v13);
    }

    v1 = v24;
    v2 = v25;
    v3 = v23;
  }
  (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();

}

void __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_1667(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v4[0] = a1[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheEntryForKeys:bundleID:protectionClass:completionHandler:", v3, a1[6], a1[7], a1[8]);

}

uint64_t __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacheInsertForKey:value:bundleID:protectionClass:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacheDeleteForKey:value:bundleID:protectionClass:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __81__SPCoreSpotlightIndexer__issueCacheCommand_xpc_searchContext_completionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "spotlightCacheFileDescriptor:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)writeUISearchEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];

  v3 = a3;
  v26[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)sDelegate, "indexDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF48];
  NSHomeDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  v26[1] = CFSTR("Library");
  v26[2] = CFSTR("Containers");
  v26[3] = CFSTR("com.apple.managedcorespotlightd");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPathComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF48];
  NSHomeDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v10;
  v25[1] = CFSTR("Library");
  v25[2] = CFSTR("Containers");
  v25[3] = CFSTR("com.apple.managedcorespotlightd");
  v25[4] = CFSTR("EnabledIndexes");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPathComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithContentsOfURL:", v12);
    if (!v13)
      v13 = (void *)objc_opt_new();
    v14 = objc_msgSend(v13, "containsObject:", v4);
    if ((v14 & 1) != 0 || !v3)
    {
      v16 = 0;
      if (!v14 || v3)
      {
        v15 = v13;
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF != %@"), v4);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "filteredArrayUsingPredicate:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)v17;
    }
    else
    {
      objc_msgSend(v13, "arrayByAddingObject:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v19 = objc_msgSend(v18, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v24);
    v20 = v24;

    if (!v19 || v20)
    {
      logForCSLogCategoryDefault();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[SPCoreSpotlightIndexer writeUISearchEnabled:].cold.2();

    }
    if ((objc_msgSend(v15, "writeToURL:atomically:", v12, 1) & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      logForCSLogCategoryDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SPCoreSpotlightIndexer writeUISearchEnabled:].cold.1();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_23;
  }
  v16 = 0;
LABEL_24:

  return v16;
}

- (void)_issueCommand:(id)a3 outFileDescriptor:(int)a4 searchContext:(id)a5 completionHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  char *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  qos_class_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  id v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  int v64;
  NSObject *v65;
  void *v66;
  NSObject *v67;
  id v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  int v73;
  void *v74;
  int v75;
  void *v76;
  int v77;
  void *v78;
  int v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  int v86;
  void *v87;
  uint64_t v88;
  void *v89;
  int v90;
  void *v91;
  id v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  int v105;
  void *v106;
  int v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  NSObject *v121;
  NSObject *v122;
  void *v123;
  int v124;
  NSObject *v125;
  NSObject *v126;
  void *v127;
  int v128;
  void *v129;
  id v130;
  void *v131;
  int v132;
  void *v133;
  void *v134;
  int v135;
  void *v136;
  void *v137;
  int v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  void *v143;
  int v144;
  void *v145;
  void *v146;
  uint64_t i;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  void *v152;
  void *v153;
  int v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  char v159;
  void *v160;
  NSObject *v161;
  id v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  NSObject *v166;
  void *v167;
  void *v168;
  _BOOL4 v169;
  void *v170;
  BOOL v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  int v176;
  void *v177;
  int v178;
  void *v179;
  id v180;
  id v181;
  void *v182;
  int v183;
  void *v184;
  int v185;
  void *v186;
  int v187;
  void *v188;
  void *v189;
  void *v190;
  uint64_t v191;
  void *v192;
  int v193;
  void *v194;
  void *v195;
  void *v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  int v202;
  void *v203;
  void *v204;
  int v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  NSObject *v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  id v214;
  SPCoreSpotlightIndexerTask *v215;
  void *v216;
  int v217;
  void *v218;
  void *v219;
  void *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  id v229;
  SPCoreSpotlightIndexerTask *v230;
  void *v231;
  int v232;
  void *v233;
  uint64_t v234;
  void *v235;
  int v236;
  NSObject *v237;
  void *v238;
  int v239;
  NSObject *v240;
  void *v241;
  int v242;
  void *v243;
  void *v244;
  int v245;
  double v246;
  double v247;
  void *v248;
  double v249;
  void *v250;
  int v251;
  void *v252;
  void *v253;
  int v254;
  void *v255;
  int v256;
  void *v257;
  int v258;
  void *v259;
  void *v260;
  int v261;
  void *v262;
  int v263;
  void *v264;
  int v265;
  void *v266;
  void *v267;
  void *v268;
  int v269;
  void *v270;
  int v271;
  void *v272;
  int v273;
  void *v274;
  int v275;
  void *v276;
  int v277;
  void *v278;
  void *v279;
  id v280;
  void *v281;
  id v282;
  id v283;
  void *v284;
  int v285;
  void *v286;
  id v287;
  void *v288;
  id v289;
  void *v290;
  void *v291;
  int v292;
  void *v293;
  id v294;
  void *v295;
  void *v296;
  int v297;
  void *v298;
  void *v299;
  int v300;
  void *v301;
  void *v302;
  void *v303;
  int v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t j;
  uint64_t v308;
  void *v309;
  void *v310;
  NSObject *v311;
  void *v312;
  NSObject *v313;
  id v314;
  void *v315;
  void *v316;
  void *v317;
  int v318;
  void *v319;
  void *v320;
  unint64_t v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  int v329;
  void *v330;
  void *v331;
  uint64_t v332;
  uint64_t v333;
  NSObject *v334;
  void *v335;
  void *v336;
  NSObject *v337;
  void *v338;
  int v339;
  NSObject *indexQueue;
  _QWORD *v341;
  void *v342;
  int v343;
  void *v344;
  int v345;
  void *v346;
  int v347;
  void *v348;
  int v349;
  const __CFString *v350;
  void *v351;
  void *v352;
  int v353;
  void *v354;
  uint64_t v355;
  void *v356;
  int v357;
  void *v358;
  uint64_t v359;
  void *v360;
  void *v361;
  int v362;
  void *v363;
  void *v364;
  void *v365;
  double v366;
  double v367;
  void *v368;
  void *v369;
  int v370;
  void *v371;
  void *v372;
  int v373;
  void *v374;
  void *v375;
  void *v376;
  unsigned int v377;
  int v378;
  int v379;
  void *v380;
  void *v381;
  void *v382;
  int v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  int v397;
  void *v398;
  void *v399;
  uint64_t v400;
  void *v401;
  void *v402;
  void *v403;
  id v404;
  void *v405;
  unsigned int v406;
  void *v407;
  void *v408;
  void *v409;
  id v410;
  void *v411;
  void *v412;
  id obj;
  id obja;
  void *v415;
  dispatch_group_t group;
  NSObject *groupa;
  void *v418;
  void *v419;
  void *v420;
  uint64_t v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  SPCoreSpotlightIndexer *v427;
  id v428;
  _QWORD v429[4];
  id v430;
  _QWORD v431[5];
  _QWORD v432[4];
  id v433;
  _QWORD v434[4];
  id v435;
  _QWORD v436[5];
  _QWORD v437[5];
  _QWORD v438[9];
  id v439;
  SPCoreSpotlightIndexer *v440;
  id v441;
  id v442;
  uint64_t v443;
  uint64_t v444;
  void (*v445)(uint64_t, int);
  void *v446;
  id v447;
  id v448;
  _QWORD v449[4];
  id v450;
  _BYTE *v451;
  uint64_t v452;
  uint64_t v453;
  void (*v454)(uint64_t, int);
  void *v455;
  id v456;
  NSObject *v457;
  _BYTE *v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  _QWORD v463[4];
  id v464;
  _QWORD v465[4];
  id v466;
  _BYTE *v467;
  _QWORD v468[4];
  id v469;
  _QWORD v470[4];
  id v471;
  id v472;
  _QWORD v473[4];
  id v474;
  _QWORD v475[4];
  id v476;
  _QWORD v477[4];
  id v478;
  _QWORD v479[4];
  id v480;
  _QWORD v481[4];
  id v482;
  _QWORD v483[4];
  id v484;
  _QWORD v485[4];
  id v486;
  _QWORD v487[4];
  id v488;
  _QWORD v489[4];
  id v490;
  id v491;
  id v492;
  id v493;
  _QWORD v494[4];
  id v495;
  _QWORD v496[4];
  id v497;
  _QWORD block[4];
  id v499;
  _QWORD v500[4];
  id v501;
  _QWORD v502[5];
  id v503;
  _QWORD v504[5];
  id v505;
  _QWORD v506[4];
  id v507;
  uint8_t v508[4];
  void *v509;
  __int16 v510;
  void *v511;
  __int16 v512;
  void *v513;
  uint8_t v514[128];
  _BYTE buf[24];
  uint64_t (*v516)(uint64_t, uint64_t);
  void (*v517)(uint64_t);
  __CFString *v518;
  void *v519;
  void *v520;
  _QWORD v521[4];

  v8 = *(_QWORD *)&a4;
  v521[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v428 = a5;
  v11 = a6;
  v427 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_indexQueue);
  logForCSLogCategoryIndex();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightIndexer _issueCommand:outFileDescriptor:searchContext:completionHandler:].cold.3();

  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(":"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (char *)objc_msgSend(v13, "count");
  if (!v14)
    goto LABEL_430;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("reset"));

  if (v16)
  {
    if (v11)
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
    dispatch_sync((dispatch_queue_t)self->_indexQueue, &__block_literal_global_1685);
    exit(0);
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("provide"));

  if (v18)
  {
    if ((unint64_t)v14 >= 5)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("data1")))
      {
        v20 = 0;
        if ((unint64_t)v14 > 5)
        {
          v21 = 6;
          goto LABEL_29;
        }
      }
      else
      {
        if (!objc_msgSend(v19, "isEqualToString:", CFSTR("url1")))
        {
          if (!objc_msgSend(v19, "isEqualToString:", CFSTR("urls")))
          {
            if ((objc_msgSend(v19, "isEqualToString:", CFSTR("data")) & 1) != 0)
            {
              v20 = 0;
              v39 = 0;
              v40 = 2;
              v21 = 6;
            }
            else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("url")) & 1) != 0)
            {
              v20 = 0;
              v39 = 0;
              v40 = 2;
              v21 = 7;
            }
            else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("nonDownloadingData")) & 1) != 0)
            {
              v20 = 0;
              v39 = 0;
              v40 = 2;
              v21 = 14;
            }
            else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("nonDownloadingUrl")) & 1) != 0)
            {
              v20 = 0;
              v39 = 0;
              v40 = 2;
              v21 = 15;
            }
            else
            {
              v20 = 0;
              if ((objc_msgSend(v19, "isEqualToString:", CFSTR("inPlaceUrl")) & 1) == 0)
                goto LABEL_42;
              v39 = 0;
              v40 = 2;
              v21 = 8;
            }
LABEL_30:
            v41 = objc_msgSend(v39, "integerValue");
            v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:jobOptions:", v21, (unint64_t)(v41 & 0xF) << 11);
            objc_msgSend(v13, "objectAtIndexedSubscript:", v40);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setProviderType:", v43);

            objc_msgSend(v13, "objectAtIndexedSubscript:", v40 + 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v40 + 2;
            if (v14 == (char *)(v40 + 3))
            {
              objc_msgSend(v13, "objectAtIndexedSubscript:", v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v13, "subarrayWithRange:", v45, &v14[-v45]);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "componentsJoinedByString:", CFSTR(":"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();

            }
            if (v20)
            {
              objc_msgSend(v46, "componentsSeparatedByString:", CFSTR(";"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setProviderIdentifiers:", v48);

            }
            else
            {
              objc_msgSend(v42, "setProviderIdentifier:", v46);
            }
            +[SpotlightDaemonServer sharedDaemonServer](SpotlightDaemonServer, "sharedDaemonServer");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "handleJob:bundleID:protectionClass:completionHandler:", v42, v44, *MEMORY[0x24BDD0CE0], v11);

            if ((v50 & 1) != 0)
            {
              v51 = v11;
            }
            else
            {
              -[SPCoreSpotlightIndexer extensionDelegate](v427, "extensionDelegate");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v52;
              if (!v52)
              {
LABEL_41:

                LOBYTE(v20) = 1;
                goto LABEL_42;
              }
              objc_msgSend(v52, "indexRequestsPerformDataJob:forBundle:completionHandler:", v42, v44, v11);

            }
            v11 = 0;
            goto LABEL_41;
          }
          if ((unint64_t)v14 <= 5)
          {
            LOBYTE(v20) = 0;
            goto LABEL_42;
          }
          v20 = 1;
          v21 = 16;
LABEL_29:
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 3;
          goto LABEL_30;
        }
        v20 = 0;
        if ((unint64_t)v14 > 5)
        {
          v21 = 7;
          goto LABEL_29;
        }
      }
LABEL_42:

      goto LABEL_431;
    }
    goto LABEL_430;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("remote"));

  if (v23)
  {
    if ((unint64_t)v14 >= 3)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == (char *)3)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v13, "subarrayWithRange:", 2, v14 - 2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR(":"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v428 && objc_msgSend(v25, "isEqualToString:", CFSTR("start")))
      {
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:jobOptions:", 9, 0);
        objc_msgSend(v54, "setSearchContext:", v428);
        -[SPCoreSpotlightIndexer extensionDelegate](v427, "extensionDelegate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55)
        {
LABEL_55:
          objc_msgSend(v55, "indexRequestsPerformDataJob:forBundle:completionHandler:", v54, v24, v11);

          v11 = 0;
        }
      }
      else if (objc_msgSend(v25, "isEqualToString:", CFSTR("cancel")))
      {
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:jobOptions:", 10, 0);
        objc_msgSend(v54, "setSearchContext:", v428);
        -[SPCoreSpotlightIndexer extensionDelegate](v427, "extensionDelegate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55)
          goto LABEL_55;
      }
      else
      {
        if (!objc_msgSend(v25, "isEqualToString:", CFSTR("test")))
        {
          LOBYTE(v20) = 0;
          goto LABEL_57;
        }
        v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:jobOptions:", 11, 0);
        objc_msgSend(v54, "setSearchContext:", v428);
        -[SPCoreSpotlightIndexer extensionDelegate](v427, "extensionDelegate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55)
          goto LABEL_55;
      }

      LOBYTE(v20) = 1;
LABEL_57:

      goto LABEL_431;
    }
LABEL_430:
    LOBYTE(v20) = 0;
LABEL_431:
    if (v11)
    {
      if ((v20 & 1) != 0)
      {
        v371 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
        v371 = (void *)objc_claimAutoreleasedReturnValue();
      }
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v371);

    }
    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("notifyForUpdates"));

  if (v27)
  {
    if ((unint64_t)v14 >= 2)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:jobOptions:", 17, 0);
      +[SpotlightDaemonServer sharedDaemonServer](SpotlightDaemonServer, "sharedDaemonServer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "handleJob:bundleID:protectionClass:completionHandler:", v29, v28, *MEMORY[0x24BDD0CE0], v11);

      if ((v31 & 1) == 0)
      {
        -[SPCoreSpotlightIndexer extensionDelegate](v427, "extensionDelegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
          objc_msgSend(v32, "indexRequestsPerformDataJob:forBundle:completionHandler:", v29, v28, v11);

      }
      goto LABEL_436;
    }
LABEL_82:
    LOBYTE(v20) = 1;
    goto LABEL_431;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("extensions"));

  if (v35)
  {
    v36 = qos_class_self();
    dispatch_get_global_queue(v36, 2uLL);
    v37 = objc_claimAutoreleasedReturnValue();
    v506[0] = MEMORY[0x24BDAC760];
    v506[1] = 3221225472;
    v506[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1718;
    v506[3] = &unk_24D0EA938;
    v507 = v11;
    _setup_block(v506, 0, 15733);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v37, v38);

    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("clients"));

  if (v58)
  {
    v504[0] = MEMORY[0x24BDAC760];
    v504[1] = 3221225472;
    v504[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2;
    v504[3] = &unk_24D0EB780;
    v504[4] = v427;
    v505 = v11;
    v59 = v11;
    v60 = (void *)MEMORY[0x2199C2F34](v504);
    v61 = sIndexQueue;
    _setup_block(v60, 0, 15751);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v61, v62);

    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("commit"));

  if (v64)
  {
    logForCSLogCategoryIndex();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_213CF1000, v65, OS_LOG_TYPE_DEFAULT, "Commit command: %@", buf, 0xCu);
    }

    v66 = (void *)MEMORY[0x2199C2F34](v11);
    v67 = sIndexQueue;
    v502[0] = MEMORY[0x24BDAC760];
    v502[1] = 3221225472;
    v502[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1723;
    v502[3] = &unk_24D0EB780;
    v502[4] = v427;
    v503 = v66;
    v68 = v66;
    _setup_block(v502, 0, 15761);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v67, v69);

    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "isEqualToString:", CFSTR("flush"));

  if (v71)
  {
    -[SPCoreSpotlightIndexer flush](v427, "flush");
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "isEqualToString:", CFSTR("begin-turbo"));

  if (v73)
  {
    setTurboMode(1);
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "isEqualToString:", CFSTR("end-turbo"));

  if (v75)
  {
    setTurboMode(0);
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "isEqualToString:", CFSTR("close"));

  if (v77)
  {
    -[SPCoreSpotlightIndexer closeIndex](v427, "closeIndex");
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v78, "isEqualToString:", CFSTR("merge"));

  if (v79)
  {
    logForCSLogCategoryIndex();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_213CF1000, v80, OS_LOG_TYPE_DEFAULT, "Merge command: %@", buf, 0xCu);
    }

    if ((unint64_t)v14 <= 1)
    {
      v83 = (void *)MEMORY[0x2199C2F34](v11);
      v84 = 0;
      v82 = 0;
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v521[0] = v81;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v521, 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      v83 = (void *)MEMORY[0x2199C2F34](v11);
      if (v14 != (char *)2)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v14 = (char *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v14, "isEqual:", CFSTR("cts"));
        v84 = 1;
        goto LABEL_99;
      }
      v84 = 0;
    }
    v88 = 0;
LABEL_99:
    v500[0] = MEMORY[0x24BDAC760];
    v500[1] = 3221225472;
    v500[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1737;
    v500[3] = &unk_24D0ED3D8;
    v501 = v83;
    v92 = v83;
    -[SPCoreSpotlightIndexer mergeWithProtectionClasses:power:inferPriorityIndex:completionHandler:](v427, "mergeWithProtectionClasses:power:inferPriorityIndex:completionHandler:", v82, v88, 0, v500);
    if (v84)

    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "isEqualToString:", CFSTR("split"));

  if (v86)
  {
    if ((unint64_t)v14 <= 1)
    {
      -[SPCoreSpotlightIndexer issueSplit:](v427, "issueSplit:", 0);
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCoreSpotlightIndexer issueSplit:](v427, "issueSplit:", v87);

    }
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "isEqualToString:", CFSTR("repair"));

  if (v90)
  {
    if ((unint64_t)v14 <= 1)
    {
      -[SPCoreSpotlightIndexer issueRepair:](v427, "issueRepair:", 0);
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCoreSpotlightIndexer issueRepair:](v427, "issueRepair:", v91);

    }
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(v93, "isEqualToString:", CFSTR("cleanup"));

  if (v94)
  {
    if ((unint64_t)v14 < 2)
    {
      -[SPCoreSpotlightIndexer issueCleanup:flags:](v427, "issueCleanup:flags:", 0, 0);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 == (char *)2)
    {
      -[SPCoreSpotlightIndexer issueCleanup:flags:](v427, "issueCleanup:flags:", v95, 0);
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCoreSpotlightIndexer issueCleanup:flags:](v427, "issueCleanup:flags:", v95, objc_msgSend(v101, "intValue"));

    }
LABEL_166:

    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "isEqualToString:", CFSTR("defrag"));

  if (v97)
  {
    if ((unint64_t)v14 <= 1)
    {
      -[SPCoreSpotlightIndexer issueDefrag:group:](v427, "issueDefrag:group:", 0, 0);
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCoreSpotlightIndexer issueDefrag:group:](v427, "issueDefrag:group:", v98, 0);

    }
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v99, "isEqualToString:", CFSTR("reverse"));

  if (v100)
  {
    -[SPCoreSpotlightIndexer issueDumpReverse:completionHandler:](v427, "issueDumpReverse:completionHandler:", 0, v11);

    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v102, "isEqualToString:", CFSTR("reverseTree"));

  if (v103)
  {
    -[SPCoreSpotlightIndexer issueDumpReverse:completionHandler:](v427, "issueDumpReverse:completionHandler:", 1, v11);

    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(v104, "isEqualToString:", CFSTR("forward"));

  if (v105)
  {
    -[SPCoreSpotlightIndexer issueDumpForward:completionHandler:](v427, "issueDumpForward:completionHandler:", 0, v11);

    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "isEqualToString:", CFSTR("pathfixup"));

  if (v107)
  {
    if ((unint64_t)v14 < 2)
    {
      v108 = 0;
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v108)
      v114 = v108;
    else
      v114 = (void *)*MEMORY[0x24BDD0CE0];
    -[SPCoreSpotlightIndexer issuePathFixup:](v427, "issuePathFixup:", v114);

    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v109, "isEqualToString:", CFSTR("resolveFP"));

  if (v110)
  {
    if ((unint64_t)v14 >= 4)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCoreSpotlightIndexer issueResolveFPItemForBundle:domain:identifier:completionHandler:](v427, "issueResolveFPItemForBundle:domain:identifier:completionHandler:", v111, v112, v113, v11);

      goto LABEL_436;
    }
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "isEqualToString:", CFSTR("resolveFPURL"));

  if (v116)
  {
    if ((unint64_t)v14 < 2)
      goto LABEL_82;
    objc_msgSend(v13, "subarrayWithRange:", 1, v14 - 1);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "componentsJoinedByString:", CFSTR(":"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    if (v95)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v95);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      if (v118)
      {
        -[SPCoreSpotlightIndexer issueResolveFPItemForURL:completionHandler:](v427, "issueResolveFPItemForURL:completionHandler:", v118, v11);

        v11 = 0;
      }

    }
    goto LABEL_166;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v119, "isEqualToString:", CFSTR("testSuspendUntilUnlocked"));

  if (v120)
  {
    logForCSLogCategoryIndex();
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v121, OS_LOG_TYPE_DEFAULT, "### testSuspendUntilUnlocked started", buf, 2u);
    }

    dispatch_get_global_queue(21, 2uLL);
    v122 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1758;
    block[3] = &unk_24D0EA938;
    v499 = v11;
    dispatch_async(v122, block);

    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend(v123, "isEqualToString:", CFSTR("testSuspendUntilLocked"));

  if (v124)
  {
    logForCSLogCategoryIndex();
    v125 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v125, OS_LOG_TYPE_DEFAULT, "### testSuspendUntilLocked started", buf, 2u);
    }

    dispatch_get_global_queue(21, 2uLL);
    v126 = objc_claimAutoreleasedReturnValue();
    v496[0] = MEMORY[0x24BDAC760];
    v496[1] = 3221225472;
    v496[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1761;
    v496[3] = &unk_24D0EA938;
    v497 = v11;
    dispatch_async(v126, v496);

    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v127, "isEqualToString:", CFSTR("messages_fixup"));

  if (v128)
  {
    v129 = (void *)MEMORY[0x2199C2F34](v11);

    v494[0] = MEMORY[0x24BDAC760];
    v494[1] = 3221225472;
    v494[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1764;
    v494[3] = &unk_24D0EB898;
    v495 = v129;
    v130 = v129;
    -[SPCoreSpotlightIndexer issueMessagesFixup:](v427, "issueMessagesFixup:", v494);

    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = objc_msgSend(v131, "isEqualToString:", CFSTR("check"));

  if (v132)
  {
    if ((unint64_t)v14 <= 1)
    {
      -[SPCoreSpotlightIndexer issueConsistencyCheck:](v427, "issueConsistencyCheck:", 0);
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCoreSpotlightIndexer issueConsistencyCheck:](v427, "issueConsistencyCheck:", v133);

    }
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = objc_msgSend(v134, "isEqualToString:", CFSTR("duplicates"));

  if (v135)
  {
    if ((unint64_t)v14 <= 1)
    {
      -[SPCoreSpotlightIndexer issueDuplicateOidCheck:](v427, "issueDuplicateOidCheck:", 0);
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCoreSpotlightIndexer issueDuplicateOidCheck:](v427, "issueDuplicateOidCheck:", v136);

    }
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = objc_msgSend(v137, "isEqualToString:", CFSTR("exception"));

  if (v138)
  {
    v139 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)v14 <= 1)
    {
      objc_msgSend(v139, "raise:format:", v95, CFSTR("%@"), &stru_24D0EF078);
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "raise:format:", v95, CFSTR("%@"), v140);

    }
    goto LABEL_166;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = objc_msgSend(v141, "isEqualToString:", CFSTR("trace"));

  if (v142)
  {
    if ((unint64_t)v14 >= 2
      && (objc_msgSend(v13, "objectAtIndexedSubscript:", 1),
          v143 = (void *)objc_claimAutoreleasedReturnValue(),
          v144 = objc_msgSend(v143, "intValue"),
          v143,
          v144))
    {
      SDTraceDescription(v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v145 = (void *)objc_opt_new();
      for (i = 0; i != 4; ++i)
      {
        SDTraceDescription(i);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v148, "length"))
        {
          objc_msgSend(v145, "appendString:", v148);
          objc_msgSend(v145, "appendString:", CFSTR("\n"));
        }

      }
    }
    if (v11 && objc_msgSend(v145, "length"))
    {
      objc_msgSend(v145, "dataUsingEncoding:", 4);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v11 + 2))(v11, v149, 0);

      v11 = 0;
    }
    goto LABEL_329;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v146, "isEqualToString:", CFSTR("diagnose")))
  {

LABEL_178:
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v406 = objc_msgSend(v152, "isEqualToString:", CFSTR("diagnose_logq"));

    objc_msgSend((id)sDelegate, "dumpTTRDebugFiles");
    if ((unint64_t)v14 < 2)
    {
      v407 = 0;
      v408 = 0;
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v407 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == (char *)2)
      {
        v408 = 0;
      }
      else
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v408 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v418 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    obj = (id)objc_claimAutoreleasedReturnValue();
    group = (dispatch_group_t)objc_alloc_init(MEMORY[0x24BDD1500]);
    -[NSObject setDateFormat:](group, "setDateFormat:", CFSTR("yyyy-MM-dd-HH-mm-ss"));
    -[NSObject stringFromDate:](group, "stringFromDate:", obj);
    v415 = (void *)objc_claimAutoreleasedReturnValue();
    SPLogDirectory();
    v422 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = objc_msgSend(v158, "fileExistsAtPath:", v422);

    if ((v159 & 1) != 0
      || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v160 = (void *)objc_claimAutoreleasedReturnValue(),
          v493 = 0,
          objc_msgSend(v160, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v422, 1, 0, &v493), v410 = v493, v160, !v410))
    {
      v410 = 0;
    }
    else
    {
      logForCSLogCategoryDefault();
      v161 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
        -[SPCoreSpotlightIndexer _issueCommand:outFileDescriptor:searchContext:completionHandler:].cold.2();

    }
    objc_msgSend(CFSTR("Spotlight_"), "stringByAppendingFormat:", CFSTR("%@.log"), v415);
    v412 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v422, "stringByAppendingPathComponent:", v412);
    v162 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v163 = (const char *)objc_msgSend(v162, "fileSystemRepresentation");
    v164 = open(v163, 522, 384);
    __error();
    if ((int)v164 < 1)
    {
      logForCSLogCategoryDefault();
      v166 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
        -[SPCoreSpotlightIndexer _issueCommand:outFileDescriptor:searchContext:completionHandler:].cold.1();

      v165 = 0;
    }
    else
    {
      v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:closeOnDealloc:", v164, 1);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("=== Spotlight Diagnostic (%d) %@\n\n"), getpid(), v415);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "dataUsingEncoding:", 4);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = -[SPCoreSpotlightIndexer writeData:toFile:](v427, "writeData:toFile:", v168, v165);

    if (v169
      && +[SPCoreSpotlightIndexer writeDiagnostic:bundleID:identifier:logQuery:](SPCoreSpotlightIndexer, "writeDiagnostic:bundleID:identifier:logQuery:", v165, v407, v408, v406))
    {
      objc_msgSend(CFSTR("=== Spotlight Diagnostic End\n"), "dataUsingEncoding:", 4);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = -[SPCoreSpotlightIndexer writeData:toFile:](v427, "writeData:toFile:", v170, v165);

    }
    else
    {
      v171 = 0;
    }
    if (v163 && !v171)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v163);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "removeItemAtPath:error:", v173, 0);

    }
    objc_msgSend(v165, "closeFile");
    objc_msgSend(v418, "addObject:", v162);
    if (objc_msgSend(v418, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v418, 200, 0, 0);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v174 = 0;
    }
    if (v11)
    {
      (*((void (**)(id, void *, _QWORD))v11 + 2))(v11, v174, 0);

    }
    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = objc_msgSend(v150, "isEqualToString:", CFSTR("diagnose_logq"));

  if (v151)
    goto LABEL_178;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = objc_msgSend(v153, "isEqualToString:", CFSTR("clientstate"));

  if (v154)
  {
    if ((unint64_t)v14 >= 3)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == (char *)3)
      {
        v157 = 0;
      }
      else
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v489[0] = MEMORY[0x24BDAC760];
      v489[1] = 3221225472;
      v489[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1780;
      v489[3] = &unk_24D0ED400;
      v490 = v155;
      v491 = v156;
      v492 = v11;
      v180 = v156;
      v181 = v155;
      -[SPCoreSpotlightIndexer fetchLastClientStateWithProtectionClass:forBundleID:clientStateName:options:completionHandler:](v427, "fetchLastClientStateWithProtectionClass:forBundleID:clientStateName:options:completionHandler:", v157, v181, v180, 0, v489);

      goto LABEL_436;
    }
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = objc_msgSend(v175, "isEqualToString:", CFSTR("applications"));

  if (v176)
  {
    notify_post("com.apple.searchd.applications.changed");
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = objc_msgSend(v177, "isEqualToString:", CFSTR("ranking"));

  if (v178)
  {
    if ((unint64_t)v14 < 2)
    {
      v179 = 0;
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v487[0] = MEMORY[0x24BDAC760];
    v487[1] = 3221225472;
    v487[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1786;
    v487[3] = &unk_24D0EA938;
    v488 = v11;
    -[SPCoreSpotlightIndexer handleRankingCommand:completion:](v427, "handleRankingCommand:completion:", v179, v487);
    if ((unint64_t)v14 > 1)

    goto LABEL_436;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = objc_msgSend(v182, "isEqualToString:", CFSTR("query_spotlight"));

  if (v183
    || (objc_msgSend(v13, "objectAtIndexedSubscript:", 0),
        v184 = (void *)objc_claimAutoreleasedReturnValue(),
        v185 = objc_msgSend(v184, "isEqualToString:", CFSTR("query_pommes")),
        v184,
        v185))
  {
    _SISetQueryBehavior();
    goto LABEL_82;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = objc_msgSend(v186, "isEqualToString:", CFSTR("reindexJob"));

  if (!v187)
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = objc_msgSend(v192, "isEqualToString:", CFSTR("job"));

    if (v193)
    {
      if ((unint64_t)v14 < 5)
        goto LABEL_430;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v424 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "componentsSeparatedByString:", CFSTR(","));
      v195 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v197 = objc_msgSend(v196, "integerValue");

      objc_msgSend(v13, "objectAtIndexedSubscript:", 4);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      v199 = objc_msgSend(v198, "integerValue");

      if (objc_msgSend(v424, "length"))
      {
        v519 = v424;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v519, 1);
        v200 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v200 = 0;
      }
      v223 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:jobOptions:", v197, v199);
      objc_msgSend(v223, "setProtectionClasses:", v195);
      if ((unint64_t)v14 >= 6 && v197 == 1)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 5);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v224, "componentsSeparatedByString:", CFSTR(","));
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v223, "setIdentifiersToReindex:", v225);

      }
      objc_msgSend(v223, "setReason:", CFSTR("client reindex request"));
      v226 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
      if (!objc_msgSend(v195, "count"))
      {
        objc_msgSend((id)objc_opt_class(), "allProtectionClasses");
        v227 = objc_claimAutoreleasedReturnValue();

        v195 = (void *)v227;
      }
      v228 = MEMORY[0x24BDAC760];
      v481[0] = MEMORY[0x24BDAC760];
      v481[1] = 3221225472;
      v481[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_3;
      v481[3] = &unk_24D0ECC48;
      v482 = v226;
      v229 = v226;
      -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:](v427, "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", v195, 0, v481);
      v230 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:]([SPCoreSpotlightIndexerTask alloc], "initWithIndexJob:indexers:", v223, v229);
      -[SPCoreSpotlightIndexerTask setBundleIDs:](v230, "setBundleIDs:", v200);
      -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v230, "setDataMigrationStage:", -[SPCoreSpotlightIndexer dataMigrationStage](v427, "dataMigrationStage"));
      v479[0] = v228;
      v479[1] = 3221225472;
      v479[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_4;
      v479[3] = &unk_24D0EA938;
      v480 = v11;
      -[SPCoreSpotlightIndexer performIndexerTask:completionHandler:](v427, "performIndexerTask:completionHandler:", v230, v479);

      goto LABEL_436;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = objc_msgSend(v201, "isEqualToString:", CFSTR("log"));

    if (v202)
    {
      if (v14 != (char *)3)
        goto LABEL_82;
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "lowercaseString");
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v145, "isEqualToString:", CFSTR("general")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("query")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("livequery")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("scheduler")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("store")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("fetch")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("path")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("sdb")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("docstore")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("ci")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("state")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("power")) & 1) != 0
        || (objc_msgSend(v145, "isEqualToString:", CFSTR("qos")) & 1) != 0
        || objc_msgSend(v145, "isEqualToString:", CFSTR("completions")))
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
        v266 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v266, "lowercaseString");
        v267 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v267, "isEqualToString:", CFSTR("debug")) & 1) != 0
          || (objc_msgSend(v267, "isEqualToString:", CFSTR("info")) & 1) != 0
          || (objc_msgSend(v267, "isEqualToString:", CFSTR("warning")) & 1) != 0
          || (objc_msgSend(v267, "isEqualToString:", CFSTR("error")) & 1) != 0
          || (objc_msgSend(v267, "isEqualToString:", CFSTR("fatal")) & 1) != 0
          || (objc_msgSend(v267, "isEqualToString:", CFSTR("none")) & 1) != 0
          || (objc_msgSend(v267, "isEqualToString:", CFSTR("ignore")) & 1) != 0
          || (objc_msgSend(v267, "isEqualToString:", CFSTR("normal")) & 1) != 0
          || objc_msgSend(v267, "isEqualToString:", CFSTR("temporary")))
        {
          SISetLogging();
        }

      }
LABEL_329:

      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    v205 = objc_msgSend(v204, "isEqualToString:", CFSTR("shutdown"));

    if (v205)
    {
      if (v11)
      {
        (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);

      }
      raise(15);
      goto LABEL_436;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = objc_msgSend(v216, "isEqualToString:", CFSTR("shrink"));

    if (v217)
    {
      if ((unint64_t)v14 < 2)
      {
        v222 = 2;
      }
      else
      {
        v218 = (void *)MEMORY[0x24BDD1518];
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v218, "decimalNumberWithString:", v219);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        v221 = objc_msgSend(v220, "longValue");

        if (v221 <= 0)
          v222 = 2;
        else
          v222 = v221;
      }
      objc_msgSend((id)objc_opt_class(), "shrink:", v222);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    v232 = objc_msgSend(v231, "isEqualToString:", CFSTR("migrate"));

    if (v232)
    {
      if ((unint64_t)v14 < 2)
      {
        v234 = 0;
      }
      else
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        v234 = objc_msgSend(v233, "isEqualToString:", CFSTR("forced"));

      }
      -[SPCoreSpotlightIndexer migrateForced:](v427, "migrateForced:", v234);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    v236 = objc_msgSend(v235, "isEqualToString:", CFSTR("reindexAllItems"));

    if (v236)
    {
      -[SPCoreSpotlightIndexer reindexAllItemsSource](v427, "reindexAllItemsSource");
      v237 = objc_claimAutoreleasedReturnValue();
      dispatch_source_merge_data(v237, 1uLL);

      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    v239 = objc_msgSend(v238, "isEqualToString:", CFSTR("reindexAllItemsWithIdentifiers"));

    if (v239)
    {
      -[SPCoreSpotlightIndexer reindexAllItemsWithIdentifiersSource](v427, "reindexAllItemsWithIdentifiersSource");
      v240 = objc_claimAutoreleasedReturnValue();
      dispatch_source_merge_data(v240, 1uLL);

      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = objc_msgSend(v241, "isEqualToString:", CFSTR("deleteAllInteractionsWithBundleID"));

    if (v242)
    {
      if ((unint64_t)v14 >= 2)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        v477[0] = MEMORY[0x24BDAC760];
        v477[1] = 3221225472;
        v477[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_5;
        v477[3] = &unk_24D0EB898;
        v478 = v11;
        -[SPCoreSpotlightIndexer deleteAllInteractionsWithBundleID:completionHandler:](v427, "deleteAllInteractionsWithBundleID:completionHandler:", v243, v477);

        goto LABEL_436;
      }
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    v245 = objc_msgSend(v244, "isEqualToString:", CFSTR("deleteActions"));

    if (v245)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      v247 = v246;
      if ((unint64_t)v14 >= 2)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v248 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v248, "doubleValue");
        v247 = v249;

      }
      v475[0] = MEMORY[0x24BDAC760];
      v475[1] = 3221225472;
      v475[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_6;
      v475[3] = &unk_24D0EB898;
      v476 = v11;
      -[SPCoreSpotlightIndexer deleteActionsBeforeTime:completionHandler:](v427, "deleteActionsBeforeTime:completionHandler:", v475, v247);

      goto LABEL_436;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v250 = (void *)objc_claimAutoreleasedReturnValue();
    v251 = objc_msgSend(v250, "isEqualToString:", CFSTR("deleteActionsWithIdentifiers"));

    if (v251)
    {
      if ((unint64_t)v14 >= 2)
      {
        objc_msgSend(v13, "subarrayWithRange:", 1, v14 - 1);
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        v473[0] = MEMORY[0x24BDAC760];
        v473[1] = 3221225472;
        v473[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_7;
        v473[3] = &unk_24D0EB898;
        v474 = v11;
        -[SPCoreSpotlightIndexer deleteActionsWithIdentifiers:completionHandler:](v427, "deleteActionsWithIdentifiers:completionHandler:", v252, v473);

        goto LABEL_436;
      }
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = objc_msgSend(v253, "isEqualToString:", CFSTR("enableJournal"));

    if (v254)
    {
      objc_msgSend(MEMORY[0x24BDC24C8], "setJournalEnabled:", 1);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    v256 = objc_msgSend(v255, "isEqualToString:", CFSTR("disableJournal"));

    if (v256)
    {
      objc_msgSend(MEMORY[0x24BDC24C8], "setJournalEnabled:", 0);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    v258 = objc_msgSend(v257, "isEqualToString:", CFSTR("topTerms"));

    if (v258)
    {
      if ((unint64_t)v14 >= 2)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
        v259 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPCoreSpotlightIndexer topKTerms:completionHandler:](v427, "topKTerms:completionHandler:", v259, v11);

        goto LABEL_436;
      }
      goto LABEL_430;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    v261 = objc_msgSend(v260, "isEqualToString:", CFSTR("updateRankingDates"));

    if (v261)
    {
      -[SPCoreSpotlightIndexer _enumerateIndexersWithBlock:](v427, "_enumerateIndexersWithBlock:", &__block_literal_global_1875);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    v263 = objc_msgSend(v262, "isEqualToString:", CFSTR("updateEmailLocalParts"));

    if (v263)
    {
      -[SPCoreSpotlightIndexer _enumerateIndexersWithBlock:](v427, "_enumerateIndexersWithBlock:", &__block_literal_global_1878);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    v265 = objc_msgSend(v264, "isEqualToString:", CFSTR("updateEmailContentURLAttr"));

    if (v265)
    {
      -[SPCoreSpotlightIndexer _enumerateIndexersWithBlock:](v427, "_enumerateIndexersWithBlock:", &__block_literal_global_1881);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    v269 = objc_msgSend(v268, "isEqualToString:", CFSTR("updateContainersAndScores"));

    if (v269)
    {
      -[SPCoreSpotlightIndexer _enumerateIndexersWithBlock:](v427, "_enumerateIndexersWithBlock:", &__block_literal_global_1884);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    v271 = objc_msgSend(v270, "isEqualToString:", CFSTR("updateGroups"));

    if (v271)
    {
      -[SPCoreSpotlightIndexer _enumerateIndexersWithBlock:](v427, "_enumerateIndexersWithBlock:", &__block_literal_global_1887);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    v273 = objc_msgSend(v272, "isEqualToString:", CFSTR("updateNotes"));

    if (v273)
    {
      -[SPCoreSpotlightIndexer _enumerateIndexersWithBlock:](v427, "_enumerateIndexersWithBlock:", &__block_literal_global_1890);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    v275 = objc_msgSend(v274, "isEqualToString:", CFSTR("clearReceiverCache"));

    if (v275)
    {
      +[SpotlightSender clearCache](SpotlightSender, "clearCache");
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    v277 = objc_msgSend(v276, "isEqualToString:", CFSTR("setNumberProperty"));

    if (v277)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      v280 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      objc_msgSend(v280, "setNumberStyle:", 1);
      objc_msgSend(v280, "numberFromString:", v279);
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      v470[0] = MEMORY[0x24BDAC760];
      v470[1] = 3221225472;
      v470[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_14;
      v470[3] = &unk_24D0ECD30;
      v471 = v281;
      v472 = v278;
      v282 = v278;
      v283 = v281;
      -[SPCoreSpotlightIndexer _enumerateIndexersWithBlock:](v427, "_enumerateIndexersWithBlock:", v470);

      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    v285 = objc_msgSend(v284, "isEqualToString:", CFSTR("setUISearchEnabled"));

    if (v285)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      v287 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      objc_msgSend(v287, "setNumberStyle:", 1);
      objc_msgSend(v287, "numberFromString:", v286);
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      v468[0] = MEMORY[0x24BDAC760];
      v468[1] = 3221225472;
      v468[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_15;
      v468[3] = &unk_24D0ECC48;
      v469 = v288;
      v289 = v288;
      -[SPCoreSpotlightIndexer _enumerateIndexersWithBlock:](v427, "_enumerateIndexersWithBlock:", v468);
      -[SPCoreSpotlightIndexer writeUISearchEnabled:](v427, "writeUISearchEnabled:", objc_msgSend(v289, "BOOLValue"));
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = v290 == 0;

      goto LABEL_431;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v291 = (void *)objc_claimAutoreleasedReturnValue();
    v292 = objc_msgSend(v291, "isEqualToString:", CFSTR("getProperty"));

    if (v292)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v516 = __Block_byref_object_copy_;
      v517 = __Block_byref_object_dispose_;
      v518 = &stru_24D0EF078;
      v465[0] = MEMORY[0x24BDAC760];
      v465[1] = 3221225472;
      v465[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_16;
      v465[3] = &unk_24D0ED4C8;
      v467 = buf;
      v294 = v293;
      v466 = v294;
      -[SPCoreSpotlightIndexer _enumerateIndexersWithBlock:](v427, "_enumerateIndexersWithBlock:", v465);
      if (v11)
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "dataUsingEncoding:", 4);
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD))v11 + 2))(v11, v295, 0);

      }
      _Block_object_dispose(buf, 8);

      goto LABEL_436;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    v297 = objc_msgSend(v296, "isEqualToString:", CFSTR("priorityIndexFixupOn"));

    if (v297)
    {
      -[SPCoreSpotlightIndexer priorityIndexer](v427, "priorityIndexer");
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v298, "issuePriorityIndexFixupOn");

      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    v300 = objc_msgSend(v299, "isEqualToString:", CFSTR("reindexMultiple"));

    if (v300)
    {
      objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v13, "count") - 1);
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      v463[0] = MEMORY[0x24BDAC760];
      v463[1] = 3221225472;
      v463[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_17;
      v463[3] = &unk_24D0EA938;
      v464 = v11;
      -[SPCoreSpotlightIndexer _reindexAllItemsForBundleIDs:reason:completionHandler:](v427, "_reindexAllItemsForBundleIDs:reason:completionHandler:", v301, CFSTR("issue-command"), v463);

      goto LABEL_436;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v302, "isEqualToString:", CFSTR("testBundleDelete")))
    {

LABEL_353:
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v420 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v420, "hasSuffix:", CFSTR("NoClear"));
      v425 = (void *)objc_opt_new();
      v411 = (void *)objc_opt_new();
      extractBundlesAndProtectionClasses(v13, v425, v411);
      if (objc_msgSend(v425, "count"))
      {
        if (!objc_msgSend(v411, "count"))
          objc_msgSend(v411, "addObject:", *MEMORY[0x24BDD0CE0]);
        groupa = dispatch_group_create();
        v409 = (void *)MEMORY[0x2199C2F34](v11);

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LODWORD(v516) = 0;
        v459 = 0u;
        v460 = 0u;
        v461 = 0u;
        v462 = 0u;
        obja = v411;
        v305 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v459, v514, 16);
        if (v305)
        {
          v306 = *(_QWORD *)v460;
          do
          {
            for (j = 0; j != v305; ++j)
            {
              if (*(_QWORD *)v460 != v306)
                objc_enumerationMutation(obja);
              v308 = *(_QWORD *)(*((_QWORD *)&v459 + 1) + 8 * j);
              -[SPCoreSpotlightIndexer concreteIndexers](v427, "concreteIndexers");
              v309 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v309, "objectForKeyedSubscript:", v308);
              v310 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v310, "index"))
              {
                logForCSLogCategoryIndex();
                v311 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v311, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v310, "dataclass");
                  v312 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v508 = 138412802;
                  v509 = v420;
                  v510 = 2112;
                  v511 = v312;
                  v512 = 2112;
                  v513 = v425;
                  _os_log_impl(&dword_213CF1000, v311, OS_LOG_TYPE_DEFAULT, "### %@ %@ %@", v508, 0x20u);

                }
                dispatch_group_enter(groupa);
                v452 = MEMORY[0x24BDAC760];
                v453 = 3221225472;
                v454 = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1914;
                v455 = &unk_24D0ED4F0;
                v456 = v420;
                v458 = buf;
                v457 = groupa;
                _SIDeleteBundles();

              }
            }
            v305 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v459, v514, 16);
          }
          while (v305);
        }

        v313 = sIndexQueue;
        v449[0] = MEMORY[0x24BDAC760];
        v449[1] = 3221225472;
        v449[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1915;
        v449[3] = &unk_24D0ED518;
        v451 = buf;
        v314 = v409;
        v450 = v314;
        _setup_block(v449, 0, 16340);
        v315 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_notify(groupa, v313, v315);

        _Block_object_dispose(buf, 8);
        v11 = 0;
      }

      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    v304 = objc_msgSend(v303, "isEqualToString:", CFSTR("testBundleDeleteNoClear"));

    if (v304)
      goto LABEL_353;
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v316, "isEqualToString:", CFSTR("testTransfer")))
    {

LABEL_372:
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v426 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v426, "hasSuffix:", CFSTR("NoClear"));
      v319 = (void *)objc_opt_new();
      v320 = (void *)objc_opt_new();
      extractBundlesAndProtectionClasses(v13, v319, v320);
      v321 = objc_msgSend(v320, "count");
      if (!objc_msgSend(v320, "count"))
      {
        objc_msgSend(v320, "addObject:", *MEMORY[0x24BDD0CE0]);
        objc_msgSend(v320, "addObject:", CFSTR("Priority"));
        v321 = objc_msgSend(v320, "count");
      }
      if (v321 - 1 <= 1)
      {
        -[SPCoreSpotlightIndexer concreteIndexers](v427, "concreteIndexers");
        v322 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v320, "firstObject");
        v323 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v322, "objectForKey:", v323);
        v324 = (void *)objc_claimAutoreleasedReturnValue();
        v421 = objc_msgSend(v324, "index");

        if (v421)
        {
          if (v321 >= 2)
          {
            -[SPCoreSpotlightIndexer concreteIndexers](v427, "concreteIndexers");
            v325 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v320, "objectAtIndexedSubscript:", 1);
            v326 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v325, "objectForKey:", v326);
            v327 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v327, "index");

          }
          if (!objc_msgSend(v319, "count"))
          {
            objc_msgSend((id)sPriorityBundleIds, "allObjects");
            v336 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v319, "addObjectsFromArray:", v336);

          }
          logForCSLogCategoryIndex();
          v337 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v337, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v426;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v320;
            *(_WORD *)&buf[22] = 2112;
            v516 = (uint64_t (*)(uint64_t, uint64_t))v319;
            _os_log_impl(&dword_213CF1000, v337, OS_LOG_TYPE_DEFAULT, "### %@ %@ %@", buf, 0x20u);
          }

          v443 = MEMORY[0x24BDAC760];
          v444 = 3221225472;
          v445 = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1920;
          v446 = &unk_24D0ED540;
          v447 = v426;
          v448 = v11;
          _SITransferBundles();

          v11 = 0;
        }
      }

      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    v318 = objc_msgSend(v317, "isEqualToString:", CFSTR("testTransferNoClear"));

    if (v318)
      goto LABEL_372;
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    v329 = objc_msgSend(v328, "isEqualToString:", CFSTR("priorityReset"));

    if (v329)
    {
      -[SPCoreSpotlightIndexer priorityIndexer](v427, "priorityIndexer");
      v330 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPCoreSpotlightIndexer defaultIndexer](v427, "defaultIndexer");
      v331 = (void *)objc_claimAutoreleasedReturnValue();
      v332 = objc_msgSend(v330, "index");
      v333 = objc_msgSend(v331, "index");
      if (v332 && v333)
      {
        logForCSLogCategoryIndex();
        v334 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v334, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213CF1000, v334, OS_LOG_TYPE_DEFAULT, "### priorityReset", buf, 2u);
        }

        objc_msgSend((id)sPriorityBundleIds, "allObjects");
        v335 = (void *)objc_claimAutoreleasedReturnValue();
        v438[5] = MEMORY[0x24BDAC760];
        v438[6] = 3221225472;
        v438[7] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1923;
        v438[8] = &unk_24D0ED590;
        v442 = v11;
        v439 = v331;
        v440 = v427;
        v441 = v330;
        _SITransferBundles();

        v11 = 0;
      }

      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    v339 = objc_msgSend(v338, "isEqualToString:", CFSTR("suspend"));

    if (v339)
    {
      indexQueue = v427->_indexQueue;
      v438[0] = MEMORY[0x24BDAC760];
      v438[1] = 3221225472;
      v438[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1927;
      v438[3] = &unk_24D0EA758;
      v438[4] = v427;
      v341 = v438;
LABEL_395:
      dispatch_sync(indexQueue, v341);
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    v343 = objc_msgSend(v342, "isEqualToString:", CFSTR("resume"));

    if (v343)
    {
      indexQueue = v427->_indexQueue;
      v437[0] = MEMORY[0x24BDAC760];
      v437[1] = 3221225472;
      v437[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1930;
      v437[3] = &unk_24D0EA758;
      v437[4] = v427;
      v341 = v437;
      goto LABEL_395;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v344 = (void *)objc_claimAutoreleasedReturnValue();
    v345 = objc_msgSend(v344, "isEqualToString:", CFSTR("setLowDisk"));

    if (v345)
    {
      LOBYTE(v20) = 1;
      if ((sVeryLowDiskSpace & 1) == 0)
      {
        sVeryLowDiskSpace = 1;
        -[SPCoreSpotlightIndexer recycleAndPurgeIndex](v427, "recycleAndPurgeIndex");
      }
      goto LABEL_431;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v346 = (void *)objc_claimAutoreleasedReturnValue();
    v347 = objc_msgSend(v346, "isEqualToString:", CFSTR("setNormalDisk"));

    if (v347)
    {
      if (sVeryLowDiskSpace == 1)
      {
        sVeryLowDiskSpace = 0;
        -[SPCoreSpotlightIndexer restoreIndexAndClearPurgeable](v427, "restoreIndexAndClearPurgeable");
      }
      goto LABEL_82;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    v349 = objc_msgSend(v348, "isEqualToString:", CFSTR("isLowDisk"));

    if (v349)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v516 = __Block_byref_object_copy_;
      v517 = __Block_byref_object_dispose_;
      v518 = 0;
      if (sVeryLowDiskSpace)
        v350 = CFSTR("YES\n");
      else
        v350 = CFSTR("NO\n");
      objc_msgSend(CFSTR("sVeryLowDiskSpace = "), "stringByAppendingString:", v350);
      v518 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v436[0] = MEMORY[0x24BDAC760];
      v436[1] = 3221225472;
      v436[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1943;
      v436[3] = &unk_24D0ED1B8;
      v436[4] = buf;
      -[SPCoreSpotlightIndexer _enumerateIndexersWithBlock:](v427, "_enumerateIndexersWithBlock:", v436);
      if (v11)
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "dataUsingEncoding:", 4);
        v351 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD))v11 + 2))(v11, v351, 0);

      }
      _Block_object_dispose(buf, 8);

      goto LABEL_436;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    v353 = objc_msgSend(v352, "isEqualToString:", CFSTR("validateIndexers"));

    if (v353)
    {
      if ((unint64_t)v14 < 2)
      {
        v360 = 0;
LABEL_463:
        -[SPCoreSpotlightIndexer validateIndexers:outFileDescriptor:](v427, "validateIndexers:outFileDescriptor:", v360, v8);
        (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);

        goto LABEL_436;
      }
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v354 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v354, "isEqualToString:", CFSTR("P")))
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("Priority"));
        v355 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v354, "isEqualToString:", CFSTR("A")))
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BDD0CD0]);
        v355 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v354, "isEqualToString:", CFSTR("B")))
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BDD0CD8]);
        v355 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v354, "isEqualToString:", CFSTR("C")))
      {
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BDD0CE0]);
        v355 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v354, "isEqualToString:", CFSTR("X")))
        {
          v360 = 0;
          goto LABEL_462;
        }
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BDD0CE8]);
        v355 = objc_claimAutoreleasedReturnValue();
      }
      v360 = (void *)v355;
LABEL_462:

      goto LABEL_463;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v356 = (void *)objc_claimAutoreleasedReturnValue();
    v357 = objc_msgSend(v356, "isEqualToString:", CFSTR("validateVectors"));

    if (!v357)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      v362 = objc_msgSend(v361, "isEqualToString:", CFSTR("prepareIndexingWhileLocked"));

      if (v362)
      {
        if ((unint64_t)v14 >= 4)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v363 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v364 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
          v365 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v365, "doubleValue");
          v367 = v366;

          v434[0] = MEMORY[0x24BDAC760];
          v434[1] = 3221225472;
          v434[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_1956;
          v434[3] = &unk_24D0EB898;
          v435 = v11;
          -[SPCoreSpotlightIndexer prepareIndexingWhileLocked:protectionClass:holdAssertionFor:completionHandler:](v427, "prepareIndexingWhileLocked:protectionClass:holdAssertionFor:completionHandler:", v363, v364, v434, v367);

          goto LABEL_436;
        }
        goto LABEL_430;
      }
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v369 = (void *)objc_claimAutoreleasedReturnValue();
      v370 = objc_msgSend(v369, "isEqualToString:", CFSTR("finishIndexingWhileLocked"));

      if (v370)
      {
        if ((unint64_t)v14 >= 3)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v380 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v381 = (void *)objc_claimAutoreleasedReturnValue();
          v432[0] = MEMORY[0x24BDAC760];
          v432[1] = 3221225472;
          v432[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_3_1959;
          v432[3] = &unk_24D0EB898;
          v433 = v11;
          -[SPCoreSpotlightIndexer finishIndexingWhileLocked:protectionClass:completionHandler:](v427, "finishIndexingWhileLocked:protectionClass:completionHandler:", v380, v381, v432);

          goto LABEL_436;
        }
        goto LABEL_430;
      }
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v372 = (void *)objc_claimAutoreleasedReturnValue();
      v373 = objc_msgSend(v372, "isEqualToString:", CFSTR("assets"));

      if (v373)
      {
        objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
        v374 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v374, "allLoadedAssets");
        v375 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)v14 < 2)
        {
          v378 = 0;
          v379 = 0;
        }
        else
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v376 = (void *)objc_claimAutoreleasedReturnValue();
          v377 = objc_msgSend(v376, "unsignedIntValue");

          v378 = v377 & 1;
          v379 = (v377 >> 1) & 1;
        }
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@\n"), v375);
        v389 = (void *)objc_claimAutoreleasedReturnValue();
        if (v378)
        {
          objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
          v390 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v390, "assetConfigDump");
          v391 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v389, "appendFormat:", CFSTR("\n%@"), v391);

        }
        if (v379)
        {
          objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
          v392 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v392, "trialConfigDump");
          v393 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v389, "appendFormat:", CFSTR("\n%@"), v393);

        }
        objc_msgSend(v389, "dataUsingEncoding:", 4);
        v394 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD))v11 + 2))(v11, v394, 0);

      }
      else
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v382 = (void *)objc_claimAutoreleasedReturnValue();
        v383 = objc_msgSend(v382, "isEqualToString:", CFSTR("indexAnalyticsDump"));

        if (v383)
        {
          v384 = (void *)MEMORY[0x24BDD17C8];
          -[SPCoreSpotlightIndexer dumpIndexAges](v427, "dumpIndexAges");
          v385 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPCoreSpotlightIndexer dumpIndexAnalytics](v427, "dumpIndexAnalytics");
          v386 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v384, "stringWithFormat:", CFSTR("%@\n%@"), v385, v386);
          v387 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v387, "dataUsingEncoding:", 4);
          v388 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *, _QWORD))v11 + 2))(v11, v388, 0);

          goto LABEL_436;
        }
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v395 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v395, "isEqualToString:", CFSTR("appContainers"));

        if (!v20)
          goto LABEL_431;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v516 = __Block_byref_object_copy_;
        v517 = __Block_byref_object_dispose_;
        v518 = 0;
        if ((unint64_t)v14 >= 2)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v396 = (void *)objc_claimAutoreleasedReturnValue();
          v397 = objc_msgSend(v396, "isEqualToString:", CFSTR("refresh"));

          if (v397)
          {
            objc_msgSend(MEMORY[0x24BDC23E8], "sharedInstance");
            v398 = (void *)objc_claimAutoreleasedReturnValue();
            v431[0] = MEMORY[0x24BDAC760];
            v431[1] = 3221225472;
            v431[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_4_1974;
            v431[3] = &unk_24D0ED5B8;
            v431[4] = buf;
            objc_msgSend(v398, "refreshCacheWithCompletionHandler:", v431);

          }
        }
        if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          objc_msgSend(MEMORY[0x24BDC23E8], "sharedInstance");
          v399 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v399, "dumpAppContainerCache");
          v400 = objc_claimAutoreleasedReturnValue();
          v401 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v400;

        }
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("{\n"));
        v402 = (void *)objc_claimAutoreleasedReturnValue();
        v403 = *(void **)(*(_QWORD *)&buf[8] + 40);
        v429[0] = MEMORY[0x24BDAC760];
        v429[1] = 3221225472;
        v429[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_5_1975;
        v429[3] = &unk_24D0ED5E0;
        v404 = v402;
        v430 = v404;
        objc_msgSend(v403, "enumerateKeysAndObjectsUsingBlock:", v429);
        objc_msgSend(v404, "appendFormat:", CFSTR("}\n"));
        objc_msgSend(v404, "dataUsingEncoding:", 4);
        v405 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD))v11 + 2))(v11, v405, 0);

        _Block_object_dispose(buf, 8);
      }
      goto LABEL_436;
    }
    if ((unint64_t)v14 < 2)
    {
      v368 = 0;
LABEL_473:
      -[SPCoreSpotlightIndexer validateVectors:outFileDescriptor:](v427, "validateVectors:outFileDescriptor:", v368, v8);
      (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);

      goto LABEL_436;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v358 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v358, "isEqualToString:", CFSTR("P")))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("Priority"));
      v359 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v358, "isEqualToString:", CFSTR("A")))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BDD0CD0]);
      v359 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v358, "isEqualToString:", CFSTR("B")))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BDD0CD8]);
      v359 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v358, "isEqualToString:", CFSTR("C")))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BDD0CE0]);
      v359 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v358, "isEqualToString:", CFSTR("X")))
      {
        v368 = 0;
        goto LABEL_472;
      }
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BDD0CE8]);
      v359 = objc_claimAutoreleasedReturnValue();
    }
    v368 = (void *)v359;
LABEL_472:

    goto LABEL_473;
  }
  if ((unint64_t)v14 < 5)
    goto LABEL_430;
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "componentsSeparatedByString:", CFSTR(";=;"));
  v189 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectAtIndexedSubscript:", 3);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = objc_msgSend(v190, "integerValue");

  if (objc_msgSend(v423, "length"))
  {
    v520 = v423;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v520, 1);
    v419 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v419 = 0;
  }
  v206 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:jobOptions:", 1, v191);
  objc_msgSend(v206, "setProtectionClasses:", v189);
  objc_msgSend(v13, "subarrayWithRange:", 4, objc_msgSend(v13, "count") - 4);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "componentsJoinedByString:", &stru_24D0EF078);
  v208 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v208, "componentsSeparatedByString:", CFSTR(";=;"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v206, "setIdentifiersToReindex:", v209);

  logForCSLogCategoryIndex();
  v210 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v210, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v423;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v208;
    _os_log_impl(&dword_213CF1000, v210, OS_LOG_TYPE_INFO, "reindexJob %@: %@", buf, 0x16u);
  }

  v211 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
  if (!objc_msgSend(v189, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "allProtectionClasses");
    v212 = objc_claimAutoreleasedReturnValue();

    v189 = (void *)v212;
  }
  v213 = MEMORY[0x24BDAC760];
  v485[0] = MEMORY[0x24BDAC760];
  v485[1] = 3221225472;
  v485[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1795;
  v485[3] = &unk_24D0ECC48;
  v486 = v211;
  v214 = v211;
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:](v427, "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", v189, 0, v485);
  v215 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:]([SPCoreSpotlightIndexerTask alloc], "initWithIndexJob:indexers:", v206, v214);
  -[SPCoreSpotlightIndexerTask setBundleIDs:](v215, "setBundleIDs:", v419);
  -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v215, "setDataMigrationStage:", -[SPCoreSpotlightIndexer dataMigrationStage](v427, "dataMigrationStage"));
  v483[0] = v213;
  v483[1] = 3221225472;
  v483[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_1796;
  v483[3] = &unk_24D0EA938;
  v484 = v11;
  -[SPCoreSpotlightIndexer performIndexerTask:completionHandler:](v427, "performIndexerTask:completionHandler:", v215, v483);

LABEL_436:
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke()
{
  NSObject *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  _BYTE v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_213CF1000, v0, OS_LOG_TYPE_INFO, "#index reset", v6, 2u);
  }

  objc_msgSend((id)sDelegate, "indexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v6 = 138412290;
    *(_QWORD *)&v6[4] = v1;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "Spotlight index reset %@", v6, 0xCu);
  }

  v6[0] = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", *(_QWORD *)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v1, v6);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtPath:error:", v1, 0);

  }
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1718(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC24E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v3);

  objc_msgSend(MEMORY[0x24BDC24E0], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v5);

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v24 = v3;
        v4 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v3);
        objc_msgSend(v2, "appendString:", CFSTR("\n"));
        objc_msgSend(v4, "knownClients");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "allObjects");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
          v9 = (const __CFString *)v7;
        else
          v9 = &stru_24D0EF078;
        objc_msgSend(v2, "appendString:", v9);

        objc_msgSend(v4, "checkedInClients");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(v10, "objectForKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "dataclass");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "appendFormat:", CFSTR("\n%@ (%@) - %@"), v15, v17, v16);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v12);
        }

        v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  v18 = *(_QWORD *)(v20 + 40);
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v18 + 16))(v18, v19, 0);

}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1723(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_1724;
  v2[3] = &unk_24D0EA938;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "commitUpdatesWithCompletionHandler:", v2);

}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_1724(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1737(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1758(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  wait_for_apfs_kb_state((const char *)sIndexMountPath, 1);
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "### testSuspendUntilUnlocked complete", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1761(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  wait_for_apfs_kb_state((const char *)sIndexMountPath, 0);
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "### testSuspendUntilLocked complete", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1764(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1780(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);

  }
  logForCSLogCategoryIndex();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = a1[4];
    v11 = a1[5];
    if (v6)
      v12 = v6;
    else
      v12 = v8;
    v14 = 138412802;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_213CF1000, v9, OS_LOG_TYPE_INFO, "Client state %@ %@: %@", (uint8_t *)&v14, 0x20u);
  }

  v13 = a1[6];
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v7, v6);

}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1786(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1795(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_1796(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateRankingDates:", 1);
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateEmailLocalParts:", 1);
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateEmailContentURLAttr:", 1);
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateContainersAndScores:", 1);
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateGroups:", 1);
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateNotes:", 1);
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setProperty:forKey:sync:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setProperty:forKey:sync:", *(_QWORD *)(a1 + 32), CFSTR("kSPUISearchEnabled"), 1);
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = a2;
  objc_msgSend(v4, "dataclass");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getPropertyForKey:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\n%@ - %@"), v9, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1914(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "### %@ complete res: %d", (uint8_t *)&v6, 0x12u);
  }

  if (a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1915(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if ((_DWORD)v2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v3;
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
    v3 = v5;
  }

}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1920(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  logForCSLogCategoryIndex();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "### %@ complete res: %d", (uint8_t *)&v7, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1923(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = a2;
    _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_DEFAULT, "### priorityReset - transferred priority items to default index res: %d", buf, 8u);
  }

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], a2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setProperty:forKey:sync:", &unk_24D0FD1E0, CFSTR("kSPPriorityIndexVersion"), 0);
    v6 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1924;
    v9[3] = &unk_24D0ED568;
    v12 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = v7;
    v11 = v8;
    objc_msgSend(v6, "commitUpdatesWithCompletionHandler:", v9);

    v5 = v12;
  }

}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1924(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "closeIndex");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "priorityIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", v3, 0);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "priorityIndexAvailableTouchFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v5, 0);

  logForCSLogCategoryIndex();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "### priorityReset complete, exiting", v7, 2u);
  }

  exit(0);
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1927(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "locking", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "locking");
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1930(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "unlocking", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_1943(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  objc_msgSend(v4, "dataclass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4[97];

  v7 = CFSTR("YES");
  if (!v6)
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: readOnly = %@\n"), v5, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingString:", v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_2_1956(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_3_1959(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_4_1974(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDC23E8], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dumpAppContainerCache");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_5_1975(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "appendFormat:", CFSTR("\t%@ : {\n"), a2);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_6_1978;
  v7[3] = &unk_24D0ED5E0;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t}\n"));
}

void __90__SPCoreSpotlightIndexer__issueCommand_outFileDescriptor_searchContext_completionHandler___block_invoke_6_1978(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "appendFormat:", CFSTR("\t\t%@ : 0x%016llx\n"), v5, objc_msgSend(a3, "longLongValue"));

}

- (void)topKTerms:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v21[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke;
  v12[3] = &unk_24D0ED608;
  v9 = v6;
  v13 = v9;
  v14 = &v15;
  -[SPCoreSpotlightIndexer _enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:](self, "_enumerateIndexersWithProtectionClasses:inferPriorityIndex:block:", v8, 0, v12);

  v10 = (void *)v16[5];
  if (v10)
  {
    objc_msgSend(v10, "index");
    v11 = v7;
    SIFetchTopKTerms();

  }
  _Block_object_dispose(&v15, 8);

}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "dataclass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v11 = (id)objc_opt_new();
  if (a2)
  {
    _MDPlistGetRootPlistObjectFromPlist();
    if (_MDPlistGetPlistObjectType() == 241)
      _MDPlistDictionaryIterate();
  }
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend((id)v7[5], "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

  _Block_object_dispose(&v6, 8);
}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  if (!a3)
    __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_3_cold_1();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_MDPlistGetPlistObjectType() == 241)
  {
    v4 = v3;
    _MDPlistDictionaryIterate();

  }
}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  __CFString *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _BYTE buf[24];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_4_cold_1();
  v6 = (id)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0x8000100u);
  *(_OWORD *)buf = *(_OWORD *)a4;
  *(_QWORD *)&buf[16] = *(_QWORD *)(a4 + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)_MDPlistNumberGetIntValue());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v11 = v7;
    _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_INFO, "bundleIndex: %@, key: %@, value: %@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendFormat:", CFSTR("\n%@ %@ %@"), v6, v7, *(_QWORD *)(a1 + 32));
  CFRelease(v6);

}

- (void)performIndexerTask:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  SPCoreSpotlightIndexer *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  SPCoreSpotlightIndexer *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "job");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "jobType");

    if ((unint64_t)(v10 - 2) >= 2)
    {
      if (v10 != 1)
      {
LABEL_26:
        -[SPCoreSpotlightIndexer firstUnlockQueue](self, "firstUnlockQueue");
        v27 = objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke;
        v31[3] = &unk_24D0EB758;
        v32 = v6;
        v33 = self;
        v34 = v8;
        _setup_block(v31, 0, 16667);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_async(v27, v28);

        goto LABEL_27;
      }
      v41 = 0u;
      v42 = 0u;
      v40 = 0u;
      v39 = 0u;
      objc_msgSend(v6, "bundleIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v18)
      {
        v19 = v18;
        v29 = self;
        v30 = v8;
        v20 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v40 != v20)
              objc_enumerationMutation(v11);
            v22 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
            if (isAppleInternalInstall())
            {
              objc_msgSend(v6, "job");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "identifiersToReindex");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "count");

            }
            else
            {
              v25 = 1;
            }
            objc_msgSend(MEMORY[0x24BDC2430], "sharedInstance");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "logWithBundleID:indexOperation:itemCount:code:", v22, 8, v25, 7);

          }
          v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v19);
        self = v29;
        v8 = v30;
      }
    }
    else
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend(v6, "bundleIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x24BDC2430], "sharedInstance");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "logWithBundleID:indexOperation:itemCount:code:", v16, 9, 1, 6);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        }
        while (v13);
      }
    }

    goto LABEL_26;
  }
  if (v7)
    (*((void (**)(id))v7 + 2))(v7);
LABEL_27:

}

void __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id obj;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v3 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "completedBundleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "completedBundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v6);

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "indexers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        dispatch_group_enter(v3);
        v12 = *(_QWORD *)(a1 + 32);
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_2;
        v23[3] = &unk_24D0EB6E0;
        v24 = v2;
        v25 = v3;
        objc_msgSend(v11, "performIndexerTask:withIndexDelegatesAndCompletionHandler:", v12, v23);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 40), "firstUnlockQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_3;
  v18[3] = &unk_24D0EB708;
  v19 = *(id *)(a1 + 32);
  v20 = v2;
  v14 = *(void **)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 40);
  v22 = v14;
  v15 = v2;
  _setup_block(v18, 0, 16666);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v3, v13, v16);

}

void __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v4);
    objc_sync_exit(v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __63__SPCoreSpotlightIndexer_performIndexerTask_completionHandler___block_invoke_3(uint64_t a1)
{
  SPCoreSpotlightIndexerTask *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SPCoreSpotlightIndexerTask *v7;

  v2 = [SPCoreSpotlightIndexerTask alloc];
  objc_msgSend(*(id *)(a1 + 32), "job");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "indexers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPCoreSpotlightIndexerTask initWithIndexJob:indexers:](v2, "initWithIndexJob:indexers:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "bundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightIndexerTask setBundleIDs:](v7, "setBundleIDs:", v5);

  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightIndexerTask setCompletedBundleIDs:](v7, "setCompletedBundleIDs:", v6);

  -[SPCoreSpotlightIndexerTask setDataMigrationStage:](v7, "setDataMigrationStage:", objc_msgSend(*(id *)(a1 + 32), "dataMigrationStage"));
  -[SPCoreSpotlightIndexerTask setShouldResumeOnFailure:](v7, "setShouldResumeOnFailure:", objc_msgSend(*(id *)(a1 + 32), "shouldResumeOnFailure"));
  objc_msgSend(*(id *)(a1 + 48), "performIndexerTask:withIndexExtensionsAndCompletionHandler:", v7, *(_QWORD *)(a1 + 56));

}

- (void)addCompletedBundleIDs:(id)a3 forIndexerTask:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v6, "indexers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "addCompletedBundleIDs:forIndexerTask:", v5, v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)performIndexerTask:(id)a3 withIndexExtensionsAndCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  unint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  SPCoreSpotlightIndexer *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  NSObject *v65;
  _BOOL4 v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  NSObject *v75;
  uint64_t v76;
  id v77;
  id v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  qos_class_t v85;
  NSObject *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void (**v93)(_QWORD);
  void (**v94)(_QWORD);
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void (**v102)(_QWORD);
  uint64_t v103;
  void *v104;
  SPCoreSpotlightIndexer *v105;
  _QWORD block[4];
  void (**v107)(_QWORD);
  _QWORD v108[4];
  NSObject *v109;
  _QWORD v110[5];
  id v111;
  _QWORD v112[4];
  id v113;
  NSObject *v114;
  _QWORD v115[4];
  id v116;
  SPCoreSpotlightIndexer *v117;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _QWORD v123[4];
  id v124;
  void (**v125)(_QWORD);
  _QWORD v126[4];
  id v127;
  SPCoreSpotlightIndexer *v128;
  id v129;
  _QWORD v130[4];
  NSObject *v131;
  id v132;
  SPCoreSpotlightIndexer *v133;
  id v134;
  void (**v135)(_QWORD);
  _QWORD v136[4];
  id v137;
  id v138;
  id v139;
  _BYTE v140[128];
  void *v141;
  void *v142;
  uint8_t buf[4];
  id v144;
  __int16 v145;
  void *v146;
  __int16 v147;
  uint64_t v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  void *v152;
  uint64_t v153;

  v153 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[SPCoreSpotlightIndexer firstUnlockQueue](self, "firstUnlockQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SPCoreSpotlightIndexer extensionDelegate](self, "extensionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v105 = self;
    objc_msgSend(v6, "job");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "completedBundleIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryIndex();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(v6, "dataMigrationStage");
      v15 = -[SPCoreSpotlightIndexer dataMigrationStage](v105, "dataMigrationStage");
      -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v105, "dataMigrationBundleIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v144 = v11;
      v145 = 2112;
      v146 = v12;
      v147 = 2048;
      v148 = v14;
      v149 = 2048;
      v150 = v15;
      v151 = 2112;
      v152 = v16;
      _os_log_impl(&dword_213CF1000, v13, OS_LOG_TYPE_INFO, "bundleIDs:%@, completedBundleIDs:%@, dataMigrationStage:%ld/%ld, dataMigrationBundleIDs:%@", buf, 0x34u);

    }
    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "containsObject:", v17))
      {
LABEL_60:
        if (v7)
          v7[2](v7);
        goto LABEL_71;
      }
      v18 = objc_msgSend(v6, "dataMigrationStage");
      if (v18 < -[SPCoreSpotlightIndexer dataMigrationStage](v105, "dataMigrationStage"))
      {
        -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v105, "dataMigrationBundleIDs");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19
          || (v20 = (void *)v19,
              -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v105, "dataMigrationBundleIDs"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = objc_msgSend(v21, "containsObject:", v17),
              v21,
              v20,
              v22))
        {
          logForCSLogCategoryIndex();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            v103 = objc_msgSend(v6, "dataMigrationStage");
            v87 = -[SPCoreSpotlightIndexer dataMigrationStage](v105, "dataMigrationStage");
            -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v105, "dataMigrationBundleIDs");
            v88 = v17;
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v144 = v10;
            v145 = 2112;
            v146 = v88;
            v147 = 2048;
            v148 = v103;
            v149 = 2048;
            v150 = v87;
            v151 = 2112;
            v152 = v89;
            _os_log_debug_impl(&dword_213CF1000, v23, OS_LOG_TYPE_DEBUG, "Dropping job:%@ for indexing extension with bundleID:%@ since it ran during data migration, dataMigrationStange:%lu/%lu, dataMigrationBundleIDs:%@", buf, 0x34u);

            v17 = v88;
          }

          v142 = v17;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v142, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPCoreSpotlightIndexer addCompletedBundleIDs:forIndexerTask:](v105, "addCompletedBundleIDs:forIndexerTask:", v24, v6);

          goto LABEL_60;
        }
      }
      v99 = v12;
      +[SpotlightDaemonServer sharedDaemonServer](SpotlightDaemonServer, "sharedDaemonServer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v17;
      v61 = *MEMORY[0x24BDD0CE0];
      v136[0] = MEMORY[0x24BDAC760];
      v136[1] = 3221225472;
      v136[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke;
      v136[3] = &unk_24D0ED400;
      v62 = v10;
      v137 = v62;
      v63 = v60;
      v138 = v63;
      v102 = v7;
      v139 = v102;
      v64 = v63;
      LODWORD(v61) = objc_msgSend(v59, "handleJob:bundleID:protectionClass:completionHandler:", v62, v63, v61, v136);

      logForCSLogCategoryIndex();
      v65 = objc_claimAutoreleasedReturnValue();
      v66 = os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG);
      if ((_DWORD)v61)
      {
        if (!v66)
        {
          v12 = v99;
          v17 = v64;
LABEL_52:

LABEL_71:
          goto LABEL_72;
        }
        v17 = v63;
        -[SPCoreSpotlightIndexer performIndexerTask:withIndexExtensionsAndCompletionHandler:].cold.1();
      }
      else
      {
        v17 = v63;
        if (v66)
          -[SPCoreSpotlightIndexer performIndexerTask:withIndexExtensionsAndCompletionHandler:].cold.2();

        v130[0] = MEMORY[0x24BDAC760];
        v130[1] = 3221225472;
        v130[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1989;
        v130[3] = &unk_24D0ED0D0;
        v131 = v62;
        v132 = v63;
        v133 = v105;
        v134 = v6;
        v135 = v102;
        objc_msgSend(v9, "indexRequestsPerformJob:forBundle:completionHandler:", v131, v132, v130);

        v65 = v131;
      }
      v12 = v99;
      goto LABEL_52;
    }
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v6, "bundleIDs");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v25, "mutableCopy");

      objc_msgSend(v17, "removeObjectsInArray:", v12);
      if (objc_msgSend(v17, "count"))
      {
        v95 = v11;
        v97 = v12;
        v93 = v7;
        v26 = objc_msgSend(v6, "dataMigrationStage");
        if (v26 < -[SPCoreSpotlightIndexer dataMigrationStage](v105, "dataMigrationStage"))
        {
          v27 = objc_msgSend(v17, "count");
          if (v27)
          {
            v28 = v27;
            v90 = v9;
            v29 = 0;
            v30 = 0;
            do
            {
              v31 = v17;
              objc_msgSend(v17, "objectAtIndexedSubscript:", v29);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v105, "dataMigrationBundleIDs");
              v33 = objc_claimAutoreleasedReturnValue();
              if (!v33
                || (v34 = (void *)v33,
                    -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v105, "dataMigrationBundleIDs"),
                    v35 = (void *)objc_claimAutoreleasedReturnValue(),
                    v36 = objc_msgSend(v35, "containsObject:", v32),
                    v35,
                    v34,
                    v36))
              {
                logForCSLogCategoryIndex();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  v100 = objc_msgSend(v6, "dataMigrationStage");
                  v39 = -[SPCoreSpotlightIndexer dataMigrationStage](v105, "dataMigrationStage");
                  -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v105, "dataMigrationBundleIDs");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413314;
                  v144 = v10;
                  v145 = 2112;
                  v146 = v32;
                  v147 = 2048;
                  v148 = v100;
                  v149 = 2048;
                  v150 = v39;
                  v151 = 2112;
                  v152 = v40;
                  _os_log_debug_impl(&dword_213CF1000, v37, OS_LOG_TYPE_DEBUG, "Dropping job:%@ for indexing extension with bundleID:%@ since it ran during data migration, dataMigrationStange:%lu/%lu, dataMigrationBundleIDs:%@", buf, 0x34u);

                }
                v141 = v32;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v141, 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[SPCoreSpotlightIndexer addCompletedBundleIDs:forIndexerTask:](v105, "addCompletedBundleIDs:forIndexerTask:", v38, v6);

                if (!v30)
                  v30 = (void *)objc_opt_new();
                objc_msgSend(v30, "addIndex:", v29);
              }
              v17 = v31;

              ++v29;
            }
            while (v28 != v29);
            v9 = v90;
            if (v30)
            {
              objc_msgSend(v31, "removeObjectsAtIndexes:", v30);

            }
          }
        }
        if (objc_msgSend(v17, "count"))
        {
          logForCSLogCategoryIndex();
          v67 = objc_claimAutoreleasedReturnValue();
          v7 = v93;
          v11 = v95;
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            -[SPCoreSpotlightIndexer performIndexerTask:withIndexExtensionsAndCompletionHandler:].cold.4();

          v68 = MEMORY[0x24BDAC760];
          v126[0] = MEMORY[0x24BDAC760];
          v126[1] = 3221225472;
          v126[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1991;
          v126[3] = &unk_24D0ED680;
          v127 = v10;
          v128 = v105;
          v129 = v6;
          v123[0] = v68;
          v123[1] = 3221225472;
          v123[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1993;
          v123[3] = &unk_24D0EB780;
          v124 = v127;
          v125 = v93;
          objc_msgSend(v9, "indexRequestsPerformJob:forBundles:perExtensionCompletionHandler:completionHandler:", v124, v17, v126, v123);

          v12 = v97;
          goto LABEL_71;
        }
        v7 = v93;
        v11 = v95;
        v12 = v97;
      }
      goto LABEL_60;
    }
    v41 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    if (objc_msgSend(v12, "count"))
      objc_msgSend(v41, "addObjectsFromArray:", v12);
    v96 = v11;
    v98 = v12;
    v42 = objc_msgSend(v6, "dataMigrationStage");
    v104 = v10;
    v92 = v41;
    if (v42 >= -[SPCoreSpotlightIndexer dataMigrationStage](v105, "dataMigrationStage"))
    {
LABEL_66:
      v72 = v9;
      objc_msgSend(v41, "allObjects");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setExcludedBundleIDs:", v73);

      v74 = dispatch_group_create();
      dispatch_group_enter(v74);
      dispatch_group_enter(v74);
      logForCSLogCategoryIndex();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
        -[SPCoreSpotlightIndexer performIndexerTask:withIndexExtensionsAndCompletionHandler:].cold.3();

      v76 = MEMORY[0x24BDAC760];
      v115[0] = MEMORY[0x24BDAC760];
      v115[1] = 3221225472;
      v115[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1994;
      v115[3] = &unk_24D0ED680;
      v116 = v10;
      v117 = v105;
      v77 = v6;
      v118 = v77;
      v112[0] = v76;
      v112[1] = 3221225472;
      v112[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1995;
      v112[3] = &unk_24D0EA9D8;
      v78 = v116;
      v113 = v78;
      v79 = v74;
      v114 = v79;
      objc_msgSend(v72, "indexRequestsPerformJob:perExtensionCompletionHandler:completionHandler:", v78, v115, v112);
      logForCSLogCategoryIndex();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v78, "excludedBundleIDs");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v144 = v78;
        v145 = 2112;
        v146 = v81;
        _os_log_impl(&dword_213CF1000, v80, OS_LOG_TYPE_DEFAULT, "Performing job:%@ with spotlight daemon clients, excludedBundleIDs:%@", buf, 0x16u);

      }
      +[SpotlightDaemonServer sharedDaemonServer](SpotlightDaemonServer, "sharedDaemonServer");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = *MEMORY[0x24BDD0CE0];
      v110[0] = v76;
      v110[1] = 3221225472;
      v110[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1996;
      v110[3] = &unk_24D0ED6A8;
      v110[4] = v105;
      v111 = v77;
      v108[0] = v76;
      v108[1] = 3221225472;
      v108[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2;
      v108[3] = &unk_24D0EA758;
      v109 = v79;
      v84 = v79;
      objc_msgSend(v82, "handleJob:protectionClass:perClientCompletionHandler:completionHandler:", v78, v83, v110, v108);

      v85 = qos_class_self();
      dispatch_get_global_queue(v85, 0);
      v86 = objc_claimAutoreleasedReturnValue();
      block[0] = v76;
      block[1] = 3221225472;
      block[2] = __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_3;
      block[3] = &unk_24D0EA938;
      v107 = v7;
      dispatch_group_notify(v84, v86, block);

      v9 = v72;
      v10 = v104;
      v11 = v96;
      v12 = v98;
      v17 = v92;
      goto LABEL_71;
    }
    v43 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    if (objc_msgSend(v96, "count"))
    {
      v91 = v9;
      v94 = v7;
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v44 = v96;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
      v46 = v105;
      if (v45)
      {
        v47 = v45;
        v101 = v6;
        v48 = *(_QWORD *)v120;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v120 != v48)
              objc_enumerationMutation(v44);
            v50 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
            -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v46, "dataMigrationBundleIDs");
            v51 = objc_claimAutoreleasedReturnValue();
            if (v51)
            {
              v52 = (void *)v51;
              -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v46, "dataMigrationBundleIDs");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "containsObject:", v50);

              if (!v54)
                continue;
            }
            logForCSLogCategoryIndex();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              v56 = objc_msgSend(v101, "dataMigrationStage");
              v57 = -[SPCoreSpotlightIndexer dataMigrationStage](v46, "dataMigrationStage");
              -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v46, "dataMigrationBundleIDs");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v144 = v104;
              v145 = 2112;
              v146 = v50;
              v147 = 2048;
              v148 = v56;
              v149 = 2048;
              v150 = v57;
              v151 = 2112;
              v152 = v58;
              _os_log_debug_impl(&dword_213CF1000, v55, OS_LOG_TYPE_DEBUG, "Dropping job:%@ for indexing extension with bundleID:%@ since it ran during data migration, dataMigrationStange:%lu/%lu, dataMigrationBundleIDs:%@", buf, 0x34u);

              v46 = v105;
            }

            objc_msgSend(v43, "addObject:", v50);
          }
          v47 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
        }
        while (v47);
        v6 = v101;
        v9 = v91;
        v41 = v92;
      }
    }
    else
    {
      v46 = v105;
      -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v105, "dataMigrationBundleIDs");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "count");

      if (!v70)
      {
LABEL_65:
        objc_msgSend(v41, "unionSet:", v43);
        objc_msgSend(v43, "allObjects");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPCoreSpotlightIndexer addCompletedBundleIDs:forIndexerTask:](v46, "addCompletedBundleIDs:forIndexerTask:", v71, v6);

        v10 = v104;
        goto LABEL_66;
      }
      v94 = v7;
      -[SPCoreSpotlightIndexer dataMigrationBundleIDs](v105, "dataMigrationBundleIDs");
      v44 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "unionSet:", v44);
    }

    v7 = v94;
    goto LABEL_65;
  }
  if (v7)
    v7[2](v7);
LABEL_72:

}

uint64_t __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_cold_1();

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1989(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t result;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1989_cold_1();

  v3 = (void *)a1[6];
  v6[0] = a1[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCompletedBundleIDs:forIndexerTask:", v4, a1[7]);

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1991(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[4];
    *(_DWORD *)buf = 138412802;
    v13 = v10;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_debug_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEBUG, "Done performing job:%@ with extension \"%@\", error:%@", buf, 0x20u);
  }

  v8 = (void *)a1[5];
  v11 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addCompletedBundleIDs:forIndexerTask:", v9, a1[6]);

}

uint64_t __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1993(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1993_cold_1();

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1994(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[4];
    *(_DWORD *)buf = 138412802;
    v13 = v10;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_debug_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEBUG, "Done performing job:%@ with extension \"%@\", error:%@", buf, 0x20u);
  }

  v8 = (void *)a1[5];
  v11 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addCompletedBundleIDs:forIndexerTask:", v9, a1[6]);

}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1995(uint64_t a1)
{
  NSObject *v2;

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1993_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1996(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v7 = a2;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCompletedBundleIDs:forIndexerTask:", v6, *(_QWORD *)(a1 + 40), v7, v8);

}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)fetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 userCtx:(id)a7 flags:(unsigned int)a8 qos:(unsigned int)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  dispatch_block_t v26;
  NSObject *queue;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  unsigned int v35;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  if (!deviceUnlocked)
    SIResumeForUnlock();
  v22 = (void *)*MEMORY[0x24BDD0CE0];
  if (v17)
    v22 = v17;
  v23 = v22;
  -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v23, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    queue = sIndexQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __115__SPCoreSpotlightIndexer_fetchAttributes_protectionClass_bundleID_identifiers_userCtx_flags_qos_completionHandler___block_invoke;
    block[3] = &unk_24D0ED6D0;
    v29 = v24;
    v30 = v16;
    v31 = v18;
    v32 = v19;
    v33 = v20;
    v35 = a8;
    v34 = v21;
    v26 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a9, 0, block);
    dispatch_async(queue, v26);

  }
  else if (v21)
  {
    (*((void (**)(id, _QWORD, _QWORD))v21 + 2))(v21, 0, 0);
  }

}

uint64_t __115__SPCoreSpotlightIndexer_fetchAttributes_protectionClass_bundleID_identifiers_userCtx_flags_qos_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchAttributes:bundleID:identifiers:userCtx:flags:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 72));
}

- (void)fetchAttributesForProtectionClass:(id)a3 attributes:(id)a4 bundleID:(id)a5 identifiers:(id)a6 userCtx:(id)a7 flags:(int)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  if (!deviceUnlocked)
    SIResumeForUnlock();
  v21 = (void *)*MEMORY[0x24BDD0CE0];
  if (v15)
    v21 = v15;
  v22 = v21;
  -[SPCoreSpotlightIndexer concreteIndexerForProtectionClass:andBundleID:](self, "concreteIndexerForProtectionClass:andBundleID:", v22, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = sIndexQueue;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __117__SPCoreSpotlightIndexer_fetchAttributesForProtectionClass_attributes_bundleID_identifiers_userCtx_flags_completion___block_invoke;
    v27[3] = &unk_24D0ED6D0;
    v28 = v23;
    v29 = v16;
    v30 = v17;
    v31 = v18;
    v32 = v19;
    v34 = a8;
    v33 = v20;
    _setup_block(v27, 0, 16877);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v25, v26);

  }
  else if (v20)
  {
    (*((void (**)(id, _QWORD))v20 + 2))(v20, 0);
  }

}

uint64_t __117__SPCoreSpotlightIndexer_fetchAttributesForProtectionClass_attributes_bundleID_identifiers_userCtx_flags_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchAttributes:bundleID:identifiers:userCtx:flags:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 72));
}

- (void)fetchAttributesForProtectionClass:(id)a3 attributes:(id)a4 bundleID:(id)a5 identifiers:(id)a6 completion:(id)a7
{
  -[SPCoreSpotlightIndexer fetchAttributesForProtectionClass:attributes:bundleID:identifiers:userCtx:flags:completion:](self, "fetchAttributesForProtectionClass:attributes:bundleID:identifiers:userCtx:flags:completion:", a3, a4, a5, a6, 0, 0, a7);
}

- (void)revokeExpiredItems:(id)a3 protected:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__SPCoreSpotlightIndexer_revokeExpiredItems_protected___block_invoke;
  v11[3] = &unk_24D0EAFC8;
  v13 = a4;
  v11[4] = self;
  v12 = v6;
  v7 = v6;
  v8 = (void *)MEMORY[0x2199C2F34](v11);
  v9 = sIndexQueue;
  _setup_block(v8, 0, 16915);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v7, v9, v10);

}

void __55__SPCoreSpotlightIndexer_revokeExpiredItems_protected___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 48))
  {
    _checkUnlock();
    v2 = *MEMORY[0x24BDD0CD8];
    v11[0] = *MEMORY[0x24BDD0CD0];
    v11[1] = v2;
    v11[2] = *MEMORY[0x24BDD0CE8];
    v3 = (void *)MEMORY[0x24BDBCE30];
    v4 = v11;
    v5 = 3;
  }
  else
  {
    v10 = *MEMORY[0x24BDD0CE0];
    v3 = (void *)MEMORY[0x24BDBCE30];
    v4 = &v10;
    v5 = 1;
  }
  objc_msgSend(v3, "arrayWithObjects:count:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__SPCoreSpotlightIndexer_revokeExpiredItems_protected___block_invoke_2;
  v8[3] = &unk_24D0ECC48;
  v7 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v7, "_enumerateIndexersWithProtectionClasses:block:", v6, v8);

}

uint64_t __55__SPCoreSpotlightIndexer_revokeExpiredItems_protected___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "revokeExpiredItems:", *(_QWORD *)(a1 + 32));
}

- (void)powerStateChanged
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];

  if (!deviceUnlocked)
    SIResumeForUnlock();
  v3 = sIndexQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__SPCoreSpotlightIndexer_powerStateChanged__block_invoke;
  v5[3] = &unk_24D0EA758;
  v5[4] = self;
  _setup_block(v5, 0, 16925);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, v4);

}

uint64_t __43__SPCoreSpotlightIndexer_powerStateChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumerateIndexersWithBlock:", &__block_literal_global_1998);
}

uint64_t __43__SPCoreSpotlightIndexer_powerStateChanged__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "powerStateChanged");
}

- (id)queryForWord:(id)a3 matchingAttributes:(id)a4 prefixMatch:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v10 = objc_msgSend(v8, "count");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    if (v5)
      v13 = CFSTR("|| (%@=\"%@*\"cwdt)");
    else
      v13 = CFSTR("|| (%@=\"%@\"cwdt)");
    if (v5)
      v14 = CFSTR("(%@=\"%@*\"cwdt)");
    else
      v14 = CFSTR("(%@=\"%@\"cwdt)");
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v16 = (__CFString *)v13;
      else
        v16 = (__CFString *)v14;
      v17 = v16;
      objc_msgSend(v9, "appendFormat:", v17, v15, v7);

      ++v12;
    }
    while (v11 != v12);
  }

  return v9;
}

- (NSURL)personaListURL
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (sPrivate)
  {
    v2 = 0;
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x24BDBCF48]);
    v4 = (void *)MEMORY[0x24BDD17C8];
    NSHomeDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@"), v5, CFSTR("Library/Spotlight/PersonaList.plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v3, "initFileURLWithPath:", v6);

  }
  return (NSURL *)v2;
}

- (void)personaListDidUpdate
{
  void *v3;
  _QWORD v4[5];

  if (!sPrivate)
  {
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __46__SPCoreSpotlightIndexer_personaListDidUpdate__block_invoke;
    v4[3] = &unk_24D0ED718;
    v4[4] = self;
    objc_msgSend(v3, "fetchAllPersonasWithCompletionHandler:", v4);

  }
}

void __46__SPCoreSpotlightIndexer_personaListDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v9), "objectForKey:", CFSTR("UserPersonaUniqueString"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "isEqual:", v4) & 1) == 0)
  {
    v11 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "mutableCopy");
    objc_msgSend(v11, "minusSet:", v4);
    if (objc_msgSend(v11, "count"))
    {
      NSLog(CFSTR("missing personas: %@"), v11);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "unionSet:", v4);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "personaListURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "writeToURL:error:", v13, 0);

      v14 = dispatch_group_create();
      dispatch_group_enter(v14);
      v15 = *(void **)(a1 + 32);
      objc_msgSend(v11, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __46__SPCoreSpotlightIndexer_personaListDidUpdate__block_invoke_2;
      v22[3] = &unk_24D0EC208;
      v22[4] = *(_QWORD *)(a1 + 32);
      v23 = v4;
      v24 = v14;
      v17 = v14;
      objc_msgSend(v15, "deleteSearchableItemsWithPersonaIds:completionHandler:", v16, v22);

      dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      v18 = objc_msgSend(v4, "mutableCopy");
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(v19 + 208);
      *(_QWORD *)(v19 + 208) = v18;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "allObjects");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "personaListURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject writeToURL:error:](v17, "writeToURL:error:", v21, 0);

    }
  }

}

void __46__SPCoreSpotlightIndexer_personaListDidUpdate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    *(_BYTE *)(v3 + 80) = 1;
  }
  else
  {
    *(_BYTE *)(v3 + 80) = 0;
    v4 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 208);
    *(_QWORD *)(v5 + 208) = v4;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "personaListURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeToURL:error:", v8, 0);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)handleRankingCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  qos_class_t v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  SPCoreSpotlightIndexer *v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("update")))
  {
    objc_msgSend((id)sDelegate, "updateApplicationsWithCompletion:clean:", v7, 0);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("reset")))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend((id)objc_opt_class(), "allProtectionClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProtectionClasses:", v9);

    v10 = *MEMORY[0x24BDC1AE8];
    v32[0] = *MEMORY[0x24BDC22E8];
    v32[1] = v10;
    v32[2] = CFSTR("_kMDItemLaunchString");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFetchAttributes:", v11);

    objc_msgSend(v8, "setInternal:", 1);
    v12 = (void *)objc_opt_new();
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=*"), CFSTR("_kMDItemLaunchString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke;
    v29[3] = &unk_24D0EBCE8;
    v30 = v8;
    v31 = v12;
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_3;
    v25[3] = &unk_24D0EC208;
    v26 = v31;
    v27 = self;
    v16 = v13;
    v28 = v16;
    v17 = v31;
    v18 = v8;
    -[SPCoreSpotlightIndexer startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:](self, "startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v14, v18, 0, v29, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      dispatch_group_leave(v16);
    v20 = qos_class_self();
    dispatch_get_global_queue(v20, 2uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    v23[1] = 3221225472;
    v23[2] = __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_5;
    v23[3] = &unk_24D0EA938;
    v24 = v7;
    _setup_block(v23, 0, 17052);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_notify(v16, v21, v22);

  }
}

void __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  if (!a2)
  {
    v13 = v5;
    v14 = v6;
    objc_msgSend(*(id *)(a1 + 32), "fetchAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_2;
    v11[3] = &unk_24D0EB150;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(a5, "enumerateQueryResults:stringCache:usingBlock:", v10, 0, v11);

  }
}

void __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_2(uint64_t a1, id *a2)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  v5 = a2[1];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }
  v7 = objc_alloc(MEMORY[0x24BDC2480]);
  v8 = *MEMORY[0x24BDBD430];
  v9 = *MEMORY[0x24BDC1EE8];
  v13[0] = CFSTR("_kMDItemLaunchString");
  v13[1] = v9;
  v14[0] = v8;
  v14[1] = v8;
  v13[2] = CFSTR("kMDItemLastUsedDate_Ranking");
  v13[3] = CFSTR("_kMDItemShortcutLastUsedDate");
  v14[2] = v8;
  v14[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithAttributes:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2478]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v4, 0, v11);
  objc_msgSend(v12, "setIsUpdate:", 1);
  objc_msgSend(v6, "addObject:", v12);

}

void __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_4;
  v3[3] = &unk_24D0ECFE8;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:expectedClientState:clientStateName:protectionClass:forBundleID:options:completionHandler:", a3, 0, 0, 0, 0, 0, a2, 0, 0);
}

uint64_t __58__SPCoreSpotlightIndexer_handleRankingCommand_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchAccumulatedStorageSizeForBundleId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (!v7)
    -[SPCoreSpotlightIndexer _fetchAccumulatedStorageSizeForBundleId:completionHandler:].cold.1();
  v8 = sIndexQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke;
  v12[3] = &unk_24D0EB758;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  _setup_block(v12, 0, 17091);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v8, v11);

}

void __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  dispatch_group_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  dispatch_group_t v15;
  id v16;
  id v17;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = dispatch_group_create();
  v4 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_2;
  v14[3] = &unk_24D0ED768;
  v15 = v3;
  v5 = *(void **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v6 = v2;
  v17 = v6;
  v7 = v3;
  objc_msgSend(v5, "_enumerateIndexersWithBlock:", v14);
  v8 = sIndexQueue;
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_2026;
  v11[3] = &unk_24D0EB780;
  v12 = v6;
  v13 = *(id *)(a1 + 48);
  v9 = v6;
  _setup_block(v11, 0, 17090);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v7, v8, v10);

}

void __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_3;
  v6[3] = &unk_24D0ED740;
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v4, "_fetchAccumulatedStorageSizeForBundleId:completionHandler:", v7, v6);

}

void __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch the storage size for bundleId:%@, error:%@", (uint8_t *)&v10, 0x16u);
    }

    goto LABEL_7;
  }
  if (v5)
  {
    v9 = *(id *)(a1 + 40);
    objc_sync_enter(v9);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    objc_sync_exit(v9);

LABEL_7:
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __84__SPCoreSpotlightIndexer__fetchAccumulatedStorageSizeForBundleId_completionHandler___block_invoke_2026(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(a1 + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v2);
          v5 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "unsignedLongLongValue", (_QWORD)v10);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }

    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

- (void)_migrateIndexExtensionsWithEnumerator:(id)a3 forced:(BOOL)a4 migratedBundleIds:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  SPCoreSpotlightIndexer *v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);
  BOOL v23;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  if (!v12)
    -[SPCoreSpotlightIndexer _migrateIndexExtensionsWithEnumerator:forced:migratedBundleIds:completionHandler:].cold.1();
  v13 = v12;
  objc_msgSend(v10, "nextObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 && v15)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __107__SPCoreSpotlightIndexer__migrateIndexExtensionsWithEnumerator_forced_migratedBundleIds_completionHandler___block_invoke;
    v17[3] = &unk_24D0ED7B8;
    v23 = a4;
    v18 = v15;
    v19 = self;
    v20 = v10;
    v21 = v11;
    v22 = v13;
    -[SPCoreSpotlightIndexer _fetchAccumulatedStorageSizeForBundleId:completionHandler:](self, "_fetchAccumulatedStorageSizeForBundleId:completionHandler:", v18, v17);

  }
  else
  {
    v13[2](v13);
  }

}

void __107__SPCoreSpotlightIndexer__migrateIndexExtensionsWithEnumerator_forced_migratedBundleIds_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 72);
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v3 || v4)
  {
    if (v6)
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(a1 + 72))
        v9 = "YES";
      else
        v9 = "NO";
      *(_DWORD *)buf = 138412802;
      v24 = v8;
      v25 = 2112;
      v26 = v3;
      v27 = 2080;
      v28 = v9;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "Starting migration for index extension:%@, size:%@, forced:%s", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDC24E8], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 3);
    v12 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __107__SPCoreSpotlightIndexer__migrateIndexExtensionsWithEnumerator_forced_migratedBundleIds_completionHandler___block_invoke_2027;
    v16[3] = &unk_24D0ED790;
    v17 = v12;
    v22 = *(_BYTE *)(a1 + 72);
    v13 = *(id *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(a1 + 48);
    v18 = v13;
    v19 = v14;
    v20 = v15;
    v21 = *(id *)(a1 + 64);
    objc_msgSend(v10, "indexRequestsPerformJob:forBundle:completionHandler:", v11, v17, v16);

  }
  else
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v24 = v7;
      v25 = 2112;
      v26 = v3;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "Skipping migration for index extension:%@, size:%@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_migrateIndexExtensionsWithEnumerator:forced:migratedBundleIds:completionHandler:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }

}

uint64_t __107__SPCoreSpotlightIndexer__migrateIndexExtensionsWithEnumerator_forced_migratedBundleIds_completionHandler___block_invoke_2027(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  id v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = "YES";
    if (!*(_BYTE *)(a1 + 72))
      v4 = "NO";
    v7 = 138412546;
    v8 = v3;
    v9 = 2080;
    v10 = v4;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Finished migration for index extension:%@, forced:%s", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(id *)(a1 + 40);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32));
  objc_sync_exit(v5);

  return objc_msgSend(*(id *)(a1 + 48), "_migrateIndexExtensionsWithEnumerator:forced:migratedBundleIds:completionHandler:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
}

- (void)migrateForced:(BOOL)a3
{
  void *v5;
  NSObject *reindexAllQueue;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  SDTransactionCreate(&unk_24D0FD0A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reindexAllQueue = self->_reindexAllQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__SPCoreSpotlightIndexer_migrateForced___block_invoke;
  v9[3] = &unk_24D0EAFC8;
  v11 = a3;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  _setup_block(v9, 0, 17171);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(reindexAllQueue, v8);

}

void __40__SPCoreSpotlightIndexer_migrateForced___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 248));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("com.apple.searchd.indexExtensionMigration.start"), *(_QWORD *)(a1 + 32), 0);

  objc_msgSend(MEMORY[0x24BDC24E8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allExtensionsWithBlock:", &__block_literal_global_2034);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(a1 + 48);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__SPCoreSpotlightIndexer_migrateForced___block_invoke_2035;
  v11[3] = &unk_24D0EA8C0;
  v9 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v9;
  v10 = v5;
  objc_msgSend(v6, "_migrateIndexExtensionsWithEnumerator:forced:migratedBundleIds:completionHandler:", v7, v8, v10, v11);

}

uint64_t __40__SPCoreSpotlightIndexer_migrateForced___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if ((objc_msgSend(v2, "isInternal") & 1) != 0
    || (objc_msgSend(v2, "containerID"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.")),
        v3,
        v4))
  {
    v5 = objc_msgSend(v2, "dontRunDuringMigration") ^ 1;
    v6 = 1;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "extensionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "containerID");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = "NO";
    v16 = 2112;
    v14 = 138413058;
    if (v6)
      v12 = "YES";
    else
      v12 = "NO";
    v15 = v8;
    v17 = v9;
    if ((_DWORD)v5)
      v11 = "YES";
    v18 = 2080;
    v19 = v12;
    v20 = 2080;
    v21 = v11;
    _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "Found index extension:%@, containerId:%@, internal:%s, migrate:%s", (uint8_t *)&v14, 0x2Au);

  }
  return v5;
}

void __40__SPCoreSpotlightIndexer_migrateForced___block_invoke_2035(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 248));
  dispatch_get_global_queue(9, 2uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__SPCoreSpotlightIndexer_migrateForced___block_invoke_2_2036;
  v6[3] = &unk_24D0EA8C0;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  _setup_block(v6, 0, 17169);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, v5);

}

void __40__SPCoreSpotlightIndexer_migrateForced___block_invoke_2_2036(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("bundleIDs");
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("com.apple.searchd.indexExtensionMigration.finish"), *(_QWORD *)(a1 + 40), v3);

  SDTransactionDone(*(void **)(a1 + 48));
}

- (void)runMigration
{
  __assert_rtn("-[SPCoreSpotlightIndexer runMigration]", "SPCoreSpotlightIndexer.m", 17176, "0");
}

- (void)_reindexAllIdentifiersWithExtension:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (!v6)
    -[SPCoreSpotlightIndexer _reindexAllIdentifiersWithExtension:completionBlock:].cold.1();
  if (!v7)
    -[SPCoreSpotlightIndexer _reindexAllIdentifiersWithExtension:completionBlock:].cold.2();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke;
  v13[3] = &unk_24D0EB758;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x2199C2F34](v13);
  v11 = sIndexQueue;
  _setup_block(v10, 0, 17232);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_async(v11, v12);

}

void __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v16[2] = __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_2;
  v16[3] = &unk_24D0EBCE8;
  v2 = a1[5];
  v16[4] = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v17 = v2;
  v4 = (void *)MEMORY[0x2199C2F34](v16);
  objc_msgSend(a1[5], "containerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setClientBundleID:", v5);
  v18[0] = *MEMORY[0x24BDC22E8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchAttributes:", v7);

  objc_msgSend((id)objc_opt_class(), "allProtectionClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtectionClasses:", v8);

  v9 = objc_alloc(MEMORY[0x24BDD17C8]);
  v10 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("(%@ = '%@') && (%@ != '*')"), *MEMORY[0x24BDC1AE8], v5, *MEMORY[0x24BDC2318]);
  v11 = a1[4];
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_5;
  v14[3] = &unk_24D0ED848;
  v14[4] = v11;
  v15 = a1[6];
  objc_msgSend(v11, "_startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v10, v6, 0, v4, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setReindexAllItemsTask:", v12);

  objc_msgSend(a1[4], "reindexAllItemsTask");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    (*((void (**)(void))a1[6] + 2))();

}

void __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (!a2)
  {
    v20 = v8;
    v21 = v7;
    v22 = v5;
    v23 = v6;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", _MDStoreOIDArrayGetVectorCount());
    v12 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_3;
    v18[3] = &unk_24D0EB150;
    v13 = v11;
    v19 = v13;
    objc_msgSend(a5, "enumerateQueryResults:stringCache:usingBlock:", 1, 0, v18);
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "reindexAllItemsTask");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pauseResults");

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2400]), "initWithJobType:", 1);
      objc_msgSend(v15, "setIdentifiersToReindex:", v13);
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_4;
      v17[3] = &unk_24D0ED820;
      v16 = *(void **)(a1 + 40);
      v17[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v16, "performJob:completionBlock:", v15, v17);

    }
  }
}

uint64_t __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_3(uint64_t result, _QWORD *a2)
{
  if (*a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  return result;
}

void __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "reindexAllItemsTask");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

  }
  objc_msgSend(*(id *)(a1 + 32), "reindexAllItemsTask");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeResults");

}

uint64_t __78__SPCoreSpotlightIndexer__reindexAllIdentifiersWithExtension_completionBlock___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setReindexAllItemsTask:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)_filterReindexAllExtensions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
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

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isInternal", (_QWORD)v14) & 1) == 0)
        {
          objc_msgSend(v10, "containerID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple."));

          if ((v12 & 1) == 0)
            objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_reindexAllItemsWithExtensionsAndCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
    -[SPCoreSpotlightIndexer _reindexAllItemsWithExtensionsAndCompletionBlock:].cold.1();
  v5 = v4;
  logForCSLogCategoryIndex();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "Reindexing all items with the index extensions", buf, 2u);
  }

  dispatch_suspend((dispatch_object_t)self->_reindexAllQueue);
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke;
  v12[3] = &unk_24D0ED870;
  v12[4] = self;
  objc_msgSend(v7, "setFilterBlock:", v12);
  objc_msgSend(v7, "setPerformBlock:", &__block_literal_global_2045);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke_4;
  v10[3] = &unk_24D0ED848;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "setCompletionBlock:", v10);
  objc_msgSend(v7, "start");

}

id __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "_filterReindexAllExtensions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;

  v4 = a3;
  v5 = (objc_class *)MEMORY[0x24BDC2400];
  v6 = a2;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithJobType:", 2);
  objc_msgSend(v7, "setReason:", CFSTR("re-indexing all items with the index extensions"));
  dispatch_group_enter(v4);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke_3;
  v9[3] = &unk_24D0ED820;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "performJob:completionBlock:", v7, v9);

}

void __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __75__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndCompletionBlock___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Finished reindexing all items with the index extensions", v4, 2u);
  }

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 248));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  SPCoreSpotlightIndexer *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
    -[SPCoreSpotlightIndexer _reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock:].cold.1();
  v5 = v4;
  logForCSLogCategoryIndex();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "Reindexing all identifiers with the index extensions", buf, 2u);
  }

  dispatch_suspend((dispatch_object_t)self->_reindexAllQueue);
  v7 = (void *)objc_opt_new();
  v8 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke;
  v17[3] = &unk_24D0ED870;
  v17[4] = self;
  objc_msgSend(v7, "setFilterBlock:", v17);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_2;
  v16[3] = &unk_24D0ED8D8;
  v16[4] = self;
  objc_msgSend(v7, "setPerformBlock:", v16);
  v10 = v8;
  v11 = 3221225472;
  v12 = __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_4;
  v13 = &unk_24D0ED848;
  v14 = self;
  v15 = v5;
  v9 = v5;
  objc_msgSend(v7, "setCompletionBlock:", &v10);
  objc_msgSend(v7, "start", v10, v11, v12, v13, v14);

}

id __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "_filterReindexAllExtensions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;

  v5 = a3;
  v6 = a2;
  dispatch_group_enter(v5);
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_3;
  v9[3] = &unk_24D0EA758;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "_reindexAllIdentifiersWithExtension:completionBlock:", v6, v9);

}

void __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __89__SPCoreSpotlightIndexer__reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Finished reindexing all identifiers with the index extensions", v4, 2u);
  }

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 248));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)transferDeleteJournalsForProtectionClass:(id)a3 toDirectory:(int)a4 completionHandler:(id)a5
{
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  int v19;

  v8 = a5;
  v9 = (__CFString *)a3;
  -[SPCoreSpotlightIndexer concreteIndexers](self, "concreteIndexers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    v12 = v9;
  else
    v12 = CFSTR("Unknown");
  objc_msgSend(v10, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = sIndexQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __97__SPCoreSpotlightIndexer_transferDeleteJournalsForProtectionClass_toDirectory_completionHandler___block_invoke;
    v16[3] = &unk_24D0ED900;
    v17 = v13;
    v19 = a4;
    v18 = v8;
    _setup_block(v16, 0, 17313);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v14, v15);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __97__SPCoreSpotlightIndexer_transferDeleteJournalsForProtectionClass_toDirectory_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transferDeleteJournalsToDirectory:completionHandler:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)setExtensionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->extensionDelegate, a3);
}

- (NSSet)fileProviderBundleIDs
{
  return self->_fileProviderBundleIDs;
}

- (SPCoreSpotlightIndexerDelegate)indexerDelegate
{
  return (SPCoreSpotlightIndexerDelegate *)objc_loadWeakRetained((id *)&self->_indexerDelegate);
}

- (void)setIndexerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_indexerDelegate, a3);
}

- (void)setInteractionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_interactionHandler, a3);
}

- (void)setConcreteIndexers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)setPrefsChangeSource:(id)a3
{
  objc_storeStrong((id *)&self->_prefsChangeSource, a3);
}

- (NSObject)dataMigrationStartObserver
{
  return self->_dataMigrationStartObserver;
}

- (void)setDataMigrationStartObserver:(id)a3
{
  objc_storeStrong((id *)&self->_dataMigrationStartObserver, a3);
}

- (NSObject)dataMigrationFinishObserver
{
  return self->_dataMigrationFinishObserver;
}

- (void)setDataMigrationFinishObserver:(id)a3
{
  objc_storeStrong((id *)&self->_dataMigrationFinishObserver, a3);
}

- (NSSet)dataMigrationBundleIDs
{
  return self->_dataMigrationBundleIDs;
}

- (void)setDataMigrationBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_dataMigrationBundleIDs, a3);
}

- (NSSet)prefsDisabledBundleIDs
{
  return self->_prefsDisabledBundleIDs;
}

- (void)setPrefsDisabledBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_prefsDisabledBundleIDs, a3);
}

- (OS_dispatch_source)reindexAllItemsSource
{
  return self->_reindexAllItemsSource;
}

- (void)setReindexAllItemsSource:(id)a3
{
  objc_storeStrong((id *)&self->_reindexAllItemsSource, a3);
}

- (OS_dispatch_source)reindexAllItemsWithIdentifiersSource
{
  return self->_reindexAllItemsWithIdentifiersSource;
}

- (void)setReindexAllItemsWithIdentifiersSource:(id)a3
{
  objc_storeStrong((id *)&self->_reindexAllItemsWithIdentifiersSource, a3);
}

- (SPCoreSpotlightTask)reindexAllItemsTask
{
  return (SPCoreSpotlightTask *)objc_getProperty(self, a2, 200, 1);
}

- (void)setReindexAllItemsTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSMutableSet)knownPersonas
{
  return self->_knownPersonas;
}

- (void)setKnownPersonas:(id)a3
{
  objc_storeStrong((id *)&self->_knownPersonas, a3);
}

- (BOOL)updatePersonas
{
  return self->_updatePersonas;
}

- (void)setUpdatePersonas:(BOOL)a3
{
  self->_updatePersonas = a3;
}

- (CSFileProviderDomainMonitor)fileProviderMonitor
{
  return (CSFileProviderDomainMonitor *)objc_loadWeakRetained((id *)&self->_fileProviderMonitor);
}

- (void)setFileProviderMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_fileProviderMonitor, a3);
}

- (OS_dispatch_queue)personaQueue
{
  return self->_personaQueue;
}

- (void)setPersonaQueue:(id)a3
{
  objc_storeStrong((id *)&self->_personaQueue, a3);
}

- (void)setIndexQueue:(id)a3
{
  objc_storeStrong((id *)&self->_indexQueue, a3);
}

- (void)setFirstUnlockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_firstUnlockQueue, a3);
}

- (OS_dispatch_queue)reindexAllQueue
{
  return self->_reindexAllQueue;
}

- (void)setReindexAllQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reindexAllQueue, a3);
}

- (void)setDataMigrationStage:(unint64_t)a3
{
  self->_dataMigrationStage = a3;
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reindexAllQueue, 0);
  objc_storeStrong((id *)&self->_firstUnlockQueue, 0);
  objc_storeStrong((id *)&self->_indexQueue, 0);
  objc_storeStrong((id *)&self->_personaQueue, 0);
  objc_destroyWeak((id *)&self->_fileProviderMonitor);
  objc_storeStrong((id *)&self->_knownPersonas, 0);
  objc_storeStrong((id *)&self->_reindexAllItemsTask, 0);
  objc_storeStrong((id *)&self->_reindexAllItemsWithIdentifiersSource, 0);
  objc_storeStrong((id *)&self->_reindexAllItemsSource, 0);
  objc_storeStrong((id *)&self->_prefsDisabledBundleIDs, 0);
  objc_storeStrong((id *)&self->_dataMigrationBundleIDs, 0);
  objc_storeStrong((id *)&self->_dataMigrationFinishObserver, 0);
  objc_storeStrong((id *)&self->_dataMigrationStartObserver, 0);
  objc_storeStrong((id *)&self->_prefsChangeSource, 0);
  objc_storeStrong((id *)&self->_concreteIndexers, 0);
  objc_storeStrong((id *)&self->_interactionHandler, 0);
  objc_destroyWeak((id *)&self->_indexerDelegate);
  objc_storeStrong((id *)&self->_fileProviderBundleIDs, 0);
  objc_storeStrong((id *)&self->_fileProviderExtensionToAppBundleMap, 0);
  objc_storeStrong((id *)&self->_fileProviderAppToExtensionBundleMap, 0);
  objc_destroyWeak((id *)&self->extensionDelegate);
  objc_storeStrong((id *)&self->_reindexIndexers, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_appScopingQueue, 0);
  objc_storeStrong((id *)&self->_bundlesWithRemoteSearchSupport, 0);
  objc_storeStrong((id *)&self->_bundlesWithIndexedCoreSpotlightItems, 0);
}

+ (void)setIndexerDelegate:.cold.1()
{
  __assert_rtn("+[SPCoreSpotlightIndexer setIndexerDelegate:]", "SPCoreSpotlightIndexer.m", 11358, "!sIndexer");
}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Error %@ writing index info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Failed to get age of index directory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Failed to get age of heartbeat file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Failed to get build number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __40__SPCoreSpotlightIndexer_sharedInstance__block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14_0(&dword_213CF1000, v0, v1, "Failed to get roots installed status: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_213CF1000, a1, a3, "Registering XPC activity:%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_38(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Error registering persona list update observer %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1466_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, v1, "Failed to defer XPC activity:%s, state:%ld", v2);
  OUTLINED_FUNCTION_1();
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1469_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, v1, "Failed to defer XPC activity:%s, state:%ld", v2);
  OUTLINED_FUNCTION_1();
}

void __30__SPCoreSpotlightIndexer_init__block_invoke_1472_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, v1, "Failed to defer XPC activity:%s, state:%ld", v2);
  OUTLINED_FUNCTION_1();
}

void __31__SPCoreSpotlightIndexer_start__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, a1, a3, "Forcing low disk due to a file existing at %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __31__SPCoreSpotlightIndexer_start__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_16();
  v2 = *OUTLINED_FUNCTION_53();
  v4[0] = 67109378;
  v4[1] = v2;
  v5 = 2080;
  v6 = v1;
  OUTLINED_FUNCTION_24(&dword_213CF1000, v0, v3, "Error %d opening %s", (uint8_t *)v4);
  OUTLINED_FUNCTION_11();
}

void __50__SPCoreSpotlightIndexer__registerForPrefsChanges__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "Received \"%@\" event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_reindexAllItemsForBundleIDs:reason:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "Scheduling reindex-all task, reason:%@, bundleIDs:%@");
  OUTLINED_FUNCTION_1();
}

- (void)commitUpdatesWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[SPCoreSpotlightIndexer commitUpdatesWithCompletionHandler:]", "SPCoreSpotlightIndexer.m", 12460, "completionHandler");
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_20(&dword_213CF1000, v0, v1, "Start merge", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_20(&dword_213CF1000, v0, v1, "Schedule merge on power", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __96__SPCoreSpotlightIndexer_mergeWithProtectionClasses_power_inferPriorityIndex_completionHandler___block_invoke_1523_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_20(&dword_213CF1000, v0, v1, "Start merge on power", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)issueHeartbeat:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Error %@ writing index creation date", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)issueResolveFPItemForURL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Failed to resolve FPItem for : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__SPCoreSpotlightIndexer_queryPreheat___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "[ResourceManager] could not create asset resources directory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)_taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.1()
{
  __assert_rtn("-[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:]", "SPCoreSpotlightIndexer.m", 13419, "resultsHandler");
}

- (void)_taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Can't create query task because no indexers are available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)_taskForQueryWithQueryString:(void *)a3 queryContext:eventHandler:resultsHandler:completionHandler:.cold.3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a3, "clientBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_45(&dword_213CF1000, MEMORY[0x24BDACB70], v4, "PCS %@ for query %@. Internally generated. Client %@", v5, v6, v7, v8, v9);

}

- (void)_taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4(&dword_213CF1000, v0, v1, "QOS _taskForQueryWithQueryString: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1582_cold_1()
{
  __assert_rtn("-[SPCoreSpotlightIndexer _taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:]_block_invoke", "SPCoreSpotlightIndexer.m", 13512, "job");
}

void __114__SPCoreSpotlightIndexer__taskForQueryWithQueryString_queryContext_eventHandler_resultsHandler_completionHandler___block_invoke_1585_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_31(v2, *MEMORY[0x24BDAC8D0]);
  v4 = 134218754;
  v5 = v1;
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_40(&dword_213CF1000, v0, v3, "Scheduling jobs(%ld/%ld) for task:%p, canceled:%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_44();
}

- (void)taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "taskForQueryWithQueryString: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4(&dword_213CF1000, v0, v1, "QOS taskForQueryWithQueryString: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)startQueryTask:.cold.1()
{
  NSObject *v0;
  void *v1;
  qos_class_t v2;
  int v3;
  uint64_t v4;
  const char *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  uint64_t v9;

  OUTLINED_FUNCTION_16();
  v9 = *MEMORY[0x24BDAC8D0];
  v2 = qos_class_self();
  v3 = objc_msgSend(v1, "critical");
  v5 = "";
  if (v3)
    v5 = "(critical)";
  v6[0] = 67109378;
  v6[1] = v2;
  v7 = 2080;
  v8 = v5;
  OUTLINED_FUNCTION_39(&dword_213CF1000, v0, v4, "QOS startQueryTask 1: %d %s", (uint8_t *)v6);
  OUTLINED_FUNCTION_7();
}

void __41__SPCoreSpotlightIndexer_startQueryTask___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4(&dword_213CF1000, v0, v1, "QOS startQueryTask 2: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4(&dword_213CF1000, v0, v1, "QOS _startQueryWithQueryString: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)startQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4(&dword_213CF1000, v0, v1, "QOS startQueryWithQueryString: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)taskForTopHitQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4(&dword_213CF1000, v0, v1, "QOS taskForTopHitQueryWithQueryString: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)startQuery:withContext:eventHandler:handler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_4(&dword_213CF1000, v0, v1, "QOS startQuery: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__SPCoreSpotlightIndexer__mergedTokenRewrites___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  CSRedactString(a1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0(&dword_213CF1000, a2, v4, "[rewrite] Missing variations for token %@", v5);

  OUTLINED_FUNCTION_11();
}

- (void)writeFileProviderBundleMap:fileProviderBundleIDs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Error in writing file provider information", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __47__SPCoreSpotlightIndexer_fileProviderInfoSetup__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Error in reading file provider information %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)writeData:(NSObject *)a3 toFile:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a3, (uint64_t)a3, "Could not write to file, closing it. Error: %@", (uint8_t *)a2);

}

- (void)userPerformedAction:withItem:protectionClass:forBundleID:personaID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "#apphistory ignore ineligible action, protectionClass:%@, action:%@");
  OUTLINED_FUNCTION_1();
}

- (void)userPerformedAction:withItem:protectionClass:forBundleID:personaID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "#apphistory index action, protectionClass:%@, action:%@");
  OUTLINED_FUNCTION_1();
}

void __93__SPCoreSpotlightIndexer_userPerformedAction_withItem_protectionClass_forBundleID_personaID___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Index user action error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)clientDidCheckin:protectionClass:service:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "shutting down, unavailable for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_issueDiagnose:logQuery:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_20(&dword_213CF1000, v0, v1, "#issuediagnose", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)_issueCacheCommand:xpc:searchContext:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "#issueCacheCommand %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)writeUISearchEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Error writing managed index list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

- (void)writeUISearchEnabled:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Error creating directory for managed index list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_issueCommand:outFileDescriptor:searchContext:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_24(&dword_213CF1000, v0, (uint64_t)v0, "Failed to open (error: %d) diagnostic file at %s", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_issueCommand:outFileDescriptor:searchContext:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_35();
  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 136315394;
  v5 = objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  v6 = 2112;
  v7 = v1;
  OUTLINED_FUNCTION_17(&dword_213CF1000, v0, v3, "Failed to create Spotlight diagnostic directory at %s with error %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_11();
}

- (void)_issueCommand:outFileDescriptor:searchContext:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "#issuecommand %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_3_cold_1()
{
  __assert_rtn("-[SPCoreSpotlightIndexer topKTerms:completionHandler:]_block_invoke_3", "SPCoreSpotlightIndexer.m", 16592, "keyLength > 0");
}

void __54__SPCoreSpotlightIndexer_topKTerms_completionHandler___block_invoke_4_cold_1()
{
  __assert_rtn("-[SPCoreSpotlightIndexer topKTerms:completionHandler:]_block_invoke_4", "SPCoreSpotlightIndexer.m", 16598, "termLength > 0");
}

- (void)performIndexerTask:withIndexExtensionsAndCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "Performing daemon job:%@ for bundleID:%@");
  OUTLINED_FUNCTION_1();
}

- (void)performIndexerTask:withIndexExtensionsAndCompletionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "Performing job:%@ with indexing extension for bundleID:%@");
  OUTLINED_FUNCTION_1();
}

- (void)performIndexerTask:withIndexExtensionsAndCompletionHandler:.cold.3()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "excludedBundleIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_3(&dword_213CF1000, v0, v3, "Performing job:%@ with the indexing extensions, excludedBundleIDs:%@", v4);

  OUTLINED_FUNCTION_7();
}

- (void)performIndexerTask:withIndexExtensionsAndCompletionHandler:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1(&dword_213CF1000, v0, v1, "Performing job:%@ with the indexing extensions, bundleIDs:%@");
  OUTLINED_FUNCTION_1();
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_3(&dword_213CF1000, v0, v1, "Done performing daemon job:%@ for bundleID:%@", v2);
  OUTLINED_FUNCTION_1();
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1989_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_3(&dword_213CF1000, v0, v1, "Done performing job:%@ with indexing extension for bundleID:%@", v2);
  OUTLINED_FUNCTION_1();
}

void __85__SPCoreSpotlightIndexer_performIndexerTask_withIndexExtensionsAndCompletionHandler___block_invoke_1993_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_43(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "Done performing job:%@ with the indexing extensions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchAccumulatedStorageSizeForBundleId:completionHandler:.cold.1()
{
  __assert_rtn("-[SPCoreSpotlightIndexer _fetchAccumulatedStorageSizeForBundleId:completionHandler:]", "SPCoreSpotlightIndexer.m", 17059, "completionHandler");
}

- (void)_migrateIndexExtensionsWithEnumerator:forced:migratedBundleIds:completionHandler:.cold.1()
{
  __assert_rtn("-[SPCoreSpotlightIndexer _migrateIndexExtensionsWithEnumerator:forced:migratedBundleIds:completionHandler:]", "SPCoreSpotlightIndexer.m", 17111, "completionHandler");
}

- (void)_reindexAllIdentifiersWithExtension:completionBlock:.cold.1()
{
  __assert_rtn("-[SPCoreSpotlightIndexer _reindexAllIdentifiersWithExtension:completionBlock:]", "SPCoreSpotlightIndexer.m", 17182, "extension");
}

- (void)_reindexAllIdentifiersWithExtension:completionBlock:.cold.2()
{
  __assert_rtn("-[SPCoreSpotlightIndexer _reindexAllIdentifiersWithExtension:completionBlock:]", "SPCoreSpotlightIndexer.m", 17183, "completionBlock");
}

- (void)_reindexAllItemsWithExtensionsAndCompletionBlock:.cold.1()
{
  __assert_rtn("-[SPCoreSpotlightIndexer _reindexAllItemsWithExtensionsAndCompletionBlock:]", "SPCoreSpotlightIndexer.m", 17249, "completionBlock");
}

- (void)_reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock:.cold.1()
{
  __assert_rtn("-[SPCoreSpotlightIndexer _reindexAllItemsWithExtensionsAndIdentifiersAndCompletionBlock:]", "SPCoreSpotlightIndexer.m", 17277, "completionBlock");
}

@end
