@implementation PPSSQLiteHistogramIngester

- (PPSSQLiteHistogramIngester)initWithFilepath:(id)a3
{
  id v5;
  PPSSQLiteHistogramIngester *v6;
  PPSSQLiteHistogramIngester *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSSQLiteHistogramIngester;
  v6 = -[PPSSQLiteHistogramIngester init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_filepath, a3);

  return v7;
}

- (id)parseDataForRequest:(id)a3 outError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  PPSSQLiteEntity *v36;
  PPSSQLiteQueryDescriptor *v37;
  void *v38;
  PPSSQLiteQueryDescriptor *v39;
  PPSSQLiteDatabase *v40;
  void *v41;
  PPSSQLiteDatabase *v42;
  PPSSQLiteQuery *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "subsystem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueFilter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeFilter");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[PPSSQLiteHistogramIngester filepath](self, "filepath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSTimestampConverterRegistry converterForFilepath:](PPSTimestampConverterRegistry, "converterForFilepath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11;

    objc_msgSend(v9, "monotonicTimeFromEpochTime:", v12);
    v14 = v13;
    objc_msgSend(v53, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v17 = v16;

    objc_msgSend(v9, "monotonicTimeFromEpochTime:", v17);
    +[PPSPredicateUtilities predicateForStartTimestamp:endTimestamp:withKeyPath:](PPSPredicateUtilities, "predicateForStartTimestamp:endTimestamp:withKeyPath:", CFSTR("timestamp"), v14, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v49)
    {
      v21 = (void *)MEMORY[0x24BDD14C0];
      v59[0] = v49;
      v59[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "andPredicateWithSubpredicates:", v22);
      v48 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v48 = v19;
    }

  }
  else
  {
    v48 = v49;
  }
  -[PPSSQLiteHistogramIngester filepath](self, "filepath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSOffDeviceIngesterUtilities metricDefinitionsForFilepath:subsystem:category:metricNames:](PPSOffDeviceIngesterUtilities, "metricDefinitionsForFilepath:subsystem:category:metricNames:", v23, v52, v51, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v26 = v7;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v55 != v28)
          objc_enumerationMutation(v26);
        v30 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v25, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31 == 0;

        if (v32)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v33, v30);

        }
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    }
    while (v27);
  }

  -[PPSSQLiteHistogramIngester filepath](self, "filepath");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSOffDeviceIngesterUtilities allDataSourcesForFilepath:subsystem:category:](PPSOffDeviceIngesterUtilities, "allDataSourcesForFilepath:subsystem:category:", v34, v52, v51);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = -[PPSSQLiteEntity initWithTableNames:]([PPSSQLiteEntity alloc], "initWithTableNames:", v35);
  v37 = [PPSSQLiteQueryDescriptor alloc];
  objc_msgSend(v48, "pps_sqlPredicateForSelect");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[PPSSQLiteQueryDescriptor initWithEntity:predicate:](v37, "initWithEntity:predicate:", v36, v38);

  v40 = [PPSSQLiteDatabase alloc];
  -[PPSSQLiteHistogramIngester filepath](self, "filepath");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[PPSSQLiteDatabase initWithDatabaseURL:](v40, "initWithDatabaseURL:", v41);

  v43 = -[PPSSQLiteQuery initWithDatabase:descriptor:]([PPSSQLiteQuery alloc], "initWithDatabase:descriptor:", v42, v39);
  PPSReaderLog();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    -[PPSSQLiteHistogramIngester parseDataForRequest:outError:].cold.1(v43, (uint64_t)v26, v44);

  -[PPSSQLiteDatabase openForReadingWithError:](v42, "openForReadingWithError:", a4);
  if (*a4)
  {
    v45 = 0;
  }
  else
  {
    objc_msgSend(v5, "dimensions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSSQLiteHistogramIngester _convertSQLiteDataFromQuery:withDimensions:outError:](self, "_convertSQLiteDataFromQuery:withDimensions:outError:", v43, v46, a4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PPSSQLiteDatabase close](v42, "close");

  return v45;
}

- (id)_convertSQLiteDataFromQuery:(id)a3 withDimensions:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  PPSHistogram *v26;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__3;
    v25 = __Block_byref_object_dispose__3;
    v26 = -[PPSHistogram initWithDimensions:]([PPSHistogram alloc], "initWithDimensions:", v8);
    objc_msgSend(v8, "valueForKeyPath:", CFSTR("@unionOfObjects.metricName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "columnNamesForProperties:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    if (v11 != objc_msgSend(v9, "count"))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Number of columns and metric names should be the same."));
    v12 = objc_msgSend(v10, "count");
    if (v12 != objc_msgSend(v8, "count"))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Number of columns and histogram dimensions should be the same."));
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __82__PPSSQLiteHistogramIngester__convertSQLiteDataFromQuery_withDimensions_outError___block_invoke;
    v16[3] = &unk_25142CD20;
    v20 = v11;
    v13 = v10;
    v17 = v13;
    v18 = v8;
    v19 = &v21;
    objc_msgSend(v7, "enumerateProperties:error:enumerationHandler:", v9, a5, v16);
    v14 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __82__PPSSQLiteHistogramIngester__convertSQLiteDataFromQuery_withDimensions_outError___block_invoke(uint64_t a1, void *a2, PPSSQLiteRow *a3)
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = (void *)MEMORY[0x2494FEED8]();
  v7 = (void *)objc_opt_new();
  if (*(_QWORD *)(a1 + 56))
  {
    v8 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PPSSQLiteColumnValueWithNameAsNumber(a3, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(v7, "addObject:", v10);

      ++v8;
    }
    while (v8 < *(_QWORD *)(a1 + 56));
  }
  v11 = objc_msgSend(v7, "count");
  if (v11 == objc_msgSend(*(id *)(a1 + 40), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "recordSample:", v7);

  objc_autoreleasePoolPop(v6);
  return 1;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_filepath, 0);
}

- (void)parseDataForRequest:(NSObject *)a3 outError:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "selectSQLWithProperties:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_2439D9000, a3, OS_LOG_TYPE_DEBUG, "Query before value-binding: %@", (uint8_t *)&v5, 0xCu);

}

@end
