@implementation PowerUIAnalyticsManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__PowerUIAnalyticsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance;
}

void __41__PowerUIAnalyticsManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (PowerUIAnalyticsManager)init
{
  PowerUIAnalyticsManager *v2;
  os_log_t v3;
  OS_os_log *log;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *eventSubmissionQueue;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PowerUIAnalyticsManager;
  v2 = -[PowerUIAnalyticsManager init](&v11, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.powerui.smartcharging", "analyticsmanager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Log created", v10, 2u);
    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.poweruianalyticsmanager.eventsubmissionqueue", v6);
    eventSubmissionQueue = v2->_eventSubmissionQueue;
    v2->_eventSubmissionQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

+ (int)convertTimelineStringToOBCEvent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EligibleForIdle")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Plugin")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unplug")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FullyCharged")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Engaged")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TopOff")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("Interrupted")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Disabled")) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    v4 = 3;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TempDisabled")) & 1) == 0)
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("TemporarilyDisabled")))
        v4 = 3;
      else
        v4 = 0;
    }
  }

  return v4;
}

+ (int)obcModeOfOperationToBiomeModeOfOperation:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return 0;
  else
    return dword_215B39178[a3 - 1];
}

- (void)printExistingEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Charging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SmartCharging");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publisher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__PowerUIAnalyticsManager_printExistingEvents__block_invoke_2;
  v9[3] = &unk_24D3FB858;
  v9[4] = self;
  v8 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", &__block_literal_global_2, v9);

}

void __46__PowerUIAnalyticsManager_printExistingEvents__block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *log;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDBCE60];
    log = v3;
    v5 = a2;
    objc_msgSend(v5, "timestamp");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "batteryLevel");
    objc_msgSend(v5, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "targetSoC");
    objc_msgSend(v5, "eventBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predictedEndOfCharge");
    v13 = v12;
    objc_msgSend(v5, "eventBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mode");
    BMDeviceSmartChargingModeOfOperationAsString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "obcEvent");
    BMDeviceSmartChargingOBCEventAsString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v20 = v6;
    v21 = 1024;
    v22 = v8;
    v23 = 1024;
    v24 = v10;
    v25 = 2048;
    v26 = v13;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Event (%@): SoC: %d - TargetSoC: %d - PredictedEoC: %f - Mode: %@ - event: %@", buf, 0x36u);

  }
}

- (BOOL)submitEngagementEventWithBatteryLevel:(id)a3 targetSoC:(id)a4 predictedEndOfCharge:(id)a5 modeOfOperation:(int)a6 eventType:(int)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *log;
  _BOOL4 v16;
  NSObject *eventSubmissionQueue;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  PowerUIAnalyticsManager *v23;
  int v24;
  int v25;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  log = self->_log;
  v16 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (a7)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Queuing engagementEvent", buf, 2u);
    }
    eventSubmissionQueue = self->_eventSubmissionQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __122__PowerUIAnalyticsManager_submitEngagementEventWithBatteryLevel_targetSoC_predictedEndOfCharge_modeOfOperation_eventType___block_invoke;
    block[3] = &unk_24D3FB880;
    v20 = v12;
    v21 = v13;
    v24 = a6;
    v25 = a7;
    v22 = v14;
    v23 = self;
    dispatch_sync(eventSubmissionQueue, block);

  }
  else if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Unknown engagement event for AnalyticsManager, do not add to stream", buf, 2u);
  }

  return a7 != 0;
}

void __122__PowerUIAnalyticsManager_submitEngagementEventWithBatteryLevel_targetSoC_predictedEndOfCharge_modeOfOperation_eventType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  int v17;
  uint64_t v18;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)os_transaction_create();
  v3 = objc_alloc(MEMORY[0x24BE0C380]);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithBatteryLevel:targetSoC:predictedEndOfCharge:mode:obcEvent:", v4, v5, v7, *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68));

  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Charging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "SmartCharging");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendEvent:", v8);

  v14 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = objc_msgSend(v8, "batteryLevel");
    v17 = objc_msgSend(v8, "targetSoC");
    objc_msgSend(v8, "predictedEndOfCharge");
    v19[0] = 67110144;
    v19[1] = v16;
    v20 = 1024;
    v21 = v17;
    v22 = 2048;
    v23 = v18;
    v24 = 1024;
    v25 = objc_msgSend(v8, "mode");
    v26 = 1024;
    v27 = objc_msgSend(v8, "obcEvent");
    _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEFAULT, "Sent engagementEvent Event: SoC: %d - TargetSoC: %d - PredictedEoC: %f - Mode: %d - event: %d", (uint8_t *)v19, 0x24u);

  }
}

