@implementation PGDejunkerDeduper

- (PGDejunkerDeduper)initWithSimilarityModelClass:(Class)a3
{
  PGDejunkerDeduper *v4;
  uint64_t v5;
  PLKMeansClustering *kMeanTimeClusterer;
  uint64_t v7;
  CLSSimilarStacker *similarStacker;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PGDejunkerDeduper;
  v4 = -[PGDejunkerDeduper init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D717F8]), "initWithNumericValueKeypaths:", &unk_1E84E9508);
    kMeanTimeClusterer = v4->_kMeanTimeClusterer;
    v4->_kMeanTimeClusterer = (PLKMeansClustering *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4B260]), "initWithSimilarityModelClass:", a3);
    similarStacker = v4->_similarStacker;
    v4->_similarStacker = (CLSSimilarStacker *)v7;

    objc_storeStrong((id *)&v4->_loggingConnection, MEMORY[0x1E0C81028]);
  }
  return v4;
}

- (id)dejunkedDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  char v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  OS_os_log *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  double Current;
  char v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  double *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint8_t buf[4];
  _BYTE v68[18];
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v37 = a6;
  v13 = _Block_copy(v37);
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = (double *)&v59;
  v61 = 0x2020000000;
  v62 = 0;
  v36 = v10;
  if (!v13
    || (v14 = CFAbsoluteTimeGetCurrent(), v14 - v60[3] < 0.01)
    || (v60[3] = v14,
        v58 = 0,
        (*((void (**)(void *, char *, double))v13 + 2))(v13, &v58, 0.0),
        v15 = *((_BYTE *)v64 + 24) | v58,
        (*((_BYTE *)v64 + 24) = v15) == 0))
  {
    objc_msgSend(v12, "setAgent:", CFSTR("DejunkerDeduper"));
    v17 = v10;
    v18 = v17;
    if (objc_msgSend(v11, "doIdenticalDeduping"))
    {
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke;
      v53[3] = &unk_1E8434F30;
      v54 = v13;
      v55 = &v59;
      v56 = &v63;
      v57 = 0x3F847AE147AE147BLL;
      -[PGDejunkerDeduper identicallyDedupedItemsInItems:options:debugInfo:progressBlock:](self, "identicallyDedupedItemsInItems:options:debugInfo:progressBlock:", v17, v11, v12, v53);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (*((_BYTE *)v64 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v68 = 63;
          *(_WORD *)&v68[4] = 2080;
          *(_QWORD *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v16 = (void *)MEMORY[0x1E0C9AA60];
        v19 = v54;
        goto LABEL_45;
      }

    }
    v18 = v18;
    v19 = v18;
    if (objc_msgSend(v11, "doSemanticalDeduping"))
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_48;
      v48[3] = &unk_1E8434F30;
      v49 = v13;
      v50 = &v59;
      v51 = &v63;
      v52 = 0x3F847AE147AE147BLL;
      -[PGDejunkerDeduper semanticallyDedupedItemsInItems:options:debugInfo:progressBlock:](self, "semanticallyDedupedItemsInItems:options:debugInfo:progressBlock:", v18, v11, v12, v48);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (*((_BYTE *)v64 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v68 = 73;
          *(_WORD *)&v68[4] = 2080;
          *(_QWORD *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v16 = (void *)MEMORY[0x1E0C9AA60];
        v20 = v49;
        goto LABEL_44;
      }

    }
    v19 = v19;
    v20 = v19;
    if (objc_msgSend(v11, "doDejunk"))
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_49;
      v43[3] = &unk_1E8434F30;
      v44 = v13;
      v45 = &v59;
      v46 = &v63;
      v47 = 0x3F847AE147AE147BLL;
      -[PGDejunkerDeduper dejunkedItemsWithItems:options:debugInfo:progressBlock:](self, "dejunkedItemsWithItems:options:debugInfo:progressBlock:", v19, v11, v12, v43);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      if (*((_BYTE *)v64 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v68 = 83;
          *(_WORD *)&v68[4] = 2080;
          *(_QWORD *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v16 = (void *)MEMORY[0x1E0C9AA60];
        v21 = v44;
        goto LABEL_43;
      }
      if (!objc_msgSend(v20, "count") && objc_msgSend(v11, "returnDedupedJunkIfOnlyJunk"))
      {
        v22 = v19;

        v20 = v22;
      }

    }
    v20 = v20;
    v21 = v20;
    if (objc_msgSend(v11, "doFinalPass"))
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_50;
      v38[3] = &unk_1E8434F30;
      v39 = v13;
      v40 = &v59;
      v41 = &v63;
      v42 = 0x3F847AE147AE147BLL;
      -[PGDejunkerDeduper finalItemsWithItems:options:debugInfo:progressBlock:](self, "finalItemsWithItems:options:debugInfo:progressBlock:", v20, v11, v12, v38);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      if (*((_BYTE *)v64 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v68 = 97;
          *(_WORD *)&v68[4] = 2080;
          *(_QWORD *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        goto LABEL_33;
      }

    }
    v23 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
    {
      v24 = (void *)MEMORY[0x1E0CB3578];
      objc_msgSend(v17, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "cls_universalDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringFromDate:dateStyle:timeStyle:", v34, 2, 0);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v17, "count");
      v31 = objc_msgSend(v18, "count");
      v30 = objc_msgSend(v19, "count");
      v25 = objc_msgSend(v20, "count");
      v26 = objc_msgSend(v21, "count");
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)v68 = v33;
      *(_WORD *)&v68[8] = 2048;
      *(_QWORD *)&v68[10] = v32;
      v69 = 2048;
      v70 = v31;
      v71 = 2048;
      v72 = v30;
      v73 = 2048;
      v74 = v25;
      v75 = 2048;
      v76 = v26;
      _os_log_impl(&dword_1CA237000, (os_log_t)v23, OS_LOG_TYPE_INFO, "DejunkerDeduper: %@: %lu -> %lu -> %lu -> %lu -> %lu", buf, 0x3Eu);

    }
    if (!v13
      || (Current = CFAbsoluteTimeGetCurrent(), Current - v60[3] < 0.01)
      || (v60[3] = Current,
          v58 = 0,
          (*((void (**)(void *, char *, double))v13 + 2))(v13, &v58, 1.0),
          v28 = *((_BYTE *)v64 + 24) | v58,
          (*((_BYTE *)v64 + 24) = v28) == 0))
    {
      v21 = v21;
      v16 = v21;
      goto LABEL_43;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v68 = 102;
      *(_WORD *)&v68[4] = 2080;
      *(_QWORD *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Curation/DejunkDedupe/PGDejunkerDeduper.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
LABEL_33:
    v16 = (void *)MEMORY[0x1E0C9AA60];
LABEL_43:

LABEL_44:
LABEL_45:

    goto LABEL_46;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v68 = 52;
    *(_WORD *)&v68[4] = 2080;
    *(_QWORD *)&v68[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/DejunkDedupe/PGDejunkerDeduper.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v16 = (void *)MEMORY[0x1E0C9AA60];
LABEL_46:
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);

  return v16;
}

- (id)identicallyDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double Current;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  CLSSimilarStacker *similarStacker;
  CLSSimilarStacker *v21;
  id v22;
  double v23;
  double v24;
  void (**v25)(void *, _BYTE *, double);
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  id v31;
  _BOOL4 v32;
  double v34;
  double v35;
  double v36;
  void *v37;
  unint64_t v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void (**v47)(void *, _BYTE *, double);
  id v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  const __CFString *v57;
  void *v58;
  id v59;
  void *v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v80;
  id v81;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  id obj;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void (**v91)(void *, _BYTE *, double);
  id v92;
  id v93;
  id v94;
  char v95;
  void *v96;
  _BOOL4 v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *context;
  void *contexta;
  void *v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  unsigned __int8 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  id v126;
  uint8_t v127[128];
  uint8_t buf[4];
  int v129;
  __int16 v130;
  const char *v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = 0.0;
  v91 = (void (**)(void *, _BYTE *, double))_Block_copy(v13);
  if (v91)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v122 = 0;
      v91[2](v91, &v122, 0.0);
      if (v122)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v129 = 112;
          v130 = 2080;
          v131 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curat"
                 "ion/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v16 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_98;
      }
      v14 = Current;
    }
  }
  objc_msgSend(v12, "setStage:", CFSTR("Identical"));
  -[PGDejunkerDeduper itemsByFeatureWithItems:](self, "itemsByFeatureWithItems:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  if (v18)
  {
    v19 = v18;
    v82 = v10;
    v83 = v17;
    v81 = v13;
    similarStacker = self->_similarStacker;
    objc_msgSend(v11, "identicalDedupingThreshold");
    -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](similarStacker, "overrideDistanceThreshold:forSimilarity:", 0);
    v21 = self->_similarStacker;
    objc_msgSend(v11, "identicalDedupingThresholdForPeople");
    -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](v21, "overrideDistanceThreshold:forSimilarity:", 1);
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v90 = objc_msgSend(v11, "maximumNumberOfItemsPerIdenticalCluster");
    v93 = 0;
    if ((objc_msgSend(v11, "useOnlyScenesForDeduping") & 1) == 0)
    {
      if (objc_msgSend(v11, "useFaceprintsForIdenticalDeduping"))
        v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      else
        v93 = 0;
    }
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    obj = v17;
    v105 = v12;
    v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
    if (v85)
    {
      v95 = 0;
      v23 = 1.0 / (double)v19;
      v84 = *(_QWORD *)v119;
      v24 = 0.0;
      v25 = v91;
      while (2)
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v119 != v84)
            objc_enumerationMutation(obj);
          v87 = v26;
          v27 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v26);
          v28 = (void *)MEMORY[0x1CAA4EB2C]();
          if (v25)
          {
            v29 = CFAbsoluteTimeGetCurrent();
            if (v29 - v14 >= 0.01)
            {
              v122 = 0;
              v25[2](v25, &v122, v24);
              if (v122 | v95 & 1)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v129 = 140;
                  v130 = 2080;
                  v131 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Curation/DejunkDedupe/PGDejunkerDeduper.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                objc_autoreleasePoolPop(v28);
LABEL_94:

                goto LABEL_95;
              }
              v95 = 0;
              v14 = v29;
            }
          }
          v89 = v28;
          objc_msgSend(obj, "objectForKeyedSubscript:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGDejunkerDeduper timeSortedItemsWithItems:](self, "timeSortedItemsWithItems:", v30);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v32 = -[PGDejunkerDeduper shouldPerformIdenticalDedupingForItemFeature:options:](self, "shouldPerformIdenticalDedupingForItemFeature:options:", v27, v11);
          v88 = v30;
          v97 = v32;
          if ((unint64_t)objc_msgSend(v30, "count") < 2 || !v32)
          {
            v126 = v31;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v126, 1);
          }
          else
          {
            -[PGDejunkerDeduper identicalDedupingTimeIntervalForItemFeature:options:](self, "identicalDedupingTimeIntervalForItemFeature:options:", v27, v11);
            v35 = v34;
            objc_msgSend(v11, "identicalDedupingMaximumTimeGroupExtension");
            -[PGDejunkerDeduper timeGroupsOfTimeSortedItemsWithTimeSortedItems:timeInterval:maximumTimeGroupExtension:](self, "timeGroupsOfTimeSortedItemsWithTimeSortedItems:timeInterval:maximumTimeGroupExtension:", v31, v35, v36);
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23 + v24;
          objc_msgSend(v12, "addClusters:withReason:", v37, CFSTR("Time Clustering"));
          v38 = objc_msgSend(v37, "count");
          v114 = 0u;
          v115 = 0u;
          v116 = 0u;
          v117 = 0u;
          v94 = v37;
          v99 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
          if (v99)
          {
            v39 = v23 / (double)v38;
            v98 = *(_QWORD *)v115;
            v40 = 0.0;
            v41 = v14;
            v96 = v27;
            while (2)
            {
              v42 = 0;
              v43 = v31;
              do
              {
                if (*(_QWORD *)v115 != v98)
                  objc_enumerationMutation(v94);
                v31 = *(id *)(*((_QWORD *)&v114 + 1) + 8 * v42);

                v102 = v42;
                context = (void *)MEMORY[0x1CAA4EB2C]();
                if (v25)
                {
                  v14 = CFAbsoluteTimeGetCurrent();
                  if (v14 - v41 >= 0.01)
                  {
                    v122 = 0;
                    v25[2](v25, &v122, v24 + v40);
                    if (v122 | v95 & 1)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        v129 = 167;
                        v130 = 2080;
                        v131 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
                        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }
                      objc_autoreleasePoolPop(context);
                      v70 = 0;
                      v95 = 1;
                      goto LABEL_69;
                    }
                    v95 = 0;
                    v41 = v14;
                  }
                }
                if (v12)
                {
                  objc_msgSend(v31, "firstObject");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PGDejunkerDeduper debugPersonStringForItem:](self, "debugPersonStringForItem:", v44);
                  v100 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v31, "lastObject");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "cls_universalDate");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "firstObject");
                  v47 = v25;
                  v48 = v12;
                  v49 = v31;
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "cls_universalDate");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "timeIntervalSinceDate:", v51);
                  v53 = v52;

                  v31 = v49;
                  v12 = v48;
                  v25 = v47;

                  v54 = (void *)MEMORY[0x1E0CB3940];
                  v55 = objc_msgSend(v31, "count");
                  v56 = objc_msgSend(v31, "count");
                  v57 = &stru_1E8436F28;
                  if (v56 > 1)
                    v57 = CFSTR("s");
                  v80 = v55;
                  v27 = v96;
                  objc_msgSend(v54, "stringWithFormat:", CFSTR("%.0f sec, %lu item%@: %@"), v53, v80, v57, v100);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "setState:ofCluster:withReason:", 1, v31, v58);

                }
                if (v97 && objc_msgSend(v31, "count") != 1)
                {
                  -[PGDejunkerDeduper identicalDedupingSimilarityForItemFeature:options:](self, "identicalDedupingSimilarityForItemFeature:options:", v27, v11);
                  v60 = v27;
                  v62 = (uint64_t)v61;
                  -[CLSSimilarStacker stackSimilarItems:withSimilarity:timestampSupport:progressBlock:](self->_similarStacker, "stackSimilarItems:withSimilarity:timestampSupport:progressBlock:", v31, (uint64_t)v61, 0, 0);
                  v59 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "debugInfoForCluster:", v31);
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v101, "setClusters:withReason:", v59, CFSTR("Similar Stacking"));
                  if (v93 && objc_msgSend(v60, "hasPersons"))
                  {
                    objc_msgSend(v93, "addObjectsFromArray:", v59);
                  }
                  else
                  {
                    v92 = v31;
                    if (v90)
                    {
                      -[PGDejunkerDeduper splitItemGroupsWithItemGroups:maximumNumberOfItemsPerGroup:debugInfo:](self, "splitItemGroupsWithItemGroups:maximumNumberOfItemsPerGroup:debugInfo:", v59, v90, v101);
                      v63 = objc_claimAutoreleasedReturnValue();

                      v59 = (id)v63;
                    }
                    v112 = 0u;
                    v113 = 0u;
                    v110 = 0u;
                    v111 = 0u;
                    v59 = v59;
                    v64 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
                    if (v64)
                    {
                      v65 = v64;
                      v66 = *(_QWORD *)v111;
                      do
                      {
                        for (i = 0; i != v65; ++i)
                        {
                          if (*(_QWORD *)v111 != v66)
                            objc_enumerationMutation(v59);
                          v68 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
                          if (objc_msgSend(v68, "count") == 1)
                          {
                            -[PGDejunkerDeduper eligibleItemsInItems:options:](self, "eligibleItemsInItems:options:", v68, v11);
                            v69 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v22, "addObjectsFromArray:", v69);
                          }
                          else
                          {
                            -[PGDejunkerDeduper bestItemGroupsBasedOnSceneprintsWithItemGroups:forSimilarity:options:](self, "bestItemGroupsBasedOnSceneprintsWithItemGroups:forSimilarity:options:", v68, v62, v11);
                            v69 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v22, "addObjectsFromArray:", v69);
                            objc_msgSend(v105, "dedupItems:toItems:withDedupingType:", v68, v69, 1);
                          }

                        }
                        v65 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
                      }
                      while (v65);
                    }

                    v12 = v105;
                    v25 = v91;
                    v31 = v92;
                  }

                  v27 = v96;
                }
                else
                {
                  -[PGDejunkerDeduper eligibleItemsInItems:options:](self, "eligibleItemsInItems:options:", v31, v11);
                  v59 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "addObjectsFromArray:", v59);
                }
                v40 = v39 + v40;

                objc_autoreleasePoolPop(context);
                v42 = v102 + 1;
                v43 = v31;
              }
              while (v102 + 1 != v99);
              v99 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
              if (v99)
                continue;
              break;
            }
            v70 = 1;
            v14 = v41;
          }
          else
          {
            v70 = 1;
          }
