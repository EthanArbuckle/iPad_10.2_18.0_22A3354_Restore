@implementation SPBeaconManager

- (void)dealloc
{
  SPLocalBeaconManager *localBeaconingManager;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  SPBeaconManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SPBeaconManager invalidate](self, "invalidate");
  localBeaconingManager = self->_localBeaconingManager;
  self->_localBeaconingManager = 0;

  LogCategory_BeaconManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: Dealloc %{public}@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)SPBeaconManager;
  -[SPBeaconManager dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  id v2;

  -[SPBeaconManager localBeaconingManager](self, "localBeaconingManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (SPLocalBeaconManager)localBeaconingManager
{
  return self->_localBeaconingManager;
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
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  uint64_t v58;
  _QWORD v59[4];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[4];
  _QWORD v63[4];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[4];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[4];

  v71[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27978);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v71[0] = objc_opt_class();
  v71[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_allBeaconsWithCompletion_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v70[0] = objc_opt_class();
  v70[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_allBeaconsOfTypes_includeDupes_includeHidden_completion_, 0, 1);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v69[0] = objc_opt_class();
  v69[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_unacceptedBeaconsWithCompletion_, 0, 1);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v68[0] = objc_opt_class();
  v68[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_beaconingKeysForUUID_dateInterval_completion_, 0, 1);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v67[0] = objc_opt_class();
  v67[1] = objc_opt_class();
  v67[2] = objc_opt_class();
  v67[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_commandKeysForUUIDs_dateInterval_completion_, 0, 1);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v66[0] = objc_opt_class();
  v66[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_allDuriansWithCompletion_, 0, 1);

  v21 = (void *)MEMORY[0x1E0C99E60];
  v65[0] = objc_opt_class();
  v65[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_nearOwnerCommandKeysWithCompletion_, 0, 1);

  v24 = (void *)MEMORY[0x1E0C99E60];
  v64[0] = objc_opt_class();
  v64[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_roleCategoriesWithCompletion_, 0, 1);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v63[0] = objc_opt_class();
  v63[1] = objc_opt_class();
  v63[2] = objc_opt_class();
  v63[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_commandKeysForUUIDs_dateInterval_completion_, 0, 1);

  v30 = (void *)MEMORY[0x1E0C99E60];
  v62[0] = objc_opt_class();
  v62[1] = objc_opt_class();
  v62[2] = objc_opt_class();
  v62[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithArray:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_commandKeysForUUIDs_completion_, 0, 1);

  v33 = (void *)MEMORY[0x1E0C99E60];
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setWithArray:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_commandKeysForUUID_withCriteria_completion_, 0, 1);

  v36 = (void *)MEMORY[0x1E0C99E60];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_allBeaconingKeysForUUID_dateInterval_forceGenerate_completion_, 0, 1);

  v39 = (void *)MEMORY[0x1E0C99E60];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  v59[2] = objc_opt_class();
  v59[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setWithArray:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_fetchAllKeyMapFileDescriptorsWithCompletion_, 0, 1);

  v42 = (void *)MEMORY[0x1E0C99E60];
  v58 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setWithArray:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_fetchAllKeyMapFileDescriptorsWithCompletion_, 1, 1);

  v45 = (void *)MEMORY[0x1E0C99E60];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setWithArray:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_ownedDeviceKeyRecordsForUUID_completion_, 0, 1);

  v48 = (void *)MEMORY[0x1E0C99E60];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setWithArray:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_purgeOwnedDeviceKeyRecordsForUUID_completion_, 0, 1);

  v51 = (void *)MEMORY[0x1E0C99E60];
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setWithArray:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_createOwnedDeviceKeyRecordForUUID_completion_, 0, 1);

  return v2;
}

- (SPBeaconManager)init
{
  SPBeaconManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  void *v7;
  void *v8;
  SPLocalBeaconManager *v9;
  SPLocalBeaconManager *localBeaconingManager;
  id v11;
  void *v12;
  uint64_t v13;
  FMXPCServiceDescription *serviceDescription;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  SPBeaconManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)SPBeaconManager;
  v2 = -[SPBeaconManager init](&v17, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("SPBeaconManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    if (!os_variant_has_internal_content())
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UNDER_TEST"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_4:
      v9 = objc_alloc_init(SPLocalBeaconManager);
      localBeaconingManager = v2->_localBeaconingManager;
      v2->_localBeaconingManager = v9;

      v11 = objc_alloc(MEMORY[0x1E0D20238]);
      -[SPBeaconManager remoteInterface](v2, "remoteInterface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.beaconmanager"), 0, v12, 0, 0);
      serviceDescription = v2->_serviceDescription;
      v2->_serviceDescription = (FMXPCServiceDescription *)v13;

      LogCategory_BeaconManager();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v2;
        _os_log_impl(&dword_1AEA79000, v15, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: Created %{public}@", buf, 0xCu);
      }

    }
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localBeaconingManager, 0);
  objc_storeStrong((id *)&self->_simpleBeaconUpdateInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userAgentProxy, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong(&self->_nearbyTokensChangedBlockWithCompletion, 0);
}

