@implementation RTPlaceTypeClassifierMetricsCalculator

- (RTPlaceTypeClassifierMetricsCalculator)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_learnedLocationStore_learnedPlaceTypeInferenceStore_metricManager_);
}

- (RTPlaceTypeClassifierMetricsCalculator)initWithDistanceCalculator:(id)a3 learnedLocationStore:(id)a4 learnedPlaceTypeInferenceStore:(id)a5 metricManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  RTPlaceTypeClassifierMetricsCalculator *v16;
  RTPlaceTypeClassifierMetricsCalculator *v17;
  uint64_t v18;
  NSMutableDictionary *metricsData;
  uint64_t v20;
  NSMutableArray *learnedPlaceTypeInferences;
  RTPlaceTypeClassifierMetricsCalculator *v22;
  NSObject *v23;
  const char *v24;
  objc_super v26;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_17;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_16;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: learnedPlaceTypeInferenceStore";
    goto LABEL_16;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: metricManager";
      goto LABEL_16;
    }
LABEL_17:

    v22 = 0;
    goto LABEL_18;
  }
  v26.receiver = self;
  v26.super_class = (Class)RTPlaceTypeClassifierMetricsCalculator;
  v16 = -[RTPlaceTypeClassifierMetricsCalculator init](&v26, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_distanceCalculator, a3);
    objc_storeStrong((id *)&v17->_learnedLocationStore, a4);
    objc_storeStrong((id *)&v17->_learnedPlaceTypeInferenceStore, a5);
    objc_storeStrong((id *)&v17->_metricManager, a6);
    v18 = objc_opt_new();
    metricsData = v17->_metricsData;
    v17->_metricsData = (NSMutableDictionary *)v18;

    v20 = objc_opt_new();
    learnedPlaceTypeInferences = v17->_learnedPlaceTypeInferences;
    v17->_learnedPlaceTypeInferences = (NSMutableArray *)v20;

    -[RTPlaceTypeClassifierMetricsCalculator setup](v17, "setup");
  }
  self = v17;
  v22 = self;
LABEL_18:

  return v22;
}

- (void)setup
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_onDailyMetricNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

}

+ (id)metricsSourceToString:(unint64_t)a3
{
  if (a3 - 1 > 0xF)
    return CFSTR("Unknown");
  else
    return off_1E929D628[a3 - 1];
}

+ (id)metricsKeyToString:(unint64_t)a3
{
  if (a3 - 1 > 0xA)
    return CFSTR("Unknown");
  else
    return off_1E929D6A8[a3 - 1];
}

+ (id)cacheMetricsKeyToString:(unint64_t)a3
{
  if (a3 > 0xB)
    return CFSTR("NonNilCount");
  else
    return off_1E929D700[a3];
}

+ (id)placeTypesForCacheMetrics
{
  return &unk_1E932C478;
}

+ (id)durationsForCacheMetrics
{
  return &unk_1E932C490;
}

- (void)resetStates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

  }
  -[RTPlaceTypeClassifierMetricsCalculator learnedPlaceTypeInferences](self, "learnedPlaceTypeInferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RTPlaceTypeClassifierMetricsCalculator learnedPlaceTypeInferences](self, "learnedPlaceTypeInferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

  }
  -[RTPlaceTypeClassifierMetricsCalculator setSessionId:](self, "setSessionId:", 0);
}

- (void)storeMetricsData:(id)a3 source:(unint64_t)a4 placeType:(unint64_t)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__RTPlaceTypeClassifierMetricsCalculator_storeMetricsData_source_placeType___block_invoke;
  v5[3] = &unk_1E929D4C8;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v5);
}

void __76__RTPlaceTypeClassifierMetricsCalculator_storeMetricsData_source_placeType___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a3;
  objc_msgSend(v4, "storeMetricsData:source:placeType:metricKey:", v7, v5, v6, objc_msgSend(a2, "unsignedIntValue"));

}

- (void)storeMetricsData:(id)a3 source:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  RTLearnedPlaceTypeInference *v27;
  void *v28;
  void *v29;
  void *v30;
  RTLearnedPlaceTypeInference *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  RTLearnedPlaceTypeInference *v41;
  void *v42;
  void *v43;
  RTLearnedPlaceTypeInference *v44;
  void *v45;
  NSObject *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  void *v70;
  id v72;
  id obj;
  id obja;
  void *v75;
  unint64_t v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  void *v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "metricsSourceToString:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v95 = v9;
    v96 = 2112;
    v97 = v10;
    v98 = 2112;
    v99 = (uint64_t)v11;
    v100 = 2048;
    v101 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, source, %@, number of inferred places, %lu", buf, 0x2Au);

  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v12 = objc_msgSend(&unk_1E932C4A8, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v91;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v91 != v14)
          objc_enumerationMutation(&unk_1E932C4A8);
        v16 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v15);
        if (objc_msgSend(v16, "unsignedIntValue") == 1
          || objc_msgSend(v16, "unsignedIntValue") == 2
          || a4 == 2 && objc_msgSend(v16, "unsignedIntValue") == 3)
        {
          -[RTPlaceTypeClassifierMetricsCalculator ensureMetricsDataHasKeysForSource:placeType:metricKey:](self, "ensureMetricsDataHasKeysForSource:placeType:metricKey:", a4, objc_msgSend(v16, "unsignedIntValue"), 1);
        }
        ++v15;
      }
      while (v13 != v15);
      v17 = objc_msgSend(&unk_1E932C4A8, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
      v13 = v17;
    }
    while (v17);
  }
  v76 = a4;
  v77 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifierMetricsCalculator sessionId](self, "sessionId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceTypeClassifierMetricsCalculator setSessionId:](self, "setSessionId:", v19);

  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v6;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v87 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        v25 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "type"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setObject:forKeyedSubscript:", v24, v26);

        v27 = [RTLearnedPlaceTypeInference alloc];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTPlaceTypeClassifierMetricsCalculator sessionId](self, "sessionId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[RTLearnedPlaceTypeInference initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:](v27, "initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:", v28, v29, v30, objc_msgSend(v24, "type"), v76, v75);

        if (v31)
        {
          -[RTPlaceTypeClassifierMetricsCalculator learnedPlaceTypeInferences](self, "learnedPlaceTypeInferences");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v31);

        }
        objc_autoreleasePoolPop(v25);
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
    }
    while (v21);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  objc_msgSend((id)objc_opt_class(), "placeTypesForCacheMetrics");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v82, v105, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v83;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v83 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
        v39 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v77, "objectForKeyedSubscript:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v40)
        {
          v41 = [RTLearnedPlaceTypeInference alloc];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTPlaceTypeClassifierMetricsCalculator sessionId](self, "sessionId");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = -[RTLearnedPlaceTypeInference initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:](v41, "initWithIdentifier:sessionId:learnedPlaceIdentifier:placeType:metricSource:creationDate:", v42, v43, 0, objc_msgSend(v38, "unsignedIntValue"), v76, v75);

          if (v44)
          {
            -[RTPlaceTypeClassifierMetricsCalculator learnedPlaceTypeInferences](self, "learnedPlaceTypeInferences");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v44);

          }
        }
        objc_autoreleasePoolPop(v39);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v82, v105, 16);
    }
    while (v35);
  }

  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    v47 = (objc_class *)objc_opt_class();
    NSStringFromClass(v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceTypeClassifierMetricsCalculator learnedPlaceTypeInferences](self, "learnedPlaceTypeInferences");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "count");
    *(_DWORD *)buf = 138412802;
    v95 = v48;
    v96 = 2112;
    v97 = v49;
    v98 = 2048;
    v99 = v51;
    _os_log_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_INFO, "%@, %@, learnedPlaceTypeInference count, %lu", buf, 0x20u);

  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v72 = obj;
  v52 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v78, v104, 16);
  v53 = v76;
  if (v52)
  {
    v54 = v52;
    v55 = 0;
    obja = *(id *)v79;
    do
    {
      v56 = 0;
      v57 = v55;
      do
      {
        if (*(id *)v79 != obja)
          objc_enumerationMutation(v72);
        v58 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v56);
        v59 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend((id)objc_opt_class(), "keyForSourceType:placeType:", v53, objc_msgSend(v58, "type"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKeyedSubscript:", v55);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectForKeyedSubscript:", &unk_1E9327FC8);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
        {
          -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "objectForKeyedSubscript:", v55);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", &unk_1E9327FC8);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "addObject:", v58);

          _rt_log_facility_get_os_log(RTLogFacilityMetric);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            v67 = (objc_class *)objc_opt_class();
            NSStringFromClass(v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "metricsKeyToString:", 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v95 = v68;
            v96 = 2112;
            v97 = v69;
            v98 = 2112;
            v99 = (uint64_t)v55;
            v100 = 2112;
            v101 = (uint64_t)v70;
            v102 = 2112;
            v103 = v58;
            _os_log_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_DEFAULT, "%@, %@, metricsDataMainKey, %@, metricKey, %@, learnedPlace, %@", buf, 0x34u);

            v53 = v76;
          }

        }
        objc_autoreleasePoolPop(v59);
        ++v56;
        v57 = v55;
      }
      while (v54 != v56);
      v54 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v78, v104, 16);
    }
    while (v54);

  }
}

- (void)storeMetricsData:(id)a3 source:(unint64_t)a4 placeType:(unint64_t)a5 metricKey:(unint64_t)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (a6 == 1)
    -[RTPlaceTypeClassifierMetricsCalculator storeMetricsData:source:](self, "storeMetricsData:source:", v11, a4);
  -[RTPlaceTypeClassifierMetricsCalculator ensureMetricsDataHasKeysForSource:placeType:metricKey:](self, "ensureMetricsDataHasKeysForSource:placeType:metricKey:", a4, a5, a6);
  -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyForSourceType:placeType:", a4, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v15);

  v16 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __86__RTPlaceTypeClassifierMetricsCalculator_storeMetricsData_source_placeType_metricKey___block_invoke;
    v25[3] = &unk_1E929D4F0;
    v26 = v16;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v25);

  }
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "keyForSourceType:placeType:", a4, a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "metricsKeyToString:", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    *(_DWORD *)buf = 138413314;
    if ((isKindOfClass & 1) != 0)
      v24 = v16;
    else
      v24 = v11;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v21;
    v33 = 2112;
    v34 = v22;
    v35 = 2112;
    v36 = v24;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEFAULT, "%@, %@, mainMetricsDataKey, %@, metricKey, %@, metricsData, %@", buf, 0x34u);

  }
}

void __86__RTPlaceTypeClassifierMetricsCalculator_storeMetricsData_source_placeType_metricKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "stringValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@, %@, "), v5, v6);

}

- (void)ensureMetricsDataHasKeysForSource:(unint64_t)a3 placeType:(unint64_t)a4 metricKey:(unint64_t)a5
{
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
  id v19;

  objc_msgSend((id)objc_opt_class(), "keyForSourceType:placeType:", a3, a4);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)objc_opt_new();
    -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v19);

  }
  -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = (void *)objc_opt_new();
    -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v18);

  }
}

