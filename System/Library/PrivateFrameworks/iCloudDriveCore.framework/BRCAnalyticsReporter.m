@implementation BRCAnalyticsReporter

- (BRCAnalyticsReporter)initWithSession:(id)a3
{
  id v5;
  BRCAnalyticsReporter *v6;
  BRCAnalyticsReporter *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *waitOnIdleQueue;
  uint64_t v16;
  NSMutableDictionary *eventsByKind;
  BRCSyncHealthReport *v18;
  BRCSyncHealthReport *syncHealthReport;
  BRCCKMetricEndpoint *v20;
  BRCMetricEndpoint *metricEndpoint;
  BRCRTCReporter *v22;
  BRCRTCReporter *rtcReporter;
  BRCAppTelemetryConverter *v24;
  BRCAppTelemetryConverter *appTelemetryConvertor;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BRCAnalyticsReporter;
  v6 = -[BRCAnalyticsReporter init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("analytics-reporter", v9);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("wait-on-idle", v13);

    waitOnIdleQueue = v7->_waitOnIdleQueue;
    v7->_waitOnIdleQueue = (OS_dispatch_queue *)v14;

    v16 = objc_opt_new();
    eventsByKind = v7->_eventsByKind;
    v7->_eventsByKind = (NSMutableDictionary *)v16;

    v18 = objc_alloc_init(BRCSyncHealthReport);
    syncHealthReport = v7->_syncHealthReport;
    v7->_syncHealthReport = v18;

    v20 = -[BRCCKMetricEndpoint initWithSession:]([BRCCKMetricEndpoint alloc], "initWithSession:", v5);
    metricEndpoint = v7->_metricEndpoint;
    v7->_metricEndpoint = &v20->super;

    v22 = objc_alloc_init(BRCRTCReporter);
    rtcReporter = v7->_rtcReporter;
    v7->_rtcReporter = v22;

    v24 = objc_alloc_init(BRCAppTelemetryConverter);
    appTelemetryConvertor = v7->_appTelemetryConvertor;
    v7->_appTelemetryConvertor = v24;

  }
  return v7;
}

- (void)close
{
  -[BRCRTCReporter close](self->_rtcReporter, "close");
}

- (void)registerBackgroundXPCActivities
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] iCloud Analytics collection is disabled, unregistering xpc_activity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  BOOL v4;
  id *v5;
  NSObject *v6;
  xpc_activity_state_t state;
  void *v8;
  NSObject *v9;
  id *WeakRetained;
  void *v11;
  _QWORD block[5];

  v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    v4 = xpc_activity_set_state(v3, 3);

    if (v4)
      return;
    brc_bread_crumbs();
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_1();
    goto LABEL_11;
  }
  state = xpc_activity_get_state(v3);

  if (state != 2)
    return;
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_2();

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "clientTruthWorkloop");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5[1], "clientTruthWorkloop");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_23;
      block[3] = &unk_24FE3FA18;
      block[4] = v5;
      dispatch_async_and_wait(v6, block);
LABEL_11:

    }
  }

}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_23(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BRCSyncHealthReport *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "accountHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acAccountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaIdentifierForACAccountID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("__defaultPersonaID__")))
    v6 = 0;
  else
    v6 = v5;
  v7 = v6;
  v8 = v5;
  if (!v7)
  {
    if (BRCEventKindUserDownload_block_invoke___personaOnceToken != -1)
      dispatch_once(&BRCEventKindUserDownload_block_invoke___personaOnceToken, &__block_literal_global_9);
    v8 = (id)BRCEventKindUserDownload_block_invoke___personalPersona;
  }
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentPersona");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0;
  objc_msgSend(v37, "userPersonaUniqueString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 == v8 || (objc_msgSend(v10, "isEqualToString:", v8) & 1) != 0)
  {
    v12 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v50 = 0;
    v28 = (void *)objc_msgSend(v37, "copyCurrentPersonaContextWithError:", &v50);
    v29 = v50;
    v30 = v51;
    v51 = v28;

    if (v29)
    {
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
        -[_BRCOperation completedWithResult:error:].cold.1();

    }
    objc_msgSend(v37, "generateAndRestorePersonaContextWithPersonaUniqueString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v56 = v5;
        v57 = 2112;
        v58 = v12;
        v59 = 2112;
        v60 = v33;
        _os_log_error_impl(&dword_230455000, v34, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_49:

    }
  }
  else
  {
    if (!v7 && (objc_msgSend(v37, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();
      v12 = 0;
      goto LABEL_49;
    }
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.2();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  v13 = objc_alloc_init(BRCSyncHealthReport);
  -[BRCSyncHealthReport generateReportWithSession:](v13, "generateReportWithSession:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  +[BRCCoreAnalyticsReporter uploadMetricsReport:](BRCCoreAnalyticsReporter, "uploadMetricsReport:", v13);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[BRCSyncHealthReport telemetryErrorEvents](v13, "telemetryErrorEvents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v47 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(a1 + 32), "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 7, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v15);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[BRCSyncHealthReport telemetryOtherEvents](v13, "telemetryOtherEvents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v43 != v20)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(a1 + 32), "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 7, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v19);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[BRCSyncHealthReport aggregatedEvents](v13, "aggregatedEvents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(a1 + 32), "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k));
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v23);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_sendFPFSImportStatusTelemetryEvent");
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 56);
  *(_QWORD *)(v26 + 56) = v13;

  _BRRestorePersona();
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BRCEventKindUserDownload_block_invoke___personalPersona;
  BRCEventKindUserDownload_block_invoke___personalPersona = v0;

}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_32(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id *WeakRetained;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!xpc_activity_should_defer(v3))
  {
    if (xpc_activity_get_state(v3) != 2)
      goto LABEL_27;
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_2();

    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    v4 = WeakRetained;
    if (!WeakRetained)
      goto LABEL_26;
    objc_msgSend(WeakRetained[1], "clientTruthWorkloop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
      goto LABEL_26;
    if (!xpc_activity_set_state(v3, 4))
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
        __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_32_cold_5();

    }
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[1], "accountHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "acAccountID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personaIdentifierForACAccountID:", v15);
    v5 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("__defaultPersonaID__")))
      v16 = 0;
    else
      v16 = v5;
    v17 = v16;
    v18 = v5;
    if (!v17)
    {
      if (BRCEventKindUserDownload_block_invoke_2___personaOnceToken != -1)
        dispatch_once(&BRCEventKindUserDownload_block_invoke_2___personaOnceToken, &__block_literal_global_34_0);
      v18 = (id)BRCEventKindUserDownload_block_invoke_2___personalPersona;
    }
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentPersona");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0;
    objc_msgSend(v20, "userPersonaUniqueString");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21 == v18 || (-[NSObject isEqualToString:](v21, "isEqualToString:", v18) & 1) != 0)
    {
      v23 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        v33 = 0;
        v24 = (void *)objc_msgSend(v20, "copyCurrentPersonaContextWithError:", &v33);
        v25 = v33;
        v26 = v34;
        v34 = v24;

        if (v25)
        {
          brc_bread_crumbs();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
            -[_BRCOperation completedWithResult:error:].cold.1();

        }
        objc_msgSend(v20, "generateAndRestorePersonaContextWithPersonaUniqueString:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          goto LABEL_24;
        brc_bread_crumbs();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          v36 = v5;
          v37 = 2112;
          v38 = v23;
          v39 = 2112;
          v40 = v29;
          _os_log_error_impl(&dword_230455000, v30, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
      }
      else
      {
        if (v17 || (objc_msgSend(v20, "isDataSeparatedPersona") & 1) != 0)
        {
          brc_bread_crumbs();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            -[_BRCOperation completedWithResult:error:].cold.2();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
        brc_bread_crumbs();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[_BRCOperation completedWithResult:error:].cold.3();
        v23 = 0;
      }

    }
LABEL_24:
    objc_msgSend(v4, "_gatherAppTelemetryEventsWithActivity:", v3);

    _BRRestorePersona();
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (!xpc_activity_set_state(v3, 3))
  {
    brc_bread_crumbs();
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_1();
    goto LABEL_25;
  }
LABEL_27:

}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_33()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BRCEventKindUserDownload_block_invoke_2___personalPersona;
  BRCEventKindUserDownload_block_invoke_2___personalPersona = v0;

}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_35(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id *WeakRetained;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!xpc_activity_should_defer(v3))
  {
    if (xpc_activity_get_state(v3) != 2)
      goto LABEL_27;
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_35_cold_6();

    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    v4 = WeakRetained;
    if (!WeakRetained)
      goto LABEL_26;
    objc_msgSend(WeakRetained[1], "clientTruthWorkloop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
      goto LABEL_26;
    if (!xpc_activity_set_state(v3, 4))
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
        __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_32_cold_5();

    }
    +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[1], "accountHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "acAccountID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personaIdentifierForACAccountID:", v15);
    v5 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("__defaultPersonaID__")))
      v16 = 0;
    else
      v16 = v5;
    v17 = v16;
    v18 = v5;
    if (!v17)
    {
      if (BRCEventKindUserDownload_block_invoke_3___personaOnceToken != -1)
        dispatch_once(&BRCEventKindUserDownload_block_invoke_3___personaOnceToken, &__block_literal_global_37);
      v18 = (id)BRCEventKindUserDownload_block_invoke_3___personalPersona;
    }
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentPersona");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0;
    objc_msgSend(v20, "userPersonaUniqueString");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21 == v18 || (-[NSObject isEqualToString:](v21, "isEqualToString:", v18) & 1) != 0)
    {
      v23 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        v33 = 0;
        v24 = (void *)objc_msgSend(v20, "copyCurrentPersonaContextWithError:", &v33);
        v25 = v33;
        v26 = v34;
        v34 = v24;

        if (v25)
        {
          brc_bread_crumbs();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
            -[_BRCOperation completedWithResult:error:].cold.1();

        }
        objc_msgSend(v20, "generateAndRestorePersonaContextWithPersonaUniqueString:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          goto LABEL_24;
        brc_bread_crumbs();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          v36 = v5;
          v37 = 2112;
          v38 = v23;
          v39 = 2112;
          v40 = v29;
          _os_log_error_impl(&dword_230455000, v30, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
      }
      else
      {
        if (v17 || (objc_msgSend(v20, "isDataSeparatedPersona") & 1) != 0)
        {
          brc_bread_crumbs();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            -[_BRCOperation completedWithResult:error:].cold.2();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
        brc_bread_crumbs();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[_BRCOperation completedWithResult:error:].cold.3();
        v23 = 0;
      }

    }
LABEL_24:
    objc_msgSend(v4, "_checkSyncConsistencyWithActivity:", v3);

    _BRRestorePersona();
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (!xpc_activity_set_state(v3, 3))
  {
    brc_bread_crumbs();
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_1();
    goto LABEL_25;
  }
LABEL_27:

}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_36()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEBF280], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BRCEventKindUserDownload_block_invoke_3___personalPersona;
  BRCEventKindUserDownload_block_invoke_3___personalPersona = v0;

}

