@implementation PLAssetCollectionGenerator

- (PLAssetCollectionGenerator)initWithDataManager:(id)a3 frequentLocationManager:(id)a4 localCreationDateCreator:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLAssetCollectionGenerator *v11;
  PLAssetCollectionGenerator *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PLAssetCollectionGenerator;
  v11 = -[PLAssetCollectionGenerator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_manager, v8);
    objc_storeStrong((id *)&v12->_frequentLocationManager, a4);
    objc_storeStrong((id *)&v12->_localCreationDateCreator, a5);
  }

  return v12;
}

- (id)processMomentsWithAssets:(id)a3 affectedMoments:(id)a4
{
  id v6;
  id v7;
  PLAssetCollectionGenerator *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetCollectionGenerator setUsedMomentObjectIDs:](v8, "setUsedMomentObjectIDs:", v9);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetCollectionGenerator setInsertedOrUpdatedMoments:](v8, "setInsertedOrUpdatedMoments:", v10);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetCollectionGenerator setMomentsFromAssetClusters:](v8, "setMomentsFromAssetClusters:", v11);

  -[PLAssetCollectionGenerator _processMomentsCollectionsYearsWithAssets:affectedMoments:](v8, "_processMomentsCollectionsYearsWithAssets:affectedMoments:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  return v12;
}

