@implementation RTRelabelerMetrics

- (RTRelabelerMetrics)initWithLoggingEnabled:(BOOL)a3
{
  RTRelabelerMetrics *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v41;
  __int128 v42;
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
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)RTRelabelerMetrics;
  v3 = -[RTMetric initWithLoggingEnabled:](&v61, sel_initWithLoggingEnabled_, a3);
  if (v3)
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend((id)objc_opt_class(), "BOOLeanKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v58;
      v8 = MEMORY[0x1E0C9AAA0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v58 != v7)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v9);
          -[RTMetric metrics](v3, "metrics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v10);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v6);
    }

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend((id)objc_opt_class(), "unsignedIntegerKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v54;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v54 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v16);
          -[RTMetric metrics](v3, "metrics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E9328DA8, v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
      }
      while (v14);
    }

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend((id)objc_opt_class(), "integerKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v50;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v23);
          -[RTMetric metrics](v3, "metrics");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E9328DC0, v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
      }
      while (v21);
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend((id)objc_opt_class(), "doubleKeys");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v46;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v30);
          -[RTMetric metrics](v3, "metrics");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E932D190, v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
      }
      while (v28);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend((id)objc_opt_class(), "bucketedKeys", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v42;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v42 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v37);
          -[RTMetric metrics](v3, "metrics");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", &unk_1E9328DA8, v38);

          ++v37;
        }
        while (v35 != v37);
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
      }
      while (v35);
    }

  }
  return v3;
}

- (RTRelabelerMetrics)initWithRelabeler:(id)a3
{
  id v5;
  RTRelabelerMetrics *v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_relabeler, a3);
    self = -[RTRelabelerMetrics initWithLoggingEnabled:](self, "initWithLoggingEnabled:", 0);
    v6 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: relabeler", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

+ (id)BOOLeanKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("relabelingCandidateIsPlaceholder"), CFSTR("hasSomethingToRelabelTo"), CFSTR("madePlaceholderBecauseOfConfidenceRatioThreshold"), 0);
}

+ (id)unsignedIntegerKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("errorDomain"), CFSTR("numberOfPreFilteredContextCandidates"), CFSTR("relabelingCandidateMapItemType"), CFSTR("numberOfFilteredContextCandidates"), CFSTR("numberOfNonPlaceholderCandidates"), CFSTR("numberOfPlaceholderCandidates"), CFSTR("numberOfUniqueNonPlaceholderMapItems"), CFSTR("relabelerAction"), 0);
}

+ (id)integerKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("errorCode"), 0);
}

+ (id)doubleKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("confidenceOfRelabelingCandidate"), CFSTR("relabeledConfidence"), CFSTR("logObservationNonPlaceholderRatio"), CFSTR("logPriorNonPlaceholderRatio"), CFSTR("logPosteriorNonPlaceholderRatio"), CFSTR("logObservationPlaceholderRatio"), CFSTR("logPriorPlaceholderRatio"), CFSTR("logPosteriorPlaceholderRatio"), CFSTR("logMax2ConfidenceRatio"), CFSTR("predictionEntropy"), 0);
}

+ (id)bucketedKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("bucketedConfidenceOfRelabelingCandidate"), CFSTR("bucketedNumberOfNonPlaceholderCandidates"), CFSTR("bucketedNumberOfPlaceholderCandidates"), CFSTR("bucketedNumberOfUniqueNonPlaceholderMapItems"), CFSTR("bucketedRelabeledConfidence"), CFSTR("bucketedLogPriorNonPlaceholderRatio"), CFSTR("bucketedLogPriorPlaceholderRatio"), 0);
}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventRelabelerQuery;
}

