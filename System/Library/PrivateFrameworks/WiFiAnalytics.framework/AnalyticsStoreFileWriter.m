@implementation AnalyticsStoreFileWriter

- (AnalyticsStoreFileWriter)init
{
  AnalyticsStoreFileWriter *v2;
  AnalyticsStoreMOHandler *v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)AnalyticsStoreFileWriter;
  v2 = -[AnalyticsStoreFileWriter init](&v6, sel_init);
  if (v2)
  {
    v3 = -[AnalyticsStoreMOHandler initWithType:options:]([AnalyticsStoreMOHandler alloc], "initWithType:options:", 0, 0);
    if (v3)
    {
      objc_storeStrong((id *)&v2->_managedObjectHandler, v3);
      -[AnalyticsStoreFileWriter initDateFormatter](v2, "initDateFormatter");
    }
    else
    {
      WALogCategoryDefaultHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v8 = "-[AnalyticsStoreFileWriter init]";
        v9 = 1024;
        v10 = 58;
        _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error getting managedObjectHandler", buf, 0x12u);
      }

      v2 = 0;
    }

  }
  return v2;
}

- (AnalyticsStoreFileWriter)initWithAnalyticsStore:(id)a3
{
  id v5;
  AnalyticsStoreFileWriter *v6;
  AnalyticsStoreFileWriter *v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AnalyticsStoreFileWriter;
  v6 = -[AnalyticsStoreFileWriter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_managedObjectHandler, a3);
      -[AnalyticsStoreFileWriter initDateFormatter](v7, "initDateFormatter");
    }
    else
    {
      WALogCategoryDefaultHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v12 = "-[AnalyticsStoreFileWriter initWithAnalyticsStore:]";
        v13 = 1024;
        v14 = 76;
        _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:storeMOHandler nil", buf, 0x12u);
      }

      v7 = 0;
    }
  }

  return v7;
}

- (void)initDateFormatter
{
  NSDateFormatter *v3;
  NSDateFormatter *dateFormatter;

  v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = v3;

  -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd HH':'mm':'ss'.'SSS"));
}

- (id)analyticsStoreFileWriterDirectory
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporaryDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterDirectory]";
      v18 = 1024;
      v19 = 113;
      v13 = "%{public}s::%d:tmpDirectory nil";
LABEL_12:
      _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
    }
LABEL_16:
    v5 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("com.apple.wifianalyticsd/AnalyticsStoreDump"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterDirectory]";
      v18 = 1024;
      v19 = 116;
      v13 = "%{public}s::%d:analyticsStoreDumpDirectory nil";
      goto LABEL_12;
    }
    goto LABEL_16;
  }
  v5 = v4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject path](v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, 0);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v15);
    v10 = v15;

    if (v10)
    {
      WALogCategoryDefaultHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v17 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterDirectory]";
        v18 = 1024;
        v19 = 124;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create wifianalytics tmp directory with error %@", buf, 0x1Cu);
      }

      v11 = v5;
      goto LABEL_16;
    }
  }
  WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v17 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterDirectory]";
    v18 = 1024;
    v19 = 126;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:analyticsStoreDumpDirectory: %@", buf, 0x1Cu);
  }
LABEL_7:

  return v5;
}

- (id)analyticsStoreFileWriterFilePath
{
  NSDateFormatter *dateFormatter;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  char v16;
  _BOOL4 v17;
  id v18;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  dateFormatter = self->_dateFormatter;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AnalyticsStoreDump_%@.txt"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AnalyticsStoreFileWriter analyticsStoreFileWriterDirectory](self, "analyticsStoreFileWriterDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WALogCategoryDefaultHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v28 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterFilePath]";
    v29 = 1024;
    v30 = 146;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:fileURL: %@", buf, 0x1Cu);
  }

  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterFilePath]";
      v29 = 1024;
      v30 = 149;
      v20 = "%{public}s::%d:fileName nil";
      v21 = v14;
      v22 = 18;
LABEL_15:
      _os_log_impl(&dword_212581000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
    }
LABEL_19:

    v18 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v13, "removeItemAtPath:error:", v10, &v26);
    v14 = v26;

    if (v14)
    {
      WALogCategoryDefaultHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[NSObject localizedDescription](v14, "localizedDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject userInfo](v14, "userInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136447234;
        v28 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterFilePath]";
        v29 = 1024;
        v30 = 154;
        v31 = 2112;
        v32 = v10;
        v33 = 2112;
        v34 = v24;
        v35 = 2112;
        v36 = v25;
        _os_log_impl(&dword_212581000, v23, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error deleting %@ %@ %@", buf, 0x30u);

      }
      goto LABEL_19;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "createFileAtPath:contents:attributes:", v10, 0, 0);

  WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if ((v16 & 1) == 0)
  {
    if (v17)
    {
      *(_DWORD *)buf = 136446722;
      v28 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterFilePath]";
      v29 = 1024;
      v30 = 160;
      v31 = 2112;
      v32 = v10;
      v20 = "%{public}s::%d:Error creating %@";
      v21 = v14;
      v22 = 28;
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  if (v17)
  {
    *(_DWORD *)buf = 136446722;
    v28 = "-[AnalyticsStoreFileWriter analyticsStoreFileWriterFilePath]";
    v29 = 1024;
    v30 = 163;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Will write to file: %@", buf, 0x1Cu);
  }

  v18 = v8;
LABEL_10:

  return v18;
}

- (id)writeDictionaryToJSONFile:(id)a3 network:(id)a4
{
  id v6;
  id v7;
  NSDateFormatter *dateFormatter;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v6) & 1) != 0)
  {
    dateFormatter = self->_dateFormatter;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DeploymentGraph_%@_%@.json"), v7, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    -[AnalyticsStoreFileWriter analyticsStoreFileWriterDirectory](self, "analyticsStoreFileWriterDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 3, &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;
    if (!v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);
      v19 = 0;
      objc_msgSend(v16, "writeToURL:atomically:encoding:error:", v13, 1, 4, &v19);
      v15 = v19;

      if (!v15)
      {

        goto LABEL_8;
      }
    }
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "-[AnalyticsStoreFileWriter writeDictionaryToJSONFile:network:]";
      v23 = 1024;
      v24 = 198;
      v25 = 2112;
      v26 = (const char *)v11;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to write to file %@ error %@", buf, 0x26u);
    }

  }
  else
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v22 = "-[AnalyticsStoreFileWriter writeDictionaryToJSONFile:network:]";
      v23 = 1024;
      v24 = 182;
      v25 = 2080;
      v26 = "-[AnalyticsStoreFileWriter writeDictionaryToJSONFile:network:]";
      _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Invalid data passed to JSON serialization", buf, 0x1Cu);
    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (id)writeArrayToJSONFile:(id)a3
{
  id v4;
  NSDateFormatter *dateFormatter;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v4) & 1) != 0)
  {
    dateFormatter = self->_dateFormatter;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DeploymentGraph_%@.json"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    -[AnalyticsStoreFileWriter analyticsStoreFileWriterDirectory](self, "analyticsStoreFileWriterDirectory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 3, &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;
    if (!v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v11, 4);
      v16 = 0;
      objc_msgSend(v13, "writeToURL:atomically:encoding:error:", v10, 1, 4, &v16);
      v12 = v16;

      if (!v12)
      {

        goto LABEL_8;
      }
    }
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "-[AnalyticsStoreFileWriter writeArrayToJSONFile:]";
      v20 = 1024;
      v21 = 236;
      v22 = 2112;
      v23 = (const char *)v8;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to write to file %@ error %@", buf, 0x26u);
    }

  }
  else
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v19 = "-[AnalyticsStoreFileWriter writeArrayToJSONFile:]";
      v20 = 1024;
      v21 = 220;
      v22 = 2080;
      v23 = "-[AnalyticsStoreFileWriter writeArrayToJSONFile:]";
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:%s: Invalid data passed to JSON serialization", buf, 0x1Cu);
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (id)writeDeploymentGraphToFile
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  -[AnalyticsStoreFileWriter managedObjectHandler](self, "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke;
  v7[3] = &unk_24CDDE6D8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[16];

  WALogCategoryDefaultHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "writeDeploymentGraphToFile", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[NetworkMO copyAllSsids:](NetworkMO, "copyAllSsids:", v4);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_50;
  v16 = &unk_24CDDE6B0;
  v17 = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v18 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v13);
  objc_msgSend(*(id *)(a1 + 32), "writeArrayToJSONFile:", v7, v13, v14, v15, v16, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  WALogCategoryDefaultHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "writeDeploymentGraphToFile", ", buf, 2u);
  }

}

void __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_50(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v9 = a2;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[BSSMO copyDeploymentUuidsForSsid:moc:](BSSMO, "copyDeploymentUuidsForSsid:moc:", v9, v4);

    if (v5)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_2;
      v10[3] = &unk_24CDDE688;
      v6 = v9;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      v11 = v6;
      v12 = v7;
      v13 = v8;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

    }
  }

}

