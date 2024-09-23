@implementation PGMemoryPlannerPhotoKitSource

- (PGMemoryPlannerPhotoKitSource)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v7;
  id v8;
  PGMemoryPlannerPhotoKitSource *v9;
  PGMemoryPlannerPhotoKitSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMemoryPlannerPhotoKitSource;
  v9 = -[PGMemoryPlannerPhotoKitSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
  }

  return v10;
}

- (id)pastMemoriesForConfiguration:(id)a3 withGraph:(id)a4 progressReporter:(id)a5
{
  id v8;
  OS_os_log *v9;
  id v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint32_t denom;
  uint32_t numer;
  NSObject *v28;
  NSObject *v29;
  uint64_t v31;
  id v32;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  double v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v32 = a4;
  v8 = a5;
  v9 = self->_loggingConnection;
  v10 = a3;
  v11 = os_signpost_id_generate((os_log_t)v9);
  v12 = v9;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PGMemoryPlannerPhotoKitSourcePastMemories", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v31 = mach_absolute_time();
  objc_msgSend(v10, "pastMemoryCollisionUniversalDateInterval");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v14, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithFormat:", CFSTR("creationDate >= %@ AND creationDate <= %@ && category != %d"), v17, v18, 401);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v19);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v20;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSortDescriptors:", v22);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    -[PGMemoryPlannerPhotoKitSource triggeredMemoriesFromPersistedMemories:withGraph:progressReporter:](self, "triggeredMemoriesFromPersistedMemories:withGraph:progressReporter:", v23, v32, v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v28 = v13;
    v29 = v28;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v29, OS_SIGNPOST_INTERVAL_END, v11, "PGMemoryPlannerPhotoKitSourcePastMemories", ", buf, 2u);
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "PGMemoryPlannerPhotoKitSourcePastMemories";
      v36 = 2048;
      v37 = (float)((float)((float)((float)(v25 - v31) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v24;
}

- (id)memoriesToAvoidForConfiguration:(id)a3 withGraph:(id)a4 progressReporter:(id)a5
{
  id v7;
  id v8;
  OS_os_log *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint32_t denom;
  uint32_t numer;
  NSObject *v23;
  NSObject *v24;
  uint64_t v26;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  double v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = self->_loggingConnection;
  v10 = os_signpost_id_generate((os_log_t)v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGMemoryPlannerPhotoKitSourceMemoriesToAvoid", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v26 = mach_absolute_time();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIncludeRejectedMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("userCreated == NO && rejected == YES"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPredicate:", v14);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSortDescriptors:", v17);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    -[PGMemoryPlannerPhotoKitSource triggeredMemoriesFromPersistedMemories:withGraph:progressReporter:](self, "triggeredMemoriesFromPersistedMemories:withGraph:progressReporter:", v18, v7, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v23 = v12;
    v24 = v23;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v24, OS_SIGNPOST_INTERVAL_END, v10, "PGMemoryPlannerPhotoKitSourceMemoriesToAvoid", ", buf, 2u);
    }

    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "PGMemoryPlannerPhotoKitSourceMemoriesToAvoid";
      v30 = 2048;
      v31 = (float)((float)((float)((float)(v20 - v26) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

- (id)triggeredMemoriesFromPersistedMemories:(id)a3 withGraph:(id)a4 progressReporter:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  id v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  unint64_t v24;
  NSObject *loggingConnection;
  uint64_t v26;
  PGGraphFeatureNodeCollection *v27;
  unsigned int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  PGTriggeredMemory *v54;
  unint64_t v55;
  void *v56;
  unint64_t v57;
  PGTriggeredMemory *v58;
  void *v59;
  unint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v68;
  void *v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  char v76;
  uint64_t v77;
  PGGraphFeatureNodeCollection *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id obj;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  unint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  void *v99;
  uint8_t buf[4];
  _BYTE v101[18];
  __int16 v102;
  void *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  void *v107;
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v74 = a5;
  v9 = objc_msgSend(v7, "count");
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v11 = v7;
  v73 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
  if (v73)
  {
    v12 = 1.0 / (double)v9;
    v72 = *(_QWORD *)v95;
    v13 = 0.0;
    v70 = v11;
    v71 = v8;
    v69 = v10;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v95 != v72)
        objc_enumerationMutation(v11);
      v15 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v14);
      v16 = (void *)MEMORY[0x1CAA4EB2C]();
      v13 = v12 + v13;
      if (objc_msgSend(v74, "isCancelledWithProgress:", v13))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v101 = 90;
          *(_WORD *)&v101[4] = 2080;
          *(_QWORD *)&v101[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGMemoryPlannerPhotoKitSource.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        objc_autoreleasePoolPop(v16);

        v66 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_41;
      }
      objc_msgSend(MEMORY[0x1E0CD1630], "fetchMomentsBackingMemory:options:", v15, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      obj = v17;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v108, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v91;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v91 != v20)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "uuid");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "addObject:", v22);

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v108, 16);
        }
        while (v19);
      }

      +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v83, v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");
      if (v24 < objc_msgSend(v83, "count"))
        break;
      if (v24)
        goto LABEL_18;
