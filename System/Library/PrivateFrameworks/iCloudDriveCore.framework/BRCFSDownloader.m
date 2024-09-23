@implementation BRCFSDownloader

- (void)addPendingOperationProgress:(id)a3 withStageFileName:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingOperationProgress, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)removePendingOperationProgressWithStageFileName:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_pendingOperationProgress, "removeObjectForKey:", a3);
}

- (id)getDownloadEtagForItem:(id)a3 etagIfLoser:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a3, "currentVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ckInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "etag");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BRCFSDownloader)initWithAccountSession:(id)a3
{
  id v4;
  BRCFSDownloader *v5;
  void *v6;
  void *v7;
  id v8;
  dispatch_workloop_t v9;
  BRCFairScheduler *v10;
  BRCFairScheduler *fairScheduler;
  BRCDeadlineScheduler *v12;
  BRCDeadlineScheduler *downloadsDeadlineScheduler;
  uint64_t v14;
  brc_task_tracker *tracker;
  NSMutableDictionary *v16;
  NSMutableDictionary *pendingOperationProgress;
  NSMutableDictionary *v18;
  NSMutableDictionary *willRetryOperationProgress;
  void *v20;
  double v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCFSDownloader;
  v5 = -[BRCFSSchedulerBase initWithSession:name:tableName:](&v23, sel_initWithSession_name_tableName_, v4, CFSTR("Downloader"), CFSTR("client_downloads"));
  if (v5)
  {
    objc_msgSend(v4, "personaIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BRPersonaSpecificName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease(v7);
    v9 = dispatch_workloop_create((const char *)objc_msgSend(v8, "UTF8String"));
    v10 = -[BRCFairScheduler initWithWorkloop:name:]([BRCFairScheduler alloc], "initWithWorkloop:name:", v9, v8);
    fairScheduler = v5->_fairScheduler;
    v5->_fairScheduler = v10;

    v12 = -[BRCDeadlineScheduler initWithName:fairScheduler:]([BRCDeadlineScheduler alloc], "initWithName:fairScheduler:", CFSTR("com.apple.bird.downloader"), v5->_fairScheduler);
    downloadsDeadlineScheduler = v5->_downloadsDeadlineScheduler;
    v5->_downloadsDeadlineScheduler = v12;

    -[BRCDeadlineScheduler setCoalescingLeeway:](v5->_downloadsDeadlineScheduler, "setCoalescingLeeway:", 10000000);
    brc_task_tracker_create("com.apple.bird.download-tracker");
    v14 = objc_claimAutoreleasedReturnValue();
    tracker = v5->_tracker;
    v5->_tracker = (brc_task_tracker *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingOperationProgress = v5->_pendingOperationProgress;
    v5->_pendingOperationProgress = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    willRetryOperationProgress = v5->_willRetryOperationProgress;
    v5->_willRetryOperationProgress = v18;

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "downloadSizeRefreshInterval");
    v5->_activeDownloadSizeRefreshInterval = v21;

  }
  return v5;
}

- (void)resume
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[BRCAccountSessionFPFS clientTruthWorkloop](self->super.super._session, "clientTruthWorkloop");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__BRCFSDownloader_resume__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

  -[BRCDeadlineScheduler resume](self->_downloadsDeadlineScheduler, "resume");
  -[BRCFairScheduler resume](self->_fairScheduler, "resume");
  v4.receiver = self;
  v4.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase resume](&v4, sel_resume);
}

void __25__BRCFSDownloader_resume__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __25__BRCFSDownloader_resume__block_invoke_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "execute:", CFSTR("DELETE FROM client_downloads"));

}

- (void)suspend
{
  objc_super v3;

  -[BRCFairScheduler suspend](self->_fairScheduler, "suspend");
  -[BRCDeadlineScheduler suspend](self->_downloadsDeadlineScheduler, "suspend");
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase suspend](&v3, sel_suspend);
}

- (void)close
{
  objc_super v3;

  -[BRCDeadlineScheduler close](self->_downloadsDeadlineScheduler, "close");
  -[BRCFairScheduler close](self->_fairScheduler, "close");
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase close](&v3, sel_close);
}

- (void)_close
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase _close](&v3, sel__close);
  brc_task_tracker_wait((uint64_t)self->_tracker);
}

- (void)cancel
{
  objc_super v3;

  -[BRCDeadlineScheduler cancel](self->_downloadsDeadlineScheduler, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase cancel](&v3, sel_cancel);
  brc_task_tracker_cancel(self->_tracker);
}

- (void)_willDownload:(id)a3 operationID:(id)a4
{
  BRCAccountSessionFPFS *session;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  session = self->super.super._session;
  v6 = a4;
  v7 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stageID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transferID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "kind");
  objc_msgSend(v7, "etag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "execute:", CFSTR("UPDATE client_downloads SET  transfer_stage = %@, transfer_operation = %@ WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@"), v8, v6, v9, v10, v11);
}

- (unint64_t)_bumpThrottleForDownload:(id)a3 throttle:(id)a4
{
  id v6;
  id v7;
  BRCDownloadJobIdentifier *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BRCDownloadJobIdentifier *v13;
  id v14;
  objc_super v16;

  v6 = a4;
  v7 = a3;
  v8 = [BRCDownloadJobIdentifier alloc];
  objc_msgSend(v7, "transferID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongLongValue");
  objc_msgSend(v7, "etag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "kind");

  v13 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:](v8, "initWithDBRowID:etag:kind:", v10, v11, v12);
  v16.receiver = self;
  v16.super_class = (Class)BRCFSDownloader;
  v14 = -[BRCFSSchedulerBase postponeJobID:withThrottle:](&v16, sel_postponeJobID_withThrottle_, v13, v6);

  return (unint64_t)v14;
}

- (id)descriptionForItem:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  BRCFSDownloader *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "ORDER BY download_kind, download_etag", 37);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "download_kind, download_etag, transfer_operation, transfer_queue, download_error, app_library_rowid", 99);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__BRCFSDownloader_descriptionForItem_context___block_invoke;
  v14[3] = &unk_24FE42948;
  v15 = v7;
  v16 = self;
  v17 = v6;
  v10 = v6;
  v11 = v7;
  -[BRCFSSchedulerBase descriptionForJobsMatching:ordering:additionalColumns:additionalValuesHandler:context:](self, "descriptionForJobsMatching:ordering:additionalColumns:additionalValuesHandler:context:", v10, v8, v9, v14, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __46__BRCFSDownloader_descriptionForItem_context___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  v9 = a3;
  objc_msgSend(v9, "intAtIndex:", a4);
  objc_msgSend(v9, "stringAtIndex:", (a4 + 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuidAtIndex:", (a4 + 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringAtIndex:", (a4 + 3));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringAtIndex:", (a4 + 4));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberAtIndex:", (a4 + 5));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = BRCPrettyPrintEnum();
  +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v10, 2, *(_QWORD *)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendFormat:", CFSTR("%s:%@"), v15, v16);

  if (!a5)
    goto LABEL_13;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("_retry")) & 1) == 0)
  {
    if (!v11)
      goto LABEL_11;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "appLibraryByRowID:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "serverZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "downloadStream");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 48), "dbRowID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "progressForTransferID:operationID:", v21, v11);
    v23 = v22;

    if (v23 >= 0.0)
      objc_msgSend(v26, "appendFormat:", CFSTR(" downloading:%.1f%%"), v23 * 100.0);
    else
      objc_msgSend(v26, "appendString:", CFSTR(" download:done/cancelled"));

    goto LABEL_10;
  }
  objc_msgSend(v26, "appendString:", CFSTR(" pending-retry"));
  if (v11)
  {
LABEL_10:
    objc_msgSend(v11, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendFormat:", CFSTR(" op:%@"), v24);

  }
LABEL_11:
  if (v13)
  {
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v13, 3, *(_QWORD *)(a1 + 32));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendFormat:", CFSTR(" last-error:%@"), v25);

  }