LABEL_69:

          objc_autoreleasePoolPop(v89);
          if (!v70)
            goto LABEL_94;
          v26 = v87 + 1;
        }
        while (v87 + 1 != v85);
        v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
        if (v85)
          continue;
        break;
      }
    }
    else
    {
      v95 = 0;
      v25 = v91;
    }

    if (objc_msgSend(v93, "count"))
    {
      -[PGDejunkerDeduper bestItemGroupsBasedOnFaceprintsWithItemGroups:options:](self, "bestItemGroupsBasedOnFaceprintsWithItemGroups:options:", v93, v11);
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      contexta = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(contexta, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
      if (v71)
      {
        v72 = v71;
        v73 = 0;
        v74 = *(_QWORD *)v107;
        do
        {
          for (j = 0; j != v72; ++j)
          {
            if (*(_QWORD *)v107 != v74)
              objc_enumerationMutation(contexta);
            v76 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * j);
            objc_msgSend(v93, "objectAtIndexedSubscript:", v73 + j);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend(v77, "count");
            if (v78 != objc_msgSend(v76, "count"))
              objc_msgSend(v105, "dedupItems:toItems:withDedupingType:", v77, v76, 1);
            objc_msgSend(v22, "addObjectsFromArray:", v76);

          }
          v73 += j;
          v72 = objc_msgSend(contexta, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
        }
        while (v72);
      }

      v12 = v105;
      v25 = v91;
    }
    if (v25 && CFAbsoluteTimeGetCurrent() - v14 >= 0.01 && (v122 = 0, v25[2](v25, &v122, 1.0), v122 | v95 & 1))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v129 = 239;
        v130 = 2080;
        v131 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curatio"
               "n/DejunkDedupe/PGDejunkerDeduper.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
LABEL_95:
      v16 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      -[PGDejunkerDeduper timeSortedItemsWithItems:](self, "timeSortedItemsWithItems:", v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v13 = v81;
    v10 = v82;
    v17 = v83;
  }
  else
  {
    -[PGDejunkerDeduper eligibleItemsInItems:options:](self, "eligibleItemsInItems:options:", v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_98:
  return v16;
}

- (id)semanticallyDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(void *, _BYTE *, double);
  double v13;
  double Current;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  CLSSimilarStacker *similarStacker;
  CLSSimilarStacker *v20;
  CLSSimilarStacker *v21;
  id v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  void *v30;
  id v31;
  double v32;
  double v33;
  id v34;
  double v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  void *v42;
  double v43;
  id v44;
  double v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id obj;
  uint64_t v63;
  void (**v64)(void *, _BYTE *, double);
  id v65;
  void *v66;
  uint64_t v67;
  id v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  char v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint8_t v89[128];
  uint8_t buf[4];
  int v91;
  __int16 v92;
  const char *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v73 = a5;
  v12 = (void (**)(void *, _BYTE *, double))_Block_copy(a6);
  v13 = 0.0;
  if (v12)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v86 = 0;
      v12[2](v12, &v86, 0.0);
      if (v86)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v91 = 247;
          v92 = 2080;
          v93 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curati"
                "on/DejunkDedupe/PGDejunkerDeduper.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v15 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_68;
      }
      v13 = Current;
    }
  }
  objc_msgSend(v73, "setStage:", CFSTR("Semantical"));
  -[PGDejunkerDeduper itemsByFeatureWithItems:](self, "itemsByFeatureWithItems:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  if (v17)
  {
    v18 = v17;
    v59 = v10;
    similarStacker = self->_similarStacker;
    objc_msgSend(v11, "semanticalDedupingThreshold");
    -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](similarStacker, "overrideDistanceThreshold:forSimilarity:", 2);
    v20 = self->_similarStacker;
    objc_msgSend(v11, "semanticalDedupingThresholdForPeople");
    -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](v20, "overrideDistanceThreshold:forSimilarity:", 3);
    v21 = self->_similarStacker;
    objc_msgSend(v11, "semanticalDedupingThresholdForPersons");
    -[CLSSimilarStacker overrideDistanceThreshold:forSimilarity:](v21, "overrideDistanceThreshold:forSimilarity:", 4);
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = objc_msgSend(v11, "maximumNumberOfItemsPerSemanticalCluster");
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v58 = v16;
    obj = v16;
    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
    if (v60)
    {
      v24 = 1.0 / (double)v18;
      v25 = *(_QWORD *)v83;
      v26 = 0.0;
      v63 = v23;
      v64 = v12;
      v57 = *(_QWORD *)v83;
      while (2)
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v83 != v25)
          {
            v28 = v27;
            objc_enumerationMutation(obj);
            v27 = v28;
          }
          v61 = v27;
          v67 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v27);
          if (v12)
          {
            v29 = CFAbsoluteTimeGetCurrent();
            if (v29 - v13 >= 0.01)
            {
              v86 = 0;
              v12[2](v12, &v86, v26);
              if (v86)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v91 = 274;
                  v92 = 2080;
                  v93 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Curation/DejunkDedupe/PGDejunkerDeduper.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
LABEL_63:

                goto LABEL_64;
              }
              v13 = v29;
            }
          }
          v26 = v24 + v26;
          objc_msgSend(obj, "objectForKeyedSubscript:", v67);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[PGDejunkerDeduper shouldPerformSemanticalDedupingForItemFeature:options:](self, "shouldPerformSemanticalDedupingForItemFeature:options:", v67, v11)&& objc_msgSend(v30, "count") != 1)
          {
            -[PGDejunkerDeduper semanticalDedupingTimeIntervalForItemFeature:options:](self, "semanticalDedupingTimeIntervalForItemFeature:options:", v67, v11);
            v33 = v32;
            -[PGDejunkerDeduper timeSortedItemsWithItems:](self, "timeSortedItemsWithItems:", v30);
            v34 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "semanticalDedupingMaximumTimeGroupExtension");
            -[PGDejunkerDeduper timeGroupsOfTimeSortedItemsWithTimeSortedItems:timeInterval:maximumTimeGroupExtension:](self, "timeGroupsOfTimeSortedItemsWithTimeSortedItems:timeInterval:maximumTimeGroupExtension:", v34, v33, v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "count");
            if (objc_msgSend(v11, "semanticalDedupingProtectSmallClusters"))
              v38 = vcvtad_u64_f64(2.0 / (double)(unint64_t)objc_msgSend(v36, "count")) + 2;
            else
              v38 = 2;
            v69 = v38;
            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            v31 = v36;
            v71 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
            if (v71)
            {
              v39 = v24 / (double)v37;
              v70 = *(_QWORD *)v79;
              v40 = 0.0;
              v65 = v31;
              v66 = v30;
              while (2)
              {
                v41 = 0;
                v42 = v34;
                do
                {
                  if (*(_QWORD *)v79 != v70)
                    objc_enumerationMutation(v31);
                  v34 = *(id *)(*((_QWORD *)&v78 + 1) + 8 * v41);

                  if (v12)
                  {
                    v43 = CFAbsoluteTimeGetCurrent();
                    if (v43 - v13 >= 0.01)
                    {
                      v86 = 0;
                      v12[2](v12, &v86, v26 + v40);
                      if (v86)
                      {
                        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 67109378;
                          v91 = 303;
                          v92 = 2080;
                          v93 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/DejunkDedupe/PGDejunkerDeduper.m";
                          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                        }

                        goto LABEL_63;
                      }
                      v13 = v43;
                    }
                  }
                  v72 = v41;
                  if (objc_msgSend(v34, "count") >= v69)
                  {
                    -[PGDejunkerDeduper semanticalDedupingSimilarityForItemFeature:options:](self, "semanticalDedupingSimilarityForItemFeature:options:", v67, v11);
                    v46 = (uint64_t)v45;
                    -[CLSSimilarStacker stackSimilarItems:withSimilarity:timestampSupport:progressBlock:](self->_similarStacker, "stackSimilarItems:withSimilarity:timestampSupport:progressBlock:", v34, (uint64_t)v45, 0, 0);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    v68 = v34;
                    if (v23)
                    {
                      -[PGDejunkerDeduper splitItemGroupsWithItemGroups:maximumNumberOfItemsPerGroup:debugInfo:](self, "splitItemGroupsWithItemGroups:maximumNumberOfItemsPerGroup:debugInfo:", v47, v23, 0);
                      v48 = objc_claimAutoreleasedReturnValue();

                      v47 = (void *)v48;
                    }
                    v76 = 0u;
                    v77 = 0u;
                    v74 = 0u;
                    v75 = 0u;
                    v44 = v47;
                    v49 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
                    if (v49)
                    {
                      v50 = v49;
                      v51 = *(_QWORD *)v75;
                      do
                      {
                        for (i = 0; i != v50; ++i)
                        {
                          if (*(_QWORD *)v75 != v51)
                            objc_enumerationMutation(v44);
                          v53 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                          if (objc_msgSend(v53, "count") == 1)
                          {
                            -[PGDejunkerDeduper eligibleItemsInItems:options:](self, "eligibleItemsInItems:options:", v53, v11);
                            v54 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v22, "addObjectsFromArray:", v54);
                          }
                          else
                          {
                            -[PGDejunkerDeduper bestItemGroupsBasedOnSceneprintsWithItemGroups:forSimilarity:options:](self, "bestItemGroupsBasedOnSceneprintsWithItemGroups:forSimilarity:options:", v53, v46, v11);
                            v54 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v22, "addObjectsFromArray:", v54);
                            objc_msgSend(v73, "dedupItems:toItems:withDedupingType:", v53, v54, 2);
                          }

                        }
                        v50 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
                      }
                      while (v50);
                    }

                    v23 = v63;
                    v12 = v64;
                    v31 = v65;
                    v30 = v66;
                    v34 = v68;
                  }
                  else
                  {
                    -[PGDejunkerDeduper eligibleItemsInItems:options:](self, "eligibleItemsInItems:options:", v34, v11);
                    v44 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "addObjectsFromArray:", v44);
                  }
                  v40 = v39 + v40;

                  v41 = v72 + 1;
                  v42 = v34;
                }
                while (v72 + 1 != v71);
                v71 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
                if (v71)
                  continue;
                break;
              }
            }

            v25 = v57;
          }
          else
          {
            -[PGDejunkerDeduper eligibleItemsInItems:options:](self, "eligibleItemsInItems:options:", v30, v11);
            v31 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObjectsFromArray:", v31);
          }

          v27 = v61 + 1;
        }
        while (v61 + 1 != v60);
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
        v60 = v55;
        if (v55)
          continue;
        break;
      }
    }

    if (v12 && CFAbsoluteTimeGetCurrent() - v13 >= 0.01 && (v86 = 0, v12[2](v12, &v86, 1.0), v86))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v91 = 338;
        v92 = 2080;
        v93 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Curation"
              "/DejunkDedupe/PGDejunkerDeduper.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
