@implementation SUScanTask

- (SUScanTask)initWithOptions:(id)a3
{
  id v5;
  SUScanTask *v6;
  SUScanTask *v7;
  SUCoreScan *coreScanner;
  SUCorePolicy *suScanPolicy;
  uint64_t v10;
  NSString *sessionID;
  dispatch_queue_t v12;
  OS_dispatch_queue *scanQueue;
  NSMutableSet *v14;
  NSMutableSet *types;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUScanTask;
  v6 = -[SUScanTask init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_scanPriority = -[SUScanTask _scanPriorityForOptions:](v6, "_scanPriorityForOptions:", v5);
    objc_storeStrong((id *)&v7->_scanOptions, a3);
    coreScanner = v7->_coreScanner;
    v7->_coreScanner = 0;

    suScanPolicy = v7->_suScanPolicy;
    v7->_suScanPolicy = 0;

    objc_msgSend(v5, "sessionID");
    v10 = objc_claimAutoreleasedReturnValue();
    sessionID = v7->_sessionID;
    v7->_sessionID = (NSString *)v10;

    v7->_cancelRequested = 0;
    v12 = dispatch_queue_create("com.apple.softwareupdateservices.SUScanTaskQueue", 0);
    scanQueue = v7->_scanQueue;
    v7->_scanQueue = (OS_dispatch_queue *)v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    types = v7->_types;
    v7->_types = v14;

  }
  return v7;
}

- (void)scanForSUAssetWithCompletion:(id)a3
{
  id v4;
  NSObject *scanQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  scanQueue = self->_scanQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__SUScanTask_scanForSUAssetWithCompletion___block_invoke;
  v7[3] = &unk_24CE3B688;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(scanQueue, v7);

}

void __43__SUScanTask_scanForSUAssetWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 48))
    SULogInfo(CFSTR("cancel requested so not performing scanForSUAssetWithCompletion and not triggering completion"), a2, a3, a4, a5, a6, a7, a8, a9);
  else
    objc_msgSend(*(id *)(a1 + 32), "_queue_scanForUpdates:sessionID:completion:", *(_QWORD *)(v9 + 16), *(_QWORD *)(v9 + 40), *(_QWORD *)(a1 + 40));
}

- (void)scanForDocumentationAssetWithDescriptor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *scanQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  scanQueue = self->_scanQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__SUScanTask_scanForDocumentationAssetWithDescriptor_completion___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(scanQueue, block);

}

void __65__SUScanTask_scanForDocumentationAssetWithDescriptor_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 48))
    SULogInfo(CFSTR("cancel requested so not performing scanForDocumentationAssetWithDescriptor and not triggering completion"), a2, a3, a4, a5, a6, a7, a8, a9);
  else
    objc_msgSend(*(id *)(a1 + 32), "_queue_CollectDocumentation:sessionID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(v9 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)cancelTask
{
  SUScanTask *v2;
  NSObject *scanQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_scanQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  scanQueue = v2->_scanQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __24__SUScanTask_cancelTask__block_invoke;
  v5[3] = &unk_24CE3B700;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(scanQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __24__SUScanTask_cancelTask__block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_semaphore_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  dispatch_semaphore_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 48) = 1;
    v3 = dispatch_semaphore_create(0);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __24__SUScanTask_cancelTask__block_invoke_2;
    v7[3] = &unk_24CE3B6D8;
    v8 = v3;
    v9 = v4;
    v6 = v3;
    objc_msgSend(v5, "cancelCurrentScan:", v7);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  }
}

intptr_t __24__SUScanTask_cancelTask__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (a2)
  {
    SULogInfo(CFSTR("active scan canceled with error:%@"), a2, a3, a4, a5, a6, a7, a8, a2);
  }
  else
  {
    SULogInfo(CFSTR("active scan canceled successfully"), 0, a3, a4, a5, a6, a7, a8, v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int64_t)_scanPriorityForOptions:(id)a3
{
  id v3;
  int v4;
  int v5;
  int64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "isSplatOnlyScan");
  v5 = objc_msgSend(v3, "isForced");
  if (v4)
  {
    if (v5)
      v6 = 3;
    else
      v6 = 1;
  }
  else
  {
    if (v5)
      v7 = 4;
    else
      v7 = 2;
    objc_msgSend(v3, "requestedPMV");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v6 = 5;
    else
      v6 = v7;
  }

  return v6;
}