LABEL_13:

}

- (BOOL)_createDownloadingJobForItem:(id)a3 state:(int)a4 kind:(int)a5 etag:(id)a6 stageFileName:(id)a7 error:(id *)a8
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  id v29;
  void *v30;
  BOOL v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  BRCDownloadJobIdentifier *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  BOOL v40;
  id v41;
  void *v42;
  NSObject *v43;
  id v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t activeDownloadsSize;
  void *v57;
  BOOL v58;
  id v59;
  uint64_t v60;
  void *v62;
  void *v63;
  uint64_t v64;
  int v66;
  id v67;
  void *v68;
  BRCDownloadJobIdentifier *v69;
  id v70;
  uint8_t buf[4];
  BRCDownloadJobIdentifier *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  unint64_t v76;
  __int16 v77;
  unint64_t v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v10 = *(_QWORD *)&a5;
  v81 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v59 = a7;
  objc_msgSend(v12, "serverZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "syncContextUsedForTransfers");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v13;
  v69 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:]([BRCDownloadJobIdentifier alloc], "initWithDBRowID:etag:kind:", objc_msgSend(v12, "dbRowID"), v13, v10);
  v16 = brc_current_date_nsec();
  if ((_DWORD)v10)
    v17 = 17;
  else
    v17 = 25;
  v64 = v10;
  if ((_DWORD)v10 == 3 && !objc_msgSend(v14, "hasFetchedRecentsAndFavorites"))
    a4 = 40;
  v66 = a4;
  v63 = v12;
  objc_msgSend(v12, "currentVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "size");

  objc_msgSend(v68, "downloadThrottle");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "app_library_rowid, transfer_queue, transfer_size, transfer_record, transfer_stage, transfer_operation, download_kind, download_etag, download_priority, download_request_stamp, download_error, zone_rowid", 202);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BEDD638];
  objc_msgSend(v15, "dbRowID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "contextIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dbRowID");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "formatInjection:", CFSTR("%@, %@, %lld, %@, %@, %@, %u, %@, %ld, %lld, %@, %@"), v54, v53, v19, 0, v59, 0, v10, v67, v17, v16, 0, v57);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BEDD638];
  v62 = v15;
  objc_msgSend(v15, "dbRowID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "contextIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dbRowID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "formatInjection:", CFSTR("app_library_rowid = %@, transfer_queue = %@, download_priority = %ld, download_request_stamp = %lld, transfer_stage = %@ , zone_rowid = %@"), v23, v24, v17, v16, v59, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = 0;
  v27 = -[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:](self, "insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:", v69, v55, a4, v52, v21, v26, &v70);
  v60 = v28;
  v29 = v70;

  v30 = v29;
  if (a8)
    v31 = v29 == 0;
  else
    v31 = 1;
  v32 = v31;
  if (!v31)
  {
    v40 = v32;
    v41 = v29;
    brc_bread_crumbs();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, (os_log_type_t)0x90u))
      -[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:stageFileName:error:].cold.1((uint64_t)v41, (uint64_t)v42, v43);

    v45 = objc_retainAutorelease(v41);
    *a8 = v45;
    v46 = v14;
    v33 = v63;
    v34 = v67;
    v35 = v62;
    v32 = v40;
    v36 = v69;
    goto LABEL_29;
  }
  v33 = v63;
  v34 = v67;
  v35 = v62;
  v36 = v69;
  if (v66 != v27)
  {
    v58 = v32;
    activeDownloadsSize = self->_activeDownloadsSize;
    -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "numberWithSQL:", CFSTR("SELECT transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@"), objc_msgSend(v63, "dbRowID"), v64, v67);

    if (v66 == 1)
    {
      v39 = self->_activeDownloadsSize + objc_msgSend(v38, "longLongValue");
    }
    else
    {
      if (v27 != 1)
      {
LABEL_24:
        brc_bread_crumbs();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v63, "itemID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = self->_activeDownloadsSize;
          *(_DWORD *)buf = 138413314;
          v72 = v69;
          v73 = 2112;
          v74 = v50;
          v75 = 2048;
          v76 = activeDownloadsSize;
          v77 = 2048;
          v78 = v51;
          v79 = 2112;
          v80 = v47;
          _os_log_debug_impl(&dword_230455000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@]: %@ (%llu -> %llu)%@", buf, 0x34u);

        }
        v36 = v69;
        v32 = v58;
        goto LABEL_27;
      }
      v39 = self->_activeDownloadsSize - objc_msgSend(v38, "longLongValue");
    }
    self->_activeDownloadsSize = v39;
    goto LABEL_24;
  }
LABEL_27:
  v46 = v14;
  if (v66 == 1)
  {
    objc_msgSend(v68, "downloadStream");
    v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "signalWithDeadline:", v60);
LABEL_29:

  }
  return v32;
}

- (id)_sanitizeRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v4, "setTrackChanges:", 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "setTrackChanges:", 1);
  return v4;
}

- (void)_finishedDownload:(id)a3 syncContext:(id)a4 operationID:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  BRCAccountSessionFPFS *session;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  NSMutableDictionary *willRetryOperationProgress;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  _QWORD v72[5];
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  int v80;
  int v81;
  char v82;
  _QWORD v83[5];
  id v84;
  id v85;
  id v86;
  id v87;
  int v88;
  int v89;
  _QWORD v90[4];
  id v91;
  uint64_t v92[3];
  uint8_t buf[4];
  uint64_t v94;
  __int16 v95;
  id v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  const __CFString *v102;
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v68 = a4;
  v67 = a5;
  v11 = a6;
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v12, "isInSyncBubble");

  if ((_DWORD)a5)
  {
    brc_bread_crumbs();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
      -[BRCFSDownloader _finishedDownload:syncContext:operationID:error:].cold.1();

  }
  objc_msgSend(v10, "clientZone");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stageID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v10, "kind");
  memset(v92, 0, sizeof(v92));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader _finishedDownload:syncContext:operationID:error:]", 613, v92);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v54 = v92[0];
    objc_msgSend(v10, "transferID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "kind");
    v56 = BRCPrettyPrintEnum();
    objc_msgSend(v10, "etag");
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v57;
    v59 = CFSTR("failed");
    *(_DWORD *)buf = 134219266;
    v94 = v54;
    v95 = 2112;
    if (!v11)
      v59 = CFSTR("done");
    v96 = v55;
    v97 = 2080;
    v98 = v56;
    v99 = 2112;
    v100 = v57;
    v101 = 2112;
    v102 = v59;
    v103 = 2112;
    v104 = v13;
    _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Downloader[%@-%s-%@]: download %@%@", buf, 0x3Eu);

  }
  if (v70)
  {
    v15 = v69;
    if (!v11 && v71)
      goto LABEL_8;
    -[BRCAccountSessionFPFS stageRegistry](self->super.super._session, "stageRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cleanupStagedDownloadWithID:forItemID:", v70, v17);

  }
  v15 = v69;
  if (!v71)
  {
    v21 = 0;
    goto LABEL_32;
  }
