@implementation SUScheduler

- (SUScheduler)init
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)SUScheduler;
  v2 = -[SUScheduler init](&v38, sel_init);
  if (v2)
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v2 + 16) = objc_msgSend(v3, "useSUCoreXPCActivityScheduler");

    if (*((_BYTE *)v2 + 16))
    {
      objc_msgSend(MEMORY[0x24BEAE880], "sharedInstance");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)*((_QWORD *)v2 + 3);
      *((_QWORD *)v2 + 3) = v4;

      v6 = (void *)*((_QWORD *)v2 + 1);
      *((_QWORD *)v2 + 1) = 0;

      SULogInfo(CFSTR("Dumping scheduler state: %@"), v7, v8, v9, v10, v11, v12, v13, *((_QWORD *)v2 + 3));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEAE7D0], "sharedInstance");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)*((_QWORD *)v2 + 1);
      *((_QWORD *)v2 + 1) = v14;

      v16 = (void *)*((_QWORD *)v2 + 3);
      *((_QWORD *)v2 + 3) = 0;

    }
    +[SUServerConfigurationManager sharedInstance](SUServerConfigurationManager, "sharedInstance");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v17;

    objc_msgSend(*((id *)v2 + 4), "addListener:", v2);
    if (*((_BYTE *)v2 + 16))
      v26 = "new";
    else
      v26 = "legacy";
    SULogInfo(CFSTR("Using %s scheduler"), v19, v20, v21, v22, v23, v24, v25, (uint64_t)v26);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create("com.apple.softwareupdateservicesd.scheduler", v27);
    v29 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v28;

    +[SUManagerInterfaceFactory sharedInstance](SUManagerInterfaceFactory, "sharedInstance");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v30;

    +[SUManagerServer sharedInstance](SUManagerServer, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "autoInstallManager");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v33;

    v35 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = 0;

    v36 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = 0;

  }
  return (SUScheduler *)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SUServerConfigurationManager removeListener:](self->_serverConfigManager, "removeListener:", self);
  -[SUScheduler _invalidateRetryAutoInstallaTimer](self, "_invalidateRetryAutoInstallaTimer");
  v3.receiver = self;
  v3.super_class = (Class)SUScheduler;
  -[SUScheduler dealloc](&v3, sel_dealloc);
}

+ (id)sharedInstance
{
  if (sharedInstance_pred_3 != -1)
    dispatch_once(&sharedInstance_pred_3, &__block_literal_global_17);
  return (id)sharedInstance___instance_7;
}

void __29__SUScheduler_sharedInstance__block_invoke()
{
  SUScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(SUScheduler);
  v1 = (void *)sharedInstance___instance_7;
  sharedInstance___instance_7 = (uint64_t)v0;

}

- (void)scheduleStartupTasksIfNecessary
{
  -[SUScheduler scheduleBackgroundScanIfNecessary:scanType:](self, "scheduleBackgroundScanIfNecessary:scanType:", CFSTR("com.apple.softwareupdateservicesd.activity.autoScan"), 0);
  -[SUScheduler scheduleAutodownloadIfNecessary](self, "scheduleAutodownloadIfNecessary");
  -[SUScheduler scheduleAnalyticsSubmissionIfNecessary](self, "scheduleAnalyticsSubmissionIfNecessary");
}

- (void)cancelAllStartupTasks
{
  -[SUScheduler cancelAllAutoscanTasks](self, "cancelAllAutoscanTasks");
  -[SUScheduler cancelAutodownloadTask](self, "cancelAutodownloadTask");
}

- (void)cancelAllAutoscanTasks
{
  -[SUScheduler cancelAllBackgroundScans](self, "cancelAllBackgroundScans");
  -[SUScheduler cancelAllEmergencyBackgroundScans](self, "cancelAllEmergencyBackgroundScans");
}

- (void)scheduleAllAutoInstallUpdateTasks:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[SUScheduler scheduleAutoInstallExpirationTask:](self, "scheduleAutoInstallExpirationTask:", v7);
  -[SUScheduler scheduleAutoInstallUnlockWindowStartTask:](self, "scheduleAutoInstallUnlockWindowStartTask:", v7);
  -[SUScheduler scheduleAutoInstallGetKeybagTaskForDescriptor:](self, "scheduleAutoInstallGetKeybagTaskForDescriptor:", v6);
  -[SUScheduler scheduleAutoInstallStartInstallTask:descriptor:](self, "scheduleAutoInstallStartInstallTask:descriptor:", v7, v6);

}

- (void)cancelAllAutoInstallTasks
{
  -[SUScheduler cancelAllAutoInstallTasksIncludingStartInstallTask:](self, "cancelAllAutoInstallTasksIncludingStartInstallTask:", 1);
}

- (void)cancelAllAutoInstallTasksIncludingStartInstallTask:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  -[SUScheduler cancelAutoInstallWindowExpirationTask](self, "cancelAutoInstallWindowExpirationTask");
  -[SUScheduler cancelAutoInstallUnlockWindowStartTask](self, "cancelAutoInstallUnlockWindowStartTask");
  -[SUScheduler cancelAutoInstallGetKeybagTask](self, "cancelAutoInstallGetKeybagTask");
  if (v3)
  {
    SULogDebug(CFSTR("Will cancelAutoInstallStartInstallTask"), v5, v6, v7, v8, v9, v10, v11, v12);
    -[SUScheduler cancelAutoInstallStartInstallTask](self, "cancelAutoInstallStartInstallTask");
  }
  else
  {
    SULogDebug(CFSTR("Will not cancelAutoInstallStartInstallTask"), v5, v6, v7, v8, v9, v10, v11, v12);
  }
  -[SUScheduler cancelPresentAutoUpdateBanner](self, "cancelPresentAutoUpdateBanner");
}

- (void)scheduleBackgroundScanIfNecessary:(id)a3 scanType:(int *)a4
{
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v6 = -[SUScheduler _activityIsScheduled:cancelIfExpired:](self, "_activityIsScheduled:cancelIfExpired:", v25, 1);
  if (self->_useSUCoreXPCActivityManager
    && -[SUScheduler activityWasPreviouslyScheduledForFutureDate:copy:](self, "activityWasPreviouslyScheduledForFutureDate:copy:", v25, 0))
  {
    -[SUCoreXPCActivityManager getExpectedRunDateForActivity:](self->_coreXPCActivityScheduler, "getExpectedRunDateForActivity:", v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("%@ was previously scheduled to run at %@. Re-scheduling for the same time"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v25);

    if (v7)
    {
LABEL_7:
      +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("Expired or no background scan activity found for %@. Rescheduling for %@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v25);

      -[SUScheduler scheduleBackgroundScan:scanDate:](self, "scheduleBackgroundScan:scanDate:", v25, v7);
      goto LABEL_8;
    }
LABEL_6:
    -[SUScheduler _randomizedAutoScanDelayForType:](self, "_randomizedAutoScanDelayForType:", a4);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)(int)v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v6)
    goto LABEL_6;
LABEL_8:

}

- (void)scheduleBackgroundScan:(id)a3 scanDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BEAE7C8]);
  v15 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setRunDate:", v6);
    objc_msgSend(v15, "setNetworkState:", 2);
    objc_msgSend(v15, "setWaking:", 2);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE7C0]), "initWithActivityName:options:", v17, v15);
    -[SUScheduler _scheduleActivity:](self, "_scheduleActivity:", v16);

  }
  else
  {
    SULogError(CFSTR("Failed to create options for activity %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v17);
  }

}

- (void)scheduleBackgroundScan:(id)a3
{
  -[SUScheduler scheduleBackgroundScan:scanDate:](self, "scheduleBackgroundScan:scanDate:", CFSTR("com.apple.softwareupdateservicesd.activity.autoScan"), a3);
}

- (void)scheduleSplatBackgroundScan:(id)a3
{
  -[SUScheduler scheduleBackgroundScan:scanDate:](self, "scheduleBackgroundScan:scanDate:", CFSTR("com.apple.softwareupdateservicesd.activity.splatAutoScan"), a3);
}

- (void)scheduleDelayEndAutoScan:(id)a3
{
  -[SUScheduler scheduleBackgroundScan:scanDate:](self, "scheduleBackgroundScan:scanDate:", CFSTR("com.apple.softwareupdateservicesd.activity.delayEndScan"), a3);
}

- (void)cancelAllBackgroundScans
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SUScheduler_cancelAllBackgroundScans__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __39__SUScheduler_cancelAllBackgroundScans__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", CFSTR("com.apple.softwareupdateservicesd.activity.autoScan"));
}

- (void)cancelAllEmergencyBackgroundScans
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUScheduler_cancelAllEmergencyBackgroundScans__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __48__SUScheduler_cancelAllEmergencyBackgroundScans__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", CFSTR("com.apple.softwareupdateservicesd.activity.emergencyAutoScan"));
}