void __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_2(id *a1, void *a2)
{
  int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NeighborGraph *v13;
  id v14;
  void *v15;
  NeighborGraph *v16;
  id v17;
  id v18;
  NeighborGraph *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *context;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  NeighborGraph *v39;

  v35 = a2;
  v3 = objc_msgSend(v35, "isMemberOfClass:", objc_opt_class());
  v4 = v35;
  if (v3)
  {
    v5 = v35;
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "UUIDString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = a1[4];
        objc_msgSend(a1[5], "managedObjectHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "managedObjectContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[BSSMO copyBssidsForDeployment:deploymentUuid:moc:](BSSMO, "copyBssidsForDeployment:deploymentUuid:moc:", v9, v8, v11);

        if (v12)
        {
          context = (void *)MEMORY[0x212BEF45C]();
          v13 = [NeighborGraph alloc];
          v14 = a1[4];
          objc_msgSend(a1[5], "managedObjectHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[NeighborGraph initWithBssidArray:ssid:handler:](v13, "initWithBssidArray:ssid:handler:", v12, v14, v15);

          v36[0] = MEMORY[0x24BDAC760];
          v36[1] = 3221225472;
          v36[2] = __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_3;
          v36[3] = &unk_24CDDE688;
          v17 = a1[4];
          v18 = a1[5];
          v37 = v17;
          v38 = v18;
          v19 = v16;
          v39 = v19;
          objc_msgSend(v12, "enumerateObjectsUsingBlock:", v36);
          v20 = -[NeighborGraph copyNeighborGraphAsDictionary](v19, "copyNeighborGraphAsDictionary");
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x24BDD17C8];
          v34 = v8;
          v23 = a1[4];
          objc_msgSend(v6, "UUIDString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@(%@)"), v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v25, CFSTR("deployment"));

          v26 = a1[4];
          objc_msgSend(a1[5], "managedObjectHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "managedObjectContext");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[JoinMO mostRecentJoin:ssid:moc:](JoinMO, "mostRecentJoin:ssid:moc:", 0, v26, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "bss");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "apid");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v34;
          if (objc_msgSend(v6, "isEqual:", v31))
            v32 = MEMORY[0x24BDBD1C8];
          else
            v32 = MEMORY[0x24BDBD1C0];
          objc_msgSend(v21, "setObject:forKey:", v32, CFSTR("isMostRecentlyUsedDeployment"));
          objc_msgSend(a1[6], "addObject:", v21);

          objc_autoreleasePoolPop(context);
        }

      }
    }

    v4 = v35;
  }

}

void __54__AnalyticsStoreFileWriter_writeDeploymentGraphToFile__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v3, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (int)objc_msgSend(v7, "channel") < 15;
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "bssid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "managedObjectHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[RoamMO dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:](RoamMO, "dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:", v9, v8, v10, 0, v12);

    +[BSSMO bssManagedObjectPropertyValue:forKey:](BSSMO, "bssManagedObjectPropertyValue:forKey:", v7, CFSTR("NeighborInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setNeighborsForBssid:dwellTime:neighborInfoArray:", v3, v13, v14);
    if (v14)
    {
      v28 = v7;
      v25 = v14;
      v26 = v3;
      v15 = v14;
      if (objc_msgSend(v15, "count"))
      {
        v16 = 0;
        v27 = v15;
        do
        {
          objc_msgSend(v15, "objectAtIndex:", v16, v25, v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          WALogCategoryDefaultHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v28, "bssid");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "valueForKey:", CFSTR("NeighborBssid"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiHigh"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiUpperHigh"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiOptimum"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiMid"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiUpperMid"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "valueForKey:", CFSTR("NeighborBssNumRoamOriginRssiLow"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136448514;
            v32 = "-[AnalyticsStoreFileWriter writeDeploymentGraphToFile]_block_invoke_3";
            v33 = 1024;
            v34 = 308;
            v35 = 2112;
            v36 = v29;
            v37 = 2112;
            v38 = v30;
            v39 = 2112;
            v40 = v19;
            v41 = 2112;
            v42 = v20;
            v43 = 2112;
            v44 = v21;
            v45 = 2112;
            v46 = v22;
            v47 = 2112;
            v48 = v23;
            v49 = 2112;
            v50 = v24;
            _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Source:%@ Neighbor:%@ LowRssiRoam (High:%@ UpperHigh:%@ Opt:%@ Mid:%@ UpperMid:%@ Low:%@)", buf, 0x62u);

            v15 = v27;
          }

          ++v16;
        }
        while (v16 < objc_msgSend(v15, "count"));
      }

      v14 = v25;
      v3 = v26;
      v7 = v28;
    }

  }
}

- (id)batchedWriteAnalyticsStoreToFileWithBatchSize:(unint64_t)a3 maxAge:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  -[AnalyticsStoreFileWriter managedObjectHandler](self, "managedObjectHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToFileWithBatchSize_maxAge___block_invoke;
  v11[3] = &unk_24CDDE700;
  v11[6] = a3;
  v11[7] = a4;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v8, "performBlockAndWait:", v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __81__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToFileWithBatchSize_maxAge___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  double v54;
  char v55;
  NSObject *v56;
  void *v57;
  double v58;
  NSObject *v59;
  void *v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  void *v67;
  double v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *context;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  id v92;
  id v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t v99[128];
  uint8_t buf[4];
  const char *v101;
  __int16 v102;
  int v103;
  __int16 v104;
  unint64_t v105;
  __int16 v106;
  double v107;
  _BYTE v108[128];
  uint64_t v109;

  v1 = a1;
  v109 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "analyticsStoreFileWriterFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    WALogCategoryDefaultHandle();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
      v102 = 1024;
      v103 = 363;
LABEL_57:
      _os_log_impl(&dword_212581000, v70, OS_LOG_TYPE_ERROR, "%{public}s::%d:fileHandle nil", buf, 0x12u);
    }
LABEL_58:

    v6 = 0;
    goto LABEL_62;
  }
  v4 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend(v2, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileHandleForWritingAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
      v102 = 1024;
      v103 = 366;
      goto LABEL_57;
    }
    goto LABEL_58;
  }
  v7 = *(_QWORD *)(v1 + 48);
  WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (!v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136446466;
      v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
      v102 = 1024;
      v103 = 368;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:batchSize is 0", buf, 0x12u);
    }

LABEL_62:
    v12 = 0;