- (void)_waitForApplySchedulerToBeIdleWithCompletion:(id)a3
{
  id v4;
  BRCAccountSessionFPFS *v5;
  uint64_t v6;
  BRCAccountSessionFPFS *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  NSObject *v11;
  intptr_t v12;
  NSObject *waitOnIdleQueue;
  _QWORD v14[4];
  BRCAccountSessionFPFS *v15;
  void (**v16)(_QWORD, _QWORD);
  _QWORD v17[4];
  BRCAccountSessionFPFS *v18;
  id v19;

  v4 = a3;
  v5 = self->_session;
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke;
  v17[3] = &unk_24FE40990;
  v7 = v5;
  v18 = v7;
  v8 = v4;
  v19 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348BA0DC](v17);
  -[BRCAccountSessionFPFS applyScheduler](v7, "applyScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hasActiveWorkGroup");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_group_wait(v11, 0);

  if (v12)
  {
    waitOnIdleQueue = self->_waitOnIdleQueue;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke_3;
    v14[3] = &unk_24FE409B8;
    v15 = v7;
    v16 = v9;
    dispatch_async(waitOnIdleQueue, v14);

  }
  else
  {
    v9[2](v9, 0);
  }

}

void __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "clientTruthWorkloop");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke_2;
  v5[3] = &unk_24FE40968;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __69__BRCAnalyticsReporter__waitForApplySchedulerToBeIdleWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  int64_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "telemetryApplySchedulerTimeout");
  v4 = (uint64_t)(v3 * 1000000000.0);

  objc_msgSend(*(id *)(a1 + 32), "applyScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hasActiveWorkGroup");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, v4);
  dispatch_group_wait(v6, v7);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_handleApplySchedulerTimeoutWithActivity:(id)a3 telemetryEventType:(int)a4
{
  uint64_t v4;
  BRCAccountSessionFPFS *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _xpc_activity_s *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  _xpc_activity_s *activity;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v4 = *(_QWORD *)&a4;
  v27 = *MEMORY[0x24BDAC8D0];
  activity = (_xpc_activity_s *)a3;
  v6 = self->_session;
  -[BRCAccountSessionFPFS cloudDocsClientZone](v6, "cloudDocsClientZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootItemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v10;
    _os_log_impl(&dword_230455000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Telemetry timed out waiting for the apply scheduler%@", buf, 0xCu);
  }

  -[BRCAccountSessionFPFS clientDB](v6, "clientDB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "numberWithSQL:", CFSTR("SELECT retry_count FROM telemetry_failure_counts WHERE item_id = %@ AND zone_rowid = %@"), v8, v9);

  v14 = objc_msgSend(v13, "longLongValue");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "telemetryRetryCountForPermenentFailure");

  if (v14 < v16)
  {
    -[BRCAccountSessionFPFS clientDB](v6, "clientDB");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "execute:", CFSTR("INSERT OR REPLACE INTO telemetry_failure_counts (retry_count, item_id, zone_rowid) VALUES (%lld, %@, %@)"), v14 + 1, v8, v9);

    v18 = activity;
    if (xpc_activity_set_state(activity, 3))
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:].cold.1();
    }
    else
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:].cold.2();
    }
LABEL_17:

    goto LABEL_18;
  }
  if ((_DWORD)v4 == -2)
  {
    v21 = +[AppTelemetryTimeSeriesEvent newConsistencyCheckerFailedEvent](AppTelemetryTimeSeriesEvent, "newConsistencyCheckerFailedEvent");
    -[BRCAnalyticsReporter postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](self, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v21);
  }
  else
  {
    if ((_DWORD)v4 != -1)
      goto LABEL_14;
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = +[AppTelemetryTimeSeriesEvent newPermanentlyInconsistentEventWithZoneMangledID:enhancedDrivePrivacyEnabled:](AppTelemetryTimeSeriesEvent, "newPermanentlyInconsistentEventWithZoneMangledID:enhancedDrivePrivacyEnabled:", 0, objc_msgSend(v21, "supportsEnhancedDrivePrivacy"));
    -[BRCAnalyticsReporter postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](self, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v22);

  }
LABEL_14:
  -[BRCAccountSessionFPFS clientDB](v6, "clientDB");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "execute:", CFSTR("DELETE FROM telemetry_failure_counts WHERE item_id = %@ AND zone_rowid = %@"), v8, v9);

  v18 = activity;
  if (!xpc_activity_set_state(activity, 5))
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:].cold.3();
    goto LABEL_17;
  }
LABEL_18:

}

- (void)_gatherAppTelemetryEventsWithActivity:(id)a3
{
  _xpc_activity_s *v4;
  BRCAccountSessionFPFS *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  BRCAccountSessionFPFS *v13;
  BRCAnalyticsReporter *v14;
  _xpc_activity_s *v15;

  v4 = (_xpc_activity_s *)a3;
  v5 = self->_session;
  -[BRCAccountSessionFPFS clientTruthWorkloop](v5, "clientTruthWorkloop");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_7;
  v7 = (void *)v6;
  -[BRCAccountSessionFPFS applyScheduler](v5, "applyScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hasActiveWorkGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_7:
    if (xpc_activity_set_state(v4, 5))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[BRCAnalyticsReporter _gatherAppTelemetryEventsWithActivity:].cold.1();
    }
    else
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
        -[BRCAnalyticsReporter _gatherAppTelemetryEventsWithActivity:].cold.2();
    }
    goto LABEL_15;
  }
  if (xpc_activity_should_defer(v4))
  {
    if (xpc_activity_set_state(v4, 3))
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:].cold.1();
    }
    else
    {
      brc_bread_crumbs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:].cold.2();
    }
