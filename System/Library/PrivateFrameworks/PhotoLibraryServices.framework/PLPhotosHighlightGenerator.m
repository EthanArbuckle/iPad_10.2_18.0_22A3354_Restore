@implementation PLPhotosHighlightGenerator

- (PLPhotosHighlightGenerator)initWithDataManager:(id)a3 frequentLocationManager:(id)a4 localCreationDateCreator:(id)a5 dateRangeTitleGenerator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PLPhotosHighlightGenerator *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PLPhotosHighlightGenerator;
  v14 = -[PLPhotosHighlightGenerator init](&v16, sel_init);
  if ((PLPlatformHighlightsSupported() & 1) != 0)
  {
    if (v14)
    {
      objc_storeWeak((id *)&v14->_dataManager, v10);
      objc_storeStrong((id *)&v14->_frequentLocationManager, a4);
      objc_storeStrong((id *)&v14->_localCreationDateCreator, a5);
      objc_storeStrong((id *)&v14->_dateRangeTitleGenerator, a6);
      -[PLPhotosHighlightGenerator _resetProperties](v14, "_resetProperties");
    }
  }
  else
  {

    v14 = 0;
  }

  return v14;
}

- (void)_resetProperties
{
  NSDateInterval *recentHighlightsDateInterval;
  PLHighlightHierarchy *v4;
  PLHighlightHierarchy *entitiesToUpdate;
  NSMutableSet *v6;
  NSMutableSet *highlightsNeedingNewKeyAsset;
  NSMutableSet *v8;
  NSMutableSet *highlightsWithDeletedAssets;
  NSMutableSet *v10;
  NSMutableSet *upsertedHighlights;
  NSMutableSet *v12;
  NSMutableSet *highlightsToDelete;

  recentHighlightsDateInterval = self->_recentHighlightsDateInterval;
  self->_recentHighlightsDateInterval = 0;

  v4 = objc_alloc_init(PLHighlightHierarchy);
  entitiesToUpdate = self->_entitiesToUpdate;
  self->_entitiesToUpdate = v4;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  highlightsNeedingNewKeyAsset = self->_highlightsNeedingNewKeyAsset;
  self->_highlightsNeedingNewKeyAsset = v6;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  highlightsWithDeletedAssets = self->_highlightsWithDeletedAssets;
  self->_highlightsWithDeletedAssets = v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  upsertedHighlights = self->_upsertedHighlights;
  self->_upsertedHighlights = v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  highlightsToDelete = self->_highlightsToDelete;
  self->_highlightsToDelete = v12;

}

- (void)beginGenerationWithAssets:(id)a3 hiddenAssets:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[16];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLMomentGenerationGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (-[PLPhotosHighlightGenerator didCallBeginGeneration](self, "didCallBeginGeneration")
    && os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_199541000, v8, OS_LOG_TYPE_FAULT, "-[PLPhotosHighlightGenerator finishGeneration] should have been called before calling -[PLPhotosHighlightGenerator beginGenerationWithAssets:hiddenAssets:]", buf, 2u);
  }
  -[PLPhotosHighlightGenerator setDidCallBeginGeneration:](self, "setDidCallBeginGeneration:", 1);
  -[PLPhotosHighlightGenerator _resetProperties](self, "_resetProperties");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v14, "highlightBeingAssets");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dayGroupHighlightBeingAssets");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          -[PLHighlightHierarchy addDayHighlight:](self->_entitiesToUpdate, "addDayHighlight:", v15);
        if (v16)
          -[PLHighlightHierarchy addDayGroupHighlight:](self->_entitiesToUpdate, "addDayGroupHighlight:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v11);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        -[PLPhotosHighlightGenerator markHighlightNeedingNewKeyAssetsWithAsset:](self, "markHighlightNeedingNewKeyAssetsWithAsset:", v22, (_QWORD)v25);
        objc_msgSend(v22, "highlightBeingAssets");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v22, "setHighlightBeingAssets:", 0);
          objc_msgSend(v22, "setHighlightBeingSummaryAssets:", 0);
          objc_msgSend(v22, "setHighlightBeingExtendedAssets:", 0);
          objc_msgSend(v23, "removeAssetData:", v22);
          -[PLHighlightHierarchy addDayHighlight:](self->_entitiesToUpdate, "addDayHighlight:", v23);
          -[NSMutableSet addObject:](self->_highlightsWithDeletedAssets, "addObject:", v23);
        }
        objc_msgSend(v22, "dayGroupHighlightBeingAssets");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_msgSend(v22, "setDayGroupHighlightBeingAssets:", 0);
          objc_msgSend(v22, "setDayGroupHighlightBeingExtendedAssets:", 0);
          objc_msgSend(v24, "removeAssetData:", v22);
          -[PLHighlightHierarchy addDayGroupHighlight:](self->_entitiesToUpdate, "addDayGroupHighlight:", v24);
          -[NSMutableSet addObject:](self->_highlightsWithDeletedAssets, "addObject:", v24);
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v19);
  }

}

- (void)registerHighlightsWithDeletedMoments:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "kind");
        if (v10 == 3)
        {
          -[PLHighlightHierarchy addDayGroupHighlight:](self->_entitiesToUpdate, "addDayGroupHighlight:", v9);
        }
        else if (!v10)
        {
          -[PLHighlightHierarchy addDayHighlight:](self->_entitiesToUpdate, "addDayHighlight:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (PLPhotosHighlightClusterGenerator)highlightClusterGenerator
{
  PLPhotosHighlightClusterGenerator *v3;
  void *v4;
  PLFrequentLocationManager *frequentLocationManager;
  void *v6;
  PLPhotosHighlightClusterGenerator *v7;

  v3 = [PLPhotosHighlightClusterGenerator alloc];
  -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  frequentLocationManager = self->_frequentLocationManager;
  -[PLPhotosHighlightGenerator recentHighlightsDateInterval](self, "recentHighlightsDateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLPhotosHighlightClusterGenerator initWithDataManager:frequentLocationManager:recentHighlightDateInterval:localCreationDateCreator:](v3, "initWithDataManager:frequentLocationManager:recentHighlightDateInterval:localCreationDateCreator:", v4, frequentLocationManager, v6, self->_localCreationDateCreator);

  return v7;
}

- (void)generateHighlightsForUpsertedMoments:(id)a3 frequentLocationsDidChange:(BOOL)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint32_t numer;
  uint32_t denom;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  unint64_t v28;
  NSObject *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  unint64_t v33;
  NSObject *v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  id v51;
  uint64_t v52;
  uint32_t v53;
  uint32_t v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  os_signpost_id_t v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  int v70;
  id v71;
  uint64_t v72;
  uint32_t v73;
  uint32_t v74;
  NSObject *v75;
  NSObject *v76;
  uint64_t v77;
  NSObject *v78;
  double v79;
  NSMutableSet *v80;
  NSMutableSet *highlightsToDelete;
  NSMutableSet *v82;
  void *v83;
  NSMutableSet *v84;
  void *v85;
  NSObject *v86;
  os_signpost_id_t v87;
  NSObject *v88;
  NSObject *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint32_t v93;
  uint32_t v94;
  NSObject *v95;
  NSObject *v96;
  NSObject *v97;
  float v98;
  double v99;
  uint64_t v100;
  uint32_t v101;
  uint32_t v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  os_signpost_id_t v106;
  uint64_t v107;
  void *v108;
  unint64_t v109;
  NSObject *v110;
  _BOOL4 v111;
  void *v112;
  os_signpost_id_t spid;
  uint64_t v114;
  mach_timebase_info v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  mach_timebase_info v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  mach_timebase_info v133;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v136;
  __int16 v137;
  double v138;
  __int16 v139;
  double v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  uint64_t v145;

  v111 = a4;
  v145 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLMomentGenerationGetLog();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PLPhotosHighlightGenerator didCallBeginGeneration](self, "didCallBeginGeneration"))
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_199541000, v7, OS_LOG_TYPE_FAULT, "-[PLPhotosHighlightGenerator beginGenerationWithAssets:hiddenAssets:] need to be called prior to calling -[PLPhotosHighlightGenerator generateHighlightsForUpsertedMoments:frequentLocationsDidChange:]", buf, 2u);
    }

  }
  v8 = v6;
  v9 = os_signpost_id_generate(v8);
  info = 0;
  mach_timebase_info(&info);
  v10 = v8;
  v11 = v10;
  v109 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "GenerateHighlights", ", buf, 2u);
  }
  v106 = v9;

  v107 = mach_absolute_time();
  v12 = v11;
  v13 = os_signpost_id_generate(v12);
  v133 = 0;
  mach_timebase_info(&v133);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "HighlightGenerationSetup", ", buf, 2u);
  }

  v16 = mach_absolute_time();
  -[PLPhotosHighlightGenerator highlightClusterGenerator](self, "highlightClusterGenerator");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v130;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v130 != v20)
          objc_enumerationMutation(v17);
        -[PLHighlightHierarchy addMoment:](self->_entitiesToUpdate, "addMoment:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * i));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
    }
    while (v19);
  }

  v22 = mach_absolute_time();
  numer = v133.numer;
  denom = v133.denom;
  v25 = v15;
  v26 = v25;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v13, "HighlightGenerationSetup", ", buf, 2u);
  }
  v108 = v17;

  v27 = v26;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v136 = "HighlightGenerationSetup";
    v137 = 2048;
    v138 = (float)((float)((float)((float)(v22 - v16) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  v28 = 0;
  v110 = v27;
  do
  {
    v29 = v27;
    v30 = os_signpost_id_generate(v29);
    v128 = 0;
    mach_timebase_info(&v128);
    v31 = v29;
    v32 = v31;
    v33 = v30 - 1;
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "HighlightGenerationLoop", ", buf, 2u);
    }
    spid = v30;

    v114 = mach_absolute_time();
    if (v28)
    {
      PLMomentsGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v136 = (const char *)v28;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running highlight generation loop number %lu", buf, 0xCu);
      }

    }
    if (v28)
      v35 = 0;
    else
      v35 = v111;
    -[PLHighlightHierarchy moments](self->_entitiesToUpdate, "moments");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "highlightClustersIntersectingMoments:includeAllTripHighlightClusters:", v36, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v39 = v37;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v124, v143, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v125;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v125 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * j), "moments");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "unionSet:", v44);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v124, v143, 16);
      }
      while (v41);
    }

    -[PLHighlightHierarchy moments](self->_entitiesToUpdate, "moments");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "minusSet:", v45);

    if (objc_msgSend(v38, "count"))
    {
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v46 = v38;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v120, v142, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v121;
        do
        {
          for (k = 0; k != v48; ++k)
          {
            if (*(_QWORD *)v121 != v49)
              objc_enumerationMutation(v46);
            -[PLHighlightHierarchy addMoment:](self->_entitiesToUpdate, "addMoment:", *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * k));
          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v120, v142, 16);
        }
        while (v48);
      }

      v51 = 0;
    }
    else
    {
      v51 = v39;
    }
    v27 = v110;
    v52 = mach_absolute_time();
    v53 = v128.numer;
    v54 = v128.denom;
    v55 = v32;
    v56 = v55;
    if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v56, OS_SIGNPOST_INTERVAL_END, spid, "HighlightGenerationLoop", ", buf, 2u);
    }

    v57 = v56;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v136 = "HighlightGenerationLoop";
      v137 = 2048;
      v138 = (float)((float)((float)((float)(v52 - v114) * (float)v53) / (float)v54) / 1000000.0);
      _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    ++v28;

  }
  while (!v51);
  if (v28 >= 5)
  {
    PLMomentsGetLog();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v136 = (const char *)v28;
      _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_ERROR, "[HighlightsGeneration] Ran highlight generation loop more than five times(%lu)", buf, 0xCu);
    }

  }
  v59 = v57;
  v60 = os_signpost_id_generate(v59);
  v128 = 0;
  mach_timebase_info(&v128);
  v61 = v59;
  v62 = v61;
  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v62, OS_SIGNPOST_INTERVAL_BEGIN, v60, "InsertHighlights", ", buf, 2u);
  }

  v63 = mach_absolute_time();
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v64 = v51;
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v116, v141, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v117;
    do
    {
      for (m = 0; m != v66; ++m)
      {
        if (*(_QWORD *)v117 != v67)
          objc_enumerationMutation(v64);
        v69 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * m);
        v70 = objc_msgSend(v69, "kind");
        if (v70 == 3)
        {
          v71 = -[PLPhotosHighlightGenerator _insertDayGroupPhotosHighlightCluster:](self, "_insertDayGroupPhotosHighlightCluster:", v69);
        }
        else if (!v70)
        {
          -[PLPhotosHighlightGenerator _insertDayPhotosHighlightCluster:](self, "_insertDayPhotosHighlightCluster:", v69);
        }
      }
      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v116, v141, 16);
    }
    while (v66);
  }

  v72 = mach_absolute_time();
  v73 = v128.numer;
  v74 = v128.denom;
  v75 = v62;
  v76 = v75;
  if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
  {
    v77 = objc_msgSend(v64, "count");
    *(_DWORD *)buf = 134217984;
    v136 = (const char *)v77;
    _os_signpost_emit_with_name_impl(&dword_199541000, v76, OS_SIGNPOST_INTERVAL_END, v60, "InsertHighlights", "[HighlightsGeneration] Inserting/Updating %lu Highlights into Database.", buf, 0xCu);
  }

  v78 = v76;
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[HighlightsGeneration] Inserting/Updating %lu Highlights into Database."), objc_msgSend(v64, "count"));
    v79 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315650;
    v136 = "InsertHighlights";
    v137 = 2112;
    v138 = v79;
    v139 = 2048;
    v140 = (float)((float)((float)((float)(v72 - v63) * (float)v73) / (float)v74) / 1000000.0);
    _os_log_impl(&dword_199541000, v78, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v80 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  highlightsToDelete = self->_highlightsToDelete;
  self->_highlightsToDelete = v80;

  v82 = self->_highlightsToDelete;
  -[PLHighlightHierarchy dayHighlights](self->_entitiesToUpdate, "dayHighlights");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet unionSet:](v82, "unionSet:", v83);

  v84 = self->_highlightsToDelete;
  -[PLHighlightHierarchy dayGroupHighlights](self->_entitiesToUpdate, "dayGroupHighlights");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet unionSet:](v84, "unionSet:", v85);

  -[NSMutableSet minusSet:](self->_highlightsToDelete, "minusSet:", self->_upsertedHighlights);
  v86 = v78;
  v87 = os_signpost_id_generate(v86);
  v115 = 0;
  mach_timebase_info(&v115);
  v88 = v86;
  v89 = v88;
  if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v89, OS_SIGNPOST_INTERVAL_BEGIN, v87, "InsertMonthYear", ", buf, 2u);
  }

  v90 = mach_absolute_time();
  -[NSMutableSet allObjects](self->_upsertedHighlights, "allObjects");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlightGenerator generateHighlightListForUpdatedHighlights:deletedHighlights:](self, "generateHighlightListForUpdatedHighlights:deletedHighlights:", v91, self->_highlightsToDelete);

  v92 = mach_absolute_time();
  v94 = v115.numer;
  v93 = v115.denom;
  v95 = v89;
  v96 = v95;
  if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v96, OS_SIGNPOST_INTERVAL_END, v87, "InsertMonthYear", "[HighlightsGeneration] Generate Month/Year pass completed.", buf, 2u);
  }

  v97 = v96;
  if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
  {
    v98 = (float)((float)((float)(v92 - v90) * (float)v94) / (float)v93) / 1000000.0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[HighlightsGeneration] Generate Month/Year pass completed."));
    v99 = COERCE_DOUBLE((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315650;
    v136 = "InsertMonthYear";
    v137 = 2112;
    v138 = v99;
    v139 = 2048;
    v140 = v98;
    _os_log_impl(&dword_199541000, v97, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  v100 = mach_absolute_time();
  v101 = info.numer;
  v102 = info.denom;
  v103 = v97;
  v104 = v103;
  if (v109 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v104, OS_SIGNPOST_INTERVAL_END, v106, "GenerateHighlights", ", buf, 2u);
  }

  v105 = v104;
  if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v136 = "GenerateHighlights";
    v137 = 2048;
    v138 = (float)((float)((float)((float)(v100 - v107) * (float)v101) / (float)v102) / 1000000.0);
    _os_log_impl(&dword_199541000, v105, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (id)_highlightToReuseForMoments:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t (**v19)(_QWORD, _QWORD, _QWORD);
  id v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  __int128 v38;
  void *v39;
  id obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[6];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  id *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v60 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v9, "highlight");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          if ((objc_msgSend(v10, "isDeleted") & 1) == 0)
          {
            -[PLPhotosHighlightGenerator upsertedHighlights](self, "upsertedHighlights");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "containsObject:", v11);

            if ((v13 & 1) == 0)
            {
              objc_msgSend(v5, "objectForKey:", v11);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "unsignedIntegerValue");

              objc_msgSend(v9, "assets");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "count");

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v18, v11);

              objc_msgSend(v39, "addObject:", v11);
            }
          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    }
    while (v6);
  }

  v53 = 0;
  v54 = (id *)&v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__42467;
  v57 = __Block_byref_object_dispose__42468;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__42467;
  v51 = __Block_byref_object_dispose__42468;
  v52 = 0;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __58__PLPhotosHighlightGenerator__highlightToReuseForMoments___block_invoke;
  v46[3] = &unk_1E366A228;
  v46[4] = &v47;
  v46[5] = &v53;
  v19 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v46);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v20 = v5;
  v21 = 0;
  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v69, 16);
  if (v22)
  {
    v41 = *(_QWORD *)v43;
    *(_QWORD *)&v23 = 138412802;
    v38 = v23;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v43 != v41)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v24);
        objc_msgSend(v20, "objectForKey:", v25, v38);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "startDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v28 = ((uint64_t (**)(_QWORD, void *, void *))v19)[2](v19, v26, v27);
          if (!v28)
          {
            PLMomentsGetLog();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v21, "uuid");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "uuid");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v38;
              v64 = v27;
              v65 = 2112;
              v66 = v33;
              v67 = 2112;
              v68 = v34;
              _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Picking between two highlights to reuse that start on the same date(%@) bestHighlight:(%@) currentHighlight:(%@)", buf, 0x20u);

            }
            goto LABEL_21;
          }
          if (v28 != -1)
            goto LABEL_22;
        }
        v29 = v25;

        objc_storeStrong(v54 + 5, v27);
        v30 = v48;
        v31 = v26;
        v32 = v30[5];
        v30[5] = (uint64_t)v31;
        v21 = v29;
