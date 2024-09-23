@implementation PGCuratedLibraryIntelligenceMetricEvent

- (PGCuratedLibraryIntelligenceMetricEvent)initWithGraphManager:(id)a3
{
  id v5;
  PGCuratedLibraryIntelligenceMetricEvent *v6;
  PGCuratedLibraryIntelligenceMetricEvent *v7;
  uint64_t v8;
  NSDate *debugDate;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGCuratedLibraryIntelligenceMetricEvent;
  v6 = -[PGCuratedLibraryIntelligenceMetricEvent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1559088000.0);
    v8 = objc_claimAutoreleasedReturnValue();
    debugDate = v7->_debugDate;
    v7->_debugDate = (NSDate *)v8;

  }
  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.Photos.CuratedLibraryIntelligence");
}

- (BOOL)shouldReportMetrics
{
  return -[PGManager isReady](self->_manager, "isReady");
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  id v4;
  void *v5;
  PGManager *manager;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PGCuratedLibraryIntelligenceMetricEvent *v11;
  id v12;

  v4 = a3;
  -[PGManager enrichmentLoggingConnection](self->_manager, "enrichmentLoggingConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  manager = self->_manager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PGCuratedLibraryIntelligenceMetricEvent_gatherMetricsWithProgressBlock___block_invoke;
  v9[3] = &unk_1E8436320;
  v11 = self;
  v12 = v4;
  v10 = v5;
  v7 = v5;
  v8 = v4;
  -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](manager, "performSynchronousConcurrentGraphReadUsingBlock:", v9);

}

- (void)_fillGenericStatisticsWithGraph:(id)a3
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
  id v13;

  v13 = a3;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v13, "infoNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_librarySize = objc_msgSend(v5, "numberOfAssets");

  self->_librarySizeRange = objc_msgSend(v13, "librarySizeRange");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -365, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "startOfDayForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate >= %@"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  objc_msgSend(v10, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfDaysWithPhotosInPastYear = objc_msgSend(v12, "count");

  objc_autoreleasePoolPop(v4);
}

- (void)_fillDayHighlightsStatisticsWithGraph:(id)a3 withProgressBlock:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, mach_timebase_info *, double);
  double v9;
  double Current;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  mach_timebase_info v29;
  NSObject *v30;
  NSObject *v31;
  double v32;
  int v33;
  int v34;
  NSObject *v35;
  os_signpost_id_t v36;
  NSObject *v37;
  NSObject *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  mach_timebase_info v51;
  NSObject *v52;
  NSObject *v53;
  double v54;
  int v55;
  int v56;
  NSObject *v57;
  os_signpost_id_t v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  double v69;
  double v70;
  void *v71;
  uint64_t v72;
  double v73;
  void *v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  uint64_t v79;
  mach_timebase_info v80;
  NSObject *v81;
  NSObject *v82;
  int v83;
  double v84;
  int v85;
  double v86;
  os_signpost_id_t v87;
  uint64_t v88;
  unint64_t v89;
  os_signpost_id_t spid;
  void *spida;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  void *context;
  int contexta;
  int contextb;
  id v105;
  id v106;
  void *v107;
  unsigned __int8 v108;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v111[18];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v7);
  v9 = 0.0;
  if (v8)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(info.numer) = 0;
      v8[2](v8, &info, 0.0);
      if (LOBYTE(info.numer))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v111 = 275;
          *(_WORD *)&v111[4] = 2080;
          *(_QWORD *)&v111[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_65;
      }
      v9 = Current;
    }
  }
  v106 = v6;
  v105 = v7;
  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v11 = objc_claimAutoreleasedReturnValue();
  -[PGManager enrichmentLoggingConnection](self->_manager, "enrichmentLoggingConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1CAA4EB2C]();
  self->_numberOfDayHighlights = -[PGCuratedLibraryIntelligenceMetricEvent _numberOfDayHighlights](self, "_numberOfDayHighlights");
  objc_autoreleasePoolPop(v13);
  context = (void *)MEMORY[0x1CAA4EB2C]();
  v14 = v12;
  v15 = os_signpost_id_generate(v14);
  v16 = v14;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "DayDefaultStatistics", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v100 = mach_absolute_time();
  -[PGCuratedLibraryIntelligenceMetricEvent _defaultHighlights](self, "_defaultHighlights");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfDefaultDayHighlights = objc_msgSend(v18, "count");
  v107 = (void *)v11;
  -[PGCuratedLibraryIntelligenceMetricEvent _assetsStatisticsInHighlights:photoLibrary:includeUtility:](self, "_assetsStatisticsInHighlights:photoLibrary:includeUtility:", v18, v11, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("total"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("curated"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "unsignedIntegerValue");

  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v21, self->_numberOfDefaultDayHighlights);
  self->_averageNumberOfAssetsInDefaultHighlights = v24;
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v21, self->_librarySize);
  self->_ratioOfAssetsInDefaultHighlights = v25;
  v99 = v23;
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v23, v21);
  self->_ratioOfCuratedAssetsInDefaultHighlights = v26;
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", self->_numberOfDefaultDayHighlights, self->_numberOfDayHighlights);
  self->_ratioOfDefaultDays = v27;
  v28 = mach_absolute_time();
  v29 = info;
  v30 = v17;
  v31 = v30;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v31, OS_SIGNPOST_INTERVAL_END, v15, "DayDefaultStatistics", ", buf, 2u);
  }

  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v111 = "DayDefaultStatistics";
    *(_WORD *)&v111[8] = 2048;
    *(double *)&v111[10] = (float)((float)((float)((float)(v28 - v100) * (float)v29.numer) / (float)v29.denom)
                                 / 1000000.0);
    _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (v8 && (v32 = CFAbsoluteTimeGetCurrent(), v32 - v9 >= 0.01))
  {
    v108 = 0;
    v8[2](v8, (mach_timebase_info *)&v108, 0.22);
    if (v108)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v111 = 304;
        *(_WORD *)&v111[4] = 2080;
        *(_QWORD *)&v111[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v34 = 0;
      v33 = 1;
    }
    else
    {
      v33 = 0;
      v34 = 1;
    }
  }
  else
  {
    v33 = 0;
    v34 = 1;
    v32 = v9;
  }

  objc_autoreleasePoolPop(context);
  if (v34)
  {
    contexta = v33;
    v97 = (void *)MEMORY[0x1CAA4EB2C]();
    v101 = v31;
    v35 = v31;
    v36 = os_signpost_id_generate(v35);
    v37 = v35;
    v38 = v37;
    v39 = v36 - 1;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "DayAggregationsStatistics", ", buf, 2u);
    }
    spid = v36;

    info = 0;
    mach_timebase_info(&info);
    v93 = mach_absolute_time();
    -[PGCuratedLibraryIntelligenceMetricEvent _daysWithinAggregations](self, "_daysWithinAggregations");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCuratedLibraryIntelligenceMetricEvent _aggregationGroups](self, "_aggregationGroups");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numberOfAggregations = objc_msgSend(v95, "count");
    self->_numberOfDaysInAggregations = objc_msgSend(v40, "count");
    -[PGCuratedLibraryIntelligenceMetricEvent _assetsStatisticsInHighlights:photoLibrary:includeUtility:](self, "_assetsStatisticsInHighlights:photoLibrary:includeUtility:", v40, v107, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("total"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "unsignedIntegerValue");

    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("curated"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "unsignedIntegerValue");

    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v43, self->_numberOfAggregations);
    self->_averageNumberOfAssetsInAggregationHighlights = v46;
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v43, self->_librarySize);
    self->_ratioOfAssetsInAggregationHighlights = v47;
    v92 = v45;
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v45, v43);
    self->_ratioOfCuratedAssetsInAggregations = v48;
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", self->_numberOfDaysInAggregations, self->_numberOfDayHighlights);
    self->_ratioOfDaysInAggregations = v49;
    v50 = mach_absolute_time();
    v51 = info;
    v52 = v38;
    v53 = v52;
    if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v53, OS_SIGNPOST_INTERVAL_END, spid, "DayAggregationsStatistics", ", buf, 2u);
    }

    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v111 = "DayAggregationsStatistics";
      *(_WORD *)&v111[8] = 2048;
      *(double *)&v111[10] = (float)((float)((float)((float)(v50 - v93) * (float)v51.numer) / (float)v51.denom)
                                   / 1000000.0);
      _os_log_impl(&dword_1CA237000, v53, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v31 = v101;
    if (v8)
    {
      v54 = CFAbsoluteTimeGetCurrent();
      v55 = contexta;
      if (v54 - v32 >= 0.01)
      {
        v108 = 0;
        v8[2](v8, (mach_timebase_info *)&v108, 0.24);
        if (v108 | contexta)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v111 = 326;
            *(_WORD *)&v111[4] = 2080;
            *(_QWORD *)&v111[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v56 = 0;
          v55 = 1;
        }
        else
        {
          v55 = 0;
          v56 = 1;
        }
      }
      else
      {
        v56 = 1;
        v54 = v32;
      }
    }
    else
    {
      v56 = 1;
      v54 = v32;
      v55 = contexta;
    }

    objc_autoreleasePoolPop(v97);
    if (v56)
    {
      contextb = v55;
      v98 = (void *)MEMORY[0x1CAA4EB2C]();
      v57 = v53;
      v58 = os_signpost_id_generate(v57);
      v59 = v57;
      v60 = v59;
      v89 = v58 - 1;
      if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v60, OS_SIGNPOST_INTERVAL_BEGIN, v58, "TripsStatistics", ", buf, 2u);
      }
      v87 = v58;

      info = 0;
      mach_timebase_info(&info);
      v88 = mach_absolute_time();
      -[PGCuratedLibraryIntelligenceMetricEvent _daysWithinTrips](self, "_daysWithinTrips");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGCuratedLibraryIntelligenceMetricEvent _shortTripDayGroups](self, "_shortTripDayGroups");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGCuratedLibraryIntelligenceMetricEvent _longTripDayGroups](self, "_longTripDayGroups");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v62;
      self->_numberOfShortTrips = objc_msgSend(v62, "count");
      spida = v63;
      v64 = objc_msgSend(v63, "count");
      self->_numberOfLongTrips = v64;
      v65 = self->_numberOfShortTrips + v64;
      self->_numberOfDaysInTrips = objc_msgSend(v61, "count");
      v96 = v61;
      -[PGCuratedLibraryIntelligenceMetricEvent _assetsStatisticsInHighlights:photoLibrary:includeUtility:](self, "_assetsStatisticsInHighlights:photoLibrary:includeUtility:", v61, v107, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("total"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "unsignedIntegerValue");

      -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v68, v65);
      self->_averageNumberOfAssetsInTripHighlights = v69;
      -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v68, self->_librarySize);
      self->_ratioOfAssetsInTripHighlights = v70;
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("curated"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "unsignedIntegerValue");

      -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v72, v68);
      self->_ratioOfCuratedAssetsInTrips = v73;
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("utility"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v74, "unsignedIntegerValue");

      -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v75, v68);
      self->_ratioOfUtilityAssetsInTrips = v76;
      -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v68 - (v72 + v75), v68);
      self->_ratioOfDedupedAssetsInTrips = v77;
      -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", self->_numberOfDaysInTrips, self->_numberOfDayHighlights);
      self->_ratioOfDaysInTrips = v78;
      v79 = mach_absolute_time();
      v80 = info;
      v81 = v60;
      v82 = v81;
      if (v89 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v82, OS_SIGNPOST_INTERVAL_END, v87, "TripsStatistics", ", buf, 2u);
      }

      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v111 = "TripsStatistics";
        *(_WORD *)&v111[8] = 2048;
        *(double *)&v111[10] = (float)((float)((float)((float)(v79 - v88) * (float)v80.numer) / (float)v80.denom)
                                     / 1000000.0);
        _os_log_impl(&dword_1CA237000, v82, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v83 = contextb;
      if (v8 && (v84 = CFAbsoluteTimeGetCurrent(), v84 - v54 >= 0.01))
      {
        v108 = 0;
        v8[2](v8, (mach_timebase_info *)&v108, 0.26);
        if (v108 | contextb)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v111 = 354;
            *(_WORD *)&v111[4] = 2080;
            *(_QWORD *)&v111[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v85 = 0;
          v83 = 1;
        }
        else
        {
          v83 = 0;
          v85 = 1;
        }
      }
      else
      {
        v85 = 1;
        v84 = v54;
      }

      objc_autoreleasePoolPop(v98);
      if (v85)
      {
        self->_numberOfCuratedAssets = v92 + v99 + v72;
        -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:");
        self->_ratioOfCuratedAssets = v86;
        if (v8)
        {
          if (CFAbsoluteTimeGetCurrent() - v84 >= 0.01)
          {
            LOBYTE(info.numer) = 0;
            v8[2](v8, &info, 0.3);
            if (LOBYTE(info.numer) | v83)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v111 = 361;
                *(_WORD *)&v111[4] = 2080;
                *(_QWORD *)&v111[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
            }
          }
        }
      }
    }
  }

  v7 = v105;
  v6 = v106;