LABEL_15:

    goto LABEL_16;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke;
  v12[3] = &unk_24FE40A08;
  v13 = v5;
  v14 = self;
  v15 = v4;
  -[BRCAnalyticsReporter _waitForApplySchedulerToBeIdleWithCompletion:](self, "_waitForApplySchedulerToBeIdleWithCompletion:", v12);

  v10 = v13;
LABEL_16:

}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  int8x16_t v27;
  _QWORD v28[4];
  id v29;
  int8x16_t v30;
  id v31;
  _QWORD v32[4];
  id v33;

  objc_msgSend(*(id *)(a1 + 32), "cloudDocsClientZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cloudDocsClientZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dbRowID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD **)(a1 + 40);
  if (v8[8])
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_4(a1 + 40);

    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 48), 3))
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:].cold.2();

    }
  }
  else if (a2)
  {
    objc_msgSend(v8, "_handleApplySchedulerTimeoutWithActivity:telemetryEventType:", *(_QWORD *)(a1 + 48), 0xFFFFFFFFLL);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "clientDB");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "execute:", CFSTR("DELETE FROM telemetry_failure_counts WHERE item_id = %@ AND zone_rowid = %@"), v5, v7);

    +[BRCPersistedState loadFromClientStateInSession:](BRCClientRanksPersistedState, "loadFromClientStateInSession:", *(_QWORD *)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientDB");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_48;
    v32[3] = &unk_24FE40010;
    v33 = *(id *)(a1 + 32);
    v17 = (void *)objc_msgSend(v15, "fetchObject:sql:", v32, CFSTR("SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_processing_stamp, item_bouncedname, item_scope, item_local_change_count, item_old_version_identifier, fp_creation_item_identifier, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, version_local_change_count, version_old_version_identifier, item_live_conflict_loser_etags, item_file_id, item_generation FROM client_items WHERE (item_sharing_options & 4) != 0 AND item_type IN (0, 9, 10) AND rowid > %llu ORDER BY rowid ASC LIMIT 1"), objc_msgSend(v14, "telemetryMinRowID"));

    objc_msgSend(v14, "setTelemetryMinRowID:", objc_msgSend(v17, "dbRowID"));
    if (v17)
    {
      if ((objc_msgSend(v17, "isDirectory") & 1) != 0)
      {
        objc_msgSend(v17, "itemGlobalID");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 40);
        v20 = *(void **)(v19 + 64);
        *(_QWORD *)(v19 + 64) = v18;

        objc_msgSend(v17, "asDirectory");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v16;
        v28[1] = 3221225472;
        v28[2] = __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_54;
        v28[3] = &unk_24FE409E0;
        v29 = v17;
        v27 = *(int8x16_t *)(a1 + 32);
        v22 = (id)v27.i64[0];
        v30 = vextq_s8(v27, v27, 8uLL);
        v31 = *(id *)(a1 + 48);
        +[BRCItemCountMismatchReport generateReportForSharedFolder:qualityOfService:completionHandler:](BRCItemCountMismatchReport, "generateReportForSharedFolder:qualityOfService:completionHandler:", v21, 17, v28);

      }
      else
      {
        brc_bread_crumbs();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
          __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_2();

        objc_msgSend(*(id *)(a1 + 40), "_gatherAppTelemetryEventsWithActivity:", *(_QWORD *)(a1 + 48));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_reportSyncUpBackoffInfo");
      if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 48), 5))
      {
        brc_bread_crumbs();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
          __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_1();

      }
    }

  }
}

id __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_48(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "newLocalItemFromPQLResultSet:db:error:", v5, v6, a3);

  return v7;
}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 64);
    if (!v6)
    {
      objc_msgSend(v3, "shareChangedDuringCheckWithSession:", *(_QWORD *)(a1 + 48));
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 64);
    }
    *(_QWORD *)(v5 + 64) = 0;

    objc_msgSend(*(id *)(a1 + 48), "clientDB");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertOnQueue");

    objc_msgSend(v4, "telemetryEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(*(id *)(a1 + 40), "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v8);
    objc_msgSend(*(id *)(a1 + 40), "_gatherAppTelemetryEventsWithActivity:", *(_QWORD *)(a1 + 56));
  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_54_cold_1(a1);

  }
}

- (void)_setupSyncConsistencyDeferralTimerWithActivity:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int64_t v7;
  dispatch_time_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  OS_dispatch_source *syncConsistencyDeferralTimer;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD handler[4];
  id v23;
  NSObject *v24;

  v4 = a3;
  if (self->_syncConsistencyDeferralTimer)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BRCAnalyticsReporter _setupSyncConsistencyDeferralTimerWithActivity:].cold.1();
  }
  else
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncConsistencyXPCActivityDeferralCheckInterval");
    v7 = brc_interval_to_nsec();
    v8 = dispatch_time(0, v7);
    v9 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
    objc_msgSend(v5, "syncConsistencyXPCActivityDeferralCheckInterval");
    v10 = brc_interval_to_nsec();
    objc_msgSend(v5, "syncConsistencyXPCActivityCheckLeeway");
    v11 = brc_interval_to_nsec();
    dispatch_source_set_timer(v9, v8, v10, v11);
    v12 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke;
    handler[3] = &unk_24FE3FA40;
    v23 = v4;
    v13 = v9;
    v24 = v13;
    dispatch_source_set_event_handler(v13, handler);
    objc_initWeak(&location, self);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke_56;
    v19[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v20, &location);
    v14 = v13;
    v15 = v19;
    v16 = v15;
    if (*MEMORY[0x24BE17840])
    {
      ((void (*)(_QWORD *))*MEMORY[0x24BE17840])(v15);
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }
    dispatch_source_set_cancel_handler(v14, v16);

    dispatch_resume(v14);
    syncConsistencyDeferralTimer = self->_syncConsistencyDeferralTimer;
    self->_syncConsistencyDeferralTimer = (OS_dispatch_source *)v14;
    v6 = v14;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

void __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      brc_bread_crumbs();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke_cold_1();

    }
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_230455000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Deferring the sync consistency checker%@", (uint8_t *)&v8, 0xCu);
    }

    BRDiskCheckerServiceConnection();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pauseTreeConsistencyCheck");

    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  }
}

void __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke_56(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[9];
    WeakRetained[9] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

+ (void)cancelSyncConsistencyReportWithMountPath:(id)a3 queue:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int64_t v11;
  dispatch_time_t v12;
  _QWORD block[4];
  id v14;

  v5 = a3;
  v6 = a4;
  BRDiskCheckerServiceConnection();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelTreeConsistencyCheck");

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "syncConsistencyCheckerSnapshotting");

  if (v10)
  {
    v11 = brc_interval_to_nsec();
    v12 = dispatch_time(0, v11);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__BRCAnalyticsReporter_cancelSyncConsistencyReportWithMountPath_queue___block_invoke;
    block[3] = &unk_24FE3FA18;
    v14 = v5;
    dispatch_after(v12, v6, block);

  }
}

uint64_t __71__BRCAnalyticsReporter_cancelSyncConsistencyReportWithMountPath_queue___block_invoke(uint64_t a1)
{
  return +[BRCSyncConsistencyReport cleanupApfsSnapshotWithMountPath:](BRCSyncConsistencyReport, "cleanupApfsSnapshotWithMountPath:", *(_QWORD *)(a1 + 32));
}

