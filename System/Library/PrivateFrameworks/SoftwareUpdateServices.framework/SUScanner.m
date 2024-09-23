@implementation SUScanner

- (SUScanner)initWithCore:(id)a3
{
  id v4;
  SUScanner *v5;
  SUScanner *v6;
  NSMutableArray *v7;
  NSMutableArray *scanRequests;
  SUScanTask *activeScanTask;
  NSTimer *recommendedUpdateTimer;
  SUUpdateDiscoveryDateManager *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SUUpdateDiscoveryDateManager *discoveryDateManager;
  SUUpdateDiscoveryDateManager *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SUUpdateDiscoveryDateManager *fullyUnrampedDateManager;
  void *v21;
  void *v22;
  uint64_t v23;
  SUScanOptions *lastScannedDescriptorScanOptions;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SUScanner;
  v5 = -[SUScanner init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_core, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    scanRequests = v6->_scanRequests;
    v6->_scanRequests = v7;

    v6->_scanning = 0;
    activeScanTask = v6->_activeScanTask;
    v6->_activeScanTask = 0;

    recommendedUpdateTimer = v6->_recommendedUpdateTimer;
    v6->_recommendedUpdateTimer = 0;

    v11 = [SUUpdateDiscoveryDateManager alloc];
    objc_msgSend(v4, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateDiscoveryDates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SUUpdateDiscoveryDateManager initWithDiscoveryDateDictionary:](v11, "initWithDiscoveryDateDictionary:", v13);
    discoveryDateManager = v6->_discoveryDateManager;
    v6->_discoveryDateManager = (SUUpdateDiscoveryDateManager *)v14;

    v16 = [SUUpdateDiscoveryDateManager alloc];
    objc_msgSend(v4, "state");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateFullyUnrampedDates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SUUpdateDiscoveryDateManager initWithDiscoveryDateDictionary:](v16, "initWithDiscoveryDateDictionary:", v18);
    fullyUnrampedDateManager = v6->_fullyUnrampedDateManager;
    v6->_fullyUnrampedDateManager = (SUUpdateDiscoveryDateManager *)v19;

    objc_msgSend(v4, "state");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastScannedDescriptorScanOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    lastScannedDescriptorScanOptions = v6->_lastScannedDescriptorScanOptions;
    v6->_lastScannedDescriptorScanOptions = (SUScanOptions *)v23;

    -[SUScanner _queue_refreshLastScannedCoreDescriptors](v6, "_queue_refreshLastScannedCoreDescriptors");
  }

  return v6;
}

- (BOOL)isScanning
{
  void *v3;
  NSObject *v4;

  -[SUScanner core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;

  v3 = a3;
  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (self->_scanning != v3)
  {
    self->_scanning = v3;
    +[SUNetworkMonitor setHoldsWiFiAssertion:](SUNetworkMonitor, "setHoldsWiFiAssertion:", v3);
  }
}

- (void)_queue_refreshLastScannedCoreDescriptors
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  dispatch_semaphore_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  dispatch_time_t v30;
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
  uint64_t v44;
  _QWORD v45[4];
  NSObject *v46;
  uint64_t *v47;
  _QWORD v48[4];
  NSObject *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  -[SUScanner core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredLastScannedCoreDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUScanner core](self, "core");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alternateLastScannedCoreDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__14;
  v61 = __Block_byref_object_dispose__14;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__14;
  v55 = __Block_byref_object_dispose__14;
  v56 = 0;
  v11 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v12 = dispatch_semaphore_create(0);
    -[SUScanner defaultValuesForCoreDescriptor:](self, "defaultValuesForCoreDescriptor:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BEAE820];
    objc_msgSend(MEMORY[0x24BE66BA0], "requireSameAssetTypeAndAssetId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v11;
    v48[1] = 3221225472;
    v48[2] = __53__SUScanner__queue_refreshLastScannedCoreDescriptors__block_invoke;
    v48[3] = &unk_24CE3D1E0;
    v50 = &v57;
    v16 = v12;
    v49 = v16;
    objc_msgSend(v14, "reloadDescriptor:allowingDifferences:forceReload:skipMSU:defaultValues:completion:", v7, v15, 0, 1, v13, v48);

    v17 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v16, v17))
      SULogInfo(CFSTR("TIME OUT waiting for reloadDescriptor for preferred update %@"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)v7);

  }
  if (v10)
  {
    v25 = dispatch_semaphore_create(0);
    -[SUScanner defaultValuesForCoreDescriptor:](self, "defaultValuesForCoreDescriptor:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BEAE820];
    objc_msgSend(MEMORY[0x24BE66BA0], "requireSameAssetTypeAndAssetId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v11;
    v45[1] = 3221225472;
    v45[2] = __53__SUScanner__queue_refreshLastScannedCoreDescriptors__block_invoke_2;
    v45[3] = &unk_24CE3D1E0;
    v47 = &v51;
    v29 = v25;
    v46 = v29;
    objc_msgSend(v27, "reloadDescriptor:allowingDifferences:forceReload:defaultValues:completion:", v10, v28, 0, v26, v45);

    v30 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v29, v30))
      SULogInfo(CFSTR("TIME OUT waiting for reloadDescriptor for alternate update %@"), v31, v32, v33, v34, v35, v36, v37, (uint64_t)v7);

  }
  objc_storeStrong((id *)&self->_preferredLastScannedCoreDescriptor, (id)v58[5]);
  objc_storeStrong((id *)&self->_alternateLastScannedCoreDescriptor, (id)v52[5]);
  SULogInfo(CFSTR("Fetched preferredLastScannedCoreDescriptor:%@ alternateLastScannedCoreDescriptor:%@"), v38, v39, v40, v41, v42, v43, v44, (uint64_t)self->_preferredLastScannedCoreDescriptor);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
}