- (BOOL)submitGaugingEventWithUpdateType:(int)a3 qmaxState:(int)a4 daysSinceQMax:(id)a5 ocvState:(int)a6 daysSinceOCV:(id)a7 fullChargeState:(int)a8 daysSinceFullChargeAttempt:(id)a9
{
  id v15;
  id v16;
  id v17;
  NSObject *log;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *eventSubmissionQueue;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  PowerUIAnalyticsManager *v32;
  int v33;
  int v34;
  int v35;
  int v36;
  uint8_t buf[16];

  v15 = a5;
  v16 = a7;
  v17 = a9;
  log = self->_log;
  if (a3)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[PowerUIAnalyticsManager submitGaugingEventWithUpdateType:qmaxState:daysSinceQMax:ocvState:daysSinceOCV:fullChargeState:daysSinceFullChargeAttempt:].cold.1(log, v19, v20, v21, v22, v23, v24, v25);
    eventSubmissionQueue = self->_eventSubmissionQueue;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __149__PowerUIAnalyticsManager_submitGaugingEventWithUpdateType_qmaxState_daysSinceQMax_ocvState_daysSinceOCV_fullChargeState_daysSinceFullChargeAttempt___block_invoke;
    v28[3] = &unk_24D3FB8A8;
    v33 = a3;
    v34 = a4;
    v29 = v15;
    v35 = a6;
    v30 = v16;
    v36 = a8;
    v31 = v17;
    v32 = self;
    dispatch_async(eventSubmissionQueue, v28);

  }
  else if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Unknown gauging event for AnalyticsManager, do not add to stream", buf, 2u);
  }

  return a3 != 0;
}

void __149__PowerUIAnalyticsManager_submitGaugingEventWithUpdateType_qmaxState_daysSinceQMax_ocvState_daysSinceOCV_fullChargeState_daysSinceFullChargeAttempt___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C320]), "initWithUpdateType:qmaxState:daysSinceQMax:ocvState:daysSinceOCV:fullChargeState:daysSinceFullChargeAttempt:", *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 76), *(_QWORD *)(a1 + 48));
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Charging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "BatteryGauging");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:", v2);

  v8 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = objc_msgSend(v2, "updateType");
    objc_msgSend(v2, "qmaxState");
    BMDeviceBatteryGaugingQMaxStateAsString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v2, "daysSinceQMax");
    objc_msgSend(v2, "ocvState");
    BMDeviceBatteryGaugingOCVStateAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v2, "daysSinceOCV");
    objc_msgSend(v2, "fullChargeState");
    BMDeviceBatteryGaugingPeriodicFullChargeStateAsString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110658;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 1024;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 1024;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    v28 = 1024;
    v29 = objc_msgSend(v2, "daysSinceFullChargeAttempt");
    _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "Sent gauging Event: Type: %d - qmaxState: %@ - daysSinceQMax: %d - ocvState: %@ - daysSinceOCV: %d - fullChargeState: %@ - daysSinceFullChargeAttempt: %d", buf, 0x38u);

  }
}

