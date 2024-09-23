@implementation BRCPeriodicSyncOperation

- (BRCPeriodicSyncOperation)initWithContainerScheduler:(id)a3 metadataChangeToken:(id)a4 zoneHealthChangeToken:(id)a5 sideCarChangeToken:(id)a6 sessionContext:(id)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BRCPeriodicSyncOperation *v18;
  id v20;
  id v21;
  id v22;
  objc_super v23;

  v13 = a3;
  v22 = a4;
  v21 = a5;
  v20 = a6;
  v14 = a7;
  objc_msgSend(v13, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "syncContextProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "defaultSyncContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23.receiver = self;
  v23.super_class = (Class)BRCPeriodicSyncOperation;
  v18 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v23, sel_initWithName_syncContext_sessionContext_, CFSTR("sync-down/periodic-sync"), v17, v14);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_scheduler, a3);
    objc_storeStrong((id *)&v18->_metadataChangeToken, a4);
    objc_storeStrong((id *)&v18->_zoneHealthChangeToken, a5);
    objc_storeStrong((id *)&v18->_sideCarChangeToken, a6);
    -[BRCPeriodicSyncOperation setQualityOfService:](v18, "setQualityOfService:", 9);
  }

  return v18;
}

- (id)createActivity
{
  return _os_activity_create(&dword_230455000, "sync-down/periodic-sync", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldRetryForError:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRCPeriodicSyncOperation;
  return -[_BRCOperation shouldRetryForError:](&v4, sel_shouldRetryForError_, a3);
}

- (BOOL)scheduleSyncDownIfNeededForZoneID:(id)a3 zoneIfAny:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  CKServerChangeToken *metadataChangeToken;
  void *v13;
  CKServerChangeToken *v14;
  CKServerChangeToken *v15;
  CKServerChangeToken *v16;
  char v17;
  CKServerChangeToken *zoneHealthChangeToken;
  void *v19;
  CKServerChangeToken *v20;
  CKServerChangeToken *v21;
  char v22;
  CKServerChangeToken *sideCarChangeToken;
  void *v24;
  CKServerChangeToken *v25;
  CKServerChangeToken *v26;
  char v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  BRCContainerScheduler *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  BRCContainerScheduler *scheduler;
  void *v44;
  NSObject *v45;
  BRCContainerScheduler *v46;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  char v59;
  uint64_t v60[3];
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[BRCContainerScheduler session](self->_scheduler, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v60, 0, sizeof(v60));
  __brc_create_section(0, (uint64_t)"-[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:]", 74, v60);
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v62 = v60[0];
    v63 = 2112;
    v64 = v9;
    v65 = 2112;
    v66 = v10;
    _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx considering whether or not to schedule sync down for %@%@", buf, 0x20u);
  }

  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE17540]))
  {
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE175C0]))
    {
      zoneHealthChangeToken = self->_zoneHealthChangeToken;
      objc_msgSend(v7, "currentServerChangeToken");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = zoneHealthChangeToken;
      v20 = v19;
      if (v14 != v20)
      {
        v21 = v20;
        if (v20)
        {
          v22 = -[CKServerChangeToken isEqual:](v14, "isEqual:", v20);

          if ((v22 & 1) != 0)
            goto LABEL_17;
        }
        else
        {

        }
        brc_bread_crumbs();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:].cold.2();

        scheduler = self->_scheduler;
        -[_BRCOperation group](self, "group");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCContainerScheduler scheduleSyncDownForZoneHealthWithGroup:](scheduler, "scheduleSyncDownForZoneHealthWithGroup:", v30);
        goto LABEL_41;
      }
      goto LABEL_18;
    }
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE17900]))
    {
      sideCarChangeToken = self->_sideCarChangeToken;
      objc_msgSend(v7, "currentServerChangeToken");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = sideCarChangeToken;
      v25 = v24;
      if (v14 != v25)
      {
        v26 = v25;
        if (v25)
        {
          v27 = -[CKServerChangeToken isEqual:](v14, "isEqual:", v25);

          if ((v27 & 1) != 0)
            goto LABEL_17;
        }
        else
        {

        }
        brc_bread_crumbs();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:].cold.3();

        v46 = self->_scheduler;
        -[_BRCOperation group](self, "group");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCContainerScheduler scheduleSyncDownForSideCarWithGroup:](v46, "scheduleSyncDownForSideCarWithGroup:", v30);
        goto LABEL_41;
      }
      goto LABEL_18;
    }
    objc_msgSend(v8, "privateServerZoneByID:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "clientZone");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
    {
      brc_bread_crumbs();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
        -[BRCAccountSessionFPFS serverZoneByRowID:].cold.2();

    }
    if (objc_msgSend(v29, "isSyncBlocked"))
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v30, "clientZone");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:].cold.5(v33, (uint64_t)v31, (uint64_t)buf);
      }
    }
    else
    {
      objc_msgSend(v30, "changeState");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "changeToken");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentServerChangeToken");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v37;
      v39 = v38;
      if (v32 != v39)
      {
        v40 = v39;
        if (v39)
        {
          v59 = -[NSObject isEqual:](v32, "isEqual:", v39);

          if ((v59 & 1) != 0)
          {
            v28 = 0;
            goto LABEL_51;
          }
        }
        else
        {

        }
        brc_bread_crumbs();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v30, "clientZone");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:].cold.6(v50, (uint64_t)v48, (uint64_t)buf);
        }

        objc_msgSend(v30, "clientZone");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[_BRCOperation group](self, "group");
        v32 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "scheduleSyncDownWithGroup:", v32);
        v28 = 1;
