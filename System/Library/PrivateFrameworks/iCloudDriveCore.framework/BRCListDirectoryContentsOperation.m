@implementation BRCListDirectoryContentsOperation

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (BRCListDirectoryContentsOperation)initWithItemID:(id)a3 sessionContext:(id)a4 zone:(id)a5 isUserWaiting:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BRCListDirectoryContentsOperation *v17;
  uint64_t v18;
  CKRecordID *recordID;
  void *v20;
  void *v21;
  uint64_t v22;
  NSHashTable *delegates;
  void *v24;
  uint64_t v25;
  NSMutableArray *preFlushListCompletionBlocks;
  uint64_t v27;
  NSMutableArray *listCompletionBlocks;
  objc_super v30;

  v6 = a6;
  v11 = a3;
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "debugItemIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("list-dir/"), "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "metadataSyncContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30.receiver = self;
  v30.super_class = (Class)BRCListDirectoryContentsOperation;
  v17 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v30, sel_initWithName_syncContext_sessionContext_, v15, v16, v13);

  if (v17)
  {
    -[_BRCOperation setNonDiscretionary:](v17, "setNonDiscretionary:", v6);
    objc_storeStrong((id *)&v17->_serverZone, a5);
    objc_storeStrong((id *)&v17->_itemID, a3);
    objc_msgSend(v11, "directoryStructureRecordIDInZone:", v12);
    v18 = objc_claimAutoreleasedReturnValue();
    recordID = v17->_recordID;
    v17->_recordID = (CKRecordID *)v18;

    objc_msgSend(v12, "mangledID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v17->_batchSize = objc_msgSend(v21, "maxRecordCountWhenListingDirChanges");
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v22 = objc_claimAutoreleasedReturnValue();
    delegates = v17->_delegates;
    v17->_delegates = (NSHashTable *)v22;

    objc_msgSend(MEMORY[0x24BDB9190], "br_listDirectoryContents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v17, "setGroup:", v24);

    v25 = objc_opt_new();
    preFlushListCompletionBlocks = v17->_preFlushListCompletionBlocks;
    v17->_preFlushListCompletionBlocks = (NSMutableArray *)v25;

    v27 = objc_opt_new();
    listCompletionBlocks = v17->_listCompletionBlocks;
    v17->_listCompletionBlocks = (NSMutableArray *)v27;

    if (v6)
      -[BRCListDirectoryContentsOperation setQueuePriority:](v17, "setQueuePriority:", 8);

  }
  return v17;
}

- (void)beginObservingChangesWithDelegate:(id)a3
{
  id v4;
  objc_super v5;
  objc_super v6;

  v4 = a3;
  if (v4)
  {
    if (!-[NSHashTable containsObject:](self->_delegates, "containsObject:", v4))
    {
      v5.receiver = self;
      v5.super_class = (Class)BRCListDirectoryContentsOperation;
      -[BRCAutoCancelOperation beginObservingChanges](&v5, sel_beginObservingChanges);
      -[NSHashTable addObject:](self->_delegates, "addObject:", v4);
    }
  }
  else
  {
    self->_hasNilDelegate = 1;
    v6.receiver = self;
    v6.super_class = (Class)BRCListDirectoryContentsOperation;
    -[BRCAutoCancelOperation beginObservingChanges](&v6, sel_beginObservingChanges);
  }

}

- (void)endObservingChangesWithDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCListDirectoryContentsOperation;
  v4 = a3;
  -[BRCAutoCancelOperation endObservingChanges](&v5, sel_endObservingChanges);
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v4, v5.receiver, v5.super_class);

}