LABEL_35:

      objc_autoreleasePoolPop(v16);
      if (++v14 == v73)
      {
        v73 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
        if (v73)
          goto LABEL_3;
        goto LABEL_37;
      }
    }
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v101 = "-[PGMemoryPlannerPhotoKitSource triggeredMemoriesFromPersistedMemories:withGraph:progressReporter:]";
      _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "%s: Cannot find some moment nodes for moment uuids", buf, 0xCu);
    }
LABEL_18:
    v89 = 0;
    v89 = objc_msgSend(v15, "category");
    v26 = objc_msgSend(v15, "subcategory");
    v27 = -[MAElementCollection initWithGraph:]([PGGraphFeatureNodeCollection alloc], "initWithGraph:", v8);
    objc_msgSend(v15, "photosGraphVersion");
    v28 = PLMemoriesAlgorithmsVersionFromPhotosGraphVersion();
    v80 = v14;
    v81 = v16;
    v79 = v23;
    if (v89 > 0x64 || v28 < 0x301)
    {
      v88 = 0;
      if ((objc_msgSend((id)objc_opt_class(), "translateLegacyMemoryCategory:subcategory:toNewMemoryCategory:triggerType:", v89, v26, &v89, &v88) & 1) == 0)
      {
        v39 = self->_loggingConnection;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v59 = (void *)MEMORY[0x1E0CD1630];
          v60 = v89;
          v61 = v39;
          objc_msgSend(v59, "stringForCategory:", v60);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD1630], "stringForSubcategory:", v26);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGGraphBuilder memoryLabelForCategory:](PGGraphBuilder, "memoryLabelForCategory:", v89);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          +[PGMemoryTrigger stringFromTriggerType:](PGMemoryTrigger, "stringFromTriggerType:", v88);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v101 = "-[PGMemoryPlannerPhotoKitSource triggeredMemoriesFromPersistedMemories:withGraph:progressReporter:]";
          *(_WORD *)&v101[8] = 2112;
          *(_QWORD *)&v101[10] = v62;
          v102 = 2112;
          v103 = v63;
          v104 = 2112;
          v105 = v64;
          v106 = 2112;
          v107 = v65;
          _os_log_error_impl(&dword_1CA237000, v61, OS_LOG_TYPE_ERROR, "%s: Failed to translate memory category %@ sub category %@ into memory category %@ trigger type %@", buf, 0x34u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v88);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
      v33 = (id)objc_claimAutoreleasedReturnValue();

      v76 = 0;
      v77 = 0;
    }
    else
    {
      objc_msgSend(v15, "photosGraphProperties");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("triggerTypes"));
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      v32 = (void *)MEMORY[0x1E0C9AA60];
      if (v30)
        v32 = (void *)v30;
      v33 = v32;

      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("memoryCategorySubcategory"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v34, "unsignedIntegerValue");

      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("encodedFeatures"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGFeature featuresForEncodedFeatures:](PGFeature, "featuresForEncodedFeatures:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphFeatureNodeCollection featureNodeCollectionWithFeatures:inGraph:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithFeatures:inGraph:", v36, v8);
      v37 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("generatedWithFallbackRequirements"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v38, "BOOLValue");

      v27 = (PGGraphFeatureNodeCollection *)v37;
    }
    v78 = v27;
    v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v42 = v33;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v85 != v45)
            objc_enumerationMutation(v42);
          v47 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j);
          v48 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v15, "creationDate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "creationDate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend(v48, "initWithStartDate:endDate:", v49, v50);
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v51, v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
      }
      while (v44);
    }

    +[PGGraphBuilder memoryLabelForCategory:](PGGraphBuilder, "memoryLabelForCategory:", v89);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMemoryNode uniqueMemoryIdentifierWithMemoryLabel:featureNodes:](PGGraphMemoryNode, "uniqueMemoryIdentifierWithMemoryLabel:featureNodes:", v52, v78);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = [PGTriggeredMemory alloc];
    v55 = v89;
    objc_msgSend(v15, "creationDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v68) = v76;
    v57 = v55;
    v23 = v79;
    v58 = -[PGTriggeredMemory initWithMemoryCategory:memoryCategorySubcategory:memoryMomentNodes:memoryFeatureNodes:validityIntervalByTriggerType:creationDate:uniqueMemoryIdentifier:generatedWithFallbackRequirements:](v54, "initWithMemoryCategory:memoryCategorySubcategory:memoryMomentNodes:memoryFeatureNodes:validityIntervalByTriggerType:creationDate:uniqueMemoryIdentifier:generatedWithFallbackRequirements:", v57, v77, v79, v78, v41, v56, v53, v68);

    v10 = v69;
    objc_msgSend(v69, "addObject:", v58);

    v11 = v70;
    v8 = v71;
    v14 = v80;
    v16 = v81;
    goto LABEL_35;
  }