+ (id)supportedMetricKeys
{
  void *v2;
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

  v2 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend((id)objc_opt_class(), "BOOLeanKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "unsignedIntegerKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "integerKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  objc_msgSend((id)objc_opt_class(), "doubleKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  objc_msgSend((id)objc_opt_class(), "bucketedKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v12);

  return v4;
}

- (void)setPreprocessedMetricsUsingInputCandidate:(id)a3 contextCandidates:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint8_t v22[16];

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v22 = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inputCandidate", v22, 2u);
    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RTRelabeler placeholderCandidate:](self->_relabeler, "placeholderCandidate:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("relabelingCandidateIsPlaceholder"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "placeConfidence");
  objc_msgSend(v10, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("confidenceOfRelabelingCandidate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("numberOfPreFilteredContextCandidates"));

  objc_msgSend(v6, "secondObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "extendedAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "wifiFingerprintLabelType");

  switch(v18)
  {
    case 2:
      -[RTMetric metrics](self, "metrics");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = &unk_1E9328E08;
      goto LABEL_10;
    case 1:
      -[RTMetric metrics](self, "metrics");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = &unk_1E9328DF0;
      goto LABEL_10;
    case 0:
      -[RTMetric metrics](self, "metrics");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = &unk_1E9328DD8;
LABEL_10:
      -[NSObject setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v21, CFSTR("relabelingCandidateMapItemType"));
LABEL_11:

      break;
  }

}

- (void)setFilteredInputMetricsUsingContextCandidates:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("numberOfFilteredContextCandidates"));

}

- (void)setNonRevGeoCandidates:(id)a3 revGeoCandidates:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("numberOfNonPlaceholderCandidates"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v7, "count");

  objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("numberOfPlaceholderCandidates"));

}

- (void)setNumberOfUniqueMapItems:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t buf[16];

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v8 = 0;
    objc_msgSend(a3, "allUniqueMapItemsWithError:", &v8);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedInteger:", -[NSObject count](v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](self, "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("numberOfUniqueNonPlaceholderMapItems"));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemDeduperState", buf, 2u);
    }
  }

}

- (double)calculateEntropyOfProbVector:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  long double v14;
  const char *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = -1.0;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: probVector";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_17;
  }
  if (!objc_msgSend(v3, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = -1.0;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: probVector.count > 0";
    goto LABEL_15;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allValues", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "doubleValue");
        v13 = v12;
        objc_msgSend(v11, "doubleValue");
        v9 = v9 - v13 * log(v14);
      }
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }
LABEL_17:

  return v9;
}

- (id)getUUIDForPotentialRelabelingItemUsingInputCandidate:(id)a3 relabeledProbVector:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v26;
  NSObject *obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[16];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v28 = v6;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: inputCandidate";
LABEL_23:
    _os_log_error_impl(&dword_1D1A22000, obj, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_24;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: relabeledProbVector";
    goto LABEL_23;
  }
  if (!objc_msgSend(v7, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: relabeledProbVector.count > 0";
    goto LABEL_23;
  }
  v9 = -[RTRelabeler placeholderCandidate:](self->_relabeler, "placeholderCandidate:", v6);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v8;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (!v10)
  {
LABEL_24:
    v22 = 0;
    goto LABEL_25;
  }
  v11 = v10;
  v26 = v8;
  v12 = *(_QWORD *)v30;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v30 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (v9)
        goto LABEL_28;
      objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "mapItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "secondObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "isEqual:", v18);

      if ((v19 & 1) == 0)
      {
LABEL_28:
        objc_msgSend(v14, "mapItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v14, "mapItem");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_20;
        }
      }
    }
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v11)
      continue;
    break;
  }
  v22 = 0;
LABEL_20:
  v8 = v26;
LABEL_25:

  return v22;
}

- (double)logMax2ConfidenceRatioOfRelabeledProbVector:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  long double v6;
  double v7;
  void *v8;
  long double v9;
  double v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15;
  __int16 v16;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v10 = -1.0;
      goto LABEL_8;
    }
    v16 = 0;
    v12 = "Invalid parameter not satisfying: relabeledProbVector";
    v13 = (uint8_t *)&v16;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_7;
  }
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v15 = 0;
    v12 = "Invalid parameter not satisfying: relabeledProbVector.count > 1";
    v13 = (uint8_t *)&v15;
    goto LABEL_10;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "confidence");
  v7 = log(v6);
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "confidence");
  v10 = v7 - log(v9);

LABEL_8:
  return v10;
}

- (id)maxUUIDOfProbVector:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  double v18;
  const char *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[8];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: probabilityVector";
LABEL_19:
    _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_16;
  }
  if (!objc_msgSend(v3, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: probabilityVector.count > 0";
    goto LABEL_19;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4;
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (!v6)
  {
LABEL_16:
    v8 = 0;
    goto LABEL_17;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v22;
  v10 = -1.79769313e308;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v12, (_QWORD)v21);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = v14;

      if (v15 > v10)
      {
        v16 = v12;

        -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v10 = v18;

        v8 = v16;
      }
    }
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  }
  while (v7);