void __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
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
    objc_msgSend(v8, "fm_map:", &__block_literal_global_235);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3838]), "initWithChanges:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  id buf[2];

  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: allBeaconsOfTypes:completion:", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke_227;
  block[3] = &unk_1E5E175D8;
  v5 = a1[5];
  objc_copyWeak(&v7, buf);
  v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (FMXPCSession)session
{
  return self->_session;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SPBeaconManagerXPCProtocol)proxy
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
  -[SPBeaconManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPBeaconManager session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPBeaconManager serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPBeaconManager setSession:](self, "setSession:", v7);

    LogCategory_BeaconManager();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SPBeaconManager serviceDescription](self, "serviceDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "machService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);

    }
    -[SPBeaconManager session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  -[SPBeaconManager session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPBeaconManagerXPCProtocol *)v13;
}

- (void)allBeaconsOfTypes:(id)a3 completion:(id)a4
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
  activity_block[2] = __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: allBeaconsOfTypes:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (id)stateChangedBlockWithCompletion
{
  void *v2;
  void *v3;

  -[SPBeaconManager localBeaconingManager](self, "localBeaconingManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateChangedBlockWithCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setStateChangedBlockWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPBeaconManager localBeaconingManager](self, "localBeaconingManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStateChangedBlockWithCompletion:", v4);

}

- (id)statusChangedBlockWithCompletion
{
  void *v2;
  void *v3;

  -[SPBeaconManager localBeaconingManager](self, "localBeaconingManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusChangedBlockWithCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setStatusChangedBlockWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPBeaconManager localBeaconingManager](self, "localBeaconingManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStatusChangedBlockWithCompletion:", v4);

}

- (id)beaconingKeyChangedBlockWithCompletion
{
  void *v2;
  void *v3;

  -[SPBeaconManager localBeaconingManager](self, "localBeaconingManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconingKeyChangedBlockWithCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setBeaconingKeyChangedBlockWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPBeaconManager localBeaconingManager](self, "localBeaconingManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBeaconingKeyChangedBlockWithCompletion:", v4);

}

- (void)start
{
  id v2;

  -[SPBeaconManager localBeaconingManager](self, "localBeaconingManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)updateObfuscatedIdentifierWithCompletion:(id)a3
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
    v12 = "-[SPBeaconManager updateObfuscatedIdentifierWithCompletion:]";
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: API: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[SPBeaconManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SPBeaconManager_updateObfuscatedIdentifierWithCompletion___block_invoke;
  v8[3] = &unk_1E5E17510;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __60__SPBeaconManager_updateObfuscatedIdentifierWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateObfuscatedIdentifierWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)beaconForUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  SPBeaconManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __44__SPBeaconManager_beaconForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D58;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: beaconForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __44__SPBeaconManager_beaconForUUID_completion___block_invoke(id *a1)
{
  _BOOL4 v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a1[4] == 0;
  LogCategory_BeaconManager();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __44__SPBeaconManager_beaconForUUID_completion___block_invoke_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SPBeaconManager beaconForUUID:completion:]_block_invoke";
      _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
    }

    objc_initWeak((id *)buf, a1[5]);
    objc_msgSend(a1[5], "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SPBeaconManager_beaconForUUID_completion___block_invoke_221;
    block[3] = &unk_1E5E16748;
    objc_copyWeak(&v16, (id *)buf);
    v14 = a1[4];
    v15 = a1[6];
    dispatch_async(v5, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __44__SPBeaconManager_beaconForUUID_completion___block_invoke_221(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconForUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)ownedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4
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
  activity_block[2] = __59__SPBeaconManager_ownedDeviceKeyRecordsForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: ownedDeviceKeyRecordsForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __59__SPBeaconManager_ownedDeviceKeyRecordsForUUID_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager ownedDeviceKeyRecordsForUUID:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SPBeaconManager_ownedDeviceKeyRecordsForUUID_completion___block_invoke_222;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v7, (id *)buf);
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __59__SPBeaconManager_ownedDeviceKeyRecordsForUUID_completion___block_invoke_222(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ownedDeviceKeyRecordsForUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)purgeOwnedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4
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
  activity_block[2] = __64__SPBeaconManager_purgeOwnedDeviceKeyRecordsForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: purgeOwnedDeviceKeyRecordsForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __64__SPBeaconManager_purgeOwnedDeviceKeyRecordsForUUID_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager purgeOwnedDeviceKeyRecordsForUUID:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SPBeaconManager_purgeOwnedDeviceKeyRecordsForUUID_completion___block_invoke_223;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v7, (id *)buf);
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __64__SPBeaconManager_purgeOwnedDeviceKeyRecordsForUUID_completion___block_invoke_223(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purgeOwnedDeviceKeyRecordsForUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)createOwnedDeviceKeyRecordForUUID:(id)a3 completion:(id)a4
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
  activity_block[2] = __64__SPBeaconManager_createOwnedDeviceKeyRecordForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: createOwnedDeviceKeyRecordForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __64__SPBeaconManager_createOwnedDeviceKeyRecordForUUID_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager createOwnedDeviceKeyRecordForUUID:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SPBeaconManager_createOwnedDeviceKeyRecordForUUID_completion___block_invoke_224;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v7, (id *)buf);
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __64__SPBeaconManager_createOwnedDeviceKeyRecordForUUID_completion___block_invoke_224(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createOwnedDeviceKeyRecordForUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)notificationBeaconForSubscriptionId:(id)a3 completion:(id)a4
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
  activity_block[2] = __66__SPBeaconManager_notificationBeaconForSubscriptionId_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: notificationBeaconForSubscriptionId:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __66__SPBeaconManager_notificationBeaconForSubscriptionId_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager notificationBeaconForSubscriptionId:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SPBeaconManager_notificationBeaconForSubscriptionId_completion___block_invoke_225;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v7, (id *)buf);
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __66__SPBeaconManager_notificationBeaconForSubscriptionId_completion___block_invoke_225(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationBeaconForSubscriptionId:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)allBeaconsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __44__SPBeaconManager_allBeaconsWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: allBeaconsWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __44__SPBeaconManager_allBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[SPBeaconManager allBeaconsWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SPBeaconManager_allBeaconsWithCompletion___block_invoke_226;
  v4[3] = &unk_1E5E17510;
  objc_copyWeak(&v6, (id *)buf);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __44__SPBeaconManager_allBeaconsWithCompletion___block_invoke_226(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allBeaconsWithCompletion:", *(_QWORD *)(a1 + 32));

}

void __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke_227(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: allBeaconsOfTypes: %{public}@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke_228;
  v7[3] = &unk_1E5E17228;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "allBeaconsOfTypes:includeDupes:includeHidden:completion:", v6, 0, 0, v7);

}

void __48__SPBeaconManager_allBeaconsOfTypes_completion___block_invoke_228(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_BeaconManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: allBeaconsOfTypes completion beacon count: %lu", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allBeaconsOfTypes:(id)a3 includeDupes:(BOOL)a4 includeHidden:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[5];
  id v15;
  id v16;
  BOOL v17;
  BOOL v18;

  v10 = a3;
  v11 = a6;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke;
  activity_block[3] = &unk_1E5E18338;
  activity_block[4] = self;
  v15 = v10;
  v17 = a4;
  v18 = a5;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: allBeaconsOfTypes:includeDupes:includeHidden:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  __int16 v8;
  id buf[2];

  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: allBeaconsOfTypes:includeDupes:includeHidden:completion:", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke_230;
  v4[3] = &unk_1E5E18310;
  v5 = *(id *)(a1 + 40);
  objc_copyWeak(&v7, buf);
  v8 = *(_WORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke_230(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: allBeaconsOfTypes: %{public}@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 56);
  v7 = *(unsigned __int8 *)(a1 + 57);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke_231;
  v9[3] = &unk_1E5E17228;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v5, "allBeaconsOfTypes:includeDupes:includeHidden:completion:", v8, v6, v7, v9);

}

void __75__SPBeaconManager_allBeaconsOfTypes_includeDupes_includeHidden_completion___block_invoke_231(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_BeaconManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: allBeaconsOfTypes:includeDupes:includeHidden: completion beacon count: %lu", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allBeaconsOfType:(id)a3 completion:(id)a4
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
  activity_block[2] = __47__SPBeaconManager_allBeaconsOfType_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: allBeaconsOfType:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __47__SPBeaconManager_allBeaconsOfType_completion___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SPBeaconManager allBeaconsOfType:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SPBeaconManager_allBeaconsOfType_completion___block_invoke_232;
  v6[3] = &unk_1E5E17858;
  v7 = a1[5];
  objc_copyWeak(&v10, (id *)buf);
  v8 = v3;
  v9 = a1[6];
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __47__SPBeaconManager_allBeaconsOfType_completion___block_invoke_232(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %lu", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "allBeaconsOfTypes:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)startUpdatingSimpleBeaconsWithContext:(id)a3 collectionDifference:(id)a4 completion:(id)a5
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
  LogCategory_BeaconManager();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v26 = "-[SPBeaconManager startUpdatingSimpleBeaconsWithContext:collectionDifference:completion:]";
    _os_log_impl(&dword_1AEA79000, v11, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %{public}s", buf, 0xCu);
  }

  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke;
  aBlock[3] = &unk_1E5E17BA0;
  aBlock[4] = self;
  v22 = v8;
  v23 = v9;
  v24 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  v16 = _Block_copy(aBlock);
  -[SPBeaconManager queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_4;
  v19[3] = &unk_1E5E16720;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  dispatch_async(v17, v19);

}

void __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setSimpleBeaconUpdateInterface:", v2);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_2;
  v4[3] = &unk_1E5E17B78;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "setSimpleBeaconDifferenceBlock:", v4);
  objc_msgSend(*(id *)(a1 + 32), "simpleBeaconUpdateInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startUpdatingSimpleBeaconsWithContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

}

id __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SPSimpleBeacon *v3;
  void *v4;
  SPSimpleBeacon *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = a2;
  v3 = [SPSimpleBeacon alloc];
  objc_msgSend(v2, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SPSimpleBeacon initWithInternalSimpleBeacon:](v3, "initWithInternalSimpleBeacon:", v4);

  v6 = objc_alloc(MEMORY[0x1E0CB3830]);
  v7 = objc_msgSend(v2, "changeType");
  v8 = objc_msgSend(v2, "index");

  v9 = (void *)objc_msgSend(v6, "initWithObject:type:index:", v5, v7, v8);
  return v9;
}

void __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_4(uint64_t a1)
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
    v4[2] = __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_5;
    v4[3] = &unk_1E5E176C8;
    v3 = *(void **)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    objc_msgSend(v5, "stopUpdatingSimpleBeaconsWithCompletion:", v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_6;
  block[3] = &unk_1E5E17460;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

uint64_t __89__SPBeaconManager_startUpdatingSimpleBeaconsWithContext_collectionDifference_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopUpdatingSimpleBeaconsWithCompletion:(id)a3
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
  LogCategory_BeaconManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SPBeaconManager stopUpdatingSimpleBeaconsWithCompletion:]";
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %{public}s", buf, 0xCu);
  }

  -[SPBeaconManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SPBeaconManager_stopUpdatingSimpleBeaconsWithCompletion___block_invoke;
  v8[3] = &unk_1E5E16720;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __59__SPBeaconManager_stopUpdatingSimpleBeaconsWithCompletion___block_invoke(uint64_t a1)
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
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __51__SPBeaconManager_unacceptedBeaconsWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: unacceptedBeaconsWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __51__SPBeaconManager_unacceptedBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[SPBeaconManager unacceptedBeaconsWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SPBeaconManager_unacceptedBeaconsWithCompletion___block_invoke_241;
  v4[3] = &unk_1E5E17510;
  objc_copyWeak(&v6, (id *)buf);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __51__SPBeaconManager_unacceptedBeaconsWithCompletion___block_invoke_241(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unacceptedBeaconsWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)beaconingKeysForUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __64__SPBeaconManager_beaconingKeysForUUID_dateInterval_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D08;
  activity_block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: beaconingKeysForUUID:dateInterval:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __64__SPBeaconManager_beaconingKeysForUUID_dateInterval_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SPBeaconManager beaconingKeysForUUID:dateInterval:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__SPBeaconManager_beaconingKeysForUUID_dateInterval_completion___block_invoke_242;
  v4[3] = &unk_1E5E178A8;
  objc_copyWeak(&v8, (id *)buf);
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  dispatch_async(v3, v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __64__SPBeaconManager_beaconingKeysForUUID_dateInterval_completion___block_invoke_242(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beaconingKeysForUUID:dateInterval:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)postedLocalNotifyWhenFoundNotificationForUUID:(id)a3 completion:(id)a4
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
  activity_block[2] = __76__SPBeaconManager_postedLocalNotifyWhenFoundNotificationForUUID_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: postedLocalNotifyWhenFoundNotificationForUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __76__SPBeaconManager_postedLocalNotifyWhenFoundNotificationForUUID_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager postedLocalNotifyWhenFoundNotificationForUUID:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SPBeaconManager_postedLocalNotifyWhenFoundNotificationForUUID_completion___block_invoke_243;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v7, (id *)buf);
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __76__SPBeaconManager_postedLocalNotifyWhenFoundNotificationForUUID_completion___block_invoke_243(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postedLocalNotifyWhenFoundNotificationForUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)allDuriansWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __44__SPBeaconManager_allDuriansWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: allDuriansWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __44__SPBeaconManager_allDuriansWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SPBeaconManager allDuriansWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  LogCategory_BeaconManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __44__SPBeaconManager_allDuriansWithCompletion___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__SPBeaconManager_allDuriansWithCompletion___block_invoke_244;
  v12[3] = &unk_1E5E17510;
  objc_copyWeak(&v14, (id *)buf);
  v13 = *(id *)(a1 + 40);
  dispatch_async(v11, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __44__SPBeaconManager_allDuriansWithCompletion___block_invoke_244(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allDuriansWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)roleCategoriesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __48__SPBeaconManager_roleCategoriesWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: roleCategoriesWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __48__SPBeaconManager_roleCategoriesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[SPBeaconManager roleCategoriesWithCompletion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SPBeaconManager_roleCategoriesWithCompletion___block_invoke_245;
  v4[3] = &unk_1E5E17510;
  objc_copyWeak(&v6, (id *)buf);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __48__SPBeaconManager_roleCategoriesWithCompletion___block_invoke_245(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "roleCategoriesWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)setRole:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __48__SPBeaconManager_setRole_forBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E5E18380;
  activity_block[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: setRole:forBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __48__SPBeaconManager_setRole_forBeacon_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7[2];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager setRole:forBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SPBeaconManager_setRole_forBeacon_completion___block_invoke_246;
  v4[3] = &unk_1E5E17E58;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = a1[7];
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v3, v4);

  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __48__SPBeaconManager_setRole_forBeacon_completion___block_invoke_246(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRole:beaconId:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)updateBeacon:(id)a3 updates:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D08;
  activity_block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: updateBeacon:updates:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD activity_block[5];
  id v4;
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager updateBeacon:updates:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke_247;
  activity_block[3] = &unk_1E5E183A8;
  activity_block[4] = a1[4];
  objc_copyWeak(&v7, (id *)buf);
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling commandKeysForUUIDs", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke_247(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke_2;
  v3[3] = &unk_1E5E178A8;
  objc_copyWeak(&v7, a1 + 8);
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v7);
}

void __51__SPBeaconManager_updateBeacon_updates_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateBeacon:updates:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)connectionTokensForBeaconUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D08;
  activity_block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: connectionTokensForBeaconUUID:dateInterval:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD activity_block[5];
  id v4;
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager connectionTokensForBeaconUUID:dateInterval:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_248;
  activity_block[3] = &unk_1E5E183A8;
  activity_block[4] = a1[4];
  objc_copyWeak(&v7, (id *)buf);
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling commandKeysForUUIDs", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_248(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_2;
  v3[3] = &unk_1E5E178A8;
  objc_copyWeak(&v7, a1 + 8);
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v7);
}