LABEL_37:

  v66 = v10;
LABEL_41:

  return v66;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

+ (BOOL)translateLegacyMemoryCategory:(unint64_t)a3 subcategory:(unint64_t)a4 toNewMemoryCategory:(unint64_t *)a5 triggerType:(unint64_t *)a6
{
  BOOL result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  *a5 = 0;
  *a6 = 0;
  result = 1;
  if ((uint64_t)a3 > 200)
  {
    switch(a3)
    {
      case 0xC9uLL:
        v7 = 8;
        goto LABEL_24;
      case 0xCAuLL:
        result = 1;
        *a5 = 1;
        *a6 = 4;
        goto LABEL_25;
      case 0xCBuLL:
      case 0xCCuLL:
      case 0xCDuLL:
      case 0xCEuLL:
      case 0xCFuLL:
      case 0xD0uLL:
      case 0xD1uLL:
      case 0xD2uLL:
      case 0xD3uLL:
        goto LABEL_25;
      case 0xD4uLL:
        v8 = 16;
        goto LABEL_15;
      case 0xD5uLL:
        result = 1;
        *a5 = 1;
        goto LABEL_16;
      case 0xD6uLL:
        result = 1;
        *a5 = 1;
        *a6 = 11;
        goto LABEL_25;
      case 0xD7uLL:
        v8 = 17;
LABEL_15:
        *a5 = v8;
        result = 1;
LABEL_16:
        *a6 = 1;
        goto LABEL_25;
      case 0xD8uLL:
      case 0xD9uLL:
        v7 = 21;
        goto LABEL_24;
      case 0xDAuLL:
        result = 1;
        if (a4 == 203)
        {
LABEL_42:
          v9 = 6;
        }
        else
        {
          if (a4 != 204)
            goto LABEL_25;
LABEL_37:
          v9 = 3;
        }
        break;
      case 0xDBuLL:
        v7 = 4;
        goto LABEL_24;
      case 0xDCuLL:
        v7 = 3;
        goto LABEL_24;
      case 0xDDuLL:
        v7 = 7;
LABEL_24:
        *a5 = v7;
        result = 1;
        goto LABEL_25;
      default:
        if (a3 == 401)
          goto LABEL_8;
        goto LABEL_25;
    }
    goto LABEL_52;
  }
  if (!a3 || a3 == 32)
LABEL_8:
    result = 0;
LABEL_25:
  if ((uint64_t)a4 <= 300)
  {
    switch(a4)
    {
      case 0xC9uLL:
        v9 = 1;
        break;
      case 0xCAuLL:
        goto LABEL_37;
      case 0xCBuLL:
        if (a3 != 220)
          goto LABEL_42;
        v9 = 5;
        break;
      case 0xCCuLL:
        if (a3 != 220)
          goto LABEL_37;
        v9 = 2;
        break;
      case 0xCDuLL:
      case 0xCEuLL:
        v9 = 19;
        break;
      case 0xCFuLL:
      case 0xD0uLL:
      case 0xD1uLL:
        return result;
      case 0xD2uLL:
        *a5 = 3;
        *a6 = 2;
        return result;
      case 0xD3uLL:
        v9 = 20;
        break;
      case 0xD4uLL:
        v9 = 10;
        break;
      case 0xD5uLL:
        goto LABEL_34;
      case 0xD6uLL:
        v9 = 17;
        break;
      case 0xD7uLL:
        v9 = 18;
        break;
      case 0xD8uLL:
        goto LABEL_31;
      case 0xD9uLL:
        v9 = 11;
        break;
      case 0xDAuLL:
        v9 = 9;
        break;
      default:
        if (a4 != 102)
          return result;
LABEL_34:
        v9 = 16;
        break;
    }
LABEL_52:
    *a5 = v9;
    return result;
  }
  switch(a4)
  {
    case 0x191uLL:
      v9 = 13;
      goto LABEL_52;
    case 0x192uLL:
      v9 = 12;
      goto LABEL_52;
    case 0x193uLL:
      v9 = 15;
      goto LABEL_52;
    case 0x194uLL:
      v9 = 14;
      goto LABEL_52;
    default:
      if (a4 - 301 < 3)
LABEL_31:
        result = 0;
      break;
  }
  return result;
}

@end