LABEL_21:

LABEL_22:
        ++v24;
      }
      while (v22 != v24);
      v35 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v69, 16);
      v22 = v35;
    }
    while (v35);
  }

  v36 = v21;
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v36;
}

- (void)_insertDayPhotosHighlightCluster:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  char v27;
  _BOOL4 v28;
  char v29;
  char v30;
  int v31;
  int v32;
  _BOOL4 v33;
  id v34;

  v34 = a3;
  objc_msgSend(v34, "moments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlightGenerator _highlightToReuseForMoments:](self, "_highlightToReuseForMoments:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && !objc_msgSend(v5, "isDeleted"))
  {
    v9 = 0;
  }
  else
  {
    -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertNewPhotosHighlight");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setPromotionScore:", 0.3);
    v9 = 1;
    v6 = v8;
  }
  -[PLPhotosHighlightGenerator upsertedHighlights](self, "upsertedHighlights");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v6);

  v31 = objc_msgSend(v6, "category");
  v32 = objc_msgSend(v34, "category");
  v33 = (v9 & 1) != 0
     || -[PLPhotosHighlightGenerator shouldForceVisibilityStateUpdateForHighlight:highlightCluster:](self, "shouldForceVisibilityStateUpdateForHighlight:highlightCluster:", v6, v34);
  v11 = -[PLPhotosHighlightGenerator _updateHighlightProperties:fromHighlightCluster:](self, "_updateHighlightProperties:fromHighlightCluster:", v6, v34);
  -[PLPhotosHighlightGenerator highlightsWithDeletedAssets](self, "highlightsWithDeletedAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v12, "containsObject:", v6);

  objc_msgSend(v34, "assets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v9 & 1) != 0)
    goto LABEL_16;
  v15 = objc_msgSend(v13, "count");
  objc_msgSend(v6, "assets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count") != v15 || !objc_msgSend(v16, "isEqualToSet:", v14))
  {
    v25 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v25, "minusSet:", v16);

    v14 = v25;
LABEL_16:
    v20 = v14;
    objc_msgSend(v34, "assets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAssets:", v14);
    v21 = 1;
LABEL_17:

    goto LABEL_18;
  }
  if (v11)
  {
LABEL_36:

    v20 = 0;
    v21 = 0;
    goto LABEL_17;
  }
  v17 = v4;
  v18 = objc_msgSend(v17, "count");
  objc_msgSend(v6, "moments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 != objc_msgSend(v19, "count"))
  {

    goto LABEL_36;
  }
  v29 = objc_msgSend(v19, "isEqualToSet:", v17);

  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  if ((v29 & 1) == 0)
  {
LABEL_18:
    objc_msgSend(v6, "setMoments:", v4);
    v23 = 1;
    v22 = v20;
    v24 = v21;
  }
  if (v32 == 1)
  {
    -[PLPhotosHighlightGenerator updateRecentHighlightCurationForHighlight:](self, "updateRecentHighlightCurationForHighlight:", v6);
  }
  else if (v31 == 1)
  {
    -[PLPhotosHighlightGenerator resetPreviousRecentHighlightCurationForHighlight:](self, "resetPreviousRecentHighlightCurationForHighlight:", v6);
    objc_msgSend(v6, "assets");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotosHighlightGenerator updateCurationForHighlight:withAssetsBelongingToCuration:](self, "updateCurationForHighlight:withAssetsBelongingToCuration:", v6, v26);

  }
  else if ((v9 & 1) != 0
         || (objc_msgSend(v22, "count") ? (v27 = 1) : (v27 = v30),
             (v27 & 1) != 0
          || (objc_msgSend(v6, "missingKeyAssetForKindShared") & 1) != 0
          || objc_msgSend(v6, "missingKeyAssetForKindPrivate")))
  {
    -[PLPhotosHighlightGenerator updateCurationForHighlight:withAssetsBelongingToCuration:](self, "updateCurationForHighlight:withAssetsBelongingToCuration:", v6, v22);
  }
  v28 = -[PLPhotosHighlightGenerator setVisibilityStateForHighlight:shouldForceUpdate:](self, "setVisibilityStateForHighlight:shouldForceUpdate:", v6, v33);
  if (((v11 | v23 | v24) & 1) != 0 || v28)
  {
    objc_msgSend((id)objc_opt_class(), "updateTitlesForHighlight:dateRangeTitleGenerator:options:", v6, self->_dateRangeTitleGenerator, 0);
    objc_msgSend(v6, "bumpHighlightVersion");
  }

}

- (id)_insertDayGroupPhotosHighlightCluster:(id)a3
{
  void *v4;
  void *v5;
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
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char v36;
  int v37;
  int v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  char v46;
  _BOOL4 v47;
  void *v49;
  void *v50;
  unsigned int v51;
  _BOOL4 v52;
  _BOOL4 v53;
  char v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  objc_msgSend(v55, "moments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v62 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "highlight");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && (objc_msgSend(v11, "isDeleted") & 1) == 0)
        {
          objc_msgSend(v5, "addObject:", v12);
          objc_msgSend(v12, "parentDayGroupPhotosHighlight");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            if ((objc_msgSend(v13, "isDeleted") & 1) == 0)
            {
              -[PLPhotosHighlightGenerator upsertedHighlights](self, "upsertedHighlights");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "containsObject:", v14);

              if ((v16 & 1) == 0)
                objc_msgSend(v56, "addObject:", v14);
            }
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v8);
  }

  objc_msgSend(v56, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 && !objc_msgSend(v17, "isDeleted"))
  {
    v21 = 0;
  }
  else
  {
    -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertNewPhotosHighlight");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setPromotionScore:", 0.3);
    v21 = 1;
    v18 = v20;
  }
  -[PLPhotosHighlightGenerator upsertedHighlights](self, "upsertedHighlights");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v18);

  v23 = v55;
  v24 = (v21 & 1) != 0
     || -[PLPhotosHighlightGenerator shouldForceVisibilityStateUpdateForHighlight:highlightCluster:](self, "shouldForceVisibilityStateUpdateForHighlight:highlightCluster:", v18, v55);
  v25 = -[PLPhotosHighlightGenerator _updateHighlightProperties:fromHighlightCluster:](self, "_updateHighlightProperties:fromHighlightCluster:", v18, v55);
  -[PLPhotosHighlightGenerator highlightsWithDeletedAssets](self, "highlightsWithDeletedAssets");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v26, "containsObject:", v18);

  objc_msgSend(v55, "assets");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if ((v21 & 1) == 0)
  {
    v29 = objc_msgSend(v27, "count");
    objc_msgSend(v18, "dayGroupAssets");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "count") == v29 && (objc_msgSend(v30, "isEqualToSet:", v28) & 1) != 0)
    {
      if (!v25)
      {
        v52 = v25;
        v31 = v5;
        objc_msgSend(v18, "childDayGroupPhotosHighlights");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v31;
        v34 = objc_msgSend(v31, "count");
        if (v34 == objc_msgSend(v32, "count"))
        {
          v35 = v33;
          v36 = objc_msgSend(v33, "isEqualToSet:", v32);

          v25 = v52;
          if ((v36 & 1) != 0)
          {
            v37 = 0;
            v38 = 0;
            v28 = 0;
            goto LABEL_42;
          }
          goto LABEL_41;
        }

        v25 = v52;
      }

LABEL_41:
      objc_msgSend(v18, "setChildDayGroupPhotosHighlights:", v5);
      v37 = 0;
      v28 = 0;
      v38 = 1;
LABEL_42:
      if (objc_msgSend(v28, "count"))
        v46 = 1;
      else
        v46 = v54;
      if ((v46 & 1) == 0
        && (objc_msgSend(v18, "missingKeyAssetForKindShared") & 1) == 0
        && !objc_msgSend(v18, "missingKeyAssetForKindPrivate"))
      {
        goto LABEL_49;
      }
      goto LABEL_48;
    }
    v51 = v24;
    v53 = v25;
    v49 = (void *)objc_msgSend(v28, "mutableCopy");
    objc_msgSend(v49, "minusSet:", v30);
    v50 = v30;
    v39 = (void *)objc_msgSend(v30, "mutableCopy");
    objc_msgSend(v39, "minusSet:", v28);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v40 = v39;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v58 != v43)
            objc_enumerationMutation(v40);
          -[PLPhotosHighlightGenerator resetDayGroupCurationForAsset:](self, "resetDayGroupCurationForAsset:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v42);
    }

    v28 = v49;
    v23 = v55;
    v24 = v51;
    v25 = v53;
  }
  objc_msgSend(v23, "assets");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDayGroupAssets:", v45);

  objc_msgSend(v18, "setChildDayGroupPhotosHighlights:", v5);
  v37 = 1;
  v38 = 1;
  if ((v21 & 1) == 0)
    goto LABEL_42;
LABEL_48:
  -[PLPhotosHighlightGenerator updateCurationForHighlight:withAssetsBelongingToCuration:](self, "updateCurationForHighlight:withAssetsBelongingToCuration:", v18, v28);
LABEL_49:
  v47 = -[PLPhotosHighlightGenerator setVisibilityStateForHighlight:shouldForceUpdate:](self, "setVisibilityStateForHighlight:shouldForceUpdate:", v18, v24);
  if (((v25 | v38 | v37) & 1) != 0 || v47)
  {
    objc_msgSend((id)objc_opt_class(), "updateTitlesForHighlight:dateRangeTitleGenerator:options:", v18, self->_dateRangeTitleGenerator, 0);
    objc_msgSend(v18, "bumpHighlightVersion");
  }

  return v18;
}

