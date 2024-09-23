@implementation BRCZonePurgeOperation

- (BRCZonePurgeOperation)initWithServerZone:(id)a3 sessionContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BRCZonePurgeOperation *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncContextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultSyncContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)BRCZonePurgeOperation;
  v12 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v14, sel_initWithName_syncContext_sessionContext_, CFSTR("sync/zone-purge"), v11, v8);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_serverZone, a3);
    -[_BRCOperation setNonDiscretionary:](v12, "setNonDiscretionary:", 1);
  }

  return v12;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sync/zone-purge", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)main
{
  id v3;
  BRCPrivateServerZone *v4;
  void *v5;
  dispatch_group_t v6;
  BRCPrivateServerZone *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  BRCPrivateServerZone *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD block[6];
  _QWORD v25[5];
  BRCPrivateServerZone *v26;
  NSObject *v27;
  _QWORD *v28;
  _QWORD v29[5];
  BRCPrivateServerZone *v30;
  NSObject *v31;
  _QWORD *v32;
  _QWORD v33[4];
  BRCPrivateServerZone *v34;
  id v35;
  _QWORD v36[3];
  char v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = self->_serverZone;
  -[BRCServerZone session](self->_serverZone, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = 0;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __29__BRCZonePurgeOperation_main__block_invoke;
  v33[3] = &unk_24FE46430;
  v7 = v4;
  v34 = v7;
  v8 = v3;
  v35 = v8;
  objc_msgSend(v5, "enumerateServerZones:", v33);
  v9 = objc_alloc(MEMORY[0x24BDB9150]);
  -[BRCServerZone zoneID](v7, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v11);

  objc_msgSend(v12, "setMarkZonesAsUserPurged:", 1);
  objc_msgSend(v12, "callbackQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v13, v14);

  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __29__BRCZonePurgeOperation_main__block_invoke_2;
  v29[3] = &unk_24FE46458;
  v32 = v36;
  v29[4] = self;
  v15 = v7;
  v30 = v15;
  v16 = v6;
  v31 = v16;
  objc_msgSend(v12, "setModifyRecordZonesCompletionBlock:", v29);
  dispatch_group_enter(v16);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v12);
  if (objc_msgSend(v8, "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9150]), "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v8);

    objc_msgSend(v17, "callbackQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    -[_BRCOperation callbackQueue](self, "callbackQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v18, v19);

    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __29__BRCZonePurgeOperation_main__block_invoke_5;
    v25[3] = &unk_24FE46458;
    v28 = v36;
    v25[4] = self;
    v26 = v15;
    v20 = v16;
    v27 = v20;
    objc_msgSend(v17, "setModifyRecordZonesCompletionBlock:", v25);
    dispatch_group_enter(v20);
    objc_msgSend(v5, "syncContextProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sharedMetadataSyncContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation addSubOperation:overrideContext:allowsCellularAccess:](self, "addSubOperation:overrideContext:allowsCellularAccess:", v17, v22, 0);

  }
  else
  {
    v17 = v12;
  }
  -[_BRCOperation callbackQueue](self, "callbackQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__BRCZonePurgeOperation_main__block_invoke_6;
  block[3] = &unk_24FE429C0;
  block[4] = self;
  block[5] = v36;
  dispatch_group_notify(v16, v23, block);

  _Block_object_dispose(v36, 8);
}

uint64_t __29__BRCZonePurgeOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(v3, "isSharedZone"))
  {
    objc_msgSend(v3, "zoneName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if (v6)
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v3, "zoneID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

    }
  }

  return 1;
}

void __29__BRCZonePurgeOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (!*(_BYTE *)(v10 + 24))
    {
      *(_BYTE *)(v10 + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v9);
    }
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __29__BRCZonePurgeOperation_main__block_invoke_2_cold_1();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __29__BRCZonePurgeOperation_main__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (!*(_BYTE *)(v10 + 24))
    {
      *(_BYTE *)(v10 + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v9);
    }
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __29__BRCZonePurgeOperation_main__block_invoke_5_cold_1();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __29__BRCZonePurgeOperation_main__block_invoke_6(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return objc_msgSend(*(id *)(result + 32), "completedWithResult:error:", 0, 0);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverZone, 0);
}

void __29__BRCZonePurgeOperation_main__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] deleted %@ on server%@");
}

void __29__BRCZonePurgeOperation_main__block_invoke_5_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] deleted shared zones associated to %@ on server%@");
}

@end
