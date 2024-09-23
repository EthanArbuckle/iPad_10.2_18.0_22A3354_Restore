@implementation PLAggregationProcessor

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[8];
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___PLAggregationProcessor;
  objc_msgSendSuper2(&v6, sel_initialize);
  v2 = _os_feature_enabled_impl() ^ 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("PLAggregationProcessorEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = &unk_1E375EB98;
  v7[1] = CFSTR("PLAggregationProcessorMaximumNumberOfAssetsPerMoment");
  v7[2] = CFSTR("PLAggregationProcessorMaximumNumberOfAssetsPerShortMoment");
  v8[2] = &unk_1E375EBB0;
  v8[3] = &unk_1E375EBC8;
  v7[3] = CFSTR("PLAggregationProcessorMaximumNumberOfDaysPerAggregation");
  v7[4] = CFSTR("PLAggregationProcessorMaximumNumberOfAssetsPerAggregation");
  v8[4] = &unk_1E375EBE0;
  v8[5] = MEMORY[0x1E0C9AAB0];
  v7[5] = CFSTR("PLAggregationProcessorRequireContiguousAggregation");
  v7[6] = CFSTR("PLAggregationProcessorRequireStartAtFirstDayOfWeek");
  v7[7] = CFSTR("PLAggregationProcessorNumberOfRecentDaysToIgnore");
  v8[6] = MEMORY[0x1E0C9AAA0];
  v8[7] = &unk_1E375EBF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", v5);

}

+ (BOOL)isEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PLAggregationProcessorEnabled"));

  return v3;
}

+ (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PLAggregationProcessorEnabled"));

}

+ (void)restoreDefaultEnablement
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("PLAggregationProcessorEnabled"));

}

+ (unint64_t)maximumNumberOfAssetsPerMoment
{
  if (maximumNumberOfAssetsPerMoment_onceToken != -1)
    dispatch_once(&maximumNumberOfAssetsPerMoment_onceToken, &__block_literal_global_42076);
  return maximumNumberOfAssetsPerMoment_maximumNumberOfAssetsPerMoment;
}

+ (unint64_t)maximumNumberOfAssetsPerShortMoment
{
  if (maximumNumberOfAssetsPerShortMoment_onceToken != -1)
    dispatch_once(&maximumNumberOfAssetsPerShortMoment_onceToken, &__block_literal_global_26_42073);
  return maximumNumberOfAssetsPerShortMoment_maximumNumberOfAssetsPerShortMoment;
}

+ (unint64_t)maximumNumberOfDaysPerAggregation
{
  if (maximumNumberOfDaysPerAggregation_onceToken != -1)
    dispatch_once(&maximumNumberOfDaysPerAggregation_onceToken, &__block_literal_global_27_42070);
  return maximumNumberOfDaysPerAggregation_maximumNumberOfDaysPerAggregation;
}

+ (unint64_t)maximumNumberOfAssetsPerAggregation
{
  if (maximumNumberOfAssetsPerAggregation_onceToken != -1)
    dispatch_once(&maximumNumberOfAssetsPerAggregation_onceToken, &__block_literal_global_28);
  return maximumNumberOfAssetsPerAggregation_maximumNumberOfAssetsPerAggregation;
}

+ (BOOL)requireContiguousAggregation
{
  if (requireContiguousAggregation_onceToken != -1)
    dispatch_once(&requireContiguousAggregation_onceToken, &__block_literal_global_29_42065);
  return requireContiguousAggregation_requireContiguousAggregation;
}

+ (BOOL)requireStartAtFirstDayOfWeek
{
  if (requireStartAtFirstDayOfWeek_onceToken != -1)
    dispatch_once(&requireStartAtFirstDayOfWeek_onceToken, &__block_literal_global_30);
  return requireStartAtFirstDayOfWeek_requireStartAtFirstDayOfWeek;
}

+ (NSDate)allowedStartDateToAggregate
{
  double v2;
  double v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "timeIntervalOfRecentContentToIgnore");
  v3 = v2;
  +[PLMomentGenerationUtils today](PLMomentGenerationUtils, "today");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

+ (double)timeIntervalOfRecentContentToIgnore
{
  if (timeIntervalOfRecentContentToIgnore_onceToken != -1)
    dispatch_once(&timeIntervalOfRecentContentToIgnore_onceToken, &__block_literal_global_32);
  return *(double *)&timeIntervalOfRecentContentToIgnore_timeIntervalOfRecentContentToIgnore;
}