void __53__SUScanner__queue_refreshLastScannedCoreDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __53__SUScanner__queue_refreshLastScannedCoreDescriptors__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)defaultValuesForCoreDescriptor:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[19];
  _QWORD v29[21];

  v29[19] = *MEMORY[0x24BDAC8D0];
  v28[0] = *MEMORY[0x24BE66AA0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a3;
  objc_msgSend(v3, "numberWithUnsignedLongLong:", objc_msgSend(v4, "downloadSize"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v27;
  v28[1] = *MEMORY[0x24BE66AB8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "unarchivedSize"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v26;
  v28[2] = *MEMORY[0x24BEAE8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "minimumSystemPartitionSize"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v25;
  v28[3] = *MEMORY[0x24BE66AA8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "streamingZipCapable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v24;
  v28[4] = *MEMORY[0x24BEAE8E8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "downloadAllowableOverCellular"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v23;
  v28[5] = *MEMORY[0x24BEAE8E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "downloadable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v22;
  v28[6] = *MEMORY[0x24BEAE948];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "disableSiriVoiceDeletion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v21;
  v28[7] = *MEMORY[0x24BEAE940];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "disableCDLevel4"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v20;
  v28[8] = *MEMORY[0x24BEAE938];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "disableAppDemotion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v19;
  v28[9] = *MEMORY[0x24BEAE950];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "disableInstallTonight") ^ 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v18;
  v28[10] = *MEMORY[0x24BEAE930];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "rampEnabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v17;
  v28[11] = *MEMORY[0x24BEAE908];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "autoUpdateEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[11] = v5;
  v28[12] = *MEMORY[0x24BEAE900];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "autoInstallDelay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[12] = v6;
  v28[13] = *MEMORY[0x24BEAE928];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "notifyAfter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[13] = v7;
  v28[14] = *MEMORY[0x24BEAE920];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "hideInstallAlert"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[14] = v8;
  v28[15] = *MEMORY[0x24BEAE8D8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "allowAutoDownloadOnBattery"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[15] = v9;
  v28[16] = *MEMORY[0x24BEAE8F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "autoDownloadOnBatteryDelay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[16] = v10;
  v28[17] = *MEMORY[0x24BEAE8F8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "autoDownloadOnBatteryMinBattery"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[17] = v11;
  v28[18] = *MEMORY[0x24BEAE910];
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = objc_msgSend(v4, "disableSplatCombo");

  objc_msgSend(v12, "numberWithBool:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[18] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (SUCoreDescriptor)preferredLastScannedCoreDescriptor
{
  void *v3;
  NSObject *v4;

  -[SUScanner core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_preferredLastScannedCoreDescriptor;
}

- (void)setPreferredLastScannedCoreDescriptor:(id)a3
{
  SUCoreDescriptor *v4;
  void *v5;
  NSObject *v6;
  SUCoreDescriptor *preferredLastScannedCoreDescriptor;
  SUCoreDescriptor *v8;
  void *v9;
  id v10;

  v4 = (SUCoreDescriptor *)a3;
  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  preferredLastScannedCoreDescriptor = self->_preferredLastScannedCoreDescriptor;
  self->_preferredLastScannedCoreDescriptor = v4;
  v8 = v4;

  -[SUScanner core](self, "core");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredLastScannedCoreDescriptor:", self->_preferredLastScannedCoreDescriptor);

}

- (SUCoreDescriptor)alternateLastScannedCoreDescriptor
{
  void *v3;
  NSObject *v4;

  -[SUScanner core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_alternateLastScannedCoreDescriptor;
}

- (void)setAlternateLastScannedCoreDescriptor:(id)a3
{
  SUCoreDescriptor *v4;
  void *v5;
  NSObject *v6;
  SUCoreDescriptor *alternateLastScannedCoreDescriptor;
  SUCoreDescriptor *v8;
  void *v9;
  id v10;

  v4 = (SUCoreDescriptor *)a3;
  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  alternateLastScannedCoreDescriptor = self->_alternateLastScannedCoreDescriptor;
  self->_alternateLastScannedCoreDescriptor = v4;
  v8 = v4;

  -[SUScanner core](self, "core");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlternateLastScannedCoreDescriptor:", self->_alternateLastScannedCoreDescriptor);

}

- (void)setDiscoveryDate:(id)a3 forBuildVersion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v6 = a4;
  -[SUScanner core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    v21 = CFSTR("Unable to set discovery date for nil descriptor build version");
LABEL_8:
    SULogInfo(v21, v9, v10, v11, v12, v13, v14, v15, v22);
    goto LABEL_9;
  }
  v10 = (uint64_t)v23;
  if (!v23)
  {
    v21 = CFSTR("Unable to set discovery date for descriptor with nil date");
    goto LABEL_8;
  }
  -[SUUpdateDiscoveryDateManager setDiscoveryDate:forBuildVersion:](self->_discoveryDateManager, "setDiscoveryDate:forBuildVersion:", v23, v6);
  -[SUUpdateDiscoveryDateManager dictionaryRepresentation](self->_discoveryDateManager, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[SUScanner core](self, "core");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "state");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setUpdateDiscoveryDates:", v16);

    -[SUScanner core](self, "core");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "state");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "save");

  }
LABEL_9:

}

- (void)setFullyUnrampedDate:(id)a3 forBuildVersion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;

  v37 = a3;
  v6 = a4;
  -[SUScanner core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    v23 = CFSTR("Unable to set fully un-ramped date for nil descriptor build version");
LABEL_7:
    SULogInfo(v23, v9, v10, v11, v12, v13, v14, v15, v36);
    goto LABEL_8;
  }
  if (!v37)
  {
    v23 = CFSTR("Unable to set fully un-ramped date for descriptor with nil date");
    goto LABEL_7;
  }
  if (-[SUUpdateDiscoveryDateManager containsBuildVersion:](self->_fullyUnrampedDateManager, "containsBuildVersion:", v6))
  {
    SULogInfo(CFSTR("Unable to set fully un-ramped date because it's already been set for %@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v6);
  }
  else
  {
    -[SUUpdateDiscoveryDateManager setDiscoveryDate:forBuildVersion:](self->_fullyUnrampedDateManager, "setDiscoveryDate:forBuildVersion:", v37, v6);
    -[SUUpdateDiscoveryDateManager dictionaryRepresentation](self->_fullyUnrampedDateManager, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      -[SUScanner core](self, "core");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "state");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setUpdateFullyUnrampedDates:", v31);

      -[SUScanner core](self, "core");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "state");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "save");

    }
    SULogInfo(CFSTR("Succeeded to set fully un-ramped date %@ for %@"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)v37);

  }
LABEL_8:

}

- (void)removeFullyUnrampedDateForBuildVersion:(id)a3
{
  void *v4;
  NSObject *v5;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  id v27;

  v27 = a3;
  -[SUScanner core](self, "core");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v12 = (uint64_t)v27;
  if (!v27)
  {
    v25 = CFSTR("Unable to remove fully un-ramped date for nil descriptor build version");
LABEL_8:
    SULogInfo(v25, v12, v6, v7, v8, v9, v10, v11, v26);
    goto LABEL_9;
  }
  if (!-[SUUpdateDiscoveryDateManager containsBuildVersion:](self->_fullyUnrampedDateManager, "containsBuildVersion:", v27))
  {
    v26 = (uint64_t)v27;
    v25 = CFSTR("Unable to remove fully un-ramped date for %@ because we don't have it");
    goto LABEL_8;
  }
  -[SUUpdateDiscoveryDateManager removeDiscoveryDateForBuildVersion:](self->_fullyUnrampedDateManager, "removeDiscoveryDateForBuildVersion:", v27);
  -[SUUpdateDiscoveryDateManager dictionaryRepresentation](self->_fullyUnrampedDateManager, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[SUScanner core](self, "core");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "state");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUpdateFullyUnrampedDates:", v20);

    -[SUScanner core](self, "core");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "state");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "save");

  }
  SULogInfo(CFSTR("Succeeded to remove fully un-ramped date for %@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)v27);

LABEL_9:
}

- (id)discoveryDateforBuildVersion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUUpdateDiscoveryDateManager discoveryDateforBuildVersion:](self->_discoveryDateManager, "discoveryDateforBuildVersion:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fullyUnrampedDateForBuildVersion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUUpdateDiscoveryDateManager discoveryDateforBuildVersion:](self->_fullyUnrampedDateManager, "discoveryDateforBuildVersion:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SUScanOptions)lastScannedDescriptorScanOptions
{
  void *v3;
  NSObject *v4;

  -[SUScanner core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return self->_lastScannedDescriptorScanOptions;
}

- (void)setLastScannedDescriptorScanOptions:(id)a3
{
  SUScanOptions *v4;
  void *v5;
  NSObject *v6;
  SUScanOptions *lastScannedDescriptorScanOptions;
  SUScanOptions *v8;
  void *v9;
  id v10;

  v4 = (SUScanOptions *)a3;
  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  lastScannedDescriptorScanOptions = self->_lastScannedDescriptorScanOptions;
  self->_lastScannedDescriptorScanOptions = v4;
  v8 = v4;

  -[SUScanner core](self, "core");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLastScannedDescriptorScanOptions:", v8);

}

- (void)autoScanAndDownloadIfAvailable:(int)a3 withResult:(id)a4
{
  -[SUScanner autoScanAndDownloadIfAvailable:downloadNow:withResult:](self, "autoScanAndDownloadIfAvailable:downloadNow:withResult:", *(_QWORD *)&a3, 1, a4);
}

- (void)autoScanAndDownloadIfAvailable:(int)a3 downloadNow:(BOOL)a4 withResult:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  SUScanOptions *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  SUScanOptions *v34;
  _QWORD v35[5];
  SUScanOptions *v36;
  id v37;
  id v38;
  BOOL v39;
  _QWORD block[4];
  id v41;
  id v42;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  -[SUScanner core](self, "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "isCellularRoaming");

  if (!(_DWORD)v10)
  {
    +[SUTransactionManager sharedInstance](SUTransactionManager, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "beginTransaction:", CFSTR("auto-tryScan"));
    SUStringFromUpdateType(v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    SULogDebug(CFSTR("[Auto scan] Starting software update auto scan for type: %@"), v27, v28, v29, v30, v31, v32, v33, (uint64_t)v26);

    v34 = objc_alloc_init(SUScanOptions);
    -[SUScanOptions setIdentifier:](v34, "setIdentifier:", CFSTR("com.apple.softwareupdate.autoscan"));
    -[SUScanOptions setForced:](v34, "setForced:", 0);
    -[SUScanOptions addType:](v34, "addType:", v6);
    -[SUScanOptions setIgnoreNoUpdateFoundResult:](v34, "setIgnoreNoUpdateFoundResult:", (_DWORD)v6 == 4);
    -[SUScanOptions setClientName:](v34, "setClientName:", CFSTR("com.apple.softwareupdateservicesd"));
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_2;
    v35[3] = &unk_24CE3D230;
    v35[4] = self;
    v36 = v34;
    v39 = a4;
    v37 = v25;
    v38 = v8;
    v24 = v25;
    v23 = v34;
    -[SUScanner scanForUpdates:complete:](self, "scanForUpdates:complete:", v23, v35);

    goto LABEL_5;
  }
  SUStringFromUpdateType(v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[Auto scan] Automatic scan for type [%@] disabled while roaming over cellular."), v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);

  if (v8)
  {
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScanner core](self, "core");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "externWorkQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke;
    block[3] = &unk_24CE3BD58;
    v41 = v20;
    v42 = v8;
    v23 = v20;
    dispatch_async(v22, block);

    v24 = v42;
LABEL_5:

  }
}

uint64_t __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_3;
  block[3] = &unk_24CE3D208;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v18 = *(_BYTE *)(a1 + 64);
  v17 = *(id *)(a1 + 56);
  v15 = v6;
  v16 = *(id *)(a1 + 48);
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

void __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  id *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  NSObject *v100;
  NSObject *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  _QWORD block[4];
  _QWORD v106[2];
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  id v111;

  objc_msgSend(*(id *)(a1 + 32), "descriptorToAutoDownload:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (*(_QWORD *)(a1 + 56))
    {
      SULogInfo(CFSTR("[Auto scan] Automatic scan failed with error: %@"), v3, v4, v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 56));
      v27 = objc_msgSend(*(id *)(a1 + 56), "code");
    }
    else
    {
      SULogInfo(CFSTR("[Auto scan] Automatic scan failed with error: No suitable update to auto download"), v3, v4, v5, v6, v7, v8, v9, v102);
      v27 = 3;
    }
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 32), "core");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "externWorkQueue");
      v65 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_6;
      block[3] = &unk_24CE3CD40;
      v106[1] = v27;
      v66 = (id *)v106;
      v106[0] = *(id *)(a1 + 72);
      dispatch_async(v65, block);

LABEL_29:
      v10 = 0;
      goto LABEL_30;
    }
LABEL_31:
    v10 = 0;
    goto LABEL_32;
  }
  v10 = (void *)v2;
  SULogInfo(CFSTR("[Auto scan] Automatic scan fouond an update: %@"), v3, v4, v5, v6, v7, v8, v9, v2);
  if ((objc_msgSend(v10, "isSplatOnly") & 1) != 0 || objc_msgSend(v10, "isEmergencyOrCritical"))
  {
    objc_msgSend(v10, "humanReadableUpdateName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[Auto scan] Automatic scan found a splat or emergency update, immediately handle: %@"), v12, v13, v14, v15, v16, v17, v18, (uint64_t)v11);

    if ((objc_msgSend(*(id *)(a1 + 48), "MDMShowRapidSecurityResponse") & 1) == 0
      && objc_msgSend(v10, "isSplatOnly"))
    {
      objc_msgSend(v10, "humanReadableUpdateName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("[Auto scan] Splat scans are disabled, hiding splat: %@"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)v19);

      goto LABEL_27;
    }
    goto LABEL_25;
  }
  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_autoDownloadTimeInterval");
  v30 = v29;

  objc_msgSend(v10, "humanReadableUpdateName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[Auto scan] Automatic scan found a normal OS update, only auto download if last auto download was %f days ago: %@"), v32, v33, v34, v35, v36, v37, v38, COERCE__INT64(v30 / 86400.0));

  objc_msgSend(*(id *)(a1 + 32), "core");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "state");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "lastScanDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = *(void **)(a1 + 32);
  objc_msgSend(v10, "productBuildVersion");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "discoveryDateforBuildVersion:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "core");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "state");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "lastAutoDownloadDate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v41);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v44);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v47);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[Auto scan] Last scan date: %@, Last discovery date: %@, Last auto download date: %@"), v50, v51, v52, v53, v54, v55, v56, (uint64_t)v48);

  if (*(_BYTE *)(a1 + 80))
  {
    SULogInfo(CFSTR("[Auto scan] downloadNow is set, auto download now"), v57, v58, v59, v60, v61, v62, v63, v103);
    goto LABEL_24;
  }
  if (objc_msgSend(v10, "rampEnabled"))
  {
    objc_msgSend(v10, "humanReadableUpdateName");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[Auto scan] %@ has rampEnabled set, do not auto download"), v68, v69, v70, v71, v72, v73, v74, (uint64_t)v67);

LABEL_16:
    v10 = 0;
    goto LABEL_24;
  }
  if (objc_msgSend(v10, "granularlyRamped"))
  {
    objc_msgSend(v10, "humanReadableUpdateName");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[Auto scan] %@ has granularlyRamped set, auto download now"), v76, v77, v78, v79, v80, v81, v82, (uint64_t)v75);
  }
  else
  {
    if (v47)
    {
      objc_msgSend(v47, "timeIntervalSinceNow");
      if (fabs(v90) < v30)
      {
        SULogInfo(CFSTR("[Auto scan] Less than %f days have passed since last auto-download, do not auto download"), v83, v84, v85, v86, v87, v88, v89, COERCE__INT64(v30 / 86400.0));
        goto LABEL_16;
      }
    }
    objc_msgSend(v10, "humanReadableUpdateName");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[Auto scan] Greater than %f days have passed since auto downloading for OS updates, consider %@ auto downloadable/updateable/presentable"), v91, v92, v93, v94, v95, v96, v97, COERCE__INT64(v30 / 86400.0));
  }

LABEL_24:
  if (!v10)
  {
LABEL_27:
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 32), "core");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "externWorkQueue");
      v101 = objc_claimAutoreleasedReturnValue();
      v107[0] = MEMORY[0x24BDAC760];
      v107[1] = 3221225472;
      v107[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_5;
      v107[3] = &unk_24CE3C470;
      v66 = &v108;
      v108 = *(id *)(a1 + 72);
      dispatch_async(v101, v107);

      goto LABEL_29;
    }
    goto LABEL_31;
  }
LABEL_25:
  objc_msgSend(*(id *)(a1 + 32), "core");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "autoUpdateFound:downloadNow:", v10, *(unsigned __int8 *)(a1 + 80));

  if (*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "core");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "externWorkQueue");
    v100 = objc_claimAutoreleasedReturnValue();
    v109[0] = MEMORY[0x24BDAC760];
    v109[1] = 3221225472;
    v109[2] = __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_4;
    v109[3] = &unk_24CE3BD58;
    v66 = &v111;
    v111 = *(id *)(a1 + 72);
    v110 = *(id *)(a1 + 40);
    dispatch_async(v100, v109);

    v64 = v110;
LABEL_30:

  }
LABEL_32:
  objc_msgSend(*(id *)(a1 + 64), "endTransaction:", CFSTR("auto-tryScan"));

}

uint64_t __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_5(uint64_t a1)
{
  id v2;

  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __67__SUScanner_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke_6(uint64_t a1)
{
  id v2;

  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)notifyScanRequestDidStart:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUScanner core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SUScanner core](self, "core");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "externWorkQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __39__SUScanner_notifyScanRequestDidStart___block_invoke;
    v12[3] = &unk_24CE3B610;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v11, v12);

  }
}

void __39__SUScanner_notifyScanRequestDidStart___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scanRequestDidStartForOptions:", v3);

}

- (id)scanResultsForSUCoreScanResults:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SUScanResults *v8;

  v3 = a3;
  objc_msgSend(v3, "preferredDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "alternateDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = -[SUScanResults initWithPreferredDescriptor:alternateDescriptor:]([SUScanResults alloc], "initWithPreferredDescriptor:alternateDescriptor:", v5, v7);
  else
    v8 = 0;

  return v8;
}

