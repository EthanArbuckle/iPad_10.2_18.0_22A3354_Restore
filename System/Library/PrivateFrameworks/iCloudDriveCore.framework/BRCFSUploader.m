@implementation BRCFSUploader

- (unint64_t)_thumbnailOperationsMax
{
  void *v2;
  unint64_t v3;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "thumbnailTransferQueueWidth");

  return v3;
}

- (unint64_t)_minBatchSize
{
  void *v2;
  unint64_t v3;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "transferQueueMinBatchSize");

  return v3;
}

- (BRCFSUploader)initWithAccountSession:(id)a3
{
  id v4;
  void *v5;
  BRCFSUploader *v6;
  BRCThumbnailGenerationManager *v7;
  BRCThumbnailGenerationManager *thumbnailGenerationManager;
  uint64_t v9;
  br_pacer *quotaPacer;
  uint64_t v11;
  brc_task_tracker *thumbnailTracker;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  br_pacer *globalQuotaStateUpdatePacer;
  void *v18;
  void *v19;
  id v20;
  dispatch_workloop_t v21;
  BRCFairScheduler *v22;
  BRCFairScheduler *fairScheduler;
  BRCDeadlineScheduler *v24;
  BRCDeadlineScheduler *uploadsDeadlineScheduler;
  BRCDeadlineSource *v26;
  void *v27;
  uint64_t v28;
  BRCDeadlineSource *retryQueueSource;
  BRCDeadlineSource *v30;
  _QWORD v32[4];
  id v33[5];
  id v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;

  v4 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41.receiver = self;
  v41.super_class = (Class)BRCFSUploader;
  v6 = -[BRCFSSchedulerBase initWithSession:name:tableName:](&v41, sel_initWithSession_name_tableName_, v4, CFSTR("Uploader"), CFSTR("client_uploads"));
  if (v6)
  {
    v7 = objc_alloc_init(BRCThumbnailGenerationManager);
    thumbnailGenerationManager = v6->_thumbnailGenerationManager;
    v6->_thumbnailGenerationManager = v7;

    objc_msgSend(v5, "quotaFetchPacerDelay");
    br_pacer_create();
    v9 = objc_claimAutoreleasedReturnValue();
    quotaPacer = v6->_quotaPacer;
    v6->_quotaPacer = (br_pacer *)v9;

    brc_task_tracker_create("upload-thumbnail-tracker");
    v11 = objc_claimAutoreleasedReturnValue();
    thumbnailTracker = v6->_thumbnailTracker;
    v6->_thumbnailTracker = (brc_task_tracker *)v11;

    objc_initWeak(&location, v6);
    v13 = (void *)MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __40__BRCFSUploader_initWithAccountSession___block_invoke;
    v38[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v39, &location);
    -[BRCThumbnailGenerationManager setHasThumbnailAvailableSlot:](v6->_thumbnailGenerationManager, "setHasThumbnailAvailableSlot:", v38);
    v36[0] = v13;
    v36[1] = 3221225472;
    v36[2] = __40__BRCFSUploader_initWithAccountSession___block_invoke_3;
    v36[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v37, &location);
    -[BRCThumbnailGenerationManager setReachedThumbnailMaximumCapacity:](v6->_thumbnailGenerationManager, "setReachedThumbnailMaximumCapacity:", v36);
    v34[1] = v13;
    v34[2] = (id)3221225472;
    v34[3] = __40__BRCFSUploader_initWithAccountSession___block_invoke_4;
    v34[4] = &unk_24FE3F9C8;
    objc_copyWeak(&v35, &location);
    br_pacer_set_event_handler();
    objc_msgSend(v4, "clientDB");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serialQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    br_pacer_create();
    v16 = objc_claimAutoreleasedReturnValue();
    globalQuotaStateUpdatePacer = v6->_globalQuotaStateUpdatePacer;
    v6->_globalQuotaStateUpdatePacer = (br_pacer *)v16;

    v33[1] = (id)MEMORY[0x24BDAC760];
    v33[2] = (id)3221225472;
    v33[3] = __40__BRCFSUploader_initWithAccountSession___block_invoke_5;
    v33[4] = &unk_24FE3F9C8;
    objc_copyWeak(v34, &location);
    br_pacer_set_event_handler();
    objc_msgSend(v4, "personaIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    BRPersonaSpecificName();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_retainAutorelease(v19);
    v21 = dispatch_workloop_create((const char *)objc_msgSend(v20, "UTF8String"));
    v22 = -[BRCFairScheduler initWithWorkloop:name:]([BRCFairScheduler alloc], "initWithWorkloop:name:", v21, v20);
    fairScheduler = v6->_fairScheduler;
    v6->_fairScheduler = v22;

    v24 = -[BRCDeadlineScheduler initWithName:fairScheduler:]([BRCDeadlineScheduler alloc], "initWithName:fairScheduler:", CFSTR("com.apple.bird.uploader"), v6->_fairScheduler);
    uploadsDeadlineScheduler = v6->_uploadsDeadlineScheduler;
    v6->_uploadsDeadlineScheduler = v24;

    -[BRCDeadlineScheduler setCoalescingLeeway:](v6->_uploadsDeadlineScheduler, "setCoalescingLeeway:", 10000000);
    v26 = [BRCDeadlineSource alloc];
    -[BRCAccountSessionFPFS defaultScheduler](v6->super.super._session, "defaultScheduler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[BRCDeadlineSource initWithScheduler:name:](v26, "initWithScheduler:name:", v27, CFSTR("uploader-retry"));
    retryQueueSource = v6->_retryQueueSource;
    v6->_retryQueueSource = (BRCDeadlineSource *)v28;

    -[BRCDeadlineSource setWorkloop:](v6->_retryQueueSource, "setWorkloop:", v6->super.super._schedulerWorkloop);
    v30 = v6->_retryQueueSource;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __40__BRCFSUploader_initWithAccountSession___block_invoke_6;
    v32[3] = &unk_24FE3F9C8;
    objc_copyWeak(v33, &location);
    -[BRCDeadlineSource setEventHandler:](v30, "setEventHandler:", v32);
    objc_destroyWeak(v33);

    objc_destroyWeak(v34);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __40__BRCFSUploader_initWithAccountSession___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  NSObject *v3;
  id *v4;
  _QWORD block[4];
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[1], "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__BRCFSUploader_initWithAccountSession___block_invoke_2;
  block[3] = &unk_24FE3FA18;
  v6 = WeakRetained;
  v4 = WeakRetained;
  dispatch_async(v3, block);

}

uint64_t __40__BRCFSUploader_initWithAccountSession___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume");
}

void __40__BRCFSUploader_initWithAccountSession___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[2], "suspend");

}

void __40__BRCFSUploader_initWithAccountSession___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scheduleQuotaFetchForDefaultOwner");

}

void __40__BRCFSUploader_initWithAccountSession___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_globalQuotaStateUpdateForDefaultOwner");

}

void __40__BRCFSUploader_initWithAccountSession___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6[3];

  v2 = (void *)MEMORY[0x2348B9F14]();
  memset(v6, 0, sizeof(v6));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader initWithAccountSession:]_block_invoke_6", 172, v6);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __40__BRCFSUploader_initWithAccountSession___block_invoke_6_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_scheduleRetries");

  __brc_leave_section(v6);
  objc_autoreleasePoolPop(v2);
}

- (void)resume
{
  void *v3;
  void *v4;
  id v5;
  BRCAccountSessionFPFS *session;
  id v7;
  void *v8;
  BRCUploadCKRecordProvider *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BRCUploadCKRecordProvider *v14;
  BRCUploadCKRecordProvider *uploadCKRecordProvider;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[4];
  id v20;

  br_pacer_resume();
  -[BRCAccountSessionFPFS clientState](self->super.super._session, "clientState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("availableQuota"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    br_pacer_signal();
  br_pacer_resume();
  -[BRCDeadlineSource signal](self->_retryQueueSource, "signal");
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  session = self->super.super._session;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __23__BRCFSUploader_resume__block_invoke;
  v19[3] = &unk_24FE46C48;
  v20 = v5;
  v7 = v5;
  -[BRCAccountSessionFPFS enumerateServerZones:](session, "enumerateServerZones:", v19);
  -[BRCAccountSessionFPFS globalProgress](self->super.super._session, "globalProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeProgressForZones:", v7);

  -[BRCDeadlineScheduler resume](self->_uploadsDeadlineScheduler, "resume");
  -[BRCDeadlineSource resume](self->_retryQueueSource, "resume");
  -[BRCFairScheduler resume](self->_fairScheduler, "resume");
  v9 = [BRCUploadCKRecordProvider alloc];
  -[BRCAccountSessionFPFS stageRegistry](self->super.super._session, "stageRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[BRCAccountSessionFPFS volume](self->super.super._session, "volume");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "deviceID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BRCUploadCKRecordProvider initWithStageRegistry:deviceID:](v9, "initWithStageRegistry:deviceID:", v10, v13);
  uploadCKRecordProvider = self->_uploadCKRecordProvider;
  self->_uploadCKRecordProvider = v14;

  v18.receiver = self;
  v18.super_class = (Class)BRCFSUploader;
  -[BRCFSSchedulerBase resume](&v18, sel_resume);
  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addScreenLockObserver:", self);

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addReachabilityObserver:", self);

}

uint64_t __23__BRCFSUploader_resume__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

- (void)suspend
{
  objc_super v3;

  -[BRCDeadlineScheduler suspend](self->_uploadsDeadlineScheduler, "suspend");
  -[BRCDeadlineSource suspend](self->_retryQueueSource, "suspend");
  -[BRCFairScheduler suspend](self->_fairScheduler, "suspend");
  v3.receiver = self;
  v3.super_class = (Class)BRCFSUploader;
  -[BRCFSSchedulerBase suspend](&v3, sel_suspend);
}

- (void)close
{
  BRCUploadCKRecordProvider *uploadCKRecordProvider;
  objc_super v4;

  -[BRCDeadlineScheduler close](self->_uploadsDeadlineScheduler, "close");
  -[BRCFairScheduler close](self->_fairScheduler, "close");
  br_pacer_cancel();
  uploadCKRecordProvider = self->_uploadCKRecordProvider;
  self->_uploadCKRecordProvider = 0;

  v4.receiver = self;
  v4.super_class = (Class)BRCFSUploader;
  -[BRCFSSchedulerBase close](&v4, sel_close);
}

- (void)_close
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRCFSUploader;
  -[BRCFSSchedulerBase _close](&v3, sel__close);
  brc_task_tracker_wait((uint64_t)self->_thumbnailTracker);
}

- (void)cancel
{
  void *v3;
  void *v4;
  objc_super v5;

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeScreenLockObserver:", self);

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeReachabilityObserver:", self);

  -[BRCDeadlineSource cancel](self->_retryQueueSource, "cancel");
  v5.receiver = self;
  v5.super_class = (Class)BRCFSUploader;
  -[BRCFSSchedulerBase cancel](&v5, sel_cancel);
  brc_task_tracker_cancel(self->_thumbnailTracker);
}

- (void)setState:(int)a3 forItem:(id)a4
{
  uint64_t v4;
  BRCItemDBRowIDJobIdentifier *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v6 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", objc_msgSend(v8, "dbRowID"));
  objc_msgSend(v8, "serverZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFSUploader setState:forUploadJobID:zone:](self, "setState:forUploadJobID:zone:", v4, v6, v7);

}

- (void)setState:(int)a3 forItem:(id)a4 uploadError:(id)a5
{
  uint64_t v6;
  id v8;
  BRCItemDBRowIDJobIdentifier *v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)&a3;
  v11 = a4;
  v8 = a5;
  v9 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", objc_msgSend(v11, "dbRowID"));
  objc_msgSend(v11, "serverZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFSUploader setState:forUploadJobID:zone:uploadError:](self, "setState:forUploadJobID:zone:uploadError:", v6, v9, v10, v8);

}

- (int)getStateOfDocumentItem:(id)a3
{
  BRCItemDBRowIDJobIdentifier *v4;

  v4 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", objc_msgSend(a3, "dbRowID"));
  LODWORD(self) = -[BRCFSSchedulerBase jobStateFor:](self, "jobStateFor:", v4);

  return (int)self;
}

- (id)_buildItemTooLargeErrorIfNeeded:(id)a3 syncContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "currentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isPackage"))
    v9 = objc_msgSend(v8, "uploadMaxPkgFileSize");
  else
    v9 = objc_msgSend(v8, "uploadMaxFileSize");
  v10 = v9;
  v11 = objc_msgSend(v7, "size");
  if (v11 >= v10)
    goto LABEL_9;
  if (objc_msgSend(v7, "isPackage"))
  {
    v12 = objc_msgSend(v5, "dbRowID");
    objc_msgSend(v5, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[BRCPackageItem largestPackageItemSizeInItemRowID:session:](BRCPackageItem, "largestPackageItemSizeInItemRowID:session:", v12, v13);

    v14 = objc_msgSend(v8, "uploadMaxInPkgFileSize");
    if (v11 >= v14)
    {
      v10 = v14;
LABEL_9:
      v16 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v5, "st");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filename");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "brc_errorDocumentWithFilename:size:isTooLargeToUpload:", v18, v11, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (void)_updateJobID:(id)a3 setStageID:(id)a4 operationID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
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
  v8 = a3;
  v9 = a4;
  v10 = a5;
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v11;
    _os_log_debug_impl(&dword_230455000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: upload stage set to: %@%@", buf, 0x20u);
  }

  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchingJobsWhereSQLClause");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "execute:", CFSTR("UPDATE client_uploads SET transfer_stage = %@, transfer_operation = %@ WHERE %@"), v9, v10, v14);

}

- (id)_documentItemForJobID:(id)a3 stageID:(id)a4
{
  BRCAccountSessionFPFS *session;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  session = self->super.super._session;
  v7 = a4;
  v8 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchingJobsWhereSQLClause");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "numberWithSQL:", CFSTR("SELECT zone_rowid FROM client_uploads WHERE %@ AND transfer_stage = %@"), v10, v7);

  -[BRCAccountSessionFPFS serverZoneByRowID:](self->super.super._session, "serverZoneByRowID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "itemDBRowID");

  objc_msgSend(v13, "itemByRowID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "asDocument");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_documentItemForJobID:(id)a3 operationID:(id)a4
{
  BRCAccountSessionFPFS *session;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  session = self->super.super._session;
  v7 = a4;
  v8 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchingJobsWhereSQLClause");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "numberWithSQL:", CFSTR("SELECT zone_rowid FROM client_uploads WHERE %@ AND transfer_operation = %@"), v10, v7);

  -[BRCAccountSessionFPFS serverZoneByRowID:](self->super.super._session, "serverZoneByRowID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clientZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "itemDBRowID");

  objc_msgSend(v13, "itemByRowID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "asDocument");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isUploadingItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (objc_msgSend(v3, "needsUpload"))
  {
    objc_msgSend(v3, "db");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "numberWithSQL:", CFSTR("SELECT transfer_operation IS NOT NULL FROM client_uploads WHERE throttle_id = %llu"), objc_msgSend(v3, "dbRowID"));

  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)_willAttemptJobID:(id)a3 throttle:(id)a4 operationID:(id)a5
{
  BRCAccountSessionFPFS *session;
  id v7;
  id v8;
  void *v9;
  id v10;

  session = self->super.super._session;
  v7 = a5;
  v8 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "matchingJobsWhereSQLClause");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "execute:", CFSTR("UPDATE client_uploads SET   throttle_state = 1, transfer_operation = %@ WHERE %@"), v7, v9);
}

- (void)_cancelJobs:(id)a3 state:(int)a4 uploadError:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *context;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41[3];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v35 = *(_QWORD *)&a4;
  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v34 = a5;
  if (objc_msgSend(v6, "next"))
  {
    do
    {
      context = (void *)MEMORY[0x2348B9F14]();
      objc_msgSend(v6, "numberAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringAtIndex:", 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuidAtIndex:", 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringAtIndex:", 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberAtIndex:", 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "intAtIndex:", 5);
      objc_msgSend(v6, "numberAtIndex:", 6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSessionFPFS appLibraryByRowID:](self->super.super._session, "appLibraryByRowID:", v9);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCAccountSessionFPFS serverZoneByRowID:](self->super.super._session, "serverZoneByRowID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      memset(v41, 0, sizeof(v41));
      __brc_create_section(0, (uint64_t)"-[BRCFSUploader _cancelJobs:state:uploadError:]", 385, v41);
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v33 = v41[0];
        v32 = BRCPrettyPrintEnum();
        v31 = BRCPrettyPrintEnum();
        *(_DWORD *)buf = 134219010;
        v43 = v33;
        v44 = 2112;
        v45 = v7;
        v46 = 2080;
        v47 = v32;
        v48 = 2080;
        v49 = v31;
        v50 = 2112;
        v51 = v13;
        _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: %s -> %s [cancel-job]%@", buf, 0x34u);
      }

      if (v10 == 32)
      {
        if ((_DWORD)v35 == 32)
          goto LABEL_12;
        objc_msgSend(v12, "ownerName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCFSUploader scheduleQuotaStateUpdateForOwner:](self, "scheduleQuotaStateUpdateForOwner:", v18);
      }
      else
      {
        if (v10 != 1)
          goto LABEL_12;
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v43 = (uint64_t)v7;
          v44 = 2112;
          v45 = v15;
          _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: Cancelling upload%@", buf, 0x16u);
        }

        -[BRCAccountSessionFPFS itemByRowID:](self->super.super._session, "itemByRowID:", objc_msgSend(v7, "unsignedIntegerValue"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "asDocument");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[BRCAccountSessionFPFS globalProgress](self->super.super._session, "globalProgress");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "updateUploadThrottleForDocument:toState:", v18, v35);

      }
LABEL_12:
      if (objc_msgSend(v39, "isEqualToString:", CFSTR("_prepare")))
      {
        -[BRCFSUploader thumbnailGenerationManager](self, "thumbnailGenerationManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "operationForThumbnailID:", v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v21, "cancel");
          brc_bread_crumbs();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v43 = (uint64_t)v7;
            v44 = 2112;
            v45 = v21;
            v46 = 2112;
            v47 = (uint64_t)v22;
            _os_log_debug_impl(&dword_230455000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: cancelled thumbnail upload: %@%@", buf, 0x20u);
          }

LABEL_19:
        }

        goto LABEL_21;
      }
      if (v38)
      {
        +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v12, v37);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uploadStream");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cancelTransferID:operationID:", v7, v38);
        goto LABEL_19;
      }
LABEL_21:
      if (v8)
      {
        brc_bread_crumbs();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v43 = (uint64_t)v7;
          v44 = 2112;
          v45 = v8;
          v46 = 2112;
          v47 = (uint64_t)v24;
          _os_log_debug_impl(&dword_230455000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: Cleaning up upload stage: %@%@", buf, 0x20u);
        }

        -[BRCAccountSessionFPFS stageRegistry](self->super.super._session, "stageRegistry");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "cleanupStagedUploadWithID:", v8);

      }
      if (v34)
      {
        v27 = (void *)MEMORY[0x24BEDD638];
        objc_msgSend(v34, "description");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "formatInjection:", CFSTR(", upload_error = %@ "), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "db");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "execute:", CFSTR("UPDATE client_uploads SET  throttle_state = %d, transfer_queue = '_prepare', transfer_record = NULL, transfer_stage = NULL, transfer_operation = NULL%@ WHERE throttle_id = %@"), v35, v29, v7);

      __brc_leave_section(v41);
      objc_autoreleasePoolPop(context);
    }
    while ((objc_msgSend(v6, "next") & 1) != 0);
  }
  objc_msgSend(v6, "close");

}