void __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_3;
  v6[3] = &unk_1E5E183D0;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "commandKeysForUUIDs:dateInterval:completion:", v4, v5, v6);

}

void __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_4;
  v6[3] = &unk_1E5E17D80;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__SPBeaconManager_connectionTokensForBeaconUUID_dateInterval_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);

}

- (void)connectionTokensForBeaconUUID:(id)a3 criteria:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D08;
  activity_block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: connectionTokensForBeaconUUID:criteria:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD activity_block[5];
  id v4;
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager connectionTokensForBeaconUUID:criteria:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_252;
  activity_block[3] = &unk_1E5E183A8;
  activity_block[4] = a1[4];
  objc_copyWeak(&v7, (id *)buf);
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling commandKeysForUUID withCriteria", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_252(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_2;
  v3[3] = &unk_1E5E178A8;
  objc_copyWeak(&v7, a1 + 8);
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v7);
}

void __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_3;
  v6[3] = &unk_1E5E17C40;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "commandKeysForUUID:withCriteria:completion:", v4, v5, v6);

}

uint64_t __69__SPBeaconManager_connectionTokensForBeaconUUID_criteria_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)allBeaconingKeysForUUID:(id)a3 dateInterval:(id)a4 forceGenerate:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD activity_block[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __81__SPBeaconManager_allBeaconingKeysForUUID_dateInterval_forceGenerate_completion___block_invoke;
  activity_block[3] = &unk_1E5E17BC8;
  activity_block[4] = self;
  v17 = v10;
  v20 = a5;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: allBeaconingKeysForUUID:dateInterval:forceGenerate:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __81__SPBeaconManager_allBeaconingKeysForUUID_dateInterval_forceGenerate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SPBeaconManager allBeaconingKeysForUUID:dateInterval:forceGenerate:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SPBeaconManager_allBeaconingKeysForUUID_dateInterval_forceGenerate_completion___block_invoke_254;
  block[3] = &unk_1E5E178F8;
  objc_copyWeak(&v8, (id *)buf);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  dispatch_async(v3, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __81__SPBeaconManager_allBeaconingKeysForUUID_dateInterval_forceGenerate_completion___block_invoke_254(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allBeaconingKeysForUUID:dateInterval:forceGenerate:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

- (void)setAlignmentUncertainty:(double)a3 atIndex:(unint64_t)a4 date:(id)a5 forBeacon:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD activity_block[5];
  id v19;
  id v20;
  id v21;
  double v22;
  unint64_t v23;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __77__SPBeaconManager_setAlignmentUncertainty_atIndex_date_forBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E5E18420;
  v22 = a3;
  v23 = a4;
  activity_block[4] = self;
  v19 = v12;
  v20 = v13;
  v21 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: setAlignmentUncertainty:atIndex:forceGenerate:date:forBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __77__SPBeaconManager_setAlignmentUncertainty_atIndex_date_forBeacon_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8[3];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SPBeaconManager setAlignmentUncertainty:atIndex:date:forBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__SPBeaconManager_setAlignmentUncertainty_atIndex_date_forBeacon_completion___block_invoke_255;
  v4[3] = &unk_1E5E183F8;
  objc_copyWeak(v8, (id *)buf);
  v8[1] = a1[8];
  v8[2] = a1[9];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  dispatch_async(v3, v4);

  objc_destroyWeak(v8);
  objc_destroyWeak((id *)buf);
}

void __77__SPBeaconManager_setAlignmentUncertainty_atIndex_date_forBeacon_completion___block_invoke_255(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlignmentUncertainty:atIndex:date:forBeacon:completion:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));

}