- (void)notifyScanRequestDidFinish:(id)a3 results:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[SUScanner core](self, "core");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUScanner scanResultsForSUCoreScanResults:](self, "scanResultsForSUCoreScanResults:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8C8], "UTF8String"));
  objc_msgSend(v8, "callback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  if (v14)
  {
    -[SUScanner core](self, "core");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "externWorkQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke;
    block[3] = &unk_24CE3BE10;
    v39 = v14;
    v37 = v13;
    v38 = v9;
    dispatch_async(v17, block);

  }
  -[SUScanner core](self, "core");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    -[SUScanner core](self, "core");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "externWorkQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v32[0] = v15;
    v32[1] = 3221225472;
    v32[2] = __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke_2;
    v32[3] = &unk_24CE3C578;
    v32[4] = self;
    v33 = v8;
    v34 = v13;
    v35 = v9;
    dispatch_async(v22, v32);

  }
  -[SUScanner core](self, "core");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    -[SUScanner core](self, "core");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "externWorkQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke_3;
    v28[3] = &unk_24CE3C578;
    v28[4] = self;
    v29 = v8;
    v30 = v13;
    v31 = v9;
    dispatch_async(v27, v28);

  }
}

uint64_t __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "latestUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scanRequestDidFinishForOptions:update:error:", v3, v4, *(_QWORD *)(a1 + 56));

}

void __54__SUScanner_notifyScanRequestDidFinish_results_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scanRequestDidFinishForOptions:results:error:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)notifyScanDidComplete:(id)a3 options:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  id v31;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[SUScanner core](self, "core");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[SUScanner scanResultsForSUCoreScanResults:](self, "scanResultsForSUCoreScanResults:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUScanner core](self, "core");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  v17 = MEMORY[0x24BDAC760];
  if ((v16 & 1) != 0)
  {
    -[SUScanner core](self, "core");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "externWorkQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = v17;
    block[1] = 3221225472;
    block[2] = __49__SUScanner_notifyScanDidComplete_options_error___block_invoke;
    block[3] = &unk_24CE3BB38;
    block[4] = self;
    v30 = v13;
    v31 = v9;
    dispatch_async(v19, block);

  }
  -[SUScanner core](self, "core");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[SUScanner core](self, "core");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "externWorkQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __49__SUScanner_notifyScanDidComplete_options_error___block_invoke_2;
    v25[3] = &unk_24CE3C578;
    v25[4] = self;
    v26 = v8;
    v27 = v13;
    v28 = v9;
    dispatch_async(v24, v25);

  }
}

void __49__SUScanner_notifyScanDidComplete_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "latestUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scanDidCompleteWithNewUpdateAvailable:error:", v3, *(_QWORD *)(a1 + 48));

}

void __49__SUScanner_notifyScanDidComplete_options_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scanDidCompleteForOptions:results:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)_handleScanError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;

  v4 = a3;
  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = objc_msgSend(v4, "code");
  if (v7 == 40)
  {
    objc_msgSend(MEMORY[0x24BDE07F0], "sharedSystemPathMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isVPNActive");

    if (v9)
      v17 = CFSTR("Asset query timed out but VPN is connected.");
    else
      v17 = CFSTR("Asset query timed out and VPN not connected.");
    SULogInfo(v17, v10, v11, v12, v13, v14, v15, v16, v18);
  }
}

- (BOOL)shouldPresentUpdate:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  __CFString *v17;
  BOOL v18;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v17 = CFSTR("No update provided to shouldPresentUpdate:options:");
    goto LABEL_12;
  }
  if ((objc_msgSend(v6, "isSplatOnlyScan") & 1) == 0
    && (objc_msgSend(v6, "findsAnyUpdate") & 1) == 0
    && (objc_msgSend(v6, "containsType:", objc_msgSend(v14, "updateType")) & 1) == 0)
  {
    objc_msgSend(v6, "types");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SUStringFromUpdateTypes(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Scanned for [%@] updates, but didn't find any."), v22, v23, v24, v25, v26, v27, v28, (uint64_t)v21);

    goto LABEL_13;
  }
  if (objc_msgSend(v6, "isSplatOnlyScan"))
  {
    objc_msgSend(v5, "softwareUpdateAssetType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BEAE958]);

    if ((v16 & 1) == 0)
    {
      v17 = CFSTR("Scanned for splat updates, but found non-splat update.");
      goto LABEL_12;
    }
  }
  if (objc_msgSend(v5, "isRevokedSplat"))
  {
    v17 = CFSTR("Scan discovered revoked Splat. Not presenting update");
LABEL_12:
    SULogInfo(v17, v7, v8, v9, v10, v11, v12, v13, v29);
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  SULogInfo(CFSTR("Update found for scan options: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
  v18 = 1;
LABEL_14:

  return v18;
}

- (void)notifyClientForRecommendedUpdate:(id)a3 shouldPresent:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  BOOL v17;

  v6 = a3;
  -[SUScanner core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUScanner core](self, "core");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[SUScanner core](self, "core");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "externWorkQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__SUScanner_notifyClientForRecommendedUpdate_shouldPresent___block_invoke;
    block[3] = &unk_24CE3C498;
    block[4] = self;
    v16 = v9;
    v17 = a4;
    dispatch_async(v14, block);

  }
}

void __60__SUScanner_notifyClientForRecommendedUpdate_shouldPresent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingRecommendedUpdate:shouldPresent:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (id)recommendedDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;

  v3 = a3;
  objc_msgSend(v3, "preferredDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "recommendedUpdateApplicable") & 1) != 0)
  {
    objc_msgSend(v3, "alternateDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "recommendedUpdateApplicable");

    if (v8)
    {
      objc_msgSend(v3, "latestUpdate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("Both updates are recommended, returning latest update:%@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "preferredDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "documentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "recommendedUpdateApplicable");

  if (v19)
  {
    SULogInfo(CFSTR("Preferred update is recommended"), v20, v21, v22, v23, v24, v25, v26, v39);
    objc_msgSend(v3, "preferredDescriptor");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "alternateDescriptor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "documentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "recommendedUpdateApplicable");

    if (!v30)
    {
      SULogInfo(CFSTR("No recommended update"), v31, v32, v33, v34, v35, v36, v37, v39);
      v9 = 0;
      goto LABEL_11;
    }
    SULogInfo(CFSTR("Alternate update is recommended"), v31, v32, v33, v34, v35, v36, v37, v39);
    objc_msgSend(v3, "alternateDescriptor");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v27;
LABEL_11:

  return v9;
}

- (void)setupTimerForRecommendedUpdateNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  NSTimer *v47;
  NSTimer *recommendedUpdateTimer;
  uint64_t v49;
  _QWORD block[5];
  _QWORD v51[5];
  id v52;

  v11 = a3;
  if (self->_recommendedUpdateTimer)
  {
    SULogInfo(CFSTR("Recommended update timer already exist"), v4, v5, v6, v7, v8, v9, v10, v49);
  }
  else
  {
    -[SUScanner core](self, "core");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastRecommendedUpdateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "recommendedUpdateInterval");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "recommendedUpdateInterval");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v22 = v21;

      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "recommendedUpdateInterval");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("Found preference override for recommended update interval: %@"), v25, v26, v27, v28, v29, v30, v31, (uint64_t)v24);

    }
    else
    {
      v22 = v16 * 60.0 * 60.0 * 24.0;
    }
    -[SUScanner core](self, "core");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "state");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastRecommendedUpdateDiscoveryDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dateByAddingTimeInterval:", v22);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    SULogInfo(CFSTR("Setting recommended update timer for %@"), v36, v37, v38, v39, v40, v41, v42, (uint64_t)v35);
    v43 = (void *)MEMORY[0x24BDBCF40];
    objc_msgSend(v35, "timeIntervalSinceNow");
    v45 = v44;
    v46 = MEMORY[0x24BDAC760];
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke;
    v51[3] = &unk_24CE3D258;
    v51[4] = self;
    v52 = v11;
    objc_msgSend(v43, "timerWithTimeInterval:repeats:block:", 0, v51, v45);
    v47 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    recommendedUpdateTimer = self->_recommendedUpdateTimer;
    self->_recommendedUpdateTimer = v47;

    block[0] = v46;
    block[1] = 3221225472;
    block[2] = __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke_3;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "core");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke_2;
  v5[3] = &unk_24CE3B610;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

uint64_t __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  SULogInfo(CFSTR("Recommended update timer triggered"), a2, a3, a4, a5, a6, a7, a8, v19);
  objc_msgSend(*(id *)(a1 + 32), "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastRecommendedUpdateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  if (v12 == -1)
  {
    objc_msgSend(*(id *)(a1 + 32), "unscheduleRecommendedUpdateNotification");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "core");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLastRecommendedUpdateDiscoveryDate:", v13);

    objc_msgSend(*(id *)(a1 + 32), "core");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "state");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "save");

    objc_msgSend(*(id *)(a1 + 32), "cancelTimerForRecommendedUpdateNotification");
    objc_msgSend(*(id *)(a1 + 32), "setupTimerForRecommendedUpdateNotification:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "notifyClientForRecommendedUpdate:shouldPresent:", *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(a1 + 32), "notifyClientForRecommendedUpdate:shouldPresent:", *(_QWORD *)(a1 + 40), 1);
}

void __56__SUScanner_setupTimerForRecommendedUpdateNotification___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addTimer:forMode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *MEMORY[0x24BDBCA90]);

}

- (void)cancelTimerForRecommendedUpdateNotification
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSTimer *recommendedUpdateTimer;
  uint64_t v10;

  SULogInfo(CFSTR("Canceling recommended update timer"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v10);
  -[NSTimer invalidate](self->_recommendedUpdateTimer, "invalidate");
  recommendedUpdateTimer = self->_recommendedUpdateTimer;
  self->_recommendedUpdateTimer = 0;

}

- (void)scheduleRecommendedUpdateNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "productVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLastRecommendedUpdateVersion:", v4);

  objc_msgSend(v16, "documentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recommendedUpdateNotificationFrequencyDays");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScanner core](self, "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLastRecommendedUpdateInterval:", v8);

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScanner core](self, "core");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLastRecommendedUpdateDiscoveryDate:", v11);

  -[SUScanner core](self, "core");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "state");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "save");

  -[SUScanner cancelTimerForRecommendedUpdateNotification](self, "cancelTimerForRecommendedUpdateNotification");
  -[SUScanner setupTimerForRecommendedUpdateNotification:](self, "setupTimerForRecommendedUpdateNotification:", v16);

}

- (void)unscheduleRecommendedUpdateNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SUScanner core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastRecommendedUpdateVersion:", 0);

  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLastRecommendedUpdateInterval:", 0);

  -[SUScanner core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastRecommendedUpdateDiscoveryDate:", 0);

  -[SUScanner core](self, "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "save");

  -[SUScanner cancelTimerForRecommendedUpdateNotification](self, "cancelTimerForRecommendedUpdateNotification");
  -[SUScanner notifyClientForRecommendedUpdate:shouldPresent:](self, "notifyClientForRecommendedUpdate:shouldPresent:", 0, 0);
}

- (void)scheduleRecommendedUpdateFromResults:(id)a3
{
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;

  -[SUScanner recommendedDescriptor:](self, "recommendedDescriptor:", a3);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  -[SUScanner core](self, "core");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastRecommendedUpdateVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUScanner core](self, "core");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastRecommendedUpdateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v47, "productVersion");
    v17 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v17;
    if (v6)
    {
      if ((objc_msgSend(v6, "isEqual:", v17) & 1) != 0)
      {
        objc_msgSend(v47, "documentation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "recommendedUpdateNotificationFrequencyDays");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v9, "isEqual:", v27);

        if (v28)
        {
          SULogInfo(CFSTR("Found same recommended update:%@"), v29, v30, v31, v32, v33, v34, v35, (uint64_t)v9);
          -[SUScanner setupTimerForRecommendedUpdateNotification:](self, "setupTimerForRecommendedUpdateNotification:", v47);
          goto LABEL_13;
        }
      }
      else
      {

      }
      objc_msgSend(v47, "productVersion");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "documentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "recommendedUpdateNotificationFrequencyDays");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("Found a different recommended update. Old is %@ - %@, new is %@ - %@"), v38, v39, v40, v41, v42, v43, v44, (uint64_t)v6);

      -[SUScanner unscheduleRecommendedUpdateNotification](self, "unscheduleRecommendedUpdateNotification");
    }
    else
    {
      SULogInfo(CFSTR("Found new recommended update:%@"), v18, v19, v20, v21, v22, v23, v24, v17);

    }
    -[SUScanner scheduleRecommendedUpdateNotification:](self, "scheduleRecommendedUpdateNotification:", v47);
    goto LABEL_13;
  }
  if (v6)
  {
    SULogInfo(CFSTR("Last recommended update was:%@, but no recommended update found"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v6);
    -[SUScanner unscheduleRecommendedUpdateNotification](self, "unscheduleRecommendedUpdateNotification");
  }
  else
  {
    SULogInfo(CFSTR("No recommended update"), v10, v11, v12, v13, v14, v15, v16, v45);
  }
LABEL_13:

}

