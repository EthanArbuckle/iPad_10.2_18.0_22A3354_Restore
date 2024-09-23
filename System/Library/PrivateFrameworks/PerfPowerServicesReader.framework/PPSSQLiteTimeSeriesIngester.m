@implementation PPSSQLiteTimeSeriesIngester

- (PPSSQLiteTimeSeriesIngester)initWithFilepath:(id)a3
{
  id v5;
  PPSSQLiteTimeSeriesIngester *v6;
  PPSSQLiteTimeSeriesIngester *v7;
  uint64_t v8;
  NSCache *responseCache;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSSQLiteTimeSeriesIngester;
  v6 = -[PPSSQLiteTimeSeriesIngester init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_filepath, a3);
    v8 = objc_opt_new();
    responseCache = v7->_responseCache;
    v7->_responseCache = (NSCache *)v8;

  }
  return v7;
}

- (void)removeResponseForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PPSSQLiteTimeSeriesIngester responseCache](self, "responseCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (id)responseForKey:(id)a3 withinTimeWindow:(id)a4
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
  char v16;

  v6 = a4;
  v7 = a3;
  -[PPSSQLiteTimeSeriesIngester responseCache](self, "responseCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v12)
    {
      objc_msgSend(v9, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v6, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "containsDate:", v14) & 1) != 0)
        {
          objc_msgSend(v6, "endDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "containsDate:", v15);

          if ((v16 & 1) != 0)
            goto LABEL_10;
        }
        else
        {

        }
        v10 = 0;
      }
LABEL_10:

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setResponse:(id)a3 forKey:(id)a4 timeWindow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = v8;
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)

  -[PPSSQLiteTimeSeriesIngester responseCache](self, "responseCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v12, v9);

}