LABEL_17:

  return v8;
}

- (void)setOutputMetricsUsingInputCandidate:(id)a3 priorVector:(id)a4 observationVector:(id)a5 posteriorVector:(id)a6 relabeledProbVector:(id)a7 relabeledInferredMapItem:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  RTRelabelerMetrics *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  char v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  const char *v41;
  NSObject *v42;
  const char *v43;
  RTRelabelerMetrics *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id *p_isa;
  void *v52;
  void *v53;
  id *v54;
  void *v55;
  void *v56;
  long double v57;
  double v58;
  void *v59;
  long double v60;
  void *v61;
  void *v62;
  void *v63;
  long double v64;
  double v65;
  long double v66;
  void *v67;
  void *v68;
  void *v69;
  long double v70;
  double v71;
  long double v72;
  void *v73;
  void *v74;
  void *v75;
  long double v76;
  double v77;
  long double v78;
  void *v79;
  id *v80;
  void *v81;
  void *v82;
  long double v83;
  double v84;
  long double v85;
  void *v86;
  void *v87;
  void *v88;
  long double v89;
  double v90;
  long double v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  long double v99;
  double v100;
  RTRelabelerMetrics *v101;
  void *v102;
  void *v103;
  char v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  char v123;
  char v124;
  void *v125;
  _BOOL4 v126;
  void *v127;
  RTRelabelerMetrics *v128;
  void *v129;
  void *v130;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: inputCandidate";