- (BOOL)_updateHighlightProperties:(id)a3 fromHighlightCluster:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v16;
  int v17;
  int v18;
  int v19;
  void *v20;
  void *v21;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v5, "type");
  v7 = objc_msgSend(v5, "kind");
  v16 = objc_msgSend(v5, "category");
  v18 = objc_msgSend(v5, "startTimeZoneOffset");
  v19 = objc_msgSend(v5, "endTimeZoneOffset");
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "type");
  v11 = objc_msgSend(v6, "kind");
  v12 = objc_msgSend(v6, "category");
  v13 = objc_msgSend(v6, "startTimeZoneOffset");
  v17 = objc_msgSend(v6, "endTimeZoneOffset");

  v14 = (_DWORD)a4 != (_DWORD)v10;
  if ((_DWORD)a4 != (_DWORD)v10)
    objc_msgSend(v5, "setType:", v10);
  if (v7 != (_DWORD)v11)
  {
    objc_msgSend(v5, "setKind:", v11);
    v14 = 1;
  }
  if (v16 != (_DWORD)v12)
  {
    objc_msgSend(v5, "setCategory:", v12);
    v14 = 1;
  }
  if ((objc_msgSend(v21, "isEqualToDate:", v8) & 1) == 0)
  {
    objc_msgSend(v5, "setStartDate:", v8);
    v14 = 1;
  }
  if ((objc_msgSend(v20, "isEqualToDate:", v9) & 1) == 0)
  {
    objc_msgSend(v5, "setEndDate:", v9);
    v14 = 1;
  }
  if (v18 != (_DWORD)v13)
  {
    objc_msgSend(v5, "setStartTimeZoneOffset:", v13);
    v14 = 1;
  }
  if (v19 != v17)
  {
    objc_msgSend(v5, "setEndTimeZoneOffset:");
    v14 = 1;
  }

  return v14;
}

- (void)finishGeneration
{
  uint64_t i;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PLPhotosHighlightGenerator highlightsToDelete](self, "highlightsToDelete");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v3, "moments");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "count");
        if (v5)
        {
          v23 = v5;
          v26 = v3;
          v6 = (void *)objc_msgSend(CFSTR("["), "mutableCopy");
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v7 = v4;
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
          if (v8)
          {
            v9 = v8;
            v10 = 0;
            v11 = *(_QWORD *)v28;
            do
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v28 != v11)
                  objc_enumerationMutation(v7);
                v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                if ((v10 & 1) != 0)
                  objc_msgSend(v6, "appendString:", CFSTR(", "));
                objc_msgSend(v13, "uuid");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "appendString:", v14);

                v10 = 1;
              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
            }
            while (v9);
          }

          objc_msgSend(v6, "appendString:", CFSTR("]"));
          PLMomentsGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          v3 = v26;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v26, "uuid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v36 = v16;
            v37 = 2048;
            v38 = v23;
            v39 = 2112;
            v40 = v6;
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_FAULT, "Highlight(%@) being deleted has %lu moments(%@)", buf, 0x20u);

          }
        }
        objc_msgSend(v3, "delete");

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    }
    while (v25);
  }

  -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = (void *)objc_opt_class();
    -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateKeyAssetForHighlights:", v20);

  }
  -[PLPhotosHighlightGenerator setDidCallBeginGeneration:](self, "setDidCallBeginGeneration:", 0);
}

- (void)processRecentHighlights
{
  NSObject *v3;
  NSDateInterval *recentHighlightsDateInterval;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  id *p_isa;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  PLPhotosHighlightGenerator *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[16];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  PLMomentsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running periodic maintenance task to update recent Highlights", buf, 2u);
  }

  +[PLMomentGenerationUtils today](PLMomentGenerationUtils, "today");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  recentHighlightsDateInterval = self->_recentHighlightsDateInterval;
  self->_recentHighlightsDateInterval = 0;

  -[PLPhotosHighlightGenerator fetchAllRecentHighlights](self, "fetchAllRecentHighlights");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "moments");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unionSet:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v9);
  }
  v40 = v7;

  v42 = self;
  -[PLPhotosHighlightGenerator fetchAllOngoingTripDayGroupHighlights](self, "fetchAllOngoingTripDayGroupHighlights");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v48 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v18, "childDayGroupPhotosHighlights");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v44;
          do
          {
            for (k = 0; k != v21; ++k)
            {
              if (*(_QWORD *)v44 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * k), "moments");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "unionSet:", v24);

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
          }
          while (v21);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v15);
  }
  p_isa = (id *)&v42->super.isa;
  if (+[PLAggregationProcessor isEnabled](PLAggregationProcessor, "isEnabled"))
  {
    +[PLAggregationProcessor allowedStartDateToAggregate](PLAggregationProcessor, "allowedStartDateToAggregate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "lastRecentHighlightUpdateDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqualToDate:", v28);

    if (v29)
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v26, v41);
      if (!v30)
        goto LABEL_33;
    }
    else
    {
      +[PLAggregationProcessor timeIntervalOfRecentContentToIgnore](PLAggregationProcessor, "timeIntervalOfRecentContentToIgnore");
      objc_msgSend(v27, "dateByAddingTimeInterval:", -v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "compare:", v26) == -1)
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v32, v26);
      else
        v30 = 0;

      if (!v30)
        goto LABEL_33;
    }
    -[PLPhotosHighlightGenerator dataManager](v42, "dataManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "momentsIntersectingDateInterval:", v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addObjectsFromArray:", v34);
    p_isa = (id *)&v42->super.isa;
LABEL_33:

  }
  objc_msgSend(p_isa, "_fetchAllMoments");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(p_isa, "dataManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "processingMomentsFromMoments:", v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(p_isa[3], "frequentLocationsDidChangeFromUpdateWithAllMoments:", v37);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(p_isa, "beginGenerationWithAssets:hiddenAssets:", v39, MEMORY[0x1E0C9AA60]);

  objc_msgSend(p_isa, "generateHighlightsForUpsertedMoments:frequentLocationsDidChange:", v6, v38);
  objc_msgSend(p_isa, "finishGeneration");
  objc_msgSend((id)objc_opt_class(), "setLastRecentHighlightUpdateDate:", v41);

}

- (void)processUnprocessedMomentLocations
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  char *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  BOOL v43;
  unint64_t v44;
  void *v45;
  void *v46;
  int v47;
  NSObject *v48;
  char *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  unint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  char *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint32_t numer;
  uint32_t denom;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  PLPhotosHighlightGenerator *v81;
  os_signpost_id_t spid;
  uint64_t v83;
  __CFString *v84;
  unint64_t v85;
  NSObject *v86;
  __CFString *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  id obj;
  uint64_t v93;
  PLCompactMomentClustering *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  unint64_t v99;
  void *v100;
  id v101;
  NSObject *v102;
  _BOOL4 v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  mach_timebase_info info;
  _BYTE v119[128];
  _BYTE v120[128];
  uint8_t v121[128];
  uint8_t buf[4];
  const char *v123;
  __int16 v124;
  double v125;
  __int16 v126;
  __CFString *v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  PLMomentGenerationGetLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  info = 0;
  mach_timebase_info(&info);
  v5 = v3;
  v6 = v5;
  v85 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ProcessUnprocessedMomentLocations", ", buf, 2u);
  }
  spid = v4;

  v83 = mach_absolute_time();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataManager);
  objc_msgSend(WeakRetained, "fetchLocationsOfInterestIfNeeded");
  v90 = WeakRetained;
  v8 = objc_msgSend(WeakRetained, "routineIsAvailable");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFrequentLocationManager currentFrequentLocations](self->_frequentLocationManager, "currentFrequentLocations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = v6;
  if (v9)
  {
    -[PLPhotosHighlightGenerator _fetchAllMoments](self, "_fetchAllMoments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "processingMomentsFromMoments:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v103 = -[PLFrequentLocationManager frequentLocationsDidChangeFromUpdateWithAllMoments:](self->_frequentLocationManager, "frequentLocationsDidChangeFromUpdateWithAllMoments:", v12);
    if (v103)
      -[PLPhotosHighlightGenerator _fetchMomentsRequiringLocationProcessingWhenFrequentLocationsChanged](self, "_fetchMomentsRequiringLocationProcessingWhenFrequentLocationsChanged");
    else
      -[PLPhotosHighlightGenerator _fetchMomentsRequiringLocationProcessingWhenFrequentLocationsAreAvailable](self, "_fetchMomentsRequiringLocationProcessingWhenFrequentLocationsAreAvailable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "addObjectsFromArray:", v13);

  }
  else
  {
    v103 = 0;
  }
  v14 = CFSTR("unavailable");
  if (v8)
  {
    -[PLPhotosHighlightGenerator _fetchMomentsRequiringLocationProcessingWhenCoreRoutineIsAvailable](self, "_fetchMomentsRequiringLocationProcessingWhenCoreRoutineIsAvailable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "addObjectsFromArray:", v15);

    v14 = CFSTR("available");
  }
  v16 = CFSTR("available");
  if (!v9)
    v16 = CFSTR("unavailable");
  *(double *)&v17 = COERCE_DOUBLE(v16);
  v18 = CFSTR("did not change");
  if (v103)
    v18 = CFSTR("changed");
  v19 = v18;
  v20 = objc_msgSend(v88, "count");
  PLMomentsGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  v87 = v19;
  if (v20)
  {
    if (v22)
    {
      *(_DWORD *)buf = 138412802;
      v123 = (const char *)v14;
      v124 = 2112;
      v125 = *(double *)&v17;
      v126 = 2112;
      v127 = v19;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running periodic maintenance task to update moment processed locations, routine %@ and frequent locations %@ (%@)", buf, 0x20u);
    }
    v84 = v17;

    v81 = self;
    -[PLFrequentLocationManager currentFrequentLocations](self->_frequentLocationManager, "currentFrequentLocations");
    v21 = objc_claimAutoreleasedReturnValue();
    v101 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    obj = v88;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v121, 16);
    v24 = v90;
    if (v23)
    {
      v25 = v23;
      v26 = 0;
      v27 = *(_QWORD *)v115;
      v102 = v21;
      v89 = *(_QWORD *)v115;
      do
      {
        v28 = 0;
        v91 = v25;
        do
        {
          if (*(_QWORD *)v115 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v28);
          v30 = MEMORY[0x19AEC1554]();
          if (v26 >= 0x64)
          {
            if (objc_msgSend(v24, "hasChanges"))
            {
              v113 = 0;
              v31 = objc_msgSend(v24, "save:", &v113);
              v32 = (char *)v113;
              if ((v31 & 1) == 0)
              {
                PLMomentsGetLog();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v123 = v32;
                  _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "[HighlightsGeneration] Error saving changes while processing location, error: %@", buf, 0xCu);
                }

              }
            }
            v26 = 0;
          }
          v98 = (void *)v30;
          v99 = v26;
          objc_msgSend(v29, "assets");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "anyObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "assetComparisonSortDescriptors");
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = (void *)v36;
          v38 = (void *)MEMORY[0x1E0C9AA60];
          if (v36)
            v38 = (void *)v36;
          v39 = v38;

          v96 = v39;
          v97 = v34;
          objc_msgSend(v34, "sortedArrayUsingDescriptors:", v39);
          v40 = objc_claimAutoreleasedReturnValue();
          v94 = -[PLCompactMomentClustering initWithDataManager:frequentLocations:]([PLCompactMomentClustering alloc], "initWithDataManager:frequentLocations:", v24, v21);
          v95 = (void *)v40;
          -[PLCompactMomentClustering createAssetClustersForAssetsInDay:](v94, "createAssetClustersForAssetsInDay:", v40);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v100, "count");
          if (v41 == 1)
          {
            v42 = objc_msgSend(v29, "processedLocation");
            +[PLMomentGenerationUtils processLocationIfNecessaryInMoment:usingManager:frequentLocations:frequentLocationsDidChange:](PLMomentGenerationUtils, "processLocationIfNecessaryInMoment:usingManager:frequentLocations:frequentLocationsDidChange:", v29, v24, v21, v103);
            v43 = v42 == objc_msgSend(v29, "processedLocation");
            v45 = v98;
            v44 = v99;
            if (v43)
              goto LABEL_62;
            v93 = v28;
            objc_msgSend(v29, "uniqueObjectID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "addObject:", v46);
          }
          else
          {
            v47 = v41;
            PLMomentsGetLog();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v29, "uuid");
              v49 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v123 = v49;
              v124 = 1024;
              LODWORD(v125) = v47;
              _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_INFO, "[HighlightsGeneration] Split assets in moment with uuid %@ into %d separate moments", buf, 0x12u);

            }
            v93 = v28;

            v111 = 0u;
            v112 = 0u;
            v109 = 0u;
            v110 = 0u;
            v50 = v100;
            v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
            if (v51)
            {
              v52 = v51;
              v53 = 0;
              v46 = 0;
              v54 = *(_QWORD *)v110;
              do
              {
                for (i = 0; i != v52; ++i)
                {
                  if (*(_QWORD *)v110 != v54)
                    objc_enumerationMutation(v50);
                  v56 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
                  objc_msgSend(v56, "assets");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = objc_msgSend(v57, "count");

                  if (v58 > v53)
                  {
                    v59 = v56;

                    v53 = v58;
                    v46 = v59;
                  }
                }
                v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
              }
              while (v52);
            }
            else
            {
              v46 = 0;
            }

            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            v60 = v50;
            v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
            v24 = v90;
            if (v61)
            {
              v62 = v61;
              v63 = *(_QWORD *)v106;
              do
              {
                for (j = 0; j != v62; ++j)
                {
                  if (*(_QWORD *)v106 != v63)
                    objc_enumerationMutation(v60);
                  v65 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
                  if (v65 == v46)
                    v66 = v29;
                  else
                    v66 = 0;
                  v67 = v66;
                  +[PLAssetCollectionGenerator createMomentOrUpdateForAssetCluster:affectedMoment:dataManager:](PLAssetCollectionGenerator, "createMomentOrUpdateForAssetCluster:affectedMoment:dataManager:", v65, v67, v90);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PLMomentGenerationUtils processLocationIfNecessaryInMoment:usingManager:frequentLocations:frequentLocationsDidChange:](PLMomentGenerationUtils, "processLocationIfNecessaryInMoment:usingManager:frequentLocations:frequentLocationsDidChange:", v68, v90, v102, v103);
                  objc_msgSend(v29, "uniqueObjectID");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v101, "addObject:", v69);
                }
                v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
              }
              while (v62);
            }

            v21 = v102;
            v27 = v89;
            v25 = v91;
            v45 = v98;
            v44 = v99;
            v34 = v97;
          }

          v28 = v93;
