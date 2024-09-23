@implementation PGMemoryTriggerRecentSyndicatedAssets

- (PGMemoryTriggerRecentSyndicatedAssets)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4 momentNodesWithBlockedFeatureCache:(id)a5
{
  id v9;
  PGMemoryTriggerRecentSyndicatedAssets *v10;
  PGMemoryTriggerRecentSyndicatedAssets *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PGMemoryTriggerRecentSyndicatedAssets;
  v10 = -[PGPhotoKitMemoryTrigger initWithLoggingConnection:photoLibrary:](&v13, sel_initWithLoggingConnection_photoLibrary_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_momentNodesWithBlockedFeatureCache, a5);

  return v11;
}

- (BOOL)supportsFutureLookup
{
  return 0;
}

- (unint64_t)triggerType
{
  return 18;
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
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  char v39;
  NSObject *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  char v46;
  char v47;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
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
  _QWORD v65[4];
  id v66;
  id v67;
  PGMemoryTriggerRecentSyndicatedAssets *v68;
  id v69;
  id v70;
  id v71;
  uint64_t *v72;
  _QWORD v73[4];
  id v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  _QWORD v80[2];
  uint8_t buf[4];
  _BYTE v82[14];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v11 = objc_msgSend(v10, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v77 + 24) = v11;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v82 = 56;
      *(_WORD *)&v82[4] = 2080;
      *(_QWORD *)&v82[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
      v12 = MEMORY[0x1E0C81028];
LABEL_29:
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  -[PGPhotoKitMemoryTrigger photoLibrary](self, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (!v14)
  {
    objc_msgSend(v8, "localDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(v8, "timeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "universalDateFromLocalDate:inTimeZone:", v15, v17);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -7, v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPhotoKitMemoryTrigger photoLibrary](self, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "librarySpecificFetchOptions");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated > %@ && dateCreated <= %@"), v62, v63);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3528];
    v80[0] = v61;
    v80[1] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setInternalPredicate:", v21);

    objc_msgSend(v64, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v64);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v59, "count");
    if (v22)
    {
      -[PGMemoryTrigger loggingConnection](self, "loggingConnection");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v82 = v22;
        _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[PGMemoryTriggerRecentSyndicatedAssets]: Found %tu recent guest", buf, 0xCu);
      }

      -[PGPhotoKitMemoryTrigger photoLibrary](self, "photoLibrary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "librarySpecificFetchOptions");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentUUIDByAssetUUIDForAssets:options:", v59, v58);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "allValues");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v57, "count"))
      {
        +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v57, v9);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v56, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addIndex:", 19);
          objc_msgSend(v25, "addIndex:", 16);
          v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          v27 = (void *)MEMORY[0x1E0D429D8];
          +[PGGraphMomentNode memoryOfMoment](PGGraphMomentNode, "memoryOfMoment");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "adjacencyWithSources:relation:targetsClass:", v56, v28, objc_opt_class());
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = (void *)MEMORY[0x1E0D42A58];
          v31 = MEMORY[0x1E0C809B0];
          v73[0] = MEMORY[0x1E0C809B0];
          v73[1] = 3221225472;
          v73[2] = __94__PGMemoryTriggerRecentSyndicatedAssets_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke;
          v73[3] = &unk_1E84301E0;
          v75 = &v76;
          v52 = v10;
          v74 = v52;
          objc_msgSend(v30, "progressReporterWithProgressBlock:", v73);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v65[0] = v31;
          v65[1] = 3221225472;
          v65[2] = __94__PGMemoryTriggerRecentSyndicatedAssets_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2;
          v65[3] = &unk_1E842D148;
          v53 = v29;
          v66 = v53;
          v33 = v25;
          v67 = v33;
          v68 = self;
          v69 = v9;
          v54 = v32;
          v70 = v54;
          v72 = &v76;
          v34 = v26;
          v71 = v34;
          objc_msgSend(v56, "enumerateIdentifiersAsCollectionsWithBlock:", v65);
          if (*((_BYTE *)v77 + 24))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v82 = 161;
              *(_WORD *)&v82[4] = 2080;
              *(_QWORD *)&v82[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v35 = (void *)MEMORY[0x1E0C9AA60];
            goto LABEL_54;
          }
          objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 5, v15);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_opt_class();
          objc_msgSend(v8, "timeZone");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v15, v51, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (*((_BYTE *)v77 + 24))
          {
            *((_BYTE *)v77 + 24) = 1;
          }
          else
          {
            v47 = objc_msgSend(v52, "isCancelledWithProgress:", 1.0);
            *((_BYTE *)v77 + 24) = v47;
            if ((v47 & 1) == 0)
            {
              v49 = (void *)objc_opt_class();
              objc_msgSend(v34, "allObjects");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "memoryTriggerResultsForMemoryNodesArray:withValidityInterval:", v50, v44);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_53:
LABEL_54:

              goto LABEL_55;
            }
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v82 = 165;
            *(_WORD *)&v82[4] = 2080;
            *(_QWORD *)&v82[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v35 = (void *)MEMORY[0x1E0C9AA60];
          goto LABEL_53;
        }
        -[PGMemoryTrigger loggingConnection](self, "loggingConnection");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v82 = v57;
          _os_log_impl(&dword_1CA237000, v40, OS_LOG_TYPE_DEFAULT, "[PGMemoryTriggerRecentSyndicatedAssets]: Couldn't find moment node for moment UUIDs: %@", buf, 0xCu);
        }

        if (*((_BYTE *)v77 + 24))
        {
          *((_BYTE *)v77 + 24) = 1;
        }
        else
        {
          v46 = objc_msgSend(v10, "isCancelledWithProgress:", 1.0);
          *((_BYTE *)v77 + 24) = v46;
          if ((v46 & 1) == 0)
          {
LABEL_48:
            v35 = (void *)MEMORY[0x1E0C9AA60];
LABEL_55:

            goto LABEL_56;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v82 = 103;
          *(_WORD *)&v82[4] = 2080;
          *(_QWORD *)&v82[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_48;
      }
      -[PGMemoryTrigger loggingConnection](self, "loggingConnection");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v38, OS_LOG_TYPE_ERROR, "[PGMemoryTriggerRecentSyndicatedAssets]: Cannot find moments featuring the guest assets available", buf, 2u);
      }

      if (*((_BYTE *)v77 + 24))
      {
        *((_BYTE *)v77 + 24) = 1;
      }
      else
      {
        v45 = objc_msgSend(v10, "isCancelledWithProgress:", 1.0);
        *((_BYTE *)v77 + 24) = v45;
        if ((v45 & 1) == 0)
        {
LABEL_44:
          v35 = (void *)MEMORY[0x1E0C9AA60];
LABEL_56:

          goto LABEL_57;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v82 = 94;
        *(_WORD *)&v82[4] = 2080;
        *(_QWORD *)&v82[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_44;
    }
    -[PGMemoryTrigger loggingConnection](self, "loggingConnection");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_DEFAULT, "[PGMemoryTriggerRecentSyndicatedAssets]: No recent guest assets available", buf, 2u);
    }

    if (*((_BYTE *)v77 + 24))
    {
      *((_BYTE *)v77 + 24) = 1;
    }
    else
    {
      v41 = objc_msgSend(v10, "isCancelledWithProgress:", 1.0);
      *((_BYTE *)v77 + 24) = v41;
      if ((v41 & 1) == 0)
      {
LABEL_38:
        v35 = (void *)MEMORY[0x1E0C9AA60];
LABEL_57:

        goto LABEL_58;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v82 = 79;
      *(_WORD *)&v82[4] = 2080;
      *(_QWORD *)&v82[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_38;
  }
  -[PGMemoryTrigger loggingConnection](self, "loggingConnection");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v36, OS_LOG_TYPE_ERROR, "[PGMemoryTriggerRecentSyndicatedAssets]: Trigger not available without a photo library.", buf, 2u);
  }

  if (*((_BYTE *)v77 + 24))
  {
    *((_BYTE *)v77 + 24) = 1;
  }
  else
  {
    v39 = objc_msgSend(v10, "isCancelledWithProgress:", 1.0);
    *((_BYTE *)v77 + 24) = v39;
    if ((v39 & 1) == 0)
      goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v82 = 59;
    *(_WORD *)&v82[4] = 2080;
    *(_QWORD *)&v82[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Memories/MemoryTriggers/PGMemoryTriggerRecentSyndicatedAssets.m";
    v12 = MEMORY[0x1E0C81028];
    goto LABEL_29;
  }
LABEL_30:
  v35 = (void *)MEMORY[0x1E0C9AA60];
LABEL_58:
  _Block_object_dispose(&v76, 8);

  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesWithBlockedFeatureCache, 0);
}

