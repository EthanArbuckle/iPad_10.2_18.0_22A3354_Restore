@implementation PSPointerClientController

- (PSPointerClientController)init
{
  PSPointerClientController *v2;
  PSPointerClientController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSPointerClientController;
  v2 = -[PSPointerClientController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PSPointerClientController sharedInit](v2, "sharedInit");
  return v3;
}

- (void)sharedInit
{
  NSMutableSet *v3;
  NSMutableSet *accessQueue_validPortalSourceCollections;
  NSMutableSet *v5;
  NSMutableSet *accessQueue_validMatchMoveSources;
  NSMutableDictionary *v7;
  NSMutableDictionary *systemPointerInteractionContextIDs;
  NSMutableDictionary *v9;
  NSMutableDictionary *hoverRegionOverridingAssertions;
  OS_dispatch_queue *Serial;
  OS_dispatch_queue *accessQueue;
  void *v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *connectionQueue;
  NSObject *v16;
  _QWORD block[5];

  if (dyld_program_sdk_at_least())
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  accessQueue_validPortalSourceCollections = self->_accessQueue_validPortalSourceCollections;
  self->_accessQueue_validPortalSourceCollections = v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  accessQueue_validMatchMoveSources = self->_accessQueue_validMatchMoveSources;
  self->_accessQueue_validMatchMoveSources = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  systemPointerInteractionContextIDs = self->_systemPointerInteractionContextIDs;
  self->_systemPointerInteractionContextIDs = v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  hoverRegionOverridingAssertions = self->_hoverRegionOverridingAssertions;
  self->_hoverRegionOverridingAssertions = v9;

  Serial = (OS_dispatch_queue *)BSDispatchQueueCreateSerial();
  accessQueue = self->_accessQueue;
  self->_accessQueue = Serial;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService();
  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = v14;

  self->_invalidationAndConfigurationLock._os_unfair_lock_opaque = 0;
  v16 = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PSPointerClientController_sharedInit__block_invoke;
  block[3] = &unk_1E287B8B0;
  block[4] = self;
  dispatch_async(v16, block);
}

void __39__PSPointerClientController_sharedInit__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[5];
  id v16;

  v2 = (void *)MEMORY[0x1E0D03458];
  +[PSPointerClientDefaultServiceSpecification machName](PSPointerClientDefaultServiceSpecification, "machName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSPointerClientDefaultServiceSpecification serviceName](PSPointerClientDefaultServiceSpecification, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointForMachName:service:instance:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 8);
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PSPointerClientController_sharedInit__block_invoke_2;
  block[3] = &unk_1E287B708;
  block[4] = v7;
  v16 = v6;
  v10 = v6;
  dispatch_sync(v8, block);
  +[PSPointerClientDefaultServiceSpecification interface](PSPointerClientDefaultServiceSpecification, "interface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __39__PSPointerClientController_sharedInit__block_invoke_3;
  v13[3] = &unk_1E287B708;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v11;
  v12 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

void __39__PSPointerClientController_sharedInit__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __39__PSPointerClientController_sharedInit__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 64));
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __39__PSPointerClientController_sharedInit__block_invoke_4;
  v11 = &unk_1E287B888;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v12 = v4;
  v13 = v5;
  objc_msgSend(v3, "configureConnection:", &v8);
  PSLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_18EAFD000, v6, OS_LOG_TYPE_INFO, "Activating Connection: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activate", v8, v9, v10, v11);
}

void __39__PSPointerClientController_sharedInit__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = a2;
  +[PSPointerClientDefaultServiceSpecification serviceQuality](PSPointerClientDefaultServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  objc_initWeak(&location, *(id *)(a1 + 40));
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__PSPointerClientController_sharedInit__block_invoke_5;
  v10[3] = &unk_1E287B7E8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setActivationHandler:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __39__PSPointerClientController_sharedInit__block_invoke_10;
  v8[3] = &unk_1E287B7E8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __39__PSPointerClientController_sharedInit__block_invoke_11;
  v6[3] = &unk_1E287B860;
  objc_copyWeak(&v7, &location);
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 64));
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __39__PSPointerClientController_sharedInit__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_18EAFD000, v4, OS_LOG_TYPE_INFO, "Connection Activated: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 2) == v3 && !*((_BYTE *)WeakRetained + 69))
  {
    *((_BYTE *)WeakRetained + 69) = 1;
    objc_msgSend(WeakRetained, "_connectionQueue_handleNonLaunchingConnectionActivation");
  }

}

void __39__PSPointerClientController_sharedInit__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_18EAFD000, v4, OS_LOG_TYPE_INFO, "Received interruption for connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 2) == v3)
  {
    *((_BYTE *)WeakRetained + 69) = 0;
    objc_msgSend(WeakRetained, "_connectionQueue_handleNonLaunchingConnectionInterruption");
  }

}

void __39__PSPointerClientController_sharedInit__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD *WeakRetained;
  _QWORD *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  _QWORD *v10;
  __int128 *p_buf;
  _QWORD *v12;
  _QWORD block[7];
  _QWORD v14[5];
  id v15;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18EAFD000, v4, OS_LOG_TYPE_INFO, "Received invalidation for connection: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && (id)WeakRetained[2] == v3)
  {
    WeakRetained[2] = 0;

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy_;
    v14[4] = __Block_byref_object_dispose_;
    v15 = 0;
    v7 = v6[1];
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PSPointerClientController_sharedInit__block_invoke_12;
    block[3] = &unk_1E287B810;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = &buf;
    block[6] = v14;
    dispatch_sync(v7, block);
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __39__PSPointerClientController_sharedInit__block_invoke_2_13;
    v9[3] = &unk_1E287B838;
    v10 = v6;
    p_buf = &buf;
    v12 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&buf, 8);

  }
}

uint64_t __39__PSPointerClientController_sharedInit__block_invoke_12(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1[4] + 80), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 80), "removeAllObjects");
  v5 = objc_msgSend(*(id *)(a1[4] + 88), "copy");
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return objc_msgSend(*(id *)(a1[4] + 88), "removeAllObjects");
}