- (void)cancelToBeReplacedByOperation:(id)a3
{
  id v4;
  BRCListDirectoryContentsOperation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSHashTable *v10;
  NSHashTable *delegates;
  NSMutableArray *v12;
  NSMutableArray *v13;
  NSMutableArray *listCompletionBlocks;
  NSMutableArray *preFlushListCompletionBlocks;
  NSHashTable *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[BRCListDirectoryContentsOperation dependencies](v5, "dependencies");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v42 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "addDependency:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v7);
    }

    v10 = v5->_delegates;
    delegates = v5->_delegates;
    v5->_delegates = 0;

    v12 = v5->_listCompletionBlocks;
    v13 = v5->_preFlushListCompletionBlocks;
    listCompletionBlocks = v5->_listCompletionBlocks;
    v5->_listCompletionBlocks = 0;

    preFlushListCompletionBlocks = v5->_preFlushListCompletionBlocks;
    v5->_preFlushListCompletionBlocks = 0;

    objc_sync_exit(v5);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v16 = v10;
    v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v4, "beginObservingChangesWithDelegate:", v20);
          objc_msgSend(v20, "listOperation:wasReplacedByOperation:", v5, v4);
        }
        v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v17);
    }

    if (v5->_hasNilDelegate)
      objc_msgSend(v4, "beginObservingChangesWithDelegate:", 0);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = v12;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v21);
          objc_msgSend(v4, "addDirectoryListCompletionBlock:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      }
      while (v22);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = v13;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v30;
      do
      {
        for (m = 0; m != v26; ++m)
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(v25);
          objc_msgSend(v4, "addPreFlushDirectoryListCompletionBlock:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * m), (_QWORD)v29);
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
      }
      while (v26);
    }

    -[_BRCOperation cancel](v5, "cancel");
    if (-[_BRCOperation isExecuting](v5, "isExecuting"))
      objc_msgSend(v4, "addDependency:", v5);

  }
  else
  {
    -[_BRCOperation cancel](self, "cancel");
  }

}

- (void)_cursorWasUpdated:(id)a3 subResourcesOp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  BRCServerZone *serverZone;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(v7, "error"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "brc_checkErrorsFromCloudKit:", &__block_literal_global_8),
        v9,
        v10))
  {
    objc_msgSend(v7, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v11);

  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[BRCListDirectoryContentsOperation name](self, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v19;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v12;
      _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ finished listing batch with cursor %@%@", (uint8_t *)&v20, 0x20u);

    }
    if ((objc_msgSend(v7, "saveRecordsWithQueryCursor:", v6) & 1) == 0)
    {
      objc_msgSend(v7, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        serverZone = self->_serverZone;
        objc_msgSend(v7, "pendingChangesStream");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "queryFinishedServerTruthCallback");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "queryFinishedClientTruthCallback");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCServerZone failedListingDirectoryChanges:serverTruthCallback:clientTruthCallback:folderItemID:](serverZone, "failedListingDirectoryChanges:serverTruthCallback:clientTruthCallback:folderItemID:", v16, v17, v18, self->_itemID);

        objc_msgSend(v7, "setQueryFinishedServerTruthCallback:", 0);
        objc_msgSend(v7, "setQueryFinishedClientTruthCallback:", 0);
      }
    }
  }

}

BOOL __70__BRCListDirectoryContentsOperation__cursorWasUpdated_subResourcesOp___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "brc_isCloudKitUnknownItemError") & 1) == 0
    && !objc_msgSend(v2, "brc_isCloudKitAtomicFailure");

  return v3;
}

- (void)_scheduleQueryOp
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(*(_QWORD *)a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_230455000, a2, a3, "[DEBUG] Dropping list directory database because of a token fetch error - %@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_0();
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke(_QWORD *a1, void *a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = *(_QWORD *)(a1[4] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v9;
  v20 = v9;

  v14 = *(_QWORD *)(a1[5] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v10;
  v16 = v10;

  v17 = *(_QWORD *)(a1[6] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v11;
  v19 = v11;

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = a4;
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_76(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_76_cold_1(a1, (uint64_t)v2, v3);

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 552) = objc_msgSend(*(id *)(a1 + 48), "recordsFetched");
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 560) = objc_msgSend(*(id *)(a1 + 48), "recordsFetchedTotalMetadataSize");
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 568) = objc_msgSend(*(id *)(a1 + 48), "xattrsFetchedTotalSize");
  if ((objc_msgSend(*(id *)(a1 + 32), "isNonDesktopRoot") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 56), "changeState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_9:
    objc_msgSend(*(id *)(a1 + 56), "db");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "dbRowID");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "execute:", CFSTR("UPDATE server_items SET item_type = 0, item_rank = NULL WHERE item_id = %@ AND zone_rowid = %@ AND item_type = 9"), v10, v5);
    goto LABEL_10;
  }
  v9 = objc_msgSend(*(id *)(a1 + 56), "isSharedZone");

  if (v9)
    goto LABEL_9;
LABEL_4:
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "debugItemIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Not trying to promote %@ to a normal directory%@", buf, 0x16u);

  }
