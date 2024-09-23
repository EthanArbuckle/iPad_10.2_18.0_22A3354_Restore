@implementation XBLaunchImageProvider

- (void)preheatServiceWithTimeout:(double)a3
{
  +[XBLaunchImageProviderClient preheatServiceWithTimeout:](XBLaunchImageProviderClient, "preheatServiceWithTimeout:", a3);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_7);
  return (id)sharedInstance_sXBLaunchImageProvider;
}

- (id)createLaunchImageGeneratorWithContext:(id)a3 asyncImageData:(BOOL)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  XBLaunchImageProviderClient *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  XBLaunchImageDataProvider *v20;
  id v21;
  XBLaunchImageDataProvider *v22;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  _QWORD v28[5];
  id v29;
  id v30;
  XBLaunchImageDataProvider *v31;
  NSObject *v32;
  SEL v33;
  BOOL v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  objc_msgSend(v9, "launchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationCompatibilityInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_20:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProvider.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("launchRequest"));

    if (v11)
      goto LABEL_4;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProvider.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  if (!v10)
    goto LABEL_20;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProvider.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appInfo"));

LABEL_4:
  if (objc_msgSend(v11, "hasKnownBadLaunchImage"))
  {
    XBLogCapture();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[XBLaunchImageProvider createLaunchImageGeneratorWithContext:asyncImageData:error:].cold.1(v11, v12);
    v13 = 0;
  }
  else
  {
    v27 = a4;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    XBLogCapture();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v10;
      _os_log_impl(&dword_217702000, v14, OS_LOG_TYPE_DEFAULT, "Synchronously generating image for request: %@", buf, 0xCu);
    }

    v15 = -[XBLaunchImageProviderClient initWithApplicationInfo:]([XBLaunchImageProviderClient alloc], "initWithApplicationInfo:", v11);
    v35 = 0;
    v16 = -[XBLaunchImageProviderClient generateImageWithContext:captureInfo:error:](v15, "generateImageWithContext:captureInfo:error:", v9, 0, &v35);
    v17 = v35;
    v18 = v17;
    if (v17)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v17);
      -[XBLaunchImageProvider _addBadLaunchInterfaceToDenyList:forError:](self, "_addBadLaunchInterfaceToDenyList:forError:", v11, v18);
      v19 = 0;
    }
    else
    {
      v19 = 0;
      if ((_DWORD)v16 && (_DWORD)v16 != -1)
      {
        -[XBLaunchImageProvider _resetBadLaunchInterfaceCount:](self, "_resetBadLaunchInterfaceCount:", v11);
        v20 = -[XBLaunchImageDataProvider initWithRequest:contextID:opaque:]([XBLaunchImageDataProvider alloc], "initWithRequest:contextID:opaque:", v10, v16, objc_msgSend(v11, "launchesOpaque"));
        v21 = -[XBLaunchImageDataProvider fetchImage](v20, "fetchImage");
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __84__XBLaunchImageProvider_createLaunchImageGeneratorWithContext_asyncImageData_error___block_invoke;
        v28[3] = &unk_24D7F4F48;
        v33 = a2;
        v28[4] = self;
        v29 = v11;
        v34 = v27;
        v30 = v9;
        v31 = v20;
        v32 = v12;
        v22 = v20;
        v19 = (void *)MEMORY[0x219A10DF4](v28);

      }
    }
    -[BSBaseXPCClient invalidate](v15, "invalidate");
    v13 = (void *)objc_msgSend(v19, "copy");

  }
  return v13;
}

- (void)createLaunchImageGeneratorWithContext:(void *)a1 asyncImageData:(NSObject *)a2 error:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_217702000, a2, v4, "Snapshot generation request for bundleID: %{public}@ rejected due to the app being denylisted.", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1_1();
}

void __39__XBLaunchImageProvider_sharedInstance__block_invoke()
{
  XBLaunchImageProvider *v0;
  void *v1;

  v0 = objc_alloc_init(XBLaunchImageProvider);
  v1 = (void *)sharedInstance_sXBLaunchImageProvider;
  sharedInstance_sXBLaunchImageProvider = (uint64_t)v0;

}

- (XBLaunchImageProvider)init
{
  XBLaunchImageProvider *v2;
  uint64_t Serial;
  OS_dispatch_queue *workQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)XBLaunchImageProvider;
  v2 = -[XBLaunchImageProvider init](&v6, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)Serial;

  }
  return v2;
}

