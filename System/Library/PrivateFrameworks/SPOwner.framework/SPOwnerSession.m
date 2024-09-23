@implementation SPOwnerSession

void __55__SPOwnerSession_registerDarwinNotificationName_block___block_invoke(uint64_t a1)
{
  void *v2;
  SPDarwinNotificationHandler *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "darwinHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SPDarwinNotificationHandler initWithNotificationName:changeBlock:]([SPDarwinNotificationHandler alloc], "initWithNotificationName:changeBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setValue:forKey:", v3, *(_QWORD *)(a1 + 32));

}

- (void)_invalidate
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;

  -[SPOwnerSession connectionExpiryDispatchTimer](self, "connectionExpiryDispatchTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SPOwnerSession connectionExpiryDispatchTimer](self, "connectionExpiryDispatchTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

  }
  -[SPOwnerSession setConnectionExpiryDispatchTimer:](self, "setConnectionExpiryDispatchTimer:", 0);
  v5 = (void *)objc_opt_new();
  -[SPOwnerSession setClientObservedBeacons:](self, "setClientObservedBeacons:", v5);

  -[SPOwnerSession session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SPOwnerSession setSession:](self, "setSession:", 0);
  -[SPOwnerSession _unregisterDarwinNotificationName:](self, "_unregisterDarwinNotificationName:", CFSTR("SPBeaconsChangedNotification"));
  -[SPOwnerSession _unregisterDarwinNotificationName:](self, "_unregisterDarwinNotificationName:", CFSTR("com.apple.locationd.authorization"));
  -[SPOwnerSession _unregisterDarwinNotificationName:](self, "_unregisterDarwinNotificationName:", CFSTR("com.apple.locationd/Prefs"));
  -[SPOwnerSession _unregisterDarwinNotificationName:](self, "_unregisterDarwinNotificationName:", CFSTR("com.apple.icloud.searchparty.ServiceSettingsChanged"));
}

- (void)_unregisterDarwinNotificationName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPOwnerSession darwinHandlers](self, "darwinHandlers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (NSMutableDictionary)darwinHandlers
{
  return self->_darwinHandlers;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setConnectionExpiryDispatchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionExpiryDispatchTimer, a3);
}

- (void)setClientObservedBeacons:(id)a3
{
  objc_storeStrong((id *)&self->_clientObservedBeacons, a3);
}

- (OS_dispatch_source)connectionExpiryDispatchTimer
{
  return self->_connectionExpiryDispatchTimer;
}

- (SPOwnerSession)init
{
  SPOwnerSession *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  uint64_t v7;
  FMQueueSynchronizer *queueSynchronizer;
  NSOperationQueue *v9;
  NSOperationQueue *notificationQueue;
  uint64_t v11;
  NSSet *clientObservedBeacons;
  uint64_t v13;
  NSSet *locationSources;
  uint64_t v15;
  NSMutableDictionary *darwinHandlers;
  uint64_t v17;
  SPOwnerSessionLocationFetch *locationFetch;
  uint64_t v19;
  FMTokenBucket *tokenBucket;
  id v21;
  void *v22;
  uint64_t v23;
  FMXPCServiceDescription *serviceDescription;
  NSDictionary *v25;
  NSDictionary *locationCache;
  NSMutableDictionary *v27;
  NSMutableDictionary *batteryStatusCache;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)SPOwnerSession;
  v2 = -[SPOwnerSession init](&v30, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPOwnerSession", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
    v6 = v4;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D20208]), "initWithQueue:", v2->_queue);
    queueSynchronizer = v2->_queueSynchronizer;
    v2->_queueSynchronizer = (FMQueueSynchronizer *)v7;

    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = v9;

    v11 = objc_opt_new();
    clientObservedBeacons = v2->_clientObservedBeacons;
    v2->_clientObservedBeacons = (NSSet *)v11;

    v13 = objc_opt_new();
    locationSources = v2->_locationSources;
    v2->_locationSources = (NSSet *)v13;

    v15 = objc_opt_new();
    darwinHandlers = v2->_darwinHandlers;
    v2->_darwinHandlers = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    locationFetch = v2->_locationFetch;
    v2->_locationFetch = (SPOwnerSessionLocationFetch *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D20220]), "initWithFillRate:capacity:", 10.0, 50.0);
    tokenBucket = v2->_tokenBucket;
    v2->_tokenBucket = (FMTokenBucket *)v19;

    v21 = objc_alloc(MEMORY[0x1E0D20238]);
    -[SPOwnerSession remoteInterface](v2, "remoteInterface");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.ownersession"), 0, v22, 0, 0);
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v23;

    v25 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    locationCache = v2->_locationCache;
    v2->_locationCache = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    batteryStatusCache = v2->_batteryStatusCache;
    v2->_batteryStatusCache = v27;

  }
  return v2;
}

void __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setSimpleBeaconUpdateInterface:", v2);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_2;
  v3[3] = &unk_1E5E17B78;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v2, "setSimpleBeaconDifferenceBlock:", v3);
  objc_msgSend(v2, "startUpdatingSimpleBeaconsWithContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

- (void)setSimpleBeaconUpdateInterface:(id)a3
{
  objc_storeStrong((id *)&self->_simpleBeaconUpdateInterface, a3);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  SPOwnerSession *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Dealloc %@", buf, 0xCu);
  }

  -[SPOwnerSession _invalidate](self, "_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SPOwnerSession;
  -[SPOwnerSession dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleBeaconUpdateInterface, 0);
  objc_storeStrong((id *)&self->_locationFetch, 0);
  objc_storeStrong((id *)&self->_darwinHandlers, 0);
  objc_storeStrong((id *)&self->__ownerSessionState, 0);
  objc_storeStrong((id *)&self->_tokenBucket, 0);
  objc_storeStrong((id *)&self->_registerIntentDispatchTimer, 0);
  objc_storeStrong((id *)&self->_batteryStatusCache, 0);
  objc_storeStrong((id *)&self->_fetchLimit, 0);
  objc_storeStrong((id *)&self->_connectionExpiryDispatchTimer, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong(&self->_tagSeparationBeaconsChangedBlock, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queueSynchronizer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientObservedBeacons, 0);
  objc_storeStrong((id *)&self->_allBeaconsCache, 0);
  objc_storeStrong((id *)&self->_userAgentProxy, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong(&self->maintainedUnknownBeaconsChangedBlock, 0);
  objc_storeStrong(&self->maintainedBeaconsChangedBlock, 0);
  objc_storeStrong((id *)&self->_locationSources, 0);
  objc_storeStrong(&self->ownerSessionStateUpdatedBlock, 0);
  objc_storeStrong(&self->latestLocationsUpdatedBlock, 0);
  objc_storeStrong(&self->beaconsChangedBlock, 0);
  objc_storeStrong(&self->beaconRemovedBlock, 0);
  objc_storeStrong(&self->beaconAddedBlock, 0);
}

void __77__SPOwnerSession_SeparationMonitoring__safeLocationsForSeparationMonitoring___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__SPOwnerSession_SeparationMonitoring__safeLocationsForSeparationMonitoring___block_invoke_2;
  v4[3] = &unk_1E5E17250;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "safeLocationsWithCompletion:", v4);

}

void __52__SPOwnerSession_clientConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientConfigurationWithCompletion:", *(_QWORD *)(a1 + 32));

}

void __72__SPOwnerSession_SeparationMonitoring__fetchSeparationMonitoringStatus___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchSeparationMonitoringStatus:", *(_QWORD *)(a1 + 40));

}

void __39__SPOwnerSession_isUTAppAlertDisabled___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isUTAppAlertDisabled:", *(_QWORD *)(a1 + 32));

}

void __50__SPOwnerSession_beaconGroupsForUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconGroupsForUUIDs:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)beaconGroupsForUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__SPOwnerSession_beaconGroupsForUUIDs_completion___block_invoke;
  v11[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)unknownBeaconsForUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_OwnerSession();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "unknownBeaconsForUUIDs %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SPOwnerSession_unknownBeaconsForUUIDs_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)isUTAppAlertDisabled:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id buf[2];

  v4 = a3;
  LogCategory_OwnerSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "isUTAppAlertDisabled", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[SPOwnerSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SPOwnerSession_isUTAppAlertDisabled___block_invoke;
  v8[3] = &unk_1E5E17510;
  objc_copyWeak(&v10, buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (id)remoteInterface
{
  void *v2;
  void *v3;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v64[2];
  _QWORD v65[2];
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[4];
  _QWORD v74[4];
  _QWORD v75[4];
  _QWORD v76[2];
  _QWORD v77[4];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[6];

  v83[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27BB8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v83[0] = objc_opt_class();
  v83[1] = objc_opt_class();
  v83[2] = objc_opt_class();
  v83[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_latestLocationsForIdentifiers_fetchLimit_sources_completion_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v82[0] = objc_opt_class();
  v82[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_rawSearchResultsForIdentifier_dateInterval_completion_, 0, 1);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v81[0] = objc_opt_class();
  v81[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_allBeaconsWithCompletion_, 0, 1);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v80[0] = objc_opt_class();
  v80[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_unacceptedBeaconsWithCompletion_, 0, 1);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v79[0] = objc_opt_class();
  v79[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_beaconGroupsForUUIDs_completion_, 0, 1);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v78[0] = objc_opt_class();
  v78[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_standaloneBeaconsForUUIDs_completion_, 0, 1);

  v21 = (void *)MEMORY[0x1E0C99E60];
  v77[0] = objc_opt_class();
  v77[1] = objc_opt_class();
  v77[2] = objc_opt_class();
  v77[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_didObserveUnauthorizedTrackingWithCompletion_completion_, 0, 0);

  v24 = (void *)MEMORY[0x1E0C99E60];
  v76[0] = objc_opt_class();
  v76[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_didObserveUnauthorizedTrackingWithCompletion_completion_, 0, 1);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v75[0] = objc_opt_class();
  v75[1] = objc_opt_class();
  v75[2] = objc_opt_class();
  v75[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_didDetectUnauthorizedTrackingWithCompletion_completion_, 0, 0);

  v30 = (void *)MEMORY[0x1E0C99E60];
  v74[0] = objc_opt_class();
  v74[1] = objc_opt_class();
  v74[2] = objc_opt_class();
  v74[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithArray:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_didUpdateUnauthorizedTrackingWithCompletion_completion_, 0, 0);

  v33 = (void *)MEMORY[0x1E0C99E60];
  v73[0] = objc_opt_class();
  v73[1] = objc_opt_class();
  v73[2] = objc_opt_class();
  v73[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setWithArray:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_didWithdrawUnauthorizedTrackingWithCompletion_completion_, 0, 0);

  v36 = (void *)MEMORY[0x1E0C99E60];
  v72[0] = objc_opt_class();
  v72[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_beaconsToMaintainWithCompletion_, 0, 1);

  v39 = (void *)MEMORY[0x1E0C99E60];
  v71[0] = objc_opt_class();
  v71[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setWithArray:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_unknownBeaconsForUUIDs_completion_, 0, 1);

  v42 = (void *)MEMORY[0x1E0C99E60];
  v70[0] = objc_opt_class();
  v70[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setWithArray:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_beaconsToMaintainPersistentConnection_, 0, 1);

  v45 = (void *)MEMORY[0x1E0C99E60];
  v69[0] = objc_opt_class();
  v69[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setWithArray:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_safeLocationsWithCompletion_, 0, 1);

  v48 = (void *)MEMORY[0x1E0C99E60];
  v68[0] = objc_opt_class();
  v68[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setWithArray:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_beaconsToMonitorForSeparation_, 0, 1);

  v51 = (void *)MEMORY[0x1E0C99E60];
  v67 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setWithArray:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_publishSeparationEventForBeacons_eventType_region_completion_, 0, 1);

  v54 = (void *)MEMORY[0x1E0C99E60];
  v66 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setWithArray:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_activeCompanionWithCompletion_, 0, 1);

  v57 = (void *)MEMORY[0x1E0C99E60];
  v65[0] = objc_opt_class();
  v65[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setWithArray:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_allObservationsForBeacon_completion_, 0, 1);

  v60 = (void *)MEMORY[0x1E0C99E60];
  v64[0] = objc_opt_class();
  v64[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setWithArray:", v61, v64[0]);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_addSafeLocation_completion_, 1, 1);

  return v2;
}

- (SPOwnerSessionXPCProtocol)proxy
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SPOwnerSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPOwnerSession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPOwnerSession serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPOwnerSession setSession:](self, "setSession:", v7);

    LogCategory_OwnerSession();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SPOwnerSession serviceDescription](self, "serviceDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "machService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);

    }
    -[SPOwnerSession session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  -[SPOwnerSession session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPOwnerSessionXPCProtocol *)v13;
}