+ (int)typeForCoreDescriptor:(id)a3
{
  id v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if ((objc_msgSend(v3, "splatOnly") & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    v5 = objc_msgSend(v3, "updateType");
    if (v5 >= 6)
    {
      objc_msgSend(v3, "updateType");
      SULogInfo(CFSTR("%s: unknown update type:%ld"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"+[SUScanner typeForCoreDescriptor:]");
      v4 = 0;
    }
    else
    {
      v4 = dword_21297FBFC[v5];
    }
  }

  return v4;
}

- (BOOL)lastScannedMatchScanOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  int v22;
  BOOL v23;
  void *v25;

  v4 = a3;
  -[SUScanner preferredLastScannedCoreDescriptor](self, "preferredLastScannedCoreDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SUScanner typeForCoreDescriptor:](SUScanner, "typeForCoreDescriptor:", v5);

  -[SUScanner alternateLastScannedCoreDescriptor](self, "alternateLastScannedCoreDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SUScanner typeForCoreDescriptor:](SUScanner, "typeForCoreDescriptor:", v7);

  -[SUScanner preferredLastScannedCoreDescriptor](self, "preferredLastScannedCoreDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScanner alternateLastScannedCoreDescriptor](self, "alternateLastScannedCoreDescriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("%s: current scan options:%@ lastPreferred:%@ lastAlternate:%@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUScanner lastScannedMatchScanOptions:]");

  -[SUScanner preferredLastScannedCoreDescriptor](self, "preferredLastScannedCoreDescriptor");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    v19 = objc_msgSend(v4, "containsType:", v6);

    if (!v19)
      goto LABEL_6;
  }
  -[SUScanner alternateLastScannedCoreDescriptor](self, "alternateLastScannedCoreDescriptor");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20 && (v21 = (void *)v20, v22 = objc_msgSend(v4, "containsType:", v8), v21, !v22))
LABEL_6:
    v23 = 0;
  else
    v23 = 1;

  return v23;
}

- (void)scanCompleted:(id)a3 alternateDescriptor:(id)a4 scanOptions:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
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
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __CFString *v66;
  NSMutableArray *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  void *v72;
  void *v73;
  char v74;
  SUCoreScanResults *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __CFString *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const __CFString *v88;
  void *v89;
  char v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const __CFString *v107;
  const __CFString *v108;
  const __CFString *v109;
  char v110;
  char v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  _BOOL4 v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  int v139;
  void *v140;
  void *v141;
  char v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  int v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  BOOL v170;
  int v171;
  void *v172;
  int v173;
  id v174;
  void *v175;
  int v176;
  BOOL v177;
  char v178;
  void *v179;
  void *v180;
  char v181;
  void *v182;
  void *v183;
  void *v184;
  id v185;
  void *v186;
  int v187;
  BOOL v188;
  void *v189;
  void *v190;
  void *v191;
  int v192;
  void *v193;
  void *v194;
  void *v195;
  int v196;
  void *v197;
  void *v198;
  void *v199;
  int v200;
  void *v201;
  id v202;
  void *v203;
  char v204;
  void *v205;
  void *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  int v226;
  void *v227;
  id v228;
  void *v229;
  char v230;
  void *v231;
  void *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  NSMutableArray *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t j;
  void *v275;
  void *v276;
  void *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  const __CFString *v282;
  const __CFString *v283;
  void *v284;
  void *v285;
  void *v286;
  __CFString *v287;
  int v288;
  int v289;
  id v290;
  id v291;
  id v292;
  id v293;
  id v294;
  void *v295;
  id v296;
  id v297;
  void *v298;
  void *v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int16 v304;
  __int16 v305;
  __int16 v306;
  id v307;
  id v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  _BYTE v313[128];
  _BYTE v314[128];
  uint64_t v315;

  v315 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SUScanner core](self, "core");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  if (objc_msgSend(v10, "updateType") <= 2 && objc_msgSend(v11, "updateType") < 3)
  {
    -[SUScanner core](self, "core");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "state");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setLastScanDate:", v25);

  }
  else
  {
    SULogInfo(CFSTR("Found emergency updates, not setting last scan date"), v16, v17, v18, v19, v20, v21, v22, v278);
  }
  -[SUScanner activeScanTask](self, "activeScanTask");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "didScanForType:", 4);

  -[SUScanner activeScanTask](self, "activeScanTask");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "didScanForType:", 0) & 1) != 0)
  {
    v29 = 1;
  }
  else
  {
    -[SUScanner activeScanTask](self, "activeScanTask");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "didScanForType:", 2) & 1) != 0)
    {
      v29 = 1;
    }
    else
    {
      -[SUScanner activeScanTask](self, "activeScanTask");
      v31 = v10;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v32, "didScanForType:", 1);

      v10 = v31;
    }

  }
  -[SUScanner setScanning:](self, "setScanning:", 0);
  -[SUScanner setActiveScanTask:](self, "setActiveScanTask:", 0);
  v40 = 0x24CE3A000uLL;
  if (objc_msgSend(v10, "isRevokedSplat"))
  {
    SULogInfo(CFSTR("Found revoked splat update"), v33, v34, v35, v36, v37, v38, v39, v278);
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 3);
    v41 = objc_claimAutoreleasedReturnValue();

    -[SUScanner core](self, "core");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "revokedUpdateFound:", v10);

    v13 = (id)v41;
  }
  if (!v13)
  {
    v289 = v29;
    if (-[SUScanner shouldPresentUpdate:options:](self, "shouldPresentUpdate:options:", v10, v12))
    {
      if (!-[SUScanner shouldPresentUpdate:options:](self, "shouldPresentUpdate:options:", v11, v12))
      {
LABEL_41:

        v75 = 0;
        if (!v10)
        {
          v110 = 0;
          v117 = 1;
          v11 = 0;
          v10 = 0;
          goto LABEL_151;
        }
        v11 = 0;
LABEL_43:
        -[SUScanner core](self, "core");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "download");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v77, "progress");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v288 = objc_msgSend(v78, "isDone");

        objc_msgSend(v77, "progress");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "phase");
        v80 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v287 = v80;
        if (!v77)
          goto LABEL_60;
        v88 = CFSTR("NO");
        if (v288)
          v88 = CFSTR("YES");
        v282 = v80;
        SULogInfo(CFSTR("DownloadDone: %@ ProgressPhase: %@"), v81, v82, v83, v84, v85, v86, v87, (uint64_t)v88);
        if (v288
          && -[__CFString isEqualToString:](v80, "isEqualToString:", CFSTR("SUDownloadPhasePreparingForInstallation")))
        {
          SULogInfo(CFSTR("Scan found an update and a previously prepared update is present"), v81, v82, v83, v84, v85, v86, v87, v278);
          if (+[SUUtility currentReleaseTypeIsInternal](SUUtility, "currentReleaseTypeIsInternal"))
          {
            +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = objc_msgSend(v89, "disablePurgeOnNewerUpdateFound");

            if ((v90 & 1) != 0)
            {
              -[SUScanner preferredLastScannedCoreDescriptor](self, "preferredLastScannedCoreDescriptor");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUScanner alternateLastScannedCoreDescriptor](self, "alternateLastScannedCoreDescriptor");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = -[SUCoreScanResults initWithPreferredDescriptor:alternateDescriptor:]([SUCoreScanResults alloc], "initWithPreferredDescriptor:alternateDescriptor:", v91, v92);
              SULogInfo(CFSTR("Ignoring update located by scan due to existing prepared update (disablePurgeOnNewerUpdateFound is set)"), v93, v94, v95, v96, v97, v98, v99, v279);
              v107 = CFSTR("Present");
              if (v91)
                v108 = CFSTR("Present");
              else
                v108 = CFSTR("nil");
              if (v92)
                v109 = CFSTR("Present");
              else
                v109 = CFSTR("nil");
              if (!v75)
                v107 = CFSTR("nil");
              v282 = v109;
              v283 = v107;
              SULogInfo(CFSTR("lastPreferred: %@ lastAlternate: %@ results: %@"), v100, v101, v102, v103, v104, v105, v106, (uint64_t)v108);

              if (v75)
              {

                v110 = 1;
                v13 = 0;
LABEL_146:
                -[SUCoreScanResults preferredDescriptor](v75, "preferredDescriptor");
                v254 = (void *)objc_claimAutoreleasedReturnValue();
                if (v254)
                {
                  v117 = 0;
                }
                else
                {
                  -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                  v255 = (void *)objc_claimAutoreleasedReturnValue();
                  v117 = v255 == 0;

                }
                goto LABEL_151;
              }
              v111 = 1;
            }
            else
            {
              v111 = 0;
            }
            v13 = 0;
LABEL_62:
            v75 = -[SUCoreScanResults initWithPreferredDescriptor:alternateDescriptor:]([SUCoreScanResults alloc], "initWithPreferredDescriptor:alternateDescriptor:", v10, v11);
            if (!v77 || (v111 & 1) != 0)
            {
              v306 = 0;
              v305 = 0;
              v304 = 0;
              if ((v111 & 1) != 0)
              {
                v110 = 1;
                goto LABEL_143;
              }
LABEL_81:
              if (-[SUScanner scanResultsChangedSinceLastScan:preferredUpdateNewlyDiscovered:alternateUpdateNewlyDiscovered:preferredUpdateChanged:alternateUpdateChanged:preferredWasAlternate:alternateWasPreferred:](self, "scanResultsChangedSinceLastScan:preferredUpdateNewlyDiscovered:alternateUpdateNewlyDiscovered:preferredUpdateChanged:alternateUpdateChanged:preferredWasAlternate:alternateWasPreferred:", v75, (char *)&v306 + 1, &v306, (char *)&v305 + 1, &v305, (char *)&v304 + 1, &v304, v282, v283))
              {
                -[SUScanner setPreferredLastScannedCoreDescriptor:](self, "setPreferredLastScannedCoreDescriptor:", v10);
                -[SUScanner setAlternateLastScannedCoreDescriptor:](self, "setAlternateLastScannedCoreDescriptor:", v11);
                SULogInfo(CFSTR("%s: Setting last scan descriptors, preferred:%@, alternate:%@"), v162, v163, v164, v165, v166, v167, v168, (uint64_t)"-[SUScanner scanCompleted:alternateDescriptor:scanOptions:error:]");
                v294 = v13;
                if (HIBYTE(v305))
                {
                  -[SUCoreScanResults preferredDescriptor](v75, "preferredDescriptor");
                  v169 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v169)
                    v170 = HIBYTE(v304) == 0;
                  else
                    v170 = 0;
                  v171 = v170;

                  if (!(_BYTE)v305)
                  {
                    v172 = v77;
                    if ((v171 & 1) == 0)
                    {
                      v173 = 0;
LABEL_111:
                      v77 = v172;
                      goto LABEL_112;
                    }
                    goto LABEL_105;
                  }
                }
                else
                {
                  v171 = 0;
                  v173 = 0;
                  if (!(_BYTE)v305)
                  {
LABEL_112:
                    v185 = v10;
                    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
                    v186 = (void *)objc_claimAutoreleasedReturnValue();
                    v187 = objc_msgSend(v186, "isAutoDownloadDisabled");
                    if (v173 && v187)
                    {
                      v188 = -[SUScanner scanResultIsUpToDateWithAlternate:](self, "scanResultIsUpToDateWithAlternate:", v75);

                      if (v188)
                      {
LABEL_117:
                        objc_msgSend(MEMORY[0x24BDBCE60], "date");
                        v190 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SUCoreScanResults preferredDescriptor](v75, "preferredDescriptor");
                        v191 = (void *)objc_claimAutoreleasedReturnValue();
                        v192 = HIBYTE(v306);

                        if (v191 && v192)
                        {
                          -[SUCoreScanResults preferredDescriptor](v75, "preferredDescriptor");
                          v193 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v193, "productBuildVersion");
                          v194 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SUScanner setDiscoveryDate:forBuildVersion:](self, "setDiscoveryDate:forBuildVersion:", v190, v194);

                        }
                        -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                        v195 = (void *)objc_claimAutoreleasedReturnValue();
                        v196 = v306;

                        if (v195 && v196)
                        {
                          -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                          v197 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v197, "productBuildVersion");
                          v198 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SUScanner setDiscoveryDate:forBuildVersion:](self, "setDiscoveryDate:forBuildVersion:", v190, v198);

                        }
                        -[SUCoreScanResults preferredDescriptor](v75, "preferredDescriptor");
                        v199 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v199 || (v200 = HIBYTE(v306) | HIBYTE(v305), v199, !v200))
                        {
LABEL_132:
                          -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                          v225 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v225)
                            goto LABEL_140;
                          v226 = v306 | v305;

                          if (!v226)
                            goto LABEL_140;
                          v286 = v77;
                          v297 = v11;
                          -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                          v227 = (void *)objc_claimAutoreleasedReturnValue();
                          v228 = v12;
                          if (objc_msgSend(v227, "granularlyRamped"))
                          {

                          }
                          else
                          {
                            -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                            v229 = (void *)objc_claimAutoreleasedReturnValue();
                            v230 = objc_msgSend(v229, "rampEnabled");

                            if ((v230 & 1) == 0)
                            {
                              -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                              v242 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v242, "productBuildVersion");
                              v243 = (void *)objc_claimAutoreleasedReturnValue();
                              SULogInfo(CFSTR("[scanCompleted] %@ is fully unramped!"), v244, v245, v246, v247, v248, v249, v250, (uint64_t)v243);

                              -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                              v240 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v240, "productBuildVersion");
                              v241 = (void *)objc_claimAutoreleasedReturnValue();
                              -[SUScanner setFullyUnrampedDate:forBuildVersion:](self, "setFullyUnrampedDate:forBuildVersion:", v190, v241);
                              goto LABEL_139;
                            }
                          }
                          -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                          v231 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v231, "productBuildVersion");
                          v232 = (void *)objc_claimAutoreleasedReturnValue();
                          SULogInfo(CFSTR("[scanCompleted] %@ is not fully unramped."), v233, v234, v235, v236, v237, v238, v239, (uint64_t)v232);

                          -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                          v240 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v240, "productBuildVersion");
                          v241 = (void *)objc_claimAutoreleasedReturnValue();
                          -[SUScanner removeFullyUnrampedDateForBuildVersion:](self, "removeFullyUnrampedDateForBuildVersion:", v241);