- (void)dealloc
{
  BSInvalidatable *stateCaptureAssertion;
  BSInvalidatable *v4;
  objc_super v5;

  stateCaptureAssertion = self->_stateCaptureAssertion;
  if (stateCaptureAssertion)
  {
    -[BSInvalidatable invalidate](stateCaptureAssertion, "invalidate");
    v4 = self->_stateCaptureAssertion;
    self->_stateCaptureAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)XBLaunchImageProvider;
  -[XBLaunchImageProvider dealloc](&v5, sel_dealloc);
}

void __84__XBLaunchImageProvider_createLaunchImageGeneratorWithContext_asyncImageData_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  XBApplicationSnapshotManifest *v5;
  void *v6;
  XBApplicationSnapshotManifest *v7;
  NSObject *v8;
  double v9;
  void *v10;
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("XBLaunchImageProvider.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot"));

  }
  +[XBSnapshotContainerIdentity identityForCompatibilityInfo:](XBSnapshotContainerIdentity, "identityForCompatibilityInfo:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [XBApplicationSnapshotManifest alloc];
  objc_msgSend(v3, "_store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[XBApplicationSnapshotManifest initWithContainerIdentity:store:](v5, "initWithContainerIdentity:store:", v4, v6);

  objc_msgSend(*(id *)(a1 + 32), "_generateImageForSnapshot:inManifest:withContext:asyncImageData:dataProvider:scheduleAsyncGeneration:completion:", v3, v7, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 56), 0, 0);
  objc_msgSend(v3, "_generateImageIfPossible");
  XBLogCapture();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 64), "timeIntervalSinceNow");
    *(_DWORD *)buf = 134217984;
    v12 = -v9;
    _os_log_impl(&dword_217702000, v8, OS_LOG_TYPE_DEFAULT, "Snapshot image generation completed after %.3fs.", buf, 0xCu);
  }

}

- (void)captureLaunchImageForManifest:(id)a3 withCompatibilityInfo:(id)a4 launchRequests:(id)a5 createCaptureInfo:(BOOL)a6 firstImageIsReady:(id)a7 withCompletionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  XBLaunchImageProviderClient *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  NSObject *v33;
  id v34;
  void *v35;
  XBApplicationSnapshotGenerationContext *v36;
  NSObject *workQueue;
  XBApplicationSnapshotGenerationContext *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id obj;
  XBLaunchImageProviderClient *v46;
  id v47;
  void *v48;
  _BOOL4 v49;
  _QWORD block[5];
  id v51;
  XBLaunchImageProviderClient *v52;
  XBApplicationSnapshotGenerationContext *v53;
  id v54;
  XBLaunchImageProvider *v55;
  id v56;
  id v57;
  _QWORD *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  BOOL v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[3];
  char v68;
  _QWORD v69[4];
  id v70;
  XBLaunchImageProviderClient *v71;
  id v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t *v75;
  BOOL v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint8_t buf[4];
  id v96;
  __int16 v97;
  void *v98;
  _BYTE v99[128];
  uint64_t v100;

  v49 = a6;
  v100 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v43 = a7;
  v16 = a8;
  v48 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProvider.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manifest"));

  }
  if ((objc_msgSend(v14, "allowsSavingLaunchImages") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProvider.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[appInfo allowsSavingLaunchImages]"));

  }
  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProvider.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[launchRequests count] > 0"));

  }
  v89 = 0;
  v90 = &v89;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__3;
  v93 = __Block_byref_object_dispose__3;
  v94 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__3;
  v87 = __Block_byref_object_dispose__3;
  v88 = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__3;
  v81 = __Block_byref_object_dispose__3;
  v82 = 0;
  if (v16 && v49)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithArray:", v15);
    v18 = (void *)v90[5];
    v90[5] = v17;

    v19 = objc_msgSend((id)v90[5], "count");
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v19);
    v21 = (void *)v84[5];
    v84[5] = v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v19);
    v23 = (void *)v78[5];
    v78[5] = v22;

  }
  v24 = -[XBLaunchImageProviderClient initWithApplicationInfo:]([XBLaunchImageProviderClient alloc], "initWithApplicationInfo:", v14);
  if (v43)
  {
    objc_msgSend(MEMORY[0x24BE38368], "sentinelWithQueue:signalCount:completion:", 0, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  v26 = (void *)MEMORY[0x24BE38368];
  v27 = objc_msgSend(v15, "count") + 1;
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke;
  v69[3] = &unk_24D7F4F70;
  v47 = v25;
  v70 = v47;
  v76 = v49;
  v42 = v16;
  v72 = v42;
  v73 = &v89;
  v74 = &v83;
  v75 = &v77;
  v46 = v24;
  v71 = v46;
  objc_msgSend(v26, "sentinelWithQueue:signalCount:completion:", 0, v27, v69);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v68 = 0;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v15;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v99, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v64 != v30)
          objc_enumerationMutation(obj);
        v32 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        XBLogCapture();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BE38380], "descriptionForObject:", v32);
          v34 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bundleIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v96 = v34;
          v97 = 2112;
          v98 = v35;
          _os_log_impl(&dword_217702000, v33, OS_LOG_TYPE_DEFAULT, "Processing launch request %@ for app: %@.", buf, 0x16u);

        }
        v36 = -[XBApplicationSnapshotGenerationContext initWithApplicationCompatibilityInfo:launchRequest:timeout:]([XBApplicationSnapshotGenerationContext alloc], "initWithApplicationCompatibilityInfo:launchRequest:timeout:", v14, v32, 0.0);
        workQueue = self->_workQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_35;
        block[3] = &unk_24D7F4FC0;
        block[4] = v32;
        v58 = v67;
        v51 = v14;
        v52 = v46;
        v53 = v36;
        v62 = v49;
        v54 = v48;
        v55 = self;
        v56 = v47;
        v59 = &v89;
        v60 = &v83;
        v61 = &v77;
        v57 = v28;
        v38 = v36;
        dispatch_async(workQueue, block);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v99, 16);
    }
    while (v29);
  }

  objc_msgSend(v28, "signal");
  _Block_object_dispose(v67, 8);

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v89, 8);
}

