@implementation BRCFetchParentChainOperation

- (BRCItemID)parentIDToList
{
  CKRecordID *parentRecordID;
  void *v3;
  void *v4;

  parentRecordID = self->_parentRecordID;
  -[BRCServerZone session](self->_serverZone, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecordID brc_itemIDWithSession:](parentRecordID, "brc_itemIDWithSession:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (BRCItemID *)v4;
}

- (BRCFetchParentChainOperation)initWithParentID:(id)a3 sessionContext:(id)a4 zone:(id)a5 isUserWaiting:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BRCFetchParentChainOperation *v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *fetchParentChainCompletionBlocks;
  uint64_t v21;
  CKRecordID *parentRecordID;
  objc_super v24;

  v6 = a6;
  v11 = a3;
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "debugItemIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("fetch-parent/"), "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "metadataSyncContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)BRCFetchParentChainOperation;
  v17 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v24, sel_initWithName_syncContext_sessionContext_, v15, v16, v13);

  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDB9190], "br_fetchParentChain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v17, "setGroup:", v18);

    -[_BRCOperation setNonDiscretionary:](v17, "setNonDiscretionary:", v6);
    v19 = objc_opt_new();
    fetchParentChainCompletionBlocks = v17->_fetchParentChainCompletionBlocks;
    v17->_fetchParentChainCompletionBlocks = (NSMutableArray *)v19;

    objc_storeStrong((id *)&v17->_parentID, a3);
    objc_msgSend(v11, "directoryStructureRecordIDInZone:", v12);
    v21 = objc_claimAutoreleasedReturnValue();
    parentRecordID = v17->_parentRecordID;
    v17->_parentRecordID = (CKRecordID *)v21;

    objc_storeStrong((id *)&v17->_serverZone, a5);
  }

  return v17;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sync/fetch-parent-chain", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_fetchParentChain:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  BRCFetchParentChainOperation *v29;
  _QWORD v30[4];
  id v31;

  v4 = a3;
  if ((objc_msgSend(v4, "brc_isZoneRootRecordID") & 1) != 0
    || objc_msgSend(v4, "brc_isAppLibraryRootRecordID"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCFetchParentChainOperation _fetchParentChain:].cold.1((uint64_t)v5, v6);

    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, 0);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BE17640]);
    objc_msgSend(v4, "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithRecordZoneID:", v8);

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fetchShareRecordsInline");

    v12 = -[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:]([BRCFetchRecordSubResourcesOperation alloc], "initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:", self->_serverZone, self, 0, 1, self->super._sessionContext);
    v13 = objc_alloc(MEMORY[0x24BDB9218]);
    v14 = (void *)objc_msgSend(v13, "initWithRecordID:action:", v4, *MEMORY[0x24BDB8F40]);
    v15 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K == %@ AND %K == %@"), CFSTR("recordIds"), v14, CFSTR("getShareRecords"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91B8]), "initWithRecordType:predicate:", CFSTR("FetchAncestors"), v17);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91C8]), "initWithQuery:", v18);
    objc_msgSend(v4, "zoneID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setZoneID:", v20);

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setResultsLimit:", objc_msgSend(v21, "maxRecordCountInFetchRecordsOperation"));

    objc_msgSend(v19, "setFetchAllResults:", 1);
    objc_msgSend(v19, "setShouldFetchAssetContent:", 0);
    objc_msgSend(v12, "callbackQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCallbackQueue:", v22);

    objc_msgSend(MEMORY[0x24BDB91D8], "desiredKeysWithMask:", 185);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDesiredKeys:", v23);

    v24 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke;
    v30[3] = &unk_24FE404F0;
    v25 = v12;
    v31 = v25;
    objc_msgSend(v19, "setRecordFetchedBlock:", v30);
    v27[0] = v24;
    v27[1] = 3221225472;
    v27[2] = __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_2;
    v27[3] = &unk_24FE40840;
    v28 = v25;
    v29 = self;
    v26 = v25;
    objc_msgSend(v19, "setQueryCompletionBlock:", v27);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v19);

  }
}

uint64_t __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRecord:", a2);
}

void __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "cancel");
    objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", 0, v6);
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_3;
    v10[3] = &unk_24FE3FA88;
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 40);
    v11 = v8;
    v12 = v9;
    v13 = v5;
    objc_msgSend(v8, "notifyWhenRecordsAreFetchedAndFinish:", v10);

  }
}

void __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "error");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "completedWithResult:error:", 0, v9);

  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "saveRecordsWithQueryCursor:", *(_QWORD *)(a1 + 48));
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 504) = objc_msgSend(*(id *)(a1 + 32), "recordsFetched");
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 512) = objc_msgSend(*(id *)(a1 + 32), "recordsFetchedTotalMetadataSize");
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 520) = objc_msgSend(*(id *)(a1 + 32), "xattrsFetchedTotalSize");
    v5 = *(void **)(a1 + 40);
    if (v4)
    {
      objc_msgSend(v5, "completedWithResult:error:", 0, 0);
    }
    else
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_3_cold_1((uint64_t)v6, v7);

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Couldn't allocate ranks when fetching parent chain"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "completedWithResult:error:", 0, v8);

    }
  }
}