uint64_t __39__PSPointerClientController_sharedInit__block_invoke_2_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections:matchMoveSources:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (void)invalidate
{
  os_unfair_lock_s *p_invalidationAndConfigurationLock;
  NSObject *accessQueue;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  p_invalidationAndConfigurationLock = &self->_invalidationAndConfigurationLock;
  os_unfair_lock_lock(&self->_invalidationAndConfigurationLock);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PSPointerClientController_invalidate__block_invoke;
  block[3] = &unk_1E287B810;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v6;
  dispatch_sync(accessQueue, block);
  objc_msgSend((id)v13[5], "invalidate");
  objc_msgSend((id)v7[5], "invalidate");
  os_unfair_lock_unlock(p_invalidationAndConfigurationLock);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
}

void __39__PSPointerClientController_invalidate__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 16));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
  v2 = a1[4];
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = a1[4];
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

- (void)createPointerPortalSourceCollectionWithCompletion:(id)a3
{
  -[PSPointerClientController _createPointerPortalSourceCollectionForDisplay:completion:](self, "_createPointerPortalSourceCollectionForDisplay:completion:", 0, a3);
}

- (void)createPointerPortalSourceCollectionForDisplayUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  +[PSDisplay displayWithHardwareIdentifier:](PSDisplay, "displayWithHardwareIdentifier:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PSPointerClientController _createPointerPortalSourceCollectionForDisplay:completion:](self, "_createPointerPortalSourceCollectionForDisplay:completion:", v7, v6);

}

- (void)invalidatePointerPortalSourceCollection:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *connectionQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  connectionQueue = self->_connectionQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke;
  v12[3] = &unk_1E287B950;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(connectionQueue, v12);

}

void __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[69])
  {
    objc_initWeak(&location, v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2;
    v8[3] = &unk_1E287B900;
    v9 = v4;
    objc_copyWeak(&v11, &location);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "invalidatePointerPortalSourceCollection:completion:", v9, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    PSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_cold_1(a1);

    if (*(_QWORD *)(a1 + 48))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_19;
      block[3] = &unk_1E287B928;
      v7 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
}

void __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD block[5];
  id v11;

  v3 = a2;
  if (v3)
  {
    PSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2_cold_1((uint64_t)a1, v3, v4);
LABEL_4:

    goto LABEL_5;
  }
  if (a1[4])
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v4 = WeakRetained;
    if (WeakRetained)
    {
      v6 = *((_QWORD *)WeakRetained + 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_16;
      block[3] = &unk_1E287B708;
      block[4] = WeakRetained;
      v11 = a1[4];
      dispatch_sync(v6, block);

    }
    goto LABEL_4;
  }
LABEL_5:
  if (a1[5])
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2_17;
    v7[3] = &unk_1E287B8D8;
    v9 = a1[5];
    v8 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createContentMatchMoveSourcesWithCount:(unint64_t)a3 completion:(id)a4
{
  -[PSPointerClientController _createContentMatchMoveSourcesForDisplay:count:completion:](self, "_createContentMatchMoveSourcesForDisplay:count:completion:", 0, a3, a4);
}

- (void)createContentMatchMoveSourcesForDisplayUUID:(id)a3 count:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  +[PSDisplay displayWithHardwareIdentifier:](PSDisplay, "displayWithHardwareIdentifier:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PSPointerClientController _createContentMatchMoveSourcesForDisplay:count:completion:](self, "_createContentMatchMoveSourcesForDisplay:count:completion:", v9, a4, v8);

}

- (void)invalidateContentMatchMoveSources:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *connectionQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  connectionQueue = self->_connectionQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke;
  v12[3] = &unk_1E287B950;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(connectionQueue, v12);

}

void __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[69])
  {
    objc_initWeak(&location, v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2;
    v8[3] = &unk_1E287B978;
    objc_copyWeak(&v11, &location);
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "invalidateContentMatchMoveSources:completion:", v4, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    PSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_cold_1(a1);

    if (*(_QWORD *)(a1 + 48))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_22;
      block[3] = &unk_1E287B928;
      v7 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
}

void __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  char *v4;
  id WeakRetained;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  char *v12;

  v3 = a2;
  if (v3)
  {
    PSLogCommon();
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2_cold_1(v3, v4);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v4 = (char *)WeakRetained;
    if (WeakRetained)
    {
      v6 = *((_QWORD *)WeakRetained + 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_20;
      block[3] = &unk_1E287B708;
      v11 = a1[4];
      v12 = v4;
      dispatch_sync(v6, block);

    }
  }

  if (a1[5])
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2_21;
    v7[3] = &unk_1E287B8D8;
    v9 = a1[5];
    v8 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_20(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "removeObject:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2_21(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setActiveHoverRegion:(id)a3 transitionCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *connectionQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  connectionQueue = self->_connectionQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke;
  v12[3] = &unk_1E287B950;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(connectionQueue, v12);

}

void __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  id *v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_2;
  block[3] = &unk_1E287B9A0;
  block[4] = v2;
  block[5] = &v18;
  dispatch_sync(v3, block);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(unsigned __int8 *)(v5 + 69);
  if (*(_BYTE *)(v5 + 69) && (v19[3] || !*(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(v5 + 16), "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_3;
    v15[3] = &unk_1E287B9C8;
    v8 = *(_QWORD *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v7, "setActiveHoverRegion:transitionCompletion:", v8, v15);

    v9 = &v16;
LABEL_9:

    goto LABEL_10;
  }
  PSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    PSPointerClientInteractionStateToString(v19[3]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v11;
    v24 = 1024;
    v25 = v6;
    v26 = 2114;
    v27 = v12;
    _os_log_impl(&dword_18EAFD000, v10, OS_LOG_TYPE_INFO, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u, clientInteractionState: %{public}@", buf, 0x1Cu);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_23;
    v13[3] = &unk_1E287B928;
    v9 = &v14;
    v14 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v13);
    goto LABEL_9;
  }
LABEL_10:
  _Block_object_dispose(&v18, 8);
}

uint64_t __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 104);
  return result;
}

void __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_4;
    v4[3] = &unk_1E287B8D8;
    v6 = *(id *)(a1 + 32);
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

uint64_t __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__PSPointerClientController_setActiveHoverRegion_transitionCompletion___block_invoke_23(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PSPointerClientControllerErrorDomain"), -1003, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)acquireServiceKeepAliveAssertion
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PSPointerClientController_acquireServiceKeepAliveAssertion__block_invoke;
  v5[3] = &unk_1E287B9A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__PSPointerClientController_acquireServiceKeepAliveAssertion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_acquireServiceKeepAliveAssertion");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isClientInteractionEnabled
{
  return self->_clientInteractionState == 1;
}

- (void)autohidePointerForReason:(unint64_t)a3
{
  NSObject *connectionQueue;
  _QWORD block[7];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PSPointerClientController_autohidePointerForReason___block_invoke;
  block[3] = &unk_1E287B9F0;
  block[4] = self;
  block[5] = a3;
  block[6] = a2;
  dispatch_async(connectionQueue, block);
}

void __54__PSPointerClientController_autohidePointerForReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 69))
  {
    objc_msgSend(*(id *)(v2 + 16), "remoteTarget");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autohidePointerForReason:", v3);

  }
  else
  {
    PSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __54__PSPointerClientController_autohidePointerForReason___block_invoke_cold_1(a1);

  }
}

