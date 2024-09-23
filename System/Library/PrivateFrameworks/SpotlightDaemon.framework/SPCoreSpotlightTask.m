@implementation SPCoreSpotlightTask

- (CSSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)queryID
{
  unint64_t internalQueryId;
  unint64_t queryId;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  internalQueryId = self->_queryID.internalQueryId;
  queryId = self->_queryID.queryId;
  result.var1 = internalQueryId;
  result.var0 = queryId;
  return result;
}

- (void)schedule
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "schedule query %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (SPQueryResultsQueue)resultsQueue
{
  return self->_resultsQueue;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (BOOL)addJob:(id)a3
{
  id v4;
  SPCoreSpotlightTask *v5;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = -[SPCoreSpotlightTask canceled](v5, "canceled");
    if (!v6)
      -[NSMutableArray addObject:](v5->_jobs, "addObject:", v4);
    objc_sync_exit(v5);

    v7 = !v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (__SIQuery)siQuery
{
  return self->_siQuery;
}

- (BOOL)willAsyncStart
{
  return self->_willAsyncStart;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)removeJob:(id)a3
{
  SPCoreSpotlightTask *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NSMutableArray count](v4->_jobs, "count");
  if (v5)
  {
    v6 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](v4->_jobs, "objectAtIndex:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
        break;

      if (v5 == ++v6)
        goto LABEL_7;
    }
    -[NSMutableArray removeObjectAtIndex:](v4->_jobs, "removeObjectAtIndex:", v6);

  }
LABEL_7:
  objc_sync_exit(v4);

}

- (void)finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id scheduleBlock;
  void (**v7)(_QWORD, _QWORD);
  id completionBlock;
  NSObject *v9;
  uint64_t v10;
  os_signpost_id_t v11;
  uint8_t v12[16];

  v4 = a3;
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SPCoreSpotlightTask finishWithError:].cold.1();

  self->_finished = 1;
  scheduleBlock = self->_scheduleBlock;
  self->_scheduleBlock = 0;

  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199C2F34](self->_completionBlock);
  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

  if (v7)
    ((void (**)(_QWORD, id))v7)[2](v7, v4);
  if (self->_siQuery)
  {
    SIQueryRelease();
    self->_siQuery = 0;
  }
  logForCSLogCategoryQuery();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[SPCoreSpotlightTask queryID](self, "queryID");
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_213CF1000, v9, OS_SIGNPOST_INTERVAL_END, v11, "SPCoreSpotlightLatency", (const char *)&unk_213D89001, v12, 2u);
    }
  }

}

- (void)setSiQuery:(__SIQuery *)a3
{
  self->_siQuery = a3;
}