LABEL_62:
          v26 = v44 + 1;

          objc_autoreleasePoolPop(v45);
          ++v28;
        }
        while (v28 != v25);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v121, 16);
      }
      while (v25);
    }

    v104 = 0;
    objc_msgSend(v24, "momentsWithUniqueIDs:error:", v101, &v104);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (char *)v104;
    if (v70)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPhotosHighlightGenerator beginGenerationWithAssets:hiddenAssets:](v81, "beginGenerationWithAssets:hiddenAssets:", v72, MEMORY[0x1E0C9AA60]);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v70);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPhotosHighlightGenerator generateHighlightsForUpsertedMoments:frequentLocationsDidChange:](v81, "generateHighlightsForUpsertedMoments:frequentLocationsDidChange:", v73, v103);

      -[PLPhotosHighlightGenerator finishGeneration](v81, "finishGeneration");
      v74 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v77 = v86;
      v78 = v86;
      v79 = v78;
      if (v85 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v79, OS_SIGNPOST_INTERVAL_END, spid, "ProcessUnprocessedMomentLocations", ", buf, 2u);
      }

      if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v123 = "ProcessUnprocessedMomentLocations";
        v124 = 2048;
        v125 = (float)((float)((float)((float)(v74 - v83) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_199541000, v79, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }
    else
    {
      PLMomentsGetLog();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v123 = v71;
        _os_log_impl(&dword_199541000, v80, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Failed to fetch moments with updated locations with error: %@", buf, 0xCu);
      }

      v77 = v86;
    }

    v17 = v84;
  }
  else
  {
    v77 = v86;
    if (v22)
    {
      *(_DWORD *)buf = 138412802;
      v123 = (const char *)v14;
      v124 = 2112;
      v125 = *(double *)&v17;
      v126 = 2112;
      v127 = v87;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Periodic maintenance task to update moment processed locations completed without processing any moments, routine %@ and frequent locations %@ (%@)", buf, 0x20u);
    }
  }

}

- (void)updateHighlightTitles
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  _QWORD v48[5];

  v48[2] = *MEMORY[0x1E0C80C00];
  PLMomentsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running periodic maintenance task to update highlight titles", buf, 2u);
  }

  +[PLMomentGenerationUtils today](PLMomentGenerationUtils, "today");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "lastHighlightTitlesUpdateDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "year");
  v35 = v8;
  if (v9 == objc_msgSend(v8, "year"))
  {
    objc_msgSend(v5, "dateByAddingTimeInterval:", -604800.0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
    objc_msgSend(v6, "rangeOfUnit:startDate:interval:forDate:", 4, &v42, 0, v5);
    v10 = v42;
  }
  v36 = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.endDate >= %@"), v10);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %ld OR kind = %ld"), 0, 3);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3528];
  v33 = (void *)v12;
  v34 = (void *)v11;
  v48[0] = v11;
  v48[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v16, "allPhotosHighlightsWithPredicate:error:", v15, &v41);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v41;

  PLMomentsGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = (uint64_t)v18;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "[HighlightsGeneration] Error while fetching highlights needing title update: %@", buf, 0xCu);
    }

  }
  else
  {
    v30 = v7;
    v31 = v5;
    v32 = v4;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 134218242;
      v45 = v21;
      v46 = 2112;
      v47 = v36;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running on %lu highlights, since date %@", buf, 0x16u);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v29 = v17;
    v22 = v17;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v38;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v38 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v26);
          v28 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend((id)objc_opt_class(), "updateTitlesForHighlight:dateRangeTitleGenerator:options:", v27, self->_dateRangeTitleGenerator, 1);
          objc_autoreleasePoolPop(v28);
          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v24);
    }

    v4 = v32;
    objc_msgSend((id)objc_opt_class(), "setLastHighlightTitlesUpdateDay:", v32);
    v7 = v30;
    v5 = v31;
    v17 = v29;
  }

}

- (void)cleanupEmptyHighlights
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t n;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t ii;
  id v74;
  void *context;
  PLPhotosHighlightGenerator *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  id obj;
  __int128 v87;
  __int128 v88;
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
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  id v112;
  id v113;
  id v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint8_t v120[128];
  uint8_t buf[4];
  uint64_t v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  PLMomentsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Running periodic maintenance task to cleanup empty highlights", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = 0;
  objc_msgSend(v6, "allEmptyPhotosHighlightsOfKind:error:", 0, &v114);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v114;

  if (v7)
  {
    -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v8;
    objc_msgSend(v9, "allEmptyPhotosHighlightsOfKind:error:", 3, &v113);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v113;

    if (v10)
    {
      v12 = objc_msgSend(v7, "count");
      v84 = v5;
      if (v12)
      {
        v13 = v12;
        v79 = (void *)MEMORY[0x19AEC1554]();
        v80 = v7;
        objc_msgSend(v4, "addObjectsFromArray:", v7);
        PLMomentsGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v122 = v13;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Found %lu empty days. Cleaning up.", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY childPhotosHighlights IN (%@)"), v4);
        v15 = objc_claimAutoreleasedReturnValue();
        v76 = self;
        -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v11;
        v78 = (void *)v15;
        objc_msgSend(v16, "allPhotosHighlightsOfKind:withPredicate:error:", 1, v15, &v112);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v112;

        v81 = v4;
        objc_msgSend(v4, "_pl_map:", &__block_literal_global_42413);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        obj = v17;
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v109;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v109 != v21)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
              objc_msgSend(v23, "childPhotosHighlights");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "_pl_map:", &__block_literal_global_76_42414);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v25, "isSubsetOfSet:", v18))
              {
                PLMomentsGetLog();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v23, "uuid");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v122 = (uint64_t)v27;
                  v28 = v26;
                  v29 = "[HighlightsGeneration] Month %@ will be empty. Cleaning up.";
LABEL_19:
                  _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);

                  v5 = v84;
                }
              }
              else
              {
                if (objc_msgSend(v25, "count"))
                  goto LABEL_21;
                PLMomentsGetLog();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v23, "uuid");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v122 = (uint64_t)v27;
                  v28 = v26;
                  v29 = "[HighlightsGeneration] Month %@ is empty. Cleaning up.";
                  goto LABEL_19;
                }
              }

              objc_msgSend(v5, "addObject:", v23);
LABEL_21:

            }
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
          }
          while (v20);
        }

        v30 = objc_msgSend(v5, "count");
        if (v30)
        {
          v31 = v30;
          context = (void *)MEMORY[0x19AEC1554]();
          PLMomentsGetLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v122 = v31;
            _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Found %lu empty months. Cleaning up.", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY childPhotosHighlights IN (%@)"), v5);
          v33 = objc_claimAutoreleasedReturnValue();
          -[PLPhotosHighlightGenerator dataManager](v76, "dataManager");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = v82;
          v77 = (void *)v33;
          objc_msgSend(v34, "allPhotosHighlightsOfKind:withPredicate:error:", 2, v33, &v107);
          v35 = v5;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v107;

          objc_msgSend(v35, "_pl_map:", &__block_literal_global_78);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          v106 = 0u;
          v83 = v36;
          v38 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v103, v119, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v104;
            do
            {
              for (j = 0; j != v39; ++j)
              {
                if (*(_QWORD *)v104 != v40)
                  objc_enumerationMutation(v83);
                v42 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
                objc_msgSend(v42, "childPhotosHighlights");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "_pl_map:", &__block_literal_global_80_42418);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v44, "isSubsetOfSet:", v37))
                {
                  PLMomentsGetLog();
                  v45 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v42, "uuid");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v122 = (uint64_t)v46;
                    v47 = v45;
                    v48 = "[HighlightsGeneration] Year %@ will be empty. Cleaning up.";
LABEL_37:
                    _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_DEFAULT, v48, buf, 0xCu);

                  }
                }
                else
                {
                  if (objc_msgSend(v44, "count"))
                    goto LABEL_39;
                  PLMomentsGetLog();
                  v45 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v42, "uuid");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v122 = (uint64_t)v46;
                    v47 = v45;
                    v48 = "[HighlightsGeneration] Year %@ is empty. Cleaning up.";
                    goto LABEL_37;
                  }
                }

                objc_msgSend(v85, "addObject:", v42);
LABEL_39:

              }
              v39 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v103, v119, 16);
            }
            while (v39);
          }

          v49 = objc_msgSend(v85, "count");
          v4 = v81;
          if (v49)
          {
            v50 = v49;
            PLMomentsGetLog();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v122 = v50;
              _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Found %lu empty years. Cleaning up.", buf, 0xCu);
            }

          }
          objc_autoreleasePoolPop(context);
          v52 = v74;
        }
        else
        {
          v4 = v81;
          v52 = v82;
        }

        objc_autoreleasePoolPop(v79);
        v11 = v52;
        v7 = v80;
      }
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v55 = v4;
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v99, v118, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v100;
        do
        {
          for (k = 0; k != v57; ++k)
          {
            if (*(_QWORD *)v100 != v58)
              objc_enumerationMutation(v55);
            objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * k), "delete");
          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v99, v118, 16);
        }
        while (v57);
      }

      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v60 = v84;
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v96;
        do
        {
          for (m = 0; m != v62; ++m)
          {
            if (*(_QWORD *)v96 != v63)
              objc_enumerationMutation(v60);
            objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * m), "delete");
          }
          v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
        }
        while (v62);
      }

      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v65 = v85;
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v91, v116, 16);
      if (v66)
      {
        v67 = v66;
        v68 = *(_QWORD *)v92;
        do
        {
          for (n = 0; n != v67; ++n)
          {
            if (*(_QWORD *)v92 != v68)
              objc_enumerationMutation(v65);
            objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * n), "delete");
          }
          v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v91, v116, 16);
        }
        while (v67);
      }

      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v53 = v10;
      v70 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
      if (v70)
      {
        v71 = v70;
        v72 = *(_QWORD *)v88;
        do
        {
          for (ii = 0; ii != v71; ++ii)
          {
            if (*(_QWORD *)v88 != v72)
              objc_enumerationMutation(v53);
            objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * ii), "delete");
          }
          v71 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
        }
        while (v71);
      }

      v5 = v84;
    }
    else
    {
      PLMomentsGetLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v122 = (uint64_t)v11;
        _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_ERROR, "Cleanup Empty Day Group Highlights error:%@", buf, 0xCu);
      }

      v53 = 0;
    }
  }
  else
  {
    PLMomentsGetLog();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v122 = (uint64_t)v8;
      _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_ERROR, "Cleanup Empty Day Highlights error:%@", buf, 0xCu);
    }
    v11 = v8;
  }

}

- (NSDateInterval)recentHighlightsDateInterval
{
  void *v3;
  void *v4;

  +[PLMomentGenerationUtils today](PLMomentGenerationUtils, "today");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlightGenerator _recentHighlightsDateIntervalWithDate:](self, "_recentHighlightsDateIntervalWithDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateInterval *)v4;
}

- (id)_recentHighlightsDateIntervalWithDate:(id)a3
{
  id v4;
  NSDateInterval *recentHighlightsDateInterval;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDateInterval *v10;
  NSDateInterval *v11;
  NSDateInterval *v12;

  v4 = a3;
  recentHighlightsDateInterval = self->_recentHighlightsDateInterval;
  if (!recentHighlightsDateInterval)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pl_endOfPreviousDayForDate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pl_dateByAddingDays:toDate:", 1, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pl_endOfDayForDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSDateInterval *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v9);
    v11 = self->_recentHighlightsDateInterval;
    self->_recentHighlightsDateInterval = v10;

    recentHighlightsDateInterval = self->_recentHighlightsDateInterval;
  }
  v12 = recentHighlightsDateInterval;

  return v12;
}

- (id)_fetchAllMoments
{
  void *v2;
  void *v3;
  uint64_t v5;

  -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "allMomentsWithError:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_fetchMomentsRequiringLocationProcessingWhenCoreRoutineIsAvailable
{
  void *v2;
  void *v3;
  uint64_t v5;

  -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "momentsRequiringLocationProcessingWhenCoreRoutineIsAvailable:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_fetchMomentsRequiringLocationProcessingWhenFrequentLocationsAreAvailable
{
  void *v2;
  void *v3;
  uint64_t v5;

  -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "momentsRequiringLocationProcessingWhenFrequentLocationsAreAvailable:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_fetchMomentsRequiringLocationProcessingWhenFrequentLocationsChanged
{
  void *v2;
  void *v3;
  uint64_t v5;

  -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "momentsRequiringLocationProcessingWhenFrequentLocationsChangedWithError:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_highlightMomentClustersForMoments:(id)a3 excludingMomentIds:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PLMomentCluster *v19;
  NSObject *v20;
  PLMomentCluster *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v28 = v6;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    v29 = v7;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v14, "uniqueObjectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "containsObject:", v15) & 1) == 0)
        {
          objc_msgSend(v7, "addObject:", v15);
          objc_msgSend(v14, "highlight");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "uniqueObjectID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v8, "containsObject:", v18))
            {

              v19 = 0;
LABEL_16:

              goto LABEL_17;
            }
            objc_msgSend(v8, "addObject:", v18);
            objc_msgSend(v17, "momentsSortedByTime");
            v22 = v11;
            v23 = v12;
            v24 = v9;
            v25 = v8;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[PLMomentCluster initWithMoments:]([PLMomentCluster alloc], "initWithMoments:", v26);

            v8 = v25;
            v9 = v24;
            v12 = v23;
            v11 = v22;
            v7 = v29;
          }
          else
          {
            PLMomentsGetLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "[HighlightsGeneration] Fallback adding single moment to momentArray.", buf, 2u);
            }

            v21 = [PLMomentCluster alloc];
            v36 = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[PLMomentCluster initWithMoments:](v21, "initWithMoments:", v18);
          }

          if (v19)
            objc_msgSend(v30, "addObject:", v19);
          goto LABEL_16;
        }
LABEL_17:

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v11);
  }

  return v30;
}

- (id)_collectMomentsRequiringReprocessingFromMoments:(id)a3 withAllMoments:(id)a4
{
  id v5;
  id v6;
  double Current;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v36;
  id v37;
  uint64_t v38;
  id obj;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  double v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  v43 = (id)objc_msgSend(v5, "mutableCopy");
  v8 = objc_msgSend(v6, "count");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v5;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
  if (v45)
  {
    v9 = *(_QWORD *)v47;
    v36 = v8 - 1;
    v37 = v6;
    v38 = *(_QWORD *)v47;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v10);
        objc_msgSend(v11, "highlight");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          PLMomentsGetLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "uuid");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "startDate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "debugDescription");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "endDate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "debugDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "uuid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "startDate");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "debugDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "endDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "debugDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544643;
            v51 = (uint64_t)v44;
            v52 = 2113;
            v53 = (uint64_t)v14;
            v54 = 2113;
            v55 = *(double *)&v15;
            v56 = 2114;
            v57 = v16;
            v58 = 2113;
            v59 = v17;
            v60 = 2113;
            v61 = v19;
            _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Trying to reprocess a moment that is still connected to a highlight. Moment: %{public}@, %{private}@, %{private}@, Highlight: %{public}@, %{private}@, %{private}@", buf, 0x3Eu);

            v9 = v38;
            v6 = v37;

          }
          objc_msgSend(v43, "removeObject:", v11);
        }
        else
        {
          v20 = objc_msgSend(v6, "indexOfObject:", v11);
          v21 = v20;
          if (v20)
          {
            if (v20 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_10;
            objc_msgSend(v6, "objectAtIndexedSubscript:", v20 - 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "highlight");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v23 && !objc_msgSend(v23, "type"))
            {
              objc_msgSend(v24, "moments");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "unionSet:", v25);

            }
            v9 = v38;
          }
          if (v21 < v36)
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", v21 + 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "highlight");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27 && !objc_msgSend(v27, "type"))
            {
              objc_msgSend(v28, "moments");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "unionSet:", v29);

            }
          }
        }
