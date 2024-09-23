@implementation WLKAppLibraryCore

void __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  os_signpost_id_t spid;
  unint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  os_signpost_id_t v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  uint8_t buf[16];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = objc_claimAutoreleasedReturnValue();
  WLKStartupSignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  WLKStartupSignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v53 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LibraryCore.fetchApplicationsInProcess.filter", ", buf, 2u);
  }
  spid = v6;

  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_22;
  v73[3] = &unk_1E68A81E0;
  v73[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "setFilter:", v73);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v4);
  NSLog(CFSTR("WLKAppLibraryCore - filter elapsed time: %.5f"), v11);

  WLKStartupSignpostLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v13, OS_SIGNPOST_INTERVAL_END, spid, "LibraryCore.fetchApplicationsInProcess.filter", ", buf, 2u);
  }

  WLKStartupSignpostLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LibraryCore.fetchApplicationsInProcess.checkAppRecords", ", buf, 2u);
  }
  v55 = a1;
  v50 = (void *)v4;
  v51 = v3;

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  v54 = v16;
  if (v17)
  {
    v18 = v17;
    LODWORD(v19) = 0;
    v20 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v70 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        v23 = (void *)MEMORY[0x1B5E47E50]();
        WLKAppProxyForLSApplicationRecord(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEntitled");
        v26 = v2;
        if ((v25 & 1) != 0)
          goto LABEL_18;
        v27 = objc_msgSend(v24, "isTVApp");
        v26 = v2;
        if ((v27 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(*(id *)(v55 + 32), "_nonConformingBundleList");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "containsObject:", v29);

        v16 = v54;
        v26 = v56;
        if (v30)
LABEL_18:
          objc_msgSend(v26, "addObject:", v24);

        objc_autoreleasePoolPop(v23);
      }
      v19 = (v19 + v18);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "timeIntervalSinceDate:", v50);
  NSLog(CFSTR("WLKAppLibraryCore - enumerate apps elapsed time: %.5f, recordCount=%d"), v32, v19);

  WLKStartupSignpostLogObject();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v34, OS_SIGNPOST_INTERVAL_END, spid, "LibraryCore.fetchApplicationsInProcess.checkAppRecords", ", buf, 2u);
  }

  WLKStartupSignpostLogObject();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v36, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LibraryCore.fetchApplicationsInProcess.InstalledAppBundles", ", buf, 2u);
  }

  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_29;
  v65[3] = &unk_1E68A8208;
  v37 = v47;
  v66 = v37;
  v38 = v49;
  v67 = v38;
  v39 = v48;
  v68 = v39;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v65);
  WLKStartupSignpostLogObject();
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v41, OS_SIGNPOST_INTERVAL_END, spid, "LibraryCore.fetchApplicationsInProcess.InstalledAppBundles", ", buf, 2u);
  }

  v42 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (objc_msgSend(v38, "count"))
  {
    WLKStartupSignpostLogObject();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v44, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LibraryCore.fetchApplicationsInProcess.ActiveSubscription", ", buf, 2u);
    }

    v45 = *(void **)(*(_QWORD *)(v55 + 32) + 24);
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_32;
    v57[3] = &unk_1E68A8230;
    v64 = spid;
    v58 = v38;
    v59 = v42;
    v60 = v51;
    v61 = v37;
    v63 = *(id *)(v55 + 40);
    v62 = v56;
    objc_msgSend(v45, "getActiveSubscriptionServicesMatchingBundleIdentifiers:domainIdentifiers:maximumExpirationLimit:completionHandler:", v39, MEMORY[0x1E0C9AA60], v57, 31104000.0);

    v46 = v58;
    goto LABEL_39;
  }
  NSLog(CFSTR("WLKAppLibraryCore - no mutableInstalledAppBundles found"));
  _configureDemoBundles(v38, v51, v37);
  if (*(_QWORD *)(v55 + 40))
  {
    (*((void (**)(uint64_t, void *, void *, void *, void *))fetchedApplicationsCompletion + 2))((uint64_t)fetchedApplicationsCompletion, v38, v51, v37, v56);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(v55 + 40) + 16))();
LABEL_39:

  }
}

void __39__WLKAppLibraryCore_fetchApplications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  WLKStartupSignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v5, OS_SIGNPOST_INTERVAL_END, v6, "LibraryCore.fetchApplicationsInProcess", ", v7, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_otherBundlesOfInterest
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__WLKAppLibraryCore__otherBundlesOfInterest__block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  if (_otherBundlesOfInterest_onceToken != -1)
    dispatch_once(&_otherBundlesOfInterest_onceToken, block);
  return (id)_otherBundlesOfInterest___bundlesOfInterest;
}

- (void)fetchApplications:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  id *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  _QWORD v24[2];
  uint8_t buf[16];

  v4 = a3;
  if ((WLKIsDaemon() & 1) != 0 || WLKIsRunningTest())
  {
    WLKStartupSignpostLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);

    WLKStartupSignpostLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LibraryCore.fetchApplicationsInProcess", ", buf, 2u);
    }

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __39__WLKAppLibraryCore_fetchApplications___block_invoke;
    v23[3] = &unk_1E68A8150;
    v9 = (id *)v24;
    v24[0] = v4;
    v24[1] = v6;
    v10 = v4;
    -[WLKAppLibraryCore _fetchApplicationsInProcess:](self, "_fetchApplicationsInProcess:", v23);
  }
  else
  {
    -[WLKAppLibraryCore _connection](self, "_connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __39__WLKAppLibraryCore_fetchApplications___block_invoke_5;
    v21[3] = &unk_1E68A7E88;
    v9 = &v22;
    v13 = v4;
    v22 = v13;
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("WLKAppLibraryCore - calling out to daemon for app enumeration"));
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __39__WLKAppLibraryCore_fetchApplications___block_invoke_2;
    v18[3] = &unk_1E68A8178;
    v19 = v15;
    v20 = v13;
    v16 = v13;
    v17 = v15;
    objc_msgSend(v14, "fetchApplications:", v18);

  }
}