LABEL_10:

}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_79(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "isNonDesktopRoot"))
  {
    objc_msgSend(*(id *)(a1 + 40), "session");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appLibraryRowID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appLibraryByRowID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setStateBits:", 0x2000000);
    if (objc_msgSend(v4, "isCloudDocsAppLibrary"))
      objc_msgSend(v4, "setStateBits:", 0x4000000);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isDocumentsFolder"))
  {
    objc_msgSend(*(id *)(a1 + 40), "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appLibraryRowID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appLibraryByRowID:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setStateBits:", 0x4000000);
  }
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_80(int8x16_t *a1)
{
  int8x16_t v1;
  _QWORD v2[4];
  int8x16_t v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2;
  v2[3] = &unk_24FE3FA40;
  v1 = a1[2];
  v3 = vextq_s8(v1, v1, 8uLL);
  objc_msgSend((id)v1.i64[0], "notifyWhenRecordsAreFetchedAndFinish:", v2);

}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_cursorWasUpdated:subResourcesOp:", 0, *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "error");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completedWithResult:error:", 0, v3);

}

uint64_t __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_96(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRecordIDToDeserialize:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 536));
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2_97(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "itemTypeByItemID:db:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528), *(_QWORD *)(a1 + 40));

  if (v3 == 10)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2_97_cold_1((uint64_t)v4, v5);

    objc_msgSend(*(id *)(a1 + 48), "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_98;
    v9[3] = &unk_24FE3FA40;
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    dispatch_async(v6, v9);

  }
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_98(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "addRecordIDToDeserialize:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 536));
  v2 = objc_alloc(MEMORY[0x24BDB91E8]);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v3 + 528);
  objc_msgSend(*(id *)(v3 + 520), "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "initShareIDWithItemID:zoneID:", v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "addRecordIDToDeserialize:recordType:", v6, 3);
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2_101(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138413314;
    v18 = v15;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Listing directory contents of %@: Got record: ID [%@] Type [%@], error %@%@", (uint8_t *)&v17, 0x34u);

  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "addRecord:", v8);
  }
  else if (objc_msgSend(v9, "brc_isCloudKitPCSDecryptionFailure")
         && objc_msgSend(*(id *)(a1 + 48), "isPrivateZone"))
  {
    objc_msgSend(*(id *)(a1 + 48), "clientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asPrivateClientZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportProblemWithType:recordName:", 12, v14);

  }
}

uint64_t __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_103(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cursorWasUpdated:subResourcesOp:", a2, *(_QWORD *)(a1 + 40));
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2_105(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "brc_isIgnorableListDirectoryError") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancel");
    objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", 0, v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_cursorWasUpdated:subResourcesOp:", v5, *(_QWORD *)(a1 + 32));
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_3;
    v9[3] = &unk_24FE3FAD8;
    v8 = *(void **)(a1 + 32);
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = v5;
    v11 = *(id *)(a1 + 32);
    v12 = v7;
    objc_msgSend(v8, "notifyWhenRecordsAreFetchedAndFinish:", v9);

  }
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "_cursorWasUpdated:subResourcesOp:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (*(_QWORD *)(a1 + 40))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_3_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "completedWithResult:error:", 0, v3);

  }
}