- (void)_cancelJobsMatching:(id)a3
{
  BRCAccountSessionFPFS *session;
  id v5;
  void *v6;
  void *v7;
  id v8;

  session = self->super.super._session;
  v5 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchingJobsWhereSQLClause");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v8, "fetch:", CFSTR("SELECT throttle_id, transfer_queue, transfer_operation, transfer_stage, app_library_rowid, throttle_state, zone_rowid   FROM client_uploads  WHERE %@ AND throttle_state != 0"), v6);
  -[BRCFSUploader _cancelJobs:state:uploadError:](self, "_cancelJobs:state:uploadError:", v7, 0, 0);

}

- (void)deleteJobsMatching:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[BRCFSUploader _cancelJobsMatching:](self, "_cancelJobsMatching:", v4);
  v5.receiver = self;
  v5.super_class = (Class)BRCFSUploader;
  -[BRCFSSchedulerBase deleteJobsMatching:](&v5, sel_deleteJobsMatching_, v4);

}

- (void)deleteJobsForZone:(id)a3
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
  objc_msgSend(v5, "dbRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "fetch:", CFSTR("SELECT throttle_id, transfer_queue, transfer_operation, transfer_stage, app_library_rowid, throttle_state, zone_rowid   FROM client_uploads  WHERE zone_rowid = %@ AND throttle_state != 0"), v7);
  -[BRCFSUploader _cancelJobs:state:uploadError:](self, "_cancelJobs:state:uploadError:", v8, 0, 0);

  v9.receiver = self;
  v9.super_class = (Class)BRCFSUploader;
  -[BRCFSSchedulerBase deleteJobsMatching:](&v9, sel_deleteJobsMatching_, v5);

}

- (void)cancelAndCleanupItemUpload:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9[3];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader cancelAndCleanupItemUpload:]", 454, v9);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = v9[0];
    objc_msgSend(v4, "jobsDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: cancel and cleanup item upload%@", buf, 0x20u);

  }
  -[BRCFSUploader _cancelJobsMatching:](self, "_cancelJobsMatching:", v4);
  __brc_leave_section(v9);

}

- (void)_rescheduleUploadJobsPendingState:(int)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14[3];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3 == 35)
  {
    v4 = CFSTR("35");
    goto LABEL_5;
  }
  if (a3 == 36)
  {
    v4 = CFSTR("36");
LABEL_5:
    objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", -[__CFString UTF8String](v4, "UTF8String"), -[__CFString length](v4, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v14, 0, sizeof(v14));
    __brc_create_section(0, (uint64_t)"-[BRCFSUploader _rescheduleUploadJobsPendingState:]", 473, v14);
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = v14[0];
      v13 = BRCPrettyPrintEnum();
      *(_DWORD *)buf = 134218498;
      v16 = v12;
      v17 = 2080;
      v18 = v13;
      v19 = 2112;
      v20 = v6;
      _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx re-uploading failed items for %s%@", buf, 0x20u);
    }

    -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "execute:", CFSTR("UPDATE client_items SET version_upload_error = NULL, item_notifs_rank = bump_notifs_rank_and_trigger_notifs(rowid) WHERE rowid IN (SELECT throttle_id FROM client_uploads WHERE throttle_state = %@)"), v5);
    if (objc_msgSend(v8, "changes"))
    {
      objc_msgSend(v8, "execute:", CFSTR("UPDATE client_uploads SET throttle_state = 1, upload_error = NULL WHERE throttle_state = %@"), v5);
      if (objc_msgSend(v8, "changes"))
      {
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[BRCFSUploader _rescheduleUploadJobsPendingState:].cold.2();

        -[BRCFSSchedulerBase signal](self, "signal");
      }
    }

    __brc_leave_section(v14);
    goto LABEL_16;
  }
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[BRCFSUploader _rescheduleUploadJobsPendingState:].cold.1();

LABEL_16:
}

- (void)_rescheduleJobsPendingNetwork
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] ┏%llx Network available - re-uploading failed items for no network%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_rescheduleJobsPendingScreenUnlock
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] ┏%llx Screen is unlocked - re-uploading failed items for data protection class%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)rescheduleJobsPendingRecentsAndFavoritesFetchInZone:(id)a3
{
  BRCAccountSessionFPFS *session;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  session = self->super.super._session;
  v5 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dbRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "execute:", CFSTR("UPDATE client_uploads SET throttle_state = 1 WHERE throttle_state = 30 AND zone_rowid = %@ AND throttle_state != 0"), v7);
  if (objc_msgSend(v6, "changes"))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCFSUploader _rescheduleUploadJobsPendingState:].cold.2();

    -[BRCFSSchedulerBase signal](self, "signal");
  }

}

- (void)addAliasItem:(id)a3 toUploadingItem:(id)a4
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
  v9 = (void *)objc_msgSend(v8, "fetchObjectOfClass:sql:", objc_opt_class(), CFSTR("SELECT transfer_operation    FROM client_uploads  WHERE throttle_id = %lld AND throttle_state == 1"), objc_msgSend(v7, "dbRowID"));

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
    objc_msgSend(v12, "uploadStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v7, "dbRowID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAliasItem:toTransferWithID:operationID:", v6, v14, v9);

  }
}

- (void)setState:(int)a3 forJobID:(id)a4 zone:(id)a5
{
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_fault_impl(&dword_230455000, v6, OS_LOG_TYPE_FAULT, "[CRIT] API MISUSE: should call setState:forUploadJobID:zone:%@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)setState:(int)a3 forUploadJobID:(id)a4 zone:(id)a5
{
  -[BRCFSUploader setState:forUploadJobID:zone:uploadError:](self, "setState:forUploadJobID:zone:uploadError:", *(_QWORD *)&a3, a4, a5, 0);
}

- (void)setState:(int)a3 forUploadJobID:(id)a4 zone:(id)a5 uploadError:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  uint64_t v30[3];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v8 = *(_QWORD *)&a3;
  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader setState:forUploadJobID:zone:uploadError:]", 564, v30);
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v27 = v30[0];
    v28 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 134218754;
    v32 = v27;
    v33 = 2112;
    v34 = v10;
    v35 = 2080;
    v36 = v28;
    v37 = 2112;
    v38 = v13;
    _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: setting state to %s%@", buf, 0x2Au);
  }

  if ((_DWORD)v8 == 1)
  {
    -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __58__BRCFSUploader_setState_forUploadJobID_zone_uploadError___block_invoke;
    v29[3] = &unk_24FE3FEF0;
    v29[4] = self;
    v19 = (void *)MEMORY[0x2348BA0DC](v29);
    objc_msgSend(v10, "matchingJobsWhereSQLClause");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "execute:", CFSTR("UPDATE client_uploads SET  throttle_state = call_block(%@, next_retry_stamp, app_library_rowid, zone_rowid), transfer_queue = %@ WHERE %@"), v19, CFSTR("_prepare"), v20);

  }
  else if ((_DWORD)v8 == 31)
  {
    if (v12)
    {
      v15 = (void *)MEMORY[0x24BEDD638];
      objc_msgSend(v12, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "formatInjection:", CFSTR("upload_error = %@, "), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", ", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "matchingJobsWhereSQLClause");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "execute:", CFSTR("UPDATE client_uploads    SET throttle_state = %d, %@ transfer_operation = NULL  WHERE %@"), 31, v17, v26);

  }
  else
  {
    -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "matchingJobsWhereSQLClause");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "fetch:", CFSTR("SELECT throttle_id, transfer_queue, transfer_operation, transfer_stage, app_library_rowid, throttle_state, zone_rowid   FROM client_uploads  WHERE %@"), v22);
    -[BRCFSUploader _cancelJobs:state:uploadError:](self, "_cancelJobs:state:uploadError:", v23, v8, v12);

    if ((_DWORD)v8 == 32)
    {
      objc_msgSend(v11, "ownerName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCFSUploader ownerDidReceiveOutOfQuotaError:](self, "ownerDidReceiveOutOfQuotaError:", v24);

    }
  }
  __brc_leave_section(v30);

}

void __58__BRCFSUploader_setState_forUploadJobID_zone_uploadError___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  sqlite3_int64 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = sqlite3_value_int64(*a4);
  if (sqlite3_value_int(a4[1]))
  {
    objc_msgSend(*(id *)(a1 + 32), "signalWithDeadline:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", sqlite3_value_int64(a4[1]));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", sqlite3_value_int64(a4[2]));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "appLibraryByRowID:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverZoneByRowID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uploadStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "signalWithDeadline:", v7);

  }
  sqlite3_result_int(a2, 1);
}

- (void)uploadItem:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  int v36;
  unsigned int v37;
  void *v38;
  void *v39;
  BRCItemDBRowIDJobIdentifier *v40;
  void *v41;
  void *v42;
  void *v44;
  uint64_t v45[3];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  memset(v45, 0, sizeof(v45));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader uploadItem:]", 607, v45);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v30 = v45[0];
    objc_msgSend(v3, "jobsDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v47 = v30;
    v48 = 2112;
    v49 = v31;
    v50 = 2112;
    v51 = v4;
    _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: uploading%@", buf, 0x20u);

  }
  objc_msgSend(v3, "appLibrary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uploadError");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "syncContextUsedForTransfers");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v44, "brc_isCloudKitErrorDataProtectionClass") && !self->_isScreenLocked)
  {

    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "itemID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "debugItemIDString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = (uint64_t)v33;
      v48 = 2112;
      v49 = v8;
      _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Screen no longer locked. Try upload item: %@%@", buf, 0x16u);

    }
  }
  else if (v44)
  {
    if ((objc_msgSend(v44, "brc_isCloudKitOutOfQuota") & 1) != 0)
    {
      v36 = 0;
      v7 = 32;
    }
    else if ((objc_msgSend(v44, "brc_isCloudKitErrorDataProtectionClass") & 1) != 0)
    {
      v36 = 0;
      v7 = 35;
    }
    else
    {
      v36 = 0;
      if (objc_msgSend(v44, "brc_isCloudKitErrorNoNetwork"))
        v7 = 36;
      else
        v7 = 33;
    }
    goto LABEL_23;
  }
  -[BRCAccountSessionFPFS syncUpScheduler](self->super.super._session, "syncUpScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isItemPendingSyncUp:", v3);

  if ((v11 & 1) != 0)
  {
    v36 = 0;
    v44 = 0;
    v7 = 31;
  }
  else
  {
    -[BRCFSUploader _buildItemTooLargeErrorIfNeeded:syncContext:](self, "_buildItemTooLargeErrorIfNeeded:syncContext:", v3, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v36 = 0;
      v7 = 34;
    }
    else
    {
      objc_msgSend(v3, "serverZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v12, "hasFetchedRecentsAndFavorites");

      v44 = 0;
      if (v36)
        v7 = 1;
      else
        v7 = 30;
    }
  }
LABEL_23:
  v37 = v7;
  objc_msgSend(v3, "currentVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUploadError:", v44);

  v14 = v3;
  v40 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", objc_msgSend(v14, "dbRowID"));

  objc_msgSend(v42, "uploadThrottle");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "app_library_rowid, transfer_queue, transfer_size, transfer_record, transfer_stage, transfer_operation, upload_priority, upload_request_stamp , zone_rowid", 153);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BEDD638];
  objc_msgSend(v41, "dbRowID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "size");
  objc_msgSend(v14, "currentVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "thumbnailSize");
  objc_msgSend(v14, "serverZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dbRowID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "formatInjection:", CFSTR("%@, %@, %lld, %@, %@, %@, %lld, %lld, %@"), v16, CFSTR("_prepare"), v20 + v18, 0, 0, 0, -1, 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BEDD638];
  objc_msgSend(v14, "serverZone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dbRowID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "formatInjection:", CFSTR("zone_rowid = %@"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[BRCFSSchedulerBase insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:](self, "insertOrUpdateJobID:throttle:withState:insertedSQLColumn:insertedSQLValues:updatedSQLValues:error:", v40, v38, v37, v39, v23, v27, 0);
  v35 = v28;

  if (v36)
  {
    -[BRCFSSchedulerBase signalWithDeadline:](self, "signalWithDeadline:", v35);
  }
  else if (v34 == 1)
  {
    -[BRCAccountSessionFPFS globalProgress](self->super.super._session, "globalProgress");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "updateUploadThrottleForDocument:toState:", v14, v37);

  }
  __brc_leave_section(v45);

}

- (void)_scheduleRetries
{
  *(_DWORD *)a2 = 134218242;
  *(double *)(a2 + 4) = a4;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_3(&dword_230455000, a3, (uint64_t)a3, "[DEBUG] Uploader: next job to retry in %.3fs%@", (uint8_t *)a2);
}

void __33__BRCFSUploader__scheduleRetries__block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, uint64_t a4)
{
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
  id v17;
  void *v18;
  sqlite3_int64 v19;
  int v20;
  sqlite3_int64 v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "newFromSqliteValue:", *(_QWORD *)(a4 + 8));
  objc_msgSend(v7, "appLibraryByRowID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v11 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "newFromSqliteValue:", *(_QWORD *)(a4 + 24));
  objc_msgSend(v10, "serverZoneByRowID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contextIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v19 = sqlite3_value_int64(*(sqlite3_value **)a4);
    v20 = 134218498;
    v21 = v19;
    v22 = 2112;
    v23 = v14;
    v24 = 2112;
    v25 = v15;
    _os_log_debug_impl(&dword_230455000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%lld]: job has been put back in queue %@%@", (uint8_t *)&v20, 0x20u);
  }

  v17 = objc_retainAutorelease(v14);
  sqlite3_result_text(a2, (const char *)objc_msgSend(v17, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v13, "uploadStream");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "signalWithDeadline:", sqlite3_value_int64(*(sqlite3_value **)(a4 + 16)));

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
  objc_msgSend(v4, "execute:", CFSTR("UPDATE client_uploads SET transfer_operation = NULL WHERE (transfer_operation >= '')"));
  if (objc_msgSend(v4, "changes"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCFSUploader performFirstSchedulingAfterStartupInDB:].cold.1(v4, (uint64_t)v5, v6);

  }
  v7 = (void *)objc_msgSend(v4, "fetch:", CFSTR("SELECT app_library_rowid, zone_rowid, transfer_queue   FROM client_uploads  WHERE throttle_state = 1 GROUP BY app_library_rowid, zone_rowid, transfer_queue"));
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
          _os_log_debug_impl(&dword_230455000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Kicking uploads for %@%@", buf, 0x16u);

        }
        +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v14, v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uploadStream");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "signal");

      }
      objc_autoreleasePoolPop(v8);
    }
    while ((objc_msgSend(v7, "next") & 1) != 0);
  }
  -[BRCFSUploader setIsDefaultOwnerOutOfQuota:forceSignalContainers:](self, "setIsDefaultOwnerOutOfQuota:forceSignalContainers:", -[BRCFSUploader hasItemsOverQuotaForOwner:](self, "hasItemsOverQuotaForOwner:", *MEMORY[0x24BDB8E88]), 1);

}

- (BOOL)canScheduleMoreJobs
{
  return -[BRCThumbnailGenerationManager canScheduleMoreJobs](self->_thumbnailGenerationManager, "canScheduleMoreJobs");
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

  objc_msgSend(MEMORY[0x24BEDD638], "formatInjection:", CFSTR("transfer_queue = '_prepare' AND transfer_operation IS NULL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEDD648], "rawInjection:length:", "throttle_id, app_library_rowid, zone_rowid", 42);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __25__BRCFSUploader_schedule__block_invoke;
  v7[3] = &unk_24FE429E8;
  v7[4] = self;
  -[BRCFSSchedulerBase scheduleWithBatchSize:whereSQLClause:columns:actionHandler:](self, "scheduleWithBatchSize:whereSQLClause:columns:actionHandler:", v4, v5, v6, v7);

}

void __25__BRCFSUploader_schedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  BRCItemDBRowIDJobIdentifier *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  BRCItemDBRowIDJobIdentifier *v22;
  id v23;
  id v24;

  v5 = a2;
  v6 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", objc_msgSend(v5, "longLongAtIndex:", a3));
  objc_msgSend(v5, "numberAtIndex:", (a3 + 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberAtIndex:", (a3 + 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "appLibraryByRowID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "serverZoneByRowID:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __25__BRCFSUploader_schedule__block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "deleteJobsMatching:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "itemByRowID:", -[BRCItemDBRowIDJobIdentifier itemDBRowID](v6, "itemDBRowID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "asDocument");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:", v11, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v5, "db");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __25__BRCFSUploader_schedule__block_invoke_102;
      v21[3] = &unk_24FE46C70;
      v21[4] = *(_QWORD *)(a1 + 32);
      v22 = v6;
      v23 = v16;
      v24 = v17;
      objc_msgSend(v18, "groupInBatch:", v21);

    }
    else
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        __25__BRCFSUploader_schedule__block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "deleteJobsMatching:", v6);
    }

  }
}

