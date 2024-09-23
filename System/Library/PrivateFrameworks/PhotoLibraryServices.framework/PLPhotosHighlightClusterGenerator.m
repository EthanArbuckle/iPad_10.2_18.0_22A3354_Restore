@implementation PLPhotosHighlightClusterGenerator

- (PLPhotosHighlightClusterGenerator)initWithDataManager:(id)a3 frequentLocationManager:(id)a4 recentHighlightDateInterval:(id)a5 localCreationDateCreator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PLPhotosHighlightClusterGenerator *v14;
  PLPhotosHighlightClusterGenerator *v15;
  PLLibraryClusterer *v16;
  PLLibraryClusterer *clusterer;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PLPhotosHighlightClusterGenerator;
  v14 = -[PLPhotosHighlightClusterGenerator init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_dataManager, v10);
    objc_storeStrong((id *)&v15->_frequentLocationManager, a4);
    objc_storeStrong((id *)&v15->_recentHighlightsDateInterval, a5);
    v16 = -[PLLibraryClusterer initWithLocalCreationDateCreator:frequentLocationManager:]([PLLibraryClusterer alloc], "initWithLocalCreationDateCreator:frequentLocationManager:", v13, v15->_frequentLocationManager);
    clusterer = v15->_clusterer;
    v15->_clusterer = v16;

  }
  return v15;
}

- (NSArray)allMomentsSorted
{
  NSArray *allMomentsSorted;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  allMomentsSorted = self->_allMomentsSorted;
  if (!allMomentsSorted)
  {
    -[PLPhotosHighlightClusterGenerator dataManager](self, "dataManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allMomentsWithError:", 0);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_allMomentsSorted;
    self->_allMomentsSorted = v5;

    allMomentsSorted = self->_allMomentsSorted;
  }
  return allMomentsSorted;
}