- (id)stringFromEngagementEvent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;

  v18 = (void *)MEMORY[0x24BDD17C8];
  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v4, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "batteryLevel");
  objc_msgSend(v4, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "targetSoC");
  objc_msgSend(v4, "eventBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictedEndOfCharge");
  v12 = v11;
  objc_msgSend(v4, "eventBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "mode");
  objc_msgSend(v4, "eventBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: SoC: %d - TargetSoC: %d - PredictedEoC: %f - Mode: %d - event: %d"), v5, v7, v9, v12, v14, objc_msgSend(v15, "obcEvent"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)chargingStatisticsForSessionBetween:(id)a3 and:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  _QWORD v30[18];
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  __CFString *v62;
  _QWORD v63[4];
  _QWORD v64[3];
  int v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[5];
  id v73;
  _QWORD v74[5];
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[8];
  _QWORD v85[10];

  v85[8] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = __Block_byref_object_copy__0;
  v82[4] = __Block_byref_object_dispose__0;
  v83 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__0;
  v80 = __Block_byref_object_dispose__0;
  v81 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__0;
  v74[4] = __Block_byref_object_dispose__0;
  v75 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__0;
  v72[4] = __Block_byref_object_dispose__0;
  v73 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__0;
  v70 = __Block_byref_object_dispose__0;
  v71 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v65 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v63[3] = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__0;
  v61 = __Block_byref_object_dispose__0;
  v62 = &stru_24D3FD658;
  v53 = 0;
  v54 = (double *)&v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x2020000000;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 8);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 8;
  do
  {
    objc_msgSend((id)v44[5], "addObject:", &unk_24D443558);
    --v8;
  }
  while (v8);
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Charging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "SmartCharging");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publisher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke;
  v32[3] = &unk_24D3FB8D0;
  v28 = v6;
  v33 = v28;
  v15 = v7;
  v34 = v15;
  objc_msgSend(v13, "filterWithIsIncluded:", v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v14;
  v31[1] = 3221225472;
  v31[2] = __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_2;
  v31[3] = &unk_24D3FB6F8;
  v31[4] = self;
  v30[0] = v14;
  v30[1] = 3221225472;
  v30[2] = __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53;
  v30[3] = &unk_24D3FB8F8;
  v30[4] = self;
  v30[5] = v82;
  v30[6] = &v57;
  v30[7] = v74;
  v30[8] = v72;
  v30[9] = &v43;
  v30[10] = v64;
  v30[11] = &v35;
  v30[12] = v63;
  v30[13] = &v76;
  v30[14] = &v66;
  v30[15] = &v53;
  v30[16] = &v49;
  v30[17] = &v39;
  v17 = (id)objc_msgSend(v16, "sinkWithCompletion:receiveInput:", v31, v30);

  v84[0] = CFSTR("pluginTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v54[3]);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v77[5])
    v20 = &unk_24D443570;
  else
    v20 = &unk_24D443558;
  v85[0] = v18;
  v85[1] = v20;
  v84[1] = CFSTR("wasOBCEligible");
  v84[2] = CFSTR("eligibleIdleTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v50[3], v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v44[5];
  v85[2] = v21;
  v85[3] = v22;
  v84[3] = CFSTR("idleTimes");
  v84[4] = CFSTR("reachedTargetSoC");
  if (v67[5])
    v23 = &unk_24D443570;
  else
    v23 = &unk_24D443558;
  v85[4] = v23;
  v84[5] = CFSTR("wasUndercharged");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v40 + 24));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v24;
  v84[6] = CFSTR("wasTempDisabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v36 + 24));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v85[6] = v25;
  v84[7] = CFSTR("sessionDescription");
  v85[7] = v58[5];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v64, 8);
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v74, 8);

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(v82, 8);

  return v26;
}