- (void)scheduleAutodownloadIfNecessary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;

  if (-[SUManagerInterface isDownloading](self->_manager, "isDownloading"))
  {
    SULogInfo(CFSTR("[Auto download] Not scheduling auto download: Currently Downloading"), v3, v4, v5, v6, v7, v8, v9, v72);
    return;
  }
  +[SUState currentState](SUState, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastAutoDownloadDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    SULogInfo(CFSTR("[Auto download] Setting last auto download date to now since it is nil"), v12, v13, v14, v15, v16, v17, v18, v68);
    +[SUState currentState](SUState, "currentState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLastAutoDownloadDate:", v20);

  }
  v71 = 0;
  v21 = -[SUScheduler _activityIsScheduled:cancelIfExpired:scheduledActivity:](self, "_activityIsScheduled:cancelIfExpired:scheduledActivity:", CFSTR("com.apple.softwareupdateservicesd.activity.autoDownload"), 0, &v71);
  v22 = v71;
  v30 = v22;
  if (self->_useSUCoreXPCActivityManager)
  {
    v70 = 0;
    v31 = -[SUScheduler activityWasPreviouslyScheduledForFutureDate:copy:](self, "activityWasPreviouslyScheduledForFutureDate:copy:", CFSTR("com.apple.softwareupdateservicesd.activity.autoDownload"), &v70);
    v32 = v70;
    v33 = v32;
    if (v31)
    {
      objc_msgSend(v32, "runDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        objc_msgSend(v33, "runDate");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("Found auto download which was previously set to run on %@ but is not currently scheduled"), v43, v44, v45, v46, v47, v48, v49, (uint64_t)v42);

      }
      else
      {
        SULogInfo(CFSTR("Found auto download which was previously set to run on %@ but is not currently scheduled"), v34, v35, v36, v37, v38, v39, v40, (uint64_t)CFSTR("Unknown Date"));
      }

    }
    else
    {

      v33 = v30;
      if (!v21)
        goto LABEL_21;
    }
  }
  else
  {
    v33 = v22;
    if (!v21)
      goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    SULogInfo(CFSTR("[Auto download] Found auto download activity: %@"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)v33);
    -[SUScheduler cancelAutodownloadTask](self, "cancelAutodownloadTask");
    objc_msgSend(v33, "runDate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v58, "compare:", v57) != 1)
      {
LABEL_24:

        v66 = objc_msgSend(v33, "plugInState");
        objc_msgSend(v33, "batteryLevelGreaterThan");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUScheduler scheduleAutoDownloadWithDate:requirePower:minimumPowerRquirement:](self, "scheduleAutoDownloadWithDate:requirePower:minimumPowerRquirement:", v57, v66, v67);

        -[SUManagerInterface loadBrainOnUnlock](self->_manager, "loadBrainOnUnlock");
        goto LABEL_25;
      }
      SULogInfo(CFSTR("[Auto download] Auto download activity had a run date in the past(%@). Clearing it for next schedule attempt"), v59, v60, v61, v62, v63, v64, v65, (uint64_t)v57);

    }
    else
    {
      SULogInfo(CFSTR("[Auto download] Setting runDate for autoDownload activity to nil because of invalid/unset runDate on downloadActivity object"), v50, v51, v52, v53, v54, v55, v56, v69);
      v58 = v57;
    }
    v57 = 0;
    goto LABEL_24;
  }
  v30 = v33;
LABEL_21:
  SULogInfo(CFSTR("[Auto download] Not re-scheduling autoDownload since it was not previously scheduled"), v23, v24, v25, v26, v27, v28, v29, v68);
  v33 = v30;
LABEL_25:

}

- (void)scheduleAutoDownloadWithDate:(id)a3 requirePower:(int)a4 minimumPowerRquirement:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *schedulerQueue;
  uint64_t v29;
  _QWORD block[5];

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "intValue");
  SULogInfo(CFSTR("Scheduling an auto download for %@; requirePower=%d, minimumPowerRequirement=%d"),
    v10,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
    (uint64_t)v8);
  if (v8)
  {
    v24 = objc_alloc_init(MEMORY[0x24BEAE7C8]);
    v25 = v24;
    if (a4 == 1)
      v26 = 0;
    else
      v26 = a4;
    objc_msgSend(v24, "setPlugInState:", v26);
    objc_msgSend(v25, "setWifiState:", 2);
    objc_msgSend(v25, "setWaking:", 2);
    objc_msgSend(v25, "setRunDate:", v8);
    if (a4 == 1 && v9)
      objc_msgSend(v25, "setBatteryLevelGreaterThan:", v9);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE7C0]), "initWithActivityName:options:", CFSTR("com.apple.softwareupdateservicesd.activity.autoDownload"), v25);
    -[SUScheduler _scheduleActivity:](self, "_scheduleActivity:", v27);

  }
  else
  {
    SULogInfo(CFSTR("runDate is nil for auto download; start immediately"), v17, v18, v19, v20, v21, v22, v23, v29);
    schedulerQueue = self->_schedulerQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __80__SUScheduler_scheduleAutoDownloadWithDate_requirePower_minimumPowerRquirement___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(schedulerQueue, block);
  }

}

uint64_t __80__SUScheduler_scheduleAutoDownloadWithDate_requirePower_minimumPowerRquirement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleAutoDownload:info:", CFSTR("com.apple.softwareupdateservicesd.activity.autoDownload"), 0);
}

- (void)cancelAutodownloadTask
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SUScheduler_cancelAutodownloadTask__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __37__SUScheduler_cancelAutodownloadTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", CFSTR("com.apple.softwareupdateservicesd.activity.autoDownload"));
}

- (void)scheduleAutoInstallExpirationTask:(id)a3
{
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "suEndDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEAE7C8]);
    objc_msgSend(v4, "setWaking:", 2);
    objc_msgSend(v4, "setRunDate:", v6);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE7C0]), "initWithActivityName:options:", CFSTR("com.apple.softwareupdateservicesd.activity.autoInstallEnd"), v4);
    -[SUScheduler _scheduleActivity:](self, "_scheduleActivity:", v5);

  }
}

- (void)cancelAutoInstallWindowExpirationTask
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SUScheduler_cancelAutoInstallWindowExpirationTask__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __52__SUScheduler_cancelAutoInstallWindowExpirationTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", CFSTR("com.apple.softwareupdateservicesd.activity.autoInstallEnd"));
}

- (void)scheduleAutoInstallUnlockWindowStartTask:(id)a3
{
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "unlockStartDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEAE7C8]);
    objc_msgSend(v4, "setWaking:", 2);
    objc_msgSend(v4, "setRunDate:", v6);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE7C0]), "initWithActivityName:options:", CFSTR("com.apple.softwareupdateservicesd.activity.autoInstallUnlock"), v4);
    -[SUScheduler _scheduleActivity:](self, "_scheduleActivity:", v5);

  }
}

- (void)cancelAutoInstallUnlockWindowStartTask
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SUScheduler_cancelAutoInstallUnlockWindowStartTask__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __53__SUScheduler_cancelAutoInstallUnlockWindowStartTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", CFSTR("com.apple.softwareupdateservicesd.activity.autoInstallUnlock"));
}

- (id)_next7OClockFrom:(id)a3 after:(double)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "dateByAddingTimeInterval:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  specificTimeOnDate(v4, 7, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  specificTimeOnDate(v4, 19, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", 86400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "compare:", v5);
  v9 = v5;
  if (v8 == 1)
  {
    if (objc_msgSend(v4, "compare:", v6) == 1)
      v9 = v7;
    else
      v9 = v6;
  }
  v10 = v9;

  return v10;
}

- (void)_scheduleAutoInstallGetKeybagTaskForDate:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BEAE7C8];
    v5 = a3;
    v7 = objc_alloc_init(v4);
    objc_msgSend(v7, "setRunDate:", v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE7C0]), "initWithActivityName:options:", CFSTR("com.apple.softwareupdateservicesd.activity.autoInstallGetKeybag"), v7);
    -[SUScheduler _scheduleActivity:](self, "_scheduleActivity:", v6);

  }
}

- (void)scheduleAutoInstallGetKeybagTaskForDescriptor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  id v18;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "now");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SUScheduler _next7OClockFrom:after:](self, "_next7OClockFrom:after:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "installationKeybagStateForDescriptor:", v5);

  if (v8 == 1)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:", v18);
    if (v16 > 3600.0)
    {
      objc_msgSend(v18, "dateByAddingTimeInterval:", 5.0);
      v17 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v17;
    }
  }
  SULogDebug(CFSTR("%s: trigger date = %@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[SUScheduler scheduleAutoInstallGetKeybagTaskForDescriptor:]");
  -[SUScheduler _scheduleAutoInstallGetKeybagTaskForDate:](self, "_scheduleAutoInstallGetKeybagTaskForDate:", v6);

}

- (void)cancelAutoInstallGetKeybagTask
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUScheduler_cancelAutoInstallGetKeybagTask__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __45__SUScheduler_cancelAutoInstallGetKeybagTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", CFSTR("com.apple.softwareupdateservicesd.activity.autoInstallGetKeybag"));
}