LABEL_10:

        ++v10;
      }
      while (v45 != v10);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
      v45 = v30;
    }
    while (v30);
  }

  v31 = CFAbsoluteTimeGetCurrent();
  PLMomentsGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = objc_msgSend(v43, "count");
    v34 = objc_msgSend(obj, "count");
    *(_DWORD *)buf = 134218496;
    v51 = v33;
    v52 = 2048;
    v53 = v34;
    v54 = 2048;
    v55 = (v31 - Current) * 1000.0;
    _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "[HighlightsGeneration] Collected %lu moments requiring reprocessing from %lu moments without highlights took %f ms", buf, 0x20u);
  }

  return v43;
}

- (PLFrequentLocationManager)frequentLocationManager
{
  return self->_frequentLocationManager;
}

- (PLLocalCreationDateCreator)localCreationDateCreator
{
  return self->_localCreationDateCreator;
}

- (PLDateRangeTitleGenerator)dateRangeTitleGenerator
{
  return self->_dateRangeTitleGenerator;
}

- (PLHighlightHierarchy)entitiesToUpdate
{
  return self->_entitiesToUpdate;
}

- (void)setEntitiesToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_entitiesToUpdate, a3);
}

- (NSMutableSet)highlightsWithDeletedAssets
{
  return self->_highlightsWithDeletedAssets;
}

- (void)setHighlightsWithDeletedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_highlightsWithDeletedAssets, a3);
}

- (NSMutableSet)upsertedHighlights
{
  return self->_upsertedHighlights;
}

- (void)setUpsertedHighlights:(id)a3
{
  objc_storeStrong((id *)&self->_upsertedHighlights, a3);
}

- (NSMutableSet)highlightsToDelete
{
  return self->_highlightsToDelete;
}

- (void)setHighlightsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_highlightsToDelete, a3);
}

- (BOOL)didCallBeginGeneration
{
  return self->_didCallBeginGeneration;
}

- (void)setDidCallBeginGeneration:(BOOL)a3
{
  self->_didCallBeginGeneration = a3;
}

- (PLMomentGenerationDataManagement)dataManager
{
  return (PLMomentGenerationDataManagement *)objc_loadWeakRetained((id *)&self->_dataManager);
}

- (void)setDataManager:(id)a3
{
  objc_storeWeak((id *)&self->_dataManager, a3);
}

- (NSMutableSet)highlightsNeedingNewKeyAsset
{
  return self->_highlightsNeedingNewKeyAsset;
}

- (void)setHighlightsNeedingNewKeyAsset:(id)a3
{
  objc_storeStrong((id *)&self->_highlightsNeedingNewKeyAsset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightsNeedingNewKeyAsset, 0);
  objc_destroyWeak((id *)&self->_dataManager);
  objc_storeStrong((id *)&self->_highlightsToDelete, 0);
  objc_storeStrong((id *)&self->_upsertedHighlights, 0);
  objc_storeStrong((id *)&self->_highlightsWithDeletedAssets, 0);
  objc_storeStrong((id *)&self->_entitiesToUpdate, 0);
  objc_storeStrong((id *)&self->_dateRangeTitleGenerator, 0);
  objc_storeStrong((id *)&self->_localCreationDateCreator, 0);
  objc_storeStrong((id *)&self->_frequentLocationManager, 0);
  objc_storeStrong((id *)&self->_recentHighlightsDateInterval, 0);
}

uint64_t __52__PLPhotosHighlightGenerator_cleanupEmptyHighlights__block_invoke_2_79(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __52__PLPhotosHighlightGenerator_cleanupEmptyHighlights__block_invoke_77(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __52__PLPhotosHighlightGenerator_cleanupEmptyHighlights__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __52__PLPhotosHighlightGenerator_cleanupEmptyHighlights__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __58__PLPhotosHighlightGenerator__highlightToReuseForMoments___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "compare:", a2);
  if (!v6)
    v6 = objc_msgSend(v5, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  return v6;
}

+ (void)updateTitlesForHighlight:(id)a3 dateRangeTitleGenerator:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "_updateTitlesForHighlight:dateRangeTitleGenerator:options:filter:", v9, v8, a5, 1);
  objc_msgSend(a1, "_updateTitlesForHighlight:dateRangeTitleGenerator:options:filter:", v9, v8, a5, 2);
  objc_msgSend(a1, "_updateTitlesForHighlight:dateRangeTitleGenerator:options:filter:", v9, v8, a5, 0);

}

+ (void)_updateTitlesForHighlight:(id)a3 dateRangeTitleGenerator:(id)a4 options:(unint64_t)a5 filter:(unsigned __int16)a6
{
  uint64_t v6;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  __CFString *v13;
  unsigned int v14;
  __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  id v19;

  v6 = a6;
  v19 = a3;
  v9 = a4;
  if ((_DWORD)v6)
  {
    if ((_DWORD)v6 == 2)
    {
      objc_msgSend(v19, "titleShared");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((_DWORD)v6 != 1)
      {
        v12 = 0;
        v11 = v19;
        goto LABEL_9;
      }
      objc_msgSend(v19, "title");
      v10 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v19, "titleMixed");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = v19;
  v12 = (void *)v10;
LABEL_9:
  +[PLPhotosHighlightTitleGenerator titleForHighlight:filter:dateRangeTitleGenerator:options:](PLPhotosHighlightTitleGenerator, "titleForHighlight:filter:dateRangeTitleGenerator:options:", v11, v6, v9, a5);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    v14 = objc_msgSend(v19, "type");
    if (v14 <= 4 && ((1 << v14) & 0x16) != 0)
    {
      +[PLPhotosHighlightTitleGenerator titleForHighlight:filter:dateRangeTitleGenerator:options:](PLPhotosHighlightTitleGenerator, "titleForHighlight:filter:dateRangeTitleGenerator:options:", v19, v6, v9, a5 | 0x10);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString length](v13, "length") || -[__CFString length](v15, "length"))
      {
        if (v13)
          v16 = v13;
        else
          v16 = &stru_1E36789C0;
        if (v15)
          v17 = v15;
        else
          v17 = &stru_1E36789C0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v16, CFSTR(""), v17);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }

      v13 = (__CFString *)v18;
    }
  }
  if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) == 0
    && (objc_msgSend(v12, "length") || -[__CFString length](v13, "length")))
  {
    if ((_DWORD)v6)
    {
      if ((_DWORD)v6 == 2)
      {
        objc_msgSend(v19, "setTitleShared:", v13);
      }
      else if ((_DWORD)v6 == 1)
      {
        objc_msgSend(v19, "setTitle:", v13);
      }
    }
    else
    {
      objc_msgSend(v19, "setTitleMixed:", v13);
    }
  }

}

+ (id)lastHighlightTitlesUpdateDay
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastHighlightTitlesUpdateDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (void)setLastHighlightTitlesUpdateDay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastHighlightTitlesUpdateDate"));

}

+ (id)lastRecentHighlightUpdateDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastRecentHighlightUpdateDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (void)setLastRecentHighlightUpdateDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastRecentHighlightUpdateDate"));

}

+ (id)userDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
}

- (void)updateCurationForHighlight:(id)a3 withAssetsBelongingToCuration:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  char v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "kind");
  if ((v8 - 1) < 2)
  {
    PLMomentsGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Trying to update curation on a non-supported highlight kind: %@", (uint8_t *)&v23, 0xCu);

    }
    goto LABEL_8;
  }
  if (v8 == 3)
  {
    -[PLPhotosHighlightGenerator _updateDayGroupHighlight:withNewAssets:](self, "_updateDayGroupHighlight:withNewAssets:", v6, v7);
    objc_msgSend(v6, "dayGroupExtendedAssets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v8)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_14;
  }
  -[PLPhotosHighlightGenerator _updateDayHighlight:withNewAssets:](self, "_updateDayHighlight:withNewAssets:", v6, v7);
  objc_msgSend(v6, "extendedAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v13 = v9;
  if (v9)
  {
    v14 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v14;

LABEL_14:
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v6, "promotionScore");
    if (v15 < 0.3)
      objc_msgSend(v6, "setPromotionScore:");
    v16 = objc_msgSend(v6, "sharingComposition");
    switch(v16)
    {
      case 0:
        v17 = 1;
LABEL_23:
        objc_msgSend(v6, "keyAssetForKindPrivate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "missingKeyAssetForKindPrivate") & 1) != 0
          || !objc_msgSend(v12, "containsObject:", v18))
        {
          goto LABEL_31;
        }
        v19 = objc_msgSend((id)objc_opt_class(), "assetEligibleForCuration:", v18);
        v20 = v19;
        v21 = v19 ^ 1;

        if (((v17 | v21) & 1) != 0)
          goto LABEL_29;
LABEL_26:
        objc_msgSend(v6, "keyAssetForKindShared");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "missingKeyAssetForKindShared") & 1) == 0
          && objc_msgSend(v12, "containsObject:", v18))
        {
          v20 = objc_msgSend((id)objc_opt_class(), "assetEligibleForCuration:", v18);

LABEL_29:
          if ((v20 & 1) != 0)
            break;
          goto LABEL_32;
        }
LABEL_31:

LABEL_32:
        -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v6);

        break;
      case 1:
        goto LABEL_26;
      case 2:
        v17 = 0;
        goto LABEL_23;
    }
  }
  else
  {
    objc_msgSend(v6, "setPromotionScore:", 0.2);
  }

}

- (void)resetDayGroupCurationForAsset:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PLPhotosHighlightGenerator markHighlightNeedingNewKeyAssetsWithAsset:](self, "markHighlightNeedingNewKeyAssetsWithAsset:", v6);
  objc_msgSend(v6, "dayGroupHighlightBeingAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v6, "setDayGroupHighlightBeingAssets:", 0);
  objc_msgSend(v6, "dayGroupHighlightBeingExtendedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "setDayGroupHighlightBeingExtendedAssets:", 0);

}

- (BOOL)shouldForceVisibilityStateUpdateForHighlight:(id)a3 highlightCluster:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  v10 = 1;
  if (objc_msgSend(v6, "enrichmentState"))
  {
    v8 = objc_msgSend(v6, "category");
    if (v8 == objc_msgSend(v7, "category"))
    {
      v9 = objc_msgSend(v6, "type");
      if ((_DWORD)v9 == objc_msgSend(v7, "type")
        && (objc_msgSend(v6, "visibilityState")
         || !-[PLPhotosHighlightGenerator _highlightTypeSupportsVisibilityStateDayOnly:](self, "_highlightTypeSupportsVisibilityStateDayOnly:", v9)))
      {
        v10 = 0;
      }
    }
  }

  return v10;
}

- (BOOL)setVisibilityStateForHighlight:(id)a3 shouldForceUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BOOL v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  v7 = -[PLPhotosHighlightGenerator _setVisibilityStateForHighlight:shouldForceUpdate:sharingConsideration:](self, "_setVisibilityStateForHighlight:shouldForceUpdate:sharingConsideration:", v6, v4, 0);
  v8 = -[PLPhotosHighlightGenerator _setVisibilityStateForHighlight:shouldForceUpdate:sharingConsideration:](self, "_setVisibilityStateForHighlight:shouldForceUpdate:sharingConsideration:", v6, v4, 1);
  LOBYTE(v4) = -[PLPhotosHighlightGenerator _setVisibilityStateForHighlight:shouldForceUpdate:sharingConsideration:](self, "_setVisibilityStateForHighlight:shouldForceUpdate:sharingConsideration:", v6, v4, 2);

  return v7 || v8 || v4;
}

- (BOOL)_setVisibilityStateForHighlight:(id)a3 shouldForceUpdate:(BOOL)a4 sharingConsideration:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  __CFString *v9;
  __CFString *v10;
  unsigned int v11;
  void *v12;
  int v13;
  int v14;
  unsigned __int16 v15;
  BOOL v16;
  void *v17;
  BOOL v19;

  v6 = a4;
  v8 = a3;
  if ((unint64_t)a5 > 2)
    v9 = 0;
  else
    v9 = off_1E3667868[a5];
  v10 = v9;
  v11 = objc_msgSend(v8, "type");
  objc_msgSend(v8, "valueForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedShortValue");

  v14 = objc_msgSend(v8, "sharingComposition");
  if (a5 == 2 || v14 == 2 || !a5 && !v14 || (v15 = 0, a5 == 1) && v14 == 1)
  {
    if (-[PLPhotosHighlightGenerator _highlightShouldNotBeVisible:sharingConsideration:](self, "_highlightShouldNotBeVisible:sharingConsideration:", v8, a5))
    {
      v15 = 0;
    }
    else
    {
      v19 = objc_msgSend(v8, "category") == 1 || v11 == 5;
      if (v19)
        v15 = 1;
      else
        v15 = v13;
      if (!v19 && v6)
      {
        if (v11 > 7)
          goto LABEL_13;
        if (((1 << v11) & 0x16) != 0)
        {
          if (_os_feature_enabled_impl())
            v15 = 1;
          else
            v15 = 2;
        }
        else if (((1 << v11) & 0x89) != 0)
        {
          _os_feature_enabled_impl();
          v15 = 1;
        }
        else
        {
          v15 = 0;
          v16 = 0;
          if (v11 != 6)
            goto LABEL_15;
        }
      }
    }
  }
  if (v13 != v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v17, v10);

    v16 = 1;
    goto LABEL_15;
  }