- (int64_t)scanPriority
{
  NSObject *scanQueue;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_scanQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  scanQueue = self->_scanQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __26__SUScanTask_scanPriority__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(scanQueue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __26__SUScanTask_scanPriority__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (void)_queue_scanForUpdates:(id)a3 sessionID:(id)a4 completion:(id)a5
{
  id v8;
  SUPolicyFactory *v9;
  SUCorePolicy *v10;
  SUCorePolicy *suScanPolicy;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  SUCoreScan *coreScanner;
  SUCoreScan *v27;
  SUCoreScan *v28;
  SUCorePolicy *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  SUPolicyFactory *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  _QWORD v44[9];
  _QWORD v45[9];
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v36 = a4;
  v38 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_scanQueue);
  v9 = objc_alloc_init(SUPolicyFactory);
  v39 = v8;
  -[SUPolicyFactory setScanOptions:](v9, "setScanOptions:", v8);
  -[SUPolicyFactory corePolicy](v9, "corePolicy");
  v10 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
  suScanPolicy = self->_suScanPolicy;
  self->_suScanPolicy = v10;

  -[SUPolicyFactory globalOptions](v9, "globalOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *MEMORY[0x24BEAEBA0];
  v47[0] = v36;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendUpdateMetricEventFields:", v13);

  v40 = v9;
  v37 = v12;
  -[SUPolicyFactory setGlobalOptions:](v9, "setGlobalOptions:", v12);
  v44[0] = CFSTR("AutomaticDownloadOver3G");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v35;
  v44[1] = *MEMORY[0x24BEAE8E8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v34;
  v44[2] = *MEMORY[0x24BEAE8E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v33;
  v44[3] = *MEMORY[0x24BEAE8D8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v32;
  v44[4] = *MEMORY[0x24BEAE8F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v14;
  v44[5] = *MEMORY[0x24BEAE8F8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 80);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v15;
  v44[6] = *MEMORY[0x24BEAE930];
  v16 = (void *)MEMORY[0x24BDD16E0];
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "overrideRamping"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v18;
  v44[7] = *MEMORY[0x24BEAE918];
  v19 = (void *)MEMORY[0x24BDD16E0];
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithBool:", objc_msgSend(v20, "overrideGranularRamping"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v21;
  v44[8] = *MEMORY[0x24BEAE910];
  v22 = (void *)MEMORY[0x24BDD16E0];
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithBool:", objc_msgSend(v23, "disableSplombo"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy setDefaultDescriptorValues:](self->_suScanPolicy, "setDefaultDescriptorValues:", v25);

  coreScanner = self->_coreScanner;
  if (!coreScanner)
  {
    v27 = (SUCoreScan *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE860]), "initWithUUID:", v36);
    v28 = self->_coreScanner;
    self->_coreScanner = v27;

    coreScanner = self->_coreScanner;
  }
  v29 = self->_suScanPolicy;
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __57__SUScanTask__queue_scanForUpdates_sessionID_completion___block_invoke;
  v41[3] = &unk_24CE3B728;
  v41[4] = self;
  v42 = v39;
  v43 = v38;
  v30 = v38;
  v31 = v39;
  -[SUCoreScan checkForAvailableSlowReleaseUpdatesWithPolicy:completion:](coreScanner, "checkForAvailableSlowReleaseUpdatesWithPolicy:completion:", v29, v41);

}

void __57__SUScanTask__queue_scanForUpdates_sessionID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  uint64_t v35;
  __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(void);
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v25 = a7;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "types");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v27)
    {
      v46 = v13;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "types");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v48 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        }
        while (v30);
      }

      v13 = v46;
    }
    else
    {
      v33 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v34);

    }
  }
  v35 = *(_QWORD *)(a1 + 48);
  if (!v35)
  {
    v36 = CFSTR("No completion callback so not reporting scan completion");
    goto LABEL_16;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v36 = CFSTR("scan completed but cancel requested so not triggering completion");
LABEL_16:
    SULogInfo(v36, v18, v19, v20, v21, v22, v23, v24, v45);
    goto LABEL_23;
  }
  if (v25)
  {
    if (objc_msgSend(v25, "code") == 8403)
      SULogInfo(CFSTR("scan completed with ScanCanceled error but cancel was not requested, triggering completion with error"), v37, v38, v39, v40, v41, v42, v43, v45);
    v44 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v44 = *(void (**)(void))(v35 + 16);
  }
  v44();