- (void)scheduleAutoInstallStartInstallTask:(id)a3 descriptor:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "suStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SUScheduler scheduleAutoInstallStartInstallTaskWithDate:descriptor:fromFailure:](self, "scheduleAutoInstallStartInstallTaskWithDate:descriptor:fromFailure:", v6, v7, 0);
    +[SUUtility writeAUKeepAliveFile](SUUtility, "writeAUKeepAliveFile");
  }

}

- (id)_autoInstallActivityCriteriaWithInstallDate:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  xpc_object_t empty;
  const char *v9;
  double v10;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SUInstallOptions *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v6 = a3;
  v7 = a4;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, (const char *)*MEMORY[0x24BDAC5D8], 0);
  if (v6)
  {
    v9 = (const char *)*MEMORY[0x24BDAC5B8];
    objc_msgSend(v6, "timeIntervalSinceNow");
    xpc_dictionary_set_int64(empty, v9, (uint64_t)v10);
  }
  xpc_dictionary_set_uint64(empty, (const char *)*MEMORY[0x24BDAC6B0], 0x1C20uLL);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x24BDAC640], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x24BDAC6E0], 1);
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v11, (const char *)objc_msgSend((id)*MEMORY[0x24BE2E258], "UTF8String"), 1);
  if (-[SUServerConfigurationManager defaultToOldInactivityPredictor](self->_serverConfigManager, "defaultToOldInactivityPredictor"))
  {
    SULogInfo(CFSTR("Defaulting to old inactivity predictor for autoInstall"), v12, v13, v14, v15, v16, v17, v18, v29);
    xpc_dictionary_set_BOOL(v11, (const char *)objc_msgSend((id)*MEMORY[0x24BE2E268], "UTF8String"), 1);
  }
  if (v7)
  {
    v19 = objc_alloc_init(SUInstallOptions);
    -[SUInstallOptions setAutomaticInstallation:](v19, "setAutomaticInstallation:", 1);
    v20 = (uint64_t)(float)(SURequiredBatteryLevelForInstallation(v7, v19) * 100.0);
    SULogInfo(CFSTR("Require %lld battery for das to fire"), v21, v22, v23, v24, v25, v26, v27, v20);
    xpc_dictionary_set_int64(v11, (const char *)objc_msgSend((id)*MEMORY[0x24BE2E260], "UTF8String"), v20);

  }
  xpc_dictionary_set_value(empty, (const char *)*MEMORY[0x24BDAC5C8], v11);

  return empty;
}

- (void)scheduleAutoInstallStartInstallTaskWithDate:(id)a3 descriptor:(id)a4 fromFailure:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  NSObject *schedulerQueue;
  _QWORD v16[5];
  id v17;
  double v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke;
  v19[3] = &unk_24CE3BB38;
  v19[4] = self;
  v11 = v8;
  v20 = v11;
  v12 = v9;
  v21 = v12;
  v13 = (void *)MEMORY[0x212BF6094](v19);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_schedulerQueue);
  objc_msgSend(v11, "timeIntervalSinceNow");
  schedulerQueue = self->_schedulerQueue;
  if (v5 && v14 > 0.0)
  {
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_4;
    v16[3] = &unk_24CE3DD08;
    v16[4] = self;
    v18 = v14;
    v17 = v13;
    dispatch_sync(schedulerQueue, v16);

  }
  else
  {
    dispatch_sync((dispatch_queue_t)self->_schedulerQueue, v13);
  }

}

void __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke(id *a1)
{
  const char *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD handler[4];
  id v7;
  id v8;
  id v9;

  dispatch_assert_queue_V2(*((dispatch_queue_t *)a1[4] + 5));
  objc_msgSend(a1[4], "_queue_cancelAutoInstallStartInstallTask");
  objc_msgSend(a1[4], "_queue_invalidateRetryAutoInstallaTimer");
  v2 = (const char *)objc_msgSend(CFSTR("com.apple.softwareupdate.autoinstall.startInstall"), "UTF8String");
  v3 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_2;
  handler[3] = &unk_24CE3DCB8;
  v4 = a1[5];
  v5 = a1[4];
  v7 = v4;
  v8 = v5;
  v9 = a1[6];
  xpc_activity_register(v2, v3, handler);

}

void __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_2(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  xpc_object_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD block[5];

  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    SULogInfo(CFSTR("DAS fired autoInstallStart activity"), v5, v6, v7, v8, v9, v10, v11, v32);
    objc_msgSend(*(id *)(a1 + 40), "setAutoinstallActivity:", v3);
    if (xpc_activity_should_defer(v3))
    {
      if (!xpc_activity_set_state(v3, 3))
      {
        +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
        v23 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_3;
        block[3] = &unk_24CE3B5C0;
        block[4] = *(_QWORD *)(a1 + 40);
        dispatch_async(v23, block);

      }
    }
    else
    {
      if (xpc_activity_set_state(v3, 4))
        SULogInfo(CFSTR("Successfully set %@ activity state to XPC_ACTIVITY_STATE_CONTINUE"), v25, v26, v27, v28, v29, v30, v31, (uint64_t)CFSTR("com.apple.softwareupdate.autoinstall.startInstall"));
      objc_msgSend(*(id *)(a1 + 40), "_queue_handleAutoInstallStart:info:", CFSTR("com.apple.softwareupdate.autoinstall.startInstall"), 0);
    }
    goto LABEL_14;
  }
  if (state)
  {
    v32 = state;
    v24 = CFSTR("Unknown XPC activity state (%ld) for activity %@");
LABEL_10:
    SULogInfo(v24, v5, v6, v7, v8, v9, v10, v11, v32);
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  v12 = xpc_activity_copy_criteria(v3);
  if (!v12)
  {
    v13 = xpc_dictionary_create(0, 0, 0);
    if (v13)
    {
      v14 = v13;
      +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", *(_QWORD *)(a1 + 32));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("Scheduled autoInstall start time for: %@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);

      objc_msgSend(*(id *)(a1 + 40), "_autoInstallActivityCriteriaWithInstallDate:descriptor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      xpc_activity_set_criteria(v3, v12);
      goto LABEL_15;
    }
    v24 = CFSTR("Failed to schedule AutoInstall start task");
    goto LABEL_10;
  }
LABEL_15:

}

uint64_t __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  SULogInfo(CFSTR("Attempted to defer autoInstallStart activity but failed."), a2, a3, a4, a5, a6, a7, a8, v10);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "trySchedulingAutoInstallAgainLater");
}

void __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_4(double *a1)
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v17[0] = MEMORY[0x24BDAC760];
  v17[2] = __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_5;
  v17[3] = &unk_24CE3DCE0;
  v2 = (void *)*((_QWORD *)a1 + 5);
  *(double *)&v17[4] = a1[4];
  v3 = (void *)MEMORY[0x24BDBCF40];
  v4 = a1[6];
  v17[1] = 3221225472;
  v18 = v2;
  objc_msgSend(v3, "timerWithTimeInterval:repeats:block:", 0, v17, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *((_QWORD *)a1 + 4);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v5;

  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTimer:forMode:", *(_QWORD *)(*((_QWORD *)a1 + 4) + 72), *MEMORY[0x24BDBCA90]);

  objc_msgSend(*(id *)(*((_QWORD *)a1 + 4) + 72), "fireDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("%s: Try to reschedule %@ on %@ due to a previous failure; timer (%p)"),
    v9,
    v10,
    v11,
    v12,
    v13,
    v14,
    v15,
    (uint64_t)"-[SUScheduler scheduleAutoInstallStartInstallTaskWithDate:descriptor:fromFailure:]_block_invoke_4");

}

void __82__SUScheduler_scheduleAutoInstallStartInstallTaskWithDate_descriptor_fromFailure___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(CFSTR("%s: retryAutoInstallTimer(%@) fired!"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUScheduler scheduleAutoInstallStartInstallTaskWithDate:descriptor:fromFailure:]_block_invoke_5");
  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
  dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40), *(dispatch_block_t *)(a1 + 40));
}

