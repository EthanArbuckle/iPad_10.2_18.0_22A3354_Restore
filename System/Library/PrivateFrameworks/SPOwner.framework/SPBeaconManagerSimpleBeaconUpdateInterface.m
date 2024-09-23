@implementation SPBeaconManagerSimpleBeaconUpdateInterface

void __95__SPBeaconManagerSimpleBeaconUpdateInterface_startUpdatingSimpleBeaconsWithContext_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    LogCategory_BeaconManager();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136446210;
      v6 = "-[SPBeaconManagerSimpleBeaconUpdateInterface startUpdatingSimpleBeaconsWithContext:completion:]_block_invoke";
      _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", (uint8_t *)&v5, 0xCu);
    }

    objc_storeStrong(WeakRetained + 7, *(id *)(a1 + 32));
    objc_msgSend(WeakRetained, "proxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startUpdatingSimpleBeaconsWithContext:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)setSimpleBeaconDifferenceBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id collectionDifferenceBlock;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_BeaconManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = "-[SPBeaconManagerSimpleBeaconUpdateInterface setSimpleBeaconDifferenceBlock:]";
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", (uint8_t *)&v8, 0xCu);
  }

  v6 = _Block_copy(v4);
  collectionDifferenceBlock = self->_collectionDifferenceBlock;
  self->_collectionDifferenceBlock = v6;

}