LABEL_40:
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, v41, buf, 2u);
    goto LABEL_52;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: priorVector";
    goto LABEL_40;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: observationVector";
    goto LABEL_40;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: posteriorVector";
    goto LABEL_40;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: relabeledProbVector";
    goto LABEL_40;
  }
  if (!objc_msgSend(v18, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: relabeledProbVector.count > 0";
    goto LABEL_40;
  }
  if (v19)
  {
    v128 = self;
    v20 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v15, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v16, "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v17, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithArray:", v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v129 = (void *)v25;
    v130 = (void *)v28;
    if ((-[NSObject isEqualToSet:](v22, "isEqualToSet:", v25) & 1) != 0)
    {
      if ((-[NSObject isEqualToSet:](v22, "isEqualToSet:", v28) & 1) != 0)
      {
        v29 = v128;
        v126 = -[RTRelabeler placeholderCandidate:](v128->_relabeler, "placeholderCandidate:", v14);
        if (v126)
          goto LABEL_12;
        objc_msgSend(v14, "secondObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = -[NSObject containsObject:](v22, "containsObject:", v31);

        v29 = v128;
        if ((v123 & 1) != 0)
        {
LABEL_12:
          -[RTRelabeler placeholderUUID](v29->_relabeler, "placeholderUUID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[NSObject containsObject:](v22, "containsObject:", v32);

          if ((v33 & 1) != 0)
          {
            objc_msgSend(v19, "mapItem");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
              v35 = 1;
            else
              v35 = v126;
            if ((v35 & 1) != 0)
            {
              if (v34)
                v36 = v126;
              else
                v36 = 1;
              if ((v36 & 1) != 0)
              {
                if (v34)
                  v37 = 0;
                else
                  v37 = v126;
                -[RTMetric metrics](v128, "metrics");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = v38;
                if (v37)
                  v40 = &unk_1E9328E38;
                else
                  v40 = &unk_1E9328E50;
                objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, CFSTR("relabelerAction"));
                v44 = v128;
                goto LABEL_60;
              }
              objc_msgSend(v14, "secondObject");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "mapItem");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v124 = objc_msgSend(v47, "isEqualToMapItem:", v48);

              v44 = v128;
              -[RTMetric metrics](v128, "metrics");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v45;
              if ((v124 & 1) != 0)
                v46 = &unk_1E9328E20;
              else
                v46 = &unk_1E9328E08;
            }
            else
            {
              v44 = v128;
              -[RTMetric metrics](v128, "metrics");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v45;
              v46 = &unk_1E9328DF0;
            }
            objc_msgSend(v45, "setObject:forKeyedSubscript:", v46, CFSTR("relabelerAction"));
LABEL_60:

            v49 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v19, "confidence");
            objc_msgSend(v49, "numberWithDouble:");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTMetric metrics](v44, "metrics");
            p_isa = (id *)&v44->super.super.isa;
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setObject:forKeyedSubscript:", v50, CFSTR("relabeledConfidence"));

            if (v126)
            {
              objc_msgSend(p_isa[3], "placeholderUUID");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v14, "secondObject");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "identifier");
              v127 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v54 = p_isa;
            objc_msgSend(p_isa, "getUUIDForPotentialRelabelingItemUsingInputCandidate:relabeledProbVector:", v14, v18);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            if (v125)
            {
              objc_msgSend(p_isa, "metrics");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hasSomethingToRelabelTo"));

              v56 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v16, "objectForKeyedSubscript:", v127);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "doubleValue");
              v58 = log(v57);
              objc_msgSend(v16, "objectForKeyedSubscript:", v125);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "doubleValue");
              objc_msgSend(v56, "numberWithDouble:", (double)(v58 - log(v60)));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "metrics");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, CFSTR("logObservationNonPlaceholderRatio"));

              v63 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v15, "objectForKeyedSubscript:", v127);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "doubleValue");
              v65 = log(v64);
              objc_msgSend(v15, "objectForKeyedSubscript:", v125);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v112, "doubleValue");
              objc_msgSend(v63, "numberWithDouble:", (double)(v65 - log(v66)));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTMetric metrics](v128, "metrics");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "setObject:forKeyedSubscript:", v67, CFSTR("logPriorNonPlaceholderRatio"));

              v69 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v17, "objectForKeyedSubscript:", v127);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "doubleValue");
              v71 = log(v70);
              objc_msgSend(v17, "objectForKeyedSubscript:", v125);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "doubleValue");
              objc_msgSend(v69, "numberWithDouble:", (double)(v71 - log(v72)));
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTMetric metrics](v128, "metrics");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "setObject:forKeyedSubscript:", v73, CFSTR("logPosteriorNonPlaceholderRatio"));

              v54 = (id *)&v128->super.super.isa;
            }
            v75 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v16, "objectForKeyedSubscript:", v127);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "doubleValue");
            v77 = log(v76);
            objc_msgSend(v54[3], "placeholderUUID");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v114);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "doubleValue");
            objc_msgSend(v75, "numberWithDouble:", (double)(v77 - log(v78)));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "metrics");
            v80 = v54;
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "setObject:forKeyedSubscript:", v79, CFSTR("logObservationPlaceholderRatio"));

            v82 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v15, "objectForKeyedSubscript:", v127);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "doubleValue");
            v84 = log(v83);
            objc_msgSend(v80[3], "placeholderUUID");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v115);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "doubleValue");
            objc_msgSend(v82, "numberWithDouble:", (double)(v84 - log(v85)));
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "metrics");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "setObject:forKeyedSubscript:", v86, CFSTR("logPriorPlaceholderRatio"));

            v88 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v17, "objectForKeyedSubscript:", v127);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "doubleValue");
            v90 = log(v89);
            objc_msgSend(v80[3], "placeholderUUID");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v116);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "doubleValue");
            objc_msgSend(v88, "numberWithDouble:", (double)(v90 - log(v91)));
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "metrics");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "setObject:forKeyedSubscript:", v92, CFSTR("logPosteriorPlaceholderRatio"));

            if ((unint64_t)objc_msgSend(v18, "count") >= 2)
            {
              -[RTRelabelerMetrics logMax2ConfidenceRatioOfRelabeledProbVector:](v128, "logMax2ConfidenceRatioOfRelabeledProbVector:", v18);
              v95 = v94;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTMetric metrics](v128, "metrics");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "setObject:forKeyedSubscript:", v96, CFSTR("logMax2ConfidenceRatio"));

              -[RTRelabeler parameters](v128->_relabeler, "parameters");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "minimumConfidenceRatio");
              v100 = log(v99);

              v101 = v128;
              if (v95 <= v100)
              {
                -[RTRelabelerMetrics maxUUIDOfProbVector:](v128, "maxUUIDOfProbVector:", v17);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTRelabeler placeholderUUID](v128->_relabeler, "placeholderUUID");
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                v104 = objc_msgSend(v102, "isEqual:", v103);

                v101 = v128;
                if ((v104 & 1) == 0)
                {
                  -[RTMetric metrics](v128, "metrics");
                  v105 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("madePlaceholderBecauseOfConfidenceRatioThreshold"));

                }
              }
              v106 = (void *)MEMORY[0x1E0CB37E8];
              -[RTRelabelerMetrics calculateEntropyOfProbVector:](v101, "calculateEntropyOfProbVector:", v17);
              objc_msgSend(v106, "numberWithDouble:");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTMetric metrics](v101, "metrics");
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "setObject:forKeyedSubscript:", v107, CFSTR("predictionEntropy"));

            }
            goto LABEL_51;
          }
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v43 = "Invalid parameter not satisfying: [priorUUIDs containsObject:_relabeler.placeholderUUID]";
            goto LABEL_49;
          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v43 = "Invalid parameter not satisfying: [priorUUIDs containsObject:inputCandidate.secondObject.identifier]";
            goto LABEL_49;
          }
        }