LABEL_51:
    v69 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
    v65 = *(void **)(v69 + 40);
    *(_QWORD *)(v69 + 40) = 0;
    goto LABEL_52;
  }
  if (v9)
  {
    v10 = *(_QWORD *)(v1 + 48);
    *(_DWORD *)buf = 136446722;
    v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
    v102 = 1024;
    v103 = 370;
    v104 = 2048;
    v105 = v10;
    _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:batchSize is %lu", buf, 0x1Cu);
  }
  v80 = v1;
  v72 = v3;

  v71 = (void *)MEMORY[0x212BEF45C]();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  +[AnalyticsStoreProxy analyticsStoreEntityNames](AnalyticsStoreProxy, "analyticsStoreEntityNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
  v12 = 0;
  if (v83)
  {
    v82 = *(_QWORD *)v96;
    v73 = v11;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v96 != v82)
          objc_enumerationMutation(v11);
        v14 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x212BEF45C]();
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[GeoTagMO entityName](GeoTagMO, "entityName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v17))
        {

LABEL_14:
          objc_autoreleasePoolPop(v15);
          goto LABEL_37;
        }
        +[WiFiStatMO entityName](WiFiStatMO, "entityName");
        v84 = v15;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v14, "isEqualToString:", v18);

        v15 = v84;
        if ((v19 & 1) != 0)
          goto LABEL_14;
        objc_msgSend(*(id *)(v80 + 32), "stringifyObjectWithPadding:padding:padToLength:", v85, CFSTR("-"), objc_msgSend(v14, "length") + 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendFormat:", CFSTR("%@"), v20);

        v81 = (unint64_t)v14;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@\n%@|\n"), v16, v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "seekToEndOfFile");
        objc_msgSend(v21, "dataUsingEncoding:", 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = 0;
        objc_msgSend(v6, "writeData:error:", v22, &v94);
        v23 = v94;

        if (v23)
        {
          WALogCategoryDefaultHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          v11 = v73;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v23, "localizedDescription");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "userInfo");
            v68 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 136446978;
            v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
            v102 = 1024;
            v103 = 400;
            v104 = 2112;
            v105 = (unint64_t)v67;
            v106 = 2112;
            v107 = v68;
            _os_log_impl(&dword_212581000, v66, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

            v11 = v73;
          }

          objc_autoreleasePoolPop(v84);
          v12 = v23;
LABEL_50:

          objc_autoreleasePoolPop(v71);
          v3 = v72;
          v1 = v80;
          goto LABEL_51;
        }

        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (*(_QWORD *)(v80 + 56))
        {
          +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "copy");

        }
        else
        {
          v25 = 0;
        }
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        v27 = v26;
        objc_msgSend(*(id *)(v80 + 32), "managedObjectHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "managedObjectContext");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v14, v25, v29);

        objc_msgSend(*(id *)(v80 + 32), "relationshipKeyPathsForPrefetching:", v14);
        v76 = objc_claimAutoreleasedReturnValue();
        +[AnalyticsStoreProxy fetchRequestForEntityWithBatchSize:batchSize:prefetch:](AnalyticsStoreProxy, "fetchRequestForEntityWithBatchSize:batchSize:prefetch:", v14, *(_QWORD *)(v80 + 48));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v80 + 32), "managedObjectHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "managedObjectContext");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)v25;
        +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v31, v25, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        WALogCategoryDefaultHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v36 = COERCE_DOUBLE(objc_msgSend(v34, "count"));
          *(_DWORD *)buf = 136446978;
          v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
          v102 = 1024;
          v103 = 416;
          v104 = 2048;
          v105 = v30;
          v106 = 2048;
          v107 = v36;
          _os_log_impl(&dword_212581000, v35, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Total objects:%lu ResultCount:%lu", buf, 0x26u);
        }

        v37 = v84;
        if (!v34)
        {
          v41 = 0;
          v78 = 0;
          v52 = (void *)v76;
          v51 = v77;
LABEL_33:
          WALogCategoryDefaultHandle();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
            *(_DWORD *)buf = 136446978;
            v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
            v102 = 1024;
            v103 = 447;
            v104 = 2112;
            v105 = v81;
            v106 = 2048;
            v107 = v54 - v27;
            _os_log_impl(&dword_212581000, v53, OS_LOG_TYPE_ERROR, "%{public}s::%d: %@ Took %fs", buf, 0x26u);
          }

          v12 = 0;
          v55 = 1;
          goto LABEL_36;
        }
        v38 = (void *)MEMORY[0x212BEF45C]();
        v39 = *(void **)(v80 + 32);
        v92 = 0;
        v93 = 0;
        objc_msgSend(v39, "stringifyManagedObjectsArray:titleString:dataStringsArray:", v34, &v93, &v92);
        v40 = v93;
        v41 = v92;
        objc_msgSend(*(id *)(v80 + 32), "stringifyObjectWithPadding:padding:padToLength:", v85, CFSTR("-"), objc_msgSend(v40, "length"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "appendFormat:", CFSTR("%@"), v42);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@\n%@\n"), v79, v40, v79);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "seekToEndOfFile");
        objc_msgSend(v43, "dataUsingEncoding:", 4);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 0;
        objc_msgSend(v6, "writeData:error:", v44, &v91);
        v12 = v91;

        v78 = v43;
        if (!v12)
        {
          context = v38;
          v75 = v34;
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          v41 = v41;
          v45 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v88;
            while (2)
            {
              for (i = 0; i != v46; ++i)
              {
                if (*(_QWORD *)v88 != v47)
                  objc_enumerationMutation(v41);
                objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "stringByAppendingString:", CFSTR("\n"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "seekToEndOfFile");
                objc_msgSend(v49, "dataUsingEncoding:", 4);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v86 = 0;
                objc_msgSend(v6, "writeData:error:", v50, &v86);
                v12 = v86;

                if (v12)
                {
                  WALogCategoryDefaultHandle();
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v12, "localizedDescription");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "userInfo");
                    v58 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    *(_DWORD *)buf = 136446978;
                    v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
                    v102 = 1024;
                    v103 = 442;
                    v104 = 2112;
                    v105 = (unint64_t)v57;
                    v106 = 2112;
                    v107 = v58;
                    _os_log_impl(&dword_212581000, v56, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

                  }
                  objc_autoreleasePoolPop(context);
                  v55 = 0;
                  v37 = v84;
                  v52 = (void *)v76;
                  v51 = v77;
                  v34 = v75;
                  goto LABEL_36;
                }

              }
              v46 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
              if (v46)
                continue;
              break;
            }
          }

          objc_autoreleasePoolPop(context);
          v37 = v84;
          v52 = (void *)v76;
          v51 = v77;
          v34 = v75;
          goto LABEL_33;
        }
        WALogCategoryDefaultHandle();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "localizedDescription");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "userInfo");
          v61 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 136446978;
          v101 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFileWithBatchSize:maxAge:]_block_invoke";
          v102 = 1024;
          v103 = 431;
          v104 = 2112;
          v105 = (unint64_t)v60;
          v106 = 2112;
          v107 = v61;
          _os_log_impl(&dword_212581000, v59, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

        }
        objc_autoreleasePoolPop(v38);
        v55 = 0;
        v37 = v84;
        v52 = (void *)v76;
        v51 = v77;
LABEL_36:

        objc_autoreleasePoolPop(v37);
        v11 = v73;
        if ((v55 & 1) == 0)
          goto LABEL_50;
LABEL_37:
        ++v13;
      }
      while (v13 != v83);
      v62 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v95, v108, 16);
      v83 = v62;
    }
    while (v62);
  }

  objc_autoreleasePoolPop(v71);
  objc_msgSend(v6, "closeFile");
  objc_msgSend(v3, "path");
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = *(_QWORD *)(*(_QWORD *)(v80 + 40) + 8);
  v65 = *(void **)(v64 + 40);
  *(_QWORD *)(v64 + 40) = v63;
LABEL_52:

}

- (id)batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:(unint64_t)a3 maxAge:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[AnalyticsStoreFileWriter managedObjectHandler](self, "managedObjectHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToCSVFilesWithBatchSize_maxAge___block_invoke;
  v11[3] = &unk_24CDDE700;
  v11[6] = a3;
  v11[7] = a4;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v8, "performBlockAndWait:", v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __85__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToCSVFilesWithBatchSize_maxAge___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _UNKNOWN **v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id obj;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistenceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = a1;
  objc_msgSend(*(id *)(a1 + 32), "analyticsStoreFileWriterFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v59 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:maxAge:]_block_invoke";
      v60 = 1024;
      v61 = 479;
      v44 = "%{public}s::%d:fileURL nil";
LABEL_34:
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, v44, buf, 0x12u);
    }
LABEL_35:

    v49 = 0;
    v39 = 0;
    goto LABEL_28;
  }
  v8 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileHandleForWritingAtPath:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v59 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:maxAge:]_block_invoke";
      v60 = 1024;
      v61 = 482;
      v44 = "%{public}s::%d:fileHandle nil";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  v46 = (void *)v10;
  v47 = v7;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(v52 + 48);
    v14 = *(_QWORD *)(v52 + 56);
    *(_DWORD *)buf = 136446978;
    v59 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:maxAge:]_block_invoke";
    v60 = 1024;
    v61 = 484;
    v62 = 2048;
    v63 = v13;
    v64 = 2048;
    v65 = v14;
    _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:batchSize is %lu, maxAge is %lu days ago", buf, 0x26u);
  }

  v15 = *(void **)(*(_QWORD *)(v52 + 32) + 8);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromDate:", v16);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v45 = v5;
  obj = v5;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v54;
    v20 = &off_24CDDB000;
    v48 = *(_QWORD *)v54;
    do
    {
      v21 = 0;
      v50 = v18;
      do
      {
        if (*(_QWORD *)v54 != v19)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v21);
        objc_msgSend(v22, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20[28], "entityName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqualToString:", v24);

        if ((v25 & 1) == 0)
        {
          WALogCategoryDefaultHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v26))
          {
            v27 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
            *(_DWORD *)buf = 136315138;
            v59 = (const char *)v27;
            _os_signpost_emit_with_name_impl(&dword_212581000, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CSV Export", "%s", buf, 0xCu);
          }

          v29 = *(_QWORD *)(v52 + 48);
          v28 = *(_QWORD *)(v52 + 56);
          objc_msgSend(*(id *)(v52 + 32), "analyticsStoreFileWriterDirectory");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = *(_QWORD **)(v52 + 32);
          v32 = v31[1];
          objc_msgSend(v31, "managedObjectHandler");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "managedObjectContext");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[AnalyticsStoreFileWriter exportEntityToCSV:batchSize:maxAge:toURL:fileDate:dateFormatter:inManagedObjectContext:](AnalyticsStoreFileWriter, "exportEntityToCSV:batchSize:maxAge:toURL:fileDate:dateFormatter:inManagedObjectContext:", v22, v29, v28, v30, v49, v32, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            WALogCategoryDefaultHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v59 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:maxAge:]_block_invoke";
              v60 = 1024;
              v61 = 503;
              v62 = 2112;
              v63 = (uint64_t)v35;
              _os_log_impl(&dword_212581000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Wrote CSV file %@", buf, 0x1Cu);
            }

            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v52 + 40) + 8) + 40), "addObject:", v35);
          }
          WALogCategoryDefaultHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          v19 = v48;
          v18 = v50;
          v20 = &off_24CDDB000;
          if (os_signpost_enabled(v37))
          {
            v38 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
            *(_DWORD *)buf = 136315138;
            v59 = (const char *)v38;
            _os_signpost_emit_with_name_impl(&dword_212581000, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CSV Export", "%s", buf, 0xCu);
          }

        }
        ++v21;
      }
      while (v18 != v21);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v18);
  }

  v39 = v46;
  objc_msgSend(v46, "closeFile");
  v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(v52 + 40) + 8) + 40);
  if (!v40)
  {
    v5 = v45;
    v7 = v47;
LABEL_28:
    v43 = *(_QWORD *)(*(_QWORD *)(v52 + 40) + 8);
    v41 = *(NSObject **)(v43 + 40);
    *(_QWORD *)(v43 + 40) = 0;
    goto LABEL_29;
  }
  v7 = v47;
  if (!objc_msgSend(v40, "count"))
  {
    v5 = v45;
    goto LABEL_28;
  }
  WALogCategoryDefaultHandle();
  v41 = objc_claimAutoreleasedReturnValue();
  v5 = v45;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v52 + 40) + 8) + 40), "count");
    *(_DWORD *)buf = 136446722;
    v59 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToCSVFilesWithBatchSize:maxAge:]_block_invoke";
    v60 = 1024;
    v61 = 512;
    v62 = 2048;
    v63 = v42;
    _os_log_impl(&dword_212581000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Total CSVs written %lu", buf, 0x1Cu);
  }
LABEL_29:

}