LABEL_65:

}

- (void)_fillContentScoreStatisticsWithGraph:(id)a3 withProgressBlock:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, _BYTE *, double);
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double Current;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  char v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(v7);
  v9 = 0.0;
  if (!v8 || (v10 = CFAbsoluteTimeGetCurrent(), v10 < 0.01))
  {
LABEL_7:
    if (!self->_librarySize)
    {
      *(_QWORD *)&self->_ratioOfAssetsWithUtilityCurationScore = PGMetricsUnavailableDoubleValue;
      *(_QWORD *)&self->_ratioOfAssetsWithDefaultCurationScore = PGMetricsUnavailableDoubleValue;
      *(_QWORD *)&self->_ratioOfAssetsWithImprovedCurationScore = PGMetricsUnavailableDoubleValue;
      *(_QWORD *)&self->_ratioOfAssetsWithBetterCurationScore = PGMetricsUnavailableDoubleValue;
      goto LABEL_35;
    }
    -[PGManager photoLibrary](self->_manager, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setIncludeGuestAssets:", 1);
    v13 = (void *)MEMORY[0x1CAA4EB2C](objc_msgSend(v12, "setShouldPrefetchCount:", 1));
    v14 = *MEMORY[0x1E0D77DE0];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore < %f"), *MEMORY[0x1E0D77DE0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInternalPredicate:", v15);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v17, self->_librarySize);
    self->_ratioOfAssetsWithUtilityCurationScore = v18;
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v17, self->_librarySize);
    self->_ratioOfUtilityAssets = v19;
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", self->_librarySize - self->_numberOfCuratedAssets - v17);
    self->_ratioOfDedupedAssets = v20;

    objc_autoreleasePoolPop(v13);
    if (v8)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v9 >= 0.01)
      {
        v39 = 0;
        v8[2](v8, &v39, 0.32);
        if (v39)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v41 = 394;
            v42 = 2080;
            v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            v22 = MEMORY[0x1E0C81028];
LABEL_26:
            _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_34;
          }
          goto LABEL_34;
        }
        v9 = Current;
      }
    }
    v23 = (void *)MEMORY[0x1CAA4EB2C]();
    v24 = *MEMORY[0x1E0D77DE8];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore >= %f AND curationScore < %f"), v14, *MEMORY[0x1E0D77DE8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInternalPredicate:", v25);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", objc_msgSend(v26, "count"), self->_librarySize);
    self->_ratioOfAssetsWithDefaultCurationScore = v27;

    objc_autoreleasePoolPop(v23);
    if (v8)
    {
      v28 = CFAbsoluteTimeGetCurrent();
      if (v28 - v9 >= 0.01)
      {
        v39 = 0;
        v8[2](v8, &v39, 0.34);
        if (v39)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v41 = 404;
            v42 = 2080;
            v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            v22 = MEMORY[0x1E0C81028];
            goto LABEL_26;
          }
LABEL_34:

          goto LABEL_35;
        }
        v9 = v28;
      }
    }
    v29 = (void *)MEMORY[0x1CAA4EB2C]();
    v30 = *MEMORY[0x1E0D77DD8];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore >= %f AND curationScore < %f"), v24, *MEMORY[0x1E0D77DD8]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInternalPredicate:", v31);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", objc_msgSend(v32, "count"), self->_librarySize);
    self->_ratioOfAssetsWithImprovedCurationScore = v33;

    objc_autoreleasePoolPop(v29);
    if (v8)
    {
      v34 = CFAbsoluteTimeGetCurrent();
      if (v34 - v9 >= 0.01)
      {
        v39 = 0;
        v8[2](v8, &v39, 0.36);
        if (v39)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v41 = 414;
            v42 = 2080;
            v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            v22 = MEMORY[0x1E0C81028];
            goto LABEL_26;
          }
          goto LABEL_34;
        }
        v9 = v34;
      }
    }
    v35 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore >= %f"), v30);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInternalPredicate:", v36);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", objc_msgSend(v37, "count"), self->_librarySize);
    self->_ratioOfAssetsWithBetterCurationScore = v38;

    objc_autoreleasePoolPop(v35);
    if (v8)
    {
      if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
      {
        v39 = 0;
        v8[2](v8, &v39, 0.38);
        if (v39)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v41 = 424;
            v42 = 2080;
            v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_34;
  }
  v39 = 0;
  v8[2](v8, &v39, 0.3);
  if (!v39)
  {
    v9 = v10;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v41 = 367;
    v42 = 2080;
    v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_35:

}

- (void)_fillAestheticAndBehavioralCurationStatisticsWithGraph:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  PGBehavioralScoreProcessor *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  id v28;

  v28 = a3;
  objc_msgSend(v28, "infoNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personalHighAestheticsThreshold");
  self->_personalHighAestheticScore = v5;
  objc_msgSend(v4, "personalGoodAestheticsThreshold");
  self->_personalGoodAestheticScore = v6;
  objc_msgSend(v4, "topTierAestheticScore");
  self->_topTierAestheticScore = v7;
  objc_msgSend(v4, "topTierAestheticScoreForTripKeyAsset");
  self->_topTierAestheticScoreForTripKeyAsset = v8;
  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShouldPrefetchCount:", 1);
  v12 = -[PGBehavioralScoreProcessor initWithGraphManager:algorithm:]([PGBehavioralScoreProcessor alloc], "initWithGraphManager:algorithm:", self->_manager, 1);
  v13 = (void *)MEMORY[0x1E0CB3880];
  -[PGBehavioralScoreProcessor goldAssetUUIDs](v12, "goldAssetUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("uuid IN %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInternalPredicate:", v15);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", objc_msgSend(v16, "count"), self->_librarySize);
  self->_ratioOfGoldAssets = v17;

  objc_autoreleasePoolPop(v10);
  v18 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("computedAttributes.behavioralScore >= %f"), 0x3FECCCCCC0000000);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInternalPredicate:", v20);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", objc_msgSend(v21, "count"), self->_librarySize);
  self->_ratioOfShinyGemAssets = v22;

  objc_autoreleasePoolPop(v18);
  v23 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(computedAttributes.behavioralScore < %f AND computedAttributes.behavioralScore >= %f)"), 0x3FECCCCCC0000000, 0x3FE6666660000000);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setInternalPredicate:", v25);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", objc_msgSend(v26, "count"), self->_librarySize);
  self->_ratioOfRegularGemAssets = v27;

  objc_autoreleasePoolPop(v23);
}