- (void)setKeyRollInterval:(unint64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a4;
  v9 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __59__SPBeaconManager_setKeyRollInterval_forBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E5E18380;
  activity_block[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: setKeyRollInterval:forBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __59__SPBeaconManager_setKeyRollInterval_forBeacon_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7[2];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager setKeyRollInterval:forBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SPBeaconManager_setKeyRollInterval_forBeacon_completion___block_invoke_256;
  v4[3] = &unk_1E5E17E58;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = a1[7];
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v3, v4);

  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __59__SPBeaconManager_setKeyRollInterval_forBeacon_completion___block_invoke_256(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyRollInterval:forBeacon:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setWildKeyBase:(unint64_t)a3 interval:(unint64_t)a4 fallback:(unint64_t)a5 forBeacon:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD activity_block[5];
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v12 = a6;
  v13 = a7;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __73__SPBeaconManager_setWildKeyBase_interval_fallback_forBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E5E18470;
  v20 = a4;
  v21 = a5;
  activity_block[4] = self;
  v17 = v12;
  v18 = v13;
  v19 = a3;
  v14 = v13;
  v15 = v12;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: setWildKeyBase:interval:fallback:forBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __73__SPBeaconManager_setWildKeyBase_interval_fallback_forBeacon_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SPBeaconManager setWildKeyBase:interval:fallback:forBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__SPBeaconManager_setWildKeyBase_interval_fallback_forBeacon_completion___block_invoke_257;
  v4[3] = &unk_1E5E18448;
  objc_copyWeak(&v7, (id *)buf);
  v8 = *(_OWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 72);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __73__SPBeaconManager_setWildKeyBase_interval_fallback_forBeacon_completion___block_invoke_257(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWildKeyBase:interval:fallback:forBeacon:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setCurrentWildKeyIndex:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPBeaconManager_setCurrentWildKeyIndex_forBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E5E18380;
  activity_block[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: setCurrentWildKeyIndex:forBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __63__SPBeaconManager_setCurrentWildKeyIndex_forBeacon_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7[2];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager setCurrentWildKeyIndex:forBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__SPBeaconManager_setCurrentWildKeyIndex_forBeacon_completion___block_invoke_258;
  v4[3] = &unk_1E5E17E58;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = a1[7];
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v3, v4);

  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __63__SPBeaconManager_setCurrentWildKeyIndex_forBeacon_completion___block_invoke_258(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCurrentWildKeyIndex:forBeacon:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)connectionTokensForBeaconUUID:(id)a3 completion:(id)a4
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
  activity_block[2] = __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: connectionTokensForBeaconUUID:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[SPBeaconManager connectionTokensForBeaconUUID:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_259;
  v3[3] = &unk_1E5E17858;
  v3[4] = a1[4];
  objc_copyWeak(&v6, (id *)buf);
  v4 = a1[5];
  v5 = a1[6];
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling commandKeysForUUIDs", OS_ACTIVITY_FLAG_DEFAULT, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_259(id *a1)
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
  block[2] = __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_2;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v6, a1 + 7);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_3;
  v5[3] = &unk_1E5E183D0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "commandKeysForUUIDs:completion:", v4, v5);

}

void __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_4;
  v6[3] = &unk_1E5E17D80;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__SPBeaconManager_connectionTokensForBeaconUUID_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (void)connectedToBeacon:(id)a3 withIndex:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __58__SPBeaconManager_connectedToBeacon_withIndex_completion___block_invoke;
  activity_block[3] = &unk_1E5E18380;
  activity_block[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: connectedToBeacon:withIndex:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __58__SPBeaconManager_connectedToBeacon_withIndex_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10[2];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SPBeaconManager connectedToBeacon:withIndex:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SPBeaconManager_connectedToBeacon_withIndex_completion___block_invoke_260;
  v7[3] = &unk_1E5E17E58;
  objc_copyWeak(v10, (id *)buf);
  v4 = *(id *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v8 = v4;
  v10[1] = v5;
  v9 = v6;
  dispatch_async(v3, v7);

  objc_destroyWeak(v10);
  objc_destroyWeak((id *)buf);
}

void __58__SPBeaconManager_connectedToBeacon_withIndex_completion___block_invoke_260(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedToBeacon:withIndex:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)connectedToBeacon:(id)a3 withIndex:(unint64_t)a4
{
  -[SPBeaconManager connectedToBeacon:withIndex:completion:](self, "connectedToBeacon:withIndex:completion:", a3, a4, &__block_literal_global_262);
}

- (void)fetchUserStatsForBeacon:(id)a3 completion:(id)a4
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
  activity_block[2] = __54__SPBeaconManager_fetchUserStatsForBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: fetchUserStatsForBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __54__SPBeaconManager_fetchUserStatsForBeacon_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager fetchUserStatsForBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SPBeaconManager_fetchUserStatsForBeacon_completion___block_invoke_263;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v7, (id *)buf);
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __54__SPBeaconManager_fetchUserStatsForBeacon_completion___block_invoke_263(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchUserStatsForBeacon:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)fetchFirmwareVersionForBeacon:(id)a3 completion:(id)a4
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
  activity_block[2] = __60__SPBeaconManager_fetchFirmwareVersionForBeacon_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: fetchFirmwareVersionForBeacon:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __60__SPBeaconManager_fetchFirmwareVersionForBeacon_completion___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SPBeaconManager fetchFirmwareVersionForBeacon:completion:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  objc_msgSend(a1[4], "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SPBeaconManager_fetchFirmwareVersionForBeacon_completion___block_invoke_264;
  block[3] = &unk_1E5E16748;
  objc_copyWeak(&v7, (id *)buf);
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __60__SPBeaconManager_fetchFirmwareVersionForBeacon_completion___block_invoke_264(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchFirmwareVersionForBeacon:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)createKeyReconcilerWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPOwnerSession: Calling createKeyReconcilerWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_2;
  block[3] = &unk_1E5E17510;
  objc_copyWeak(&v5, &location);
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_3;
  v4[3] = &unk_1E5E184D8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "fetchAllKeyMapFileDescriptorsWithCompletion:", v4);

}