LABEL_64:
      v15 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      -[PGDejunkerDeduper timeSortedItemsWithItems:](self, "timeSortedItemsWithItems:", v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v16 = v58;
    v10 = v59;
  }
  else
  {
    -[PGDejunkerDeduper eligibleItemsInItems:options:](self, "eligibleItemsInItems:options:", v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_68:
  return v15;
}

- (id)dejunkedItemsWithItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  PGDejunkerDeduper *v30;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_msgSend(v11, "identifiersOfRequiredItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifiersOfEligibleItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3880];
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __76__PGDejunkerDeduper_dejunkedItemsWithItems_options_debugInfo_progressBlock___block_invoke;
  v27[3] = &unk_1E8427790;
  v16 = v12;
  v28 = v16;
  v17 = v13;
  v29 = v17;
  v30 = self;
  objc_msgSend(v14, "predicateWithBlock:", v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v20 = (void *)MEMORY[0x1E0CB3880];
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __76__PGDejunkerDeduper_dejunkedItemsWithItems_options_debugInfo_progressBlock___block_invoke_2;
    v25[3] = &unk_1E84277B8;
    v25[4] = self;
    v26 = v16;
    objc_msgSend(v20, "predicateWithBlock:", v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setState:ofItems:withReason:", 2, v23, CFSTR("Junk"));

  }
  return v19;
}

- (id)finalItemsWithItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  PGDejunkerDeduper *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  id v36;
  id v37;
  PGDejunkerDeduper *v38;
  void (**v39)(void *, id);
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD aBlock[5];
  id v47;
  id v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PGDejunkerDeduper_finalItemsWithItems_options_debugInfo_progressBlock___block_invoke;
  aBlock[3] = &unk_1E84277E0;
  v38 = self;
  aBlock[4] = self;
  v40 = v10;
  v47 = v40;
  v36 = v12;
  v48 = v36;
  v37 = v11;
  v49 = v37;
  v39 = (void (**)(void *, id))_Block_copy(aBlock);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v9;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v43;
    v19 = self;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        v21 = v17;
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        -[PGDejunkerDeduper featureWithItem:](v19, "featureWithItem:", v22, v36, v37);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v24 = objc_msgSend(v14, "containsObject:", v23);
          v25 = objc_msgSend(v23, "isVideo");
          if ((v24 & 1) != 0)
            goto LABEL_24;
          if ((v25 & 1) != 0)
            goto LABEL_24;
          objc_msgSend(v22, "cls_universalDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "cls_universalDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "timeIntervalSinceDate:", v27);
          v29 = v28;

          v19 = v38;
          objc_msgSend(v40, "finalPassTimeInterval");
          if (v29 >= v30)
            goto LABEL_24;
          -[CLSSimilarStacker distanceBetweenItem:andItem:](v38->_similarStacker, "distanceBetweenItem:andItem:", v22, v21);
          v32 = v31;
          objc_msgSend(v40, "finalPassDedupingThreshold");
          if (v33 < 0.0)
            -[CLSSimilarStacker distanceThresholdForSimilarity:withSimilarityModelVersion:](v38->_similarStacker, "distanceThresholdForSimilarity:withSimilarityModelVersion:", 0, objc_msgSend(v22, "clsSimilarityModelVersion"));
          if (v32 >= v33)
          {
LABEL_24:
            if (objc_msgSend(v13, "count"))
            {
              v39[2](v39, v13);
              objc_msgSend(v13, "removeAllObjects");
              objc_msgSend(v14, "removeAllObjects");
            }
          }
        }
        objc_msgSend(v13, "addObject:", v22);
        objc_msgSend(v14, "addObject:", v23);
        v17 = v22;

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  if (objc_msgSend(v13, "count"))
    v39[2](v39, v13);
  v34 = v36;

  return v34;
}