- (void)_fillMonthHighlightsStatisticsWithGraph:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  PGCuratedLibraryIntelligenceMetricEvent *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  PGCuratedLibraryIntelligenceMetricEvent *v31;
  void *context;
  id v33;
  id obj;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000302);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = self;
  self->_numberOfMonthHighlights = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v4;
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("visibilityState == %d || visibilityState == %d"), 3, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v6;
  objc_msgSend(v6, "setInternalPredicate:", v7);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v5;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  if (v38)
  {
    v35 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v13, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceDate:", v37);
        v17 = v16;

        if (v17 < 0.0)
          v17 = -v17;
        if (v17 < 31536000.0)
          ++v8;
        objc_msgSend(MEMORY[0x1E0CD1708], "fetchChildHighlightsForHighlight:options:", v13, v36);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v40;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v40 != v21)
                objc_enumerationMutation(v18);
              v10 += objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "extendedCount");
            }
            if (v17 >= 31536000.0)
              v23 = 0;
            else
              v23 = v20;
            v11 += v20;
            v9 += v23;
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v20);
        }

        objc_autoreleasePoolPop(v14);
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v38);
  }

  v24 = v31;
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](v31, "_ratioFromNumerator:denominator:", v9, v8);
  v31->_averageNumberOfPromotedHighlightsPerMonthPastYear = v25;
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](v24, "_ratioFromNumerator:denominator:", v11, v24->_numberOfMonthHighlights);
  v31->_averageNumberOfPromotedHighlightsPerMonth = v26;
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](v24, "_ratioFromNumerator:denominator:", v10, v24->_numberOfMonthHighlights);
  v31->_averageNumberOfCuratedAssetsPerMonth = v27;
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](v24, "_ratioFromNumerator:denominator:", v10, v24->_numberOfCuratedAssets);
  v31->_ratioOfCuratedAssetsCoveredInMonth = v28;

  objc_autoreleasePoolPop(context);
}

- (void)_fillYearHighlightsStatisticsWithGraph:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000303, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfYearHighlights = objc_msgSend(v7, "count");

  objc_autoreleasePoolPop(v4);
}

- (void)_fillHiddenHighlightsStatisticsWithGraph:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v10 = a3;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("promotionScore < 0.25"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInternalPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", objc_msgSend(v8, "count"), self->_numberOfDayHighlights);
  self->_ratioOfHiddenDayHighlights = v9;

  objc_autoreleasePoolPop(v4);
}

- (void)_fillOnesiesHighlightStatisticsWithGraph:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *context;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("visibilityState == %d || visibilityState == %d"), 1, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v6);

  v21 = v5;
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 0x7FFFFFFFFFFFFFFFLL, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1CAA4EB2C]();
        v18 = objc_msgSend(v16, "extendedCount");
        if (v18 == 2)
        {
          ++v13;
        }
        else if (v18 == 1)
        {
          ++v12;
        }
        objc_autoreleasePoolPop(v17);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }

  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v12, v8);
  self->_ratioOfCurated1siesAmongVisibleHighlights = v19;
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v13, v8);
  self->_ratioOfCurated2siesAmongVisibleHighlights = v20;

  objc_autoreleasePoolPop(context);
}

- (void)_fillKeyAssetsStatisticsWithGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA4EB2C]();
  -[PGCuratedLibraryIntelligenceMetricEvent _dayHighlights](self, "_dayHighlights");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetByHighlightUUIDForHighlights:options:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PGCuratedLibraryIntelligenceMetricEvent__fillKeyAssetsStatisticsWithGraph___block_invoke;
  v15[3] = &unk_1E8429090;
  v15[4] = &v28;
  v15[5] = &v20;
  v15[6] = &v24;
  v15[7] = &v16;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);
  v10 = v25[3] + v29[3];
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:");
  self->_ratioOfPhotoKeyAssets = v11;
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v21[3], v10);
  self->_ratioOfAutoplayedPhotoKeyAssets = v12;
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v25[3], v10);
  self->_ratioOfVideoKeyAssets = v13;
  -[PGCuratedLibraryIntelligenceMetricEvent _ratioFromNumerator:denominator:](self, "_ratioFromNumerator:denominator:", v17[3], v10);
  self->_ratioOfAutoplayedVideoKeyAssets = v14;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  objc_autoreleasePoolPop(v5);
}

- (void)_fillMomentsStatisticsWithGraph:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  self->_numberOfMoments = objc_msgSend(v5, "numberOfMomentNodes");
  objc_autoreleasePoolPop(v4);

}

- (void)_fillProcessingLevelStatisticsWithGraph:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ratioOfAssetsWithFacesProcessed");
  -[PGCuratedLibraryIntelligenceMetricEvent setRatioOfProcessedFaces:](self, "setRatioOfProcessedFaces:");
  objc_msgSend(v5, "ratioOfAssetsWithScenesProcessed");
  -[PGCuratedLibraryIntelligenceMetricEvent setRatioOfProcessedScenes:](self, "setRatioOfProcessedScenes:");

  objc_autoreleasePoolPop(v4);
}

- (void)_saveKey:(id)a3 doubleValue:(double)a4 payload:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  if (*(double *)&PGMetricsUnavailableDoubleValue != a4)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = a5;
    v9 = a3;
    objc_msgSend(v7, "numberWithDouble:", a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

  }
}

- (void)_saveKey:(id)a3 integerValue:(unint64_t)a4 payload:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "numberWithUnsignedInteger:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

}

- (void)_saveKey:(id)a3 stringValue:(id)a4 payload:(id)a5
{
  objc_msgSend(a5, "setObject:forKeyedSubscript:", a4, a3);
}

