@implementation BRCSyncDownOperation

- (id)initDeltaSyncWithServerZone:(id)a3 sessionContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BRCSyncDownOperation *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("sync-down/"), "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ownerName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDB8E88]);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v7, "ownerName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(":%@"), v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  objc_msgSend(v7, "metadataSyncContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)BRCSyncDownOperation;
  v16 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v20, sel_initWithName_syncContext_sessionContext_, v10, v15, v8);

  if (v16)
  {
    -[BRCSyncDownOperation setQueuePriority:](v16, "setQueuePriority:", 4);
    objc_storeStrong((id *)&v16->_serverZone, a3);
    -[BRCServerZone clientZone](v16->_serverZone, "clientZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "hasHighPriorityWatchers"))
      -[_BRCOperation setNonDiscretionary:](v16, "setNonDiscretionary:", 1);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLastAttemptedSyncDownDate:", v18);

  }
  return v16;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sync-down", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)_performAfterFetchingRecordChanges:(id)a3
{
  BRCServerZone *v4;
  BRCPendingChangesStream *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  dispatch_group_t v32;
  void *v33;
  BRCServerZone *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  BRCServerZone *v43;
  id v44;
  id *v45;
  id *v46;
  void *v47;
  void *v48;
  void (**v49)(id, _QWORD, void *);
  _QWORD v50[4];
  NSObject *v51;
  BRCServerZone *v52;
  id v53;
  BRCSyncDownOperation *v54;
  void (**v55)(id, _QWORD, void *);
  _BYTE *v56;
  id v57;
  __int128 v58;
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  NSObject *v63;
  id v64;
  id v65;
  id v66;
  __int128 v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  BRCSyncDownOperation *v71;
  _BYTE *v72;
  id v73;
  __int128 v74;
  uint64_t v75;
  _QWORD v76[4];
  id v77;
  id v78;
  __int128 v79;
  uint64_t v80;
  _QWORD v81[4];
  BRCServerZone *v82;
  id v83;
  id v84;
  __int128 v85;
  uint64_t v86;
  _QWORD v87[4];
  BRCServerZone *v88;
  __int128 location;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  _QWORD v93[6];
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  void *v106;
  void *v107;
  void *v108;
  _BYTE buf[24];
  uint64_t (*v110)(uint64_t, uint64_t);
  _BYTE v111[20];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v49 = (void (**)(id, _QWORD, void *))a3;
  v4 = self->_serverZone;
  v100 = 0;
  v101 = &v100;
  v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__50;
  v104 = __Block_byref_object_dispose__50;
  v105 = 0;
  v5 = -[BRCPendingChangesStream initWithServerZone:]([BRCPendingChangesStream alloc], "initWithServerZone:", v4);
  -[BRCPendingChangesStream lastError](v5, "lastError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BRCPendingChangesStream lastError](v5, "lastError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2](v49, 0, v7);

  }
  else
  {
    v94 = 0;
    v95 = &v94;
    v96 = 0x3032000000;
    v97 = __Block_byref_object_copy__50;
    v98 = __Block_byref_object_dispose__50;
    v99 = 0;
    v93[0] = MEMORY[0x24BDAC760];
    v93[1] = 3221225472;
    v93[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke;
    v93[3] = &unk_24FE497C8;
    v93[4] = &v100;
    v93[5] = &v94;
    -[BRCPendingChangesStream fetchTokenState:](v5, "fetchTokenState:", v93);
    if (!v101[5])
    {
      -[BRCServerZone changeState](v4, "changeState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "changeToken");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v101[5];
      v101[5] = v9;

    }
    -[BRCServerZone mangledID](v4, "mangledID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v11);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    location = 0uLL;
    v90 = 0;
    __brc_create_section(1, (uint64_t)"-[BRCSyncDownOperation _performAfterFetchingRecordChanges:]", 97, &location);
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = location;
      if (v95[5])
        v15 = CFSTR("starting");
      else
        v15 = CFSTR("continuing");
      -[BRCServerZone mangledID](v4, "mangledID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "aliasTargetContainerString");
      v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v101[5], "descriptionWithContext:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v110 = v17;
      *(_WORD *)v111 = 2112;
      *(_QWORD *)&v111[2] = v18;
      *(_WORD *)&v111[10] = 2112;
      *(_QWORD *)&v111[12] = v12;
      _os_log_impl(&dword_230455000, v13, OS_LOG_TYPE_INFO, "[INFO] ┣%llx %@ fetch record changes operation for %@ from token %@%@", buf, 0x34u);

    }
    v91 = location;
    v92 = v90;
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setPreviousServerChangeToken:", v101[5]);
    objc_msgSend(v19, "setResultsLimit:", objc_msgSend(v48, "maxRecordCountInFetchRecordsOperation"));
    objc_msgSend(MEMORY[0x24BDB91D8], "desiredKeysWithMask:", 185);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDesiredKeys:", v20);
    v47 = v19;

    v21 = objc_alloc(MEMORY[0x24BDB90C8]);
    -[BRCServerZone zoneID](v4, "zoneID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v108, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCServerZone zoneID](v4, "zoneID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v24;
    v107 = v47;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v21, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v23, v25);

    objc_msgSend(v26, "setShouldFetchAssetContents:", 0);
    if (-[BRCServerZone isSharedZone](v4, "isSharedZone"))
      v27 = 0;
    else
      v27 = objc_msgSend(v48, "shouldFetchAllChanges");
    objc_msgSend(v26, "setFetchAllChanges:", v27);
    objc_msgSend(v26, "setShouldReportAllPerItemFailures:", objc_msgSend(v48, "shouldReportAllPerItemFailures"));
    -[BRCServerZone mangledID](v4, "mangledID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "supportsEnhancedDrivePrivacy");

    if (v30)
    {
      v87[0] = MEMORY[0x24BDAC760];
      v87[1] = 3221225472;
      v87[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_15;
      v87[3] = &unk_24FE497F0;
      v88 = v4;
      objc_msgSend(v26, "setZoneAttributesChangedBlock:", v87);

    }
    v31 = -[BRCFetchRecordSubResourcesOperation initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:]([BRCFetchRecordSubResourcesOperation alloc], "initAndScheduleWithServerZone:parentOperation:pendingChangesStream:contentRecordsFetchedInline:sessionContext:", self->_serverZone, self, v5, 1, self->super._sessionContext);
    v32 = dispatch_group_create();
    objc_msgSend(v31, "callbackQueue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCallbackQueue:", v33);

    objc_initWeak((id *)&location, v26);
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_20;
    v81[3] = &unk_24FE49818;
    v45 = &v84;
    objc_copyWeak(&v84, (id *)&location);
    v85 = v91;
    v86 = v92;
    v34 = v4;
    v82 = v34;
    v35 = v31;
    v83 = v35;
    objc_msgSend(v26, "setPerRecordChangeCompletionBlock:", v81);
    v76[0] = MEMORY[0x24BDAC760];
    v76[1] = 3221225472;
    v76[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_22;
    v76[3] = &unk_24FE40ED0;
    v46 = &v78;
    objc_copyWeak(&v78, (id *)&location);
    v79 = v91;
    v80 = v92;
    v36 = v35;
    v77 = v36;
    objc_msgSend(v26, "setRecordWithIDWasDeletedBlock:", v76);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v110 = __Block_byref_object_copy__50;
    *(_QWORD *)v111 = __Block_byref_object_dispose__50;
    *(_QWORD *)&v111[8] = 0;
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_24;
    v69[3] = &unk_24FE49840;
    objc_copyWeak(&v73, (id *)&location);
    v74 = v91;
    v75 = v92;
    v37 = v36;
    v71 = self;
    v72 = buf;
    v70 = v37;
    v38 = (void *)MEMORY[0x2348BA0DC](v69);
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_29;
    v62[3] = &unk_24FE49890;
    objc_copyWeak(&v66, (id *)&location);
    v67 = v91;
    v68 = v92;
    v39 = v38;
    v65 = v39;
    v40 = v32;
    v63 = v40;
    v41 = v37;
    v64 = v41;
    objc_msgSend(v26, "setRecordZoneFetchCompletionBlock:", v62);
    if (objc_msgSend(v26, "fetchAllChanges"))
    {
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2_32;
      v60[3] = &unk_24FE498B8;
      v61 = v39;
      objc_msgSend(v26, "setRecordZoneChangeTokensUpdatedBlock:", v60, &v84, &v78);

    }
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_3;
    v50[3] = &unk_24FE49908;
    objc_copyWeak(&v57, (id *)&location);
    v42 = v40;
    v51 = v42;
    v43 = v34;
    v58 = v91;
    v59 = v92;
    v52 = v43;
    v56 = buf;
    v44 = v41;
    v53 = v44;
    v54 = self;
    v55 = v49;
    objc_msgSend(v26, "setFetchRecordZoneChangesCompletionBlock:", v50);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v26);

    objc_destroyWeak(&v57);
    objc_destroyWeak(&v66);

    objc_destroyWeak(&v73);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(v46);
    objc_destroyWeak(v45);
    objc_destroyWeak((id *)&location);

    _Block_object_dispose(&v94, 8);
  }

  _Block_object_dispose(&v100, 8);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;
  v12 = v6;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;

}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "requiredFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hasValue:forName:", *MEMORY[0x24BE17398], *MEMORY[0x24BE17390]))
  {
    objc_msgSend(*(id *)(a1 + 32), "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientTruthWorkloop");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2;
    v9[3] = &unk_24FE3FA40;
    v10 = v3;
    v11 = v6;
    v8 = v6;
    dispatch_async(v7, v9);

  }
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v2 = objc_alloc(MEMORY[0x24BE17640]);
  objc_msgSend(*(id *)(a1 + 32), "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithRecordZoneID:", v3);

  objc_msgSend(*(id *)(a1 + 40), "clientZoneByMangledID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "enhancedDrivePrivacyEnabled") & 1) == 0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_notifications_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2_cold_1();

    objc_msgSend(v5, "setStateBits:", 0x400000);
  }

}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_20(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7;
  uint64_t v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  uint64_t v27;
  _BYTE v28[32];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v26 = *(_OWORD *)(a1 + 56);
  v27 = *(_QWORD *)(a1 + 72);
  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "operationID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v30 = v26;
    v31 = 2112;
    v32 = v13;
    v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_230455000, v12, OS_LOG_TYPE_INFO, "[INFO] ┳%llx got a record in operation %@%@", buf, 0x20u);

  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)v7, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_20_cold_3(v16, (uint64_t)v14, (uint64_t)v28, v15);
  }

  if (!(v7 | v8))
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_20_cold_2();
    v8 = 0;
    goto LABEL_12;
  }
  if (!v8)
  {
    objc_msgSend((id)v7, "recordID");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_18;
LABEL_14:
    objc_msgSend((id)v7, "etag", v26, v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (v20)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_20_cold_1();

    }
    goto LABEL_18;
  }
  if (v7)
    goto LABEL_14;