- (id)batchedWriteAnalyticsStoreToFile:(unint64_t)a3 maxAge:(unint64_t)a4
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  -[AnalyticsStoreFileWriter managedObjectHandler](self, "managedObjectHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToFile_maxAge___block_invoke;
  v11[3] = &unk_24CDDE700;
  v11[6] = a3;
  v11[7] = a4;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v8, "performBlockAndWait:", v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __68__AnalyticsStoreFileWriter_batchedWriteAnalyticsStoreToFile_maxAge___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _UNKNOWN **v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  double v36;
  NSObject *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  NSObject *v41;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t j;
  void *v79;
  void *v80;
  NSObject *v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  double v89;
  uint64_t v90;
  NSObject *v91;
  NSObject *v92;
  void *v93;
  double v94;
  NSObject *v95;
  void *v96;
  double v97;
  void *v98;
  double v99;
  void *v100;
  double v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  unint64_t v106;
  char v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  unint64_t v115;
  void *context;
  void *v117;
  char *v118;
  id v119;
  char *v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  NSObject *v126;
  id v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  id v133;
  NSObject *v134;
  id v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  uint8_t v142[128];
  uint8_t buf[4];
  const char *v144;
  __int16 v145;
  int v146;
  __int16 v147;
  unint64_t v148;
  __int16 v149;
  double v150;
  _BYTE v151[128];
  uint64_t v152;

  v1 = a1;
  v152 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "analyticsStoreFileWriterFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      v145 = 1024;
      v146 = 538;
LABEL_95:
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:fileHandle nil", buf, 0x12u);
    }
LABEL_96:
    v6 = 0;
LABEL_97:
    v26 = 0;
    goto LABEL_77;
  }
  v4 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend(v2, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileHandleForWritingAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      v145 = 1024;
      v146 = 541;
      goto LABEL_95;
    }
    goto LABEL_96;
  }
  v7 = *(_QWORD *)(v1 + 48);
  WALogCategoryDefaultHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (!v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136446466;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      v145 = 1024;
      v146 = 543;
      _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchLimit is 0", buf, 0x12u);
    }
    goto LABEL_97;
  }
  if (v9)
  {
    v10 = *(_QWORD *)(v1 + 48);
    *(_DWORD *)buf = 136446722;
    v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
    v145 = 1024;
    v146 = 545;
    v147 = 2048;
    v148 = v10;
    _os_log_impl(&dword_212581000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetchLimit is %lu", buf, 0x1Cu);
  }

  WALogCategoryDefaultHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreToFile", ", buf, 2u);
  }

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  +[AnalyticsStoreProxy analyticsStoreEntityNames](AnalyticsStoreProxy, "analyticsStoreEntityNames");
  v12 = objc_claimAutoreleasedReturnValue();
  v109 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v137, v151, 16);
  if (!v109)
  {
LABEL_72:

    objc_msgSend(v6, "closeFile");
    objc_msgSend(v3, "path");
    v83 = objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v84 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
    v85 = *(void **)(v84 + 40);
    *(_QWORD *)(v84 + 40) = v83;
    goto LABEL_78;
  }
  v110 = *(_QWORD *)v138;
  v114 = v1;
  v100 = v3;
  v102 = v12;
LABEL_10:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v138 != v110)
      objc_enumerationMutation(v12);
    v14 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v13);
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[GeoTagMO entityName](GeoTagMO, "entityName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", v17) & 1) != 0)
    {
      v18 = 0;
      v19 = 0;
LABEL_69:

      goto LABEL_70;
    }
    +[WiFiStatMO entityName](WiFiStatMO, "entityName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    v22 = objc_msgSend(v14, "isEqualToString:", v20);

    if ((v22 & 1) == 0)
      break;
    v18 = 0;
    v19 = 0;
    v12 = v102;
LABEL_70:

    if (++v13 == v109)
    {
      v3 = v100;
      v109 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v137, v151, 16);
      if (!v109)
        goto LABEL_72;
      goto LABEL_10;
    }
  }
  v104 = v15;
  objc_msgSend(*(id *)(v1 + 32), "stringifyObjectWithPadding:padding:padToLength:", v15, CFSTR("-"), objc_msgSend(v21, "length") + 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("%@"), v23);

  v117 = v21;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@\n%@|\n"), v16, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "seekToEndOfFile");
  objc_msgSend(v24, "dataUsingEncoding:", 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = 0;
  objc_msgSend(v6, "writeData:error:", v25, &v136);
  v26 = v136;

  if (v26)
  {
    WALogCategoryDefaultHandle();
    v95 = objc_claimAutoreleasedReturnValue();
    v8 = v102;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v26, "localizedDescription");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "userInfo");
      v97 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446978;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      v145 = 1024;
      v146 = 572;
      v147 = 2112;
      v148 = (unint64_t)v96;
      v149 = 2112;
      v150 = v97;
      _os_log_impl(&dword_212581000, v95, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

      v1 = v114;
    }

    v3 = v100;
    goto LABEL_77;
  }

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(v1 + 56))
  {
    v27 = &off_24CDDB000;
    +[AnalyticsStoreProxy predicateForEntityWithAge:maxAge:](AnalyticsStoreProxy, "predicateForEntityWithAge:maxAge:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");

  }
  else
  {
    v29 = 0;
    v27 = &off_24CDDB000;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v31 = v30;
  objc_msgSend(*(id *)(v1 + 32), "managedObjectHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "managedObjectContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v21, v29, v33);

  v35 = *(_QWORD *)(v1 + 48);
  v115 = v35;
  if (v34 > v35)
    *(_QWORD *)&v36 = v34 % v35;
  else
    v36 = 0.0;
  WALogCategoryDefaultHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
    v145 = 1024;
    v146 = 591;
    v147 = 2048;
    v148 = v34;
    v149 = 2048;
    v150 = v36;
    _os_log_impl(&dword_212581000, v37, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Total objects:%lu Remainder:%lu", buf, 0x26u);
  }
  v111 = (void *)v29;

  objc_msgSend(*(id *)(v1 + 32), "relationshipKeyPathsForPrefetching:", v117);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v36;
  v105 = v38;
  v106 = v34 - *(_QWORD *)&v36;
  if (v34 == *(_QWORD *)&v36)
  {
    v39 = 0;
    v18 = 0;
    v40 = 0;
LABEL_28:
    v112 = v40;
    WALogCategoryDefaultHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      *(_DWORD *)buf = 136446978;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      v145 = 1024;
      v146 = 632;
      v147 = 2112;
      v148 = (unint64_t)v117;
      v149 = 2048;
      v150 = v42 - v31;
      _os_log_impl(&dword_212581000, v41, OS_LOG_TYPE_ERROR, "%{public}s::%d: %@ Took %fs", buf, 0x26u);
    }

    v43 = objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v45 = v44;
    if (v101 == 0.0)
    {
      v12 = v102;
    }
    else
    {
      context = (void *)MEMORY[0x212BEF45C](v43);
      v46 = v27[21];
      v118 = (char *)v39;
      objc_msgSend(v46, "fetchRequestForEntityWithOffset:limit:offset:prefetch:", v117, v115, v39, v38);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 32), "managedObjectHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "managedObjectContext");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "fetch:withPredicate:moc:", v47, v111, v49);
      v50 = objc_claimAutoreleasedReturnValue();

      v51 = (void *)v50;
      if (v50)
      {
        WALogCategoryDefaultHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
          v145 = 1024;
          v146 = 639;
          v147 = 2048;
          v148 = (unint64_t)v118;
          v149 = 2048;
          *(_QWORD *)&v150 = &v118[*(_QWORD *)&v101];
          _os_log_impl(&dword_212581000, v52, OS_LOG_TYPE_ERROR, "%{public}s::%d:Processing managed objects %lu through %lu", buf, 0x26u);
        }

        v53 = *(void **)(v1 + 32);
        v126 = v18;
        v127 = v112;
        v108 = v51;
        objc_msgSend(v53, "stringifyManagedObjectsArray:titleString:dataStringsArray:", v51, &v127, &v126);
        v119 = v127;

        v54 = v126;
        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        v18 = v54;
        v55 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v122, v141, 16);
        if (v55)
        {
          v56 = v55;
          v57 = *(_QWORD *)v123;
          while (2)
          {
            for (i = 0; i != v56; ++i)
            {
              if (*(_QWORD *)v123 != v57)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * i), "stringByAppendingString:", CFSTR("\n"));
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "seekToEndOfFile");
              objc_msgSend(v59, "dataUsingEncoding:", 4);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v121 = 0;
              objc_msgSend(v6, "writeData:error:", v60, &v121);
              v26 = v121;

              if (v26)
              {
                WALogCategoryDefaultHandle();
                v92 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v26, "localizedDescription");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "userInfo");
                  v94 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                  *(_DWORD *)buf = 136446978;
                  v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
                  v145 = 1024;
                  v146 = 650;
                  v147 = 2112;
                  v148 = (unint64_t)v93;
                  v149 = 2112;
                  v150 = v94;
                  _os_log_impl(&dword_212581000, v92, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

                }
                v71 = v18;
                v113 = v119;
                v3 = v100;
                v1 = v114;
                goto LABEL_84;
              }

            }
            v56 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v122, v141, 16);
            if (v56)
              continue;
            break;
          }
        }

        v112 = v119;
        v1 = v114;
        v12 = v102;
        v38 = v105;
        v51 = v108;
      }
      else
      {
        v12 = v102;
      }

      objc_autoreleasePoolPop(context);
    }
    v15 = v104;
    v17 = v111;
    WALogCategoryDefaultHandle();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      *(_DWORD *)buf = 136446978;
      v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
      v145 = 1024;
      v146 = 656;
      v147 = 2112;
      v148 = (unint64_t)v117;
      v149 = 2048;
      v150 = v82 - v45;
      _os_log_impl(&dword_212581000, v81, OS_LOG_TYPE_ERROR, "%{public}s::%d: %@ reminder took %fs", buf, 0x26u);
    }

    v16 = v103;
    v19 = v112;
    goto LABEL_69;
  }
  v61 = 0;
  v18 = 0;
  v107 = 0;
  v39 = 0;
  while (1)
  {
    context = (void *)MEMORY[0x212BEF45C]();
    v62 = v27[21];
    v120 = (char *)v39;
    objc_msgSend(v62, "fetchRequestForEntityWithOffset:limit:offset:prefetch:", v117, v115, v39, v38);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 32), "managedObjectHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "managedObjectContext");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "fetch:withPredicate:moc:", v63, v111, v65);
    v66 = objc_claimAutoreleasedReturnValue();

    v67 = (void *)v66;
    if (v66)
      break;
    v40 = v61;
    v39 = (unint64_t)v120;
