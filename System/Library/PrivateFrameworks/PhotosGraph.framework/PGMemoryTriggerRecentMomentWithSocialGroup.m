@implementation PGMemoryTriggerRecentMomentWithSocialGroup

- (unint64_t)triggerType
{
  return 13;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  void *v3;
  void *v4;

  +[PGGraphNodeCollection subsetInCollection:](PGGraphSocialGroupNodeCollection, "subsetInCollection:", a3);
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
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  PGGraphSocialGroupNodeCollection *v44;
  void *v45;
  id v46;
  id v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  PGMemoryTriggerRecentMomentWithSocialGroup *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  PGMemoryTriggerRecentMomentWithSocialGroup *v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  uint8_t buf[4];
  int v72;
  __int16 v73;
  const char *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v72 = 39;
      v73 = 2080;
      v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerRecentMomentWithSocialGroup.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v59 = self;
    objc_msgSend(v8, "localDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "universalDateFromLocalDate:inTimeZone:", v12, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)v15;
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -3, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localDateFromUniversalDate:inTimeZone:", v16, v19);
    v20 = v9;
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)v17;
    objc_msgSend(v22, "localDateFromUniversalDate:inTimeZone:", v17, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc(MEMORY[0x1E0CB3588]);
    v60 = (void *)v24;
    v61 = (void *)v21;
    v26 = v21;
    v9 = v20;
    v27 = (void *)objc_msgSend(v25, "initWithStartDate:endDate:", v26, v24);
    +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", v27, v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "socialGroupNodes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "count"))
    {
      v56 = v27;
      v57 = v16;
      v58 = v12;
      objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -1, v16);
      v30 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -90, v30);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0D4B130];
      objc_msgSend(v8, "timeZone");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)v31;
      v34 = v31;
      v35 = (void *)v30;
      objc_msgSend(v32, "localDateFromUniversalDate:inTimeZone:", v34, v33);
      v36 = objc_claimAutoreleasedReturnValue();

      v37 = (void *)MEMORY[0x1E0D4B130];
      objc_msgSend(v8, "timeZone");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localDateFromUniversalDate:inTimeZone:", v35, v38);
      v39 = objc_claimAutoreleasedReturnValue();

      v52 = (void *)v39;
      v53 = (void *)v36;
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v36, v39);
      +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "socialGroupNodes");
      v55 = v29;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "collectionBySubtracting:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_alloc_init(MEMORY[0x1E0D429B0]);
      v42 = MEMORY[0x1E0C809B0];
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __99__PGMemoryTriggerRecentMomentWithSocialGroup_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
      v69[3] = &unk_1E842B970;
      v43 = v41;
      v70 = v43;
      objc_msgSend(v40, "enumerateIdentifiersAsCollectionsWithBlock:", v69);
      v44 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphSocialGroupNodeCollection alloc], "initWithGraph:elementIdentifiers:", v9, v43);
      objc_msgSend(v40, "collectionBySubtracting:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v64[0] = v42;
      v64[1] = 3221225472;
      v64[2] = __99__PGMemoryTriggerRecentMomentWithSocialGroup_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
      v64[3] = &unk_1E8428370;
      v65 = v28;
      v66 = v59;
      v67 = v8;
      v47 = v46;
      v68 = v47;
      objc_msgSend(v45, "enumerateIdentifiersAsCollectionsWithBlock:", v64);
      if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v72 = 96;
          v73 = 2080;
          v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerRecentMomentWithSocialGroup.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v11 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v11 = v47;
      }

      v16 = v57;
      v12 = v58;
      v29 = v55;
      v27 = v56;
    }
    else
    {
      if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v72 = 55;
        v73 = 2080;
        v74 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerRecentMomentWithSocialGroup.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v11 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  return v11;
}

void __99__PGMemoryTriggerRecentMomentWithSocialGroup_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "personNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "elementIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionWithIdentifierSet:", v7);

  }
}

void __99__PGMemoryTriggerRecentMomentWithSocialGroup_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
  id v18;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionByFormingUnionWith:", v6);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "localDateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dateByAddingTimeInterval:", 864000.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 259200.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 48), "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v10, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "featureNodeCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "memoryNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(void **)(a1 + 56);
  objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v15, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v17);

}

@end
