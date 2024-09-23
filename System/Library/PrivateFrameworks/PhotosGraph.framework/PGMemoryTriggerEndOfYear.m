@implementation PGMemoryTriggerEndOfYear

- (unint64_t)triggerType
{
  return 5;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v49 = 30;
      v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerEndOfYear.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v7, "localDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "universalDateFromLocalDate:inTimeZone:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v47 = (void *)v14;
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingMonths:toDate:", 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v7, "timeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localDateFromUniversalDate:inTimeZone:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v7, "localDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "components:fromDate:", 4, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 4, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "year");
    if (v23 == objc_msgSend(v22, "year"))
    {
      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v49 = 39;
        v50 = 2080;
        v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerEndOfYear.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v45 = v15;
      v46 = v8;
      v24 = (void *)MEMORY[0x1E0D4B130];
      objc_msgSend(v7, "localDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      v8 = v46;
      +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", objc_msgSend(v26, "yearFromDate:", v25), v46);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = v27;
      objc_msgSend(v27, "featureNodeCollection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "memoryNodes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = v29;
      if (objc_msgSend(v29, "count"))
      {
        v30 = (void *)MEMORY[0x1E0D4B130];
        objc_msgSend(v7, "localDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "endOfMonthForDate:", v31);
        v32 = objc_claimAutoreleasedReturnValue();

        v33 = (void *)MEMORY[0x1E0D4B130];
        objc_msgSend(v7, "localDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "startOfMonthForDate:", v34);
        v35 = objc_claimAutoreleasedReturnValue();

        v36 = (void *)objc_opt_class();
        objc_msgSend(v7, "timeZone");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)v35;
        v42 = (void *)v32;
        objc_msgSend(v36, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v35, v32, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
        {
          v15 = v45;
          v39 = v43;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v49 = 54;
            v50 = 2080;
            v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memo"
                  "ries/MemoryTriggers/PGMemoryTriggerEndOfYear.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v10 = (void *)MEMORY[0x1E0C9AA60];
        }
        else
        {
          v39 = v43;
          objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v43, v38);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v45;
        }

        v8 = v46;
      }
      else if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
      {
        v15 = v45;
        v39 = v43;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v49 = 47;
          v50 = 2080;
          v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerEndOfYear.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0C9AA60];
        v15 = v45;
        v39 = v43;
      }

    }
  }

  return v10;
}

@end
