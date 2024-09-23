@implementation BRCFileProvidingRequestOperation

- (BRCFileProvidingRequestOperation)initWithDocumentItem:(id)a3 client:(id)a4 session:(id)a5 etagIfLoser:(id)a6 stageFileName:(id)a7 options:(unint64_t)a8
{
  id v15;
  id v16;
  BRCFileProvidingRequestOperation *v17;
  BRCFileProvidingRequestOperation *v18;

  v15 = a6;
  v16 = a7;
  v17 = -[BRCFileProvidingRequestOperation initWithDocumentItem:client:session:](self, "initWithDocumentItem:client:session:", a3, a4, a5);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_etagIfLoser, a6);
    objc_storeStrong((id *)&v18->_stageFileName, a7);
    v18->_options = a8;
  }

  return v18;
}

- (void)addCompletionCallback:(id)a3
{
  BRCFileProvidingRequestOperation *v4;
  NSMutableArray *callbacks;
  uint64_t v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  callbacks = v4->_callbacks;
  if (!callbacks)
  {
    v6 = objc_opt_new();
    v7 = v4->_callbacks;
    v4->_callbacks = (NSMutableArray *)v6;

    callbacks = v4->_callbacks;
  }
  v8 = (void *)MEMORY[0x2348BA0DC](v9);
  -[NSMutableArray addObject:](callbacks, "addObject:", v8);

  objc_sync_exit(v4);
}

- (NSSet)trackedFileObjects
{
  BRCFileProvidingRequestOperation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableSet copy](v2->_trackerFileObjects, "copy");
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BRCFileProvidingRequestOperation)initWithName:(id)a3 session:(id)a4
{
  id v7;
  BRCFileProvidingRequestOperation *v8;
  BRCFileProvidingRequestOperation *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCFileProvidingRequestOperation;
  v8 = -[_BRCOperation initWithName:](&v14, sel_initWithName_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_session, a4);
    if (initWithName_session__onceToken != -1)
      dispatch_once(&initWithName_session__onceToken, &__block_literal_global_40);
    -[_BRCOperation callbackQueue](v9, "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v10, (dispatch_queue_t)initWithName_session__queue);

    -[_BRCOperation setNonDiscretionary:](v9, "setNonDiscretionary:", 1);
    -[BRCAccountSessionFPFS analyticsReporter](v9->_session, "analyticsReporter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation operationID](v9, "operationID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createUserDownloadEventForOperationID:isRecursive:isForBackup:", v12, 0, 0);

  }
  return v9;
}

void __57__BRCFileProvidingRequestOperation_initWithName_session___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("provide-request-queue", v0);

  v2 = (void *)initWithName_session__queue;
  initWithName_session__queue = (uint64_t)v1;

}

- (BRCFileProvidingRequestOperation)initWithDocumentItem:(id)a3 client:(id)a4 session:(id)a5
{
  id v9;
  id v10;
  BRCFileProvidingRequestOperation *v11;
  BRCFileProvidingRequestOperation *v12;
  uint64_t v13;
  NSMutableSet *trackerFileObjects;

  v9 = a3;
  v10 = a4;
  v11 = -[BRCFileProvidingRequestOperation initWithName:session:](self, "initWithName:session:", CFSTR("document-download"), a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_documentItem, a3);
    objc_storeStrong((id *)&v12->_client, a4);
    v13 = objc_opt_new();
    trackerFileObjects = v12->_trackerFileObjects;
    v12->_trackerFileObjects = (NSMutableSet *)v13;

    -[_BRCFrameworkOperation setIgnoreMissingRemoteClientProxy:](v12, "setIgnoreMissingRemoteClientProxy:", 1);
  }

  return v12;
}

- (void)cancel
{
  BRCFileProvidingRequestOperation *v3;
  NSSet *v4;
  NSSet *trackedVersionsToCancel;
  NSSet *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BRCFileProvidingRequestOperation;
  -[_BRCOperation cancel](&v8, sel_cancel);
  v3 = self;
  objc_sync_enter(v3);
  v4 = (NSSet *)-[NSMutableSet copy](v3->_trackerFileObjects, "copy");
  trackedVersionsToCancel = v3->_trackedVersionsToCancel;
  v3->_trackedVersionsToCancel = v4;
  v6 = v4;

  objc_sync_exit(v3);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFileProvidingRequestOperation _detachAllTrackedDocID:error:](v3, "_detachAllTrackedDocID:error:", v6, v7);

}

- (void)_detachAllTrackedDocID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v13, "fileObjectID", (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "etagIfLoser");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCFileProvidingRequestOperation downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:](self, "downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:", v14, v15, v7);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  else
  {
    -[BRCFileProvidingRequestOperation downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:](self, "downloadTrackedForFileObjectID:withEtagIfLoser:didFinishWithError:", 0, 0, v7);
  }

}