- (void)scheduleSimulatedAutoInstallTask
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  _QWORD handler[5];

  if (+[SUUtility currentReleaseTypeIsInternal](SUUtility, "currentReleaseTypeIsInternal"))
  {
    SULogInfo(CFSTR("%s: Scheduled simulated auto install activity"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUScheduler scheduleSimulatedAutoInstallTask]");
    -[SUScheduler _autoInstallActivityCriteriaWithInstallDate:descriptor:](self, "_autoInstallActivityCriteriaWithInstallDate:descriptor:", 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (const char *)objc_msgSend(CFSTR("com.apple.softwareupdate.autoinstall.simulated.startInstall"), "UTF8String");
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __47__SUScheduler_scheduleSimulatedAutoInstallTask__block_invoke;
    handler[3] = &unk_24CE3CC58;
    handler[4] = self;
    xpc_activity_register(v11, v10, handler);

  }
}

void __47__SUScheduler_scheduleSimulatedAutoInstallTask__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  _xpc_activity_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _xpc_activity_s *activity;

  activity = a2;
  v3 = xpc_activity_get_state(activity) == 2;
  v4 = activity;
  if (v3)
  {
    if (xpc_activity_should_defer(activity) && xpc_activity_set_state(activity, 3))
    {
      SULogInfo(CFSTR("%s: Simulated auto install activity deferred"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUScheduler scheduleSimulatedAutoInstallTask]_block_invoke");
    }
    else
    {
      SULogInfo(CFSTR("%s: Simulated auto install activity called"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUScheduler scheduleSimulatedAutoInstallTask]_block_invoke");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "reportSimulatedOTAAutoTriggeredEvent");
      if (!xpc_activity_set_state(activity, 5))
        SULogInfo(CFSTR("%s: Failed to set %@ activity state to XPC_ACTIVITY_STATE_DONE"), v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[SUScheduler scheduleSimulatedAutoInstallTask]_block_invoke");
      xpc_activity_unregister((const char *)objc_msgSend(CFSTR("com.apple.softwareupdate.autoinstall.simulated.startInstall"), "UTF8String"));
    }
    v4 = activity;
  }

}

- (void)setAutoInstallActivityStateDone
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUScheduler_setAutoInstallActivityStateDone__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

void __46__SUScheduler_setAutoInstallActivityStateDone__block_invoke(uint64_t a1)
{
  _xpc_activity_s *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;

  v1 = *(_xpc_activity_s **)(*(_QWORD *)(a1 + 32) + 64);
  if (v1)
  {
    if (xpc_activity_set_state(v1, 5))
      v9 = CFSTR("Succeeded to set %@ activity state to XPC_ACTIVITY_STATE_DONE");
    else
      v9 = CFSTR("Failed to set %@ activity state to XPC_ACTIVITY_STATE_DONE");
    SULogInfo(v9, v2, v3, v4, v5, v6, v7, v8, (uint64_t)CFSTR("com.apple.softwareupdate.autoinstall.startInstall"));
  }
}

- (void)cancelAutoInstallStartInstallTask
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUScheduler_cancelAutoInstallStartInstallTask__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

BOOL __48__SUScheduler_cancelAutoInstallStartInstallTask__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_cancelAutoInstallStartInstallTask");
  objc_msgSend(*(id *)(a1 + 32), "_queue_invalidateRetryAutoInstallaTimer");
  return +[SUUtility deleteAUKeepAliveFile](SUUtility, "deleteAUKeepAliveFile");
}

- (void)_queue_cancelAutoInstallStartInstallTask
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  if (self->_autoInstallActivity)
    -[SUScheduler _queue_setAutoinstallActivity:](self, "_queue_setAutoinstallActivity:", 0);
  xpc_activity_unregister((const char *)objc_msgSend(CFSTR("com.apple.softwareupdate.autoinstall.startInstall"), "UTF8String"));
  SULogInfo(CFSTR("%s: Tried to cancel the previous auto-install activity %@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUScheduler _queue_cancelAutoInstallStartInstallTask]");
}

- (void)_invalidateRetryAutoInstallaTimer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSTimer *retryAutoInstallTimer;
  _BOOL4 v10;

  SULogInfo(CFSTR("%s: About to invalidate the retryAutoInstallTimer (%@)"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)"-[SUScheduler _invalidateRetryAutoInstallaTimer]");
  retryAutoInstallTimer = self->_retryAutoInstallTimer;
  if (retryAutoInstallTimer)
  {
    v10 = -[NSTimer isValid](retryAutoInstallTimer, "isValid");
    retryAutoInstallTimer = self->_retryAutoInstallTimer;
    if (v10)
    {
      -[NSTimer invalidate](retryAutoInstallTimer, "invalidate");
      retryAutoInstallTimer = self->_retryAutoInstallTimer;
    }
  }
  self->_retryAutoInstallTimer = 0;

}

- (void)_queue_invalidateRetryAutoInstallaTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  -[SUScheduler _invalidateRetryAutoInstallaTimer](self, "_invalidateRetryAutoInstallaTimer");
}

- (void)schedulePresentAutoUpdateBanner
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bannerDelay");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v4 = 0x409C200000000000;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "doubleValue");
      v4 = v5;
    }
  }
  SULogBadging();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v6, CFSTR("Delaying auto update for %f seconds"), v7, v8, v9, v10, v11, v12, v4);

  v13 = objc_alloc_init(MEMORY[0x24BEAE7C8]);
  objc_msgSend(v13, "setWaking:", 2);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", *(double *)&v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRunDate:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE7C0]), "initWithActivityName:options:", CFSTR("com.apple.softwareupdateservicesd.activity.presentBanner"), v13);
  -[SUScheduler _scheduleActivity:](self, "_scheduleActivity:", v15);

}

- (void)cancelPresentAutoUpdateBanner
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUScheduler_cancelPresentAutoUpdateBanner__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __44__SUScheduler_cancelPresentAutoUpdateBanner__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", CFSTR("com.apple.softwareupdateservicesd.activity.presentBanner"));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleCancelPresentBannerOnUnlock");
}

- (void)scheduleRollbackReboot:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x24BEAE7C8];
  v5 = a3;
  v7 = objc_alloc_init(v4);
  objc_msgSend(v7, "setWaking:", 2);
  objc_msgSend(v7, "setRunDate:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE7C0]), "initWithActivityName:options:", CFSTR("com.apple.softwareupdateservicesd.activity.rollbackReboot"), v7);
  -[SUScheduler _scheduleActivity:](self, "_scheduleActivity:", v6);

}

- (void)cancelRollbackReboot
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SUScheduler_cancelRollbackReboot__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __35__SUScheduler_cancelRollbackReboot__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", CFSTR("com.apple.softwareupdateservicesd.activity.rollbackReboot"));
}

- (void)scheduleInstallAlertRegistration:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x24BEAE7C8];
  v5 = a3;
  v7 = objc_alloc_init(v4);
  objc_msgSend(v7, "setBatteryLevelGreaterThan:", &unk_24CE6E118);
  objc_msgSend(v7, "setPhoneCallState:", 1);
  objc_msgSend(v7, "setCarplayState:", 1);
  objc_msgSend(v7, "setMediaPlayingState:", 1);
  objc_msgSend(v7, "setNetworkState:", 2);
  objc_msgSend(v7, "setWaking:", 2);
  objc_msgSend(v7, "setRunDate:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE7C0]), "initWithActivityName:options:", CFSTR("com.apple.softwareupdateservicesd.activity.installAlert"), v7);
  -[SUScheduler _scheduleActivity:](self, "_scheduleActivity:", v6);

}

- (void)cancelInstallAlertRegistration
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  +[SUUtility deleteKeepAliveFile](SUUtility, "deleteKeepAliveFile");
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUScheduler_cancelInstallAlertRegistration__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __45__SUScheduler_cancelInstallAlertRegistration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", CFSTR("com.apple.softwareupdateservicesd.activity.installAlert"));
}

- (void)cancelInstallAlertRegistrationButKeepAlive
{
  NSObject *schedulerQueue;
  _QWORD block[5];

  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SUScheduler_cancelInstallAlertRegistrationButKeepAlive__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(schedulerQueue, block);
}

uint64_t __57__SUScheduler_cancelInstallAlertRegistrationButKeepAlive__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_unscheduleAllActivitiesWithName:", CFSTR("com.apple.softwareupdateservicesd.activity.installAlert"));
}

- (void)scheduleAnalyticsSubmissionIfNecessary
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;

  v3 = -[SUScheduler _activityIsScheduled:cancelIfExpired:](self, "_activityIsScheduled:cancelIfExpired:", CFSTR("com.apple.softwareupdateservicesd.activity.analyticsSubmission"), 1);
  if (self->_useSUCoreXPCActivityManager
    && -[SUScheduler activityWasPreviouslyScheduledForFutureDate:copy:](self, "activityWasPreviouslyScheduledForFutureDate:copy:", CFSTR("com.apple.softwareupdateservicesd.activity.analyticsSubmission"), 0))
  {
    -[SUCoreXPCActivityManager getExpectedRunDateForActivity:](self->_coreXPCActivityScheduler, "getExpectedRunDateForActivity:", CFSTR("com.apple.softwareupdateservicesd.activity.analyticsSubmission"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Found previously tracked but currently unscheduled analytics submission event expecte to run at %@. Will reschedule"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  }
  else if (v3)
  {
    SULogAnalytics();
    v41 = (id)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v41, CFSTR("Analytics event already scheduled"), v13, v14, v15, v16, v17, v18, v40);
    goto LABEL_13;
  }
  +[SUUtility currentReleaseType](SUUtility, "currentReleaseType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Internal"));

  if (v20
    && (+[SUPreferences sharedInstance](SUPreferences, "sharedInstance"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v21, "analyticsSubmissionIntervalOverride"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v22))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      SULogAnalytics();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "unsignedIntValue");
      SULogInfoForSubsystem(v23, CFSTR("Setting analytics submission delay to %u"), v25, v26, v27, v28, v29, v30, v24);

    }
    v31 = +[SUUtility randomIntWithMinVal:maxVal:](SUUtility, "randomIntWithMinVal:maxVal:", 30, 60 * objc_msgSend(v22, "unsignedIntValue"));

  }
  else
  {
    v31 = +[SUUtility randomIntWithMinVal:maxVal:](SUUtility, "randomIntWithMinVal:maxVal:", 60, 86400);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)v31);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v41);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Expired or no analytics submission scheduled. Rescheduling for %@"), v33, v34, v35, v36, v37, v38, v39, (uint64_t)v32);

  -[SUScheduler scheduleAnalyticsSubmission:](self, "scheduleAnalyticsSubmission:", v41);
