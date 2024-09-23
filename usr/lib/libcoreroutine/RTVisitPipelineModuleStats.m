@implementation RTVisitPipelineModuleStats

- (void)startIterationWithVisitClusters:(id)a3
{
  id v4;
  NSObject *v5;
  NSDate *v6;
  NSDate *startDate;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_startDate)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[RTVisitPipelineModuleStats startIterationWithVisitClusters:]";
      v10 = 1024;
      v11 = 163;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "iteration already started (in %s:%d)", (uint8_t *)&v8, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDate = self->_startDate;
  self->_startDate = v6;

  -[RTVisitPipelineModuleStats setLocationCountForVisitCluster:direction:](self, "setLocationCountForVisitCluster:direction:", v4, CFSTR("in"));
  -[RTVisitPipelineModuleStats setLocationIntervalForVisitCluster:direction:](self, "setLocationIntervalForVisitCluster:direction:", v4, CFSTR("in"));
  -[RTVisitPipelineModuleStats setMaxLocationOutageIntervalForVisitCluster:direction:](self, "setMaxLocationOutageIntervalForVisitCluster:direction:", v4, CFSTR("in"));
  -[RTVisitPipelineModuleStats setVisitCountForVisitCluster:direction:](self, "setVisitCountForVisitCluster:direction:", v4, CFSTR("in"));

}

- (void)stopIterationWithVisitClusters:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  NSDate *startDate;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_startDate)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "-[RTVisitPipelineModuleStats stopIterationWithVisitClusters:]";
      v19 = 1024;
      v20 = 180;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "iteration not started (in %s:%d)", (uint8_t *)&v17, 0x12u);
    }

  }
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", self->_startDate);
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iterationDurations, "setObject:forKeyedSubscript:", v8, CFSTR("last"));
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationDurations, "objectForKeyedSubscript:", CFSTR("max"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 > v9)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iterationDurations, "setObject:forKeyedSubscript:", v8, CFSTR("max"));
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationDurations, "objectForKeyedSubscript:", CFSTR("cumulative"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v10, "numberWithDouble:", v13 + v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iterationDurations, "setObject:forKeyedSubscript:", v15, CFSTR("cumulative"));

  startDate = self->_startDate;
  self->_startDate = 0;

  -[RTVisitPipelineModuleStats setLocationCountForVisitCluster:direction:](self, "setLocationCountForVisitCluster:direction:", v4, CFSTR("out"));
  -[RTVisitPipelineModuleStats setLocationIntervalForVisitCluster:direction:](self, "setLocationIntervalForVisitCluster:direction:", v4, CFSTR("out"));
  -[RTVisitPipelineModuleStats setMaxLocationOutageIntervalForVisitCluster:direction:](self, "setMaxLocationOutageIntervalForVisitCluster:direction:", v4, CFSTR("out"));
  -[RTVisitPipelineModuleStats setVisitCountForVisitCluster:direction:](self, "setVisitCountForVisitCluster:direction:", v4, CFSTR("out"));

}

- (void)setMaxLocationOutageIntervalForVisitCluster:(id)a3 direction:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  RTVisitPipelineModuleStats *v41;
  uint64_t v42;
  id v43;
  id obj;
  uint64_t v45;
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

  v41 = self;
  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v43 = a4;
  obj = v5;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v6)
  {
    v7 = v6;
    v45 = *(_QWORD *)v51;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v51 != v45)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        objc_msgSend(v10, "points", v41);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "locations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v13)
        {
          v14 = v13;
          v15 = 0;
          v16 = *(_QWORD *)v47;
          do
          {
            v17 = 0;
            v18 = v15;
            do
            {
              if (*(_QWORD *)v47 != v16)
                objc_enumerationMutation(v12);
              v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v17);
              if (v18)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v17), "date");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "date");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "timeIntervalSinceDate:", v21);
                v23 = v22;

                if (v23 > v8)
                  v8 = v23;
              }
              v15 = v19;

              ++v17;
              v18 = v15;
            }
            while (v14 != v17);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          }
          while (v14);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8, v41);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v42 + 32), "objectForKeyedSubscript:", v43);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("last"));

  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(v42 + 32), "objectForKeyedSubscript:", v43);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("cumulative"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  v30 = v29;
  objc_msgSend(v24, "doubleValue");
  objc_msgSend(v26, "numberWithDouble:", v30 + v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v42 + 32), "objectForKeyedSubscript:", v43);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("cumulative"));

  objc_msgSend(v24, "doubleValue");
  v35 = v34;
  objc_msgSend(*(id *)(v42 + 32), "objectForKeyedSubscript:", v43);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("max"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "doubleValue");
  v39 = v38;

  if (v35 > v39)
  {
    objc_msgSend(*(id *)(v42 + 32), "objectForKeyedSubscript:", v43);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v24, CFSTR("max"));

  }
}