LABEL_50:

LABEL_51:
        goto LABEL_52;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
      *(_WORD *)buf = 0;
      v43 = "Invalid parameter not satisfying: [priorUUIDs isEqualToSet:posteriorUUIDs]";
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
      *(_WORD *)buf = 0;
      v43 = "Invalid parameter not satisfying: [priorUUIDs isEqualToSet:observationUUIDs]";
    }
LABEL_49:
    _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
    goto LABEL_50;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v41 = "Invalid parameter not satisfying: relabeledInferredMapItem";
    goto LABEL_40;
  }
LABEL_52:

}

- (void)setErrorMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v15 = v4;
    -[RTMetric metrics](self, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E9328DD8, CFSTR("relabelerAction"));

    objc_msgSend(v15, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D18598]);

    if (v7)
    {
      -[RTMetric metrics](self, "metrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = &unk_1E9328DF0;
    }
    else
    {
      objc_msgSend(v15, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("RTRelabelerErrorDomain"));

      -[RTMetric metrics](self, "metrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v12)
        v10 = &unk_1E9328E08;
      else
        v10 = &unk_1E9328DD8;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "code"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMetric metrics](self, "metrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("errorCode"));

    v4 = v15;
  }

}

- (void)setDerivedMetrics
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
  void *v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E932D1A0, &unk_1E932D1B0, &unk_1E932D1C0);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("confidenceOfRelabelingCandidate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v4, v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("bucketedConfidenceOfRelabelingCandidate"));

  -[RTMetric metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("numberOfNonPlaceholderCandidates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v8, &unk_1E932C9B8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("bucketedNumberOfNonPlaceholderCandidates"));

  -[RTMetric metrics](self, "metrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("numberOfPlaceholderCandidates"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v12, &unk_1E932C9B8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("bucketedNumberOfPlaceholderCandidates"));

  -[RTMetric metrics](self, "metrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("numberOfUniqueNonPlaceholderMapItems"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v16, &unk_1E932C9B8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("bucketedNumberOfUniqueNonPlaceholderMapItems"));

  -[RTMetric metrics](self, "metrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("relabeledConfidence"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v20, v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("bucketedRelabeledConfidence"));

  -[RTMetric metrics](self, "metrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("logPriorNonPlaceholderRatio"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v24, &unk_1E932C9D0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("bucketedLogPriorNonPlaceholderRatio"));

  -[RTMetric metrics](self, "metrics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("logPriorPlaceholderRatio"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v28, &unk_1E932C9D0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, CFSTR("bucketedLogPriorPlaceholderRatio"));

}

- (BOOL)submitMetricsWithError:(id *)a3
{
  objc_super v6;

  -[RTRelabelerMetrics setDerivedMetrics](self, "setDerivedMetrics");
  v6.receiver = self;
  v6.super_class = (Class)RTRelabelerMetrics;
  return -[RTMetric submitMetricsWithError:](&v6, sel_submitMetricsWithError_, a3);
}

- (RTRelabeler)relabeler
{
  return self->_relabeler;
}

- (void)setRelabeler:(id)a3
{
  objc_storeStrong((id *)&self->_relabeler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relabeler, 0);
}

@end