BOOL __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;

  v3 = a2;
  objc_msgSend(v3, "timestamp");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  if (v5 >= v6)
  {
    objc_msgSend(v3, "timestamp");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
    v7 = v9 <= v10;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_2_cold_1(v3);

  }
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  void *v118;
  NSObject *v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  void *v129;
  double v130;
  double v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  double v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  NSObject *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  void *v163;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    || (objc_msgSend(v3, "eventBody"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "obcEvent"),
        v5,
        v6 == 6))
  {
    objc_msgSend(v4, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "obcEvent");

    switch(v8)
    {
      case 0:
        v10 = *(void **)(a1 + 32);
        v9 = (id *)(a1 + 32);
        objc_msgSend(v10, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53_cold_1(v9, (uint64_t)v4);

        break;
      case 1:
        v12 = (void *)MEMORY[0x24BDD17C8];
        v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v14 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ Device was restarted at %@."), v13, v16);
        goto LABEL_50;
      case 2:
        v17 = (void *)MEMORY[0x24BDD17C8];
        v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v19 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ PowerUI restarted at %@."), v18, v16);
        goto LABEL_50;
      case 3:
        v20 = (void *)MEMORY[0x24BDD17C8];
        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v22 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ OBC was temp disabled at %@."), v21, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          v28 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v4, "timestamp");
          objc_msgSend(v28, "dateWithTimeIntervalSinceReferenceDate:");
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v31 = *(void **)(v30 + 40);
          *(_QWORD *)(v30 + 40) = v29;

          v32 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v35 = v34;
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
          objc_msgSend(v32, "numberWithDouble:", v35 + v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:atIndexedSubscript:", v37, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));

        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
        goto LABEL_54;
      case 4:
        v38 = (void *)MEMORY[0x24BDD17C8];
        v39 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v40 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v40, "dateWithTimeIntervalSinceReferenceDate:");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringWithFormat:", CFSTR("%@ OBC was feature disabled at %@."), v39, v42);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v45 = *(void **)(v44 + 40);
        *(_QWORD *)(v44 + 40) = v43;

        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
          goto LABEL_54;
        v46 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v46, "dateWithTimeIntervalSinceReferenceDate:");
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v49 = *(void **)(v48 + 40);
        *(_QWORD *)(v48 + 40) = v47;

        v50 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "doubleValue");
        v53 = v52;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        objc_msgSend(v50, "numberWithDouble:", v53 + v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:atIndexedSubscript:", v55, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));

        goto LABEL_24;
      case 6:
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        {
          objc_msgSend(*(id *)(a1 + 32), "log");
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53_cold_2((id *)(a1 + 32), (uint64_t)v4);

        }
        v57 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v57, "dateWithTimeIntervalSinceReferenceDate:");
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v60 = *(void **)(v59 + 40);
        *(_QWORD *)(v59 + 40) = v58;

        v61 = (void *)MEMORY[0x24BDD17C8];
        v62 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "stringWithFormat:", CFSTR("%@ Device was plugged in at %@."), v62, v63);
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v66 = *(void **)(v65 + 40);
        *(_QWORD *)(v65 + 40) = v64;

        break;
      case 7:
        objc_msgSend(v4, "eventBody");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "batteryLevel");

        if (v68 == 80)
        {
          +[PowerUISmartChargeUtilities cachedHistorical80ToFullDuration](PowerUISmartChargeUtilities, "cachedHistorical80ToFullDuration");
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v69;
        }
        else
        {
          objc_msgSend(v4, "eventBody");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:withMinimumPluginDuration:](PowerUISmartChargeUtilities, "historicalFullChargeDurationStartingAt:withMinimumPluginDuration:", objc_msgSend(v141, "batteryLevel"), 300);
          v142 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v142, "count") >= 3)
          {
            objc_msgSend(v142, "sortedArrayUsingSelector:", sel_compare_);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "subarrayWithRange:", 1, objc_msgSend(v143, "count") - 2);
            v144 = objc_claimAutoreleasedReturnValue();

            v142 = (void *)v144;
          }
          objc_msgSend(v142, "percentile:", 0.9);
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v145 / 60.0;

        }
        v146 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v146, "dateWithTimeIntervalSinceReferenceDate:");
        v147 = objc_claimAutoreleasedReturnValue();
        v148 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
        v149 = *(void **)(v148 + 40);
        *(_QWORD *)(v148 + 40) = v147;

        v150 = (void *)MEMORY[0x24BDD17C8];
        v151 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v152 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v152, "dateWithTimeIntervalSinceReferenceDate:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "stringWithFormat:", CFSTR("%@ Device became OBC eligible at %@."), v151, v16);
        goto LABEL_50;
      case 8:
        v70 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v70, "dateWithTimeIntervalSinceReferenceDate:");
        v71 = objc_claimAutoreleasedReturnValue();
        v72 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v73 = *(void **)(v72 + 40);
        *(_QWORD *)(v72 + 40) = v71;

        objc_msgSend(v4, "eventBody");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v74, "mode");

        v75 = (void *)MEMORY[0x24BDD17C8];
        v76 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v77 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v77, "dateWithTimeIntervalSinceReferenceDate:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "stringWithFormat:", CFSTR("%@ PowerUI started controlling charging at %@."), v76, v16);
        goto LABEL_50;
      case 9:
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          v78 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v4, "timestamp");
          objc_msgSend(v78, "dateWithTimeIntervalSinceReferenceDate:");
          v79 = objc_claimAutoreleasedReturnValue();
          v80 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v81 = *(void **)(v80 + 40);
          *(_QWORD *)(v80 + 40) = v79;

          v82 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "doubleValue");
          v85 = v84;
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
          objc_msgSend(v82, "numberWithDouble:", v85 + v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:atIndexedSubscript:", v87, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));

          v88 = (void *)MEMORY[0x24BDD17C8];
          v89 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "stringWithFormat:", CFSTR("%@ PowerUI stopped controlling charging at %@."), v89, v51);
          v90 = objc_claimAutoreleasedReturnValue();
          v91 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v92 = *(void **)(v91 + 40);
          *(_QWORD *)(v91 + 40) = v90;

LABEL_24:
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "log");
          v156 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v156, OS_LOG_TYPE_FAULT))
            __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53_cold_3(v156);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ Error: Found charging pause end, but not charging pause start."), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
          v157 = objc_claimAutoreleasedReturnValue();
          v158 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v159 = *(void **)(v158 + 40);
          *(_QWORD *)(v158 + 40) = v157;

        }