LABEL_8:
  if (v15 <= 3)
  {
    session = self->super.super._session;
    objc_msgSend(v10, "transferID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS itemByRowID:](session, "itemByRowID:", objc_msgSend(v19, "longLongValue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "asDocument");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    -[BRCAccountSessionFPFS downloadTrackers](self->super.super._session, "downloadTrackers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "etagIfLoser");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "document:didCompleteDownloadEtagIfLoser:kind:withError:", v21, v23, v69, v11);

    if (v11)
      goto LABEL_10;
LABEL_15:
    -[BRCFSDownloader _clearDownloadErrorForDocument:](self, "_clearDownloadErrorForDocument:", v21);
    -[BRCAccountSessionFPFS applyScheduler](self->super.super._session, "applyScheduler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v71, "serverRankByItemID:", v31);

    if (v69 >= 4)
      v33 = 1;
    else
      v33 = dword_230722DA0[(int)v69];
    -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_188;
    v72[3] = &unk_24FE42998;
    v72[4] = self;
    v73 = v10;
    v82 = 0;
    v74 = v68;
    v75 = v70;
    v80 = v69;
    v21 = v21;
    v76 = v21;
    v79 = v32;
    v81 = v33;
    v53 = v30;
    v77 = v53;
    v78 = v71;
    objc_msgSend(v52, "groupInBatch:", v72);

    goto LABEL_32;
  }
  v21 = 0;
  if (!v11)
    goto LABEL_15;
LABEL_10:
  if ((objc_msgSend(v71, "handleZoneLevelErrorIfNeeded:forItemCreation:", v11, 0) & 1) != 0)
    goto LABEL_32;
  if ((objc_msgSend(v11, "brc_isCloudKitCancellationError") & 1) != 0)
    goto LABEL_18;
  objc_msgSend(v68, "downloadThrottle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[BRCFSDownloader _bumpThrottleForDownload:throttle:](self, "_bumpThrottleForDownload:throttle:", v10, v24);

  objc_msgSend(v21, "appLibrary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "mangledID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = v25 > objc_msgSend(v28, "downloadRetryCountForFailure");

  if (!(_DWORD)v25)
  {
LABEL_18:
    v29 = 0;
  }
  else
  {
    -[BRCFSDownloader _reportDownloadErrorForDocument:error:](self, "_reportDownloadErrorForDocument:error:", v21, v11);
    v29 = 1;
  }
  if ((objc_msgSend(v11, "brc_isCloudKitCancellationError") & 1) != 0
    || (objc_msgSend(v11, "brc_isRetriable") & 1) != 0
    || objc_msgSend(v11, "brc_isCloudKitAssetFileModified"))
  {
    objc_msgSend(v10, "progress");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "completedUnitCount"))
    {
      objc_msgSend(v10, "progress");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isFinished");

      if ((v36 & 1) != 0)
      {
LABEL_27:
        brc_bread_crumbs();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v94 = (uint64_t)v10;
          v95 = 2112;
          v96 = v67;
          v97 = 2112;
          v98 = (uint64_t)v11;
          v99 = 2112;
          v100 = (uint64_t)v43;
          _os_log_debug_impl(&dword_230455000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] Rescheduling %@ (%@) for retriable error: %@%@", buf, 0x2Au);
        }

        -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v90[0] = MEMORY[0x24BDAC760];
        v90[1] = 3221225472;
        v90[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke;
        v90[3] = &unk_24FE3FEF0;
        v91 = v68;
        v46 = (void *)MEMORY[0x2348BA0DC](v90);
        objc_msgSend(v11, "description");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "progress");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "completedUnitCount");
        objc_msgSend(v10, "transferID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "etag");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "execute:", CFSTR("UPDATE client_downloads SET  transfer_operation = call_block(%@, next_retry_stamp), download_error = %@, unit_count_completed = %lld WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@"), v46, v47, v49, v50, v69, v51);

        goto LABEL_32;
      }
      objc_msgSend(v71, "mangledID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v37);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = -[NSMutableDictionary count](self->_willRetryOperationProgress, "count");
      if (v38 < objc_msgSend(v34, "downloadWillRetryProgressMaxCount"))
      {
        -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "assertOnQueue");

        objc_msgSend(v10, "progress");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        willRetryOperationProgress = self->_willRetryOperationProgress;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v21, "dbRowID"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](willRetryOperationProgress, "setObject:forKeyedSubscript:", v40, v42);

        objc_msgSend(v10, "setProgressPublished:", 0);
      }
    }

    goto LABEL_27;
  }
  brc_bread_crumbs();
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, (os_log_type_t)0x90u))
  {
    objc_msgSend(v21, "st");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "displayName");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v94 = (uint64_t)v64;
    v95 = 2112;
    v96 = v11;
    v97 = 2112;
    v98 = (uint64_t)v60;
    _os_log_error_impl(&dword_230455000, v61, (os_log_type_t)0x90u, "[ERROR] Got non recoverable error when downloading %@: %@%@", buf, 0x20u);

  }
  if ((v29 & 1) == 0)
    -[BRCFSDownloader _reportDownloadErrorForDocument:error:](self, "_reportDownloadErrorForDocument:error:", v21, v11);
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = MEMORY[0x24BDAC760];
  v83[1] = 3221225472;
  v83[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_184;
  v83[3] = &unk_24FE42838;
  v88 = 41;
  v83[4] = self;
  v84 = v10;
  v85 = v11;
  v89 = v69;
  v21 = v21;
  v86 = v21;
  v87 = v71;
  objc_msgSend(v62, "groupInBatch:", v83);

LABEL_32:
  __brc_leave_section(v92);

}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  sqlite3_int64 v6;
  void *v7;

  v6 = sqlite3_value_int64(*a4);
  objc_msgSend(*(id *)(a1 + 32), "downloadStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signalWithDeadline:", v6);

  sqlite3_result_null(a2);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_184(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, sqlite3_context *, uint64_t, _QWORD *);
  void *v27;
  uint64_t v28;
  id v29;

  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_2;
  v27 = &unk_24FE42970;
  v4 = *(void **)(a1 + 40);
  v28 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 72);
  v29 = v4;
  v6 = a2;
  v7 = (void *)MEMORY[0x2348BA0DC](&v24);
  objc_msgSend(*(id *)(a1 + 48), "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "transferID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned int *)(a1 + 76);
  objc_msgSend(*(id *)(a1 + 40), "etag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "execute:", CFSTR("UPDATE client_downloads SET  throttle_state = %d, transfer_record = NULL, transfer_stage = call_block(%@, transfer_stage), transfer_operation = NULL, download_error = %@ WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@"), v5, v7, v8, v9, v10, v11, v24, v25, v26, v27, v28);

  if (objc_msgSend(*(id *)(a1 + 48), "brc_isCloudKitUnknownItemError")
    && (!objc_msgSend(*(id *)(a1 + 40), "kind")
     || objc_msgSend(*(id *)(a1 + 40), "kind") == 3))
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_184_cold_2();

    objc_msgSend(*(id *)(a1 + 56), "handleUnknownItemError");
  }
  if (*(_DWORD *)(a1 + 72) == 41 && objc_msgSend(*(id *)(a1 + 40), "kind") == 2)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_184_cold_1();

    v16 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "itemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "serverRankByItemID:", v17);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "applyScheduler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "dbRowID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setState:andApplyKind:forRank:zoneRowID:", 1, 2, v18, v20);

  }
  objc_msgSend(*(id *)(a1 + 56), "saveToDB");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "downloadTrackers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "etagIfLoser");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "document:didCompleteDownloadEtagIfLoser:kind:withError:", v22, v23, objc_msgSend(*(id *)(a1 + 40), "kind"), *(_QWORD *)(a1 + 48));

}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, _QWORD *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "newFromSqliteValue:", *a4);
  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stageRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "itemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cleanupStagedDownloadWithID:forItemID:", v8, v7);

  }
  sqlite3_result_null(a2);

}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_188(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sanitizeRecord:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(unsigned __int8 *)(a1 + 104);
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 48), "contextIdentifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("_done");
  }
  v10 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "transferID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(unsigned int *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 40), "etag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("UPDATE client_downloads SET  throttle_state = %d, transfer_queue = %@, transfer_record = %@, transfer_stage = %@, transfer_operation = NULL, download_error = NULL WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@"), v8, v9, v7, v10, v11, v12, v13);

  if ((_DWORD)v8)
  objc_msgSend(*(id *)(a1 + 64), "saveToDB");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "downloadTrackers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "etagIfLoser");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "document:didCompleteDownloadEtagIfLoser:kind:withError:", v15, v16, objc_msgSend(*(id *)(a1 + 40), "kind"), 0);

  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 48), "downloadStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "signal");