LABEL_13:
  v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)_highlightShouldNotBeVisible:(id)a3 sharingConsideration:(int64_t)a4
{
  id v5;
  double v6;
  BOOL v7;
  int v8;
  int v9;

  v5 = a3;
  objc_msgSend(v5, "promotionScore");
  if (v6 != 0.2)
  {
    v8 = objc_msgSend(v5, "kind");
    if (v8 == 3)
    {
      switch(a4)
      {
        case 2:
          v9 = objc_msgSend(v5, "dayGroupExtendedAssetsCount");
          goto LABEL_18;
        case 1:
          v9 = objc_msgSend(v5, "dayGroupExtendedAssetsCountShared");
          goto LABEL_18;
        case 0:
          v9 = objc_msgSend(v5, "dayGroupExtendedAssetsCountPrivate");
          goto LABEL_18;
      }
    }
    else if (!v8)
    {
      switch(a4)
      {
        case 2:
          v9 = objc_msgSend(v5, "extendedCount");
          goto LABEL_18;
        case 1:
          v9 = objc_msgSend(v5, "extendedCountShared");
          goto LABEL_18;
        case 0:
          v9 = objc_msgSend(v5, "extendedCountPrivate");
LABEL_18:
          v7 = v9 == 0;
          goto LABEL_19;
      }
    }
    v7 = 0;
    goto LABEL_19;
  }
  v7 = 1;
LABEL_19:

  return v7;
}

- (BOOL)_highlightTypeSupportsVisibilityStateDayOnly:(unsigned __int16)a3
{
  return (a3 < 8u) & (0xA9u >> a3);
}

- (void)markHighlightNeedingNewKeyAssetsWithAsset:(id)a3
{
  void *v4;
  void *v5;
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
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "highlightBeingKeyAssetPrivate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dayGroupHighlightBeingKeyAssetPrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "monthHighlightBeingKeyAssetPrivate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "yearHighlightBeingKeyAssetPrivate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "highlightBeingKeyAssetShared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dayGroupHighlightBeingKeyAssetShared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "monthHighlightBeingKeyAssetShared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "yearHighlightBeingKeyAssetShared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v20, "setHighlightBeingKeyAssetPrivate:", 0);
    -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v4);

  }
  if (v5)
  {
    objc_msgSend(v20, "setDayGroupHighlightBeingKeyAssetPrivate:", 0);
    -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v5);

  }
  if (v6)
  {
    objc_msgSend(v20, "setMonthHighlightBeingKeyAssetPrivate:", 0);
    -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v6);

  }
  if (v7)
  {
    objc_msgSend(v20, "setYearHighlightBeingKeyAssetPrivate:", 0);
    -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v7);

  }
  if (v8)
  {
    objc_msgSend(v20, "setHighlightBeingKeyAssetShared:", 0);
    -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v8);

  }
  if (v9)
  {
    objc_msgSend(v20, "setDayGroupHighlightBeingKeyAssetShared:", 0);
    -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v9);

  }
  if (v10)
  {
    objc_msgSend(v20, "setMonthHighlightBeingKeyAssetShared:", 0);
    -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v10);

  }
  if (v11)
  {
    objc_msgSend(v20, "setYearHighlightBeingKeyAssetShared:", 0);
    -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v11);

  }
}

- (void)_updateDayHighlight:(id)a3 withNewAssets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __74__PLPhotosHighlightGenerator_Curation___updateDayHighlight_withNewAssets___block_invoke;
  v25[3] = &unk_1E366DCA0;
  v25[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterUsingPredicate:", v9);

  v10 = objc_msgSend(v6, "type");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = v10 - 7;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v14 > 0xFFFFFFFD)
          -[PLPhotosHighlightGenerator markHighlightNeedingNewKeyAssetsWithAsset:](self, "markHighlightNeedingNewKeyAssetsWithAsset:", v17, (_QWORD)v21);
        else
          -[PLPhotosHighlightGenerator resetDayGroupCurationForAsset:](self, "resetDayGroupCurationForAsset:", v17);
        if (objc_msgSend(v8, "containsObject:", v17, (_QWORD)v21))
        {
          objc_msgSend(v17, "setHighlightBeingSummaryAssets:", v6);
          v18 = v6;
LABEL_15:
          objc_msgSend(v17, "setHighlightBeingExtendedAssets:", v18);
          continue;
        }
        objc_msgSend(v17, "highlightBeingSummaryAssets");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          objc_msgSend(v17, "setHighlightBeingSummaryAssets:", 0);
        objc_msgSend(v17, "highlightBeingExtendedAssets");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v18 = 0;
          goto LABEL_15;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v13);
  }

}

- (void)_updateDayGroupHighlight:(id)a3 withNewAssets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __79__PLPhotosHighlightGenerator_Curation___updateDayGroupHighlight_withNewAssets___block_invoke;
  v23[3] = &unk_1E366DCA0;
  v23[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterUsingPredicate:", v9);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[PLPhotosHighlightGenerator markHighlightNeedingNewKeyAssetsWithAsset:](self, "markHighlightNeedingNewKeyAssetsWithAsset:", v15, (_QWORD)v19);
        v16 = objc_msgSend(v8, "containsObject:", v15);
        v17 = v6;
        if ((v16 & 1) == 0)
        {
          objc_msgSend(v15, "dayGroupHighlightBeingExtendedAssets", v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            continue;
          v17 = 0;
        }
        objc_msgSend(v15, "setDayGroupHighlightBeingExtendedAssets:", v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v12);
  }

}

uint64_t __79__PLPhotosHighlightGenerator_Curation___updateDayGroupHighlight_withNewAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "assetEligibleForCuration:", v2);

  return v3;
}

uint64_t __74__PLPhotosHighlightGenerator_Curation___updateDayHighlight_withNewAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "assetEligibleForCuration:", v2);

  return v3;
}

+ (BOOL)_shouldUpdateKeyAssetForParentHighlight:(id)a3 withPrivateKeyAssetObjectID:(id)a4 andSharedKeyAssetObjectID:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    if (v8)
    {
      objc_msgSend(v7, "keyAssetForKindPrivate");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v10, "uniqueObjectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v10) = objc_msgSend(v11, "isEqual:", v8);
      if ((v10 & 1) != 0)
        goto LABEL_7;
    }
  }
  if (v7
    && v9
    && (objc_msgSend(v7, "keyAssetForKindShared"),
        v12 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)v12, "uniqueObjectID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        (id)v12,
        LOBYTE(v12) = objc_msgSend(v13, "isEqual:", v9),
        v13,
        (v12 & 1) != 0))
  {
LABEL_7:
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (void)_updateMixedSharingCompositionKeyAssetRelationshipForHighlight:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "keyAssetForKindPrivate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v17, "keyAssetForKindShared"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v17, "keyAssetForKindShared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "keyAssetForKindPrivate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithObjects:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_bestAssetInAssets:fallback:", v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "hasLibraryScope"))
      v12 = 2;
    else
      v12 = 1;
    objc_msgSend(v17, "setMixedSharingCompositionKeyAssetRelationship:", v12);

  }
  else
  {
    objc_msgSend(v17, "keyAssetForKindShared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = v17;
      v15 = 2;
    }
    else
    {
      objc_msgSend(v17, "keyAssetForKindPrivate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v17;
      v15 = v16 != 0;
    }
    objc_msgSend(v14, "setMixedSharingCompositionKeyAssetRelationship:", v15);
  }

}

+ (void)_updateParentHighlightNeedingNewKeyAsset:(id)a3 withProvisionalKeyAssetPrivate:(id)a4 andProvisionalKeyAssetShared:(id)a5 updatedHighlights:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    v15 = 0;
    if (v12)
      goto LABEL_3;
LABEL_5:
    v17 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v10, "keyAssetForKindPrivate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueObjectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setKeyAssetForKindPrivate:", v11);
  if (!v12)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v10, "keyAssetForKindShared");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uniqueObjectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setKeyAssetForKindShared:", v12);
LABEL_6:
  objc_msgSend((id)objc_opt_class(), "_updateMixedSharingCompositionKeyAssetRelationshipForHighlight:", v10);
  if ((objc_msgSend(v10, "missingKeyAssetForKindPrivate") & 1) == 0
    && (objc_msgSend(v10, "missingKeyAssetForKindShared") & 1) == 0)
  {
    objc_msgSend(v13, "addObject:", v10);
  }
  objc_msgSend(v10, "parentPhotosHighlight");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqual:", v10))
  {
    PLMomentsGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "objectID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Ignoring call to update parent highlight (parent is set to self) for: %{public}@", (uint8_t *)&v21, 0xCu);

    }
  }
  else if (objc_msgSend(a1, "_shouldUpdateKeyAssetForParentHighlight:withPrivateKeyAssetObjectID:andSharedKeyAssetObjectID:", v18, v15, v17))
  {
    objc_msgSend(a1, "_updateParentHighlightNeedingNewKeyAsset:withProvisionalKeyAssetPrivate:andProvisionalKeyAssetShared:updatedHighlights:", v18, v11, v12, v13);
  }

}

+ (void)updateKeyAssetForHighlights:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  _QWORD v38[4];
  _QWORD v39[6];

  v39[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38[0] = &unk_1E375F270;
  v38[1] = &unk_1E375F2A0;
  v39[0] = &unk_1E375F288;
  v39[1] = &unk_1E375F2B8;
  v38[2] = &unk_1E375F2D0;
  v38[3] = &unk_1E375F300;
  v39[2] = &unk_1E375F2E8;
  v39[3] = &unk_1E375F318;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __68__PLPhotosHighlightGenerator_Curation__updateKeyAssetForHighlights___block_invoke;
  v33[3] = &unk_1E366BAC0;
  v24 = v5;
  v34 = v24;
  objc_msgSend(v6, "sortedArrayUsingComparator:", v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    v27 = *(_QWORD *)v30;
    v28 = a1;
    v26 = v9;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v14) & 1) == 0 && (objc_msgSend(v14, "isDeleted") & 1) == 0)
        {
          objc_msgSend(v14, "keyAssetForKindPrivate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uniqueObjectID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "keyAssetForKindShared");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uniqueObjectID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)objc_opt_class(), "provisionalKeyAssetForHighlight:sharingConsideration:", v14, 0);
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "provisionalKeyAssetForHighlight:sharingConsideration:", v14, 1);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setKeyAssetForKindPrivate:", v19);
          objc_msgSend(v14, "setKeyAssetForKindShared:", v20);
          if (v19 | v20)
          {
            objc_msgSend((id)objc_opt_class(), "_updateMixedSharingCompositionKeyAssetRelationshipForHighlight:", v14);
            objc_msgSend(v14, "parentPhotosHighlight");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(a1, "_shouldUpdateKeyAssetForParentHighlight:withPrivateKeyAssetObjectID:andSharedKeyAssetObjectID:", v21, v16, v18))objc_msgSend(a1, "_updateParentHighlightNeedingNewKeyAsset:withProvisionalKeyAssetPrivate:andProvisionalKeyAssetShared:updatedHighlights:", v21, v19, v20, v8);
            objc_msgSend(v14, "parentDayGroupPhotosHighlight");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(a1, "_shouldUpdateKeyAssetForParentHighlight:withPrivateKeyAssetObjectID:andSharedKeyAssetObjectID:", v22, v16, v18))objc_msgSend(v28, "_updateParentHighlightNeedingNewKeyAsset:withProvisionalKeyAssetPrivate:andProvisionalKeyAssetShared:updatedHighlights:", v22, v19, v20, v8);

            a1 = v28;
            v9 = v26;
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v14, "uuid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v36 = v23;
            _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "No provisonal key asset found for highlight: %@", buf, 0xCu);

            a1 = v28;
          }

          v12 = v27;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v11);
  }

}

+ (id)provisionalKeyAssetForHighlight:(id)a3 sharingConsideration:(int64_t)a4
{
  id v6;
  int v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(v6, "kind");
  if ((v7 - 1) < 2)
  {
    objc_msgSend(a1, "_provisionalKeyAssetForMonthAndYearHighlight:sharingConsideration:", v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (v7 == 3)
  {
    objc_msgSend(a1, "_provisionalKeyAssetForDayGroupHighlight:sharingConsideration:", v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      v9 = 0;
      goto LABEL_9;
    }
    objc_msgSend(a1, "_provisionalKeyAssetForDayHighlight:sharingConsideration:", v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_9:

  return v9;
}

+ (id)_provisionalKeyAssetForDayHighlight:(id)a3 sharingConsideration:(int64_t)a4
{
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = objc_msgSend(v7, "sharingComposition");
  if (a4 == 2 || v8 == 2)
  {
    switch(a4)
    {
      case 2:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotosHighlightGenerator+Curation.m"), 531, CFSTR("Invalid sharing consideration for provisional key asset."));

        break;
      case 1:
LABEL_12:
        objc_msgSend(v7, "extendedAssetsShared");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 0:
LABEL_11:
        objc_msgSend(v7, "extendedAssetsPrivate");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v11 = (void *)v10;
LABEL_16:
        objc_msgSend(a1, "_bestAssetInAssets:fallback:", v11, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
    }
    v11 = 0;
    goto LABEL_16;
  }
  if (!a4 && !v8)
    goto LABEL_11;
  v9 = 0;
  if (a4 == 1 && v8 == 1)
    goto LABEL_12;
LABEL_17:

  return v9;
}

+ (id)_provisionalKeyAssetForDayGroupHighlight:(id)a3 sharingConsideration:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = v7;
  objc_msgSend(v7, "childDayGroupPhotosHighlights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v10)
    goto LABEL_21;
  v11 = v10;
  v12 = *(_QWORD *)v25;
  v13 = 0.0;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v25 != v12)
        objc_enumerationMutation(v9);
      if (a4 == 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotosHighlightGenerator+Curation.m"), 557, CFSTR("Invalid sharing consideration for provisional key asset."));

LABEL_18:
        v17 = 0;
        goto LABEL_19;
      }
      v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
      if (a4 == 1)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "keyAssetForKindShared");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a4)
          goto LABEL_18;
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "keyAssetForKindPrivate");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v16;
      if (v16)
      {
        objc_msgSend(v15, "promotionScore");
        v19 = v18;
        if (!objc_msgSend(v8, "count") || v19 >= v13)
        {
          if (v19 > v13)
            objc_msgSend(v8, "removeAllObjects");
          objc_msgSend(v8, "addObject:", v17);
          v13 = v19;
        }
      }
LABEL_19:

      ++v14;
    }
    while (v11 != v14);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v11);