- (void)onDailyMetricNotification:(id)a3
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v7 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v19;
      v24 = 2080;
      v25 = "-[RTPlaceTypeClassifierMetricsCalculator onDailyMetricNotification:]";
      v26 = 1024;
      LODWORD(v27) = 481;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v10 & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1D8231EA8]();
    -[RTPlaceTypeClassifierMetricsCalculator _retrieveMetricsFromCacheStore](self, "_retrieveMetricsFromCacheStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 138412802;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      v26 = 2048;
      v27 = v17;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, %@, cacheMetricsDictionary count, %lu", buf, 0x20u);

    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__RTPlaceTypeClassifierMetricsCalculator_onDailyMetricNotification___block_invoke;
    v21[3] = &unk_1E929D518;
    v21[4] = self;
    v21[5] = a2;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v21);

    objc_autoreleasePoolPop(v11);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v20;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);

    }
  }

}

void __68__RTPlaceTypeClassifierMetricsCalculator_onDailyMetricNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    v17 = 2048;
    v18 = a3 + 1;
    v19 = 2112;
    v20 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, %@, idx, %lu, cacheMetricDictionary, %@", buf, 0x2Au);

  }
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = (void *)objc_msgSend(v7, "initWithCString:encoding:", RTAnalyticsEventPlaceTypeClassificationRobustness, 1);
  log_analytics_submission(v8, v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)submitMetrics
{
  RTPlaceTypeClassifierMetricsCalculator *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  RTPlaceTypeClassifierMetricsCalculator *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *context;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v2 = self;
  v56 = *MEMORY[0x1E0C80C00];
  v34 = (void *)MEMORY[0x1D8231EA8](self, a2);
  -[RTPlaceTypeClassifierMetricsCalculator retrieveMetrics](v2, "retrieveMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (void *)objc_msgSend(v4, "initWithCString:encoding:", RTAnalyticsEventPlaceTypeClassification, 1);
  log_analytics_submission(v5, v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  -[RTPlaceTypeClassifierMetricsCalculator _storeLearnedPlaceTypeInferencesToCacheStore](v2, "_storeLearnedPlaceTypeInferencesToCacheStore");
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, &unk_1E9328010);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, &unk_1E9327FE0);

  v10 = (void *)objc_opt_new();
  v39 = v7;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, &unk_1E9328028);

  v52 = 0u;
  v53 = 0u;
  v51 = 0u;
  v50 = 0u;
  v36 = objc_msgSend(&unk_1E932C4C0, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  v11 = 0;
  if (v36)
  {
    v35 = *(_QWORD *)v51;
    v12 = &unk_1E9327FC8;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v51 != v35)
          objc_enumerationMutation(&unk_1E932C4C0);
        v38 = v13;
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v13);
        context = (void *)MEMORY[0x1D8231EA8]();
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v41 = objc_msgSend(&unk_1E932C4D8, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v41)
        {
          v40 = *(_QWORD *)v47;
          do
          {
            v15 = 0;
            v16 = v11;
            do
            {
              if (*(_QWORD *)v47 != v40)
                objc_enumerationMutation(&unk_1E932C4D8);
              v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v15);
              v18 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend((id)objc_opt_class(), "keyForSourceType:placeType:", objc_msgSend(v14, "unsignedIntValue"), objc_msgSend(v17, "unsignedIntValue"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              -[RTPlaceTypeClassifierMetricsCalculator metricsData](v2, "metricsData");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v11);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", v12);
              v21 = v2;
              v22 = v12;
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                objc_msgSend(v39, "objectForKeyedSubscript:", v14);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTPlaceTypeClassifierMetricsCalculator metricsData](v21, "metricsData");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectForKeyedSubscript:", v11);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKeyedSubscript:", v22);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "addObjectsFromArray:", v27);

              }
              objc_autoreleasePoolPop(v18);
              ++v15;
              v16 = v11;
              v12 = v22;
              v2 = v21;
            }
            while (v41 != v15);
            v41 = objc_msgSend(&unk_1E932C4D8, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          }
          while (v41);
        }
        objc_autoreleasePoolPop(context);
        v13 = v38 + 1;
      }
      while (v38 + 1 != v36);
      v36 = objc_msgSend(&unk_1E932C4C0, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v36);
  }
  -[RTPlaceTypeClassifierMetricsCalculator distanceCalculator](v2, "distanceCalculator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifierMetricsCalculator metricManager](v2, "metricManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifierMetricsCalculator metricManager](v2, "metricManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __55__RTPlaceTypeClassifierMetricsCalculator_submitMetrics__block_invoke;
  v42[3] = &unk_1E929D068;
  v43 = v39;
  v44 = v28;
  v45 = v29;
  v31 = v29;
  v32 = v28;
  objc_msgSend(v30, "fetchDiagnosticsEnabled:", v42);

  -[RTPlaceTypeClassifierMetricsCalculator metricsData](v2, "metricsData");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "removeAllObjects");

  objc_autoreleasePoolPop(v34);
}

void __55__RTPlaceTypeClassifierMetricsCalculator_submitMetrics__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E9328010);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E9327FE0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", &unk_1E9328028);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTPlaceTypeClassifierMetricsCalculator submitMetricsForInferredPlaces:contactsPlaces:rottedPlaces:distanceCalculator:metricManager:](RTPlaceTypeClassifierMetricsCalculator, "submitMetricsForInferredPlaces:contactsPlaces:rottedPlaces:distanceCalculator:metricManager:", v5, v3, v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)_storeLearnedPlaceTypeInferencesToCacheStore
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  objc_class *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE buf[12];
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D8231EA8]();
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__66;
  v39 = __Block_byref_object_dispose__66;
  v40 = 0;
  v4 = dispatch_semaphore_create(0);
  -[RTPlaceTypeClassifierMetricsCalculator learnedPlaceTypeInferenceStore](self, "learnedPlaceTypeInferenceStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifierMetricsCalculator learnedPlaceTypeInferences](self, "learnedPlaceTypeInferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __86__RTPlaceTypeClassifierMetricsCalculator__storeLearnedPlaceTypeInferencesToCacheStore__block_invoke;
  v32[3] = &unk_1E9297038;
  v34 = &v35;
  v7 = v4;
  v33 = v7;
  objc_msgSend(v5, "storeLearnedPlaceTypeInferences:handler:", v6, v32);

  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_386);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: [inferredVersion.identifier isEqual:self.existingVersion.identifier] || inferredVersion == nil || self.existingVersion == nil (in %s:%d)", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v48[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v48, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

  }
  else
  {
LABEL_6:
    v23 = 0;
  }

  v24 = v23;
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v36[5];
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v27;
    v42 = 2112;
    v43 = v28;
    v44 = 2112;
    v45 = v29;
    v46 = 2112;
    v47 = v24;
    _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %@, error, %@, semaError, %@", buf, 0x2Au);

  }
  -[RTPlaceTypeClassifierMetricsCalculator learnedPlaceTypeInferences](self, "learnedPlaceTypeInferences");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "removeAllObjects");

  -[RTPlaceTypeClassifierMetricsCalculator setSessionId:](self, "setSessionId:", 0);
  _Block_object_dispose(&v35, 8);

  objc_autoreleasePoolPop(v3);
}

void __86__RTPlaceTypeClassifierMetricsCalculator__storeLearnedPlaceTypeInferencesToCacheStore__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_retrieveMetricsFromCacheStore
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id obj;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  RTPlaceTypeClassifierMetricsCalculator *v63;
  uint64_t v64;
  void *v65;
  void *context;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
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
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v3, "dateByAddingTimeInterval:", -2419200.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v3;
  v6 = (void *)objc_msgSend(v4, "initWithStartDate:endDate:", v5, v3);
  -[RTPlaceTypeClassifierMetricsCalculator _getLearnedPlaceTypeInferencesWithDateInterval:](self, "_getLearnedPlaceTypeInferencesWithDateInterval:", v6);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = (id)objc_opt_new();
  v7 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "modelSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  objc_msgSend((id)objc_opt_class(), "nonModelSources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  v63 = self;
  -[RTPlaceTypeClassifierMetricsCalculator _computeOverAllMetricsForCacheMetrics](self, "_computeOverAllMetricsForCacheMetrics");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v7;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v77 != v46)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1D8231EA8]();
        v60 = v11;
        if (objc_msgSend(v11, "unsignedIntValue"))
        {
          v48 = v12;
          v49 = i;
          v74 = 0u;
          v75 = 0u;
          v72 = 0u;
          v73 = 0u;
          objc_msgSend((id)objc_opt_class(), "placeTypesForCacheMetrics");
          v50 = (id)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
          if (v52)
          {
            v51 = *(_QWORD *)v73;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v73 != v51)
                  objc_enumerationMutation(v50);
                v54 = v13;
                v62 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v13);
                v53 = (void *)MEMORY[0x1D8231EA8]();
                v68 = 0u;
                v69 = 0u;
                v70 = 0u;
                v71 = 0u;
                objc_msgSend((id)objc_opt_class(), "durationsForCacheMetrics");
                v55 = (id)objc_claimAutoreleasedReturnValue();
                v64 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
                if (v64)
                {
                  v61 = *(_QWORD *)v69;
                  do
                  {
                    v14 = 0;
                    do
                    {
                      if (*(_QWORD *)v69 != v61)
                        objc_enumerationMutation(v55);
                      v15 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v14);
                      context = (void *)MEMORY[0x1D8231EA8]();
                      v16 = objc_alloc(MEMORY[0x1E0CB3588]);
                      objc_msgSend(v15, "doubleValue");
                      v67 = v14;
                      objc_msgSend(v59, "dateByAddingTimeInterval:", -v17);
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      v65 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:", v18, v59);

                      -[RTPlaceTypeClassifierMetricsCalculator _filterLearnedPlaceTypeInferencesWithPlaceType:dateInterval:metricsSource:learnedPlaceTypeInferences:](v63, "_filterLearnedPlaceTypeInferencesWithPlaceType:dateInterval:metricsSource:learnedPlaceTypeInferences:", objc_msgSend(v62, "unsignedIntValue"), v65, objc_msgSend(v60, "unsignedIntValue"), v58);
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      v20 = (void *)objc_opt_new();
                      objc_msgSend((id)objc_opt_class(), "cacheMetricsKeyToString:", 9);
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      v90 = v21;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v62, "unsignedIntValue"));
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v91 = v22;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addEntriesFromDictionary:", v23);

                      objc_msgSend((id)objc_opt_class(), "cacheMetricsKeyToString:", 10);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v88 = v24;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v60, "unsignedIntValue"));
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v89 = v25;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addEntriesFromDictionary:", v26);

                      objc_msgSend((id)objc_opt_class(), "cacheMetricsKeyToString:", 11);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v86 = v27;
                      v28 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v15, "doubleValue");
                      objc_msgSend(v28, "numberWithUnsignedLong:", (unint64_t)(v29 / 86400.0));
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      v87 = v30;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addEntriesFromDictionary:", v31);

                      -[RTPlaceTypeClassifierMetricsCalculator _computeCountOfNonNillLearnedPlaceTypeInferences:](v63, "_computeCountOfNonNillLearnedPlaceTypeInferences:", v19);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addEntriesFromDictionary:", v32);

                      -[RTPlaceTypeClassifierMetricsCalculator _computeCountOfUniqueLearnedPlaceTypeInferences:](v63, "_computeCountOfUniqueLearnedPlaceTypeInferences:", v19);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addEntriesFromDictionary:", v33);

                      -[RTPlaceTypeClassifierMetricsCalculator _computeCountOfTotalLearnedPlaceTypeInferences:](v63, "_computeCountOfTotalLearnedPlaceTypeInferences:", v19);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addEntriesFromDictionary:", v34);

                      -[RTPlaceTypeClassifierMetricsCalculator _computeFlipFlopCountLearnedPlaceTypeInferences:](v63, "_computeFlipFlopCountLearnedPlaceTypeInferences:", v19);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addEntriesFromDictionary:", v35);

                      -[RTPlaceTypeClassifierMetricsCalculator _computeLengthOfLatestClassificationForLearnedPlaceTypeInferences:](v63, "_computeLengthOfLatestClassificationForLearnedPlaceTypeInferences:", v19);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addEntriesFromDictionary:", v36);

                      -[RTPlaceTypeClassifierMetricsCalculator _computeLengthOfLatestClassificationSinceChangedForLearnedPlaceTypeInferences:](v63, "_computeLengthOfLatestClassificationSinceChangedForLearnedPlaceTypeInferences:", v19);
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "addEntriesFromDictionary:", v37);

                      objc_msgSend(v20, "addEntriesFromDictionary:", v56);
                      objc_msgSend(v57, "addObject:", v20);

                      objc_autoreleasePoolPop(context);
                      v14 = v67 + 1;
                    }
                    while (v64 != v67 + 1);
                    v64 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
                  }
                  while (v64);
                }

                objc_autoreleasePoolPop(v53);
                v13 = v54 + 1;
              }
              while (v54 + 1 != v52);
              v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
            }
            while (v52);
          }

          v12 = v48;
          i = v49;
        }
        objc_autoreleasePoolPop(v12);
      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
    }
    while (v47);
  }

  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v57, "count");
    *(_DWORD *)buf = 138412802;
    v81 = v40;
    v82 = 2112;
    v83 = v41;
    v84 = 2048;
    v85 = v42;
    _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, %@, metricsFromCacheStore count, %lu", buf, 0x20u);

  }
  return v57;
}

- (id)_computeOverAllMetricsForCacheMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[RTPlaceTypeClassifierMetricsCalculator _getLearnedLocationOfInterests](self, "_getLearnedLocationOfInterests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  -[RTPlaceTypeClassifierMetricsCalculator _computeCountOfLOIsForCacheMetricsFromLOIs:](self, "_computeCountOfLOIsForCacheMetricsFromLOIs:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  -[RTPlaceTypeClassifierMetricsCalculator _computeDurationOfGraphForCacheMetricsFromLOIs:](self, "_computeDurationOfGraphForCacheMetricsFromLOIs:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v6);

  return v4;
}

- (id)_computeCountOfLOIsForCacheMetricsFromLOIs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "cacheMetricsKeyToString:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(v3, "count");

  objc_msgSend(v5, "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_computeDurationOfGraphForCacheMetricsFromLOIs:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (!v3)
  {
    v6 = 0;
    v5 = 0;
    v26 = &unk_1E9328040;
    goto LABEL_21;
  }
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v36 = *(_QWORD *)v38;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v38 != v36)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v7);
      if (v6)
      {
        if (v5)
          goto LABEL_8;
      }
      else
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v7), "visits");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          goto LABEL_8;
      }
      objc_msgSend(v8, "visits");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      objc_msgSend(v6, "entryDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "visits");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "entryDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "compare:", v12);

      if (v13 == 1)
      {
        objc_msgSend(v8, "visits");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v15;
      }
      objc_msgSend(v5, "entryDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "visits");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "entryDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v16, "compare:", v19);

      if (v20 == -1)
      {
        objc_msgSend(v8, "visits");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastObject");
        v22 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v22;
      }
      ++v7;
    }
    while (v4 != v7);
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    v4 = v25;
  }
  while (v25);
  v26 = &unk_1E9328040;
  if (v6 && v5)
  {
    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "entryDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceDate:", v29);
    v31 = v30 / 86400.0;
    *(float *)&v31 = v31;
    *(float *)&v31 = roundf(*(float *)&v31);
    objc_msgSend(v27, "numberWithFloat:", v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_21:
  objc_msgSend((id)objc_opt_class(), "cacheMetricsKeyToString:", 8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v32;
  v42 = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)_getLearnedLocationOfInterests
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  objc_class *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE buf[12];
  __int16 v49;
  id v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  _QWORD v57[4];

  v57[1] = *MEMORY[0x1E0C80C00];
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__66;
  v46 = __Block_byref_object_dispose__66;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__66;
  v40 = __Block_byref_object_dispose__66;
  v41 = 0;
  v4 = dispatch_semaphore_create(0);
  -[RTPlaceTypeClassifierMetricsCalculator learnedLocationStore](self, "learnedLocationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __72__RTPlaceTypeClassifierMetricsCalculator__getLearnedLocationOfInterests__block_invoke;
  v32[3] = &unk_1E9296EE0;
  v34 = &v36;
  v35 = &v42;
  v6 = v4;
  v33 = v6;
  objc_msgSend(v5, "fetchRecentLocationsOfInterestWithHandler:", v32);

  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v8);
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_386);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "submitToCoreAnalytics:type:duration:", v17, 1, v12);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: [inferredVersion.identifier isEqual:self.existingVersion.identifier] || inferredVersion == nil || self.existingVersion == nil (in %s:%d)", buf, 2u);
  }

  v19 = (void *)MEMORY[0x1E0CB35C8];
  v57[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v57, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_retainAutorelease(v21);

  }
  else
  {
LABEL_6:
    v22 = 0;
  }

  v23 = v22;
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend((id)v37[5], "count");
    v29 = v43[5];
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v26;
    v49 = 2112;
    v50 = v27;
    v51 = 2048;
    v52 = v28;
    v53 = 2112;
    v54 = v29;
    v55 = 2112;
    v56 = v23;
    _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, %@, locationsOfInterest count, %lu, error, %@, semaError, %@", buf, 0x34u);

  }
  v30 = (id)v37[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v30;
}

void __72__RTPlaceTypeClassifierMetricsCalculator__getLearnedLocationOfInterests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getLearnedPlaceTypeInferencesWithDateInterval:(id)a3
{
  dispatch_semaphore_t v4;
  RTLearnedPlaceTypeInferenceEnumerationOptions *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  objc_class *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v34;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE buf[12];
  __int16 v52;
  id v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  id v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__66;
  v49 = __Block_byref_object_dispose__66;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__66;
  v43 = __Block_byref_object_dispose__66;
  v44 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = -[RTLearnedPlaceTypeInferenceEnumerationOptions initWithDateInterval:sortByCreationDate:ascending:filteredToPlaceTypes:filteredToIdentifiers:filteredToSessionIds:filteredToLearnedPlaceIdentifiers:]([RTLearnedPlaceTypeInferenceEnumerationOptions alloc], "initWithDateInterval:sortByCreationDate:ascending:filteredToPlaceTypes:filteredToIdentifiers:filteredToSessionIds:filteredToLearnedPlaceIdentifiers:", v34, 1, 1, 0, 0, 0, 0);
  -[RTPlaceTypeClassifierMetricsCalculator learnedPlaceTypeInferenceStore](self, "learnedPlaceTypeInferenceStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __89__RTPlaceTypeClassifierMetricsCalculator__getLearnedPlaceTypeInferencesWithDateInterval___block_invoke;
  v35[3] = &unk_1E9296EE0;
  v37 = &v39;
  v38 = &v45;
  v7 = v4;
  v36 = v7;
  objc_msgSend(v6, "fetchLearnedPlaceTypeInferencesWithOptions:handler:", v5, v35);

  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_386);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: [inferredVersion.identifier isEqual:self.existingVersion.identifier] || inferredVersion == nil || self.existingVersion == nil (in %s:%d)", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v60[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v60, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

  }
  else
  {
LABEL_6:
    v23 = 0;
  }

  v24 = v23;
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend((id)v40[5], "count");
    v30 = v46[5];
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v27;
    v52 = 2112;
    v53 = v28;
    v54 = 2048;
    v55 = v29;
    v56 = 2112;
    v57 = v30;
    v58 = 2112;
    v59 = v24;
    _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %@, learnedPlaceTypeInferences count, %lu, error, %@, semaError, %@", buf, 0x34u);

  }
  v31 = (id)v40[5];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v31;
}

void __89__RTPlaceTypeClassifierMetricsCalculator__getLearnedPlaceTypeInferencesWithDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_filterLearnedPlaceTypeInferencesWithPlaceType:(unint64_t)a3 dateInterval:(id)a4 metricsSource:(unint64_t)a5 learnedPlaceTypeInferences:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  unint64_t v19;
  unint64_t v20;

  v9 = a4;
  v10 = (void *)MEMORY[0x1E0CB3880];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __143__RTPlaceTypeClassifierMetricsCalculator__filterLearnedPlaceTypeInferencesWithPlaceType_dateInterval_metricsSource_learnedPlaceTypeInferences___block_invoke;
  v17[3] = &unk_1E929D540;
  v18 = v9;
  v19 = a3;
  v20 = a5;
  v11 = v9;
  v12 = a6;
  objc_msgSend(v10, "predicateWithBlock:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filteredArrayUsingPredicate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_50);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

BOOL __143__RTPlaceTypeClassifierMetricsCalculator__filterLearnedPlaceTypeInferencesWithPlaceType_dateInterval_metricsSource_learnedPlaceTypeInferences___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  if (objc_msgSend(v3, "placeType") == a1[5])
  {
    v4 = (void *)a1[4];
    objc_msgSend(v3, "creationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsDate:", v5))
      v6 = objc_msgSend(v3, "metricSource") == a1[6];
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __143__RTPlaceTypeClassifierMetricsCalculator__filterLearnedPlaceTypeInferencesWithPlaceType_dateInterval_metricsSource_learnedPlaceTypeInferences___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_computeFlipFlopCountLearnedPlaceTypeInferences:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "cacheMetricsKeyToString:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    v28 = v6;
    v29[0] = &unk_1E9328040;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v21 = v6;
  if (objc_msgSend(v5, "count") != 1)
  {
    v9 = 0;
    v7 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v9 + 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          v18 = 1;
          goto LABEL_22;
        }
      }
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v9 + 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v18 = 1;
          goto LABEL_21;
        }
      }
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_17;
      v13 = (void *)v12;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9 + 1);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
        break;
      v24 = v4;
      v25 = v3;
      v23 = (void *)v14;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "learnedPlaceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9 + 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "learnedPlaceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "isEqual:", v17) ^ 1;

      if (v11)
      {
        v4 = v24;
        v3 = v25;
LABEL_18:

        if (!v10)
          goto LABEL_23;
LABEL_22:

        goto LABEL_23;
      }
      v4 = v24;
      v3 = v25;