- (void)_provideDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t options;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  BRCFileProvidingRequestOperation *v12;
  char v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSMutableSet *trackerFileObjects;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "fileObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_client)
  {
    objc_msgSend(v4, "appLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (-[NSMutableSet containsObject:](self->_appLibrariesMonitored, "containsObject:", v6) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_appLibrariesMonitored, "addObject:", v6);
      -[BRCXPCClient addAppLibrary:](self->_client, "addAppLibrary:", v6);
    }

  }
  options = self->_options;
  v8 = self->_etagIfLoser;
  v9 = self->_stageFileName;
  v30 = 0;
  v10 = objc_msgSend(v4, "startDownloadInTask:options:etagIfLoser:stageFileName:error:", 0, options, v8, v9, &v30);
  v11 = v30;
  if ((v10 & 1) != 0)
  {
    v12 = self;
    objc_sync_enter(v12);
    v13 = -[BRCFileProvidingRequestOperation isCancelled](v12, "isCancelled");
    if ((v13 & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isNetworkReachable");

      if ((v18 & 1) != 0)
      {
        trackerFileObjects = v12->_trackerFileObjects;
        +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v5, v8, -[BRCFileProvidingRequestOperation kind](v12, "kind"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](trackerFileObjects, "addObject:", v20);

        -[BRCAccountSessionFPFS analyticsReporter](v12->_session, "analyticsReporter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_BRCOperation operationID](v12, "operationID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __53__BRCFileProvidingRequestOperation__provideDocument___block_invoke;
        v27[3] = &unk_24FE46370;
        v28 = v5;
        v29 = v4;
        objc_msgSend(v21, "lookupUserDownloadEventByOperationID:accessor:", v22, v27);

        v23 = v28;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4355, 0);
        v24 = objc_claimAutoreleasedReturnValue();
        v23 = v11;
        v11 = (id)v24;
      }

      v14 = 0;
      if (!v12->_isMonitoringReachability && !v11)
      {
        v14 = 1;
        v12->_isMonitoringReachability = 1;
      }
    }
    objc_sync_exit(v12);

    if (v11)
    {
      -[BRCFileProvidingRequestOperation _finishAfterWaitingForDocumentsWithID:withEtagIfLoser:error:](v12, "_finishAfterWaitingForDocumentsWithID:withEtagIfLoser:error:", v5, v8, v11);
    }
    else
    {
      if ((v13 & 1) == 0)
      {
        -[BRCAccountSessionFPFS downloadTrackers](v12->_session, "downloadTrackers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addDownloadTracker:forFileObjectID:withEtagIfLoser:", v12, v5, v8);

        if (v14)
        {
          +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addReachabilityObserver:", v12);

        }
      }
      v11 = 0;
    }
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v32 = v4;
      v33 = 2112;
      v34 = v11;
      v35 = 2112;
      v36 = v15;
      _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed to start downloading item %@: %@%@", buf, 0x20u);
    }

    -[BRCFileProvidingRequestOperation _finishAfterWaitingForDocumentsWithID:withEtagIfLoser:error:](self, "_finishAfterWaitingForDocumentsWithID:withEtagIfLoser:error:", 0, 0, v11);
  }

}

void __53__BRCFileProvidingRequestOperation__provideDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "fileObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v3, "setItemCount:", objc_msgSend(v3, "itemCount") + 1);
  objc_msgSend(*(id *)(a1 + 40), "currentVersion");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTotalContentSize:", objc_msgSend(v3, "totalContentSize") + objc_msgSend(v5, "size"));

}

- (void)_provideItem
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: _documentItem != nil%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)main
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_230455000, v2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: clientDB queue is nil for session %@%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __40__BRCFileProvidingRequestOperation_main__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  NSObject *v3;

  v1 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled"))
  {
    brc_bread_crumbs();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __40__BRCFileProvidingRequestOperation_main__block_invoke_cold_1(v1);

  }
  else
  {
    objc_msgSend(*v1, "_provideItem");
  }
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11[3];

  if (!a3)
  {
    memset(v11, 0, sizeof(v11));
    __brc_create_section(0, (uint64_t)"-[BRCFileProvidingRequestOperation networkReachabilityChanged:]", 333, v11);
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[BRCFileProvidingRequestOperation networkReachabilityChanged:].cold.1(v11);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4355, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation callbackQueue](self, "callbackQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__BRCFileProvidingRequestOperation_networkReachabilityChanged___block_invoke;
    v9[3] = &unk_24FE3FA40;
    v9[4] = self;
    v8 = v6;
    v10 = v8;
    dispatch_async_with_logs_7(v7, v9);

    __brc_leave_section(v11);
  }
}

void __63__BRCFileProvidingRequestOperation_networkReachabilityChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "trackedFileObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_detachAllTrackedDocID:error:", v3, *(_QWORD *)(a1 + 40));

}

