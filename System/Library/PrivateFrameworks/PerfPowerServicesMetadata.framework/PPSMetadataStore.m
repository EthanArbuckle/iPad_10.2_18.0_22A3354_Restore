@implementation PPSMetadataStore

- (PPSMetadataStore)init
{
  PPSMetadataStore *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPSMetadataStore;
  v2 = -[PPSMetadataStore init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSMetadataStore setMetricsByID:](v2, "setMetricsByID:", v3);

  }
  return v2;
}

- (void)cachePlistMetricsForSubsystem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PPSStoreLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_24399D000, v5, OS_LOG_TYPE_INFO, "Constructing all client plist metrics for subsystem: %@", (uint8_t *)&v7, 0xCu);
  }

  +[PPSMetadataStore plistMetricsFromDir:forSubsystem:](PPSMetadataStore, "plistMetricsFromDir:forSubsystem:", CFSTR("/System/Library/PerfPowerTelemetry/MetadataReports/"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetadataStore addMetricsToCache:](self, "addMetricsToCache:", v6);

}

- (void)cacheFrameworkMetricsForSubsystem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PPSStoreLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_24399D000, v5, OS_LOG_TYPE_INFO, "Constructing all framework metrics for subsystem: %@", (uint8_t *)&v7, 0xCu);
  }

  +[PPSMetricManager allDeclMetricsForSubsystem:](PPSMetricManager, "allDeclMetricsForSubsystem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetadataStore addMetricsToCache:](self, "addMetricsToCache:", v6);

}

- (void)addMetricsToCache:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  objc_sync_enter(CFSTR("++metricsByIDSync++"));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__PPSMetadataStore_addMetricsToCache___block_invoke;
  v5[3] = &unk_25141D6D0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  objc_sync_exit(CFSTR("++metricsByIDSync++"));

}

+ (id)plistMetricsFromDir:(id)a3 forSubsystem:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v23 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v28))
    v7 = v28 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v6;
    objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PPSStoreLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[PPSMetadataStore plistMetricsFromDir:forSubsystem:].cold.1((uint64_t)v9, v10);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v9;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(obj);
          objc_msgSend(v5, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v16 = v5;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v17, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPSMetric metricsWithPlist:subsystem:](PPSMetric, "metricsWithPlist:subsystem:", v18, v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v19);

          v5 = v16;
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v13);
    }

    v6 = v21;
  }

  return v8;
}

- (id)getMetadataForSubsystem:(id)a3 category:(id)a4
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

  v6 = a3;
  v7 = a4;
  objc_sync_enter(CFSTR("++metricsByIDSync++"));
  -[PPSMetadataStore metricsByID](self, "metricsByID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_2;
  -[PPSMetadataStore loadMetricsForSubsystem:](self, "loadMetricsForSubsystem:", v6);
  -[PPSMetadataStore metricsByID](self, "metricsByID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_5;
  -[PPSMetadataStore metricsByID](self, "metricsByID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
LABEL_2:
    -[PPSMetadataStore metricsByID](self, "metricsByID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v12 = 0;
  }
  objc_sync_exit(CFSTR("++metricsByIDSync++"));

  return v12;
}

void __38__PPSMetadataStore_addMetricsToCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "subsystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metricsByID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metricsByID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "metricsByID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metricsByID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "metricsByID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(*(id *)(a1 + 32), "metricsByID");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v3, v24);

    goto LABEL_9;
  }
  PPSStoreLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = v4;
    v27 = 2112;
    v28 = v5;
    v29 = 2112;
    v30 = v22;
    _os_log_error_impl(&dword_24399D000, v21, OS_LOG_TYPE_ERROR, "Duplicate metric found with subsystem:%@, category:%@, name:%@", (uint8_t *)&v25, 0x20u);
LABEL_9:

  }
}