- (BOOL)shouldPerformIdenticalDedupingForItemFeature:(id)a3 options:(id)a4
{
  id v5;
  int v6;

  v5 = a3;
  if (objc_msgSend(a4, "doNotDedupeVideos"))
    v6 = objc_msgSend(v5, "isVideo") ^ 1;
  else
    LOBYTE(v6) = 1;

  return v6;
}

- (double)identicalDedupingTimeIntervalForItemFeature:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "hasPersons") & 1) != 0 || objc_msgSend(v5, "hasPeopleScenes"))
    objc_msgSend(v6, "identicalDedupingTimeIntervalForPeople");
  else
    objc_msgSend(v6, "identicalDedupingTimeInterval");
  v8 = v7;

  return v8;
}

- (double)identicalDedupingSimilarityForItemFeature:(id)a3 options:(id)a4
{
  id v4;
  double v5;

  v4 = a3;
  v5 = 1.0;
  if ((objc_msgSend(v4, "hasPersons") & 1) == 0)
  {
    if (objc_msgSend(v4, "hasPeopleScenes"))
      v5 = 1.0;
    else
      v5 = 0.0;
  }

  return v5;
}

- (BOOL)shouldPerformSemanticalDedupingForItemFeature:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  char v7;
  char v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "doNotDedupeVideos") && (objc_msgSend(v5, "isVideo") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    if (objc_msgSend(v5, "hasPersons"))
    {
      v8 = objc_msgSend(v6, "dontSemanticallyDedupePersons");
    }
    else
    {
      if (!objc_msgSend(v5, "hasPeopleScenes"))
      {
        v7 = 1;
        goto LABEL_10;
      }
      v8 = objc_msgSend(v6, "dontSemanticallyDedupePeople");
    }
    v7 = v8 ^ 1;
  }