- (id)payload
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("librarySize"), self->_librarySize, v3);
  objc_msgSend((id)objc_opt_class(), "librarySizeRangeDescriptionForLibrarySizeRange:", self->_librarySizeRange);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:stringValue:payload:](self, "_saveKey:stringValue:payload:", CFSTR("librarySizeRange"), v4, v3);

  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfDaysWithPhotosInPastYear"), self->_numberOfDaysWithPhotosInPastYear, v3);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfDayHighlights"), self->_numberOfDayHighlights, v3);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfDefaultDayHighlights"), self->_numberOfDefaultDayHighlights, v3);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfDaysInTrips"), self->_numberOfDaysInTrips, v3);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfDaysInAggregations"), self->_numberOfDaysInAggregations, v3);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfDefaultDays"), v3, self->_ratioOfDefaultDays);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfDaysInTrips"), v3, self->_ratioOfDaysInTrips);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfDaysInAggregations"), v3, self->_ratioOfDaysInAggregations);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfAggregations"), self->_numberOfAggregations, v3);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfShortTrips"), self->_numberOfShortTrips, v3);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfLongTrips"), self->_numberOfLongTrips, v3);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("averageNumberOfAssetsInDefaultHighlights"), v3, self->_averageNumberOfAssetsInDefaultHighlights);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("averageNumberOfAssetsInAggregationHighlights"), v3, self->_averageNumberOfAssetsInAggregationHighlights);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("averageNumberOfAssetsInTripHighlights"), v3, self->_averageNumberOfAssetsInTripHighlights);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfHiddenDayHighlights"), v3, self->_ratioOfHiddenDayHighlights);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfAssetsInDefaultHighlights"), v3, self->_ratioOfAssetsInDefaultHighlights);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfAssetsInAggregationHighlights"), v3, self->_ratioOfAssetsInAggregationHighlights);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfAssetsInTripHighlights"), v3, self->_ratioOfAssetsInTripHighlights);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfAssetsWithUtilityCurationScore"), v3, self->_ratioOfAssetsWithUtilityCurationScore);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfAssetsWithDefaultCurationScore"), v3, self->_ratioOfAssetsWithDefaultCurationScore);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfAssetsWithImprovedCurationScore"), v3, self->_ratioOfAssetsWithImprovedCurationScore);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfAssetsWithBetterCurationScore"), v3, self->_ratioOfAssetsWithBetterCurationScore);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("personalHighAestheticScore"), v3, self->_personalHighAestheticScore);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("personalGoodAestheticScore"), v3, self->_personalGoodAestheticScore);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("topTierAestheticScore"), v3, self->_topTierAestheticScore);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("topTierAestheticScoreForTripKeyAsset"), v3, self->_topTierAestheticScoreForTripKeyAsset);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfShinyGemAssets"), v3, self->_ratioOfShinyGemAssets);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfRegularGemAssets"), v3, self->_ratioOfRegularGemAssets);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfGoldAssets"), v3, self->_ratioOfGoldAssets);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMonthHighlights"), self->_numberOfMonthHighlights, v3);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("averageNumberOfPromotedHighlightsPerMonth"), v3, self->_averageNumberOfPromotedHighlightsPerMonth);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("averageNumberOfPromotedHighlightsPerMonthPastYear"), v3, self->_averageNumberOfPromotedHighlightsPerMonthPastYear);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("averageNumberOfCuratedAssetsPerMonth"), v3, self->_averageNumberOfCuratedAssetsPerMonth);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfCuratedAssetsCoveredInMonth"), v3, self->_ratioOfCuratedAssetsCoveredInMonth);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfYearHighlights"), self->_numberOfYearHighlights, v3);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOf1siesAmongVisibleHighlights"), v3, self->_ratioOfCurated1siesAmongVisibleHighlights);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOf2siesAmongVisibleHighlights"), v3, self->_ratioOfCurated2siesAmongVisibleHighlights);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("numberOfCuratedAssets"), v3, (double)self->_numberOfCuratedAssets);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfCuratedAssets"), v3, self->_ratioOfCuratedAssets);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfCuratedAssetsInTrips"), v3, self->_ratioOfCuratedAssetsInTrips);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfCuratedAssetsInDefaultHighlights"), v3, self->_ratioOfCuratedAssetsInDefaultHighlights);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfCuratedAssetsInAggregations"), v3, self->_ratioOfCuratedAssetsInAggregations);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfUtilityAssets"), v3, self->_ratioOfUtilityAssets);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfUtilityAssetsInTrips"), v3, self->_ratioOfUtilityAssetsInTrips);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfDedupedAssets"), v3, self->_ratioOfDedupedAssets);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfDedupedAssetsInTrips"), v3, self->_ratioOfDedupedAssetsInTrips);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:integerValue:payload:](self, "_saveKey:integerValue:payload:", CFSTR("numberOfMoments"), self->_numberOfMoments, v3);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfPhotoKeyAssets"), v3, self->_ratioOfPhotoKeyAssets);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfVideoKeyAssets"), v3, self->_ratioOfVideoKeyAssets);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfAutoplayedPhotoKeyAssets"), v3, self->_ratioOfAutoplayedPhotoKeyAssets);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfAutoplayedVideoKeyAssets"), v3, self->_ratioOfAutoplayedVideoKeyAssets);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfProcessedScenes"), v3, self->_ratioOfProcessedScenes);
  -[PGCuratedLibraryIntelligenceMetricEvent _saveKey:doubleValue:payload:](self, "_saveKey:doubleValue:payload:", CFSTR("ratioOfProcessedFaces"), v3, self->_ratioOfProcessedFaces);
  return v3;
}

- (unint64_t)_debugNumberOfAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate >= %@"), self->_debugDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setShouldPrefetchCount:", 1);
  objc_msgSend(v4, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)_assetsStatisticsInHighlights:(id)a3 photoLibrary:(id)a4 includeUtility:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[3];
  _QWORD v33[3];
  _BYTE v34[128];
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1CAA4EB2C]();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v13 += objc_msgSend(v17, "estimatedAssetCount");
        v14 += objc_msgSend(v17, "extendedCount");
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }

  if (v5)
  {
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShouldPrefetchCount:", 1);
    -[PGCuratedLibraryIntelligenceMetricEvent utilityPredicate](self, "utilityPredicate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInternalPredicate:", v19);

    objc_msgSend(v18, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollections:options:", v10, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

  }
  else
  {
    v21 = 0;
  }
  objc_autoreleasePoolPop(v9);
  v32[0] = CFSTR("total");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v22;
  v32[1] = CFSTR("curated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v23;
  v32[2] = CFSTR("utility");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)utilityPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore <= %f"), *MEMORY[0x1E0D77DF0]);
}

- (double)_ratioFromNumerator:(unint64_t)a3 denominator:(unint64_t)a4
{
  if (a4)
    return (double)a3 / (double)a4;
  else
    return -1.0;
}

- (id)_dayHighlights
{
  void *v2;
  void *v3;
  void *v4;

  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_numberOfDayHighlights
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)_defaultHighlights
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type = %d"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_daysWithinAggregations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type = %d"), 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_aggregationGroups
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type = %d"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000304, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_daysWithinTrips
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type = %d"), 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_shortTripDayGroups
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type = %d"), 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000304, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_longTripDayGroups
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type = %d"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000304, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDate)debugDate
{
  return self->_debugDate;
}

- (void)setDebugDate:(id)a3
{
  objc_storeStrong((id *)&self->_debugDate, a3);
}

