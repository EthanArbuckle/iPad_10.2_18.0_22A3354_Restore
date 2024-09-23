@implementation BRCPCSChainingOperation

- (BRCPCSChainingOperation)initWithRootItem:(id)a3 appLibrary:(id)a4 sessionContext:(id)a5 syncUpCallback:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BRCPCSChainingOperation *v19;
  void *v20;
  void *v21;
  void *v23;
  NSObject *v24;
  id v25;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v25 = a6;
  v13 = a5;
  objc_msgSend(v11, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "debugItemIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("pcs-chain/"), "stringByAppendingString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[BRCPCSChainingOperation initWithRootItem:appLibrary:sessionContext:syncUpCallback:].cold.1();

  }
  objc_msgSend(v11, "serverZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "metadataSyncContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)BRCPCSChainingOperation;
  v19 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v26, sel_initWithName_syncContext_sessionContext_, v16, v18, v13);

  if (v19)
  {
    objc_storeStrong((id *)&v19->_appLibrary, a4);
    objc_storeStrong((id *)&v19->_rootItem, a3);
    objc_msgSend(v12, "mangledID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_batchSize = objc_msgSend(v21, "pcsChainingBatchSize");

    objc_storeStrong((id *)&v19->_syncUpCallback, a6);
  }

  return v19;
}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "brc_isUserInitiatedRetriable") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[BRCServerItem serverZone](self->_rootItem, "serverZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "brc_isRetriableForPCSChaining")
      && self->_tryCount <= 2
      && (objc_msgSend(v7, "isSyncBlocked") & 1) == 0)
    {
      v5 = 1;
      if (self->_canSyncDownBeforeRetry)
        self->_syncDownBeforeRetry = 1;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sync/pcs-chain", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void (**pcsChainCompletionBlock)(id, uint64_t, id, unint64_t, id);
  id v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listOperation);
  pcsChainCompletionBlock = (void (**)(id, uint64_t, id, unint64_t, id))self->_pcsChainCompletionBlock;
  if (pcsChainCompletionBlock)
  {
    pcsChainCompletionBlock[2](pcsChainCompletionBlock, objc_msgSend(v6, "BOOLValue"), WeakRetained, self->_chainedRecordsCount, v7);
    v10 = self->_pcsChainCompletionBlock;
    self->_pcsChainCompletionBlock = 0;

  }
  objc_msgSend(WeakRetained, "endObservingChangesWithDelegate:", self);
  objc_storeWeak((id *)&self->_listOperation, 0);
  v11.receiver = self;
  v11.super_class = (Class)BRCPCSChainingOperation;
  -[_BRCOperation finishWithResult:error:](&v11, sel_finishWithResult_error_, v6, v7);

}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  BRCListDirectoryContentsOperation **p_listOperation;
  id v7;
  id WeakRetained;
  id obj;

  obj = a4;
  p_listOperation = &self->_listOperation;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_listOperation);

  if (WeakRetained == v7)
    objc_storeWeak((id *)p_listOperation, obj);

}