uint64_t __25__BRCFSUploader_schedule__block_invoke_102(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeRecordForJobID:item:syncContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (BOOL)_updatePackageRecord:(id)a3 item:(id)a4 stageID:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  BRCPackageManifestWriter *v17;
  void *v18;
  BRCPackageManifestWriter *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  BRCLazyPackage *v38;
  id v39;
  id *v40;
  BRCPackageManifestWriter *v41;
  NSObject *v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id obj;
  id v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  BRCPackageManifestWriter *v73;
  void *v74;
  BRCLazyPackage *v75;
  void *v76;
  BRFieldPkgItem *v77;
  void *v78;
  void *v80;
  void *v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  BRFieldPkgItem *v87;
  id v88;
  BRCLazyPackage *v89;
  BRCPackageManifestWriter *v90;
  id v91;
  id *v92;
  id v93;
  id v94;
  uint8_t buf[4];
  id v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  id v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[BRCAccountSessionFPFS stageRegistry](self->super.super._session, "stageRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createURLForUploadWithStageID:name:", v11, CFSTR("brpackage"));
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createURLForUploadWithStageID:name:", v11, CFSTR("ckpackage"));
  v14 = objc_claimAutoreleasedReturnValue();
  v78 = v9;
  objc_msgSend(v9, "getAndUpdateBoundaryKeyForItem:", v10);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[BRCFSUploader _updatePackageRecord:item:stageID:error:].cold.2(v10, (uint64_t)v15, v16);

  v17 = [BRCPackageManifestWriter alloc];
  objc_msgSend(v10, "clientZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)v13;
  v19 = -[BRCPackageManifestWriter initWithZone:stageID:url:](v17, "initWithZone:stageID:url:", v18, v11, v13);

  -[BRCPackageManifestWriter error](v19, "error");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    v77 = objc_alloc_init(BRFieldPkgItem);
    v94 = 0;
    objc_msgSend(MEMORY[0x24BDB9198], "br_packageWithBoundaryKey:error:", v81, &v94);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v94;
    v31 = v30;
    v23 = (void *)v14;
    if (v29)
    {
      v93 = v30;
      v32 = objc_msgSend(v29, "anchorAtURL:error:", v14, &v93);
      v33 = v29;
      v34 = v32;
      v71 = v93;

      if ((v34 & 1) != 0)
      {
        v35 = (void *)MEMORY[0x24BDD16E0];
        -[BRCAccountSessionFPFS volume](self->super.super._session, "volume");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "numberWithInt:", objc_msgSend(v36, "deviceID"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = -[BRCLazyPackage initWithRegistry:stageID:name:boundaryKey:]([BRCLazyPackage alloc], "initWithRegistry:stageID:name:boundaryKey:", v12, v11, CFSTR("ckpackage-xattrs"), v81);
        v83[0] = MEMORY[0x24BDAC760];
        v83[1] = 3221225472;
        v83[2] = __57__BRCFSUploader__updatePackageRecord_item_stageID_error___block_invoke;
        v83[3] = &unk_24FE46C98;
        v63 = v10;
        v84 = v63;
        v69 = v37;
        v70 = v33;
        v85 = v69;
        v39 = v33;
        v86 = v39;
        v40 = a6;
        v92 = a6;
        v87 = v77;
        v88 = v12;
        v75 = v38;
        v89 = v75;
        v41 = v19;
        v90 = v41;
        v66 = v80;
        v91 = v66;
        objc_msgSend(v39, "performTransactionBlock:", v83);
        v31 = (id)objc_claimAutoreleasedReturnValue();

        v24 = v78;
        if (v31)
        {
          brc_bread_crumbs();
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v96 = v39;
            v97 = 2112;
            v98 = (uint64_t)v31;
            v99 = 2112;
            v100 = v72;
            _os_log_error_impl(&dword_230455000, v42, (os_log_type_t)0x90u, "[ERROR] Fail to performTransactionBlock for package [%@] with error [%@]%@", buf, 0x20u);
          }

          v40 = a6;
        }
        objc_msgSend(v39, "close");
        v73 = v41;
        v43 = -[BRCPackageManifestWriter done](v41, "done");
        v28 = v80;
        if (v43)
        {
          -[BRCLazyPackage closeAndReturn](v75, "closeAndReturn");
          v44 = objc_claimAutoreleasedReturnValue();
          if (v44)
            objc_msgSend(v78, "setObject:forKeyedSubscript:", v44, CFSTR("pkgXattrs"));
          v74 = (void *)v44;
          objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithFileURL:boundaryKey:", v66, v81);
          v45 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v39, CFSTR("pkgContent"));
          v67 = (void *)v45;
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v45, CFSTR("pkgManifest"));
          objc_msgSend(v63, "session");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = 0;
          v26 = objc_msgSend(v78, "validateEnhancedDrivePrivacyFieldsWithSession:error:", v46, &v82);
          obj = v82;
          v64 = v82;

          if (a6 && (v26 & 1) == 0)
            objc_storeStrong(a6, obj);

          v48 = v70;
          v47 = v74;
        }
        else
        {
          brc_bread_crumbs();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, (os_log_type_t)0x90u))
          {
            objc_msgSend(v66, "path");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[BRCPackageManifestWriter error](v73, "error");
            v60 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v96 = v68;
            v97 = 2112;
            v98 = v60;
            v61 = (void *)v60;
            v99 = 2112;
            v100 = v65;
            _os_log_error_impl(&dword_230455000, v55, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", buf, 0x20u);

            v40 = a6;
          }

          if (!v40)
          {
            v26 = 0;
            v48 = v70;
            goto LABEL_36;
          }
          -[BRCPackageManifestWriter error](v73, "error");
          v56 = objc_claimAutoreleasedReturnValue();
          v26 = 0;
          v47 = *v40;
          *v40 = (id)v56;
          v48 = v70;
        }

LABEL_36:
        v51 = v69;
        goto LABEL_37;
      }
      v76 = v23;
      brc_bread_crumbs();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v23, "path");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v96 = v33;
        v97 = 2112;
        v98 = (uint64_t)v54;
        v99 = 2112;
        v100 = v71;
        v101 = 2112;
        v102 = v52;
        _os_log_impl(&dword_230455000, v53, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to anchor package %@ at %@: %@%@", buf, 0x2Au);

      }
      v24 = v78;
      v48 = v33;
      if (!a6)
      {
        v26 = 0;
        v31 = v71;
        v28 = v80;
        goto LABEL_38;
      }
      v31 = v71;
      v26 = 0;
      v51 = *a6;
      *a6 = v31;
      v28 = v80;
    }
    else
    {
      v76 = (void *)v14;
      brc_bread_crumbs();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
        -[BRCFSUploader _updatePackageRecord:item:stageID:error:].cold.1();

      v24 = v78;
      if (!a6)
      {
        v26 = 0;
        v28 = v80;
        v48 = 0;
        v23 = v76;
        goto LABEL_38;
      }
      v31 = v31;
      v26 = 0;
      v51 = *a6;
      *a6 = v31;
      v28 = v80;
      v48 = 0;
    }
    v23 = v76;
LABEL_37:

LABEL_38:
    v27 = v77;
    goto LABEL_39;
  }
  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v14;
  if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
  {
    objc_msgSend(v80, "path");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCPackageManifestWriter error](v19, "error");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v96 = v58;
    v97 = 2112;
    v98 = (uint64_t)v59;
    v99 = 2112;
    v100 = v21;
    _os_log_error_impl(&dword_230455000, v22, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", buf, 0x20u);

  }
  v24 = v78;
  if (a6)
  {
    -[BRCPackageManifestWriter error](v19, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = *a6;
    *a6 = v25;
    v28 = v80;
LABEL_39:

    goto LABEL_40;
  }
  v26 = 0;
  v28 = v80;
LABEL_40:

  return v26;
}

id __57__BRCFSUploader__updatePackageRecord_item_stageID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void **v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id *v46;
  void *v48;
  void *v49;
  uint64_t v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  +[BRCPackageItem packageItemsForItem:order:](BRCPackageItem, "packageItemsForItem:order:", *(_QWORD *)(a1 + 32), 1);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  if (v53)
  {
    v2 = 0;
    v52 = *(_QWORD *)v60;
    while (2)
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v60 != v52)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v3);
        v5 = (void *)MEMORY[0x2348B9F14]();
        if (objc_msgSend(v4, "isFile"))
        {
          v55 = v2;
          brc_bread_crumbs();
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            v32 = objc_msgSend(*(id *)(a1 + 32), "dbRowID");
            v33 = objc_msgSend(*(id *)(a1 + 40), "longValue");
            v34 = objc_msgSend(v4, "fileID");
            *(_DWORD *)buf = 134218754;
            v64 = v32;
            v65 = 2048;
            v66 = v33;
            v67 = 2048;
            v68 = v34;
            v69 = 2112;
            v70 = v6;
            _os_log_debug_impl(&dword_230455000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%lld]: adding package item with deviceID 0x%lx fileID %lu%@", buf, 0x2Au);
          }

          v8 = objc_alloc(MEMORY[0x24BDB91A0]);
          v9 = *(_QWORD *)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "fileID"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "generationID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "fsGenerationID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v8, "initWithDeviceID:fileID:generationID:", v9, v10, v12);

          objc_msgSend(v13, "setPackageIndex:", v55);
          objc_msgSend(v4, "pathInPackage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lastPathComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "br_pathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setItemTypeHint:", v16);

          if ((objc_msgSend(*(id *)(a1 + 48), "addItem:", v13) & 1) == 0)
          {
            brc_bread_crumbs();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
              __57__BRCFSUploader__updatePackageRecord_item_stageID_error___block_invoke_cold_1();

            objc_msgSend(MEMORY[0x24BDB9120], "errorWithCode:format:", 1000, CFSTR("Failed to add item to package"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "CKClientSuitableError");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            v46 = *(id **)(a1 + 96);
            if (v46)
              objc_storeStrong(v46, v37);
            goto LABEL_38;
          }
          v2 = v55 + 1;
        }
        else
        {
          v13 = 0;
        }
        objc_msgSend(*(id *)(a1 + 56), "updateWithPkgItem:", v4);
        objc_msgSend(*(id *)(a1 + 56), "setSignature:", 0);
        objc_msgSend(v4, "xattrSignature");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v54 = v5;
          v18 = *(void **)(a1 + 64);
          objc_msgSend(v4, "xattrSignature");
          v19 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "urlForXattrSignature:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v58 = 0;
          LOBYTE(v19) = objc_msgSend(v20, "checkResourceIsReachableAndReturnError:", &v58);
          v21 = v58;
          if ((v19 & 1) != 0)
          {
            v56 = v2;
            v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91A0]), "initWithFileURL:", v20);
            v23 = objc_msgSend(*(id *)(a1 + 72), "itemCount");
            objc_msgSend(v13, "setPackageIndex:", v23);
            brc_bread_crumbs();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              v50 = objc_msgSend(*(id *)(a1 + 32), "dbRowID");
              objc_msgSend(v4, "pathInPackage");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              v64 = v50;
              v65 = 2112;
              v66 = (uint64_t)v20;
              v67 = 2112;
              v68 = (uint64_t)v35;
              v69 = 2112;
              v70 = v24;
              _os_log_debug_impl(&dword_230455000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%lld]: adding xattr package item with URL %@ for %@%@", buf, 0x2Au);

            }
            v26 = *(void **)(a1 + 72);
            v57 = v21;
            v27 = objc_msgSend(v26, "addItem:error:", v22, &v57);
            v28 = v57;

            if ((v27 & 1) != 0)
            {
              objc_msgSend(*(id *)(a1 + 56), "setXattrIndex:", v23);
              v21 = v28;
              v2 = v56;
            }
            else
            {
              brc_bread_crumbs();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v31 = objc_claimAutoreleasedReturnValue();
              v2 = v56;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v64 = (uint64_t)v28;
                v65 = 2112;
                v66 = (uint64_t)v30;
                _os_log_impl(&dword_230455000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to add xattrs to xattrs package: %@%@", buf, 0x16u);
              }

              v21 = v28;
            }
          }
          else
          {
            brc_bread_crumbs();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v4, "xattrSignature");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v64 = (uint64_t)v36;
              v65 = 2112;
              v66 = (uint64_t)v21;
              v67 = 2112;
              v68 = (uint64_t)v22;
              _os_log_fault_impl(&dword_230455000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We're missing a package xattr for signature %@ - %@%@", buf, 0x20u);

            }
          }

          v5 = v54;
        }
        if ((objc_msgSend(*(id *)(a1 + 80), "addItem:", *(_QWORD *)(a1 + 56)) & 1) == 0)
        {
          brc_bread_crumbs();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
          {
            objc_msgSend(*(id *)(a1 + 88), "path");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 80), "error");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v64 = (uint64_t)v48;
            v65 = 2112;
            v66 = (uint64_t)v49;
            v67 = 2112;
            v68 = (uint64_t)v38;
            _os_log_error_impl(&dword_230455000, v39, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", buf, 0x20u);

          }
          if (*(_QWORD *)(a1 + 96))
          {
            objc_msgSend(*(id *)(a1 + 80), "error");
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = *(void ***)(a1 + 96);
            v42 = *v41;
            *v41 = (void *)v40;

          }
          objc_msgSend(*(id *)(a1 + 80), "error");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

          objc_autoreleasePoolPop(v5);
          goto LABEL_39;
        }
        objc_msgSend(*(id *)(a1 + 56), "clear");

        objc_autoreleasePoolPop(v5);
        ++v3;
      }
      while (v53 != v3);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      if (v53)
        continue;
      break;
    }
  }
  v37 = 0;
LABEL_39:

  return v37;
}

- (void)_updateRecordInDB:(id)a3 item:(id)a4 syncContext:(id)a5 transferSize:(unint64_t)a6 stageID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v25 = objc_msgSend(v13, "dbRowID");
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v16;
    _os_log_debug_impl(&dword_230455000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%lld]: assets only record generated: %@%@", buf, 0x20u);
  }

  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __73__BRCFSUploader__updateRecordInDB_item_syncContext_transferSize_stageID___block_invoke;
  v22[3] = &unk_24FE3FEF0;
  v23 = v14;
  v19 = v14;
  v20 = (void *)MEMORY[0x2348BA0DC](v22);
  objc_msgSend(v19, "contextIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "execute:", CFSTR("UPDATE client_uploads SET  transfer_queue = call_block(%@, next_retry_stamp, %@), transfer_record = %@, transfer_operation = NULL, transfer_stage = %@, transfer_size = %lld WHERE throttle_id = %lld"), v20, v21, v12, v15, a6, objc_msgSend(v13, "dbRowID"));

}

void __73__BRCFSUploader__updateRecordInDB_item_syncContext_transferSize_stageID___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "uploadStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signalWithDeadline:", sqlite3_value_int64(*a4));

  sqlite3_result_value(a2, a4[1]);
}