LABEL_12:

    goto LABEL_13;
  }
  if (*(_QWORD *)(a1 + 88))
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v23 = *(_QWORD *)(a1 + 88);
      objc_msgSend(*(id *)(a1 + 40), "itemID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v26 = v23;
      v27 = 2112;
      v28 = v24;
      v29 = 2080;
      v30 = BRCPrettyPrintEnum();
      v31 = 2112;
      v32 = v18;
      _os_log_debug_impl(&dword_230455000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: %@ state is %s%@", buf, 0x2Au);

    }
    v20 = *(unsigned int *)(a1 + 100);
    v21 = *(_QWORD *)(a1 + 88);
    v22 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 80), "dbRowID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setState:andApplyKind:forRank:zoneRowID:", v20, 2, v21, v17);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)rescheduleJobsPendingWinnerForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("UPDATE client_downloads SET throttle_state = 1 WHERE throttle_state = %u AND throttle_id = %lld"), 42, objc_msgSend(v4, "dbRowID"));
  if (objc_msgSend(v5, "changes"))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCFSDownloader rescheduleJobsPendingWinnerForItem:].cold.1();

    objc_msgSend(v4, "syncContextUsedForTransfers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "downloadStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "signal");

  }
}

- (void)rescheduleJobsPendingRecentsAndFavoritesFetchInZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "execute:", CFSTR("UPDATE client_downloads SET throttle_state = 1 WHERE throttle_state = 40   AND throttle_state != 0   AND zone_rowid = %@"), v6);

  if (objc_msgSend(v5, "changes"))
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCFSDownloader rescheduleJobsPendingWinnerForItem:].cold.1();

    if (objc_msgSend(v4, "isSharedZone"))
    {
      objc_msgSend(v4, "metadataSyncContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "downloadStream");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "signal");

    }
    else
    {
      objc_msgSend(v4, "dbRowID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT distinct app_library_rowid FROM client_downloads WHERE throttle_state = 1   AND throttle_state != 0   AND zone_rowid = %@"), v11);

      if (objc_msgSend(v9, "next"))
      {
        do
        {
          objc_msgSend(v9, "numberAtIndex:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCAccountSessionFPFS appLibraryByRowID:](self->super.super._session, "appLibraryByRowID:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "transferSyncContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "downloadStream");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "signal");

        }
        while ((objc_msgSend(v9, "next") & 1) != 0);
      }
    }

  }
}

- (void)_cancelJobs:(id)a3 state:(int)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  BRCAccountSessionFPFS *session;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *context;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v33 = *(_QWORD *)&a4;
  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "next"))
  {
    do
    {
      context = (void *)MEMORY[0x2348B9F14]();
      objc_msgSend(v5, "numberAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v5, "intAtIndex:", 1);
      objc_msgSend(v5, "stringAtIndex:", 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuidAtIndex:", 3);
      v40 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringAtIndex:", 4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberAtIndex:", 5);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberAtIndex:", 6);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v5, "intAtIndex:", 7);
      v10 = objc_msgSend(v5, "longLongAtIndex:", 8);
      v35 = (void *)v7;
      -[BRCAccountSessionFPFS appLibraryByRowID:](self->super.super._session, "appLibraryByRowID:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)v8;
      -[BRCAccountSessionFPFS serverZoneByRowID:](self->super.super._session, "serverZoneByRowID:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v12, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v6;
      if (v9 == 1)
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v31 = BRCPrettyPrintEnum();
          *(_DWORD *)buf = 138413058;
          v43 = v38;
          v44 = 2080;
          v45 = v31;
          v46 = 2112;
          v47 = v37;
          v48 = 2112;
          v49 = v14;
          _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@-%s-%@]: Cancelling download%@", buf, 0x2Au);
        }

        self->_activeDownloadsSize -= v10;
        v6 = v38;
        if ((_DWORD)v39 == 3 || !(_DWORD)v39)
        {
          -[BRCAccountSessionFPFS itemByRowID:](self->super.super._session, "itemByRowID:", objc_msgSend(v38, "unsignedIntegerValue"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "asDocument");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          session = self->super.super._session;
          v19 = 0;
          -[BRCAccountSessionFPFS downloadTrackers](session, "downloadTrackers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "brc_errorOperationCancelled");
          v32 = v12;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "document:didCompleteDownloadEtagIfLoser:kind:withError:", v17, v19, v39, v21);

          v6 = v38;
          v12 = v32;

        }
      }
      v22 = (void *)v40;
      if (v40)
      {
        objc_msgSend(v13, "downloadStream");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "cancelTransferID:operationID:", v6, v40);

      }
      if (v41)
      {
        -[BRCAccountSessionFPFS itemIDByRowID:](self->super.super._session, "itemIDByRowID:", objc_msgSend(v6, "unsignedIntegerValue"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v30 = BRCPrettyPrintEnum();
          *(_DWORD *)buf = 138413314;
          v43 = v38;
          v44 = 2080;
          v45 = v30;
          v46 = 2112;
          v47 = v37;
          v48 = 2112;
          v49 = v41;
          v50 = 2112;
          v51 = v25;
          _os_log_debug_impl(&dword_230455000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@-%s-%@]: Cleaning up download stage: %@%@", buf, 0x34u);
        }

        -[BRCAccountSessionFPFS stageRegistry](self->super.super._session, "stageRegistry");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "cleanupStagedDownloadWithID:forItemID:", v41, v24);

        v6 = v38;
        v22 = (void *)v40;
      }
      if (v13)
      {
        objc_msgSend(v5, "db");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contextIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "execute:", CFSTR("UPDATE client_downloads SET  throttle_state = %d, transfer_queue = %@, transfer_record = NULL, transfer_stage = NULL, transfer_operation = NULL, unit_count_completed = 0 WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@"), v33, v29, v6, v39, v37);

        v22 = (void *)v40;
      }

      objc_autoreleasePoolPop(context);
    }
    while ((objc_msgSend(v5, "next") & 1) != 0);
  }
  objc_msgSend(v5, "close");

}

- (void)_finishDownloadCleanup:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  objc_msgSend(v6, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popDownloadedBlockForItemID:", v4);
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v5)
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5
{
  -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:](self, "cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:", a3, *(_QWORD *)&a4, a5, 0);
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6
{
  -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:](self, "cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:", a3, *(_QWORD *)&a4, a5, a6, 0);
}

- (id)_getCancelErrorFromCancelReason:(int)a3
{
  void *v3;
  NSObject *v4;
  void *v5;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorRescheduleDownloadForMoreRecentServerVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      brc_bread_crumbs();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        -[BRCFSDownloader _getCancelErrorFromCancelReason:].cold.1();

    }
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorDownloadCancelled");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6 cancelReason:(int)a7
{
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a5;
  v14 = v13;
  if ((_DWORD)v7 != 1)
    goto LABEL_8;
  if (!v13)
  {
    if (!(_DWORD)v10)
      goto LABEL_8;
    goto LABEL_4;
  }
  brc_bread_crumbs();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:].cold.2();

  if ((_DWORD)v10)
  {
LABEL_4:
    if ((_DWORD)v10 != 3)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:].cold.1();

    }
  }
