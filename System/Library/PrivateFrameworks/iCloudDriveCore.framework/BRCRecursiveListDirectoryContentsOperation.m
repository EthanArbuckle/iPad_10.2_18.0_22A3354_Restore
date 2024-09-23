@implementation BRCRecursiveListDirectoryContentsOperation

- (BRCRecursiveListDirectoryContentsOperation)initWithItemID:(id)a3 sessionContext:(id)a4 zone:(id)a5 isUserWaiting:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BRCRecursiveListDirectoryContentsOperation *v17;
  uint64_t v18;
  NSMutableSet *itemsToList;
  uint64_t v20;
  NSMutableSet *itemsFailedListing;
  void *v22;
  uint64_t v23;
  NSMutableArray *recursiveListCompletionBlocks;
  objc_super v26;

  v6 = a6;
  v11 = a3;
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "debugItemIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("rec-list-dir/"), "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "metadataSyncContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)BRCRecursiveListDirectoryContentsOperation;
  v17 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v26, sel_initWithName_syncContext_sessionContext_, v15, v16, v13);

  if (v17)
  {
    -[_BRCOperation setNonDiscretionary:](v17, "setNonDiscretionary:", v6);
    objc_storeStrong((id *)&v17->_serverZone, a5);
    v18 = objc_opt_new();
    itemsToList = v17->_itemsToList;
    v17->_itemsToList = (NSMutableSet *)v18;

    objc_storeStrong((id *)&v17->_rootItemID, a3);
    v20 = objc_opt_new();
    itemsFailedListing = v17->_itemsFailedListing;
    v17->_itemsFailedListing = (NSMutableSet *)v20;

    objc_msgSend(MEMORY[0x24BDB9190], "br_listDirectoryContents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v17, "setGroup:", v22);

    v23 = objc_opt_new();
    recursiveListCompletionBlocks = v17->_recursiveListCompletionBlocks;
    v17->_recursiveListCompletionBlocks = (NSMutableArray *)v23;

  }
  return v17;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)cancel
{
  BRCRecursiveListDirectoryContentsOperation *v2;
  BRCListDirectoryContentsOperation *activeListOp;
  objc_super v4;

  v2 = self;
  objc_sync_enter(v2);
  -[BRCListDirectoryContentsOperation endObservingChangesWithDelegate:](v2->_activeListOp, "endObservingChangesWithDelegate:", v2);
  activeListOp = v2->_activeListOp;
  v2->_activeListOp = 0;

  objc_sync_exit(v2);
  v4.receiver = v2;
  v4.super_class = (Class)BRCRecursiveListDirectoryContentsOperation;
  -[_BRCOperation cancel](&v4, sel_cancel);
  -[_BRCOperation finishIfCancelled](v2, "finishIfCancelled");
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  if (self->_activeListOp == a3)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_activeListOp, a4);
    v7 = v8;
  }

}

- (BOOL)_finishIfBlockedFromListing
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isSideSyncOperationBlockedWithName:", CFSTR("rec-list fetch next item"));

  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't list anymore in the middle of a rec-list operation%@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorSyncBlocked");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0, v7);

  }
  return v4;
}

- (void)fetchNextItemToList
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  if (!-[_BRCOperation finishIfCancelled](self, "finishIfCancelled"))
  {
    -[BRCServerZone clientZone](self->_serverZone, "clientZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serverZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "db");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __65__BRCRecursiveListDirectoryContentsOperation_fetchNextItemToList__block_invoke;
    v8[3] = &unk_24FE3FA40;
    v8[4] = self;
    v9 = v3;
    v7 = v3;
    dispatch_async(v6, v8);

  }
}