- (void)_updateRecord:(id)a3 item:(id)a4 syncContext:(id)a5 targetThumbnailURL:(id)a6 stageID:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  __CFString **v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  char v58;
  void *v59;
  NSObject *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  void *v77;
  id v78;
  id v79;
  id obj;
  id v81;
  id location;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v12, "currentVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v16, "size");
  location = 0;
  objc_msgSend(v11, "getAndUpdateBoundaryKeyForItem:", v12);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isFinderBookmark"))
    v17 = objc_msgSend(v12, "shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:", 0);
  else
    v17 = 0;
  if (objc_msgSend(v12, "isDocumentBeingCopiedToNewZone")
    && (objc_msgSend(v12, "currentVersion"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "contentSignature"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "brc_signatureIsValid"),
        v19,
        v18,
        v20))
  {
    -[BRCFSUploader _updateRecordInDB:item:syncContext:transferSize:stageID:](self, "_updateRecordInDB:item:syncContext:transferSize:stageID:", v11, v12, v13, v75, v15);
  }
  else
  {
    objc_msgSend(v12, "fileIDForUpload");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v73 = v13;
      v74 = v14;
      if (objc_msgSend(v16, "isPackage"))
      {
        if (objc_msgSend(v12, "isFinderBookmark"))
        {
          brc_bread_crumbs();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
            -[BRCFSUploader _updateRecord:item:syncContext:targetThumbnailURL:stageID:].cold.4();

        }
        v22 = -[BRCFSUploader _updatePackageRecord:item:stageID:error:](self, "_updatePackageRecord:item:stageID:error:", v11, v12, v15, &location);
      }
      else
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          -[BRCAccountSessionFPFS volume](self->super.super._session, "volume");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (void *)(int)objc_msgSend(v71, "deviceID");
          objc_msgSend(v12, "fileIDForUpload");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "itemID");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v84 = v65;
          v85 = 2112;
          v86 = v66;
          v87 = 2112;
          v88 = v67;
          v89 = 2112;
          v90 = v25;
          _os_log_debug_impl(&dword_230455000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] Adding CKAsset with deviceID 0x%lx fileID %@ to the record for item %@%@", buf, 0x2Au);

        }
        objc_msgSend(v12, "fileIDForUpload");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v16;
        if (v17)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "brc_generateSaltingKey");
          v28 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v28 = (uint64_t)v77;
        }
        v29 = (void *)MEMORY[0x24BDB9010];
        v30 = (void *)MEMORY[0x24BDD16E0];
        -[BRCAccountSessionFPFS volume](self->super.super._session, "volume");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "numberWithInt:", objc_msgSend(v31, "deviceID"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "generationIDForUpload");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "fsGenerationID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)v28;
        objc_msgSend(v29, "br_assetWithDeviceID:fileID:generationID:boundaryKey:", v32, v27, v34, v28);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = objc_msgSend(v12, "isFinderBookmark");
        v37 = kBRRecordKeyFinderBookmarkContent;
        if (!v36)
          v37 = kBRRecordKeyFileContent;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v35, *v37);
        objc_msgSend(v12, "st");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "logicalName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "br_pathExtension");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setItemTypeHint:", v40);

        v22 = 1;
        v16 = v72;
      }
      if (v74 && objc_msgSend(v12, "shouldTransferThumbnail"))
      {
        v81 = 0;
        v41 = *MEMORY[0x24BDBCC48];
        obj = 0;
        v42 = objc_msgSend(v74, "getResourceValue:forKey:error:", &v81, v41, &obj);
        v43 = v81;
        objc_storeStrong(&location, obj);
        if ((v42 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithFileURL:boundaryKey:", v74, v77);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v44, CFSTR("thumb1024"));
          brc_bread_crumbs();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            -[BRCFSUploader _updateRecord:item:syncContext:targetThumbnailURL:stageID:].cold.3();

          v75 += objc_msgSend(v43, "unsignedLongLongValue");
        }
        else
        {
          brc_bread_crumbs();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, (os_log_type_t)0x90u))
          {
            objc_msgSend(v74, "path");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v84 = v68;
            v85 = 2112;
            v86 = location;
            v87 = 2112;
            v88 = v44;
            _os_log_error_impl(&dword_230455000, v47, (os_log_type_t)0x90u, "[ERROR] Unable to get thumbnail size at '%@' to upload stage: %@%@", buf, 0x20u);

          }
        }

      }
      objc_msgSend(v16, "xattrSignature");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
        v49 = v22;
      else
        v49 = 0;
      if (v49)
      {
        objc_msgSend(v12, "session");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "stageRegistry");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "urlForXattrSignature:", v48);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v79 = location;
        LODWORD(v50) = objc_msgSend(v52, "checkResourceIsReachableAndReturnError:", &v79);
        objc_storeStrong(&location, v79);
        if ((_DWORD)v50)
        {
          objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithFileURL:boundaryKey:", v52, v77);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v53, CFSTR("xattr"));
          if (v77)
            v54 = v48;
          else
            v54 = 0;
          objc_msgSend(v11, "encryptedValues");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v54, CFSTR("xattrSignature"));

          v75 += objc_msgSend(v53, "size");
        }
        else
        {
          brc_bread_crumbs();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
            -[BRCFSUploader _updateRecord:item:syncContext:targetThumbnailURL:stageID:].cold.2();

        }
      }
      if (v22
        && (objc_msgSend(v12, "session"),
            v57 = (void *)objc_claimAutoreleasedReturnValue(),
            v78 = location,
            v58 = objc_msgSend(v11, "validateEnhancedDrivePrivacyFieldsWithSession:error:", v57, &v78),
            objc_storeStrong(&location, v78),
            v57,
            (v58 & 1) != 0))
      {
        v13 = v73;
        -[BRCFSUploader _updateRecordInDB:item:syncContext:transferSize:stageID:](self, "_updateRecordInDB:item:syncContext:transferSize:stageID:", v11, v12, v73, v75, v15);
      }
      else
      {
        brc_bread_crumbs();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "itemID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v84 = v64;
          v85 = 2112;
          v86 = location;
          v87 = 2112;
          v88 = v59;
          _os_log_debug_impl(&dword_230455000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] Creation of record for %@ failed: %@%@", buf, 0x20u);

        }
        -[BRCAccountSessionFPFS stageRegistry](self->super.super._session, "stageRegistry");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "cleanupStagedUploadWithID:", v15);

        -[BRCFSUploader setState:forItem:](self, "setState:forItem:", 33, v12);
        -[BRCFSUploader _reportUploadErrorForDocument:error:](self, "_reportUploadErrorForDocument:error:", v12, location);
        -[BRCFSUploader _handleFileModifiedError:forItem:](self, "_handleFileModifiedError:forItem:", location, v12);
        v62 = location;
        objc_msgSend(v12, "currentVersion");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setUploadError:", v62);

        objc_msgSend(v12, "saveToDB");
        v13 = v73;
      }
      v14 = v74;

    }
    else
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BRCFSUploader _updateRecord:item:syncContext:targetThumbnailURL:stageID:].cold.1();

      objc_msgSend(v12, "markNeedsReading");
      objc_msgSend(v12, "saveToDB");
    }
  }

}

- (void)_updateRecord:(id)a3 jobID:(id)a4 syncContext:(id)a5 targetThumbnailURL:(id)a6 stageID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22[3];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[BRCFSUploader _documentItemForJobID:stageID:](self, "_documentItemForJobID:stageID:", v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    memset(v22, 0, sizeof(v22));
    __brc_create_section(0, (uint64_t)"-[BRCFSUploader _updateRecord:jobID:syncContext:targetThumbnailURL:stageID:]", 1096, v22);
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = v22[0];
      objc_msgSend(v17, "itemID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v24 = v21;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v20;
      v29 = 2112;
      v30 = v18;
      _os_log_debug_impl(&dword_230455000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: Done generating thumbnail, building record for %@%@", buf, 0x2Au);

    }
    -[BRCFSUploader _updateRecord:item:syncContext:targetThumbnailURL:stageID:](self, "_updateRecord:item:syncContext:targetThumbnailURL:stageID:", v12, v17, v14, v15, v16);
    __brc_leave_section(v22);
  }

}

- (void)_computeRecordForJobID:(id)a3 item:(id)a4 syncContext:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  char *v34;
  int v35;
  int v36;
  const char *v37;
  const char *v38;
  void *v39;
  void *v40;
  id v41;
  char *v42;
  _QWORD v43[5];
  id v44;
  char *v45;
  id v46;
  id v47;
  uint64_t v48[3];
  _QWORD v49[2];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v42 = (char *)a3;
  v8 = a4;
  v41 = a5;
  memset(v48, 0, sizeof(v48));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader _computeRecordForJobID:item:syncContext:]", 1109, v48);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v33 = v48[0];
    objc_msgSend(v8, "itemID");
    v34 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v51 = v33;
    v52 = 2112;
    v53 = v42;
    v54 = 2112;
    v55 = v34;
    v56 = 2112;
    v57 = v9;
    _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: Preparing record for upload of %@%@", buf, 0x2Au);

  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("upload-%@-%@"), v42, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "currentVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ckInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "baseRecordClearAllFields:", v16 != 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "shouldTransferThumbnail"))
  {
    v18 = objc_alloc(MEMORY[0x24BDD1880]);
    v49[0] = 0;
    v49[1] = 0;
    v40 = (void *)objc_msgSend(v18, "initWithUUIDBytes:", v49);
    v19 = (void *)MEMORY[0x24BDD17C8];
    -[BRCAccountSessionFPFS volume](self->super.super._session, "volume");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "deviceID");
    objc_msgSend(v8, "fileIDForUpload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "br_pathWithDeviceID:fileID:", v21, objc_msgSend(v22, "unsignedLongLongValue"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v39);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCFSUploader _updateJobID:setStageID:operationID:](self, "_updateJobID:setStageID:operationID:", v42, v14, v40);
    -[BRCAccountSessionFPFS stageRegistry](self->super.super._session, "stageRegistry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "createURLForThumbnailUploadWithStageID:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __57__BRCFSUploader__computeRecordForJobID_item_syncContext___block_invoke;
    v43[3] = &unk_24FE46D08;
    v43[4] = self;
    v44 = v17;
    v26 = v42;
    v45 = v26;
    v27 = v41;
    v46 = v27;
    v47 = v14;
    v28 = (void *)MEMORY[0x2348BA0DC](v43);
    -[BRCFSUploader thumbnailGenerationManager](self, "thumbnailGenerationManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v26, "itemDBRowID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addThumbnailGenerationJobAtURL:targetURL:thumbnailID:syncContext:completionHandler:", v23, v25, v30, v27, v28);

  }
  else
  {
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v35 = objc_msgSend(v8, "isInDocumentScope");
      v36 = objc_msgSend(v8, "shouldHaveThumbnail");
      v37 = "no";
      *(_DWORD *)buf = 138413058;
      v51 = (uint64_t)v42;
      if (v35)
        v38 = "yes";
      else
        v38 = "no";
      v52 = 2080;
      v53 = v38;
      if (v36)
        v37 = "yes";
      v54 = 2080;
      v55 = v37;
      v56 = 2112;
      v57 = v31;
      _os_log_debug_impl(&dword_230455000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: skipping thumbnail (inDocumentScope:%s shouldHaveThumbnail:%s shouldTransferThumbnail:no)%@", buf, 0x2Au);
    }

    -[BRCFSUploader _updateRecord:item:syncContext:targetThumbnailURL:stageID:](self, "_updateRecord:item:syncContext:targetThumbnailURL:stageID:", v17, v8, v41, 0, v14);
  }

  __brc_leave_section(v48);
}

void __57__BRCFSUploader__computeRecordForJobID_item_syncContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 112);
  v7 = *(void **)(v4 + 24);
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = __57__BRCFSUploader__computeRecordForJobID_item_syncContext___block_invoke_2;
  v9[3] = &unk_24FE46CC0;
  v9[1] = 3221225472;
  v9[4] = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = v3;
  v14 = *(id *)(a1 + 64);
  v8 = v3;
  brc_task_tracker_async_with_logs(v6, v7, v9, &__block_literal_global_46);

}

void __57__BRCFSUploader__computeRecordForJobID_item_syncContext___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2348B9F14]();
  objc_msgSend(*(id *)(a1 + 32), "_updateRecord:jobID:syncContext:targetThumbnailURL:stageID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  objc_autoreleasePoolPop(v2);
}

- (id)_duplicatePackage:(id)a3 stageID:(id)a4 stageName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDB9198], "br_packageWithPackage:error:", a3, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    brc_bread_crumbs();
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (a6)
        v17 = (const __CFString *)*a6;
      else
        v17 = CFSTR("unknown");
      v24 = 138412802;
      v25 = 0;
      v26 = 2112;
      v27 = (uint64_t)v17;
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_230455000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] can't duplicate the package %@: %@%@", (uint8_t *)&v24, 0x20u);
    }

    goto LABEL_16;
  }
  -[BRCAccountSessionFPFS stageRegistry](self->super.super._session, "stageRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createURLForUploadWithStageID:name:", v10, v11);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "anchorAtURL:error:", v14, a6) & 1) == 0)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[__CFString path](v14, "path");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (a6)
        v22 = (const __CFString *)*a6;
      else
        v22 = CFSTR("unknown");
      v24 = 138413058;
      v25 = v12;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v22;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_230455000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] can't anchor the package %@ at %@: %@%@", (uint8_t *)&v24, 0x2Au);

    }
    objc_msgSend(v12, "close");
    objc_msgSend(v12, "removeDB");
LABEL_16:
    v15 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v12, "close");
  v15 = v12;
LABEL_17:

  return v15;
}

- (BOOL)_finishPackageUploadWithRecord:(id)a3 item:(id)a4 stageID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BRFieldPkgItem *v13;
  void *v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  BRCPackageChecksummer *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  BRCPackageChecksummer *v22;
  uint64_t v23;
  uint64_t v24;
  BRCPackageChecksummer *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  char *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  BOOL v35;
  BRCPackageChecksummer *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v44;
  const char *v45;
  __int128 v46;
  BRCFSUploader *v47;
  id v48;
  void *v49;
  void *v50;
  id *v51;
  id v52;
  id obj;
  BRCPackageChecksummer *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint8_t v60[128];
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  BRCPackageChecksummer *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(BRFieldPkgItem);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pkgContent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  LOBYTE(a5) = objc_msgSend(v14, "openWithError:", &v59);
  v15 = v59;
  v16 = v15;
  if ((a5 & 1) == 0)
  {
    v18 = (BRCPackageChecksummer *)v15;
    if (v18)
    {
      v32 = v16;
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
      {
        v44 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v62 = "-[BRCFSUploader _finishPackageUploadWithRecord:item:stageID:error:]";
        v63 = 2080;
        if (!a6)
          v44 = "(ignored by caller)";
        v64 = v44;
        v65 = 2112;
        v66 = v18;
        v67 = 2112;
        v68 = v33;
        _os_log_error_impl(&dword_230455000, v34, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      v16 = v32;
    }
    if (a6)
    {
      v18 = objc_retainAutorelease(v18);
      v35 = 0;
      *a6 = v18;
    }
    else
    {
      v35 = 0;
    }
    goto LABEL_41;
  }
  v52 = v12;
  v17 = +[BRCPackageItem updateSignaturesForFilesInItem:fromCKPackage:error:](BRCPackageItem, "updateSignaturesForFilesInItem:fromCKPackage:error:", v11, v14, a6);
  objc_msgSend(v14, "close");
  if (v17)
  {
    v47 = self;
    v50 = v16;
    v51 = a6;
    v49 = v10;
    v18 = objc_alloc_init(BRCPackageChecksummer);
    +[BRCPackageItem packageItemsForItem:order:](BRCPackageItem, "packageItemsForItem:order:", v11, 2);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v19)
    {
      v21 = v19;
      v22 = 0;
      v23 = *(_QWORD *)v56;
      *(_QWORD *)&v20 = 138412290;
      v46 = v20;
      v48 = v11;
      while (2)
      {
        v24 = 0;
        v25 = v22;
        do
        {
          if (*(_QWORD *)v56 != v23)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v24);
          v27 = (void *)MEMORY[0x2348B9F14]();
          -[BRFieldPkgItem updateWithPkgItem:](v13, "updateWithPkgItem:", v26);
          if (-[BRFieldPkgItem type](v13, "type") == 2 && !-[BRFieldPkgItem hasSignature](v13, "hasSignature"))
          {
            brc_bread_crumbs();
            v29 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v46;
              v62 = v29;
              _os_log_fault_impl(&dword_230455000, v30, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: pbitem.type != BRFieldPkgItemType_FILE || pbitem.hasSignature%@", buf, 0xCu);
            }

          }
          v54 = v25;
          v28 = -[BRCPackageChecksummer addItem:error:](v18, "addItem:error:", v13, &v54, v46);
          v22 = v54;

          if (!v28)
          {
            objc_autoreleasePoolPop(v27);

            -[BRCPackageChecksummer done](v18, "done");
            v36 = v22;
            v11 = v48;
            v10 = v49;
            v12 = v52;
            if (v36)
            {
              brc_bread_crumbs();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, (os_log_type_t)0x90u))
              {
                v45 = "(passed to caller)";
                *(_DWORD *)buf = 136315906;
                v62 = "-[BRCFSUploader _finishPackageUploadWithRecord:item:stageID:error:]";
                v63 = 2080;
                if (!v51)
                  v45 = "(ignored by caller)";
                v64 = v45;
                v65 = 2112;
                v66 = v36;
                v67 = 2112;
                v68 = v37;
                _os_log_error_impl(&dword_230455000, v38, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
              }

            }
            if (v51)
            {
              v36 = objc_retainAutorelease(v36);
              v35 = 0;
              *v51 = v36;
            }
            else
            {
              v35 = 0;
            }
            v22 = v36;
            goto LABEL_37;
          }
          -[BRFieldPkgItem clear](v13, "clear");
          objc_autoreleasePoolPop(v27);
          ++v24;
          v25 = v22;
        }
        while (v21 != v24);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        v21 = v31;
        v11 = v48;
        if (v31)
          continue;
        break;
      }
    }
    else
    {
      v22 = 0;
    }

    -[BRCPackageChecksummer done](v18, "done");
    -[BRCPackageChecksummer signature](v18, "signature");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v49;
    objc_msgSend(v49, "setObject:forKeyedSubscript:", v39, CFSTR("pkgSignature"));

    v12 = v52;
    -[BRCFSUploader _duplicatePackage:stageID:stageName:error:](v47, "_duplicatePackage:stageID:stageName:error:", v14, v52, CFSTR("ckpackage"), v51);
    v40 = objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v49, "setObject:forKeyedSubscript:", v40, CFSTR("pkgContent"));
      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("pkgXattrs"));
      v41 = objc_claimAutoreleasedReturnValue();
      if (!v41)
      {
        v35 = 1;
        goto LABEL_40;
      }
      v42 = (void *)v41;
      -[BRCFSUploader _duplicatePackage:stageID:stageName:error:](v47, "_duplicatePackage:stageID:stageName:error:", v41, v52, CFSTR("ckpackage-xattrs"), v51);
      v36 = (BRCPackageChecksummer *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v49, "setObject:forKeyedSubscript:", v36, CFSTR("pkgXattrs"));
        v35 = 1;
        v14 = (void *)v40;
LABEL_37:

        v40 = (uint64_t)v14;
        goto LABEL_40;
      }
    }
    v35 = 0;
LABEL_40:

    v14 = (void *)v40;
    v16 = v50;
LABEL_41:

    goto LABEL_42;
  }
  v35 = 0;
LABEL_42:

  return v35;
}

- (void)_handleFileModifiedError:(id)a3 forItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BRCFSUploader _handleFileModifiedError:forItem:].cold.1();

  objc_msgSend(v6, "asDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "reIngestFromFileProvider");
}