LABEL_8:
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "fetch:", CFSTR("SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@   AND throttle_state != 0"), objc_msgSend(v12, "dbRowID"), v10, v14);

  -[BRCFSDownloader _getCancelErrorFromCancelReason:](self, "_getCancelErrorFromCancelReason:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFSDownloader _cancelJobs:state:](self, "_cancelJobs:state:", v18, 0);
  if ((_DWORD)v10 == 3)
  {
LABEL_11:
    -[BRCFSDownloader _finishDownloadCleanup:](self, "_finishDownloadCleanup:", v12);
    if (v8)
    {
      -[BRCAccountSessionFPFS downloadTrackers](self->super.super._session, "downloadTrackers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = v12;
      v23 = 0;
      v24 = v10;
LABEL_15:
      objc_msgSend(v20, "document:didCompleteDownloadEtagIfLoser:kind:withError:", v22, v23, v24, v19);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if ((_DWORD)v10 != 2)
  {
    if ((_DWORD)v10)
      goto LABEL_16;
    goto LABEL_11;
  }
  if (v8)
  {
    -[BRCAccountSessionFPFS downloadTrackers](self->super.super._session, "downloadTrackers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v12;
    v23 = v14;
    v24 = 2;
    goto LABEL_15;
  }
LABEL_16:

}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u   AND throttle_state != 0"), objc_msgSend(v8, "dbRowID"), v4);

  -[BRCFSDownloader _cancelJobs:state:](self, "_cancelJobs:state:", v7, 0);
  if ((_DWORD)v4 == 3 || !(_DWORD)v4)
    -[BRCFSDownloader _finishDownloadCleanup:](self, "_finishDownloadCleanup:", v8);

}

- (void)cancelAndCleanupItemDownloads:(id)a3
{
  BRCAccountSessionFPFS *session;
  id v5;
  void *v6;
  id v7;

  session = self->super.super._session;
  v5 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "fetch:", CFSTR("SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND throttle_state != 0"), objc_msgSend(v5, "dbRowID"));

  -[BRCFSDownloader _cancelJobs:state:](self, "_cancelJobs:state:", v7, 0);
  -[BRCFSDownloader _finishDownloadCleanup:](self, "_finishDownloadCleanup:", v5);

}

- (void)addAliasItem:(id)a3 toDownloadingItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT transfer_operation    FROM client_downloads  WHERE throttle_id = %lld AND throttle_state == 1"), objc_msgSend(v7, "dbRowID"));

  if (v9)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v10;
      _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] adding alias item %@ to currently transfering %@%@", buf, 0x20u);
    }

    objc_msgSend(v7, "syncContextUsedForTransfers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "downloadStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v7, "dbRowID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAliasItem:toTransferWithID:operationID:", v6, v14, v9);

  }
}

- (void)deleteJobsMatching:(id)a3
{
  BRCAccountSessionFPFS *session;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  session = self->super.super._session;
  v5 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchingJobsWhereSQLClause");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE %@ AND throttle_state > %d"), v7, 0);

  -[BRCFSDownloader _cancelJobs:state:](self, "_cancelJobs:state:", v8, 0);
  v9.receiver = self;
  v9.super_class = (Class)BRCFSDownloader;
  -[BRCFSSchedulerBase deleteJobsMatching:](&v9, sel_deleteJobsMatching_, v5);

}

- (void)updateContentDownloadForMetaOnlyChange:(id)a3 fromEtag:(id)a4 toEtag:(id)a5
{
  BRCAccountSessionFPFS *session;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  session = self->super.super._session;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "dbRowID");

  objc_msgSend(v12, "execute:", CFSTR("UPDATE client_downloads SET download_etag = %@ WHERE throttle_id = %lld AND download_etag = %@ AND download_kind = %d"), v8, v11, v9, 0);
}

- (unint64_t)sizeOfActiveDownloads
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  unint64_t activeDownloadsSize;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_lastDownloadRefresh
    || (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 > self->_activeDownloadSizeRefreshInterval))
  {
    -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__13;
    v24 = __Block_byref_object_dispose__13;
    v25 = 0;
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __40__BRCFSDownloader_sizeOfActiveDownloads__block_invoke;
    v17 = &unk_24FE429C0;
    v19 = &v20;
    v7 = v6;
    v18 = v7;
    objc_msgSend(v7, "disableProfilingForQueriesInBlock:", &v14);
    objc_storeStrong((id *)&self->_lastDownloadRefresh, v4);
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      activeDownloadsSize = self->_activeDownloadsSize;
      v13 = objc_msgSend((id)v21[5], "longLongValue", v14, v15, v16, v17);
      *(_DWORD *)buf = 134218498;
      v27 = activeDownloadsSize;
      v28 = 2048;
      v29 = v13;
      v30 = 2112;
      v31 = v8;
      _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Refreshed active download size %llu -> %llu%@", buf, 0x20u);
    }

    self->_activeDownloadsSize = objc_msgSend((id)v21[5], "longLongValue");
    _Block_object_dispose(&v20, 8);

  }
  v10 = self->_activeDownloadsSize;

  return v10;
}

void __40__BRCFSDownloader_sizeOfActiveDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberWithSQL:", CFSTR("SELECT SUM(transfer_size) FROM client_downloads WHERE throttle_state = 1"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)makeContentLive:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  BRCFSDownloader *v10;

  v4 = a3;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__BRCFSDownloader_makeContentLive___block_invoke;
  v8[3] = &unk_24FE41988;
  v9 = v4;
  v10 = self;
  v6 = v4;
  LOBYTE(v4) = objc_msgSend(v5, "groupInTransaction:", v8);

  return (char)v4;
}

uint64_t __35__BRCFSDownloader_makeContentLive___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "execute:", CFSTR("DELETE FROM client_pkg_upload_items WHERE item_rowid = %llu"), objc_msgSend(*(id *)(a1 + 32), "dbRowID"));
  if ((_DWORD)v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_msgSend(v3, "changes");
      objc_msgSend(*(id *)(a1 + 32), "fileObjectID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      v20 = 2112;
      v21 = v5;
      _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %lld items in pkg:%@%@", buf, 0x20u);

    }
    v9 = a1 + 32;
    v7 = *(void **)(a1 + 32);
    v8 = *(void **)(v9 + 8);
    objc_msgSend(v7, "currentVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ckInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "etag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelAndCleanupItemDownload:kind:etag:", v7, 0, v12);

  }
  return v4;
}

- (BOOL)scheduleContentDownloadForItem:(id)a3 serverItem:(id)a4 options:(unint64_t)a5 etagIfLoser:(id)a6 stageFileName:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  BRCDownloadJobIdentifier *v22;
  void *v23;
  NSObject *v24;
  BOOL v25;
  void *v27;
  uint64_t v28;
  uint64_t v29[3];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  memset(v29, 0, sizeof(v29));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:]", 1192, v29);
  brc_bread_crumbs();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v28 = v29[0];
    objc_msgSend(v14, "itemID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v31 = v28;
    v32 = 2112;
    v33 = v27;
    v34 = 2112;
    v35 = v14;
    v36 = 2112;
    v37 = v15;
    v38 = 2112;
    v39 = v18;
    _os_log_debug_impl(&dword_230455000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling content download for %@\nlocal: %@\nserver: %@%@", buf, 0x34u);

  }
  -[BRCFSDownloader getDownloadEtagForItem:etagIfLoser:](self, "getDownloadEtagForItem:etagIfLoser:", v14, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = +[BRCFSDownloaderUtil downloadKindWithEtagIfLoser:options:](BRCFSDownloaderUtil, "downloadKindWithEtagIfLoser:options:", v16, a5);
  v22 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:]([BRCDownloadJobIdentifier alloc], "initWithDBRowID:etag:kind:", objc_msgSend(v14, "dbRowID"), v20, v21);
  if (-[BRCFSSchedulerBase jobStateFor:](self, "jobStateFor:", v22) == 1)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[BRCFSDownloader scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:].cold.1();

    v25 = 1;
  }
  else
  {
    v25 = -[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:stageFileName:error:](self, "_createDownloadingJobForItem:state:kind:etag:stageFileName:error:", v14, 1, v21, v20, v17, a8);
  }

  __brc_leave_section(v29);
  return v25;
}