- (id)getMetadataForSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
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

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_sync_enter(CFSTR("++metricsByIDSync++"));
  -[PPSMetadataStore metricsByID](self, "metricsByID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_2;
  -[PPSMetadataStore loadMetricsForSubsystem:](self, "loadMetricsForSubsystem:", v8);
  -[PPSMetadataStore metricsByID](self, "metricsByID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_5;
  -[PPSMetadataStore metricsByID](self, "metricsByID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
LABEL_2:
    -[PPSMetadataStore metricsByID](self, "metricsByID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v16 = 0;
  }
  objc_sync_exit(CFSTR("++metricsByIDSync++"));

  return v16;
}

- (NSMutableDictionary)metricsByID
{
  return self->_metricsByID;
}

+ (id)sharedStore
{
  if (sharedStore_onceToken != -1)
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_4);
  return (id)sharedStore__sharedStore;
}

void __31__PPSMetadataStore_sharedStore__block_invoke()
{
  PPSMetadataStore *v0;
  void *v1;

  v0 = objc_alloc_init(PPSMetadataStore);
  v1 = (void *)sharedStore__sharedStore;
  sharedStore__sharedStore = (uint64_t)v0;

}

- (void)setMetricsByID:(id)a3
{
  objc_storeStrong((id *)&self->_metricsByID, a3);
}

- (void)loadMetricsForSubsystem:(id)a3
{
  id v4;

  v4 = a3;
  -[PPSMetadataStore cacheFrameworkMetricsForSubsystem:](self, "cacheFrameworkMetricsForSubsystem:", v4);
  -[PPSMetadataStore cachePlistMetricsForSubsystem:](self, "cachePlistMetricsForSubsystem:", v4);

}

- (void)buildDeviceMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__PPSMetadataStore_buildDeviceMetadata__block_invoke;
  block[3] = &unk_25141DA08;
  block[4] = self;
  if (buildDeviceMetadata_onceToken != -1)
    dispatch_once(&buildDeviceMetadata_onceToken, block);
}

uint64_t __39__PPSMetadataStore_buildDeviceMetadata__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cacheFrameworkMetrics");
  return objc_msgSend(*(id *)(a1 + 32), "cachePlistMetrics");
}