LABEL_139:

                          v12 = v228;
                          v11 = v297;
                          v77 = v286;
LABEL_140:
                          -[SUScanner setLastScannedDescriptorScanOptions:](self, "setLastScannedDescriptorScanOptions:", v12);
                          if (v173)
                          {
                            -[SUScanner core](self, "core");
                            v251 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v251, "adoptPotentialSessionID");

                            -[SUScanner core](self, "core");
                            v252 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v252, "reportOTAAvailableEvent:", v75);

                            -[SUScanner core](self, "core");
                            v253 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v253, "reportCoreAnalyticsOTAAvailableEvent:", v75);

                          }
                          v110 = 0;
                          v10 = v185;
                          v13 = v294;
                          v40 = 0x24CE3A000uLL;
                          goto LABEL_143;
                        }
                        v285 = v77;
                        v296 = v11;
                        -[SUCoreScanResults preferredDescriptor](v75, "preferredDescriptor");
                        v201 = (void *)objc_claimAutoreleasedReturnValue();
                        v202 = v12;
                        if (objc_msgSend(v201, "granularlyRamped"))
                        {

                        }
                        else
                        {
                          -[SUCoreScanResults preferredDescriptor](v75, "preferredDescriptor");
                          v203 = (void *)objc_claimAutoreleasedReturnValue();
                          v204 = objc_msgSend(v203, "rampEnabled");

                          if ((v204 & 1) == 0)
                          {
                            -[SUCoreScanResults preferredDescriptor](v75, "preferredDescriptor");
                            v216 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v216, "productBuildVersion");
                            v217 = (void *)objc_claimAutoreleasedReturnValue();
                            SULogInfo(CFSTR("[scanCompleted] %@ is fully unramped."), v218, v219, v220, v221, v222, v223, v224, (uint64_t)v217);

                            -[SUCoreScanResults preferredDescriptor](v75, "preferredDescriptor");
                            v214 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v214, "productBuildVersion");
                            v215 = (void *)objc_claimAutoreleasedReturnValue();
                            -[SUScanner setFullyUnrampedDate:forBuildVersion:](self, "setFullyUnrampedDate:forBuildVersion:", v190, v215);
                            goto LABEL_131;
                          }
                        }
                        -[SUCoreScanResults preferredDescriptor](v75, "preferredDescriptor");
                        v205 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v205, "productBuildVersion");
                        v206 = (void *)objc_claimAutoreleasedReturnValue();
                        SULogInfo(CFSTR("[scanCompleted] %@ is not fully unramped."), v207, v208, v209, v210, v211, v212, v213, (uint64_t)v206);

                        -[SUCoreScanResults preferredDescriptor](v75, "preferredDescriptor");
                        v214 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v214, "productBuildVersion");
                        v215 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SUScanner removeFullyUnrampedDateForBuildVersion:](self, "removeFullyUnrampedDateForBuildVersion:", v215);
LABEL_131:

                        v12 = v202;
                        v11 = v296;
                        v77 = v285;
                        goto LABEL_132;
                      }
                      -[SUScanner core](self, "core");
                      v186 = (void *)objc_claimAutoreleasedReturnValue();
                      +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v185);
                      v189 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v186, "badgeSettingsForManualSoftwareUpdate:", v189);

                    }
                    goto LABEL_117;
                  }
                }
                v172 = v77;
                v174 = v11;
                -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                v176 = v304;

                if (v175)
                  v177 = v176 == 0;
                else
                  v177 = 0;
                v178 = v177;
                if (v177)
                  v173 = 1;
                else
                  v173 = v171;
                v11 = v174;
                if ((v171 & 1) == 0)
                  goto LABEL_111;
                if ((v178 & 1) != 0)
                {
LABEL_106:
                  -[SUScanner core](self, "core");
                  v179 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v179, "isDownloading") & 1) == 0)
                  {
                    -[SUScanner core](self, "core");
                    v180 = (void *)objc_claimAutoreleasedReturnValue();
                    v181 = objc_msgSend(v180, "isUpdateDownloaded");

                    if ((v181 & 1) != 0)
                    {
LABEL_110:
                      v173 = 1;
                      goto LABEL_111;
                    }
                    -[SUScanner core](self, "core");
                    v182 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v182, "endAutodownloadTasksAndResetState");

                    -[SUScanner core](self, "core");
                    v183 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v183, "clearUnlockCallbacks");

                    -[SUScanner core](self, "core");
                    v184 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v184, "updateInstallPolicyType:", 0);

                    -[SUScanner core](self, "core");
                    v179 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v179, "clearKeybagStash");
                  }
LABEL_109:

                  goto LABEL_110;
                }
LABEL_105:
                -[SUCoreScanResults alternateDescriptor](v75, "alternateDescriptor");
                v179 = (void *)objc_claimAutoreleasedReturnValue();
                if (v179)
                  goto LABEL_109;
                goto LABEL_106;
              }
              v110 = 0;
LABEL_143:
              if ((v288 & 1) == 0)
                -[SUScanner scheduleRecommendedUpdateFromResults:](self, "scheduleRecommendedUpdateFromResults:", v75);

              if (v75)
                goto LABEL_146;
              v117 = 1;
LABEL_151:
              if (((!v117 | v289) & 1) != 0
                || -[SUScanner lastScannedMatchScanOptions:](self, "lastScannedMatchScanOptions:", v12))
              {
                if ((v110 & 1) == 0)
                {
                  -[SUScanner setPreferredLastScannedCoreDescriptor:](self, "setPreferredLastScannedCoreDescriptor:", v10);
                  -[SUScanner setAlternateLastScannedCoreDescriptor:](self, "setAlternateLastScannedCoreDescriptor:", v11);
                  SULogInfo(CFSTR("%s: Setting last scan descriptors, preferred:%@, alternate:%@"), v263, v264, v265, v266, v267, v268, v269, (uint64_t)"-[SUScanner scanCompleted:alternateDescriptor:scanOptions:error:]");
                }
              }
              else
              {
                SULogInfo(CFSTR("%s: scan for emergency or splat only update ended with no results and previous scan is not of the same type, ignore current scan result and keep the previous one"), v256, v257, v258, v259, v260, v261, v262, (uint64_t)"-[SUScanner scanCompleted:alternateDescriptor:scanOptions:error:]");
              }
              v295 = v11;
              v298 = v10;
              if (v117)
              {
                objc_msgSend(*(id *)(v40 + 2752), "errorWithCode:", 3);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v43 = 0;
              }
              goto LABEL_159;
            }
            v291 = v12;
            objc_msgSend(v77, "descriptor");
            v112 = v10;
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "productBuildVersion");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v299 = v112;
            objc_msgSend(v112, "productBuildVersion");
            v115 = v77;
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v114, "isEqual:", v116))
            {

              v306 = 0;
              v305 = 0;
              v304 = 0;
              v12 = v291;
              v10 = v299;
              v77 = v115;
              goto LABEL_81;
            }
            v293 = v13;
            v284 = v115;
            objc_msgSend(v115, "descriptor");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "productBuildVersion");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "productBuildVersion");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            v130 = objc_msgSend(v128, "isEqual:", v129);

            if ((v130 & 1) != 0)
            {
              v306 = 0;
              v305 = 0;
              v304 = 0;
              v12 = v291;
              v13 = v293;
              v10 = v299;
              v40 = 0x24CE3A000;
              v77 = v284;
              goto LABEL_81;
            }
            SULogInfo(CFSTR("Update found was newer than curently download(ed|ing) update.  Attempting to cancel download."), v131, v132, v133, v134, v135, v136, v137, v279);
            -[SUScanner core](self, "core");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = objc_msgSend(v138, "isDownloading");

            -[SUScanner core](self, "core");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v141 = v140;
            if (v139)
            {
              v308 = 0;
              v142 = objc_msgSend(v140, "cancelDownload:userRequested:keepDocAssets:error:", 0, 0, 1, &v308);
              v143 = v308;

              v13 = v293;
              v40 = 0x24CE3A000;
              v77 = v284;
              if ((v142 & 1) == 0)
              {
LABEL_77:
                SULogInfo(CFSTR("Unable to cancel download: %@"), v144, v145, v146, v147, v148, v149, v150, (uint64_t)v143);
                -[SUScanner core](self, "core");
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v151, "cleanupPreviousDownloadState");

LABEL_80:
                v12 = v291;
                -[SUScanner core](self, "core");
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v153, "updateInstallPolicyType:", 0);

                SULogInfo(CFSTR("Previous download invalidated/destroyed for new update."), v154, v155, v156, v157, v158, v159, v160, v281);
                -[SUScanner core](self, "core");
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v161, "sendDownloadInvalidatedForNewDescriptors:", v75);

                v306 = 0;
                v305 = 0;
                v304 = 0;
                v10 = v299;
                goto LABEL_81;
              }
            }
            else
            {
              v307 = 0;
              v152 = objc_msgSend(v140, "killDownload:userRequested:keepDocAssets:error:", 0, 0, 1, &v307);
              v143 = v307;

              v13 = v293;
              v40 = 0x24CE3A000;
              v77 = v284;
              if (!v152)
                goto LABEL_77;
            }
            SULogInfo(CFSTR("Current download is successfully canceled."), v144, v145, v146, v147, v148, v149, v150, v280);
            goto LABEL_80;
          }
        }
        else
        {
LABEL_60:
          SULogInfo(CFSTR("Scan found an update and no previously prepared update is present"), v81, v82, v83, v84, v85, v86, v87, v278);
        }
        v111 = 0;
        goto LABEL_62;
      }
      if (v10)
        goto LABEL_43;
    }
    else
    {

      if (!-[SUScanner shouldPresentUpdate:options:](self, "shouldPresentUpdate:options:", v11, v12))
      {
        v10 = 0;
        goto LABEL_41;
      }
    }
    v10 = v11;
    goto LABEL_41;
  }
  +[SUUtility translateError:](SUUtility, "translateError:", v13);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isSplatOnlyScan") && objc_msgSend(v43, "isCatalogNotFound"))
  {
    SULogInfo(CFSTR("Scanning for splat update, catalog not found: %@"), v44, v45, v46, v47, v48, v49, v50, (uint64_t)v43);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 3, 0);
    v51 = objc_claimAutoreleasedReturnValue();

    v43 = (void *)v51;
  }
  v295 = v11;
  v298 = v10;
  if (objc_msgSend(v43, "code") == 3)
  {
    if (objc_msgSend(v12, "isEmergencyOnlyScan"))
    {
      v66 = CFSTR("No emergency update found");
    }
    else
    {
      if (!objc_msgSend(v12, "ignoreNoUpdateFoundResult"))
      {
        SULogInfo(CFSTR("Device is up to date"), v59, v60, v61, v62, v63, v64, v65, v278);
        -[SUScanner setPreferredLastScannedCoreDescriptor:](self, "setPreferredLastScannedCoreDescriptor:", 0);
        -[SUScanner setAlternateLastScannedCoreDescriptor:](self, "setAlternateLastScannedCoreDescriptor:", 0);
        SULogInfo(CFSTR("%s: Setting last scan descriptors to nil"), v118, v119, v120, v121, v122, v123, v124, (uint64_t)"-[SUScanner scanCompleted:alternateDescriptor:scanOptions:error:]");
        if ((_DWORD)v29)
          -[SUScanner scheduleRecommendedUpdateFromResults:](self, "scheduleRecommendedUpdateFromResults:", 0);
        -[SUScanner core](self, "core");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "deviceIsUpToDateForSU:forSplat:", v29, v27);

        -[SUScanner core](self, "core");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "dismissInsufficientDiskSpaceFollowupForUpdate:orForce:", 0, 1);

        goto LABEL_72;
      }
      v66 = CFSTR("Ignoring no update found result due to scan options");
    }
    SULogInfo(v66, v59, v60, v61, v62, v63, v64, v65, v278);