- (void)_setupSyncConsistencyCancellationTimerWithActivity:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int64_t v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  NSObject *v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  OS_dispatch_source *syncConsistencyCancellationTimer;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  _QWORD handler[4];
  NSObject *v27;
  id v28;
  NSObject *v29;
  id location;

  v6 = a3;
  v7 = a4;
  if (self->_syncConsistencyCancellationTimer)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BRCAnalyticsReporter _setupSyncConsistencyCancellationTimerWithActivity:session:].cold.1();
  }
  else
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "syncConsistencyTimeout");
    v10 = brc_interval_to_nsec();
    objc_msgSend(v7, "volume");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mountPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v13 = dispatch_time(0, v10);
    v14 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
    objc_msgSend(v8, "syncConsistencyXPCActivityCheckLeeway");
    dispatch_source_set_timer(v14, v13, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v15 * 1000000000.0));
    v16 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __83__BRCAnalyticsReporter__setupSyncConsistencyCancellationTimerWithActivity_session___block_invoke;
    handler[3] = &unk_24FE3FA88;
    v9 = v12;
    v27 = v9;
    v28 = v7;
    v17 = v14;
    v29 = v17;
    dispatch_source_set_event_handler(v17, handler);
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __83__BRCAnalyticsReporter__setupSyncConsistencyCancellationTimerWithActivity_session___block_invoke_59;
    v24[3] = &unk_24FE3F9C8;
    objc_copyWeak(&v25, &location);
    v18 = v17;
    v19 = v24;
    v20 = v19;
    if (*MEMORY[0x24BE17840])
    {
      ((void (*)(_QWORD *))*MEMORY[0x24BE17840])(v19);
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v21;
    }
    dispatch_source_set_cancel_handler(v18, v20);

    dispatch_resume(v18);
    syncConsistencyCancellationTimer = self->_syncConsistencyCancellationTimer;
    self->_syncConsistencyCancellationTimer = (OS_dispatch_source *)v18;
    v23 = v18;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

}

void __83__BRCAnalyticsReporter__setupSyncConsistencyCancellationTimerWithActivity_session___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_impl(&dword_230455000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Cancelling the sync consistency checker because it timed out%@", (uint8_t *)&v6, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "resetQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCAnalyticsReporter cancelSyncConsistencyReportWithMountPath:queue:](BRCAnalyticsReporter, "cancelSyncConsistencyReportWithMountPath:queue:", v4, v5);

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
}

void __83__BRCAnalyticsReporter__setupSyncConsistencyCancellationTimerWithActivity_session___block_invoke_59(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[10];
    WeakRetained[10] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (BOOL)_resumePausedTreeConsistencyCheckOperationWithActivity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  BRDiskCheckerServiceConnection();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v6 = MEMORY[0x24BDAC760];
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke;
  v13[3] = &unk_24FE40A30;
  v13[4] = &v14;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_61;
  v12[3] = &unk_24FE40A30;
  v12[4] = &v14;
  objc_msgSend(v7, "resumeTreeConsistencyCheckWithReply:", v12);

  -[BRCAnalyticsReporter _setupSyncConsistencyDeferralTimerWithActivity:](self, "_setupSyncConsistencyDeferralTimerWithActivity:", v4);
  v8 = v15[5];
  if (v8)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCAnalyticsReporter _resumePausedTreeConsistencyCheckOperationWithActivity:].cold.2();
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BRCAnalyticsReporter _resumePausedTreeConsistencyCheckOperationWithActivity:].cold.1();
  }

  _Block_object_dispose(&v14, 8);
  return v8 == 0;
}

void __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a2;
  if (v4)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

void __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_61(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)_shouldDeferForExistingSnapshot
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  BOOL v7;

  -[BRCAccountSessionFPFS volume](self->_session, "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mountPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_retainAutorelease(v3);
  v5 = open((const char *)objc_msgSend(v4, "UTF8String"), 0);
  if ((v5 & 0x80000000) != 0)
  {
    v7 = 0;
  }
  else
  {
    v6 = v5;
    v7 = BRCHasAPFSSnapshot(v5, 0);
    close(v6);
  }

  return v7;
}

- (void)_checkSyncConsistencyWithActivity:(id)a3
{
  id v4;
  BRCAccountSessionFPFS *v5;
  BRCAccountSessionFPFS *v6;
  _QWORD v7[5];
  id v8;
  BRCAccountSessionFPFS *v9;

  v4 = a3;
  if (!-[BRCAnalyticsReporter _resumePausedTreeConsistencyCheckOperationWithActivity:](self, "_resumePausedTreeConsistencyCheckOperationWithActivity:", v4))
  {
    v5 = self->_session;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke;
    v7[3] = &unk_24FE40A08;
    v7[4] = self;
    v8 = v4;
    v9 = v5;
    v6 = v5;
    -[BRCAnalyticsReporter _waitForApplySchedulerToBeIdleWithCompletion:](self, "_waitForApplySchedulerToBeIdleWithCompletion:", v7);

  }
}

void __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "_handleApplySchedulerTimeoutWithActivity:telemetryEventType:", *(_QWORD *)(a1 + 40), 4294967294);
  }
  else if (objc_msgSend(v3, "_shouldDeferForExistingSnapshot"))
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_cold_2();

    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_cold_1();

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "resetQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_62;
    block[3] = &unk_24FE3FA88;
    v9 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    v12 = *(id *)(a1 + 48);
    dispatch_async(v8, block);

  }
}

void __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_62(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_setupSyncConsistencyDeferralTimerWithActivity:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setupSyncConsistencyCancellationTimerWithActivity:session:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_2;
  v4[3] = &unk_24FE40A58;
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  +[BRCSyncConsistencyReport generateReportWithSession:mangledIDs:completion:](BRCSyncConsistencyReport, "generateReportWithSession:mangledIDs:completion:", v3, 0, v4);

}

void __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 80);
  if (v5)
  {
    dispatch_source_cancel(v5);
    v4 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(NSObject **)(v4 + 72);
  if (v6)
    dispatch_source_cancel(v6);
  if ((objc_msgSend(v3, "wasAbleToRun") & 1) != 0)
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
    {
      brc_bread_crumbs();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
        -[BRCAnalyticsReporter _handleApplySchedulerTimeoutWithActivity:telemetryEventType:].cold.3();

    }
    objc_msgSend(v3, "telemetryErrorEvents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v3, "telemetryErrorEvents");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(a1 + 32), "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v13);
      }
    }
    else
    {
      v16 = *(void **)(a1 + 32);
      v11 = +[AppTelemetryTimeSeriesEvent newFullyConsistentEvent](AppTelemetryTimeSeriesEvent, "newFullyConsistentEvent");
      objc_msgSend(v16, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v11);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v3, "telemetryWarningEvents", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(a1 + 32), "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v19);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleApplySchedulerTimeoutWithActivity:telemetryEventType:", *(_QWORD *)(a1 + 40), 4294967294);
  }

}

- (void)_reportSyncUpBackoffInfo
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  NSObject *v17;
  float v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  unsigned int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[BRCAccountSessionFPFS clientZones](self->_session, "clientZones");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v3)
  {
    v4 = v3;
    v24 = 0;
    v5 = 0;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "mangledID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isSyncBlocked") & 1) == 0)
        {
          +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "syncUpBackoffRatio");
          v12 = v11;
          objc_msgSend(v8, "syncUpBackoffDelay");
          v14 = v13;
          objc_msgSend(v10, "syncUpBackoffRatioForFailure");
          if (v12 > v15)
          {
            brc_bread_crumbs();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v30 = v8;
              v31 = 2048;
              v32 = v12;
              v33 = 2112;
              v34 = v16;
              _os_log_impl(&dword_230455000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Client zone %@ has a sync up backoff ratio of %f which is too large%@", buf, 0x20u);
            }

            v5 = (v5 + 1);
          }
          objc_msgSend(v10, "syncUpBackoffDelayForFailure");
          if (v14 > v18)
          {
            brc_bread_crumbs();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v30 = v8;
              v31 = 2048;
              v32 = v14;
              v33 = 2112;
              v34 = v19;
              _os_log_impl(&dword_230455000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Client zone %@ has a sync up backoff delay of %f which is too large%@", buf, 0x20u);
            }

            ++v24;
          }
          objc_msgSend(v8, "resetSyncUpBackoffRatio");

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v4);
  }
  else
  {
    v24 = 0;
    v5 = 0;
  }

  v21 = +[AppTelemetryTimeSeriesEvent newSyncUpBackoffRatioSummaryEventWithNumberOfFailedZones:](AppTelemetryTimeSeriesEvent, "newSyncUpBackoffRatioSummaryEventWithNumberOfFailedZones:", v5);
  -[BRCAnalyticsReporter postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](self, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v21);
  v22 = +[AppTelemetryTimeSeriesEvent newSyncUpBackoffDelaySummaryEventWithNumberOfFailedZones:](AppTelemetryTimeSeriesEvent, "newSyncUpBackoffDelaySummaryEventWithNumberOfFailedZones:", v24);
  -[BRCAnalyticsReporter postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](self, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v22);

}

