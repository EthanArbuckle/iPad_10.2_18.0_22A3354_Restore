@implementation RTVisitPipeline

BOOL __35__RTVisitPipeline_filterLocations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  double v13;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)
    && (objc_msgSend(v5, "date"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isOnOrBefore:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)),
        v7,
        (v8 & 1) != 0)
    || (objc_msgSend(v5, "horizontalUncertainty"),
        v10 = v9,
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "maxHorizontalAccuracy"),
        v10 > v11))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v5, "horizontalUncertainty");
    v12 = v13 >= 0.0;
  }

  return v12;
}

- (id)processLocations:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  NSDate *v7;
  NSDate *lastProcessedLocationDate;
  RTVisitLocationPoints *v9;
  RTVisitCluster *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  NSString *name;
  void *v31;
  unint64_t iteration;
  void *v33;
  uint8_t buf[4];
  NSString *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  -[RTVisitPipeline filterLocations:](self, "filterLocations:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    ++self->_iteration;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      name = self->_name;
      iteration = self->_iteration;
      v15 = objc_msgSend(v4, "count");
      objc_msgSend(v4, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringFromDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringFromDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v35 = name;
      v36 = 2048;
      v37 = iteration;
      v38 = 2048;
      v39 = v15;
      v40 = 2112;
      v41 = (uint64_t)v18;
      v42 = 2112;
      v43 = v21;
      _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "pipeline, %@, iteration, %lu, with %lu points from, %@, to %@", buf, 0x34u);

    }
    objc_msgSend(v4, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastProcessedLocationDate = self->_lastProcessedLocationDate;
    self->_lastProcessedLocationDate = v7;

    v9 = -[RTVisitLocationPoints initWithLocations:]([RTVisitLocationPoints alloc], "initWithLocations:", v4);
    v10 = -[RTVisitCluster initWithPoints:]([RTVisitCluster alloc], "initWithPoints:", v9);
    v46[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTVisitPipeline processVisitCluster:](self, "processVisitCluster:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[RTVisitPipeline name](self, "name");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v29 = self->_iteration;
      v28 = objc_msgSend(v12, "count");
      v27 = objc_msgSend(v4, "count");
      objc_msgSend(v4, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "date");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringFromDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringFromDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v35 = v22;
      v36 = 2048;
      v37 = v29;
      v38 = 2048;
      v39 = v28;
      v40 = 2048;
      v41 = v27;
      v42 = 2112;
      v43 = v23;
      v44 = 2112;
      v45 = v26;
      _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "pipeline, %@, iteration, %lu, detected %lu visits from %lu locations ranging from %@ to %@", buf, 0x3Eu);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)processVisitCluster:(id)a3
{
  id v4;
  NSArray *v5;
  __int128 v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSMutableDictionary *moduleStats;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  double v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  int v23;
  NSString *name;
  objc_class *v25;
  void *v26;
  NSString *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  NSString *v41;
  unint64_t v42;
  objc_class *v43;
  void *v44;
  __int128 v45;
  unint64_t iteration;
  char v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  NSString *v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v5 = self->_modules;
  v49 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (!v49)
  {

LABEL_24:
    -[RTVisitPipeline filterVisitClusters:](self, "filterVisitClusters:", v4);
    v32 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v32;
    goto LABEL_25;
  }
  v47 = 0;
  v48 = *(_QWORD *)v55;
  *(_QWORD *)&v6 = 138412802;
  v45 = v6;
  while (2)
  {
    for (i = 0; i != v49; ++i)
    {
      if (*(_QWORD *)v55 != v48)
        objc_enumerationMutation(v5);
      v8 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
      v9 = (void *)MEMORY[0x1D8231EA8]();
      moduleStats = self->_moduleStats;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](moduleStats, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "startIterationWithVisitClusters:", v4);
      objc_msgSend(v8, "process:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "stopIterationWithVisitClusters:", v14);
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        iteration = self->_iteration;
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v60 = name;
        v61 = 2048;
        v62 = iteration;
        v63 = 2112;
        v64 = v26;
        v65 = 2112;
        v66 = v13;
        _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "pipeline, %@, iteration, %lu, module, %@, stats, %@", buf, 0x2Au);

      }
      v16 = (double)(unint64_t)objc_msgSend(v13, "lastLocationCount");
      -[RTVisitHyperParameter maxGapInVisit](self->_hyperParameter, "maxGapInVisit");
      if (v17 < v16)
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          v27 = self->_name;
          v28 = objc_msgSend(v13, "lastLocationCount");
          -[RTVisitHyperParameter maxGapInVisit](self->_hyperParameter, "maxGapInVisit");
          *(_DWORD *)buf = v45;
          v60 = v27;
          v61 = 2048;
          v62 = v28;
          v63 = 2048;
          v64 = v29;
          _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "pipeline, %@, lastLocationCount, %lu, exceeded maxLocationCount, %.0f", buf, 0x20u);
        }

      }
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "isEqualToString:", v22);

      if (v23)
      {
        -[RTVisitPipeline filterVisitClusters:](self, "filterVisitClusters:", v14);
        v4 = (id)objc_claimAutoreleasedReturnValue();

        v47 = 1;
      }
      else
      {
        v4 = v14;
      }
      if (!objc_msgSend(v4, "count", v45))
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          v41 = self->_name;
          v42 = self->_iteration;
          v43 = (objc_class *)objc_opt_class();
          NSStringFromClass(v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v45;
          v60 = v41;
          v61 = 2048;
          v62 = v42;
          v63 = 2112;
          v64 = v44;
          _os_log_debug_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_DEBUG, "pipeline, %@, iteration, %lu, is terminated by %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v9);
        v31 = 0;
        goto LABEL_35;
      }

      objc_autoreleasePoolPop(v9);
    }
    v49 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    if (v49)
      continue;
    break;
  }

  if ((v47 & 1) == 0)
    goto LABEL_24;