LABEL_72:
    v75 = 0;
    goto LABEL_159;
  }
  v290 = v12;
  v292 = v13;
  SULogInfo(CFSTR("Error scanning for update: %@"), v52, v53, v54, v55, v56, v57, v58, (uint64_t)v43);
  v311 = 0u;
  v312 = 0u;
  v309 = 0u;
  v310 = 0u;
  v67 = self->_scanRequests;
  v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v309, v314, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v310;
    while (2)
    {
      for (i = 0; i != v69; ++i)
      {
        if (*(_QWORD *)v310 != v70)
          objc_enumerationMutation(v67);
        objc_msgSend(*(id *)(*((_QWORD *)&v309 + 1) + 8 * i), "options");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "identifier");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "isEqualToString:", CFSTR("com.apple.softwareupdate.autoscan"));

        if ((v74 & 1) == 0)
        {
          -[SUScanner _handleScanError:](self, "_handleScanError:", v43);

          goto LABEL_34;
        }

      }
      v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v309, v314, 16);
      if (v69)
        continue;
      break;
    }
  }
LABEL_34:

  v75 = 0;
  v12 = v290;
  v13 = v292;
LABEL_159:
  v302 = 0u;
  v303 = 0u;
  v300 = 0u;
  v301 = 0u;
  v270 = self->_scanRequests;
  v271 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v270, "countByEnumeratingWithState:objects:count:", &v300, v313, 16);
  if (v271)
  {
    v272 = v271;
    v273 = *(_QWORD *)v301;
    do
    {
      for (j = 0; j != v272; ++j)
      {
        if (*(_QWORD *)v301 != v273)
          objc_enumerationMutation(v270);
        v275 = *(void **)(*((_QWORD *)&v300 + 1) + 8 * j);
        objc_msgSend(v275, "setResults:", v75);
        objc_msgSend(v275, "setError:", v43);
        -[SUScanner notifyScanRequestDidFinish:results:error:](self, "notifyScanRequestDidFinish:results:error:", v275, v75, v43);
      }
      v272 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v270, "countByEnumeratingWithState:objects:count:", &v300, v313, 16);
    }
    while (v272);
  }

  -[SUScanner notifyScanDidComplete:options:error:](self, "notifyScanDidComplete:options:error:", v75, v12, v43);
  -[SUScanner core](self, "core");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v276, "state");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v277, "save");

  -[NSMutableArray removeAllObjects](self->_scanRequests, "removeAllObjects");
}