- (SPCoreSpotlightTask)initWithQueryString:(id)a3 queryContext:(id)a4
{
  id v7;
  id v8;
  SPCoreSpotlightTask *v9;
  void *v10;
  SPQueryResultsQueue *v11;
  SPQueryResultsQueue *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  SPQueryResultsQueue *resultsQueue;
  uint64_t v17;
  NSMutableArray *v18;
  NSMutableArray *jobs;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SPCoreSpotlightTask;
  v9 = -[SPCoreSpotlightTask init](&v21, sel_init);
  if (v9)
  {
    v9->_queryID.queryId = objc_msgSend(v8, "queryID");
    objc_storeStrong((id *)&v9->_queryString, a3);
    objc_storeStrong((id *)&v9->_queryContext, a4);
    objc_msgSend(v8, "clientBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || objc_msgSend(v8, "disableResultStreaming"))
    {
      v11 = (SPQueryResultsQueue *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@.%ld.%p"), v10, objc_msgSend(v8, "queryID"), v9);
      v12 = [SPQueryResultsQueue alloc];
      +[SPQueryResultsQueue sharedInstanceDispatchQueue:](SPQueryResultsQueue, "sharedInstanceDispatchQueue:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dispatchQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SPQueryResultsQueue initWithIdentifier:dispatchQueue:](v12, "initWithIdentifier:dispatchQueue:", v11, v14);
      resultsQueue = v9->_resultsQueue;
      v9->_resultsQueue = (SPQueryResultsQueue *)v15;

    }
    else
    {
      +[SPQueryResultsQueue sharedInstanceDispatchQueue:](SPQueryResultsQueue, "sharedInstanceDispatchQueue:", 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v11 = v9->_resultsQueue;
      v9->_resultsQueue = (SPQueryResultsQueue *)v17;
    }

    -[SPQueryResultsQueue setLive:](v9->_resultsQueue, "setLive:", objc_msgSend(v8, "live"));
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    jobs = v9->_jobs;
    v9->_jobs = v18;

    v9->_critical = 0;
  }

  return v9;
}

- (void)setWillAsyncStart:(BOOL)a3
{
  self->_willAsyncStart = a3;
}

- (void)setScheduleBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setKnownBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)clientBundleID
{
  return (NSString *)-[CSSearchQueryContext clientBundleID](self->_queryContext, "clientBundleID");
}

- (void)dealloc
{
  __assert_rtn("-[SPCoreSpotlightTask dealloc]", "SPCoreSpotlightTask.m", 928, "_finished");
}

- (void)cancel
{
  SPCoreSpotlightTask *v2;
  NSMutableArray *jobs;
  NSMutableArray *v4;
  NSMutableArray *v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  SPCoreSpotlightTask *v17;
  __int16 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[SPCoreSpotlightTask setCanceled:](v2, "setCanceled:", 1);
  jobs = v2->_jobs;
  if (jobs)
  {
    v4 = jobs;
    v5 = v2->_jobs;
  }
  else
  {
    v5 = 0;
  }
  v2->_jobs = 0;

  objc_sync_exit(v2);
  v6 = -[NSMutableArray count](jobs, "count");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = jobs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "cancel", (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v8);
  }

  -[SPQueryResultsQueue cancel](v2->_resultsQueue, "cancel");
  -[SPCoreSpotlightTask resumeResults](v2, "resumeResults");
  logForCSLogCategoryQuery();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v17 = v2;
    v18 = 2048;
    v19 = v6;
    _os_log_impl(&dword_213CF1000, v11, OS_LOG_TYPE_INFO, "Canceled task:%p (%lu jobs)", buf, 0x16u);
  }

}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void)resumeResults
{
  SPCoreSpotlightTask *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[SPCoreSpotlightTask hasPausedResults](obj, "hasPausedResults"))
  {
    -[SPCoreSpotlightTask setHasPausedResults:](obj, "setHasPausedResults:", 0);
    -[SPQueryResultsQueue resumeResults](obj->_resultsQueue, "resumeResults");
  }
  objc_sync_exit(obj);

}

- (BOOL)hasPausedResults
{
  return self->_hasPausedResults;
}

