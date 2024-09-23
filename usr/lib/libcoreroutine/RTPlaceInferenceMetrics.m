@implementation RTPlaceInferenceMetrics

- (void)setPlaceInferences:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "count") != 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("hasFinalResults"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("resultCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("resultFidelityPolicyNoneCount"));

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceMetrics setTopPlaceInference:](self, "setTopPlaceInference:", v10);

  }
}

- (void)submitMetrics
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v3);
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 10 * (unint64_t)(v5 * 100.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("latency"));

  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = (void *)objc_msgSend(v8, "initWithCString:encoding:", RTAnalyticsEventPlaceInferenceQuery, 1);
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  log_analytics_submission(v9, v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)setTopPersonalizedLabelsInferredMapItems:(id)a3 topBluePOIInferredMapItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  RTPlaceInferenceMetrics *v43;
  RTPlaceInferenceMetrics *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v19 = 0;
  }
  else
  {
    v43 = self;
    v45 = v6;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v52 != v13)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (v11)
          {
            objc_msgSend(v11, "mapItem");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "mapItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqual:", v17);

            if (!v18)
              v12 = 1;
          }
          else
          {
            v11 = v15;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }

    v19 = v12 & 1;
    self = v43;
    v6 = v45;
  }
  v20 = objc_msgSend(v6, "count", v43, v45);
  v21 = 0;
  if (v7 && v20)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v22 = v6;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v23)
    {
      v24 = v23;
      v44 = self;
      v46 = v6;
      v25 = *(_QWORD *)v48;
      v26 = 1;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v48 != v25)
            objc_enumerationMutation(v22);
          v28 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          objc_msgSend(v7, "mapItem", v44, v46, (_QWORD)v47);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "mapItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "isEqual:", v30);

          if (v31)
            v26 = 0;
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v24);
      v21 = v26 & 1;
      self = v44;
      v6 = v46;
    }
    else
    {
      v21 = 1;
    }

  }
  v32 = (void *)MEMORY[0x1E0CB37E8];
  -[RTPlaceInferenceMetrics entropyOfConflictFromTopResults:](self, "entropyOfConflictFromTopResults:", v6);
  objc_msgSend(v32, "numberWithDouble:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, CFSTR("entropyOfConflict"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "count") != 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, CFSTR("hasLocalHints"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7 != 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("hasBluePOIResults"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, CFSTR("hasFusionConflictBluePOI"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("hasFusionConflictLocalHints"));

}

- (RTPlaceInferenceMetrics)initWithClientIdentifier:(id)a3 placeInferenceOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RTPlaceInferenceMetrics *v9;
  uint64_t v10;
  NSDate *startDate;
  uint64_t v12;
  NSMutableDictionary *metrics;
  RTPlaceInferenceMetrics *v14;
  NSObject *v15;
  const char *v16;
  objc_super v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: clientIdentifier";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: options";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTPlaceInferenceMetrics;
  v9 = -[RTPlaceInferenceMetrics init](&v18, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    startDate = v9->_startDate;
    v9->_startDate = (NSDate *)v10;

    v12 = objc_opt_new();
    metrics = v9->_metrics;
    v9->_metrics = (NSMutableDictionary *)v12;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_metrics, "setObject:forKeyedSubscript:", v6, CFSTR("clientID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_metrics, "setObject:forKeyedSubscript:", &unk_1E9328970, CFSTR("count"));
    -[RTPlaceInferenceMetrics setPlaceInferenceOptions:](v9, "setPlaceInferenceOptions:", v8);
  }
  self = v9;
  v14 = self;
LABEL_10:

  return v14;
}

- (void)setPlaceInferenceOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "fidelityPolicy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("fidelityPolicy"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "locations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("inputLocationCount"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "accessPoints");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("inputWiFiCount"));

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (void)setTopPlaceInference:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v26 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "placeType");
  else
    v6 = 0;
  objc_msgSend(v5, "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("placeType"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  if (v26)
    v10 = objc_msgSend(v26, "userType");
  else
    v10 = 0;
  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("userSpecificPlaceType"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  if (v26)
    objc_msgSend(v26, "confidence");
  else
    v14 = 0.0;
  objc_msgSend(v13, "numberWithDouble:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("topConfidence"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  if (v26)
  {
    objc_msgSend(v26, "confidence");
    v19 = (int)(v18 * 100.0);
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v17, "numberWithInt:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("confidenceScore"));

  v22 = (void *)MEMORY[0x1E0CB37E8];
  if (v26)
    v23 = objc_msgSend(v26, "userTypeSource");
  else
    v23 = 0;
  objc_msgSend(v22, "numberWithUnsignedInteger:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("userTypeSource"));

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (double)entropyOfConflictFromTopResults:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[4];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0;
    v5 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke;
    v18[3] = &unk_1E92A13B0;
    v6 = v4;
    v19 = v6;
    v20 = v21;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v18);
    v14 = 0;
    v15 = (double *)&v14;
    v16 = 0x2020000000;
    v17 = 0;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke_3;
    v10[3] = &unk_1E92A13D8;
    v7 = v6;
    v11 = v7;
    v12 = v21;
    v13 = &v14;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
    v8 = v15[3];

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(v21, 8);

  }
  else
  {
    v8 = -1.0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (RTPlaceInferenceMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithClientIdentifier_placeInferenceOptions_);
}

void __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *, uint64_t, _BYTE *);
  void *v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke_2;
  v13 = &unk_1E92A1388;
  v14 = v3;
  v4 = v3;
  v5 = objc_msgSend(v8, "indexOfObjectPassingTest:", &v10);
  v6 = *(void **)(a1 + 32);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "mapItem");
  else
    objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7, v8, v10, v11, v12, v13);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToMapItem:", v6);

  if ((_DWORD)v8)
    *a4 = 1;
  return v8;
}

long double __59__RTPlaceInferenceMetrics_entropyOfConflictFromTopResults___block_invoke_3(uint64_t a1, uint64_t a2)
{
  long double v3;
  long double v4;
  uint64_t v5;
  long double result;

  v3 = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2)
     / (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = log2(v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = *(double *)(v5 + 24) - v3 * v4;
  *(long double *)(v5 + 24) = result;
  return result;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("RTPlaceInferenceMetrics, %lu, "), objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPlaceInferenceMetrics metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__RTPlaceInferenceMetrics_description__block_invoke;
  v12[3] = &unk_1E92973B8;
  v12[4] = self;
  v8 = v5;
  v13 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __38__RTPlaceInferenceMetrics_description__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@, "), v4, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendString:", v7);
}

@end
