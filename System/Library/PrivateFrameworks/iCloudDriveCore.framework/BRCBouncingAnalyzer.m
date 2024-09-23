@implementation BRCBouncingAnalyzer

- (BRCBouncingAnalyzer)initWithTapToRadarManager:(id)a3 analyticsReporter:(id)a4
{
  id v7;
  id v8;
  BRCBouncingAnalyzer *v9;
  BRCBouncingAnalyzer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCBouncingAnalyzer;
  v9 = -[BRCBouncingAnalyzer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tapToRadarManager, a3);
    objc_storeStrong((id *)&v10->_analyticsReporter, a4);
  }

  return v10;
}

- (void)close
{
  BRCTapToRadarManager *tapToRadarManager;
  BRCAnalyticsReporter *analyticsReporter;

  tapToRadarManager = self->_tapToRadarManager;
  self->_tapToRadarManager = 0;

  analyticsReporter = self->_analyticsReporter;
  self->_analyticsReporter = 0;

}

- (void)reportInitialScanItemTypeMismatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BRCTapToRadarManager *tapToRadarManager;
  void *v9;
  id v10;

  v4 = a3;
  +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureLogsForOperationType:ofSubtype:forError:waitForCompletion:", CFSTR("SyncHealth"), CFSTR("InitialScanBounce"), 0, 0);

  -[BRCAnalyticsReporter aggregateReportForAppTelemetryIdentifier:error:](self->_analyticsReporter, "aggregateReportForAppTelemetryIdentifier:error:", 300, 0);
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("Item %@ type was not compatible with local initial scan item"), v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  tapToRadarManager = self->_tapToRadarManager;
  objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInitialScanItemTypeMismatch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCTapToRadarManager requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:](tapToRadarManager, "requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:", CFSTR("[Bouncing] Initial scan item type mismatch"), v10, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 1, CFSTR("type mismatch between server and client item during reimport"), v9);

}

- (BOOL)analyzeServerBouncingOriginalRecord:(id)a3 savedRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BRCTapToRadarManager *tapToRadarManager;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id location;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("structure"));

  if (v9)
  {
    v33 = 0;
    location = 0;
    v31 = 0;
    v32 = 0;
    v29 = 0;
    v30 = 0;
    if (!objc_msgSend(v6, "deserializeFilename:basename:bounceno:extension:userInfo:error:", 0, &location, &v33, &v32, 0, 0)|| !objc_msgSend(v7, "deserializeFilename:basename:bounceno:extension:userInfo:error:", 0, &v31, &v30, &v29, 0, 0))
    {
      goto LABEL_21;
    }
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "recordID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414082;
      v36 = v28;
      v37 = 2112;
      v38 = location;
      v39 = 2112;
      v40 = v33;
      v41 = 2112;
      v42 = v32;
      v43 = 2112;
      v44 = v31;
      v45 = 2112;
      v46 = v30;
      v47 = 2112;
      v48 = v29;
      v49 = 2112;
      v50 = v10;
      _os_log_debug_impl(&dword_230455000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] RecordID: %@ orig:<baseName: %@ bounceNo: %@ extension: %@> -> saved:<baseName: %@ bounceNo: %@ extension: %@>%@", buf, 0x52u);

    }
    v12 = location ? location : &stru_24FE4A790;
    objc_storeStrong(&location, v12);
    v13 = v31 ? v31 : &stru_24FE4A790;
    objc_storeStrong(&v31, v13);
    v14 = v32 ? v32 : &stru_24FE4A790;
    objc_storeStrong(&v32, v14);
    v15 = v29 ? v29 : &stru_24FE4A790;
    objc_storeStrong(&v29, v15);
    if (objc_msgSend(location, "isEqualToString:", v31)
      && objc_msgSend(v32, "isEqualToString:", v29)
      && (objc_msgSend(v33, "br_isEqualToNumber:", v30) & 1) == 0)
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCBouncingAnalyzer analyzeServerBouncingOriginalRecord:savedRecord:].cold.1(v6, (uint64_t)v18, v19);

      +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "captureLogsForOperationType:ofSubtype:forError:waitForCompletion:", CFSTR("SyncHealth"), CFSTR("ServerBouncedItem"), 0, 0);

      objc_msgSend(v6, "pluginFields");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("br_initialItem"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v6, "recordID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("Item %@ got bounced by server after being set that it is from initial scan"), v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        tapToRadarManager = self->_tapToRadarManager;
        objc_msgSend(MEMORY[0x24BDD1540], "brc_errorRecordBouncedByServer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 1;
        -[BRCTapToRadarManager requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:](tapToRadarManager, "requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:", CFSTR("[Bouncing] Initial scan item got bounced by server"), v25, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 1, CFSTR("reimported item got bounced by server"), v27);

      }
      else
      {
        v16 = 1;
      }
    }
    else
    {
LABEL_21:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)analyzeServerBouncingOfItem:(id)a3 withServerItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  BOOL v25;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "isLive"))
  {
    v30 = 0;
    objc_msgSend(v6, "st");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logicalNameWithoutLocalBounce");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v10, "br_stringByDeletingPathBounceNo:andPathExtension:", &v30, &v29);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = (__CFString *)v29;

    if (v11)
      v13 = v11;
    else
      v13 = &stru_24FE4A790;
    v14 = v13;

    if (v12)
      v15 = v12;
    else
      v15 = &stru_24FE4A790;
    v16 = v15;

    v28 = 0;
    objc_msgSend(v8, "st");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logicalName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v18, "br_stringByDeletingPathBounceNo:andPathExtension:", &v28, &v27);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = (__CFString *)v27;

    if (v19)
      v21 = v19;
    else
      v21 = &stru_24FE4A790;
    v22 = v21;

    if (v20)
      v23 = v20;
    else
      v23 = &stru_24FE4A790;
    v24 = v23;

    if (-[__CFString isEqualToString:](v14, "isEqualToString:", v22)
      && -[__CFString isEqualToString:](v16, "isEqualToString:", v24)
      && v30 != v28)
    {
      -[BRCAnalyticsReporter aggregateReportForAppTelemetryIdentifier:error:](self->_analyticsReporter, "aggregateReportForAppTelemetryIdentifier:error:", 503, 0);
      v25 = 1;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)_isGenericUntitledFileName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _BRLocalizedStringWithFormat();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedLowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "st");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "logicalName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedLowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v10, "hasPrefix:", v7);
  return (char)v8;
}