- (FMXPCSession)session
{
  return self->_session;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

uint64_t __77__SPOwnerSession_SeparationMonitoring__safeLocationsForSeparationMonitoring___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setLocationUpdateBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPOwnerSession locationFetch](self, "locationFetch");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocationUpdateBlock:", v4);

}

- (void)subscribeAndFetchLocationForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SPOwnerSession locationFetch](self, "locationFetch");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeAndFetchLocationForContext:completion:", v7, v6);

}

- (SPOwnerSessionLocationFetch)locationFetch
{
  return self->_locationFetch;
}

void __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  v11 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v5, "insertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fm_map:", &__block_literal_global_275);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3838]), "initWithChanges:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __52__SPOwnerSession_unknownBeaconsForUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unknownBeaconsForUUIDs:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "simpleBeaconUpdateInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_5;
    v4[3] = &unk_1E5E176C8;
    v3 = *(void **)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    objc_msgSend(v5, "stopUpdatingApplicationBeaconsWithCompletion:", v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (SPBeaconManagerSimpleBeaconUpdateInterface)simpleBeaconUpdateInterface
{
  return self->_simpleBeaconUpdateInterface;
}

- (void)startRefreshingSafeLocationWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession safeLocationsForSeparationMonitoring:](self, "safeLocationsForSeparationMonitoring:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke;
  v6[3] = &unk_1E5E16720;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  -[SPOwnerSession registerDarwinNotificationName:block:](self, "registerDarwinNotificationName:block:", CFSTR("com.apple.icloud.searchparty.separation_monitoring.safelocations_changed"), v6);

  objc_destroyWeak(&location);
}

- (void)startRefreshingSeparationMonitoringState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession fetchSeparationMonitoringStatus:](self, "fetchSeparationMonitoringStatus:", v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__SPOwnerSession_SeparationMonitoring__startRefreshingSeparationMonitoringState___block_invoke;
  v6[3] = &unk_1E5E16720;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  -[SPOwnerSession registerDarwinNotificationName:block:](self, "registerDarwinNotificationName:block:", CFSTR("com.apple.icloud.searchparty.separation_monitoring.state_changed"), v6);

  objc_destroyWeak(&location);
}

- (void)registerDarwinNotificationName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__SPOwnerSession_registerDarwinNotificationName_block___block_invoke;
  v11[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)safeLocationsForSeparationMonitoring:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SPOwnerSession_SeparationMonitoring__safeLocationsForSeparationMonitoring___block_invoke;
  block[3] = &unk_1E5E16720;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&location);
}

- (void)fetchSeparationMonitoringStatus:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SPOwnerSession_SeparationMonitoring__fetchSeparationMonitoringStatus___block_invoke;
  block[3] = &unk_1E5E16720;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&location);
}

- (void)clientConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SPOwnerSession_clientConfigurationWithCompletion___block_invoke;
  block[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)startUpdatingApplicationBeaconsWithContext:(id)a3 collectionDifference:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  LogCategory_OwnerSession();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v26 = "-[SPOwnerSession startUpdatingApplicationBeaconsWithContext:collectionDifference:completion:]";
    _os_log_impl(&dword_1AEA79000, v11, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: SPI: %{public}s", buf, 0xCu);
  }

  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke;
  aBlock[3] = &unk_1E5E17BA0;
  aBlock[4] = self;
  v22 = v8;
  v23 = v9;
  v24 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  v16 = _Block_copy(aBlock);
  -[SPOwnerSession queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_4;
  v19[3] = &unk_1E5E16720;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  dispatch_async(v17, v19);

}

- (void)beaconsToMonitorForSeparation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SPOwnerSession_SeparationMonitoring__beaconsToMonitorForSeparation___block_invoke;
  block[3] = &unk_1E5E16720;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&location);
}

void __70__SPOwnerSession_SeparationMonitoring__beaconsToMonitorForSeparation___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beaconsToMonitorForSeparation:", *(_QWORD *)(a1 + 40));

}

- (void)startRefreshingBeaconsForSeparationMonitoringWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id location;
  _QWORD aBlock[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke;
  aBlock[3] = &unk_1E5E17228;
  v6 = v4;
  v13 = v6;
  v7 = _Block_copy(aBlock);
  -[SPOwnerSession beaconsToMonitorForSeparation:](self, "beaconsToMonitorForSeparation:", v7);
  objc_initWeak(&location, self);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke_3;
  v9[3] = &unk_1E5E16720;
  v9[4] = self;
  v8 = v7;
  v10 = v8;
  -[SPOwnerSession registerDarwinNotificationName:block:](self, "registerDarwinNotificationName:block:", CFSTR("com.apple.icloud.searchparty.separation_monitoring.beacons_changed"), v9);

  objc_destroyWeak(&location);
}

void __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke_2;
  v6[3] = &unk_1E5E16720;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  return result;
}

uint64_t __95__SPOwnerSession_SeparationMonitoring__startRefreshingBeaconsForSeparationMonitoringWithBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beaconsToMonitorForSeparation:", *(_QWORD *)(a1 + 40));
}

- (void)stopRefreshingBeaconsForSeparationMonitoringWithBlock
{
  -[SPOwnerSession unregisterDarwinNotificationName:](self, "unregisterDarwinNotificationName:", CFSTR("com.apple.icloud.searchparty.separation_monitoring.beacons_changed"));
}

- (void)enableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__SPOwnerSession_SeparationMonitoring__enableSeparationMonitoringForBeacons_completion___block_invoke;
  v11[3] = &unk_1E5E16770;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&location);
}

void __88__SPOwnerSession_SeparationMonitoring__enableSeparationMonitoringForBeacons_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableSeparationMonitoringForBeacons:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)disableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__SPOwnerSession_SeparationMonitoring__disableSeparationMonitoringForBeacons_completion___block_invoke;
  v11[3] = &unk_1E5E16770;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&location);
}

void __89__SPOwnerSession_SeparationMonitoring__disableSeparationMonitoringForBeacons_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disableSeparationMonitoringForBeacons:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)enableSeparationMonitoringForBeacon:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPOwnerSession enableSeparationMonitoringForBeacons:completion:](self, "enableSeparationMonitoringForBeacons:completion:", v9, v7, v10, v11);
}

- (void)disableSeparationMonitoringForBeacon:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPOwnerSession disableSeparationMonitoringForBeacons:completion:](self, "disableSeparationMonitoringForBeacons:completion:", v9, v7, v10, v11);
}

void __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke_2;
  v3[3] = &unk_1E5E17228;
  v1 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v2 = v1;
  objc_msgSend(v2, "safeLocationsForSeparationMonitoring:", v3);

}

void __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke_3;
  v7[3] = &unk_1E5E17278;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __77__SPOwnerSession_SeparationMonitoring__startRefreshingSafeLocationWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)stopRefreshingSafeLocations
{
  -[SPOwnerSession unregisterDarwinNotificationName:](self, "unregisterDarwinNotificationName:", CFSTR("com.apple.icloud.searchparty.separation_monitoring.safelocations_changed"));
}

- (void)addSafeLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__SPOwnerSession_SeparationMonitoring__addSafeLocation_completion___block_invoke;
  v11[3] = &unk_1E5E16770;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&location);
}

void __67__SPOwnerSession_SeparationMonitoring__addSafeLocation_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSafeLocation:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeSafeLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__SPOwnerSession_SeparationMonitoring__removeSafeLocation_completion___block_invoke;
  v11[3] = &unk_1E5E16770;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&location);
}

void __70__SPOwnerSession_SeparationMonitoring__removeSafeLocation_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeSafeLocation:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)updateSafeLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__SPOwnerSession_SeparationMonitoring__updateSafeLocation_completion___block_invoke;
  v11[3] = &unk_1E5E16770;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&location);
}

void __70__SPOwnerSession_SeparationMonitoring__updateSafeLocation_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateSafeLocation:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)assignSafeLocation:(id)a3 to:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPOwnerSession assignSafeLocation:beaconUUIDs:completion:](self, "assignSafeLocation:beaconUUIDs:completion:", v11, v12, v9, v13, v14);
}

- (void)unassignSafeLocation:(id)a3 beaconUUID:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPOwnerSession unassignSafeLocation:beaconUUIDs:completion:](self, "unassignSafeLocation:beaconUUIDs:completion:", v11, v12, v9, v13, v14);
}

- (void)assignSafeLocation:(id)a3 beaconUUIDs:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__SPOwnerSession_SeparationMonitoring__assignSafeLocation_beaconUUIDs_completion___block_invoke;
  block[3] = &unk_1E5E16D08;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&location);
}

void __82__SPOwnerSession_SeparationMonitoring__assignSafeLocation_beaconUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assignSafeLocation:to:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)unassignSafeLocation:(id)a3 beaconUUIDs:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SPOwnerSession_SeparationMonitoring__unassignSafeLocation_beaconUUIDs_completion___block_invoke;
  block[3] = &unk_1E5E16D08;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&location);
}

void __84__SPOwnerSession_SeparationMonitoring__unassignSafeLocation_beaconUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unassignSafeLocation:from:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)publishSeparationEventForBeacons:(id)a3 eventType:(int64_t)a4 region:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __101__SPOwnerSession_SeparationMonitoring__publishSeparationEventForBeacons_eventType_region_completion___block_invoke;
  v17[3] = &unk_1E5E172A0;
  v17[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a4;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(&location);
}

void __101__SPOwnerSession_SeparationMonitoring__publishSeparationEventForBeacons_eventType_region_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publishSeparationEventForBeacons:eventType:region:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)activeCompanionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SPOwnerSession_SeparationMonitoring__activeCompanionWithCompletion___block_invoke;
  block[3] = &unk_1E5E16720;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&location);
}

void __70__SPOwnerSession_SeparationMonitoring__activeCompanionWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "userAgentProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeCompanionWithCompletion:", *(_QWORD *)(a1 + 40));

}

uint64_t __81__SPOwnerSession_SeparationMonitoring__startRefreshingSeparationMonitoringState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchSeparationMonitoringStatus:", *(_QWORD *)(a1 + 40));
}

- (void)stopRefreshingSeparationMonitoringState
{
  -[SPOwnerSession unregisterDarwinNotificationName:](self, "unregisterDarwinNotificationName:", CFSTR("com.apple.icloud.searchparty.separation_monitoring.state_changed"));
}

