@implementation PGMemoryTriggerBeginningOfSeason

- (unint64_t)triggerType
{
  return 8;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v45 = 32;
      v46 = 2080;
      v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerBeginningOfSeason.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "localDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x1E0D4B130], "isFirstTenDaysOfSeasonForLocalDate:", v11) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D4B130], "localStartSeasonDateForLocalDate:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D4B130];
      objc_msgSend(v7, "timeZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)v12;
      objc_msgSend(v13, "universalDateFromLocalDate:inTimeZone:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "dateByAddingTimeInterval:", -0.01);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D4B130];
      objc_msgSend(v7, "timeZone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)v16;
      objc_msgSend(v17, "localDateFromUniversalDate:inTimeZone:", v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", objc_msgSend(MEMORY[0x1E0D4B130], "yearFromDate:", v11), v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4B130], "seasonNameForLocalDate:locale:", v19, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v38 = v19;
        v39 = v15;
        v37 = v21;
        +[PGGraphSeasonNodeCollection seasonNodesForSeasonName:inGraph:](PGGraphSeasonNodeCollection, "seasonNodesForSeasonName:inGraph:", v21, v8);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "featureNodeCollection");
        v41 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "memoryNodes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v41;
        objc_msgSend(v41, "featureNodeCollection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "memoryNodes");
        v25 = objc_claimAutoreleasedReturnValue();

        v35 = (void *)v25;
        objc_msgSend(v23, "collectionByIntersecting:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = v26;
        if (objc_msgSend(v26, "count"))
        {
          objc_msgSend(MEMORY[0x1E0D4B130], "localDateIntervalOfFirstTenDaysOfSeasonForLocalDate:", v11);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_opt_class();
          objc_msgSend(v27, "startDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "endDate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timeZone");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v29, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v45 = 68;
              v46 = 2080;
              v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Me"
                    "mories/MemoryTriggers/PGMemoryTriggerBeginningOfSeason.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v10 = (void *)MEMORY[0x1E0C9AA60];
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v40, v32);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v33 = v43;
          v19 = v38;
          v20 = v41;

          v15 = v39;
          v21 = v37;
        }
        else
        {
          v19 = v38;
          if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
          {
            v15 = v39;
            v21 = v37;
            v33 = v43;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v45 = 61;
              v46 = 2080;
              v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Me"
                    "mories/MemoryTriggers/PGMemoryTriggerBeginningOfSeason.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v10 = (void *)MEMORY[0x1E0C9AA60];
          }
          else
          {
            v10 = (void *)MEMORY[0x1E0C9AA60];
            v15 = v39;
            v21 = v37;
            v33 = v43;
          }
        }

      }
      else if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
      {
        v33 = v43;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v45 = 51;
          v46 = 2080;
          v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerBeginningOfSeason.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0C9AA60];
        v33 = v43;
      }

    }
    else
    {
      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v45 = 36;
        v46 = 2080;
        v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerBeginningOfSeason.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v10;
}

@end