- (SPBeaconManagerXPCProtocol)proxy
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD aBlock[4];
  id v22;
  id location;

  -[SPBeaconManagerSimpleBeaconUpdateInterface session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__SPBeaconManagerSimpleBeaconUpdateInterface_proxy__block_invoke;
    aBlock[3] = &unk_1E5E16690;
    objc_copyWeak(&v22, &location);
    v5 = _Block_copy(aBlock);
    v16 = v4;
    v17 = 3221225472;
    v18 = __51__SPBeaconManagerSimpleBeaconUpdateInterface_proxy__block_invoke_2;
    v19 = &unk_1E5E16690;
    objc_copyWeak(&v20, &location);
    v6 = _Block_copy(&v16);
    v7 = objc_alloc(MEMORY[0x1E0D20238]);
    +[SPBeaconManagerSimpleBeaconUpdateInterface exportedInterface](SPBeaconManagerSimpleBeaconUpdateInterface, "exportedInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPBeaconManagerSimpleBeaconUpdateInterface remoteInterface](SPBeaconManagerSimpleBeaconUpdateInterface, "remoteInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.beaconmanager.simplebeacon"), 0, self, v8, v9, v5, v6, v16, v17, v18, v19);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20240]), "initWithServiceDescription:", v10);
    -[SPBeaconManagerSimpleBeaconUpdateInterface setSession:](self, "setSession:", v11);

    -[SPBeaconManagerSimpleBeaconUpdateInterface session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  -[SPBeaconManagerSimpleBeaconUpdateInterface session](self, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "proxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPBeaconManagerXPCProtocol *)v14;
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)startUpdatingSimpleBeaconsWithContext:(id)a3 completion:(id)a4
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
  -[SPBeaconManagerSimpleBeaconUpdateInterface serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__SPBeaconManagerSimpleBeaconUpdateInterface_startUpdatingSimpleBeaconsWithContext_completion___block_invoke;
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

- (void)receivedSimpleBeaconUpdates:(id)a3
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
    v11 = "-[SPBeaconManagerSimpleBeaconUpdateInterface receivedSimpleBeaconUpdates:]";
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  -[SPBeaconManagerSimpleBeaconUpdateInterface serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconUpdates___block_invoke;
  v8[3] = &unk_1E5E16818;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_2 != -1)
    dispatch_once(&remoteInterface_onceToken_2, &__block_literal_global_68);
  return (id)remoteInterface_interface_2;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_2 != -1)
    dispatch_once(&exportedInterface_onceToken_2, &__block_literal_global_3);
  return (id)exportedInterface_interface_2;
}

void __74__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconUpdates___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  uint64_t v41;
  uint64_t v42;
  id obj;
  void *v44;
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v1 = a1;
  v60 = *MEMORY[0x1E0C80C00];
  v41 = a1;
  if (objc_msgSend(*(id *)(a1 + 32), "reconnectionUpdate"))
  {
    objc_msgSend(*(id *)(v1 + 32), "setReconnectionUpdate:", 0);
    objc_msgSend(*(id *)(v1 + 40), "fm_map:", &__block_literal_global_180);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_opt_new();
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v4 = *(id *)(*(_QWORD *)(v1 + 32) + 16);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v51 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v9, "identifier", v41);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v2, "containsObject:", v10);

          if ((v11 & 1) == 0)
          {
            objc_msgSend(v9, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v12);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v6);
    }

    v1 = v41;
    objc_msgSend(*(id *)(v41 + 32), "_processRemovals:", v3);

  }
  v13 = *(id *)(*(_QWORD *)(v1 + 32) + 16);
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v44 = v13;
  v15 = objc_msgSend(v13, "count");
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = *(id *)(v1 + 40);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v47;
    v19 = MEMORY[0x1E0C809B0];
    do
    {
      v20 = 0;
      v42 = v17;
      do
      {
        if (*(_QWORD *)v47 != v18)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v20);
        v45[0] = v19;
        v45[1] = 3221225472;
        v45[2] = __74__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconUpdates___block_invoke_3;
        v45[3] = &unk_1E5E16B90;
        v45[4] = v21;
        v22 = objc_msgSend(v44, "indexOfObjectPassingTest:", v45, v41);
        v23 = objc_alloc(MEMORY[0x1E0CB3830]);
        if (v22 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v24 = (void *)objc_msgSend(v23, "initWithObject:type:index:", v21, 0, v15);
          objc_msgSend(v14, "addObject:", v24);

          LogCategory_BeaconManager();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v21, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v55 = v15;
            v56 = 2112;
            v57 = v26;
            _os_log_impl(&dword_1AEA79000, v25, OS_LOG_TYPE_DEFAULT, "SimpleBeaconUpdate receivedSimpleBeaconUpdates. Change: Insert, index: %lu, id: %@.", buf, 0x16u);

          }
          ++v15;
        }
        else
        {
          v27 = (void *)objc_msgSend(v23, "initWithObject:type:index:", v21, 1, v22);
          objc_msgSend(v14, "addObject:", v27);

          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3830]), "initWithObject:type:index:", v21, 0, v22);
          objc_msgSend(v14, "addObject:", v28);

          LogCategory_BeaconManager();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v21, "identifier");
            v30 = v19;
            v31 = v14;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v55 = v22;
            v56 = 2112;
            v57 = v32;
            _os_log_impl(&dword_1AEA79000, v29, OS_LOG_TYPE_DEFAULT, "SimpleBeaconUpdate receivedSimpleBeaconUpdates. Change: Remove, index: %lu, id: %@.", buf, 0x16u);

            v14 = v31;
            v19 = v30;
          }

          LogCategory_BeaconManager();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v21, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v55 = v22;
            v56 = 2112;
            v57 = v34;
            _os_log_impl(&dword_1AEA79000, v33, OS_LOG_TYPE_DEFAULT, "SimpleBeaconUpdate receivedSimpleBeaconUpdates. Change: Insert, index: %lu, id: %@.", buf, 0x16u);

          }
          v17 = v42;
        }
        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v17);
  }

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3838]), "initWithChanges:", v14);
  objc_msgSend(v44, "arrayByApplyingDifference:", v35);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = *(_QWORD *)(v41 + 32);
  v38 = *(void **)(v37 + 16);
  *(_QWORD *)(v37 + 16) = v36;

  objc_msgSend(*(id *)(v41 + 32), "collectionDifferenceBlock");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(*(id *)(v41 + 32), "collectionDifferenceBlock");
    v40 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v40)[2](v40, v35, 0);

  }
}

