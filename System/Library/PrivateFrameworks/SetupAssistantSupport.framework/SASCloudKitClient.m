@implementation SASCloudKitClient

- (SASCloudKitClient)initWithContainerIdentifier:(id)a3 callbackQueue:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  SASCloudKitClient *v12;

  v6 = (objc_class *)MEMORY[0x1E0C94C40];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithContainerIdentifier:environment:", v8, 1);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v9);
  objc_msgSend(v10, "privateCloudDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SASCloudKitClient initWithDatabase:inContainer:callbackQueue:](self, "initWithDatabase:inContainer:callbackQueue:", v11, v10, v7);

  return v12;
}

- (SASCloudKitClient)initWithDatabase:(id)a3 inContainer:(id)a4 callbackQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  SASCloudKitClient *v12;
  SASCloudKitClient *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *callbackQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SASCloudKitClient;
  v12 = -[SASCloudKitClient init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_container, a4);
    objc_storeStrong((id *)&v13->_database, a3);
    if (v11)
      v14 = (dispatch_queue_t)v11;
    else
      v14 = dispatch_queue_create("Generic CloudKit Client Queue", 0);
    callbackQueue = v13->_callbackQueue;
    v13->_callbackQueue = (OS_dispatch_queue *)v14;

  }
  return v13;
}

- (void)fetchCurrentDeviceIDWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SASCloudKitClient container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SASCloudKitClient_fetchCurrentDeviceIDWithCompletion___block_invoke;
  v7[3] = &unk_1E97DC720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchCurrentDeviceIDWithCompletionHandler:", v7);

}

void __56__SASCloudKitClient_fetchCurrentDeviceIDWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SASCloudKitClient_fetchCurrentDeviceIDWithCompletion___block_invoke_2;
  block[3] = &unk_1E97DC6F8;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __56__SASCloudKitClient_fetchCurrentDeviceIDWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchRecordZone:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0C94E08];
  v11 = a4;
  v12 = [v10 alloc];
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithRecordZoneIDs:", v13);

  objc_msgSend(v14, "setGroup:", v11);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __54__SASCloudKitClient_fetchRecordZone_group_completion___block_invoke;
  v20 = &unk_1E97DC748;
  v21 = v8;
  v22 = v9;
  v15 = v8;
  v16 = v9;
  objc_msgSend(v14, "setFetchRecordZonesCompletionBlock:", &v17);
  -[SASCloudKitClient _scheduleDatabaseOperation:](self, "_scheduleDatabaseOperation:", v14, v17, v18, v19, v20);

}

void __54__SASCloudKitClient_fetchRecordZone_group_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94FF8], "itemErrorFromError:forID:", v7, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v9, v8);
}

- (void)saveRecordZone:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0C94EF0];
  v11 = a4;
  v12 = [v10 alloc];
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v13, 0);

  objc_msgSend(v14, "setGroup:", v11);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __53__SASCloudKitClient_saveRecordZone_group_completion___block_invoke;
  v20 = &unk_1E97DC770;
  v21 = v8;
  v22 = v9;
  v15 = v8;
  v16 = v9;
  objc_msgSend(v14, "setModifyRecordZonesCompletionBlock:", &v17);
  -[SASCloudKitClient _scheduleDatabaseOperation:](self, "_scheduleDatabaseOperation:", v14, v17, v18, v19, v20);

}

void __53__SASCloudKitClient_saveRecordZone_group_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = a4;
  objc_msgSend(a2, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C94FF8];
  objc_msgSend(*(id *)(a1 + 32), "zoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemErrorFromError:forID:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v11, v10);
}

- (void)fetchRecords:(id)a3 inZone:(id)a4 group:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithQuery:", v13);

  objc_msgSend(v15, "setGroup:", v11);
  objc_msgSend(v12, "zoneID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setZoneID:", v16);
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke;
  v24[3] = &unk_1E97DC798;
  v18 = v14;
  v25 = v18;
  objc_msgSend(v15, "setRecordMatchedBlock:", v24);
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke_14;
  v21[3] = &unk_1E97DC7C0;
  v22 = v18;
  v23 = v10;
  v19 = v18;
  v20 = v10;
  objc_msgSend(v15, "setQueryCompletionBlock:", v21);
  -[SASCloudKitClient _scheduleDatabaseOperation:](self, "_scheduleDatabaseOperation:", v15);

}

void __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7;
  id v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)v9;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  }
  else if (v7 | v9)
  {
    +[SASLogging facility](SASLogging, "facility");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke_cold_1((void *)v7, (uint64_t)v10, v11);

  }
}

uint64_t __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)saveRecord:(id)a3 group:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0C94F10];
  v11 = a4;
  v12 = [v10 alloc];
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithRecordsToSave:recordIDsToDelete:", v13, 0);

  objc_msgSend(v14, "setGroup:", v11);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __49__SASCloudKitClient_saveRecord_group_completion___block_invoke;
  v20 = &unk_1E97DC770;
  v21 = v8;
  v22 = v9;
  v15 = v8;
  v16 = v9;
  objc_msgSend(v14, "setModifyRecordsCompletionBlock:", &v17);
  -[SASCloudKitClient _scheduleDatabaseOperation:](self, "_scheduleDatabaseOperation:", v14, v17, v18, v19, v20);

}

void __49__SASCloudKitClient_saveRecord_group_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = a4;
  objc_msgSend(a2, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C94FF8];
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemErrorFromError:forID:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, BOOL, void *))(v6 + 16))(v6, v11 != 0, v10);
}

- (void)_scheduleDatabaseOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SASCloudKitClient callbackQueue](self, "callbackQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallbackQueue:", v5);

  -[SASCloudKitClient xpcActivity](self, "xpcActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setXpcActivity:", v6);

  -[SASCloudKitClient database](self, "database");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v4);

}

- (OS_xpc_object)xpcActivity
{
  return self->_xpcActivity;
}

- (void)setXpcActivity:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivity, a3);
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
}

void __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D45FD000, a3, OS_LOG_TYPE_ERROR, "Failed to match record:%@ error:%@", (uint8_t *)&v6, 0x16u);

}

@end