- (BOOL)_shouldReingestAfterUploadErrorWithItem:(id)a3 record:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  BOOL v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v40;
  BRCFSUploader *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = 8;
  -[BRCAccountSessionFPFS volume](self->super.super._session, "volume");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInt:", objc_msgSend(v10, "deviceID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v7, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  v44 = v7;
  if (v13)
  {
    v14 = v13;
    v45 = *(_QWORD *)v51;
    v42 = v12;
    v43 = v6;
    v40 = 8;
    v41 = self;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v51 != v45)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v16, v40, v41);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v17, "deviceID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = v18;
            v20 = objc_msgSend(v18, "br_isEqualToNumber:", v11);

            if ((v20 & 1) == 0)
            {
LABEL_27:
              brc_bread_crumbs();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v55 = v16;
                v56 = 2112;
                v57 = v6;
                v58 = 2112;
                v59 = v36;
                _os_log_impl(&dword_230455000, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] CKAsset of key %@ for %@ is pointing to the wrong device ID%@", buf, 0x20u);
              }

              goto LABEL_35;
            }
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            objc_msgSend(v17, "itemEnumerator");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v47;
              while (2)
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v47 != v24)
                    objc_enumerationMutation(v21);
                  objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "deviceID");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = v26;
                  if (v26 && (objc_msgSend(v26, "br_isEqualToNumber:", v11) & 1) == 0)
                  {

                    v12 = v42;
                    v6 = v43;
                    goto LABEL_27;
                  }

                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
                if (v23)
                  continue;
                break;
              }
            }

            v6 = v43;
            v7 = v44;
            v12 = v42;
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      v9 = v40;
      self = v41;
      if (v14)
        continue;
      break;
    }
  }

  *(_DWORD *)buf = 0;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v9), "stageRegistry");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileIDForUpload");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "existsInUploadOrLiveItemsStage:generationID:", objc_msgSend(v29, "longLongValue"), buf);

  if ((v30 & 1) != 0)
  {
    v31 = *(_DWORD *)buf;
    objc_msgSend(v6, "generationIDForUpload");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "fsGenerationID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "unsignedIntValue");

    if (v31 == v34)
    {
      v35 = 0;
      goto LABEL_36;
    }
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[BRCFSUploader _shouldReingestAfterUploadErrorWithItem:record:].cold.1();
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[BRCFSUploader _shouldReingestAfterUploadErrorWithItem:record:].cold.2();
  }

LABEL_35:
  v35 = 1;
LABEL_36:

  return v35;
}

- (BOOL)_retryUploadForError:(id)a3 jobID:(id)a4 recomputeRecord:(BOOL)a5 syncContext:(id)a6
{
  id v10;
  BRCAccountSessionFPFS *session;
  id v12;
  id v13;
  void *v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  _QWORD v22[4];
  id v23;

  v10 = a6;
  session = self->super.super._session;
  v12 = a4;
  v13 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v15 = CFSTR("_prepare");
  }
  else
  {
    objc_msgSend(v10, "contextIdentifier");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __72__BRCFSUploader__retryUploadForError_jobID_recomputeRecord_syncContext___block_invoke;
  v22[3] = &unk_24FE3FEF0;
  v23 = v10;
  v16 = v10;
  v17 = (void *)MEMORY[0x2348BA0DC](v22);
  objc_msgSend(v13, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "matchingJobsWhereSQLClause");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v14, "execute:", CFSTR("UPDATE client_uploads SET transfer_queue = %@, transfer_operation = call_block(%@, next_retry_stamp), upload_error = %@ WHERE %@"), v15, v17, v18, v19);
  if (!a5)

  return v20;
}

void __72__BRCFSUploader__retryUploadForError_jobID_recomputeRecord_syncContext___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  sqlite3_int64 v6;
  void *v7;

  v6 = sqlite3_value_int64(*a4);
  objc_msgSend(*(id *)(a1 + 32), "uploadStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signalWithDeadline:", v6);

  sqlite3_result_null(a2);
}

- (void)_finishedUploadingItem:(id)a3 record:(id)a4 jobID:(id)a5 stageID:(id)a6 syncContext:(id)a7 hasPerformedServerSideAssetCopy:(BOOL)a8 error:(id)a9
{
  id v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  BOOL v23;
  BOOL v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  int v40;
  void *v41;
  NSObject *v42;
  void *v43;
  char v44;
  void *v45;
  NSObject *v46;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81[3];
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  id v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  const __CFString *v89;
  __int16 v90;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v75 = a4;
  v16 = a5;
  v73 = a6;
  v74 = a7;
  v17 = (__CFString *)a9;
  objc_msgSend(v15, "clientZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v81, 0, sizeof(v81));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:]", 1343, v81);
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v36 = v81[0];
    objc_msgSend(v15, "digestDescription");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    v39 = CFSTR("success");
    *(_DWORD *)buf = 134219010;
    if (v17)
      v39 = v17;
    v83 = v36;
    v84 = 2112;
    v85 = v16;
    v86 = 2112;
    v87 = v37;
    v88 = 2112;
    v89 = v39;
    v90 = 2112;
    v91 = v19;
    _os_log_debug_impl(&dword_230455000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: done with %@ (%@)%@", buf, 0x34u);

  }
  -[__CFString brc_logUnderlineErrorsChain](v17, "brc_logUnderlineErrorsChain");
  if ((objc_msgSend(v18, "handleZoneLevelErrorIfNeeded:forItemCreation:", v17, 1) & 1) == 0)
  {
    if (!v17)
    {
      objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("pkgContent"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = !v22 || a8;

      if (v23)
        goto LABEL_89;
      v80 = 0;
      v24 = -[BRCFSUploader _finishPackageUploadWithRecord:item:stageID:error:](self, "_finishPackageUploadWithRecord:item:stageID:error:", v75, v15, v73, &v80);
      v25 = (__CFString *)v80;
      v17 = v25;
      if (!v24)
      {
        if (!v25)
        {
          brc_bread_crumbs();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
            -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.9();

        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 512, 0);
        v26 = objc_claimAutoreleasedReturnValue();

        v17 = (__CFString *)v26;
      }
      if (!v17)
      {
LABEL_89:
        if (objc_msgSend(v15, "isReadAndUploaded"))
        {
          brc_bread_crumbs();
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
            -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.1();

        }
        objc_msgSend(v15, "markUploadedWithRecord:", v75);
        -[BRCFSUploader _clearUploadErrorForDocument:](self, "_clearUploadErrorForDocument:", v15);
        v21 = 0;
        goto LABEL_63;
      }
    }
    if ((-[__CFString brc_isCloudKitMMCSErrorChunksCouldNotBeRegisteredError](v17, "brc_isCloudKitMMCSErrorChunksCouldNotBeRegisteredError") & 1) != 0&& !-[BRCFSUploader _shouldReingestAfterUploadErrorWithItem:record:](self, "_shouldReingestAfterUploadErrorWithItem:record:", v15, v75))
    {
      v27 = (void *)MEMORY[0x24BDD17C8];
      -[BRCAccountSessionFPFS volume](self->super.super._session, "volume");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "deviceID");
      objc_msgSend(v15, "fileIDForUpload");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "br_pathWithDeviceID:fileID:", v29, objc_msgSend(v30, "unsignedLongLongValue"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v72);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17B8]), "initWithURL:readonly:", v71, 1);
      v79 = 0;
      +[BRCDocumentSignatureCalculator calculateSignatureForURL:boundaryKey:error:](BRCDocumentSignatureCalculator, "calculateSignatureForURL:boundaryKey:error:", v31, 0, &v79);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v79;
      if (objc_msgSend(v32, "br_isPOSIXErrorCode:", 2))
      {
        brc_bread_crumbs();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.8();

        objc_msgSend(MEMORY[0x24BDD1540], "brc_errorDamagedDocumentOnDisk");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[BRCAccountSessionFPFS analyticsReporter](self->super.super._session, "analyticsReporter");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "aggregateReportForAppTelemetryIdentifier:error:", 215, v21);

      }
      else
      {
        v21 = v17;
      }

    }
    else
    {
      v21 = v17;
    }
    v40 = objc_msgSend(v21, "brc_isCloudKitUnknownItemError");
    if (v40)
    {
      brc_bread_crumbs();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.3();

      objc_msgSend(v15, "handleUnknownItemError");
      goto LABEL_31;
    }
    if ((objc_msgSend(v21, "brc_isCloudKitErrorRequiringAssetRecheck") & 1) != 0
      || (objc_msgSend(v21, "brc_isCloudKitErrorRequiringAssetRescan") & 1) != 0
      || objc_msgSend(v21, "br_isCKErrorCode:", 12))
    {
      if (-[BRCFSUploader _shouldReingestAfterUploadErrorWithItem:record:](self, "_shouldReingestAfterUploadErrorWithItem:record:", v15, v75))
      {
        -[BRCFSUploader _handleFileModifiedError:forItem:](self, "_handleFileModifiedError:forItem:", v21, v15);
        objc_msgSend(v74, "uploadFileModifiedThrottle");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
      brc_bread_crumbs();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.5();

      if (objc_msgSend(v21, "brc_isCloudKitErrorDataProtectionClass") && self->_isScreenLocked)
      {
        brc_bread_crumbs();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.4();
LABEL_70:

LABEL_31:
        v43 = 0;
LABEL_37:
        v44 = v40 ^ 1;
        goto LABEL_38;
      }
      v58 = 1;
    }
    else
    {
      if (objc_msgSend(v21, "brc_isCloudKitErrorNoNetwork"))
      {
        brc_bread_crumbs();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.6();
        goto LABEL_70;
      }
      if ((objc_msgSend(v21, "brc_isCloudKitCancellationError") & 1) == 0
        && (objc_msgSend(v21, "brc_isCloudKitErrorRequiringAssetReupload") & 1) == 0
        && !objc_msgSend(v21, "brc_isRetriable"))
      {
        brc_bread_crumbs();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, (os_log_type_t)0x90u))
        {
          objc_msgSend(v15, "st");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "displayName");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v83 = (uint64_t)v65;
          v84 = 2112;
          v85 = v21;
          v86 = 2112;
          v87 = (uint64_t)v56;
          _os_log_error_impl(&dword_230455000, v57, (os_log_type_t)0x90u, "[ERROR] non recoverable error while uploading %@: %@%@", buf, 0x20u);

        }
        goto LABEL_70;
      }
      brc_bread_crumbs();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.7();

      v58 = 0;
    }
    -[BRCFSUploader _retryUploadForError:jobID:recomputeRecord:syncContext:](self, "_retryUploadForError:jobID:recomputeRecord:syncContext:", v21, v16, v58, v74);
    v44 = 0;
    v43 = 0;
LABEL_38:
    brc_bread_crumbs();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.2();

    v47 = v43;
    if (!v43)
    {
      objc_msgSend(v74, "uploadThrottle");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v48 = -[BRCFSSchedulerBase postponeJobID:withThrottle:](self, "postponeJobID:withThrottle:", v16, v47);
    if (!v43)

    if ((v44 & 1) == 0)
    {
      objc_msgSend(v15, "appLibrary");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "mangledID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v48 > objc_msgSend(v52, "uploadRetryCountForFailure");

      if (v53)
        -[BRCFSUploader _reportUploadErrorForDocument:error:](self, "_reportUploadErrorForDocument:error:", v15, v21);
      goto LABEL_65;
    }
    if ((objc_msgSend(v21, "brc_isCloudKitOutOfQuota") & 1) != 0)
    {
      v49 = 32;
    }
    else if ((objc_msgSend(v21, "brc_isCloudKitErrorDataProtectionClass") & 1) != 0)
    {
      v49 = 35;
    }
    else
    {
      if (!objc_msgSend(v21, "brc_isCloudKitErrorNoNetwork"))
      {
        -[BRCFSUploader setState:forItem:uploadError:](self, "setState:forItem:uploadError:", 33, v15, v21);
        if ((objc_msgSend(v21, "brc_isCloudKitErrorRequiringAssetRescan") & 1) == 0)
          -[BRCFSUploader _reportUploadErrorForDocument:error:](self, "_reportUploadErrorForDocument:error:", v15, v21);
        goto LABEL_62;
      }
      v49 = 36;
    }
    -[BRCFSUploader setState:forItem:uploadError:](self, "setState:forItem:uploadError:", v49, v15, v21);
LABEL_62:

LABEL_63:
    objc_msgSend(v15, "currentVersion");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setUploadError:", v21);

    objc_msgSend(v15, "saveToDB");
    if (!v21)
      goto LABEL_66;
    -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "serialQueue");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x24BDAC760];
    v76[1] = 3221225472;
    v76[2] = __111__BRCFSUploader__finishedUploadingItem_record_jobID_stageID_syncContext_hasPerformedServerSideAssetCopy_error___block_invoke;
    v76[3] = &unk_24FE3FA40;
    v77 = v18;
    v78 = v16;
    dispatch_async_with_logs_9(v61, v76);

    objc_msgSend(v15, "recoverDamagedDocumentIfNecessaryWithError:", v21);
    v43 = v77;
LABEL_65:

    goto LABEL_66;
  }
  v21 = v17;
LABEL_66:
  __brc_leave_section(v81);

}

void __111__BRCFSUploader__finishedUploadingItem_record_jobID_stageID_syncContext_hasPerformedServerSideAssetCopy_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "itemByRowID:", objc_msgSend(*(id *)(a1 + 40), "itemDBRowID"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "triggerNotificationIfNeeded");

}

- (void)_performServerSideAssetCopyForItem:(id)a3 transferSize:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  BRCAccountSessionFPFS *session;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  BRCItemDBRowIDJobIdentifier *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  BRCItemDBRowIDJobIdentifier *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void (**v32)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  BRCItemDBRowIDJobIdentifier *v44;
  id v45;
  void *v46;
  BRCFetchRecordsWrapperOperation *v47;
  void *v48;
  BRCFetchRecordsWrapperOperation *v49;
  void *v50;
  void *v51;
  void *v52;
  BRCItemDBRowIDJobIdentifier *v53;
  void *v54;
  void *v55;
  void (**v56)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  BRCItemDBRowIDJobIdentifier *v61;
  void *v62;
  BRCFSUploader *v63;
  _QWORD v64[5];
  BRCItemDBRowIDJobIdentifier *v65;
  id v66;
  id v67;
  id v68;
  void (**v69)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v70;
  _QWORD v71[4];
  BRCItemDBRowIDJobIdentifier *v72;
  id v73;
  BRCFSUploader *v74;
  id v75;
  id v76;
  id v77;
  _QWORD v78[2];
  _QWORD v79[3];

  v79[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "currentVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previousItemGlobalID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = objc_msgSend(v5, "dbRowID");
  v63 = self;
  session = self->super.super._session;
  objc_msgSend(v7, "zoneRowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS serverZoneByRowID:](session, "serverZoneByRowID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = v7;
  objc_msgSend(v7, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentsRecordIDInZoneID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "baseRecord");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "supportsEnhancedDrivePrivacy");

  v17 = 0;
  if (v16)
  {
    objc_msgSend(v10, "clientZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "db");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentBoundaryKeyForItemID:withDB:", v11, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", objc_msgSend(v5, "dbRowID"));
  objc_msgSend(v10, "clientZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v11;
  v23 = v21;
  v24 = v22;
  objc_msgSend(v21, "serverItemByItemID:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = MEMORY[0x24BDAC760];
  v71[0] = MEMORY[0x24BDAC760];
  v71[1] = 3221225472;
  v71[2] = __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke;
  v71[3] = &unk_24FE46D58;
  v27 = v20;
  v72 = v27;
  v28 = v10;
  v73 = v28;
  v74 = v63;
  v29 = v13;
  v75 = v29;
  v30 = v14;
  v76 = v30;
  v31 = v17;
  v77 = v31;
  v32 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2348BA0DC](v71);
  if (v25)
    v33 = v25;
  else
    v33 = v5;
  if ((objc_msgSend(v33, "isPackage") & 1) != 0)
  {
    v56 = v32;
    v57 = v31;
    v58 = v30;
    v59 = v25;
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[BRCFSUploader _performServerSideAssetCopyForItem:transferSize:].cold.1();
    v36 = v28;

    v37 = objc_alloc(MEMORY[0x24BDB90E8]);
    v38 = v29;
    v79[0] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v37, "initWithRecordIDs:", v39);

    objc_msgSend(v40, "setShouldFetchAssetContent:", 0);
    v78[0] = CFSTR("pkgManifest");
    v78[1] = CFSTR("pkgXattrs");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setDesiredKeys:", v41);

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "requestCKCacheAssetClone");

    if (v43)
      objc_msgSend(v40, "setShouldCloneFileInAssetCache:", 1);
    v64[0] = v26;
    v64[1] = 3221225472;
    v64[2] = __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_148;
    v64[3] = &unk_24FE46DA8;
    v64[4] = v63;
    v70 = v60;
    v44 = v27;
    v65 = v44;
    v55 = v38;
    v66 = v38;
    v45 = v36;
    v67 = v45;
    v61 = v27;
    v46 = v24;
    v68 = v24;
    v32 = v56;
    v69 = v56;
    v54 = v40;
    objc_msgSend(v40, "setFetchRecordsCompletionBlock:", v64);
    v47 = [BRCFetchRecordsWrapperOperation alloc];
    objc_msgSend(MEMORY[0x24BDB9190], "br_operationGroupWithName:", CFSTR("FetchRecordsWrapper"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[BRCFetchRecordsWrapperOperation initWithCKFetchRecordsOperation:group:serverZone:isUserWaiting:sessionContext:](v47, "initWithCKFetchRecordsOperation:group:serverZone:isUserWaiting:sessionContext:", v40, v48, v45, 0, v63->super.super._session);

    objc_msgSend(v5, "syncContextUsedForTransfers");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "uploadThrottle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation operationID](v49, "operationID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v36;
    -[BRCFSUploader _willAttemptJobID:throttle:operationID:](v63, "_willAttemptJobID:throttle:operationID:", v44, v51, v52);

    v53 = v61;
    -[_BRCOperation schedule](v49, "schedule");

    v29 = v55;
    v30 = v58;
    v25 = v59;
    v31 = v57;
  }
  else
  {
    ((void (**)(_QWORD, id, void *, _QWORD, _QWORD))v32)[2](v32, v5, v25, 0, 0);
    v53 = v27;
    v46 = v24;
  }

}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v9, "db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2;
  v18[3] = &unk_24FE46D30;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v21 = v10;
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(void **)(a1 + 56);
  v22 = v9;
  v23 = v13;
  v24 = v14;
  v25 = *(id *)(a1 + 64);
  v26 = *(id *)(a1 + 72);
  v27 = v11;
  v28 = a5;
  v15 = v11;
  v16 = v9;
  v17 = v10;
  objc_msgSend(v12, "groupInBatch:", v18);

}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  char v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_12(a1);

  if (objc_msgSend(*(id *)(a1 + 40), "isSharedZone"))
    v4 = 3;
  else
    v4 = 2;
  objc_msgSend(*(id *)(a1 + 48), "latestVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "currentVersion");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "isPackage");
  objc_msgSend(v8, "contentSignature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "brc_signatureIsValid") & 1) == 0)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_11(a1);

    v24 = *(void **)(a1 + 56);
    v23 = *(void **)(a1 + 64);
    v25 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v24, "syncContextUsedForTransfers");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB8EA8], 17, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:", v24, 0, v25, 0, v26, 1, v27);
LABEL_22:

    goto LABEL_64;
  }
  if ((v9 & 1) == 0)
  {
    brc_bread_crumbs();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_10();

    v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB9018]), "initWithExistingRecordID:databaseScope:fieldName:fileSignature:", *(_QWORD *)(a1 + 72), v4, CFSTR("fileContent"), v10);
    if (!v26)
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_9();

    }
    objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithAssetReferece:boundaryKey:", v26, *(_QWORD *)(a1 + 88));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v32, CFSTR("fileContent"));

    objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", CFSTR("fileContent"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