- (id)collectionDifferenceBlock
{
  return self->_collectionDifferenceBlock;
}

- (BOOL)reconnectionUpdate
{
  return self->_reconnectionUpdate;
}

void __61__SPBeaconManagerSimpleBeaconUpdateInterface_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27978);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_interface_2;
  remoteInterface_interface_2 = v0;

}

void __63__SPBeaconManagerSimpleBeaconUpdateInterface_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE18AA8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface_2;
  exportedInterface_interface_2 = v0;

  v2 = (void *)exportedInterface_interface_2;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_receivedSimpleBeaconUpdates_, 0, 0);

  v6 = (void *)exportedInterface_interface_2;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_receivedSimpleBeaconRemovals_, 0, 0);

}

- (SPBeaconManagerSimpleBeaconUpdateInterface)init
{
  SPBeaconManagerSimpleBeaconUpdateInterface *v2;
  SPBeaconManagerSimpleBeaconUpdateInterface *v3;
  NSArray *simpleBeacons;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *serialQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SPBeaconManagerSimpleBeaconUpdateInterface;
  v2 = -[SPBeaconManagerSimpleBeaconUpdateInterface init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    simpleBeacons = v2->_simpleBeacons;
    v2->_simpleBeacons = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_reconnectionUpdate = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.icloud.seachpartyd.simpleBeaconUpdate", v5);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v6;

  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  LogCategory_SimpleBeaconUpdateInterface();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: dealloc.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)SPBeaconManagerSimpleBeaconUpdateInterface;
  -[SPBeaconManagerSimpleBeaconUpdateInterface dealloc](&v4, sel_dealloc);
}

- (NSArray)simpleBeacons
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
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[SPBeaconManagerSimpleBeaconUpdateInterface serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SPBeaconManagerSimpleBeaconUpdateInterface_simpleBeacons__block_invoke;
  v6[3] = &unk_1E5E16AE0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __59__SPBeaconManagerSimpleBeaconUpdateInterface_simpleBeacons__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)stopUpdatingSimpleBeaconsWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  LogCategory_BeaconManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v11 = "-[SPBeaconManagerSimpleBeaconUpdateInterface stopUpdatingSimpleBeaconsWithCompletion:]";
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  -[SPBeaconManagerSimpleBeaconUpdateInterface removeObservers](self, "removeObservers");
  -[SPBeaconManagerSimpleBeaconUpdateInterface setCollectionDifferenceBlock:](self, "setCollectionDifferenceBlock:", 0);
  -[SPBeaconManagerSimpleBeaconUpdateInterface session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SPBeaconManagerSimpleBeaconUpdateInterface setSession:](self, "setSession:", 0);
  objc_initWeak((id *)buf, self);
  -[SPBeaconManagerSimpleBeaconUpdateInterface serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__SPBeaconManagerSimpleBeaconUpdateInterface_stopUpdatingSimpleBeaconsWithCompletion___block_invoke;
  block[3] = &unk_1E5E16B08;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(v7, block);

  v4[2](v4, 1, 0);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

void __86__SPBeaconManagerSimpleBeaconUpdateInterface_stopUpdatingSimpleBeaconsWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = MEMORY[0x1E0C9AA60];
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)interruptionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void (**v6)(void *, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_BeaconManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v13 = "-[SPBeaconManagerSimpleBeaconUpdateInterface interruptionHandler:]";
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  v6 = (void (**)(void *, _QWORD, void *))_Block_copy(self->_collectionDifferenceBlock);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPBeaconManager.ErrorDomain"), 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);

  }
  -[SPBeaconManagerSimpleBeaconUpdateInterface session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__SPBeaconManagerSimpleBeaconUpdateInterface_interruptionHandler___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v9 = (void *)MEMORY[0x1AF455E74]();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleReconnection, SPSimpleBeaconUpdateInterfaceReconnect, 0);

    objc_autoreleasePoolPop(v9);
  }

}