LABEL_18:
  if (objc_msgSend(v9, "brc_isCloudKitPCSDecryptionFailure", (_QWORD)v26)
    && objc_msgSend(*(id *)(a1 + 32), "isPrivateZone"))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientZone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "asPrivateClientZone");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "recordName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "reportProblemWithType:recordName:", 12, v25);

  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addRecord:", v7);
    goto LABEL_23;
  }
  brc_bread_crumbs();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v8;
    v31 = 2112;
    v32 = v9;
    v33 = 2112;
    v34 = v17;
    _os_log_impl(&dword_230455000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Record fetch failed for %@ with error %@%@", buf, 0x20u);
  }
LABEL_12:

LABEL_23:
  __brc_leave_section((uint64_t *)&v26);

}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v15 = *(_OWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 64);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "operationID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v18 = (id)v15;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v8;
    _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx got a deletion in operation %@%@", buf, 0x20u);

  }
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_INFO, "[INFO] record was deleted: %@%@", buf, 0x16u);
  }

  v12 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB8F28]);
  v13 = *(void **)(a1 + 32);
  if (v12)
    objc_msgSend(v13, "shareIDWasDeleted:", v5);
  else
    objc_msgSend(v13, "recordIDWasDeleted:", v5);
  __brc_leave_section((uint64_t *)&v15);

}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_24(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "recordZoneChangesStatusByZoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongValue");

  v34 = *(_OWORD *)(a1 + 64);
  v35 = *(_QWORD *)(a1 + 80);
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "descriptionWithContext:", 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "operationID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v37 = (void *)v34;
    v38 = 2112;
    v39 = v22;
    v40 = 2112;
    v41 = v9;
    v42 = 2112;
    v43 = v23;
    v44 = 2048;
    v45 = v13;
    v46 = 2112;
    v47 = v14;
    _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx received updated server change token %@ client change token %@ in operation %@ status %ld%@", buf, 0x3Eu);

  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

