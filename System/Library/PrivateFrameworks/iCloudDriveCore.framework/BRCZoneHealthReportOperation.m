@implementation BRCZoneHealthReportOperation

- (BRCZoneHealthReportOperation)initWithSession:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BRCZoneHealthReportOperation *v8;
  objc_super v10;

  v5 = a3;
  objc_msgSend(v5, "syncContextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneHealthSyncContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)BRCZoneHealthReportOperation;
  v8 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v10, sel_initWithName_syncContext_sessionContext_, CFSTR("zone-health-report"), v7, v5);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_session, a3);
    v8->shouldPerformAnotherBatch = 1;
  }

  return v8;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (BOOL)shouldPerformAnotherBatch
{
  return self->shouldPerformAnotherBatch;
}

- (void)_reportRecords:(id)a3 requestID:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  BRCZoneHealthReportOperation *v17;
  id v18;
  id v19[2];
  id location;
  void *v21;

  v6 = a3;
  v21 = (void *)a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9158]), "initWithRecordsToSave:recordIDsToDelete:", v6, 0);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v21, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClientChangeTokenData:", v8);

  objc_msgSend(v7, "setAtomic:", 1);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v7, "setConfiguration:", v9);

  v10 = *MEMORY[0x24BE175C0];
  objc_msgSend(v7, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSourceApplicationBundleIdentifier:", v10);

  objc_initWeak(&location, v7);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __57__BRCZoneHealthReportOperation__reportRecords_requestID___block_invoke;
  v16 = &unk_24FE490B8;
  objc_copyWeak(v19, &location);
  v17 = self;
  v12 = v6;
  v18 = v12;
  v19[1] = v21;
  objc_msgSend(v7, "setModifyRecordsCompletionBlock:", &v13);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v7, v13, v14, v15, v16, v17);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

void __57__BRCZoneHealthReportOperation__reportRecords_requestID___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  BRCCreateZoneAndSubscribeOperation *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21[2];
  _BYTE location[12];
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(v9, "brc_isCloudKitErrorImplyingZoneNeedsCreation"))
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = WeakRetained;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v11;
      _os_log_debug_impl(&dword_230455000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] We need to create the zone health zone on %@ - %@%@", location, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDB91F8], "brc_zoneHealthZoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v14 = -[BRCCreateZoneAndSubscribeOperation initWithSession:zoneID:]([BRCCreateZoneAndSubscribeOperation alloc], "initWithSession:zoneID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512), v13);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __57__BRCZoneHealthReportOperation__reportRecords_requestID___block_invoke_5;
    v19[3] = &unk_24FE49090;
    objc_copyWeak(v21, (id *)location);
    v15 = *(id *)(a1 + 40);
    v16 = *(void **)(a1 + 56);
    v20 = v15;
    v21[1] = v16;
    -[BRCCreateZoneAndSubscribeOperation setCreateZoneAndSubscribeCompletionBlock:](v14, "setCreateZoneAndSubscribeCompletionBlock:", v19);
    objc_msgSend(*(id *)(a1 + 32), "addSubOperation:", v14);

    objc_destroyWeak(v21);
    objc_destroyWeak((id *)location);

  }
  else
  {
    if (v9)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        *(_DWORD *)location = 138412802;
        *(_QWORD *)&location[4] = WeakRetained;
        v23 = 2112;
        v24 = v9;
        v25 = 2112;
        v26 = v17;
        _os_log_error_impl(&dword_230455000, v18, (os_log_type_t)0x90u, "[ERROR] Failed reporting zone health on %@ - %@%@", location, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)location = 138412802;
        *(_QWORD *)&location[4] = v7;
        v23 = 2112;
        v24 = WeakRetained;
        v25 = 2112;
        v26 = v17;
        _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] finished reporting zone health: %@, op: %@%@", location, 0x20u);
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v9);
  }

}

void __57__BRCZoneHealthReportOperation__reportRecords_requestID___block_invoke_5(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "completedWithResult:error:", 0, v5);
  else
    objc_msgSend(WeakRetained, "_reportRecords:requestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)main
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_230455000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] No zone health errors to report%@", (uint8_t *)&v2, 0xCu);
}

void __36__BRCZoneHealthReportOperation_main__block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1[4] + 248), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceBatchStart");

  objc_msgSend(*(id *)(a1[4] + 248), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__BRCZoneHealthReportOperation_main__block_invoke_2;
  v6[3] = &unk_24FE490E0;
  v5 = (void *)a1[5];
  v8 = a1[6];
  v7 = v5;
  objc_msgSend(v4, "enumeratePrivateClientZones:", v6);

}

uint64_t __36__BRCZoneHealthReportOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[2];
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "prepareProblemReportForSyncWithRequestID:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "needsSyncUp"))
  {
    v49 = a1;
    objc_msgSend(v3, "serverZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB91F8], "brc_zoneHealthZoneID");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "zoneName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@"), v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x24BDB91E8]);
    v51 = v5;
    objc_msgSend(v5, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithRecordName:zoneID:", v13, v6);

    v48 = (void *)v11;
    v50 = (void *)v6;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", v11, v6);
    v47 = (void *)v14;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("zoneState"), v14);
    v46 = (void *)v15;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("zoneDetails"), v15);
    LODWORD(v14) = objc_msgSend(v4, "state");
    objc_msgSend(v3, "zoneHealthState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v18, "state");

    if ((int)v14 <= (int)v9)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v19;
        _os_log_impl(&dword_230455000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] not updating zone health state because we think we are less broken than the server does%@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "state"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("state"));
    }

    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSince1970");
    objc_msgSend(v21, "numberWithUnsignedLongLong:", (unint64_t)v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, CFSTR("updateTime"));

    objc_msgSend(v16, "setObject:forKeyedSubscript:", &stru_24FE4A790, CFSTR("clientInfo"));
    if (!objc_msgSend(v4, "state"))
    {
      brc_bread_crumbs();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        __36__BRCZoneHealthReportOperation_main__block_invoke_2_cold_1((uint64_t)v43, v44);

    }
    v45 = v16;
    objc_msgSend(v4, "effectiveProblemMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, CFSTR("message"));

    v26 = objc_alloc(MEMORY[0x24BDB91F8]);
    v53 = v3;
    objc_msgSend(v3, "serverZone");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "zoneName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v26, "initWithZoneName:ownerName:", v28, *MEMORY[0x24BDB8E88]);

    v30 = (void *)objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v52 = v4;
    objc_msgSend(v4, "effectedRecordNames");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v55 != v34)
            objc_enumerationMutation(v31);
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:zoneID:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i), v29);
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9218]), "initWithRecordID:action:", v36, 0);
          objc_msgSend(v30, "addObject:", v37);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v33);
    }

    if (objc_msgSend(v30, "count"))
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, CFSTR("records"));
    v3 = v53;
    objc_msgSend(v53, "zoneHealthState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "ckInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setCKInfoFieldsInRecord:includeCZMEtag:", v45, 0);

    v40 = *(void **)(v49 + 32);
    v58[0] = v17;
    v58[1] = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObjectsFromArray:", v41);

    v4 = v52;
  }

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

void __36__BRCZoneHealthReportOperation_main__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_230455000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: report.state != BRCZoneHealthStateHealthy%@", (uint8_t *)&v2, 0xCu);
}

@end