- (void)_finishAfterWaitingForDocumentsWithID:(id)a3 withEtagIfLoser:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  BRCFileProvidingRequestOperation *v10;
  id *p_lastDownloadError;
  id *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (v10->_isFinished)
  {
    objc_sync_exit(v10);

LABEL_11:
    goto LABEL_12;
  }
  p_lastDownloadError = (id *)&v10->_lastDownloadError;
  if (v9)
    objc_storeStrong(p_lastDownloadError, a5);
  else
    v9 = *p_lastDownloadError;
  objc_sync_exit(v10);

  v12 = v10;
  objc_sync_enter(v12);
  if (v16)
  {
    v13 = v12[70];
    +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v16, v8, objc_msgSend(v12, "kind"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v14);

  }
  v15 = objc_msgSend(v12[70], "count");
  objc_sync_exit(v12);

  if (!v15 || v9)
  {
    v10->_isFinished = 1;
    objc_msgSend(v12, "completedWithResult:error:", 0, v9);
    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (int)kind
{
  return +[BRCFSDownloaderUtil downloadKindWithEtagIfLoser:options:](BRCFSDownloaderUtil, "downloadKindWithEtagIfLoser:options:", self->_etagIfLoser, self->_options);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSMutableSet *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  BRCFileProvidingRequestOperation *v25;
  NSMutableArray *v26;
  NSMutableArray *callbacks;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  _QWORD block[5];
  _QWORD v44[4];
  id v45;
  BRCFileProvidingRequestOperation *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCFileProvidingRequestOperation finishWithResult:error:].cold.2((uint64_t)v7);
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCFileProvidingRequestOperation finishWithResult:error:].cold.1((uint64_t)v8, v9);
  }

  -[BRCAccountSessionFPFS analyticsReporter](self->_session, "analyticsReporter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BRCOperation operationID](self, "operationID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke;
  v44[3] = &unk_24FE46370;
  v13 = v7;
  v45 = v13;
  v46 = self;
  objc_msgSend(v10, "lookupUserDownloadEventByOperationID:accessor:", v11, v44);

  if (v7)
  {
    if (!-[BRCFileProvidingRequestOperation isCancelled](self, "isCancelled"))
      goto LABEL_11;
    brc_task_tracker_create("cancellation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serialQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2;
    block[3] = &unk_24FE3FA18;
    block[4] = self;
    dispatch_sync(v16, block);

    brc_task_tracker_wait((uint64_t)v14);
  }
  else
  {
    -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serialQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v42[0] = v12;
    v42[1] = 3221225472;
    v42[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_14;
    v42[3] = &unk_24FE3FA18;
    v42[4] = self;
    dispatch_sync(v17, v42);

  }
LABEL_11:
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v18 = self->_appLibrariesMonitored;
  v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v18);
        -[BRCXPCClient removeAppLibrary:](self->_client, "removeAppLibrary:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
      }
      v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v20);
  }

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeReachabilityObserver:", self);

  -[BRCAccountSessionFPFS downloadTrackers](self->_session, "downloadTrackers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeDownloadTracker:", self);

  v25 = self;
  objc_sync_enter(v25);
  v26 = v25->_callbacks;
  callbacks = v25->_callbacks;
  v25->_callbacks = 0;

  objc_sync_exit(v25);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v28 = v26;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v35;
LABEL_20:
    v32 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v31)
        objc_enumerationMutation(v28);
      if (!(*(unsigned int (**)(void))(*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v32) + 16))())
        break;
      if (v30 == ++v32)
      {
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        if (v30)
          goto LABEL_20;
        break;
      }
    }
  }

  v33.receiver = v25;
  v33.super_class = (Class)BRCFileProvidingRequestOperation;
  -[_BRCFrameworkOperation finishWithResult:error:](&v33, sel_finishWithResult_error_, v6, v13);

}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEndTime:", v3);

  objc_msgSend(v7, "setDidSucceed:", *(_QWORD *)(a1 + 32) == 0);
  v4 = objc_msgSend(v7, "itemCount");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 544), "analyticsReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "submitEventMetric:", v7);
  else
    objc_msgSend(v5, "forgetEventMetric:", v7);

}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 584);
  objc_sync_exit(v2);

  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_cold_1((uint64_t)v3);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 544);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "fileObjectID", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemByFileObjectID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "session");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "fsDownloader");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cancelAndCleanupItemDownload:kind:", v13, objc_msgSend(*(id *)(a1 + 32), "kind"));

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_14(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "clientDB");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flushToMakeEditsVisibleToIPCReaders");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDownloadError, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_trackedVersionsToCancel, 0);
  objc_storeStrong((id *)&self->_documentItem, 0);
  objc_storeStrong((id *)&self->_appLibrariesMonitored, 0);
  objc_storeStrong((id *)&self->_trackerFileObjects, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_stageFileName, 0);
  objc_storeStrong((id *)&self->_etagIfLoser, 0);
}

void __40__BRCFileProvidingRequestOperation_main__block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] %@ was cancelled%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)networkReachabilityChanged:(_QWORD *)a1 .cold.1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] ┏%llx network becomes not reachable, finishing the providing request%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)finishWithResult:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_230455000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] granting coordinated read%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)finishWithResult:(uint64_t)a1 error:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] failing coordinated read with %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] we were cancelled, cancelling docIDs %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

@end