LABEL_6:
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "error");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
    objc_msgSend(WeakRetained, "cancel");
    goto LABEL_9;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    goto LABEL_6;
  v20 = (uint64_t *)objc_msgSend(objc_retainAutorelease(v9), "bytes");
  if (v20)
    v21 = *v20;
  else
    v21 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "saveRecordsWithServerChangeToken:clientChangeToken:syncStatus:", v8, v21, v13) & 1) == 0)
  {
    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(WeakRetained, "operationID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "descriptionWithContext:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v32;
      v38 = 2112;
      v39 = v33;
      v40 = 2112;
      v41 = v24;
      _os_log_fault_impl(&dword_230455000, v25, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: broken structure in op %@ change token %@%@", buf, 0x20u);

    }
    v26 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(WeakRetained, "operationID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptionWithContext:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: broken structure in op %@ change token %@"), v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

    objc_msgSend(*(id *)(a1 + 40), "cancel");
  }
LABEL_9:
  __brc_leave_section((uint64_t *)&v34);

}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_29(uint64_t a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v26 = *(_OWORD *)(a1 + 64);
  v27 = *(_QWORD *)(a1 + 80);
  brc_bread_crumbs();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "operationID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v29 = v26;
    v30 = 2112;
    v31 = v19;
    v32 = 2112;
    v33 = v16;
    _os_log_debug_impl(&dword_230455000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx fetch changes completion for zone in operation %@%@", buf, 0x20u);

  }
  if (!v14)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_30;
    v20[3] = &unk_24FE49868;
    v18 = *(void **)(a1 + 40);
    v25 = *(id *)(a1 + 48);
    v21 = v11;
    v22 = v12;
    v23 = v13;
    v24 = *(id *)(a1 + 32);
    objc_msgSend(v18, "notifyWhenCaughtUp:whenRecordsAreFetchedAndFinish:", a5 ^ 1u, v20);

  }
  __brc_leave_section((uint64_t *)&v26);

}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_30(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2_32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v5 = *(NSObject **)(a1 + 32);
  objc_msgSend(WeakRetained, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4;
  v13[3] = &unk_24FE498E0;
  v14 = *(id *)(a1 + 40);
  v15 = v3;
  v21 = *(_OWORD *)(a1 + 88);
  v22 = *(_QWORD *)(a1 + 104);
  v7 = *(_QWORD *)(a1 + 72);
  v16 = WeakRetained;
  v20 = v7;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(void **)(a1 + 64);
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = WeakRetained;
  v12 = v3;
  dispatch_group_notify(v5, v6, v13);

}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "zoneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "brc_cloudKitErrorForZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_OWORD *)(a1 + 88);
  v19 = *(_QWORD *)(a1 + 104);
  brc_bread_crumbs();
  v4 = objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 48), "operationID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v21 = (void *)v18;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v4;
    _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx fetch changes completed for operation %@%@", buf, 0x20u);

  }
  if (v3)
  {
    if ((objc_msgSend(v3, "brc_isCloudKitCancellationError") & 1) == 0)
      goto LABEL_9;
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (!v6)
      goto LABEL_9;
LABEL_8:
    v7 = v6;

    v3 = v7;
    goto LABEL_9;
  }
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (v6)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 56), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4_cold_1();
    v3 = 0;
    goto LABEL_21;
  }