LABEL_21:

      if (v10)
        goto LABEL_22;
LABEL_23:

      v7 += v18;
      if (objc_msgSend(v5, "count") - 1 <= (unint64_t)++v9)
        goto LABEL_24;
    }

LABEL_17:
    v18 = 0;
    if (v11)
      goto LABEL_18;
    goto LABEL_21;
  }
  v7 = 0;
LABEL_24:
  v6 = v21;
  v26 = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  return v8;
}

- (id)_computeCountOfNonNillLearnedPlaceTypeInferences:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("learnedPlaceIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "cacheMetricsKeyToString:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_computeCountOfUniqueLearnedPlaceTypeInferences:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D8231EA8](v6);
        objc_msgSend(v10, "learnedPlaceIdentifier", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "learnedPlaceIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      v7 = v6;
    }
    while (v6);
  }

  objc_msgSend((id)objc_opt_class(), "cacheMetricsKeyToString:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_computeCountOfTotalLearnedPlaceTypeInferences:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "cacheMetricsKeyToString:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(v3, "count");

  objc_msgSend(v5, "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_computeLengthOfLatestClassificationForLearnedPlaceTypeInferences:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v8);
    v10 = v9 / 3600.0;
    *(float *)&v10 = v10;
    *(float *)&v10 = roundf(*(float *)&v10);
    objc_msgSend(v5, "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = &unk_1E9328040;
  }
  objc_msgSend((id)objc_opt_class(), "cacheMetricsKeyToString:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_computeLengthOfLatestClassificationSinceChangedForLearnedPlaceTypeInferences:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "reverseObjectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v6)
    {
      v7 = v6;
      obj = v5;
      v27 = 0;
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v10, "learnedPlaceIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v3;
          objc_msgSend(v3, "lastObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "learnedPlaceIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v12, "isEqual:", v15);

          if (v16)
          {
            v17 = v10;

            v27 = v17;
          }
          objc_autoreleasePoolPop(v11);
          v3 = v13;
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);

      v4 = v27;
      if (!v27)
      {
        v22 = &unk_1E9328040;
        goto LABEL_17;
      }
      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "creationDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", v19);
      v21 = v20 / 3600.0;
      *(float *)&v21 = v21;
      *(float *)&v21 = roundf(*(float *)&v21);
      objc_msgSend(v18, "numberWithFloat:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
      v22 = &unk_1E9328040;
    }

  }
  else
  {
    v22 = &unk_1E9328040;
  }
LABEL_17:
  objc_msgSend((id)objc_opt_class(), "cacheMetricsKeyToString:", 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v23;
  v33 = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (void)submitMetricsForInferredPlaces:(id)a3 contactsPlaces:(id)a4 rottedPlaces:(id)a5 distanceCalculator:(id)a6 metricManager:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  objc_msgSend(a1, "collectPlaceVersionsFromInferredPlaces:contactsPlaces:rottedPlaces:", a3, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(a1, "newAlgorithmInstanceWithInference:distanceCalculator:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20), v12, (_QWORD)v23);
        if (v21)
          objc_msgSend(v15, "addInstance:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  if (!objc_msgSend(v15, "instancesCount"))
  {
    +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addInstance:", v22);

  }
  objc_msgSend(v13, "submitMetric:withHandler:", v15, &__block_literal_global_161, (_QWORD)v23);

}

void __134__RTPlaceTypeClassifierMetricsCalculator_submitMetricsForInferredPlaces_contactsPlaces_rottedPlaces_distanceCalculator_metricManager___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Failed to submit AWDCoreRoutineModelAlgorithmSet, error, %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

+ (id)newAlgorithmInstanceWithInference:(id)a3 distanceCalculator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const char *v37;
  int v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  const char *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[RTMetricManager metricForType:](RTMetricManager, "metricForType:", 17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inferredVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "type");
  if ((unint64_t)(v10 - 1) >= 3)
  {

  }
  else
  {
    v11 = v10;

    objc_msgSend(v8, "setType:", v11);
  }
  objc_msgSend(v6, "inferredVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "typeSource");
  v14 = ((v13 & 6) != 0) | (2 * (v13 & 1u));

  if ((_DWORD)v14)
    objc_msgSend(v8, "setSource:", v14);
  objc_msgSend(v6, "existingVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "type");
  if ((unint64_t)(v16 - 1) >= 3)
  {

  }
  else
  {
    v17 = v16;

    objc_msgSend(v8, "setPreviousType:", v17);
  }
  objc_msgSend(v6, "trueVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "type");
  if ((unint64_t)(v19 - 1) <= 2)
    objc_msgSend(v8, "setTruthType:", v19);
  v20 = objc_msgSend(v18, "typeSource");
  if (((v20 & 6) != 0) | (2 * (v20 & 1)))
    objc_msgSend(v8, "setTruthSource:");
  objc_msgSend(v6, "inferredVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v6, "truthfulCounterpart");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v6, "inferredVersion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "mapItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "truthfulCounterpart");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "mapItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "updateAlgorithmInstance:byComparingInferredMapItem:withTruthfulMapItem:withDistanceCalculator:", v8, v24, v26, v7);

    }
  }
  objc_msgSend(v8, "setIsRotted:", objc_msgSend(v6, "isRotted"));
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v29 = objc_msgSend(v8, "type");
    v30 = objc_msgSend(v8, "source");
    v31 = objc_msgSend(v8, "previousType");
    v32 = objc_msgSend(v8, "truthType");
    v33 = objc_msgSend(v8, "truthSource");
    objc_msgSend(v8, "distanceFromTruth");
    v35 = v34;
    v36 = objc_msgSend(v8, "isRotted");
    v38 = 134219522;
    v37 = "false";
    v39 = v29;
    v40 = 2048;
    if (v36)
      v37 = "true";
    v41 = v30;
    v42 = 2048;
    v43 = v31;
    v44 = 2048;
    v45 = v32;
    v46 = 2048;
    v47 = v33;
    v48 = 2048;
    v49 = v35;
    v50 = 2080;
    v51 = v37;
    _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "AWDCoreRoutineModelAlgorithmInstance, type, %lu, source, %lu, previousType, %lu, truthSource, %lu, truthType, %lu, distanceFromTruth, %g, isRotted, %s", (uint8_t *)&v38, 0x48u);
  }

  return v8;
}

+ (void)updateAlgorithmInstance:(id)a3 byComparingInferredMapItem:(id)a4 withTruthfulMapItem:(id)a5 withDistanceCalculator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v13, "distanceFromLocation:toLocation:error:", v14, v15, &v25);
  v17 = v16;

  v18 = v25;
  if (!v18)
    objc_msgSend(v10, "setDistanceFromTruth:", (double)(uint64_t)(10 * llround(v17 / 10.0)));
  objc_msgSend(v11, "address");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "address");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if (v21)
  {
    objc_msgSend(v10, "setAddressComponentMatches:", -1);
  }
  else
  {
    objc_msgSend(v11, "address");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "address");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(a1, "addressComponentMatchesBetweenInferredAddress:trueAddress:", v22, v23);
    if (v24)
      objc_msgSend(v10, "setAddressComponentMatches:", v24);

  }
}

+ (unint64_t)addressComponentMatchesBetweenInferredAddress:(id)a3 trueAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  void *v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "subThoroughfare");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subThoroughfare");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v8, v9);

  v11 = v10;
  objc_msgSend(v6, "thoroughfare");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "thoroughfare");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v12, v13);

  if (v14)
    v11 |= 2uLL;
  objc_msgSend(v6, "subLocality");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subLocality");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v15, v16);

  if (v17)
    v11 |= 4uLL;
  objc_msgSend(v6, "locality");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locality");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v18, v19);

  if (v20)
    v11 |= 8uLL;
  objc_msgSend(v6, "subAdministrativeArea");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subAdministrativeArea");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v21, v22);

  if (v23)
    v11 |= 0x10uLL;
  objc_msgSend(v6, "administrativeArea");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "administrativeArea");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v24, v25);

  if (v26)
    v11 |= 0x20uLL;
  objc_msgSend(v6, "administrativeAreaCode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "administrativeAreaCode");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v27, v28);

  if (v29)
    v11 |= 0x40uLL;
  objc_msgSend(v6, "postalCode");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postalCode");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v30, v31);

  if (v32)
    v11 |= 0x80uLL;
  objc_msgSend(v6, "country");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "country");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v33, v34);

  if (v35)
    v11 |= 0x100uLL;
  objc_msgSend(v6, "countryCode");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "countryCode");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v36, v37);

  if (v38)
    v11 |= 0x200uLL;
  objc_msgSend(v6, "inlandWater");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inlandWater");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v39, v40);

  if (v41)
    v42 = v11 | 0x400;
  else
    v42 = v11;
  objc_msgSend(v6, "ocean");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ocean");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(a1, "inferredAddressComponent:consistentWithTrueComponent:", v43, v44);

  if (v45)
    v46 = v42 | 0x800;
  else
    v46 = v42;
  v47 = objc_msgSend(v6, "isIsland");
  v58 = 0u;
  v59 = 0u;
  if (v47 != objc_msgSend(v7, "isIsland"))
    v48 = v46;
  else
    v48 = v46 | 0x2000;
  v49 = v48 | 0x1000;
  v60 = 0uLL;
  v61 = 0uLL;
  objc_msgSend(v6, "areasOfInterest", (_QWORD)v58);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v59;
    while (2)
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v59 != v53)
          objc_enumerationMutation(v50);
        v55 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v7, "areasOfInterest");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v55) = objc_msgSend(v56, "containsObject:", v55);

        if ((v55 & 1) == 0)
        {
          v49 = v48 & 0xFFFFFFFFFFFFEFFFLL;
          goto LABEL_38;
        }
      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v52)
        continue;
      break;
    }
  }
LABEL_38:

  return v49;
}