uint64_t __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  XBApplicationCaptureInformation *v3;

  objc_msgSend(*(id *)(a1 + 32), "signal");
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      v3 = -[XBApplicationCaptureInformation initWithLaunchRequests:captureInfos:launchImagePaths:]([XBApplicationCaptureInformation alloc], "initWithLaunchRequests:captureInfos:launchImagePaths:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      v2 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      v3 = 0;
    }
    (*(void (**)(uint64_t, XBApplicationCaptureInformation *))(v2 + 16))(v2, v3);

  }
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_35(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  XBLaunchCaptureInformation *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  XBLaunchImageDataProvider *v16;
  dispatch_semaphore_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  XBLaunchCaptureInformation *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__3;
  v50 = __Block_byref_object_dispose__3;
  v51 = 0;
  XBLogCapture();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v53 = v3;
    _os_log_impl(&dword_217702000, v2, OS_LOG_TYPE_DEFAULT, "Asynchronously generating image data for request: %@", buf, 0xCu);
  }

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    XBLogCapture();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BE38380], "descriptionForObject:", *(_QWORD *)(a1 + 32));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_35_cold_3(v5, v6, (uint64_t)buf, v4);
    }
    v7 = 0;
  }
  else
  {
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(unsigned __int8 *)(a1 + 128);
    if (*(_BYTE *)(a1 + 128))
      v11 = &v45;
    else
      v11 = 0;
    if (*(_BYTE *)(a1 + 128))
      v45 = 0;
    v44 = 0;
    v12 = objc_msgSend(v8, "generateImageWithContext:captureInfo:error:", v9, v11, &v44);
    if (v10)
      v7 = (XBLaunchCaptureInformation *)v45;
    else
      v7 = 0;
    v4 = v44;
    if (v4)
    {
      XBLogCapture();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BE38380], "descriptionForObject:", *(_QWORD *)(a1 + 32));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_35_cold_2(v14, (uint64_t)buf, v13);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 72), "_addBadLaunchInterfaceToDenyList:forError:", *(_QWORD *)(a1 + 40), v4);
    }
    else
    {
      if (!(_DWORD)v12 || (_DWORD)v12 == -1)
      {
        XBLogCapture();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x24BE38380], "descriptionForObject:", *(_QWORD *)(a1 + 32));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_35_cold_1(v31, (uint64_t)buf, v15);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "launchRequest");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = -[XBLaunchImageDataProvider initWithRequest:contextID:opaque:]([XBLaunchImageDataProvider alloc], "initWithRequest:contextID:opaque:", v15, v12, objc_msgSend(*(id *)(a1 + 40), "launchesOpaque"));
        v17 = dispatch_semaphore_create(0);
        v18 = *(void **)(a1 + 64);
        -[NSObject groupID](v15, "groupID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "createSnapshotWithGroupID:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v47[5];
        v47[5] = v20;

        v22 = v47[5];
        v24 = *(_QWORD *)(a1 + 56);
        v23 = *(_QWORD *)(a1 + 64);
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_36;
        v37[3] = &unk_24D7F4F98;
        v43 = &v46;
        v25 = *(void **)(a1 + 72);
        v26 = *(id *)(a1 + 80);
        v27 = *(_QWORD *)(a1 + 72);
        v38 = v26;
        v39 = v27;
        v28 = *(id *)(a1 + 40);
        v29 = *(_QWORD *)(a1 + 32);
        v40 = v28;
        v41 = v29;
        v30 = v17;
        v42 = v30;
        objc_msgSend(v25, "_generateImageForSnapshot:inManifest:withContext:asyncImageData:dataProvider:scheduleAsyncGeneration:completion:", v22, v23, v24, 0, v16, 1, v37);
        dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);

      }
    }
  }

  if (*(_BYTE *)(a1 + 128))
  {
    v32 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "indexOfObject:", *(_QWORD *)(a1 + 32));
    if (v32 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v33 = v7;
      if (!v7)
        v33 = objc_alloc_init(XBLaunchCaptureInformation);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "setObject:atIndexedSubscript:", v33, v32);
      if (!v7)

      objc_msgSend((id)v47[5], "path");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      if (v34)
        v36 = (const __CFString *)v34;
      else
        v36 = &stru_24D7F6BF0;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "setObject:atIndexedSubscript:", v36, v32);

    }
  }
  objc_msgSend(*(id *)(a1 + 88), "signal");
  _Block_object_dispose(&v46, 8);

}