- (void)main
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 528), "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] Listing directory contents of %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_waitForFlushAndRescheduleApplyIfNecessaryWithError:(id)a3
{
  id v4;
  BRCServerZone *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  BRCListDirectoryContentsOperation *v11;
  BRCServerZone *v12;
  id v13;

  v4 = a3;
  v5 = self->_serverZone;
  -[BRCServerZone clientZone](v5, "clientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke;
    v9[3] = &unk_24FE3FAD8;
    v10 = v6;
    v11 = self;
    v12 = v5;
    v13 = v4;
    dispatch_async(v8, v9);

  }
}

void __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke_2;
  v8[3] = &unk_24FE40868;
  v4 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = *(id *)(a1 + 32);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke_3;
  v5[3] = &unk_24FE3FDA8;
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "performWithFlags:action:whenFlushed:", 4, v8, v5);

}

uint64_t __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke_2(id *a1, void *a2)
{
  id v3;
  BRCItemGlobalID *v4;
  void *v5;
  BRCItemGlobalID *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(a1[4], "rescheduleApply"))
  {
    v4 = [BRCItemGlobalID alloc];
    objc_msgSend(a1[5], "dbRowID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v4, "initWithZoneRowID:itemID:", v5, *((_QWORD *)a1[4] + 66));

    objc_msgSend(a1[6], "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applyScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rescheduleItemsParentedToItemGlobalID:", v6);

  }
  objc_msgSend(v3, "forceBatchStart");

  return 1;
}

void __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 576);
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 584);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 584);
  *(_QWORD *)(v5 + 584) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 576);
  *(_QWORD *)(v7 + 576) = 0;

  objc_sync_exit(v2);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18) + 16))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18));
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

  objc_msgSend(*(id *)(a1 + 48), "scheduleSyncUp", (_QWORD)v19);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  BRCListDirectoryContentsOperation *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _QWORD v34[5];
  _QWORD block[5];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7 && -[_BRCOperation nonDiscretionary](self, "nonDiscretionary"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCListDirectoryContentsOperation finishWithResult:error:].cold.1((uint64_t)self, (uint64_t)v8, v9);

    -[_BRCOperation executionTimeInSec](self, "executionTimeInSec");
    v10 = +[AppTelemetryTimeSeriesEvent newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:](AppTelemetryTimeSeriesEvent, "newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:", CFSTR("BRCListDirectoryContentsOperation"), self->_recordsFetched, self->_recordsFetchedTotalMetadataSize, self->_xattrsFetchedTotalSize);
    -[BRCServerZone session](self->_serverZone, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "analyticsReporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 11, v10);

  }
  objc_msgSend(v7, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDB8EE8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", self->_recordID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "brc_isCloudKitUnknownItemError"))
  {

    goto LABEL_12;
  }
  if (-[BRCItemID isDocumentsFolder](self->_itemID, "isDocumentsFolder"))
  {

  }
  else
  {
    v16 = -[BRCItemID isNonDesktopRoot](self->_itemID, "isNonDesktopRoot");

    if (!v16)
      goto LABEL_12;
  }

  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "db");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "serialQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__BRCListDirectoryContentsOperation_finishWithResult_error___block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_sync(v19, block);

  -[BRCServerZone db](self->_serverZone, "db");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "serialQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  v34[0] = v20;
  v34[1] = 3221225472;
  v34[2] = __60__BRCListDirectoryContentsOperation_finishWithResult_error___block_invoke_2;
  v34[3] = &unk_24FE3FA18;
  v34[4] = self;
  dispatch_sync(v22, v34);

  v7 = 0;