- (void)main
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 528);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_230455000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetching parent chain of %@%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __36__BRCFetchParentChainOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 528);
  objc_msgSend(*(id *)(v2 + 248), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "brc_itemIDWithSession:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "serverItemByItemID:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD **)(a1 + 32);
  if (v5)
    objc_msgSend(v6, "completedWithResult:error:", 0, 0);
  else
    objc_msgSend(v6, "_fetchParentChain:", v6[66]);

}

- (void)addFetchParentChainCompletionBlock:(id)a3
{
  id v4;
  BRCFetchParentChainOperation *v5;
  NSMutableArray *fetchParentChainCompletionBlocks;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  fetchParentChainCompletionBlocks = v5->_fetchParentChainCompletionBlocks;
  if (fetchParentChainCompletionBlocks)
  {
    v7 = (void *)MEMORY[0x2348BA0DC](v4);
    -[NSMutableArray addObject:](fetchParentChainCompletionBlocks, "addObject:", v7);

  }
  else
  {
    -[_BRCOperation callbackQueue](v5, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __67__BRCFetchParentChainOperation_addFetchParentChainCompletionBlock___block_invoke;
    v9[3] = &unk_24FE40478;
    v9[4] = v5;
    v10 = v4;
    dispatch_async(v8, v9);

  }
  objc_sync_exit(v5);

}

void __67__BRCFetchParentChainOperation_addFetchParentChainCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  BRCFetchParentChainOperation *v12;
  NSMutableArray *v13;
  NSMutableArray *fetchParentChainCompletionBlocks;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BRCFetchParentChainOperation;
  -[_BRCOperation finishWithResult:error:](&v24, sel_finishWithResult_error_, a3, v6);
  if (!v6 && -[_BRCOperation nonDiscretionary](self, "nonDiscretionary"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCFetchParentChainOperation finishWithResult:error:].cold.1((uint64_t)self, (uint64_t)v7, v8);

    -[_BRCOperation executionTimeInSec](self, "executionTimeInSec");
    v9 = +[AppTelemetryTimeSeriesEvent newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:](AppTelemetryTimeSeriesEvent, "newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:", CFSTR("BRCFetchParentChainOperation"), self->_recordsFetched, self->_recordsFetchedTotalMetadataSize, self->_xattrsFetchedTotalSize);
    -[BRCServerZone session](self->_serverZone, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "analyticsReporter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 11, v9);

  }
  v12 = self;
  objc_sync_enter(v12);
  v13 = v12->_fetchParentChainCompletionBlocks;
  fetchParentChainCompletionBlocks = v12->_fetchParentChainCompletionBlocks;
  v12->_fetchParentChainCompletionBlocks = 0;

  objc_sync_exit(v12);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v13;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19) + 16))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19));
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v17);
  }

}

- (void)cancelToBeReplacedByOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BRCFetchParentChainOperation *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  NSMutableArray *fetchParentChainCompletionBlocks;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint8_t v27[128];
  uint8_t buf[4];
  BRCFetchParentChainOperation *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v29 = self;
    v30 = 2112;
    v31 = v4;
    v32 = 2112;
    v33 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling %@ to be replaced by %@%@", buf, 0x20u);
  }

  if (v4)
  {
    v7 = self;
    objc_sync_enter(v7);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[BRCFetchParentChainOperation dependencies](v7, "dependencies");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(v4, "addDependency:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

    v12 = v7->_fetchParentChainCompletionBlocks;
    fetchParentChainCompletionBlocks = v7->_fetchParentChainCompletionBlocks;
    v7->_fetchParentChainCompletionBlocks = 0;

    objc_sync_exit(v7);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v14 = v12;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(v4, "addFetchParentChainCompletionBlock:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), (_QWORD)v18);
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }

    -[_BRCOperation cancel](v7, "cancel");
    if (-[_BRCOperation isExecuting](v7, "isExecuting"))
      objc_msgSend(v4, "addDependency:", v7);

  }
  else
  {
    -[_BRCOperation cancel](self, "cancel");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchParentChainCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_parentRecordID, 0);
}

- (void)_fetchParentChain:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_230455000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] found zone root record ID%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

void __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't allocate ranks when fetching parent chain%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)finishWithResult:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 528), "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "executionTimeInSec");
  v7 = *(_QWORD *)(a1 + 504);
  v8 = *(_QWORD *)(a1 + 512);
  v9 = *(_QWORD *)(a1 + 520);
  v11 = 138413570;
  v12 = v6;
  v13 = 2048;
  v14 = v10;
  v15 = 2048;
  v16 = v7;
  v17 = 2048;
  v18 = v8;
  v19 = 2048;
  v20 = v9;
  v21 = 2112;
  v22 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetch parent chain of %@ took [%f] Secs and fetched [%llu,%llu] records [%llu] xattrs%@", (uint8_t *)&v11, 0x3Eu);

}

@end