LABEL_61:

    objc_autoreleasePoolPop(context);
    v1 = v114;
    v27 = &off_24CDDB000;
    if (v39 >= v106)
      goto LABEL_28;
  }
  WALogCategoryDefaultHandle();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
    v145 = 1024;
    v146 = 599;
    v147 = 2048;
    v148 = (unint64_t)v120;
    v149 = 2048;
    *(_QWORD *)&v150 = &v120[v115 - 1];
    _os_log_impl(&dword_212581000, v68, OS_LOG_TYPE_ERROR, "%{public}s::%d:Processing managed objects %lu through %lu", buf, 0x26u);
  }

  v1 = v114;
  v69 = *(void **)(v114 + 32);
  v134 = v18;
  v135 = v61;
  v108 = v67;
  objc_msgSend(v69, "stringifyManagedObjectsArray:titleString:dataStringsArray:", v67, &v135, &v134);
  v70 = v135;

  v71 = v134;
  if ((v107 & 1) != 0)
  {
    v113 = v70;
LABEL_52:
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v18 = v71;
    v75 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v129, v142, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v130;
      while (2)
      {
        for (j = 0; j != v76; ++j)
        {
          if (*(_QWORD *)v130 != v77)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * j), "stringByAppendingString:", CFSTR("\n"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "seekToEndOfFile");
          objc_msgSend(v79, "dataUsingEncoding:", 4);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = 0;
          objc_msgSend(v6, "writeData:error:", v80, &v128);
          v26 = v128;

          if (v26)
          {
            WALogCategoryDefaultHandle();
            v86 = objc_claimAutoreleasedReturnValue();
            v87 = v111;
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v26, "localizedDescription");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "userInfo");
              v89 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              *(_DWORD *)buf = 136446978;
              v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
              v145 = 1024;
              v146 = 626;
              v147 = 2112;
              v148 = (unint64_t)v88;
              v149 = 2112;
              v150 = v89;
              _os_log_impl(&dword_212581000, v86, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

            }
            v71 = v18;
            v3 = v100;
            v1 = v114;
            v8 = v102;
            goto LABEL_76;
          }

        }
        v76 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v129, v142, 16);
        if (v76)
          continue;
        break;
      }
    }
    v39 = (unint64_t)&v120[v115];

    v107 = 1;
    v40 = v113;
    v61 = v113;
    v38 = v105;
    v67 = v108;
    goto LABEL_61;
  }
  objc_msgSend(*(id *)(v114 + 32), "stringifyObjectWithPadding:padding:padToLength:", v104, CFSTR("-"), objc_msgSend(v70, "length"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "appendFormat:", CFSTR("%@"), v72);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@\n%@\n"), v103, v70, v103);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "seekToEndOfFile");
  objc_msgSend(v73, "dataUsingEncoding:", 4);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = 0;
  objc_msgSend(v6, "writeData:error:", v74, &v133);
  v26 = v133;

  if (!v26)
  {
    v113 = v73;
    goto LABEL_52;
  }
  WALogCategoryDefaultHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v26, "localizedDescription");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "userInfo");
    v99 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446978;
    v144 = "-[AnalyticsStoreFileWriter batchedWriteAnalyticsStoreToFile:maxAge:]_block_invoke";
    v145 = 1024;
    v146 = 613;
    v147 = 2112;
    v148 = (unint64_t)v98;
    v149 = 2112;
    v150 = v99;
    _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

  }
  v113 = v73;
  v3 = v100;
LABEL_84:
  v8 = v102;
  v87 = v111;
LABEL_76:

  objc_autoreleasePoolPop(context);
LABEL_77:

  v90 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
  v85 = *(void **)(v90 + 40);
  *(_QWORD *)(v90 + 40) = 0;
LABEL_78:

  WALogCategoryDefaultHandle();
  v91 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v91))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, v91, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsStoreToFile", ", buf, 2u);
  }

}

- (id)writeAnalyticsStoreToFile
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  -[AnalyticsStoreFileWriter managedObjectHandler](self, "managedObjectHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__AnalyticsStoreFileWriter_writeAnalyticsStoreToFile__block_invoke;
  v7[3] = &unk_24CDDE6D8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __53__AnalyticsStoreFileWriter_writeAnalyticsStoreToFile__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _UNKNOWN **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  NSObject *v43;
  double v44;
  void *v45;
  double v46;
  int v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  double v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  NSObject *obj;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  id v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t v88[128];
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  int v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  double v96;
  _BYTE v97[128];
  uint64_t v98;

  v1 = a1;
  v98 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "analyticsStoreFileWriterFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    WALogCategoryDefaultHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_DWORD *)buf = 136446466;
    v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
    v91 = 1024;
    v92 = 687;
    goto LABEL_50;
  }
  v4 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend(v2, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileHandleForWritingAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v64 = v3;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    +[AnalyticsStoreProxy analyticsStoreEntityNames](AnalyticsStoreProxy, "analyticsStoreEntityNames");
    v7 = objc_claimAutoreleasedReturnValue();
    v72 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
    v8 = 0;
    if (!v72)
      goto LABEL_38;
    v71 = *(_QWORD *)v85;
    v9 = &off_24CDDB000;
    obj = v7;
    v65 = v1;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v85 != v71)
          objc_enumerationMutation(obj);
        v74 = v10;
        v11 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[GeoTagMO entityName](GeoTagMO, "entityName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v14))
        {

LABEL_11:
          goto LABEL_32;
        }
        objc_msgSend(v9[154], "entityName");
        v73 = v12;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v11, "isEqualToString:", v15);

        v12 = v73;
        if ((v16 & 1) != 0)
          goto LABEL_11;
        objc_msgSend(*(id *)(v1 + 32), "stringifyObjectWithPadding:padding:padToLength:", v73, CFSTR("-"), objc_msgSend(v11, "length") + 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("%@"), v17);

        v18 = v1;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@\n%@|\n"), v13, v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "seekToEndOfFile");
        objc_msgSend(v19, "dataUsingEncoding:", 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = 0;
        objc_msgSend(v6, "writeData:error:", v20, &v83);
        v21 = v83;

        if (v21)
        {
          WALogCategoryDefaultHandle();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v21, "localizedDescription");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "userInfo");
            v63 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 136446978;
            v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
            v91 = 1024;
            v92 = 714;
            v93 = 2112;
            v94 = v62;
            v95 = 2112;
            v96 = v63;
            _os_log_impl(&dword_212581000, v61, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

          }
          goto LABEL_40;
        }

        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v68 = MEMORY[0x212BEF45C]();
        v23 = *(void **)(v1 + 32);
        objc_msgSend(v23, "managedObjectHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "managedObjectContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v11;
        +[AnalyticsStoreProxy fetchAll:moc:](AnalyticsStoreProxy, "fetchAll:moc:", v11, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = 0;
        v82 = 0;
        objc_msgSend(v23, "stringifyManagedObjectsArray:titleString:dataStringsArray:", v26, &v82, &v81);
        v27 = v82;
        v28 = v81;

        objc_msgSend(*(id *)(v18 + 32), "stringifyObjectWithPadding:padding:padToLength:", v73, CFSTR("-"), objc_msgSend(v27, "length"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "appendFormat:", CFSTR("%@"), v29);

        v69 = v22;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@\n%@\n"), v22, v27, v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "seekToEndOfFile");
        v67 = v30;
        objc_msgSend(v30, "dataUsingEncoding:", 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0;
        objc_msgSend(v6, "writeData:error:", v31, &v80);
        v8 = v80;

        v32 = v28;
        if (v8)
        {
          v48 = v73;
          v1 = v18;
          WALogCategoryDefaultHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v8, "localizedDescription");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "userInfo");
            v54 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 136446978;
            v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
            v91 = 1024;
            v92 = 731;
            v93 = 2112;
            v94 = v53;
            v95 = 2112;
            v96 = v54;
            _os_log_impl(&dword_212581000, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

            v48 = v73;
          }
          v47 = 0;
          v9 = &off_24CDDB000;
LABEL_30:
          v49 = (void *)v68;
          v37 = v32;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
          v34 = v33;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v35 = v28;
          v36 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
          v37 = v28;
          if (v36)
          {
            v38 = v36;
            v39 = 0;
            v40 = *(_QWORD *)v77;
            while (2)
            {
              for (i = 0; i != v38; ++i)
              {
                if (*(_QWORD *)v77 != v40)
                  objc_enumerationMutation(v35);
                objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "stringByAppendingString:", CFSTR("\n"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                WALogCategoryDefaultHandle();
                v43 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  v44 = COERCE_DOUBLE(-[NSObject count](v35, "count"));
                  *(_DWORD *)buf = 136446978;
                  v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
                  v91 = 1024;
                  v92 = 738;
                  v93 = 2048;
                  v94 = (void *)(v39 + i);
                  v95 = 2048;
                  v96 = v44;
                  _os_log_impl(&dword_212581000, v43, OS_LOG_TYPE_ERROR, "%{public}s::%d:Processing managed objects %lu through %lu", buf, 0x26u);
                }

                objc_msgSend(v6, "seekToEndOfFile");
                objc_msgSend(v42, "dataUsingEncoding:", 4);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = 0;
                objc_msgSend(v6, "writeData:error:", v45, &v75);
                v8 = v75;

                if (v8)
                {
                  WALogCategoryDefaultHandle();
                  v50 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v8, "localizedDescription");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "userInfo");
                    v52 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    *(_DWORD *)buf = 136446978;
                    v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
                    v91 = 1024;
                    v92 = 745;
                    v93 = 2112;
                    v94 = v51;
                    v95 = 2112;
                    v96 = v52;
                    _os_log_impl(&dword_212581000, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error writing %@ %@", buf, 0x26u);

                  }
                  v47 = 0;
                  v1 = v65;
                  v9 = &off_24CDDB000;
                  v48 = v73;
                  goto LABEL_30;
                }

              }
              v37 = v32;
              v38 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
              v39 += i;
              if (v38)
                continue;
              break;
            }
          }

          WALogCategoryDefaultHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
            *(_DWORD *)buf = 136446978;
            v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
            v91 = 1024;
            v92 = 748;
            v93 = 2112;
            v94 = v66;
            v95 = 2048;
            v96 = v46 - v34;
            _os_log_impl(&dword_212581000, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d: %@ reminder took %fs", buf, 0x26u);
          }
          v8 = 0;
          v47 = 1;
          v1 = v65;
          v9 = &off_24CDDB000;
          v48 = v73;
          v49 = (void *)v68;
        }

        objc_autoreleasePoolPop(v49);
        if (!v47)
        {
          v21 = v8;
LABEL_40:
          v3 = v64;
          v59 = obj;
          goto LABEL_41;
        }