- (void)forceLOIBasedSafeLocationRefresh:(id)a3
{
  id v4;
  SPOwnerSession *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = self;
  -[SPOwnerSession queue](v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SPOwnerSession_SeparationMonitoring__forceLOIBasedSafeLocationRefresh___block_invoke;
  block[3] = &unk_1E5E16720;
  block[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&location);
}

void __73__SPOwnerSession_SeparationMonitoring__forceLOIBasedSafeLocationRefresh___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userAgentProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceLOIBasedSafeLocationRefresh:", *(_QWORD *)(a1 + 40));

}

- (id)maintenanceConnectionUpdateBlock
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  -[SPOwnerSession queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke;
  aBlock[3] = &unk_1E5E16E68;
  v9 = v3;
  v4 = v3;
  objc_copyWeak(&v10, &location);
  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

void __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[16];

  LogCategory_MaintenanceConnection();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "Updating maintenance connection.", buf, 2u);
  }

  v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_1;
  block[3] = &unk_1E5E16B08;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);
}

void __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_1(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[7];
  _QWORD v11[4];
  NSObject *v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v2 = dispatch_group_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_group_enter(v2);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__3;
  v19[4] = __Block_byref_object_dispose__3;
  v20 = 0;
  objc_msgSend(WeakRetained, "userAgentProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_2;
  v16[3] = &unk_1E5E173E8;
  v18 = v19;
  v6 = v2;
  v17 = v6;
  objc_msgSend(v4, "beaconsToMaintainWithCompletion:", v16);

  dispatch_group_enter(v6);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__3;
  v14[4] = __Block_byref_object_dispose__3;
  v15 = 0;
  objc_msgSend(WeakRetained, "userAgentProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_2;
  v11[3] = &unk_1E5E17410;
  v13 = v14;
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "unknownBeaconsForUUIDs:completion:", MEMORY[0x1E0C9AA60], v11);

  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_3;
  block[3] = &unk_1E5E17438;
  block[4] = WeakRetained;
  block[5] = v19;
  block[6] = v14;
  dispatch_group_notify(v8, v9, block);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v19, 8);

}

void __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __73__SPOwnerSession_MaintenanceConnection__maintenanceConnectionUpdateBlock__block_invoke_3(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void (**v4)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "maintainedBeaconsChangedBlock");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  objc_msgSend(*(id *)(a1 + 32), "maintainedUnknownBeaconsChangedBlock");
  v4 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

- (void)startUpdatingMaintenanceConnection
{
  void *v3;
  id v4;
  _QWORD activity_block[4];
  id v6;

  -[SPOwnerSession maintenanceConnectionUpdateBlock](self, "maintenanceConnectionUpdateBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPOwnerSession registerDarwinNotificationName:block:](self, "registerDarwinNotificationName:block:", CFSTR("com.apple.nanoregistry.watchdidbecomeactive"), v3);
  -[SPOwnerSession registerDarwinNotificationName:block:](self, "registerDarwinNotificationName:block:", CFSTR("com.apple.mobile.keybagd.first_unlock"), v3);
  -[SPOwnerSession registerDarwinNotificationName:block:](self, "registerDarwinNotificationName:block:", CFSTR("SPMaintenancePolicyChangedNotification"), v3);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __75__SPOwnerSession_MaintenanceConnection__startUpdatingMaintenanceConnection__block_invoke;
  activity_block[3] = &unk_1E5E17460;
  v6 = v3;
  v4 = v3;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling initial maintenanceConnectionUpdateBlock", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __75__SPOwnerSession_MaintenanceConnection__startUpdatingMaintenanceConnection__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startRefreshingPersistentConnectionWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke;
  v6[3] = &unk_1E5E16720;
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  -[SPOwnerSession registerDarwinNotificationName:block:](self, "registerDarwinNotificationName:block:", CFSTR("com.apple.icloud.searchparty.PersistentConnectionChanged"), v6);

  objc_destroyWeak(&location);
}

void __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke_2;
  v3[3] = &unk_1E5E17228;
  v1 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v2 = v1;
  objc_msgSend(v2, "beaconsToMaintainPersistentConnection:", v3);

}

void __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke_3;
  v7[3] = &unk_1E5E17278;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __85__SPOwnerSession_PersistentConnection__startRefreshingPersistentConnectionWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)beaconsToMaintainPersistentConnection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SPOwnerSession_PersistentConnection__beaconsToMaintainPersistentConnection___block_invoke;
  block[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __78__SPOwnerSession_PersistentConnection__beaconsToMaintainPersistentConnection___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconsToMaintainPersistentConnection:", *(_QWORD *)(a1 + 32));

}

- (void)stopRefreshingPersistentConnection
{
  -[SPOwnerSession unregisterDarwinNotificationName:](self, "unregisterDarwinNotificationName:", CFSTR("com.apple.icloud.searchparty.PersistentConnectionChanged"));
}

- (void)locationsForBeacons:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SPOwnerSession *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SPOwnerSession_locationsForBeacons_completion___block_invoke;
  block[3] = &unk_1E5E17858;
  v12 = v6;
  v9 = v6;
  objc_copyWeak(&v15, &location);
  v13 = self;
  v14 = v7;
  v10 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __49__SPOwnerSession_locationsForBeacons_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  objc_msgSend(*(id *)(a1 + 32), "fm_map:", &__block_literal_global_11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fetchLimit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "locationSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__SPOwnerSession_locationsForBeacons_completion___block_invoke_3;
  v10[3] = &unk_1E5E17830;
  v8 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v2;
  v12 = v8;
  v9 = v2;
  objc_msgSend(v5, "latestLocationsForIdentifiers:fetchLimit:sources:completion:", v3, v6, v7, v10);

}

uint64_t __49__SPOwnerSession_locationsForBeacons_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __49__SPOwnerSession_locationsForBeacons_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SPOwnerSession_locationsForBeacons_completion___block_invoke_4;
  block[3] = &unk_1E5E16D08;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_sync(v4, block);

}

void __49__SPOwnerSession_locationsForBeacons_completion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setFetchLimit:", *(_QWORD *)(a1 + 40));
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchLimit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: fetchLimit set to %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setLocationCache:", *(_QWORD *)(a1 + 48));
  LogCategory_OwnerSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 48);
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: updated location cache: %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "locationCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

- (id)_enforceRateLimit
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[SPOwnerSession queueSynchronizer](self, "queueSynchronizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SPOwnerSession__enforceRateLimit__block_invoke;
  v6[3] = &unk_1E5E17398;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "conditionalSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__SPOwnerSession__enforceRateLimit__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tokenBucket");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "operationAllowed");

  if ((v3 & 1) == 0)
  {
    v13[0] = CFSTR("delay");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "tokenBucket");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalUntilOperationAllowed");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = CFSTR("stats");
    v14[0] = v6;
    objc_msgSend(*(id *)(a1 + 32), "tokenBucket");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dumpStatistics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain"), 20, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (void)locationForContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SPOwnerSession locationFetch](self, "locationFetch");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationForContext:completion:", v7, v6);

}

- (void)unsubscribeLocationUpdatesWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPOwnerSession locationFetch](self, "locationFetch");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsubscribeLocationUpdatesWithCompletion:", v4);

}

- (void)setDeviceEventUpdateBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPOwnerSession locationFetch](self, "locationFetch");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceEventUpdateBlock:", v4);

}

- (void)setInvalidationBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPOwnerSession locationFetch](self, "locationFetch");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvalidationBlock:", v4);

}

- (void)setConnectionExpiryDispatchTimerWithInterval:(double)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  double v10;
  dispatch_time_t v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_source_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SPOwnerSession connectionExpiryDispatchTimer](self, "connectionExpiryDispatchTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPOwnerSession connectionExpiryDispatchTimer](self, "connectionExpiryDispatchTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v7);

    -[SPOwnerSession setConnectionExpiryDispatchTimer:](self, "setConnectionExpiryDispatchTimer:", 0);
  }
  if ((a3 < 0.0 || ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
    && (unint64_t)(*(_QWORD *)&a3 - 1) > 0xFFFFFFFFFFFFELL)
  {
    v12 = -1;
    v11 = -1;
  }
  else
  {
    v10 = a3 * 1000000000.0;
    v11 = dispatch_walltime(0, (uint64_t)v10);
    v12 = (unint64_t)((double)(uint64_t)v10 * 0.02);
  }
  -[SPOwnerSession queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v13);
  -[SPOwnerSession setConnectionExpiryDispatchTimer:](self, "setConnectionExpiryDispatchTimer:", v14);

  -[SPOwnerSession connectionExpiryDispatchTimer](self, "connectionExpiryDispatchTimer");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v15, v11, 0xFFFFFFFFFFFFFFFFLL, v12);

  objc_initWeak(&location, self);
  -[SPOwnerSession connectionExpiryDispatchTimer](self, "connectionExpiryDispatchTimer");
  v16 = objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __63__SPOwnerSession_setConnectionExpiryDispatchTimerWithInterval___block_invoke;
  v21 = &unk_1E5E16B08;
  objc_copyWeak(&v22, &location);
  dispatch_source_set_event_handler(v16, &v18);

  -[SPOwnerSession connectionExpiryDispatchTimer](self, "connectionExpiryDispatchTimer", v18, v19, v20, v21);
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __63__SPOwnerSession_setConnectionExpiryDispatchTimerWithInterval___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession connection expiry dispatch timer fired", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionExpiryTimerFired");

}

- (void)connectionExpiryTimerFired
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id buf[2];

  LogCategory_BeaconManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconManager connectionExpiryTimerFired", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[SPOwnerSession queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SPOwnerSession_connectionExpiryTimerFired__block_invoke;
  block[3] = &unk_1E5E16B08;
  objc_copyWeak(&v6, buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __44__SPOwnerSession_connectionExpiryTimerFired__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAllBeacons");

}

- (void)updateConnectionExpiryDispatchTimerWithBeacons:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t v18[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  LogCategory_BeaconManager();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPBeaconManager considering update for connection expiry timer", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v13 = buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__SPOwnerSession_updateConnectionExpiryDispatchTimerWithBeacons___block_invoke;
  v11[3] = &unk_1E5E17880;
  v11[4] = buf;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
  if (*((_QWORD *)v13 + 5))
  {
    LogCategory_BeaconManager();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *((_QWORD *)v13 + 5);
      *(_DWORD *)v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "SPBeaconManager updating connection expiry timer with fire date %@", v18, 0xCu);
    }

    objc_msgSend(*((id *)v13 + 5), "timeIntervalSinceNow");
    if (v9 < 1.0)
      v9 = 1.0;
    -[SPOwnerSession setConnectionExpiryDispatchTimerWithInterval:](self, "setConnectionExpiryDispatchTimerWithInterval:", v9);
  }
  else
  {
    LogCategory_BeaconManager();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1AEA79000, v10, OS_LOG_TYPE_DEFAULT, "SPBeaconManager not updating connection expiry timer, there are no expiring beacons.", v18, 2u);
    }

  }
  _Block_object_dispose(buf, 8);

}

void __65__SPOwnerSession_updateConnectionExpiryDispatchTimerWithBeacons___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "connectedStateExpiryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v4 + 40);
    v5 = (id *)(v4 + 40);
    v6 = v7;
    if (!v7)
    {
LABEL_5:
      objc_storeStrong(v5, v3);
      goto LABEL_6;
    }
    objc_msgSend(v6, "timeIntervalSinceDate:", v3);
    if (v8 > 0.0)
    {
      v5 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)rawSearchResultsForBeacon:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SPOwnerSession_rawSearchResultsForBeacon_dateInterval_completion___block_invoke;
  block[3] = &unk_1E5E178A8;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __68__SPOwnerSession_rawSearchResultsForBeacon_dateInterval_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawSearchResultsForIdentifier:dateInterval:completion:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)beaconForUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  SPOwnerSession *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __43__SPOwnerSession_beaconForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D58;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: beaconForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __43__SPOwnerSession_beaconForUUID_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    LogCategory_BeaconManager();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SPOwnerSession beaconForUUID:completion:]_block_invoke";
      _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: SPI: %s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, a1[5]);
    objc_msgSend(a1[5], "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SPOwnerSession_beaconForUUID_completion___block_invoke_252;
    block[3] = &unk_1E5E16748;
    objc_copyWeak(&v8, (id *)buf);
    v6 = a1[4];
    v7 = a1[6];
    dispatch_async(v3, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    LogCategory_OwnerSession();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __43__SPOwnerSession_beaconForUUID_completion___block_invoke_cold_1();

    (*((void (**)(void))a1[6] + 2))();
  }
}