LABEL_10:

  return v7;
}

- (double)semanticalDedupingTimeIntervalForItemFeature:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasPersons"))
  {
    objc_msgSend(v6, "semanticalDedupingTimeIntervalForPersons");
  }
  else if (objc_msgSend(v5, "hasPeopleScenes"))
  {
    objc_msgSend(v6, "semanticalDedupingTimeIntervalForPeople");
  }
  else
  {
    objc_msgSend(v6, "semanticalDedupingTimeInterval");
  }
  v8 = v7;

  return v8;
}

- (double)semanticalDedupingSimilarityForItemFeature:(id)a3 options:(id)a4
{
  id v4;
  double v5;

  v4 = a3;
  v5 = 4.0;
  if ((objc_msgSend(v4, "hasPersons") & 1) == 0)
  {
    if (objc_msgSend(v4, "hasPeopleScenes"))
      v5 = 3.0;
    else
      v5 = 2.0;
  }

  return v5;
}

- (id)timeGroupsOfTimeSortedItemsWithTimeSortedItems:(id)a3 timeInterval:(double)a4 maximumTimeGroupExtension:(double)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(void *, void *);
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  id v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD aBlock[5];
  id v32;
  double v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__PGDejunkerDeduper_timeGroupsOfTimeSortedItemsWithTimeSortedItems_timeInterval_maximumTimeGroupExtension___block_invoke;
  aBlock[3] = &unk_1E8427808;
  v33 = a4 * a5;
  aBlock[4] = self;
  v10 = v9;
  v32 = v10;
  v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (!v13)
  {

    v16 = 0;
    v15 = 0;
    goto LABEL_17;
  }
  v14 = v13;
  v26 = v10;
  v15 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v28;
  do
  {
    v18 = 0;
    v19 = v15;
    do
    {
      if (*(_QWORD *)v28 != v17)
        objc_enumerationMutation(v12);
      v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v18);
      objc_msgSend(v20, "cls_universalDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v21;
      if (!v16)
        goto LABEL_9;
      objc_msgSend(v21, "timeIntervalSinceDate:", v19);
      if (v22 > a4)
      {
        v11[2](v11, v16);
LABEL_9:
        v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

        objc_msgSend(v23, "addObject:", v20);
        v16 = v23;
        goto LABEL_11;
      }
      objc_msgSend(v16, "addObject:", v20);
LABEL_11:

      ++v18;
      v19 = v15;
    }
    while (v14 != v18);
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  }
  while (v14);

  if (v16)
    v11[2](v11, v16);
  v10 = v26;
