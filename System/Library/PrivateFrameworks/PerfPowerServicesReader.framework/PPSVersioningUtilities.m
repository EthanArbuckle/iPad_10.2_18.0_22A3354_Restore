@implementation PPSVersioningUtilities

+ (id)buildEventsWithFilepath:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke;
  block[3] = &unk_25142C8A0;
  v9 = v3;
  v4 = buildEventsWithFilepath__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&buildEventsWithFilepath__onceToken, block);
  v6 = (id)buildEventsWithFilepath__result;

  return v6;
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  PPSTimeSeriesRequest *v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;

  PPSReaderLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_5();

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = CFSTR("Build");
    +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:subsystem:category:metricName:](PPSOffDeviceIngesterUtilities, "metricDefinitionForFilepath:subsystem:category:metricName:", *(_QWORD *)(a1 + 32), CFSTR("ConfigMetrics"), CFSTR("DeviceConfig"), CFSTR("Build"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_11:
      v8 = (void *)v5;
      v9 = *(id *)(a1 + 32);
      goto LABEL_14;
    }
  }
  else
  {
    v4 = CFSTR("Build");
    +[PPSOnDeviceIngesterUtilities metricDefinitionForSubsystem:category:metricName:](PPSOnDeviceIngesterUtilities, "metricDefinitionForSubsystem:category:metricName:", CFSTR("ConfigMetrics"), CFSTR("DeviceConfig"), CFSTR("Build"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_13;
  }
  PPSReaderLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_4();

  if (v3)
  {
    v4 = CFSTR("build");
    +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:subsystem:category:metricName:](PPSOffDeviceIngesterUtilities, "metricDefinitionForFilepath:subsystem:category:metricName:", *(_QWORD *)(a1 + 32), CFSTR("PPTStorageOperator"), CFSTR("Config"), CFSTR("build"));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v4 = CFSTR("build");
  +[PPSOnDeviceIngesterUtilities metricDefinitionForSubsystem:category:metricName:](PPSOnDeviceIngesterUtilities, "metricDefinitionForSubsystem:category:metricName:", CFSTR("PPTStorageOperator"), CFSTR("Config"), CFSTR("build"));
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v8 = (void *)v6;
  +[PPSOnDeviceIngesterUtilities filepathForMetricDefinition:](PPSOnDeviceIngesterUtilities, "filepathForMetricDefinition:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v10 = v9;
  +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:](PPSDataIngesterCommonUtilities, "dataSourceForMetricDefinition:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
LABEL_20:
    +[PPSDataIngesterRegistry dataIngesterForFilepath:requestType:](PPSDataIngesterRegistry, "dataIngesterForFilepath:requestType:", v10, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PPSTimeSeriesRequest initWithMetrics:predicate:timeFilter:limitCount:offsetCount:readDirection:]([PPSTimeSeriesRequest alloc], "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:readDirection:", v17, 0, 0, 0, 0, 1);
    v24 = 0;
    -[NSObject parseDataForRequest:outError:](v16, "parseDataForRequest:outError:", v18, &v24);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v24;
    v21 = (void *)buildEventsWithFilepath__result;
    buildEventsWithFilepath__result = v19;

    PPSReaderLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_3();
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_2(v23);
    }

    goto LABEL_26;
  }
  v12 = +[PPSDataIngesterCommonUtilities fileTypeForFilepath:](PPSDataIngesterCommonUtilities, "fileTypeForFilepath:", v10);
  if (v12 == 2)
  {
    v13 = CFSTR("PPTStorageOperator");
    v14 = CFSTR("Config_1095_1");
    goto LABEL_19;
  }
  if (v12 == 1)
  {
    v13 = CFSTR("PLConfigAgent");
    v14 = CFSTR("EventNone_Config");
LABEL_19:
    +[PPSOffDeviceIngesterUtilities dataSourceForFilepath:subsystem:category:](PPSOffDeviceIngesterUtilities, "dataSourceForFilepath:subsystem:category:", v10, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
    goto LABEL_20;
  }
  PPSReaderLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_1();
LABEL_26:

}

+ (id)timelineWithFilepath:(id)a3 andMetrics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id obj;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (a1)
  {
    v30 = v7;
    +[PPSVersioningUtilities _groupMetricsByBuild:withFilepath:](PPSVersioningUtilities, "_groupMetricsByBuild:withFilepath:", v7, v6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v6;
    +[PPSTimestampConverterRegistry converterForFilepath:](PPSTimestampConverterRegistry, "converterForFilepath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v28 = v10;
    objc_msgSend(v10, "monotonicTimeFromEpochTime:");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = v9;
    objc_msgSend(v9, "reverseObjectEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
      do
      {
        v17 = 0;
        v18 = v13;
        do
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v17);
          objc_msgSend(v33, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_alloc(MEMORY[0x24BDD1508]);
          v22 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v19, "doubleValue");
          objc_msgSend(v22, "dateWithTimeIntervalSince1970:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v18, "doubleValue");
          objc_msgSend(v24, "dateWithTimeIntervalSince1970:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v21, "initWithStartDate:endDate:", v23, v25);

          objc_msgSend(v34, "setObject:forKeyedSubscript:", v20, v26);
          v13 = v19;

          ++v17;
          v18 = v13;
        }
        while (v15 != v17);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v15);
    }

    v7 = v30;
    v6 = v31;
  }

  return v34;
}

+ (id)_groupMetricsByBuild:(id)a3 withFilepath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;
  id obj;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  NSObject *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[4];
  uint64_t v64;
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v60;
    v52 = v6;
    v47 = *(_QWORD *)v60;
    do
    {
      v11 = 0;
      v48 = v9;
      do
      {
        if (*(_QWORD *)v60 != v10)
          objc_enumerationMutation(obj);
        v51 = v11;
        v12 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v11);
        objc_msgSend(v12, "subsystem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "category");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          +[PPSOffDeviceIngesterUtilities metricDefinitionHistoryForFilepath:subsystem:category:metricName:](PPSOffDeviceIngesterUtilities, "metricDefinitionHistoryForFilepath:subsystem:category:metricName:", v6, v13, v14, v15);
        else
          +[PPSOnDeviceIngesterUtilities metricDefinitionHistoryForSubsystem:category:metricName:](PPSOnDeviceIngesterUtilities, "metricDefinitionHistoryForSubsystem:category:metricName:", v13, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v54 = v16;
          v17 = -[NSObject countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
          if (v17)
          {
            v18 = v17;
            v50 = v16;
            v19 = *(_QWORD *)v56;
            v20 = v53;
            while (1)
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v56 != v19)
                  objc_enumerationMutation(v54);
                v22 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v21);
                objc_msgSend(v22, "build");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "objectForKeyedSubscript:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24)
                  goto LABEL_20;
                v25 = (void *)MEMORY[0x24BDD1758];
                objc_msgSend(v22, "build");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "build");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "predicateWithFormat:", CFSTR("(build == %@ OR Build == %@)"), v26, v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                +[PPSVersioningUtilities buildEventsWithFilepath:](PPSVersioningUtilities, "buildEventsWithFilepath:", v52);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "filteredTimeSeriesUsingPredicate:", v28);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                v31 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v30, "firstObject");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "monotonicTimestamp");
                objc_msgSend(v31, "numberWithDouble:");
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                PPSReaderLog();
                v34 = objc_claimAutoreleasedReturnValue();
                v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG);
                if (v33)
                {
                  if (v35)
                  {
                    objc_msgSend(v22, "build");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v67 = v40;
                    v68 = 2112;
                    v69 = v33;
                    _os_log_debug_impl(&dword_2439D9000, v34, OS_LOG_TYPE_DEBUG, "Found build timestamp for build '%@': '%@'", buf, 0x16u);

                  }
                  objc_msgSend(v22, "build");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "setObject:forKey:", v33, v36);

                  v20 = v53;