- (id)_processMomentsCollectionsYearsWithAssets:(id)a3 affectedMoments:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  PLLibraryClusterer *v15;
  void *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  id WeakRetained;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint32_t numer;
  uint32_t denom;
  NSObject *v50;
  NSObject *v51;
  float v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint32_t v66;
  uint32_t v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  PLAssetCollectionGenerationResult *v74;
  os_signpost_id_t spid;
  os_signpost_id_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  unint64_t v81;
  NSObject *v82;
  id v83;
  void *v84;
  void *v85;
  unint64_t v86;
  void *v87;
  PLLibraryClusterer *v88;
  void *v89;
  id obj;
  _BOOL4 v91;
  PLAssetCollectionGenerator *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105;
  id v106;
  mach_timebase_info v107;
  mach_timebase_info info;
  uint8_t v109[128];
  uint8_t buf[4];
  const char *v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  double v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v83 = a4;
  PLMomentGenerationGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  v86 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MomentCollectionYearClustering", ", buf, 2u);
  }

  v79 = mach_absolute_time();
  v11 = v10;
  v12 = os_signpost_id_generate(v11);
  v107 = 0;
  mach_timebase_info(&v107);
  v13 = v11;
  v14 = v13;
  v81 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MomentClustering", ", buf, 2u);
  }
  spid = v12;
  v80 = v14;

  v78 = mach_absolute_time();
  v15 = -[PLLibraryClusterer initWithLocalCreationDateCreator:frequentLocationManager:]([PLLibraryClusterer alloc], "initWithLocalCreationDateCreator:frequentLocationManager:", self->_localCreationDateCreator, self->_frequentLocationManager);
  -[PLLibraryClusterer setDelegate:](v15, "setDelegate:", self);
  -[PLLibraryClusterer processMomentsWithAssets:](v15, "processMomentsWithAssets:", v6);
  -[PLAssetCollectionGenerator manager](self, "manager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0;
  objc_msgSend(v16, "allMomentsWithError:", &v106);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (char *)v106;

  -[PLAssetCollectionGenerator manager](self, "manager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)v17;
  objc_msgSend((id)objc_opt_class(), "processingMomentsFromMoments:", v17);
  v20 = objc_claimAutoreleasedReturnValue();

  v84 = (void *)v20;
  v21 = -[PLFrequentLocationManager frequentLocationsDidChangeFromUpdateWithAllMoments:](self->_frequentLocationManager, "frequentLocationsDidChangeFromUpdateWithAllMoments:", v20);
  if (v18)
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v111 = v18;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Error fetching all moments. %@", buf, 0xCu);
    }

    v23 = 0;
  }
  else
  {
    v23 = v21;
  }
  -[PLAssetCollectionGenerator insertedOrUpdatedMoments](self, "insertedOrUpdatedMoments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");

  v92 = self;
  v88 = v15;
  v89 = v6;
  v77 = v8;
  if (v23)
  {

    -[PLAssetCollectionGenerator manager](self, "manager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = 0;
    objc_msgSend(v26, "momentsRequiringLocationProcessingWhenFrequentLocationsChangedWithError:", &v105);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (const char *)v105;

    if (v28)
    {
      PLBackendGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v111 = v28;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Error fetching moments requiring location processing when frequent locations change. %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v27, "count"))
      objc_msgSend(v25, "addObjectsFromArray:", v27);
    v85 = (void *)v28;

  }
  else
  {
    v85 = v18;
  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v25;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
  v91 = v23;
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v102 != v32)
          objc_enumerationMutation(obj);
        v34 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i);
        v35 = (void *)MEMORY[0x19AEC1554]();
        WeakRetained = objc_loadWeakRetained((id *)&v92->_manager);
        -[PLFrequentLocationManager currentFrequentLocations](v92->_frequentLocationManager, "currentFrequentLocations");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLMomentGenerationUtils processLocationIfNecessaryInMoment:usingManager:frequentLocations:frequentLocationsDidChange:](PLMomentGenerationUtils, "processLocationIfNecessaryInMoment:usingManager:frequentLocations:frequentLocationsDidChange:", v34, WeakRetained, v37, v23);

        objc_autoreleasePoolPop(v35);
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
    }
    while (v31);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  -[PLAssetCollectionGenerator momentsFromAssetClusters](v92, "momentsFromAssetClusters");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v97, v116, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v98;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v98 != v42)
          objc_enumerationMutation(v39);
        v44 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * j);
        v45 = (void *)MEMORY[0x19AEC1554]();
        -[PLLibraryClusterer locationBasedMomentClustersForMomentsSortedByDate:](v88, "locationBasedMomentClustersForMomentsSortedByDate:", v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObjectsFromArray:", v46);

        objc_autoreleasePoolPop(v45);
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v97, v116, 16);
    }
    while (v41);
  }

  v47 = mach_absolute_time();
  numer = v107.numer;
  denom = v107.denom;
  v50 = v80;
  v51 = v50;
  if (v81 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v51, OS_SIGNPOST_INTERVAL_END, spid, "MomentClustering", "processMoments done.", buf, 2u);
  }

  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    v52 = (float)((float)((float)(v47 - v78) * (float)numer) / (float)denom) / 1000000.0;
    v53 = (void *)MEMORY[0x1E0CB3940];
    v54 = v51;
    objc_msgSend(v53, "stringWithFormat:", CFSTR("processMoments done."));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v111 = "MomentClustering";
    v112 = 2112;
    v113 = (uint64_t)v55;
    v114 = 2048;
    v115 = v52;
    _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  v82 = v51;
  -[PLAssetCollectionGenerator insertedOrUpdatedMoments](v92, "insertedOrUpdatedMoments");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v56, "mutableCopy");
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v58 = v83;
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v94;
    do
    {
      for (k = 0; k != v60; ++k)
      {
        if (*(_QWORD *)v94 != v61)
          objc_enumerationMutation(v58);
        v63 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * k);
        if ((objc_msgSend(v56, "containsObject:", v63) & 1) == 0)
        {
          v64 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v57, "addObject:", v63);
          -[PLAssetCollectionGenerator _cleanUpMoment:](v92, "_cleanUpMoment:", v63);
          objc_autoreleasePoolPop(v64);
        }
      }
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
    }
    while (v60);
  }

  v65 = mach_absolute_time();
  v66 = info.numer;
  v67 = info.denom;
  v68 = v82;
  v69 = v68;
  if (v86 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
  {
    v70 = objc_msgSend(v89, "count");
    v71 = objc_msgSend(v57, "count");
    *(_DWORD *)buf = 134218240;
    v111 = (const char *)v70;
    v112 = 2048;
    v113 = v71;
    _os_signpost_emit_with_name_impl(&dword_199541000, v69, OS_SIGNPOST_INTERVAL_END, v77, "MomentCollectionYearClustering", "assets %lu, created moments %lu", buf, 0x16u);
  }

  v72 = v69;
  if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("assets %lu, created moments %lu"), objc_msgSend(v89, "count"), objc_msgSend(v57, "count"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v111 = "MomentCollectionYearClustering";
    v112 = 2112;
    v113 = (uint64_t)v73;
    v114 = 2048;
    v115 = (float)((float)((float)((float)(v65 - v79) * (float)v66) / (float)v67) / 1000000.0);
    _os_log_impl(&dword_199541000, v72, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  v74 = -[PLAssetCollectionGenerationResult initWithInsertedOrUpdatedMoments:frequentLocationsDidChange:]([PLAssetCollectionGenerationResult alloc], "initWithInsertedOrUpdatedMoments:frequentLocationsDidChange:", v57, v91);

  return v74;
}

- (id)_createMomentOrUpdateForAssetCluster:(id)a3 existingMomentDataForAssets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[PLAssetCollectionGenerator manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetCollectionGenerator usedMomentObjectIDs](self, "usedMomentObjectIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetCollectionGenerator debugDateFormatter](self, "debugDateFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_createMomentOrUpdateForAssetCluster:existingMomentDataForAssets:dataManager:usedMomentObjectIDs:debugDateFormatter:", v7, v6, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_cleanUpMoment:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "isDeleted") & 1) == 0)
  {
    objc_msgSend(v3, "assets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5 >= 1)
    {
      if (objc_msgSend(v3, "cachedCount") == v5)
      {
LABEL_32:

        goto LABEL_33;
      }
      v21 = v5;
      v23 = v3;
      objc_msgSend(v3, "recalculateSharedAssetContainerCachedValues");
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v22 = v4;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = *(_QWORD *)v25;
        while (1)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v6);
            v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if ((objc_msgSend(v15, "isDeleted") & 1) == 0)
            {
              if (objc_msgSend(v15, "isPhoto"))
                v11 = (v11 + 1);
              else
                v12 = v12 + objc_msgSend(v15, "isVideo");
              objc_msgSend(v15, "pl_date");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v16;
              if (v9)
              {
                objc_msgSend(v9, "earlierDate:", v16);
                v18 = objc_claimAutoreleasedReturnValue();

                v9 = (id)v18;
                if (v10)
                  goto LABEL_15;
LABEL_17:
                v10 = v17;
              }
              else
              {
                v9 = v16;
                if (!v10)
                  goto LABEL_17;
LABEL_15:
                objc_msgSend(v10, "laterDate:", v17);
                v19 = objc_claimAutoreleasedReturnValue();

                v10 = (id)v19;
              }

              continue;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (!v8)
            goto LABEL_23;
        }
      }
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
LABEL_23:

      v3 = v23;
      objc_msgSend(v23, "setCachedPhotosCount:", v11);
      objc_msgSend(v23, "setCachedVideosCount:", v12);
      if (v9 && v10)
      {
        objc_msgSend(v23, "setStartDate:", v9);
        objc_msgSend(v23, "setEndDate:", v10);
        objc_msgSend(v23, "setRepresentativeDate:", v9);
        v5 = v21;
        v4 = v22;
      }
      else
      {
        PLMomentsGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        v5 = v21;
        v4 = v22;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v23;
          v30 = 2112;
          v31 = v6;
          _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Moment %@ given a nil date for assets %@", buf, 0x16u);
        }

      }
    }
    if (!v5)
      objc_msgSend(v3, "delete");
    goto LABEL_32;
  }
LABEL_33:

}