LABEL_9:
  if (objc_msgSend(*(id *)(a1 + 56), "isExecuting"))
    objc_msgSend(*(id *)(a1 + 56), "cancel");
  if (!objc_msgSend(*(id *)(a1 + 64), "handleZoneNotFoundIfSyncingDownForTheFirstTime:", v3))
  {
    if ((objc_msgSend(v3, "brc_isCloudKitCancellationError") & 1) != 0)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4_cold_2();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "ownerName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB8E88]);

      if ((v11 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "ownerName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(":%@"), v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v13;
      }
      brc_bread_crumbs();
      v9 = objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v21 = v8;
        v22 = 2112;
        v23 = v3;
        v24 = 2112;
        v25 = v9;
        _os_log_error_impl(&dword_230455000, v14, (os_log_type_t)0x90u, "[ERROR] sync-down failed for %@: %@%@", buf, 0x20u);
      }

    }
LABEL_21:

    objc_msgSend(*(id *)(a1 + 48), "recordZoneChangesStatusByZoneID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unsignedLongValue");

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_22;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_22:
  __brc_leave_section((uint64_t *)&v18);

}

- (BOOL)handleZoneNotFoundIfSyncingDownForTheFirstTime:(id)a3
{
  id v4;
  BRCServerZone *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v13;
  _QWORD v14[4];
  BRCServerZone *v15;
  uint64_t v16;

  v4 = a3;
  v5 = self->_serverZone;
  if (-[BRCServerZone hasFetchedServerZoneState](v5, "hasFetchedServerZoneState")
    || !objc_msgSend(v4, "brc_isCloudKitErrorImplyingZoneNeedsCreation"))
  {
    v11 = 0;
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[BRCSyncDownOperation handleZoneNotFoundIfSyncingDownForTheFirstTime:].cold.1();

    LOBYTE(v13) = 0;
    v8 = -[BRCServerZone didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:](v5, "didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:", 0, 0, 0, 0, 0, 0, v13, 0);
    -[BRCServerZone clientZone](v5, "clientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "db");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __71__BRCSyncDownOperation_handleZoneNotFoundIfSyncingDownForTheFirstTime___block_invoke;
    v14[3] = &unk_24FE42810;
    v15 = v5;
    v16 = v8;
    objc_msgSend(v10, "performWithFlags:action:", 41, v14);

    v11 = 1;
  }

  return v11;
}

uint64_t __71__BRCSyncDownOperation_handleZoneNotFoundIfSyncingDownForTheFirstTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applyScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didSyncDownZone:requestID:upToRank:caughtUpWithServer:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), 1);

  return 1;
}