- (void)submitEventMetric:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[BRCMetricEndpoint submitEventMetric:](self->_metricEndpoint, "submitEventMetric:", v4);
    objc_msgSend(v4, "associatedAppTelemetryEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[BRCAnalyticsReporter postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:](self, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v5);
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCAnalyticsReporter _forgetEventMetrics:](self, "_forgetEventMetrics:", v6);

  }
}

- (void)forgetEventMetric:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCAnalyticsReporter _forgetEventMetrics:](self, "_forgetEventMetrics:", v6, v7, v8);
  }
}

- (void)_forgetEventMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v21;
    *(_QWORD *)&v9 = 138412290;
    v19 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "eventName", v19, (_QWORD)v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if ((v14 & 1) == 0)
        {
          brc_bread_crumbs();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v19;
            v25 = v15;
            _os_log_fault_impl(&dword_230455000, v16, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [metric.eventName isEqualToString:kind]%@", buf, 0xCu);
          }

        }
        ++v12;
      }
      while (v10 != v12);
      v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      v10 = v17;
    }
    while (v17);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_eventsByKind, "objectForKeyedSubscript:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectsInArray:", v7);

}

- (void)_cleanupTimedOutEventMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventMetricTimeout");
  v8 = v7;

  v9 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "startTime", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "timeIntervalSinceDate:", v16);
        v18 = v17;

        if (v18 > v8)
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

}

