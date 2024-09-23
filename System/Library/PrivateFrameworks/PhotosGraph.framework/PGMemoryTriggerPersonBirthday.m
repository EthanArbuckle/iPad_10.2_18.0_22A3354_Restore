@implementation PGMemoryTriggerPersonBirthday

- (unint64_t)triggerType
{
  return 2;
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
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  PGGraphMemoryNodeCollection *v24;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v34 = 33;
      v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/M"
            "emoryTriggers/PGMemoryTriggerPersonBirthday.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v7, "localDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMonthDayNodeCollection monthDayNodesForLocalDate:inGraph:](PGGraphMonthDayNodeCollection, "monthDayNodesForLocalDate:inGraph:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "birthdayPersonNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphFeatureNodeCollection memoryOfFeature](PGGraphFeatureNodeCollection, "memoryOfFeature");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "adjacencyWithSources:relation:targetsClass:", v13, v15, objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "sourcesCount"))
    {
      +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 3, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "intersectingTargetsWith:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "sourcesCount"))
      {
        v29 = v17;
        +[PGGraphNodeCollection nodesInGraph:](PGGraphOverTheYearsNodeCollection, "nodesInGraph:", v8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "featureNodeCollection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "memoryNodes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_alloc_init(MEMORY[0x1E0D429B0]);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __86__PGMemoryTriggerPersonBirthday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
        v30[3] = &unk_1E842EAB0;
        v27 = v20;
        v31 = v27;
        v22 = v21;
        v32 = v22;
        objc_msgSend(v18, "enumerateTargetsBySourceWithBlock:", v30);
        if (objc_msgSend(v22, "count"))
        {
          v26 = v12;
          objc_msgSend((id)objc_opt_class(), "singleDayValidityIntervalWithContext:", v7);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphMemoryNodeCollection alloc], "initWithGraph:elementIdentifiers:", v8, v22);
          if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v34 = 71;
              v35 = 2080;
              v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Me"
                    "mories/MemoryTriggers/PGMemoryTriggerPersonBirthday.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v10 = (void *)MEMORY[0x1E0C9AA60];
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "memoryTriggerResultsForMemoryNodes:withValidityInterval:", v24, v23);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }

          v17 = v29;
          v12 = v26;
        }
        else if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0))
        {
          v17 = v29;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v34 = 65;
            v35 = 2080;
            v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memo"
                  "ries/MemoryTriggers/PGMemoryTriggerPersonBirthday.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v10 = (void *)MEMORY[0x1E0C9AA60];
        }
        else
        {
          v10 = (void *)MEMORY[0x1E0C9AA60];
          v17 = v29;
        }

      }
      else
      {
        if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0)
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v34 = 46;
          v35 = 2080;
          v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memori"
                "es/MemoryTriggers/PGMemoryTriggerPersonBirthday.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      if (objc_msgSend(v9, "isCancelledWithProgress:", 1.0)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v34 = 39;
        v35 = 2080;
        v36 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories"
              "/MemoryTriggers/PGMemoryTriggerPersonBirthday.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
      v18 = v16;
    }

  }
  return v10;
}

void __86__PGMemoryTriggerPersonBirthday_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "collectionByIntersecting:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = *(void **)(a1 + 40);
  v7 = v5 == 0;
  v8 = v10;
  if (!v7)
    v8 = v4;
  objc_msgSend(v8, "elementIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionWithIdentifierSet:", v9);

}

@end
