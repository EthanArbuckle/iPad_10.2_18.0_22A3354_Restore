@implementation PGMemoryTriggerBeginningOfMonth

- (PGMemoryTriggerBeginningOfMonth)initWithLoggingConnection:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4
{
  id v7;
  PGMemoryTriggerBeginningOfMonth *v8;
  PGMemoryTriggerBeginningOfMonth *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGMemoryTriggerBeginningOfMonth;
  v8 = -[PGMemoryTrigger initWithLoggingConnection:](&v11, sel_initWithLoggingConnection_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_momentNodesWithBlockedFeatureCache, a4);

  return v9;
}

- (unint64_t)triggerType
{
  return 6;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return a3;
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  PGMemoryMomentNodesWithBlockedFeatureCache *momentNodesWithBlockedFeatureCache;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  char v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t buf[4];
  int v56;
  __int16 v57;
  const char *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v10 = objc_msgSend(v9, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v52 + 24) = v10;
  if (!v10)
  {
    objc_msgSend(v7, "localDate");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 16, v12);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v12;
    if (objc_msgSend(v45, "day") <= 7)
    {
      objc_msgSend(MEMORY[0x1E0D4B130], "startOfMonthForDate:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D4B130];
      objc_msgSend(v7, "timeZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "universalDateFromLocalDate:inTimeZone:", v13, v15);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)v13;

      objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -1, v43);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D4B130];
      objc_msgSend(v7, "timeZone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localDateFromUniversalDate:inTimeZone:", v16, v18);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)v16;

      objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 12, v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v8;
      v20 = (void *)MEMORY[0x1E0D42A58];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __88__PGMemoryTriggerBeginningOfMonth_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
      v48[3] = &unk_1E84301E0;
      v50 = &v51;
      v38 = v9;
      v49 = v38;
      objc_msgSend(v20, "progressReporterWithProgressBlock:", v48);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v44, "month");
      v22 = objc_msgSend(v44, "year");
      momentNodesWithBlockedFeatureCache = self->_momentNodesWithBlockedFeatureCache;
      objc_msgSend(v7, "photoLibrary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGMemoryTrigger loggingConnection](self, "loggingConnection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGLastMonthAtHomeMemoryGenerator lastMonthAtHomeMemoriesForMonth:year:inGraph:momentNodesWithBlockedFeatureCache:photoLibrary:loggingConnection:progressReporter:](PGLastMonthAtHomeMemoryGenerator, "lastMonthAtHomeMemoriesForMonth:year:inGraph:momentNodesWithBlockedFeatureCache:photoLibrary:loggingConnection:progressReporter:", v21, v22, v19, momentNodesWithBlockedFeatureCache, v24, v25, v41);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v19;
      if (*((_BYTE *)v52 + 24))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_10:
          v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_27:

          goto LABEL_28;
        }
        *(_DWORD *)buf = 67109378;
        v56 = 59;
        v57 = 2080;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerBeginningOfMonth.m";
        v27 = MEMORY[0x1E0C81028];
LABEL_9:
        _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_10;
      }
      if (!objc_msgSend(v26, "count"))
      {
        if (*((_BYTE *)v52 + 24))
        {
          v8 = v19;
          *((_BYTE *)v52 + 24) = 1;
        }
        else
        {
          v37 = objc_msgSend(v38, "isCancelledWithProgress:", 1.0);
          *((_BYTE *)v52 + 24) = v37;
          v8 = v19;
          if ((v37 & 1) == 0)
            goto LABEL_10;
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_10;
        *(_DWORD *)buf = 67109378;
        v56 = 61;
        v57 = 2080;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerBeginningOfMonth.m";
        v27 = MEMORY[0x1E0C81028];
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0D4B130], "startOfMonthForDate:", v46);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v19;
      objc_msgSend(MEMORY[0x1E0D4B130], "dateComponentsWithLocalDate:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDay:", 7);
      objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", v30, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_opt_class();
      objc_msgSend(v7, "timeZone");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v29, v31, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (*((_BYTE *)v52 + 24))
      {
        *((_BYTE *)v52 + 24) = 1;
      }
      else
      {
        v35 = objc_msgSend(v38, "isCancelledWithProgress:", 1.0);
        *((_BYTE *)v52 + 24) = v35;
        if ((v35 & 1) == 0)
        {
          objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodesArray:withValidityInterval:", v26, v34);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

          goto LABEL_27;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v56 = 70;
        v57 = 2080;
        v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerBeginningOfMonth.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_26;
    }
    if (*((_BYTE *)v52 + 24))
    {
      *((_BYTE *)v52 + 24) = 1;
    }
    else
    {
      v28 = objc_msgSend(v9, "isCancelledWithProgress:", 1.0);
      *((_BYTE *)v52 + 24) = v28;
      if ((v28 & 1) == 0)
      {
LABEL_16:
        v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_28:

        goto LABEL_29;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v56 = 73;
      v57 = 2080;
      v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerBeginningOfMonth.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v56 = 42;
    v57 = 2080;
    v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/Mem"
          "oryTriggers/PGMemoryTriggerBeginningOfMonth.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_29:
  _Block_object_dispose(&v51, 8);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesWithBlockedFeatureCache, 0);
}

uint64_t __88__PGMemoryTriggerBeginningOfMonth_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", 0.5);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v4 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

@end