LABEL_13:

}

- (void)scheduleAnalyticsSubmission:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x24BEAE7C8];
  v5 = a3;
  v7 = objc_alloc_init(v4);
  objc_msgSend(v7, "setNetworkState:", 2);
  objc_msgSend(v7, "setWaking:", 2);
  objc_msgSend(v7, "setRunDate:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE7C0]), "initWithActivityName:options:", CFSTR("com.apple.softwareupdateservicesd.activity.analyticsSubmission"), v7);
  -[SUScheduler _scheduleActivity:](self, "_scheduleActivity:", v6);

}

- (void)_scheduleActivity:(id)a3
{
  id v4;
  NSObject *schedulerQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SUScheduler *v9;

  v4 = a3;
  schedulerQueue = self->_schedulerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SUScheduler__scheduleActivity___block_invoke;
  v7[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(schedulerQueue, v7);

}

void __33__SUScheduler__scheduleActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  __CFString *v64;
  _QWORD v65[5];
  _QWORD v66[5];

  v10 = *(void **)(a1 + 32);
  if (!v10)
  {
    SULogInfo(CFSTR("Cannot schedule null activity"), a2, a3, a4, a5, a6, a7, a8, a9);
    return;
  }
  v11 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16);
  objc_msgSend(v10, "activityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "runDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    SULogInfo(CFSTR("Scheduling Activity (%@, runDate = %@) with legacy scheduler"), v14, v15, v16, v17, v18, v19, v20, (uint64_t)v12);

    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(_QWORD *)(a1 + 40);
    v26 = *(void **)(v25 + 8);
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __33__SUScheduler__scheduleActivity___block_invoke_4;
    v65[3] = &unk_24CE3DD30;
    v65[4] = v25;
    objc_msgSend(v26, "scheduleActivity:withHandler:", v24, v65);
    return;
  }
  SULogInfo(CFSTR("Scheduling Activity (%@, runDate = %@) with XPCActivity scheduler"), v14, v15, v16, v17, v18, v19, v20, (uint64_t)v12);

  v22 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  objc_msgSend(*(id *)(a1 + 32), "activityName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isActivityScheduled:", v23))
  {

LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "activityName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Unscheduling existing activity %@ before reshedule"), v30, v31, v32, v33, v34, v35, v36, (uint64_t)v29);

    v37 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(*(id *)(a1 + 32), "activityName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "unscheduleActivity:", v38);

    goto LABEL_9;
  }
  v27 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  objc_msgSend(*(id *)(a1 + 32), "activityName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = objc_msgSend(v27, "isActivityTrackedButUnsheduled:", v28);

  if ((_DWORD)v27)
    goto LABEL_8;
LABEL_9:
  v39 = objc_alloc_init(MEMORY[0x24BEAE7C8]);
  objc_msgSend(*(id *)(a1 + 32), "runDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setRunDate:", v40);

  objc_msgSend(*(id *)(a1 + 32), "batteryLevelGreaterThan");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBatteryLevelGreaterThan:", v41);

  objc_msgSend(*(id *)(a1 + 32), "batteryLevelLessThan");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBatteryLevelLessThan:", v42);

  objc_msgSend(v39, "setPlugInState:", objc_msgSend(*(id *)(a1 + 32), "plugInState"));
  objc_msgSend(v39, "setScreenOnState:", objc_msgSend(*(id *)(a1 + 32), "screenOnState"));
  objc_msgSend(v39, "setNetworkState:", objc_msgSend(*(id *)(a1 + 32), "networkState"));
  objc_msgSend(v39, "setWifiState:", objc_msgSend(*(id *)(a1 + 32), "wifiState"));
  objc_msgSend(v39, "setPhoneCallState:", objc_msgSend(*(id *)(a1 + 32), "phoneCallState"));
  objc_msgSend(v39, "setCarplayState:", objc_msgSend(*(id *)(a1 + 32), "carplayState"));
  objc_msgSend(v39, "setMediaPlayingState:", objc_msgSend(*(id *)(a1 + 32), "mediaPlayingState"));
  objc_msgSend(v39, "setWaking:", objc_msgSend(*(id *)(a1 + 32), "waking"));
  objc_msgSend(*(id *)(a1 + 32), "activityName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("The options for activity %@ are %@"), v44, v45, v46, v47, v48, v49, v50, (uint64_t)v43);

  v51 = objc_alloc(MEMORY[0x24BEAE878]);
  objc_msgSend(*(id *)(a1 + 32), "activityName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __33__SUScheduler__scheduleActivity___block_invoke_2;
  v66[3] = &unk_24CE3CC58;
  v66[4] = *(_QWORD *)(a1 + 40);
  v53 = (void *)objc_msgSend(v51, "init:options:handler:", v52, v39, v66);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "scheduleActivity:", v53);
  v54 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  objc_msgSend(*(id *)(a1 + 32), "activityName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v54) = objc_msgSend(v54, "isActivityScheduled:", v55);

  objc_msgSend(*(id *)(a1 + 32), "activityName");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v54)
    v64 = CFSTR("Successfully scheduled activity %@");
  else
    v64 = CFSTR("Failed to schedule activity %@");
  SULogInfo(v64, v56, v57, v58, v59, v60, v61, v62, (uint64_t)v63);

}

void __33__SUScheduler__scheduleActivity___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v10 = xpc_activity_copy_identifier();
  if (v10)
  {
    v18 = (void *)v10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    free(v18);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(NSObject **)(v20 + 40);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __33__SUScheduler__scheduleActivity___block_invoke_3;
    v23[3] = &unk_24CE3B610;
    v23[4] = v20;
    v24 = v19;
    v22 = v19;
    dispatch_async(v21, v23);

  }
  else
  {
    SULogInfo(CFSTR("Failed to read activity name from XPC activity. Unable to run scheduled task"), v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

uint64_t __33__SUScheduler__scheduleActivity___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleActivity:info:", *(_QWORD *)(a1 + 40), 0);
}

void __33__SUScheduler__scheduleActivity___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SUScheduler__scheduleActivity___block_invoke_5;
  block[3] = &unk_24CE3BB38;
  block[4] = v7;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __33__SUScheduler__scheduleActivity___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleActivity:info:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_unscheduleActivity:(id)a3
{
  id v4;
  NSObject *schedulerQueue;
  id v6;
  _QWORD block[4];
  id v8;
  SUScheduler *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_schedulerQueue);
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SUScheduler__unscheduleActivity___block_invoke;
  block[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(schedulerQueue, block);

}

void __35__SUScheduler__unscheduleActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  if (*(_QWORD *)(a1 + 32))
  {
    SULogInfo(CFSTR("Unscheduling activity %@ with %@ scheduler"), a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
    v10 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v10 + 16))
    {
      v11 = *(void **)(v10 + 24);
      objc_msgSend(*(id *)(a1 + 32), "activityName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v11, "unscheduleActivity:", v12);

      objc_msgSend(*(id *)(a1 + 32), "activityName");
      v13 = objc_claimAutoreleasedReturnValue();
      v21 = (id)v13;
      if ((_DWORD)v11)
        SULogInfo(CFSTR("Failed to unshedule activity %@"), v14, v15, v16, v17, v18, v19, v20, v13);
      else
        SULogInfo(CFSTR("Successfully unscheduled activity %@"), v14, v15, v16, v17, v18, v19, v20, v13);

    }
    else
    {
      objc_msgSend((id)v10, "_queue_unscheduleActivity:", *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    SULogInfo(CFSTR("Cannot unschedule null activity"), a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

- (void)_queue_unscheduleAllActivitiesWithName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  if (self->_useSUCoreXPCActivityManager)
  {
    if (-[SUCoreXPCActivityManager unscheduleActivity:](self->_coreXPCActivityScheduler, "unscheduleActivity:", v11))SULogInfo(CFSTR("Failed to unshedule activity %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v11);
    else
      SULogInfo(CFSTR("Successfully unscheduled activity %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v11);
  }
  else
  {
    -[SUCoreActivityScheduler unregisterActivitiesWithName:](self->_coreScheduler, "unregisterActivitiesWithName:", v11);
  }

}

- (void)_queue_unscheduleActivity:(id)a3
{
  NSObject *schedulerQueue;
  uint64_t v5;
  void *v6;
  id v7;

  schedulerQueue = self->_schedulerQueue;
  v7 = a3;
  dispatch_assert_queue_V2(schedulerQueue);
  if (self->_useSUCoreXPCActivityManager)
  {
    objc_msgSend(v7, "activityName");
    v5 = objc_claimAutoreleasedReturnValue();

    -[SUScheduler _queue_unscheduleAllActivitiesWithName:](self, "_queue_unscheduleAllActivitiesWithName:", v5);
    v6 = (void *)v5;
  }
  else
  {
    -[SUCoreActivityScheduler unregisterActivity:](self->_coreScheduler, "unregisterActivity:", v7);
    v6 = v7;
  }

}

- (void)handleXPCEvent:(id)a3
{
  id v4;
  NSObject *schedulerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  schedulerQueue = self->_schedulerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__SUScheduler_handleXPCEvent___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(schedulerQueue, v7);

}

uint64_t __30__SUScheduler_handleXPCEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleActivity:info:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_queue_handleActivity:(id)a3 info:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  SUScheduler *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  SULogInfo(CFSTR("Received activity: %@ with info: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v26);
  +[SUTransactionManager sharedInstance](SUTransactionManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "beginTransaction:keepAlive:", CFSTR("schedulerAction"), 1);
  if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.autoScan"))
    || objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.emergencyAutoScan"))|| objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.autoScan"))|| objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.splatAutoScan")))
  {
    v15 = self;
    v16 = v26;
    v17 = v6;
    v18 = 1;
LABEL_6:
    -[SUScheduler _queue_handleAutoScan:info:rescheduler:](v15, "_queue_handleAutoScan:info:rescheduler:", v16, v17, v18);
    goto LABEL_7;
  }
  if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.delayEndScan")))
  {
    v15 = self;
    v16 = v26;
    v17 = v6;
    v18 = 0;
    goto LABEL_6;
  }
  if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.autoDownload")))
  {
    -[SUScheduler _queue_handleAutoDownload:info:](self, "_queue_handleAutoDownload:info:", v26, v6);
  }
  else if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdate.autoinstall.startInstall")))
  {
    -[SUScheduler _queue_handleAutoInstallStart:info:](self, "_queue_handleAutoInstallStart:info:", v26, v6);
  }
  else if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.autoInstallEnd")))
  {
    -[SUScheduler _queue_handleAutoInstallEnd:info:](self, "_queue_handleAutoInstallEnd:info:", v26, v6);
  }
  else if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.autoInstallUnlock")))
  {
    -[SUScheduler _queue_handleAutoInstallUnlock:info:](self, "_queue_handleAutoInstallUnlock:info:", v26, v6);
  }
  else if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.autoInstallGetKeybag")))
  {
    -[SUScheduler _queue_handleAutoInstallGetKeybag:info:](self, "_queue_handleAutoInstallGetKeybag:info:", v26, v6);
  }
  else if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.installAlert")))
  {
    -[SUScheduler _queue_handleInstallAlert:info:](self, "_queue_handleInstallAlert:info:", v26, v6);
  }
  else if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.presentBanner")))
  {
    -[SUScheduler _queue_handlePresentBanner:info:](self, "_queue_handlePresentBanner:info:", v26, v6);
  }
  else if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.SUCoreConfigScheduledScan")))
  {
    -[SUScheduler _queue_handleServerConfigScan:info:](self, "_queue_handleServerConfigScan:info:", v26, v6);
  }
  else if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.analyticsSubmission")))
  {
    -[SUScheduler _queue_handleAnalyticsSubmission:info:](self, "_queue_handleAnalyticsSubmission:info:", v26, v6);
  }
  else if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.rollbackReboot")))
  {
    -[SUScheduler _queue_handleRollbackReboot:info:](self, "_queue_handleRollbackReboot:info:", v26, v6);
  }
  else
  {
    SULogError(CFSTR("Unknown activity: %@"), v19, v20, v21, v22, v23, v24, v25, (uint64_t)v26);
  }
LABEL_7:
  objc_msgSend(v14, "endTransaction:", CFSTR("schedulerAction"));

}

- (double)_randomizedAutoScanDelayForType:(int)a3
{
  double v3;

  -[SUScheduler _autoScanTimeIntervalForType:](self, "_autoScanTimeIntervalForType:", *(_QWORD *)&a3);
  return (double)+[SUUtility randomIntWithMinVal:maxVal:](SUUtility, "randomIntWithMinVal:maxVal:", 60, v3);
}

- (double)_autoScanTimeInterval
{
  double result;

  -[SUScheduler _autoScanTimeIntervalForType:](self, "_autoScanTimeIntervalForType:", 0);
  return result;
}

- (double)_autoScanTimeIntervalForType:(int)a3
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;

  -[SUServerConfigurationManager softwareUpdateAutoScanInterval](self->_serverConfigManager, "softwareUpdateAutoScanInterval", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (double)(int)(60 * objc_msgSend(v3, "intValue"));
    v6 = objc_msgSend(v4, "intValue");
    SULogInfo(CFSTR("Using server configured auto scan interval - scan once every %d minutes"), v7, v8, v9, v10, v11, v12, v13, v6);
  }
  else
  {
    +[SUUtility autoScanTimeInterval](SUUtility, "autoScanTimeInterval");
    v5 = v14;
  }

  return v5;
}

- (double)_autoDownloadTimeInterval
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double result;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autoDownloadOverrideInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autoDownloadOverrideInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[Auto download] Using auto download override value: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);

    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "autoDownloadOverrideInterval");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (double)(int)objc_msgSend(v15, "intValue");

LABEL_5:
    return v16;
  }
  -[SUServerConfigurationManager softwareUpdateAutoScanInterval](self->_serverConfigManager, "softwareUpdateAutoScanInterval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v14 = v17;
    v16 = (double)(int)(60 * objc_msgSend(v17, "intValue"));
    v18 = objc_msgSend(v14, "intValue");
    SULogInfo(CFSTR("[Auto download] Using server configured auto scan interval - download once every %d minutes"), v19, v20, v21, v22, v23, v24, v25, v18);
    goto LABEL_5;
  }
  +[SUUtility autoDownloadTimeInterval](SUUtility, "autoDownloadTimeInterval");
  return result;
}

- (BOOL)activityWasPreviouslyScheduledForFutureDate:(id)a3 copy:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v13 = a3;
  if (self->_useSUCoreXPCActivityManager)
  {
    v21 = -[SUCoreXPCActivityManager isActivityTrackedButUnsheduled:](self->_coreXPCActivityScheduler, "isActivityTrackedButUnsheduled:", v13);
    if (a4)
    {
      -[SUCoreXPCActivityManager getActivityForName:](self->_coreXPCActivityScheduler, "getActivityForName:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = objc_alloc(MEMORY[0x24BEAE7C0]);
        objc_msgSend(v22, "activityName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "activityOptions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v23, "initWithActivityName:options:", v24, v25);

      }
    }
    if (v21)
    {
      -[SUCoreXPCActivityManager getExpectedRunDateForActivity:](self->_coreXPCActivityScheduler, "getExpectedRunDateForActivity:", v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26
        && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v26, "compare:", v27),
            v27,
            v28 == -1))
      {
        objc_msgSend(MEMORY[0x24BEAEA28], "stringFromDate:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("Activity %@ is tracked, not currently scheduled and has a run date(%@) in the past"), v37, v38, v39, v40, v41, v42, v43, (uint64_t)v13);
        LOBYTE(v21) = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEAEA28], "stringFromDate:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("Activity %@ is tracked, not currently scheduled and has a rundate(%@) in the future"), v30, v31, v32, v33, v34, v35, v36, (uint64_t)v13);
        LOBYTE(v21) = 1;
      }

    }
    else
    {
      SULogInfo(CFSTR("Activity %@ is not one that was previously tracked but unsheduled"), v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
    }
  }
  else
  {
    SULogInfo(CFSTR("%s is not supported in this configuration"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUScheduler activityWasPreviouslyScheduledForFutureDate:copy:]");
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (BOOL)_activityIsScheduled:(id)a3 cancelIfExpired:(BOOL)a4 scheduledActivity:(id *)a5
{
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  BOOL v56;
  id *v58;
  SUScheduler *v59;
  _BOOL4 v60;
  int v61;
  uint64_t v62;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v60 = a4;
  v69 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!self->_useSUCoreXPCActivityManager)
  {
    v58 = a5;
    v31 = (void *)-[SUCoreActivityScheduler copyScheduledActivities](self->_coreScheduler, "copyScheduledActivities");
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v31;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    if (v32)
    {
      v33 = v32;
      v59 = self;
      v21 = 0;
      v34 = 0;
      v35 = *(_QWORD *)v65;
      do
      {
        v36 = 0;
        v62 = v33;
        do
        {
          if (*(_QWORD *)v65 != v35)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v36);
          objc_msgSend(v37, "activityName");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEqualToString:", v7);

          if (v39)
          {
            v47 = v35;
            v48 = v7;
            v49 = v34 + 1;
            SULogInfo(CFSTR("Found scheduled activity: %@"), v40, v41, v42, v43, v44, v45, v46, (uint64_t)v37);
            objc_msgSend(v37, "runDate");
            v50 = objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              v51 = (void *)v50;
              v61 = v34;
              objc_msgSend(v37, "runDate");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCE60], "date");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = v21;
              v55 = objc_msgSend(v52, "compare:", v53);

              v56 = v55 == -1;
              v21 = v54;
              v56 = !v56 || !v60;
              if (!v56)
              {
                -[SUScheduler _unscheduleActivity:](v59, "_unscheduleActivity:", v37);
                v49 = v61;
              }
            }
            if (v49 < 1)
            {
              v34 = v49;
              v7 = v48;
            }
            else
            {
              v7 = v48;
              if (!v21)
                v21 = v37;
              v34 = v49;
            }
            v35 = v47;
            v33 = v62;
          }
          ++v36;
        }
        while (v33 != v36);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      }
      while (v33);
    }
    else
    {
      v21 = 0;
      v34 = 0;
    }

    if (v58)
      *v58 = (id)objc_msgSend(v21, "copy");
    LOBYTE(v16) = v34 > 0;

    goto LABEL_38;
  }
  v8 = -[SUCoreXPCActivityManager isActivityTrackedButUnsheduled:](self->_coreXPCActivityScheduler, "isActivityTrackedButUnsheduled:", v7);
  v16 = -[SUCoreXPCActivityManager isActivityScheduled:](self->_coreXPCActivityScheduler, "isActivityScheduled:", v7);
  if (a5)
  {
    -[SUCoreXPCActivityManager getActivityForName:](self->_coreXPCActivityScheduler, "getActivityForName:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x24BEAE7C0]);
      objc_msgSend(v17, "activityName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activityOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = (id)objc_msgSend(v18, "initWithActivityName:options:", v19, v20);

    }
  }
  if ((v16 | v8) != 1)
  {
    SULogInfo(CFSTR("Activity %@ is not scheduled"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    goto LABEL_33;
  }
  SULogInfo(CFSTR("Activity %@ is %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);
  if (v60)
  {
    -[SUCoreXPCActivityManager getExpectedRunDateForActivity:](self->_coreXPCActivityScheduler, "getExpectedRunDateForActivity:", v7);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "compare:", v22);

      if (v23 == -1)
      {
        SULogInfo(CFSTR("Activity %@ is past its run date. Unscheduling"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)v7);
        -[SUCoreXPCActivityManager unscheduleActivity:](self->_coreXPCActivityScheduler, "unscheduleActivity:", v7);

LABEL_33:
        LOBYTE(v16) = 0;
        goto LABEL_39;
      }
    }
LABEL_38:

  }
LABEL_39:

  return v16;
}

- (BOOL)_activityIsScheduled:(id)a3 cancelIfExpired:(BOOL)a4
{
  return -[SUScheduler _activityIsScheduled:cancelIfExpired:scheduledActivity:](self, "_activityIsScheduled:cancelIfExpired:scheduledActivity:", a3, a4, 0);
}

- (id)nextScheduledAutoScan
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_useSUCoreXPCActivityManager)
  {
    if (-[SUCoreXPCActivityManager isActivityScheduled:](self->_coreXPCActivityScheduler, "isActivityScheduled:", CFSTR("com.apple.softwareupdateservicesd.activity.autoScan")))
    {
      -[SUCoreXPCActivityManager getExpectedRunDateForActivity:](self->_coreXPCActivityScheduler, "getExpectedRunDateForActivity:", CFSTR("com.apple.softwareupdateservicesd.activity.autoScan"));
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = (void *)-[SUCoreActivityScheduler copyScheduledActivities](self->_coreScheduler, "copyScheduledActivities");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "activityName", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.autoScan"));

          if (!v12)
          {
            objc_msgSend(v10, "runDate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            return v13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  return 0;
}

- (void)_queue_setAutoinstallActivity:(id)a3
{
  OS_xpc_object *v4;
  OS_xpc_object *autoInstallActivity;

  v4 = (OS_xpc_object *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  autoInstallActivity = self->_autoInstallActivity;
  self->_autoInstallActivity = v4;

}

- (void)setAutoinstallActivity:(id)a3
{
  id v4;
  NSObject *schedulerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_schedulerQueue);
  schedulerQueue = self->_schedulerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SUScheduler_setAutoinstallActivity___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(schedulerQueue, block);

}

uint64_t __38__SUScheduler_setAutoinstallActivity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAutoinstallActivity:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_handleScanIntervalConfigChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  SULogInfo(CFSTR("Scan interval server configuration changed"), v4, v5, v6, v7, v8, v9, v10, v14);
  -[SUScheduler nextScheduledAutoScan](self, "nextScheduledAutoScan");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCE60];
  -[SUScheduler _autoScanTimeIntervalForType:](self, "_autoScanTimeIntervalForType:", 0);
  objc_msgSend(v11, "dateWithTimeIntervalSinceNow:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 && v12
    || v15
    && v12
    && (objc_msgSend(v15, "laterDate:", v12),
        v13 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 == v15))
  {
    -[SUScheduler cancelAllBackgroundScans](self, "cancelAllBackgroundScans");
    -[SUScheduler scheduleBackgroundScan:](self, "scheduleBackgroundScan:", v12);
  }

}

- (void)_queue_handleAutoScan:(id)a3 info:(id)a4 rescheduler:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  int v19;

  v5 = a5;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_schedulerQueue);
  SULogInfo(CFSTR("Handling auto scan: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
  v15 = -[SUScheduler scanTypeForActivityName:](self, "scanTypeForActivityName:", v7);
  -[SUScheduler _queue_unscheduleAllActivitiesWithName:](self, "_queue_unscheduleAllActivitiesWithName:", v7);
  if (v5)
  {
    +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__SUScheduler__queue_handleAutoScan_info_rescheduler___block_invoke;
    block[3] = &unk_24CE3DD80;
    block[4] = self;
    v19 = v15;
    v18 = v7;
    dispatch_async(v16, block);

  }
}

void __54__SUScheduler__queue_handleAutoScan_info_rescheduler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  int v8;

  v6[0] = MEMORY[0x24BDAC760];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 48);
  v6[2] = __54__SUScheduler__queue_handleAutoScan_info_rescheduler___block_invoke_2;
  v6[3] = &unk_24CE3DD58;
  v5 = *(unsigned int *)(a1 + 48);
  v6[1] = 3221225472;
  v6[4] = v2;
  v7 = v3;
  v8 = *(_DWORD *)(a1 + 48);
  objc_msgSend(v4, "autoScanAndDownloadIfAvailable:downloadNow:withResult:", v5, 0, v6);

}

