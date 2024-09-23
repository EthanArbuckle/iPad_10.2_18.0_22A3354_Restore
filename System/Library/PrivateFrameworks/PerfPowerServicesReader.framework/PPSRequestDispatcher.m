@implementation PPSRequestDispatcher

- (PPSRequestDispatcher)initWithFilepath:(id)a3
{
  id v4;
  PPSRequestDispatcher *v5;
  uint64_t v6;
  NSURL *filepath;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSRequestDispatcher;
  v5 = -[PPSRequestDispatcher init](&v11, sel_init);
  if (v5)
  {
    if (+[PPSEntitlementChecker checkForEntitlement:](PPSEntitlementChecker, "checkForEntitlement:", CFSTR("com.apple.PerfPowerServices.data-read")))
    {
      v6 = objc_msgSend(v4, "copy");
      filepath = v5->_filepath;
      v5->_filepath = (NSURL *)v6;
    }
    else
    {
      PPSReaderLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_2439D9000, v8, OS_LOG_TYPE_DEFAULT, "[dispatcher] Invalid filepath for on-device reading. Overwriting...", v10, 2u);
      }

      filepath = v5->_filepath;
      v5->_filepath = 0;
    }

  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&unk_2514401D0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(&unk_2514401D0);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        -[PPSRequestDispatcher filepath](self, "filepath");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[PPSDataIngesterRegistry releaseDataIngesterForFilepath:requestType:](PPSDataIngesterRegistry, "releaseDataIngesterForFilepath:requestType:", v8, (int)objc_msgSend(v7, "intValue"));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_2514401D0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  v9.receiver = self;
  v9.super_class = (Class)PPSRequestDispatcher;
  -[PPSRequestDispatcher dealloc](&v9, sel_dealloc);
}

- (NSDateInterval)timelineBoundaries
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__PPSRequestDispatcher_timelineBoundaries__block_invoke;
  block[3] = &unk_25142C8A0;
  block[4] = self;
  if (timelineBoundaries_onceToken != -1)
    dispatch_once(&timelineBoundaries_onceToken, block);
  return (NSDateInterval *)(id)timelineBoundaries_timelineBoundaries;
}

void __42__PPSRequestDispatcher_timelineBoundaries__block_invoke(uint64_t a1)
{
  void *v2;
  int64_t v3;
  void *v4;
  void *v5;
  PPSTimeSeriesRequest *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  PPSTimeSeriesRequest *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;
  id v26;

  objc_msgSend(*(id *)(a1 + 32), "filepath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PPSDataIngesterCommonUtilities fileTypeForFilepath:](PPSDataIngesterCommonUtilities, "fileTypeForFilepath:", v2);

  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("timestamp"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PPSCreateSubsystemCategoryPredicate((uint64_t)CFSTR("PLBatteryAgent_EventBackward"), (uint64_t)CFSTR("Battery"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PPSTimeSeriesRequest initWithMetrics:predicate:timeFilter:]([PPSTimeSeriesRequest alloc], "initWithMetrics:predicate:timeFilter:", v4, v5, 0);
    v7 = *(void **)(a1 + 32);
    v26 = 0;
    objc_msgSend(v7, "dataForRequest:withError:", v6, &v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v26;
    if (v9 || (unint64_t)objc_msgSend(v8, "count") <= 1)
    {
      PPSCreateSubsystemCategoryPredicate((uint64_t)CFSTR("PLCoalitionAgent_EventInterval"), (uint64_t)CFSTR("CoalitionInterval"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = -[PPSTimeSeriesRequest initWithMetrics:predicate:timeFilter:]([PPSTimeSeriesRequest alloc], "initWithMetrics:predicate:timeFilter:", v4, v10, 0);
      v12 = *(void **)(a1 + 32);
      v25 = v9;
      objc_msgSend(v12, "dataForRequest:withError:", v11, &v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v25;

      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v15, v15);
        v17 = (void *)timelineBoundaries_timelineBoundaries;
        timelineBoundaries_timelineBoundaries = v16;

LABEL_9:
        return;
      }
      v8 = v13;
    }
    else
    {
      v13 = v8;
      v11 = v6;
      v10 = v5;
    }
    objc_msgSend(v8, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "monotonicTimestamp");
    v20 = v19;

    objc_msgSend(v8, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "monotonicTimestamp");
    v23 = v22;

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v20);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v14, v23 - v20);
    v15 = (void *)timelineBoundaries_timelineBoundaries;
    timelineBoundaries_timelineBoundaries = v24;
    goto LABEL_9;
  }
}

- (id)dataForRequest:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "subsystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPSRequestDispatcher _readerTypeForSubsystem:category:](self, "_readerTypeForSubsystem:category:", v7, v8);
  if (!v9)
  {
LABEL_6:
    -[PPSRequestDispatcher _executeRequest:withError:](self, "_executeRequest:withError:", v6, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v9 == 1)
  {
    PPSReaderLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PPSRequestDispatcher dataForRequest:withError:].cold.1(v10);

    goto LABEL_6;
  }
  if (a4)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0FC8];
    v15[0] = CFSTR("No available reader backend.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader.request"), 0, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_9:

  return a4;
}