+ (BOOL)shouldAggregateMoment:(id)a3 numberOfAssetsEligibleForCuration:(unint64_t *)a4
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  BOOL v21;
  BOOL v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = +[PLAggregationProcessor maximumNumberOfAssetsPerMoment](PLAggregationProcessor, "maximumNumberOfAssetsPerMoment");
  v6 = +[PLAggregationProcessor maximumNumberOfAssetsPerShortMoment](PLAggregationProcessor, "maximumNumberOfAssetsPerShortMoment");
  v7 = v6;
  v25 = 0u;
  v26 = 0u;
  if (v5 <= v6)
    v8 = v6;
  else
    v8 = v5;
  v27 = 0uLL;
  v28 = 0uLL;
  objc_msgSend(v4, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v26;
LABEL_6:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v9);
      if (+[PLPhotosHighlightGenerator assetEligibleForCuration:](PLPhotosHighlightGenerator, "assetEligibleForCuration:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14)))
      {
        if (++v12 > v8)
          break;
      }
      if (v11 == ++v14)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
          goto LABEL_6;
        break;
      }
    }
  }
  else
  {
    v12 = 0;
  }

  v15 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v4, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v16, v17);

  objc_msgSend(v18, "duration");
  v21 = v19 <= 120.0 && v12 <= v7;
  v22 = v12 <= v5 || v21;
  if (a4)
    *a4 = v12;

  return v22;
}

- (PLAggregationProcessor)init
{
  PLAggregationProcessor *v2;
  uint64_t v3;
  NSCalendar *calendar;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *curatedAssetCountByMomentUUID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLAggregationProcessor;
  v2 = -[PLAggregationProcessor init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v3 = objc_claimAutoreleasedReturnValue();
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v2->_calendar, "setTimeZone:", v5);

    v6 = objc_opt_new();
    curatedAssetCountByMomentUUID = v2->_curatedAssetCountByMomentUUID;
    v2->_curatedAssetCountByMomentUUID = (NSMutableDictionary *)v6;

  }
  return v2;
}

- (id)sortedNeighborMomentClustersOfMomentClusters:(id)a3 forAllMomentClusters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSCalendar *calendar;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSCalendar *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[2];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v9);
        calendar = self->_calendar;
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCalendar pl_startOfMonthForDate:](calendar, "pl_startOfMonthForDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "addObject:", v16);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v11);
  }

  v32 = v9;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = v7;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        v24 = self->_calendar;
        objc_msgSend(v23, "startDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCalendar pl_startOfMonthForDate:](v24, "pl_startOfMonthForDate:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v8, "containsObject:", v26))
          objc_msgSend(v17, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v20);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v27;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "sortedArrayUsingDescriptors:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)processAggregationsWithSortedMomentClusters:(id)a3 momentsContainedInOtherHighlights:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  NSMutableDictionary *curatedAssetCountByMomentUUID;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int v41;
  BOOL v42;
  int v43;
  char v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint32_t denom;
  uint32_t numer;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  char *v62;
  os_signpost_id_t spid;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  void *v68;
  id v69;
  id v70;
  NSObject *v71;
  void *v72;
  char v73;
  void *v74;
  void (**v75)(_QWORD, _QWORD, double);
  void *v76;
  id obj;
  char *obja;
  void *v79;
  double v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  void *v86;
  char v87;
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
  mach_timebase_info info;
  _BYTE buf[12];
  __int16 v102;
  char *v103;
  __int16 v104;
  double v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v85 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v69 = v9;
    v75 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x19AEC174C](v9);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    PLMomentGenerationGetLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);
    info = 0;
    mach_timebase_info(&info);
    v12 = v10;
    v13 = v12;
    v66 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "AggregationsProcessing", ", buf, 2u);
    }
    spid = v11;
    v71 = v13;

    v65 = mach_absolute_time();
    v67 = objc_msgSend(v8, "count");
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v14;
    objc_msgSend(v14, "setTimeZone:", v15);

    objc_msgSend((id)objc_opt_class(), "allowedStartDateToAggregate");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v70 = v8;
    obj = v8;
    v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
    if (v83)
    {
      v81 = *(_QWORD *)v97;
      do
      {
        for (i = 0; i != v83; ++i)
        {
          if (*(_QWORD *)v97 != v81)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
          objc_msgSend(v17, "moments");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          v95 = 0u;
          v19 = v18;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v93;
            v79 = v17;
            while (2)
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v93 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * j);
                v25 = (void *)MEMORY[0x19AEC1554]();
                *(_QWORD *)buf = 0;
                objc_msgSend(v24, "pl_startDate");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v26, "compare:", v86) == 1 || objc_msgSend(v85, "containsObject:", v24))
                {

LABEL_22:
                  objc_autoreleasePoolPop(v25);

                  goto LABEL_23;
                }
                v27 = objc_msgSend((id)objc_opt_class(), "shouldAggregateMoment:numberOfAssetsEligibleForCuration:", v24, buf);

                if (!v27)
                  goto LABEL_22;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)buf);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                curatedAssetCountByMomentUUID = self->_curatedAssetCountByMomentUUID;
                objc_msgSend(v24, "uuid");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](curatedAssetCountByMomentUUID, "setObject:forKeyedSubscript:", v28, v30);

                objc_autoreleasePoolPop(v25);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
              v17 = v79;
              if (v21)
                continue;
              break;
            }
          }

          objc_msgSend(v76, "addObject:", v17);