LABEL_21:

  if ((unint64_t)objc_msgSend(v8, "count") < 2)
    objc_msgSend(v8, "anyObject");
  else
    objc_msgSend(a1, "_bestAssetInAssets:fallback:", v8, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_provisionalKeyAssetForMonthAndYearHighlight:(id)a3 sharingConsideration:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  __int16 v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v26;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v5, "childPhotosHighlights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v7)
    goto LABEL_31;
  v8 = v7;
  v9 = *(_QWORD *)v30;
  v10 = 0.0;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
      if ((unint64_t)a4 > 2)
        v13 = 0;
      else
        v13 = off_1E3667868[a4];
      v14 = v13;
      objc_msgSend(v12, "valueForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedShortValue");

      v17 = objc_msgSend(v5, "kind");
      if ((v17 - 1) < 2)
      {
        if ((v16 & 0xFFFE) != 2)
          goto LABEL_19;
        switch(a4)
        {
          case 2:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotosHighlightGenerator+Curation.m"), 625, CFSTR("Invalid sharing consideration for provisional key asset."));

            break;
          case 1:
            objc_msgSend(v12, "keyAssetForKindShared");
            v19 = objc_claimAutoreleasedReturnValue();
            goto LABEL_24;
          case 0:
            objc_msgSend(v12, "keyAssetForKindPrivate");
            v19 = objc_claimAutoreleasedReturnValue();
LABEL_24:
            v18 = (void *)v19;
            if (v19)
            {
              objc_msgSend(v12, "promotionScore");
              v22 = v21;
              if (!objc_msgSend(v26, "count") || v22 >= v10)
              {
                if (v22 > v10)
                  objc_msgSend(v26, "removeAllObjects");
                objc_msgSend(v26, "addObject:", v18);
                v10 = v22;
              }
            }
            goto LABEL_13;
        }
        v18 = 0;
        goto LABEL_13;
      }
      if (!v17 || v17 == 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotosHighlightGenerator+Curation.m"), 608, CFSTR("Invalid kind for provisional key asset."));
LABEL_13:

      }
LABEL_19:

      ++v11;
    }
    while (v8 != v11);
    v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    v8 = v23;
  }
  while (v23);
LABEL_31:

  if ((unint64_t)objc_msgSend(v26, "count") < 2)
    objc_msgSend(v26, "anyObject");
  else
    objc_msgSend(a1, "_bestAssetInAssets:fallback:", v26, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (double)curationScoreForAsset:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = a3;
  objc_msgSend(v3, "curationScore");
  v5 = v4;
  v6 = 0.25;
  if (objc_msgSend(v3, "kindSubtype") != 10 && (objc_msgSend(v3, "isScreenRecording") & 1) == 0)
  {
    if (fabs(v5) <= 2.22044605e-16)
      v6 = 0.5;
    else
      v6 = v5;
  }

  return v6;
}

+ (BOOL)assetEligibleForCuration:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  double v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = 0;
    if (objc_msgSend(v4, "visibilityStateIsEqualToState:", 0))
    {
      objc_msgSend(a1, "curationScoreForAsset:", v5);
      v6 = v7 >= 0.5;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_bestAssetInAssets:(id)a3 fallback:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _QWORD v41[4];

  v4 = a4;
  v41[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "count");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    if (v11 >= 6)
      v16 = -1;
    else
      v16 = 4;
    v17 = *(_QWORD *)v36;
    v18 = 0.0;
LABEL_6:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v17)
        objc_enumerationMutation(v12);
      v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v19);
      if (objc_msgSend(a1, "assetEligibleForCuration:", v20))
      {
        objc_msgSend(a1, "curationScoreForAsset:", v20);
        v22 = v21;
        if (!v15 || v18 < v21)
        {
          v23 = v20;

          v18 = v22;
          v15 = v23;
        }
        if (!--v16)
          break;
      }
      if (v14 == ++v19)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v14)
          goto LABEL_6;
        break;
      }
    }
  }
  else
  {
    v15 = 0;
  }

  if (!v15 && v4)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v24 = v12;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v29, "visibilityStateIsEqualToState:", 0, (_QWORD)v31))
          {
            v15 = v29;
            goto LABEL_30;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v26)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_30:

  }
  return v15;
}

uint64_t __68__PLPhotosHighlightGenerator_Curation__updateKeyAssetForHighlights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "kind");
  v8 = objc_msgSend(v6, "kind");
  if ((_DWORD)v7 == (_DWORD)v8)
  {
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);
  }
  else
  {
    v12 = v8;
    v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "compare:", v16);

  }
  return v11;
}

- (id)fetchAllRecentHighlights
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[PLPhotosHighlightGenerator recentHighlightsDateInterval](self, "recentHighlightsDateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.startDate >= %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.category == %lu"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v15[0] = v6;
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v10, "allPhotosHighlightsOfKind:withPredicate:error:", 0, v9, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fetchAllOngoingTripDayGroupHighlights
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self.type == %lu"), 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "allPhotosHighlightsOfKind:withPredicate:error:", 3, v3, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateRecentHighlightCurationForHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__PLPhotosHighlightGenerator_Recent__updateRecentHighlightCurationForHighlight___block_invoke;
    v8[3] = &unk_1E366DCA0;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filterUsingPredicate:", v7);

    objc_msgSend(v4, "setSummaryAssets:", v6);
    objc_msgSend(v4, "setExtendedAssets:", v6);
    objc_msgSend(v4, "setPromotionScore:", 0.3);

  }
}

- (void)resetPreviousRecentHighlightCurationForHighlight:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setKeyAssetForKindPrivate:", 0);
  objc_msgSend(v3, "setSummaryAssets:", 0);
  objc_msgSend(v3, "setExtendedAssets:", 0);

}

uint64_t __80__PLPhotosHighlightGenerator_Recent__updateRecentHighlightCurationForHighlight___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "assetEligibleForRecents:", v2);

  return v3;
}

+ (BOOL)assetEligibleForRecents:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_4:
    LOBYTE(v5) = 0;
    goto LABEL_6;
  }
  LOBYTE(v5) = 0;
  if (objc_msgSend(v3, "visibilityStateIsEqualToState:", 0))
  {
    if (objc_msgSend(v4, "kindSubtype") != 10)
    {
      v5 = objc_msgSend(v4, "isScreenRecording") ^ 1;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v5;
}

- (id)updateElectedEventForUpdatedMonths:(id)a3
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t m;
  void *v10;
  _BOOL4 v11;
  void *v12;
  __int16 v13;
  PLHighlightItemList *v14;
  void *v15;
  void *v16;
  PLHighlightItemList *v17;
  int v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  int v28;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  id v36;
  int v37;
  _BOOL8 v39;
  void *v40;
  PLMonthGroupingRule *v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  id v48;
  PLHighlightItemPromoter *v49;
  void *context;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[7];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_alloc_init(PLMonthGroupingRule);
  v49 = -[PLHighlightItemPromoter initWithRule:]([PLHighlightItemPromoter alloc], "initWithRule:", v42);
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v3;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
  if (v45)
  {
    v44 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v85 != v44)
          objc_enumerationMutation(obj);
        v51 = 0;
        v52 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        do
        {
          context = (void *)MEMORY[0x19AEC1554]();
          v4 = off_1E3667868[v51];
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          objc_msgSend(v52, "childPhotosHighlights");
          v54 = (id)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
          if (!v5)
          {

LABEL_19:
            v74 = 0;
            v75 = &v74;
            v76 = 0x3032000000;
            v77 = __Block_byref_object_copy__88819;
            v78 = __Block_byref_object_dispose__88820;
            v79 = 0;
            v68 = 0;
            v69 = &v68;
            v70 = 0x3032000000;
            v71 = __Block_byref_object_copy__88819;
            v72 = __Block_byref_object_dispose__88820;
            v73 = 0;
            v64 = 0;
            v65 = &v64;
            v66 = 0x2020000000;
            v67 = 0;
            v14 = [PLHighlightItemList alloc];
            objc_msgSend(v52, "childPhotosHighlights");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "allObjects");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[PLHighlightItemList initWithParentHighlightItem:childHighlightItems:](v14, "initWithParentHighlightItem:childHighlightItems:", v52, v16);

            v63[0] = MEMORY[0x1E0C809B0];
            v63[1] = 3221225472;
            v63[2] = __81__PLPhotosHighlightGenerator_MonthsAndYears__updateElectedEventForUpdatedMonths___block_invoke;
            v63[3] = &unk_1E3673FC8;
            v63[4] = &v74;
            v63[5] = &v68;
            v63[6] = &v64;
            -[PLHighlightItemPromoter processHighlightItemsInHighlightItemList:currentlyPromotedHighlightItems:withSharingConsideration:resultBlock:](v49, "processHighlightItemsInHighlightItemList:currentlyPromotedHighlightItems:withSharingConsideration:resultBlock:", v17, v53, v51, v63);
            v18 = *((unsigned __int8 *)v65 + 24);
            objc_msgSend(v52, "valueForKey:", v4);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "unsignedShortValue") == 2 * v18;

            if (!v20)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (2 * v18));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "setValue:forKey:", v21, v4);

              if (v18
                && ((objc_msgSend(v52, "missingKeyAssetForKindPrivate") & 1) != 0
                 || objc_msgSend(v52, "missingKeyAssetForKindShared")))
              {
                -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "addObject:", v52);

              }
              objc_msgSend(v52, "bumpHighlightVersion");
              objc_msgSend(v48, "addObject:", v52);
            }
            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            v23 = (id)v75[5];
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v89, 16);
            if (v24)
            {
              v25 = *(_QWORD *)v60;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v60 != v25)
                    objc_enumerationMutation(v23);
                  v27 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * j);
                  v28 = objc_msgSend(v27, "type");
                  if ((unsigned __int16)(v28 - 1) < 2u || v28 == 4)
                    v30 = 2;
                  else
                    v30 = 3;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v30);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "setValue:forKey:", v31, v4);

                }
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v89, 16);
              }
              while (v24);
            }

            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v32 = (id)v69[5];
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v88, 16);
            if (v33)
            {
              v34 = *(_QWORD *)v56;
              do
              {
                for (k = 0; k != v33; ++k)
                {
                  if (*(_QWORD *)v56 != v34)
                    objc_enumerationMutation(v32);
                  v36 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * k);
                  v37 = objc_msgSend(v36, "type");
                  v39 = v37 != 4 && (unsigned __int16)(v37 - 3) < 0xFFFEu;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "setValue:forKey:", v40, v4);

                }
                v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v88, 16);
              }
              while (v33);
            }

            _Block_object_dispose(&v64, 8);
            _Block_object_dispose(&v68, 8);

            _Block_object_dispose(&v74, 8);
            goto LABEL_52;
          }
          v6 = 0;
          v7 = 0;
          v8 = *(_QWORD *)v81;
          do
          {
            for (m = 0; m != v5; ++m)
            {
              if (*(_QWORD *)v81 != v8)
                objc_enumerationMutation(v54);
              v10 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * m);
              v11 = objc_msgSend(v10, "enrichmentState") != 0;
              objc_msgSend(v10, "valueForKey:", v4);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "unsignedShortValue");

              if ((v13 & 0xFFFE) == 2)
                objc_msgSend(v53, "addObject:", v10);
              v7 |= v11;
              v6 |= (v13 & 0xFFFE) == 2;
            }
            v5 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
          }
          while (v5);

          if ((v7 & v6 & 1) == 0)
            goto LABEL_19;
LABEL_52:

          objc_autoreleasePoolPop(context);
          ++v51;
        }
        while (v51 != 3);
      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    }
    while (v45);
  }

  return v48;
}