void __43__SPOwnerSession_beaconForUUID_completion___block_invoke_252(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconForUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)forceDistributeKeysWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SPOwnerSession_forceDistributeKeysWithCompletion___block_invoke;
  block[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __52__SPOwnerSession_forceDistributeKeysWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceDistributeKeysWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)forceUpdateKeyMapsForUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__SPOwnerSession_forceUpdateKeyMapsForUUID_completion___block_invoke;
  v11[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__SPOwnerSession_forceUpdateKeyMapsForUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUpdateKeyMapsForUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)forceUpdateKeyAlignmentRecordForUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__SPOwnerSession_forceUpdateKeyAlignmentRecordForUUID_completion___block_invoke;
  v11[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __66__SPOwnerSession_forceUpdateKeyAlignmentRecordForUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceUpdateKeyAlignmentRecordForUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)beaconForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  SPOwnerSession *v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke;
  activity_block[3] = &unk_1E5E178D0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  objc_copyWeak(&v14, &location);
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling beaconForIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke(id *a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  LogCategory_OwnerSession();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[SPOwnerSession beaconForIdentifier:completion:]_block_invoke";
      _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: SPI: %s", buf, 0xCu);
    }

    objc_msgSend(a1[5], "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke_253;
    block[3] = &unk_1E5E16748;
    objc_copyWeak(&v11, a1 + 7);
    v9 = a1[4];
    v10 = a1[6];
    dispatch_async(v5, block);

    objc_destroyWeak(&v11);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke_cold_1();

    v6 = (void (**)(id, _QWORD, void *))a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain"), 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);

  }
}

void __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke_253(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconForIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)beaconGroupForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  SPOwnerSession *v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke;
  activity_block[3] = &unk_1E5E178D0;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  objc_copyWeak(&v14, &location);
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling beaconGroupForIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke(id *a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  LogCategory_OwnerSession();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[SPOwnerSession beaconGroupForIdentifier:completion:]_block_invoke";
      _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: SPI: %s", buf, 0xCu);
    }

    objc_msgSend(a1[5], "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke_254;
    block[3] = &unk_1E5E16748;
    objc_copyWeak(&v11, a1 + 7);
    v9 = a1[4];
    v10 = a1[6];
    dispatch_async(v5, block);

    objc_destroyWeak(&v11);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke_cold_1();

    v6 = (void (**)(id, _QWORD, void *))a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain"), 17, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);

  }
}

void __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke_254(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconGroupForIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)standaloneBeaconsForUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__SPOwnerSession_standaloneBeaconsForUUIDs_completion___block_invoke;
  v11[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__SPOwnerSession_standaloneBeaconsForUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "standaloneBeaconsForUUIDs:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)beaconingIdentifierForMACAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__SPOwnerSession_beaconingIdentifierForMACAddress_completion___block_invoke;
  v11[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __62__SPOwnerSession_beaconingIdentifierForMACAddress_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconingIdentifierForMACAddress:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)fetchFindMyNetworkStatusForMACAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_OwnerSession();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: fetchFindMyNetworkStatusForMACAddress: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SPOwnerSession_fetchFindMyNetworkStatusForMACAddress_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __67__SPOwnerSession_fetchFindMyNetworkStatusForMACAddress_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchFindMyNetworkStatusForMACAddress:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setFindMyNetworkStatusForMACAddress:(id)a3 status:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  BOOL v18;
  id buf;
  __int16 v20;
  id v21;
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  LogCategory_OwnerSession();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = v6;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1AEA79000, v10, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: setFindMyNetworkStatus: %d for MACAddress: %@", (uint8_t *)&buf, 0x12u);
  }

  objc_initWeak(&buf, self);
  -[SPOwnerSession queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__SPOwnerSession_setFindMyNetworkStatusForMACAddress_status_completion___block_invoke;
  v14[3] = &unk_1E5E17538;
  objc_copyWeak(&v17, &buf);
  v18 = v6;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&buf);
}

void __72__SPOwnerSession_setFindMyNetworkStatusForMACAddress_status_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFindMyNetworkStatusForMACAddress:status:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)connectUsingMACAddress:(id)a3 longTermKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SPOwnerSession_connectUsingMACAddress_longTermKey_completion___block_invoke;
  block[3] = &unk_1E5E178A8;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __64__SPOwnerSession_connectUsingMACAddress_longTermKey_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectUsingMACAddress:longTermKey:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)disconnectFromMACAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__SPOwnerSession_disconnectFromMACAddress_completion___block_invoke;
  v11[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __54__SPOwnerSession_disconnectFromMACAddress_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnectFromMACAddress:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)simulateAccessoryPairing:(id)a3 name:(id)a4 isAirPods:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__SPOwnerSession_simulateAccessoryPairing_name_isAirPods_completion___block_invoke;
  v17[3] = &unk_1E5E178F8;
  objc_copyWeak(&v21, &location);
  v18 = v10;
  v19 = v11;
  v22 = a5;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __69__SPOwnerSession_simulateAccessoryPairing_name_isAirPods_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simulateAccessoryPairing:name:isAirPods:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

- (void)forceKeySyncForBeaconUUID:(id)a3 lastObservationDate:(id)a4 lastObservationIndex:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__SPOwnerSession_forceKeySyncForBeaconUUID_lastObservationDate_lastObservationIndex_completion___block_invoke;
  v17[3] = &unk_1E5E17920;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v21[1] = (id)a5;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __96__SPOwnerSession_forceKeySyncForBeaconUUID_lastObservationDate_lastObservationIndex_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceKeySyncForBeaconUUID:lastObservationDate:lastObservationIndex:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

- (void)fakeClassicPairingWithMACAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__SPOwnerSession_fakeClassicPairingWithMACAddress_completion___block_invoke;
  v11[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __62__SPOwnerSession_fakeClassicPairingWithMACAddress_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fakeClassicPairingWithMACAddress:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)forceRePairingWithUUID:(id)a3 partIds:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SPOwnerSession_forceRePairingWithUUID_partIds_completion___block_invoke;
  block[3] = &unk_1E5E178A8;
  objc_copyWeak(&v19, &location);
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __60__SPOwnerSession_forceRePairingWithUUID_partIds_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceRePairingWithUUID:partIds:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)executeCommand:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  SPOwnerSession *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_OwnerSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: executeCommand: %@", buf, 0xCu);
  }

  -[SPOwnerSession startRefreshing](self, "startRefreshing");
  v6 = objc_alloc_init(MEMORY[0x1E0D201F8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __33__SPOwnerSession_executeCommand___block_invoke;
  v17 = &unk_1E5E17948;
  v18 = v4;
  v8 = v6;
  v19 = v8;
  v20 = self;
  v21 = v7;
  v9 = v7;
  v10 = v4;
  v11 = _Block_copy(&v14);
  -[SPOwnerSession executeCommand:completion:](self, "executeCommand:completion:", v10, v11, v14, v15, v16, v17);
  v12 = v8;

  return v12;
}

void __33__SPOwnerSession_executeCommand___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_OwnerSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: commandCompletion: %@", buf, 0xCu);
  }

  if (v3)
  {
    LogCategory_OwnerSession();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v3;
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Command: %@ finishing with error %@", buf, 0x16u);

    }
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __33__SPOwnerSession_executeCommand___block_invoke_256;
    v21[3] = &unk_1E5E16818;
    v22 = *(id *)(a1 + 40);
    v23 = v3;
    dispatch_async(v9, v21);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "taskName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LogCategory_OwnerSession();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "taskName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v14;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_1AEA79000, v11, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Command: %@ finishing with task: %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 48), "finishBeaconGroupFuture:command:commandIssueDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    }
    else
    {
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "UUIDString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v17;
        _os_log_impl(&dword_1AEA79000, v11, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Command: %@ finishing with no task.", buf, 0xCu);

      }
      v19 = *(_QWORD *)(a1 + 40);
      v18 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "beaconIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "finishBeaconFuture:beaconUUID:", v19, v20);

    }
  }

}

uint64_t __33__SPOwnerSession_executeCommand___block_invoke_256(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

- (void)finishBeaconGroupFuture:(id)a3 command:(id)a4 commandIssueDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SPOwnerSession *v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v9, "beaconIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke;
  v18[3] = &unk_1E5E17998;
  v19 = v9;
  v20 = v8;
  v21 = self;
  v22 = v13;
  v23 = v10;
  v14 = v10;
  v15 = v13;
  v16 = v8;
  v17 = v9;
  -[SPOwnerSession beaconGroupsForUUIDs:completion:](self, "beaconGroupsForUUIDs:completion:", v15, v18);

}

void __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "count"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "beaconIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIdentifier:", v4);

    LogCategory_OwnerSession();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "beaconIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: finishBeaconGroupFuture: GroupUUID: %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v3);
  }
  else
  {
    v7 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke_258;
    v11[3] = &unk_1E5E17970;
    v12 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v13 = v9;
    v14 = v10;
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v7, "unknownBeaconsForUUIDs:completion:", v8, v11);

    v3 = v12;
  }

}

void __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke_258(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "count"))
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "beaconIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIdentifier:", v4);

    LogCategory_OwnerSession();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "beaconIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: finish future with unknown beacon: %@", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v3);
  }
  else
  {
    LogCategory_OwnerSession();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke_258_cold_1();

    v9 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "beaconIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "taskName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addBeaconChangedListener:beaconUUID:taskName:commandIdentifier:commandIssueDate:", v9, v3, v10, v11, *(_QWORD *)(a1 + 56));

  }
}

- (void)finishBeaconFuture:(id)a3 beaconUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke;
  v10[3] = &unk_1E5E179E8;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[SPOwnerSession allBeaconsWithCompletion:](self, "allBeaconsWithCompletion:", v10);

}

void __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke_2;
  v9[3] = &unk_1E5E179C0;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fm_firstObjectPassingTest:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_OwnerSession();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: finishBeaconFuture: BeaconUUID: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v4);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain"), 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v8);

  }
}