- (id)getAllSubsystem
{
  void *v2;
  void *v3;

  -[PPSMetadataStore metricsByID](self, "metricsByID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getAllFrameworkSubsystem
{
  return +[PPSMetricManager allDeclSubsystem](PPSMetricManager, "allDeclSubsystem");
}

- (id)getMetadataForSubsystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_sync_enter(CFSTR("++metricsByIDSync++"));
  -[PPSMetadataStore metricsByID](self, "metricsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[PPSMetadataStore loadMetricsForSubsystem:](self, "loadMetricsForSubsystem:", v4),
        -[PPSMetadataStore metricsByID](self, "metricsByID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", v4),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    -[PPSMetadataStore metricsByID](self, "metricsByID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_sync_exit(CFSTR("++metricsByIDSync++"));

  return v10;
}

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PPSPBMetric *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v32 = a5;
  v33 = v10;
  v31 = a6;
  +[PPSSQLMetadataStore queryMetadataHistoryForFilepath:subsystem:category:name:](PPSSQLMetadataStore, "queryMetadataHistoryForFilepath:subsystem:category:name:", v9, v10, v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v30 = v9;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v29 = v12;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x2494FE524]();
          objc_msgSend(v18, "allKeys");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21
            && (objc_msgSend(v18, "objectForKeyedSubscript:", v21),
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v22,
                v22))
          {
            v23 = [PPSPBMetric alloc];
            objc_msgSend(v18, "objectForKeyedSubscript:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[PPSPBMetric initWithData:](v23, "initWithData:", v24);

            +[PPSMetric metricWithProto:withBuild:](PPSMetric, "metricWithProto:withBuild:", v25, v21);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              objc_msgSend(v34, "addObject:", v26);
            }
            else
            {
              PPSStoreLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413058;
                v40 = v33;
                v41 = 2112;
                v42 = v32;
                v43 = 2112;
                v44 = v31;
                v45 = 2112;
                v46 = v21;
                _os_log_error_impl(&dword_24399D000, v27, OS_LOG_TYPE_ERROR, "Failed to decode metric: %@_%@_%@ for build: %@", buf, 0x2Au);
              }

            }
          }
          else
          {
            PPSStoreLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138413058;
              v40 = v33;
              v41 = 2112;
              v42 = v32;
              v43 = 2112;
              v44 = v31;
              v45 = 2112;
              v46 = v21;
              _os_log_error_impl(&dword_24399D000, v25, OS_LOG_TYPE_ERROR, "Failed to decode metric: %@_%@_%@ for build: %@", buf, 0x2Au);
            }
          }

          objc_autoreleasePoolPop(v19);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v15);
    }

    v12 = v29;
    v9 = v30;
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PPSPBMetric *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id obj;
  void *context;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v38 = a5;
  v39 = v8;
  +[PPSSQLMetadataStore queryMetadataHistoryForFilepath:subsystem:category:](PPSSQLMetadataStore, "queryMetadataHistoryForFilepath:subsystem:category:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v31 = v7;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v30 = v10;
    obj = v10;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v34)
    {
      v32 = *(_QWORD *)v46;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v46 != v32)
            objc_enumerationMutation(obj);
          v37 = v11;
          v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v11);
          context = (void *)MEMORY[0x2494FE524]();
          v40 = v12;
          objc_msgSend(obj, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v15 = v13;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v42 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
                objc_msgSend(v20, "allKeys", v30);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "firstObject");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22
                  && (objc_msgSend(v20, "objectForKeyedSubscript:", v22),
                      v23 = (void *)objc_claimAutoreleasedReturnValue(),
                      v23,
                      v23))
                {
                  v24 = [PPSPBMetric alloc];
                  objc_msgSend(v20, "objectForKeyedSubscript:", v22);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = -[PPSPBMetric initWithData:](v24, "initWithData:", v25);

                  +[PPSMetric metricWithProto:withBuild:](PPSMetric, "metricWithProto:withBuild:", v26, v22);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v27)
                  {
                    objc_msgSend(v14, "addObject:", v27);
                  }
                  else
                  {
                    PPSStoreLog();
                    v28 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138413058;
                      v50 = v39;
                      v51 = 2112;
                      v52 = v38;
                      v53 = 2112;
                      v54 = v40;
                      v55 = 2112;
                      v56 = v22;
                      _os_log_error_impl(&dword_24399D000, v28, OS_LOG_TYPE_ERROR, "Failed to decode metric: %@_%@_%@ for build: %@", buf, 0x2Au);
                    }

                  }
                }
                else
                {
                  PPSStoreLog();
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138413058;
                    v50 = v39;
                    v51 = 2112;
                    v52 = v38;
                    v53 = 2112;
                    v54 = v40;
                    v55 = 2112;
                    v56 = v22;
                    _os_log_error_impl(&dword_24399D000, v26, OS_LOG_TYPE_ERROR, "Failed to decode metric: %@_%@_%@ for build: %@", buf, 0x2Au);
                  }
                }

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
            }
            while (v17);
          }

          objc_msgSend(v33, "setObject:forKeyedSubscript:", v14, v40);
          objc_autoreleasePoolPop(context);
          v11 = v37 + 1;
        }
        while (v37 + 1 != v34);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
      }
      while (v34);
    }

    v10 = v30;
    v7 = v31;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)cacheFrameworkMetrics
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__PPSMetadataStore_cacheFrameworkMetrics__block_invoke;
  block[3] = &unk_25141DA08;
  block[4] = self;
  if (cacheFrameworkMetrics_onceToken != -1)
    dispatch_once(&cacheFrameworkMetrics_onceToken, block);
}

void __41__PPSMetadataStore_cacheFrameworkMetrics__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PPSStoreLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24399D000, v2, OS_LOG_TYPE_INFO, "Constructing all framework metrics", v4, 2u);
  }

  +[PPSMetricManager allDeclMetrics](PPSMetricManager, "allDeclMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addMetricsToCache:", v3);

}

- (void)cachePlistMetrics
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__PPSMetadataStore_cachePlistMetrics__block_invoke;
  block[3] = &unk_25141DA08;
  block[4] = self;
  if (cachePlistMetrics_onceToken != -1)
    dispatch_once(&cachePlistMetrics_onceToken, block);
}

void __37__PPSMetadataStore_cachePlistMetrics__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PPSStoreLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24399D000, v2, OS_LOG_TYPE_INFO, "Constructing all client plist metrics", v4, 2u);
  }

  +[PPSMetadataStore plistMetricsFromDir:](PPSMetadataStore, "plistMetricsFromDir:", CFSTR("/System/Library/PerfPowerTelemetry/MetadataReports/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addMetricsToCache:", v3);

}

+ (id)plistMetricsFromDir:(id)a3
{
  return +[PPSMetadataStore plistMetricsFromDir:forSubsystem:](PPSMetadataStore, "plistMetricsFromDir:forSubsystem:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsByID, 0);
}

+ (void)plistMetricsFromDir:(uint64_t)a1 forSubsystem:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_24399D000, a2, OS_LOG_TYPE_DEBUG, "Found following metadata reports: %@", (uint8_t *)&v2, 0xCu);
}

@end