- (BOOL)scanResultsChangedSinceLastScan:(id)a3 preferredUpdateNewlyDiscovered:(BOOL *)a4 alternateUpdateNewlyDiscovered:(BOOL *)a5 preferredUpdateChanged:(BOOL *)a6 alternateUpdateChanged:(BOOL *)a7 preferredWasAlternate:(BOOL *)a8 alternateWasPreferred:(BOOL *)a9
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SUUpdateDiscoveryDateManager *discoveryDateManager;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  unsigned int v33;
  int v34;
  __CFString *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  SUUpdateDiscoveryDateManager *v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  char v57;
  char v58;
  int v59;
  __CFString *v60;
  void *v61;
  _BYTE *v62;
  uint64_t v64;
  BOOL *v65;

  v11 = a3;
  objc_msgSend(v11, "preferredDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = a7;
  if (v12)
  {
    discoveryDateManager = self->_discoveryDateManager;
    objc_msgSend(v11, "preferredDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "productBuildVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(discoveryDateManager) = -[SUUpdateDiscoveryDateManager containsBuildVersion:](discoveryDateManager, "containsBuildVersion:", v22);
    v23 = discoveryDateManager ^ 1;

    if ((discoveryDateManager & 1) == 0)
      SULogInfo(CFSTR("scanResultsChangedSinceLastScan: Preferred update is newly discovered"), v24, v25, v26, v27, v28, v29, v30, v64);
    objc_msgSend(v11, "preferredDescriptor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToDescriptor:", self->_preferredLastScannedCoreDescriptor);

    if ((v32 & 1) != 0)
    {
      v33 = 0;
      LOBYTE(v34) = 0;
      goto LABEL_14;
    }
    objc_msgSend(v11, "preferredDescriptor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v36, "isEqualToDescriptor:", self->_alternateLastScannedCoreDescriptor);

    if (v34)
      v35 = CFSTR("scanResultsChangedSinceLastScan: Preferred update was previously the alternate update");
    else
      v35 = CFSTR("scanResultsChangedSinceLastScan: Preferred update has changed");
    v33 = v34 ^ 1;
    goto LABEL_12;
  }
  v23 = 0;
  if (self->_preferredLastScannedCoreDescriptor)
  {
    v33 = 1;
    v35 = CFSTR("scanResultsChangedSinceLastScan: Preferred update is newly null");
    LOBYTE(v34) = 0;
LABEL_12:
    SULogInfo(v35, v13, v14, v15, v16, v17, v18, v19, v64);
    goto LABEL_14;
  }
  v33 = 0;
  LOBYTE(v34) = 0;
LABEL_14:
  objc_msgSend(v11, "alternateDescriptor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    v48 = 0;
    if (!self->_alternateLastScannedCoreDescriptor)
    {
      v58 = 0;
      LOBYTE(v59) = 0;
      goto LABEL_27;
    }
    v58 = 1;
    v60 = CFSTR("scanResultsChangedSinceLastScan: Alternate update is newly null");
    LOBYTE(v59) = 0;
LABEL_25:
    v62 = v65;
    SULogInfo(v60, v38, v39, v40, v41, v42, v43, v44, v64);
    goto LABEL_28;
  }
  v45 = self->_discoveryDateManager;
  objc_msgSend(v11, "alternateDescriptor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "productBuildVersion");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v45) = -[SUUpdateDiscoveryDateManager containsBuildVersion:](v45, "containsBuildVersion:", v47);
  v48 = v45 ^ 1;

  if ((v45 & 1) == 0)
    SULogInfo(CFSTR("scanResultsChangedSinceLastScan: Alternate update is newly discovered"), v49, v50, v51, v52, v53, v54, v55, v64);
  objc_msgSend(v11, "alternateDescriptor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "isEqualToDescriptor:", self->_alternateLastScannedCoreDescriptor);

  if ((v57 & 1) == 0)
  {
    objc_msgSend(v11, "alternateDescriptor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v61, "isEqualToDescriptor:", self->_preferredLastScannedCoreDescriptor);

    if (v59)
      v60 = CFSTR("scanResultsChangedSinceLastScan: Alternate update was previously the preferred update");
    else
      v60 = CFSTR("scanResultsChangedSinceLastScan: Alternate update has changed");
    v58 = v59 ^ 1;
    goto LABEL_25;
  }
  v58 = 0;
  LOBYTE(v59) = 0;
LABEL_27:
  v62 = v65;
LABEL_28:
  if (a8)
    *a8 = v34;
  if (a9)
    *a9 = v59;
  if (a4)
    *a4 = v23;
  if (a5)
    *a5 = v48;
  if (a6)
    *a6 = v33;
  if (v62)
    *v62 = v58;
  SULogInfo(CFSTR("scanResultsChangedSinceLastScan: pc=%d, ac=%d, pwa=%d, awp=%d, pnd=%d, and=%d"), v38, v39, v40, v41, v42, v43, v44, v33);

  return v59 | v34 | v33 | v58 | v23 | v48;
}

- (BOOL)scanResultIsUpToDateWithAlternate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "preferredDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "alternateDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v3, "preferredDescriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "promoteAlternateUpdate"))
      {
        objc_msgSend(v3, "preferredDescriptor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v8, "descriptorAudienceType") == 1;

      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_doScanForUpdates
{
  void *v3;
  _QWORD v4[5];

  -[SUScanner activeScanTask](self, "activeScanTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__SUScanner__doScanForUpdates__block_invoke;
  v4[3] = &unk_24CE3D280;
  v4[4] = self;
  objc_msgSend(v3, "scanForSUAssetWithCompletion:", v4);

}

uint64_t __30__SUScanner__doScanForUpdates__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor:preferredSecondaryDescriptor:alternatePrimaryDescriptor:alternateSecondaryDescriptor:scanOptions:error:", a2, a3, a4, a5, a6, a7);
}

- (void)scanForUpdates:(id)a3 shouldUseDDMInState:(BOOL)a4 complete:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  id *v15;
  _QWORD *v16;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void (**v42)(_QWORD, _QWORD);
  void *v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  SUScanner *v47;
  id v48;
  void (**v49)(_QWORD, _QWORD);
  _QWORD v50[5];
  id v51;
  _QWORD block[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;

  v7 = a3;
  v8 = a5;
  -[SUScanner core](self, "core");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (v7)
  {
    -[SUScanner core](self, "core");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isInstalling");

    if (v12)
    {
      if (v8)
      {
        -[SUScanner core](self, "core");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "externWorkQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        v56[0] = MEMORY[0x24BDAC760];
        v56[1] = 3221225472;
        v56[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_2;
        v56[3] = &unk_24CE3C470;
        v15 = &v57;
        v57 = v8;
        v16 = v56;
LABEL_21:
        dispatch_async(v14, v16);

LABEL_22:
      }
    }
    else
    {
      if ((objc_msgSend(v7, "clientIsBuddy") & 1) == 0 && !-[SUScanner isBuddyRunning](self, "isBuddyRunning")
        || !objc_msgSend(v7, "isSplatOnlyScan"))
      {
        if (objc_msgSend(v7, "clientIsBuddy"))
        {
          SULogInfo(CFSTR("%s: skipping network check because this is buddy"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[SUScanner scanForUpdates:shouldUseDDMInState:complete:]");
        }
        else
        {
          +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "currentNetworkType");

          if (!v32)
          {
            SULogInfo(CFSTR("network unavailable canceling scan"), v33, v34, v35, v36, v37, v38, v39, v44);
            if (v8)
            {
              -[SUScanner core](self, "core");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "externWorkQueue");
              v14 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_4;
              block[3] = &unk_24CE3C470;
              v15 = &v53;
              v53 = v8;
              v16 = block;
              goto LABEL_21;
            }
            goto LABEL_23;
          }
        }
        v40 = MEMORY[0x24BDAC760];
        v50[0] = MEMORY[0x24BDAC760];
        v50[1] = 3221225472;
        v50[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_5;
        v50[3] = &unk_24CE3D2A8;
        v15 = &v51;
        v41 = v8;
        v50[4] = self;
        v51 = v41;
        v42 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BF6094](v50);
        if ((objc_msgSend(v7, "clientIsDDM") & 1) != 0)
        {
          ((void (**)(_QWORD, id))v42)[2](v42, v7);
        }
        else
        {
          -[SUScanner core](self, "core");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = v40;
          v45[1] = 3221225472;
          v45[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_6;
          v45[3] = &unk_24CE3D2D0;
          v46 = v7;
          v47 = self;
          v48 = v41;
          v49 = v42;
          objc_msgSend(v43, "amendManagedScanOptions:withResponse:", v46, v45);

        }
        goto LABEL_22;
      }
      SULogInfo(CFSTR("%s: don't scan for splats for buddy"), v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUScanner scanForUpdates:shouldUseDDMInState:complete:]");
      if (v8)
      {
        -[SUScanner core](self, "core");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "externWorkQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_3;
        v54[3] = &unk_24CE3C470;
        v15 = &v55;
        v55 = v8;
        v16 = v54;
        goto LABEL_21;
      }
    }
  }
  else if (v8)
  {
    -[SUScanner core](self, "core");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "externWorkQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke;
    v58[3] = &unk_24CE3C470;
    v15 = &v59;
    v59 = v8;
    v16 = v58;
    goto LABEL_21;
  }
LABEL_23:

}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 22);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 14);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 26);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_5(uint64_t a1, void *a2)
{
  SUManagerScanRequest *v3;
  void *v4;
  void *v5;
  SUScanTask *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;

  v49 = a2;
  v3 = objc_alloc_init(SUManagerScanRequest);
  -[SUManagerScanRequest setOptions:](v3, "setOptions:", v49);
  -[SUManagerScanRequest setCallback:](v3, "setCallback:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v3);
  objc_msgSend(*(id *)(a1 + 32), "core");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createpotentialNextSessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "setSessionID:", v5);
  v6 = -[SUScanTask initWithOptions:]([SUScanTask alloc], "initWithOptions:", v49);
  objc_msgSend(*(id *)(a1 + 32), "activeScanTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeScanTask");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "scanPriority");
    v17 = -[SUScanTask scanPriority](v6, "scanPriority");

    v18 = *(void **)(a1 + 32);
    if (v16 >= v17)
    {
      objc_msgSend(v18, "stringForScanPriority:", -[SUScanTask scanPriority](v6, "scanPriority"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(void **)(a1 + 32);
      objc_msgSend(v37, "activeScanTask");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringForScanPriority:", objc_msgSend(v38, "scanPriority"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("Coalescing scan %@ with %@ scan"), v39, v40, v41, v42, v43, v44, v45, (uint64_t)v36);

      objc_msgSend(*(id *)(a1 + 32), "notifyScanRequestDidStart:", v3);
      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 32), "activeScanTask");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringForScanPriority:", objc_msgSend(v19, "scanPriority"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForScanPriority:", -[SUScanTask scanPriority](v6, "scanPriority"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Canceling active scan (%@) in favor of higher priority scan (%@)"), v21, v22, v23, v24, v25, v26, v27, (uint64_t)v20);

    objc_msgSend(*(id *)(a1 + 32), "activeScanTask");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "cancelTask");

  }
  SULogInfo(CFSTR("Scanning for new OTA software update..."), v8, v9, v10, v11, v12, v13, v14, v46);
  SULogInfo(CFSTR("Scan Options: %@"), v29, v30, v31, v32, v33, v34, v35, (uint64_t)v49);
  objc_msgSend(*(id *)(a1 + 32), "setScanning:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setActiveScanTask:", v6);
  objc_msgSend(*(id *)(a1 + 32), "notifyScanRequestDidStart:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_doScanForUpdates");
LABEL_6:

}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isSplatOnlyScan")
    && (objc_msgSend(*(id *)(a1 + 32), "MDMShowRapidSecurityResponse") & 1) == 0)
  {
    SULogInfo(CFSTR("Splat-only asset scan disabled by device management"), v4, v5, v6, v7, v8, v9, v10, v13);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "core");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "externWorkQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_7;
      block[3] = &unk_24CE3C470;
      v15 = *(id *)(a1 + 48);
      dispatch_async(v12, block);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __57__SUScanner_scanForUpdates_shouldUseDDMInState_complete___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)scanForUpdates:(id)a3 complete:(id)a4
{
  -[SUScanner scanForUpdates:shouldUseDDMInState:complete:](self, "scanForUpdates:shouldUseDDMInState:complete:", a3, 1, a4);
}

- (void)handleActiveScanTaskDocumentationFor:(id)a3 withOptions:(id)a4 withSelectedDescriptorCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30[5];
  id v31;
  _QWORD *v32;
  uint64_t *v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__14;
  v40 = __Block_byref_object_dispose__14;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Primary"));
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__14;
  v34[4] = __Block_byref_object_dispose__14;
  v35 = 0;
  if (-[SUScanner _coreDescriptorFailedPatching:](self, "_coreDescriptorFailedPatching:", v37[5]))
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "disableFullReplacementFallback");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Secondary"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v37[5];
      v37[5] = v13;

    }
  }
  v15 = (void *)v37[5];
  if (!v15)
  {
    v17 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v15, "documentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    if (objc_msgSend(v9, "clientIsBuddy"))
    {
      +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isBootstrap") & 1) != 0)
      {
        +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isPathSatisfied");

        if ((v20 & 1) == 0)
        {
          SULogInfo(CFSTR("Skip loading documentation for buddy on bootstrap network"), v21, v22, v23, v24, v25, v26, v27, v30[0]);
          goto LABEL_6;
        }
      }
      else
      {

      }
    }
    -[SUScanner activeScanTask](self, "activeScanTask");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v37[5];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = (uint64_t)__95__SUScanner_handleActiveScanTaskDocumentationFor_withOptions_withSelectedDescriptorCompletion___block_invoke;
    v30[3] = (uint64_t)&unk_24CE3D320;
    v33 = &v36;
    v32 = v34;
    v30[4] = (uint64_t)self;
    v31 = v10;
    objc_msgSend(v28, "scanForDocumentationAssetWithDescriptor:completion:", v29, v30);

    goto LABEL_15;
  }
LABEL_6:
  v17 = v37[5];
LABEL_8:
  (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, v17, 0);
LABEL_15:
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(&v36, 8);
}

void __95__SUScanner_handleActiveScanTaskDocumentationFor_withOptions_withSelectedDescriptorCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  int8x16_t v16;

  v5 = a2;
  if (a3)
  {
    +[SUUtility errorWithCode:originalError:](SUUtility, "errorWithCode:originalError:", 4, a3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "documentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = v5;
      v8 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v11;
      goto LABEL_6;
    }
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 38);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;
LABEL_6:

  objc_msgSend(*(id *)(a1 + 32), "core");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__SUScanner_handleActiveScanTaskDocumentationFor_withOptions_withSelectedDescriptorCompletion___block_invoke_2;
  block[3] = &unk_24CE3D2F8;
  v15 = *(id *)(a1 + 40);
  v16 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  dispatch_async(v13, block);

}

uint64_t __95__SUScanner_handleActiveScanTaskDocumentationFor_withOptions_withSelectedDescriptorCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor:(id)a3 preferredSecondaryDescriptor:(id)a4 alternatePrimaryDescriptor:(id)a5 alternateSecondaryDescriptor:(id)a6 scanOptions:(id)a7 error:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  SUScanner *v34;
  id v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  -[SUScanner core](self, "core");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "workQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke;
  block[3] = &unk_24CE3D398;
  v29 = v19;
  v30 = v14;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v34 = self;
  v35 = v18;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = v14;
  v27 = v19;
  dispatch_async(v21, block);

}

void __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 72), "_handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:", 0, 0, *(_QWORD *)(a1 + 80));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("Primary"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("Secondary"));
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("Primary"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), CFSTR("Secondary"));
    v5 = *(void **)(a1 + 72);
    v4 = *(void **)(a1 + 80);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke_2;
    v7[3] = &unk_24CE3D370;
    v7[4] = v5;
    v8 = v4;
    v9 = v3;
    v6 = v3;
    objc_msgSend(v5, "handleActiveScanTaskDocumentationFor:withOptions:withSelectedDescriptorCompletion:", v2, v8, v7);

  }
}

void __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v5 = a2;
  v13 = a3;
  if (v13)
    SULogInfo(CFSTR("%s - doc scan for preferred descriptor failed with: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUScanner handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor:preferredSecondaryDescriptor:alternatePrimaryDescriptor:alternateSecondaryDescriptor:scanOptions:error:]_block_invoke_2");
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__14;
  v28 = __Block_byref_object_dispose__14;
  v14 = a1[4];
  objc_msgSend(a1[5], "requestedBuild");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_handleDescriptor:forRequestedBuild:", v5, v15);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1[6], "count"))
  {
    v16 = a1[5];
    v17 = a1[6];
    v18 = a1[4];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke_3;
    v21[3] = &unk_24CE3D348;
    v21[4] = v18;
    v22 = v16;
    v23 = &v24;
    objc_msgSend(v18, "handleActiveScanTaskDocumentationFor:withOptions:withSelectedDescriptorCompletion:", v17, v22, v21);

  }
  else
  {
    v19 = v25[5];
    if (v19)
    {
      v20 = 0;
    }
    else
    {
      +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 105);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v25[5];
    }
    objc_msgSend(a1[4], "_handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:", v19, 0, a1[5], v20);

  }
  _Block_object_dispose(&v24, 8);

}

void __181__SUScanner_handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor_preferredSecondaryDescriptor_alternatePrimaryDescriptor_alternateSecondaryDescriptor_scanOptions_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  void *v19;
  id v20;

  v20 = a2;
  v12 = a3;
  if (v12)
    SULogInfo(CFSTR("%s - doc scan for alternate descriptor failed with: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUScanner handleActiveScanTaskScanCompletionWithPreferredPrimaryDescriptor:preferredSecondaryDescriptor:alternatePrimaryDescriptor:alternateSecondaryDescriptor:scanOptions:error:]_block_invoke_3");
  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requestedBuild");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_handleDescriptor:forRequestedBuild:", v20, v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(_QWORD *)(v16 + 40);
  if (v17 | v15)
  {
    if (v17)
      v18 = 1;
    else
      v18 = v15 == 0;
    if (!v18)
    {
      *(_QWORD *)(v16 + 40) = v15;

      v15 = 0;
    }
    v19 = 0;
  }
  else
  {
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 105);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v15, *(_QWORD *)(a1 + 40), v19);

}