LABEL_23:

        }
        v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
      }
      while (v83);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend((id)objc_opt_class(), "requireContiguousAggregation");
    v82 = objc_msgSend((id)objc_opt_class(), "requireStartAtFirstDayOfWeek");
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v31 = obj;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
    if (v32)
    {
      v33 = v32;
      obja = 0;
      v80 = 0.0;
      v34 = 0;
      v35 = 0;
      v84 = *(_QWORD *)v89;
      v36 = 0.0;
LABEL_27:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v89 != v84)
          objc_enumerationMutation(v31);
        v38 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v37);
        if (v75)
        {
          v87 = 0;
          ((void (**)(_QWORD, char *, double))v75)[2](v75, &v87, v36);
          if (v87)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = 307;
              _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
            }
            v52 = v68;
            v51 = v68;

            v53 = v72;
            goto LABEL_72;
          }
        }
        objc_msgSend(v38, "localStartDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v34, "count");
        v41 = objc_msgSend(v76, "containsObject:", v38);
        if (v41)
          v42 = v40 == 0;
        else
          v42 = 0;
        if (v42)
          goto LABEL_50;
        v43 = v40 ? v41 : 0;
        if (v43 != 1)
          break;
        if (!-[NSCalendar isDate:equalToDate:toUnitGranularity:](self->_calendar, "isDate:equalToDate:toUnitGranularity:", v39, v35, 8))
        {
          *(_QWORD *)&v80 += v40;
          if (v40 == 1)
          {
            ++obja;
LABEL_50:
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v38);
            v46 = objc_claimAutoreleasedReturnValue();

            if (v82)
            {
              objc_msgSend(v74, "pl_startOfWeekForDate:", v39);
              v47 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v47 = v39;
            }
            v48 = v47;

            v34 = (void *)v46;
            v35 = v48;
            goto LABEL_54;
          }
LABEL_49:
          -[PLAggregationProcessor _aggregationMomentClustersForMomentClusters:](self, "_aggregationMomentClustersForMomentClusters:", v34);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "addObjectsFromArray:", v45);

          if (v43)
            goto LABEL_50;
          goto LABEL_56;
        }
        objc_msgSend(v34, "addObject:", v38);
LABEL_54:
        v36 = 1.0 / (double)v67 + v36;

        if (v33 == ++v37)
        {
          v50 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
          v33 = v50;
          if (v50)
            goto LABEL_27;
          goto LABEL_64;
        }
      }
      v44 = v73;
      if (!v40)
        v44 = 0;
      if ((v44 & 1) == 0)
        goto LABEL_54;
      *(_QWORD *)&v80 += v40;
      if (v40 != 1)
        goto LABEL_49;
      ++obja;
LABEL_56:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v49 = objc_claimAutoreleasedReturnValue();

      v35 = 0;
      v34 = (void *)v49;
      goto LABEL_54;
    }
    obja = 0;
    v80 = 0.0;
    v34 = 0;
    v35 = 0;