LABEL_20:
                  objc_msgSend(v22, "build");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "objectForKeyedSubscript:", v37);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v20, "objectForKeyedSubscript:", v28);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v38)
                  {
                    v39 = (void *)objc_opt_new();
                    objc_msgSend(v20, "setObject:forKeyedSubscript:", v39, v28);

                  }
                  objc_msgSend(v20, "objectForKeyedSubscript:", v28);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "name");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "setObject:forKeyedSubscript:", v22, v33);
                  goto LABEL_23;
                }
                if (v35)
                  +[PPSVersioningUtilities _groupMetricsByBuild:withFilepath:].cold.1(v63, v22, &v64, v34);

                v20 = v53;
LABEL_23:

                ++v21;
              }
              while (v18 != v21);
              v41 = -[NSObject countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
              v18 = v41;
              if (!v41)
              {
                v6 = v52;
                v10 = v47;
                v9 = v48;
                v16 = v50;
                v42 = v51;
                goto LABEL_33;
              }
            }
          }
          v42 = v51;
        }
        else
        {
          PPSReaderLog();
          v54 = objc_claimAutoreleasedReturnValue();
          v42 = v51;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "subsystem");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "category");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v67 = v43;
            v68 = 2112;
            v69 = v44;
            _os_log_error_impl(&dword_2439D9000, v54, OS_LOG_TYPE_ERROR, "No metric history found for '%@::%@'", buf, 0x16u);

          }
        }
LABEL_33:

        v11 = v42 + 1;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    }
    while (v9);
  }

  v45 = (void *)objc_msgSend(v53, "copy");
  return v45;
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_3_0(&dword_2439D9000, v0, v1, "Unknown reader file type while attempting to read build events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_2(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = buildEventsWithFilepath__result;
  _os_log_debug_impl(&dword_2439D9000, log, OS_LOG_TYPE_DEBUG, "Successfully read build events = %@", (uint8_t *)&v1, 0xCu);
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_3_0(&dword_2439D9000, v0, v1, "Failed to read build events!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_2439D9000, v0, v1, "Falling back to PPTStorageOperator for reading build events...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void __50__PPSVersioningUtilities_buildEventsWithFilepath___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_2439D9000, v0, v1, "Caching build events...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

+ (void)_groupMetricsByBuild:(_QWORD *)a3 withFilepath:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_2439D9000, a4, OS_LOG_TYPE_DEBUG, "Failed to find timestamp for build '%@', skipping...", a1, 0xCu);

}

@end