void __54__SUScheduler__queue_handleAutoScan_info_rescheduler___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v1, "_autoScanTimeIntervalForType:", *(unsigned int *)(a1 + 48));
  objc_msgSend(v3, "dateWithTimeIntervalSinceNow:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheduleBackgroundScan:scanDate:", v2, v4);

}

- (int)scanTypeForActivityName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.autoScan")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.emergencyAutoScan")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd.activity.splatAutoScan")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_queue_handleAutoDownload:(id)a3 info:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[5];

  v5 = a3;
  SULogInfo(CFSTR("Handling auto download: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  -[SUScheduler _queue_unscheduleAllActivitiesWithName:](self, "_queue_unscheduleAllActivitiesWithName:", v5);

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUScheduler__queue_handleAutoDownload_info___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v13, block);

}

uint64_t __46__SUScheduler__queue_handleAutoDownload_info___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "tryAutodownload");
}

- (void)_queue_handleAutoInstallStart:(id)a3 info:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SUScheduler__queue_handleAutoInstallStart_info___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __50__SUScheduler__queue_handleAutoInstallStart_info___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "noteAutoInstallOperationWantsToBegin");
}

- (void)_queue_handleAutoInstallEnd:(id)a3 info:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUScheduler__queue_handleAutoInstallEnd_info___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __48__SUScheduler__queue_handleAutoInstallEnd_info___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "noteAutoInstallOperationDidExpire");
  return objc_msgSend(*(id *)(a1 + 32), "cancelAutoInstallWindowExpirationTask");
}