- (id)persistentlyHidePointerAssertionForReason:(unint64_t)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *accessQueue;
  _QWORD block[6];
  _QWORD v12[4];
  id v13[2];
  id location;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke;
  v12[3] = &unk_1E287BA40;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  v8 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("PSPointerHideAssertion"), v5, v12);
  accessQueue = self->_accessQueue;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_4;
  block[3] = &unk_1E287BA18;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(accessQueue, block);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v8;
}

void __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    block[1] = 3221225472;
    block[2] = __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_2;
    block[3] = &unk_1E287BA18;
    v6 = WeakRetained;
    block[0] = MEMORY[0x1E0C809B0];
    v4 = WeakRetained;
    v5 = *(_QWORD *)(a1 + 40);
    v8 = v4;
    v9 = v5;
    dispatch_sync(v3, block);

    WeakRetained = v6;
  }

}

void __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  _QWORD *v11;
  id v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD **)(a1 + 32);
  v8 = v7[4];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_3;
  v10[3] = &unk_1E287B708;
  v11 = v7;
  v12 = v6;
  v9 = v6;
  dispatch_async(v8, v10);

}

void __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 69))
  {
    objc_msgSend(*(id *)(v1 + 16), "remoteTarget");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPointerPersistentlyHiddenForReasons:", *(_QWORD *)(a1 + 40));

  }
}

void __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithCapacity:", 1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_5;
  v11[3] = &unk_1E287B708;
  v11[4] = v8;
  v12 = v7;
  v10 = v7;
  dispatch_async(v9, v11);

}

void __71__PSPointerClientController_persistentlyHidePointerAssertionForReason___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 69))
  {
    objc_msgSend(*(id *)(v1 + 16), "remoteTarget");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPointerPersistentlyHiddenForReasons:", *(_QWORD *)(a1 + 40));

  }
}

- (id)persistentlyShowPointerAssertionForReason:(unint64_t)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *accessQueue;
  _QWORD block[6];
  _QWORD v12[4];
  id v13[2];
  id location;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke;
  v12[3] = &unk_1E287BA40;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  v8 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("PSPointerShowAssertion"), v5, v12);
  accessQueue = self->_accessQueue;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_4;
  block[3] = &unk_1E287BA18;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(accessQueue, block);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v8;
}

void __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    block[1] = 3221225472;
    block[2] = __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_2;
    block[3] = &unk_1E287BA18;
    v6 = WeakRetained;
    block[0] = MEMORY[0x1E0C809B0];
    v4 = WeakRetained;
    v5 = *(_QWORD *)(a1 + 40);
    v8 = v4;
    v9 = v5;
    dispatch_sync(v3, block);

    WeakRetained = v6;
  }

}

void __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  _QWORD *v11;
  id v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = 0;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD **)(a1 + 32);
  v8 = v7[4];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_3;
  v10[3] = &unk_1E287B708;
  v11 = v7;
  v12 = v6;
  v9 = v6;
  dispatch_async(v8, v10);

}

void __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 69))
  {
    objc_msgSend(*(id *)(v1 + 16), "remoteTarget");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPointerPersistentlyVisibleForReasons:", *(_QWORD *)(a1 + 40));

  }
}

void __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithCapacity:", 1);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_5;
  v11[3] = &unk_1E287B708;
  v11[4] = v8;
  v12 = v7;
  v10 = v7;
  dispatch_async(v9, v11);

}

void __71__PSPointerClientController_persistentlyShowPointerAssertionForReason___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 69))
  {
    objc_msgSend(*(id *)(v1 + 16), "remoteTarget");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPointerPersistentlyVisibleForReasons:", *(_QWORD *)(a1 + 40));

  }
}

- (void)setSystemCursorInteractionContextID:(unsigned int)a3
{
  uint64_t v3;
  BSInvalidatable *systemPointerInteractionContextIDAssertion;
  BSInvalidatable *v6;
  BSInvalidatable *v7;
  BSInvalidatable *v8;

  v3 = *(_QWORD *)&a3;
  systemPointerInteractionContextIDAssertion = self->_systemPointerInteractionContextIDAssertion;
  if (systemPointerInteractionContextIDAssertion)
  {
    -[BSInvalidatable invalidate](systemPointerInteractionContextIDAssertion, "invalidate");
    v6 = self->_systemPointerInteractionContextIDAssertion;
    self->_systemPointerInteractionContextIDAssertion = 0;

  }
  -[PSPointerClientController setSystemPointerInteractionContextID:displayUUID:](self, "setSystemPointerInteractionContextID:displayUUID:", v3, 0);
  v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  v8 = self->_systemPointerInteractionContextIDAssertion;
  self->_systemPointerInteractionContextIDAssertion = v7;

}