LABEL_54:
        v160 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v161 = *(void **)(v160 + 40);
        *(_QWORD *)(v160 + 40) = 0;

        v162 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v163 = *(void **)(v162 + 40);
        *(_QWORD *)(v162 + 40) = 0;

        break;
      case 10:
        v93 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v93, "dateWithTimeIntervalSinceReferenceDate:");
        v94 = objc_claimAutoreleasedReturnValue();
        v95 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
        v96 = *(void **)(v95 + 40);
        *(_QWORD *)(v95 + 40) = v94;

        v97 = (void *)MEMORY[0x24BDD17C8];
        v98 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v99 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v99, "dateWithTimeIntervalSinceReferenceDate:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "stringWithFormat:", CFSTR("%@ Device reached target SoC at %@."), v98, v16);
        goto LABEL_50;
      case 11:
        v100 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
        v101 = *(void **)(v100 + 40);
        *(_QWORD *)(v100 + 40) = 0;

        v102 = (void *)MEMORY[0x24BDD17C8];
        v103 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v104 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v104, "dateWithTimeIntervalSinceReferenceDate:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "stringWithFormat:", CFSTR("%@ Device lost target SoC at %@."), v103, v16);
        goto LABEL_50;
      case 12:
        objc_msgSend(v4, "timestamp");
        v106 = v105;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timeIntervalSinceReferenceDate");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = v106 - v107;
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
        {
          objc_msgSend(v4, "timestamp");
          v109 = v108;
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "timeIntervalSinceReferenceDate");
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = (v109 - v110) / 60.0;
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = fmax(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128)+ 8)+ 24)- *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96)+ 8)+ 24), 0.0);
        }
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
          {
            v111 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "doubleValue");
            v114 = v113;
            objc_msgSend(v4, "timestamp");
            v116 = v115;
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "timeIntervalSinceReferenceDate");
            objc_msgSend(v111, "numberWithDouble:", v114 + v116 - v117);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setObject:atIndexedSubscript:", v118, *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));

            if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
            {
              objc_msgSend(*(id *)(a1 + 32), "log");
              v119 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
                __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53_cold_5(a1 + 56, v4, v119);

            }
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "log");
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
          __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53_cold_4(v120, v121, v122, v123, v124, v125, v126, v127);

        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
        {
          v128 = 0;
          do
          {
            if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectAtIndexedSubscript:", v128);
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "doubleValue");
              v131 = v130;

              if (v131 > 0.0)
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = 1;
            }
            ++v128;
          }
          while (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count") > v128);
        }
        v132 = (void *)MEMORY[0x24BDD17C8];
        v133 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v134 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v134, "dateWithTimeIntervalSinceReferenceDate:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "stringWithFormat:", CFSTR("%@ Device was plugged out at %@."), v133, v16);
        goto LABEL_50;
      case 13:
        v135 = (void *)MEMORY[0x24BDD17C8];
        v136 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v137 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v137, "dateWithTimeIntervalSinceReferenceDate:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "stringWithFormat:", CFSTR("%@ SMC charge token was created at %@."), v136, v16);
        goto LABEL_50;
      case 14:
        v138 = (void *)MEMORY[0x24BDD17C8];
        v139 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v140 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v4, "timestamp");
        objc_msgSend(v140, "dateWithTimeIntervalSinceReferenceDate:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "stringWithFormat:", CFSTR("%@ SMC charge token was dismissed at %@."), v139, v16);
LABEL_50:
        v153 = objc_claimAutoreleasedReturnValue();
        v154 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v155 = *(void **)(v154 + 40);
        *(_QWORD *)(v154 + 40) = v153;

        break;
      default:
        break;
    }
  }

}

