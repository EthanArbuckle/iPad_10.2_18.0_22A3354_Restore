@implementation SDTTRSupport

+ (id)getSharedInstance
{
  if (getSharedInstance_onceToken != -1)
    dispatch_once(&getSharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance;
}

void __33__SDTTRSupport_getSharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  id v4;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance;
  sharedInstance = v0;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"), 0, 0, 0);

  }
}

- (SDTTRSupport)init
{
  SDTTRSupport *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDTTRSupport;
  v2 = -[SDTTRSupport init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.searchd.ttr", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dumpTTRDebugFilesForQuery:(id)a3 sections:(id)a4 enableKeyLogRanking:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__SDTTRSupport_dumpTTRDebugFilesForQuery_sections_enableKeyLogRanking___block_invoke;
  block[3] = &unk_24CF63BC8;
  v16 = a5;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(queue, block);

}

uint64_t __71__SDTTRSupport_dumpTTRDebugFilesForQuery_sections_enableKeyLogRanking___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearExistingFiles");
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "collectResultSetForQueryString:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "dumpFeatureVectorForSections:query:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)clearExistingFiles
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("Spotlight_Ranking_Diagnostic_Dump_L")))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"), v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "removeItemAtPath:error:", v9, 0);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/Ranking/"), CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtPath:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/Ranking/%@"), CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "removeItemAtPath:error:", v17, 0);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

}

- (void)dumpFeatureVectorForSections:(id)a3 query:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v23;
  id v24;
  id v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/Spotlight_Ranking_Diagnostic_Dump_L2_%@.log"), CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "UTF8String");
    v8 = json_writer_create_with_path();
    if (v8)
    {
      v9 = v8;
      v23 = v7;
      v24 = v6;
      json_writer_begin_array();
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v25 = v5;
      obj = v5;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v10)
      {
        v11 = v10;
        v27 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v33 != v27)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            objc_msgSend(v13, "arrayOfRankingItems");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v29;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v29 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                  objc_msgSend(v19, "identifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "L2FeatureVector");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v20, "length"))
                    v22 = v21 == 0;
                  else
                    v22 = 1;
                  if (!v22)
                  {
                    json_writer_begin_dictionary();
                    json_writer_add_key();
                    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
                    json_writer_add_string();
                    objc_msgSend(v21, "serializeToJSON:options:", v9, 2);
                    json_writer_end_dictionary();
                  }

                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              }
              while (v16);
            }

          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v11);
      }

      json_writer_end_array();
      json_writer_dispose();
      v6 = v24;
      v5 = v25;
      v7 = v23;
    }

  }
}

- (void)collectResultSetForQueryString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x2199AE17C]();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", CFSTR("_kMDItemSDBInfo")) & 1) == 0)
    objc_msgSend(v5, "insertObject:atIndex:", CFSTR("_kMDItemSDBInfo"), 0);
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v7, "setFetchAttributes:", v5);
  v8 = *MEMORY[0x24BDD0CD8];
  v16[0] = *MEMORY[0x24BDD0CD0];
  v16[1] = v8;
  v9 = *MEMORY[0x24BDD0CE0];
  v16[2] = *MEMORY[0x24BDD0CE8];
  v16[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProtectionClasses:", v10);

  v11 = (void *)objc_msgSend(v7, "copy");
  v12 = (void *)MEMORY[0x2199AE17C](objc_msgSend(v11, "setFetchAttributes:", &unk_24CF6FDA0));
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/TTR_allResults_%@"), CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"), v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@/Spotlight_Ranking_Diagnostic_Dump_Filtered_%@"), CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"), v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("**=\"%@*\"cdwt"), v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    runQuery(v15, v6, v7, 1, v13);
    runQuery(v3, v6, v11, 0, v14);

  }
  objc_autoreleasePoolPop(v12);

  objc_autoreleasePoolPop(v4);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