- (id)setSystemPointerInteractionContextID:(unsigned int)a3 displayUUID:(id)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  PSPointerClientController *v13;
  uint64_t *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  accessQueue = self->_accessQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke;
  v11[3] = &unk_1E287BAB8;
  v12 = v6;
  v13 = self;
  v15 = a3;
  v14 = &v16;
  v8 = v6;
  dispatch_sync(accessQueue, v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  int v16;
  _QWORD block[5];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[PSDisplay displayWithHardwareIdentifier:](PSDisplay, "displayWithHardwareIdentifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 67109634;
      v23 = v16;
      v24 = 2114;
      v25 = v2;
      v26 = 1024;
      v27 = objc_msgSend(v3, "unsignedIntValue");
      _os_log_error_impl(&dword_18EAFD000, v4, OS_LOG_TYPE_ERROR, "Trying to set the systemPointerInteractionContextID to 0x%x for %{public}@ but we aleady have one: 0x%x ", buf, 0x18u);
    }

  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0D01868]);
    objc_msgSend(v2, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_38;
    v20[3] = &unk_1E287BA68;
    v20[4] = *(_QWORD *)(a1 + 40);
    v8 = v2;
    v21 = v8;
    v9 = objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("PSSystemPointerInteraction"), v6, v20);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "setObject:forKeyedSubscript:", v12, v8);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(NSObject **)(v13 + 32);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_4;
    block[3] = &unk_1E287BA90;
    block[4] = v13;
    v18 = v12;
    v19 = v8;
    v15 = v12;
    dispatch_async(v14, block);

  }
}

void __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_38(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  id v12;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_2;
  block[3] = &unk_1E287B708;
  block[4] = v3;
  v12 = v4;
  dispatch_sync(v5, block);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 32);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_3;
  v9[3] = &unk_1E287B708;
  v9[4] = v6;
  v10 = v7;
  dispatch_async(v8, v9);

}

uint64_t __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 69))
  {
    objc_msgSend(*(id *)(v1 + 16), "remoteTarget");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSystemPointerInteractionContextID:display:", 0, *(_QWORD *)(a1 + 40));

  }
}

void __78__PSPointerClientController_setSystemPointerInteractionContextID_displayUUID___block_invoke_4(_QWORD *a1)
{
  uint64_t v1;
  id v3;

  v1 = a1[4];
  if (*(_BYTE *)(v1 + 69))
  {
    objc_msgSend(*(id *)(v1 + 16), "remoteTarget");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSystemPointerInteractionContextID:display:", a1[5], a1[6]);

  }
}

- (id)acquireOverridingHoverRegionAssertionForDisplay:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  PSPointerClientController *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke;
  block[3] = &unk_1E287BAE0;
  v10 = v4;
  v11 = self;
  v12 = &v13;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  +[PSDisplay displayWithHardwareIdentifier:](PSDisplay, "displayWithHardwareIdentifier:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[5] + 128), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v3);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0D01868]);
    objc_msgSend(v2, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_41;
    v16[3] = &unk_1E287BA68;
    v16[4] = a1[5];
    v8 = v2;
    v17 = v8;
    v9 = objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("PSHoverRegionOverride"), v6, v16);
    v10 = *(_QWORD *)(a1[6] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(*(id *)(a1[5] + 128), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), v8);
    v12 = a1[5];
    v13 = *(NSObject **)(v12 + 32);
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_4;
    v14[3] = &unk_1E287B708;
    v14[4] = v12;
    v15 = v8;
    dispatch_async(v13, v14);

  }
}

void __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_41(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  id v12;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_2;
  block[3] = &unk_1E287B708;
  block[4] = v3;
  v12 = v4;
  dispatch_sync(v5, block);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 32);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_3;
  v9[3] = &unk_1E287B708;
  v9[4] = v6;
  v10 = v7;
  dispatch_async(v8, v9);

}

uint64_t __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 69))
  {
    objc_msgSend(*(id *)(v1 + 16), "remoteTarget");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOverridesHoverRegions:display:", MEMORY[0x1E0C9AAA0], *(_QWORD *)(a1 + 40));

  }
}

void __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 69))
  {
    objc_msgSend(*(id *)(v1 + 16), "remoteTarget");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOverridesHoverRegions:display:", MEMORY[0x1E0C9AAB0], *(_QWORD *)(a1 + 40));

  }
}

- (void)clientInteractionStateDidChange:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *accessQueue;
  _QWORD v8[6];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "integerValue");
  PSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    PSPointerClientInteractionStateToString(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_18EAFD000, v5, OS_LOG_TYPE_DEFAULT, "clientInteractionStateDidChange: %{public}@", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PSPointerClientController_clientInteractionStateDidChange___block_invoke;
  v8[3] = &unk_1E287BA18;
  v8[4] = self;
  v8[5] = v4;
  dispatch_sync(accessQueue, v8);
}

void __61__PSPointerClientController_clientInteractionStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  _QWORD v6[5];
  char v7;
  char v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v1 + 104);
  if (v3 != v2)
  {
    *(_QWORD *)(v1 + 104) = v2;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 104) == 1;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__PSPointerClientController_clientInteractionStateDidChange___block_invoke_2;
    v6[3] = &unk_1E287BB08;
    v6[4] = v4;
    v7 = (v3 == 1) ^ v5;
    v8 = 1;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }
}