- (id)chargingStatisticsSince:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUIAnalyticsManager chargingStatisticsFrom:to:](self, "chargingStatisticsFrom:to:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)chargingStatisticsFrom:(id)a3 to:(id)a4
{
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t i;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  unint64_t v30;
  char v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[17];
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  double *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[5];
  id v92;
  _QWORD v93[5];
  id v94;

  v44 = a3;
  v43 = a4;
  v6 = (void *)os_transaction_create();
  v93[0] = 0;
  v93[1] = v93;
  v93[2] = 0x3032000000;
  v93[3] = __Block_byref_object_copy__0;
  v93[4] = __Block_byref_object_dispose__0;
  v94 = 0;
  v91[0] = 0;
  v91[1] = v91;
  v91[2] = 0x3032000000;
  v91[3] = __Block_byref_object_copy__0;
  v91[4] = __Block_byref_object_dispose__0;
  v92 = 0;
  v87 = 0;
  v88 = (double *)&v87;
  v89 = 0x2020000000;
  v90 = 0;
  v83 = 0;
  v84 = (double *)&v83;
  v85 = 0x2020000000;
  v86 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 8);
  v58 = (id)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 8);
  v52 = (id)objc_claimAutoreleasedReturnValue();
  v7 = 8;
  do
  {
    objc_msgSend((id)v54[5], "addObject:", &unk_24D443558);
    objc_msgSend((id)v48[5], "addObject:", &unk_24D443558);
    --v7;
  }
  while (v7);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v44, v43, 0, 0, 0);
  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Charging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "SmartCharging");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publisherWithOptions:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __53__PowerUIAnalyticsManager_chargingStatisticsFrom_to___block_invoke;
  v46[3] = &unk_24D3FB6F8;
  v46[4] = self;
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __53__PowerUIAnalyticsManager_chargingStatisticsFrom_to___block_invoke_89;
  v45[3] = &unk_24D3FB920;
  v45[4] = self;
  v45[5] = v93;
  v45[6] = v91;
  v45[7] = &v79;
  v45[8] = &v87;
  v45[9] = &v67;
  v45[10] = &v75;
  v45[11] = &v71;
  v45[12] = &v83;
  v45[13] = &v53;
  v45[14] = &v47;
  v45[15] = &v59;
  v45[16] = &v63;
  v14 = (id)objc_msgSend(v13, "sinkWithCompletion:receiveInput:", v46, v45);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v80 + 6));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("numberChargeSessions"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v76 + 6));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("numberChargeSessionsWithEligibleTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v68 + 6));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("numberChargeSessionsReachingTargetSoC"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v72 + 6));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("numberUnderCharges"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v88[3] / 3600.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("totalTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v84[3] / 60.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("totalEligible"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v60 + 6));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("totalFullDisableEvents"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v64 + 6));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("totalTempDisableEvents"));

  for (i = 0; objc_msgSend((id)v54[5], "count") > i; ++i)
  {
    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)v54[5], "objectAtIndexedSubscript:", i);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    objc_msgSend(v25, "numberWithDouble:", v27 / 3600.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    BMDeviceSmartChargingModeOfOperationAsString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, v29);

  }
  v42 = (void *)v8;
  v30 = 0;
  v31 = 0;
  while (objc_msgSend((id)v48[5], "count") > v30)
  {
    if (v30)
    {
      objc_msgSend((id)v48[5], "objectAtIndexedSubscript:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (int)objc_msgSend(v32, "intValue") > 0;

    }
    else
    {
      v33 = 0;
    }
    v34 = (void *)MEMORY[0x24BDD17C8];
    BMDeviceSmartChargingModeOfOperationAsString();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("%@%@"), v35, CFSTR("Count"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)v48[5], "objectAtIndexedSubscript:", v30);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "numberWithInt:", objc_msgSend(v38, "intValue"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v39, v36);
    v31 |= v33;

    ++v30;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31 & 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v40, CFSTR("sawEngagement"));

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(v91, 8);

  _Block_object_dispose(v93, 8);
  return v15;
}

void __53__PowerUIAnalyticsManager_chargingStatisticsFrom_to___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_2_cold_1(v3);

  }
}