LABEL_17:
  v24 = v10;

  return v24;
}

- (id)splitItemGroupsWithTimeSortedItems:(id)a3 numberOfBuckets:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v18;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_msgSend(v5, "count");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      v18 = v9;
      v14 = a4 * v9;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
        if (v14 >= v10 * v6)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

          objc_msgSend(v19, "addObject:", v16);
          ++v10;
          v11 = v16;
        }
        objc_msgSend(v11, "addObject:", v15);
        ++v13;
        v14 += a4;
      }
      while (v8 != v13);
      v9 = v18 + v8;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }
  else
  {
    v11 = 0;
  }

  return v19;
}

- (id)splitItemGroupsWithItemGroups:(id)a3 maximumNumberOfItemsPerGroup:(unint64_t)a4 debugInfo:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  NSObject *loggingConnection;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v39;
  uint64_t v40;
  id obj;
  void *v42;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    v39 = a4 - 1;
    v42 = v8;
    do
    {
      v12 = 0;
      v40 = v10;
      do
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v12);
        v14 = objc_msgSend(v13, "count");
        if (v14 > a4)
        {
          v15 = v11;
          v16 = a4;
          v17 = (v39 + v14) / a4;
          -[PGDejunkerDeduper timeSortedItemsWithItems:](self, "timeSortedItemsWithItems:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGDejunkerDeduper splitItemGroupsWithTimeSortedItems:numberOfBuckets:](self, "splitItemGroupsWithTimeSortedItems:numberOfBuckets:", v18, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObjectsFromArray:", v19);
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
          {
            v34 = loggingConnection;
            v35 = objc_msgSend(obj, "count");
            v36 = objc_msgSend(v19, "count");
            *(_DWORD *)buf = 134218240;
            v50 = v35;
            v51 = 2048;
            v52 = v36;
            _os_log_debug_impl(&dword_1CA237000, v34, OS_LOG_TYPE_DEBUG, "DejunkerDeduper: cluster with %lu items, split in %lu", buf, 0x16u);

            if (v8)
            {
LABEL_9:
              objc_msgSend(v18, "lastObject");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "cls_universalDate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "firstObject");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "cls_universalDate");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "timeIntervalSinceDate:", v24);
              v26 = v25;

              v8 = v42;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f sec, %lu items, split in %lu"), v26, objc_msgSend(v18, "count"), objc_msgSend(v19, "count"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setState:ofCluster:withReason:", 1, v13, v27);

            }
          }
          else if (v8)
          {
            goto LABEL_9;
          }
          a4 = v16;
          v11 = v15;
          v10 = v40;
          goto LABEL_13;
        }
        objc_msgSend(v44, "addObject:", v13);
        if (!v8)
          goto LABEL_14;
        -[PGDejunkerDeduper timeSortedItemsWithItems:](self, "timeSortedItemsWithItems:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "cls_universalDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "cls_universalDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceDate:", v31);
        v33 = v32;

        v8 = v42;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f sec, %lu items"), v33, objc_msgSend(v13, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setState:ofCluster:withReason:", 1, v13, v19);
LABEL_13:

LABEL_14:
        ++v12;
      }
      while (v10 != v12);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      v10 = v37;
    }
    while (v37);
  }

  return v44;
}

- (id)bestItemGroupsBasedOnFaceprintsWithItemGroups:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t j;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  unint64_t v59;
  double v60;
  void *v61;
  double v62;
  uint64_t v64;
  id v65;
  uint64_t v66;
  id v67;
  id obj;
  id v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
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
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v71 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v106 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v11, "count") < 2)
        {
          objc_msgSend(v6, "addObject:", v11);
        }
        else
        {
          -[PGDejunkerDeduper itemsSortedByScoreWithItems:options:](self, "itemsSortedByScoreWithItems:options:", v11, v71);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);
          objc_msgSend(v65, "addObjectsFromArray:", v12);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
    }
    while (v8);
  }

  -[PGDejunkerDeduper faceprintByPersonLocalIdentifierByItemIdentifierWithItems:](self, "faceprintByPersonLocalIdentifierByItemIdentifierWithItems:", v65);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "identicalDedupingFaceprintDistance");
  v14 = v13;
  objc_msgSend(v71, "identifiersOfEligibleItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v67 = v6;
  v16 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v102;
    v73 = v15;
    v64 = *(_QWORD *)v102;
    do
    {
      v19 = 0;
      v66 = v17;
      do
      {
        if (*(_QWORD *)v102 != v18)
        {
          v20 = v19;
          objc_enumerationMutation(v67);
          v19 = v20;
        }
        v72 = v19;
        v21 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v19);
        if (objc_msgSend(v21, "count") == 1)
        {
          -[PGDejunkerDeduper eligibleItemsInItems:options:](self, "eligibleItemsInItems:options:", v21, v71);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count"))
            objc_msgSend(v69, "addObject:", v22);
        }
        else
        {
          -[PGDejunkerDeduper requiredItemsInItems:options:containStronglyRequiredItems:](self, "requiredItemsInItems:options:containStronglyRequiredItems:", v21, v71, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = (void *)objc_msgSend(v23, "mutableCopy");
          v70 = v23;
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = 0u;
          v98 = 0u;
          v99 = 0u;
          v100 = 0u;
          v80 = v21;
          v25 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v98;
            v74 = *(_QWORD *)v98;
            v75 = v24;
            do
            {
              v28 = 0;
              v78 = v26;
              do
              {
                if (*(_QWORD *)v98 != v27)
                  objc_enumerationMutation(v80);
                v29 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v28);
                if ((objc_msgSend(v24, "containsObject:", v29) & 1) == 0)
                {
                  if (!v15
                    || (objc_msgSend(v29, "clsIdentifier"),
                        v30 = (void *)objc_claimAutoreleasedReturnValue(),
                        v31 = objc_msgSend(v15, "containsObject:", v30),
                        v30,
                        v31))
                  {
                    v81 = v28;
                    -[PGDejunkerDeduper featureWithItem:](self, "featureWithItem:", v29);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "personLocalIdentifiers");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v29, "clsIdentifier");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v84, "objectForKeyedSubscript:", v33);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();

                    v79 = v29;
                    objc_msgSend(v29, "curationModel");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "faceModel");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                    v95 = 0u;
                    v96 = 0u;
                    v93 = 0u;
                    v94 = 0u;
                    v87 = v76;
                    v37 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
                    if (v37)
                    {
                      v38 = v37;
                      v39 = *(_QWORD *)v94;
                      v82 = *(_QWORD *)v94;
                      v83 = v36;
                      while (2)
                      {
                        v40 = 0;
                        v85 = v38;
                        do
                        {
                          if (*(_QWORD *)v94 != v39)
                            objc_enumerationMutation(v87);
                          v41 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v40);
                          v42 = objc_msgSend(v36, "version");
                          objc_msgSend(v41, "curationModel");
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v43, "faceModel");
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          v45 = objc_msgSend(v44, "version");

                          if (v42 == v45)
                          {
                            objc_msgSend(v41, "clsIdentifier");
                            v46 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v84, "objectForKeyedSubscript:", v46);
                            v47 = (void *)objc_claimAutoreleasedReturnValue();

                            v91 = 0u;
                            v92 = 0u;
                            v89 = 0u;
                            v90 = 0u;
                            v48 = v86;
                            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
                            if (v49)
                            {
                              v50 = v49;
                              v51 = *(_QWORD *)v90;
                              v52 = 0.0;
                              do
                              {
                                for (j = 0; j != v50; ++j)
                                {
                                  if (*(_QWORD *)v90 != v51)
                                    objc_enumerationMutation(v48);
                                  v54 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j);
                                  objc_msgSend(v34, "objectForKeyedSubscript:", v54);
                                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v47, "objectForKeyedSubscript:", v54);
                                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                                  v88 = 0;
                                  objc_msgSend(v55, "computeDistance:withDistanceFunction:error:", v56, 0, &v88);
                                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v57, "doubleValue");
                                  v52 = v52 + v58 * v58;

                                }
                                v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
                              }
                              while (v50);
                            }
                            else
                            {
                              v52 = 0.0;
                            }

                            v59 = objc_msgSend(v48, "count");
                            v60 = v14;
                            v36 = v83;
                            if (v14 == -1.0)
                            {
                              objc_msgSend(v83, "distanceNode");
                              v61 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v61, "operatingPoint");
                              v60 = v62;

                            }
                            v39 = v82;
                            v38 = v85;
                            if (sqrt(v52 / (double)v59) < v60)
                            {

                              goto LABEL_49;
                            }
                          }
                          ++v40;
                        }
                        while (v40 != v38);
                        v38 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
                        if (v38)
                          continue;
                        break;
                      }
                    }

                    objc_msgSend(v87, "addObject:", v79);