- (void)performFirstSchedulingAfterStartupInDB:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BRCAccountSessionFPFS *session;
  void *v10;
  void *v11;
  BRCAccountSessionFPFS *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "execute:", CFSTR("UPDATE client_downloads SET transfer_operation = NULL WHERE (transfer_operation >= '')"));
  if (objc_msgSend(v4, "changes"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCFSDownloader performFirstSchedulingAfterStartupInDB:].cold.1(v4, (uint64_t)v5, v6);

  }
  v7 = (void *)objc_msgSend(v4, "fetch:", CFSTR("SELECT app_library_rowid, zone_rowid, transfer_queue   FROM client_downloads  WHERE throttle_state = 1 GROUP BY app_library_rowid, zone_rowid, transfer_queue"));
  if (objc_msgSend(v7, "next"))
  {
    do
    {
      v8 = (void *)MEMORY[0x2348B9F14]();
      session = self->super.super._session;
      objc_msgSend(v7, "numberAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSessionFPFS appLibraryByRowID:](session, "appLibraryByRowID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = self->super.super._session;
      objc_msgSend(v7, "numberAtIndex:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSessionFPFS serverZoneByRowID:](v12, "serverZoneByRowID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "stringAtIndex:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("_prepare")) & 1) == 0
        && (objc_msgSend(v15, "isEqualToString:", CFSTR("_retry")) & 1) == 0)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v7, "stringAtIndex:", 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v22 = v20;
          v23 = 2112;
          v24 = v16;
          _os_log_debug_impl(&dword_230455000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Kicking downloads for %@%@", buf, 0x16u);

        }
        +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v14, v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "downloadStream");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "signal");

      }
      objc_autoreleasePoolPop(v8);
    }
    while ((objc_msgSend(v7, "next") & 1) != 0);
  }

}

- (void)schedule
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "readerScanBatchSize");

  objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("transfer_queue = '_retry' AND transfer_operation IS NULL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "rowid, throttle_id, app_library_rowid, zone_rowid", 49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27__BRCFSDownloader_schedule__block_invoke;
  v7[3] = &unk_24FE429E8;
  v7[4] = self;
  -[BRCFSSchedulerBase scheduleWithBatchSize:whereSQLClause:columns:actionHandler:](self, "scheduleWithBatchSize:whereSQLClause:columns:actionHandler:", v4, v5, v6, v7);

}

void __27__BRCFSDownloader_schedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "numberAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberAtIndex:", (a3 + 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberAtIndex:", (a3 + 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberAtIndex:", (a3 + 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "appLibraryByRowID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverZoneByRowID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "db");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contextIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "execute:", CFSTR("UPDATE client_downloads SET transfer_queue = %@ WHERE rowid = %@"), v14, v6);

    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v22 = v20;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v15;
      _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@]: job has been put back in queue %@%@", buf, 0x20u);
    }

    objc_msgSend(v11, "downloadStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "signal");
  }
  else
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138413058;
      v22 = v20;
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v6;
      v27 = 2112;
      v28 = v18;
      _os_log_fault_impl(&dword_230455000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Downloader[%@]: failed to find app library with id %@, dropping the download %@%@", buf, 0x2Au);
    }

    objc_msgSend(v5, "db");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "execute:", CFSTR("DELETE FROM client_downloads WHERE rowid = %@"), v6);
  }

}

- (unint64_t)inFlightSize
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BRCAccountSessionFPFS syncContextProvider](self->super.super._session, "syncContextProvider", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSyncContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "downloadStream");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "inFlightSize");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)generateContentStageFileNameForItem:(id)a3 etag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "st");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logicalName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "br_pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "length");
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = objc_msgSend(v6, "dbRowID");

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v10)
    objc_msgSend(v11, "stringWithFormat:", CFSTR("content-%lld-%@-%@.%@"), v12, v5, v14, v9);
  else
    objc_msgSend(v11, "stringWithFormat:", CFSTR("content-%lld-%@-%@"), v12, v5, v14, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_sendContentsBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5 isLoserDownload:(BOOL)a6
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int128 v12;
  void *v13;
  BRCDownloadContentsBatchOperation *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  BRCDownloadContentsBatchOperation *v28;
  void *v29;
  BRCDownloadContentsBatchOperation *v30;
  BRCDownloadContent *v31;
  BRCDownloadContent *v32;
  BRCDownloadContent *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  NSMutableDictionary *willRetryOperationProgress;
  void *v39;
  void *v40;
  NSMutableDictionary *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  unint64_t v53;
  BOOL v54;
  void *v55;
  NSObject *v56;
  void *v57;
  BRCDownloadContentsBatchOperation *v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  __int128 v67;
  void *v68;
  void *v69;
  unint64_t v70;
  _BOOL4 v71;
  void *v72;
  BRCDownloadContentsBatchOperation *v73;
  BOOL v74;
  void *v75;
  BRCFSDownloader *v76;
  id v77;
  void *v78;
  void *v79;
  _QWORD v80[5];
  id v81;
  id v82;
  _QWORD v83[2];
  _QWORD v84[2];
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v71 = a6;
  v91 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInSyncBubble");

  if (v10)
  {
    brc_bread_crumbs();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
      -[BRCFSDownloader _finishedDownload:syncContext:operationID:error:].cold.1();

  }
  v76 = self;
  objc_msgSend(v8, "syncContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  if (objc_msgSend(0, "itemsCount") >= a5)
    goto LABEL_56;
  v69 = v11;
  v14 = 0;
  v13 = 0;
  v77 = 0;
  v75 = 0;
  v18 = 0;
  v19 = 0;
  *(_QWORD *)&v12 = 138412802;
  v67 = v12;
  v72 = v8;
  v70 = a5;
  while (1)
  {
    v20 = v13;
    v21 = (void *)MEMORY[0x2348B9F14]();
    objc_msgSend(v8, "nextDocumentItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      break;
    objc_msgSend(v8, "stageID");
    v22 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "etag");
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v8, "completedUnitCount");
    v74 = objc_msgSend(v8, "transferQOS") > 24;
    v25 = v22;
    v78 = (void *)v23;
    if (!v22)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v86 = (uint64_t)v26;
        _os_log_debug_impl(&dword_230455000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] No stage ID, createing a new one%@", buf, 0xCu);
      }

      v23 = (uint64_t)v78;
      -[BRCFSDownloader generateContentStageFileNameForItem:etag:](v76, "generateContentStageFileNameForItem:etag:", v13, v78);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v75 = (void *)v25;
    if (v14)
    {
      v73 = v14;
    }
    else
    {
      v28 = -[BRCDownloadContentsBatchOperation initWithSyncContext:sessionContext:]([BRCDownloadContentsBatchOperation alloc], "initWithSyncContext:sessionContext:", v69, v76->super.super._session);
      -[_BRCOperation operationID](v28, "operationID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v80[0] = MEMORY[0x24BDAC760];
      v80[1] = 3221225472;
      v80[2] = __79__BRCFSDownloader__sendContentsBatch_sizeHint_maxRecordsCount_isLoserDownload___block_invoke;
      v80[3] = &unk_24FE42A10;
      v80[4] = v76;
      v81 = v69;
      v77 = v29;
      v82 = v77;
      v73 = v28;
      v30 = v28;
      v23 = (uint64_t)v78;
      -[BRCDownloadContentsBatchOperation setPerDownloadCompletionBlock:](v30, "setPerDownloadCompletionBlock:", v80);

    }
    v31 = [BRCDownloadContent alloc];
    if (!v71)
      v23 = 0;
    v32 = -[BRCDownloadContent initWithDocument:stageID:etagIfLoser:downloadKind:](v31, "initWithDocument:stageID:etagIfLoser:downloadKind:", v13, v25, v23, objc_msgSend(v8, "kind", v67));
    v33 = v32;
    if (!v71)
    {
      -[BRCDownload etag](v32, "etag");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "isEqualToString:", v78))
      {

      }
      else
      {
        objc_msgSend(v13, "currentVersion");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "oldVersionIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqualToString:", v78);

        if ((v37 & 1) == 0)
        {
          if ((objc_msgSend(v13, "isDocumentBeingCopiedToNewZone") & 1) != 0)
          {
            brc_bread_crumbs();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v56 = objc_claimAutoreleasedReturnValue();
            v53 = v70;
            v54 = v74;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v86 = (uint64_t)v13;
              v87 = 2112;
              v88 = v55;
              _os_log_debug_impl(&dword_230455000, v56, OS_LOG_TYPE_DEBUG, "[DEBUG] Seems that item %@ has started a czm after requesting a download%@", buf, 0x16u);
            }
          }
          else
          {
            brc_bread_crumbs();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v56 = objc_claimAutoreleasedReturnValue();
            v53 = v70;
            v54 = v74;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v67;
              v86 = (uint64_t)v33;
              v87 = 2112;
              v88 = v78;
              v89 = 2112;
              v90 = v55;
              _os_log_fault_impl(&dword_230455000, v56, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item download %@ etag changed from %@%@", buf, 0x20u);
            }
          }
          v14 = v73;

          v17 = v78;
          -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:](v76, "cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:", v13, objc_msgSend(v72, "kind"), v78, 1);
          goto LABEL_34;
        }
      }
    }
    willRetryOperationProgress = v76->_willRetryOperationProgress;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v13, "dbRowID"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](willRetryOperationProgress, "objectForKeyedSubscript:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = v76->_willRetryOperationProgress;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v13, "dbRowID"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v41, "removeObjectForKey:", v42);

      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v86 = (uint64_t)v40;
        v87 = 2112;
        v88 = v43;
        _os_log_debug_impl(&dword_230455000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] Re-use progress %@%@", buf, 0x16u);
      }

      v14 = v73;
      v45 = v77;
    }
    else
    {
      objc_msgSend(v13, "currentVersion");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "size");

      v14 = v73;
      if (v24 > v47)
      {
        brc_bread_crumbs();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = (uint64_t)v48;
          _os_log_impl(&dword_230455000, v49, OS_LOG_TYPE_DEFAULT, "[WARNING] Completed unit count is greater than version size; ignoring value%@",
            buf,
            0xCu);
        }

        v24 = 0;
      }
      v83[0] = CFSTR("BRCSizeInfoCompletedUnitCountKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v24);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v83[1] = CFSTR("BRCSizeInfoTotalUnitCountKey");
      v84[0] = v50;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v47);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = v51;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKeyedSubscript:](v76->_pendingOperationProgress, "objectForKeyedSubscript:", v75);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v40 && (!-[BRCDownloadContent kind](v33, "kind") || -[BRCDownloadContent kind](v33, "kind") == 3))
      {
        brc_bread_crumbs();
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          v86 = (uint64_t)v75;
          v87 = 2112;
          v88 = v68;
          _os_log_fault_impl(&dword_230455000, v52, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed finding a progress for stageID: %@%@", buf, 0x16u);
        }

      }
      objc_msgSend(v40, "updateToBeDownloadProgressForDocument:sizeInfo:", v13, v43);
      v45 = v77;
    }

    -[BRCDownloadContent setProgress:](v33, "setProgress:", v40);
    -[BRCDownloadContentsBatchOperation addDownload:](v14, "addDownload:", v33);
    v77 = v45;
    -[BRCFSDownloader _willDownload:operationID:](v76, "_willDownload:operationID:", v33, v45);
    objc_msgSend(v13, "triggerNotificationIfNeeded");
    v17 = v78;
    v53 = v70;
    v54 = v74;