- (int)analyzeBouncingOfItem:(id)a3 withServerItem:(id)a4 bounceReason:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BRCTapToRadarManager *tapToRadarManager;
  void *v15;

  v8 = a3;
  v9 = a4;
  if (a5 == 501)
  {
    if ((objc_msgSend(v8, "isDead") & 1) != 0)
    {
      a5 = 513;
    }
    else if ((objc_msgSend(v8, "isFromInitialScan") & 1) != 0)
    {
      a5 = 517;
    }
    else if ((objc_msgSend(v8, "isKnownByServer") & 1) != 0)
    {
      if ((objc_msgSend(v8, "localDiffs") & 0x20) != 0)
      {
        a5 = 515;
      }
      else if ((objc_msgSend(v8, "localDiffs") & 0x40) != 0)
      {
        a5 = 516;
      }
      else if (-[BRCBouncingAnalyzer _isGenericUntitledFileName:](self, "_isGenericUntitledFileName:", v9))
      {
        if (objc_msgSend(v8, "isChildSharedItem") && (objc_msgSend(v9, "isChildSharedItem") & 1) != 0)
          a5 = 518;
        else
          a5 = 519;
      }
      else
      {
        a5 = 501;
      }
    }
    else
    {
      if (objc_msgSend(v8, "isDirectory") && objc_msgSend(v9, "isDirectory"))
      {
        +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "captureLogsForOperationType:ofSubtype:forError:waitForCompletion:", CFSTR("SyncHealth"), CFSTR("CollidingDirectoryApplyNotKnownByServerBounce"), 0, 0);

        v11 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v8, "itemID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("Directory %@ got bounced due to a colliding new directory applied on server"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        tapToRadarManager = self->_tapToRadarManager;
        objc_msgSend(MEMORY[0x24BDD1540], "brc_errorBouncedItemNotKnownByServer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCTapToRadarManager requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:](tapToRadarManager, "requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:", CFSTR("[Bouncing] Directory name collision when applying from server"), v13, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 1, CFSTR("directory bounced due to a new directory applied from server"), v15);

      }
      a5 = 514;
    }
  }

  return a5;
}

- (void)analyzeBouncingOfItem:(id)a3 withTemplateItem:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BRCTapToRadarManager *tapToRadarManager;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (objc_msgSend(v15, "isDirectory"))
  {
    objc_msgSend(v6, "contentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "br_isDirectoryType");

    if (v8)
    {
      +[BRCAutoBugCaptureReporter sharedABCReporter](BRCAutoBugCaptureReporter, "sharedABCReporter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "captureLogsForOperationType:ofSubtype:forError:waitForCompletion:", CFSTR("SyncHealth"), CFSTR("CollidingDirectoryBounceInFPCreate"), 0, 0);

      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v15, "itemID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Directory %@ got bounced due to a colliding new directory created on disk"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      tapToRadarManager = self->_tapToRadarManager;
      objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInitialScanItemBouncedByServer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRCTapToRadarManager requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:](tapToRadarManager, "requestTapToRadarWithTitle:description:keywords:attachments:sendFullLog:displayReason:triggerRootCause:", CFSTR("[Bouncing] Directory name collision when creating new item"), v12, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 1, CFSTR("directory bounced due to a new directory created on disk"), v14);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_tapToRadarManager, 0);
}

- (void)analyzeServerBouncingOriginalRecord:(NSObject *)a3 savedRecord:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pluginFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_debug_impl(&dword_230455000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Server bounced record %@. Plugin fields: %@%@", (uint8_t *)&v8, 0x20u);

}

@end
