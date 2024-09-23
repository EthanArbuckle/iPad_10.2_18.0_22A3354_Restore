@implementation PPSOnDeviceIngesterUtilities

+ (id)dataSourceForSubsystem:(id)a3 category:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x2494FEED8]();
  objc_msgSend(MEMORY[0x24BE719D8], "getMetadataForSubsystem:category:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:](PPSDataIngesterCommonUtilities, "dataSourceForMetricDefinition:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v10;
}

+ (id)allDataSourcesForSubsystem:(id)a3 category:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x2494FEED8]();
  objc_msgSend(MEMORY[0x24BE719D8], "getMetadataForSubsystem:category:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    v9 = 0;
    goto LABEL_18;
  }
  v26 = v7;
  v27 = v6;
  v28 = v5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:](PPSDataIngesterCommonUtilities, "dataSourceForMetricDefinition:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v11);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v8;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v13)
    goto LABEL_16;
  v14 = v13;
  v15 = *(_QWORD *)v31;
  v16 = 0x24BDD1000uLL;
  v29 = v9;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v31 != v15)
        objc_enumerationMutation(v12);
      v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
      if (objc_msgSend(v18, "auxiliaryType") == 2)
      {
        objc_msgSend(*(id *)(v16 + 1992), "stringWithFormat:", CFSTR("%@_Dynamic"), v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        objc_msgSend(v9, "addObject:", v19);

        goto LABEL_12;
      }
      if (objc_msgSend(v18, "auxiliaryType") == 3 && !objc_msgSend(v18, "fixedArraySize"))
      {
        v20 = *(void **)(v16 + 1992);
        objc_msgSend(v18, "name");
        v21 = v16;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@_Array_%@"), v11, v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v21;
        v9 = v29;
        goto LABEL_9;
      }
LABEL_12:
      ++v17;
    }
    while (v14 != v17);
    v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v14 = v23;
  }
  while (v23);
LABEL_16:

  v6 = v27;
  v5 = v28;
  v8 = v25;
  v7 = v26;
LABEL_18:

  objc_autoreleasePoolPop(v7);
  return v9;
}

+ (id)filepathForMetricDefinition:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  switch(objc_msgSend(a3, "storage"))
  {
    case 1u:
      v3 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BE719E0], "containerPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("ExtendedPersistence/"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("CurrentLog.EPSQL");
      goto LABEL_8;
    case 2u:
      v10 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BE719E0], "containerPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("/Library/BatteryLife/"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("CurrentPowerlog.PLSQL"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileURLWithPath:isDirectory:", v7, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3u:
      v3 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BE719E0], "containerPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("CleanEnergy/"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("CurrentCleanEnergyDB.CESQL");
      goto LABEL_8;
    case 4u:
      v3 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BE719E0], "containerPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("XcodeOrganizer/"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("CurrentXcodeOrganizerDB.XCSQL");
      goto LABEL_8;
    case 5u:
      v3 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BE719E0], "containerPath");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("BackgroundProcessing/"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("CurrentBackgroundProcessingDB.BGSQL");
LABEL_8:
      objc_msgSend(v6, "stringByAppendingString:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "fileURLWithPath:isDirectory:", v11, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      break;
    default:
      v9 = 0;
      break;
  }
  return v9;
}

+ (id)filepathForSubsystem:(id)a3 category:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x2494FEED8]();
  objc_msgSend(MEMORY[0x24BE719D8], "getMetadataForSubsystem:category:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filepathForMetricDefinition:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v11;
}

+ (id)metricDefinitionForSubsystem:(id)a3 category:(id)a4 metricName:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x24BE719D8], "getMetadataForSubsystem:category:name:", a3, a4, a5);
}

+ (id)metricDefinitionHistoryForSubsystem:(id)a3 category:(id)a4 metricName:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BE719D8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "filepathForSubsystem:category:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getMetadataHistoryForFilepath:subsystem:category:name:", v11, v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