LABEL_50:

LABEL_51:
        if (!v7)
          goto LABEL_20;
        if ((objc_msgSend(v29, "enhancedDrivePrivacyEnabled") & 1) != 0)
          goto LABEL_20;
        objc_msgSend(v29, "mangledID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "supportsEnhancedDrivePrivacy");

        if (!v53)
          goto LABEL_20;
        objc_msgSend(v7, "requiredFeatures");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "recordFeatures");
        v14 = (CKServerChangeToken *)objc_claimAutoreleasedReturnValue();

        if (-[CKServerChangeToken hasValue:forName:](v14, "hasValue:forName:", *MEMORY[0x24BE17398], *MEMORY[0x24BE17390]))
        {
          brc_bread_crumbs();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          brc_notifications_log();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:].cold.4();

          objc_msgSend(v29, "setStateBits:", 0x400000);
        }
LABEL_19:

LABEL_20:
LABEL_42:

        goto LABEL_43;
      }

    }
    v28 = 0;
    goto LABEL_50;
  }
  metadataChangeToken = self->_metadataChangeToken;
  objc_msgSend(v7, "currentServerChangeToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = metadataChangeToken;
  v15 = v13;
  if (v14 == v15)
  {
LABEL_18:
    v28 = 0;
    v29 = v14;
    v30 = v14;
    goto LABEL_19;
  }
  v16 = v15;
  if (!v15)
  {

LABEL_26:
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[BRCPeriodicSyncOperation scheduleSyncDownIfNeededForZoneID:zoneIfAny:].cold.1();

    v36 = self->_scheduler;
    -[_BRCOperation group](self, "group");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCContainerScheduler scheduleSyncDownForContainerMetadataWithGroup:](v36, "scheduleSyncDownForContainerMetadataWithGroup:", v30);
LABEL_41:
    v28 = 1;
    goto LABEL_42;
  }
  v17 = -[CKServerChangeToken isEqual:](v14, "isEqual:", v15);

  if ((v17 & 1) == 0)
    goto LABEL_26;
LABEL_17:
  v28 = 0;
LABEL_43:
  __brc_leave_section(v60);

  return v28;
}

- (void)main
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: self.group%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

uint64_t __32__BRCPeriodicSyncOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "clientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isSyncBlocked") & 1) == 0
    && (objc_msgSend(v4, "syncState") & 3) == 0
    && objc_msgSend(v3, "hasFetchedRecentsAndFavorites"))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "zoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  return 1;
}

void __32__BRCPeriodicSyncOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21[3];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  memset(v21, 0, sizeof(v21));
  v7 = *(void **)(a1 + 32);
  if (v7)
    objc_msgSend(v7, "logSections");
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v23 = v21[0];
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v8;
    _os_log_debug_impl(&dword_230455000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx completed fetching changed zone\nzones: %@%@", buf, 0x20u);
  }

  +[BRCEventsAnalytics sharedAnalytics](BRCEventsAnalytics, "sharedAnalytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (!v6)
    {
      brc_bread_crumbs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        __32__BRCPeriodicSyncOperation_main__block_invoke_2_cold_2();

      objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", *MEMORY[0x24BE17430], 15, CFSTR("unreachable: No error found"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      __32__BRCPeriodicSyncOperation_main__block_invoke_2_cold_1();
    goto LABEL_18;
  }
  if (v6 && (objc_msgSend(v6, "brc_containsCloudKitErrorCode:", 2) & 1) == 0)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      __32__BRCPeriodicSyncOperation_main__block_invoke_2_cold_1();
LABEL_18:

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v6);
    objc_msgSend(v10, "registerAndSendNewPeriodicSyncWithOutcome:", CFSTR("failed"));
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 40), "clientTruthWorkloop");
  v11 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __32__BRCPeriodicSyncOperation_main__block_invoke_16;
  v16[3] = &unk_24FE47B48;
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v10;
  v18 = v5;
  v6 = v6;
  v19 = v6;
  v20 = *(id *)(a1 + 40);
  dispatch_async(v11, v16);