- (void)_buildRecordListWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  -[BRCServerItem itemID](self->_rootItem, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isDocumentsFolder") & 1) != 0)
    goto LABEL_4;
  -[BRCServerItem itemID](self->_rootItem, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isNonDesktopRoot"))
  {

LABEL_4:
    goto LABEL_5;
  }
  -[BRCServerItem st](self->_rootItem, "st");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logicalName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR(".Trash"));

  if ((v12 & 1) == 0)
  {
    -[BRCAppLibrary session](self->_appLibrary, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientTruthWorkloop");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke;
    v15[3] = &unk_24FE409B8;
    v15[4] = self;
    v16 = v4;
    dispatch_async(v14, v15);

    goto LABEL_8;
  }
LABEL_5:
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    -[BRCPCSChainingOperation _buildRecordListWithCompletion:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: Can't PCS chain to documents, trash, or root"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

LABEL_8:
}

void __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  BRCPCSChainBatchInfo *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BRCPCSChainInfo *v14;
  BRCPCSChainEnumerator *v15;
  void *v16;
  BRCPCSChainInfo *v17;
  BRCPCSChainEnumerator *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  BRCPCSChainInfo *v32;
  int v33;
  void *v34;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 512);
  if (!v2)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_3();

  }
  if ((objc_msgSend(v2, "pcsChainState") & 0xFFFFFFFE) != 2)
  {
    v5 = -[BRCPCSChainBatchInfo initWithAppLibrary:]([BRCPCSChainBatchInfo alloc], "initWithAppLibrary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504));
    v6 = objc_msgSend(v2, "isDocument");
    v32 = [BRCPCSChainInfo alloc];
    objc_msgSend(v2, "itemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "parentItemIDOnServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "st");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "ckInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v6;
    if (v6)
    {
      objc_msgSend(v2, "latestVersion");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "ckInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v2, "st");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "type");
    if (objc_msgSend(v2, "isBRAlias"))
      v13 = objc_msgSend(v2, "aliasTargetIsShared");
    else
      v13 = 1;
    LODWORD(v30) = objc_msgSend(v2, "pcsChainState");
    v14 = -[BRCPCSChainInfo initWithItemID:parentID:structuralCKInfo:contentCKInfo:itemType:aliasTargetZoneIsShared:chainState:](v32, "initWithItemID:parentID:structuralCKInfo:contentCKInfo:itemType:aliasTargetZoneIsShared:chainState:", v7, v8, v9, v10, v12, v13, v30);

    if (v33)
    {

      -[BRCPCSChainBatchInfo addFullyChainedRecordInfo:](v5, "addFullyChainedRecordInfo:", v14);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 520) = 1;
    }
    else
    {

      v15 = [BRCPCSChainEnumerator alloc];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "defaultClientZone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      v18 = -[BRCPCSChainEnumerator initWithPCSChainInfo:clientZone:](v15, "initWithPCSChainInfo:clientZone:", v14, v16);

      if (-[BRCPCSChainBatchInfo batchCount](v5, "batchCount") >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528))
      {
        v20 = 0;
      }
      else
      {
        v19 = 0;
        do
        {
          -[BRCPCSChainEnumerator nextObject](v18, "nextObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
            break;
          -[BRCPCSChainBatchInfo addFullyChainedRecordInfo:](v5, "addFullyChainedRecordInfo:", v20);
          v19 = v20;
        }
        while (-[BRCPCSChainBatchInfo batchCount](v5, "batchCount") < *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
      }
      -[BRCPCSChainEnumerator error](v18, "error");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        v14 = v17;
LABEL_30:

        goto LABEL_31;
      }
      if (!v20)
      {
        -[BRCPCSChainEnumerator itemIDNeedingListing](v18, "itemIDNeedingListing");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v2, "clientZone");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v23, objc_msgSend(*(id *)(a1 + 32), "nonDiscretionary"), 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "beginObservingChangesWithDelegate:", *(_QWORD *)(a1 + 32));
          objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 552), v25);
          if (!v25)
          {
            brc_bread_crumbs();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
              __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_2();

          }
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 520) = 1;
        }

      }
      v14 = v17;
    }
    -[BRCPCSChainBatchInfo prepareFirstPhaseRecordBatch](v5, "prepareFirstPhaseRecordBatch");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544) = -[BRCPCSChainBatchInfo chainedRecordsCount](v5, "chainedRecordsCount");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_30;
  }
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 520) = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_31:

}

- (void)_sendRecordBatch:(id)a3 completion:(id)a4
{
  -[BRCPCSChainingOperation _sendRecordBatch:recursed:completion:](self, "_sendRecordBatch:recursed:completion:", a3, 0, a4);
}

- (void)_sendRecordBatch:(id)a3 recursed:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  BOOL v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD block[4];
  id v36;
  const __CFString *v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v21 = a5;
  v20 = v8;
  if (objc_msgSend(v8, "count"))
  {
    v19 = a4;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v32;
      v12 = MEMORY[0x24BDBD1C8];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
          v37 = CFSTR("br_pcsChainingUpdate");
          v38 = v12;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setPluginFields:", v15);

          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v10);
    }

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__36;
    v29[4] = __Block_byref_object_dispose__36;
    v30 = 0;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9158]), "initWithRecordsToSave:recordIDsToDelete:", v9, 0);
    objc_msgSend(v16, "setSavePolicy:", 0);
    objc_msgSend(v16, "setAtomic:", 1);
    v17 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_168;
    v25[3] = &unk_24FE46F58;
    v28 = v19;
    v25[4] = self;
    v27 = v29;
    v26 = v9;
    objc_msgSend(v16, "setPerRecordCompletionBlock:", v25);
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_171;
    v22[3] = &unk_24FE46F80;
    v24 = v29;
    v22[4] = self;
    v23 = v21;
    objc_msgSend(v16, "setModifyRecordsCompletionBlock:", v22);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v16);

    _Block_object_dispose(v29, 8);
  }
  else
  {
    -[_BRCOperation callbackQueue](self, "callbackQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke;
    block[3] = &unk_24FE41D98;
    v36 = v21;
    dispatch_async(v18, block);

  }
}