LABEL_25:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v5 = (NSArray *)v4;
  v33 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v51 != v35)
          objc_enumerationMutation(v5);
        v37 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v37, "visit");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend(v37, "visit");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v39);

        }
      }
      v34 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v34);
  }
  v4 = v5;
LABEL_35:

  return v31;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isRedundantForVisit:(id)a3 currentVisit:(id)a4 distanceCalculator:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSString *name;
  BOOL v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  char *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  NSString *v41;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    goto LABEL_32;
  objc_msgSend(v8, "exit");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v9, "entry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isOnOrAfter:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_32;
  }
  objc_msgSend(v8, "exit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    goto LABEL_9;
  objc_msgSend(v8, "entry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isEqualToDate:", v17) & 1) == 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(v9, "exit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    goto LABEL_32;
LABEL_10:
  objc_msgSend(v8, "exit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

    goto LABEL_13;
  }
  objc_msgSend(v9, "exit");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
LABEL_13:
    objc_msgSend(v8, "entry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isEqualToDate:", v22) & 1) != 0)
    {
      objc_msgSend(v9, "exit");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v45 = (const char *)v9;
          v46 = 2112;
          v47 = v8;
          _os_log_debug_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEBUG, "likely false LC visit, %@, with identical entry as last visit, %@", buf, 0x16u);
        }
LABEL_22:
        v27 = 1;
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {

    }
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      name = self->_name;
      *(_DWORD *)buf = 138412802;
      v45 = (const char *)name;
      v46 = 2112;
      v47 = v9;
      v48 = 2112;
      v49 = v8;
      _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@ hits illegitimate case with current visit, %@, last visit, %@", buf, 0x20u);
    }

    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[RTVisitPipeline isRedundantForVisit:currentVisit:distanceCalculator:]";
      v46 = 1024;
      LODWORD(v47) = 286;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "illegitimate case (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_22;
  }
  objc_msgSend(v8, "location");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  objc_msgSend(v10, "distanceFromLocation:toLocation:error:", v28, v29, &v43);
  v31 = v30;
  v32 = (char *)v43;

  if (v32)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocation);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v32;
      _os_log_debug_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
    }

  }
  objc_msgSend(v9, "entry");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entry");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v34, "isOnOrAfter:", v35);
  if (!v36 || v31 > 250.0)
  {

    if (!v36)
      goto LABEL_30;
LABEL_32:
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v41 = self->_name;
      *(_DWORD *)buf = 138412802;
      v45 = (const char *)v41;
      v46 = 2112;
      v47 = v9;
      v48 = 2112;
      v49 = v8;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@ Added non-redundant visit, %@, last visit, %@,", buf, 0x20u);
    }
    v27 = 0;
    goto LABEL_35;
  }
  objc_msgSend(v8, "entry");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entry");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "timeIntervalSinceDate:", v38);
  v40 = v39;

  if (v40 > 86400.0)
    goto LABEL_32;
LABEL_30:
  v27 = 1;
LABEL_36:

  return v27;
}

