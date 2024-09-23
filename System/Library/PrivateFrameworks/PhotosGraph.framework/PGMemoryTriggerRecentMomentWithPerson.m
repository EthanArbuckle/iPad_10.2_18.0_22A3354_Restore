@implementation PGMemoryTriggerRecentMomentWithPerson

- (unint64_t)triggerType
{
  return 10;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  void *v3;
  void *v4;

  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureNodeCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v47;
  void *v48;
  PGMemoryTriggerRecentMomentWithPerson *v49;
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
  id v60;
  _QWORD v61[4];
  id v62;
  PGMemoryTriggerRecentMomentWithPerson *v63;
  id v64;
  id v65;
  uint8_t buf[4];
  int v67;
  __int16 v68;
  const char *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v67 = 42;
      v68 = 2080;
      v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentMomentWithPerson.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v8, "localDate");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v49 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)v12;
    objc_msgSend(v13, "universalDateFromLocalDate:inTimeZone:", v12, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -10, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v15;
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -3, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localDateFromUniversalDate:inTimeZone:", v16, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)v17;
    objc_msgSend(v21, "localDateFromUniversalDate:inTimeZone:", v17, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v54 = (void *)v23;
    v55 = (void *)v20;
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v20, v23);
    objc_msgSend(v9, "dateNodesForLocalDateInterval:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "momentNodes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "personNodes");
    v26 = v10;
    v27 = objc_claimAutoreleasedReturnValue();

    v57 = (void *)v16;
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -1, v16);
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -90, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)v29;
    objc_msgSend(v30, "localDateFromUniversalDate:inTimeZone:", v29, v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)v28;
    objc_msgSend(v33, "localDateFromUniversalDate:inTimeZone:", v28, v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v47 = (void *)v35;
    v48 = (void *)v32;
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v32, v35);
    +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", v36, v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "personNodes");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)v27;
    v39 = (void *)v27;
    v10 = v26;
    objc_msgSend(v39, "collectionBySubtracting:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v9;
    objc_msgSend(v9, "meNodeCollection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "collectionBySubtracting:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __94__PGMemoryTriggerRecentMomentWithPerson_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
    v61[3] = &unk_1E842B4C8;
    v62 = v24;
    v63 = v49;
    v64 = v8;
    v44 = v43;
    v65 = v44;
    v45 = v24;
    objc_msgSend(v42, "enumerateIdentifiersAsCollectionsWithBlock:", v61);
    if (objc_msgSend(v26, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v67 = 82;
        v68 = 2080;
        v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentMomentWithPerson.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v11 = v44;
    }

    v9 = v60;
  }

  return v11;
}

void __94__PGMemoryTriggerRecentMomentWithPerson_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionByIntersecting:", v7);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "localDateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dateByAddingTimeInterval:", 864000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 259200.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 48), "timeZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v11, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "featureNodeCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "memoryNodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(void **)(a1 + 56);
  objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v16, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObjectsFromArray:", v18);

}

@end