- (id)parseDataForRequest:(id)a3 outError:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  id v40;
  void *v41;
  PPSSQLiteQueryDescriptor *v42;
  void *v43;
  PPSSQLiteQueryDescriptor *v44;
  void *v45;
  void *v46;
  PPSSQLiteDatabase *v47;
  void *v48;
  PPSSQLiteDatabase *v49;
  PPSSQLiteQuery *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  PPSSQLiteEntity *v58;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __CFString *v76;
  const __CFString *v77;
  _BYTE v78[128];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x24BDAC8D0];
  v67 = a3;
  objc_msgSend(v67, "subsystem");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "category");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:%@_Prepare"), CFSTR("QueryExecution"), v69, v68);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSPerformanceProfiler sharedInstance](PPSPerformanceProfiler, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startProfilingForPhase:", v66);

  objc_msgSend(v67, "valueFilter");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "timeFilter");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    -[PPSSQLiteTimeSeriesIngester filepath](self, "filepath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSTimestampConverterRegistry converterForFilepath:](PPSTimestampConverterRegistry, "converterForFilepath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v8;

    objc_msgSend(v6, "monotonicTimeFromEpochTime:", v9);
    v11 = v10;
    objc_msgSend(v65, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = v13;

    objc_msgSend(v6, "monotonicTimeFromEpochTime:", v14);
    +[PPSPredicateUtilities predicateForStartTimestamp:endTimestamp:withKeyPath:](PPSPredicateUtilities, "predicateForStartTimestamp:endTimestamp:withKeyPath:", v11, v15);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      v16 = (void *)MEMORY[0x24BDD14C0];
      v79[0] = v64;
      v79[1] = v62;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
      v61 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v61 = v62;
    }

  }
  else
  {
    v61 = v64;
    v62 = 0;
  }
  objc_msgSend(v67, "metrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v19, "containsObject:", CFSTR("timestamp")) & 1) == 0)
  {
    objc_msgSend(v19, "arrayByAddingObject:", CFSTR("timestamp"));
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  -[PPSSQLiteTimeSeriesIngester filepath](self, "filepath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSOffDeviceIngesterUtilities metricDefinitionsForFilepath:subsystem:category:metricNames:](PPSOffDeviceIngesterUtilities, "metricDefinitionsForFilepath:subsystem:category:metricNames:", v21, v69, v68, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend(v22, "mutableCopy");

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v23 = v19;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  if (v24)
  {
    v25 = 0;
    v26 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v73 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v71, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v25 |= +[PPSDataIngesterCommonUtilities directionalityForMetricDefinition:](PPSDataIngesterCommonUtilities, "directionalityForMetricDefinition:", v29) == 3;
        }
        else
        {
          v31 = objc_msgSend(v28, "rangeOfString:options:", CFSTR("_[0-9.]+$"), 1024);
          if (v31 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v32, v28);

          }
          else
          {
            objc_msgSend(v28, "stringByReplacingCharactersInRange:withString:", v31, v30, &stru_251431358);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[PPSSQLiteTimeSeriesIngester filepath](self, "filepath");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:subsystem:category:metricName:](PPSOffDeviceIngesterUtilities, "metricDefinitionForFilepath:subsystem:category:metricName:", v34, v69, v68, v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setObject:forKeyedSubscript:", v35, v33);

          }
        }

      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    }
    while (v24);

    if ((v25 & 1) == 0 || (objc_msgSend(v23, "containsObject:", CFSTR("timestampEnd")) & 1) != 0)
    {
      v36 = v23;
      goto LABEL_27;
    }
    objc_msgSend(v23, "arrayByAddingObject:", CFSTR("timestampEnd"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setObject:forKeyedSubscript:", v23, CFSTR("timestampEnd"));
  }
  else
  {
    v36 = v23;
  }

LABEL_27:
  v37 = CFSTR("ASC");
  if (objc_msgSend(v67, "readDirection") == 1)
  {
    v38 = CFSTR("DESC");

    v37 = v38;
  }
  -[PPSSQLiteTimeSeriesIngester filepath](self, "filepath");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSOffDeviceIngesterUtilities allDataSourcesForFilepath:subsystem:category:](PPSOffDeviceIngesterUtilities, "allDataSourcesForFilepath:subsystem:category:", v39, v69, v68);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_stringForSourceNames:metrics:predicate:", v63, v36, v64);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PPSSQLiteTimeSeriesIngester shouldUseCache](self, "shouldUseCache")
    && (-[PPSSQLiteTimeSeriesIngester responseForKey:withinTimeWindow:](self, "responseForKey:withinTimeWindow:", v60, v65), (v40 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend((id)objc_opt_class(), "filterTimeSeries:withPredicate:", v40, v62);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v58 = -[PPSSQLiteEntity initWithTableNames:]([PPSSQLiteEntity alloc], "initWithTableNames:", v63);
    v42 = [PPSSQLiteQueryDescriptor alloc];
    objc_msgSend(v61, "pps_sqlPredicateForSelect");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[PPSSQLiteQueryDescriptor initWithEntity:predicate:limitCount:offsetCount:](v42, "initWithEntity:predicate:limitCount:offsetCount:", v58, v43, objc_msgSend(v67, "limitCount"), objc_msgSend(v67, "offsetCount"));

    v77 = CFSTR("timestamp");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSSQLiteQueryDescriptor setOrderByProperties:](v44, "setOrderByProperties:", v45);

    v76 = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v76, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSSQLiteQueryDescriptor setOrderByDirections:](v44, "setOrderByDirections:", v46);

    v47 = [PPSSQLiteDatabase alloc];
    -[PPSSQLiteTimeSeriesIngester filepath](self, "filepath");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[PPSSQLiteDatabase initWithDatabaseURL:](v47, "initWithDatabaseURL:", v48);

    v50 = -[PPSSQLiteQuery initWithDatabase:descriptor:]([PPSSQLiteQuery alloc], "initWithDatabase:descriptor:", v49, v44);
    PPSReaderLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      -[PPSSQLiteTimeSeriesIngester parseDataForRequest:outError:].cold.1(v50, (uint64_t)v36, v51);

    +[PPSPerformanceProfiler sharedInstance](PPSPerformanceProfiler, "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "endProfilingForPhase:", v66);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:%@_SQLEnumerate"), CFSTR("QueryExecution"), v69, v68);
    v53 = objc_claimAutoreleasedReturnValue();

    +[PPSPerformanceProfiler sharedInstance](PPSPerformanceProfiler, "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "startProfilingForPhase:", v53);

    -[PPSSQLiteDatabase openForReadingWithError:](v49, "openForReadingWithError:", a4);
    if (*a4)
    {
      -[PPSSQLiteDatabase close](v49, "close");
      v55 = 0;
    }
    else
    {
      -[PPSSQLiteTimeSeriesIngester _convertSQLiteDataFromQuery:withMetricDefinitions:error:](self, "_convertSQLiteDataFromQuery:withMetricDefinitions:error:", v50, v71);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSSQLiteDatabase close](v49, "close");
      if (v55 && -[PPSSQLiteTimeSeriesIngester shouldUseCache](self, "shouldUseCache"))
        -[PPSSQLiteTimeSeriesIngester setResponse:forKey:timeWindow:](self, "setResponse:forKey:timeWindow:", v55, v60, v65);
    }
    +[PPSPerformanceProfiler sharedInstance](PPSPerformanceProfiler, "sharedInstance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "endProfilingForPhase:", v53);

    v40 = v55;
    v66 = (void *)v53;
    v41 = v40;
  }

  return v41;
}