+ (BOOL)inferredAddressComponent:(id)a3 consistentWithTrueComponent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a4;
  objc_msgSend(a1, "normalize:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "normalize:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (id)normalize:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)collectPlaceVersionsFromInferredPlaces:(id)a3 contactsPlaces:(id)a4 rottedPlaces:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  id obj;
  void *v69;
  void *v70;
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
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v88 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
        v16 = (void *)objc_opt_new();
        objc_msgSend(v16, "setInferredVersion:", v15);
        objc_msgSend(v15, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v67 = v8;
  v18 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v84 != v20)
          objc_enumerationMutation(v67);
        v22 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          v24 = (void *)objc_opt_new();
          objc_msgSend(v22, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, v25);

        }
        objc_msgSend(v24, "setExistingVersion:", v22);
        if ((objc_msgSend(v22, "typeSource") & 6) != 0)
        {
          v26 = objc_msgSend(v22, "type");
          v27 = v70;
          if (v26 == 1
            || (v28 = objc_msgSend(v22, "type"), v27 = v69, v28 == 2)
            || (v29 = objc_msgSend(v22, "type"), v27 = v62, v29 == 3))
          {
            objc_msgSend(v27, "addObject:", v22);
          }
        }

      }
      v19 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    }
    while (v19);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v30 = v9;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v80;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v80 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * k), "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
          objc_msgSend(v36, "setIsRotted:", 1);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
    }
    while (v32);
  }
  v61 = v30;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v10, "allValues");
  v66 = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v76;
    v63 = *(_QWORD *)v76;
    v64 = v10;
    do
    {
      v41 = 0;
      v65 = v39;
      do
      {
        if (*(_QWORD *)v76 != v40)
          objc_enumerationMutation(v66);
        v42 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v41);
        objc_msgSend(v42, "inferredVersion", v61);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "type");

        v45 = v70;
        if (v44 == 1)
          goto LABEL_39;
        objc_msgSend(v42, "inferredVersion");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "type");

        v45 = v69;
        if (v47 == 2
          || (objc_msgSend(v42, "inferredVersion"),
              v48 = (void *)objc_claimAutoreleasedReturnValue(),
              v49 = objc_msgSend(v48, "type"),
              v48,
              v45 = v62,
              v49 == 3))
        {
LABEL_39:
          v50 = v45;
        }
        else
        {
          v50 = 0;
        }
        if ((unint64_t)objc_msgSend(v50, "count") > 1)
        {
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v52 = v50;
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
          if (v53)
          {
            v54 = v53;
            v55 = *(_QWORD *)v72;
            do
            {
              for (m = 0; m != v54; ++m)
              {
                if (*(_QWORD *)v72 != v55)
                  objc_enumerationMutation(v52);
                v57 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * m);
                v58 = (void *)objc_msgSend(v42, "copy");
                objc_msgSend(v58, "setTruthfulCounterpart:", v57);
                objc_msgSend(v37, "addObject:", v58);

              }
              v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
            }
            while (v54);
          }

          v40 = v63;
          v10 = v64;
          v39 = v65;
        }
        else
        {
          objc_msgSend(v50, "firstObject");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setTruthfulCounterpart:", v51);

          objc_msgSend(v37, "addObject:", v42);
        }

        ++v41;
      }
      while (v41 != v39);
      v59 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
      v39 = v59;
    }
    while (v59);
  }

  return v37;
}