LABEL_23:

}

- (void)_queue_CollectDocumentation:(id)a3 sessionID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SUCoreScan *v11;
  SUCoreScan *coreScanner;
  SUPolicyFactory *v13;
  void *v14;
  void *v15;
  SUCoreScan *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_scanQueue);
  if (!self->_coreScanner)
  {
    v11 = (SUCoreScan *)objc_msgSend(objc_alloc(MEMORY[0x24BEAE860]), "initWithUUID:", v9);
    coreScanner = self->_coreScanner;
    self->_coreScanner = v11;

  }
  v13 = objc_alloc_init(SUPolicyFactory);
  -[SUPolicyFactory globalOptions](v13, "globalOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BEAEBA0];
  v24[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendUpdateMetricEventFields:", v15);

  -[SUPolicyFactory setGlobalOptions:](v13, "setGlobalOptions:", v14);
  -[SUPolicyFactory setScanOptions:](v13, "setScanOptions:", self->_scanOptions);
  v16 = self->_coreScanner;
  -[SUPolicyFactory corePolicy](v13, "corePolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __63__SUScanTask__queue_CollectDocumentation_sessionID_completion___block_invoke;
  v20[3] = &unk_24CE3B750;
  v21 = v8;
  v22 = v10;
  v20[4] = self;
  v18 = v8;
  v19 = v10;
  -[SUCoreScan collectDocumentationMetadataWithPolicy:descriptor:downloadDocumentation:completion:](v16, "collectDocumentationMetadataWithPolicy:descriptor:downloadDocumentation:completion:", v17, v18, 1, v20);

}

void __63__SUScanTask__queue_CollectDocumentation_sessionID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a2;
  v7 = a3;
  v8 = a4;
  v16 = v8;
  if (!*(_QWORD *)(a1 + 48))
  {
    v17 = CFSTR("No completion callback so not reporting document scan completion");
    goto LABEL_5;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v17 = CFSTR("document scan completed but cancel requested so not triggering completion");
LABEL_5:
    SULogInfo(v17, v9, v10, v11, v12, v13, v14, v15, v25);
    goto LABEL_10;
  }
  if (v8 && objc_msgSend(v8, "code") == 8403)
    SULogInfo(CFSTR("document scan completed with ScanCanceled error but cancel was not requested, triggering completion with error"), v18, v19, v20, v21, v22, v23, v24, v25);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_10:

}

- (BOOL)didScanForType:(int)a3
{
  NSMutableSet *types;
  void *v4;

  types = self->_types;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(types) = -[NSMutableSet containsObject:](types, "containsObject:", v4);

  return (char)types;
}

- (SUCoreScan)coreScanner
{
  return self->_coreScanner;
}

- (void)setCoreScanner:(id)a3
{
  objc_storeStrong((id *)&self->_coreScanner, a3);
}

- (SUCorePolicy)suScanPolicy
{
  return self->_suScanPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_scanQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_suScanPolicy, 0);
  objc_storeStrong((id *)&self->_coreScanner, 0);
  objc_storeStrong((id *)&self->_scanOptions, 0);
}

@end