LABEL_64:

    v53 = v72;
    if ((unint64_t)objc_msgSend(v34, "count") >= 2)
    {
      -[PLAggregationProcessor _aggregationMomentClustersForMomentClusters:](self, "_aggregationMomentClustersForMomentClusters:", v34);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "addObjectsFromArray:", v54);

    }
    v55 = objc_msgSend(v72, "count");
    v56 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v59 = v71;
    v60 = v59;
    if (v66 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v55;
      v102 = 2048;
      v103 = obja;
      v104 = 2048;
      v105 = v80;
      _os_signpost_emit_with_name_impl(&dword_199541000, v60, OS_SIGNPOST_INTERVAL_END, spid, "AggregationsProcessing", "[HighlightsGeneration] Moment Aggregation statistics: %lu aggregations, %lu singletons, %lu moments contained", buf, 0x20u);
    }

    v61 = v60;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[HighlightsGeneration] Moment Aggregation statistics: %lu aggregations, %lu singletons, %lu moments contained"), v55, obja, *(_QWORD *)&v80);
      v62 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AggregationsProcessing";
      v102 = 2112;
      v103 = v62;
      v104 = 2048;
      v105 = (float)((float)((float)((float)(v56 - v65) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

    }
    v51 = v72;
    v52 = v68;
LABEL_72:

    v9 = v69;
    v8 = v70;
  }
  else
  {
    v51 = (id)MEMORY[0x1E0C9AA60];
  }

  return v51;
}

- (id)_aggregationMomentClustersForMomentClusters:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NSMutableDictionary *curatedAssetCountByMomentUUID;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  PLMomentCluster *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  id v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t m;
  NSMutableDictionary *v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  BOOL v58;
  id v59;
  uint64_t v60;
  void *v62;
  void *v63;
  void *v64;
  void (**v65)(_QWORD, _QWORD);
  id v66;
  unint64_t v67;
  id obj;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  void *v75;
  PLMomentCluster *v76;
  void *v77;
  unint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  id v91;
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
  _BYTE v104[128];
  _BYTE v105[128];
  PLMomentCluster *v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localStartDate");
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localEndDate");
  v8 = objc_claimAutoreleasedReturnValue();

  v63 = (void *)v8;
  v64 = (void *)v6;
  -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v6, v8, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v62, "day");
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
  v77 = v9;
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v80 = *(_QWORD *)v101;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v101 != v80)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        v96 = 0u;
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        objc_msgSend(v14, "moments");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v97;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v97 != v18)
                objc_enumerationMutation(v15);
              curatedAssetCountByMomentUUID = self->_curatedAssetCountByMomentUUID;
              objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * j), "uuid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](curatedAssetCountByMomentUUID, "objectForKeyedSubscript:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v12 += objc_msgSend(v22, "unsignedIntegerValue");

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
          }
          while (v17);
        }

        v9 = v77;
      }
      v11 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  v23 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfDaysPerAggregation");
  v24 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfAssetsPerAggregation");
  v25 = vcvtpd_u64_f64((double)v78 / (double)v23);
  v26 = vcvtpd_u64_f64((double)v12 / (double)v24);
  if (v25 <= v26)
    v27 = v26;
  else
    v27 = v25;
  v67 = v27 - 1;
  if (v27 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v29 = v9;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v93;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v93 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * k), "moments");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObjectsFromArray:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
      }
      while (v31);
    }

    v35 = -[PLMomentCluster initWithMoments:]([PLMomentCluster alloc], "initWithMoments:", v28);
    v106 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v78 <= v23)
      v37 = v23;
    else
      v37 = v78;
    if (v12 <= v24)
      v38 = v24;
    else
      v38 = v12;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v27);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (PLMomentCluster *)objc_claimAutoreleasedReturnValue();
    v40 = v64;
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __70__PLAggregationProcessor__aggregationMomentClustersForMomentClusters___block_invoke;
    v90[3] = &unk_1E366A108;
    v66 = v39;
    v91 = v66;
    v65 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v90);
    objc_msgSend(v9, "lastObject");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = v9;
    v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
    if (v73)
    {
      v41 = 0;
      v69 = vcvtpd_u64_f64((double)v38 / (double)v27);
      v70 = vcvtpd_u64_f64((double)v37 / (double)v27);
      v71 = *(_QWORD *)v87;
      v42 = v40;
      do
      {
        v43 = 0;
        v44 = v42;
        do
        {
          v79 = v44;
          if (*(_QWORD *)v87 != v71)
            objc_enumerationMutation(obj);
          v74 = v41;
          v75 = v40;
          v76 = v35;
          v45 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v43);
          objc_msgSend(v45, "localStartDate");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          objc_msgSend(v45, "moments");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
          if (v47)
          {
            v48 = v47;
            v49 = 0;
            v50 = *(_QWORD *)v83;
            do
            {
              for (m = 0; m != v48; ++m)
              {
                if (*(_QWORD *)v83 != v50)
                  objc_enumerationMutation(v46);
                v52 = self->_curatedAssetCountByMomentUUID;
                objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * m), "uuid");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKeyedSubscript:](v52, "objectForKeyedSubscript:", v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v49 += objc_msgSend(v54, "unsignedIntegerValue");

              }
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
            }
            while (v48);
          }
          else
          {
            v49 = 0;
          }

          v40 = v75;
          v41 = v49 + v74;
          v42 = v81;
          -[NSCalendar components:fromDate:toDate:options:](self->_calendar, "components:fromDate:toDate:options:", 16, v75, v81, 0);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "day");
          v57 = v79;
          if (v45 == v72
            || (v56 <= v70 ? (v58 = v41 > v69) : (v58 = 1),
                !v58
             || -[NSCalendar isDate:inSameDayAsDate:](self->_calendar, "isDate:inSameDayAsDate:", v81, v79)
             || objc_msgSend(v66, "count") == v67))
          {
            v35 = v76;
            -[PLMomentCluster addObject:](v76, "addObject:", v45);
          }
          else
          {
            ((void (**)(_QWORD, PLMomentCluster *))v65)[2](v65, v76);
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v45);
            v35 = (PLMomentCluster *)objc_claimAutoreleasedReturnValue();

            v59 = v81;
            v40 = v59;
            v57 = v79;
            v42 = v81;
            v41 = v49;
          }

          ++v43;
          v44 = v42;
        }
        while (v43 != v73);
        v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
        v73 = v60;
      }
      while (v60);
    }
    else
    {
      v42 = v40;
    }

    ((void (**)(_QWORD, PLMomentCluster *))v65)[2](v65, v35);
    v28 = v66;

    v36 = v28;
  }

  return v36;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (NSMutableDictionary)curatedAssetCountByMomentUUID
{
  return self->_curatedAssetCountByMomentUUID;
}

- (void)setCuratedAssetCountByMomentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_curatedAssetCountByMomentUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedAssetCountByMomentUUID, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

void __70__PLAggregationProcessor__aggregationMomentClustersForMomentClusters___block_invoke(uint64_t a1, void *a2)
{
  PLMomentCluster *v3;
  id v4;

  v4 = a2;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v3 = -[PLMomentCluster initWithMomentClusters:]([PLMomentCluster alloc], "initWithMomentClusters:", v4);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

double __61__PLAggregationProcessor_timeIntervalOfRecentContentToIgnore__block_invoke()
{
  void *v0;
  uint64_t v1;
  double result;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "integerForKey:", CFSTR("PLAggregationProcessorNumberOfRecentDaysToIgnore"));

  result = (double)v1 * 86400.0;
  *(double *)&timeIntervalOfRecentContentToIgnore_timeIntervalOfRecentContentToIgnore = result;
  return result;
}

void __54__PLAggregationProcessor_requireStartAtFirstDayOfWeek__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  requireStartAtFirstDayOfWeek_requireStartAtFirstDayOfWeek = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLAggregationProcessorRequireStartAtFirstDayOfWeek"));

}

void __54__PLAggregationProcessor_requireContiguousAggregation__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  requireContiguousAggregation_requireContiguousAggregation = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLAggregationProcessorRequireContiguousAggregation"));

}

void __61__PLAggregationProcessor_maximumNumberOfAssetsPerAggregation__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  maximumNumberOfAssetsPerAggregation_maximumNumberOfAssetsPerAggregation = objc_msgSend(v0, "integerForKey:", CFSTR("PLAggregationProcessorMaximumNumberOfAssetsPerAggregation"));

}

void __59__PLAggregationProcessor_maximumNumberOfDaysPerAggregation__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  maximumNumberOfDaysPerAggregation_maximumNumberOfDaysPerAggregation = objc_msgSend(v0, "integerForKey:", CFSTR("PLAggregationProcessorMaximumNumberOfDaysPerAggregation"));

}

void __61__PLAggregationProcessor_maximumNumberOfAssetsPerShortMoment__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  maximumNumberOfAssetsPerShortMoment_maximumNumberOfAssetsPerShortMoment = objc_msgSend(v0, "integerForKey:", CFSTR("PLAggregationProcessorMaximumNumberOfAssetsPerShortMoment"));

}

void __56__PLAggregationProcessor_maximumNumberOfAssetsPerMoment__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  maximumNumberOfAssetsPerMoment_maximumNumberOfAssetsPerMoment = objc_msgSend(v0, "integerForKey:", CFSTR("PLAggregationProcessorMaximumNumberOfAssetsPerMoment"));

}

@end