- (id)_handleDescriptor:(id)a3 forRequestedBuild:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v55;

  v5 = a3;
  v6 = a4;
  v14 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v5, "associatedSplatDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "overrideSplatComboBuildVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        SULogDebug(CFSTR("%s: Override the build version of the splat combo to %@"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");
      }
      else
      {
        objc_msgSend(v5, "associatedSplatDescriptor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "productBuildVersion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v35 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "productBuildVersion");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("(%@ + %@)"), v36, v17);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "isEqualToString:", v14))
      {
        SULogInfo(CFSTR("%s: Found a splombo update %@ and it matches the requested build version %@; keep it"),
          v38,
          v39,
          v40,
          v41,
          v42,
          v43,
          v44,
          (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");
      }
      else
      {
        objc_msgSend(v5, "productBuildVersion");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "isEqualToString:", v14);

        if (v46)
        {
          SULogInfo(CFSTR("%s: Found a splombo update %@ and only the normal update matches the requested build version %@; remove the associated splat"),
            v47,
            v48,
            v49,
            v50,
            v51,
            v52,
            v53,
            (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");
          objc_msgSend(v5, "setAssociatedSplatDescriptor:", 0);
        }
        else
        {
          SULogInfo(CFSTR("%s: Found a splombo update %@ but it doesn't match the requested build version %@; ignore it"),
            v47,
            v48,
            v49,
            v50,
            v51,
            v52,
            v53,
            (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");

          v5 = 0;
        }
      }

    }
    else
    {
      objc_msgSend(v5, "productBuildVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", v14);

      if ((v26 & 1) == 0)
      {
        objc_msgSend(v5, "productBuildVersion");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("%s: Found an update %@ but it doesn't match the requested build version %@; ignore it"),
          v27,
          v28,
          v29,
          v30,
          v31,
          v32,
          v33,
          (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");

        v5 = 0;
      }
    }
  }
  else
  {
    SULogDebug(CFSTR("%s: invalid parameters"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUScanner _handleDescriptor:forRequestedBuild:]");
  }

  return v5;
}

- (void)_handleScannedPreferredDescriptor:(id)a3 alternateDescriptor:(id)a4 scanOptions:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  void *v54;
  id v55;

  v55 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v55, "humanReadableUpdateName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "humanReadableUpdateName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("Scan found preferred descriptor {%@} and alternate descriptor {%@}\nwith error %@\nfor scan options %@"), v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);

  -[SUScanner activeScanTask](self, "activeScanTask");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "didScanForType:", 4);

  if (-[SUScanner isBuddyRunning](self, "isBuddyRunning"))
    v23 = 1;
  else
    v23 = objc_msgSend(v11, "clientIsBuddy");
  v24 = objc_msgSend(v11, "scanType");
  v25 = objc_msgSend(v12, "isUpToDate");
  if (v24 == 2)
  {
    if ((v25 & 1) != 0
      || (objc_msgSend(v12, "noMatchingUpdateFound") & 1) != 0
      || objc_msgSend(v11, "isSplatOnlyScan") && objc_msgSend(v12, "isCatalogNotFound"))
    {
      if (((v22 | v23) & 1) != 0)
      {
        objc_msgSend(v11, "setRequestedBuild:", 0);
        objc_msgSend(v11, "setRequestedPMV:", 0);
        objc_msgSend(v11, "clearTypes");
        objc_msgSend(v11, "setScanType:", 0);
        SULogInfo(CFSTR("%s - [DDM] Fall back to a scan for regular updates with options %@"), v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[SUScanner _handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:]");
      }
      else
      {
        objc_msgSend(v11, "setRequestedPMV:", 0);
        objc_msgSend(v11, "clearTypes");
        objc_msgSend(v11, "addType:", 4);
        SULogInfo(CFSTR("%s - [DDM] Fall back to a scan for Splat updates with options %@"), v47, v48, v49, v50, v51, v52, v53, (uint64_t)"-[SUScanner _handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:]");
      }
      goto LABEL_17;
    }
  }
  else if (v25
         && objc_msgSend(v11, "MDMShowRapidSecurityResponse")
         && (objc_msgSend(v11, "isPMVRequested") & 1) == 0
         && ((objc_msgSend(v11, "isEmergencyOnlyScan") | v22 | v23) & 1) == 0)
  {
    objc_msgSend(v11, "clearTypes");
    objc_msgSend(v11, "addType:", 4);
LABEL_17:
    SULogInfo(CFSTR("%s - will rescan for updates with options %@"), v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[SUScanner _handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:]");
    -[SUScanner _doScanForUpdates](self, "_doScanForUpdates");
    goto LABEL_18;
  }
  SULogInfo(CFSTR("%s - will not rescan for updates"), v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[SUScanner _handleScannedPreferredDescriptor:alternateDescriptor:scanOptions:error:]");
  -[SUScanner scanCompleted:alternateDescriptor:scanOptions:error:](self, "scanCompleted:alternateDescriptor:scanOptions:error:", v55, v10, v11, v12);
LABEL_18:

}

- (id)stringForScanPriority:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("Unknown");
  else
    return off_24CE3D3F8[a3];
}

- (BOOL)_coreDescriptorFailedPatching:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUScanner core](self, "core");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "failedPatchDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "count"))
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v51 = v7;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v53;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v53 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v4, "prerequisiteBuild");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v4, "associatedSplatDescriptor");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22 != 0;

            if (+[SUManagerEngine SUDescriptor:matchesSUCoreDescriptor:comparisonFlags:](SUManagerEngine, "SUDescriptor:matchesSUCoreDescriptor:comparisonFlags:", v20, v4, v23))
            {
              objc_msgSend(v20, "productBuildVersion");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              SULogInfo(CFSTR("%s: Found matching patch descriptor (%@), should fallback to full replacement"), v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[SUScanner _coreDescriptorFailedPatching:]");

              v39 = 1;
              goto LABEL_15;
            }
          }
          objc_msgSend(v20, "productBuildVersion");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "productBuildVersion");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          SULogInfo(CFSTR("%s: No match between failed patch descriptor (%@) and current descriptor (%@)"), v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[SUScanner _coreDescriptorFailedPatching:]");

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        if (v17)
          continue;
        break;
      }
    }

    objc_msgSend(v4, "productBuildVersion");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("%s: descriptor (%@) didn't previously fail patching"), v32, v33, v34, v35, v36, v37, v38, (uint64_t)"-[SUScanner _coreDescriptorFailedPatching:]");

    v39 = 0;
LABEL_15:
    v7 = v51;
  }
  else
  {
    SULogInfo(CFSTR("%s: No failed patch descriptors"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUScanner _coreDescriptorFailedPatching:]");
    v39 = 0;
  }

  return v39;
}

- (id)descriptorToAutoDownload:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  id v44;

  v4 = a3;
  if (!-[SUScanner isBuddyRunning](self, "isBuddyRunning"))
  {
    objc_msgSend(v4, "preferredDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternateDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScanner core](self, "core");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isDescriptorAutoDownloadable:", v13);

    if (v16)
    {
      if (!v14 && objc_msgSend(v13, "audienceType") == 1 && objc_msgSend(v13, "promoteAlternateUpdate"))
      {
        SULogInfo(CFSTR("%s - Null due to up-to-date with alternate"), v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
LABEL_15:
        v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
      -[SUScanner core](self, "core");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isDescriptorAutoUpdatable:", v13);

      if (v25)
      {
        SULogInfo(CFSTR("%s - Preferred update is auto updatable"), v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
LABEL_18:
        v44 = v13;
LABEL_21:
        v12 = v44;
        goto LABEL_22;
      }
    }
    -[SUScanner core](self, "core");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isDescriptorAutoDownloadable:", v14);

    if (v34)
    {
      -[SUScanner core](self, "core");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "isDescriptorAutoUpdatable:", v14);

      if (v43)
      {
        SULogInfo(CFSTR("%s - Alternate update is auto updatable"), v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
LABEL_20:
        v44 = v14;
        goto LABEL_21;
      }
      if ((v16 & 1) == 0)
      {
        SULogInfo(CFSTR("%s - Alternate update is auto downloadable"), v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
        goto LABEL_20;
      }
    }
    else if (!v16)
    {
      SULogInfo(CFSTR("%s - No update is auto downloadable"), v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
      goto LABEL_15;
    }
    SULogInfo(CFSTR("%s - Preferred update is auto downloadable"), v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
    goto LABEL_18;
  }
  SULogInfo(CFSTR("%s - Null due to Buddy running"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUScanner descriptorToAutoDownload:]");
  v12 = 0;
LABEL_23:

  return v12;
}

- (id)descriptorToAutoDownload
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  SUScanResults *v7;
  void *v8;

  -[SUScanner core](self, "core");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", self->_preferredLastScannedCoreDescriptor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", self->_alternateLastScannedCoreDescriptor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUScanResults initWithPreferredDescriptor:alternateDescriptor:]([SUScanResults alloc], "initWithPreferredDescriptor:alternateDescriptor:", v5, v6);
  -[SUScanner descriptorToAutoDownload:](self, "descriptorToAutoDownload:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isBuddyRunning
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void **v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v30;
  id v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "buddyInitiatedScan");

  if (v3)
  {
    SULogInfo(CFSTR("%s: Overriding result to YES by SUBuddyInitiatedScan"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUScanner isBuddyRunning]");
    return 1;
  }
  else
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v12 = (void **)getBYSetupAssistantBundleIdentifierSymbolLoc_ptr;
    v36 = getBYSetupAssistantBundleIdentifierSymbolLoc_ptr;
    if (!getBYSetupAssistantBundleIdentifierSymbolLoc_ptr)
    {
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke;
      v32[3] = &unk_24CE3D3C0;
      v32[4] = &v33;
      __getBYSetupAssistantBundleIdentifierSymbolLoc_block_invoke((uint64_t)v32);
      v12 = (void **)v34[3];
    }
    _Block_object_dispose(&v33, 8);
    if (!v12)
      -[SUScanner isBuddyRunning].cold.1();
    v13 = *v12;
    v14 = (void *)MEMORY[0x24BE80C78];
    v15 = (void *)MEMORY[0x24BE80CD8];
    v16 = v13;
    objc_msgSend(v15, "predicateMatchingBundleIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v14, "handleForPredicate:error:", v17, &v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v31;

    if (v19 || !v18)
    {
      SULogInfo(CFSTR("Setup Assistant process not found"), v20, v21, v22, v23, v24, v25, v26, v30);
      v11 = 0;
    }
    else
    {
      objc_msgSend(v18, "currentState");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v27, "taskState"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(&unk_24CE6E318, "containsObject:", v28);

    }
  }
  return v11;
}

- (SUManagerCore)core
{
  return (SUManagerCore *)objc_loadWeakRetained((id *)&self->_core);
}

- (void)setCore:(id)a3
{
  objc_storeWeak((id *)&self->_core, a3);
}

- (SUScanTask)activeScanTask
{
  return self->_activeScanTask;
}

- (void)setActiveScanTask:(id)a3
{
  objc_storeStrong((id *)&self->_activeScanTask, a3);
}

- (NSMutableArray)scanRequests
{
  return self->_scanRequests;
}

- (void)setScanRequests:(id)a3
{
  objc_storeStrong((id *)&self->_scanRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedUpdateTimer, 0);
  objc_storeStrong((id *)&self->_fullyUnrampedDateManager, 0);
  objc_storeStrong((id *)&self->_discoveryDateManager, 0);
  objc_storeStrong((id *)&self->_alternateLastScannedCoreDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredLastScannedCoreDescriptor, 0);
  objc_storeStrong((id *)&self->_lastScannedDescriptorScanOptions, 0);
  objc_storeStrong((id *)&self->_activeScanTask, 0);
  objc_storeStrong((id *)&self->_scanRequests, 0);
  objc_destroyWeak((id *)&self->_core);
}

- (void)isBuddyRunning
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getBYSetupAssistantBundleIdentifier(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SUScanner.m"), 45, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