void __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  SPKeyReconciler *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  LogCategory_BeaconManager();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_3_cold_1((uint64_t)v6, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: fetched %zu key map file descriptor sets", (uint8_t *)&v10, 0xCu);
    }

    v9 = -[SPKeyReconciler initWithDictionary:]([SPKeyReconciler alloc], "initWithDictionary:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (void)repairDataStore:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __35__SPBeaconManager_repairDataStore___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPBeaconManager: repairDataStore:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __35__SPBeaconManager_repairDataStore___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[SPBeaconManager repairDataStore:]_block_invoke";
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPBeaconManager: SPI: %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__SPBeaconManager_repairDataStore___block_invoke_267;
  v4[3] = &unk_1E5E17510;
  objc_copyWeak(&v6, (id *)buf);
  v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __35__SPBeaconManager_repairDataStore___block_invoke_267(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "repairDataStore:", *(_QWORD *)(a1 + 32));

}

- (void)isLPEMModeSupported:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SPBeaconManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SPBeaconManager_isLPEMModeSupported___block_invoke;
  v7[3] = &unk_1E5E16720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __39__SPBeaconManager_isLPEMModeSupported___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__SPBeaconManager_isLPEMModeSupported___block_invoke_2;
  v3[3] = &unk_1E5E18500;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "isLPEMModeSupportedWithCompletion:", v3);

}