void __61__PSPointerClientController_clientInteractionStateDidChange___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  v5 = WeakRetained;
  if (*(_BYTE *)(a1 + 40))
  {
    v3 = objc_opt_respondsToSelector();
    WeakRetained = v5;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v5, "pointerClientControllerClientInteractionEnabledDidChange:", *(_QWORD *)(a1 + 32));
      WeakRetained = v5;
    }
  }
  if (*(_BYTE *)(a1 + 41))
  {
    v4 = objc_opt_respondsToSelector();
    WeakRetained = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "pointerClientControllerClientInteractionStateDidChange:", *(_QWORD *)(a1 + 32));
      WeakRetained = v5;
    }
  }

}

- (void)pointerVisibilityStateDidChange:(id)a3
{
  uint64_t v4;
  NSObject *accessQueue;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "integerValue");
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PSPointerClientController_pointerVisibilityStateDidChange___block_invoke;
  v6[3] = &unk_1E287BA18;
  v6[4] = self;
  v6[5] = v4;
  dispatch_sync(accessQueue, v6);
}

void __61__PSPointerClientController_pointerVisibilityStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v1 + 112) != v2)
  {
    *(_QWORD *)(v1 + 112) = v2;
    PSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      PSPointerVisibilityStateToString(*(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v8 = v5;
      _os_log_impl(&dword_18EAFD000, v4, OS_LOG_TYPE_DEFAULT, "pointerVisibilityStateDidChange: %{public}@", buf, 0xCu);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PSPointerClientController_pointerVisibilityStateDidChange___block_invoke_46;
    block[3] = &unk_1E287B8B0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __61__PSPointerClientController_pointerVisibilityStateDidChange___block_invoke_46(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "pointerClientControllerPointerVisibilityStateDidChange:", *(_QWORD *)(a1 + 32));

}

- (void)adjustedDecelerationTargetPointerPosition:(id)a3 velocity:(id)a4 inContextID:(id)a5 cursorRegionLookupRadius:(id)a6 cursorRegionLookupResolution:(id)a7 lookupConeAngle:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;

  v16 = a9;
  if (v16)
  {
    v17 = a8;
    v18 = a7;
    v19 = a6;
    v20 = a5;
    v21 = a4;
    objc_msgSend(a3, "bs_CGPointValue");
    v23 = v22;
    v25 = v24;
    objc_msgSend(v21, "bs_CGPointValue");
    v27 = v26;
    v29 = v28;

    v30 = objc_msgSend(v20, "unsignedIntValue");
    objc_msgSend(v19, "doubleValue");
    v32 = v31;

    objc_msgSend(v18, "doubleValue");
    v34 = v33;

    objc_msgSend(v17, "doubleValue");
    v36 = v35;

    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __173__PSPointerClientController_adjustedDecelerationTargetPointerPosition_velocity_inContextID_cursorRegionLookupRadius_cursorRegionLookupResolution_lookupConeAngle_completion___block_invoke;
    v37[3] = &unk_1E287BB58;
    v37[4] = self;
    v39 = v23;
    v40 = v25;
    v41 = v27;
    v42 = v29;
    v46 = v30;
    v43 = v32;
    v44 = v34;
    v45 = v36;
    v38 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], v37);

  }
}

void __173__PSPointerClientController_adjustedDecelerationTargetPointerPosition_velocity_inContextID_cursorRegionLookupRadius_cursorRegionLookupResolution_lookupConeAngle_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(unsigned int *)(a1 + 104);
    v4 = *(double *)(a1 + 80);
    v5 = *(double *)(a1 + 88);
    v6 = *(double *)(a1 + 96);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __173__PSPointerClientController_adjustedDecelerationTargetPointerPosition_velocity_inContextID_cursorRegionLookupRadius_cursorRegionLookupResolution_lookupConeAngle_completion___block_invoke_2;
    v13[3] = &unk_1E287BB30;
    v7 = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v2, "pointerClientControllerWillDecelerate:targetPointerPosition:velocity:inContextID:cursorRegionLookupRadius:cursorRegionLookupResolution:lookupConeAngle:resultHandler:", v7, v3, v13, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), v4, v5, v6);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v2, "pointerClientControllerWillDecelerate:targetPointerPosition:velocity:inContextID:cursorRegionLookupRadius:cursorRegionLookupResolution:lookupConeAngle:", *(_QWORD *)(a1 + 32), &v12, *(unsigned int *)(a1 + 104), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGPoint:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

  }
}

void __173__PSPointerClientController_adjustedDecelerationTargetPointerPosition_velocity_inContextID_cursorRegionLookupRadius_cursorRegionLookupResolution_lookupConeAngle_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "bs_valueWithCGPoint:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)invalidatedPortalSourceCollections:(id)a3 matchMoveSources:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *accessQueue;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  PSPointerClientController *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v23 = objc_msgSend(v6, "count");
    v24 = 2048;
    v25 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_18EAFD000, v8, OS_LOG_TYPE_DEFAULT, "server invalidated %lu portalSourceCollections + %lu matchMoveSources", buf, 0x16u);
  }

  accessQueue = self->_accessQueue;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PSPointerClientController_invalidatedPortalSourceCollections_matchMoveSources___block_invoke;
  block[3] = &unk_1E287BA90;
  v11 = v6;
  v19 = v11;
  v20 = self;
  v12 = v7;
  v21 = v12;
  dispatch_sync(accessQueue, block);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __81__PSPointerClientController_invalidatedPortalSourceCollections_matchMoveSources___block_invoke_2;
  v15[3] = &unk_1E287BA90;
  v15[4] = self;
  v16 = v11;
  v17 = v12;
  v13 = v12;
  v14 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

void __81__PSPointerClientController_invalidatedPortalSourceCollections_matchMoveSources___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "removeObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(a1 + 48);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "removeObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

uint64_t __81__PSPointerClientController_invalidatedPortalSourceCollections_matchMoveSources___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections:matchMoveSources:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_createPointerPortalSourceCollectionForDisplay:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *connectionQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  connectionQueue = self->_connectionQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke;
  v12[3] = &unk_1E287B950;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(connectionQueue, v12);

}