- (id)retrieveMetrics
{
  uint64_t i;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t j;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t n;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t ii;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t jj;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t kk;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t mm;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  dispatch_semaphore_t v81;
  void *v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  dispatch_time_t v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint64_t i3;
  void *v109;
  id v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t i4;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  char v119;
  uint64_t v120;
  uint64_t i5;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t i6;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t i7;
  void *v134;
  void *v135;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t nn;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *i2;
  id i1;
  id v150;
  void *v151;
  void *v152;
  id obj;
  id obja;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  void *context;
  void *contexta;
  void *contextb;
  void *contextc;
  void *contextd;
  void *v170;
  id v171;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  _QWORD v197[4];
  NSObject *v198;
  uint64_t *v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  uint64_t v204;
  uint64_t *v205;
  uint64_t v206;
  uint64_t v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  _BYTE v252[128];
  _BYTE v253[128];
  _BYTE v254[128];
  _BYTE v255[128];
  _BYTE v256[128];
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  _BYTE v261[128];
  _BYTE v262[128];
  _BYTE v263[128];
  _BYTE v264[128];
  _BYTE v265[128];
  _BYTE v266[128];
  _BYTE v267[128];
  _BYTE v268[128];
  _BYTE v269[128];
  uint64_t v270;
  uint8_t buf[16];
  uint64_t v272;

  v272 = *MEMORY[0x1E0C80C00];
  v171 = (id)objc_opt_new();
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328058, &unk_1E9328070, &unk_1E9328088);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v251 = 0u;
  v250 = 0u;
  v249 = 0u;
  v248 = 0u;
  v161 = objc_msgSend(&unk_1E932C508, "countByEnumeratingWithState:objects:count:", &v248, v269, 16);
  if (v161)
  {
    v157 = *(_QWORD *)v249;
    do
    {
      for (i = 0; i != v161; ++i)
      {
        if (*(_QWORD *)v249 != v157)
          objc_enumerationMutation(&unk_1E932C508);
        v3 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * i);
        context = (void *)MEMORY[0x1D8231EA8]();
        v247 = 0u;
        v246 = 0u;
        v245 = 0u;
        v244 = 0u;
        v4 = objc_msgSend(&unk_1E932C4F0, "countByEnumeratingWithState:objects:count:", &v244, v268, 16);
        if (v4)
        {
          v5 = *(_QWORD *)v245;
          do
          {
            for (j = 0; j != v4; ++j)
            {
              if (*(_QWORD *)v245 != v5)
                objc_enumerationMutation(&unk_1E932C4F0);
              v7 = *(void **)(*((_QWORD *)&v244 + 1) + 8 * j);
              v8 = (void *)MEMORY[0x1D8231EA8]();
              -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v7, "unsignedIntValue"), objc_msgSend(v3, "unsignedIntValue"), 0, 0, 1, 0);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "addEntriesFromDictionary:", v9);

              -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v7, "unsignedIntValue"), objc_msgSend(v3, "unsignedIntValue"), objc_msgSend(v7, "unsignedIntValue"), 2, 2, v170);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "addEntriesFromDictionary:", v10);

              -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v7, "unsignedIntValue"), objc_msgSend(v3, "unsignedIntValue"), objc_msgSend(v7, "unsignedIntValue"), 1, 2, v170);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "addEntriesFromDictionary:", v11);

              -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v7, "unsignedIntValue"), objc_msgSend(v3, "unsignedIntValue"), objc_msgSend(v7, "unsignedIntValue"), 14, 2, v170);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "addEntriesFromDictionary:", v12);

              objc_autoreleasePoolPop(v8);
            }
            v4 = objc_msgSend(&unk_1E932C4F0, "countByEnumeratingWithState:objects:count:", &v244, v268, 16);
          }
          while (v4);
        }
        objc_autoreleasePoolPop(context);
      }
      v161 = objc_msgSend(&unk_1E932C508, "countByEnumeratingWithState:objects:count:", &v248, v269, 16);
    }
    while (v161);
  }
  v243 = 0u;
  v242 = 0u;
  v241 = 0u;
  v240 = 0u;
  objc_msgSend((id)objc_opt_class(), "schoolEligibleSources");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v240, v267, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v241;
    do
    {
      for (k = 0; k != v14; ++k)
      {
        if (*(_QWORD *)v241 != v15)
          objc_enumerationMutation(v13);
        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 3, objc_msgSend(*(id *)(*((_QWORD *)&v240 + 1) + 8 * k), "unsignedIntValue"), 0, 0, 1, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v17);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v240, v267, 16);
    }
    while (v14);
  }

  -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 3, 2, 3, 1, 2, v170);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "addEntriesFromDictionary:", v18);

  -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 3, 2, 3, 14, 2, v170);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "addEntriesFromDictionary:", v19);

  -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 3, 1, 3, 14, 2, v170);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "addEntriesFromDictionary:", v20);

  v239 = 0u;
  v238 = 0u;
  v237 = 0u;
  v236 = 0u;
  v21 = objc_msgSend(&unk_1E932C4F0, "countByEnumeratingWithState:objects:count:", &v236, v266, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v237;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(_QWORD *)v237 != v22)
          objc_enumerationMutation(&unk_1E932C4F0);
        v24 = *(void **)(*((_QWORD *)&v236 + 1) + 8 * m);
        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v24, "unsignedIntValue"), 11, objc_msgSend(v24, "unsignedIntValue"), 6, 2, v170);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v25);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v24, "unsignedIntValue"), 11, objc_msgSend(v24, "unsignedIntValue"), 7, 2, v170);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v26);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v24, "unsignedIntValue"), 11, objc_msgSend(v24, "unsignedIntValue"), 8, 2, v170);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v27);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v24, "unsignedIntValue"), 11, objc_msgSend(v24, "unsignedIntValue"), 9, 2, v170);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v28);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v24, "unsignedIntValue"), 11, objc_msgSend(v24, "unsignedIntValue"), 13, 2, v170);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v29);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v24, "unsignedIntValue"), 11, objc_msgSend(v24, "unsignedIntValue"), 12, 2, v170);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v30);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v24, "unsignedIntValue"), 12, objc_msgSend(v24, "unsignedIntValue"), 13, 2, v170);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v31);

      }
      v21 = objc_msgSend(&unk_1E932C4F0, "countByEnumeratingWithState:objects:count:", &v236, v266, 16);
    }
    while (v21);
  }
  v235 = 0u;
  v234 = 0u;
  v233 = 0u;
  v232 = 0u;
  v162 = objc_msgSend(&unk_1E932C4F0, "countByEnumeratingWithState:objects:count:", &v232, v265, 16);
  if (v162)
  {
    v158 = *(_QWORD *)v233;
    do
    {
      for (n = 0; n != v162; ++n)
      {
        if (*(_QWORD *)v233 != v158)
          objc_enumerationMutation(&unk_1E932C4F0);
        v33 = *(void **)(*((_QWORD *)&v232 + 1) + 8 * n);
        contexta = (void *)MEMORY[0x1D8231EA8]();
        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v33, "unsignedIntValue"), 6, objc_msgSend(v33, "unsignedIntValue"), 7, 2, v170);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v34);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v33, "unsignedIntValue"), 6, objc_msgSend(v33, "unsignedIntValue"), 8, 2, v170);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v35);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v33, "unsignedIntValue"), 7, objc_msgSend(v33, "unsignedIntValue"), 9, 2, v170);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v36);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v33, "unsignedIntValue"), 8, objc_msgSend(v33, "unsignedIntValue"), 9, 2, v170);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v37);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v33, "unsignedIntValue"), 8, objc_msgSend(v33, "unsignedIntValue"), 15, 2, v170);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v38);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v33, "unsignedIntValue"), 9, objc_msgSend(v33, "unsignedIntValue"), 16, 2, v170);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v39);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v33, "unsignedIntValue"), 15, objc_msgSend(v33, "unsignedIntValue"), 16, 2, v170);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v40);

        v231 = 0u;
        v229 = 0u;
        v230 = 0u;
        v228 = 0u;
        v41 = objc_msgSend(&unk_1E932C520, "countByEnumeratingWithState:objects:count:", &v228, v264, 16);
        if (v41)
        {
          v42 = *(_QWORD *)v229;
          do
          {
            for (ii = 0; ii != v41; ++ii)
            {
              if (*(_QWORD *)v229 != v42)
                objc_enumerationMutation(&unk_1E932C520);
              v44 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * ii);
              v45 = (void *)MEMORY[0x1D8231EA8]();
              -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v33, "unsignedIntValue"), 10, objc_msgSend(v33, "unsignedIntValue"), objc_msgSend(v44, "unsignedIntValue"), 2, v170);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "addEntriesFromDictionary:", v46);

              -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v33, "unsignedIntValue"), 5, objc_msgSend(v33, "unsignedIntValue"), objc_msgSend(v44, "unsignedIntValue"), 2, v170);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "addEntriesFromDictionary:", v47);

              -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", objc_msgSend(v33, "unsignedIntValue"), 4, objc_msgSend(v33, "unsignedIntValue"), objc_msgSend(v44, "unsignedIntValue"), 2, v170);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "addEntriesFromDictionary:", v48);

              objc_autoreleasePoolPop(v45);
            }
            v41 = objc_msgSend(&unk_1E932C520, "countByEnumeratingWithState:objects:count:", &v228, v264, 16);
          }
          while (v41);
        }
        objc_autoreleasePoolPop(contexta);
      }
      v162 = objc_msgSend(&unk_1E932C4F0, "countByEnumeratingWithState:objects:count:", &v232, v265, 16);
    }
    while (v162);
  }
  v226 = 0u;
  v227 = 0u;
  v224 = 0u;
  v225 = 0u;
  objc_msgSend(&unk_1E932C520, "arrayByAddingObjectsFromArray:", &unk_1E932C538);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v224, v263, 16);
  if (v50)
  {
    v51 = *(_QWORD *)v225;
    do
    {
      for (jj = 0; jj != v50; ++jj)
      {
        if (*(_QWORD *)v225 != v51)
          objc_enumerationMutation(v49);
        v53 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * jj);
        v54 = (void *)MEMORY[0x1D8231EA8]();
        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 1, objc_msgSend(v53, "unsignedIntValue"), 2, objc_msgSend(v53, "unsignedIntValue"), 2, v170);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v55);

        objc_autoreleasePoolPop(v54);
      }
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v224, v263, 16);
    }
    while (v50);
  }

  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  objc_msgSend(&unk_1E932C520, "arrayByAddingObjectsFromArray:", &unk_1E932C550);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v220, v262, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v221;
    do
    {
      for (kk = 0; kk != v57; ++kk)
      {
        if (*(_QWORD *)v221 != v58)
          objc_enumerationMutation(v56);
        v60 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * kk);
        v61 = (void *)MEMORY[0x1D8231EA8]();
        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 1, objc_msgSend(v60, "unsignedIntValue"), 2, 5, 2, v170);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v62);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 2, objc_msgSend(v60, "unsignedIntValue"), 1, 5, 2, v170);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v63);

        objc_autoreleasePoolPop(v61);
      }
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v220, v262, 16);
    }
    while (v57);
  }

  v218 = 0u;
  v219 = 0u;
  v216 = 0u;
  v217 = 0u;
  objc_msgSend(&unk_1E932C520, "arrayByAddingObjectsFromArray:", &unk_1E932C568);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v216, v261, 16);
  if (v65)
  {
    v66 = *(_QWORD *)v217;
    do
    {
      for (mm = 0; mm != v65; ++mm)
      {
        if (*(_QWORD *)v217 != v66)
          objc_enumerationMutation(v64);
        v68 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * mm);
        v69 = (void *)MEMORY[0x1D8231EA8]();
        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 1, objc_msgSend(v68, "unsignedIntValue"), 2, 14, 2, v170);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v70);

        -[RTPlaceTypeClassifierMetricsCalculator computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:](self, "computeMetricsForSourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricType:bins:", 2, objc_msgSend(v68, "unsignedIntValue"), 1, 14, 2, v170);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v71);

        objc_autoreleasePoolPop(v69);
      }
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v216, v261, 16);
    }
    while (v65);
  }

  v214 = 0u;
  v215 = 0u;
  v212 = 0u;
  v213 = 0u;
  v139 = objc_msgSend(&unk_1E932C508, "countByEnumeratingWithState:objects:count:", &v212, v260, 16);
  if (v139)
  {
    v138 = *(_QWORD *)v213;
    v155 = *MEMORY[0x1E0D18598];
    v159 = *MEMORY[0x1E0CB2D50];
    do
    {
      for (nn = 0; nn != v139; ++nn)
      {
        if (*(_QWORD *)v213 != v138)
          objc_enumerationMutation(&unk_1E932C508);
        v145 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * nn);
        v137 = (void *)MEMORY[0x1D8231EA8]();
        v210 = 0u;
        v211 = 0u;
        v208 = 0u;
        v209 = 0u;
        v143 = objc_msgSend(&unk_1E932C580, "countByEnumeratingWithState:objects:count:", &v208, v259, 16);
        if (v143)
        {
          v141 = *(_QWORD *)v209;
          do
          {
            for (i1 = 0; i1 != (id)v143; i1 = (char *)i1 + 1)
            {
              if (*(_QWORD *)v209 != v141)
                objc_enumerationMutation(&unk_1E932C580);
              v151 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * (_QWORD)i1);
              v147 = (void *)MEMORY[0x1D8231EA8]();
              if (objc_msgSend(v151, "unsignedIntValue") != 3
                || (objc_msgSend((id)objc_opt_class(), "schoolEligibleSources"),
                    v72 = (void *)objc_claimAutoreleasedReturnValue(),
                    v73 = objc_msgSend(v72, "containsObject:", v145),
                    v72,
                    v73))
              {
                v204 = 0;
                v205 = &v204;
                v206 = 0x2020000000;
                v207 = -1;
                v200 = 0u;
                v201 = 0u;
                v202 = 0u;
                v203 = 0u;
                -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)objc_opt_class(), "keyForSourceType:placeType:", objc_msgSend(v145, "unsignedIntValue"), objc_msgSend(v151, "unsignedIntValue"));
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "objectForKeyedSubscript:", v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "objectForKeyedSubscript:", &unk_1E9327FC8);
                obj = (id)objc_claimAutoreleasedReturnValue();

                v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v258, 16);
                if (v77)
                {
                  v163 = *(_QWORD *)v201;
                  do
                  {
                    v78 = 0;
                    contextb = (void *)v77;
                    do
                    {
                      if (*(_QWORD *)v201 != v163)
                        objc_enumerationMutation(obj);
                      v79 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * (_QWORD)v78);
                      v80 = (void *)MEMORY[0x1D8231EA8]();
                      v81 = dispatch_semaphore_create(0);
                      -[RTPlaceTypeClassifierMetricsCalculator learnedLocationStore](self, "learnedLocationStore");
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v79, "identifier");
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      v197[0] = MEMORY[0x1E0C809B0];
                      v197[1] = 3221225472;
                      v197[2] = __57__RTPlaceTypeClassifierMetricsCalculator_retrieveMetrics__block_invoke;
                      v197[3] = &unk_1E929D5C8;
                      v199 = &v204;
                      v84 = v81;
                      v198 = v84;
                      objc_msgSend(v82, "fetchLastVisitToPlaceWithIdentifier:handler:", v83, v197);

                      v85 = v84;
                      objc_msgSend(MEMORY[0x1E0C99D68], "now");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      v87 = dispatch_time(0, 3600000000000);
                      if (dispatch_semaphore_wait(v85, v87))
                      {
                        objc_msgSend(MEMORY[0x1E0C99D68], "now");
                        v88 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v88, "timeIntervalSinceDate:", v86);
                        v90 = v89;
                        v91 = (void *)objc_opt_new();
                        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_386);
                        v92 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
                        v93 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v93, "filteredArrayUsingPredicate:", v92);
                        v94 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v94, "firstObject");
                        v95 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v91, "submitToCoreAnalytics:type:duration:", v95, 1, v90);
                        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                        v96 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_fault_impl(&dword_1D1A22000, v96, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: [inferredVersion.identifier isEqual:self.existingVersion.identifier] || inferredVersion == nil || self.existingVersion == nil (in %s:%d)", buf, 2u);
                        }

                        v97 = (void *)MEMORY[0x1E0CB35C8];
                        v270 = v159;
                        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v270, 1);
                        v98 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v97, "errorWithDomain:code:userInfo:", v155, 15, v98);
                        v99 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v99)
                      }

                      objc_autoreleasePoolPop(v80);
                      v78 = (char *)v78 + 1;
                    }
                    while (contextb != v78);
                    v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v258, 16);
                  }
                  while (v77);
                }

                if ((v205[3] & 0x8000000000000000) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTPlaceTypeClassifierMetricsCalculator storeMetricsData:source:placeType:metricKey:](self, "storeMetricsData:source:placeType:metricKey:", v100, objc_msgSend(v145, "unsignedIntValue"), objc_msgSend(v151, "unsignedIntValue"), 4);

                }
                _Block_object_dispose(&v204, 8);
              }
              objc_autoreleasePoolPop(v147);
            }
            v143 = objc_msgSend(&unk_1E932C580, "countByEnumeratingWithState:objects:count:", &v208, v259, 16);
          }
          while (v143);
        }
        objc_autoreleasePoolPop(v137);
      }
      v139 = objc_msgSend(&unk_1E932C508, "countByEnumeratingWithState:objects:count:", &v212, v260, 16);
    }
    while (v139);
  }
  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v144 = objc_msgSend(&unk_1E932C598, "countByEnumeratingWithState:objects:count:", &v193, v257, 16);
  if (v144)
  {
    v142 = *(_QWORD *)v194;
    do
    {
      for (i2 = 0; i2 != (void *)v144; i2 = (char *)i2 + 1)
      {
        if (*(_QWORD *)v194 != v142)
          objc_enumerationMutation(&unk_1E932C598);
        v164 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * (_QWORD)i2);
        v146 = (void *)MEMORY[0x1D8231EA8]();
        -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "keyForSourceType:placeType:", 14, objc_msgSend(v164, "unsignedIntValue"));
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "objectForKeyedSubscript:", v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "objectForKeyedSubscript:", &unk_1E9327FC8);
        v152 = (void *)objc_claimAutoreleasedReturnValue();

        -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "keyForSourceType:placeType:", 3, objc_msgSend(v164, "unsignedIntValue"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "objectForKeyedSubscript:", v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "objectForKeyedSubscript:", &unk_1E9327FC8);
        v160 = (void *)objc_claimAutoreleasedReturnValue();

        v107 = objc_msgSend(v152, "count");
        if (v107 == objc_msgSend(v160, "count"))
        {
          v191 = 0u;
          v192 = 0u;
          v189 = 0u;
          v190 = 0u;
          v150 = v152;
          v156 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v189, v256, 16);
          if (v156)
          {
            obja = *(id *)v190;
            while (2)
            {
              for (i3 = 0; i3 != v156; ++i3)
              {
                if (*(id *)v190 != obja)
                  objc_enumerationMutation(v150);
                v109 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * i3);
                contextc = (void *)MEMORY[0x1D8231EA8]();
                v187 = 0u;
                v188 = 0u;
                v185 = 0u;
                v186 = 0u;
                v110 = v160;
                v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v185, v255, 16);
                if (!v111)
                {

LABEL_122:
                  -[RTPlaceTypeClassifierMetricsCalculator storeMetricsData:source:placeType:metricKey:](self, "storeMetricsData:source:placeType:metricKey:", &unk_1E9328088, 14, objc_msgSend(v164, "unsignedIntValue"), 5);
                  objc_autoreleasePoolPop(contextc);
                  goto LABEL_123;
                }
                v112 = 0;
                v113 = *(_QWORD *)v186;
                do
                {
                  for (i4 = 0; i4 != v111; ++i4)
                  {
                    if (*(_QWORD *)v186 != v113)
                      objc_enumerationMutation(v110);
                    v115 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * i4);
                    v116 = objc_msgSend(v115, "type");
                    if (v116 == objc_msgSend(v109, "type"))
                    {
                      objc_msgSend(v115, "mapItem");
                      v117 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v109, "mapItem");
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      v119 = objc_msgSend(v117, "isEqualToMapItem:", v118);

                    }
                    else
                    {
                      v119 = 0;
                    }
                    v112 |= v119;
                  }
                  v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v185, v255, 16);
                }
                while (v111);

                if ((v112 & 1) == 0)
                  goto LABEL_122;
                -[RTPlaceTypeClassifierMetricsCalculator storeMetricsData:source:placeType:metricKey:](self, "storeMetricsData:source:placeType:metricKey:", &unk_1E9328058, 14, objc_msgSend(v164, "unsignedIntValue"), 5);
                objc_autoreleasePoolPop(contextc);
              }
              v156 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v189, v256, 16);
              if (v156)
                continue;
              break;
            }
          }