LABEL_42:

      if (objc_msgSend(v8, "hasThumbnail"))
      {
        objc_msgSend(v8, "thumbnailSignature");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "brc_signatureIsValid");

        if ((v52 & 1) != 0)
        {
          v53 = objc_alloc(MEMORY[0x24BDB9018]);
          v54 = *(_QWORD *)(a1 + 72);
          objc_msgSend(v8, "thumbnailSignature");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)objc_msgSend(v53, "initWithExistingRecordID:databaseScope:fieldName:fileSignature:", v54, v4, CFSTR("thumb1024"), v55);

          objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithAssetReferece:boundaryKey:", v56, *(_QWORD *)(a1 + 88));
          v57 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v57, CFSTR("thumb1024"));
        }
        else
        {
          brc_bread_crumbs();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
            __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_4(a1);
        }

      }
      objc_msgSend(v8, "xattrSignature");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v60)
        goto LABEL_63;
      objc_msgSend(v8, "xattrSignature");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "brc_signatureIsValid");

      if ((v62 & 1) != 0)
      {
        v63 = objc_alloc(MEMORY[0x24BDB9018]);
        v64 = *(_QWORD *)(a1 + 72);
        objc_msgSend(v8, "xattrSignature");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)objc_msgSend(v63, "initWithExistingRecordID:databaseScope:fieldName:fileSignature:", v64, v4, CFSTR("xattr"), v65);

        objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithAssetReferece:boundaryKey:", v66, *(_QWORD *)(a1 + 88));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v67, CFSTR("xattr"));

        v68 = *(_QWORD *)(a1 + 88);
        if (v68)
        {
          objc_msgSend(v8, "xattrSignature");
          v69 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v69 = 0;
        }
        objc_msgSend(*(id *)(a1 + 80), "encryptedValues");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v69, CFSTR("xattrSignature"));

        if (!v68)
          goto LABEL_62;
      }
      else
      {
        brc_bread_crumbs();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
          __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_3(a1);
      }

LABEL_62:
LABEL_63:
      objc_msgSend(*(id *)(a1 + 80), "serializeContentBoundaryKey:", *(_QWORD *)(a1 + 88));
      v77 = *(void **)(a1 + 56);
      v76 = *(void **)(a1 + 64);
      v78 = *(_QWORD *)(a1 + 80);
      v79 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v77, "syncContextUsedForTransfers");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:", v77, v78, v79, 0, v26, 1, 0);
      goto LABEL_64;
    }
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_8();

    v37 = *(void **)(a1 + 56);
    v36 = *(void **)(a1 + 64);
    v38 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v37, "syncContextUsedForTransfers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorCantCreateAsset");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:", v37, 0, v38, 0, v27, 1, v39);

    goto LABEL_22;
  }
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_7(a1, (uint64_t)v11, v12);

  if (*(_BYTE *)(a1 + 104))
  {
    v13 = *(_QWORD *)(a1 + 72);
    v14 = *(_QWORD *)(a1 + 88);
    v81 = 0;
    objc_msgSend(MEMORY[0x24BDB9198], "br_clonedPackageWithRecordID:databaseScope:fieldName:boundaryKey:error:", v13, v4, CFSTR("pkgXattrs"), v14, &v81);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v81;
    objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v15, CFSTR("pkgXattrs"));

    objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", CFSTR("pkgXattrs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17 || (v18 = 0, v16))
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_6();

      v18 = v16;
    }
  }
  else
  {
    v18 = 0;
  }
  v40 = *(_QWORD *)(a1 + 72);
  v41 = *(_QWORD *)(a1 + 88);
  v80 = v18;
  objc_msgSend(MEMORY[0x24BDB9198], "br_clonedPackageWithRecordID:databaseScope:fieldName:boundaryKey:error:", v40, v4, CFSTR("pkgContent"), v41, &v80);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v80;

  objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v42, CFSTR("pkgContent"));
  objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", CFSTR("pkgContent"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43 || v26)
  {
    brc_bread_crumbs();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_5();

  }
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9018]), "initWithExistingRecordID:databaseScope:fieldName:fileSignature:", *(_QWORD *)(a1 + 72), v4, CFSTR("pkgManifest"), *(_QWORD *)(a1 + 96));
  if (v46)
  {
    objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithAssetReferece:boundaryKey:", v46, *(_QWORD *)(a1 + 88));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v47, CFSTR("pkgManifest"));

    objc_msgSend(*(id *)(a1 + 80), "objectForKeyedSubscript:", CFSTR("pkgManifest"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(*(id *)(a1 + 56), "currentVersion");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "contentSignature");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 80), "setObject:forKeyedSubscript:", v50, CFSTR("pkgSignature"));

      goto LABEL_42;
    }
    brc_bread_crumbs();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_2();
  }
  else
  {
    brc_bread_crumbs();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_1();
  }

  v71 = *(void **)(a1 + 56);
  v70 = *(void **)(a1 + 64);
  v72 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v71, "syncContextUsedForTransfers");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "brc_errorCantCreateAsset");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:", v71, 0, v72, 0, v73, 1, v74);

LABEL_64:
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_148(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientTruthWorkloop");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_149;
  block[3] = &unk_24FE46D80;
  v19 = *(_QWORD *)(a1 + 80);
  v8 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v8;
  v14 = v5;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 72);
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_149(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "itemByRowID:", *(_QWORD *)(a1 + 96));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "syncContextUsedForTransfers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:", v3, 0, v5, 0, v6, 1, *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pkgManifest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v3 == 0;
    else
      v9 = 1;
    if (v9)
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v27 = v7;
        v28 = 2112;
        v29 = v3;
        v30 = 2112;
        v31 = v10;
        _os_log_fault_impl(&dword_230455000, v11, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No error but also no asset or item with record %@ item %@%@", buf, 0x20u);
      }

      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "syncContextUsedForTransfers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorItemChanged");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:", v3, 0, v13, 0, v16, 1, v14);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 72), "clientZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "serverItemByItemID:", *(_QWORD *)(a1 + 80));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 64), "recordName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "signature");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pkgXattrs"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithInt:", v25 != 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v27 = v24;
        v28 = 2112;
        v29 = v23;
        v30 = 2112;
        v31 = v22;
        v32 = 2112;
        v33 = v17;
        _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Record [%@] pkgManifest signature [%@] hasXattrs [%@]%@", buf, 0x2Au);

      }
      v19 = *(_QWORD *)(a1 + 88);
      objc_msgSend(v8, "signature");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pkgXattrs"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *, BOOL))(v19 + 16))(v19, v3, v16, v14, v20 != 0);

    }
  }

}

- (void)_transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BRCUploadBatchOperation *v13;
  id *p_isa;
  uint64_t v15;
  BRCItemDBRowIDJobIdentifier *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BRCUploadBatchOperation *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  BRCUploadBatchOperation *v34;
  unint64_t v35;
  BRCUploadBatchOperation *v36;
  BRCUploadBatchOperation *v37;
  id v38;
  void *v39;
  BRCUploadBatchOperation *v40;
  void *v41;
  id v42;
  void *v43;
  BOOL v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  BRCFSUploader *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *context;
  void *v73;
  _QWORD v74[4];
  id v75;
  id *v76;
  id v77;
  id v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assertOnQueue");
  v70 = brc_current_date_nsec();
  v66 = self;
  if (-[BRCFSSchedulerBase isCancelled](self, "isCancelled"))
    goto LABEL_43;
  v63 = a5;
  v64 = v8;
  objc_msgSend(v8, "contextIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v9;
  v11 = (void *)objc_msgSend(v9, "fetch:", CFSTR("  SELECT throttle_id, zone_rowid, transfer_size, transfer_record, next_retry_stamp, transfer_stage     FROM client_uploads    WHERE throttle_state = 1      AND transfer_queue = %@      AND transfer_operation IS NULL ORDER BY upload_priority DESC, upload_request_stamp DESC, transfer_size ASC"), v10);

  v12 = 0;
  v13 = 0;
  v69 = 0x7FFFFFFFFFFFFFFFLL;
  p_isa = (id *)&v66->super.super.super.isa;
  while (objc_msgSend(v11, "next") && -[BRCTransferBatchOperation itemsCount](v13, "itemsCount") < a4)
  {
    v15 = MEMORY[0x2348B9F14]();
    v16 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", objc_msgSend(v11, "longLongAtIndex:", 0));
    objc_msgSend(v11, "numberAtIndex:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v11, "unsignedIntegerAtIndex:", 2);
    objc_msgSend(v11, "unarchivedObjectOfClass:atIndex:", objc_opt_class(), 3);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v11, "longLongAtIndex:", 4);
    objc_msgSend(v11, "stringAtIndex:", 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)v15;
    if (v19 > v70)
    {
      v21 = v13;
      v22 = v69;
      if (v69 >= v19)
        v22 = v19;
      v69 = v22;
      -[BRCItemDBRowIDJobIdentifier matchingJobsWhereSQLClause](v16, "matchingJobsWhereSQLClause");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "execute:", CFSTR("UPDATE client_uploads    SET transfer_queue = '_retry'  WHERE %@"), v23);
      v24 = 2;
      goto LABEL_32;
    }
    v67 = v18;
    objc_msgSend(p_isa[1], "serverZoneByRowID:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[1], "itemByRowID:", -[BRCItemDBRowIDJobIdentifier itemDBRowID](v16, "itemDBRowID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "isDocument") & 1) == 0)
    {
      v29 = v12;
      v21 = v13;
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v80 = (uint64_t)v25;
        v81 = 2112;
        v82 = v30;
        _os_log_fault_impl(&dword_230455000, v31, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ should be a document%@", buf, 0x16u);
      }

      v24 = 2;
      v12 = v29;
      p_isa = (id *)&v66->super.super.super.isa;
      goto LABEL_31;
    }
    v65 = v12;
    if (objc_msgSend(v25, "syncUpState") != 3)
    {
      v21 = v13;
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v80 = (uint64_t)v25;
        v81 = 2112;
        v82 = v32;
        _os_log_fault_impl(&dword_230455000, v33, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ should be needs-upload%@", buf, 0x16u);
      }

      objc_msgSend(p_isa, "cancelAndCleanupItemUpload:", v25);
      v24 = 2;
      goto LABEL_21;
    }
    if (!objc_msgSend(v25, "isDocumentBeingCopiedToNewZone"))
      goto LABEL_23;
    objc_msgSend(v25, "currentVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contentSignature");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v62, "brc_signatureIsValid") & 1) == 0)
    {

LABEL_23:
      if (!v13)
      {
        v37 = [BRCUploadBatchOperation alloc];
        v38 = p_isa[1];
        objc_msgSend(v23, "clientZone");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[BRCUploadBatchOperation initWithSyncContext:sessionContext:clientZone:](v37, "initWithSyncContext:sessionContext:clientZone:", v64, v38, v39);

        -[_BRCOperation operationID](v40, "operationID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v74[0] = MEMORY[0x24BDAC760];
        v74[1] = 3221225472;
        v74[2] = __98__BRCFSUploader__transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority___block_invoke;
        v74[3] = &unk_24FE46DF8;
        v75 = v68;
        v76 = p_isa;
        v42 = v41;
        v36 = v40;
        v12 = v42;
        v77 = v42;
        v78 = v64;
        -[BRCUploadBatchOperation setPerUploadCompletionBlock:](v36, "setPerUploadCompletionBlock:", v74);

        goto LABEL_30;
      }
      v34 = v13;
      v35 = -[BRCTransferBatchOperation itemsCount](v13, "itemsCount");
      if (v35 < objc_msgSend(p_isa, "_minBatchSize"))
      {
        v36 = v34;
LABEL_29:
        v12 = v65;
LABEL_30:
        v21 = v36;
        -[BRCUploadBatchOperation addItem:stageID:record:transferSize:](v36, "addItem:stageID:record:transferSize:", v25, v20, v73, v67);
        objc_msgSend(v64, "uploadThrottle");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(p_isa, "_willAttemptJobID:throttle:operationID:", v16, v43, v12);

        objc_msgSend(v25, "triggerNotificationIfNeeded");
        v24 = 0;
        goto LABEL_31;
      }
      v36 = v34;
      if (-[BRCTransferBatchOperation totalSize](v34, "totalSize") + v67 <= v63)
        goto LABEL_29;
      v21 = v34;
      v24 = 3;
LABEL_21:
      v12 = v65;
      goto LABEL_31;
    }
    v61 = v26;
    v21 = v13;
    v27 = p_isa[1];
    objc_msgSend(v25, "currentVersion");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "previousItemGlobalID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "zoneRowID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "serverZoneByRowID:", v57);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "clientZone");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v54, "enhancedDrivePrivacyEnabled");
    objc_msgSend(v25, "clientZone");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v28, "enhancedDrivePrivacyEnabled");

    v13 = v21;
    if (v58 != v56)
      goto LABEL_23;
    objc_msgSend(p_isa, "_performServerSideAssetCopyForItem:transferSize:", v25, v67);
    v24 = 2;
LABEL_31:

LABEL_32:
    objc_autoreleasePoolPop(context);
    v44 = v24 == 3;
    v13 = v21;
    if (v44)
      break;
  }
  if (v69 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(p_isa[10], "signalWithDeadline:");
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDB9190], "br_upload");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v13, "setGroup:", v45);

    brc_bread_crumbs();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = -[BRCTransferBatchOperation itemsCount](v13, "itemsCount");
      objc_msgSend(v64, "contextIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v80 = v48;
      v81 = 2112;
      v82 = v49;
      v83 = 2112;
      v84 = v46;
      _os_log_impl(&dword_230455000, v47, OS_LOG_TYPE_DEFAULT, "[NOTICE] uploading %ld documents in %@%@", buf, 0x20u);

    }
    objc_msgSend(v64, "uploadStream");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addBatchOperation:", v13);

  }
  v8 = v64;
  objc_msgSend(v64, "contextIdentifier");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v68, "numberWithSQL:", CFSTR("SELECT MIN(next_retry_stamp) FROM client_uploads   WHERE throttle_state = 1     AND transfer_queue = %@      AND transfer_operation IS NULL "), v51);

  if (v52)
  {
    objc_msgSend(v64, "uploadStream");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "signalWithDeadline:", objc_msgSend(v52, "longLongValue"));

  }
  v9 = v68;
LABEL_43:

}

void __98__BRCFSUploader__transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __98__BRCFSUploader__transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority___block_invoke_2;
  v11[3] = &unk_24FE46DD0;
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v16 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "groupInBatch:", v11);

}

void __98__BRCFSUploader__transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority___block_invoke_2(uint64_t a1)
{
  void *v2;
  BRCItemDBRowIDJobIdentifier *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  BRCItemDBRowIDJobIdentifier *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "transferID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", objc_msgSend(v2, "unsignedLongLongValue"));

  objc_msgSend(*(id *)(a1 + 40), "_documentItemForJobID:operationID:", v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "record");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:", v4, v6, v3, v7, *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));

  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 48), "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v12 = v3;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v8;
      _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: throttle for %@ doesn't exist anymore%@", buf, 0x20u);

    }
  }

}

- (void)transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;

  v12 = a3;
  v13 = a7;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "serialQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __113__BRCFSUploader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke;
  v18[3] = &unk_24FE42A38;
  v18[4] = self;
  v19 = v12;
  v22 = a5;
  v23 = a6;
  v20 = v13;
  v21 = a4;
  v16 = v13;
  v17 = v12;
  dispatch_async_with_logs_9(v15, v18);

}

uint64_t __113__BRCFSUploader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_transferStreamOfSyncContext:didBecomeReadyWithMaxRecordsCount:sizeHint:priority:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)finishedSyncingUpItem:(id)a3 withOutOfQuotaError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17[3];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "dbRowID");
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader finishedSyncingUpItem:withOutOfQuotaError:]", 1836, v17);
  brc_bread_crumbs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = v17[0];
    objc_msgSend(v6, "digestDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v19 = v13;
    v20 = 2048;
    v21 = v8;
    v22 = 2112;
    v23 = v14;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v9;
    _os_log_debug_impl(&dword_230455000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%lld]: %@ failed to sync up because it's out of quota: %@%@", buf, 0x34u);

  }
  objc_msgSend(v6, "markOverQuotaWithError:", v7);
  objc_msgSend(v6, "saveToDB");
  -[BRCFSUploader setState:forItem:](self, "setState:forItem:", 32, v6);
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "changes") == 1;

  if (!v12)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCFSUploader finishedSyncingUpItem:withOutOfQuotaError:].cold.1();

  }
  __brc_leave_section(v17);

}

