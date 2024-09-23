@implementation PGMemoryTriggerRecentHighlights

- (PGMemoryTriggerRecentHighlights)initWithLoggingConnection:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4
{
  id v7;
  PGMemoryTriggerRecentHighlights *v8;
  PGMemoryTriggerRecentHighlights *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGMemoryTriggerRecentHighlights;
  v8 = -[PGMemoryTrigger initWithLoggingConnection:](&v11, sel_initWithLoggingConnection_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_momentNodesWithBlockedFeatureCache, a4);

  return v9;
}

- (unint64_t)triggerType
{
  return 16;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return a3;
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  PGMemoryDate *v16;
  id v17;
  void *v18;
  double v19;
  uint64_t v20;
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
  unint64_t v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  char v41;
  char v42;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  PGGraphMemory *v48;
  void *v49;
  PGGraphMemory *v50;
  void *v51;
  char v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[4];
  id v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  PGGraphMemory *v73;
  uint8_t buf[4];
  int v75;
  __int16 v76;
  const char *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v11 = objc_msgSend(v10, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v70 + 24) = v11;
  if (!v11)
  {
    objc_msgSend(v8, "localDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "creationDateOfLastMemory");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -92, v13);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0D4B130], "startOfDayForDate:", v63);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)objc_msgSend(v14, "initWithStartDate:endDate:", v15, v13);

    if (v65)
    {
      v16 = -[PGMemoryDate initWithLocalDate:]([PGMemoryDate alloc], "initWithLocalDate:", v13);
      v17 = objc_alloc(MEMORY[0x1E0CB3588]);
      -[PGMemoryDate universalDateInTimeZone:](v16, "universalDateInTimeZone:", v61);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (void *)objc_msgSend(v17, "initWithStartDate:endDate:", v65, v18);

      objc_msgSend(v64, "duration");
      v20 = (uint64_t)(v19 / 86400.0);
      if (v20 <= 20)
      {
        v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_36:

        goto LABEL_37;
      }
      if ((unint64_t)v20 <= 0x5C)
      {
        v21 = (void *)MEMORY[0x1E0D4B130];
        objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:inTimeZone:", v65, v61);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "startOfDayForDate:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v23, v13);
        v62 = (void *)v24;
      }

    }
    +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", v62, v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "subsetHappeningAtSensitiveLocation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryGeneratorUtils momentNodesAtHomeOrWorkOrFrequentLocationInGraph:](PGMemoryGeneratorUtils, "momentNodesAtHomeOrWorkOrFrequentLocationInGraph:", v9);
    v64 = v26;
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "collectionBySubtracting:");
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "collectionBySubtracting:", v27);
    v16 = (PGMemoryDate *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)v27;

    -[PGMemoryDate highlightNodes](v16, "highlightNodes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "highlightGroupNodes");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v60, "count"))
    {
      +[PGGraphHighlightTypeNodeCollection longTripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "longTripTypeNodesInGraph:", v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "highlightGroupNodes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "collectionByIntersecting:", v60);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "featureNodeCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "memoryNodes");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "subsetWithMemoryCategory:", 19);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v34, "count"))
      {
        objc_msgSend((id)objc_opt_class(), "singleDayValidityIntervalWithContext:", v8);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (*((_BYTE *)v70 + 24))
        {
          *((_BYTE *)v70 + 24) = 1;
        }
        else
        {
          v41 = objc_msgSend(v10, "isCancelledWithProgress:", 1.0);
          *((_BYTE *)v70 + 24) = v41;
          if ((v41 & 1) == 0)
          {
            objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v34, v35);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

            goto LABEL_35;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v75 = 93;
          v76 = 2080;
          v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerRecentHighlights.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v12 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_30;
      }

    }
    v36 = -[PGMemoryDate numberOfAssets](v16, "numberOfAssets");
    if ((unint64_t)-[PGMemoryDate count](v16, "count") >= 3 && v36 > 0xE)
    {
      v37 = (void *)MEMORY[0x1E0D42A58];
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __88__PGMemoryTriggerRecentHighlights_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
      v66[3] = &unk_1E84301E0;
      v68 = &v69;
      v38 = v10;
      v67 = v38;
      objc_msgSend(v37, "progressReporterWithProgressBlock:", v66);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGMemoryMomentNodesWithBlockedFeatureCache momentNodesWithBlockedFeatureInGraph:progressReporter:](self->_momentNodesWithBlockedFeatureCache, "momentNodesWithBlockedFeatureInGraph:progressReporter:", v9, v39);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v70 + 24))
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
LABEL_22:
          v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_23:

LABEL_35:
          goto LABEL_36;
        }
        *(_DWORD *)buf = 67109378;
        v75 = 109;
        v76 = 2080;
        v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentHighlights.m";
        v40 = MEMORY[0x1E0C81028];
LABEL_21:
        _os_log_impl(&dword_1CA237000, v40, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_22;
      }
      -[PGMemoryDate collectionBySubtracting:](v16, "collectionBySubtracting:", v56);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "interestingForMemoriesSubset");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "momentNodesWithContentScoreAbove:", 0.5);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "momentNodesWithMinimumNumberOfPersons:", 1);
      v16 = (PGMemoryDate *)objc_claimAutoreleasedReturnValue();

      v47 = -[PGMemoryDate numberOfAssets](v16, "numberOfAssets");
      if ((unint64_t)-[PGMemoryDate count](v16, "count") < 3 || v47 <= 0xE)
      {
        if (*((_BYTE *)v70 + 24))
        {
          *((_BYTE *)v70 + 24) = 1;
        }
        else
        {
          v52 = objc_msgSend(v38, "isCancelledWithProgress:", 1.0);
          *((_BYTE *)v70 + 24) = v52;
          if ((v52 & 1) == 0)
            goto LABEL_22;
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_22;
        *(_DWORD *)buf = 67109378;
        v75 = 118;
        v76 = 2080;
        v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentHighlights.m";
        v40 = MEMORY[0x1E0C81028];
        goto LABEL_21;
      }
      v48 = [PGGraphMemory alloc];
      -[PGMemoryDate featureNodeCollection](v16, "featureNodeCollection");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:](v48, "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", 24, 5002, v16, v49);

      objc_msgSend((id)objc_opt_class(), "singleDayValidityIntervalWithContext:", v8);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v70 + 24))
      {
        *((_BYTE *)v70 + 24) = 1;
      }
      else
      {
        v53 = objc_msgSend(v38, "isCancelledWithProgress:", 1.0);
        *((_BYTE *)v70 + 24) = v53;
        if ((v53 & 1) == 0)
        {
          v54 = (void *)objc_opt_class();
          v73 = v50;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "memoryTriggerResultsForMemoryNodesArray:withValidityInterval:", v55, v51);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_52:
          goto LABEL_23;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v75 = 125;
        v76 = 2080;
        v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentHighlights.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v12 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_52;
    }
    if (*((_BYTE *)v70 + 24))
    {
      *((_BYTE *)v70 + 24) = 1;
    }
    else
    {
      v42 = objc_msgSend(v10, "isCancelledWithProgress:", 1.0);
      *((_BYTE *)v70 + 24) = v42;
      if ((v42 & 1) == 0)
      {
LABEL_34:
        v12 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_35;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v75 = 101;
      v76 = 2080;
      v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentHighlights.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v75 = 52;
    v76 = 2080;
    v77 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/Mem"
          "oryTriggers/PGMemoryTriggerRecentHighlights.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_37:
  _Block_object_dispose(&v69, 8);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesWithBlockedFeatureCache, 0);
}

uint64_t __88__PGMemoryTriggerRecentHighlights_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, _BYTE *a2)
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
