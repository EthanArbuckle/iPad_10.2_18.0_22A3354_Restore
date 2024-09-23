@implementation PGMemoryTriggerUpcomingPersonCentricHoliday

- (id)allSingleMomentMemoryNodesInGraph:(id)a3
{
  PGGraphMemoryNodeCollection *allSingleMomentMemoryNodes;
  PGGraphMemoryNodeCollection *v5;
  PGGraphMemoryNodeCollection *v6;

  allSingleMomentMemoryNodes = self->_allSingleMomentMemoryNodes;
  if (!allSingleMomentMemoryNodes)
  {
    +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 1, a3);
    v5 = (PGGraphMemoryNodeCollection *)objc_claimAutoreleasedReturnValue();
    v6 = self->_allSingleMomentMemoryNodes;
    self->_allSingleMomentMemoryNodes = v5;

    allSingleMomentMemoryNodes = self->_allSingleMomentMemoryNodes;
  }
  return allSingleMomentMemoryNodes;
}

- (id)singleMomentMemoryNodesWithRelevantPersonNodes:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[PGMemoryTriggerUpcomingPersonCentricHoliday allSingleMomentMemoryNodesInGraph:](self, "allSingleMomentMemoryNodesInGraph:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureNodeCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "momentNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "memoryNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "collectionByIntersecting:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)triggerType
{
  return 23;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  return (id)objc_msgSend(a3, "collectionBySubtracting:");
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
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
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v49 = 62;
      v50 = 2080;
      v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerUpcomingPersonCentricHoliday.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v39 = v10;
    objc_msgSend(v9, "infoNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "partnerPersonNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "motherPersonNodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fatherPersonNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v15;
    if (objc_msgSend(v15, "count") || objc_msgSend(v16, "count") || objc_msgSend(v17, "count"))
    {
      v35 = v14;
      objc_msgSend(v8, "localDate");
      v18 = objc_claimAutoreleasedReturnValue();
      v38 = v8;
      objc_msgSend(v8, "timeZone");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)v18;
      objc_msgSend(MEMORY[0x1E0D4B130], "universalDateFromLocalDate:inTimeZone:", v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 1, v20);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:inTimeZone:");
      v21 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v20;
      objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 7, v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:inTimeZone:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[PGHolidayMemoryTrigger holidayService](self, "holidayService");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v13;
      objc_msgSend(v13, "countryCode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __100__PGMemoryTriggerUpcomingPersonCentricHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
      v41[3] = &unk_1E842DBE8;
      v41[4] = self;
      v42 = v19;
      v43 = v40;
      v44 = v9;
      v26 = v23;
      v27 = (void *)v21;
      v28 = v26;
      v45 = v26;
      v36 = v16;
      v46 = v16;
      v47 = v17;
      v29 = v19;
      objc_msgSend(v24, "enumerateEventRulesBetweenLocalDate:andLocalDate:supportedCountryCode:usingBlock:", v27, v22, v25, v41);

      v10 = v39;
      if (objc_msgSend(v39, "isCancelledWithProgress:", 1.0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v49 = 116;
          v50 = 2080;
          v51 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerUpcomingPersonCentricHoliday.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v11 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v11 = v28;
      }
      v13 = v37;

      v8 = v38;
      v16 = v36;
      v14 = v35;
    }
    else
    {
      v11 = (id)MEMORY[0x1E0C9AA60];
      v10 = v39;
    }

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleMomentMemoryNodesWithFather, 0);
  objc_storeStrong((id *)&self->_singleMomentMemoryNodesWithMother, 0);
  objc_storeStrong((id *)&self->_singleMomentMemoryNodesWithPartner, 0);
  objc_storeStrong((id *)&self->_allSingleMomentMemoryNodes, 0);
}

void __100__PGMemoryTriggerUpcomingPersonCentricHoliday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "requiredTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "peopleTrait");

  if ((unint64_t)(v7 - 1) <= 0x3F && ((1 << (v7 - 1)) & 0x8000000080000001) != 0)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (!v9)
      goto LABEL_23;
    v10 = v9;
    v11 = *(_QWORD *)v28;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "dateByAddingTimeInterval:", -86400.0, v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -604800.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "validityIntervalForLocalStartDate:localEndDate:timeZone:", v15, v14, a1[5]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        switch(v7)
        {
          case 64:
            v17 = (_QWORD *)a1[4];
            v18 = 48;
            if (!v17[6])
            {
              v19 = a1[10];
              goto LABEL_19;
            }
            break;
          case 32:
            v17 = (_QWORD *)a1[4];
            v18 = 40;
            if (!v17[5])
            {
              v19 = a1[9];
              goto LABEL_19;
            }
            break;
          case 1:
            v17 = (_QWORD *)a1[4];
            v18 = 32;
            if (!v17[4])
            {
              v19 = a1[6];
LABEL_19:
              objc_msgSend(v17, "singleMomentMemoryNodesWithRelevantPersonNodes:inGraph:", v19, a1[7]);
              v20 = objc_claimAutoreleasedReturnValue();
              v21 = a1[4];
              v22 = *(void **)(v21 + v18);
              *(_QWORD *)(v21 + v18) = v20;

            }
            break;
          default:
            goto LABEL_21;
        }
        v23 = (void *)a1[8];
        objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", *(_QWORD *)(a1[4] + v18), v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObjectsFromArray:", v24);

LABEL_21:
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (!v10)
      {
LABEL_23:

        v5 = v25;
        break;
      }
    }
  }

}

@end