uint64_t __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_168(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  BRCItemID *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  BRCItemID *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  _QWORD block[4];
  id v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "defaultClientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serialQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v9);

  v58 = 0;
  LODWORD(v9) = objc_msgSend(v6, "brc_isCloudKitErrorReparentedToNewParent:", &v58);
  v10 = v58;
  v11 = v10;
  if ((_DWORD)v9 && !*(_BYTE *)(a1 + 56) && v10)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v12)
    {
      v13 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v17)
    {
      v18 = v17;
      v47 = v7;
      v48 = v6;
      v49 = v11;
      v19 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v55 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v21, "recordID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "recordID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqual:", v23);

          if (v24)
          {
            brc_bread_crumbs();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = v49;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v60 = v21;
              v61 = 2112;
              v62 = v49;
              v63 = 2112;
              v64 = v31;
              _os_log_impl(&dword_230455000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Got an error indicating we need to reparent %@ to %@%@", buf, 0x20u);
            }

            v7 = v47;
            objc_msgSend(v47, "serverZone");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = v48;
            if ((objc_msgSend(v49, "hasPrefix:", CFSTR("directory/")) & 1) == 0)
            {
              brc_bread_crumbs();
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
                __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_168_cold_1();

              v33 = v49;
            }
            objc_msgSend(v33, "substringFromIndex:", objc_msgSend(CFSTR("directory/"), "length"));
            v35 = objc_claimAutoreleasedReturnValue();
            v45 = [BRCItemID alloc];
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "dbRowID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "dbRowID");
            v37 = v34;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)v35;
            v39 = -[BRCItemID initWithString:libraryRowID:sharedZoneRowID:](v45, "initWithString:libraryRowID:sharedZoneRowID:", v35, v36, v38);

            -[BRCItemID validatingDirectoryReferenceInZone:](v39, "validatingDirectoryReferenceInZone:", v37);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "parent");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
            {
              -[BRCItemID pcsChainParentReferenceInZone:](v39, "pcsChainParentReferenceInZone:", v37);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setParent:", v42);

            }
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v40, CFSTR("parent"));

            goto LABEL_28;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
        if (v18)
          continue;
        break;
      }
      v7 = v47;
      v6 = v48;
LABEL_28:
      v11 = v49;
    }
    goto LABEL_29;
  }
  if (objc_msgSend(v6, "brc_isIndividualItemBlacklistError"))
  {
    objc_msgSend(v7, "db");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "serialQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_169;
    block[3] = &unk_24FE3FA88;
    v27 = v7;
    v28 = *(_QWORD *)(a1 + 32);
    v51 = v27;
    v52 = v28;
    v53 = v5;
    dispatch_sync(v26, block);

    v16 = v51;
LABEL_29:

    goto LABEL_30;
  }
  if (v6 && (objc_msgSend(v6, "brc_isCloudKitAtomicFailure") & 1) == 0)
  {
    brc_bread_crumbs();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "brc_telemetryReportableErrorWithRecordName:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v60 = v30;
      v61 = 2112;
      v62 = v5;
      v63 = 2112;
      v64 = v16;
      _os_log_impl(&dword_230455000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] Encountered pcs chaining error %@ for record %@%@", buf, 0x20u);

    }
    goto LABEL_29;
  }
LABEL_30:

}

void __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_169(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  objc_msgSend(*(id *)(a1[5] + 512), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemByItemID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "localDiffs") & 0x20) != 0 && objc_msgSend(v4, "needsSyncUp"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      v10 = a1[6];
      v11 = 138412802;
      v12 = v4;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_230455000, v6, (os_log_type_t)0x90u, "[ERROR] Blocking %@ from sync up until it is next modified because the server failed to pcs chain %@ with a permanent error%@", (uint8_t *)&v11, 0x20u);
    }

    v7 = (void *)a1[4];
    v8 = *(void **)(a1[5] + 560);
    objc_msgSend(v7, "dbRowID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "blockSyncUpCallback:inZone:", v4, v9);

  }
}

uint64_t __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_171(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a4);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_230455000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Retrying with new record batch because we were told about a new parent - %@%@", (uint8_t *)&v9, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_sendRecordBatch:recursed:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 1, *(_QWORD *)(a1 + 40));
}