- (PGManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (unint64_t)librarySize
{
  return self->_librarySize;
}

- (void)setLibrarySize:(unint64_t)a3
{
  self->_librarySize = a3;
}

- (int64_t)librarySizeRange
{
  return self->_librarySizeRange;
}

- (void)setLibrarySizeRange:(int64_t)a3
{
  self->_librarySizeRange = a3;
}

- (unint64_t)numberOfDaysWithPhotosInPastYear
{
  return self->_numberOfDaysWithPhotosInPastYear;
}

- (void)setNumberOfDaysWithPhotosInPastYear:(unint64_t)a3
{
  self->_numberOfDaysWithPhotosInPastYear = a3;
}

- (unint64_t)numberOfDayHighlights
{
  return self->_numberOfDayHighlights;
}

- (void)setNumberOfDayHighlights:(unint64_t)a3
{
  self->_numberOfDayHighlights = a3;
}

- (unint64_t)numberOfDefaultDayHighlights
{
  return self->_numberOfDefaultDayHighlights;
}

- (void)setNumberOfDefaultDayHighlights:(unint64_t)a3
{
  self->_numberOfDefaultDayHighlights = a3;
}

- (unint64_t)numberOfDaysInTrips
{
  return self->_numberOfDaysInTrips;
}

- (void)setNumberOfDaysInTrips:(unint64_t)a3
{
  self->_numberOfDaysInTrips = a3;
}

- (unint64_t)numberOfDaysInAggregations
{
  return self->_numberOfDaysInAggregations;
}

- (void)setNumberOfDaysInAggregations:(unint64_t)a3
{
  self->_numberOfDaysInAggregations = a3;
}

- (double)ratioOfDefaultDays
{
  return self->_ratioOfDefaultDays;
}

- (void)setRatioOfDefaultDays:(double)a3
{
  self->_ratioOfDefaultDays = a3;
}

- (double)ratioOfDaysInTrips
{
  return self->_ratioOfDaysInTrips;
}

- (void)setRatioOfDaysInTrips:(double)a3
{
  self->_ratioOfDaysInTrips = a3;
}

- (double)ratioOfDaysInAggregations
{
  return self->_ratioOfDaysInAggregations;
}

- (void)setRatioOfDaysInAggregations:(double)a3
{
  self->_ratioOfDaysInAggregations = a3;
}

- (unint64_t)numberOfShortTrips
{
  return self->_numberOfShortTrips;
}

- (void)setNumberOfShortTrips:(unint64_t)a3
{
  self->_numberOfShortTrips = a3;
}

- (unint64_t)numberOfLongTrips
{
  return self->_numberOfLongTrips;
}

- (void)setNumberOfLongTrips:(unint64_t)a3
{
  self->_numberOfLongTrips = a3;
}

- (unint64_t)numberOfAggregations
{
  return self->_numberOfAggregations;
}

- (void)setNumberOfAggregations:(unint64_t)a3
{
  self->_numberOfAggregations = a3;
}

- (double)averageNumberOfAssetsInDefaultHighlights
{
  return self->_averageNumberOfAssetsInDefaultHighlights;
}

- (void)setAverageNumberOfAssetsInDefaultHighlights:(double)a3
{
  self->_averageNumberOfAssetsInDefaultHighlights = a3;
}

- (double)averageNumberOfAssetsInAggregationHighlights
{
  return self->_averageNumberOfAssetsInAggregationHighlights;
}

- (void)setAverageNumberOfAssetsInAggregationHighlights:(double)a3
{
  self->_averageNumberOfAssetsInAggregationHighlights = a3;
}

- (double)averageNumberOfAssetsInTripHighlights
{
  return self->_averageNumberOfAssetsInTripHighlights;
}

- (void)setAverageNumberOfAssetsInTripHighlights:(double)a3
{
  self->_averageNumberOfAssetsInTripHighlights = a3;
}

- (double)ratioOfAssetsInDefaultHighlights
{
  return self->_ratioOfAssetsInDefaultHighlights;
}

- (void)setRatioOfAssetsInDefaultHighlights:(double)a3
{
  self->_ratioOfAssetsInDefaultHighlights = a3;
}

- (double)ratioOfAssetsInAggregationHighlights
{
  return self->_ratioOfAssetsInAggregationHighlights;
}

- (void)setRatioOfAssetsInAggregationHighlights:(double)a3
{
  self->_ratioOfAssetsInAggregationHighlights = a3;
}

- (double)ratioOfAssetsInTripHighlights
{
  return self->_ratioOfAssetsInTripHighlights;
}

- (void)setRatioOfAssetsInTripHighlights:(double)a3
{
  self->_ratioOfAssetsInTripHighlights = a3;
}

- (double)ratioOfAssetsWithUtilityCurationScore
{
  return self->_ratioOfAssetsWithUtilityCurationScore;
}

- (void)setRatioOfAssetsWithUtilityCurationScore:(double)a3
{
  self->_ratioOfAssetsWithUtilityCurationScore = a3;
}

- (double)ratioOfAssetsWithDefaultCurationScore
{
  return self->_ratioOfAssetsWithDefaultCurationScore;
}

- (void)setRatioOfAssetsWithDefaultCurationScore:(double)a3
{
  self->_ratioOfAssetsWithDefaultCurationScore = a3;
}

- (double)ratioOfAssetsWithImprovedCurationScore
{
  return self->_ratioOfAssetsWithImprovedCurationScore;
}

- (void)setRatioOfAssetsWithImprovedCurationScore:(double)a3
{
  self->_ratioOfAssetsWithImprovedCurationScore = a3;
}

- (double)ratioOfAssetsWithBetterCurationScore
{
  return self->_ratioOfAssetsWithBetterCurationScore;
}

- (void)setRatioOfAssetsWithBetterCurationScore:(double)a3
{
  self->_ratioOfAssetsWithBetterCurationScore = a3;
}

- (double)personalHighAestheticScore
{
  return self->_personalHighAestheticScore;
}

- (void)setPersonalHighAestheticScore:(double)a3
{
  self->_personalHighAestheticScore = a3;
}

- (double)personalGoodAestheticScore
{
  return self->_personalGoodAestheticScore;
}

- (void)setPersonalGoodAestheticScore:(double)a3
{
  self->_personalGoodAestheticScore = a3;
}

- (double)topTierAestheticScore
{
  return self->_topTierAestheticScore;
}

- (void)setTopTierAestheticScore:(double)a3
{
  self->_topTierAestheticScore = a3;
}

- (double)topTierAestheticScoreForTripKeyAsset
{
  return self->_topTierAestheticScoreForTripKeyAsset;
}

- (void)setTopTierAestheticScoreForTripKeyAsset:(double)a3
{
  self->_topTierAestheticScoreForTripKeyAsset = a3;
}

- (double)ratioOfShinyGemAssets
{
  return self->_ratioOfShinyGemAssets;
}

- (void)setRatioOfShinyGemAssets:(double)a3
{
  self->_ratioOfShinyGemAssets = a3;
}

- (double)ratioOfRegularGemAssets
{
  return self->_ratioOfRegularGemAssets;
}

- (void)setRatioOfRegularGemAssets:(double)a3
{
  self->_ratioOfRegularGemAssets = a3;
}

- (double)ratioOfGoldAssets
{
  return self->_ratioOfGoldAssets;
}

- (void)setRatioOfGoldAssets:(double)a3
{
  self->_ratioOfGoldAssets = a3;
}

- (unint64_t)numberOfMonthHighlights
{
  return self->_numberOfMonthHighlights;
}

- (void)setNumberOfMonthHighlights:(unint64_t)a3
{
  self->_numberOfMonthHighlights = a3;
}

- (double)averageNumberOfPromotedHighlightsPerMonth
{
  return self->_averageNumberOfPromotedHighlightsPerMonth;
}

- (void)setAverageNumberOfPromotedHighlightsPerMonth:(double)a3
{
  self->_averageNumberOfPromotedHighlightsPerMonth = a3;
}

- (double)averageNumberOfPromotedHighlightsPerMonthPastYear
{
  return self->_averageNumberOfPromotedHighlightsPerMonthPastYear;
}

- (void)setAverageNumberOfPromotedHighlightsPerMonthPastYear:(double)a3
{
  self->_averageNumberOfPromotedHighlightsPerMonthPastYear = a3;
}

- (double)averageNumberOfCuratedAssetsPerMonth
{
  return self->_averageNumberOfCuratedAssetsPerMonth;
}

- (void)setAverageNumberOfCuratedAssetsPerMonth:(double)a3
{
  self->_averageNumberOfCuratedAssetsPerMonth = a3;
}

- (double)ratioOfCuratedAssetsCoveredInMonth
{
  return self->_ratioOfCuratedAssetsCoveredInMonth;
}

- (void)setRatioOfCuratedAssetsCoveredInMonth:(double)a3
{
  self->_ratioOfCuratedAssetsCoveredInMonth = a3;
}

- (unint64_t)numberOfYearHighlights
{
  return self->_numberOfYearHighlights;
}

- (void)setNumberOfYearHighlights:(unint64_t)a3
{
  self->_numberOfYearHighlights = a3;
}

- (double)ratioOfHiddenDayHighlights
{
  return self->_ratioOfHiddenDayHighlights;
}

- (void)setRatioOfHiddenDayHighlights:(double)a3
{
  self->_ratioOfHiddenDayHighlights = a3;
}

- (double)ratioOfCurated1siesAmongVisibleHighlights
{
  return self->_ratioOfCurated1siesAmongVisibleHighlights;
}

- (void)setRatioOfCurated1siesAmongVisibleHighlights:(double)a3
{
  self->_ratioOfCurated1siesAmongVisibleHighlights = a3;
}

- (double)ratioOfCurated2siesAmongVisibleHighlights
{
  return self->_ratioOfCurated2siesAmongVisibleHighlights;
}

- (void)setRatioOfCurated2siesAmongVisibleHighlights:(double)a3
{
  self->_ratioOfCurated2siesAmongVisibleHighlights = a3;
}

- (unint64_t)numberOfCuratedAssets
{
  return self->_numberOfCuratedAssets;
}

- (void)setNumberOfCuratedAssets:(unint64_t)a3
{
  self->_numberOfCuratedAssets = a3;
}

- (double)ratioOfCuratedAssets
{
  return self->_ratioOfCuratedAssets;
}

- (void)setRatioOfCuratedAssets:(double)a3
{
  self->_ratioOfCuratedAssets = a3;
}

- (double)ratioOfCuratedAssetsInTrips
{
  return self->_ratioOfCuratedAssetsInTrips;
}

- (void)setRatioOfCuratedAssetsInTrips:(double)a3
{
  self->_ratioOfCuratedAssetsInTrips = a3;
}

- (double)ratioOfCuratedAssetsInDefaultHighlights
{
  return self->_ratioOfCuratedAssetsInDefaultHighlights;
}

- (void)setRatioOfCuratedAssetsInDefaultHighlights:(double)a3
{
  self->_ratioOfCuratedAssetsInDefaultHighlights = a3;
}

- (double)ratioOfCuratedAssetsInAggregations
{
  return self->_ratioOfCuratedAssetsInAggregations;
}

- (void)setRatioOfCuratedAssetsInAggregations:(double)a3
{
  self->_ratioOfCuratedAssetsInAggregations = a3;
}

- (double)ratioOfUtilityAssets
{
  return self->_ratioOfUtilityAssets;
}

- (void)setRatioOfUtilityAssets:(double)a3
{
  self->_ratioOfUtilityAssets = a3;
}

- (double)ratioOfUtilityAssetsInTrips
{
  return self->_ratioOfUtilityAssetsInTrips;
}

- (void)setRatioOfUtilityAssetsInTrips:(double)a3
{
  self->_ratioOfUtilityAssetsInTrips = a3;
}

- (double)ratioOfDedupedAssets
{
  return self->_ratioOfDedupedAssets;
}

- (void)setRatioOfDedupedAssets:(double)a3
{
  self->_ratioOfDedupedAssets = a3;
}

- (double)ratioOfDedupedAssetsInTrips
{
  return self->_ratioOfDedupedAssetsInTrips;
}

- (void)setRatioOfDedupedAssetsInTrips:(double)a3
{
  self->_ratioOfDedupedAssetsInTrips = a3;
}

- (unint64_t)numberOfMoments
{
  return self->_numberOfMoments;
}

- (void)setNumberOfMoments:(unint64_t)a3
{
  self->_numberOfMoments = a3;
}

- (double)ratioOfPhotoKeyAssets
{
  return self->_ratioOfPhotoKeyAssets;
}

- (void)setRatioOfPhotoKeyAssets:(double)a3
{
  self->_ratioOfPhotoKeyAssets = a3;
}

- (double)ratioOfAutoplayedPhotoKeyAssets
{
  return self->_ratioOfAutoplayedPhotoKeyAssets;
}

- (void)setRatioOfAutoplayedPhotoKeyAssets:(double)a3
{
  self->_ratioOfAutoplayedPhotoKeyAssets = a3;
}

- (double)ratioOfVideoKeyAssets
{
  return self->_ratioOfVideoKeyAssets;
}

- (void)setRatioOfVideoKeyAssets:(double)a3
{
  self->_ratioOfVideoKeyAssets = a3;
}

- (double)ratioOfAutoplayedVideoKeyAssets
{
  return self->_ratioOfAutoplayedVideoKeyAssets;
}

- (void)setRatioOfAutoplayedVideoKeyAssets:(double)a3
{
  self->_ratioOfAutoplayedVideoKeyAssets = a3;
}

- (double)ratioOfProcessedScenes
{
  return self->_ratioOfProcessedScenes;
}

- (void)setRatioOfProcessedScenes:(double)a3
{
  self->_ratioOfProcessedScenes = a3;
}

- (double)ratioOfProcessedFaces
{
  return self->_ratioOfProcessedFaces;
}

- (void)setRatioOfProcessedFaces:(double)a3
{
  self->_ratioOfProcessedFaces = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_debugDate, 0);
}