- (void)setLocationIntervalForVisitCluster:(id)a3 direction:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  RTVisitPipelineModuleStats *v36;
  uint64_t v37;
  id v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v36 = self;
  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v38 = a4;
  obj = v5;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v6)
  {
    v7 = v6;
    v40 = *(_QWORD *)v42;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v40)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v10, "points", v36);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "locations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "points");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "locations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v18);
        v8 = v8 + v19;

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8, v36);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v37 + 24), "objectForKeyedSubscript:", v38);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("last"));

  objc_msgSend(v20, "doubleValue");
  v23 = v22;
  objc_msgSend(*(id *)(v37 + 32), "objectForKeyedSubscript:", v38);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("max"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v27 = v26;

  if (v23 > v27)
  {
    objc_msgSend(*(id *)(v37 + 32), "objectForKeyedSubscript:", v38);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, CFSTR("max"));

  }
  objc_msgSend(v20, "doubleValue");
  v30 = v29;
  objc_msgSend(*(id *)(v37 + 24), "objectForKeyedSubscript:", v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("max"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "doubleValue");
  v34 = v33;

  if (v30 > v34)
  {
    objc_msgSend(*(id *)(v37 + 24), "objectForKeyedSubscript:", v38);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v20, CFSTR("max"));

  }
}

- (void)setLocationCountForVisitCluster:(id)a3 direction:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  id v18;

  v18 = a4;
  objc_msgSend(a3, "valueForKeyPath:", CFSTR("@sum.points.locations.@count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationLocationCounts, "objectForKeyedSubscript:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("last"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationLocationCounts, "objectForKeyedSubscript:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cumulative"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue") + objc_msgSend(v10, "unsignedIntegerValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationLocationCounts, "objectForKeyedSubscript:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("cumulative"));

  v13 = objc_msgSend(v6, "unsignedIntegerValue");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationLocationCounts, "objectForKeyedSubscript:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("max"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  if (v13 > v16)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationLocationCounts, "objectForKeyedSubscript:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v6, CFSTR("max"));

  }
}

- (void)setVisitCountForVisitCluster:(id)a3 direction:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  id v18;

  v18 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationVistCount, "objectForKeyedSubscript:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("last"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationVistCount, "objectForKeyedSubscript:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("cumulative"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue") + objc_msgSend(v10, "unsignedIntegerValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationVistCount, "objectForKeyedSubscript:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("cumulative"));

  v13 = objc_msgSend(v6, "unsignedIntegerValue");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationVistCount, "objectForKeyedSubscript:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("max"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  if (v13 > v16)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationVistCount, "objectForKeyedSubscript:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v6, CFSTR("max"));

  }
}

- (unint64_t)lastLocationCount
{
  return -[RTVisitPipelineModuleStats lastLocationCountForDirection:](self, "lastLocationCountForDirection:", CFSTR("out"));
}

- (unint64_t)lastLocationCountForDirection:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  unint64_t v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationLocationCounts, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("last"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = (unint64_t)v5;

  return v6;
}