- (id)_convertSQLiteDataFromQuery:(id)a3 withMetricDefinitions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v43;
  PPSSQLiteTimeSeriesIngester *v44;
  id *v45;
  void *v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v46 = v8;
  if (v8)
  {
    v44 = self;
    v45 = a5;
    v10 = (void *)objc_opt_new();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v43 = v9;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v67 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isEqualToString:", CFSTR("timestamp")) & 1) != 0
            || objc_msgSend(v15, "isEqualToString:", CFSTR("timestampEnd")))
          {
            objc_msgSend(v10, "addObject:", v15);
          }
          else
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:](PPSDataIngesterCommonUtilities, "dataSourceForMetricDefinition:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "auxiliaryType") == 2)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_Dynamic.%@"), v17, v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v18);

            }
            else if (objc_msgSend(v16, "auxiliaryType") == 3)
            {
              if (objc_msgSend(v16, "fixedArraySize"))
              {
                if (objc_msgSend(v16, "fixedArraySize"))
                {
                  v19 = 0;
                  do
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%d"), v15, v19);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "addObject:", v20);

                    v19 = (v19 + 1);
                  }
                  while (v19 < objc_msgSend(v16, "fixedArraySize"));
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_Array_%@.%@"), v17, v15, v15);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v21);

              }
            }
            else
            {
              objc_msgSend(v10, "addObject:", v15);
            }

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v12);
    }

    objc_msgSend(v46, "columnNamesForProperties:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PPSReaderLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[PPSSQLiteTimeSeriesIngester _convertSQLiteDataFromQuery:withMetricDefinitions:error:].cold.2();

    v24 = objc_msgSend(v22, "count");
    if (v24 != objc_msgSend(v10, "count"))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Number of column and metric names should be the same."));
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__2;
    v64 = __Block_byref_object_dispose__2;
    objc_msgSend(v11, "allValues");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v65 = (id)objc_claimAutoreleasedReturnValue();

    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__2;
    v58 = __Block_byref_object_dispose__2;
    v59 = (id)objc_opt_new();
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __87__PPSSQLiteTimeSeriesIngester__convertSQLiteDataFromQuery_withMetricDefinitions_error___block_invoke;
    v48[3] = &unk_25142CC98;
    v48[4] = v44;
    v26 = v22;
    v49 = v26;
    v27 = v11;
    v50 = v27;
    v51 = v46;
    v52 = &v60;
    v53 = &v54;
    objc_msgSend(v51, "enumerateProperties:error:enumerationHandler:", v10, v45, v48);
    v28 = (void *)v61[5];
    if (v28)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if ((v30 & 1) == 0)
      {
        +[PPSRecipeEngine sharedInstance](PPSRecipeEngine, "sharedInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "allValues");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "createTimeSeriesRecipeForMetric:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          +[PPSRecipeEngine sharedInstance](PPSRecipeEngine, "sharedInstance");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v55[5];
          v47 = 0;
          objc_msgSend(v35, "executeTimeSeriesRecipe:on:metrics:error:", v34, v36, v27, &v47);
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v47;
          v39 = (void *)v55[5];
          v55[5] = v37;

          if (v38)
          {
            PPSReaderLog();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              -[PPSSQLiteTimeSeriesIngester _convertSQLiteDataFromQuery:withMetricDefinitions:error:].cold.1();

          }
        }

      }
    }
    v41 = (id)v55[5];

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v60, 8);

    v9 = v43;
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