LABEL_34:
    v19 |= v54;

    objc_autoreleasePoolPop(v21);
    v18 = v17;
    v8 = v72;
    if (-[BRCTransferBatchOperation itemsCount](v14, "itemsCount") >= v53)
      goto LABEL_43;
  }
  objc_autoreleasePoolPop(v21);
  v17 = v18;
LABEL_43:
  if (v14)
  {
    v79 = v17;
    if (objc_msgSend(v8, "kind") == 3)
    {
      objc_msgSend(MEMORY[0x24BDB9190], "br_downloadSpeculative");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v19 & 1) == 0)
      {
        -[BRCDownloadContentsBatchOperation setQueuePriority:](v14, "setQueuePriority:", -8);
        -[BRCDownloadContentsBatchOperation setQualityOfService:](v14, "setQualityOfService:", 9);
        goto LABEL_52;
      }
LABEL_50:
      v58 = v14;
      v59 = 4;
    }
    else
    {
      if ((v19 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDB9190], "br_downloadUserInitiated");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_50;
      }
      objc_msgSend(MEMORY[0x24BDB9190], "br_downloadUpdatedDocuments");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v14;
      if (v71)
        v59 = -4;
      else
        v59 = 0;
    }
    -[BRCDownloadContentsBatchOperation setQueuePriority:](v58, "setQueuePriority:", v59, v67);
LABEL_52:
    v11 = v69;
    -[_BRCOperation setNonDiscretionary:](v14, "setNonDiscretionary:", 1, v67);
    -[_BRCOperation setGroup:](v14, "setGroup:", v57);
    brc_bread_crumbs();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = -[BRCTransferBatchOperation itemsCount](v14, "itemsCount");
      objc_msgSend(v69, "contextIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v86 = v62;
      v87 = 2112;
      v88 = v63;
      v89 = 2112;
      v90 = v60;
      _os_log_impl(&dword_230455000, v61, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading %ld documents in %@%@", buf, 0x20u);

    }
    objc_msgSend(v69, "downloadStream");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addBatchOperation:", v14);

    v16 = v75;
    v17 = v79;
  }
  else
  {
    v11 = v69;
    v16 = v75;
  }
  v15 = v77;
LABEL_56:

}

uint64_t __79__BRCFSDownloader__sendContentsBatch_sizeHint_maxRecordsCount_isLoserDownload___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishedDownload:syncContext:operationID:error:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
}

- (void)_postponeLoserForWinner:(int64_t)a3 etag:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  int64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "execute:", CFSTR("UPDATE client_downloads    SET throttle_state = %u  WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@"), 42, a3, 2, v6);

  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v11 = a3;
    v12 = 2080;
    v13 = BRCPrettyPrintEnum();
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v8;
    _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%lld-%s-%@]: postpone because loser is more recent than live item%@", buf, 0x2Au);
  }

}