void __65__BRCRecursiveListDirectoryContentsOperation_fetchNextItemToList__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  if ((objc_msgSend(*(id *)(a1 + 32), "_finishIfBlockedFromListing") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "mangledID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "recursiveListFetchDirFaultBatchSize");

    objc_msgSend(*(id *)(a1 + 40), "serverZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "db");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65__BRCRecursiveListDirectoryContentsOperation_fetchNextItemToList__block_invoke_2;
    v9[3] = &unk_24FE40890;
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    v12 = v4;
    objc_msgSend(v6, "performWithFlags:action:", 8, v9);

  }
}

uint64_t __65__BRCRecursiveListDirectoryContentsOperation_fetchNextItemToList__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dbRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  v5 = (void *)objc_msgSend(v3, "fetch:", CFSTR("WITH RECURSIVE item_children (item_id, zone_rowid, item_type) AS(    SELECT item_id, zone_rowid, item_type FROM server_items      WHERE zone_rowid = %@ AND item_parent_id = %@ AND item_type IN (0, 9, 10) AND NOT item_id_is_documents(item_id)  UNION ALL     SELECT si.item_id, si.zone_rowid, si.item_type FROM server_items AS si INNER JOIN item_children AS p WHERE si.item_parent_id = p.item_id AND si.zone_rowid = p.zone_rowid AND si.item_type IN (0, 9, 10)) SELECT item_id FROM item_children WHERE item_type IN (9, 10)"), v4, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 536));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "enumerateObjectsOfClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
      if (objc_msgSend(v11, "isDocumentsFolder"))
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v16;
          _os_log_fault_impl(&dword_230455000, v12, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !childID.isDocumentsFolder%@", buf, 0xCu);
        }

      }
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 528), "containsObject:", v11))
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v17;
          _os_log_fault_impl(&dword_230455000, v15, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: ![self->_itemsToList containsObject:childID]%@", buf, 0xCu);
        }

      }
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 552), "containsObject:", v11) & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 528), "addObject:", v11);
        if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 528), "count") >= *(_QWORD *)(a1 + 48))
          break;
      }
      if (v8 == ++v10)
      {
        v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        v8 = v13;
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "listNextItem");
  return 1;
}

- (void)listOrFetchNextItem
{
  if (-[NSMutableSet count](self->_itemsToList, "count"))
    -[BRCRecursiveListDirectoryContentsOperation listNextItem](self, "listNextItem");
  else
    -[BRCRecursiveListDirectoryContentsOperation fetchNextItemToList](self, "fetchNextItemToList");
}

- (void)listNextItem
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  if (!-[_BRCOperation finishIfCancelled](self, "finishIfCancelled"))
  {
    -[BRCServerZone clientZone](self->_serverZone, "clientZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "db");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke;
    v7[3] = &unk_24FE3FA40;
    v7[4] = self;
    v8 = v3;
    v6 = v3;
    dispatch_async(v5, v7);

  }
}

void __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  BRCItemGlobalID *v10;
  void *v11;
  BRCItemGlobalID *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "_finishIfBlockedFromListing") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "anyObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(id **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v3[66], "removeObject:", v2);
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v18 = *(void **)(a1 + 32);
        objc_msgSend(v2, "debugDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v31 = v18;
        v32 = 2112;
        v33 = v19;
        v34 = 2112;
        v35 = v4;
        _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ listing next item %@%@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "clientZone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v2, objc_msgSend(*(id *)(a1 + 32), "nonDiscretionary"), objc_msgSend(*(id *)(a1 + 32), "rescheduleApply"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = *(_QWORD *)(a1 + 32);
      if (v7)
      {
        objc_msgSend(v7, "beginObservingChangesWithDelegate:", v8);
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke_176;
        v28[3] = &unk_24FE408B8;
        v28[4] = *(_QWORD *)(a1 + 32);
        v29 = v2;
        objc_msgSend(v7, "addPreFlushDirectoryListCompletionBlock:", v28);
        v9 = *(id *)(a1 + 32);
        objc_sync_enter(v9);
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 544), v7);
        objc_sync_exit(v9);

      }
      else
      {
        if ((objc_msgSend(v2, "isEqualToItemID:", *(_QWORD *)(v8 + 536)) & 1) == 0)
        {
          brc_bread_crumbs();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v2, "debugItemIDString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v31 = v17;
            v32 = 2112;
            v33 = v15;
            _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] ItemID %@ isn't able to be listed%@", buf, 0x16u);

          }
        }
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "containsObject:", v2))
        {
          brc_bread_crumbs();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke_cold_1((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);

        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "addObject:", v2);
        objc_msgSend(*(id *)(a1 + 32), "listOrFetchNextItem");
      }

    }
    else
    {
      if (objc_msgSend(v3, "rescheduleApply"))
      {
        v10 = [BRCItemGlobalID alloc];
        objc_msgSend(*(id *)(a1 + 40), "dbRowID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[BRCItemGlobalID initWithZoneRowID:itemID:](v10, "initWithZoneRowID:itemID:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536));

        objc_msgSend(*(id *)(a1 + 40), "session");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "applyScheduler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "rescheduleItemsRecursivelyUnderFolder:", v12);

      }
      objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, 0);
    }

  }
}