- (id)dataManager
{
  return objc_loadWeakRetained((id *)&self->_manager);
}

- (void)logRoutineInformation
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "logRoutineInformation");

}

- (id)libraryClusterer:(id)a3 createMomentClustersForAssetClusters:(id)a4 existingMomentDataForAssets:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x19AEC1554](v11);
        -[PLAssetCollectionGenerator _createMomentOrUpdateForAssetCluster:existingMomentDataForAssets:](self, "_createMomentOrUpdateForAssetCluster:existingMomentDataForAssets:", v15, v9, v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          -[PLAssetCollectionGenerator insertedOrUpdatedMoments](self, "insertedOrUpdatedMoments");
          v18 = v10;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v17);

          -[PLAssetCollectionGenerator usedMomentObjectIDs](self, "usedMomentObjectIDs");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uniqueObjectID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v21);

          v10 = v18;
          objc_msgSend(v18, "addObject:", v17);
        }

        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v12 = v11;
    }
    while (v11);
  }

  -[PLAssetCollectionGenerator momentsFromAssetClusters](self, "momentsFromAssetClusters");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v10);

  return v10;
}

- (NSDateFormatter)debugDateFormatter
{
  NSDateFormatter *debugDateFormatter;
  NSDateFormatter *v4;
  void *v5;
  NSDateFormatter *v6;

  debugDateFormatter = self->_debugDateFormatter;
  if (!debugDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SS"));
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v4, "setTimeZone:", v5);

    v6 = self->_debugDateFormatter;
    self->_debugDateFormatter = v4;

    debugDateFormatter = self->_debugDateFormatter;
  }
  return debugDateFormatter;
}