- (__SIQuery)_makeSIQueryWithQueryString:(id)a3 queryContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  qos_class_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
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
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  unsigned int v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  __SIQuery *v90;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  char v99;
  void *cf;
  CFTypeRef cfa;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  uint8_t v115[4];
  uint64_t v116;
  _BYTE buf[24];
  void *v118;
  uint64_t v119;
  void *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  $F838635BB3F9A44A0CF925E26405FB30 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD v142[2];
  _QWORD v143[2];
  _QWORD v144[4];
  _QWORD v145[6];

  v145[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "filterQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v7;
  if (objc_msgSend(v7, "length"))
    v8 = v7;
  else
    v8 = 0;
  v105 = v8;
  objc_msgSend(v6, "fetchAttributes");
  cf = (void *)objc_claimAutoreleasedReturnValue();

  v107 = objc_msgSend(v6, "nonTopHitFetchAttributeIndexesBits");
  objc_msgSend(v6, "rankingQueries");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = objc_msgSend(v6, "maxCount");
  if (objc_msgSend(v6, "lowPriority"))
    v9 = 270336;
  else
    v9 = 270339;
  logForCSLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = qos_class_self();
    v12 = objc_msgSend(v6, "lowPriority");
    v13 = 3;
    if (v12)
      v13 = 0;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v11;
    *(_WORD *)&buf[8] = 2048;
    *(_QWORD *)&buf[10] = v13;
    _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_INFO, "QoS _mSIQWQS: %d prio: %lld", buf, 0x12u);
  }

  if (objc_msgSend(v6, "grouped"))
    v14 = v9 | 0x800;
  else
    v14 = v9;
  if (objc_msgSend(v6, "live"))
    v14 |= 0x400uLL;
  if (objc_msgSend(v6, "disableBlockingOnIndex"))
    v15 = v14 | 0x10000000;
  else
    v15 = v14;
  if (objc_msgSend(v6, "disableResultStreaming") && objc_msgSend(v6, "attribute"))
    v15 |= 0x20000000uLL;
  objc_msgSend(v6, "preferredLanguages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  v112 = v16;
  if (!objc_msgSend(v5, "length"))
    goto LABEL_30;
  if (!objc_msgSend(v6, "attribute"))
  {
    if (objc_msgSend(v6, "counting") && objc_msgSend(v5, "characterAtIndex:", 0) != 35)
    {
      v18 = CFSTR("#(%@)");
      goto LABEL_32;
    }
LABEL_30:
    v113 = v5;
    goto LABEL_33;
  }
  if (objc_msgSend(v5, "characterAtIndex:", 0) == 64)
    goto LABEL_30;
  v18 = CFSTR("@(%@)");
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, v5);
  v19 = objc_claimAutoreleasedReturnValue();

  v113 = (void *)v19;
LABEL_33:
  objc_msgSend(v6, "options");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("SPQueryOptionDateQueryContext"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v6, "options");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("SPQueryOptionDisableMetadataSearch"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  objc_msgSend(v6, "options");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("SPQueryOptionDisableSemanticSearch"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  objc_msgSend(v6, "options");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("SPQueryOptionDisableU2"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "BOOLValue");

  v144[0] = CFSTR("disableMetadataSearch");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v31;
  v144[1] = CFSTR("disableSemanticSearch");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v32;
  v144[2] = CFSTR("disableU2");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v145[2] = v33;
  v144[3] = CFSTR("maxANNResultCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1000);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v145[3] = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v145, v144, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "mutableCopy");

  v37 = v36;
  v38 = objc_alloc(MEMORY[0x24BDC24D8]);
  objc_msgSend(v6, "queryEmbedding");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v38, "initWithEncodedData:", v39);

  if (v40)
  {
    objc_msgSend(v40, "vectors");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v41, CFSTR("vectors"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v40, "dimension"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v42, CFSTR("vec_dimensions"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v40, "format"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v43, CFSTR("vec_data_format"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v40, "version"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v44, CFSTR("vec_version"));

  }
  v98 = v40;
  -[SPCoreSpotlightTask _pommesBundlesWithQueryContext:](self, "_pommesBundlesWithQueryContext:", v6);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientBundleID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SDPommesFeature isSearchCLIBundle:](SDPommesFeature, "isSearchCLIBundle:", v46))
    v47 = objc_msgSend(v6, "pommes");
  else
    v47 = 0;
  v48 = v113;

  if (objc_msgSend(v6, "rankingType") == 1)
    goto LABEL_45;
  v49 = objc_msgSend(v6, "internal");
  if (((v49 ^ 1 | v47) & 1) == 0)
  {
    if (!objc_msgSend(v6, "grouped"))
      goto LABEL_46;
    if (!objc_msgSend(v6, "maxCount"))
      goto LABEL_46;
    objc_msgSend(v6, "rankingQueries");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "count");

    if (!v51)
      goto LABEL_46;
LABEL_45:
    v111 = v45;
    goto LABEL_47;
  }
  if ((v49 & 1) != 0)
    goto LABEL_45;
LABEL_46:
  v111 = 0;
LABEL_47:
  objc_msgSend(v6, "filterQueries");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightTask _makeBundleQueryStringForQueryContext:](self, "_makeBundleQueryStringForQueryContext:", v6);
  v53 = objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightTask _makeAdditionalQueryStringForQueryContext:](self, "_makeAdditionalQueryStringForQueryContext:", v6);
  v54 = objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightTask _makeInstantAnswersQueryStringForQueryContext:](self, "_makeInstantAnswersQueryStringForQueryContext:", v6);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCoreSpotlightTask _makeDisabledBundlesQueryStringForQueryContext:](self, "_makeDisabledBundlesQueryStringForQueryContext:", v6);
  v55 = objc_claimAutoreleasedReturnValue();
  v56 = v55;
  v95 = (void *)v55;
  if (!v52)
  {
    if (v53)
    {
      if (v55)
      {
        v142[0] = v53;
        v142[1] = v55;
        v60 = (void *)MEMORY[0x24BDBCE30];
        v61 = v142;
        v62 = 2;
LABEL_62:
        objc_msgSend(v60, "arrayWithObjects:count:", v61, v62);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
      v141 = v53;
      v60 = (void *)MEMORY[0x24BDBCE30];
      v61 = &v141;
    }
    else
    {
      if (!v55)
      {
        v52 = 0;
        goto LABEL_63;
      }
      v140 = v55;
      v60 = (void *)MEMORY[0x24BDBCE30];
      v61 = &v140;
    }
    v62 = 1;
    goto LABEL_62;
  }
  if (!v53)
  {
    if (!v55)
      goto LABEL_63;
    v63 = v52;
    v64 = v56;
LABEL_57:
    objc_msgSend(v63, "arrayByAddingObject:", v64);
    v65 = objc_claimAutoreleasedReturnValue();

    v52 = (void *)v65;
    goto LABEL_63;
  }
  if (!v55)
  {
    v63 = v52;
    v64 = v53;
    goto LABEL_57;
  }
  v143[0] = v53;
  v143[1] = v55;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v143, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "arrayByAddingObjectsFromArray:", v57);
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = v52;
  v52 = (void *)v58;