void __77__PGCuratedLibraryIntelligenceMetricEvent__fillKeyAssetsStatisticsWithGraph___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "highlightVisibilityScore");
  v5 = v4;
  if (objc_msgSend(v9, "mediaType") == 1)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = v9;
    if (v5 >= 0.763358779)
    {
      v7 = a1 + 40;
LABEL_8:
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 24);
    }
  }
  else
  {
    v8 = objc_msgSend(v9, "mediaType") == 2;
    v6 = v9;
    if (v8)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v5 >= 0.763358779)
      {
        v7 = a1 + 56;
        goto LABEL_8;
      }
    }
  }

}

void __74__PGCuratedLibraryIntelligenceMetricEvent_gatherMetricsWithProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (**v4)(void *, mach_timebase_info *, double);
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  mach_timebase_info v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  double Current;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint32_t denom;
  uint32_t numer;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  uint32_t v48;
  uint32_t v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  uint32_t v62;
  uint32_t v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  os_signpost_id_t v70;
  NSObject *v71;
  NSObject *v72;
  uint64_t v73;
  double v74;
  NSObject *v75;
  id v76;
  uint64_t v77;
  uint32_t v78;
  uint32_t v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  os_signpost_id_t v86;
  NSObject *v87;
  NSObject *v88;
  uint64_t v89;
  double v90;
  NSObject *v91;
  id v92;
  uint64_t v93;
  uint32_t v94;
  uint32_t v95;
  NSObject *v96;
  NSObject *v97;
  NSObject *v98;
  void *v99;
  NSObject *v100;
  NSObject *v101;
  os_signpost_id_t v102;
  NSObject *v103;
  NSObject *v104;
  uint64_t v105;
  double v106;
  NSObject *v107;
  id v108;
  uint64_t v109;
  uint32_t v110;
  uint32_t v111;
  NSObject *v112;
  NSObject *v113;
  NSObject *v114;
  void *v115;
  NSObject *v116;
  NSObject *v117;
  os_signpost_id_t v118;
  NSObject *v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  mach_timebase_info v123;
  NSObject *v124;
  NSObject *v125;
  NSObject *v126;
  void *v127;
  NSObject *v128;
  NSObject *v129;
  os_signpost_id_t v130;
  NSObject *v131;
  NSObject *v132;
  uint64_t v133;
  double v134;
  NSObject *v135;
  id v136;
  NSObject *v137;
  uint64_t v138;
  NSObject *v139;
  uint64_t v140;
  uint32_t v141;
  uint32_t v142;
  NSObject *v143;
  NSObject *v144;
  NSObject *v145;
  void *v146;
  NSObject *v147;
  NSObject *v148;
  os_signpost_id_t v149;
  NSObject *v150;
  NSObject *v151;
  uint64_t v152;
  double v153;
  NSObject *v154;
  id v155;
  uint64_t v156;
  uint32_t v157;
  uint32_t v158;
  NSObject *v159;
  NSObject *v160;
  NSObject *v161;
  void *v162;
  NSObject *v163;
  NSObject *v164;
  os_signpost_id_t v165;
  NSObject *v166;
  NSObject *v167;
  uint64_t v168;
  uint64_t v169;
  mach_timebase_info v170;
  NSObject *v171;
  NSObject *v172;
  NSObject *v173;
  uint64_t v174;
  uint32_t v175;
  uint32_t v176;
  NSObject *v177;
  NSObject *v178;
  NSObject *v179;
  NSObject *v180;
  id v181;
  NSObject *v182;
  NSObject *v183;
  NSObject *v184;
  NSObject *v185;
  NSObject *v186;
  NSObject *v187;
  os_signpost_id_t spid;
  NSObject *v189;
  uint64_t v190;
  unint64_t v191;
  NSObject *v192;
  id v193;
  NSObject *v194;
  char v195;
  mach_timebase_info v196;
  mach_timebase_info v197;
  mach_timebase_info v198;
  mach_timebase_info v199;
  mach_timebase_info v200;
  mach_timebase_info v201;
  mach_timebase_info v202;
  mach_timebase_info v203;
  mach_timebase_info v204;
  mach_timebase_info v205;
  mach_timebase_info v206;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v209[18];
  uint64_t v210;

  v210 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(*(const void **)(a1 + 48));
  v5 = 0.0;
  if (!v4 || (v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    v193 = v3;
    objc_msgSend(v3, "graph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(id *)(a1 + 32);
    v9 = os_signpost_id_generate(v8);
    v10 = v8;
    v11 = v10;
    v191 = v9 - 1;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CuratedLibraryIntelligenceMetrics", ", buf, 2u);
    }
    spid = v9;
    v194 = v11;

    info = 0;
    mach_timebase_info(&info);
    v190 = mach_absolute_time();
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsGeneric", buf, 2u);
    }

    v14 = *(id *)(a1 + 32);
    v15 = os_signpost_id_generate(v14);
    v16 = v14;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "CuratedLibraryIntelligenceMetricsGeneric", ", buf, 2u);
    }

    v206 = 0;
    mach_timebase_info(&v206);
    v18 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillGenericStatisticsWithGraph:", v7);
    v19 = mach_absolute_time();
    v20 = v206;
    v21 = v17;
    v22 = v21;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v22, OS_SIGNPOST_INTERVAL_END, v15, "CuratedLibraryIntelligenceMetricsGeneric", ", buf, 2u);
    }

    v23 = v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetricsGeneric";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v19 - v18) * (float)v20.numer) / (float)v20.denom)
                                   / 1000000.0);
      _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    if (v4)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v5 >= 0.01)
      {
        LOBYTE(v205.numer) = 0;
        v4[2](v4, &v205, 0.1);
        if (LOBYTE(v205.numer))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v209 = 177;
            *(_WORD *)&v209[4] = 2080;
            *(_QWORD *)&v209[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_200;
        }
        v5 = Current;
      }
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "loggingConnection");
    v26 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsProcessingLevels", buf, 2u);
    }

    v27 = *(id *)(a1 + 32);
    v28 = os_signpost_id_generate(v27);
    v29 = v27;
    v30 = v29;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "CuratedLibraryIntelligenceMetricsProcessingLevels", ", buf, 2u);
    }

    v205 = 0;
    mach_timebase_info(&v205);
    v31 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillProcessingLevelStatisticsWithGraph:", v7);
    if (v4)
    {
      v32 = CFAbsoluteTimeGetCurrent();
      if (v32 - v5 >= 0.01)
      {
        LOBYTE(v204.numer) = 0;
        v4[2](v4, &v204, 0.2);
        if (LOBYTE(v204.numer))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v209 = 183;
            *(_WORD *)&v209[4] = 2080;
            *(_QWORD *)&v209[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_199;
        }
        v5 = v32;
      }
    }
    v33 = mach_absolute_time();
    numer = v205.numer;
    denom = v205.denom;
    v36 = v30;
    v37 = v36;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v37, OS_SIGNPOST_INTERVAL_END, v28, "CuratedLibraryIntelligenceMetricsProcessingLevels", ", buf, 2u);
    }

    v38 = v37;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetricsProcessingLevels";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v33 - v31) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v38, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "loggingConnection");
    v40 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v40, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsDayHighlights", buf, 2u);
    }

    v41 = *(id *)(a1 + 32);
    v42 = os_signpost_id_generate(v41);
    v43 = v41;
    v44 = v43;
    if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v42, "CuratedLibraryIntelligenceMetricsDayHighlights", ", buf, 2u);
    }

    v204 = 0;
    mach_timebase_info(&v204);
    v45 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillDayHighlightsStatisticsWithGraph:withProgressBlock:", v7, *(_QWORD *)(a1 + 48));
    if (v4)
    {
      v46 = CFAbsoluteTimeGetCurrent();
      if (v46 - v5 >= 0.01)
      {
        LOBYTE(v203.numer) = 0;
        v4[2](v4, &v203, 0.3);
        if (LOBYTE(v203.numer))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v209 = 190;
            *(_WORD *)&v209[4] = 2080;
            *(_QWORD *)&v209[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_198;
        }
        v5 = v46;
      }
    }
    v47 = mach_absolute_time();
    v49 = v204.numer;
    v48 = v204.denom;
    v192 = v44;
    v50 = v44;
    v51 = v50;
    if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v51, OS_SIGNPOST_INTERVAL_END, v42, "CuratedLibraryIntelligenceMetricsDayHighlights", ", buf, 2u);
    }

    v52 = v51;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetricsDayHighlights";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v47 - v45) * (float)v49) / (float)v48) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v52, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "loggingConnection");
    v54 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v54, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsContentScore", buf, 2u);
    }

    v55 = *(id *)(a1 + 32);
    v56 = os_signpost_id_generate(v55);
    v57 = v55;
    v58 = v57;
    if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v56, "CuratedLibraryIntelligenceMetricsContentScore", ", buf, 2u);
    }

    v203 = 0;
    mach_timebase_info(&v203);
    v59 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillContentScoreStatisticsWithGraph:withProgressBlock:", v7, *(_QWORD *)(a1 + 48));
    v189 = v58;
    if (v4)
    {
      v60 = CFAbsoluteTimeGetCurrent();
      if (v60 - v5 >= 0.01)
      {
        LOBYTE(v202.numer) = 0;
        v4[2](v4, &v202, 0.4);
        if (LOBYTE(v202.numer))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v209 = 197;
            *(_WORD *)&v209[4] = 2080;
            *(_QWORD *)&v209[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v44 = v192;
          goto LABEL_197;
        }
        v5 = v60;
      }
    }
    v61 = mach_absolute_time();
    v63 = v203.numer;
    v62 = v203.denom;
    v64 = v58;
    v65 = v64;
    if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v65, OS_SIGNPOST_INTERVAL_END, v56, "CuratedLibraryIntelligenceMetricsContentScore", ", buf, 2u);
    }

    v66 = v65;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetricsContentScore";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v61 - v59) * (float)v63) / (float)v62) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v66, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "loggingConnection");
    v68 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v68, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsAestheticAndBehavioralCuration", buf, 2u);
    }

    v69 = *(id *)(a1 + 32);
    v70 = os_signpost_id_generate(v69);
    v71 = v69;
    v72 = v71;
    if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v72, OS_SIGNPOST_INTERVAL_BEGIN, v70, "CuratedLibraryIntelligenceMetricsAestheticAndBehavioralCuration", ", buf, 2u);
    }

    v202 = 0;
    mach_timebase_info(&v202);
    v73 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillAestheticAndBehavioralCurationStatisticsWithGraph:", v7);
    v187 = v72;
    if (v4)
    {
      v74 = CFAbsoluteTimeGetCurrent();
      if (v74 - v5 >= 0.01)
      {
        LOBYTE(v201.numer) = 0;
        v4[2](v4, &v201, 0.5);
        if (LOBYTE(v201.numer))
        {
          v75 = MEMORY[0x1E0C81028];
          v76 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v209 = 204;
            *(_WORD *)&v209[4] = 2080;
            *(_QWORD *)&v209[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          v44 = v192;
          goto LABEL_196;
        }
        v5 = v74;
      }
    }
    v77 = mach_absolute_time();
    v79 = v202.numer;
    v78 = v202.denom;
    v80 = v72;
    v81 = v80;
    if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v81, OS_SIGNPOST_INTERVAL_END, v70, "CuratedLibraryIntelligenceMetricsAestheticAndBehavioralCuration", ", buf, 2u);
    }

    v82 = v81;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetricsAestheticAndBehavioralCuration";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v77 - v73) * (float)v79) / (float)v78) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v82, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "loggingConnection");
    v84 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v84, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsMonthHighlights", buf, 2u);
    }

    v85 = *(id *)(a1 + 32);
    v86 = os_signpost_id_generate(v85);
    v87 = v85;
    v88 = v87;
    if (v86 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v88, OS_SIGNPOST_INTERVAL_BEGIN, v86, "CuratedLibraryIntelligenceMetricsMonthHighlights", ", buf, 2u);
    }

    v201 = 0;
    mach_timebase_info(&v201);
    v89 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillMonthHighlightsStatisticsWithGraph:", v7);
    v186 = v88;
    if (v4)
    {
      v90 = CFAbsoluteTimeGetCurrent();
      if (v90 - v5 >= 0.01)
      {
        LOBYTE(v200.numer) = 0;
        v4[2](v4, &v200, 0.6);
        if (LOBYTE(v200.numer))
        {
          v91 = MEMORY[0x1E0C81028];
          v92 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v209 = 211;
            *(_WORD *)&v209[4] = 2080;
            *(_QWORD *)&v209[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          v44 = v192;
          goto LABEL_195;
        }
        v5 = v90;
      }
    }
    v93 = mach_absolute_time();
    v95 = v201.numer;
    v94 = v201.denom;
    v96 = v88;
    v97 = v96;
    if (v86 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v97, OS_SIGNPOST_INTERVAL_END, v86, "CuratedLibraryIntelligenceMetricsMonthHighlights", ", buf, 2u);
    }

    v98 = v97;
    if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetricsMonthHighlights";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v93 - v89) * (float)v95) / (float)v94) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v98, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "loggingConnection");
    v100 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v100, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsYearHighlights", buf, 2u);
    }

    v101 = *(id *)(a1 + 32);
    v102 = os_signpost_id_generate(v101);
    v103 = v101;
    v104 = v103;
    if (v102 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v104, OS_SIGNPOST_INTERVAL_BEGIN, v102, "CuratedLibraryIntelligenceMetricsYearHighlights", ", buf, 2u);
    }

    v200 = 0;
    mach_timebase_info(&v200);
    v105 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillYearHighlightsStatisticsWithGraph:", v7);
    v185 = v104;
    if (v4)
    {
      v106 = CFAbsoluteTimeGetCurrent();
      if (v106 - v5 >= 0.01)
      {
        LOBYTE(v199.numer) = 0;
        v4[2](v4, &v199, 0.7);
        if (LOBYTE(v199.numer))
        {
          v107 = MEMORY[0x1E0C81028];
          v108 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v209 = 218;
            *(_WORD *)&v209[4] = 2080;
            *(_QWORD *)&v209[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          v44 = v192;
          goto LABEL_194;
        }
        v5 = v106;
      }
    }
    v109 = mach_absolute_time();
    v111 = v200.numer;
    v110 = v200.denom;
    v112 = v104;
    v113 = v112;
    if (v102 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v112))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v113, OS_SIGNPOST_INTERVAL_END, v102, "CuratedLibraryIntelligenceMetricsYearHighlights", ", buf, 2u);
    }

    v114 = v113;
    if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetricsYearHighlights";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v109 - v105) * (float)v111) / (float)v110) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v114, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "loggingConnection");
    v116 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v116, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsHiddenHighlights", buf, 2u);
    }

    v117 = *(id *)(a1 + 32);
    v118 = os_signpost_id_generate(v117);
    v119 = v117;
    v120 = v119;
    if (v118 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v119))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v120, OS_SIGNPOST_INTERVAL_BEGIN, v118, "CuratedLibraryIntelligenceMetricsHiddenHighlights", ", buf, 2u);
    }

    v199 = 0;
    mach_timebase_info(&v199);
    v121 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillHiddenHighlightsStatisticsWithGraph:", v7);
    v122 = mach_absolute_time();
    v123 = v199;
    v124 = v120;
    v125 = v124;
    if (v118 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v125, OS_SIGNPOST_INTERVAL_END, v118, "CuratedLibraryIntelligenceMetricsHiddenHighlights", ", buf, 2u);
    }

    v126 = v125;
    if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetricsHiddenHighlights";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v122 - v121) * (float)v123.numer) / (float)v123.denom)
                                   / 1000000.0);
      _os_log_impl(&dword_1CA237000, v126, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v184 = v126;

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "loggingConnection");
    v128 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v128, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsOnesieHighlights", buf, 2u);
    }

    v129 = *(id *)(a1 + 32);
    v130 = os_signpost_id_generate(v129);
    v131 = v129;
    v132 = v131;
    if (v130 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v131))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v132, OS_SIGNPOST_INTERVAL_BEGIN, v130, "CuratedLibraryIntelligenceMetricsOnesieHighlights", ", buf, 2u);
    }

    v198 = 0;
    mach_timebase_info(&v198);
    v133 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillOnesiesHighlightStatisticsWithGraph:", v7);
    v44 = v192;
    if (v4)
    {
      v134 = CFAbsoluteTimeGetCurrent();
      if (v134 - v5 >= 0.01)
      {
        LOBYTE(v197.numer) = 0;
        v4[2](v4, &v197, 0.8);
        if (LOBYTE(v197.numer))
        {
          v135 = MEMORY[0x1E0C81028];
          v136 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v209 = 231;
            *(_WORD *)&v209[4] = 2080;
            *(_QWORD *)&v209[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          v137 = v184;
          goto LABEL_193;
        }
        v5 = v134;
      }
    }
    v138 = mach_absolute_time();
    v139 = v132;
    v140 = v138;
    v142 = v198.numer;
    v141 = v198.denom;
    v183 = v139;
    v143 = v139;
    v144 = v143;
    if (v130 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v143))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v144, OS_SIGNPOST_INTERVAL_END, v130, "CuratedLibraryIntelligenceMetricsOnesieHighlights", ", buf, 2u);
    }

    v145 = v144;
    if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetricsOnesieHighlights";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v140 - v133) * (float)v142) / (float)v141) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v145, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "loggingConnection");
    v147 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v147, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsMoments", buf, 2u);
    }

    v148 = *(id *)(a1 + 32);
    v149 = os_signpost_id_generate(v148);
    v150 = v148;
    v151 = v150;
    if (v149 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v150))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v151, OS_SIGNPOST_INTERVAL_BEGIN, v149, "CuratedLibraryIntelligenceMetricsMoments", ", buf, 2u);
    }

    v197 = 0;
    mach_timebase_info(&v197);
    v152 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillMomentsStatisticsWithGraph:", v7);
    v182 = v151;
    if (v4)
    {
      v153 = CFAbsoluteTimeGetCurrent();
      if (v153 - v5 >= 0.01)
      {
        LOBYTE(v196.numer) = 0;
        v4[2](v4, &v196, 0.9);
        if (LOBYTE(v196.numer))
        {
          v154 = MEMORY[0x1E0C81028];
          v155 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v209 = 238;
            *(_WORD *)&v209[4] = 2080;
            *(_QWORD *)&v209[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          v44 = v192;
          v132 = v183;
          v137 = v184;
LABEL_192:

LABEL_193:
LABEL_194:

LABEL_195:
LABEL_196:

LABEL_197:
LABEL_198:

LABEL_199:
LABEL_200:

          v3 = v193;
          goto LABEL_201;
        }
        v5 = v153;
      }
    }
    v156 = mach_absolute_time();
    v158 = v197.numer;
    v157 = v197.denom;
    v159 = v151;
    v160 = v159;
    if (v149 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v159))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v160, OS_SIGNPOST_INTERVAL_END, v149, "CuratedLibraryIntelligenceMetricsMoments", ", buf, 2u);
    }

    v161 = v160;
    if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetricsMoments";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v156 - v152) * (float)v158) / (float)v157) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v161, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "loggingConnection");
    v163 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v163, OS_LOG_TYPE_INFO, "CuratedLibraryIntelligenceMetricsKeyAssets", buf, 2u);
    }

    v164 = *(id *)(a1 + 32);
    v165 = os_signpost_id_generate(v164);
    v166 = v164;
    v167 = v166;
    if (v165 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v166))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v167, OS_SIGNPOST_INTERVAL_BEGIN, v165, "CuratedLibraryIntelligenceMetricsKeyAssets", ", buf, 2u);
    }

    v196 = 0;
    mach_timebase_info(&v196);
    v168 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 40), "_fillKeyAssetsStatisticsWithGraph:", v7);
    v169 = mach_absolute_time();
    v170 = v196;
    v171 = v167;
    v172 = v171;
    if (v165 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v171))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v172, OS_SIGNPOST_INTERVAL_END, v165, "CuratedLibraryIntelligenceMetricsKeyAssets", ", buf, 2u);
    }

    v173 = v172;
    v137 = v184;
    if (os_log_type_enabled(v173, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetricsKeyAssets";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v169 - v168) * (float)v170.numer) / (float)v170.denom)
                                   / 1000000.0);
      _os_log_impl(&dword_1CA237000, v173, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    v174 = mach_absolute_time();
    v176 = info.numer;
    v175 = info.denom;
    v177 = v194;
    v178 = v177;
    if (v191 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v177))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v178, OS_SIGNPOST_INTERVAL_END, spid, "CuratedLibraryIntelligenceMetrics", ", buf, 2u);
    }

    v179 = v178;
    if (os_log_type_enabled(v179, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v209 = "CuratedLibraryIntelligenceMetrics";
      *(_WORD *)&v209[8] = 2048;
      *(double *)&v209[10] = (float)((float)((float)((float)(v174 - v190) * (float)v176) / (float)v175) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v179, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    v44 = v192;
    v132 = v183;
    if (v4)
    {
      if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
      {
        v195 = 0;
        v4[2](v4, (mach_timebase_info *)&v195, 1.0);
        if (v195)
        {
          v180 = MEMORY[0x1E0C81028];
          v181 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v209 = 248;
            *(_WORD *)&v209[4] = 2080;
            *(_QWORD *)&v209[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          v44 = v192;
        }
      }
    }

    goto LABEL_192;
  }
  LOBYTE(info.numer) = 0;
  v4[2](v4, &info, 0.0);
  if (!LOBYTE(info.numer))
  {
    v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v209 = 167;
    *(_WORD *)&v209[4] = 2080;
    *(_QWORD *)&v209[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Metrics/MetricEvents/PGCuratedLibraryIntelligenceMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_201:

}

+ (id)librarySizeRangeDescriptionForLibrarySizeRange:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("Unknown");
  else
    return *off_1E84290B0[a3];
}

@end