LABEL_19:
  __brc_leave_section(v21);

}

void __32__BRCPeriodicSyncOperation_main__block_invoke_16(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  int *v15;
  uint64_t v16;
  int v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 40), "registerAndSendNewPeriodicSyncWithOutcome:", CFSTR("cancelled"));
  }
  else
  {
    v14 = 0;
    v15 = (int *)&v14;
    v16 = 0x2020000000;
    v17 = 0;
    v2 = *(void **)(a1 + 48);
    v3 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __32__BRCPeriodicSyncOperation_main__block_invoke_2_19;
    v13[3] = &unk_24FE49018;
    v13[4] = *(_QWORD *)(a1 + 32);
    v13[5] = &v14;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v13);
    objc_msgSend(*(id *)(a1 + 56), "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDB8EE8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __32__BRCPeriodicSyncOperation_main__block_invoke_3;
    v12[3] = &unk_24FE49040;
    v12[4] = *(_QWORD *)(a1 + 32);
    v12[5] = &v14;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);
    if (v15[6] <= 0)
      v6 = CFSTR("useless");
    else
      v6 = CFSTR("useful");
    objc_msgSend(*(id *)(a1 + 40), "registerAndSendNewPeriodicSyncWithOutcome:", v6);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v15[6] <= 0)
        v9 = "useless";
      else
        v9 = "useful";
      *(_DWORD *)buf = 136315394;
      v19 = v9;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_230455000, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] scheduled a %s periodic sync%@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 64), "analyticsReporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[AppTelemetryTimeSeriesEvent newMissingPushEventWithNumberOutOfSync:](AppTelemetryTimeSeriesEvent, "newMissingPushEventWithNumberOutOfSync:", v15[6]);
    objc_msgSend(v10, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v11);

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, 0);
    _Block_object_dispose(&v14, 8);
  }
}

uint64_t __32__BRCPeriodicSyncOperation_main__block_invoke_2_19(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "scheduleSyncDownIfNeededForZoneID:zoneIfAny:", a2, a3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

void __32__BRCPeriodicSyncOperation_main__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "scheduleSyncDownIfNeededForZoneID:zoneIfAny:", v3, 0);

}

- (BRCContainerScheduler)scheduler
{
  return self->_scheduler;
}

- (CKServerChangeToken)metadataChangeToken
{
  return self->_metadataChangeToken;
}

- (CKServerChangeToken)zoneHealthChangeToken
{
  return self->_zoneHealthChangeToken;
}

- (CKServerChangeToken)sideCarChangeToken
{
  return self->_sideCarChangeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sideCarChangeToken, 0);
  objc_storeStrong((id *)&self->_zoneHealthChangeToken, 0);
  objc_storeStrong((id *)&self->_metadataChangeToken, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

- (void)scheduleSyncDownIfNeededForZoneID:zoneIfAny:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] container-metadata appears to be out of sync in the periodic check, forcing sync%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)scheduleSyncDownIfNeededForZoneID:zoneIfAny:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] zone health appears to be out of sync in the periodic check, forcing sync%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)scheduleSyncDownIfNeededForZoneID:zoneIfAny:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] side-car appears to be out of sync in the periodic check, forcing sync%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)scheduleSyncDownIfNeededForZoneID:zoneIfAny:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_230455000, v0, (uint64_t)v0, "[NOTIF] Enhanced Drive Privacy enablement detected via periodic sync for %@%@", v1);
  OUTLINED_FUNCTION_0();
}

- (void)scheduleSyncDownIfNeededForZoneID:(uint64_t)a3 zoneIfAny:.cold.5(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_230455000, v6, v4, "[DEBUG] Not considering %@ for periodic sync because it is blocked from sync%@", v5);

}

- (void)scheduleSyncDownIfNeededForZoneID:(uint64_t)a3 zoneIfAny:.cold.6(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_230455000, v6, v4, "[DEBUG] %@ appears to be out of sync in the periodic check, forcing sync%@", v5);

}

void __32__BRCPeriodicSyncOperation_main__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] can't fetch all changed zones: %@%@");
  OUTLINED_FUNCTION_0();
}

void __32__BRCPeriodicSyncOperation_main__block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: No error found%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end