void __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke_176(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled") & 1) == 0)
  {
    if (objc_msgSend(v3, "brc_isIgnorableListDirectoryError"))
    {
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "debugItemIDString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412802;
        v9 = v6;
        v10 = 2112;
        v11 = v7;
        v12 = 2112;
        v13 = v4;
        _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Continuing %@ after encountering a ignorable error for %@%@", (uint8_t *)&v8, 0x20u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "addObject:", *(_QWORD *)(a1 + 40));

      goto LABEL_8;
    }
    if (!v3)
    {
LABEL_8:
      objc_msgSend(*(id *)(a1 + 32), "listOrFetchNextItem");
      v3 = 0;
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v3);
  }
LABEL_9:

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  BRCRecursiveListDirectoryContentsOperation *v7;
  NSMutableArray *v8;
  NSMutableArray *recursiveListCompletionBlocks;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BRCRecursiveListDirectoryContentsOperation;
  -[_BRCOperation finishWithResult:error:](&v19, sel_finishWithResult_error_, a3, v6);
  v7 = self;
  objc_sync_enter(v7);
  v8 = v7->_recursiveListCompletionBlocks;
  recursiveListCompletionBlocks = v7->_recursiveListCompletionBlocks;
  v7->_recursiveListCompletionBlocks = 0;

  objc_sync_exit(v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v8;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v12);
  }

}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCRecursiveListDirectoryContentsOperation;
  -[BRCAutoCancelOperation main](&v6, sel_main);
  if (!-[BRCItemID isDocumentsFolder](self->_rootItemID, "isDocumentsFolder")
    && !-[BRCItemID isNonDesktopRoot](self->_rootItemID, "isNonDesktopRoot"))
  {
    goto LABEL_8;
  }
  -[BRCServerZone session](self->_serverZone, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCItemID appLibraryRowID](self->_rootItemID, "appLibraryRowID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appLibraryByRowID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((!-[BRCItemID isDocumentsFolder](self->_rootItemID, "isDocumentsFolder")
     || (objc_msgSend(v5, "state") & 0x4000000) == 0)
    && (!-[BRCItemID isNonDesktopRoot](self->_rootItemID, "isNonDesktopRoot")
     || (objc_msgSend(v5, "state") & 0x2000000) == 0))
  {

LABEL_8:
    -[NSMutableSet addObject:](self->_itemsToList, "addObject:", self->_rootItemID);
    -[BRCRecursiveListDirectoryContentsOperation listNextItem](self, "listNextItem");
    return;
  }
  -[BRCRecursiveListDirectoryContentsOperation fetchNextItemToList](self, "fetchNextItemToList");

}

- (void)addRecursiveDirectoryListCompletionBlock:(id)a3
{
  id v4;
  BRCRecursiveListDirectoryContentsOperation *v5;
  NSMutableArray *recursiveListCompletionBlocks;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  recursiveListCompletionBlocks = v5->_recursiveListCompletionBlocks;
  if (recursiveListCompletionBlocks)
  {
    v7 = (void *)MEMORY[0x2348BA0DC](v4);
    -[NSMutableArray addObject:](recursiveListCompletionBlocks, "addObject:", v7);

  }
  else
  {
    -[_BRCOperation callbackQueue](v5, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __87__BRCRecursiveListDirectoryContentsOperation_addRecursiveDirectoryListCompletionBlock___block_invoke;
    v9[3] = &unk_24FE40478;
    v9[4] = v5;
    v10 = v4;
    dispatch_async(v8, v9);

  }
  objc_sync_exit(v5);

}

void __87__BRCRecursiveListDirectoryContentsOperation_addRecursiveDirectoryListCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

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
  objc_storeStrong((id *)&self->_recursiveListCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_itemsFailedListing, 0);
  objc_storeStrong((id *)&self->_activeListOp, 0);
  objc_storeStrong((id *)&self->_rootItemID, 0);
  objc_storeStrong((id *)&self->_itemsToList, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
}

void __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: ![self->_itemsFailedListing containsObject:itemID]%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

@end