- (void)_startSyncDown
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __38__BRCSyncDownOperation__startSyncDown__block_invoke;
  v2[3] = &unk_24FE49930;
  v2[4] = self;
  -[BRCSyncDownOperation _performAfterFetchingRecordChanges:](self, "_performAfterFetchingRecordChanges:", v2);
}

void __38__BRCSyncDownOperation__startSyncDown__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completedWithResult:error:", v7, v6);

}

- (void)_saveInitialServerZoneData:(id)a3 clientChangeTokenData:(id)a4
{
  BRCServerZone *v6;
  BRCServerZone *v7;
  void *v8;
  NSObject *v9;
  BRCServerZone *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BRCServerZone *serverZone;
  BRCServerZone *v18;
  uint64_t v19;
  _QWORD v20[6];
  uint8_t buf[4];
  BRCServerZone *v22;
  __int16 v23;
  BRCServerZone *v24;
  __int16 v25;
  BRCServerZone *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (BRCServerZone *)a3;
  v7 = (BRCServerZone *)a4;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    serverZone = self->_serverZone;
    *(_DWORD *)buf = 138413058;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = serverZone;
    v27 = 2112;
    v28 = v8;
    _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetched initial server zone tokens %@ and %@ for %@%@", buf, 0x2Au);
  }

  v10 = objc_retainAutorelease(v7);
  v11 = (uint64_t *)-[BRCServerZone bytes](v10, "bytes");
  if (v11)
    v12 = *v11;
  else
    v12 = 0;
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v18 = self->_serverZone;
    *(_DWORD *)buf = 138413058;
    v22 = v18;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v13;
    _os_log_debug_impl(&dword_230455000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Saving initial zone data of %@ with server token %@ client token %@%@", buf, 0x2Au);
  }

  LOBYTE(v19) = 0;
  -[BRCServerZone didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:](self->_serverZone, "didSyncDownRequestID:serverChangeToken:editedRecords:deletedRecordIDs:deletedShareRecordIDs:allocRankZones:caughtUp:pendingChanges:", v12, v6, 0, 0, 0, 0, v19, 0);
  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "db");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __73__BRCSyncDownOperation__saveInitialServerZoneData_clientChangeTokenData___block_invoke;
  v20[3] = &unk_24FE42810;
  v20[4] = self;
  v20[5] = v12;
  objc_msgSend(v16, "performWithFlags:action:", 41, v20);

  -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", &unk_24FEB3B90, 0);
}