void __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE location[12];
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_2;
  block[3] = &unk_1E287B9A0;
  block[4] = v2;
  block[5] = &v18;
  dispatch_sync(v3, block);
  v5 = *(unsigned __int8 **)(a1 + 32);
  v6 = v5[69];
  if (v5[69] && v19[3])
  {
    objc_initWeak((id *)location, v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_3;
    v14[3] = &unk_1E287BBA8;
    objc_copyWeak(&v16, (id *)location);
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v7, "createPointerPortalSourceCollectionForDisplay:completion:", v8, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)location);
  }
  else
  {
    PSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      PSPointerClientInteractionStateToString(v19[3]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v10;
      v23 = 1024;
      v24 = v6;
      v25 = 2114;
      v26 = v11;
      _os_log_error_impl(&dword_18EAFD000, v9, OS_LOG_TYPE_ERROR, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u, clientInteractionState: %{public}@", location, 0x1Cu);

    }
    if (*(_QWORD *)(a1 + 48))
    {
      v12[0] = v4;
      v12[1] = 3221225472;
      v12[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_58;
      v12[3] = &unk_1E287B928;
      v13 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E0C80D38], v12);

    }
  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 104);
  return result;
}

void __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char *v7;
  uint64_t v8;
  NSObject **WeakRetained;
  NSObject **v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PSLogCommon();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_3_cold_1(v6, v7);

  }
  v8 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    v10 = WeakRetained;
    if (WeakRetained)
    {
      v11 = WeakRetained[1];
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_55;
      block[3] = &unk_1E287B708;
      block[4] = WeakRetained;
      v17 = v5;
      dispatch_sync(v11, block);

    }
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_2_56;
    v12[3] = &unk_1E287BB80;
    v15 = *(id *)(a1 + 32);
    v13 = v5;
    v14 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
}

uint64_t __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_55(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_2_56(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_58(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PSPointerClientControllerErrorDomain"), -1003, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (void)_createContentMatchMoveSourcesForDisplay:(id)a3 count:(unint64_t)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *connectionQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  unint64_t v17;
  SEL v18;

  v9 = a3;
  v10 = a5;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke;
  block[3] = &unk_1E287BBF8;
  block[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = a4;
  v18 = a2;
  v12 = v10;
  v13 = v9;
  dispatch_async(connectionQueue, block);

}

void __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE location[12];
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_2;
  block[3] = &unk_1E287B9A0;
  block[4] = v2;
  block[5] = &v19;
  dispatch_sync(v3, block);
  v5 = *(unsigned __int8 **)(a1 + 32);
  v6 = v5[69];
  if (v5[69] && v20[3])
  {
    objc_initWeak((id *)location, v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_3;
    v15[3] = &unk_1E287BBD0;
    objc_copyWeak(&v17, (id *)location);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v7, "createContentMatchMoveSourcesForDisplay:countValue:completion:", v8, v9, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
  else
  {
    PSLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      PSPointerClientInteractionStateToString(v20[3]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v11;
      v24 = 1024;
      v25 = v6;
      v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_18EAFD000, v10, OS_LOG_TYPE_ERROR, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u, clientInteractionState: %{public}@", location, 0x1Cu);

    }
    if (*(_QWORD *)(a1 + 48))
    {
      v13[0] = v4;
      v13[1] = 3221225472;
      v13[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_62;
      v13[3] = &unk_1E287B928;
      v14 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E0C80D38], v13);

    }
  }
  _Block_object_dispose(&v19, 8);
}

uint64_t __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 104);
  return result;
}

void __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char *v7;
  NSObject **WeakRetained;
  NSObject **v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PSLogCommon();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_3_cold_1(v6, v7);

  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  v10 = MEMORY[0x1E0C809B0];
  if (WeakRetained)
  {
    v11 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_59;
    block[3] = &unk_1E287B708;
    block[4] = WeakRetained;
    v17 = v5;
    dispatch_sync(v11, block);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_2_60;
    v12[3] = &unk_1E287BB80;
    v15 = *(id *)(a1 + 32);
    v13 = v5;
    v14 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
}

uint64_t __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_59(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

uint64_t __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_2_60(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_62(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PSPointerClientControllerErrorDomain"), -1003, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (id)_accessQueue_acquireServiceKeepAliveAssertion
{
  id v3;
  uint64_t v4;
  void *v5;
  NSMutableArray *serviceKeepAliveAssertions;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSObject *connectionQueue;
  _QWORD block[5];
  _QWORD v12[4];
  id v13;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D01868]);
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke;
  v12[3] = &unk_1E287BC20;
  objc_copyWeak(&v13, &location);
  v5 = (void *)objc_msgSend(v3, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("PSPointerServiceKeepAliveAssertion"), CFSTR("ClientRequested"), v12);
  serviceKeepAliveAssertions = self->_serviceKeepAliveAssertions;
  if (!serviceKeepAliveAssertions)
  {
    v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v8 = self->_serviceKeepAliveAssertions;
    self->_serviceKeepAliveAssertions = v7;

    serviceKeepAliveAssertions = self->_serviceKeepAliveAssertions;
  }
  -[NSMutableArray addObject:](serviceKeepAliveAssertions, "addObject:", v5);
  if (-[NSMutableArray count](self->_serviceKeepAliveAssertions, "count") == 1)
  {
    connectionQueue = self->_connectionQueue;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_4;
    block[3] = &unk_1E287B8B0;
    block[4] = self;
    dispatch_async(connectionQueue, block);
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v5;
}

void __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  _QWORD *v8;
  id v9;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_2;
    block[3] = &unk_1E287B708;
    v8 = WeakRetained;
    v9 = v6;
    dispatch_sync(v5, block);

  }
}

void __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"))
    {
      v2 = *(_QWORD **)(a1 + 32);
      v3 = v2[4];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_3;
      block[3] = &unk_1E287B8B0;
      v5 = v2;
      dispatch_async(v3, block);

    }
  }
}