LABEL_12:
  v33.receiver = self;
  v33.super_class = (Class)BRCListDirectoryContentsOperation;
  -[_BRCOperation finishWithResult:error:](&v33, sel_finishWithResult_error_, v6, v7);
  v23 = self;
  objc_sync_enter(v23);
  v24 = (void *)-[NSMutableArray copy](v23->_preFlushListCompletionBlocks, "copy");
  -[NSMutableArray removeAllObjects](v23->_preFlushListCompletionBlocks, "removeAllObjects");
  objc_sync_exit(v23);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = v24;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v25);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v26);
  }

  -[BRCListDirectoryContentsOperation _waitForFlushAndRescheduleApplyIfNecessaryWithError:](v23, "_waitForFlushAndRescheduleApplyIfNecessaryWithError:", v7, (_QWORD)v29);
}

void __60__BRCListDirectoryContentsOperation_finishWithResult_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "isNonDesktopRoot"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "session");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "appLibraryRowID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appLibraryByRowID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setStateBits:", 0x2000000);
    if (objc_msgSend(v4, "isCloudDocsAppLibrary"))
      objc_msgSend(v4, "setStateBits:", 0x4000000);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveAppLibraryToDB:", v4);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "isDocumentsFolder"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "appLibraryRowID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appLibraryByRowID:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setStateBits:", 0x4000000);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "saveAppLibraryToDB:", v9);

  }
}

void __60__BRCListDirectoryContentsOperation_finishWithResult_error___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "checkIfFinishedFullSync");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveServerZoneToDB:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520));

}

- (void)addDirectoryListCompletionBlock:(id)a3
{
  id v4;
  BRCListDirectoryContentsOperation *v5;
  NSMutableArray *listCompletionBlocks;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  listCompletionBlocks = v5->_listCompletionBlocks;
  if (listCompletionBlocks)
  {
    v7 = (void *)MEMORY[0x2348BA0DC](v4);
    -[NSMutableArray addObject:](listCompletionBlocks, "addObject:", v7);

  }
  else
  {
    -[_BRCOperation callbackQueue](v5, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__BRCListDirectoryContentsOperation_addDirectoryListCompletionBlock___block_invoke;
    v9[3] = &unk_24FE40478;
    v9[4] = v5;
    v10 = v4;
    dispatch_async(v8, v9);

  }
  objc_sync_exit(v5);

}

void __69__BRCListDirectoryContentsOperation_addDirectoryListCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)addPreFlushDirectoryListCompletionBlock:(id)a3
{
  id v4;
  BRCListDirectoryContentsOperation *v5;
  NSMutableArray *preFlushListCompletionBlocks;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  preFlushListCompletionBlocks = v5->_preFlushListCompletionBlocks;
  if (!preFlushListCompletionBlocks)
  {
    -[_BRCOperation callbackQueue](v5, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __77__BRCListDirectoryContentsOperation_addPreFlushDirectoryListCompletionBlock___block_invoke;
    v9[3] = &unk_24FE40478;
    v9[4] = v5;
    v10 = v4;
    dispatch_async(v7, v9);

    preFlushListCompletionBlocks = v5->_preFlushListCompletionBlocks;
  }
  v8 = (void *)MEMORY[0x2348BA0DC](v4);
  -[NSMutableArray addObject:](preFlushListCompletionBlocks, "addObject:", v8);

  objc_sync_exit(v5);
}

void __77__BRCListDirectoryContentsOperation_addPreFlushDirectoryListCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (BRCItemID)folderToList
{
  return self->_itemID;
}

- (BOOL)rescheduleApply
{
  return self->_rescheduleApply;
}

- (void)setRescheduleApply:(BOOL)a3
{
  self->_rescheduleApply = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryOp, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_preFlushListCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_listCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_76_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "debugItemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] Finished listing directory contents of %@%@", v6);

  OUTLINED_FUNCTION_6();
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2_97_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_230455000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetching the root as well of this share accept fault%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: !continuationCursor%@", a5, a6, a7, a8, 2u);
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
  v7 = *(_QWORD *)(a1 + 552);
  v8 = *(_QWORD *)(a1 + 560);
  v9 = *(_QWORD *)(a1 + 568);
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
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Listing directory contents of %@ took [%f] Secs and fetched [%llu,%llu] records [%llu] xattrs%@", (uint8_t *)&v11, 0x3Eu);

}

@end