- (id)highlightClustersIntersectingMoments:(id)a3 includeAllTripHighlightClusters:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  float v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint32_t v42;
  uint32_t v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  float v47;
  void *v48;
  NSObject *v49;
  os_signpost_id_t v50;
  NSObject *v51;
  NSObject *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint32_t v65;
  uint32_t v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  float v70;
  void *v71;
  NSObject *v72;
  os_signpost_id_t v73;
  NSObject *v74;
  NSObject *v75;
  unint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint32_t v83;
  uint32_t v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  float v88;
  void *v89;
  id v90;
  id v91;
  id v93;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  NSObject *v99;
  os_signpost_id_t v100;
  NSObject *v101;
  NSObject *v102;
  uint64_t v103;
  id v104;
  void *v105;
  void *v106;
  id obj;
  void *v108;
  void *v109;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  mach_timebase_info v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  mach_timebase_info v120;
  mach_timebase_info info;
  _BYTE v122[128];
  uint8_t v123[128];
  uint8_t buf[4];
  const char *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  double v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  PLMomentGenerationGetLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  info = 0;
  mach_timebase_info(&info);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RecentHighlights", ", buf, 2u);
  }

  v12 = mach_absolute_time();
  -[PLPhotosHighlightClusterGenerator _recentMoments](self, "_recentMoments");
  v13 = objc_claimAutoreleasedReturnValue();
  -[PLPhotosHighlightClusterGenerator _recentHighlightClusterWithRecentMoments:intersectingMoments:](self, "_recentHighlightClusterWithRecentMoments:intersectingMoments:", v13, v7);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "unionSet:", v13);
  v106 = (void *)v13;
  objc_msgSend(v7, "minusSet:", v13);
  if (v14)
    objc_msgSend(v6, "addObject:", v14);
  v105 = (void *)v14;
  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v11;
  v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v9, "RecentHighlights", "[HighlightsGeneration.Recents]", buf, 2u);
  }

  v20 = v19;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = (float)((float)((float)(v15 - v12) * (float)numer) / (float)denom) / 1000000.0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[HighlightsGeneration.Recents]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v125 = "RecentHighlights";
    v126 = 2112;
    v127 = v22;
    v128 = 2048;
    v129 = v21;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  if (objc_msgSend(v7, "count") || a4)
  {
    v104 = v5;
    v109 = v6;
    v24 = (void *)MEMORY[0x1E0C99E10];
    -[PLPhotosHighlightClusterGenerator allMomentsSorted](self, "allMomentsSorted");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "orderedSetWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "minusSet:", v106);
    v102 = v20;
    v27 = v20;
    v28 = os_signpost_id_generate(v27);
    v120 = 0;
    mach_timebase_info(&v120);
    v29 = v27;
    v30 = v29;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "TripHighlights", ", buf, 2u);
    }
    spid = v28;
    v98 = v30;

    v96 = mach_absolute_time();
    objc_msgSend(v26, "set");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotosHighlightClusterGenerator _tripsInMoments:](self, "_tripsInMoments:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    obj = v32;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v123, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v117;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v117 != v35)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
          objc_msgSend(v37, "items", spid);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (a4 || objc_msgSend(v7, "intersectsSet:", v39))
          {
            -[PLPhotosHighlightClusterGenerator _tripHighlightClustersForMoments:tripType:](self, "_tripHighlightClustersForMoments:tripType:", v38, objc_msgSend(v37, "type"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "addObjectsFromArray:", v40);

          }
          objc_msgSend(v26, "minusSet:", v39);
          objc_msgSend(v7, "minusSet:", v39);
          objc_msgSend(v108, "unionSet:", v39);

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v123, 16);
      }
      while (v34);
    }

    v41 = mach_absolute_time();
    v43 = v120.numer;
    v42 = v120.denom;
    v44 = v98;
    v45 = v44;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v45, OS_SIGNPOST_INTERVAL_END, spid, "TripHighlights", "[HighlightsGeneration.Trips]", buf, 2u);
    }

    v46 = v45;
    v6 = v109;
    v5 = v104;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = (float)((float)((float)(v41 - v96) * (float)v43) / (float)v42) / 1000000.0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[HighlightsGeneration.Trips]"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v125 = "TripHighlights";
      v126 = 2112;
      v127 = v48;
      v128 = 2048;
      v129 = v47;
      _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

    }
    v20 = v102;
    if (!objc_msgSend(v7, "count"))
    {
      v91 = v109;
      goto LABEL_62;
    }
    v101 = v46;
    if (+[PLAggregationProcessor isEnabled](PLAggregationProcessor, "isEnabled"))
    {
      v49 = v46;
      v50 = os_signpost_id_generate(v49);
      v115 = 0;
      mach_timebase_info(&v115);
      v51 = v49;
      v52 = v51;
      v53 = v50 - 1;
      if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v50, "AggregationHighlights", ", buf, 2u);
      }
      spida = v50;
      v99 = v52;

      v97 = mach_absolute_time();
      -[PLPhotosHighlightClusterGenerator allMomentsSorted](self, "allMomentsSorted");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPhotosHighlightClusterGenerator _aggregationsInSortedMoments:unavailableMoments:intersectingMoments:](self, "_aggregationsInSortedMoments:unavailableMoments:intersectingMoments:", v54, v108, v7);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v56 = v55;
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
      if (v57)
      {
        v58 = v57;
        v59 = *(_QWORD *)v112;
        do
        {
          for (j = 0; j != v58; ++j)
          {
            if (*(_QWORD *)v112 != v59)
              objc_enumerationMutation(v56);
            objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * j), "moments", spida);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPhotosHighlightClusterGenerator _aggregationHighlightClustersForMoments:](self, "_aggregationHighlightClustersForMoments:", v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "addObjectsFromArray:", v62);

            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v61);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "minusSet:", v63);
            objc_msgSend(v7, "minusSet:", v63);

          }
          v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v111, v122, 16);
        }
        while (v58);
      }

      v64 = mach_absolute_time();
      v66 = v115.numer;
      v65 = v115.denom;
      v67 = v99;
      v68 = v67;
      if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v68, OS_SIGNPOST_INTERVAL_END, spida, "AggregationHighlights", "[HighlightsGeneration.Aggregations]", buf, 2u);
      }

      v69 = v68;
      v6 = v109;
      v20 = v102;
      v5 = v104;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        v70 = (float)((float)((float)(v64 - v97) * (float)v66) / (float)v65) / 1000000.0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[HighlightsGeneration.Aggregations]"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v125 = "AggregationHighlights";
        v126 = 2112;
        v127 = v71;
        v128 = 2048;
        v129 = v70;
        _os_log_impl(&dword_199541000, v69, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

      }
      if (!objc_msgSend(v7, "count"))
      {
        v93 = v109;

LABEL_60:
        v46 = v101;
LABEL_62:

        goto LABEL_63;
      }

      v46 = v101;
    }
    v72 = v46;
    v73 = os_signpost_id_generate(v72);
    v115 = 0;
    mach_timebase_info(&v115);
    v74 = v72;
    v75 = v74;
    v76 = v73 - 1;
    if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v75, OS_SIGNPOST_INTERVAL_BEGIN, v73, "DayHighlights", ", buf, 2u);
    }
    v100 = v73;

    v103 = mach_absolute_time();
    objc_msgSend(v26, "array");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = _os_feature_enabled_impl() ^ 1;
    v79 = _os_feature_enabled_impl() ^ 1;
    -[PLLibraryClusterer momentClustersForMomentsSortedByDate:allowLocationSplits:allowExternalSplits:](self->_clusterer, "momentClustersForMomentsSortedByDate:allowLocationSplits:allowExternalSplits:", v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotosHighlightClusterGenerator _remainingHighlightClustersWithClusters:intersectingMoments:allowExternalSplits:](self, "_remainingHighlightClustersWithClusters:intersectingMoments:allowExternalSplits:", v80, v7, v79);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v109;
    objc_msgSend(v109, "addObjectsFromArray:", v81);
    v82 = mach_absolute_time();
    v84 = v115.numer;
    v83 = v115.denom;
    v85 = v75;
    v86 = v85;
    if (v76 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v86, OS_SIGNPOST_INTERVAL_END, v100, "DayHighlights", "[HighlightsGeneration.Days]", buf, 2u);
    }

    v87 = v86;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      v88 = (float)((float)((float)(v82 - v103) * (float)v84) / (float)v83) / 1000000.0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[HighlightsGeneration.Days]"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v125 = "DayHighlights";
      v126 = 2112;
      v127 = v89;
      v128 = 2048;
      v129 = v88;
      _os_log_impl(&dword_199541000, v87, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

    }
    v90 = v109;

    v5 = v104;
    goto LABEL_60;
  }
  v23 = v6;