- (BOOL)hasItemsOverQuotaForOwner:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__35;
  v18 = __Block_byref_object_dispose__35;
  v19 = 0;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__BRCFSUploader_hasItemsOverQuotaForOwner___block_invoke;
  v10[3] = &unk_24FE416D8;
  v13 = &v14;
  v6 = v5;
  v11 = v6;
  v7 = v4;
  v12 = v7;
  objc_msgSend(v6, "disableProfilingForQueriesInBlock:", v10);
  v8 = objc_msgSend((id)v15[5], "BOOLValue");

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __43__BRCFSUploader_hasItemsOverQuotaForOwner___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "numberWithSQL:", CFSTR("SELECT 1 FROM client_uploads  WHERE throttle_state = 32    AND zone_rowid IN (SELECT rowid FROM client_zones WHERE zone_owner = %@ AND zone_plist IS NOT NULL)  LIMIT 1"), *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasItemsOverQuotaInZone:(id)a3
{
  BRCAccountSessionFPFS *session;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  session = self->super.super._session;
  v4 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dbRowID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "numberWithSQL:", CFSTR("SELECT 1 FROM client_uploads WHERE throttle_state = 32 AND zone_rowid = %@ LIMIT 1"), v6);
  LOBYTE(v5) = objc_msgSend(v7, "BOOLValue");

  return (char)v5;
}

- (id)quotaAvailableForOwner:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDB8E88]))
  {
    -[BRCAccountSessionFPFS clientState](self->super.super._session, "clientState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("availableQuota"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_rescheduleJobsOutOfQuotaForDefaultOwnerWithAvailableSize:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  BRCAccountSessionFPFS *v7;
  void *v8;
  void *v9;
  char i;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader _rescheduleJobsOutOfQuotaForDefaultOwnerWithAvailableSize:]", 1885, v18);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v16 = v18[0];
    +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", a3, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v20 = v16;
    v21 = 2112;
    v22 = v17;
    v23 = 2112;
    v24 = v5;
    _os_log_debug_impl(&dword_230455000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx re-uploading failed items with size less than %@%@", buf, 0x20u);

  }
  v7 = self->super.super._session;
  -[BRCAccountSessionFPFS enumerateClientZones:](v7, "enumerateClientZones:", &__block_literal_global_170);
  -[BRCAccountSessionFPFS clientDB](v7, "clientDB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "fetch:", CFSTR("SELECT throttle_id, transfer_size   FROM client_uploads  WHERE throttle_state = 32    AND transfer_size < %lld"), a3);
  for (i = 0; ; i = 1)
  {
    v11 = objc_msgSend(v9, "next");
    v12 = a3 > 0 ? v11 : 0;
    if (v12 != 1)
      break;
    v13 = (void *)MEMORY[0x2348B9F14](v11);
    v14 = objc_msgSend(v9, "longLongAtIndex:", 0);
    v15 = objc_msgSend(v9, "longLongAtIndex:", 1);
    objc_msgSend(v8, "execute:", CFSTR("UPDATE client_items SET version_upload_error = NULL WHERE rowid = %lld"), v14);
    objc_msgSend(v8, "execute:", CFSTR("UPDATE client_uploads SET throttle_state = 1, upload_error = NULL WHERE throttle_id = %lld"), v14);
    a3 -= v15;
    objc_autoreleasePoolPop(v13);
  }
  objc_msgSend(v9, "close");
  if ((i & 1) != 0)
    -[BRCFSSchedulerBase signal](self, "signal");
  -[BRCFSUploader setIsDefaultOwnerOutOfQuota:](self, "setIsDefaultOwnerOutOfQuota:", -[BRCFSUploader hasItemsOverQuotaForOwner:](self, "hasItemsOverQuotaForOwner:", *MEMORY[0x24BDB8E88]));

  __brc_leave_section(v18);
}

uint64_t __75__BRCFSUploader__rescheduleJobsOutOfQuotaForDefaultOwnerWithAvailableSize___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "didClearOutOfQuota");
  return 1;
}

- (void)setQuotaAvailableForDefaultOwner:(unint64_t)a3
{
  BRCAccountSessionFPFS **p_session;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  p_session = &self->super.super._session;
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertOnQueue");

  -[BRCFSUploader quotaAvailableForOwner:](self, "quotaAvailableForOwner:", *MEMORY[0x24BDB8E88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSessionFPFS clientState](*p_session, "clientState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("lastQuotaFetchDate"));

  if (v8 != a3)
  {
    memset(v18, 0, sizeof(v18));
    __brc_create_section(0, (uint64_t)"-[BRCFSUploader setQuotaAvailableForDefaultOwner:]", 1938, v18);
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v15 = v18[0];
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", v8, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", a3, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v11;
      _os_log_debug_impl(&dword_230455000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx quota changed from %@ to %@%@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAccountSessionFPFS clientState](self->super.super._session, "clientState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("availableQuota"));

    if (v8 < a3)
      -[BRCFSUploader _rescheduleJobsOutOfQuotaForDefaultOwnerWithAvailableSize:](self, "_rescheduleJobsOutOfQuotaForDefaultOwnerWithAvailableSize:", a3);
    __brc_leave_section(v18);
  }
}

- (void)_globalQuotaStateUpdateForDefaultOwner
{
  void *v3;

  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertOnQueue");

  if (-[BRCFSUploader isDefaultOwnerOutOfQuota](self, "isDefaultOwnerOutOfQuota"))
    -[BRCFSUploader setIsDefaultOwnerOutOfQuota:](self, "setIsDefaultOwnerOutOfQuota:", -[BRCFSUploader hasItemsOverQuotaForOwner:](self, "hasItemsOverQuotaForOwner:", *MEMORY[0x24BDB8E88]));
}

- (void)_scheduleQuotaFetchForDefaultOwner
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = objc_alloc_init(MEMORY[0x24BDB9110]);
  objc_msgSend(MEMORY[0x24BDB9190], "br_quotaUpdateUploader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroup:", v4);

  br_pacer_suspend();
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCallbackQueue:", v6);

  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke;
  v13[3] = &unk_24FE46E40;
  v13[4] = self;
  objc_msgSend(v3, "setFetchUserQuotaCompletionBlock:", v13);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_182;
  v12[3] = &unk_24FE3FA18;
  v12[4] = self;
  objc_msgSend(v3, "setCompletionBlock:", v12);
  dispatch_get_global_queue(17, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_2;
  v10[3] = &unk_24FE3FA40;
  v10[4] = self;
  v11 = v3;
  v9 = v3;
  dispatch_async_with_logs_9(v8, v10);

}

void __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_cold_1((uint64_t)v6, a2, v7);

  if (v5)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_230455000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] can't update quota: %@%@", (uint8_t *)&v10, 0x16u);
    }

    br_pacer_signal();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setQuotaAvailableForDefaultOwner:", a2);
  }

}

uint64_t __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_182()
{
  return br_pacer_resume();
}

void __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "syncContextProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultSyncContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addOperation:", *(_QWORD *)(a1 + 40));

}

- (void)setIsDefaultOwnerOutOfQuota:(BOOL)a3
{
  -[BRCFSUploader setIsDefaultOwnerOutOfQuota:forceSignalContainers:](self, "setIsDefaultOwnerOutOfQuota:forceSignalContainers:", a3, 0);
}

- (void)setIsDefaultOwnerOutOfQuota:(BOOL)a3 forceSignalContainers:(BOOL)a4
{
  id v4;

  if (self->_isDefaultOwnerOutOfQuota != a3)
  {
    self->_isDefaultOwnerOutOfQuota = a3;
    if (a3)
    {
      br_pacer_signal();
      return;
    }
    goto LABEL_7;
  }
  if (a4 && !a3)
  {
LABEL_7:
    -[BRCAccountSessionFPFS globalProgress](self->super.super._session, "globalProgress");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearOutOfQuotaState");

  }
}

- (void)ownerDidReceiveOutOfQuotaError:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDB8E88]))
    -[BRCFSUploader setIsDefaultOwnerOutOfQuota:](self, "setIsDefaultOwnerOutOfQuota:", 1);
}

- (void)scheduleQuotaStateUpdateForOwner:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDB8E88]))
  {
    if (-[BRCFSUploader isDefaultOwnerOutOfQuota](self, "isDefaultOwnerOutOfQuota"))
      br_pacer_signal();
  }
}

- (void)scheduleQuotaFetchIfNeededForOwner:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDB8E88]))
  {
    if (-[BRCFSUploader isDefaultOwnerOutOfQuota](self, "isDefaultOwnerOutOfQuota"))
      br_pacer_signal();
  }
}

- (void)forceScheduleQuotaFetchForOwner:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDB8E88]))
    br_pacer_signal();
}

- (void)_reportUploadErrorForDocument:(id)a3 error:(id)a4
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
  objc_msgSend(v7, "execute:", CFSTR("INSERT OR REPLACE INTO item_errors (item_rowid, error_domain, error_code, error_message, service) VALUES (%llu, %@, %ld, %@, %d)"), v8, v9, v10, v11, 1);

  +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "captureLogsForOperationType:ofSubtype:forError:", CFSTR("SyncHealth"), CFSTR("Upload"), v13);

}

- (void)_clearUploadErrorForDocument:(id)a3
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

  objc_msgSend(v6, "execute:", CFSTR("DELETE FROM item_errors WHERE item_rowid = %llu AND service = %d"), v5, 1);
}

- (unint64_t)recoverAndReportMissingJobs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  id v24;
  void *v25;
  void *v27;
  int v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "fetch:", CFSTR("SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_processing_stamp, ci.item_bouncedname, ci.item_scope, ci.item_local_change_count, ci.item_old_version_identifier, ci.fp_creation_item_identifier, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.version_local_change_count, ci.version_old_version_identifier, ci.item_live_conflict_loser_etags, ci.item_file_id, ci.item_generation FROM client_items AS ci WHERE ci.item_localsyncupstate = 3 AND ci.item_localsyncupstate != 0 AND NOT EXISTS (SELECT 1 FROM client_uploads AS up WHERE ci.rowid = up.throttle_id AND up.throttle_state != 0)"));

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __44__BRCFSUploader_recoverAndReportMissingJobs__block_invoke;
  v29[3] = &unk_24FE40010;
  v29[4] = self;
  v27 = v4;
  objc_msgSend(v4, "enumerateObjects:", v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v6)
  {
    v7 = v6;
    LODWORD(v8) = 0;
    v9 = *(_QWORD *)v31;
    do
    {
      v28 = v8;
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x2348B9F14]();
        if (objc_msgSend(v11, "isDocument"))
        {
          objc_msgSend(v11, "asDocument");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCFSUploader uploadItem:](self, "uploadItem:", v13);

        }
        else
        {
          brc_bread_crumbs();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            v35 = v11;
            v36 = 2112;
            v37 = v14;
            _os_log_fault_impl(&dword_230455000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item scheduled to upload isn't a document %@%@", buf, 0x16u);
          }

          objc_msgSend(v11, "markNeedsUploadOrSyncingUp");
          objc_msgSend(v11, "saveToDB");
        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = (v28 + v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "execute:", CFSTR("UPDATE client_uploads SET throttle_state = 1 WHERE throttle_state = 31 AND transfer_operation IS NULL  AND throttle_id NOT IN (SELECT throttle_id FROM client_sync_up WHERE throttle_state != 0)"));

  -[BRCAccountSessionFPFS clientDB](self->super.super._session, "clientDB");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "changes");

  if (v18)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[BRCFSUploader recoverAndReportMissingJobs].cold.2();

  }
  if ((int)v8 >= 1)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[BRCFSUploader recoverAndReportMissingJobs].cold.1();

  }
  v23 = v18 + (int)v8;
  if (v23)
    -[BRCFSUploader schedule](self, "schedule");
  if ((int)v8 >= 1)
  {
    v24 = +[AppTelemetryTimeSeriesEvent newMissingUploaderJobEventWithNumberMissing:](AppTelemetryTimeSeriesEvent, "newMissingUploaderJobEventWithNumberMissing:", v8);
    -[BRCAccountSessionFPFS analyticsReporter](self->super.super._session, "analyticsReporter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v24);

  }
  return v23;
}

id __44__BRCFSUploader_recoverAndReportMissingJobs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

- (BOOL)_handleCollaborationUploadError:(id)a3 recordID:(id)a4 clientZone:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  int v18;
  id v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[4];
  void (**v36)(id, _QWORD, id);
  _QWORD v37[4];
  id v38;
  id v39;
  _BYTE *v40;
  _QWORD block[4];
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  _BYTE buf[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, id))a6;
  if (v10)
  {
    objc_msgSend(v10, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BE175D0];
    v16 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE175D0]);

    if ((v16 & 1) != 0)
    {
      v17 = v10;
LABEL_19:
      v13[2](v13, 0, v17);
LABEL_20:

      goto LABEL_21;
    }
    v43 = 0;
    v18 = objc_msgSend(v10, "brc_isCloudKitShouldBeUsingEnhancedDrivePrivacyWithFieldName:", &v43);
    v19 = v43;
    if (v18)
    {
      brc_bread_crumbs();
      v20 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        v47 = v20;
        _os_log_debug_impl(&dword_230455000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Enabling server zone %@ to use enhanced drive privacy (field name %@)%@", buf, 0x20u);
      }

      -[BRCAccountSessionFPFS clientTruthWorkloop](self->super.super._session, "clientTruthWorkloop");
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __75__BRCFSUploader__handleCollaborationUploadError_recordID_clientZone_reply___block_invoke;
      block[3] = &unk_24FE3FA18;
      v42 = v12;
      dispatch_async_and_wait(v22, block);

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", v15, 1, CFSTR("Upload failed, please try again"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v23 = v42;
    }
    else
    {
      if (objc_msgSend(v10, "brc_isCloudKitValidationKeyMismatchError"))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v47 = __Block_byref_object_copy__35;
        v48 = __Block_byref_object_dispose__35;
        v49 = 0;
        -[BRCAccountSessionFPFS clientTruthWorkloop](self->super.super._session, "clientTruthWorkloop");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = MEMORY[0x24BDAC760];
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __75__BRCFSUploader__handleCollaborationUploadError_recordID_clientZone_reply___block_invoke_2;
        v37[3] = &unk_24FE416D8;
        v40 = buf;
        v38 = v12;
        v39 = v11;
        dispatch_async_and_wait(v24, v37);

        v26 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v26)
        {
          v35[0] = v25;
          v35[1] = 3221225472;
          v35[2] = __75__BRCFSUploader__handleCollaborationUploadError_recordID_clientZone_reply___block_invoke_3;
          v35[3] = &unk_24FE416B0;
          v36 = v13;
          objc_msgSend(v26, "addLocateRecordCompletionBlock:", v35);

          v17 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", v15, 4, &stru_24FE4A790);
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }

        _Block_object_dispose(buf, 8);
        if (v26)
        {

          goto LABEL_20;
        }
LABEL_9:
        if (v17)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_17:
        v32 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v10, "br_errorDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "br_errorWithDomain:code:userInfo:description:", v15, 4, 0, CFSTR("%@"), v33);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      objc_msgSend(v10, "domain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x24BDB8EA8]);

      if (!v28)
        goto LABEL_17;
      CKRetryAfterSecondsForError();
      if (v29 == 0.0)
        goto LABEL_17;
      v30 = (void *)MEMORY[0x24BDD1540];
      v44 = *MEMORY[0x24BE175D8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "br_errorWithDomain:code:userInfo:description:", v15, 1, v31, CFSTR("Upload failed, please try again"));
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_9;
  }
LABEL_21:

  return v10 != 0;
}

uint64_t __75__BRCFSUploader__handleCollaborationUploadError_recordID_clientZone_reply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStateBits:", 0x400000);
}

