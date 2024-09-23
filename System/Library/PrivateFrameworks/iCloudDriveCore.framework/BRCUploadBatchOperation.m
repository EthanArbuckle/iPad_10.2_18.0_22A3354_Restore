@implementation BRCUploadBatchOperation

- (BRCUploadBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 clientZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BRCUploadBatchOperation *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  objc_super v23;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "contextIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("upload"), "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fsUploader");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hasWorkGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23.receiver = self;
  v23.super_class = (Class)BRCUploadBatchOperation;
  v16 = -[BRCTransferBatchOperation initWithName:syncContext:sessionContext:group:](&v23, sel_initWithName_syncContext_sessionContext_group_, v12, v8, v10, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_clientZone, a5);
    -[_BRCOperation callbackQueue](v16, "callbackQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fsUploader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uploadsDeadlineScheduler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "workloop");
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v17, v21);

  }
  return v16;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "upload", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)addItem:(id)a3 stageID:(id)a4 record:(id)a5 transferSize:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  BRCUpload *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[BRCUpload initWithDocument:stageID:transferSize:]([BRCUpload alloc], "initWithDocument:stageID:transferSize:", v12, v11, a6);

  -[BRCUpload setRecord:](v13, "setRecord:", v10);
  -[BRCTransferBatchOperation addTransfer:](self, "addTransfer:", v13);

}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BRCUploadBatchOperation perUploadCompletionBlock](self, "perUploadCompletionBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCSyncContext session](self->super.super._syncContext, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "clientDB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__BRCUploadBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
    block[3] = &unk_24FE431A0;
    v18 = v8;
    v16 = v6;
    v17 = v7;
    dispatch_sync(v12, block);

  }
  else
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v13;
      _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] No per upload completion block for %@, error %@%@", buf, 0x20u);
    }

  }
}

uint64_t __64__BRCUploadBatchOperation_sendTransferCompletionCallBack_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_publishUploadProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id from;
  _BYTE location[12];
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("ICDProgressObjectID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDC82E8], "br_fpItemIDFromItemIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_initWeak((id *)location, v5);
    objc_initWeak(&from, v4);
    objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __50__BRCUploadBatchOperation__publishUploadProgress___block_invoke;
    v12[3] = &unk_24FE431C8;
    v13 = v7;
    objc_copyWeak(&v15, (id *)location);
    v14 = v4;
    objc_copyWeak(&v16, &from);
    objc_msgSend(v9, "fetchURLForItemID:completionHandler:", v8, v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
  }
  else
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = self;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Can't find a file provider item ID for %@%@", location, 0x20u);
    }

  }
}

void __50__BRCUploadBatchOperation__publishUploadProgress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v15 = 138412802;
      v16 = v9;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = WeakRetained;
      _os_log_debug_impl(&dword_230455000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Got an error while fetching the URL of %@ - %@%@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    if (!v5)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __50__BRCUploadBatchOperation__publishUploadProgress___block_invoke_cold_1();

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setUserInfoObject:forKey:", v5, *MEMORY[0x24BDD11A8]);
    if ((objc_msgSend(WeakRetained, "isFinished") & 1) == 0)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v15 = 138412802;
        v16 = v12;
        v17 = 2112;
        v18 = v5;
        v19 = 2112;
        v20 = v10;
        _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Publishing upload progress for %@ at %@%@", (uint8_t *)&v15, 0x20u);
      }

      objc_msgSend(WeakRetained, "brc_publish");
    }
    v8 = objc_loadWeakRetained((id *)(a1 + 56));
    -[NSObject setProgressPublished:](v8, "setProgressPublished:", objc_msgSend(WeakRetained, "isPublished"));
  }

}

- (void)mainWithTransfers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id obj;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[BRCTransferBatchOperation itemsCount](self, "itemsCount"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "record");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "record");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recordID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

        -[BRCUploadBatchOperation _publishUploadProgress:](self, "_publishUploadProgress:", v10);
        -[BRCClientZone session](self->_clientZone, "session");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "analyticsReporter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke;
        v24[3] = &unk_24FE431F0;
        v24[4] = self;
        objc_msgSend(v15, "lookupFSEventToSyncUpEventByItemID:accessor:", v16, v24);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  -[BRCUploadBatchOperation hash](self, "hash");
  kdebug_trace();
  -[BRCClientZone serverZone](self->_clientZone, "serverZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "hasFetchedServerZoneState") & 1) != 0)
  {

LABEL_12:
    -[BRCUploadBatchOperation _uploadRecordsByID:](self, "_uploadRecordsByID:", v5);
    goto LABEL_13;
  }
  v18 = -[BRCClientZone isPrivateZone](self->_clientZone, "isPrivateZone");

  if (!v18)
    goto LABEL_12;
  -[BRCClientZone asPrivateClientZone](self->_clientZone, "asPrivateClientZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BRCOperation group](self, "group");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke_2;
  v22[3] = &unk_24FE408B8;
  v22[4] = self;
  v23 = v5;
  objc_msgSend(v19, "createCloudKitZoneWithGroup:completion:", v20, v22);

LABEL_13:
}

uint64_t __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "associateCKOperationsToEventMetric:", a2);
}