+ (id)sharedInstance
{
  if (sharedInstance___once_2 != -1)
    dispatch_once(&sharedInstance___once_2, &__block_literal_global_11);
  return (id)sharedInstance___singleInstance;
}

- (void)_fetchApplicationsInProcess:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke;
  v7[3] = &unk_1E68A8258;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.watchlistd.xpc"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    WLKConnectionClientInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v8 = self->_connection;
    WLKConnectionServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_52);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __32__WLKAppLibraryCore__connection__block_invoke_2;
    v15 = &unk_1E68A7FC0;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v12);
    -[NSXPCConnection resume](self->_connection, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __35__WLKAppLibraryCore_sharedInstance__block_invoke()
{
  WLKAppLibraryCore *v0;
  void *v1;

  v0 = objc_alloc_init(WLKAppLibraryCore);
  v1 = (void *)sharedInstance___singleInstance;
  sharedInstance___singleInstance = (uint64_t)v0;

}

- (WLKAppLibraryCore)init
{
  WLKAppLibraryCore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  PSSSSubscriptionManagerInternal *v5;
  PSSSSubscriptionManagerInternal *subscriptionManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WLKAppLibraryCore;
  v2 = -[WLKAppLibraryCore init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WatchListKit.AppLibraryCore", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (PSSSSubscriptionManagerInternal *)objc_alloc_init(MEMORY[0x1E0D65B10]);
    subscriptionManager = v2->_subscriptionManager;
    v2->_subscriptionManager = v5;

  }
  return v2;
}

void __39__WLKAppLibraryCore_fetchApplications___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  NSLog(CFSTR("WLKAppLibraryCore - daemon callback for app enumeration elapsed time: %.5f"), v4);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

uint64_t __39__WLKAppLibraryCore_fetchApplications___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  NSLog(CFSTR("WLKAppLibraryCore - Error: Unable to communicate with the remote object proxy (%@)"), a2);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (id)_nonConformingBundleList
{
  if (_nonConformingBundleList_onceToken != -1)
    dispatch_once(&_nonConformingBundleList_onceToken, &__block_literal_global_14);
  return (id)_nonConformingBundleList___nonConformingBundles;
}

void __45__WLKAppLibraryCore__nonConformingBundleList__block_invoke()
{
  void *v0;

  v0 = (void *)_nonConformingBundleList___nonConformingBundles;
  _nonConformingBundleList___nonConformingBundles = (uint64_t)&unk_1E68CA168;

}

void __44__WLKAppLibraryCore__otherBundlesOfInterest__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(a1 + 32), "_nonConformingBundleList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayWithArray:", v2);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  WLKTVAppBundleID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v3);

  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)_otherBundlesOfInterest___bundlesOfInterest;
  _otherBundlesOfInterest___bundlesOfInterest = v4;

}

uint64_t __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "entitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("com.apple.smoot.subscriptionservice"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_otherBundlesOfInterest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsObject:", v8);

  }
  return v6;
}

void __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_29(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isAppStoreVendable") & 1) == 0 && (objc_msgSend(v5, "isSystemApp") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  v3 = *(void **)(a1 + 48);
  objc_msgSend(v5, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WLKAppProxy *v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[16];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = a2;
  v5 = a3;
  WLKStartupSignpostLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 80);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v7, OS_SIGNPOST_INTERVAL_END, v8, "LibraryCore.fetchApplicationsInProcess.ActiveSubscription", ", buf, 2u);
  }

  WLKStartupSignpostLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 80);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "LibraryCore.fetchApplicationsInProcess.SubscribedAppBundle", ", buf, 2u);
  }

  if (v5)
    NSLog(CFSTR("WLKAppLibraryCore - Error fetching subscriptions: %@"), v5);
  v31 = v5;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v32, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "count"))
        {
          v18 = 0;
          while (1)
          {
            objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "bundleIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", v17);

            if (v21)
              break;

            if (++v18 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
              goto LABEL_20;
          }
          objc_msgSend(*(id *)(a1 + 40), "addIndex:", v18);
          objc_msgSend(v19, "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v22, "mutableCopy");

          objc_msgSend(v32, "objectForKeyedSubscript:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("type"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("WLKAppProxy.subscriptionInfo"));
          v26 = -[WLKAppProxy initWithDictionary:]([WLKAppProxy alloc], "initWithDictionary:", v23);
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v26);

        }
LABEL_20:
        ;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v14);
  }

  WLKStartupSignpostLogObject();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  v29 = *(_QWORD *)(a1 + 80);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v28, OS_SIGNPOST_INTERVAL_END, v29, "LibraryCore.fetchApplicationsInProcess.SubscribedAppBundle", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeObjectsAtIndexes:", *(_QWORD *)(a1 + 40));
  _configureDemoBundles(*(void **)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
  if (*(_QWORD *)(a1 + 72))
  {
    (*((void (**)(uint64_t, void *, void *, void *, void *))fetchedApplicationsCompletion + 2))((uint64_t)fetchedApplicationsCompletion, *(void **)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
}

void __32__WLKAppLibraryCore__connection__block_invoke()
{
  NSLog(CFSTR("WLKAppLibraryCore - Connection interrupted."));
}

void __32__WLKAppLibraryCore__connection__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  NSLog(CFSTR("WLKAppLibraryCore - Connection invalidated."));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    v4 = WeakRetained;

    WeakRetained = v4;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