uint64_t __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)addBeaconChangedListener:(id)a3 beaconUUID:(id)a4 taskName:(id)a5 commandIdentifier:(id)a6 commandIssueDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;
  _QWORD block[4];
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  id v42;
  _QWORD aBlock[4];
  id v44;
  id v45;
  SPOwnerSession *v46;
  id v47;
  id v48;
  id v49;
  id v50;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[SPOwnerSession queue](self, "queue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke;
  aBlock[3] = &unk_1E5E17A10;
  v19 = v17;
  v44 = v19;
  v20 = v15;
  v45 = v20;
  v46 = self;
  v33 = v13;
  v47 = v33;
  v21 = v14;
  v48 = v21;
  v22 = v16;
  v49 = v22;
  v23 = v12;
  v50 = v23;
  v24 = _Block_copy(aBlock);
  v25 = SPOwnerBeaconsChangedLocalNotification;
  -[SPOwnerSession notificationQueue](self, "notificationQueue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v18;
  v40[1] = 3221225472;
  v40[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_2;
  v40[3] = &unk_1E5E17A38;
  v27 = v19;
  v41 = v27;
  v28 = v24;
  v42 = v28;
  objc_msgSend(v23, "fm_addNotificationBlockObserverForName:object:queue:usingBlock:", v25, v23, v26, v40);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = v18;
  block[1] = 3221225472;
  block[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_4;
  block[3] = &unk_1E5E17460;
  v30 = v28;
  v39 = v30;
  dispatch_async(v27, block);
  objc_initWeak(&location, v23);
  v34[0] = v18;
  v34[1] = 3221225472;
  v34[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_5;
  v34[3] = &unk_1E5E17A60;
  objc_copyWeak(&v36, &location);
  v31 = v29;
  v35 = v31;
  v32 = (id)objc_msgSend(v23, "addCompletionBlock:", v34);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

void __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  LogCategory_OwnerSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v32 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: notifiedBeaconsChangedBlock: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 48), "allBeaconsCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_262;
  v29[3] = &unk_1E5E179C0;
  v30 = *(id *)(a1 + 56);
  objc_msgSend(v4, "fm_firstObjectPassingTest:", v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "taskInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "lastUpdated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 72), "timeIntervalSinceReferenceDate");
    if (v11 > v12)
    {

    }
    else
    {
      objc_msgSend(v8, "commandIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", *(_QWORD *)(a1 + 40));

      if (!v14)
        goto LABEL_16;
    }
    LogCategory_OwnerSession();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v32 = v20;
      v33 = 2112;
      v34 = v21;
      _os_log_impl(&dword_1AEA79000, v19, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: task completed: %@ command: %@", buf, 0x16u);

    }
    dispatch_get_global_queue(0, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_263;
    v26[3] = &unk_1E5E16818;
    v27 = *(id *)(a1 + 80);
    v28 = v6;
    dispatch_async(v22, v26);

    v18 = v27;
    goto LABEL_15;
  }
  if (v6)
  {
    LogCategory_OwnerSession();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_cold_1((uint64_t *)(a1 + 64), v15);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain"), 3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_264;
    block[3] = &unk_1E5E16818;
    v24 = *(id *)(a1 + 80);
    v25 = v16;
    v18 = v16;
    dispatch_async(v17, block);

LABEL_15:
  }
LABEL_16:

}

uint64_t __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_262(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_263(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_264(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

void __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_3;
  block[3] = &unk_1E5E17460;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "fm_removeNotificationBlockObserver:", *(_QWORD *)(a1 + 32));

}

- (void)executeCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __44__SPOwnerSession_executeCommand_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling executeCommand:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __44__SPOwnerSession_executeCommand_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__SPOwnerSession_executeCommand_completion___block_invoke_2;
  v3[3] = &unk_1E5E16748;
  objc_copyWeak(&v6, &location);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__SPOwnerSession_executeCommand_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeCommand:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)startRefreshing
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  LogCategory_OwnerSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: startRefreshing", buf, 2u);
  }

  -[SPOwnerSession queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SPOwnerSession_startRefreshing__block_invoke;
  block[3] = &unk_1E5E16668;
  block[4] = self;
  dispatch_async(v4, block);

}

void __33__SPOwnerSession_startRefreshing__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __33__SPOwnerSession_startRefreshing__block_invoke_2;
  v15[3] = &unk_1E5E16B08;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v2, "registerDarwinNotificationName:block:", CFSTR("SPBeaconsChangedNotification"), v15);
  v4 = *(void **)(a1 + 32);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __33__SPOwnerSession_startRefreshing__block_invoke_3;
  v13[3] = &unk_1E5E16B08;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "registerDarwinNotificationName:block:", CFSTR("com.apple.locationd.authorization"), v13);
  v5 = *(void **)(a1 + 32);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __33__SPOwnerSession_startRefreshing__block_invoke_4;
  v11[3] = &unk_1E5E16B08;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "registerDarwinNotificationName:block:", CFSTR("com.apple.locationd/Prefs"), v11);
  v6 = *(void **)(a1 + 32);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __33__SPOwnerSession_startRefreshing__block_invoke_5;
  v9[3] = &unk_1E5E16B08;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "registerDarwinNotificationName:block:", CFSTR("com.apple.icloud.searchparty.ServiceSettingsChanged"), v9);
  objc_msgSend(*(id *)(a1 + 32), "updateAllBeacons");
  objc_msgSend(*(id *)(a1 + 32), "_updateOwnerSessionState");
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __33__SPOwnerSession_startRefreshing__block_invoke_6;
  v8[3] = &unk_1E5E16668;
  v8[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __33__SPOwnerSession_startRefreshing__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAllBeacons");

}

void __33__SPOwnerSession_startRefreshing__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAllBeacons");

}

void __33__SPOwnerSession_startRefreshing__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAllBeacons");

}

void __33__SPOwnerSession_startRefreshing__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateOwnerSessionState");

}

uint64_t __33__SPOwnerSession_startRefreshing__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerIntentTimerFired");
}

- (void)setRegisterIntentDispatchTimerWithInterval:(double)a3
{
  NSObject *v6;
  double v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  dispatch_source_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  -[SPOwnerSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if ((a3 < 0.0 || ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE)
    && (unint64_t)(*(_QWORD *)&a3 - 1) > 0xFFFFFFFFFFFFELL)
  {
    v11 = -1;
    v10 = -1;
  }
  else
  {
    v9 = a3 * 1000000000.0;
    v10 = dispatch_walltime(0, (uint64_t)v9);
    v11 = (unint64_t)((double)(uint64_t)v9 * 0.02);
  }
  -[SPOwnerSession invalidateRegisterIntentDispatchTimer](self, "invalidateRegisterIntentDispatchTimer");
  -[SPOwnerSession queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v12);
  -[SPOwnerSession setRegisterIntentDispatchTimer:](self, "setRegisterIntentDispatchTimer:", v13);

  -[SPOwnerSession registerIntentDispatchTimer](self, "registerIntentDispatchTimer");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v14, v10, 0xFFFFFFFFFFFFFFFFLL, v11);

  objc_initWeak(&location, self);
  -[SPOwnerSession registerIntentDispatchTimer](self, "registerIntentDispatchTimer");
  v15 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __61__SPOwnerSession_setRegisterIntentDispatchTimerWithInterval___block_invoke;
  v20 = &unk_1E5E16B08;
  objc_copyWeak(&v21, &location);
  dispatch_source_set_event_handler(v15, &v17);

  -[SPOwnerSession registerIntentDispatchTimer](self, "registerIntentDispatchTimer", v17, v18, v19, v20);
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __61__SPOwnerSession_setRegisterIntentDispatchTimerWithInterval___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPOwnerSession register intent dispatch timer fired", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "registerIntentTimerFired");

}

- (void)invalidateRegisterIntentDispatchTimer
{
  NSObject *v3;
  void *v4;
  NSObject *v5;

  -[SPOwnerSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPOwnerSession registerIntentDispatchTimer](self, "registerIntentDispatchTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SPOwnerSession registerIntentDispatchTimer](self, "registerIntentDispatchTimer");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v5);

    -[SPOwnerSession setRegisterIntentDispatchTimer:](self, "setRegisterIntentDispatchTimer:", 0);
  }
}

- (void)registerIntentTimerFired
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  -[SPOwnerSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  LogCategory_BeaconManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManager registerIntentTimerFired", buf, 2u);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SPOwnerSession_registerIntentTimerFired__block_invoke;
  v5[3] = &unk_1E5E17A88;
  v5[4] = self;
  -[SPOwnerSession sendRegisterIntentWithCompletion:](self, "sendRegisterIntentWithCompletion:", v5);
}

void __42__SPOwnerSession_registerIntentTimerFired__block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  _QWORD v8[6];
  uint8_t buf[4];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  LogCategory_OwnerSession();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v10 = *(double *)&v5;
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Error scheduling intents: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      v10 = a3;
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: Successfully sent RegisterIntent message (retryInterval: %f)", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__SPOwnerSession_registerIntentTimerFired__block_invoke_267;
    v8[3] = &unk_1E5E16CB8;
    v8[4] = *(_QWORD *)(a1 + 32);
    *(double *)&v8[5] = a3;
    dispatch_async(v6, v8);
  }

}

uint64_t __42__SPOwnerSession_registerIntentTimerFired__block_invoke_267(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRegisterIntentDispatchTimerWithInterval:", *(double *)(a1 + 40));
}

- (void)startRefreshingBeacons:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SPOwnerSession *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_OwnerSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: startRefreshingBeacons: %lu", buf, 0xCu);
  }

  -[SPOwnerSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __41__SPOwnerSession_startRefreshingBeacons___block_invoke;
  v11 = &unk_1E5E16818;
  v12 = self;
  v13 = v4;
  v7 = v4;
  dispatch_async(v6, &v8);

  -[SPOwnerSession startRefreshing](self, "startRefreshing", v8, v9, v10, v11, v12);
}

void __41__SPOwnerSession_startRefreshingBeacons___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setClientObservedBeacons:", v2);

}

- (void)stopRefreshing
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[5];
  uint8_t buf[16];

  LogCategory_OwnerSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: stopRefreshing", buf, 2u);
  }

  -[SPOwnerSession queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SPOwnerSession_stopRefreshing__block_invoke;
  block[3] = &unk_1E5E16668;
  block[4] = self;
  dispatch_async(v4, block);

  -[SPOwnerSession sendUnregisterIntentWithCompletion:](self, "sendUnregisterIntentWithCompletion:", &__block_literal_global_269);
  -[SPOwnerSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __32__SPOwnerSession_stopRefreshing__block_invoke_270;
  v7[3] = &unk_1E5E16668;
  v7[4] = self;
  dispatch_sync(v6, v7);

}

uint64_t __32__SPOwnerSession_stopRefreshing__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidateRegisterIntentDispatchTimer");
  return objc_msgSend(*(id *)(a1 + 32), "set_ownerSessionState:", 0);
}

void __32__SPOwnerSession_stopRefreshing__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  LogCategory_OwnerSession();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v8 = 138412290;
      v9 = v2;
      v5 = "SPOwnerSession: Error stopping intent session: %@";
      v6 = v3;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    v5 = "SPOwnerSession: Successfully sent UnregisterIntent message";
    v6 = v3;
    v7 = 2;
    goto LABEL_6;
  }

}

uint64_t __32__SPOwnerSession_stopRefreshing__block_invoke_270(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)updateAllBeacons
{
  NSObject *v3;
  uint8_t v4[16];

  LogCategory_OwnerSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: updateAllBeacons:", v4, 2u);
  }

  -[SPOwnerSession allBeaconsWithCompletion:](self, "allBeaconsWithCompletion:", &__block_literal_global_271);
}

void __34__SPOwnerSession_updateAllBeacons__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", SPOwnerBeaconsChangedLocalNotification, 0);

}

- (void)setLocationSources:(id)a3
{
  objc_storeStrong((id *)&self->_locationSources, a3);
}

- (NSSet)allBeacons
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[SPOwnerSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__SPOwnerSession_allBeacons__block_invoke;
  v6[3] = &unk_1E5E16AE0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __28__SPOwnerSession_allBeacons__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "allBeaconsCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)allBeaconsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke;
  v8[3] = &unk_1E5E16748;
  objc_copyWeak(&v11, &location);
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  dispatch_async(v7, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "userAgentProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_2;
  v5[3] = &unk_1E5E17B10;
  v6 = a1[4];
  objc_copyWeak(&v8, v2);
  v7 = a1[5];
  objc_msgSend(v4, "allBeaconsWithCompletion:", v5);

  objc_destroyWeak(&v8);
}

void __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_3;
  v8[3] = &unk_1E5E16C70;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v5 = v3;
  v9 = v5;
  dispatch_async(v4, v8);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v6, v7);

  objc_destroyWeak(&v10);
}