LABEL_32:
        v10 = v74 + 1;
      }
      while (v74 + 1 != v72);
      v7 = obj;
      v55 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
      v72 = v55;
      if (!v55)
      {
LABEL_38:

        objc_msgSend(v6, "closeFile");
        v3 = v64;
        objc_msgSend(v64, "path");
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
        v58 = *(void **)(v57 + 40);
        *(_QWORD *)(v57 + 40) = v56;
        v21 = v8;
        goto LABEL_42;
      }
    }
  }
  WALogCategoryDefaultHandle();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v90 = "-[AnalyticsStoreFileWriter writeAnalyticsStoreToFile]_block_invoke";
    v91 = 1024;
    v92 = 690;
LABEL_50:
    _os_log_impl(&dword_212581000, v59, OS_LOG_TYPE_ERROR, "%{public}s::%d:fileHandle nil", buf, 0x12u);
  }
LABEL_51:
  v6 = 0;
  v21 = 0;
LABEL_41:

  v60 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 8);
  v58 = *(void **)(v60 + 40);
  *(_QWORD *)(v60 + 40) = 0;
LABEL_42:

}

- (id)relationshipKeyPathsForPrefetching:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  const __CFString *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  const __CFString *v14;
  void *v15;
  char v16;
  const __CFString *v17;
  void *v18;
  int v19;
  id v20;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO entityName](NetworkMO, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = CFSTR("bss");
  }
  else
  {
    +[BSSMO entityName](BSSMO, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v3, "isEqualToString:", v8);

    if ((v9 & 1) != 0)
    {
      v7 = CFSTR("network");
    }
    else
    {
      +[LeaveMO entityName](LeaveMO, "entityName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v3, "isEqualToString:", v10);

      if ((v11 & 1) != 0
        || (+[JoinMO entityName](JoinMO, "entityName"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v3, "isEqualToString:", v12),
            v12,
            (v13 & 1) != 0))
      {
        v7 = CFSTR("bss.network");
        v14 = CFSTR("bss");
      }
      else
      {
        +[RoamMO entityName](RoamMO, "entityName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v3, "isEqualToString:", v15);

        if ((v16 & 1) != 0)
        {
          v7 = CFSTR("target");
          v14 = CFSTR("source.network");
          v17 = CFSTR("source");
        }
        else
        {
          +[SessionMO entityName](SessionMO, "entityName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v3, "isEqualToString:", v18);

          if (!v19)
          {
            v20 = 0;
            goto LABEL_15;
          }
          objc_msgSend(v4, "addObject:", CFSTR("join.bss.bssid"));
          objc_msgSend(v4, "addObject:", CFSTR("leave.bss.bssid"));
          v7 = CFSTR("roamsSet.target.bssid");
          v14 = CFSTR("roamsSet.source.bssid");
          v17 = CFSTR("leave.date");
        }
        objc_msgSend(v4, "addObject:", v17);
      }
      objc_msgSend(v4, "addObject:", v14);
    }
  }
  objc_msgSend(v4, "addObject:", v7);
  v20 = v4;
LABEL_15:

  return v20;
}

- (id)stringifyRelationship:(id)a3 name:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __CFString *v30;
  __CFString *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  const __CFString *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  __CFString *v75;
  __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  __CFString *v85;
  void *v86;
  __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  __CFString *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[2];
  _BYTE v109[128];
  _QWORD v110[3];

  v110[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "ssid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AnalyticsStoreFileWriter managedObjectHandler](self, "managedObjectHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSSMO allBssidsForSsid:moc:](BSSMO, "allBssidsForSsid:moc:", v7, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = CFSTR("bssids");
LABEL_7:
      *a4 = v11;
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      goto LABEL_26;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "bssid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AnalyticsStoreFileWriter managedObjectHandler](self, "managedObjectHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[BSSMO allSsidsForBssid:moc:](BSSMO, "allSsidsForBssid:moc:", v12, v14);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = CFSTR("ssids");
      goto LABEL_7;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v6;
      objc_msgSend(v16, "bss");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bss");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "network");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
      v17 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v6;
      objc_msgSend(v20, "bss");
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "bss");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "network");
      v23 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v23;
      v17 = (void *)v21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v6;
      objc_msgSend(v24, "bss");
      v25 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "bss");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "network");
      v27 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v27;
      v17 = (void *)v25;
    }
    objc_msgSend(v19, "ssid");
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bssid");
    v29 = objc_claimAutoreleasedReturnValue();
    *a4 = CFSTR("ssid-bssid");
    if (v28)
      v30 = (__CFString *)v28;
    else
      v30 = CFSTR("(nil)");
    if (v29)
      v31 = (__CFString *)v29;
    else
      v31 = CFSTR("(nil)");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v30, v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v103 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v6;
      objc_msgSend(v10, "source");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "target");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "source");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "network");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "ssid");
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bssid");
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bssid");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v37)
        v40 = (__CFString *)v37;
      else
        v40 = CFSTR("(nil)");
      if (v38)
        v41 = (__CFString *)v38;
      else
        v41 = CFSTR("(nil)");
      if (v39)
        v42 = (__CFString *)v39;
      else
        v42 = CFSTR("(nil)");
      *v103 = CFSTR("ssid:bssidSource->bssidTarget");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@->%@"), v40, v41, v42);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = v6;
      objc_msgSend(v43, "join");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "leave");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "roamsSet");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("date"), 1);
      v110[0] = v99;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v110, 1);
      v101 = v46;
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "sortedArrayUsingDescriptors:");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "bss");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "network");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "ssid");
      v50 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "bss");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "bssid");
      v52 = objc_claimAutoreleasedReturnValue();

      if (v50)
        v53 = (const __CFString *)v50;
      else
        v53 = CFSTR("(nil)");
      if (v52)
        v54 = (__CFString *)v52;
      else
        v54 = CFSTR("(nil)");
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v47;
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v55;
      objc_msgSend(v55, "appendFormat:", CFSTR("ssid:joinedBssid"));
      v97 = (__CFString *)v53;
      objc_msgSend(v15, "appendFormat:", CFSTR("%@:%@"), v53, v54);
      if (objc_msgSend(v47, "count"))
      {
        v93 = v45;
        v94 = v44;
        v95 = v43;
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v92 = v47;
        v57 = v47;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v104, v109, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v105;
          do
          {
            for (i = 0; i != v59; ++i)
            {
              if (*(_QWORD *)v105 != v60)
                objc_enumerationMutation(v57);
              v62 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
              objc_msgSend(v62, "target");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "bssid");
              v64 = (void *)objc_claimAutoreleasedReturnValue();

              if (v64)
              {
                objc_msgSend(v62, "target");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "bssid");
                v66 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v15, "appendFormat:", CFSTR("->%@"), v66);
                v54 = (__CFString *)v66;
              }
            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v104, v109, 16);
          }
          while (v59);
        }

        v43 = v95;
        v45 = v93;
        v44 = v94;
        v56 = v92;
      }
      objc_msgSend(v45, "bss");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "bssid");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v96, "appendFormat:", CFSTR("->bssid"));
      objc_msgSend(v15, "appendFormat:", CFSTR("->%@"), v68);
      v69 = objc_retainAutorelease(v96);
      *v103 = v69;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v102 = v6;
        objc_msgSend(v102, "origin");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "result");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v70;
        v100 = v70;
        objc_msgSend(v70, "bssid");
        v73 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "bssid");
        v74 = objc_claimAutoreleasedReturnValue();
        if (v73)
          v75 = (__CFString *)v73;
        else
          v75 = CFSTR("(nil)");
        if (v74)
          v76 = (__CFString *)v74;
        else
          v76 = CFSTR("(nil)");
        *a4 = CFSTR("(origin)ssid:bssid (result)ssid:bssid");
        v77 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v72, "network");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "ssid");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "network");
        v80 = v6;
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "ssid");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "stringWithFormat:", CFSTR("%@:%@ %@:%@"), v79, v75, v82, v76);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v80;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_74;
        v83 = v6;
        objc_msgSend(v83, "bss");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "bssid");
        v85 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v83, "bss");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "network");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "ssid");
        v87 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v88 = CFSTR("(nil)");
        if (v87)
          v89 = v87;
        else
          v89 = CFSTR("(nil)");
        if (v85)
          v88 = v85;
        v108[0] = v89;
        v108[1] = v88;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v108, 2);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v90;
        if (v90)
        {
          *a4 = CFSTR("ssid,bssid");
          objc_msgSend(v90, "componentsJoinedByString:", CFSTR(": "));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (!v91)
LABEL_74:
          v15 = 0;
      }
    }
  }