void __53__PowerUIAnalyticsManager_chargingStatisticsFrom_to___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  unint64_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  int v49;
  int v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "obcEvent");

  if (v5 == 6)
  {
    v6 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "timestamp");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
      || (objc_msgSend(v3, "eventBody"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "obcEvent"),
          v10,
          v11 != 12))
    {
      objc_msgSend(v3, "eventBody");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "obcEvent");

      if (v46 == 4)
      {
        v47 = *(_QWORD *)(a1 + 120);
      }
      else
      {
        objc_msgSend(v3, "eventBody");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "obcEvent");

        if (v49 != 3)
          goto LABEL_25;
        v47 = *(_QWORD *)(a1 + 128);
      }
      ++*(_DWORD *)(*(_QWORD *)(v47 + 8) + 24);
      goto LABEL_25;
    }
    v12 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "timestamp");
    objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(*(id *)(a1 + 32), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v50 = 138412546;
      v51 = v17;
      v52 = 2112;
      v53 = v18;
      _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_INFO, "Found plugin between %@ and %@:", (uint8_t *)&v50, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "chargingStatisticsForSessionBetween:and:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v50 = 138412290;
      v51 = v19;
      _os_log_impl(&dword_215A71000, v20, OS_LOG_TYPE_INFO, "Session: %@", (uint8_t *)&v50, 0xCu);
    }

    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pluginTime"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24)
                                                                + (double)(int)objc_msgSend(v21, "intValue");

    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("reachedTargetSoC"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    if (v23)
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("eligibleIdleTime"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "intValue");

    if (v25 >= 1)
    {
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("wasUndercharged"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "BOOLValue");

      if (v27)
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                            + 24)
                                                                + (double)v25;
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("idleTimes"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
    {
      v29 = 0;
      do
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValue");
        v32 = v31;

        if (v32 > 0.0)
        {
          v33 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "objectAtIndexedSubscript:", v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "doubleValue");
          v36 = v35;
          objc_msgSend(v28, "objectAtIndexedSubscript:", v29);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "doubleValue");
          objc_msgSend(v33, "numberWithDouble:", v36 + v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "setObject:atIndexedSubscript:", v39, v29);

          v40 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "objectAtIndexedSubscript:", v29);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "numberWithInt:", objc_msgSend(v41, "intValue") + 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setObject:atIndexedSubscript:", v42, v29);

        }
        ++v29;
      }
      while (objc_msgSend(v28, "count") > v29);
    }
    v43 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v44 = *(void **)(v43 + 40);
    *(_QWORD *)(v43 + 40) = 0;

  }
LABEL_25:

}

- (id)gaugingMitigationStatisticsSince:(id)a3
{
  id v3;
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
  id v15;
  void *v16;
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
  void *v28;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[17];
  _QWORD v35[5];
  _QWORD v36[5];
  id v37;
  _QWORD v38[3];
  char v39;
  _QWORD v40[3];
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  int v81;

  v30 = a3;
  v28 = (void *)os_transaction_create();
  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__0;
  v36[4] = __Block_byref_object_dispose__0;
  v37 = 0;
  v3 = objc_alloc(MEMORY[0x24BE0CC98]);
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v30, v4, 0, 0, 0);

  BiomeLibrary();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "Device");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "Charging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SmartCharging");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publisherWithOptions:", v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Charging");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "BatteryGauging");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "publisherWithOptions:", v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedMergeWithOther:comparator:", v12, &__block_literal_global_115);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filterWithIsIncluded:", &__block_literal_global_116);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_3;
  v35[3] = &unk_24D3FB6F8;
  v35[4] = self;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_117;
  v34[3] = &unk_24D3FB9A8;
  v34[4] = v40;
  v34[5] = v36;
  v34[6] = &v74;
  v34[7] = &v70;
  v34[8] = &v66;
  v34[9] = &v62;
  v34[10] = &v58;
  v34[11] = v38;
  v34[12] = &v42;
  v34[13] = &v78;
  v34[14] = &v54;
  v34[15] = &v50;
  v34[16] = &v46;
  v15 = (id)objc_msgSend(v14, "sinkWithCompletion:receiveInput:", v35, v34);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v79 + 6));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("nrOfDOD0AtQualifiedQmaxUpdates"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v75 + 6));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("nrOfQMaxTooOld"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v71 + 6));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("nrOfDOD0TooSmall"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v67 + 6));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("nrOfQMaxRequested"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v63 + 6));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("nrOfOCVRequested"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v59 + 6));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("nrOfPeriodicFullChargeRequested"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v55 + 6));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("maxDaysSinceQmax"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v51 + 6));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, CFSTR("maxDaysSinceOCV"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v47 + 6));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("maxDaysSinceLastFullCharge"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v43 + 6));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("nrOfSessionsReachingFullCharge"));

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  return v16;
}

uint64_t __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

BOOL __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "obcEvent") == 6)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v2, "eventBody");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "obcEvent") == 12;

    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

void __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_3_cold_1(v3);

  }
}