- (void)_withEventMetricsOfKind:(id)a3 accessor:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__BRCAnalyticsReporter__withEventMetricsOfKind_accessor___block_invoke;
  block[3] = &unk_24FE40A80;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __57__BRCAnalyticsReporter__withEventMetricsOfKind_accessor___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (id)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
    v2 = v3;
  }
  v4 = v2;
  if (objc_msgSend(v2, "count") == 10)
    objc_msgSend(*(id *)(a1 + 32), "_cleanupTimedOutEventMetrics:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)_aggregatedTelemetryDescription:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = a3;
  v5 = objc_msgSend(v4, "telemetrySchema");
  if ((int)v5 > 299)
  {
    switch((int)v5)
    {
      case 500:
        v6 = CFSTR("ITEM_BOUNCE_APPLY_NEW_WITH_EXISTING");
        break;
      case 501:
        v6 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW");
        break;
      case 502:
        v6 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_EXISTING");
        break;
      case 503:
        v6 = CFSTR("ITEM_BOUNCE_BY_SERVER");
        break;
      case 504:
        v6 = CFSTR("ITEM_BOUNCE_CREATE_ITEM_WITH_EXISTING");
        break;
      case 505:
        v6 = CFSTR("ITEM_BOUNCE_CHANGE_ITEM_WITH_EXISTING");
        break;
      case 506:
        v6 = CFSTR("ITEM_BOUNCE_SHARE_ACCEPT_EXISTING_WITH_NEW");
        break;
      case 507:
        v6 = CFSTR("ITEM_BOUNCE_SHARE_ACCEPT_NEW_WITH_EXISTING");
        break;
      case 508:
        v6 = CFSTR("ITEM_BOUNCE_TRASHED_ITEM");
        break;
      case 509:
        v6 = CFSTR("ITEM_BOUNCE_ITEM_DIRECTORY_MERGE");
        break;
      case 510:
        v6 = CFSTR("ITEM_BOUNCE_NEW_DIRECTORY_WITH_EXISTING");
        break;
      case 511:
        v6 = CFSTR("ITEM_BOUNCE_EXISTING_WITH_NEW_DIRECTORY");
        break;
      case 512:
        v6 = CFSTR("ITEM_BOUNCE_ITEM_WITH_DOCUMENTS_FOLDER");
        break;
      case 513:
        v6 = CFSTR("ITEM_BOUNCE_APPLY_DEAD_EXISTING_WITH_NEW");
        break;
      case 514:
        v6 = CFSTR("ITEM_BOUNCE_APPLY_NOT_KNOWN_BY_SERVER_WITH_NEW");
        break;
      case 515:
        v6 = CFSTR("ITEM_BOUNCE_APPLY_LOCAL_DIFF_REPARENT_WITH_NEW");
        break;
      case 516:
        v6 = CFSTR("ITEM_BOUNCE_APPLY_LOCAL_DIFF_FILE_NAME_WITH_NEW");
        break;
      case 517:
        v6 = CFSTR("ITEM_BOUNCE_APPLY_INITIAL_SCAN_WITH_NEW");
        break;
      case 518:
        v6 = CFSTR("ITEM_BOUNCE_APPLY_SHARED_ITEM_WITH_NEW_SHARED_ITEM_UNTITLED_FILE_NAME");
        break;
      case 519:
        v6 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW_UNTITLED_FILE_NAME");
        break;
      default:
        switch((int)v5)
        {
          case 400:
            v6 = CFSTR("FPFS_MIGRATION_STARTED");
            break;
          case 401:
            v6 = CFSTR("FPFS_MIGRATION_FINISHED");
            break;
          case 402:
            v6 = CFSTR("FPFS_MIGRATION_STATUS_REPORT");
            break;
          case 403:
            v6 = CFSTR("FPFS_MIGRATION_NON_MIGRATED_ITEM_REPORT");
            break;
          case 404:
            v6 = CFSTR("FPFS_MIGRATION_STUCK_STATUS");
            break;
          default:
            if ((_DWORD)v5 == 300)
            {
              v6 = CFSTR("INITIAL_SCAN_REJECTED_MISMATCH_TYPE");
            }
            else
            {
LABEL_35:
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
              v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            break;
        }
        break;
    }
  }
  else
  {
    v6 = CFSTR("UNKNOWN");
    switch((int)v5)
    {
      case 0:
        break;
      case 1:
        v6 = CFSTR("_UNUSED_SYNC_UP_BACKOFF_RATIO");
        break;
      case 2:
        v6 = CFSTR("FOLDER_SHARING_ITEM_COUNT_MISMATCH");
        break;
      case 3:
        v6 = CFSTR("MISSING_PUSH");
        break;
      case 4:
        v6 = CFSTR("PERMANENTLY_INCONSISTENT");
        break;
      case 5:
        v6 = CFSTR("DROPPED_EVENTS");
        break;
      case 6:
        v6 = CFSTR("TEST_METRIC");
        break;
      case 7:
        v6 = CFSTR("SHARE_ALIAS_IN_SHARED_FOLDER");
        break;
      case 8:
        v6 = CFSTR("MALIGNANT_ZONE_RESET");
        break;
      case 9:
        v6 = CFSTR("BENIGN_ZONE_RESET");
        break;
      case 10:
        v6 = CFSTR("DB_RESET");
        break;
      case 11:
        v6 = CFSTR("APPLY_SCHEDULER_MISSING_JOBS");
        break;
      case 12:
        v6 = CFSTR("SYNC_UP_MISSING_JOBS");
        break;
      case 13:
        v6 = CFSTR("READER_MISSING_JOBS");
        break;
      case 14:
        v6 = CFSTR("UPLOADER_MISSING_JOBS");
        break;
      case 15:
        v6 = CFSTR("DOWNLOADER_MISSING_JOBS");
        break;
      case 16:
        v6 = CFSTR("_UNUSED_SYNC_UP_BACKOFF_DELAY");
        break;
      case 17:
        v6 = CFSTR("FOLDER_SHARING_PCS_CHAINING");
        break;
      case 18:
        v6 = CFSTR("NEW_SHARE_ACCEPTATION");
        break;
      case 19:
        v6 = CFSTR("FS_EVENT_TO_SYNC_UP");
        break;
      case 20:
        v6 = CFSTR("USER_DOWNLOAD");
        break;
      case 21:
        v6 = CFSTR("CORRUPT_PACKAGE_DOWNLOAD");
        break;
      case 22:
        v6 = CFSTR("DIRECTORY_MISSING_CHAINPCS");
        break;
      case 23:
        v6 = CFSTR("SYNC_BOOSTING_PROBLEM_COUNT");
        break;
      case 24:
        v6 = CFSTR("DEEP_SCAN");
        break;
      case 25:
        v6 = CFSTR("OPERATION_TIMED_OUT");
        break;
      case 26:
        v6 = CFSTR("MISSING_SHARE_ALIAS");
        break;
      case 27:
        v6 = CFSTR("ASSET_CONTENT_NOT_FOUND");
        break;
      case 28:
        v6 = CFSTR("QBS_DIR_FAULT_COUNT");
        break;
      case 29:
        v6 = CFSTR("FILE_BOUNCED_MANY_TIMES");
        break;
      case 30:
        v6 = CFSTR("SYNC_UP_BACKOFF_RATIO_SUMMARY");
        break;
      case 31:
        v6 = CFSTR("SYNC_UP_BACKOFF_DELAY_SUMMARY");
        break;
      case 32:
        v6 = CFSTR("QBS_PERFORMANCE");
        break;
      case 33:
        v6 = CFSTR("ACCOUNT_SESSION_OPEN_ERROR");
        break;
      case 34:
        v6 = CFSTR("CORRUPT_SHARING_OPTIONS");
        break;
      case 35:
        v6 = CFSTR("INCORRECT_CONTENT_POLICY_COUNT");
        break;
      case 36:
        v6 = CFSTR("CORRUPT_BASEHASH_SALT_COUNT");
        break;
      case 37:
        v6 = CFSTR("EDP_KEYS_MISMATCH");
        break;
      case 38:
        v6 = CFSTR("DATABASE_ID_MISMATCH");
        break;
      case 39:
        v6 = CFSTR("COLLABORATION_UPLOAD");
        break;
      case 40:
        v6 = CFSTR("DANGLING_ZOMBIE_DIRECTORY_COUNT");
        break;
      case 41:
        v6 = CFSTR("RECORD_VALUE_ERROR");
        break;
      case 42:
        v6 = CFSTR("AGGRESSIVE_SALTING");
        break;
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
        goto LABEL_35;
      case 100:
        v6 = CFSTR("FULLY_CONSISTENT");
        break;
      case 101:
        v6 = CFSTR("FILE_CHECKSUM_MISMATCH");
        break;
      case 102:
        v6 = CFSTR("PACKAGE_CHECKSUM_MISMATCH");
        break;
      case 103:
        v6 = CFSTR("CHILD_COUNT_MISMATCH");
        break;
      case 104:
        v6 = CFSTR("RECURSIVE_ITEM_COUNT_MISMATCH");
        break;
      case 105:
        v6 = CFSTR("SHARE_ALIAS_COUNT_MISMATCH");
        break;
      case 106:
        v6 = CFSTR("SHARE_COUNT_MISMATCH");
        break;
      case 107:
        v6 = CFSTR("CONSISTENCY_CHECKER_FAILED");
        break;
      case 108:
        v6 = CFSTR("FILE_READ_ERROR");
        break;
      default:
        switch((int)v5)
        {
          case 200:
            v6 = CFSTR("CA_TOTAL_ERROR_COUNT");
            break;
          case 201:
            v6 = CFSTR("CA_UPLOAD_ERROR_COUNT");
            break;
          case 202:
            v6 = CFSTR("CA_DOWNLOAD_ERROR_COUNT");
            break;
          case 203:
            v6 = CFSTR("CA_SYNC_UP_ITEM_ERROR_COUNT");
            break;
          case 204:
            v6 = CFSTR("CA_SYNC_UP_ZONE_ERROR_COUNT");
            break;
          case 205:
            v6 = CFSTR("CA_SYNC_DOWN_ERROR_COUNT");
            break;
          case 210:
            v6 = CFSTR("CA_UPLOAD_ERROR");
            break;
          case 211:
            v6 = CFSTR("CA_DOWNLOAD_ERROR");
            break;
          case 212:
            v6 = CFSTR("CA_SYNC_UP_ITEM_ERROR");
            break;
          case 213:
            v6 = CFSTR("CA_SYNC_UP_ZONE_ERROR");
            break;
          case 214:
            v6 = CFSTR("CA_SYNC_DOWN_ERROR");
            break;
          case 215:
            v6 = CFSTR("CA_DAMAGED_FILE_UPLOAD_ERROR");
            break;
          case 216:
            v6 = CFSTR("CA_NIL_APP_LIBRARY");
            break;
          default:
            goto LABEL_35;
        }
        break;
    }
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("|id = %@|count = %lld|"), v6, objc_msgSend(v4, "magnitudeLong"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "investigation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "hasZoneName"))
  {
    v9 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v8, "zoneName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithData:encoding:", v10, 4);
    objc_msgSend(v7, "appendFormat:", CFSTR("zoneID = %@|"), v11);

  }
  if (objc_msgSend(v8, "hasItemID"))
  {
    objc_msgSend(v8, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("itemID = %@|"), v12);

  }
  if (objc_msgSend(v8, "hasErrorDomain"))
  {
    objc_msgSend(v8, "errorDomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "errorCode");
    objc_msgSend(v8, "errorDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("errorDomain = %@|errorCode = %lld| errorDescription = %@|"), v13, v14, v15);

  }
  return v7;
}

- (void)dumpDatabaseInfoToContext:(id)a3
{
  id v4;
  BRCAccountSessionFPFS *session;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("Pending Aggregated Telemetry"));
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  session = self->_session;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__BRCAnalyticsReporter_dumpDatabaseInfoToContext___block_invoke;
  v7[3] = &unk_24FE40AA8;
  v8 = v4;
  v6 = v4;
  +[BRCAnalyticsReporter _enumerateAggregatedTelemetryForSession:withBlock:](BRCAnalyticsReporter, "_enumerateAggregatedTelemetryForSession:withBlock:", session, v7);
  objc_msgSend(v6, "writeEmptyLine");

}

void __50__BRCAnalyticsReporter_dumpDatabaseInfoToContext___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[BRCAnalyticsReporter _aggregatedTelemetryDescription:](BRCAnalyticsReporter, "_aggregatedTelemetryDescription:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeLineWithFormat:", CFSTR("%@"), v3);

}

- (void)dumpToContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BRCSyncHealthReport *syncHealthReport;
  uint64_t v14;
  id v15;
  BRCSyncHealthReport *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33[0] = BRCEventKindFSEventToSyncUp;
  v33[1] = BRCEventKindUserDownload;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("analytics metrics"));
  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("-----------------------------------------------------"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x2348B9F14]();
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __38__BRCAnalyticsReporter_dumpToContext___block_invoke;
        v25[3] = &unk_24FE40AD0;
        v26 = v4;
        v27 = v11;
        -[BRCAnalyticsReporter _withEventMetricsOfKind:accessor:](self, "_withEventMetricsOfKind:accessor:", v11, v25);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "writeLineWithFormat:", CFSTR("SyncHealthReport:"));
  syncHealthReport = self->_syncHealthReport;
  v14 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __38__BRCAnalyticsReporter_dumpToContext___block_invoke_2;
  v23[3] = &unk_24FE40AF8;
  v15 = v4;
  v24 = v15;
  -[BRCSyncHealthReport syncErrors:](syncHealthReport, "syncErrors:", v23);
  objc_msgSend(v15, "writeLineWithFormat:", &stru_24FE4A790);
  objc_msgSend(v15, "writeLineWithFormat:", CFSTR("Aggregated Telemetry:"));
  v16 = self->_syncHealthReport;
  v18 = v14;
  v19 = 3221225472;
  v20 = __38__BRCAnalyticsReporter_dumpToContext___block_invoke_3;
  v21 = &unk_24FE40AF8;
  v22 = v15;
  v17 = v15;
  -[BRCSyncHealthReport dumpAggregatedEvents:](v16, "dumpAggregatedEvents:", &v18);
  objc_msgSend(v17, "writeLineWithFormat:", &stru_24FE4A790, v18, v19, v20, v21);

}

uint64_t __38__BRCAnalyticsReporter_dumpToContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@: %@"), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __38__BRCAnalyticsReporter_dumpToContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@"), a2);
}

uint64_t __38__BRCAnalyticsReporter_dumpToContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeLineWithFormat:", CFSTR("%@"), a2);
}

- (void)createFSEventToSyncUpEventForFileID:(unint64_t)a3 genID:(unsigned int)a4
{
  _QWORD v4[5];
  unsigned int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__BRCAnalyticsReporter_createFSEventToSyncUpEventForFileID_genID___block_invoke;
  v4[3] = &__block_descriptor_44_e24_v16__0__NSMutableArray_8l;
  v4[4] = a3;
  v5 = a4;
  -[BRCAnalyticsReporter _withEventMetricsOfKind:accessor:](self, "_withEventMetricsOfKind:accessor:", BRCEventKindFSEventToSyncUp, v4);
}