- (id)_executeRequest:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id *v49;
  void *v50;
  void *v51;
  void *v52;
  PPSRequestDispatcher *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "subsystem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@:%@:%@"), CFSTR("QueryInitialization"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPSPerformanceProfiler sharedInstance](PPSPerformanceProfiler, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startProfilingForPhase:", v10);

  +[PPSRequestValidator sharedInstance](PPSRequestValidator, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSRequestDispatcher filepath](self, "filepath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "validateDataRequest:filepath:withError:", v6, v13, a4);

  if (v14)
  {
    objc_msgSend(v6, "subsystem");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "category");
    v16 = objc_claimAutoreleasedReturnValue();
    -[PPSRequestDispatcher filepath](self, "filepath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v17;
    v53 = self;
    v54 = (void *)v16;
    v55 = (void *)v15;
    if (v17)
    {
      -[PPSRequestDispatcher filepath](self, "filepath");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSOffDeviceIngesterUtilities allDataSourcesForFilepath:subsystem:category:](PPSOffDeviceIngesterUtilities, "allDataSourcesForFilepath:subsystem:category:");
    }
    else
    {
      +[PPSOnDeviceIngesterUtilities filepathForSubsystem:category:](PPSOnDeviceIngesterUtilities, "filepathForSubsystem:category:", v15, v16);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSOnDeviceIngesterUtilities allDataSourcesForSubsystem:category:](PPSOnDeviceIngesterUtilities, "allDataSourcesForSubsystem:category:", v15, v16);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metrics");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20
      || (v21 = (void *)v20,
          objc_msgSend(v6, "metrics"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "count"),
          v22,
          v21,
          !v23))
    {
      v49 = a4;
      v50 = v12;
      v51 = v6;
      v24 = (void *)objc_opt_new();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v25 = v19;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v58 != v28)
              objc_enumerationMutation(v25);
            +[PPSDataIngesterCommonUtilities columnNamesForFilepath:dataSource:](PPSDataIngesterCommonUtilities, "columnNamesForFilepath:dataSource:", v56, *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)objc_msgSend(v30, "mutableCopy");

            objc_msgSend(v31, "removeObject:", CFSTR("ID"));
            objc_msgSend(v31, "removeObject:", CFSTR("FK_ID"));
            objc_msgSend(v24, "addObjectsFromArray:", v31);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        }
        while (v27);
      }

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v51;
      objc_msgSend(v51, "setMetrics:", v32);

      v12 = v50;
      a4 = v49;
    }
    PPSReaderLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[PPSRequestDispatcher _executeRequest:withError:].cold.3((uint64_t)v19, v33, v34);

    PPSReaderLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[PPSRequestDispatcher _executeRequest:withError:].cold.2((uint64_t)v56, v35, v36);

    PPSReaderLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      -[PPSRequestDispatcher _executeRequest:withError:].cold.1(v6, v37);

    if (v19 && v56)
    {
      +[PPSPerformanceProfiler sharedInstance](PPSPerformanceProfiler, "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "endProfilingForPhase:", v10);

      +[PPSDataIngesterRegistry dataIngesterForFilepath:requestType:](PPSDataIngesterRegistry, "dataIngesterForFilepath:requestType:", v56, objc_msgSend(v6, "requestType"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39)
      {
        objc_msgSend(v39, "setShouldUseCache:", v52 != 0);
        objc_msgSend(v40, "setDispatcher:", v53);
        objc_msgSend(v40, "parseDataForRequest:outError:", v6, a4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

        goto LABEL_33;
      }
      if (a4)
      {
        v44 = (void *)MEMORY[0x24BDD1540];
        v45 = (void *)MEMORY[0x24BDBCE70];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Request type isn't supported."));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "dictionaryWithObject:forKey:", v46, *MEMORY[0x24BDD0FC8]);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader.request"), 2, v47);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (!a4)
      {
        v18 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v41 = (void *)MEMORY[0x24BDD1540];
      v42 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid data source."));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "dictionaryWithObject:forKey:", v40, *MEMORY[0x24BDD0FC8]);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PerfPowerServicesReader.request"), 5, v43);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v18 = 0;
    goto LABEL_32;
  }
  v18 = 0;
LABEL_34:

  return v18;
}

- (int64_t)_readerTypeForSubsystem:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[PPSRequestDispatcher filepath](self, "filepath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x2494FEED8]();
    v10 = (void *)MEMORY[0x24BE719D8];
    -[PPSRequestDispatcher filepath](self, "filepath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getMetadataHistoryForFilepath:subsystem:category:", v11, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "count") != 0;
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE719D8], "getMetadataForSubsystem:category:", v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14 != 0;

  }
  return !v13;
}

- (NSURL)filepath
{
  return self->_filepath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filepath, 0);
}

- (void)dataForRequest:(os_log_t)log withError:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2439D9000, log, OS_LOG_TYPE_DEBUG, "Reader fallback -- raw data to be returned", v1, 2u);
}

- (void)_executeRequest:(void *)a1 withError:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_2439D9000, a2, v4, "SELECT metrics: %@", (uint8_t *)&v5);

}

- (void)_executeRequest:(uint64_t)a3 withError:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_2439D9000, a2, a3, "Requested data path: %@", (uint8_t *)&v3);
}

- (void)_executeRequest:(uint64_t)a3 withError:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_2439D9000, a2, a3, "Requested data source: %@", (uint8_t *)&v3);
}

@end