void __75__BRCFSUploader__handleCollaborationUploadError_recordID_clientZone_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "locateRecordIfNecessaryForRecordID:isUserWaiting:", *(_QWORD *)(a1 + 40), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__BRCFSUploader__handleCollaborationUploadError_recordID_clientZone_reply___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE175D0], 1, CFSTR("Upload failed, please try again"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v5, "brc_wrappedError");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE175D0], 3, CFSTR("Item not found"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (id)v7;

LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)uploadDocument:(id)a3 withContents:(id)a4 baseVersion:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  BRFieldContentSignature *v43;
  void *v44;
  BRFieldContentSignature *v45;
  BRCUploadCKRecordProvider *uploadCKRecordProvider;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void (**v56)(_QWORD, _QWORD, _QWORD);
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v64;
  id v65;
  id v66;
  BRFieldContentSignature *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;
  BRCFSUploader *v80;
  id v81;
  id v82;
  void (**v83)(_QWORD, _QWORD, _QWORD);
  uint64_t *v84;
  uint64_t *v85;
  id v86[2];
  id location;
  id v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  _QWORD v97[5];
  id v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[4];
  id v108;
  id v109;
  uint64_t *v110;
  uint64_t *v111;
  char v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  id v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  id v130;

  v10 = a3;
  v11 = a4;
  v75 = a5;
  v12 = a6;
  v125 = 0;
  v126 = &v125;
  v127 = 0x3032000000;
  v128 = __Block_byref_object_copy__35;
  v129 = __Block_byref_object_dispose__35;
  v130 = 0;
  v119 = 0;
  v120 = &v119;
  v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__35;
  v123 = __Block_byref_object_dispose__35;
  objc_msgSend(v10, "clientZone");
  v124 = (id)objc_claimAutoreleasedReturnValue();
  v113 = 0;
  v114 = &v113;
  v115 = 0x3032000000;
  v116 = __Block_byref_object_copy__35;
  v117 = __Block_byref_object_dispose__35;
  v118 = 0;
  -[BRCAccountSessionFPFS analyticsReporter](self->super.super._session, "analyticsReporter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v120[5], "mangledID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "shouldSendTelemetryOnCollaborationAPIs");

  v17 = MEMORY[0x24BDAC760];
  v107[0] = MEMORY[0x24BDAC760];
  v107[1] = 3221225472;
  v107[2] = __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke;
  v107[3] = &unk_24FE46E68;
  v112 = v16;
  v73 = v13;
  v108 = v73;
  v110 = &v113;
  v111 = &v119;
  v74 = v12;
  v109 = v74;
  v103 = 0;
  v104 = &v103;
  v105 = 0x2020000000;
  v106 = -1;
  v97[0] = v17;
  v97[1] = 3221225472;
  v97[2] = __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_2;
  v97[3] = &unk_24FE46E90;
  v99 = &v103;
  v100 = &v125;
  v97[4] = self;
  v101 = &v113;
  v102 = &v119;
  v72 = (id)MEMORY[0x2348BA0DC](v107);
  v98 = v72;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2348BA0DC](v97);
  objc_msgSend(v11, "url");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BE17660];
  objc_msgSend(v11, "_scope");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = 0;
  v22 = objc_msgSend(v20, "consumeSandboxExtension:error:", v21, &v96);
  v23 = v96;
  v104[3] = v22;

  if (v104[3] < 0)
  {
    ((void (**)(_QWORD, _QWORD, id))v18)[2](v18, 0, v23);
    v36 = 0;
    v62 = 0;
  }
  else
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "liveStageFilename");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("cu_%@"), v25);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = 0;
    v26 = *MEMORY[0x24BDBCBE0];
    v94 = 0;
    LOBYTE(v24) = objc_msgSend(v19, "getResourceValue:forKey:error:", &v95, v26, &v94);
    v27 = v95;
    v28 = v94;

    v70 = v27;
    if ((v24 & 1) != 0)
    {
      objc_msgSend(v27, "timeIntervalSince1970");
      v30 = v29;
      objc_msgSend(v10, "clientZone");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "mangledID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "maxXattrBlobSize");

      -[BRCAccountSessionFPFS stageRegistry](self->super.super._session, "stageRegistry");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = v28;
      v93 = 0;
      LOBYTE(v34) = objc_msgSend(v35, "saveXattrsForURL:withMaximumSize:xattrSignature:error:", v19, v34, &v93, &v92);
      v36 = v93;
      v37 = v92;

      if ((v34 & 1) != 0)
      {
        -[BRCAccountSessionFPFS stageRegistry](self->super.super._session, "stageRegistry");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v37;
        objc_msgSend(v38, "cloneURLToLiveStage:liveStageFilename:error:", v19, v71, &v91);
        v39 = objc_claimAutoreleasedReturnValue();
        v28 = v91;

        v40 = (void *)v126[5];
        v126[5] = v39;

        if (v126[5])
        {
          brc_bread_crumbs();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v42 = objc_claimAutoreleasedReturnValue();
          v68 = v36;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            -[BRCFSUploader uploadDocument:withContents:baseVersion:reply:].cold.1();

          v43 = [BRFieldContentSignature alloc];
          objc_msgSend(v75, "contentVersion");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[BRFieldContentSignature initWithData:](v43, "initWithData:", v44);

          v90 = 0;
          uploadCKRecordProvider = self->_uploadCKRecordProvider;
          v47 = v126[5];
          v67 = v45;
          -[BRFieldContentSignature etag](v45, "etag");
          v36 = v68;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v28;
          v89 = 0;
          -[BRCUploadCKRecordProvider createCKRecordFor:document:stageID:mtime:etag:xattrSignature:transferSize:boundaryKey:error:](uploadCKRecordProvider, "createCKRecordFor:document:stageID:mtime:etag:xattrSignature:transferSize:boundaryKey:error:", v47, v10, v71, (unint64_t)v30, v48, v68, &v90, &v89, &v88);
          v49 = objc_claimAutoreleasedReturnValue();
          v69 = v89;
          v50 = v88;

          v51 = (void *)v114[5];
          v114[5] = v49;

          if (v114[5])
          {
            v66 = v50;
            objc_msgSend(v10, "syncContextUsedForTransfers");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", v90);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_initWeak(&location, self);
            v76[0] = MEMORY[0x24BDAC760];
            v76[1] = 3221225472;
            v76[2] = __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_214;
            v76[3] = &unk_24FE46F30;
            objc_copyWeak(v86, &location);
            v83 = v18;
            v77 = v69;
            v84 = &v113;
            v65 = v53;
            v78 = v65;
            v86[1] = v90;
            v54 = v52;
            v79 = v54;
            v80 = self;
            v85 = &v119;
            v81 = v75;
            v55 = v10;
            v82 = v55;
            v56 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2348BA0DC](v76);
            if (objc_msgSend(v55, "shouldTransferThumbnail"))
            {
              v64 = v54;
              -[BRCAccountSessionFPFS stageRegistry](self->super.super._session, "stageRegistry");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "createURLForThumbnailUploadWithStageID:", v71);
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              +[BRCThumbnailGenerationManager defaultManager](BRCThumbnailGenerationManager, "defaultManager");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v126[5];
              +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "thumbnailGenerationForCollaborationUploadTimeout");
              objc_msgSend(v59, "addOutOfBandThumbnailGenerationJobAtURL:targetURL:timeout:syncContext:completionHandler:", v60, v58, v64, v56);

              v54 = v64;
            }
            else
            {
              v56[2](v56, 0, 0);
            }
            v62 = v65;

            objc_destroyWeak(v86);
            objc_destroyWeak(&location);

            v28 = v66;
          }
          else
          {
            ((void (**)(_QWORD, _QWORD, id))v18)[2](v18, 0, v50);
            v62 = 0;
            v28 = v50;
          }

        }
        else
        {
          ((void (**)(_QWORD, _QWORD, id))v18)[2](v18, 0, v28);
          v62 = 0;
        }
      }
      else
      {
        ((void (**)(_QWORD, _QWORD, id))v18)[2](v18, 0, v37);
        v62 = 0;
        v28 = v37;
      }
    }
    else
    {
      ((void (**)(_QWORD, _QWORD, id))v18)[2](v18, 0, v28);
      v36 = 0;
      v62 = 0;
    }

    v23 = v28;
  }

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v113, 8);

  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v125, 8);

  return v62;
}

void __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 64))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "mangledID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "enhancedDrivePrivacyEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aggregateReportForAppTelemetryIdentifier:itemID:zoneMangledID:enhancedDrivePrivacyEnabled:error:", 39, v8, v9, v10, v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) & 0x8000000000000000) == 0)
    objc_msgSend(MEMORY[0x24BE17660], "releaseSandboxExtensionHandle:");
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 8), "fileUnlinker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "renameAndUnlinkInBackgroundItemAtPath:", v7);

  }
  v8 = (void *)a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v8, "_handleCollaborationUploadError:recordID:clientZone:reply:", v5, v9, *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40), a1[5]);

  if ((v8 & 1) == 0)
    (*(void (**)(void))(a1[5] + 16))();

}

void __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_214(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 104));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "clientTruthWorkloop");
    v6 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_2_217;
    v15[3] = &unk_24FE46F08;
    v16 = v3;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 88);
    v17 = v7;
    v25 = v8;
    v9 = *(id *)(a1 + 40);
    v27 = *(_QWORD *)(a1 + 112);
    v18 = v9;
    v19 = v5;
    v24 = *(id *)(a1 + 80);
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(void **)(a1 + 64);
    v20 = v10;
    v21 = v11;
    v26 = *(_QWORD *)(a1 + 96);
    v22 = v12;
    v23 = *(id *)(a1 + 72);
    dispatch_async(v6, v15);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x24BDD1540], "brc_unkownErrorWithDescription:", CFSTR("Deallocated"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

  }
}

void __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_2_217(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  BRCCollaborationUploadOperation *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDB9010], "br_assetWithFileURL:boundaryKey:", v2, *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "setObject:forKeyedSubscript:", v3, CFSTR("thumb1024"));
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_2_217_cold_1();

    objc_msgSend(*(id *)(a1 + 48), "setTotalUnitCount:", objc_msgSend(v3, "size") + *(_QWORD *)(a1 + 120));
  }
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v20 = 0;
  v8 = objc_msgSend(v6, "validateEnhancedDrivePrivacyFieldsWithSession:error:", v7, &v20);
  v9 = v20;
  if ((v8 & 1) != 0)
  {
    v10 = -[BRCCollaborationUploadOperation initWithRecord:progress:syncContext:sessionContext:]([BRCCollaborationUploadOperation alloc], "initWithRecord:progress:syncContext:sessionContext:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8));
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_219;
    v16[3] = &unk_24FE46EE0;
    v11 = *(id *)(a1 + 96);
    v12 = *(_QWORD *)(a1 + 112);
    v18 = v11;
    v19 = v12;
    v16[4] = *(_QWORD *)(a1 + 56);
    v17 = *(id *)(a1 + 80);
    -[BRCCollaborationUploadOperation setUploadCompletionBlock:](v10, "setUploadCompletionBlock:", v16);
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 88), "session");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addMiscOperation:", v10);

      -[_BRCOperation schedule](v10, "schedule");
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 96);
      objc_msgSend(MEMORY[0x24BDD1540], "brc_unkownErrorWithDescription:", CFSTR("Upload operation failed to allocate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }

}

void __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_219(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  NSObject *v10;
  BRFieldContentSignature *v11;
  BRCLocalVersion *v12;
  BRCLocalVersion *v13;
  BRFieldContentSignature *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v27 = 0;
    v28 = 0;
    v7 = objc_msgSend(v5, "deserializeVersion:fakeStatInfo:contentBoundaryKey:clientZone:outOfBandUpload:error:", &v28, 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 1, &v27);
    v8 = v28;
    v9 = v27;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientTruthWorkloop");
      v10 = objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_220;
      v24 = &unk_24FE429C0;
      v26 = *(_QWORD *)(a1 + 56);
      v25 = v6;
      dispatch_async(v10, &v21);

      v11 = [BRFieldContentSignature alloc];
      v12 = [BRCLocalVersion alloc];
      v13 = -[BRCLocalVersion initWithVersion:](v12, "initWithVersion:", v8, v21, v22, v23, v24);
      v14 = -[BRFieldContentSignature initWithLocalVersion:](v11, "initWithLocalVersion:", v13);

      v15 = objc_alloc(MEMORY[0x24BDC83D8]);
      -[BRFieldContentSignature data](v14, "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "metadataVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithContentVersion:metadataVersion:", v16, v17);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_219_cold_1();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

void __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_220(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6[2];

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "db");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_2_221;
  v5[3] = &unk_24FE46EB8;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  *(_OWORD *)v6 = v4;
  objc_msgSend(v2, "groupInBatch:", v5);

}

void __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_2_221(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "learnCKInfosFromSavedRecords:isOutOfBandModifyRecords:", v2, 1);

}

- (void)screenLockChanged:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[5];

  self->_isScreenLocked = a3;
  if (!a3)
  {
    -[BRCAccountSessionFPFS clientTruthWorkloop](self->super.super._session, "clientTruthWorkloop");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__BRCFSUploader_screenLockChanged___block_invoke;
    block[3] = &unk_24FE3FA18;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

void __35__BRCFSUploader_screenLockChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 105))
  {
    objc_msgSend(*(id *)(v1 + 8), "personaIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    BRPerformWithPersonaAndError();

  }
}

void __35__BRCFSUploader_screenLockChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __35__BRCFSUploader_screenLockChanged___block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_rescheduleJobsPendingScreenUnlock");
  }

}

- (void)networkReachabilityChanged:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[5];

  self->_isNetworkReachable = a3;
  if (a3)
  {
    -[BRCAccountSessionFPFS clientTruthWorkloop](self->super.super._session, "clientTruthWorkloop");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__BRCFSUploader_networkReachabilityChanged___block_invoke;
    block[3] = &unk_24FE3FA18;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

void __44__BRCFSUploader_networkReachabilityChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 106))
  {
    objc_msgSend(*(id *)(v1 + 8), "personaIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    BRPerformWithPersonaAndError();

  }
}

void __44__BRCFSUploader_networkReachabilityChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __35__BRCFSUploader_screenLockChanged___block_invoke_2_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_rescheduleJobsPendingNetwork");
  }

}

- (BOOL)isDefaultOwnerOutOfQuota
{
  return self->_isDefaultOwnerOutOfQuota;
}

- (BRCDeadlineScheduler)uploadsDeadlineScheduler
{
  return self->_uploadsDeadlineScheduler;
}

- (BRCThumbnailGenerationManager)thumbnailGenerationManager
{
  return self->_thumbnailGenerationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailGenerationManager, 0);
  objc_storeStrong((id *)&self->_uploadsDeadlineScheduler, 0);
  objc_storeStrong((id *)&self->_uploadCKRecordProvider, 0);
  objc_storeStrong((id *)&self->_thumbnailTracker, 0);
  objc_storeStrong((id *)&self->_globalQuotaStateUpdatePacer, 0);
  objc_storeStrong((id *)&self->_quotaPacer, 0);
  objc_storeStrong((id *)&self->_retryQueueSource, 0);
  objc_storeStrong((id *)&self->_fairScheduler, 0);
}

void __40__BRCFSUploader_initWithAccountSession___block_invoke_6_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] ┏%llx Uploader: scheduling retries%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_rescheduleUploadJobsPendingState:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12_0();
  _os_log_fault_impl(&dword_230455000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Method don't support state: %d%@", v1, 0x12u);
  OUTLINED_FUNCTION_0();
}

- (void)_rescheduleUploadJobsPendingState:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Uploader: scheduling %lld suspended throttles%@");
  OUTLINED_FUNCTION_0();
}

- (void)performFirstSchedulingAfterStartupInDB:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = 134218242;
  v7 = objc_msgSend(a1, "changes");
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a3, v5, "[DEBUG] Rescheduled %lld in-flight transfers because we have restarted%@", (uint8_t *)&v6);
}

void __25__BRCFSUploader_schedule__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: upload scheduler is exact we should have an item%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __25__BRCFSUploader_schedule__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no app library for row ID %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_updatePackageRecord:item:stageID:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Failed to create package: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_updatePackageRecord:(NSObject *)a3 item:stageID:error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[40];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dbRowID");
  objc_msgSend(a1, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_8_1(&dword_230455000, a3, v6, "[DEBUG] Uploader[%lld]: generating manifest for %@%@", v7);

  OUTLINED_FUNCTION_5_1();
}

void __57__BRCFSUploader__updatePackageRecord_item_stageID_error___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to add item to package%@", v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)_updateRecord:item:syncContext:targetThumbnailURL:stageID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: can't upload an item without a fileID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_updateRecord:item:syncContext:targetThumbnailURL:stageID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Couldn't find xattr for signature %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_updateRecord:item:syncContext:targetThumbnailURL:stageID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] generated thumbnail: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_updateRecord:item:syncContext:targetThumbnailURL:stageID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !item.isFinderBookmark%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_handleFileModifiedError:forItem:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Handling file modified error: %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_shouldReingestAfterUploadErrorWithItem:record:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Found different gen count on disk for %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_shouldReingestAfterUploadErrorWithItem:record:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Couldn't find %@ on disk%@");
  OUTLINED_FUNCTION_0();
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: ![item isReadAndUploaded]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Uploader[%@]: increasing throttle back off%@");
  OUTLINED_FUNCTION_0();
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.3()
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

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] failing on CKErrorAssetNotAvailable/CKUnderlyingErrorMMCSItemNotAvailable when screen is locked --> Suspending for data protection class%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] We received an asset unavailable error but it exists in the correct place. Computing new record and retrying upload%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Suspending for no network%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Error is retriable, putting item back in the queue%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Failed calculating signature with error: %@. File is damaged on disk, need to recover%@");
  OUTLINED_FUNCTION_0();
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_performServerSideAssetCopyForItem:transferSize:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Uploader[%@] Fetching package signature to perform server side asset copy%@");
  OUTLINED_FUNCTION_0();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] creating manifestAssetReference failed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] creating kBRRecordKeyPackageManifest CKAsset failed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 56);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: Can't server-side asset copy an item with an invalid xattr signature %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 56);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: Can't server-side asset copy an invalid thumbanil signature for %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] clonedPackageWithRecordID for kBRRecordKeyPackageContent failed with error %@%@");
  OUTLINED_FUNCTION_0();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] clonedPackageWithRecordID for kBRRecordKeyPackageXattrs failed with error %@%@");
  OUTLINED_FUNCTION_0();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_7(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[40];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 104));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_8_1(&dword_230455000, a3, v5, "[DEBUG] duplicate pkg content. pkgManifest signature [%@] pkgHasXattrs [%@]%@", v6);

  OUTLINED_FUNCTION_5_1();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] creating kBRRecordKeyFileContent CKAsset failed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] creating contentAssetReference failed%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] duplicate document content%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_11(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 56);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: Can't server-side asset copy an item with an invalid signature %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_12(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Uploader[%@]: performing server-side asset copy%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)finishedSyncingUpItem:withOutOfQuotaError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _session.clientDB.changes == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDB8E88];
  v4 = 138412802;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  v8 = 2112;
  v9 = a1;
  OUTLINED_FUNCTION_8_1(&dword_230455000, a3, (uint64_t)a3, "[DEBUG] updated %@ quota: %lld%@", (uint8_t *)&v4);
}

- (void)recoverAndReportMissingJobs
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] Uploader: scheduling %lld upload jobs that where blocked on non existing sync up jobs%@");
  OUTLINED_FUNCTION_0();
}

- (void)uploadDocument:withContents:baseVersion:reply:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(v0 + 40);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] Uploading contents from %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_2_217_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v1, v2, "[DEBUG] generated thumbnail: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __63__BRCFSUploader_uploadDocument_withContents_baseVersion_reply___block_invoke_219_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] Unable to deserialize record: %@%@");
  OUTLINED_FUNCTION_0();
}

void __35__BRCFSUploader_screenLockChanged___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: Failed to adopt persona with error %@%@");
  OUTLINED_FUNCTION_0();
}

@end