LABEL_26:

  return v15;
}

- (void)stringifyManagedObjectsArray:(id)a3 titleString:(id *)a4 dataStringsArray:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _UNKNOWN **v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *Name;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
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
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  _QWORD *v41;
  void *v42;
  in_addr_t v43;
  in_addr v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id *v66;
  id *v67;
  void *v68;
  id obj;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  objc_property_t *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  unsigned int outCount;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _QWORD v96[3];
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[3];
  _QWORD v105[3];
  _QWORD v106[3];
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[3];
  _QWORD v112[3];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[3];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v10 = v8;
  v72 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v90, v118, 16);
  if (!v72)
  {

    v74 = 0;
    goto LABEL_79;
  }
  v66 = a4;
  v67 = a5;
  v74 = 0;
  obj = v10;
  v70 = *(_QWORD *)v91;
  v11 = &off_24CDDB000;
  v71 = v9;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v91 != v70)
        objc_enumerationMutation(obj);
      v73 = v12;
      v13 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v12);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      outCount = 0;
      v14 = (objc_class *)objc_opt_class();
      v78 = class_copyPropertyList(v14, &outCount);
      v15 = v74;
      if (outCount)
      {
        v16 = 0;
        v75 = v13;
        while (1)
        {
          v17 = (void *)MEMORY[0x212BEF45C]();
          Name = property_getName(v78[v16]);
          if (Name)
            break;
LABEL_27:
          objc_autoreleasePoolPop(v17);
          if (++v16 >= (unint64_t)outCount)
            goto LABEL_56;
        }
        v79 = v17;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Name);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11[21], "analyticsStoreEntityRelationshipNames");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "containsObject:", v19);

        if ((v21 & 1) != 0)
        {
          v77 = v19;
          v88 = 0;
          -[AnalyticsStoreFileWriter stringifyRelationship:name:](self, "stringifyRelationship:name:", v13, &v88);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v88;
          v24 = v23;
          if (v22)
          {
            v96[0] = CFSTR("name");
            v96[1] = CFSTR("value");
            v97[0] = v23;
            v97[1] = v22;
            v96[2] = CFSTR("length");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v22, "length"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v97[2] = v25;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, v96, 3);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v76, "containsObject:", v26) & 1) == 0)
              objc_msgSend(v76, "addObject:", v26);
            v11 = &off_24CDDB000;
          }
          else
          {
            v26 = 0;
          }

          v13 = v75;
LABEL_25:

          v28 = v77;
LABEL_26:

          v17 = v79;
          goto LABEL_27;
        }
        objc_msgSend(v13, "valueForKey:", v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = v19;
        if (v27)
        {
          if ((objc_msgSend(v19, "containsString:", CFSTR("hist")) & 1) != 0
            || (objc_msgSend(v19, "containsString:", CFSTR("channels")) & 1) != 0
            || (objc_msgSend(v19, "containsString:", CFSTR("parsedBeacon")) & 1) != 0
            || (objc_msgSend(v19, "containsString:", CFSTR("unparsedBeacon")) & 1) != 0)
          {
            goto LABEL_26;
          }
          v77 = v19;
          if (objc_msgSend(v19, "containsString:", CFSTR("ssid")))
          {
            v117[0] = v19;
            v116[0] = CFSTR("name");
            v116[1] = CFSTR("value");
            v29 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v13, "valueForKey:", v19);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringWithFormat:", CFSTR("%@"), v30);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "redactedForWiFi");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v117[1] = v31;
            v116[2] = CFSTR("length");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 20);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v117[2] = v32;
            v33 = (void *)MEMORY[0x24BDBCE70];
            v34 = v117;
            v35 = v116;
            goto LABEL_33;
          }
          if ((objc_msgSend(v19, "containsString:", CFSTR("date")) & 1) != 0
            || (objc_msgSend(v19, "containsString:", CFSTR("lastSeen")) & 1) != 0
            || objc_msgSend(v19, "containsString:", CFSTR("end")))
          {
            objc_msgSend(v13, "valueForKey:", v19);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCF38], "defaultTimeZone");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v68, "secondsFromGMTForDate:", v30);
            v115[0] = v28;
            v114[0] = CFSTR("name");
            v114[1] = CFSTR("value");
            objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v30, (double)v36);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v115[1] = v31;
            v114[2] = CFSTR("length");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 20);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v115[2] = v32;
            v33 = (void *)MEMORY[0x24BDBCE70];
            v34 = v115;
            v35 = v114;
            goto LABEL_33;
          }
          if ((objc_msgSend(v19, "containsString:", CFSTR("neighborChannels")) & 1) != 0
            || (objc_msgSend(v19, "containsString:", CFSTR("neighborBSSIDs")) & 1) != 0
            || objc_msgSend(v19, "containsString:", CFSTR("neighborCache")))
          {
            v113[0] = v19;
            v112[0] = CFSTR("name");
            v112[1] = CFSTR("value");
            +[RoamPolicyStore neighborChannelsAsArray:log:For:](RoamPolicyStore, "neighborChannelsAsArray:log:For:", v13, 0, "-[AnalyticsStoreFileWriter stringifyManagedObjectsArray:titleString:dataStringsArray:]");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[AnalyticsStoreFileWriter stringifyValueArray:](self, "stringifyValueArray:", v30);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v113[1] = v37;
            v112[2] = CFSTR("length");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 20);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v113[2] = v38;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v113, v112, 3);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = v75;
            goto LABEL_38;
          }
          if ((objc_msgSend(v19, "containsString:", CFSTR("apid")) & 1) != 0
            || (objc_msgSend(v19, "containsString:", CFSTR("apPhysicalScopeId")) & 1) != 0
            || (objc_msgSend(v19, "containsString:", CFSTR("idUsedInMetric")) & 1) != 0
            || objc_msgSend(v19, "containsString:", CFSTR("colocatedScopeId")))
          {
            v111[0] = v19;
            v110[0] = CFSTR("name");
            v110[1] = CFSTR("value");
            objc_msgSend(v13, "valueForKey:", v19);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v111[1] = v30;
            v110[2] = CFSTR("length");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 37);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v111[2] = v37;
            v39 = (void *)MEMORY[0x24BDBCE70];
            v40 = v111;
            v41 = v110;
LABEL_44:
            objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", v40, v41, 3);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

          }
          else
          {
            if ((objc_msgSend(v19, "containsString:", CFSTR("fwReason")) & 1) != 0
              || objc_msgSend(v19, "containsString:", CFSTR("status")))
            {
              v109[0] = v19;
              v108[0] = CFSTR("name");
              v108[1] = CFSTR("value");
              objc_msgSend(v13, "valueForKey:", v19);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v109[1] = v30;
              v108[2] = CFSTR("length");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 12);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v109[2] = v37;
              v39 = (void *)MEMORY[0x24BDBCE70];
              v40 = v109;
              v41 = v108;
              goto LABEL_44;
            }
            if ((objc_msgSend(v19, "containsString:", CFSTR("ipv4Addr")) & 1) != 0
              || objc_msgSend(v19, "containsString:", CFSTR("ipv4routerAddr")))
            {
              objc_msgSend(v13, "valueForKey:", v19);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "intValue");

              v107[0] = v19;
              v106[0] = CFSTR("name");
              v106[1] = CFSTR("value");
              v44.s_addr = v43;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), inet_ntoa(v44));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v107[1] = v30;
              v106[2] = CFSTR("length");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 16);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v107[2] = v37;
              v39 = (void *)MEMORY[0x24BDBCE70];
              v40 = v107;
              v41 = v106;
              goto LABEL_44;
            }
            if (!objc_msgSend(v19, "containsString:", CFSTR("routerMAC")))
            {
              if (objc_msgSend(v19, "containsString:", CFSTR("type")))
              {
                v103[0] = v19;
                v102[0] = CFSTR("name");
                v102[1] = CFSTR("value");
                objc_msgSend(v13, "valueForKey:", v19);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v103[1] = v30;
                v102[2] = CFSTR("length");
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 48);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v103[2] = v37;
                v39 = (void *)MEMORY[0x24BDBCE70];
                v40 = v103;
                v41 = v102;
              }
              else
              {
                v101[0] = v19;
                v100[0] = CFSTR("name");
                v100[1] = CFSTR("value");
                objc_msgSend(v13, "valueForKey:", v19);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v101[1] = v30;
                v100[2] = CFSTR("length");
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v28, "length"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v101[2] = v37;
                v39 = (void *)MEMORY[0x24BDBCE70];
                v40 = v101;
                v41 = v100;
              }
              goto LABEL_44;
            }
            v105[0] = v19;
            v104[0] = CFSTR("name");
            v104[1] = CFSTR("value");
            v45 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v13, "valueForKey:", v19);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "stringWithFormat:", CFSTR("%@"), v30);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "redactedForWiFi");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v105[1] = v31;
            v104[2] = CFSTR("length");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 20);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v105[2] = v32;
            v33 = (void *)MEMORY[0x24BDBCE70];
            v34 = v105;
            v35 = v104;