uint64_t __94__PGMemoryTriggerRecentSyndicatedAssets_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke(uint64_t a1, _BYTE *a2)
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

void __94__PGMemoryTriggerRecentSyndicatedAssets_resultsTriggeredWithContext_inGraph_progressReporter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  PGGraphMemory *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  PGGraphMemory *v19;
  PGGraphMemory *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PGGraphMemory *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  PGGraphMemory *v30;
  __int16 v31;
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "targetsForSources:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subsetWithMemoryCategories:", *(_QWORD *)(a1 + 40));
  v8 = (PGGraphMemory *)objc_claimAutoreleasedReturnValue();

  if (!-[PGGraphMemory count](v8, "count"))
  {
    objc_msgSend(v6, "momentNodesWithMinimumNumberOfExtendedCuratedAssets:", 13);
    v11 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v11, "count"))
    {
      -[NSObject interestingWithAlternateJunkingSubset](v11, "interestingWithAlternateJunkingSubset");
      v13 = objc_claimAutoreleasedReturnValue();

      if (!-[NSObject count](v13, "count"))
      {
        objc_msgSend(*(id *)(a1 + 48), "loggingConnection");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "anyNode");
          v19 = (PGGraphMemory *)objc_claimAutoreleasedReturnValue();
          v29 = 138412290;
          v30 = v19;
          _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "[PGMemoryTriggerRecentSyndicatedAssets]: interestingWithAlternateJunking failed for moment %@", (uint8_t *)&v29, 0xCu);

        }
        v11 = v13;
        goto LABEL_18;
      }
      -[NSObject subsetWithEnoughScenesProcessed](v13, "subsetWithEnoughScenesProcessed");
      v11 = objc_claimAutoreleasedReturnValue();

      v14 = -[NSObject count](v11, "count");
      v15 = *(id **)(a1 + 48);
      if (v14)
      {
        objc_msgSend(v15[3], "momentNodesWithBlockedFeatureInGraph:progressReporter:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
        v16 = objc_claimAutoreleasedReturnValue();
        v12 = v16;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
        {
          *a4 = 1;
          goto LABEL_18;
        }
        if (!-[NSObject containsCollection:](v16, "containsCollection:", v6))
        {
          objc_msgSend(v6, "featureNodeCollection");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "dateNodes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "monthDayNodes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "featureNodeCollection");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "collectionByFormingUnionWith:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = -[PGGraphMemory initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:]([PGGraphMemory alloc], "initWithMemoryCategory:memoryCategorySubcategory:momentNodes:featureNodes:", 1, 1001, v11, v25);
          objc_msgSend(*(id *)(a1 + 72), "addObject:", v26);
          objc_msgSend(*(id *)(a1 + 48), "loggingConnection");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "anyNode");
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = 138412546;
            v30 = v26;
            v31 = 2112;
            v32 = v28;
            _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_DEFAULT, "[PGMemoryTriggerRecentSyndicatedAssets]: Created Memory %@ for %@", (uint8_t *)&v29, 0x16u);

          }
          goto LABEL_18;
        }
        objc_msgSend(*(id *)(a1 + 48), "loggingConnection");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "anyNode");
          v20 = (PGGraphMemory *)objc_claimAutoreleasedReturnValue();
          v29 = 138412290;
          v30 = v20;
          _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGMemoryTriggerRecentSyndicatedAssets]: Moment has blocked feature %@", (uint8_t *)&v29, 0xCu);

        }
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v15, "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        goto LABEL_18;
      objc_msgSend(v6, "anyNode");
      v17 = objc_claimAutoreleasedReturnValue();
      v29 = 138412290;
      v30 = (PGGraphMemory *)v17;
      v18 = "[PGMemoryTriggerRecentSyndicatedAssets]: Not enough scene processed assets for moment %@";
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        goto LABEL_18;
      objc_msgSend(v6, "anyNode");
      v17 = objc_claimAutoreleasedReturnValue();
      v29 = 138412290;
      v30 = (PGGraphMemory *)v17;
      v18 = "[PGMemoryTriggerRecentSyndicatedAssets]: Not enough assets for moment %@";
    }
    _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v29, 0xCu);
    goto LABEL_17;
  }
  v9 = *(void **)(a1 + 72);
  -[PGGraphMemory set](v8, "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v10);

  objc_msgSend(*(id *)(a1 + 48), "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "anyNode");
    v12 = objc_claimAutoreleasedReturnValue();
    v29 = 138412546;
    v30 = v8;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_DEFAULT, "[PGMemoryTriggerRecentSyndicatedAssets]: Found Memories %@ for %@", (uint8_t *)&v29, 0x16u);
LABEL_18:

  }
}

@end