- (void)generateHighlightListForUpdatedHighlights:(id)a3 deletedHighlights:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  PLYearGroupingRule *v15;
  PLHighlightItemClusterer *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  BOOL v37;
  void *v38;
  BOOL v39;
  void *v40;
  int v41;
  int v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void *v52;
  void *v53;
  void *v54;
  PLHighlightItemClusterer *v55;
  PLYearGroupingRule *v56;
  void *v57;
  PLMonthGroupingRule *v58;
  id v59;
  void *v60;
  void *v61;
  PLHighlightItemClusterer *v62;
  id obj;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
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
  _QWORD v86[5];
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  _QWORD v93[6];
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[6];
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  _QWORD v117[6];
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  uint8_t v133[128];
  _BYTE buf[24];
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  id v137;
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v59 = a4;
  v58 = objc_alloc_init(PLMonthGroupingRule);
  v62 = -[PLHighlightItemClusterer initWithRule:]([PLHighlightItemClusterer alloc], "initWithRule:", v58);
  v124 = 0;
  v125 = &v124;
  v126 = 0x3032000000;
  v127 = __Block_byref_object_copy__88819;
  v128 = __Block_byref_object_dispose__88820;
  v129 = 0;
  v118 = 0;
  v119 = &v118;
  v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__88819;
  v122 = __Block_byref_object_dispose__88820;
  v123 = 0;
  v53 = v5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v117[0] = MEMORY[0x1E0C809B0];
  v117[1] = 3221225472;
  v117[2] = __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke;
  v117[3] = &unk_1E3673FF0;
  v117[4] = &v124;
  v117[5] = &v118;
  -[PLHighlightItemClusterer restoreExistingHighlightItemListsFromUpdatedHighlightItems:deletedHighlightItems:usingModelReader:progressBlock:restoreBlock:](v62, "restoreExistingHighlightItemListsFromUpdatedHighlightItems:deletedHighlightItems:usingModelReader:progressBlock:restoreBlock:", v60, v59, v6, 0, v117);

  objc_msgSend((id)v119[5], "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLHighlightItemClusterer processHighlightItems:withRestoredHighlightItemLists:progressBlock:](v62, "processHighlightItems:withRestoredHighlightItemLists:progressBlock:", v8, v125[5], 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v111 = 0;
  v112 = &v111;
  v113 = 0x3032000000;
  v114 = __Block_byref_object_copy__88819;
  v115 = __Block_byref_object_dispose__88820;
  v116 = 0;
  v105 = 0;
  v106 = &v105;
  v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__88819;
  v109 = __Block_byref_object_dispose__88820;
  v110 = 0;
  v104[0] = v7;
  v104[1] = 3221225472;
  v104[2] = __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_2;
  v104[3] = &unk_1E3673FF0;
  v104[4] = &v111;
  v104[5] = &v105;
  -[PLPhotosHighlightGenerator _consumeHighlightItemListChanges:forKind:rule:resultBlock:](self, "_consumeHighlightItemListChanges:forKind:rule:resultBlock:", v57, 1, v58, v104);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v9 = (id)v125[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v100, v138, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v101;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v101 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * i), "parentHighlightItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addObject:", v13);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v100, v138, 16);
    }
    while (v10);
  }

  objc_msgSend(v67, "addObjectsFromArray:", v112[5]);
  objc_msgSend(v67, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlightGenerator updateElectedEventForUpdatedMonths:](self, "updateElectedEventForUpdatedMonths:", v14);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)v112[5], "count") || objc_msgSend((id)v106[5], "count") || objc_msgSend(v61, "count"))
  {
    v15 = objc_alloc_init(PLYearGroupingRule);
    v16 = -[PLHighlightItemClusterer initWithRule:]([PLHighlightItemClusterer alloc], "initWithRule:", v15);
    v56 = v15;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v135 = __Block_byref_object_copy__88819;
    v136 = __Block_byref_object_dispose__88820;
    v137 = 0;
    v94 = 0;
    v95 = &v94;
    v96 = 0x3032000000;
    v97 = __Block_byref_object_copy__88819;
    v98 = __Block_byref_object_dispose__88820;
    v99 = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v112[5]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v61);
    v18 = v106[5];
    -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v7;
    v93[1] = 3221225472;
    v93[2] = __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_3;
    v93[3] = &unk_1E3673FF0;
    v93[4] = buf;
    v93[5] = &v94;
    -[PLHighlightItemClusterer restoreExistingHighlightItemListsFromUpdatedHighlightItems:deletedHighlightItems:usingModelReader:progressBlock:restoreBlock:](v16, "restoreExistingHighlightItemListsFromUpdatedHighlightItems:deletedHighlightItems:usingModelReader:progressBlock:restoreBlock:", v17, v18, v19, 0, v93);
    v52 = v17;
    v55 = v16;

    v87 = 0;
    v88 = &v87;
    v89 = 0x3032000000;
    v90 = __Block_byref_object_copy__88819;
    v91 = __Block_byref_object_dispose__88820;
    v92 = 0;
    objc_msgSend((id)v95[5], "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLHighlightItemClusterer processHighlightItems:withRestoredHighlightItemLists:progressBlock:](v16, "processHighlightItems:withRestoredHighlightItemLists:progressBlock:", v20, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    v86[0] = v7;
    v86[1] = 3221225472;
    v86[2] = __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_4;
    v86[3] = &unk_1E3674018;
    v86[4] = &v87;
    -[PLPhotosHighlightGenerator _consumeHighlightItemListChanges:forKind:rule:resultBlock:](self, "_consumeHighlightItemListChanges:forKind:rule:resultBlock:", v54, 2, v56, v86);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v22 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v133, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v83;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v83 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * j), "parentHighlightItem", v52);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v26);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v133, 16);
      }
      while (v23);
    }

    objc_msgSend(v21, "addObjectsFromArray:", v88[5]);
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    obj = v21;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v132, 16);
    if (v27)
    {
      v64 = *(_QWORD *)v79;
      do
      {
        v28 = 0;
        v65 = v27;
        do
        {
          if (*(_QWORD *)v79 != v64)
            objc_enumerationMutation(obj);
          v29 = 0;
          v66 = v28;
          v30 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v28);
          do
          {
            v31 = off_1E3667868[v29];
            v74 = 0u;
            v75 = 0u;
            v76 = 0u;
            v77 = 0u;
            objc_msgSend(v30, "childPhotosHighlights");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v131, 16);
            if (v33)
            {
              v34 = *(_QWORD *)v75;
              while (2)
              {
                for (k = 0; k != v33; ++k)
                {
                  if (*(_QWORD *)v75 != v34)
                    objc_enumerationMutation(v32);
                  objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * k), "valueForKey:", v31, v52);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v36, "unsignedShortValue") == 0;

                  if (!v37)
                  {
                    v33 = 4;
                    goto LABEL_34;
                  }
                }
                v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v74, v131, 16);
                if (v33)
                  continue;
                break;
              }
            }
LABEL_34:

            objc_msgSend(v30, "valueForKey:", v31);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "unsignedShortValue") == (_DWORD)v33;

            if (!v39)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v33);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setValue:forKey:", v40, v31);

              objc_msgSend(v30, "bumpHighlightVersion");
              v41 = objc_msgSend(v30, "sharingComposition");
              if (v41)
              {
                if (v41 == 1)
                  goto LABEL_39;
                if (v41 != 2)
                  goto LABEL_43;
                if ((objc_msgSend(v30, "missingKeyAssetForKindPrivate") & 1) == 0)
                {
LABEL_39:
                  v42 = objc_msgSend(v30, "missingKeyAssetForKindShared", v52);
LABEL_41:
                  if (!v42)
                    goto LABEL_43;
                }
                -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset", v52);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "addObject:", v30);

                goto LABEL_43;
              }
              v42 = objc_msgSend(v30, "missingKeyAssetForKindPrivate");
              goto LABEL_41;
            }
LABEL_43:

            ++v29;
          }
          while (v29 != 3);
          v28 = v66 + 1;
        }
        while (v66 + 1 != v65);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v132, 16);
      }
      while (v27);
    }

    _Block_object_dispose(&v87, 8);
    _Block_object_dispose(&v94, 8);

    _Block_object_dispose(buf, 8);
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v69 = (id)v106[5];
  v44 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v70, v130, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v71;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v71 != v45)
          objc_enumerationMutation(v69);
        v47 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * m);
        PLMomentsGetLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v47, "uuid");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "startDate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "endDate");
          v51 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v49;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v50;
          *(_WORD *)&buf[22] = 2112;
          v135 = v51;
          _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_INFO, "[HighlightsGeneration] Deleting month: [%@]-(%@-%@)", buf, 0x20u);

        }
        objc_msgSend(v47, "delete");
      }
      v44 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v70, v130, 16);
    }
    while (v44);
  }

  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v111, 8);

  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(&v124, 8);

}

- (void)_consumeHighlightItemListChanges:(id)a3 forKind:(unsigned __int16)a4 rule:(id)a5 resultBlock:(id)a6
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void (**v66)(id, void *, void *);
  id v67;
  uint64_t v68;
  void *v69;
  unsigned int v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id obj;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint8_t v92[128];
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  uint64_t v100;
  _BYTE v101[128];
  uint64_t v102;

  v70 = a4;
  v102 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v72 = a5;
  v66 = (void (**)(id, void *, void *))a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v88;
    v68 = *(_QWORD *)v88;
    v69 = v10;
    v67 = v11;
    do
    {
      v15 = 0;
      v74 = v13;
      do
      {
        if (*(_QWORD *)v88 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v15);
        if (objc_msgSend(v16, "isCandidateForReuse"))
        {
          objc_msgSend(v16, "parentHighlightItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          PLMomentsGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v17, "uuid");
            v19 = v10;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "startDate");
            v21 = v11;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "endDate");
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = v16;
            v25 = v15;
            v26 = (void *)v23;
            *(_DWORD *)buf = 138413058;
            v94 = v24;
            v95 = 2112;
            v96 = v20;
            v97 = 2112;
            v98 = v22;
            v99 = 2112;
            v100 = v23;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "[HighlightsGeneration] Need to delete: %@ [%@]-(%@-%@)", buf, 0x2Au);

            v15 = v25;
            v11 = v21;

            v10 = v19;
            v13 = v74;
          }

          objc_msgSend(v10, "addObject:", v17);
          goto LABEL_10;
        }
        if ((objc_msgSend(v16, "hasChanges") & 1) != 0 || objc_msgSend(v16, "isNewList"))
        {
          objc_msgSend(v16, "sortedChildHighlightItems");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "count");

          if (v28)
          {
            if (objc_msgSend(v16, "isNewList"))
            {
              -[PLPhotosHighlightGenerator dataManager](self, "dataManager");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "insertNewPhotosHighlight");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v30, "setPromotionScore:", 0.3);
            }
            else
            {
              objc_msgSend(v16, "parentHighlightItem");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[PLPhotosHighlightGenerator dateRangeTitleGenerator](self, "dateRangeTitleGenerator");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v85[0] = MEMORY[0x1E0C809B0];
            v85[1] = 3221225472;
            v85[2] = __104__PLPhotosHighlightGenerator_MonthsAndYears___consumeHighlightItemListChanges_forKind_rule_resultBlock___block_invoke;
            v85[3] = &unk_1E3673FA0;
            v32 = v30;
            v86 = v32;
            objc_msgSend(v72, "titlesForHighlightItemList:dateRangeTitleGenerator:resultBlock:", v16, v31, v85);

            objc_msgSend(v32, "setKind:", v70);
            objc_msgSend(v16, "startDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setStartDate:", v33);

            objc_msgSend(v16, "endDate");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setEndDate:", v34);

            objc_msgSend(v16, "addedHighlightItems");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v35, "count"))
            {

              goto LABEL_22;
            }
            objc_msgSend(v16, "removedHighlightItems");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "count");

            if (v37)
            {
LABEL_22:
              v73 = v15;
              v83 = 0u;
              v84 = 0u;
              v81 = 0u;
              v82 = 0u;
              v75 = v16;
              objc_msgSend(v16, "sortedChildHighlightItems");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
              if (v39)
              {
                v40 = v39;
                v41 = *(_QWORD *)v82;
                do
                {
                  for (i = 0; i != v40; ++i)
                  {
                    if (*(_QWORD *)v82 != v41)
                      objc_enumerationMutation(v38);
                    v43 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
                    objc_msgSend(v43, "parentPhotosHighlight");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = objc_msgSend(v44, "isEqual:", v32);

                    if ((v45 & 1) == 0)
                    {
                      objc_msgSend(v43, "keyAssetForKindPrivate");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v46, "monthHighlightBeingKeyAssetPrivate");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v47)
                      {
                        -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v48, "addObject:", v47);

                      }
                      objc_msgSend(v43, "keyAssetForKindShared");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v49, "monthHighlightBeingKeyAssetShared");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v50)
                      {
                        -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v51, "addObject:", v50);

                      }
                      objc_msgSend(v43, "setParentPhotosHighlight:", v32);

                    }
                  }
                  v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
                }
                while (v40);
              }

              v79 = 0u;
              v80 = 0u;
              v77 = 0u;
              v78 = 0u;
              objc_msgSend(v75, "removedHighlightItems");
              obj = (id)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
              if (v52)
              {
                v53 = v52;
                v54 = *(_QWORD *)v78;
                do
                {
                  for (j = 0; j != v53; ++j)
                  {
                    if (*(_QWORD *)v78 != v54)
                      objc_enumerationMutation(obj);
                    v56 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
                    objc_msgSend(v56, "keyAssetForKindShared");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "keyAssetForKindShared");
                    v58 = objc_claimAutoreleasedReturnValue();
                    if (v57 == (void *)v58)
                    {

                    }
                    else
                    {
                      v59 = (void *)v58;
                      objc_msgSend(v56, "keyAssetForKindPrivate");
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "keyAssetForKindPrivate");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v60 != v61)
                        goto LABEL_45;
                    }
                    -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "addObject:", v32);

LABEL_45:
                    objc_msgSend(v56, "parentPhotosHighlight");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = objc_msgSend(v63, "isEqual:", v32);

                    if (v64)
                      objc_msgSend(v56, "setParentPhotosHighlight:", 0);
                  }
                  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
                }
                while (v53);
              }

              v11 = v67;
              v15 = v73;
              v16 = v75;
            }
            if ((objc_msgSend(v16, "isNewList") & 1) != 0
              || (objc_msgSend(v32, "missingKeyAssetForKindPrivate") & 1) != 0
              || objc_msgSend(v32, "missingKeyAssetForKindShared"))
            {
              -[PLPhotosHighlightGenerator highlightsNeedingNewKeyAsset](self, "highlightsNeedingNewKeyAsset");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "addObject:", v32);

            }
            objc_msgSend(v32, "bumpHighlightVersion");
            objc_msgSend(v71, "addObject:", v32);

            v14 = v68;
            v10 = v69;
            v13 = v74;
            goto LABEL_55;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v16, "parentHighlightItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v94 = v16;
            v95 = 2112;
            v96 = v17;
            _os_log_fault_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Tring to generate a month/year with 0 child: %@ - %@", buf, 0x16u);
LABEL_10:

          }
        }
LABEL_55:
        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
    }
    while (v13);
  }

  v66[2](v66, v71, v10);
}

void __104__PLPhotosHighlightGenerator_MonthsAndYears___consumeHighlightItemListChanges_forKind_rule_resultBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setTitle:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", v6);

}

void __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __106__PLPhotosHighlightGenerator_MonthsAndYears__generateHighlightListForUpdatedHighlights_deletedHighlights___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        PLMomentsGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v12, "uuid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "startDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "endDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v23 = v14;
          v24 = 2112;
          v25 = v15;
          v26 = 2112;
          v27 = v16;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "[HighlightsGeneration] Deleting year: [%@]-(%@-%@)", buf, 0x20u);

        }
        objc_msgSend(v12, "delete");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v9);
  }

}

void __81__PLPhotosHighlightGenerator_MonthsAndYears__updateElectedEventForUpdatedMonths___block_invoke(_QWORD *a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(a1[4] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(a1[5] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
}

+ (void)updateTitleForHighlights:(id)a3 forKind:(unsigned __int16)a4 forceUpdateLocale:(BOOL)a5 dateRangeTitleGenerator:(id)a6
{
  int v7;
  id v8;
  id v9;
  __objc2_class **v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  PLHighlightItemList *v18;
  void *v19;
  void *v20;
  PLHighlightItemList *v21;
  id obj;
  _BOOL4 v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v23 = a5;
  v7 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  v10 = off_1E365A4E0;
  if (v7 != 1)
    v10 = off_1E365AF18;
  v11 = objc_alloc_init(*v10);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x19AEC1554]();
        v18 = [PLHighlightItemList alloc];
        objc_msgSend(v16, "childPhotosHighlights");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PLHighlightItemList initWithParentHighlightItem:childHighlightItems:](v18, "initWithParentHighlightItem:childHighlightItems:", v16, v20);

        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __121__PLPhotosHighlightGenerator_MonthsAndYears__updateTitleForHighlights_forKind_forceUpdateLocale_dateRangeTitleGenerator___block_invoke;
        v24[3] = &unk_1E3673FA0;
        v24[4] = v16;
        objc_msgSend(v11, "titlesForHighlightItemList:dateRangeTitleGenerator:forceUpdateLocale:resultBlock:", v21, v9, v23, v24);

        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

}

void __121__PLPhotosHighlightGenerator_MonthsAndYears__updateTitleForHighlights_forKind_forceUpdateLocale_dateRangeTitleGenerator___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setTitle:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setSubtitle:", v6);

}

@end