void __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAllBeaconsCache:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateConnectionExpiryDispatchTimerWithBeacons:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "tagSeparationBeaconsChangedBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_4;
    v5[3] = &unk_1E5E17278;
    v5[4] = WeakRetained;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

void __43__SPOwnerSession_allBeaconsWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "beaconsToLeash");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

id __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SPApplicationBeacon *v3;
  void *v4;
  SPApplicationBeacon *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = a2;
  v3 = [SPApplicationBeacon alloc];
  objc_msgSend(v2, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SPApplicationBeacon initWithInternalSimpleBeacon:](v3, "initWithInternalSimpleBeacon:", v4);

  v6 = objc_alloc(MEMORY[0x1E0CB3830]);
  v7 = objc_msgSend(v2, "changeType");
  v8 = objc_msgSend(v2, "index");

  v9 = (void *)objc_msgSend(v6, "initWithObject:type:index:", v5, v7, v8);
  return v9;
}

void __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_6;
  block[3] = &unk_1E5E17460;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __93__SPOwnerSession_startUpdatingApplicationBeaconsWithContext_collectionDifference_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopUpdatingApplicationBeaconsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_OwnerSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SPOwnerSession stopUpdatingApplicationBeaconsWithCompletion:]";
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: SPI: %{public}s", buf, 0xCu);
  }

  -[SPOwnerSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SPOwnerSession_stopUpdatingApplicationBeaconsWithCompletion___block_invoke;
  v8[3] = &unk_1E5E16720;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __63__SPOwnerSession_stopUpdatingApplicationBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "simpleBeaconUpdateInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSimpleBeaconUpdateInterface:", 0);
    objc_msgSend(v2, "stopUpdatingSimpleBeaconsWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)unacceptedBeaconsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SPOwnerSession_unacceptedBeaconsWithCompletion___block_invoke;
  block[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__SPOwnerSession_unacceptedBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unacceptedBeaconsWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)removeBeacon:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__SPOwnerSession_removeBeacon_completion___block_invoke;
  v11[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __42__SPOwnerSession_removeBeacon_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeBeacon:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)beaconStoreStatusWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SPOwnerSession_beaconStoreStatusWithCompletion___block_invoke;
  block[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__SPOwnerSession_beaconStoreStatusWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconStoreStatusWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)waitForBeaconStoreAvailableWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SPOwnerSession_waitForBeaconStoreAvailableWithCompletion___block_invoke;
  block[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__SPOwnerSession_waitForBeaconStoreAvailableWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitForBeaconStoreAvailableWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)sendRegisterIntentWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SPOwnerSession_sendRegisterIntentWithCompletion___block_invoke;
  block[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__SPOwnerSession_sendRegisterIntentWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendRegisterIntentWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)sendUnregisterIntentWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SPOwnerSession_sendUnregisterIntentWithCompletion___block_invoke;
  block[3] = &unk_1E5E17510;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__SPOwnerSession_sendUnregisterIntentWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendUnregisterIntentWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)updateBeaconObservations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_OwnerSession();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "update beacon observations %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SPOwnerSession_updateBeaconObservations_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __54__SPOwnerSession_updateBeaconObservations_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateBeaconObservations:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)executeUTPlaySoundCommand:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_OwnerSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: executeUTPlaySoundCommand: %@", buf, 0xCu);
  }

  -[SPOwnerSession startRefreshing](self, "startRefreshing");
  v6 = objc_alloc_init(MEMORY[0x1E0D201F8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "playSoundContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E5E35EC0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke;
  v19 = &unk_1E5E17948;
  v20 = v4;
  v9 = v6;
  v21 = v9;
  v22 = v8;
  v23 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v4;
  v13 = _Block_copy(&v16);
  -[SPOwnerSession executeCommand:completion:](self, "executeCommand:completion:", v12, v13, v16, v17, v18, v19);
  v14 = v9;

  return v14;
}

void __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD block[4];
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_OwnerSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: commandCompletion: %@", buf, 0xCu);
  }

  if (v3)
  {
    LogCategory_OwnerSession();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v8;
      v26 = 2112;
      v27 = v3;
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: executeUTPlaySoundCommand: %@ finishing with error %@", buf, 0x16u);

    }
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_284;
    block[3] = &unk_1E5E16818;
    v22 = *(id *)(a1 + 40);
    v23 = v3;
    dispatch_async(v9, block);

    v10 = v22;
  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", *(_QWORD *)(a1 + 56));
    LogCategory_OwnerSession();
    v12 = objc_claimAutoreleasedReturnValue();
    v10 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v14;
        _os_log_impl(&dword_1AEA79000, v10, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: executeUTPlaySoundCommand: %@ finished.", buf, 0xCu);

      }
      v15 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "beaconIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setIdentifier:", v16);

      dispatch_get_global_queue(0, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_285;
      v18[3] = &unk_1E5E16818;
      v19 = *(id *)(a1 + 40);
      v20 = v15;
      v10 = v15;
      dispatch_async(v17, v18);

    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_cold_1(a1, (uint64_t *)(a1 + 56), v10);
    }
  }

}

uint64_t __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_284(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_285(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

- (void)updateBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4 completion:(id)a5
{
  int v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v6 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  LogCategory_OwnerSession();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v20 = v6;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1AEA79000, v10, OS_LOG_TYPE_DEFAULT, "updateBatteryStatus %d for beacon %@.", buf, 0x12u);

  }
  -[SPOwnerSession queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__SPOwnerSession_updateBatteryStatus_beaconUUID_completion___block_invoke;
  v15[3] = &unk_1E5E17768;
  v15[4] = self;
  v16 = v8;
  v18 = v6;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_async(v12, v15);

}

void __60__SPOwnerSession_updateBatteryStatus_beaconUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "batteryStatusCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = *(unsigned __int8 *)(a1 + 56);
    goto LABEL_7;
  }
  v4 = objc_msgSend(v3, "unsignedCharValue");
  v5 = *(unsigned __int8 *)(a1 + 56);
  if (v4 != (_DWORD)v5)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "_updateBatteryStatus:beaconUUID:completion:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    goto LABEL_8;
  }
  LogCategory_OwnerSession();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "updateBatteryStatus: value has not changed. Not updating.", v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPOwnerSession.ErrorDomain"), 4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_8:
}

- (void)_updateBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  char v18;
  id location;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  -[SPOwnerSession queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = objc_initWeak(&location, self);
  -[SPOwnerSession userAgentProxy](self, "userAgentProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__SPOwnerSession__updateBatteryStatus_beaconUUID_completion___block_invoke;
  v15[3] = &unk_1E5E17BF0;
  v15[4] = self;
  v18 = v6;
  v13 = v8;
  v16 = v13;
  v14 = v9;
  v17 = v14;
  objc_msgSend(v12, "updateBatteryStatus:beaconUUID:completion:", v6, v13, v15);

  objc_destroyWeak(&location);
}

void __61__SPOwnerSession__updateBatteryStatus_beaconUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __61__SPOwnerSession__updateBatteryStatus_beaconUUID_completion___block_invoke_2;
  block[3] = &unk_1E5E17BC8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v13 = *(_BYTE *)(a1 + 56);
  block[1] = 3221225472;
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_sync(v4, block);

}

uint64_t __61__SPOwnerSession__updateBatteryStatus_beaconUUID_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v7;
  uint8_t buf[2];

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    LogCategory_OwnerSession();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = "Battery status updated successfully. Saving new status to local cache.";
      v5 = buf;
      goto LABEL_7;
    }
LABEL_8:

    objc_msgSend(*(id *)(a1 + 40), "_cacheBatteryStatus:beaconUUID:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
  }
  if (objc_msgSend(v2, "code") == 4)
  {
    LogCategory_OwnerSession();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 0;
      v4 = "Battery status has NOT changed. Saving status to local cache to save an XPC call next time.";
      v5 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
}

- (void)_cacheBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;

  v4 = a3;
  v6 = a4;
  -[SPOwnerSession queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SPOwnerSession batteryStatusCache](self, "batteryStatusCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);

}

- (SPOwnerSessionState)ownerSessionState
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  -[SPOwnerSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__SPOwnerSession_ownerSessionState__block_invoke;
  v6[3] = &unk_1E5E16AE0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SPOwnerSessionState *)v4;
}

void __35__SPOwnerSession_ownerSessionState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ownerSessionState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_updateOwnerSessionState
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[SPOwnerSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SPOwnerSession__updateOwnerSessionState__block_invoke;
  block[3] = &unk_1E5E16E68;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__SPOwnerSession__updateOwnerSessionState__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "ownerSessionStateUpdatedBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "userAgentProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__SPOwnerSession__updateOwnerSessionState__block_invoke_2;
    v5[3] = &unk_1E5E17C18;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v6 = v2;
    objc_msgSend(v4, "ownerSessionStateWithCompletion:", v5);

    objc_destroyWeak(&v7);
  }

}

void __42__SPOwnerSession__updateOwnerSessionState__block_invoke_2(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SPOwnerSession__updateOwnerSessionState__block_invoke_3;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v9, a1 + 6);
  v7 = v3;
  v8 = a1[5];
  v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

void __42__SPOwnerSession__updateOwnerSessionState__block_invoke_3(id *a1)
{
  id WeakRetained;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "set_ownerSessionState:", a1[4]);
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SPOwnerSession__updateOwnerSessionState__block_invoke_4;
  v4[3] = &unk_1E5E17278;
  v6 = a1[5];
  v5 = a1[4];
  dispatch_async(v3, v4);

}

uint64_t __42__SPOwnerSession__updateOwnerSessionState__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)disableUTAppAlert:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  BOOL v13;
  id buf;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  LogCategory_OwnerSession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v4;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "disableUTAppAlert %d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SPOwnerSession_disableUTAppAlert_completion___block_invoke;
  block[3] = &unk_1E5E17588;
  objc_copyWeak(&v12, &buf);
  v13 = v4;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&buf);
}