- (void)_queue_handleAutoInstallUnlock:(id)a3 info:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUScheduler__queue_handleAutoInstallUnlock_info___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __51__SUScheduler__queue_handleAutoInstallUnlock_info___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "noteAutoInstallOperationUnlockWindowDidBegin");
  return objc_msgSend(*(id *)(a1 + 32), "cancelAutoInstallUnlockWindowStartTask");
}

- (void)_queue_handleAutoInstallGetKeybag:(id)a3 info:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SUScheduler__queue_handleAutoInstallGetKeybag_info___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v5, block);

}

void __54__SUScheduler__queue_handleAutoInstallGetKeybag_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_opt_new();
  objc_msgSend(v12, "setPasscodePolicy:", 2);
  SULogInfo(CFSTR("%s: set passcode policy to required"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUScheduler _queue_handleAutoInstallGetKeybag:info:]_block_invoke");
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_next7OClockFrom:after:", v10, 126000.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_scheduleAutoInstallGetKeybagTaskForDate:", v11);

}

- (void)_queue_handleInstallAlert:(id)a3 info:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUScheduler__queue_handleInstallAlert_info___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __46__SUScheduler__queue_handleInstallAlert_info___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelInstallAlertRegistration");
}

- (void)_queue_handlePresentBanner:(id)a3 info:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SUScheduler__queue_handlePresentBanner_info___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v5, block);

}

