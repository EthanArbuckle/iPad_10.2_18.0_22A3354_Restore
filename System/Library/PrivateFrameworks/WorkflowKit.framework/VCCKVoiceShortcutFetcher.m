@implementation VCCKVoiceShortcutFetcher

- (VCCKVoiceShortcutFetcher)initWithRecordHandler:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  VCCKVoiceShortcutFetcher *v10;
  void *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  CKDatabase *database;
  uint64_t v17;
  id recordHandler;
  uint64_t v19;
  id completionHandler;
  VCCKVoiceShortcutFetcher *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCKVoiceShortcutFetcher.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordHandler"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCKVoiceShortcutFetcher.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)VCCKVoiceShortcutFetcher;
  v10 = -[VCCKVoiceShortcutFetcher init](&v25, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", CFSTR("com.apple.siriactions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wf_setShortcutsAppAttribution");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.shortcuts.VCCKVoiceShortcutFetcher", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_msgSend(v11, "privateCloudDatabase");
    v15 = objc_claimAutoreleasedReturnValue();
    database = v10->_database;
    v10->_database = (CKDatabase *)v15;

    v17 = objc_msgSend(v7, "copy");
    recordHandler = v10->_recordHandler;
    v10->_recordHandler = (id)v17;

    v19 = objc_msgSend(v9, "copy");
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v19;

    v21 = v10;
  }

  return v10;
}

- (void)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[VCCKVoiceShortcutFetcher queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VCCKVoiceShortcutFetcher_finishWithSuccess_error___block_invoke;
  block[3] = &unk_1E7AF22C8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)addOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setQualityOfService:", 25);
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDiscretionaryNetworkBehavior:", 0);

  -[VCCKVoiceShortcutFetcher database](self, "database");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v4);

}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[VCCKVoiceShortcutFetcher queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__VCCKVoiceShortcutFetcher_start__block_invoke;
  block[3] = &unk_1E7AF94B0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)fetchRecordZones
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0C94E08], "fetchAllRecordZonesOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__VCCKVoiceShortcutFetcher_fetchRecordZones__block_invoke;
  v5[3] = &unk_1E7AEEFC8;
  v5[4] = self;
  +[VCRecordZoneParser activeRecordZone:](VCRecordZoneParser, "activeRecordZone:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchRecordZonesCompletionBlock:", v4);

  -[VCCKVoiceShortcutFetcher addOperation:](self, "addOperation:", v3);
}

- (void)fetchRecordsFromZone:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCCKVoiceShortcutFetcher.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zone"));

  }
  v6 = objc_alloc(MEMORY[0x1E0C94DE8]);
  objc_msgSend(v5, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v8, 0);

  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__VCCKVoiceShortcutFetcher_fetchRecordsFromZone___block_invoke;
  v13[3] = &unk_1E7AEEFF0;
  v13[4] = self;
  objc_msgSend(v9, "setRecordChangedBlock:", v13);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __49__VCCKVoiceShortcutFetcher_fetchRecordsFromZone___block_invoke_131;
  v12[3] = &unk_1E7AF7B78;
  v12[4] = self;
  objc_msgSend(v9, "setFetchRecordZoneChangesCompletionBlock:", v12);
  -[VCCKVoiceShortcutFetcher addOperation:](self, "addOperation:", v9);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CKDatabase)database
{
  return self->_database;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (id)recordHandler
{
  return self->_recordHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_recordHandler, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __49__VCCKVoiceShortcutFetcher_fetchRecordsFromZone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFPeaceMigrationLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[VCCKVoiceShortcutFetcher fetchRecordsFromZone:]_block_invoke";
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Successfully fetched voice shortcut record %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "recordHandler");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v7)[2](v7, v3);

}

void __49__VCCKVoiceShortcutFetcher_fetchRecordsFromZone___block_invoke_131(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFPeaceMigrationLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[VCCKVoiceShortcutFetcher fetchRecordsFromZone:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Finished fetching records with error: %{public}@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", v3 == 0, v3);
}

void __44__VCCKVoiceShortcutFetcher_fetchRecordZones__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__VCCKVoiceShortcutFetcher_fetchRecordZones__block_invoke_124;
    v9[3] = &unk_1E7AF92C0;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    dispatch_async(v7, v9);

  }
  else
  {
    getWFPeaceMigrationLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[VCCKVoiceShortcutFetcher fetchRecordZones]_block_invoke";
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Did not find an active record zone: %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v6);
  }

}

uint64_t __44__VCCKVoiceShortcutFetcher_fetchRecordZones__block_invoke_124(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchRecordsFromZone:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__VCCKVoiceShortcutFetcher_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchRecordZones");
}

void __52__VCCKVoiceShortcutFetcher_finishWithSuccess_error___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "completed") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompleted:", 1);
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

@end