void __47__SPOwnerSession_disableUTAppAlert_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableUTAppAlert:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)fetchUnauthorizedEncryptedPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  SPOwnerSession *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPOwnerSession_fetchUnauthorizedEncryptedPayload_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession.fetchUnauthorizedEncryptedPayload", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __63__SPOwnerSession_fetchUnauthorizedEncryptedPayload_completion___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_OwnerSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "fetchUnauthorizedEncryptedPayload %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, a1[5]);
  objc_msgSend(a1[5], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SPOwnerSession_fetchUnauthorizedEncryptedPayload_completion___block_invoke_287;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v8, (id *)buf);
  v6 = a1[4];
  v7 = a1[6];
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __63__SPOwnerSession_fetchUnauthorizedEncryptedPayload_completion___block_invoke_287(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchUnauthorizedEncryptedPayload:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)stopFetchingUnauthorizedEncryptedPayloadWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __73__SPOwnerSession_stopFetchingUnauthorizedEncryptedPayloadWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession.stopFetchingUnauthorizedEncryptedPayload", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __73__SPOwnerSession_stopFetchingUnauthorizedEncryptedPayloadWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id buf[2];

  LogCategory_OwnerSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "stopFetchingUnauthorizedEncryptedPayload", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__SPOwnerSession_stopFetchingUnauthorizedEncryptedPayloadWithCompletion___block_invoke_288;
  v4[3] = &unk_1E5E17510;
  objc_copyWeak(&v6, buf);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __73__SPOwnerSession_stopFetchingUnauthorizedEncryptedPayloadWithCompletion___block_invoke_288(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopFetchingUnauthorizedEncryptedPayloadWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  SPOwnerSession *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __80__SPOwnerSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession.peripheralConnectionMaterialForAccessoryIdentifier", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __80__SPOwnerSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_OwnerSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "peripheralConnectionMaterial for %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, a1[5]);
  objc_msgSend(a1[5], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SPOwnerSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke_289;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v8, (id *)buf);
  v6 = a1[4];
  v7 = a1[6];
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __80__SPOwnerSession_peripheralConnectionMaterialForAccessoryIdentifier_completion___block_invoke_289(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peripheralConnectionMaterialForAccessoryIdentifier:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)requestLiveLocationForUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __56__SPOwnerSession_requestLiveLocationForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession.requestLiveLocationForUUID", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __56__SPOwnerSession_requestLiveLocationForUUID_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__SPOwnerSession_requestLiveLocationForUUID_completion___block_invoke_2;
  v3[3] = &unk_1E5E16748;
  objc_copyWeak(&v6, &location);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__SPOwnerSession_requestLiveLocationForUUID_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestLiveLocationForUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)requestLiveLocationForFriend:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __58__SPOwnerSession_requestLiveLocationForFriend_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession.requestLiveLocationForFriend", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __58__SPOwnerSession_requestLiveLocationForFriend_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__SPOwnerSession_requestLiveLocationForFriend_completion___block_invoke_2;
  v3[3] = &unk_1E5E16748;
  objc_copyWeak(&v6, &location);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__SPOwnerSession_requestLiveLocationForFriend_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestLiveLocationForFriend:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)unregisterDarwinNotificationName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SPOwnerSession_unregisterDarwinNotificationName___block_invoke;
  block[3] = &unk_1E5E16818;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __51__SPOwnerSession_unregisterDarwinNotificationName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterDarwinNotificationName:", *(_QWORD *)(a1 + 40));
}

- (void)allObservationsForBeacon:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SPOwnerSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke;
  block[3] = &unk_1E5E16770;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke_2;
  v4[3] = &unk_1E5E17C40;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "allObservationsForBeacon:completion:", v3, v4);

}

void __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke_3;
  v7[3] = &unk_1E5E17278;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __54__SPOwnerSession_allObservationsForBeacon_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)hintBasedIndexSearchForBeacon:(id)a3 baseIndex:(id)a4 hint:(unsigned __int8)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unsigned __int8 v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SPOwnerSession queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke;
  block[3] = &unk_1E5E17BC8;
  block[4] = self;
  v18 = v10;
  v21 = a5;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke_2;
  v6[3] = &unk_1E5E17C68;
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "hintBasedIndexSearchForBeacon:baseIndex:hint:completion:", v3, v4, v5, v6);

}

void __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke_3;
  block[3] = &unk_1E5E16FC8;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __74__SPOwnerSession_hintBasedIndexSearchForBeacon_baseIndex_hint_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)readRawAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  BOOL v19;
  _QWORD block[4];
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[SPOwnerSession _enforceRateLimit](self, "_enforceRateLimit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke;
    block[3] = &unk_1E5E17278;
    v22 = v9;
    v21 = v10;
    v12 = v9;
    dispatch_async(v11, block);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_2;
    v15[3] = &unk_1E5E17CB8;
    v15[4] = self;
    objc_copyWeak(&v18, &location);
    v13 = v8;
    v19 = a4;
    v16 = v13;
    v17 = v9;
    v14 = v9;
    _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: readRawAISMetadataFromMACAddress:useOwnerControlPoint:completion:", OS_ACTIVITY_FLAG_DEFAULT, v15);

    objc_destroyWeak(&v18);
  }

  objc_destroyWeak(&location);
}

uint64_t __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_3;
  v3[3] = &unk_1E5E17538;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 64);
  v5 = *(id *)(a1 + 48);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
}

void __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  LogCategory_OwnerSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 141558530;
    v17 = 1752392040;
    v18 = 2112;
    v19 = v4;
    v20 = 1024;
    v21 = v5;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromMACAddress %{mask.hash}@ useOwnerControlPoint:%d called", buf, 0x1Cu);
  }

  objc_msgSend(WeakRetained, "userAgentProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = *(unsigned __int8 *)(a1 + 56);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_292;
  v12[3] = &unk_1E5E17C90;
  v13 = v7;
  v15 = *(_BYTE *)(a1 + 56);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v6, "readRawAISMetadataFromMACAddress:useOwnerControlPoint:completion:", v13, v8, v12);

  LogCategory_OwnerSession();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 141558530;
    v17 = 1752392040;
    v18 = 2112;
    v19 = v10;
    v20 = 1024;
    v21 = v11;
    _os_log_impl(&dword_1AEA79000, v9, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromMACAddress %{mask.hash}@ userOwnerControlPoint:%d", buf, 0x1Cu);
  }

}

void __83__SPOwnerSession_readRawAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_292(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  LogCategory_OwnerSession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(unsigned __int8 *)(a1 + 48);
    v10 = 141558530;
    v11 = 1752392040;
    v12 = 2112;
    v13 = v8;
    v14 = 1024;
    v15 = v9;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromMACAddress %{mask.hash}@ useOwnerControlPoint:%d completion called", (uint8_t *)&v10, 0x1Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)readAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  BOOL v19;
  _QWORD block[4];
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[SPOwnerSession _enforceRateLimit](self, "_enforceRateLimit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke;
    block[3] = &unk_1E5E17278;
    v22 = v9;
    v21 = v10;
    v12 = v9;
    dispatch_async(v11, block);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_2;
    v15[3] = &unk_1E5E17CB8;
    v15[4] = self;
    objc_copyWeak(&v18, &location);
    v13 = v8;
    v19 = a4;
    v16 = v13;
    v17 = v9;
    v14 = v9;
    _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: readAISMetadataFromMACAddress:useOwnerControlPoint:completion:", OS_ACTIVITY_FLAG_DEFAULT, v15);

    objc_destroyWeak(&v18);
  }

  objc_destroyWeak(&location);
}

uint64_t __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_3;
  v3[3] = &unk_1E5E17538;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 64);
  v5 = *(id *)(a1 + 48);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
}

void __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  LogCategory_OwnerSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 141558530;
    v17 = 1752392040;
    v18 = 2112;
    v19 = v4;
    v20 = 1024;
    v21 = v5;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromMACAddress %{mask.hash}@ useOwnerControlPoint:%d called", buf, 0x1Cu);
  }

  objc_msgSend(WeakRetained, "userAgentProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = *(unsigned __int8 *)(a1 + 56);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_294;
  v12[3] = &unk_1E5E17CE0;
  v13 = v7;
  v15 = *(_BYTE *)(a1 + 56);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v6, "readAISMetadataFromMACAddress:useOwnerControlPoint:completion:", v13, v8, v12);

  LogCategory_OwnerSession();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 141558530;
    v17 = 1752392040;
    v18 = 2112;
    v19 = v10;
    v20 = 1024;
    v21 = v11;
    _os_log_impl(&dword_1AEA79000, v9, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromMACAddress %{mask.hash}@ userOwnerControlPoint:%d", buf, 0x1Cu);
  }

}

void __80__SPOwnerSession_readAISMetadataFromMACAddress_useOwnerControlPoint_completion___block_invoke_294(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  LogCategory_OwnerSession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(unsigned __int8 *)(a1 + 48);
    v10 = 141558530;
    v11 = 1752392040;
    v12 = 2112;
    v13 = v8;
    v14 = 1024;
    v15 = v9;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromMACAddress %{mask.hash}@ useOwnerControlPoint:%d completion called", (uint8_t *)&v10, 0x1Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)readRawAISMetadataFromBeaconIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession _enforceRateLimit](self, "_enforceRateLimit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke;
    block[3] = &unk_1E5E17278;
    v18 = v7;
    v17 = v8;
    v10 = v7;
    dispatch_async(v9, block);

  }
  else
  {
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_2;
    activity_block[3] = &unk_1E5E17858;
    activity_block[4] = self;
    objc_copyWeak(&v15, &location);
    v13 = v6;
    v14 = v7;
    v11 = v7;
    _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: readRawAISMetadataFromBeaconIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    objc_destroyWeak(&v15);
  }

  objc_destroyWeak(&location);
}

uint64_t __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_2(id *a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v6, a1 + 7);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  LogCategory_OwnerSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromBeaconIdentifier %{mask}@ called", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "userAgentProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_296;
  v7[3] = &unk_1E5E17D08;
  v8 = v6;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v5, "readRawAISMetadataForIdentifier:completion:", v8, v7);

}

void __68__SPOwnerSession_readRawAISMetadataFromBeaconIdentifier_completion___block_invoke_296(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  LogCategory_OwnerSession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = 141558274;
    v12 = 1752392040;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromBeaconIdentifier %{mask.hash}@ completion called", (uint8_t *)&v11, 0x16u);
  }

  LogCategory_OwnerSession();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 141558274;
    v12 = 1752392040;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1AEA79000, v9, OS_LOG_TYPE_DEFAULT, "readRawAISMetadataFromBeaconIdentifier %{mask.hash}@ completion called", (uint8_t *)&v11, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)readAISMetadataFromBeaconIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPOwnerSession _enforceRateLimit](self, "_enforceRateLimit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke;
    block[3] = &unk_1E5E17278;
    v18 = v7;
    v17 = v8;
    v10 = v7;
    dispatch_async(v9, block);

  }
  else
  {
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_2;
    activity_block[3] = &unk_1E5E17858;
    activity_block[4] = self;
    objc_copyWeak(&v15, &location);
    v13 = v6;
    v14 = v7;
    v11 = v7;
    _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: readAISMetadataFromBeaconIdentifier:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    objc_destroyWeak(&v15);
  }

  objc_destroyWeak(&location);
}

uint64_t __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_2(id *a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v6, a1 + 7);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  LogCategory_OwnerSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromBeaconIdentifier %{mask}@ called", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "userAgentProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_297;
  v7[3] = &unk_1E5E17D30;
  v8 = v6;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v5, "readAISMetadataForIdentifier:completion:", v8, v7);

}

void __65__SPOwnerSession_readAISMetadataFromBeaconIdentifier_completion___block_invoke_297(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  LogCategory_OwnerSession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = 141558274;
    v12 = 1752392040;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromBeaconIdentifier %{mask.hash}@ completion called", (uint8_t *)&v11, 0x16u);
  }

  LogCategory_OwnerSession();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 141558274;
    v12 = 1752392040;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1AEA79000, v9, OS_LOG_TYPE_DEFAULT, "readAISMetadataFromBeaconIdentifier %{mask.hash}@ completion called", (uint8_t *)&v11, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)beaconAddedBlock
{
  return self->beaconAddedBlock;
}

- (void)setBeaconAddedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)beaconRemovedBlock
{
  return self->beaconRemovedBlock;
}

- (void)setBeaconRemovedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)beaconsChangedBlock
{
  return self->beaconsChangedBlock;
}

- (void)setBeaconsChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)latestLocationsUpdatedBlock
{
  return self->latestLocationsUpdatedBlock;
}

- (void)setLatestLocationsUpdatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)ownerSessionStateUpdatedBlock
{
  return self->ownerSessionStateUpdatedBlock;
}

- (void)setOwnerSessionStateUpdatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)locationSources
{
  return self->_locationSources;
}

- (id)maintainedBeaconsChangedBlock
{
  return self->maintainedBeaconsChangedBlock;
}