- (PLMomentGenerationDataManagement)manager
{
  return (PLMomentGenerationDataManagement *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (PLFrequentLocationManager)frequentLocationManager
{
  return self->_frequentLocationManager;
}

- (void)setFrequentLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_frequentLocationManager, a3);
}

- (PLLocalCreationDateCreator)localCreationDateCreator
{
  return self->_localCreationDateCreator;
}

- (void)setLocalCreationDateCreator:(id)a3
{
  objc_storeStrong((id *)&self->_localCreationDateCreator, a3);
}

- (NSMutableSet)usedMomentObjectIDs
{
  return self->_usedMomentObjectIDs;
}

- (void)setUsedMomentObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_usedMomentObjectIDs, a3);
}

- (NSMutableSet)insertedOrUpdatedMoments
{
  return self->_insertedOrUpdatedMoments;
}

- (void)setInsertedOrUpdatedMoments:(id)a3
{
  objc_storeStrong((id *)&self->_insertedOrUpdatedMoments, a3);
}

- (NSMutableArray)momentsFromAssetClusters
{
  return self->_momentsFromAssetClusters;
}

- (void)setMomentsFromAssetClusters:(id)a3
{
  objc_storeStrong((id *)&self->_momentsFromAssetClusters, a3);
}

- (void)setDebugDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_debugDateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugDateFormatter, 0);
  objc_storeStrong((id *)&self->_momentsFromAssetClusters, 0);
  objc_storeStrong((id *)&self->_insertedOrUpdatedMoments, 0);
  objc_storeStrong((id *)&self->_usedMomentObjectIDs, 0);
  objc_storeStrong((id *)&self->_localCreationDateCreator, 0);
  objc_storeStrong((id *)&self->_frequentLocationManager, 0);
  objc_destroyWeak((id *)&self->_manager);
}