void __66__BRCAnalyticsReporter_createFSEventToSyncUpEventForFileID_genID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  int v10;
  BRCFSEventToSyncUpEvent *v11;
  BRCFSEventToSyncUpEvent *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    while (1)
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "fileID");

      if (v5 == v7)
        break;
      if (++v4 >= (unint64_t)objc_msgSend(v3, "count"))
        goto LABEL_8;
    }
    v8 = *(_DWORD *)(a1 + 40);
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "genID");

    if (v8 != v10)
      objc_msgSend(v3, "removeObjectAtIndex:", v4);
  }
LABEL_8:
  if ((unint64_t)objc_msgSend(v3, "count") <= 9)
  {
    v11 = [BRCFSEventToSyncUpEvent alloc];
    v12 = -[BRCEventMetric initWithEventName:](v11, "initWithEventName:", BRCEventKindFSEventToSyncUp);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCEventMetric setStartTime:](v12, "setStartTime:", v13);

    -[BRCFSEventToSyncUpEvent setFileID:](v12, "setFileID:", *(_QWORD *)(a1 + 32));
    -[BRCFSEventToSyncUpEvent setGenID:](v12, "setGenID:", *(unsigned int *)(a1 + 40));
    objc_msgSend(v3, "addObject:", v12);
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __66__BRCAnalyticsReporter_createFSEventToSyncUpEventForFileID_genID___block_invoke_cold_1();

  }
}

- (void)lookupFSEventToSyncUpEventByFileID:(unint64_t)a3 genID:(unsigned int)a4 accessor:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;
  unsigned int v14;

  v8 = a5;
  v9 = BRCEventKindFSEventToSyncUp;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__BRCAnalyticsReporter_lookupFSEventToSyncUpEventByFileID_genID_accessor___block_invoke;
  v11[3] = &unk_24FE40B40;
  v14 = a4;
  v12 = v8;
  v13 = a3;
  v10 = v8;
  -[BRCAnalyticsReporter _withEventMetricsOfKind:accessor:](self, "_withEventMetricsOfKind:accessor:", v9, v11);

}

void __74__BRCAnalyticsReporter_lookupFSEventToSyncUpEventByFileID_genID_accessor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  int v10;
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
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = *(_QWORD *)(a1 + 40);
        if (v9 == objc_msgSend(v8, "fileID", (_QWORD)v11))
        {
          v10 = *(_DWORD *)(a1 + 48);
          if (v10 == objc_msgSend(v8, "genID"))
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)lookupFSEventToSyncUpEventByItemID:(id)a3 accessor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = BRCEventKindFSEventToSyncUp;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__BRCAnalyticsReporter_lookupFSEventToSyncUpEventByItemID_accessor___block_invoke;
  v11[3] = &unk_24FE40B68;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[BRCAnalyticsReporter _withEventMetricsOfKind:accessor:](self, "_withEventMetricsOfKind:accessor:", v8, v11);

}

void __68__BRCAnalyticsReporter_lookupFSEventToSyncUpEventByItemID_accessor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "itemID", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v8, "isEqualToItemID:", v9);

        if ((_DWORD)v8)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)createUserDownloadEventForOperationID:(id)a3 isRecursive:(BOOL)a4 isForBackup:(BOOL)a5
{
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a3;
  v9 = BRCEventKindUserDownload;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__BRCAnalyticsReporter_createUserDownloadEventForOperationID_isRecursive_isForBackup___block_invoke;
  v11[3] = &unk_24FE40B90;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  -[BRCAnalyticsReporter _withEventMetricsOfKind:accessor:](self, "_withEventMetricsOfKind:accessor:", v9, v11);

}

void __86__BRCAnalyticsReporter_createUserDownloadEventForOperationID_isRecursive_isForBackup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BRCUserDownloadEvent *v4;
  BRCUserDownloadEvent *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") <= 9)
  {
    v4 = [BRCUserDownloadEvent alloc];
    v5 = -[BRCEventMetric initWithEventName:](v4, "initWithEventName:", BRCEventKindUserDownload);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCEventMetric setStartTime:](v5, "setStartTime:", v6);

    -[BRCUserDownloadEvent setOperationID:](v5, "setOperationID:", *(_QWORD *)(a1 + 32));
    -[BRCUserDownloadEvent setIsRecursiveDownload:](v5, "setIsRecursiveDownload:", *(unsigned __int8 *)(a1 + 40));
    -[BRCUserDownloadEvent setIsDownloadingForBackup:](v5, "setIsDownloadingForBackup:", *(unsigned __int8 *)(a1 + 41));
    objc_msgSend(v3, "addObject:", v5);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __86__BRCAnalyticsReporter_createUserDownloadEventForOperationID_isRecursive_isForBackup___block_invoke_cold_1();

  }
}

- (void)lookupUserDownloadEventByOperationID:(id)a3 accessor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = BRCEventKindUserDownload;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__BRCAnalyticsReporter_lookupUserDownloadEventByOperationID_accessor___block_invoke;
  v11[3] = &unk_24FE40B68;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[BRCAnalyticsReporter _withEventMetricsOfKind:accessor:](self, "_withEventMetricsOfKind:accessor:", v8, v11);

}

void __70__BRCAnalyticsReporter_lookupUserDownloadEventByOperationID_accessor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "operationID", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

        if (v9)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)lookupUserDownloadEventByFileObjectID:(id)a3 accessor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = BRCEventKindUserDownload;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__BRCAnalyticsReporter_lookupUserDownloadEventByFileObjectID_accessor___block_invoke;
  v11[3] = &unk_24FE40B68;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[BRCAnalyticsReporter _withEventMetricsOfKind:accessor:](self, "_withEventMetricsOfKind:accessor:", v8, v11);

}