uint64_t __87__PPSSQLiteTimeSeriesIngester__convertSQLiteDataFromQuery_withMetricDefinitions_error___block_invoke(uint64_t a1, void *a2, PPSSQLiteRow *a3)
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  void *context;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  context = (void *)MEMORY[0x2494FEED8]();
  v6 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "filepath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSTimestampConverterRegistry converterForFilepath:](PPSTimestampConverterRegistry, "converterForFilepath:", v7);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v6;
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v8 = 0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("timestamp"));

      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v9 = PPSSQLiteColumnValueWithNameAsDouble((uint64_t)a3, v13);

        objc_msgSend(v56, "systemOffsetFromMonotonicTime:", v9);
        v10 = v14;
      }
      else
      {
        PPSSQLiteColumnValueWithNameAsFoundationType(a3, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = *(void **)(a1 + 48);
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqual:", v19);

          if ((v20 & 1) == 0)
          {
            if (+[PPSEnumerationDecoder isDecodableMetric:](PPSEnumerationDecoder, "isDecodableMetric:", v18))
            {
              +[PPSEnumerationDecoder decodeValue:withMetric:](PPSEnumerationDecoder, "decodeValue:withMetric:", v15, v18);
              v21 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v21;
            }
            +[PPSRecipeEngine sharedInstance](PPSRecipeEngine, "sharedInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "createMetricRecipeForMetric:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              +[PPSRecipeEngine sharedInstance](PPSRecipeEngine, "sharedInstance");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = 0;
              objc_msgSend(v24, "executeMetricRecipe:on:metric:error:", v23, v15, v18, &v58);
              v54 = objc_claimAutoreleasedReturnValue();
              v25 = v58;

              if (v25)
              {
                PPSReaderLog();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v60 = v23;
                  _os_log_error_impl(&dword_2439D9000, v26, OS_LOG_TYPE_ERROR, "Metric Recipe '%@' failed during time series ingestion", buf, 0xCu);
                }

              }
              v15 = (void *)v54;
            }

            v6 = v55;
          }
        }
        if (v15)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "rangeOfString:", CFSTR("."));

          objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          if (v28 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v29, "substringFromIndex:", v28 + 1);
            v31 = objc_claimAutoreleasedReturnValue();

            v30 = (void *)v31;
          }
          objc_msgSend(v6, "setValue:forKey:", v15, v30);

        }
      }
      ++v8;
    }
    while (v8 < objc_msgSend(*(id *)(a1 + 40), "count"));
  }
  else
  {
    v10 = 0.0;
    v9 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 56), "descriptor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "entity");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "tableNames");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPSEvent eventWithMonotonicTimestamp:timeOffset:dictionary:groupId:](PPSEvent, "eventWithMonotonicTimestamp:timeOffset:dictionary:groupId:", v6, objc_msgSend((id)objc_opt_class(), "_hashForStringArray:", v34), v9, v10);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v36)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if ((v38 & 1) == 0)
    {
      v39 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "subsystem");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "category");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringWithFormat:", CFSTR("%@:%@"), v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setLabel:", v42);

      +[PPSRecipeEngine sharedInstance](PPSRecipeEngine, "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "allValues");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "firstObject");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "createEventRecipeForMetric:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        +[PPSRecipeEngine sharedInstance](PPSRecipeEngine, "sharedInstance");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = *(_QWORD *)(a1 + 48);
        v57 = 0;
        objc_msgSend(v47, "executeEventRecipe:on:metrics:error:", v46, v35, v48, &v57);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v57;

        v6 = v55;
        if (v50)
        {
          PPSReaderLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            __87__PPSSQLiteTimeSeriesIngester__convertSQLiteDataFromQuery_withMetricDefinitions_error___block_invoke_cold_1();

        }
        v35 = (void *)v49;
      }
      else
      {
        v6 = v55;
      }

    }
  }
  if (v35)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addEvent:", v35);

  objc_autoreleasePoolPop(context);
  return 1;
}

+ (unint64_t)_hashForStringArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 ^= (v6 << 6) + (v6 >> 2) + 2654435769u + objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hash");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_stringForSourceNames:(id)a3 metrics:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend((id)objc_opt_class(), "_hashForStringArray:", v8);

  v11 = objc_msgSend(v7, "hash");
  v12 = (v11 + (v10 << 6) + (v10 >> 2) + 2654435769u) ^ v10;
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@::%lu"), v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)filterTimeSeries:(id)a3 withPredicate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v20 = a4;
  if (!v20)
  {
    v6 = v5;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "filteredTimeSeriesUsingPredicate:", v20);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = v6;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x2494FEED8]();
          v16 = (void *)objc_opt_class();
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "filterTimeSeries:withPredicate:", v17, v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v14);
          objc_autoreleasePoolPop(v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v5 = v19;
  }
  else
  {
    v7 = 0;
  }
LABEL_6:

  return v7;
}

- (NSURL)filepath
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)shouldUseCache
{
  return self->_shouldUseCache;
}

- (void)setShouldUseCache:(BOOL)a3
{
  self->_shouldUseCache = a3;
}

- (PPSRequestDispatcher)dispatcher
{
  return (PPSRequestDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSCache)responseCache
{
  return (NSCache *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResponseCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseCache, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_filepath, 0);
}

- (void)parseDataForRequest:(NSObject *)a3 outError:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "selectSQLWithProperties:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_2439D9000, a3, OS_LOG_TYPE_DEBUG, "Query before value-binding: %@", v5, 0xCu);

}

- (void)_convertSQLiteDataFromQuery:withMetricDefinitions:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2(&dword_2439D9000, v0, v1, "Time Series Recipe '%@' failed during time series ingestion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_convertSQLiteDataFromQuery:withMetricDefinitions:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_2439D9000, v1, OS_LOG_TYPE_DEBUG, "Column Names %@ Properties %@", v2, 0x16u);
  OUTLINED_FUNCTION_7();
}

void __87__PPSSQLiteTimeSeriesIngester__convertSQLiteDataFromQuery_withMetricDefinitions_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2(&dword_2439D9000, v0, v1, "Event Recipe '%@' failed during time series ingestion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