LABEL_63:
  v66 = SIUserCtxCreateWithLanguages();
  objc_msgSend(v6, "entitledAttributes");
  SIUserCtxSetEntitlements();
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v6, "queryEmbedding");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      v68 = v15;
      v69 = v66;
      v70 = v52;
      logForCSLogCategoryIndex();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        v72 = objc_msgSend(v6, "queryID");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v72;
        _os_log_impl(&dword_213CF1000, v71, OS_LOG_TYPE_DEFAULT, "*warn* [qid=%ld][Pommes] Getting query embedding data at query execution", buf, 0xCu);
      }

      objc_msgSend(v6, "queryUnderstandingOutput");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (void *)objc_msgSend(v73, "mutableCopy");

      objc_msgSend(v6, "queryEmbedding");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setObject:forKey:", v75, CFSTR("kQPQueryEmbeddingEncodedData"));

      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setQueryUnderstandingOutput:", v76);

      v52 = v70;
      v66 = v69;
      v15 = v68;
      v48 = v113;
    }
  }
  v97 = (void *)v53;
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = ($F838635BB3F9A44A0CF925E26405FB30)0;
  v122 = 0u;
  v123 = 0u;
  v121 = 0u;
  *(_QWORD *)buf = 1;
  *(_QWORD *)&buf[8] = v48;
  v96 = (void *)v54;
  *(_QWORD *)&buf[16] = v54;
  v118 = v110;
  v119 = 0;
  objc_msgSend(v6, "completionString");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v94;
  *(_QWORD *)&v121 = objc_msgSend(v6, "completionResultCount");
  DWORD2(v121) = objc_msgSend(v6, "completionOptions");
  objc_msgSend(v6, "completionAttributes");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v122 = v93;
  objc_msgSend(v6, "completionWeights");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v122 + 1) = v92;
  objc_msgSend(v6, "scopes");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = (unint64_t)v77;
  *(_QWORD *)&v124 = cf;
  *((_QWORD *)&v124 + 1) = v66;
  cfa = (CFTypeRef)v66;
  v125.queryId = objc_msgSend(v6, "queryID");
  do
    v78 = __ldaxr((unsigned int *)&gQueryID);
  while (__stlxr(v78 + 1, (unsigned int *)&gQueryID));
  v125.internalQueryId = v78;
  *(_QWORD *)&v126 = v15;
  *((_QWORD *)&v126 + 1) = objc_msgSend(v6, "maxRankedResultCount");
  *(_QWORD *)&v127 = v103;
  objc_msgSend(v6, "groupingRules");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v127 + 1) = v79;
  *(_QWORD *)&v128 = v102;
  *((_QWORD *)&v128 + 1) = v105;
  *(_QWORD *)&v129 = 0;
  objc_msgSend(v6, "currentTime");
  *((_QWORD *)&v129 + 1) = v80;
  objc_msgSend(v6, "userQuery");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v130 = v81;
  *((_QWORD *)&v130 + 1) = v52;
  v104 = v52;
  LOWORD(v131) = objc_msgSend(v6, "strongRankingQueryCount");
  WORD1(v131) = objc_msgSend(v6, "dominantRankingQueryCount");
  WORD2(v131) = objc_msgSend(v6, "dominatedRankingQueryCount");
  WORD3(v131) = objc_msgSend(v6, "shortcutBit");
  WORD4(v131) = objc_msgSend(v6, "highMatchBit");
  WORD5(v131) = objc_msgSend(v6, "lowMatchBit");
  WORD6(v131) = objc_msgSend(v6, "highRecencyBit");
  HIWORD(v131) = objc_msgSend(v6, "lowRecencyBit");
  *(_QWORD *)&v132 = v107;
  *(_QWORD *)&v133 = objc_msgSend(v6, "fuzzyMask");
  *((_QWORD *)&v133 + 1) = v82;
  *(_QWORD *)&v134 = objc_msgSend(v6, "fuzzyMatch");
  *((_QWORD *)&v134 + 1) = v83;
  v106 = v45;
  LOBYTE(v135) = objc_msgSend(v45, "count") != 0;
  *((_QWORD *)&v135 + 1) = v111;
  objc_msgSend(v6, "rewriteContext");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "tokenRewrites");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v136 = v85;
  objc_msgSend(v6, "queryUnderstandingOutput");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v136 + 1) = v86;
  *(_QWORD *)&v137 = v37;
  v108 = v37;
  objc_msgSend(v6, "attributedUserQuery");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v137 + 1) = v87;
  objc_msgSend(v6, "clientBundleID");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v138 = v88;
  objc_msgSend(v6, "resultMatchingAttributes");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v138 + 1) = v89;
  LOBYTE(v139) = v99;
  BYTE1(v139) = objc_msgSend(v6, "computePhotosDerivedAttributes");

  v90 = (__SIQuery *)SIQueryCreateWithParameters();
  self->_queryID = v125;
  if (objc_msgSend(v6, "maximumBatchSize"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v115 = 134217984;
      v116 = objc_msgSend(v6, "maximumBatchSize");
      _os_log_impl(&dword_213CF1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Setting batching parameters corresponding to requested maximum batch size %zd", v115, 0xCu);
    }
    objc_msgSend(v6, "maximumBatchSize");
    objc_msgSend(v6, "maximumBatchSize");
    objc_msgSend(v6, "maximumBatchSize");
    SIQuerySetBatchingParameters();
  }
  if (cfa)
    CFRelease(cfa);

  return v90;
}