uint64_t __39__SPBeaconManager_isLPEMModeSupported___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)userHasAcknowledgeFindMyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SPBeaconManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SPBeaconManager_userHasAcknowledgeFindMyWithCompletion___block_invoke;
  v7[3] = &unk_1E5E16720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__SPBeaconManager_userHasAcknowledgeFindMyWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__SPBeaconManager_userHasAcknowledgeFindMyWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5E18500;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "userHasAcknowledgeFindMyWithCompletion:", v3);

}

uint64_t __58__SPBeaconManager_userHasAcknowledgeFindMyWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setUserHasAcknowledgedFindMy:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[SPBeaconManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SPBeaconManager_setUserHasAcknowledgedFindMy_completion___block_invoke;
  block[3] = &unk_1E5E16DD0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __59__SPBeaconManager_setUserHasAcknowledgedFindMy_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SPBeaconManager_setUserHasAcknowledgedFindMy_completion___block_invoke_2;
  v4[3] = &unk_1E5E17460;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "setUserHasAcknowledgedFindMy:completion:", v3, v4);

}

uint64_t __59__SPBeaconManager_setUserHasAcknowledgedFindMy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSuppressLPEMBeaconing:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[SPBeaconManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SPBeaconManager_setSuppressLPEMBeaconing_completion___block_invoke;
  block[3] = &unk_1E5E16DD0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __55__SPBeaconManager_setSuppressLPEMBeaconing_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SPBeaconManager_setSuppressLPEMBeaconing_completion___block_invoke_2;
  v4[3] = &unk_1E5E17460;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "setSuppressLPEMBeaconing:completion:", v3, v4);

}