uint64_t __73__BRCSyncDownOperation__saveInitialServerZoneData_clientChangeTokenData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "clientZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "changeState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastSyncDownDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:", v3, 0, 1, v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "clientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v6, "isPrivateZone");

  if ((_DWORD)v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "clientZone", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asPrivateClientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appLibraries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "fetchPristineness");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  return 1;
}

- (void)_fetchInitialZoneIfNecessaryWithCreatedZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "currentServerChangeToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientChangeToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCSyncDownOperation _saveInitialServerZoneData:clientChangeTokenData:](self, "_saveInitialServerZoneData:clientChangeTokenData:", v6, v7);

  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDB90E0]);
    -[BRCServerZone zoneID](self->_serverZone, "zoneID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v8, "initWithRecordZoneIDs:", v10);

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__BRCSyncDownOperation__fetchInitialZoneIfNecessaryWithCreatedZone___block_invoke;
    v11[3] = &unk_24FE417B8;
    v11[4] = self;
    objc_msgSend(v6, "setFetchRecordZonesCompletionBlock:", v11);
    -[_BRCOperation addSubOperation:](self, "addSubOperation:", v6);
  }

}

void __68__BRCSyncDownOperation__fetchInitialZoneIfNecessaryWithCreatedZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 504);
  v7 = a2;
  objc_msgSend(v6, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (!(v5 | v9))
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      __68__BRCSyncDownOperation__fetchInitialZoneIfNecessaryWithCreatedZone___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: no fetched zone and no error"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v12 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v12, "completedWithResult:error:", 0, v5);
  }
  else
  {
    objc_msgSend((id)v9, "currentServerChangeToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "clientChangeToken");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_saveInitialServerZoneData:clientChangeTokenData:", v13, v14);

  }
}

- (void)_startCreateZoneAndSubscriptionAndSyncDown
{
  BRCServerZone *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BRCCreateZoneAndSubscribeOperation *v12;
  void *v13;
  int v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id from;
  id location;
  _QWORD block[4];
  BRCServerZone *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v3 = self->_serverZone;
  -[BRCServerZone changeState](self->_serverZone, "changeState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasNeverSyncedDown");

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  if (!v5
    || -[BRCServerZone isSharedZone](self->_serverZone, "isSharedZone")
    || (-[BRCServerZone state](self->_serverZone, "state") & 4) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[BRCServerZone mangledID](self->_serverZone, "mangledID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "forceDeltaInitialSync");

  }
  v26 = v8;
  if (*((_BYTE *)v24 + 24))
  {
    if (!v5)
    {
LABEL_11:
      if (*((_BYTE *)v24 + 24))
        -[BRCSyncDownOperation _startSyncDown](self, "_startSyncDown");
      else
        -[BRCSyncDownOperation _fetchInitialZoneIfNecessaryWithCreatedZone:](self, "_fetchInitialZoneIfNecessaryWithCreatedZone:", 0);
      goto LABEL_18;
    }
  }
  else
  {
    -[BRCServerZone clientZone](self->_serverZone, "clientZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "db");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serialQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke;
    block[3] = &unk_24FE429C0;
    v22 = &v23;
    v21 = v3;
    dispatch_sync(v11, block);

    if (!v5)
      goto LABEL_11;
  }
  if (-[BRCServerZone isSharedZone](self->_serverZone, "isSharedZone"))
    goto LABEL_11;
  objc_initWeak(&location, self);
  v12 = -[BRCCreateZoneAndSubscribeOperation initWithServerZone:sessionContext:]([BRCCreateZoneAndSubscribeOperation alloc], "initWithServerZone:sessionContext:", v3, self->super._sessionContext);
  -[BRCServerZone clientZone](v3, "clientZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCloudDocsZone");

  if (v14)
  {
    -[BRCCreateZoneAndSubscribeOperation setSubscriptionOnly:](v12, "setSubscriptionOnly:", 0);
    -[BRCCreateZoneAndSubscribeOperation setOptimisticSubscribe:](v12, "setOptimisticSubscribe:", 1);
  }
  else
  {
    -[BRCCreateZoneAndSubscribeOperation setSubscriptionOnly:](v12, "setSubscriptionOnly:", 1);
  }
  objc_initWeak(&from, v12);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2;
  v15[3] = &unk_24FE49958;
  objc_copyWeak(&v16, &location);
  v15[4] = &v23;
  objc_copyWeak(&v17, &from);
  -[BRCCreateZoneAndSubscribeOperation setCreateZoneAndSubscribeCompletionBlock:](v12, "setCreateZoneAndSubscribeCompletionBlock:", v15);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v12);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
LABEL_18:
  _Block_object_dispose(&v23, 8);

}

void __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "clientZone");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "hasItemsWithInFlightDiffs");

}