LABEL_49:

                    v15 = v73;
                    v27 = v74;
                    v24 = v75;
                    v26 = v78;
                    v28 = v81;
                  }
                }
                ++v28;
              }
              while (v28 != v26);
              v26 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
            }
            while (v26);
          }

          objc_msgSend(v69, "addObject:", v76);
          v18 = v64;
          v17 = v66;
          v22 = v70;
        }

        v19 = v72 + 1;
      }
      while (v72 + 1 != v17);
      v17 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
    }
    while (v17);
  }

  return v69;
}

- (id)bestItemGroupsBasedOnSceneprintsWithItemGroups:(id)a3 forSimilarity:(int64_t)a4 options:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  double v27;
  void *v29;
  void *v30;
  uint64_t v31;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  -[PGDejunkerDeduper itemsSortedByScoreWithItems:options:](self, "itemsSortedByScoreWithItems:options:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifiersOfEligibleItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v7;
  -[PGDejunkerDeduper requiredItemsInItems:options:containStronglyRequiredItems:](self, "requiredItemsInItems:options:containStronglyRequiredItems:", v8, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v10, "mutableCopy");
  v29 = v10;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v40;
    v31 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if ((objc_msgSend(v11, "containsObject:", v16) & 1) == 0)
        {
          if (!v9
            || (objc_msgSend(v16, "clsIdentifier"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v9, "containsObject:", v17),
                v17,
                v18))
          {
            v19 = v11;
            -[CLSSimilarStacker distanceThresholdForSimilarity:withSimilarityModelVersion:](self->_similarStacker, "distanceThresholdForSimilarity:withSimilarityModelVersion:", a4, objc_msgSend(v16, "clsSimilarityModelVersion"));
            v21 = v20;
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v22 = v33;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v36;
              while (2)
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v36 != v25)
                    objc_enumerationMutation(v22);
                  -[CLSSimilarStacker distanceBetweenItem:andItem:](self->_similarStacker, "distanceBetweenItem:andItem:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), v16);
                  if (v27 < v21)
                  {

                    goto LABEL_19;
                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                if (v24)
                  continue;
                break;
              }
            }

            objc_msgSend(v22, "addObject:", v16);
LABEL_19:
            v11 = v19;
            v14 = v31;
          }
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v13);
  }

  return v33;
}

- (id)timeSortedItemsWithItems:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_452);
}

- (id)itemsByFeatureWithItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[PGDejunkerDeduper featureWithItem:](self, "featureWithItem:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (!v13)
            v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);
          objc_msgSend(v13, "addObject:", v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)eligibleItemsInItems:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "identifiersOfEligibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "clsIdentifier", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v6, "containsObject:", v14);

          if (v15)
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (id)bestItemsInItems:(id)a3 options:(id)a4
{
  NSObject *loggingConnection;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315138;
    v7 = "-[PGDejunkerDeduper bestItemsInItems:options:]";
    _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)isJunkForItem:(id)a3
{
  NSObject *loggingConnection;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315138;
    v6 = "-[PGDejunkerDeduper isJunkForItem:]";
    _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (id)debugPersonStringForItem:(id)a3
{
  NSObject *loggingConnection;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315138;
    v6 = "-[PGDejunkerDeduper debugPersonStringForItem:]";
    _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
  return &stru_1E8436F28;
}

- (id)faceprintByPersonLocalIdentifierByItemIdentifierWithItems:(id)a3
{
  NSObject *loggingConnection;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315138;
    v6 = "-[PGDejunkerDeduper faceprintByPersonLocalIdentifierByItemIdentifierWithItems:]";
    _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)featureWithItem:(id)a3
{
  NSObject *loggingConnection;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315138;
    v6 = "-[PGDejunkerDeduper featureWithItem:]";
    _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
  return -[PGDejunkerDeduperFeature initWithPersonLocalIdentifiers:peopleScenes:isVideo:]([PGDejunkerDeduperFeature alloc], "initWithPersonLocalIdentifiers:peopleScenes:isVideo:", 0, 0, 0);
}

- (id)itemsSortedByScoreWithItems:(id)a3 options:(id)a4
{
  NSObject *loggingConnection;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    v6 = 136315138;
    v7 = "-[PGDejunkerDeduper itemsSortedByScoreWithItems:options:]";
    _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)requiredItemsInItems:(id)a3 options:(id)a4 containStronglyRequiredItems:(BOOL *)a5
{
  NSObject *loggingConnection;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
  {
    v7 = 136315138;
    v8 = "-[PGDejunkerDeduper requiredItemsInItems:options:containStronglyRequiredItems:]";
    _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "%s needs to be implemented by subclass", (uint8_t *)&v7, 0xCu);
  }
  return (id)MEMORY[0x1E0C9AA60];
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setLoggingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_loggingConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_kMeanTimeClusterer, 0);
  objc_storeStrong((id *)&self->_similarStacker, 0);
}