LABEL_123:

        }
        else
        {
          -[RTPlaceTypeClassifierMetricsCalculator storeMetricsData:source:placeType:metricKey:](self, "storeMetricsData:source:placeType:metricKey:", &unk_1E9328088, 14, objc_msgSend(v164, "unsignedIntValue"), 5);
        }

        objc_autoreleasePoolPop(v146);
      }
      v144 = objc_msgSend(&unk_1E932C598, "countByEnumeratingWithState:objects:count:", &v193, v257, 16);
    }
    while (v144);
  }
  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  v120 = objc_msgSend(&unk_1E932C508, "countByEnumeratingWithState:objects:count:", &v181, v254, 16);
  if (v120)
  {
    contextd = *(void **)v182;
    do
    {
      for (i5 = 0; i5 != v120; ++i5)
      {
        if (*(void **)v182 != contextd)
          objc_enumerationMutation(&unk_1E932C508);
        v122 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * i5);
        v123 = (void *)MEMORY[0x1D8231EA8]();
        v179 = 0u;
        v180 = 0u;
        v177 = 0u;
        v178 = 0u;
        v124 = objc_msgSend(&unk_1E932C4F0, "countByEnumeratingWithState:objects:count:", &v177, v253, 16);
        if (v124)
        {
          v125 = *(_QWORD *)v178;
          do
          {
            for (i6 = 0; i6 != v124; ++i6)
            {
              if (*(_QWORD *)v178 != v125)
                objc_enumerationMutation(&unk_1E932C4F0);
              v127 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * i6);
              v128 = (void *)MEMORY[0x1D8231EA8]();
              -[RTPlaceTypeClassifierMetricsCalculator retrieveComputedMetricsForSourcePlaceType:source:](self, "retrieveComputedMetricsForSourcePlaceType:source:", objc_msgSend(v127, "unsignedIntValue"), objc_msgSend(v122, "unsignedIntValue"));
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "addEntriesFromDictionary:", v129);

              objc_autoreleasePoolPop(v128);
            }
            v124 = objc_msgSend(&unk_1E932C4F0, "countByEnumeratingWithState:objects:count:", &v177, v253, 16);
          }
          while (v124);
        }
        objc_autoreleasePoolPop(v123);
      }
      v120 = objc_msgSend(&unk_1E932C508, "countByEnumeratingWithState:objects:count:", &v181, v254, 16);
    }
    while (v120);
  }
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  objc_msgSend((id)objc_opt_class(), "schoolEligibleSources");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v173, v252, 16);
  if (v131)
  {
    v132 = *(_QWORD *)v174;
    do
    {
      for (i7 = 0; i7 != v131; ++i7)
      {
        if (*(_QWORD *)v174 != v132)
          objc_enumerationMutation(v130);
        -[RTPlaceTypeClassifierMetricsCalculator retrieveComputedMetricsForSourcePlaceType:source:](self, "retrieveComputedMetricsForSourcePlaceType:source:", 3, objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * i7), "unsignedIntValue"));
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "addEntriesFromDictionary:", v134);

      }
      v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v173, v252, 16);
    }
    while (v131);
  }

  -[RTPlaceTypeClassifierMetricsCalculator retrieveComputedMetricsForSourcePlaceType:source:](self, "retrieveComputedMetricsForSourcePlaceType:source:", 0, 0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "addEntriesFromDictionary:", v135);

  return v171;
}

void __57__RTPlaceTypeClassifierMetricsCalculator_retrieveMetrics__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "exitDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exitDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:toDate:options:", 16, v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "day") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "day");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)modelSources
{
  return &unk_1E932C5B0;
}

+ (id)nonModelSources
{
  return &unk_1E932C5C8;
}

+ (id)notHomeEligibleSources
{
  return &unk_1E932C5E0;
}

+ (id)notWorkEligibleSources
{
  return &unk_1E932C5F8;
}

+ (id)schoolEligibleSources
{
  return &unk_1E932C610;
}

+ (id)modelDictionaryMetricKeys
{
  return &unk_1E932C628;
}

+ (id)modelNonDictionaryMetricKeys
{
  return &unk_1E932C640;
}

+ (id)anySourceMetricKeys
{
  return &unk_1E932C658;
}

+ (id)genericOnlyMetricKeys
{
  return &unk_1E932C670;
}

+ (id)ignoredMetricKeys
{
  return &unk_1E932C688;
}

+ (id)shownToEndUserOnlyMetricKeys
{
  return &unk_1E932C6A0;
}

- (id)computeMetricsForSourcePlaceType:(unint64_t)a3 source:(unint64_t)a4 referenceSourcePlaceType:(unint64_t)a5 referenceSource:(unint64_t)a6 metricType:(unint64_t)a7 bins:(id)a8
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  RTPlaceTypeClassifierMetricsCalculator *v34;
  void *v35;
  id v36;
  void *v37;
  char v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v13 = a8;
  v14 = (void *)objc_opt_new();
  v15 = (void *)MEMORY[0x1D8231EA8]();
  if (a3 == a5 && a4 == a6)
    goto LABEL_21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(&unk_1E932C6B8, "containsObject:", v16);

  if (!v17)
    goto LABEL_21;
  if (a3 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "notHomeEligibleSources");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "containsObject:") & 1) == 0)
    {
      v18 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    objc_msgSend((id)objc_opt_class(), "notWorkEligibleSources");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "containsObject:") & 1) != 0)
    {
LABEL_9:

LABEL_21:
      v24 = v14;
      objc_autoreleasePoolPop(v15);
      goto LABEL_22;
    }
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }
LABEL_12:
  v40 = v16;
  if (a5 == 2)
  {
    v38 = v18;
    objc_msgSend((id)objc_opt_class(), "notWorkEligibleSources");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v20 = (void *)v19;
    v37 = (void *)v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "containsObject:", v21);

    v23 = v43;
    if ((v38 & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  if (a5 == 1)
  {
    v38 = v18;
    objc_msgSend((id)objc_opt_class(), "notHomeEligibleSources");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v22 = 0;
  v23 = v43;
  if (v18)
  {
LABEL_17:

  }
LABEL_18:
  if (a3 == 1)
  {

  }
  if ((v22 & 1) != 0)
    goto LABEL_21;
  -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyForSourceType:placeType:", a4, a3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", &unk_1E9327FC8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyForSourceType:placeType:", a6, a5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKeyedSubscript:", &unk_1E9327FC8);
  v39 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "keyForMetricType:sourcePlaceType:source:referenceSourcePlaceType:referenceSource:metricKey:", a7, a3, a4, a5, a6, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E9328040, v30);
  if (v44)
  {
    if (a7 == 2)
    {
      v34 = self;
      v31 = (void *)v39;
      -[RTPlaceTypeClassifierMetricsCalculator computeDistanceMetricForSourcePlaces:referencePlaces:bins:](v34, "computeDistanceMetricForSourcePlaces:referencePlaces:bins:", v44, v39, v13);
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = (void *)v39;
      if (a7 != 1)
        goto LABEL_32;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v44, "count"));
      v32 = objc_claimAutoreleasedReturnValue();
    }
    v35 = (void *)v32;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v32, v30);

  }
  else
  {
    v33 = v14;
    v31 = (void *)v39;
  }
LABEL_32:

  objc_autoreleasePoolPop(v15);
  if (v44)
    v36 = v14;
LABEL_22:

  return v14;
}