void __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    if (objc_msgSend(v3, "brc_isCloudKitCancellationError"))
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2_cold_1();
    }
    else
    {
      if (objc_msgSend(v5, "handleZoneNotFoundIfSyncingDownForTheFirstTime:", v3))
      {
        v8 = &unk_24FEB3BA8;
        v9 = v5;
        v10 = 0;
LABEL_12:
        objc_msgSend(v9, "completedWithResult:error:", v8, v10);
        goto LABEL_13;
      }
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
        __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2_cold_2();
    }

    v9 = v5;
    v8 = 0;
    v10 = v3;
    goto LABEL_12;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(WeakRetained, "_startSyncDown");
  }
  else
  {
    v11 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v11, "createdZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_fetchInitialZoneIfNecessaryWithCreatedZone:", v12);

  }
LABEL_13:

}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = 0;
  else
    v8 = objc_msgSend(v6, "integerValue");
  -[BRCServerZone clientZone](self->_serverZone, "clientZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncDownOperation:didFinishWithError:status:", self, v7, v8);

  -[BRCSyncDownOperation hash](self, "hash");
  kdebug_trace();
  v10.receiver = self;
  v10.super_class = (Class)BRCSyncDownOperation;
  -[_BRCOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, 0, v7);

}

- (void)main
{
  BRCServerZone *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
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
  v3 = self->_serverZone;
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRCSyncDownOperation main]", 488, v9);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = v9[0];
    -[BRCServerZone mangledID](v3, "mangledID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aliasTargetContainerString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v11 = v6;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_debug_impl(&dword_230455000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Sync: fetching record changes for %@%@", buf, 0x20u);

  }
  -[BRCSyncDownOperation hash](self, "hash");
  kdebug_trace();
  -[BRCSyncDownOperation _startCreateZoneAndSubscriptionAndSyncDown](self, "_startCreateZoneAndSubscriptionAndSyncDown");
  __brc_leave_section(v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverZone, 0);
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, (uint64_t)v0, "[NOTIF] Enhanced Drive Privacy enablement discovered via delta sync for %@%@", v1);
  OUTLINED_FUNCTION_0();
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: !record || record.etag != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_20_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: got a nil record and recordID%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_20_cold_3(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3(&dword_230455000, a4, a3, "[DEBUG] record changed: %@%@", (uint8_t *)a3);

}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] success%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __59__BRCSyncDownOperation__performAfterFetchingRecordChanges___block_invoke_4_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] cancelled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)handleZoneNotFoundIfSyncingDownForTheFirstTime:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] ignoring zone not found error, because we're syncing down for the first time%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __68__BRCSyncDownOperation__fetchInitialZoneIfNecessaryWithCreatedZone___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: no fetched zone and no error%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, (uint64_t)v0, "[DEBUG] can't register pushes: %@%@", v1);
  OUTLINED_FUNCTION_0();
}

void __66__BRCSyncDownOperation__startCreateZoneAndSubscriptionAndSyncDown__block_invoke_2_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_230455000, v0, (os_log_type_t)0x90u, "[ERROR] can't create zone or register pushes: %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end