void __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 68))
  {
    objc_msgSend(*(id *)(v1 + 24), "remoteTarget");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWantsServiceKeepAlive:", MEMORY[0x1E0C9AAA0]);

  }
}

void __74__PSPointerClientController__accessQueue_acquireServiceKeepAliveAssertion__block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_launchingConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 68))
  {
    *(_BYTE *)(v3 + 68) = 1;
    PSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138543362;
      v7 = v2;
      _os_log_impl(&dword_18EAFD000, v4, OS_LOG_TYPE_INFO, "Activating Launching Connection: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(v2, "activate");
  }
  objc_msgSend(v2, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWantsServiceKeepAlive:", MEMORY[0x1E0C9AAB0]);

}

- (void)_connectionQueue_handleNonLaunchingConnectionActivation
{
  NSObject *accessQueue;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD block[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  accessQueue = self->_accessQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke;
  block[3] = &unk_1E287BC48;
  block[4] = self;
  block[5] = &v25;
  block[6] = &v19;
  block[7] = &v13;
  dispatch_sync(accessQueue, block);
  v5 = (void *)v20[5];
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke_2;
  v11[3] = &unk_1E287BC70;
  v11[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);
  v6 = (void *)v14[5];
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke_3;
  v10[3] = &unk_1E287BC98;
  v10[4] = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);
  if (objc_msgSend((id)v26[5], "count"))
  {
    -[BSServiceConnection remoteTarget](self->_nonLaunchingConnection, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPointerPersistentlyHiddenForReasons:", v26[5]);

  }
  if (-[NSCountedSet count](self->_persistentPointerShowReasons, "count"))
  {
    -[NSCountedSet allObjects](self->_persistentPointerShowReasons, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSServiceConnection remoteTarget](self->_nonLaunchingConnection, "remoteTarget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPointerPersistentlyVisibleForReasons:", v8);

  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

}

void __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1[4] + 40), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_msgSend(*(id *)(a1[4] + 120), "copy");
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = objc_msgSend(*(id *)(a1[4] + 128), "copy");
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "remoteTarget");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSystemPointerInteractionContextID:display:", v5, v6);

}

void __84__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionActivation__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  objc_msgSend(v2, "remoteTarget");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverridesHoverRegions:display:", MEMORY[0x1E0C9AAB0], v3);

}

- (void)_connectionQueue_handleNonLaunchingConnectionInterruption
{
  NSObject *accessQueue;
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionInterruption__block_invoke;
  block[3] = &unk_1E287B8B0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  -[BSServiceConnection activate](self->_nonLaunchingConnection, "activate");
}

void __86__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionInterruption__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  BOOL v13;
  BOOL v14;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 104);
  if (v3)
  {
    v4 = v3 == 1;
    *(_QWORD *)(v2 + 104) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  v5 = v3 != 0;
  v6 = (void *)objc_msgSend(*(id *)(v2 + 80), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
  v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionInterruption__block_invoke_2;
  v10[3] = &unk_1E287BCC0;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v4;
  v14 = v5;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __86__PSPointerClientController__connectionQueue_handleNonLaunchingConnectionInterruption__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections:matchMoveSources:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  v5 = WeakRetained;
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = objc_opt_respondsToSelector();
    WeakRetained = v5;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v5, "pointerClientControllerClientInteractionEnabledDidChange:", *(_QWORD *)(a1 + 32));
      WeakRetained = v5;
    }
  }
  if (*(_BYTE *)(a1 + 57))
  {
    v4 = objc_opt_respondsToSelector();
    WeakRetained = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "pointerClientControllerClientInteractionStateDidChange:", *(_QWORD *)(a1 + 32));
      WeakRetained = v5;
    }
  }

}