void __71__BRCAnalyticsReporter_lookupUserDownloadEventByFileObjectID_accessor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "fileObjectIDs", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", *(_QWORD *)(a1 + 32));

        if (v9)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)postReportForDefaultSubCategoryWithCategory:(unint64_t)a3 telemetryTimeEvent:(id)a4
{
  id v6;

  -[BRCAppTelemetryConverter dictionaryRepresentationFromEvent:](self->_appTelemetryConvertor, "dictionaryRepresentationFromEvent:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCRTCReporter postReportWithCategory:type:payload:error:](self->_rtcReporter, "postReportWithCategory:type:payload:error:", a3, 1, v6, 0);

}

+ (void)_enumerateAggregatedTelemetryForSession:(id)a3 withBlock:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void (**v20)(id, id);
  void *context;

  v19 = a3;
  v20 = (void (**)(id, id))a4;
  objc_msgSend(v19, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "fetch:", CFSTR("SELECT app_telemetry_identifier, zone_mangled_id, item_id, enhanced_drive_privacy_enabled, error_domain, error_code, error_description, count FROM aggregated_daily_telemetry"));

  if (objc_msgSend(v6, "next"))
  {
    do
    {
      v7 = MEMORY[0x2348B9F14]();
      v8 = objc_msgSend(v6, "intAtIndex:", 0);
      objc_msgSend(v6, "stringAtIndex:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE17640]), "initWithMangledString:", v9);
      else
        v10 = 0;
      objc_msgSend(v6, "stringAtIndex:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "length"))
      {

        v11 = 0;
      }
      objc_msgSend(v6, "stringAtIndex:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      context = (void *)v7;
      if (objc_msgSend(v12, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "isEqualToString:", CFSTR("1")));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v6, "stringAtIndex:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v6, "longLongAtIndex:", 5);
      objc_msgSend(v6, "stringAtIndex:", 6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD1540], "br_errorWithDomain:code:description:", v14, v15, CFSTR("%@"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      v18 = +[AppTelemetryTimeSeriesEvent newAggregatedEventWithIdentifier:recordID:zoneMangledID:enhancedDrivePrivacyEnabled:error:count:](AppTelemetryTimeSeriesEvent, "newAggregatedEventWithIdentifier:recordID:zoneMangledID:enhancedDrivePrivacyEnabled:error:count:", v8, v11, v10, v13, v17, objc_msgSend(v6, "longLongAtIndex:", 7));
      v20[2](v20, v18);

      objc_autoreleasePoolPop(context);
    }
    while ((objc_msgSend(v6, "next") & 1) != 0);
  }

}

- (void)aggregateReportForAppTelemetryIdentifier:(int)a3 itemID:(id)a4 zoneMangledID:(id)a5 enhancedDrivePrivacyEnabled:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  int v26;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[BRCAccountSessionFPFS clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v16 = objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __120__BRCAnalyticsReporter_aggregateReportForAppTelemetryIdentifier_itemID_zoneMangledID_enhancedDrivePrivacyEnabled_error___block_invoke;
  v21[3] = &unk_24FE40BE0;
  v21[4] = self;
  v22 = v14;
  v26 = a3;
  v23 = v13;
  v24 = v12;
  v25 = v15;
  v17 = v15;
  v18 = v12;
  v19 = v13;
  v20 = v14;
  dispatch_async(v16, v21);

}

void __120__BRCAnalyticsReporter_aggregateReportForAppTelemetryIdentifier_itemID_zoneMangledID_enhancedDrivePrivacyEnabled_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __120__BRCAnalyticsReporter_aggregateReportForAppTelemetryIdentifier_itemID_zoneMangledID_enhancedDrivePrivacyEnabled_error___block_invoke_2;
  v3[3] = &unk_24FE40BB8;
  v4 = *(id *)(a1 + 40);
  v8 = *(_DWORD *)(a1 + 72);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "performWithFlags:action:", 4, v3);

}

uint64_t __120__BRCAnalyticsReporter_aggregateReportForAppTelemetryIdentifier_itemID_zoneMangledID_enhancedDrivePrivacyEnabled_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  id v21;

  v21 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
    v5 = CFSTR("0");
    if (v4)
      v5 = CFSTR("1");
    v6 = v5;
  }
  else
  {
    v6 = &stru_24FE4A790;
  }
  v7 = *(unsigned int *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "mangledIDString");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_24FE4A790;
  if (*(_QWORD *)(a1 + 48))
    v11 = *(const __CFString **)(a1 + 48);
  else
    v11 = &stru_24FE4A790;
  objc_msgSend(*(id *)(a1 + 56), "domain");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_24FE4A790;
  v15 = objc_msgSend(*(id *)(a1 + 56), "code");
  objc_msgSend(*(id *)(a1 + 56), "br_errorDescription");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_24FE4A790;
  v19 = objc_msgSend(v21, "execute:", CFSTR("INSERT INTO aggregated_daily_telemetry (app_telemetry_identifier, zone_mangled_id, item_id, enhanced_drive_privacy_enabled, error_domain, error_code, error_description) VALUES (%d, %@, %@, %@, %@, %ld, %@) ON CONFLICT DO UPDATE SET count=count+1"), v7, v10, v11, v6, v14, v15, v18);

  return v19;
}

- (void)aggregateReportForAppTelemetryIdentifier:(int)a3 error:(id)a4
{
  -[BRCAnalyticsReporter aggregateReportForAppTelemetryIdentifier:itemID:zoneMangledID:enhancedDrivePrivacyEnabled:error:](self, "aggregateReportForAppTelemetryIdentifier:itemID:zoneMangledID:enhancedDrivePrivacyEnabled:error:", *(_QWORD *)&a3, 0, 0, 0, a4);
}

- (void)deleteMissingErrorThrottles
{
  id v2;

  -[BRCAccountSessionFPFS clientDB](self->_session, "clientDB");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "execute:", CFSTR("DELETE FROM telemetry_failure_counts AS tf WHERE NOT EXISTS (SELECT 1 FROM server_items AS si WHERE si.item_id = tf.item_id AND si.zone_rowid = tf.zone_rowid) AND NOT item_id_is_root(tf.item_id)"));

}

- (void)didApplyItemInsideSharedItemID:(id)a3
{
  BRCAccountSessionFPFS *session;
  id v5;
  void *v6;
  BRCItemGlobalID *currentTelemetryItemGlobalID;

  session = self->_session;
  v5 = a3;
  -[BRCAccountSessionFPFS clientDB](session, "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertOnQueue");

  LODWORD(v6) = objc_msgSend(v5, "isEqualToItemGlobalID:", self->_currentTelemetryItemGlobalID);
  if ((_DWORD)v6)
  {
    currentTelemetryItemGlobalID = self->_currentTelemetryItemGlobalID;
    self->_currentTelemetryItemGlobalID = 0;

  }
}

+ (BOOL)isTelemetryReportingEnabled
{
  void *v2;
  int v3;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldReportTelemetryEvents");

  if (!v3)
    return 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("AllowiCloudAnalytics"), CFSTR("com.apple.Preferences"), 0))
    return 1;
  return objc_msgSend(MEMORY[0x24BE17688], "isInternalBuild");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appTelemetryConvertor, 0);
  objc_storeStrong((id *)&self->_rtcReporter, 0);
  objc_storeStrong((id *)&self->_syncConsistencyCancellationTimer, 0);
  objc_storeStrong((id *)&self->_syncConsistencyDeferralTimer, 0);
  objc_storeStrong((id *)&self->_currentTelemetryItemGlobalID, 0);
  objc_storeStrong((id *)&self->_syncHealthReport, 0);
  objc_storeStrong((id *)&self->_eventsByKind, 0);
  objc_storeStrong((id *)&self->_metricEndpoint, 0);
  objc_storeStrong((id *)&self->_waitOnIdleQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Failed to defer the activity for analytics%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Reporting analytics metrics%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_32_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] Failed to continue the xpc activity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __55__BRCAnalyticsReporter_registerBackgroundXPCActivities__block_invoke_35_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Checking sync consistency%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_handleApplySchedulerTimeoutWithActivity:telemetryEventType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Defering app telemetry gather for now%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_handleApplySchedulerTimeoutWithActivity:telemetryEventType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] Failed to defer the app telemetry xpc activity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_handleApplySchedulerTimeoutWithActivity:telemetryEventType:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] Failed to finish the app telemetry xpc activity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_gatherAppTelemetryEventsWithActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Finishing app telemetry gather because the session logged out%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_gatherAppTelemetryEventsWithActivity:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] Failed to set the app telemetry xpc activity state to done%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_230455000, v0, v1, "[ERROR] Failed to finish the app telemetry activity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v0, v1, "[CRIT] UNREACHABLE: %@ should be a directory%@");
  OUTLINED_FUNCTION_0();
}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_cold_4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)a1 + 64);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_230455000, v1, v2, "[CRIT] UNREACHABLE: We are already checking telemetry on %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

void __62__BRCAnalyticsReporter__gatherAppTelemetryEventsWithActivity___block_invoke_54_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_230455000, v1, v2, "[ERROR] Failed to generate a report for shared folder %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_0();
}

- (void)_setupSyncConsistencyDeferralTimerWithActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Already have a deferral timer registered%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __71__BRCAnalyticsReporter__setupSyncConsistencyDeferralTimerWithActivity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Can't defer the sync consistency activity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_setupSyncConsistencyCancellationTimerWithActivity:session:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Already have a cancellation timer registered%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_resumePausedTreeConsistencyCheckOperationWithActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Successfully resumed existing tree consistency operation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_resumePausedTreeConsistencyCheckOperationWithActivity:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Failed resuming tree consistency operation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_230455000, v0, v1, "[ERROR] error connecting to telemetry-disk-checker xpc service: %@%@");
  OUTLINED_FUNCTION_0();
}

void __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Failed to defer the xpc activity%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __58__BRCAnalyticsReporter__checkSyncConsistencyWithActivity___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Deferring activity because a snapshot already exists%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __66__BRCAnalyticsReporter_createFSEventToSyncUpEventForFileID_genID___block_invoke_cold_1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14();
  objc_msgSend(v0, "fileID");
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_11_0(&dword_230455000, v1, v2, "[DEBUG] analytics: creating %@ event for fileID %lld%@", v3, v4, v5, v6, 2u);
}

void __86__BRCAnalyticsReporter_createUserDownloadEventForOperationID_isRecursive_isForBackup___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_15_0();
  v4 = v0;
  OUTLINED_FUNCTION_3(&dword_230455000, v1, v2, "[DEBUG] analytics: creating %@ event%@", v3);
  OUTLINED_FUNCTION_0();
}

@end