LABEL_63:

  return v6;
}

- (BOOL)_isRecent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    if (-[NSDateInterval containsDate:](self->_recentHighlightsDateInterval, "containsDate:", v5))
      v7 = -[NSDateInterval containsDate:](self->_recentHighlightsDateInterval, "containsDate:", v6);
    else
      v7 = 0;
  }

  return v7;
}

- (id)recentMomentsInMomentClusters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[PLPhotosHighlightClusterGenerator _isRecent:](self, "_isRecent:", v11, (_QWORD)v14))
        {
          objc_msgSend(v11, "moments");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_recentMoments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSDateInterval startDate](self->_recentHighlightsDateInterval, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateInterval endDate](self->_recentHighlightsDateInterval, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", 86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotosHighlightClusterGenerator dataManager](self, "dataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "momentsBetweenDate:andDate:sorted:excludeExternal:", v4, v6, 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    -[PLLibraryClusterer momentClustersForMomentsSortedByDate:allowLocationSplits:allowExternalSplits:](self->_clusterer, "momentClustersForMomentsSortedByDate:allowLocationSplits:allowExternalSplits:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotosHighlightClusterGenerator recentMomentsInMomentClusters:](self, "recentMomentsInMomentClusters:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLMomentsGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "No recent moments found for date interval: %@ - %@", (uint8_t *)&v13, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_recentHighlightClusterWithRecentMoments:(id)a3
{
  id v3;
  PLPhotosHighlightCluster *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[PLPhotosHighlightCluster initWithMoments:]([PLPhotosHighlightCluster alloc], "initWithMoments:", v3);
    -[PLPhotosHighlightCluster setCategory:](v4, "setCategory:", 1);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_recentHighlightClusterWithRecentMoments:(id)a3 intersectingMoments:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (objc_msgSend(v6, "intersectsSet:", a4))
  {
    -[PLPhotosHighlightClusterGenerator _recentHighlightClusterWithRecentMoments:](self, "_recentHighlightClusterWithRecentMoments:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_tripsInMoments:(id)a3
{
  PLFrequentLocationManager *frequentLocationManager;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  frequentLocationManager = self->_frequentLocationManager;
  v5 = a3;
  -[PLFrequentLocationManager momentGenerationDataManager](frequentLocationManager, "momentGenerationDataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastLocationOfInterestVisit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "visitInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLFrequentLocationManager currentFrequentLocations](self->_frequentLocationManager, "currentFrequentLocations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLTripProcessor processTripsWithItems:frequentLocations:lastHomeVisitDate:progressBlock:](PLTripProcessor, "processTripsWithItems:frequentLocations:lastHomeVisitDate:progressBlock:", v5, v10, v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_58227);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filteredArrayUsingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_aggregationsInSortedMoments:(id)a3 unavailableMoments:(id)a4 intersectingMoments:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  PLAggregationProcessor *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = a4;
  v8 = a5;
  -[PLLibraryClusterer momentClustersForMomentsSortedByDate:allowLocationSplits:allowExternalSplits:](self->_clusterer, "momentClustersForMomentsSortedByDate:allowLocationSplits:allowExternalSplits:", a3, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v15, "moments", v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v8, "intersectsSet:", v18);

        if (v19)
          objc_msgSend(v25, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  v20 = objc_alloc_init(PLAggregationProcessor);
  -[PLAggregationProcessor sortedNeighborMomentClustersOfMomentClusters:forAllMomentClusters:](v20, "sortedNeighborMomentClustersOfMomentClusters:forAllMomentClusters:", v25, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregationProcessor processAggregationsWithSortedMomentClusters:momentsContainedInOtherHighlights:progressBlock:](v20, "processAggregationsWithSortedMomentClusters:momentsContainedInOtherHighlights:progressBlock:", v21, v24, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)_tripHighlightClustersForMoments:(id)a3 tripType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  PLPhotosHighlightCluster *v16;
  PLPhotosHighlightCluster *v17;
  void *v18;
  PLPhotosHighlightCluster *v19;
  unint64_t v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryClusterer momentClustersForMomentsSortedByDate:allowLocationSplits:allowExternalSplits:](self->_clusterer, "momentClustersForMomentsSortedByDate:allowLocationSplits:allowExternalSplits:", v5, _os_feature_enabled_impl() ^ 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = objc_alloc(MEMORY[0x1E0C99E20]);
        objc_msgSend(v12, "moments");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

        v16 = -[PLPhotosHighlightCluster initWithMoments:]([PLPhotosHighlightCluster alloc], "initWithMoments:", v15);
        -[PLPhotosHighlightCluster setType:](v16, "setType:", 5);
        objc_msgSend(v6, "addObject:", v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }
  v17 = [PLPhotosHighlightCluster alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PLPhotosHighlightCluster initWithMoments:](v17, "initWithMoments:", v18);

  v20 = 0x400010002uLL >> (16 * a4);
  if (a4 >= 3)
    LOBYTE(v20) = 0;
  -[PLPhotosHighlightCluster setType:](v19, "setType:", v20 & 7);
  -[PLPhotosHighlightCluster setKind:](v19, "setKind:", 3);
  objc_msgSend(v6, "addObject:", v19);

  return v6;
}

- (id)_aggregationHighlightClustersForMoments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  PLPhotosHighlightCluster *v15;
  PLPhotosHighlightCluster *v16;
  void *v17;
  PLPhotosHighlightCluster *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryClusterer momentClustersForMomentsSortedByDate:allowLocationSplits:allowExternalSplits:](self->_clusterer, "momentClustersForMomentsSortedByDate:allowLocationSplits:allowExternalSplits:", v4, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x1E0C99E20]);
        objc_msgSend(v11, "moments");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);

        v15 = -[PLPhotosHighlightCluster initWithMoments:]([PLPhotosHighlightCluster alloc], "initWithMoments:", v14);
        -[PLPhotosHighlightCluster setType:](v15, "setType:", 6);
        objc_msgSend(v5, "addObject:", v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  v16 = [PLPhotosHighlightCluster alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PLPhotosHighlightCluster initWithMoments:](v16, "initWithMoments:", v17);

  -[PLPhotosHighlightCluster setType:](v18, "setType:", 3);
  -[PLPhotosHighlightCluster setKind:](v18, "setKind:", 3);
  objc_msgSend(v5, "addObject:", v18);

  return v5;
}

- (id)_remainingHighlightClustersWithClusters:(id)a3 intersectingMoments:(id)a4 allowExternalSplits:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  PLPhotosHighlightCluster *v19;
  _BOOL8 v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
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
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    v29 = v8;
    v30 = v9;
    v27 = *(_QWORD *)v36;
    v28 = v10;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "moments", v27, v28, v29, v30);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v8, "intersectsSet:", v16);

        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[PLPhotosHighlightCluster initWithMoments:]([PLPhotosHighlightCluster alloc], "initWithMoments:", v18);
          if (v5)
          {
            v20 = v5;
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v21 = v15;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v32;
              while (2)
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v32 != v24)
                    objc_enumerationMutation(v21);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "pl_originatorState") & 8) != 0)
                  {
                    -[PLPhotosHighlightCluster setType:](v19, "setType:", 7);
                    goto LABEL_18;
                  }
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
                if (v23)
                  continue;
                break;
              }
            }
LABEL_18:

            v5 = v20;
            v8 = v29;
            v9 = v30;
            v13 = v27;
            v10 = v28;
          }
          objc_msgSend(v9, "addObject:", v19);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v12);
  }

  return v9;
}

- (PLMomentGenerationDataManagement)dataManager
{
  return (PLMomentGenerationDataManagement *)objc_loadWeakRetained((id *)&self->_dataManager);
}

- (PLFrequentLocationManager)frequentLocationManager
{
  return self->_frequentLocationManager;
}

- (NSDateInterval)recentHighlightsDateInterval
{
  return self->_recentHighlightsDateInterval;
}

- (PLLibraryClusterer)clusterer
{
  return self->_clusterer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterer, 0);
  objc_storeStrong((id *)&self->_recentHighlightsDateInterval, 0);
  objc_storeStrong((id *)&self->_frequentLocationManager, 0);
  objc_destroyWeak((id *)&self->_dataManager);
  objc_storeStrong((id *)&self->_allMomentsSorted, 0);
}

BOOL __53__PLPhotosHighlightClusterGenerator__tripsInMoments___block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "duration");
  return v2 <= 5184000.0;
}

@end