- (RTVisitPipelineModuleStats)init
{
  RTVisitPipelineModuleStats *v2;
  uint64_t v3;
  NSMutableDictionary *iterationDurations;
  uint64_t v5;
  NSMutableDictionary *iterationLocationIntervals;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *iterationLocationCounts;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *iterationMaxLocationOutageIntervals;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *iterationVistCount;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)RTVisitPipelineModuleStats;
  v2 = -[RTVisitPipelineModuleStats init](&v22, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    iterationDurations = v2->_iterationDurations;
    v2->_iterationDurations = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    iterationLocationIntervals = v2->_iterationLocationIntervals;
    v2->_iterationLocationIntervals = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_iterationLocationIntervals, "setObject:forKeyedSubscript:", v7, CFSTR("in"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_iterationLocationIntervals, "setObject:forKeyedSubscript:", v8, CFSTR("out"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    iterationLocationCounts = v2->_iterationLocationCounts;
    v2->_iterationLocationCounts = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_iterationLocationCounts, "setObject:forKeyedSubscript:", v11, CFSTR("in"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_iterationLocationCounts, "setObject:forKeyedSubscript:", v12, CFSTR("out"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    iterationMaxLocationOutageIntervals = v2->_iterationMaxLocationOutageIntervals;
    v2->_iterationMaxLocationOutageIntervals = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_iterationMaxLocationOutageIntervals, "setObject:forKeyedSubscript:", v15, CFSTR("in"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_iterationMaxLocationOutageIntervals, "setObject:forKeyedSubscript:", v16, CFSTR("out"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    iterationVistCount = v2->_iterationVistCount;
    v2->_iterationVistCount = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_iterationVistCount, "setObject:forKeyedSubscript:", v19, CFSTR("in"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_iterationVistCount, "setObject:forKeyedSubscript:", v20, CFSTR("out"));

  }
  return v2;
}

- (id)description
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;

  v45 = (void *)MEMORY[0x1E0CB3940];
  v44 = -[RTVisitPipelineModuleStats lastLocationCountForDirection:](self, "lastLocationCountForDirection:", CFSTR("in"));
  v43 = -[RTVisitPipelineModuleStats lastLocationCountForDirection:](self, "lastLocationCountForDirection:", CFSTR("out"));
  v42 = -[RTVisitPipelineModuleStats cumulativeLocationCountForDirection:](self, "cumulativeLocationCountForDirection:", CFSTR("in"));
  v3 = -[RTVisitPipelineModuleStats cumulativeLocationCountForDirection:](self, "cumulativeLocationCountForDirection:", CFSTR("out"));
  v4 = -[RTVisitPipelineModuleStats maxLocationCountForDirection:](self, "maxLocationCountForDirection:", CFSTR("in"));
  v5 = -[RTVisitPipelineModuleStats maxLocationCountForDirection:](self, "maxLocationCountForDirection:", CFSTR("out"));
  -[RTVisitPipelineModuleStats lastLocationIntervalForDirection:](self, "lastLocationIntervalForDirection:", CFSTR("in"));
  v41 = v6;
  -[RTVisitPipelineModuleStats lastLocationIntervalForDirection:](self, "lastLocationIntervalForDirection:", CFSTR("out"));
  v40 = v7;
  -[RTVisitPipelineModuleStats cumulativeLocationIntervalForDirection:](self, "cumulativeLocationIntervalForDirection:", CFSTR("in"));
  v39 = v8;
  -[RTVisitPipelineModuleStats cumulativeLocationIntervalForDirection:](self, "cumulativeLocationIntervalForDirection:", CFSTR("out"));
  v38 = v9;
  -[RTVisitPipelineModuleStats maxLocationIntervalForDirection:](self, "maxLocationIntervalForDirection:", CFSTR("in"));
  v37 = v10;
  -[RTVisitPipelineModuleStats maxLocationIntervalForDirection:](self, "maxLocationIntervalForDirection:", CFSTR("out"));
  v36 = v11;
  -[RTVisitPipelineModuleStats lastMaxLocationOutageIntervalForDirection:](self, "lastMaxLocationOutageIntervalForDirection:", CFSTR("in"));
  v13 = v12;
  -[RTVisitPipelineModuleStats lastMaxLocationOutageIntervalForDirection:](self, "lastMaxLocationOutageIntervalForDirection:", CFSTR("out"));
  v15 = v14;
  -[RTVisitPipelineModuleStats cumulativeMaxLocationOutageIntervalForDirection:](self, "cumulativeMaxLocationOutageIntervalForDirection:", CFSTR("in"));
  v17 = v16;
  -[RTVisitPipelineModuleStats cumulativeMaxLocationOutageIntervalForDirection:](self, "cumulativeMaxLocationOutageIntervalForDirection:", CFSTR("out"));
  v19 = v18;
  -[RTVisitPipelineModuleStats maxLocationOutageIntervalForDirection:](self, "maxLocationOutageIntervalForDirection:", CFSTR("in"));
  v21 = v20;
  -[RTVisitPipelineModuleStats maxLocationOutageIntervalForDirection:](self, "maxLocationOutageIntervalForDirection:", CFSTR("out"));
  v23 = v22;
  v24 = -[RTVisitPipelineModuleStats lastVisitCountForDirection:](self, "lastVisitCountForDirection:", CFSTR("in"));
  v25 = -[RTVisitPipelineModuleStats lastVisitCountForDirection:](self, "lastVisitCountForDirection:", CFSTR("out"));
  v26 = -[RTVisitPipelineModuleStats cumulativeVisitCountForDirection:](self, "cumulativeVisitCountForDirection:", CFSTR("in"));
  v27 = -[RTVisitPipelineModuleStats cumulativeVisitCountForDirection:](self, "cumulativeVisitCountForDirection:", CFSTR("out"));
  v28 = -[RTVisitPipelineModuleStats maxVisitCountForDirection:](self, "maxVisitCountForDirection:", CFSTR("in"));
  v29 = -[RTVisitPipelineModuleStats maxVisitCountForDirection:](self, "maxVisitCountForDirection:", CFSTR("out"));
  -[RTVisitPipelineModuleStats lastProcessingDuration](self, "lastProcessingDuration");
  v31 = v30;
  -[RTVisitPipelineModuleStats cumulativeProcessingDuration](self, "cumulativeProcessingDuration");
  v33 = v32;
  -[RTVisitPipelineModuleStats maxProcessingDuration](self, "maxProcessingDuration");
  return (id)objc_msgSend(v45, "stringWithFormat:", CFSTR("lastLocationCount(in/out), %lu/%lu, cumulativeLocationCount(in/out), %lu/%lu, maxLocationsCount(in/out), %lu/%lu, lastLocationInterval(in/out), %.2f/%.2f, cumulativeLocationInterval(in/out), %.2f/%.2f, maxLocationInterval(in/out), %.2f/%.2f, lastMaxLocationOutageInterval(in/out), %.2f/%.2f, maxLocationOutageInterval(in/out), %.2f/%.2f, maxLocationOutageInterval(in/out), %.2f/%.2f, lastVisitCount(in/out), %lu/%lu, cumulativeVisitCount(in/out), %lu/%lu, maxVisitCount(in/out), %lu/%lu, lastProcessingDuration, %.2f, cumulativeProcessingDuration, %.2f, maxProcessingDuration, %.2f"), v44, v43, v42, v3, v4, v5, v41, v40, v39, v38, v37, v36, v13, v15, v17, v19,
               v21,
               v23,
               v24,
               v25,
               v26,
               v27,
               v28,
               v29,
               v31,
               v33,
               v34);
}

- (double)lastProcessingDuration
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationDurations, "objectForKeyedSubscript:", CFSTR("last"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)cumulativeProcessingDuration
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationDurations, "objectForKeyedSubscript:", CFSTR("cumulative"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)maxProcessingDuration
{
  void *v2;
  double v3;
  double v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationDurations, "objectForKeyedSubscript:", CFSTR("max"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (unint64_t)cumulativeLocationCountForDirection:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  unint64_t v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationLocationCounts, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cumulative"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = (unint64_t)v5;

  return v6;
}

- (unint64_t)maxLocationCountForDirection:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  unint64_t v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationLocationCounts, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("max"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = (unint64_t)v5;

  return v6;
}

- (double)lastLocationIntervalForDirection:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationLocationIntervals, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("last"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)cumulativeLocationIntervalForDirection:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationLocationIntervals, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cumulative"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)maxLocationIntervalForDirection:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationLocationIntervals, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("max"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)lastMaxLocationOutageIntervalForDirection:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationMaxLocationOutageIntervals, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("last"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)cumulativeMaxLocationOutageIntervalForDirection:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationMaxLocationOutageIntervals, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cumulative"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)maxLocationOutageIntervalForDirection:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationMaxLocationOutageIntervals, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("max"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (unint64_t)lastVisitCountForDirection:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationVistCount, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("last"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (unint64_t)cumulativeVisitCountForDirection:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationVistCount, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cumulative"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (unint64_t)maxVisitCountForDirection:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iterationVistCount, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("max"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_iterationVistCount, 0);
  objc_storeStrong((id *)&self->_iterationMaxLocationOutageIntervals, 0);
  objc_storeStrong((id *)&self->_iterationLocationIntervals, 0);
  objc_storeStrong((id *)&self->_iterationLocationCounts, 0);
  objc_storeStrong((id *)&self->_iterationDurations, 0);
}

@end