- (id)filterVisitClusters:(id)a3
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
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  RTVisit *lastVisit;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  RTVisit *v31;
  RTVisit *v32;
  NSString *name;
  RTVisit *v34;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  RTVisit *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v37 = 0;
    goto LABEL_38;
  }
  v37 = (id)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v36 = v4;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (!v7)
    goto LABEL_36;
  v8 = v7;
  v9 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v39 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v11, "visit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = (const char *)v11;
          _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "inspecting cluster=%@", buf, 0xCu);
        }

        objc_msgSend(v11, "visit");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "entry");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v43 = "-[RTVisitPipeline filterVisitClusters:]";
            v44 = 1024;
            LODWORD(v45) = 310;
            _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cluster.visit.entry (in %s:%d)", buf, 0x12u);
          }

        }
        objc_msgSend(v11, "visit");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "location");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v43 = "-[RTVisitPipeline filterVisitClusters:]";
            v44 = 1024;
            LODWORD(v45) = 311;
            _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cluster.visit.location (in %s:%d)", buf, 0x12u);
          }

        }
        objc_msgSend(v11, "visit");
        v20 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject type](v20, "type") == 3)
        {
LABEL_22:

        }
        else
        {
          objc_msgSend(v11, "visit");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "type");

          if (v22 != 1)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v43 = "-[RTVisitPipeline filterVisitClusters:]";
              v44 = 1024;
              LODWORD(v45) = 312;
              _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTVisitTypeExit == cluster.visit.type || RTVisitTypeEntry == cluster.visit.type (in %s:%d)", buf, 0x12u);
            }
            goto LABEL_22;
          }
        }
        objc_msgSend(v11, "visit");
        v23 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject type](v23, "type") == 3)
        {
          objc_msgSend(v11, "visit");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "exit");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v43 = "-[RTVisitPipeline filterVisitClusters:]";
              v44 = 1024;
              LODWORD(v45) = 313;
              _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !(RTVisitTypeExit == cluster.visit.type) || cluster.visit.exit (in %s:%d)", buf, 0x12u);
            }
            goto LABEL_27;
          }
        }
        else
        {
LABEL_27:

        }
        lastVisit = self->_lastVisit;
        objc_msgSend(v11, "visit");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v27, "copy");
        LOBYTE(lastVisit) = -[RTVisitPipeline isRedundantForVisit:currentVisit:distanceCalculator:](self, "isRedundantForVisit:currentVisit:distanceCalculator:", lastVisit, v28, v5);

        if ((lastVisit & 1) != 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            name = self->_name;
            v34 = self->_lastVisit;
            *(_DWORD *)buf = 138412802;
            v43 = (const char *)name;
            v44 = 2112;
            v45 = v11;
            v46 = 2112;
            v47 = v34;
            _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "%@ drop visit cluster, %@, last visit, %@", buf, 0x20u);
          }

        }
        else
        {
          objc_msgSend(v37, "addObject:", v11);
        }
        objc_msgSend(v11, "visit");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (RTVisit *)objc_msgSend(v30, "copy");
        v32 = self->_lastVisit;
        self->_lastVisit = v31;

        continue;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  }
  while (v8);
LABEL_36:

  v4 = v36;
LABEL_38:

  return v37;
}

- (id)filterLocations:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0CB3880];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__RTVisitPipeline_filterLocations___block_invoke;
  v8[3] = &unk_1E9298AD0;
  v8[4] = self;
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)bootStrappingDone
{
  return self->_bootStrappingDone;
}

+ (id)typeToString:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E9298AF0[a3 - 1];
}

- (RTVisitPipeline)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithModules_name_type_lastVisit_hyperParameter_);
}

- (RTVisitPipeline)initWithModules:(id)a3 name:(id)a4 type:(unint64_t)a5 lastVisit:(id)a6 hyperParameter:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *v23;
  RTVisitPipeline *v24;
  uint64_t v25;
  NSArray *modules;
  uint64_t v27;
  NSMutableDictionary *moduleStats;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  NSMutableDictionary *v35;
  objc_class *v36;
  void *v37;
  uint64_t v38;
  RTVisit *lastVisit;
  uint64_t v40;
  NSString *name;
  RTVisitPipeline *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v46;
  __int128 v47;
  unint64_t v48;
  id v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  objc_super v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!objc_msgSend(v12, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v43 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v44 = "Invalid parameter not satisfying: modules.count";
LABEL_36:
    _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, v44, buf, 2u);
    goto LABEL_37;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v43 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v44 = "Invalid parameter not satisfying: name";
    goto LABEL_36;
  }
  if (a5 > 4 || ((1 << a5) & 0x16) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: VALID_PIPELINE(type)", buf, 2u);
    }

    if (a5 != 4)
      goto LABEL_38;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v44 = "Invalid parameter not satisfying: hyperParameter";
      goto LABEL_36;
    }
