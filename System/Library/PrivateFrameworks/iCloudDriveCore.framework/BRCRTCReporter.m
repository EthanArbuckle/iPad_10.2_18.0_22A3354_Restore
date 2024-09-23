@implementation BRCRTCReporter

- (void)_init
{
  uint64_t v3;
  NSDictionary *v4;
  NSDictionary *userInfo;
  BRCDeviceConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *globalPayload;
  void *v18;
  NSArray *v19;
  NSArray *allowedZoneNamePrefixes;
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE7CB30];
  v23[0] = *MEMORY[0x24BE7CB20];
  v23[1] = v3;
  v24[0] = CFSTR("bird");
  v24[1] = CFSTR("clouddocs");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  userInfo = self->_userInfo;
  self->_userInfo = v4;

  v6 = objc_alloc_init(BRCDeviceConfiguration);
  -[BRCDeviceConfiguration getConfiguration](v6, "getConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("isIcloudAnalyticsFlagOn");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[BRCAnalyticsReporter isTelemetryReportingEnabled](BRCAnalyticsReporter, "isTelemetryReportingEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  v21[1] = CFSTR("isDesktopEnabled");
  v9 = (void *)MEMORY[0x24BDD16E0];
  +[BRCAccountHandler currentiCloudAccount](BRCAccountHandler, "currentiCloudAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "br_isEnabledForDesktopSync"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  v21[2] = CFSTR("isEDS");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EDS"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v12;
  v21[3] = CFSTR("isFPFS");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FPFS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v13;
  v21[4] = CFSTR("isTestDevice");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TESTING"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v14;
  v21[5] = CFSTR("isSharedIPad");
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SHARED_IPAD"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  globalPayload = self->_globalPayload;
  self->_globalPayload = v16;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "telemetryRTCAllowedZoneNamePrefixes");
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  allowedZoneNamePrefixes = self->_allowedZoneNamePrefixes;
  self->_allowedZoneNamePrefixes = v19;

}

- (BRCRTCReporter)initWithFPRTCReportingSession:(id)a3
{
  id v5;
  BRCRTCReporter *v6;
  BRCRTCReporter *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *pacerQueue;
  uint64_t v13;
  br_pacer *reportingPacer;
  NSMutableDictionary *v15;
  NSMutableDictionary *events;
  BRCRTCReporter *v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRCRTCReporter;
  v6 = -[BRCRTCReporter init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reportingManager, a3);
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "telemetryRTCPacerMinFireInterval");

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.rtc.pacer.queue", v10);

    pacerQueue = v7->_pacerQueue;
    v7->_pacerQueue = (OS_dispatch_queue *)v11;

    br_pacer_create();
    v13 = objc_claimAutoreleasedReturnValue();
    reportingPacer = v7->_reportingPacer;
    v7->_reportingPacer = (br_pacer *)v13;

    v18 = v7;
    br_pacer_set_event_handler();
    br_pacer_resume();
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    events = v18->_events;
    v18->_events = v15;

    -[BRCRTCReporter _init](v18, "_init");
  }

  return v7;
}

uint64_t __48__BRCRTCReporter_initWithFPRTCReportingSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processReportingBatch");
}

- (BRCRTCReporter)init
{
  void *v3;
  void *v4;
  NSObject *v5;
  BRCRTCReporter *v6;

  objc_msgSend(MEMORY[0x24BE31408], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      -[BRCRTCReporter init].cold.1((uint64_t)v4, v5);

  }
  v6 = -[BRCRTCReporter initWithFPRTCReportingSession:](self, "initWithFPRTCReportingSession:", v3);

  return v6;
}

- (void)close
{
  NSObject *pacerQueue;
  _QWORD block[5];

  pacerQueue = self->_pacerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__BRCRTCReporter_close__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  dispatch_sync(pacerQueue, block);
}

uint64_t __23__BRCRTCReporter_close__block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  objc_sync_exit(v2);

  return br_pacer_cancel();
}

- (BOOL)_shouldRemoveZoneNameWithPayload:(id)a3
{
  void *v4;
  void *v5;
  NSArray *allowedZoneNamePrefixes;
  char v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("zoneName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    allowedZoneNamePrefixes = self->_allowedZoneNamePrefixes;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__BRCRTCReporter__shouldRemoveZoneNameWithPayload___block_invoke;
    v9[3] = &unk_24FE47D18;
    v10 = v4;
    v7 = -[NSArray br_none_of:](allowedZoneNamePrefixes, "br_none_of:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __51__BRCRTCReporter__shouldRemoveZoneNameWithPayload___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2);
}

- (void)_processReportingBatch
{
  NSMutableDictionary *v3;
  id v4;

  v3 = self->_events;
  objc_sync_enter(v3);
  v4 = (id)-[NSMutableDictionary copy](self->_events, "copy");
  -[NSMutableDictionary removeAllObjects](self->_events, "removeAllObjects");
  objc_sync_exit(v3);

  if (objc_msgSend(v4, "count"))
    -[FPRTCReportingSessionManager postMultipleReports:type:userinfo:session:observer:](self->_reportingManager, "postMultipleReports:type:userinfo:session:observer:", v4, 1, self->_userInfo, 0, 0);

}

- (void)postReportWithCategory:(unint64_t)a3 type:(unint64_t)a4 payload:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *events;
  void *v14;
  void *v15;
  id v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a5;
  v9 = a6;
  if (-[BRCRTCReporter _shouldRemoveZoneNameWithPayload:](self, "_shouldRemoveZoneNameWithPayload:", v22))
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("private"), CFSTR("zoneName"));
  if (v22)
  {
    v10 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_msgSend(v10, "addEntriesFromDictionary:", self->_globalPayload);
  v12 = self->_events;
  objc_sync_enter(v12);
  events = self->_events;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](events, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = self->_events;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

  }
  v19 = self->_events;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v11);

  objc_sync_exit(v12);
  br_pacer_signal();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_reportingPacer, 0);
  objc_storeStrong((id *)&self->_pacerQueue, 0);
  objc_storeStrong((id *)&self->_allowedZoneNamePrefixes, 0);
  objc_storeStrong((id *)&self->_globalPayload, 0);
  objc_storeStrong((id *)&self->_reportingManager, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (void)init
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230455000, a2, (os_log_type_t)0x90u, "[ERROR] BRCRTCReporter Failed to start%@", (uint8_t *)&v2, 0xCu);
}

@end
