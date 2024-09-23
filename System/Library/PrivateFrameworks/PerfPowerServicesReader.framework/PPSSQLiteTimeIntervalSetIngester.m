@implementation PPSSQLiteTimeIntervalSetIngester

- (PPSSQLiteTimeIntervalSetIngester)initWithFilepath:(id)a3
{
  id v5;
  PPSSQLiteTimeIntervalSetIngester *v6;
  PPSSQLiteTimeIntervalSetIngester *v7;
  uint64_t v8;
  NSCache *responseCache;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSSQLiteTimeIntervalSetIngester;
  v6 = -[PPSSQLiteTimeIntervalSetIngester init](&v11, sel_init);
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
  -[PPSSQLiteTimeIntervalSetIngester responseCache](self, "responseCache");
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
  -[PPSSQLiteTimeIntervalSetIngester responseCache](self, "responseCache");
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

  -[PPSSQLiteTimeIntervalSetIngester responseCache](self, "responseCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v12, v9);

}

- (id)parseDataForRequest:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "dimensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
    -[PPSSQLiteTimeIntervalSetIngester _computeIntervalSetMapForRequest:outError:](self, "_computeIntervalSetMapForRequest:outError:", v6, a4);
  else
    -[PPSSQLiteTimeIntervalSetIngester _computeIntervalSetForRequest:outError:](self, "_computeIntervalSetForRequest:outError:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_computeIntervalSetMapForRequest:(id)a3 outError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  PPSTimeSeriesRequest *v41;
  void *v42;
  PPSTimeSeriesRequest *v43;
  uint64_t v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  PPSTimeIntervalSetGenerator *v64;
  void *v66;
  void *context;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  const __CFString *v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "subsystem");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v5, "timeFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueFilter");
  v12 = objc_claimAutoreleasedReturnValue();
  -[PPSSQLiteTimeIntervalSetIngester filepath](self, "filepath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSOffDeviceIngesterUtilities dataSourceForFilepath:subsystem:category:](PPSOffDeviceIngesterUtilities, "dataSourceForFilepath:subsystem:category:", v13, v6, v7);
  v14 = objc_claimAutoreleasedReturnValue();

  v74 = (void *)v14;
  v69 = (void *)v12;
  objc_msgSend((id)objc_opt_class(), "_stringForSourceName:metrics:predicate:", v14, v10, v12);
  v15 = objc_claimAutoreleasedReturnValue();
  if (-[PPSSQLiteTimeIntervalSetIngester shouldUseCache](self, "shouldUseCache"))
  {
    -[PPSSQLiteTimeIntervalSetIngester responseForKey:withinTimeWindow:](self, "responseForKey:withinTimeWindow:", v15, v11);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v77 = 0;
  }
  objc_msgSend(v10, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v10;
  if (v16)
  {
    objc_msgSend(v10, "firstObject");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("timestamp");
  }
  v18 = v17;

  -[PPSSQLiteTimeIntervalSetIngester filepath](self, "filepath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v18;
  +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:subsystem:category:metricName:](PPSOffDeviceIngesterUtilities, "metricDefinitionForFilepath:subsystem:category:metricName:", v19, v6, v7, v18);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  context = (void *)MEMORY[0x2494FEED8]();
  -[PPSSQLiteTimeIntervalSetIngester filepath](self, "filepath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSDataIngesterRegistry dataIngesterForFilepath:requestType:](PPSDataIngesterRegistry, "dataIngesterForFilepath:requestType:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = (void *)v7;
  v73 = (void *)v6;
  v70 = v11;
  if (v11)
  {
    objc_msgSend(v11, "startDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSince1970");
    v24 = v23 + -10800.0;

    objc_msgSend(v11, "endDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSince1970");
    v27 = v26 + 10800.0;

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v28, v29);

  }
  else
  {
    v78 = 0;
  }
  v30 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v5, "metrics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "mutableCopy");

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend(v5, "dimensions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v82 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "groupBy");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v40);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    }
    while (v37);
  }
  v68 = (void *)v15;

  v41 = [PPSTimeSeriesRequest alloc];
  objc_msgSend(v5, "predicate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[PPSTimeSeriesRequest initWithMetrics:predicate:timeFilter:](v41, "initWithMetrics:predicate:timeFilter:", v34, v42, v78);

  v44 = objc_msgSend(v21, "shouldUseCache");
  objc_msgSend(v21, "setShouldUseCache:", 0);
  objc_msgSend(v21, "parseDataForRequest:outError:", v43, a4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setShouldUseCache:", v44);
  if (*a4)
  {
    v46 = 0;
    v47 = v70;
  }
  else
  {
    objc_msgSend(v5, "dimensions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "count");
    v46 = v49 != 0;

    if (v49)
    {
      v64 = -[PPSTimeIntervalSetGenerator initWithFilepath:settings:directionality:]([PPSTimeIntervalSetGenerator alloc], "initWithFilepath:settings:directionality:", self->_filepath, 0, +[PPSDataIngesterCommonUtilities directionalityForMetricDefinition:](PPSDataIngesterCommonUtilities, "directionalityForMetricDefinition:", v75));
      v79[0] = MEMORY[0x24BDAC760];
      v79[1] = 3221225472;
      v79[2] = __78__PPSSQLiteTimeIntervalSetIngester__computeIntervalSetMapForRequest_outError___block_invoke;
      v79[3] = &unk_25142CDD0;
      v50 = v76;
      v80 = v50;
      v66 = (void *)MEMORY[0x2494FF04C](v79);
      if (objc_msgSend(v75, "auxiliaryType") == 2)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_Dynamic.%@"), v74, v50);
        v51 = objc_claimAutoreleasedReturnValue();

        v76 = (void *)v51;
      }
      else
      {
        v76 = v50;
      }
      objc_msgSend(v5, "dimensions");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v64;
      -[PPSTimeIntervalSetGenerator intervalSetMapForTimeSeries:withGroupingDimensions:withIntervalStartCheckBlock:intervalEndCheckBlock:payloadBlock:coalescePolicy:](v64, "intervalSetMapForTimeSeries:withGroupingDimensions:withIntervalStartCheckBlock:intervalEndCheckBlock:payloadBlock:coalescePolicy:", v45, v54, 0, 0, v66, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v70;
      if (v70)
      {
        -[PPSSQLiteTimeIntervalSetIngester filterIntervalSetMap:withTimeFilter:](self, "filterIntervalSetMap:withTimeFilter:", v55, v70);
        v56 = objc_claimAutoreleasedReturnValue();

        v55 = (void *)v56;
        v47 = v70;
        v53 = v64;
      }

      v77 = v55;
    }
    else
    {
      v52 = (void *)MEMORY[0x24BDD1540];
      v85 = *MEMORY[0x24BDD0FD8];
      v86 = CFSTR("No grouping dimensions provided for interval set map request.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader"), 0, v53);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v47 = v70;
    }

  }
  objc_autoreleasePoolPop(context);
  if (v46)
  {
    v58 = v71;
    v57 = v72;
    v59 = v68;
    v60 = v77;
    if (v77 && -[PPSSQLiteTimeIntervalSetIngester shouldUseCache](self, "shouldUseCache"))
      -[PPSSQLiteTimeIntervalSetIngester setResponse:forKey:timeWindow:](self, "setResponse:forKey:timeWindow:", v77, v68, v47);
    v61 = (void *)objc_msgSend(v77, "copy");
    v62 = v73;
  }
  else
  {
    v61 = 0;
    v57 = v72;
    v62 = v73;
    v58 = v71;
    v59 = v68;
    v60 = v77;
  }

  return v61;
}

id __78__PPSSQLiteTimeIntervalSetIngester__computeIntervalSetMapForRequest_outError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_msgSend(a4, "valueForKey:", CFSTR("__directionality"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v10 == 1)
    v11 = v8;
  else
    v11 = v7;
  objc_msgSend(v11, "metricValueForKey:", *(_QWORD *)(a1 + 32));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_computeIntervalSetForRequest:(id)a3 outError:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  PPSTimeSeriesRequest *v33;
  void *v34;
  void *v35;
  PPSTimeSeriesRequest *v36;
  uint64_t v37;
  id v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  uint64_t v43;
  PPSTimeIntervalSetGenerator *v44;
  void *v45;
  PPSTimeIntervalSetGenerator *v46;
  uint64_t v47;
  void *v48;
  void *v50;
  void *v51;
  void *context;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[5];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;

  v5 = a3;
  objc_msgSend(v5, "subsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@:%@"), CFSTR("QueryExecution"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSPerformanceProfiler sharedInstance](PPSPerformanceProfiler, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startProfilingForPhase:", v8);

  objc_msgSend(v5, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueFilter");
  v13 = objc_claimAutoreleasedReturnValue();
  -[PPSSQLiteTimeIntervalSetIngester filepath](self, "filepath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)v7;
  +[PPSOffDeviceIngesterUtilities dataSourceForFilepath:subsystem:category:](PPSOffDeviceIngesterUtilities, "dataSourceForFilepath:subsystem:category:", v14, v6, v7);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)v11;
  v60 = (void *)v15;
  v61 = (void *)v13;
  objc_msgSend((id)objc_opt_class(), "_stringForSourceName:metrics:predicate:", v15, v11, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v12;
  if (-[PPSSQLiteTimeIntervalSetIngester shouldUseCache](self, "shouldUseCache")
    && (-[PPSSQLiteTimeIntervalSetIngester responseForKey:withinTimeWindow:](self, "responseForKey:withinTimeWindow:", v17, v12), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = (id)v18;
    -[PPSSQLiteTimeIntervalSetIngester filterIntervalSet:withTimeFilter:](self, "filterIntervalSet:withTimeFilter:", v18, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v63;
  }
  else
  {
    v53 = v17;
    v54 = v8;
    v56 = (void *)v11;
    context = (void *)MEMORY[0x2494FEED8]();
    -[PPSSQLiteTimeIntervalSetIngester filepath](self, "filepath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSDataIngesterRegistry dataIngesterForFilepath:requestType:](PPSDataIngesterRegistry, "dataIngesterForFilepath:requestType:", v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = v6;
    if (v12)
    {
      objc_msgSend(v12, "startDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSince1970");
      v26 = v25 + -10800.0;

      objc_msgSend(v12, "endDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSince1970");
      v29 = v28 + 10800.0;

      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v30, v31);

    }
    else
    {
      v32 = 0;
    }
    v21 = v63;
    v33 = [PPSTimeSeriesRequest alloc];
    objc_msgSend(v5, "metrics");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)v32;
    v36 = -[PPSTimeSeriesRequest initWithMetrics:predicate:timeFilter:](v33, "initWithMetrics:predicate:timeFilter:", v34, v35, v32);

    v37 = objc_msgSend(v23, "shouldUseCache");
    objc_msgSend(v23, "setShouldUseCache:", 0);
    objc_msgSend(v23, "parseDataForRequest:outError:", v36, a4);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShouldUseCache:", v37);
    v38 = *a4;
    if (*a4)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v56, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        objc_msgSend(v56, "firstObject");
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v40 = CFSTR("timestamp");
      }
      v41 = v40;

      -[PPSSQLiteTimeIntervalSetIngester filepath](self, "filepath");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v41;
      +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:subsystem:category:metricName:](PPSOffDeviceIngesterUtilities, "metricDefinitionForFilepath:subsystem:category:metricName:", v42, v57, v63, v41);
      v43 = objc_claimAutoreleasedReturnValue();

      v50 = (void *)v43;
      v44 = -[PPSTimeIntervalSetGenerator initWithDispatcher:settings:directionality:]([PPSTimeIntervalSetGenerator alloc], "initWithDispatcher:settings:directionality:", self->_dispatcher, 0, +[PPSDataIngesterCommonUtilities directionalityForMetricDefinition:](PPSDataIngesterCommonUtilities, "directionalityForMetricDefinition:", v43));
      v65 = 0;
      v66 = &v65;
      v67 = 0x3032000000;
      v68 = __Block_byref_object_copy__4;
      v69 = __Block_byref_object_dispose__4;
      objc_msgSend(v56, "firstObject");
      v70 = (id)objc_claimAutoreleasedReturnValue();
      if (v66[5])
      {
        v64[0] = MEMORY[0x24BDAC760];
        v64[1] = 3221225472;
        v64[2] = __75__PPSSQLiteTimeIntervalSetIngester__computeIntervalSetForRequest_outError___block_invoke;
        v64[3] = &unk_25142CDF8;
        v64[4] = &v65;
        v45 = (void *)MEMORY[0x2494FF04C](v64);
      }
      else
      {
        v45 = 0;
      }
      v46 = v44;
      -[PPSTimeIntervalSetGenerator intervalSetForTimeSeries:withIntervalStartCheckBlock:intervalEndCheckBlock:payloadBlock:coalescePolicy:](v44, "intervalSetForTimeSeries:withIntervalStartCheckBlock:intervalEndCheckBlock:payloadBlock:coalescePolicy:", v55, 0, 0, v45, 0);
      v21 = v63;
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        -[PPSSQLiteTimeIntervalSetIngester filterIntervalSet:withTimeFilter:](self, "filterIntervalSet:withTimeFilter:", v19);
        v47 = objc_claimAutoreleasedReturnValue();

        v19 = (id)v47;
      }

      _Block_object_dispose(&v65, 8);
    }

    objc_autoreleasePoolPop(context);
    if (v38)
    {
      v20 = 0;
      v16 = v56;
      v6 = v57;
      v17 = v53;
      v8 = v54;
    }
    else
    {
      v6 = v57;
      v17 = v53;
      v8 = v54;
      if (v19 && -[PPSSQLiteTimeIntervalSetIngester shouldUseCache](self, "shouldUseCache"))
        -[PPSSQLiteTimeIntervalSetIngester setResponse:forKey:timeWindow:](self, "setResponse:forKey:timeWindow:", v19, v53, v62);
      +[PPSPerformanceProfiler sharedInstance](PPSPerformanceProfiler, "sharedInstance");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "endProfilingForPhase:", v54);

      v19 = v19;
      v20 = v19;
      v16 = v56;
    }
  }

  return v20;
}

id __75__PPSSQLiteTimeIntervalSetIngester__computeIntervalSetForRequest_outError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_msgSend(a4, "valueForKey:", CFSTR("__directionality"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v10 == 1)
    v11 = v8;
  else
    v11 = v7;
  objc_msgSend(v11, "metricValueForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v17[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_filterIntervalSet:(id)a3 withTimeInterval:(id)a4
{
  id v5;
  PPSTimeIntervalSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[PPSTimeIntervalSet initWithTimeInterval:]([PPSTimeIntervalSet alloc], "initWithTimeInterval:", v20);
      objc_msgSend(v5, "intersectionFromIntervalSet:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v19 = v5;
        v8 = v5;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v22 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
              v14 = (void *)MEMORY[0x2494FEED8]();
              v15 = (void *)objc_opt_class();
              objc_msgSend(v8, "objectForKeyedSubscript:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "_filterIntervalSet:withTimeInterval:", v16, v20);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v13);
              objc_autoreleasePoolPop(v14);
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v10);
        }

        v5 = v19;
      }
      else
      {
        v7 = 0;
      }
    }
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

+ (id)_stringForSourceName:(id)a3 metrics:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v8);
        v12 ^= (v12 << 6) + 2654435769u + (v12 >> 2) + objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "hash");
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }
  v15 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@::%lu"), v7, ((v12 << 6) + 2654435769u + (v12 >> 2) + v15) ^ v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)filterIntervalSet:(id)a3 withTimeFilter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  PPSTimeInterval *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      -[PPSSQLiteTimeIntervalSetIngester filepath](self, "filepath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSTimestampConverterRegistry converterForFilepath:](PPSTimestampConverterRegistry, "converterForFilepath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSince1970");
      v13 = v12;

      objc_msgSend(v10, "monotonicTimeFromEpochTime:", v13);
      v15 = v14;
      objc_msgSend(v8, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSince1970");
      v18 = v17;

      objc_msgSend(v10, "monotonicTimeFromEpochTime:", v18);
      v20 = -[PPSTimeInterval initWithStartTimestamp:endTimestamp:payload:]([PPSTimeInterval alloc], "initWithStartTimestamp:endTimestamp:payload:", 0, v15, v19);
      objc_msgSend((id)objc_opt_class(), "_filterIntervalSet:withTimeInterval:", v6, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = v6;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)filterIntervalSetMap:(id)a3 withTimeFilter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    if ((int)objc_msgSend(v6, "count") >= 1)
    {
      v9 = 0;
      do
      {
        objc_msgSend(v6, "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPSSQLiteTimeIntervalSetIngester filterIntervalSet:withTimeFilter:](self, "filterIntervalSet:withTimeFilter:", v12, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v11);

        ++v9;
      }
      while (v9 < (int)objc_msgSend(v6, "count"));
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
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

@end