uint64_t __46__PGDejunkerDeduper_timeSortedItemsWithItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "cls_universalDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cls_universalDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "clsIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clsIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

void __107__PGDejunkerDeduper_timeGroupsOfTimeSortedItemsWithTimeSortedItems_timeInterval_maximumTimeGroupExtension___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  double v26;
  __int16 v27;
  unint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cls_universalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cls_universalDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v7);
  v9 = v8;

  v10 = *(double *)(a1 + 48);
  if (v9 <= v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  else
  {
    v11 = vcvtpd_u64_f64(v9 / v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setK:", v11);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "performWithDataset:progressBlock:", v3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "objects");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "timeSortedItemsWithItems:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v14);
    }
    v20 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v26 = v9;
      v27 = 2048;
      v28 = v11;
      _os_log_debug_impl(&dword_1CA237000, v20, OS_LOG_TYPE_DEBUG, "DejunkerDeduper: cluster with duration %f, split in %lu", buf, 0x16u);
    }

  }
}

void __73__PGDejunkerDeduper_finalItemsWithItems_options_debugInfo_progressBlock___block_invoke(id *a1, void *a2)
{
  id v3;
  unint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  id v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  v5 = a1[4];
  if (v4 < 2)
  {
    objc_msgSend(a1[4], "eligibleItemsInItems:options:", v3, a1[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "addObjectsFromArray:", v9);
  }
  else
  {
    objc_msgSend(a1[5], "finalPassTimeInterval");
    v7 = v6;
    objc_msgSend(a1[5], "finalPassMaximumTimeGroupExtension");
    objc_msgSend(v5, "timeGroupsOfTimeSortedItemsWithTimeSortedItems:timeInterval:maximumTimeGroupExtension:", v3, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "count");
          v16 = a1[4];
          v17 = a1[5];
          if (v15 < 2)
          {
            objc_msgSend(v16, "eligibleItemsInItems:options:", v14, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[6], "addObjectsFromArray:", v18);
          }
          else
          {
            objc_msgSend(v16, "bestItemsInItems:options:", v14, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[6], "addObjectsFromArray:", v18);
            objc_msgSend(a1[7], "dedupItems:toItems:withDedupingType:", v14, v18, 5);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }
  }

}

uint64_t __76__PGDejunkerDeduper_dejunkedItemsWithItems_options_debugInfo_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "clsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    if (v6 && !objc_msgSend(v6, "containsObject:", v4))
      v5 = 0;
    else
      v5 = objc_msgSend(*(id *)(a1 + 48), "isJunkForItem:", v3) ^ 1;
  }

  return v5;
}

uint64_t __76__PGDejunkerDeduper_dejunkedItemsWithItems_options_debugInfo_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isJunkForItem:", v3))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v3, "clsIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.4);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_48(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.4 + 0.4);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_49(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.8);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __81__PGDejunkerDeduper_dejunkedDedupedItemsInItems_options_debugInfo_progressBlock___block_invoke_50(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.9);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __73__PGDejunkerDeduper_CLSCurationItem_itemsSortedByScoreWithItems_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "clsContentScore");
  v8 = v7;
  objc_msgSend(v6, "clsContentScore");
  if (v8 <= v9)
  {
    if (v8 < v9)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v5, "clsIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clsIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 40)
        && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v11),
            (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v14 = v13;
        objc_msgSend(v13, "doubleValue");
        v16 = v15;

      }
      else
      {
        objc_msgSend(v5, "clsAestheticScore");
        v16 = v17;
      }
      if (*(_BYTE *)(a1 + 40)
        && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v12),
            (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v19 = v18;
        objc_msgSend(v18, "doubleValue");
        v21 = v20;

      }
      else
      {
        objc_msgSend(v6, "clsAestheticScore");
        v21 = v22;
      }
      if (v16 <= v21)
      {
        if (v16 < v21)
          v10 = 1;
        else
          v10 = objc_msgSend(v11, "compare:", v12);
      }
      else
      {
        v10 = -1;
      }

    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

void __95__PGDejunkerDeduper_CLSCurationItem_dejunkedDedupedItemIdentifiersWithItems_options_debugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "curationModelForItemInfo:options:", v7, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[PGCuratorInvestigationItem itemWithUUID:itemInfo:curationModel:](PGCuratorInvestigationItem, "itemWithUUID:itemInfo:curationModel:", v8, v7, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
}

uint64_t __65__PGDejunkerDeduper_PHAsset_itemsSortedByScoreWithItems_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  float v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  float v22;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "clsContentScore");
  v8 = v7;
  objc_msgSend(v6, "clsContentScore");
  if (v8 <= v9)
  {
    if (v8 < v9)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v5, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 40)
        && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", v11),
            (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v14 = v13;
        objc_msgSend(v13, "doubleValue");
        v16 = v15;

      }
      else
      {
        objc_msgSend(v5, "overallAestheticScore");
        v16 = v17;
      }
      if (*(_BYTE *)(a1 + 40)
        && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", v12),
            (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v19 = v18;
        objc_msgSend(v18, "doubleValue");
        v21 = v20;

      }
      else
      {
        objc_msgSend(v6, "overallAestheticScore");
        v21 = v22;
      }
      if (v16 <= v21)
      {
        if (v16 < v21)
          v10 = 1;
        else
          v10 = objc_msgSend(v11, "compare:", v12);
      }
      else
      {
        v10 = -1;
      }

    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

void __87__PGDejunkerDeduper_PHAsset_faceprintByPersonLocalIdentifierByItemIdentifierWithItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "personLocalIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "faceClusteringProperties");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "faceprint");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "faceprintData");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = objc_alloc(MEMORY[0x1E0CEDEE8]);
            v22 = 0;
            v17 = (void *)objc_msgSend(v16, "initWithState:error:", v15, &v22);
            if (v17)
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v12);

          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  v18 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CD1390], "uuidFromLocalIdentifier:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v5, v19);

}

void __60__PGDejunkerDeduper_PHAsset__buildCachesWithAssets_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isKnownPerson"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    objc_msgSend(v5, "faceQuality");
    if (v6 >= 0.0)
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 24);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24)
                                                                  + 1.0;
    }
    objc_msgSend(v5, "faceSize");
    if (v7 > 0.0)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = *(double *)(v8 + 24);
      if (v9 < v7 && v9 > 0.0)
        v7 = *(double *)(v8 + 24);
      *(double *)(v8 + 24) = v7;
    }
  }

}

void __60__PGDejunkerDeduper_PHAsset__buildCachesWithAssets_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "isKnownPerson") & 1) == 0)
  {
    objc_msgSend(v5, "faceSize");
    if (v6 >= *(double *)(a1 + 56))
    {
      objc_msgSend(v5, "faceQuality");
      if (v7 >= 0.0)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
        objc_msgSend(v5, "faceQuality");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                + 24);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + 1.0;
      }
    }
  }

}

@end