void __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_117(_QWORD *a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  int v7;
  char v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;

  v38 = a2;
  objc_msgSend(v38, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v38, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = objc_msgSend(v5, "obcEvent");

    if (v7 == 6)
    {
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
      goto LABEL_37;
    }
    objc_msgSend(v38, "eventBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "obcEvent");

    if (v13 != 12)
      goto LABEL_37;
    if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) || (v14 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40)) == 0)
    {
LABEL_36:
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
      *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24) = 0;
      v36 = *(_QWORD *)(a1[5] + 8);
      v37 = *(void **)(v36 + 40);
      *(_QWORD *)(v36 + 40) = 0;

      goto LABEL_37;
    }
    v15 = objc_msgSend(v14, "qmaxState");
    switch(v15)
    {
      case 4:
        v16 = a1[8];
        break;
      case 3:
        v16 = a1[7];
        break;
      case 2:
        v16 = a1[6];
        break;
      default:
LABEL_30:
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "ocvState") == 2)
          ++*(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "fullChargeState") == 2)
          ++*(_DWORD *)(*(_QWORD *)(a1[10] + 8) + 24);
        if (*(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24))
          ++*(_DWORD *)(*(_QWORD *)(a1[12] + 8) + 24);
        goto LABEL_36;
    }
    ++*(_DWORD *)(*(_QWORD *)(v16 + 8) + 24);
    goto LABEL_30;
  }
  objc_opt_class();
  v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) != 0)
  {
    v9 = v38;
    objc_msgSend(v9, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "updateType");

    if (v11 == 2)
    {
      ++*(_DWORD *)(*(_QWORD *)(a1[13] + 8) + 24);
    }
    else if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
    {
      objc_msgSend(v9, "eventBody");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "updateType");

      if (v18 == 3)
      {
        *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24) = 1;
      }
      else
      {
        objc_msgSend(v9, "eventBody");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "updateType");

        if (v20 == 1)
        {
          if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
          {
            objc_msgSend(v9, "eventBody");
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = *(_QWORD *)(a1[5] + 8);
            v23 = *(void **)(v22 + 40);
            *(_QWORD *)(v22 + 40) = v21;

          }
          objc_msgSend(v9, "eventBody");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "daysSinceQMax");
          v26 = *(_DWORD *)(*(_QWORD *)(a1[14] + 8) + 24);

          if (v25 > v26)
          {
            objc_msgSend(v9, "eventBody");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)(*(_QWORD *)(a1[14] + 8) + 24) = objc_msgSend(v27, "daysSinceQMax");

          }
          objc_msgSend(v9, "eventBody");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "daysSinceOCV");
          v30 = *(_DWORD *)(*(_QWORD *)(a1[15] + 8) + 24);

          if (v29 > v30)
          {
            objc_msgSend(v9, "eventBody");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)(*(_QWORD *)(a1[15] + 8) + 24) = objc_msgSend(v31, "daysSinceOCV");

          }
          objc_msgSend(v9, "eventBody");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "daysSinceFullChargeAttempt");
          v34 = *(_DWORD *)(*(_QWORD *)(a1[16] + 8) + 24);

          if (v33 > v34)
          {
            objc_msgSend(v9, "eventBody");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)(*(_QWORD *)(a1[16] + 8) + 24) = objc_msgSend(v35, "daysSinceFullChargeAttempt");

          }
        }
      }
    }

  }
LABEL_37:

}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)eventSubmissionQueue
{
  return self->_eventSubmissionQueue;
}

- (void)setEventSubmissionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventSubmissionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSubmissionQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)submitGaugingEventWithUpdateType:(uint64_t)a3 qmaxState:(uint64_t)a4 daysSinceQMax:(uint64_t)a5 ocvState:(uint64_t)a6 daysSinceOCV:(uint64_t)a7 fullChargeState:(uint64_t)a8 daysSinceFullChargeAttempt:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_215A71000, a1, a3, "Queuing gauging event", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6_0();
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_5_0(v3, v4);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v5, v6, "Error getting chargingExperience biome events in chargingStatisticsSince: %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53_cold_1(id *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a1, "stringFromEngagementEvent:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v3, v4, "Charging event with unknown state: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_0();
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53_cold_2(id *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a1, "stringFromEngagementEvent:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v3, v4, "Second plugin event without unplug: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4_0();
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53_cold_3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_215A71000, log, OS_LOG_TYPE_FAULT, "Found charging pause end, but not charging pause start", v1, 2u);
  OUTLINED_FUNCTION_6_0();
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_215A71000, a1, a3, "Check undercharges", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6_0();
}

void __67__PowerUIAnalyticsManager_chargingStatisticsForSessionBetween_and___block_invoke_53_cold_5(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities timeStringFromDate:](PowerUISmartChargeUtilities, "timeStringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v5;
  v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_215A71000, a3, OS_LOG_TYPE_ERROR, "Unaccounted OBC engagement time from %@ to %@", (uint8_t *)&v9, 0x16u);

}

void __60__PowerUIAnalyticsManager_gaugingMitigationStatisticsSince___block_invoke_3_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_5_0(v3, v4);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v5, v6, "Error getting gauging mitigation events in analytics manager: %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

@end
