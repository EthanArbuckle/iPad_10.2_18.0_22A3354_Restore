@implementation BRCItemCountMismatchReport

- (BRCItemCountMismatchReport)initWithURL:(id)a3
{
  id v5;
  BRCItemCountMismatchReport *v6;
  BRCItemCountMismatchReport *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCItemCountMismatchReport;
  v6 = -[BRCItemCountMismatchReport init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fileURL, a3);

  return v7;
}

- (void)shareChangedDuringCheckWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSError *v8;
  NSError *lastError;

  v4 = a3;
  objc_msgSend(v4, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  if (self->_lastError)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCItemCountMismatchReport shareChangedDuringCheckWithSession:].cold.1((uint64_t)self);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorItemChanged");
    v8 = (NSError *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    self->_lastError = v8;

    -[BRCItemCountMismatchReport incrementErrorRetryCountWithSession:](self, "incrementErrorRetryCountWithSession:", v4);
  }

}

- (void)incrementErrorRetryCountWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSError *lastError;
  int64_t failureRetryCount;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  NSError *v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemGlobalID itemID](self->_itemGlobalID, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemGlobalID zoneRowID](self->_itemGlobalID, "zoneRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "numberWithSQL:", CFSTR("SELECT retry_count FROM telemetry_failure_counts WHERE item_id = %@ AND zone_rowid = %@"), v6, v7);

  self->_failureRetryCount = objc_msgSend(v8, "longLongValue") + 1;
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[NSURL path](self->_fileURL, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fp_obfuscatedPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    lastError = self->_lastError;
    failureRetryCount = self->_failureRetryCount;
    *(_DWORD *)buf = 138413058;
    v20 = v12;
    v21 = 2112;
    v22 = lastError;
    v23 = 2048;
    v24 = failureRetryCount;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_230455000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Telemetry report at %@ finished with error %@ retry count %llu%@", buf, 0x2Au);

  }
  objc_msgSend(v4, "clientDB");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = self->_failureRetryCount;
  -[BRCItemGlobalID itemID](self->_itemGlobalID, "itemID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemGlobalID zoneRowID](self->_itemGlobalID, "zoneRowID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "execute:", CFSTR("INSERT OR REPLACE INTO telemetry_failure_counts (retry_count, item_id, zone_rowid) VALUES (%lld, %@, %@)"), v16, v17, v18);

}

+ (void)_finishReport:(id)a3 session:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "clientTruthWorkloop");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__BRCItemCountMismatchReport__finishReport_session_completionHandler___block_invoke;
  block[3] = &unk_24FE40A80;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, block);

}

uint64_t __70__BRCItemCountMismatchReport__finishReport_session_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "lastError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
LABEL_2:

    goto LABEL_3;
  }
  if (objc_msgSend(*v2, "wasAbleToRun"))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "itemGlobalID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemByItemGlobalID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "containsPendingUploadOrSyncUp"))
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(*((id *)*v2 + 2), "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "brc_errorNotInCloud:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)*((_QWORD *)*v2 + 5);
      *((_QWORD *)*v2 + 5) = v11;

    }
    goto LABEL_2;
  }
