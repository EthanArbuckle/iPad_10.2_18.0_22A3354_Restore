@implementation BRCMigrateZonePCSOperation

- (BRCMigrateZonePCSOperation)initWithSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BRCMigrateZonePCSOperation *v7;
  uint64_t v8;
  NSMutableArray *interestingZoneIDs;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "syncContextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultSyncContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)BRCMigrateZonePCSOperation;
  v7 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v11, sel_initWithName_syncContext_sessionContext_, CFSTR("migrate-pcs"), v6, v4);

  if (v7)
  {
    v8 = objc_opt_new();
    interestingZoneIDs = v7->_interestingZoneIDs;
    v7->_interestingZoneIDs = (NSMutableArray *)v8;

  }
  return v7;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isCloudKitErrorZoneMigrated") ^ 1;
}

- (void)_createCloudDocsZone:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BRCCreateZoneAndSubscribeOperation *v7;
  void *v8;
  BRCCreateZoneAndSubscribeOperation *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BRCMigrateZonePCSOperation *v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDB91F8]);
  v6 = (void *)objc_msgSend(v5, "initWithZoneName:ownerName:", *MEMORY[0x24BE17550], *MEMORY[0x24BDB8E88]);
  v7 = [BRCCreateZoneAndSubscribeOperation alloc];
  -[BRCSyncContext session](self->super._syncContext, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BRCCreateZoneAndSubscribeOperation initWithSession:zoneID:](v7, "initWithSession:zoneID:", v8, v6);

  -[BRCCreateZoneAndSubscribeOperation setSubscriptionOnly:](v9, "setSubscriptionOnly:", 0);
  -[BRCCreateZoneAndSubscribeOperation setOptimisticSubscribe:](v9, "setOptimisticSubscribe:", 1);
  objc_initWeak(&location, v9);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__BRCMigrateZonePCSOperation__createCloudDocsZone___block_invoke;
  v12[3] = &unk_24FE472A0;
  objc_copyWeak(&v16, &location);
  v10 = v6;
  v13 = v10;
  v11 = v4;
  v14 = self;
  v15 = v11;
  -[BRCCreateZoneAndSubscribeOperation setCreateZoneAndSubscribeCompletionBlock:](v9, "setCreateZoneAndSubscribeCompletionBlock:", v12);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v9);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __51__BRCMigrateZonePCSOperation__createCloudDocsZone___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "createdZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB91F0]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
  v8 = v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_fetchZonesNeedingMigration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  BRCMigrateZonePCSOperation *v19;
  id v20;

  v4 = a3;
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blacklistPCSPrep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BDB91F8]);
  v8 = (void *)objc_msgSend(v7, "initWithZoneName:ownerName:", *MEMORY[0x24BE17550], *MEMORY[0x24BDB8E88]);
  objc_msgSend(MEMORY[0x24BDB90E0], "fetchAllRecordZonesOperation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __58__BRCMigrateZonePCSOperation__fetchZonesNeedingMigration___block_invoke;
  v16 = &unk_24FE472F0;
  v17 = v8;
  v18 = v6;
  v19 = self;
  v20 = v4;
  v10 = v4;
  v11 = v6;
  v12 = v8;
  objc_msgSend(v9, "setFetchRecordZonesCompletionBlock:", &v13);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v9, v13, v14, v15, v16);

}

void __58__BRCMigrateZonePCSOperation__fetchZonesNeedingMigration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, void *, void *);
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a2;
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__39;
  v23 = __Block_byref_object_dispose__39;
  v24 = 0;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __58__BRCMigrateZonePCSOperation__fetchZonesNeedingMigration___block_invoke_14;
  v14 = &unk_24FE472C8;
  v15 = *(id *)(a1 + 32);
  v18 = &v19;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v16 = v7;
  v17 = v8;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v11);
  v10 = v20[5];
  if (v6 | v10)
    (*(void (**)(_QWORD, _QWORD, uint64_t, unint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 504), v10, v6, v9);
  else
    objc_msgSend(*(id *)(a1 + 48), "_createCloudDocsZone:", *(_QWORD *)(a1 + 56), v11, v12, v13, v14, v15);

  _Block_object_dispose(&v19, 8);
}

void __58__BRCMigrateZonePCSOperation__fetchZonesNeedingMigration___block_invoke_14(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v10, "isEqual:", a1[4]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  }
  else
  {
    v6 = (void *)a1[5];
    objc_msgSend(v10, "zoneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v7))
    {

    }
    else
    {
      objc_msgSend(v10, "ownerName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB8E88]);

      if (v9)
        objc_msgSend(*(id *)(a1[6] + 504), "addObject:", v10);
    }
  }

}

- (void)main
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __34__BRCMigrateZonePCSOperation_main__block_invoke;
  v2[3] = &unk_24FE47340;
  v2[4] = self;
  -[BRCMigrateZonePCSOperation _fetchZonesNeedingMigration:](self, "_fetchZonesNeedingMigration:", v2);
}

void __34__BRCMigrateZonePCSOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD block[5];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      v19 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v23 = v19;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v10;
      _os_log_error_impl(&dword_230455000, v11, (os_log_type_t)0x90u, "[ERROR] Failed fetching zones to prep PCS for %@ - %@%@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v9);
  }
  else
  {
    if (objc_msgSend(v7, "count"))
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v23 = v7;
        v24 = 2112;
        v25 = v8;
        v26 = 2112;
        v27 = v12;
        _os_log_debug_impl(&dword_230455000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Prepping PCS for %@ -> %@%@", buf, 0x20u);
      }

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9000]), "initWithSourceZoneIDs:targetZone:", v7, v8);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __34__BRCMigrateZonePCSOperation_main__block_invoke_21;
      v20[3] = &unk_24FE47318;
      v20[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v14, "setAggregateZonePCSCompletionBlock:", v20);
      objc_msgSend(*(id *)(a1 + 32), "addSubOperation:", v14);
    }
    else
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __34__BRCMigrateZonePCSOperation_main__block_invoke_cold_1((uint64_t)v15, v16);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clientDB");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "serialQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __34__BRCMigrateZonePCSOperation_main__block_invoke_17;
      block[3] = &unk_24FE3FA18;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v18, block);

    }
  }

}

uint64_t __34__BRCMigrateZonePCSOperation_main__block_invoke_17(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsPCSMigration:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", MEMORY[0x24BDBD1C8], 0);
}

void __34__BRCMigrateZonePCSOperation_main__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "brc_isCloudKitErrorZoneMigrated"))
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      v19 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v22 = v19;
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v13;
      _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] Failed migrating PCS for %@ - %@%@", buf, 0x20u);
    }

  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v17 = CFSTR("not needed");
      v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      if (!v7)
        v17 = CFSTR("complete");
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v8;
      _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] PCS migration %@ for %@%@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientDB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__BRCMigrateZonePCSOperation_main__block_invoke_26;
    block[3] = &unk_24FE3FA18;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_sync(v12, block);

    v7 = 0;
  }
  v15 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7 == 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "completedWithResult:error:", v16, v7);

}

void __34__BRCMigrateZonePCSOperation_main__block_invoke_26(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsPCSMigration:", 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestingZoneIDs, 0);
}

void __34__BRCMigrateZonePCSOperation_main__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_230455000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] No zones need PCS prep currently%@", (uint8_t *)&v2, 0xCu);
}

@end