void __66__SPBeaconManagerSimpleBeaconUpdateInterface_interruptionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  __CFNotificationCenter *DarwinNotifyCenter;

  v2 = (void *)MEMORY[0x1AF455E74]();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)interfaceReconnectTrampoline, CFSTR("SPSimpleBeaconUpdateInterfaceReconnectNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_autoreleasePoolPop(v2);
}

- (void)invalidationHandler:(id)a3
{
  NSObject *v4;
  void (**collectionDifferenceBlock)(id, _QWORD, void *);
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446210;
    v8 = "-[SPBeaconManagerSimpleBeaconUpdateInterface invalidationHandler:]";
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", (uint8_t *)&v7, 0xCu);
  }

  collectionDifferenceBlock = (void (**)(id, _QWORD, void *))self->_collectionDifferenceBlock;
  if (collectionDifferenceBlock)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.searchpartyd.SPBeaconManager.ErrorDomain"), 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    collectionDifferenceBlock[2](collectionDifferenceBlock, 0, v6);

  }
}

void __51__SPBeaconManagerSimpleBeaconUpdateInterface_proxy__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "interruptionHandler:", v3);

}

void __51__SPBeaconManagerSimpleBeaconUpdateInterface_proxy__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "invalidationHandler:", v3);

}

uint64_t __74__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconUpdates___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __74__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconUpdates___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  *a4 = v8;
  return v8;
}

- (void)receivedSimpleBeaconRemovals:(id)a3
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
    v11 = "-[SPBeaconManagerSimpleBeaconUpdateInterface receivedSimpleBeaconRemovals:]";
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  -[SPBeaconManagerSimpleBeaconUpdateInterface serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconRemovals___block_invoke;
  v8[3] = &unk_1E5E16818;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __75__SPBeaconManagerSimpleBeaconUpdateInterface_receivedSimpleBeaconRemovals___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processRemovals:", *(_QWORD *)(a1 + 40));
}

- (void)_processRemovals:(id)a3
{
  id v4;
  NSObject *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *, uint64_t, _BYTE *);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t (*v19)(uint64_t, void *, uint64_t, _BYTE *);
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *simpleBeacons;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  SPBeaconManagerSimpleBeaconUpdateInterface *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id obj;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SPBeaconManagerSimpleBeaconUpdateInterface serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "count"))
  {
    v29 = self;
    v6 = self->_simpleBeacons;
    v32 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v30 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v37;
      v10 = MEMORY[0x1E0C809B0];
      v11 = __63__SPBeaconManagerSimpleBeaconUpdateInterface__processRemovals___block_invoke;
      v12 = &unk_1E5E16B90;
      v31 = *(_QWORD *)v37;
      do
      {
        v13 = 0;
        v33 = v8;
        do
        {
          if (*(_QWORD *)v37 != v9)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v13);
          v35[0] = v10;
          v35[1] = 3221225472;
          v35[2] = v11;
          v35[3] = v12;
          v35[4] = v14;
          v15 = -[NSArray indexOfObjectPassingTest:](v6, "indexOfObjectPassingTest:", v35, v29);
          if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          {
            LogCategory_BeaconManager();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v14;
              _os_log_impl(&dword_1AEA79000, v16, OS_LOG_TYPE_DEFAULT, "SimpleBeaconUpdate receivedSimpleBeaconRemovals. Change: none, index: none, id: %@.", buf, 0xCu);
            }
          }
          else
          {
            v17 = v15;
            v18 = v12;
            v19 = v11;
            v20 = v10;
            v21 = objc_alloc(MEMORY[0x1E0CB3830]);
            -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v21, "initWithObject:type:index:", v22, 1, v17);
            objc_msgSend(v32, "addObject:", v23);

            LogCategory_BeaconManager();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v41 = v17;
              v42 = 2112;
              v43 = v14;
              _os_log_impl(&dword_1AEA79000, v16, OS_LOG_TYPE_DEFAULT, "SimpleBeaconUpdate receivedSimpleBeaconRemovals. Change: remove, index: %lu, id: %@.", buf, 0x16u);
            }
            v10 = v20;
            v11 = v19;
            v12 = v18;
            v9 = v31;
            v8 = v33;
          }

          ++v13;
        }
        while (v8 != v13);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v8);
    }

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3838]), "initWithChanges:", v32);
    -[NSArray arrayByApplyingDifference:](v6, "arrayByApplyingDifference:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    simpleBeacons = v29->_simpleBeacons;
    v29->_simpleBeacons = (NSArray *)v25;

    -[SPBeaconManagerSimpleBeaconUpdateInterface collectionDifferenceBlock](v29, "collectionDifferenceBlock");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[SPBeaconManagerSimpleBeaconUpdateInterface collectionDifferenceBlock](v29, "collectionDifferenceBlock");
      v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v28)[2](v28, v24, 0);

    }
    v4 = v30;
  }

}