uint64_t __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "completedWithResult:error:", 0, a2);
  else
    return objc_msgSend(v3, "_uploadRecordsByID:", *(_QWORD *)(a1 + 40));
}

- (void)_uploadRecordsByID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  _QWORD v15[7];
  _QWORD v16[4];
  id v17;
  id v18;
  BRCUploadBatchOperation *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  -[BRCSyncContext session](self->super.super._syncContext, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__18;
  v25[4] = __Block_byref_object_dispose__18;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__18;
  v23[4] = __Block_byref_object_dispose__18;
  v24 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc(MEMORY[0x24BDB9158]);
  objc_msgSend(v4, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRecordsToSave:recordIDsToDelete:", v7, 0);

  objc_msgSend(v8, "setShouldOnlySaveAssetContent:", 1);
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCallbackQueue:", v9);

  objc_msgSend(v8, "setSavePolicy:", 0);
  objc_msgSend(v8, "setAtomic:", 0);
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke;
  v22[3] = &unk_24FE43218;
  v22[4] = self;
  objc_msgSend(v8, "setPerRecordProgressBlock:", v22);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestCKCacheAssetClone");

  if (v12)
    objc_msgSend(v8, "setShouldCloneFileInAssetCache:", 1);
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_107;
  v16[3] = &unk_24FE43240;
  v13 = v5;
  v17 = v13;
  v20 = v25;
  v21 = v23;
  v14 = v4;
  v18 = v14;
  v19 = self;
  objc_msgSend(v8, "setPerRecordCompletionBlock:", v16);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_109;
  v15[3] = &unk_24FE43268;
  v15[4] = self;
  v15[5] = v25;
  v15[6] = v23;
  objc_msgSend(v8, "setModifyRecordsCompletionBlock:", v15);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3 < 0.0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134218242;
      v11 = a3;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Upload: Received negative progress from CK. progress [%f]%@", (uint8_t *)&v10, 0x16u);
    }

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v5, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProgress:forRecordID:", v9, a3);

}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_107(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x2348B9F14]();
  objc_msgSend(v5, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)a1[4];
  objc_msgSend(v9, "zoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ownerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serverZoneByName:ownerName:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v13, "shouldRecreateServerZoneAfterError:", v6))
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_107_cold_1(v5, (uint64_t)v14, v15);

    objc_msgSend(v5, "recordID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "zoneID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1[7] + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    v20 = (void *)a1[5];
    objc_msgSend(v5, "recordID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
    objc_msgSend(v5, "recordID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

  }
  else
  {
    v25 = (void *)a1[6];
    objc_msgSend(v5, "recordID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "finishedTransferForRecord:recordID:error:", v5, v26, v6);

  }
  objc_autoreleasePoolPop(v7);

}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_109(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id location;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (!v9)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_109_cold_1();

    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 576), "asPrivateClientZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "group");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_110;
    v15[3] = &unk_24FE41F50;
    objc_copyWeak(&v16, &location);
    v15[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v11, "createCloudKitZoneWithGroup:completion:", v12, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v9);
  }
  objc_msgSend(*(id *)(a1 + 32), "hash");
  kdebug_trace();

}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_110(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "completedWithResult:error:", 0, v3);
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_110_cold_1();

    objc_msgSend(v5, "_uploadRecordsByID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }

}

- (id)actionPrettyName
{
  return CFSTR("uploading");
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCUploadBatchOperation;
  -[BRCTransferBatchOperation finishWithResult:error:](&v5, sel_finishWithResult_error_, a3, a4);
  -[BRCUploadBatchOperation setPerUploadCompletionBlock:](self, "setPerUploadCompletionBlock:", 0);
}

- (id)perUploadCompletionBlock
{
  return objc_getProperty(self, a2, 584, 1);
}

- (void)setPerUploadCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 584);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_perUploadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

void __50__BRCUploadBatchOperation__publishUploadProgress___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: fpURL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_107_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring zone not found error for %@ - we'll create at the end of the operation%@", v6, 0x16u);

}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_109_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: modifyError%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_110_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] zone was recreated, reuploading records%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
