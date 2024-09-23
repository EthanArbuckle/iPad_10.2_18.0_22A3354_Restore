@implementation PPSOffDeviceIngesterUtilities

+ (id)dataSourceForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x2494FEED8]();
  objc_msgSend((id)objc_opt_class(), "metricDefinitionHistoriesForFilepath:subsystem:category:", v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:](PPSDataIngesterCommonUtilities, "dataSourceForMetricDefinition:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_autoreleasePoolPop(v10);
  return v15;
}

+ (id)allDataSourcesForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v11 = (void *)MEMORY[0x2494FEED8]();
  objc_msgSend((id)objc_opt_class(), "metricDefinitionHistoriesForFilepath:subsystem:category:", v7, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nextObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:](PPSDataIngesterCommonUtilities, "dataSourceForMetricDefinition:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    +[PPSDataIngesterCommonUtilities allTableNamesForMetadataHistory:withEntryKey:](PPSDataIngesterCommonUtilities, "allTableNamesForMetadataHistory:withEntryKey:", v12, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v10, "addObjectsFromArray:", v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v8, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "addObject:", v17);
  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v11);
  return v19;
}

uint64_t __78__PPSOffDeviceIngesterUtilities_allDataSourcesForFilepath_subsystem_category___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)metricDefinitionForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 metricName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "metricDefinitionHistoryForFilepath:subsystem:category:metricName:", v12, v11, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)metricDefinitionsForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 metricNames:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v26 = a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x2494FEED8]();
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("timestamp")) & 1) == 0)
        {
          objc_msgSend(a1, "metricDefinitionForFilepath:subsystem:category:metricName:", v25, v26, v9, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          PPSReaderLog();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v18)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v32 = v26;
              v33 = 2112;
              v34 = v9;
              v35 = 2112;
              v36 = v16;
              _os_log_debug_impl(&dword_2439D9000, v20, OS_LOG_TYPE_DEBUG, "Found metric definition for '%@::%@::%@'", buf, 0x20u);
            }

            objc_msgSend(v23, "setObject:forKeyedSubscript:", v18, v16);
          }
          else
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v32 = v26;
              v33 = 2112;
              v34 = v9;
              v35 = 2112;
              v36 = v16;
              _os_log_error_impl(&dword_2439D9000, v20, OS_LOG_TYPE_ERROR, "No metric definition found for '%@::%@::%@'", buf, 0x20u);
            }

          }
        }
        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v13);
  }

  v21 = (void *)objc_msgSend(v23, "copy");
  return v21;
}

+ (id)metricDefinitionHistoriesForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x24BE719D8], "getMetadataHistoryForFilepath:subsystem:category:", a3, a4, a5);
}

+ (id)metricDefinitionHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 metricName:(id)a6
{
  return (id)objc_msgSend(MEMORY[0x24BE719D8], "getMetadataHistoryForFilepath:subsystem:category:name:", a3, a4, a5, a6);
}

@end