uint64_t __47__SUScheduler__queue_handlePresentBanner_info___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeLocked");

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v3)
    return objc_msgSend(v4, "addUnlockCallback:forKey:", sel__presentAutoUpdateBannerOnUnlock, CFSTR("unlockCallbackPresentAutoUpdateBanner"));
  else
    return objc_msgSend(v4, "presentAutoUpdateBanner:", 0);
}

- (void)_queue_handleServerConfigScan:(id)a3 info:(id)a4
{
  NSObject *v4;

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, &__block_literal_global_393);

}

void __50__SUScheduler__queue_handleServerConfigScan_info___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BEAE7E8], "sharedServerSettings");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "installServerSettings");

}

- (void)_queue_handleAnalyticsSubmission:(id)a3 info:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SUScheduler__queue_handleAnalyticsSubmission_info___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v5, block);

}

void __53__SUScheduler__queue_handleAnalyticsSubmission_info___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  SUAnalyticsEvent *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  int v32;
  char v33;
  char v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  char v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  char v60;
  uint64_t v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  objc_msgSend(CFSTR("/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/"), "stringByAppendingPathComponent:", CFSTR("updateDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUAnalyticsManager sharedManager](SUAnalyticsManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SULogAnalytics();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v5, CFSTR("Determining days since update"), v6, v7, v8, v9, v10, v11, v71);

  if (v3)
  {
    v74 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v74);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = v74 == 0;
    else
      v13 = 0;
    if (!v13)
    {
      SULogAnalytics();
      v14 = (SUAnalyticsEvent *)objc_claimAutoreleasedReturnValue();
      SULogErrorForSubsystem(v14, CFSTR("Failed to read valid update date"), v15, v16, v17, v18, v19, v20, v72);
LABEL_30:

      goto LABEL_31;
    }
    v14 = -[SUAnalyticsEvent initWithEventName:]([SUAnalyticsEvent alloc], "initWithEventName:", CFSTR("com.apple.SoftwareUpdate.EmbeddedSoftwareUpdateUsage"));
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "components:fromDate:toDate:options:", 16, v12, v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v29, "day");
    if ((v30 & 0x8000000000000000) != 0)
    {
      v31 = 0;
    }
    else if (v30 >= 0x1C)
    {
      if (v30 > 0x45)
      {
        if (v30 > 0x6F)
        {
          if (v30 > 0xDE)
          {
            v31 = 421;
            if (v30 != 223 && v30 <= 0x1A3)
              v31 = v30 - (unsigned __int16)v30 % 0x38u;
            goto LABEL_20;
          }
          v33 = v30 / 0x1Cu;
          v34 = 28;
        }
        else
        {
          v33 = v30 / 0xEu;
          v34 = 14;
        }
        LOBYTE(v32) = v30 - v33 * v34;
      }
      else
      {
        v32 = v30
            - 7
            * ((((v30 - ((unsigned __int16)(37 * v30) >> 8)) >> 1)
              + ((37 * v30) >> 8)) >> 2);
      }
      v31 = v30 - v32;
    }
    else
    {
      v31 = v30;
    }
LABEL_20:
    SULogAnalytics();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v35, CFSTR("%ld(bucketed) days since last successful ota"), v36, v37, v38, v39, v40, v41, v31);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v31);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUAnalyticsEvent setEventPayloadEntry:numberValue:](v14, "setEventPayloadEntry:numberValue:", CFSTR("DaysSinceLastUpdate"), v42);

    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "isAutomaticUpdateV2Enabled");

    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "autoUpdateForceOn");

    if ((v46 & 1) != 0)
    {
      v47 = 1;
    }
    else
    {
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "autoUpdateForceOff");

      v47 = v44 & ~v49;
    }
    -[SUAnalyticsEvent setEventPayloadEntry:BOOLValue:](v14, "setEventPayloadEntry:BOOLValue:", CFSTR("CurrentAutoUpdateStatus"), v47);
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "autoInstallSystemAndDataFiles");

    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "autoInstallSystemDataFilesForceOn");

    if ((v53 & 1) != 0)
    {
      v54 = 1;
    }
    else
    {
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "autoInstallSystemDataFilesForceOff");

      v54 = v51 & ~v56;
    }
    -[SUAnalyticsEvent setEventPayloadEntry:BOOLValue:](v14, "setEventPayloadEntry:BOOLValue:", CFSTR("CurrentAutoInstallSystemDataFilesStatus"), v54);
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "autoInstallSecurityResponse");

    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "autoInstallSecurityResponseForceOn");

    if ((v60 & 1) != 0)
    {
      v61 = 1;
    }
    else
    {
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "autoInstallSecurityResponseForceOff");

      v61 = v58 & ~v63;
    }
    -[SUAnalyticsEvent setEventPayloadEntry:BOOLValue:](v14, "setEventPayloadEntry:BOOLValue:", CFSTR("kSUCurrentAutoInstallSecurityResponseStatus"), v61);
    objc_msgSend(v4, "setEvent:", v14);

    goto LABEL_30;
  }
  SULogAnalytics();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SULogErrorForSubsystem(v12, CFSTR("Unable to read updateDate file..bailing"), v21, v22, v23, v24, v25, v26, v72);
LABEL_31:

  SULogAnalytics();
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v64, CFSTR("Submitting SU Coreanalytics events"), v65, v66, v67, v68, v69, v70, v73);

  objc_msgSend(v4, "submitAllEvents");
  objc_msgSend(*(id *)(a1 + 32), "scheduleAnalyticsSubmissionIfNecessary");

}

- (void)_queue_handleCancelPresentBannerOnUnlock
{
  NSObject *v3;
  _QWORD block[5];

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUScheduler__queue_handleCancelPresentBannerOnUnlock__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __55__SUScheduler__queue_handleCancelPresentBannerOnUnlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeUnlockCallback:", CFSTR("unlockCallbackPresentAutoUpdateBanner"));
}

- (void)_queue_handleRollbackReboot:(id)a3 info:(id)a4
{
  -[SUManagerInterface rollbackReadyForReboot](self->_manager, "rollbackReadyForReboot", a3, a4);
}

- (void)serverConfigManager:(id)a3 configValuesChanged:(id)a4
{
  id v5;
  NSObject *schedulerQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SUScheduler *v10;

  v5 = a4;
  schedulerQueue = self->_schedulerQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__SUScheduler_serverConfigManager_configValuesChanged___block_invoke;
  v8[3] = &unk_24CE3B610;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(schedulerQueue, v8);

}

void __55__SUScheduler_serverConfigManager_configValuesChanged___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  id v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
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
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v46;
    v6 = *MEMORY[0x24BEAEAA0];
    v35 = *(_QWORD *)v46;
    v34 = v2;
    do
    {
      v7 = 0;
      v36 = v4;
      do
      {
        if (*(_QWORD *)v46 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("Changed")))
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            SULogInfo(CFSTR("%@ is unexpected type"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)CFSTR("Changed"));
            goto LABEL_38;
          }
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v16, "allKeys");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v42 != v20)
                  objc_enumerationMutation(v17);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "isEqualToString:", v6))
                {
                  objc_msgSend(v16, "objectForKeyedSubscript:", v6);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v22)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      objc_msgSend(*(id *)(a1 + 40), "_queue_handleScanIntervalConfigChange:", v22);
                  }

                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            }
            while (v19);
          }

          v2 = v34;
        }
        else
        {
          if (!objc_msgSend(v8, "isEqualToString:", CFSTR("Removed")))
            goto LABEL_39;
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            SULogInfo(CFSTR("%@ is unexpected type"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)CFSTR("Removed"));
            goto LABEL_38;
          }
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v16 = v16;
          v30 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v31; ++j)
              {
                if (*(_QWORD *)v38 != v32)
                  objc_enumerationMutation(v16);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "isEqualToString:", v6))
                  objc_msgSend(*(id *)(a1 + 40), "_queue_handleScanIntervalConfigChange:", 0);
              }
              v31 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            }
            while (v31);
          }

        }
        v5 = v35;
        v4 = v36;
LABEL_38:

LABEL_39:
        ++v7;
      }
      while (v7 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryAutoInstallTimer, 0);
  objc_storeStrong((id *)&self->_autoInstallActivity, 0);
  objc_storeStrong((id *)&self->_autoInstallManager, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_schedulerQueue, 0);
  objc_storeStrong((id *)&self->_serverConfigManager, 0);
  objc_storeStrong((id *)&self->_coreXPCActivityScheduler, 0);
  objc_storeStrong((id *)&self->_coreScheduler, 0);
}

@end