LABEL_37:

LABEL_38:
    v42 = 0;
    goto LABEL_39;
  }
  v48 = a5;
  v49 = a7;
  v50 = v14;
  v51 = v13;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v58;
    *(_QWORD *)&v18 = 138413058;
    v47 = v18;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v58 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        if ((objc_msgSend(v22, "conformsToProtocol:", &unk_1EFC6F680, v47) & 1) == 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v47;
            v63 = v22;
            v64 = 2112;
            v65 = v51;
            v66 = 2080;
            v67 = "-[RTVisitPipeline initWithModules:name:type:lastVisit:hyperParameter:]";
            v68 = 1024;
            v69 = 97;
            _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@ doesn't conform to RTVisitPipelineModule for pipeline, %@ (in %s:%d)", buf, 0x26u);
          }

        }
        if (!objc_msgSend(v22, "conformsToProtocol:", &unk_1EFC6F680))
        {

          v42 = 0;
          goto LABEL_33;
        }
      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      if (v19)
        continue;
      break;
    }
  }

  v56.receiver = self;
  v56.super_class = (Class)RTVisitPipeline;
  v24 = -[RTVisitPipeline init](&v56, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v16, "copy");
    modules = v24->_modules;
    v24->_modules = (NSArray *)v25;

    v27 = objc_opt_new();
    moduleStats = v24->_moduleStats;
    v24->_moduleStats = (NSMutableDictionary *)v27;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v29 = v24->_modules;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v53 != v32)
            objc_enumerationMutation(v29);
          v34 = (void *)objc_opt_new();
          v35 = v24->_moduleStats;
          v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v34, v37);

        }
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      }
      while (v31);
    }

    v38 = objc_msgSend(v50, "copy");
    lastVisit = v24->_lastVisit;
    v24->_lastVisit = (RTVisit *)v38;

    v40 = objc_msgSend(v51, "copy");
    name = v24->_name;
    v24->_name = (NSString *)v40;

    v24->_type = v48;
    objc_storeStrong((id *)&v24->_hyperParameter, v49);
  }
  self = v24;
  v42 = self;
LABEL_33:
  v14 = v50;
  v13 = v51;
LABEL_39:

  return v42;
}

- (void)shutdown
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  NSMutableDictionary *moduleStats;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSString *name;
  unint64_t iteration;
  void *v21;
  NSArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_modules;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);
        moduleStats = self->_moduleStats;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](moduleStats, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v14, "cumulativeProcessingDuration");
        objc_msgSend(v15, "numberWithDouble:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v16);

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "shutdown");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v5);
  }

  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    iteration = self->_iteration;
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v29 = v18;
    v30 = 2112;
    v31 = name;
    v32 = 2048;
    v33 = iteration;
    v34 = 2112;
    v35 = v21;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, pipeline, %@, iterations, %lu, moduleProcessingDurations, %@", buf, 0x2Au);

  }
}

- (id)description
{
  void *v3;
  NSString *name;
  void *v5;
  NSUInteger v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  name = self->_name;
  objc_msgSend((id)objc_opt_class(), "typeToString:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSArray count](self->_modules, "count");
  v7 = CFSTR("YES");
  if (!self->_bootStrappingDone)
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("name, %@, type, %@, %lu modules, bootstrappingDone, %@, lastVisit, %@"), name, v5, v6, v7, self->_lastVisit);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)type
{
  return self->_type;
}

- (RTVisit)lastVisit
{
  return self->_lastVisit;
}

- (void)setBootStrappingDone:(BOOL)a3
{
  self->_bootStrappingDone = a3;
}

- (RTVisitHyperParameter)hyperParameter
{
  return self->_hyperParameter;
}

- (NSDate)lastProcessedLocationDate
{
  return self->_lastProcessedLocationDate;
}

- (void)setLastProcessedLocationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastProcessedLocationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedLocationDate, 0);
  objc_storeStrong((id *)&self->_hyperParameter, 0);
  objc_storeStrong((id *)&self->_lastVisit, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_moduleStats, 0);
  objc_storeStrong((id *)&self->_modules, 0);
}

@end