uint64_t __63__SPBeaconManagerSimpleBeaconUpdateInterface__processRemovals___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  *a4 = v7;
  return v7;
}

- (void)removeObservers
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[SPBeaconManagerSimpleBeaconUpdateInterface removeObservers]";
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SPBeaconManagerSimpleBeaconUpdateInterface_removeObservers__block_invoke;
  block[3] = &unk_1E5E16668;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v4 = (void *)MEMORY[0x1AF455E74]();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, SPSimpleBeaconUpdateInterfaceReconnect, 0);

  objc_autoreleasePoolPop(v4);
}

void __61__SPBeaconManagerSimpleBeaconUpdateInterface_removeObservers__block_invoke(uint64_t a1)
{
  void *v2;
  __CFNotificationCenter *DarwinNotifyCenter;

  v2 = (void *)MEMORY[0x1AF455E74]();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), CFSTR("SPSimpleBeaconUpdateInterfaceReconnectNotification"), 0);
  objc_autoreleasePoolPop(v2);
}

- (void)handleReconnection
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  LogCategory_BeaconManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v7 = "-[SPBeaconManagerSimpleBeaconUpdateInterface handleReconnection]";
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPBeaconManagerSimpleBeaconUpdateInterface: SPI: %{public}s", buf, 0xCu);
  }

  -[SPBeaconManagerSimpleBeaconUpdateInterface removeObservers](self, "removeObservers");
  -[SPBeaconManagerSimpleBeaconUpdateInterface serialQueue](self, "serialQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SPBeaconManagerSimpleBeaconUpdateInterface_handleReconnection__block_invoke;
  block[3] = &unk_1E5E16668;
  block[4] = self;
  dispatch_async(v4, block);

}

void __64__SPBeaconManagerSimpleBeaconUpdateInterface_handleReconnection__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "setReconnectionUpdate:", 1);
  objc_msgSend(*(id *)(a1 + 32), "startUpdatingSimpleBeaconsWithContext:completion:", v3, &__block_literal_global_186);

}

void __64__SPBeaconManagerSimpleBeaconUpdateInterface_handleReconnection__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  LogCategory_BeaconManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__SPBeaconManagerSimpleBeaconUpdateInterface_handleReconnection__block_invoke_2_cold_1(v3, v4);

}

- (void)setSimpleBeacons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (void)setCollectionDifferenceBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (SPSimpleBeaconContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setReconnectionUpdate:(BOOL)a3
{
  self->_reconnectionUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_collectionDifferenceBlock, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_simpleBeacons, 0);
}

void __64__SPBeaconManagerSimpleBeaconUpdateInterface_handleReconnection__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1AEA79000, a2, OS_LOG_TYPE_ERROR, "Failed reconnecting to daemon after retry: %@.", (uint8_t *)&v4, 0xCu);

}

@end