- (void)_transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BRCFSDownloaderBatchEnumerator *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BRCFSDownloaderBatchEnumerator *v23;
  BRCFSDownloader *v24;
  BRCFSDownloaderBatchEnumerator *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  uint64_t v35;

  v10 = a3;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertOnQueue");
  v35 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = brc_current_date_nsec();
  if (-[BRCFSSchedulerBase isCancelled](self, "isCancelled"))
    goto LABEL_22;
  objc_msgSend(v10, "contextIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "fetch:", CFSTR("  SELECT throttle_id, next_retry_stamp, download_kind, download_etag     FROM client_downloads    WHERE throttle_state = 1      AND transfer_queue = %@      AND transfer_operation IS NULL      AND download_priority >= %ld ORDER BY download_priority DESC, download_request_stamp DESC"), v13, a6);

  if (!objc_msgSend(v14, "next"))
  {
    v15 = 0;
    goto LABEL_19;
  }
  v32 = a4;
  v33 = a5;
  v34 = v10;
  v15 = 0;
  do
  {
    v16 = (void *)MEMORY[0x2348B9F14]();
    v17 = objc_msgSend(v14, "unsignedIntegerAtIndex:", 0);
    v18 = objc_msgSend(v14, "longLongAtIndex:", 1);
    v19 = objc_msgSend(v14, "intAtIndex:", 2);
    objc_msgSend(v14, "stringAtIndex:", 3);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v18 <= v12)
    {
      objc_msgSend(v14, "close");
      v23 = -[BRCFSDownloaderBatchEnumerator initWithSyncContext:kind:now:retryQueueKick:]([BRCFSDownloaderBatchEnumerator alloc], "initWithSyncContext:kind:now:retryQueueKick:", v34, v19, v12, &v35);

      if (v19 >= 2)
      {
        if ((_DWORD)v19 == 2)
        {
          v24 = self;
          v25 = v23;
          v27 = v32;
          v26 = v33;
          v28 = 1;
          goto LABEL_13;
        }
        if ((_DWORD)v19 != 3)
        {
LABEL_14:
          v15 = v23;
          goto LABEL_15;
        }
      }
      v24 = self;
      v25 = v23;
      v27 = v32;
      v26 = v33;
      v28 = 0;
LABEL_13:
      -[BRCFSDownloader _sendContentsBatch:sizeHint:maxRecordsCount:isLoserDownload:](v24, "_sendContentsBatch:sizeHint:maxRecordsCount:isLoserDownload:", v25, v26, v27, v28);
      goto LABEL_14;
    }
    v22 = v35;
    if (v35 >= v18)
      v22 = v18;
    v35 = v22;
    objc_msgSend(v11, "execute:", CFSTR("UPDATE client_downloads    SET transfer_queue = '_retry'  WHERE throttle_id = %ld AND download_kind = %u AND download_etag = %@"), v17, v19, v20);
LABEL_15:

    objc_autoreleasePoolPop(v16);
  }
  while ((objc_msgSend(v14, "next") & 1) != 0);
  v10 = v34;
  if (v35 != 0x7FFFFFFFFFFFFFFFLL)
    -[BRCFSSchedulerBase signalWithDeadline:](self, "signalWithDeadline:");
LABEL_19:
  objc_msgSend(v10, "contextIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v11, "numberWithSQL:", CFSTR("SELECT MIN(next_retry_stamp) FROM client_downloads   WHERE throttle_state = 1     AND transfer_queue = %@      AND transfer_operation IS NULL "), v29);

  if (v30)
  {
    objc_msgSend(v10, "downloadStream");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "signalWithDeadline:", objc_msgSend(v30, "longLongValue"));

  }
LABEL_22:

}

- (void)transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD *v25;
  uint64_t v26;
  const char *label;
  _QWORD v28[5];
  id v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  int64_t v33;
  __int128 v34;
  uint64_t v35;
  _BYTE block[24];
  void *v37;
  NSObject *v38;
  id v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serialQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __115__BRCFSDownloader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke;
  v28[3] = &unk_24FE42A38;
  v28[4] = self;
  v17 = v12;
  v29 = v17;
  v31 = a4;
  v32 = a5;
  v33 = a6;
  v18 = v13;
  v30 = v18;
  v19 = v15;
  v20 = v28;
  v21 = (void *)MEMORY[0x2348B9F14]();
  v34 = 0uLL;
  v35 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v34);
  brc_bread_crumbs();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v26 = v34;
    label = dispatch_queue_get_label(v19);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v26;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v37 = v22;
    _os_log_debug_impl(&dword_230455000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v40 = v34;
  v41 = v35;
  *(_QWORD *)block = v16;
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __dispatch_async_with_logs_block_invoke_7;
  v37 = &unk_24FE3FB28;
  v24 = v19;
  v38 = v24;
  v25 = v20;
  v39 = v25;
  dispatch_async(v24, block);

  objc_autoreleasePoolPop(v21);
}

uint64_t __115__BRCFSDownloader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_transferStreamOfSyncContext:didBecomeReadyWithMaxRecordsCount:sizeHint:priority:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_reportDownloadErrorForDocument:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  objc_msgSend(a4, "brc_telemetryReportableErrorWithRecordName:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "dbRowID");

  objc_msgSend(v13, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v13, "code");
  objc_msgSend(v13, "brc_cloudKitErrorMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "execute:", CFSTR("INSERT OR REPLACE INTO item_errors (item_rowid, error_domain, error_code, error_message, service) VALUES (%llu, %@, %ld, %@, %d)"), v8, v9, v10, v11, 2);

  +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "captureLogsForOperationType:ofSubtype:forError:", CFSTR("SyncHealth"), CFSTR("Download"), v13);

}

- (void)_clearDownloadErrorForDocument:(id)a3
{
  BRCAccountSessionFPFS *session;
  id v4;
  uint64_t v5;
  id v6;

  session = self->super.super._session;
  v4 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dbRowID");

  objc_msgSend(v6, "execute:", CFSTR("DELETE FROM item_errors WHERE item_rowid = %llu AND service = %d"), v5, 2);
}

- (unint64_t)recoverAndReportMissingJobs
{
  return 0;
}

- (void)deviceAndEditorNamesOfItem:(id)a3 etag:(id)a4 downloadKind:(int)a5 lastEditorDeviceName:(id *)a6 lastModifiedNameComponents:(id *)a7
{
  uint64_t v9;
  BRCAccountSessionFPFS *session;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v19;
  char v20;
  id v21;
  id v22;

  v9 = *(_QWORD *)&a5;
  session = self->super.super._session;
  v13 = a4;
  v14 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "dbRowID");

  v22 = (id)objc_msgSend(v15, "fetch:", CFSTR("SELECT transfer_record  FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@"), v16, v9, v13);
  if (objc_msgSend(v22, "next"))
  {
    objc_msgSend(v22, "unarchivedObjectOfClass:atIndex:", objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", self->super.super._session);
    if (a6)
    {
      if ((v18 & 1) != 0)
      {
        objc_msgSend(v17, "brc_lastEditorDeviceName");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a6 = v19;
        goto LABEL_11;
      }
      *a6 = 0;
    }
    if (a7)
      v20 = v18;
    else
      v20 = 1;
    if ((v20 & 1) != 0)
      goto LABEL_12;
    -[BRCAccountSessionFPFS cachedCurrentUserRecordName](self->super.super._session, "cachedCurrentUserRecordName");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v17, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v19, a7);
LABEL_11:

LABEL_12:
  }

}

- (BRCDeadlineScheduler)downloadsDeadlineScheduler
{
  return self->_downloadsDeadlineScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadsDeadlineScheduler, 0);
  objc_storeStrong((id *)&self->_willRetryOperationProgress, 0);
  objc_storeStrong((id *)&self->_lastDownloadRefresh, 0);
  objc_storeStrong((id *)&self->_fairScheduler, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_pendingOperationProgress, 0);
}

void __25__BRCFSDownloader_resume__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Resuming downloader on FPFS, clearing the client downloads table%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_createDownloadingJobForItem:(os_log_t)log state:kind:etag:stageFileName:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = 136315906;
  v4 = "-[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:stageFileName:error:]";
  v5 = 2080;
  v6 = "(passed to caller)";
  v7 = 2112;
  v8 = a1;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_230455000, log, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v3, 0x2Au);
}

- (void)_finishedDownload:syncContext:operationID:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ![[BRCAccountsManager sharedManager] isInSyncBubble]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_184_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] We failed downloading a conflict loser so kicking the apply scheduler in case it was blocked for download%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_184_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] The error is for an unknown item, check if the zone hasn't been wiped%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)rescheduleJobsPendingWinnerForItem:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, (uint64_t)v0, "[DEBUG] Downloader: scheduling %lld suspended throttles%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)_getCancelErrorFromCancelReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: New cancel reasons should be mapped to errors%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: kind == BRCDownloadKindContent || kind == BRCDownloadKindSpeculative%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: etag == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] no need to schedule anything, we're already actively downloading that same etag%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)performFirstSchedulingAfterStartupInDB:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "changes");
  OUTLINED_FUNCTION_4();
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] Rescheduled %lld in-flight transfers because we have restarted%@", v6);
}

@end