- (void)setMaintainedBeaconsChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)maintainedUnknownBeaconsChangedBlock
{
  return self->maintainedUnknownBeaconsChangedBlock;
}

- (void)setMaintainedUnknownBeaconsChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (void)setUserAgentProxy:(id)a3
{
  objc_storeStrong((id *)&self->_userAgentProxy, a3);
}

- (NSSet)allBeaconsCache
{
  return self->_allBeaconsCache;
}

- (void)setAllBeaconsCache:(id)a3
{
  objc_storeStrong((id *)&self->_allBeaconsCache, a3);
}

- (NSSet)clientObservedBeacons
{
  return self->_clientObservedBeacons;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (FMQueueSynchronizer)queueSynchronizer
{
  return self->_queueSynchronizer;
}

- (void)setQueueSynchronizer:(id)a3
{
  objc_storeStrong((id *)&self->_queueSynchronizer, a3);
}

- (NSOperationQueue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (id)tagSeparationBeaconsChangedBlock
{
  return self->_tagSeparationBeaconsChangedBlock;
}

- (void)setTagSeparationBeaconsChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDictionary)locationCache
{
  return self->_locationCache;
}

- (void)setLocationCache:(id)a3
{
  objc_storeStrong((id *)&self->_locationCache, a3);
}

- (NSDate)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSMutableDictionary)batteryStatusCache
{
  return self->_batteryStatusCache;
}

- (void)setBatteryStatusCache:(id)a3
{
  objc_storeStrong((id *)&self->_batteryStatusCache, a3);
}

- (OS_dispatch_source)registerIntentDispatchTimer
{
  return self->_registerIntentDispatchTimer;
}

- (void)setRegisterIntentDispatchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_registerIntentDispatchTimer, a3);
}

- (FMTokenBucket)tokenBucket
{
  return self->_tokenBucket;
}

- (void)setTokenBucket:(id)a3
{
  objc_storeStrong((id *)&self->_tokenBucket, a3);
}

- (SPOwnerSessionState)_ownerSessionState
{
  return self->__ownerSessionState;
}

- (void)set_ownerSessionState:(id)a3
{
  objc_storeStrong((id *)&self->__ownerSessionState, a3);
}

- (void)setDarwinHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_darwinHandlers, a3);
}

- (void)setLocationFetch:(id)a3
{
  objc_storeStrong((id *)&self->_locationFetch, a3);
}

- (void)didDetectUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_BeaconManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SPOwnerSession(TrackingAvoidance) didDetectUnauthorizedTrackingWithCompletion:completion:]";
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__SPOwnerSession_TrackingAvoidance__didDetectUnauthorizedTrackingWithCompletion_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __92__SPOwnerSession_TrackingAvoidance__didDetectUnauthorizedTrackingWithCompletion_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDetectUnauthorizedTrackingWithCompletion:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didUpdateUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_BeaconManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SPOwnerSession(TrackingAvoidance) didUpdateUnauthorizedTrackingWithCompletion:completion:]";
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__SPOwnerSession_TrackingAvoidance__didUpdateUnauthorizedTrackingWithCompletion_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __92__SPOwnerSession_TrackingAvoidance__didUpdateUnauthorizedTrackingWithCompletion_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didUpdateUnauthorizedTrackingWithCompletion:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didWithdrawUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_BeaconManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SPOwnerSession(TrackingAvoidance) didWithdrawUnauthorizedTrackingWithCompletion:completion:]";
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__SPOwnerSession_TrackingAvoidance__didWithdrawUnauthorizedTrackingWithCompletion_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __94__SPOwnerSession_TrackingAvoidance__didWithdrawUnauthorizedTrackingWithCompletion_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didWithdrawUnauthorizedTrackingWithCompletion:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)ignoringUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_BeaconManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SPOwnerSession(TrackingAvoidance) ignoringUnauthorizedTrackingWithCompletion:completion:]";
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__SPOwnerSession_TrackingAvoidance__ignoringUnauthorizedTrackingWithCompletion_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __91__SPOwnerSession_TrackingAvoidance__ignoringUnauthorizedTrackingWithCompletion_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ignoringUnauthorizedTrackingWithCompletion:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)unauthorizedTrackingTypeWithCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_BeaconManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SPOwnerSession(TrackingAvoidance) unauthorizedTrackingTypeWithCompletion:completion:]";
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__SPOwnerSession_TrackingAvoidance__unauthorizedTrackingTypeWithCompletion_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __87__SPOwnerSession_TrackingAvoidance__unauthorizedTrackingTypeWithCompletion_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unauthorizedTrackingTypeWithCompletion:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)playUnauthorizedSoundOnBeaconByUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_BeaconManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SPOwnerSession(TrackingAvoidance) playUnauthorizedSoundOnBeaconByUUID:completion:]";
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SPOwnerSession_TrackingAvoidance__playUnauthorizedSoundOnBeaconByUUID_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __84__SPOwnerSession_TrackingAvoidance__playUnauthorizedSoundOnBeaconByUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playUnauthorizedSoundOnBeaconUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)ignoreBeaconByUUID:(id)a3 until:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13[2];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  LogCategory_OwnerSession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "received ignore beacon for %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_until___block_invoke;
  block[3] = &unk_1E5E17E30;
  objc_copyWeak(v13, (id *)buf);
  v12 = v6;
  v13[1] = (id)a4;
  v10 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(v13);
  objc_destroyWeak((id *)buf);
}

void __62__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_until___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ignoreBeaconByUUID:until:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)ignoreBeaconByUUID:(id)a3 until:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  LogCategory_OwnerSession();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v11;
    _os_log_impl(&dword_1AEA79000, v10, OS_LOG_TYPE_DEFAULT, "received ignore beacon for %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_until_completion___block_invoke;
  v15[3] = &unk_1E5E17E58;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a4;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_async(v12, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

void __73__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_until_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ignoreTrackingForUUID:until:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)ignoreBeaconByUUID:(id)a3 untilDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  LogCategory_OwnerSession();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v12;
    _os_log_impl(&dword_1AEA79000, v11, OS_LOG_TYPE_DEFAULT, "received ignore beacon for %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_untilDate_completion___block_invoke;
  v17[3] = &unk_1E5E178A8;
  objc_copyWeak(&v21, (id *)buf);
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v13, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

void __77__SPOwnerSession_TrackingAvoidance__ignoreBeaconByUUID_untilDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ignoreBeaconByUUID:untilDate:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)ignoreBeaconByAdvertisement:(id)a3 until:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19[2];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  LogCategory_OwnerSession();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fm_hexString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v12;
    _os_log_impl(&dword_1AEA79000, v10, OS_LOG_TYPE_DEFAULT, "received ignore beacon for %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__SPOwnerSession_TrackingAvoidance__ignoreBeaconByAdvertisement_until_completion___block_invoke;
  v16[3] = &unk_1E5E17E58;
  objc_copyWeak(v19, (id *)buf);
  v19[1] = (id)a4;
  v17 = v8;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  dispatch_async(v13, v16);

  objc_destroyWeak(v19);
  objc_destroyWeak((id *)buf);
}

void __82__SPOwnerSession_TrackingAvoidance__ignoreBeaconByAdvertisement_until_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ignoreTrackingFor:until:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)acceptUTForBeaconUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_OwnerSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "received accept UT event for beacon %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SPOwnerSession_TrackingAvoidance__acceptUTForBeaconUUID___block_invoke;
  v9[3] = &unk_1E5E16C70;
  objc_copyWeak(&v11, (id *)buf);
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __59__SPOwnerSession_TrackingAvoidance__acceptUTForBeaconUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptUTForBeaconUUID:", *(_QWORD *)(a1 + 32));

}

- (void)didObserveUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  LogCategory_BeaconManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SPOwnerSession(TrackingAvoidance) didObserveUnauthorizedTrackingWithCompletion:completion:]";
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__SPOwnerSession_TrackingAvoidance__didObserveUnauthorizedTrackingWithCompletion_completion___block_invoke;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v15, (id *)buf);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __93__SPOwnerSession_TrackingAvoidance__didObserveUnauthorizedTrackingWithCompletion_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didObserveUnauthorizedTrackingWithCompletion:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)publishWildModeRecordsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_BeaconManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SPOwnerSession(TrackingAvoidance) publishWildModeRecordsWithCompletion:]";
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPOwnerSession: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPOwnerSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SPOwnerSession_TrackingAvoidance__publishWildModeRecordsWithCompletion___block_invoke;
  v8[3] = &unk_1E5E17510;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __74__SPOwnerSession_TrackingAvoidance__publishWildModeRecordsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishWildModeRecordsWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)startRefreshingTagSeparationWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SPOwnerSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SPOwnerSession_TagSeparation__startRefreshingTagSeparationWithBlock___block_invoke;
  v7[3] = &unk_1E5E16720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __71__SPOwnerSession_TagSeparation__startRefreshingTagSeparationWithBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setTagSeparationBeaconsChangedBlock:", *(_QWORD *)(a1 + 40));
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SPOwnerSession_TagSeparation__startRefreshingTagSeparationWithBlock___block_invoke_2;
  block[3] = &unk_1E5E16668;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __71__SPOwnerSession_TagSeparation__startRefreshingTagSeparationWithBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startRefreshing");
}

- (void)tagSeparationStateChanged:(id)a3 beaconUUID:(id)a4 completion:(id)a5
{
  -[SPOwnerSession tagSeparationStateChanged:beaconUUID:location:completion:](self, "tagSeparationStateChanged:beaconUUID:location:completion:", a3, a4, 0, a5);
}

- (void)tagSeparationStateChanged:(id)a3 beaconUUID:(id)a4 location:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[SPOwnerSession queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__SPOwnerSession_TagSeparation__tagSeparationStateChanged_beaconUUID_location_completion___block_invoke;
  v16[3] = &unk_1E5E16D08;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

void __90__SPOwnerSession_TagSeparation__tagSeparationStateChanged_beaconUUID_location_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userAgentProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tagSeparationStateChanged:beaconUUID:location:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));

}

void __43__SPOwnerSession_beaconForUUID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1AEA79000, v0, v1, "SPOwnerSession beaconForUUID called with nil UUID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__SPOwnerSession_beaconForIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1AEA79000, v0, v1, "SPOwnerSession beaconForIdentifier called with nil UUID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54__SPOwnerSession_beaconGroupForIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1AEA79000, v0, v1, "SPOwnerSession beaconGroupForIdentifier called with nil UUID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __67__SPOwnerSession_finishBeaconGroupFuture_command_commandIssueDate___block_invoke_258_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1AEA79000, v0, v1, "SPOwnerSession: finishBeaconGroupFuture. No beacon group or unknown beacon found. Fallback to SPBeacon", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __48__SPOwnerSession_finishBeaconFuture_beaconUUID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1AEA79000, v0, v1, "SPOwnerSession: finishBeaconFuture: beacon not found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __98__SPOwnerSession_addBeaconChangedListener_beaconUUID_taskName_commandIdentifier_commandIssueDate___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1AEA79000, a2, OS_LOG_TYPE_ERROR, "SPOwnerSession: notifiedBeaconsChangedBlock: beacon does not support task %@", (uint8_t *)&v3, 0xCu);
}

void __44__SPOwnerSession_executeUTPlaySoundCommand___block_invoke_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "taskName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *a2;
  v10 = 138412802;
  v11 = v7;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  _os_log_error_impl(&dword_1AEA79000, a3, OS_LOG_TYPE_ERROR, "SPOwnerSession: executeUTPlaySoundCommand: %@ finishing with task: %@ playSoundContext %@. We should never get here", (uint8_t *)&v10, 0x20u);

}

@end