+ (id)_createMomentOrUpdateForAssetCluster:(id)a3 existingMomentDataForAssets:(id)a4 dataManager:(id)a5 usedMomentObjectIDs:(id)a6 debugDateFormatter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  signed __int16 v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _BOOL4 v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  double v44;
  double v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  int v55;
  unint64_t v56;
  unsigned int v57;
  unsigned int v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  BOOL v74;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id obj;
  void *v114;
  void *v115;
  int v116;
  uint64_t v117;
  void *v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  uint8_t buf[4];
  void *v133;
  __int16 v134;
  id v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  void *v139;
  __int16 v140;
  void *v141;
  __int16 v142;
  uint64_t v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;
  CLLocationCoordinate2D v148;

  v147 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v11, "assets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "count");
  if ((_DWORD)v18)
  {
    v104 = v18;
    v105 = v17;
    v109 = v15;
    v118 = v14;
    v19 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    v20 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v106 = v16;
    obj = v16;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v146, 16);
    v107 = v13;
    v108 = v12;
    v110 = v11;
    v111 = v20;
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v117 = 0;
      v24 = *(_QWORD *)v129;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v129 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * i);
          v27 = +[PLMomentGenerationUtils originatorStateForAsset:](PLMomentGenerationUtils, "originatorStateForAsset:", v26);
          if (objc_msgSend(v26, "isPhoto"))
            LODWORD(v117) = v117 + 1;
          else
            HIDWORD(v117) += objc_msgSend(v26, "isVideo");
          v28 = objc_msgSend(v26, "inferredTimeZoneOffset");
          objc_msgSend(v26, "location");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "coordinate");
          v31 = v30;
          v33 = v32;

          v148.latitude = v31;
          v148.longitude = v33;
          if (CLLocationCoordinate2DIsValid(v148))
          {
            v34 = v31 != 0.0;
            if (v33 != 0.0)
              v34 = 1;
            if (v34 && (v31 != 40.0 || v33 != -100.0))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "addObject:", v36);

            }
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v37);

          objc_msgSend(v26, "pl_coordinate");
          if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
          {
            v38 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v26, "gpsHorizontalAccuracy");
            objc_msgSend(v38, "numberWithDouble:");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "addObject:", v39);

          }
          v23 |= v27;
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v146, 16);
      }
      while (v22);
      v20 = v111;
      v12 = v108;
    }
    else
    {
      v23 = 0;
      v117 = 0;
    }

    objc_msgSend(v112, "sortUsingSelector:", sel_compare_);
    v42 = objc_msgSend(v112, "count");
    if (v42)
    {
      objc_msgSend(v112, "objectAtIndexedSubscript:", v42 >> 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "doubleValue");
      v45 = v44;

    }
    else
    {
      v45 = -1.0;
    }
    v46 = v19;
    v47 = v46;
    if (objc_msgSend(v20, "count"))
    {
      v47 = v20;

    }
    v103 = v46;
    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    v48 = v47;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v124, v145, 16);
    if (v49)
    {
      v50 = v49;
      v51 = 0;
      v116 = 0;
      v52 = *(_QWORD *)v125;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v125 != v52)
            objc_enumerationMutation(v48);
          v54 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * j);
          v55 = objc_msgSend(v54, "intValue");
          v56 = objc_msgSend(v48, "countForObject:", v54);
          if (v56 > v51)
            goto LABEL_37;
          if (v56 == v51)
          {
            if (v55 >= 0)
              v57 = v55;
            else
              v57 = -v55;
            v58 = v116;
            if (v116 < 0)
              v58 = -v116;
            if (v57 < v58)
            {
LABEL_37:
              v51 = v56;
              v116 = v55;
            }
          }
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v124, v145, 16);
      }
      while (v50);
    }
    else
    {
      v116 = 0;
    }

    objc_msgSend(v11, "startDate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endDate");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v59, v102);
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v60 = v12;
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v120, v144, 16);
    if (v61)
    {
      v62 = v61;
      v101 = v59;
      v115 = 0;
      v63 = 0;
      v64 = *(_QWORD *)v121;
      do
      {
        for (k = 0; k != v62; ++k)
        {
          if (*(_QWORD *)v121 != v64)
            objc_enumerationMutation(v60);
          v66 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * k);
          if (v118)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * k), "objectID");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v118, "containsObject:", v67);

            if ((v68 & 1) != 0)
              continue;
          }
          objc_msgSend(v66, "dateInterval");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "intersectionWithDateInterval:", v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "duration");
          v72 = v71;
          objc_msgSend(v63, "duration");
          if (v63)
            v74 = 1;
          else
            v74 = v70 == 0;
          if (!v74 || v72 > v73)
          {
            v76 = v66;

            v77 = v70;
            v115 = v76;
            v63 = v77;
          }

        }
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v120, v144, 16);
      }
      while (v62);

      if (v115)
      {
        objc_msgSend(v115, "objectID");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = 0;
        objc_msgSend(v107, "momentWithUniqueID:error:", v78, &v119);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v119;
        v59 = v101;
        if (v80)
        {
          PLBackendGetLog();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v133 = v78;
            v134 = 2112;
            v135 = v80;
            _os_log_impl(&dword_199541000, v81, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Error fetching moment with object ID %@. %@", buf, 0x16u);
          }

        }
        if (!v109)
        {
          v82 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(v82, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SS"));
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
          v83 = v80;
          v84 = v79;
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = v82;
          objc_msgSend(v82, "setTimeZone:", v85);

          v79 = v84;
          v80 = v83;
        }
        PLBackendGetLog();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v79, "uuid");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "startDate");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "stringFromDate:", v98);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "endDate");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "stringFromDate:", v97);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "startDate");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "stringFromDate:", v95);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "endDate");
          v99 = v79;
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "stringFromDate:", v88);
          v89 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          v133 = v78;
          v134 = 2112;
          v135 = v96;
          v136 = 2112;
          v137 = v100;
          v138 = 2112;
          v139 = v94;
          v140 = 2112;
          v141 = v87;
          v142 = 2112;
          v143 = v89;
          v90 = (void *)v89;
          _os_log_impl(&dword_199541000, v86, OS_LOG_TYPE_DEBUG, "[MomentsGeneration] Found existing moment with OID %@, UID %@, old [%@ - %@], new [%@ - %@]", buf, 0x3Eu);

          v79 = v99;
        }

        v13 = v107;
        v40 = v108;
        if (v79)
          goto LABEL_81;
      }
      else
      {
        v115 = 0;
        v13 = v107;
        v40 = v108;
        v59 = v101;
      }
    }
    else
    {

      v115 = 0;
      v63 = 0;
      v13 = v107;
      v40 = v108;
    }
    objc_msgSend(v13, "insertNewMoment");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_81:
    objc_msgSend(v79, "setStartDate:", v59);
    objc_msgSend(v79, "setEndDate:", v102);
    objc_msgSend(v79, "setTimeZoneOffset:", v116);
    objc_msgSend(v79, "setRepresentativeDate:", v59);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", obj);
    v91 = v79;
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setAssets:", v92);

    objc_msgSend(v91, "setCachedCount:", v104);
    objc_msgSend(v91, "setCachedPhotosCount:", v117);
    objc_msgSend(v91, "setCachedVideosCount:", HIDWORD(v117));
    objc_msgSend(v91, "setApproximateLocation:", v105);
    objc_msgSend(v91, "setProcessedLocation:", 0);
    objc_msgSend(v91, "setGpsHorizontalAccuracy:", v45);
    v41 = v91;
    objc_msgSend(v91, "setOriginatorState:", v23);

    v17 = v105;
    v14 = v118;
    v15 = v109;
    v11 = v110;
    v16 = v106;
    goto LABEL_82;
  }
  v40 = v12;
  v41 = 0;
LABEL_82:

  return v41;
}

+ (id)createMomentOrUpdateForAssetCluster:(id)a3 affectedMoment:(id)a4 dataManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLExistingMomentData *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PLExistingMomentData initWithMoment:]([PLExistingMomentData alloc], "initWithMoment:", v9);

  if (v9)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_createMomentOrUpdateForAssetCluster:existingMomentDataForAssets:dataManager:usedMomentObjectIDs:debugDateFormatter:", v10, v12, v8, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