- (id)retrieveComputedMetricsForSourcePlaceType:(unint64_t)a3 source:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  RTPlaceTypeClassifierMetricsCalculator *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unsigned int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v97;
  void *v98;
  int v99;
  unint64_t v100;
  int v101;
  int obj;
  id obja;
  unint64_t v104;
  unint64_t v105;
  int v106;
  uint64_t v107;
  RTPlaceTypeClassifierMetricsCalculator *v108;
  id v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  int v114;
  uint64_t v115;
  int v116;
  void *v117;
  uint64_t v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v109 = (id)objc_opt_new();
  v104 = a3;
  switch(a3)
  {
    case 1uLL:
      objc_msgSend((id)objc_opt_class(), "notHomeEligibleSources");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend((id)objc_opt_class(), "schoolEligibleSources");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v97, "containsObject:", v98);

      if (!v99)
        return v109;
      goto LABEL_7;
    case 2uLL:
      objc_msgSend((id)objc_opt_class(), "notWorkEligibleSources");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_7:
      v11 = a3;
      objc_msgSend((id)objc_opt_class(), "keyForSourceType:placeType:", a4, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v100 = a4 | a3;
      v14 = 1;
      v15 = 0x1E0CB3000uLL;
      v105 = a4;
      v108 = self;
      while (1)
      {
        objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInteger:", a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(&unk_1E932C6D0, "containsObject:", v16))
        {
          objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInteger:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(&unk_1E932C700, "containsObject:", v17))
          {
            objc_msgSend((id)objc_opt_class(), "modelDictionaryMetricKeys");
            v112 = v17;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v15 + 2024), "numberWithInt:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = objc_msgSend(v18, "containsObject:", v19);

            v17 = v112;
          }
          else
          {
            v116 = 0;
          }

        }
        else
        {
          v116 = 0;
        }

        objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInteger:", a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(&unk_1E932C6D0, "containsObject:", v20))
        {
          objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInteger:", v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(&unk_1E932C700, "containsObject:", v21))
          {
            objc_msgSend((id)objc_opt_class(), "modelNonDictionaryMetricKeys");
            v113 = v21;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v15 + 2024), "numberWithInt:", v14);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = objc_msgSend(v22, "containsObject:", v23);

            v21 = v113;
          }
          else
          {
            v101 = 0;
          }

        }
        else
        {
          v101 = 0;
        }

        if (v100)
        {
          v114 = 0;
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "genericOnlyMetricKeys");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v15 + 2024), "numberWithInt:", v14);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = objc_msgSend(v24, "containsObject:", v25);

        }
        v26 = 0;
        if (a4)
        {
          if (a4 == 14)
          {
            objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInteger:", v11);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(&unk_1E932C6E8, "containsObject:", v27))
            {
              objc_msgSend((id)objc_opt_class(), "shownToEndUserOnlyMetricKeys");
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v15 + 2024), "numberWithInt:", v14);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v110, "containsObject:", v28);

            }
            else
            {
              v26 = 0;
            }

          }
          v106 = v26;
          objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInteger:", v11);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(&unk_1E932C6E8, "containsObject:", v29))
          {
            objc_msgSend((id)objc_opt_class(), "anySourceMetricKeys");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v15 + 2024), "numberWithInt:", v14);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            obj = objc_msgSend(v30, "containsObject:", v31);

          }
          else
          {
            obj = 0;
          }

        }
        else
        {
          v106 = 0;
          obj = 0;
        }
        objc_msgSend((id)objc_opt_class(), "ignoredMetricKeys");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v15 + 2024), "numberWithInt:", v14);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "containsObject:", v33);

        if ((v34 & 1) != 0)
          goto LABEL_65;
        v111 = v14;
        if (v116)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E932C718);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 == 1 || v11 == 2)
          {
            v117 = (void *)objc_opt_new();
            +[RTRuntime objToDictionary:filterProperties:](RTRuntime, "objToDictionary:filterProperties:");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "allKeys");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObjectsFromArray:", v55);

          }
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          obja = v35;
          v115 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v119, v123, 16);
          if (v115)
          {
            v107 = *(_QWORD *)v120;
            do
            {
              v56 = 0;
              do
              {
                if (*(_QWORD *)v120 != v107)
                  objc_enumerationMutation(obja);
                v57 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * v56);
                objc_msgSend((id)objc_opt_class(), "keyForMetricType:placeType:source:metricKey:", 3, v11, a4, v14);
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v58, v57);
                v118 = objc_claimAutoreleasedReturnValue();

                -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "objectForKeyedSubscript:", v12);
                v60 = self;
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v15 + 2024), "numberWithInt:", v14);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "objectForKeyedSubscript:", v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "objectForKeyedSubscript:", v57);
                v64 = v14;
                v65 = (void *)objc_claimAutoreleasedReturnValue();

                if (v65)
                {
                  -[RTPlaceTypeClassifierMetricsCalculator metricsData](v60, "metricsData");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "objectForKeyedSubscript:", v12);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v64);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "objectForKeyedSubscript:", v68);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "objectForKeyedSubscript:", v57);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = (void *)v118;
                  objc_msgSend(v109, "setObject:forKeyedSubscript:", v70, v118);

                }
                else
                {
                  v13 = (void *)v118;
                  objc_msgSend(v109, "setObject:forKeyedSubscript:", &unk_1E9328040, v118);
                }
                ++v56;
                v14 = v111;
                v11 = v104;
                a4 = v105;
                self = v108;
                v15 = 0x1E0CB3000;
              }
              while (v115 != v56);
              v115 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v119, v123, 16);
            }
            while (v115);
          }

          goto LABEL_65;
        }
        if ((v101 | v114 | obj | v106) == 1)
        {
          objc_msgSend((id)objc_opt_class(), "keyForMetricType:placeType:source:metricKey:", 3, v11, a4, v14);
          v36 = objc_claimAutoreleasedReturnValue();

          -[RTPlaceTypeClassifierMetricsCalculator metricsData](self, "metricsData");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", v12);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = v15;
          v40 = (void *)v38;
          objc_msgSend(*(id *)(v39 + 2024), "numberWithInt:", v14);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", v41);
          v42 = v14;
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            v44 = v42;
            if ((v42 - 3) <= 1)
            {
              v45 = (void *)objc_opt_new();
              +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328058, &unk_1E93281C0, &unk_1E9328088);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObjectsFromArray:", v46);

              +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E93281D8, &unk_1E93281F0, &unk_1E9328208);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObjectsFromArray:", v47);

              +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328220, &unk_1E9328238, &unk_1E9328250);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObjectsFromArray:", v48);

              -[RTPlaceTypeClassifierMetricsCalculator metricsData](v108, "metricsData");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "objectForKeyedSubscript:", v12);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v42);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "objectForKeyedSubscript:", v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v52, v45);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "setObject:forKeyedSubscript:", v53, v36);

              v11 = v104;
              v14 = v111;

              self = v108;
              v15 = 0x1E0CB3000uLL;
              goto LABEL_62;
            }
            if (v42 == 11 || (v42 & 0x7FFFFFFB) == 2)
            {
              v45 = (void *)objc_opt_new();
              +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328058, &unk_1E9328250, &unk_1E9328088);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObjectsFromArray:", v79);

              +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E93281C0, &unk_1E9328268, &unk_1E9328208);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObjectsFromArray:", v80);

              +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E93281F0, &unk_1E9328070, &unk_1E9328250);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObjectsFromArray:", v81);

              -[RTPlaceTypeClassifierMetricsCalculator metricsData](v108, "metricsData");
              v82 = v12;
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "objectForKeyedSubscript:", v82);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v44);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "objectForKeyedSubscript:", v85);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E9328058, &unk_1E9328220, &unk_1E9328088);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v86, v87);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "setObject:forKeyedSubscript:", v88, v36);

              v14 = v111;
              self = v108;

              v15 = 0x1E0CB3000;
              v12 = v82;
LABEL_62:

            }
            else
            {
              v71 = v42 - 9;
              if (v11 == 1 && v71 <= 1)
              {
                v13 = (void *)v36;
                -[RTPlaceTypeClassifierMetricsCalculator metricsData](v108, "metricsData");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "objectForKeyedSubscript:", v12);
                v73 = v12;
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v44);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "objectForKeyedSubscript:", v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = &unk_1E932CFD0;
                v78 = &unk_1E932CFE0;
                goto LABEL_70;
              }
              if (v11 == 2 && v71 <= 1)
              {
                v13 = (void *)v36;
                -[RTPlaceTypeClassifierMetricsCalculator metricsData](v108, "metricsData");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "objectForKeyedSubscript:", v12);
                v73 = v12;
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v44);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "objectForKeyedSubscript:", v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = &unk_1E9328058;
                v78 = &unk_1E9328088;
LABEL_70:
                +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", v77, v78, &unk_1E932CFF0);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v76, v89);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "setObject:forKeyedSubscript:", v90, v13);

                v14 = v111;
                self = v108;

                v15 = 0x1E0CB3000;
                v12 = v73;

LABEL_64:
                a4 = v105;
                goto LABEL_65;
              }
              -[RTPlaceTypeClassifierMetricsCalculator metricsData](v108, "metricsData");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "objectForKeyedSubscript:", v12);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v42);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "objectForKeyedSubscript:", v93);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "setObject:forKeyedSubscript:", v94, v36);

              v14 = v111;
              self = v108;

              v15 = 0x1E0CB3000uLL;
            }
            v13 = (void *)v36;
            goto LABEL_64;
          }
          objc_msgSend(v109, "setObject:forKeyedSubscript:", &unk_1E9328040, v36);
          a4 = v105;
          self = v108;
          v14 = v42;
          v13 = (void *)v36;
          v15 = 0x1E0CB3000;
        }
LABEL_65:
        if (++v14 == 12)
        {
          v95 = v109;

          return v109;
        }
      }
  }
  v8 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if ((v10 & 1) == 0)
    goto LABEL_7;
  return v109;
}

+ (id)keyForMetricType:(unint64_t)a3 sourcePlaceType:(unint64_t)a4 source:(unint64_t)a5 referenceSourcePlaceType:(unint64_t)a6 referenceSource:(unint64_t)a7 metricKey:(unint64_t)a8
{
  __CFString *v8;
  uint64_t v9;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v8 = &stru_1E92AB3A8;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      v9 = 1;
      goto LABEL_8;
    case 2uLL:
      objc_msgSend(a1, "keyForMetricType:placeType:source:metricKey:", 2, a4, a5, a8);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (a6)
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", a6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@_%@"), v8, v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v8 = (__CFString *)v14;
      }
      if (a7)
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)objc_opt_class(), "metricsSourceToString:", a7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@_%@"), v8, v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v8 = (__CFString *)v17;
      }
      goto LABEL_9;
    case 3uLL:
      v9 = 3;
LABEL_8:
      objc_msgSend(a1, "keyForMetricType:placeType:source:metricKey:", v9, a4, a5, a8, a7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v8 = v8;
      break;
    default:
      break;
  }

  return v8;
}

+ (id)keyForMetricType:(unint64_t)a3 placeType:(unint64_t)a4 source:(unint64_t)a5 metricKey:(unint64_t)a6
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  objc_msgSend((id)objc_opt_class(), "metricsTypeToString:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@"), v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  if (a5)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "metricsSourceToString:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@_%@"), v9, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
  }
  if (a6)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "metricsKeyToString:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@_%@"), v9, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v18;
  }
  return v9;
}

+ (id)keyForSourceType:(unint64_t)a3 placeType:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend((id)objc_opt_class(), "metricsSourceToString:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)metricsTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return off_1E929D760[a3 - 1];
}

- (id)filterLearnedPlacesOfType:(unint64_t)a3 places:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x1E0CB3880];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__RTPlaceTypeClassifierMetricsCalculator_filterLearnedPlacesOfType_places___block_invoke;
  v9[3] = &__block_descriptor_40_e41_B24__0__RTLearnedPlace_8__NSDictionary_16l;
  v9[4] = a3;
  v5 = a4;
  objc_msgSend(v4, "predicateWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __75__RTPlaceTypeClassifierMetricsCalculator_filterLearnedPlacesOfType_places___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 32);
}

- (id)computeDistanceMetricForSourcePlaces:(id)a3 referencePlaces:(id)a4 bins:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  RTDistanceCalculator *distanceCalculator;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id obj;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count") && objc_msgSend(v8, "count"))
  {
    v29 = v9;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v7;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    v30 = v7;
    if (v34)
    {
      v32 = *(_QWORD *)v42;
      v33 = v8;
      v10 = INFINITY;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(obj);
          v35 = v11;
          v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v13 = v8;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v38 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                distanceCalculator = self->_distanceCalculator;
                objc_msgSend(v12, "mapItem", v29);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "location");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "mapItem");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "location");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v21, v23, 0);
                v25 = v24;

                if (v10 > v25)
                  v10 = v25;
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            }
            while (v15);
          }

          v11 = v35 + 1;
          v8 = v33;
        }
        while (v35 + 1 != v34);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v34);
    }
    else
    {
      v10 = INFINITY;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v29;
    +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v27, v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v30;
  }
  else
  {
    v26 = &unk_1E9328040;
  }

  return v26;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLearnedPlaceTypeInferenceStore)learnedPlaceTypeInferenceStore
{
  return self->_learnedPlaceTypeInferenceStore;
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (NSMutableDictionary)metricsData
{
  return self->_metricsData;
}

- (NSMutableArray)learnedPlaceTypeInferences
{
  return self->_learnedPlaceTypeInferences;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_learnedPlaceTypeInferences, 0);
  objc_storeStrong((id *)&self->_metricsData, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_learnedPlaceTypeInferenceStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end
