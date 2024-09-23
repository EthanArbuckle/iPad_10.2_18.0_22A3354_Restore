@implementation SPCorrectionProxy

+ (id)sharedHandler
{
  if (sharedHandler_onceToken != -1)
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_14);
  return (id)sharedHandler_handler;
}

void __34__SPCorrectionProxy_sharedHandler__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedHandler_handler;
  sharedHandler_handler = v0;

}

+ (id)inputFileURLForCurrentTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend((id)objc_opt_class(), "inputFilesURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "dateFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%@_%@"), v4, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)inputFilesURLForUser:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD block[4];
  id v10;

  NSHomeDirectoryForUser((NSString *)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("/Library/Spotlight/CorrectionInputFiles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SPCorrectionProxy_inputFilesURLForUser___block_invoke;
  block[3] = &unk_24CF63D90;
  v10 = v4;
  v5 = inputFilesURLForUser__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&inputFilesURLForUser__onceToken, block);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:relativeToURL:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __42__SPCorrectionProxy_inputFilesURLForUser___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", *(_QWORD *)(a1 + 32), 1, 0, 0);

}

+ (id)inputFilesURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_class();
  NSUserName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputFilesURLForUser:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dateFormatter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  return v2;
}

+ (id)dateFromFileURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count") == 3)
  {
    objc_msgSend(v5, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "dateFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SPCorrectionProxy)init
{
  SPCorrectionProxy *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPCorrectionProxy;
  v2 = -[SPCorrectionProxy init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "inputFilesURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPCorrectionProxy setInputFilesURL:](v2, "setInputFilesURL:", v3);

  }
  return v2;
}

- (BOOL)dateIsExpired:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "dateWithTimeIntervalSinceNow:", -172800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earlierDate:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v4;
}

- (void)deleteExpiredInputFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCorrectionProxy inputFilesURL](self, "inputFilesURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = *MEMORY[0x24BDBD6D0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, v5, 0, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_msgSend((id)objc_opt_class(), "dateFromFileURL:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[SPCorrectionProxy dateIsExpired:](self, "dateIsExpired:", v14))
        {
          v16 = v7;
          objc_msgSend(v3, "removeItemAtURL:error:", v13, &v16);
          v15 = v16;

          v7 = v15;
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v10);
  }

}

- (void)updateWithFileHandle:(id)a3
{
  id v4;
  SPCorrectionProxy *v5;
  NSObject *v6;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  SPLogForSPLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v6, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213202000, v6, v7, "Processing corrections begin", buf, 2u);
  }

  -[SPCorrectionProxy processCorrectionsWithHandle:](v5, "processCorrectionsWithHandle:", v4);
  SPLogForSPLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v8, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_213202000, v8, v9, "Processing corrections complete", v10, 2u);
  }

  objc_sync_exit(v5);
}

- (void)processCorrectionsWithHandle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  objc_msgSend(a3, "readDataToEndOfFileAndReturnError:", &v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v21;
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      SPLogForSPLogCategoryDefault();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = gSPLogInfoAsDefault ^ 1;
      if (os_log_type_enabled(v7, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
      {
        objc_msgSend(v6, "debugDescription");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v10 = objc_msgSend(v9, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v23 = v10;
        _os_log_impl(&dword_213202000, v7, v8, "inputFile write error: %s\n", buf, 0xCu);

      }
      v11 = 0;
      goto LABEL_9;
    }
    objc_msgSend((id)objc_opt_class(), "inputFileURLForCurrentTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "writeToURL:atomically:", v11, 1))
    {
      v12 = dispatch_group_create();
      dispatch_group_enter(v12);
      v16 = MEMORY[0x24BDAC760];
      v17 = 3221225472;
      v18 = __50__SPCorrectionProxy_processCorrectionsWithHandle___block_invoke;
      v19 = &unk_24CF64828;
      v20 = v12;
      v7 = v12;
      v13 = (void *)MEMORY[0x2199AE320](&v16);
      objc_msgSend(MEMORY[0x24BDC2470], "defaultSearchableIndex", v16, v17, v18, v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateCorrectionsWithFilePath:completionHandler:", v15, v13);
      dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

LABEL_9:
    }
  }
  else
  {
    v11 = 0;
  }
  -[SPCorrectionProxy deleteExpiredInputFiles](self, "deleteExpiredInputFiles");

}

void __50__SPCorrectionProxy_processCorrectionsWithHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    SPLogForSPLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v4, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      objc_msgSend(v3, "debugDescription");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = 136315138;
      v8 = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_213202000, v4, v5, "updateCompletionHandler error: %s\n", (uint8_t *)&v7, 0xCu);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (NSURL)inputFilesURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInputFilesURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFilesURL, 0);
}

@end