- (void)_chainRecords
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __40__BRCPCSChainingOperation__chainRecords__block_invoke;
  v2[3] = &unk_24FE46FD0;
  v2[4] = self;
  -[BRCPCSChainingOperation _buildRecordListWithCompletion:](self, "_buildRecordListWithCompletion:", v2);
}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  unsigned __int8 *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      __40__BRCPCSChainingOperation__chainRecords__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v6);
  }
  else
  {
    v9 = *(unsigned __int8 **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v5, "recordsForFirstPhase");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __40__BRCPCSChainingOperation__chainRecords__block_invoke_174;
      v12[3] = &unk_24FE46FA8;
      v12[4] = *(_QWORD *)(a1 + 32);
      v13 = v5;
      objc_msgSend(v9, "_sendRecordBatch:completion:", v10, v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9[520]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "completedWithResult:error:", v11, 0);

    }
  }

}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke_174(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  if (v5)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
      __40__BRCPCSChainingOperation__chainRecords__block_invoke_174_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "chainPreparedRecordBatch:", a2);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "recordsForSecondPhase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __40__BRCPCSChainingOperation__chainRecords__block_invoke_175;
    v11[3] = &unk_24FE46FA8;
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    objc_msgSend(v8, "_sendRecordBatch:completion:", v9, v11);

  }
}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  unsigned __int8 *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      __40__BRCPCSChainingOperation__chainRecords__block_invoke_175_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "defaultClientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serverZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "halfChainedRecordMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "db");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __40__BRCPCSChainingOperation__chainRecords__block_invoke_176;
    v23[3] = &unk_24FE44FE0;
    v24 = *(id *)(a1 + 40);
    v14 = v11;
    v25 = v14;
    v26 = v10;
    v27 = *(_QWORD *)(a1 + 32);
    v15 = v5;
    v28 = v15;
    v7 = v10;
    objc_msgSend(v12, "performWithFlags:action:", 25, v23);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "db");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __40__BRCPCSChainingOperation__chainRecords__block_invoke_182;
    v19[3] = &unk_24FE46108;
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v15;
    v21 = v14;
    v22 = *(id *)(a1 + 40);
    v8 = v14;
    objc_msgSend(v16, "performWithFlags:action:", 5, v19);

  }
  v17 = *(unsigned __int8 **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17[520]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "completedWithResult:error:", v18, v6);

}

uint64_t __40__BRCPCSChainingOperation__chainRecords__block_invoke_176(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  BRFieldCKInfo *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  void *v39;
  BRFieldCKInfo *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v53;
  id obj;
  id obja;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "should2PhasePCSChain"))
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "objectEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v61 != v4)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v6, "record");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          brc_bread_crumbs();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "recordID");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v66 = v10;
            v67 = 2112;
            v68 = v8;
            _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Learning etag in the server truth for half chained parent %@%@", buf, 0x16u);

          }
          v11 = -[BRFieldCKInfo initWithRecord:]([BRFieldCKInfo alloc], "initWithRecord:", v7);
          objc_msgSend(v7, "recordID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "session");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "brc_itemIDWithSession:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 48), "db");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "dbRowID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "ckInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "execute:", CFSTR("UPDATE server_items SET item_stat_ckinfo = %@, pcs_state = 4 WHERE item_id = %@ AND zone_rowid = %@ AND item_stat_ckinfo = %@"), v11, v14, v16, v17);

          objc_msgSend(*(id *)(a1 + 48), "db");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "changes");

          if (!v19)
          {
            brc_bread_crumbs();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v20;
              _os_log_impl(&dword_230455000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Uh oh... the record changed server side while we were mid pcs chain batch.  We might have oplock conflicts%@", buf, 0xCu);
            }

          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 512), "itemID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToItemID:", v14);

          if (v23)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 512), "st");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setCkInfo:", v11);

          }
        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v3);
    }

  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obja = *(id *)(a1 + 64);
  v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v57;
    v28 = CFSTR("UPDATE server_items SET pcs_state = 3 WHERE item_id = %@ AND zone_rowid = %@ AND pcs_state != 2");
    do
    {
      v29 = 0;
      v53 = v26;
      do
      {
        if (*(_QWORD *)v57 != v27)
          objc_enumerationMutation(obja);
        v30 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v29);
        objc_msgSend(v30, "recordID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "session");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "brc_itemIDWithSession:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(*(id *)(a1 + 32), "should2PhasePCSChain") & 1) != 0
          || (v34 = *(void **)(a1 + 40),
              objc_msgSend(v30, "recordID"),
              v35 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v34, "objectForKeyedSubscript:", v35),
              v36 = (void *)objc_claimAutoreleasedReturnValue(),
              v35,
              !v36))
        {
          objc_msgSend(v30, "parent");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v46)
          {
            brc_bread_crumbs();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v47;
              _os_log_fault_impl(&dword_230455000, v48, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: record.parent%@", buf, 0xCu);
            }

          }
          objc_msgSend(*(id *)(a1 + 48), "db");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "dbRowID");
          v40 = (BRFieldCKInfo *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "execute:", v28, v33, v40);
        }
        else
        {
          v37 = v27;
          v38 = v28;
          objc_msgSend(v30, "parent");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            brc_bread_crumbs();
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v49;
              _os_log_fault_impl(&dword_230455000, v50, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !record.parent%@", buf, 0xCu);
            }

          }
          v40 = -[BRFieldCKInfo initWithRecord:]([BRFieldCKInfo alloc], "initWithRecord:", v30);
          objc_msgSend(*(id *)(a1 + 48), "db");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "dbRowID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "ckInfo");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "execute:", CFSTR("UPDATE server_items SET item_stat_ckinfo = %@, pcs_state = 4 WHERE item_id = %@ AND zone_rowid = %@ AND item_stat_ckinfo = %@"), v40, v33, v42, v43);

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 512), "itemID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v43) = objc_msgSend(v44, "isEqualToItemID:", v33);

          if ((_DWORD)v43)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 512), "st");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setCkInfo:", v40);

          }
          v28 = v38;
          v27 = v37;
          v26 = v53;
        }

        ++v29;
      }
      while (v26 != v29);
      v51 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      v26 = v51;
    }
    while (v51);
  }

  return 1;
}