LABEL_3:
  objc_msgSend(*v2, "lastError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *v2;
  if (v4)
  {
    objc_msgSend(v5, "incrementErrorRetryCountWithSession:", *(_QWORD *)(a1 + 40));
  }
  else if (objc_msgSend(v5, "wasAbleToRun"))
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __70__BRCItemCountMismatchReport__finishReport_session_completionHandler___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "clientDB");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "itemGlobalID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "itemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "itemGlobalID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "zoneRowID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "execute:", CFSTR("DELETE FROM telemetry_failure_counts WHERE item_id = %@ AND zone_rowid = %@"), v17, v19);

  }
  else
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*((id *)*v2 + 2), "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fp_obfuscatedPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v23;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Telemetry report at %@ did not run%@", buf, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (void)generateReportForSharedFolder:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  int64_t v25;

  v8 = a3;
  v9 = a5;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke;
  v22[3] = &unk_24FE40D20;
  v24 = a1;
  v10 = v9;
  v23 = v10;
  v25 = a4;
  v11 = (void *)MEMORY[0x2348BA0DC](v22);
  objc_msgSend(v8, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personaIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  v19 = v12;
  v20 = v10;
  v21 = v11;
  v14 = v11;
  v15 = v12;
  v16 = v8;
  v17 = v10;
  BRPerformWithPersonaAndError();

}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  BRCItemCountMismatchReport *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BRMangledID *zoneMangledID;
  void *v19;
  uint64_t v20;
  BRCItemGlobalID *itemGlobalID;
  void *v22;
  void *v23;
  uint64_t v24;
  NSError *lastError;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  BRCItemCountMismatchReport *v32;
  uint64_t v33;
  id v34;
  BRCItemCountMismatchReport *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  BRCItemCountMismatchReport *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  _QWORD v53[4];
  BRCItemCountMismatchReport *v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_cold_1();

  v9 = -[BRCItemCountMismatchReport initWithURL:]([BRCItemCountMismatchReport alloc], "initWithURL:", v5);
  objc_msgSend(v6, "clientZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverItemByItemID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "serverMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recursiveChildCount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serverZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mangledID");
  v17 = objc_claimAutoreleasedReturnValue();
  zoneMangledID = v9->_zoneMangledID;
  v9->_zoneMangledID = (BRMangledID *)v17;

  objc_msgSend(v12, "clientZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_isEnhancedDrivePrivacyEnabled = objc_msgSend(v19, "enhancedDrivePrivacyEnabled");

  objc_msgSend(v6, "itemGlobalID");
  v20 = objc_claimAutoreleasedReturnValue();
  itemGlobalID = v9->_itemGlobalID;
  v9->_itemGlobalID = (BRCItemGlobalID *)v20;

  v9->_containsSharedToMeItem = objc_msgSend(v6, "isSharedToMeOrContainsSharedToMeItem");
  if (v14 && !objc_msgSend(v6, "containsPendingUploadOrSyncUp"))
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "path");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "fp_obfuscatedPath");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v60 = v14;
      v61 = 2112;
      v62 = v40;
      v63 = 2112;
      v64 = v26;
      _os_log_debug_impl(&dword_230455000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Telemetry - Server metrics found %@ items under %@%@", buf, 0x20u);

    }
    v58 = 0;
    objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v5, 1, &v58);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v58;
    v30 = v58;
    if (v30)
    {
      objc_storeStrong((id *)&v9->_lastError, v29);
      objc_msgSend(*(id *)(a1 + 40), "_finishReport:session:completionHandler:", v9, v15, *(_QWORD *)(a1 + 32));
    }
    else
    {
      BRDiskCheckerServiceConnection();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_553;
      v53[3] = &unk_24FE40CD0;
      v32 = v9;
      v33 = *(_QWORD *)(a1 + 40);
      v54 = v32;
      v57 = v33;
      v43 = v28;
      v34 = v15;
      v55 = v34;
      v56 = *(id *)(a1 + 32);
      objc_msgSend(v31, "remoteObjectProxyWithErrorHandler:", v53);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *(_QWORD *)(a1 + 48);
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_554;
      v45[3] = &unk_24FE40CF8;
      v35 = v32;
      v36 = *(_QWORD *)(a1 + 40);
      v46 = v35;
      v52 = v36;
      v37 = v34;
      v28 = v43;
      v47 = v37;
      v51 = *(id *)(a1 + 32);
      v38 = v31;
      v30 = 0;
      v48 = v38;
      v49 = v5;
      v50 = v14;
      v39 = v38;
      objc_msgSend(v41, "checkRecursiveChildItemCountFromURLWrapper:qualityOfService:reply:", v43, v42, v45);

    }
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v5, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "brc_errorNotInCloud:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    lastError = v9->_lastError;
    v9->_lastError = (NSError *)v24;

    objc_msgSend(*(id *)(a1 + 40), "_finishReport:session:completionHandler:", v9, v15, *(_QWORD *)(a1 + 32));
  }

}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_553(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a2;
  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
    objc_msgSend(*(id *)(a1 + 56), "_finishReport:session:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_554(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) = 1;
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 56), "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fp_obfuscatedPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v5;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v7;
      _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Telemetry - Disk checker found %@ items under %@%@", (uint8_t *)&v12, 0x20u);

    }
    v9 = objc_msgSend(v5, "longLongValue");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v9 - objc_msgSend(*(id *)(a1 + 64), "longLongValue");
  }
  objc_msgSend(*(id *)(a1 + 80), "_finishReport:session:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));

}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_557(id *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  if (a2)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_557_cold_2();

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_msgSend(a1[4], "itemGlobalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC83F0], "br_sharedProviderManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1[4], "fileObjectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "asString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_559;
      v11[3] = &unk_24FE40D70;
      v12 = v5;
      v14 = a1[6];
      v13 = a1[5];
      v15 = a1[7];
      objc_msgSend(v6, "getUserVisibleURLForItemIdentifier:completionHandler:", v8, v11);

    }
    else
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
        __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_557_cold_1();

      (*((void (**)(void))a1[6] + 2))();
    }

  }
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_559(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v18 = v11;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v9;
      _os_log_error_impl(&dword_230455000, v10, (os_log_type_t)0x90u, "[ERROR] Can't find the user visible URL for %@ - %@%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "clientTruthWorkloop");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_560;
    v12[3] = &unk_24FE40D48;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 32);
    v16 = *(id *)(a1 + 56);
    v15 = v5;
    dispatch_async(v8, v12);

  }
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_560(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "itemByItemGlobalID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)telemetryEvent
{
  int64_t failureRetryCount;
  void *v4;
  uint64_t v5;
  id v6;

  if (self->_lastError)
  {
    failureRetryCount = self->_failureRetryCount;
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "telemetryRetryCountForPermenentFailure");

    v6 = 0;
    if (failureRetryCount > v5)
      v6 = +[AppTelemetryTimeSeriesEvent newPermanentlyInconsistentEventWithZoneMangledID:enhancedDrivePrivacyEnabled:](AppTelemetryTimeSeriesEvent, "newPermanentlyInconsistentEventWithZoneMangledID:enhancedDrivePrivacyEnabled:", self->_zoneMangledID, self->_isEnhancedDrivePrivacyEnabled);
  }
  else if (self->_wasAbleToRun)
  {
    if (self->_itemCountDifference >= 1 && self->_containsSharedToMeItem)
      v6 = +[AppTelemetryTimeSeriesEvent newShareAliasInSharedFolderEventWithZoneMangledID:enhancedDrivePrivacyEnabled:](AppTelemetryTimeSeriesEvent, "newShareAliasInSharedFolderEventWithZoneMangledID:enhancedDrivePrivacyEnabled:", self->_zoneMangledID, self->_isEnhancedDrivePrivacyEnabled);
    else
      v6 = +[AppTelemetryTimeSeriesEvent newFolderSharingCountMismatchEventWithCount:zoneMangledID:enhancedDrivePrivacyEnabled:](AppTelemetryTimeSeriesEvent, "newFolderSharingCountMismatchEventWithCount:zoneMangledID:enhancedDrivePrivacyEnabled:");
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int64_t)itemCountDifference
{
  return self->_itemCountDifference;
}

- (BOOL)wasAbleToRun
{
  return self->_wasAbleToRun;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (BRCItemGlobalID)itemGlobalID
{
  return self->_itemGlobalID;
}

- (BRMangledID)zoneMangledID
{
  return self->_zoneMangledID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneMangledID, 0);
  objc_storeStrong((id *)&self->_itemGlobalID, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)shareChangedDuringCheckWithSession:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 48);
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_230455000, v2, (uint64_t)v2, "[DEBUG] The share changed while we were checking telemetry on %@ but we already reported an error%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void __70__BRCItemCountMismatchReport__finishReport_session_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  OUTLINED_FUNCTION_14();
  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)v1 + 16), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fp_obfuscatedPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v4, "[DEBUG] Telemetry report at %@ succeeded%@", v5);

  OUTLINED_FUNCTION_6();
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  OUTLINED_FUNCTION_14();
  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fp_obfuscatedPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, v4, "[DEBUG] Generating telemetry report at %@%@", v5);

  OUTLINED_FUNCTION_6();
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_557_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] Can't get a shared provider manager%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __95__BRCItemCountMismatchReport_generateReportForSharedFolder_qualityOfService_completionHandler___block_invoke_557_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Failed adopting persona%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
