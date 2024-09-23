@implementation PDRRegistry

- (void)getDevicesWithBlock:(id)a3
{
  void (**v4)(id, id);
  id v5;

  v4 = (void (**)(id, id))a3;
  -[PDRRegistry getDevicesExcluding:](self, "getDevicesExcluding:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

- (id)getDevices
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "activePairedDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDRRegistry getDevicesMatching:](self, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getPairedDevices
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "pairedDevicesSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDRRegistry getDevicesMatching:](self, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getSetupCompletedDevices
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "setupCompletedDevicesSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDRRegistry getDevicesMatching:](self, "getDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getAllDevices
{
  return -[PDRRegistry getDevicesMatching:](self, "getDevicesMatching:", &__block_literal_global);
}

uint64_t __47__PDRRegistry_NanoRegistryStyle__getAllDevices__block_invoke()
{
  return 1;
}

- (id)getAllDevicesWithArchivedDevices
{
  return -[PDRRegistry getAllDevicesWithArchivedDevicesMatching:](self, "getAllDevicesWithArchivedDevicesMatching:", &__block_literal_global_1);
}

uint64_t __66__PDRRegistry_NanoRegistryStyle__getAllDevicesWithArchivedDevices__block_invoke()
{
  return 1;
}

+ (id)activeDeviceSelectorBlock
{
  return &__block_literal_global_2;
}

uint64_t __59__PDRRegistry_NanoRegistryStyle__activeDeviceSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive");
}

+ (id)pairedDevicesSelectorBlock
{
  return &__block_literal_global_3;
}

uint64_t __60__PDRRegistry_NanoRegistryStyle__pairedDevicesSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPaired");
}

+ (id)activePairedDeviceSelectorBlock
{
  return &__block_literal_global_4;
}

uint64_t __65__PDRRegistry_NanoRegistryStyle__activePairedDeviceSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isPaired"))
    v3 = objc_msgSend(v2, "isActive");
  else
    v3 = 0;

  return v3;
}

+ (id)setupCompletedDevicesSelectorBlock
{
  return &__block_literal_global_5;
}

uint64_t __68__PDRRegistry_NanoRegistryStyle__setupCompletedDevicesSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isPaired"))
    v3 = objc_msgSend(v2, "isSetup");
  else
    v3 = 0;

  return v3;
}

- (id)getDevicesMatching:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__PDRRegistry_NanoRegistryStyle__getDevicesMatching___block_invoke;
  v8[3] = &unk_2513D9C40;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[PDRRegistry getDevicesWithBlock:](self, "getDevicesWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __53__PDRRegistry_NanoRegistryStyle__getDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isArchived") & 1) == 0
          && (objc_msgSend(v8, "isAltAccount") & 1) == 0
          && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)getAllDevicesWithArchivedDevicesMatching:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__PDRRegistry_NanoRegistryStyle__getAllDevicesWithArchivedDevicesMatching___block_invoke;
  v8[3] = &unk_2513D9C40;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[PDRRegistry getDevicesWithBlock:](self, "getDevicesWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __75__PDRRegistry_NanoRegistryStyle__getAllDevicesWithArchivedDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() && (objc_msgSend(v8, "isAltAccount") & 1) == 0)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)getAllDevicesWithArchivedAltAccountDevicesMatching:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__PDRRegistry_NanoRegistryStyle__getAllDevicesWithArchivedAltAccountDevicesMatching___block_invoke;
  v8[3] = &unk_2513D9C40;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[PDRRegistry getDevicesWithBlock:](self, "getDevicesWithBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __85__PDRRegistry_NanoRegistryStyle__getAllDevicesWithArchivedAltAccountDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)deviceFromNRDevice:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDRRegistry deviceForPairingID:](self, "deviceForPairingID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PDRRegistry)init
{
  NSObject *v3;
  dispatch_queue_t v4;
  PDRRegistry *v6;
  objc_super v7;

  instanceClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.nanoregistry.paireddeviceregistry", v3);
    -[PDRRegistry setCallbackQueue:](self, "setCallbackQueue:", v4);

    v7.receiver = self;
    v7.super_class = (Class)PDRRegistry;
    return -[PDRRegistry init](&v7, sel_init);
  }
  else
  {
    v6 = (PDRRegistry *)objc_alloc_init((Class)instanceClass());

    return v6;
  }
}

+ (id)sharedInstance
{
  return (id)objc_msgSend(instanceClass(), "sharedInstance");
}

+ (BOOL)supportsPairedDevice
{
  return +[PDRRegistry_Impl supportsWatch](PDRRegistry_Impl, "supportsWatch");
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (BOOL)started
{
  BOOL result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (int64_t)status
{
  int64_t result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (int64_t)compatibilityState
{
  int64_t result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (void)start
{
  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
}

- (void)stop
{
  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
}

- (BOOL)isPaired
{
  BOOL result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)pairingStorePath
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)pairingID
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (unint64_t)switchIndex
{
  unint64_t result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)getDevicesExcluding:(unint64_t)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)getActivePairedDeviceIncludingAltAccount
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)getActivePairedDeviceExcludingAltAccount
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)getActiveDevice
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (void)getSwitchEventsAfterIndex:(unsigned int)a3 process:(id)a4
{
  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
}

- (id)deviceForBluetoothID:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (id)deviceForPairingID:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

- (void)addDelegate:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
}

- (BOOL)removeDelegate:(id)a3
{
  BOOL result;

  OUTLINED_FUNCTION_1_0();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  return result;
}

@end