uint64_t __55__SPBeaconManager_setSuppressLPEMBeaconing_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createDuplicateBeaconsForBeacon:(id)a3 skipGroupIdentifier:(BOOL)a4 count:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  -[SPBeaconManager queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__SPBeaconManager_createDuplicateBeaconsForBeacon_skipGroupIdentifier_count_completion___block_invoke;
  block[3] = &unk_1E5E18528;
  block[4] = self;
  v16 = v10;
  v19 = a4;
  v17 = v11;
  v18 = a5;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

void __88__SPBeaconManager_createDuplicateBeaconsForBeacon_skipGroupIdentifier_count_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userAgentProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDuplicateBeaconsForBeacon:skipGroupIdentifier:count:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)removeDuplicateBeaconsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SPBeaconManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SPBeaconManager_removeDuplicateBeaconsWithCompletion___block_invoke;
  v7[3] = &unk_1E5E16720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __56__SPBeaconManager_removeDuplicateBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userAgentProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeDuplicateBeaconsWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)submitDeviceEvent:(id)a3 source:(unsigned int)a4 attachedTo:(id)a5 completion:(id)a6
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
  unsigned int v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[SPBeaconManager queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SPBeaconManager_submitDeviceEvent_source_attachedTo_completion___block_invoke;
  block[3] = &unk_1E5E18550;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __66__SPBeaconManager_submitDeviceEvent_source_attachedTo_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userAgentProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "submitDeviceEvent:source:attachedTo:completion:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (id)nearbyTokensChangedBlockWithCompletion
{
  return self->_nearbyTokensChangedBlockWithCompletion;
}

- (void)setNearbyTokensChangedBlockWithCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (void)setUserAgentProxy:(id)a3
{
  objc_storeStrong((id *)&self->_userAgentProxy, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SPBeaconManagerSimpleBeaconUpdateInterface)simpleBeaconUpdateInterface
{
  return self->_simpleBeaconUpdateInterface;
}

- (void)setSimpleBeaconUpdateInterface:(id)a3
{
  objc_storeStrong((id *)&self->_simpleBeaconUpdateInterface, a3);
}

- (void)setLocalBeaconingManager:(id)a3
{
  objc_storeStrong((id *)&self->_localBeaconingManager, a3);
}

void __44__SPBeaconManager_beaconForUUID_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1AEA79000, a1, a3, "SPBeaconManager beaconForUUID called with nil UUID.", a5, a6, a7, a8, 0);
}

void __44__SPBeaconManager_allDuriansWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1AEA79000, a1, a3, "allDuriansWithCompletion has been deprecated. Please use allBeaconsOfTypes:completion: instead.", a5, a6, a7, a8, 0);
}

void __53__SPBeaconManager_createKeyReconcilerWithCompletion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AEA79000, a2, OS_LOG_TYPE_ERROR, "SPBeaconManager: failed to fetch key map file descriptors: %@", (uint8_t *)&v2, 0xCu);
}

@end