uint64_t __40__BRCPCSChainingOperation__chainRecords__block_invoke_182(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "defaultClientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "learnCKInfosFromSavedRecords:isOutOfBandModifyRecords:", *(_QWORD *)(a1 + 40), 1);

  if (objc_msgSend(*(id *)(a1 + 48), "count") && objc_msgSend(*(id *)(a1 + 56), "should2PhasePCSChain"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "objectEnumerator", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "record");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "defaultClientZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "learnCKInfosFromSavedRecords:isOutOfBandModifyRecords:", v3, 1);

  }
  return 1;
}

- (void)main
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  BRCPCSChainingOperation *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  ++self->_tryCount;
  self->_completed = 0;
  if (self->_canSyncDownBeforeRetry && self->_syncDownBeforeRetry)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_230455000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Syncing down before retrying %@%@", buf, 0x16u);
    }

    -[BRCAppLibrary session](self->_appLibrary, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientTruthWorkloop");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__BRCPCSChainingOperation_main__block_invoke;
    block[3] = &unk_24FE3FA18;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    -[BRCPCSChainingOperation _chainRecords](self, "_chainRecords");
  }
}

void __31__BRCPCSChainingOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "clientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__BRCPCSChainingOperation_main__block_invoke_2;
  v4[3] = &unk_24FE46FF8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "performBlock:whenSyncDownCompletesLookingForItemID:", v4, v3);

}

void __31__BRCPCSChainingOperation_main__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientTruthWorkloop");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__BRCPCSChainingOperation_main__block_invoke_3;
  block[3] = &unk_24FE3FA18;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v3, block);

}

void __31__BRCPCSChainingOperation_main__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "clientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemByItemID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "clientZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serverItemByItemID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 512), v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "overrideCKInfoIfNecessaryForOutOfBandSyncOpWithLocalItem:", v4);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 512);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Refreshed root item from db %@%@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't refresh item from the database%@", (uint8_t *)&v11, 0xCu);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "_chainRecords");
}

- (id)pcsChainCompletionBlock
{
  return self->_pcsChainCompletionBlock;
}

- (void)setPcsChainCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (BOOL)shouldFillBatch
{
  return self->_shouldFillBatch;
}

- (void)setShouldFillBatch:(BOOL)a3
{
  self->_shouldFillBatch = a3;
}

- (BOOL)canSyncDownBeforeRetry
{
  return self->_canSyncDownBeforeRetry;
}

- (void)setCanSyncDownBeforeRetry:(BOOL)a3
{
  self->_canSyncDownBeforeRetry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pcsChainCompletionBlock, 0);
  objc_storeStrong((id *)&self->_syncUpCallback, 0);
  objc_destroyWeak((id *)&self->_listOperation);
  objc_storeStrong((id *)&self->_rootItem, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
}

- (void)initWithRootItem:appLibrary:sessionContext:syncUpCallback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: rootItem%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_buildRecordListWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Can't PCS chain to documents, trash, or root%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] %@ is already chained%@");
  OUTLINED_FUNCTION_0();
}

void __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: listOp%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: si%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_168_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: [newParent hasPrefix:kBRRecordIDPrefixDirectoryStructure]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Failed iterating PCS - %@%@");
  OUTLINED_FUNCTION_0();
}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke_174_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] failed sending first PCS step - %@%@");
  OUTLINED_FUNCTION_0();
}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke_175_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Failed sending second PCS step - %@%@");
  OUTLINED_FUNCTION_0();
}

@end