- (void)_connectionQueue_handleLaunchingConnectionInterruption
{
  NSObject *accessQueue;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PSPointerClientController__connectionQueue_handleLaunchingConnectionInterruption__block_invoke;
  v7[3] = &unk_1E287B9A0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(accessQueue, v7);
  if (*((_BYTE *)v9 + 24))
  {
    -[PSPointerClientController _connectionQueue_launchingConnection](self, "_connectionQueue_launchingConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_hasActivatedLaunchingConnection)
    {
      self->_hasActivatedLaunchingConnection = 1;
      PSLogCommon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v4;
        _os_log_impl(&dword_18EAFD000, v5, OS_LOG_TYPE_INFO, "Activating Launching Connection: %{public}@", buf, 0xCu);
      }

      objc_msgSend(v4, "activate");
    }
    objc_msgSend(v4, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWantsServiceKeepAlive:", MEMORY[0x1E0C9AAB0]);

  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __83__PSPointerClientController__connectionQueue_handleLaunchingConnectionInterruption__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (id)_connectionQueue_launchingConnection
{
  BSServiceConnection *launchingConnection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BSServiceConnection *v8;
  BSServiceConnection *v9;
  BSServiceConnection *v10;
  _QWORD v12[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  launchingConnection = self->_launchingConnection;
  if (!launchingConnection)
  {
    v4 = (void *)MEMORY[0x1E0D03458];
    +[PSPointerClientDefaultLaunchingServiceSpecification machName](PSPointerClientDefaultLaunchingServiceSpecification, "machName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSPointerClientDefaultLaunchingServiceSpecification serviceName](PSPointerClientDefaultLaunchingServiceSpecification, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointForMachName:service:instance:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v7);
    v8 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
    v9 = self->_launchingConnection;
    self->_launchingConnection = v8;

    v10 = self->_launchingConnection;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke;
    v12[3] = &unk_1E287BD08;
    v12[4] = self;
    -[BSServiceConnection configureConnection:](v10, "configureConnection:", v12);

    launchingConnection = self->_launchingConnection;
  }
  return launchingConnection;
}

void __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  +[PSPointerClientDefaultLaunchingServiceSpecification serviceQuality](PSPointerClientDefaultLaunchingServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[PSPointerClientDefaultLaunchingServiceSpecification interface](PSPointerClientDefaultLaunchingServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(v3, "setActivationHandler:", &__block_literal_global_0);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke_71;
  v9[3] = &unk_1E287B7E8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke_72;
  v7[3] = &unk_1E287B7E8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PSLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EAFD000, v3, OS_LOG_TYPE_INFO, "Launching Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke_71(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_18EAFD000, v4, OS_LOG_TYPE_INFO, "Received interruption for launching connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 3) == v3)
  {
    *((_BYTE *)WeakRetained + 68) = 0;
    objc_msgSend(WeakRetained, "_connectionQueue_handleLaunchingConnectionInterruption");
  }

}

void __65__PSPointerClientController__connectionQueue_launchingConnection__block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_18EAFD000, v4, OS_LOG_TYPE_INFO, "Received invalidation for launching connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 3) == v3)
  {
    *((_BYTE *)WeakRetained + 68) = 0;
    *((_QWORD *)WeakRetained + 3) = 0;

  }
}

- (void)_main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections:(id)a3 matchMoveSources:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *accessQueue;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  -[PSPointerClientController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "pointerClientController:didInvalidatePortalSourceCollections:matchMoveSources:", self, v6, v7);
  }
  else
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy_;
    v33 = __Block_byref_object_dispose_;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __133__PSPointerClientController__main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections_matchMoveSources___block_invoke;
    block[3] = &unk_1E287B810;
    block[4] = self;
    block[5] = &v29;
    block[6] = &v23;
    dispatch_sync(accessQueue, block);
    PSLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend((id)v30[5], "count");
      v12 = objc_msgSend((id)v24[5], "count");
      *(_DWORD *)buf = 134218240;
      v37 = v11;
      v38 = 2048;
      v39 = v12;
      _os_log_impl(&dword_18EAFD000, v10, OS_LOG_TYPE_DEFAULT, "delegate doesn't support individual source invalidation, invalidating %lu additional portalSourceCollections + %lu additional matchMoveSources", buf, 0x16u);
    }

    objc_msgSend((id)v24[5], "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSPointerClientController invalidateContentMatchMoveSources:completion:](self, "invalidateContentMatchMoveSources:completion:", v13, 0);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v14 = (id)v30[5];
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v35, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v14);
          -[PSPointerClientController invalidatePointerPortalSourceCollection:completion:](self, "invalidatePointerPortalSourceCollection:completion:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), 0, (_QWORD)v18);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v35, 16);
      }
      while (v15);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "pointerClientControllerDidInvalidateRemoteSources:", self);
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
  }

}

uint64_t __133__PSPointerClientController__main_notifyDelegateOfInvalidatedRemoteSourcesSpecificallyThesePortalSourceCollections_matchMoveSources___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1[4] + 80), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 80), "removeAllObjects");
  v5 = objc_msgSend(*(id *)(a1[4] + 88), "copy");
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return objc_msgSend(*(id *)(a1[4] + 88), "removeAllObjects");
}

- (PSPointerClientControllerDelegate)delegate
{
  return (PSPointerClientControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)clientInteractionState
{
  return self->_clientInteractionState;
}

- (int64_t)pointerVisibilityState
{
  return self->_pointerVisibilityState;
}

- (NSMutableDictionary)systemPointerInteractionContextIDs
{
  return self->_systemPointerInteractionContextIDs;
}

- (void)setSystemPointerInteractionContextIDs:(id)a3
{
  objc_storeStrong((id *)&self->_systemPointerInteractionContextIDs, a3);
}

- (NSMutableDictionary)hoverRegionOverridingAssertions
{
  return self->_hoverRegionOverridingAssertions;
}

- (void)setHoverRegionOverridingAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_hoverRegionOverridingAssertions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverRegionOverridingAssertions, 0);
  objc_storeStrong((id *)&self->_systemPointerInteractionContextIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessQueue_validMatchMoveSources, 0);
  objc_storeStrong((id *)&self->_accessQueue_validPortalSourceCollections, 0);
  objc_storeStrong((id *)&self->_systemPointerInteractionContextIDAssertion, 0);
  objc_storeStrong((id *)&self->_serviceKeepAliveAssertions, 0);
  objc_storeStrong((id *)&self->_persistentPointerShowReasons, 0);
  objc_storeStrong((id *)&self->_persistentPointerHideReasons, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_launchingConnection, 0);
  objc_storeStrong((id *)&self->_nonLaunchingConnection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18EAFD000, v2, v3, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

void __80__PSPointerClientController_invalidatePointerPortalSourceCollection_completion___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = 134218240;
  v6 = v4;
  v7 = 2048;
  v8 = objc_msgSend(a2, "code");
  _os_log_error_impl(&dword_18EAFD000, a3, OS_LOG_TYPE_ERROR, "Failed to invalidate pointer portal source collection %p error: %ld", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_0_0();
}

void __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18EAFD000, v2, v3, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

void __74__PSPointerClientController_invalidateContentMatchMoveSources_completion___block_invoke_2_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18EAFD000, v2, v3, "Failed to invalidate match move sources error: %ld", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_0_0();
}

void __54__PSPointerClientController_autohidePointerForReason___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(*(SEL *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18EAFD000, v2, v3, "Unable to send message for %{public}@ with isConnectionActive: %{BOOL}u", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

void __77__PSPointerClientController_acquireOverridingHoverRegionAssertionForDisplay___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_18EAFD000, v0, OS_LOG_TYPE_ERROR, "Trying to acquire an overriding hover region assertion but we already have one for this display %{public}@, returning the existing assertion.", v1, 0xCu);
}

void __87__PSPointerClientController__createPointerPortalSourceCollectionForDisplay_completion___block_invoke_3_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18EAFD000, v2, v3, "Failed to create pointer portal source collection: %ld", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_0_0();
}

void __87__PSPointerClientController__createContentMatchMoveSourcesForDisplay_count_completion___block_invoke_3_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_5(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_18EAFD000, v2, v3, "Failed to create match move source: %ld", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_0_0();
}

@end