intptr_t __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_36(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "_cacheImage:", 0);
  objc_msgSend(*(id *)(a1 + 32), "signal");
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_resetBadLaunchInterfaceCount:", *(_QWORD *)(a1 + 48));
    XBLogCapture();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 56);
      v8 = 138543362;
      v9 = v5;
      _os_log_impl(&dword_217702000, v4, OS_LOG_TYPE_DEFAULT, "Image generation complete for: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    XBLogCapture();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_36_cold_1(a1, v4, v6);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

- (void)_generateImageForSnapshot:(id)a3 inManifest:(id)a4 withContext:(id)a5 asyncImageData:(BOOL)a6 dataProvider:(id)a7 scheduleAsyncGeneration:(BOOL)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  _BOOL4 v34;
  id v35;

  v33 = a6;
  v34 = a8;
  v35 = a4;
  v14 = a9;
  v15 = a7;
  v16 = a5;
  v17 = a3;
  objc_msgSend(v16, "launchRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "applicationCompatibilityInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "groupID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProvider.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manifest"));

    if (v16)
    {
LABEL_3:
      if (v19)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProvider.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  if (v19)
  {
LABEL_4:
    if (v15)
      goto LABEL_5;
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProvider.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataProvider"));

    if (v20)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProvider.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appInfo"));

  if (!v15)
    goto LABEL_17;
LABEL_5:
  if (v20)
    goto LABEL_6;
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBLaunchImageProvider.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotGroupID"));

LABEL_6:
  +[XBApplicationSnapshotManifestImpl _snapshotPredicateForRequest:](XBApplicationSnapshotManifestImpl, "_snapshotPredicateForRequest:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "snapshotsForGroupID:matchingPredicate:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "indexesOfObjectsPassingTest:", &__block_literal_global_47);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectsAtIndexes:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v24, "count"))
    objc_msgSend(v35, "deleteSnapshots:", v24);
  +[XBApplicationSnapshotManifestImpl _configureSnapshot:withCompatibilityInfo:forLaunchRequest:](XBApplicationSnapshotManifestImpl, "_configureSnapshot:withCompatibilityInfo:forLaunchRequest:", v17, v19, v18);
  v25 = objc_msgSend(v19, "allowsSavingLaunchImages");
  v26 = v25;
  if (v33)
    v26 = v25 | 2;
  if (v34)
    v27 = v26;
  else
    v27 = v26 | 4;
  objc_msgSend(v35, "generateImageForSnapshot:dataProvider:options:imageGeneratedHandler:imageDataSavedHandler:", v17, v15, v27, v14, 0);

}