- (id)_makeInstantAnswersQueryStringForQueryContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "bundleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instantAnswersBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instantAnswersQueries");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") || objc_msgSend(v46, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v47 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v43 = v5;
    if (!_os_feature_enabled_impl() || v4 && objc_msgSend(v4, "count"))
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
      if (v8)
      {
        v9 = v8;
        v40 = v4;
        v10 = *(_QWORD *)v53;
        v45 = *MEMORY[0x24BDC1AE8];
        v42 = *(_QWORD *)v53;
        do
        {
          v11 = 0;
          v44 = v9;
          do
          {
            if (*(_QWORD *)v53 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v11);
            if (objc_msgSend(v5, "containsObject:", v12))
            {
              v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("(%@ == %@)"), v45, v12);
              objc_msgSend(v47, "addObject:", v13);
            }
            else
            {
              v50 = 0u;
              v51 = 0u;
              v48 = 0u;
              v49 = 0u;
              v13 = v46;
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
              if (v14)
              {
                v15 = v14;
                v16 = v7;
                v17 = *(_QWORD *)v49;
                do
                {
                  for (i = 0; i != v15; ++i)
                  {
                    if (*(_QWORD *)v49 != v17)
                      objc_enumerationMutation(v13);
                    objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "stringByReplacingOccurrencesOfString:withString:", CFSTR("<:b:>"), v12);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "addObject:", v19);

                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
                }
                while (v15);
                v10 = v42;
                v5 = v43;
                v7 = v16;
                v9 = v44;
              }
            }

            ++v11;
          }
          while (v11 != v9);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
        }
        while (v9);
        v4 = v40;
      }
    }
    else
    {
      v41 = v4;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v20 = v5;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v61;
        v24 = *MEMORY[0x24BDC1AE8];
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v61 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@ == %@)"), v24, *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v26);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
        }
        while (v22);
      }

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v7 = v46;
      v27 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v28; ++k)
          {
            if (*(_QWORD *)v57 != v29)
              objc_enumerationMutation(v7);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v31);

          }
          v28 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
        }
        while (v28);
      }
      v4 = v41;
      v5 = v43;
    }

    objc_msgSend(v47, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "componentsJoinedByString:", CFSTR(" || "));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "componentsJoinedByString:", CFSTR(" || "));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v33, "length") && objc_msgSend(v35, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("((%@) && (%@))"), v33, v35);
      v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v33)
        v37 = v33;
      else
        v37 = v35;
      v36 = v37;
    }
    v38 = v36;

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (id)_makeDisabledBundlesQueryStringForQueryContext:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "disableBundles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
          objc_msgSend(MEMORY[0x24BDC23E8], "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isFPBundleID:", v11);

          if ((v13 & 1) == 0)
          {
            if (-[NSSet containsObject:](self->_knownBundleIds, "containsObject:", v11))
            {
              objc_msgSend(v5, "addObject:", v11);
            }
            else
            {
              logForCSLogCategoryDefault();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v32 = v11;
                _os_log_debug_impl(&dword_213CF1000, v14, OS_LOG_TYPE_DEBUG, "Skipping unknown disabled bundle %@", buf, 0xCu);
              }

            }
            if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.MobileAddressBook")))
              objc_msgSend(v5, "addObject:", CFSTR("com.apple.spotlight.contacts"));
            if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.spotlight.events")))
              objc_msgSend(v5, "addObject:", CFSTR("com.apple.spotlight.events"));
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v8);
    }

    if (v5)
    {
      -[SPCoreSpotlightTask _makeBundleQueryStringForField:withBundleIDs:](self, "_makeBundleQueryStringForField:withBundleIDs:", CFSTR("_kMDItemBundleID"), v5);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    -[SPCoreSpotlightTask _makeBundleQueryStringForField:withBundleIDs:](self, "_makeBundleQueryStringForField:withBundleIDs:", CFSTR("kMDItemRelatedAppBundleIdentifier"), v5);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[SPCoreSpotlightTask _makePrefsQueryStringWithBundleIDs:](self, "_makePrefsQueryStringWithBundleIDs:", v6);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC23E8], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filterForDisabledBundles:", v6);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v21 = CFSTR("false");
    if (v20)
      v22 = v20;
    else
      v22 = CFSTR("false");
    if (v15)
      v23 = v15;
    else
      v23 = CFSTR("false");
    if (v18)
      v24 = v18;
    else
      v24 = CFSTR("false");
    if (v17)
      v21 = v17;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(!((%@) || (%@) || (%@) || ((%@) && _kMDItemBundleID!=\"com.apple.people.screenTimeRequest\")))"), v22, v23, v24, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v26;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_makeAdditionalQueryStringForQueryContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "bundleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "additionalBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "additionalQueries");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") || objc_msgSend(v31, "count"))
  {
    v27 = v3;
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v32 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v26 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v39;
      v30 = *MEMORY[0x24BDC1AE8];
      v28 = *(_QWORD *)v39;
      do
      {
        v10 = 0;
        v29 = v8;
        do
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v10);
          if (objc_msgSend(v5, "containsObject:", v11))
          {
            v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("(%@ == %@)"), v30, v11);
            objc_msgSend(v32, "addObject:", v12);
          }
          else
          {
            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            v12 = v31;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v35;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v35 != v15)
                    objc_enumerationMutation(v12);
                  objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "stringByReplacingOccurrencesOfString:withString:", CFSTR("<:b:>"), v11);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v17);

                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              }
              while (v14);
              v9 = v28;
              v8 = v29;
            }
          }

          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v8);
    }

    objc_msgSend(v32, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(" || "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(" || "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "length") && objc_msgSend(v21, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("((%@) && (%@))"), v19, v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v19)
        v23 = v19;
      else
        v23 = v21;
      v22 = v23;
    }
    v24 = v22;

    v4 = v26;
    v3 = v27;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_makeBundleQueryStringForQueryContext:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "bundleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "additionalBundleIDs");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "instantAnswersBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  v18 = (void *)v5;
  objc_msgSend(v7, "removeObjectsInArray:", v5);
  objc_msgSend(v7, "removeObjectsInArray:", v6);
  v19 = v4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    v13 = *MEMORY[0x24BDC1AE8];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("(%@ == %@)"), v13, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        objc_msgSend(v8, "addObject:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" || "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "Start query %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_jobs, 0);
  objc_storeStrong((id *)&self->_knownBundleIds, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_scheduleBlock, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_storeStrong((id *)&self->_resultsQueue, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

- (BOOL)wasCanceledByClient
{
  return self->_wasCanceledByClient;
}

- (id)_makeBundleQueryStringForField:(id)a3 withBundleIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  const __CFString *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("FieldMatch(%@, "), v5);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      v12 = 1;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          if ((v12 & 1) != 0)
            v14 = CFSTR("\"%@\");
          else
            v14 = CFSTR(", \"%@\");
          objc_msgSend(v7, "appendFormat:", v14, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
          v12 = 0;
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v12 = 0;
      }
      while (v10);
    }

    if (objc_msgSend(v8, "containsObject:", CFSTR("com.apple.MobileAddressBook"))
      && (objc_msgSend(v8, "containsObject:", CFSTR("com.apple.CoreSuggestions")) & 1) == 0)
    {
      objc_msgSend(v7, "appendString:", CFSTR(", \"com.apple.CoreSuggestions\"));
    }
    objc_msgSend(v7, "appendString:", CFSTR(")"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_makePrefsQueryStringWithBundleIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  const __CFString *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("(_kMDItemBundleID=\"com.apple.Preferences\" && FieldMatch(kMDItemTheme, "));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      v9 = 1;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          if ((v9 & 1) != 0)
            v11 = CFSTR("\"%@\");
          else
            v11 = CFSTR(", \"%@\");
          objc_msgSend(v4, "appendFormat:", v11, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v9 = 0;
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v9 = 0;
      }
      while (v7);
    }

    objc_msgSend(v4, "appendString:", CFSTR("))"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_makeFilterQueryStringForQueryContext:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "filterQueries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "length", (_QWORD)v16))
        {
          v11 = objc_msgSend(v10, "length") + 2;
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", v11);
          objc_msgSend(v12, "appendString:", CFSTR("("));
          objc_msgSend(v12, "appendString:", v10);
          objc_msgSend(v12, "appendString:", CFSTR(")"));
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" && "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_213CF1000, v14, OS_LOG_TYPE_INFO, "With filters: %@", buf, 0xCu);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_pommesBundlesWithQueryContext:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "pommes"))
  {
    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "_pommesBundlesWithQueryContext: queryContext.pommes: YES", buf, 2u);
    }

    objc_msgSend(v3, "clientBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "clientBundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = +[SDPommesFeature usingPommesRankingForClientBundle:](SDPommesFeature, "usingPommesRankingForClientBundle:", v7);

      if (v8)
      {
        objc_msgSend(v3, "clientBundleID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

      }
    }
    objc_msgSend(v3, "bundleIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v3, "bundleIDs", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            if (+[SDPommesFeature usingPommesRankingForClientBundle:](SDPommesFeature, "usingPommesRankingForClientBundle:", v17))
            {
              objc_msgSend(v4, "addObject:", v17);
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v14);
      }
    }
    else
    {
      +[SDPommesFeature allBundleIDsUsingPommesRanking](SDPommesFeature, "allBundleIDsUsingPommesRanking");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v12);
    }

  }
  logForCSLogCategoryDefault();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    if (objc_msgSend(v3, "pommes"))
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    if (objc_msgSend(v4, "count"))
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_213CF1000, v18, OS_LOG_TYPE_INFO, "_pBWQC: uP: %@, iPB: %@", buf, 0x16u);
  }

  objc_msgSend(v4, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)pauseResults
{
  *(_DWORD *)a5 = 134218240;
  *(_QWORD *)(a5 + 4) = a1;
  *(_WORD *)(a5 + 12) = 2048;
  *(_QWORD *)(a5 + 14) = a4;
  OUTLINED_FUNCTION_3(&dword_213CF1000, a6, a3, "Pause query (%lld,%lld)", (uint8_t *)a5);
}

- (void)poll
{
  -[SPQueryResultsQueue resumeResults](self->_resultsQueue, "resumeResults");
}

- (void)addMatchInfo:(_MDPlistContainer *)a3
{
  NSMutableArray *matchInfo;
  NSMutableArray *v5;
  NSMutableArray *v6;
  SPCoreSpotlightTask *obj;

  obj = self;
  objc_sync_enter(obj);
  matchInfo = obj->_matchInfo;
  if (!matchInfo)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = obj->_matchInfo;
    obj->_matchInfo = v5;

    matchInfo = obj->_matchInfo;
  }
  -[NSMutableArray addObject:](matchInfo, "addObject:", a3);
  objc_sync_exit(obj);

}

- (__CFArray)copyMatchInfo
{
  SPCoreSpotlightTask *v2;
  __CFArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (__CFArray *)-[NSMutableArray copy](v2->_matchInfo, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)setQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_queryString, a3);
}

- (void)setResultsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultsQueue, a3);
}

- (void)setQueryContext:(id)a3
{
  objc_storeStrong((id *)&self->_queryContext, a3);
}

- (void)setQueryID:(id)a3
{
  self->_queryID = ($F838635BB3F9A44A0CF925E26405FB30)a3;
}

- (void)setWasCanceledByClient:(BOOL)a3
{
  self->_wasCanceledByClient = a3;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void)setHasPausedResults:(BOOL)a3
{
  self->_hasPausedResults = a3;
}

- (id)scheduleBlock
{
  return self->_scheduleBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (NSSet)knownBundleIds
{
  return self->_knownBundleIds;
}

- (BOOL)critical
{
  return self->_critical;
}

- (void)setCritical:(BOOL)a3
{
  self->_critical = a3;
}

- (NSMutableArray)jobs
{
  return self->_jobs;
}

- (void)setJobs:(id)a3
{
  objc_storeStrong((id *)&self->_jobs, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSMutableArray)matchInfo
{
  return self->_matchInfo;
}

- (void)setMatchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_matchInfo, a3);
}

- (void)finishWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "Finish query %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