LABEL_33:
            objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, 3);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = v75;
          }
        }
        else
        {
          v98[0] = CFSTR("name");
          v98[1] = CFSTR("value");
          v99[0] = v19;
          v99[1] = CFSTR("(nil)");
          v98[2] = CFSTR("length");
          v77 = v19;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v19, "length"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v99[2] = v30;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v99, v98, 3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v76, "addObject:", v26);
        goto LABEL_25;
      }
LABEL_56:
      free(v78);
      v46 = v76;
      if (!v74)
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v47 = v76;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v85;
          do
          {
            for (i = 0; i != v49; ++i)
            {
              if (*(_QWORD *)v85 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
              objc_msgSend(v52, "valueForKey:", CFSTR("name"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "valueForKey:", CFSTR("length"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[AnalyticsStoreFileWriter stringifyObjectWithPadding:padding:padToLength:](self, "stringifyObjectWithPadding:padding:padToLength:", v53, CFSTR(" "), objc_msgSend(v54, "unsignedLongValue"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "appendFormat:", CFSTR("%@|"), v55);

            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
          }
          while (v49);
        }

        v46 = v76;
      }
      v74 = v15;
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v57 = v46;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v81;
        do
        {
          for (j = 0; j != v59; ++j)
          {
            if (*(_QWORD *)v81 != v60)
              objc_enumerationMutation(v57);
            v62 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
            objc_msgSend(v62, "valueForKey:", CFSTR("value"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "valueForKey:", CFSTR("length"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[AnalyticsStoreFileWriter stringifyObjectWithPadding:padding:padToLength:](self, "stringifyObjectWithPadding:padding:padToLength:", v63, CFSTR(" "), objc_msgSend(v64, "unsignedLongValue"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "appendFormat:", CFSTR("%@|"), v65);

          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
        }
        while (v59);
      }

      v9 = v71;
      objc_msgSend(v71, "addObject:", v56);

      v12 = v73 + 1;
      v11 = &off_24CDDB000;
    }
    while (v73 + 1 != v72);
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v118, 16);
  }
  while (v72);
  v10 = obj;

  if (!v66)
  {
    a5 = v67;
    if (!v67)
      goto LABEL_82;
    goto LABEL_80;
  }
  a5 = v67;
  if (!v74)
  {
LABEL_79:
    if (a5)
      goto LABEL_80;
    goto LABEL_82;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:");
  *v66 = (id)objc_claimAutoreleasedReturnValue();
  if (!v67)
    goto LABEL_82;
LABEL_80:
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_82:

}

- (id)stringifyObjectWithPadding:(id)a3 padding:(id)a4 padToLength:(unint64_t)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDD16A8];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR("%@"), v9);

  objc_msgSend(v10, "stringByPaddingToLength:withString:startingAtIndex:", a5, v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)stringifyValueArray:(id)a3
{
  void *v3;
  __CFString *v4;

  if (a3)
  {
    objc_msgSend(a3, "valueForKey:", CFSTR("description"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("(nil)");
  }
  return v4;
}

+ (id)exportEntityToCSV:(id)a3 batchSize:(unint64_t)a4 maxAge:(unint64_t)a5 toURL:(id)a6 fileDate:(id)a7 dateFormatter:(id)a8 inManagedObjectContext:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  AnalyticsCSVWriter *v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  uint64_t v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id obj;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  AnalyticsCSVWriter *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _QWORD v94[3];

  v94[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v80 = a8;
  v17 = a9;
  objc_msgSend(v14, "name");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributesByName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = (void *)v18;
  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (a4)
    objc_msgSend(v21, "setFetchLimit:", a4);
  v73 = v20;
  if (objc_msgSend(v20, "containsObject:", CFSTR("date")))
  {
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSortDescriptors:", v24);

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithObject:", CFSTR("date"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dateByAddingUnit:value:toDate:options:", 16, -(uint64_t)a5, v27, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("date >= %@"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPredicate:", v29);

    }
  }
  else
  {
    v25 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  }
  v30 = v73;
  objc_msgSend(v73, "sortedArrayUsingSelector:", sel_compare_);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObjectsFromArray:", v31);
  v91 = 0;
  objc_msgSend(v17, "executeFetchRequest:error:", v22, &v91);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v91;
  v34 = v74;
  v72 = v32;
  if (!v33)
  {
    v65 = v31;
    v66 = v22;
    v67 = v17;
    v70 = v14;
    v68 = v16;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Entity_%@_%@.csv"), v16, v74);
    v36 = objc_claimAutoreleasedReturnValue();
    v69 = v15;
    objc_msgSend(v15, "path");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)v36;
    objc_msgSend(v37, "stringByAppendingPathComponent:", v36);
    v38 = objc_claimAutoreleasedReturnValue();

    v71 = (id)v38;
    objc_msgSend(MEMORY[0x24BDBCF08], "outputStreamToFileAtPath:append:", v38, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "open");
    v63 = v39;
    v40 = -[AnalyticsCSVWriter initWithOutputStream:]([AnalyticsCSVWriter alloc], "initWithOutputStream:", v39);
    -[AnalyticsCSVWriter writeFields:](v40, "writeFields:", v25);
    v82 = v40;
    -[AnalyticsCSVWriter finishLine](v40, "finishLine");
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = v32;
    v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
    if (!v78)
      goto LABEL_38;
    v41 = CFSTR("date");
    v76 = *(_QWORD *)v88;
    v77 = v25;
    while (1)
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v88 != v76)
          objc_enumerationMutation(obj);
        v79 = v42;
        v43 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v42);
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v44 = v25;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v84;
          do
          {
            v48 = 0;
            do
            {
              if (*(_QWORD *)v84 != v47)
                objc_enumerationMutation(v44);
              v49 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v48);
              objc_msgSend(v43, "valueForKey:", v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v49, "containsString:", v41))
              {
                objc_msgSend(v80, "stringFromDate:", v50);
                v51 = objc_claimAutoreleasedReturnValue();
LABEL_22:
                v52 = (void *)v51;
                -[AnalyticsCSVWriter writeField:](v82, "writeField:", v51);
                goto LABEL_30;
              }
              if ((objc_msgSend(v49, "containsString:", CFSTR("bssid")) & 1) == 0
                && (objc_msgSend(v49, "containsString:", CFSTR("neighborBSSIDs")) & 1) == 0
                && (objc_msgSend(v49, "containsString:", CFSTR("ssid")) & 1) == 0
                && (objc_msgSend(v49, "containsString:", CFSTR("routerMAC")) & 1) == 0
                && (objc_msgSend(v49, "containsString:", CFSTR("parsedBeacon")) & 1) == 0
                && !objc_msgSend(v49, "containsString:", CFSTR("unparsedBeacon")))
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v50);
                v51 = objc_claimAutoreleasedReturnValue();
                goto LABEL_22;
              }
              v81 = v50;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v50);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v52, "redactedForWiFi");
              v54 = v47;
              v55 = v43;
              v56 = v41;
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "stringWithFormat:", CFSTR("%@"), v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              -[AnalyticsCSVWriter writeField:](v82, "writeField:", v58);

              v41 = v56;
              v43 = v55;
              v47 = v54;
              v50 = v81;
LABEL_30:

              objc_msgSend(v44, "lastObject");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "isEqual:", v49);

              if ((v60 & 1) == 0)
                -[AnalyticsCSVWriter writeComma](v82, "writeComma");

              ++v48;
            }
            while (v46 != v48);
            v61 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v83, v92, 16);
            v46 = v61;
          }
          while (v61);
        }

        -[AnalyticsCSVWriter finishLine](v82, "finishLine");
        v42 = v79 + 1;
        v25 = v77;
      }
      while (v79 + 1 != v78);
      v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
      if (!v78)
      {
LABEL_38:

        objc_msgSend(v63, "close");
        v15 = v69;
        v14 = v70;
        v17 = v67;
        v16 = v68;
        v30 = v73;
        v34 = v74;
        v31 = v65;
        v22 = v66;
        v35 = 0;
        goto LABEL_39;
      }
    }
  }
  v35 = v33;
  NSLog(CFSTR("Error fetching data for entity %@: %@"), v74, v33);
  v71 = 0;
LABEL_39:

  return v71;
}

- (AnalyticsStoreMOHandler)managedObjectHandler
{
  return self->_managedObjectHandler;
}

- (void)setManagedObjectHandler:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectHandler, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