BOOL __137__XBLaunchImageProvider__generateImageForSnapshot_inManifest_withContext_asyncImageData_dataProvider_scheduleAsyncGeneration_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "generationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)_addBadLaunchInterfaceToDenyList:(id)a3 forError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "code");
  objc_msgSend(v6, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  XBLogCapture();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[XBLaunchImageProvider _addBadLaunchInterfaceToDenyList:forError:].cold.4(v7, (uint64_t)v9, v10);

  if (v8 != 10 && (objc_msgSend(v6, "hasKnownBadLaunchImage") & 1) == 0)
  {
    if ((v8 & 0xFFFFFFFFFFFFFFFELL) != 8)
      goto LABEL_12;
    v11 = objc_msgSend(v6, "badLaunchImageCandidateCount");
    if ((v11 & 0x8000000000000000) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("strikeCount >= 1"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[XBLaunchImageProvider _addBadLaunchInterfaceToDenyList:forError:].cold.1(a2);
    }
    else
    {
      if (v11 < 4)
      {
        v12 = v11 + 1;
        if ((uint64_t)(v11 + 1) >= 3)
          v13 = 3;
        else
          v13 = v11 + 1;
        objc_msgSend(v6, "setBadLaunchImageCandidateCount:", v13);
        if (v12 != 3)
        {
LABEL_13:
          if (objc_msgSend(v6, "hasKnownBadLaunchImage"))
          {
            XBLogCapture();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              -[XBLaunchImageProvider _addBadLaunchInterfaceToDenyList:forError:].cold.3((uint64_t)v9, v14, v15);

            +[XBApplicationDataStore sharedInstance](XBApplicationDataStore, "sharedInstance");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "_persistCompatibilityInfo:forBundleIdentifier:", v6, v9);

          }
          goto LABEL_17;
        }
LABEL_12:
        objc_msgSend(v6, "setHasKnownBadLaunchImage:", 1);
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("strikeCount <= NumberOfStrikesBeforeMarkingBad + 1"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[XBLaunchImageProvider _addBadLaunchInterfaceToDenyList:forError:].cold.2(a2);
    }
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2177235CCLL);
  }
LABEL_17:

}

- (void)_resetBadLaunchInterfaceCount:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "badLaunchImageCandidateCount"))
  {
    objc_msgSend(v5, "setBadLaunchImageCandidateCount:", 0);
    objc_msgSend(v5, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[XBApplicationDataStore sharedInstance](XBApplicationDataStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_persistCompatibilityInfo:forBundleIdentifier:", v5, v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_35_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_217702000, a3, (uint64_t)a3, "Unable to generate context for %@, so skipping it and moving on.", (uint8_t *)a2);

  OUTLINED_FUNCTION_4_1();
}

void __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_35_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_217702000, a3, (uint64_t)a3, "Error generating image for launch request %@ .", (uint8_t *)a2);

  OUTLINED_FUNCTION_4_1();
}

void __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_35_cold_3(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_2(&dword_217702000, a4, a3, "Skipping launch request %@ due to denied app: %@.", (uint8_t *)a3);

  OUTLINED_FUNCTION_4_1();
}

void __150__XBLaunchImageProvider_captureLaunchImageForManifest_withCompatibilityInfo_launchRequests_createCaptureInfo_firstImageIsReady_withCompletionHandler___block_invoke_36_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0_3(&dword_217702000, a2, a3, "Image generation failed for: %{public}@", (uint8_t *)&v4);
}

- (void)_addBadLaunchInterfaceToDenyList:(const char *)a1 forError:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_217702000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_addBadLaunchInterfaceToDenyList:(const char *)a1 forError:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_217702000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_addBadLaunchInterfaceToDenyList:(uint64_t)a3 forError:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_217702000, a2, a3, "Noting that the application %@ has a bad launch image until it is updated.", (uint8_t *)&v3);
}

- (void)_addBadLaunchInterfaceToDenyList:(NSObject *)a3 forError:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = 134218242;
  v7 = objc_msgSend(a1, "code");
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_0_2(&dword_217702000, a3, v5, "Snapshot generation resulted in an error with code: %ld for app bundleID: %@", (uint8_t *)&v6);
  OUTLINED_FUNCTION_1_1();
}

@end
