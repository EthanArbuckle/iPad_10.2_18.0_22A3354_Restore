@implementation SFContinuityScanManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_14);
  return (id)sharedManager_manager;
}

void __40__SFContinuityScanManager_sharedManager__block_invoke()
{
  SFContinuityScanManager *v0;
  void *v1;

  if (SFDeviceSupportsContinuity())
    v0 = objc_alloc_init(SFContinuityScanManager);
  else
    v0 = 0;
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (SFContinuityScanManager)init
{
  SFContinuityScanManager *v2;
  SFContinuityScanManager *v3;
  NSMutableSet *v4;
  NSMutableSet *foundDevices;
  uint64_t v6;
  NSHashTable *observers;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFContinuityScanManager;
  v2 = -[SFXPCClient init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_scanTypes = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    foundDevices = v3->_foundDevices;
    v3->_foundDevices = v4;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v6;

    v9.receiver = v3;
    v9.super_class = (Class)SFContinuityScanManager;
    -[SFXPCClient _activate](&v9, sel__activate);
  }
  return v3;
}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v6;
    if (!v5)
    {
      -[NSHashTable addObject:](self->_observers, "addObject:", v6);
      v4 = v6;
    }
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
  {
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    if (!-[NSHashTable count](self->_observers, "count"))
    {
      handoff_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "all observers gone, resetting scan types", v6, 2u);
      }

      -[SFContinuityScanManager scanForTypes:](self, "scanForTypes:", 0);
    }
  }

}

- (void)scanForTypes:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFActivityScanner/scanForTypes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  -[SFContinuityScanManager setScanTypes:](self, "setScanTypes:", a3);
  handoff_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    SFActivityScanTypesToString(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "client process changing types to scan for to %@", buf, 0xCu);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__SFContinuityScanManager_scanForTypes___block_invoke;
  v8[3] = &__block_descriptor_40_e47_v16__0__NSObject_SFContinuityScannerProtocol__8l;
  v8[4] = a3;
  -[SFContinuityScanManager _getRemoteObjectProxyOnQueue:](self, "_getRemoteObjectProxyOnQueue:", v8);
  os_activity_scope_leave(&state);

}

uint64_t __40__SFContinuityScanManager_scanForTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scanForTypes:", *(_QWORD *)(a1 + 32));
}

- (void)activityPayloadFromDeviceUniqueID:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  objc_class *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = _os_activity_create(&dword_1A2830000, "Sharing/SFActivityScanner/activityPayloadFromDeviceUniqueID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  handoff_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    SFHexStringForData(v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = v19;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v20;
    _os_log_impl(&dword_1A2830000, v17, OS_LOG_TYPE_DEFAULT, "[%@] Dispatching payload request to %@ for %@", buf, 0x20u);

  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __123__SFContinuityScanManager_activityPayloadFromDeviceUniqueID_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke;
  v25[3] = &unk_1E482F898;
  v21 = v12;
  v26 = v21;
  v22 = v13;
  v27 = v22;
  v23 = v14;
  v28 = v23;
  v30 = a6;
  v24 = v15;
  v29 = v24;
  -[SFContinuityScanManager _getRemoteObjectProxyOnQueue:](self, "_getRemoteObjectProxyOnQueue:", v25);

  os_activity_scope_leave(&state);
}

uint64_t __123__SFContinuityScanManager_activityPayloadFromDeviceUniqueID_forAdvertisementPayload_command_timeout_withCompletionHandler___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "activityPayloadFromDeviceUniqueID:forAdvertisementPayload:command:timeout:withCompletionHandler:", a1[4], a1[5], a1[6], a1[8], a1[7]);
}

- (void)onqueue_connectionEstablished
{
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, a1, a3, "[%s]", a5, a6, a7, a8, 2u);
}

- (void)onqueue_connectionInterrupted
{
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, a1, a3, "[%s]", a5, a6, a7, a8, 2u);
}

- (void)receivedAdvertisement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t i;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const __CFString *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFContinuityScanManager observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = CFSTR("YES");
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "scanManager:receivedAdvertisement:", self, v4, (_QWORD)v17);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v9);
  }
  else
  {
    v11 = CFSTR("NO");
  }

  handoff_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_1A2830000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Received advertisement %@. Handled:%@", buf, 0x20u);

  }
}

- (void)foundDeviceWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t i;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  const __CFString *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableSet addObject:](self->_foundDevices, "addObject:", v4);
  -[SFContinuityScanManager observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = CFSTR("YES");
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "scanManager:foundDeviceWithDevice:", self, v4, (_QWORD)v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v9);
  }
  else
  {
    v11 = CFSTR("NO");
  }

  handoff_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v15;
    v22 = 2112;
    v23 = v4;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_1A2830000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Found device %@. Handled:%@", buf, 0x20u);

  }
}

- (void)lostDeviceWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t i;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  const __CFString *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableSet removeObject:](self->_foundDevices, "removeObject:", v4);
  -[SFContinuityScanManager observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = CFSTR("YES");
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "scanManager:lostDeviceWithDevice:", self, v4, (_QWORD)v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v9);
  }
  else
  {
    v11 = CFSTR("NO");
  }

  handoff_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v15;
    v22 = 2112;
    v23 = v4;
    v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_1A2830000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Lost device %@. Handled:%@", buf, 0x20u);

  }
}

- (void)pairedDevicesChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFContinuityScanManager observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "scanManager:pairedDevicesChanged:", self, v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)machServiceName
{
  return CFSTR("com.apple.sharing.handoff.scanning");
}

- (id)exportedInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B8958);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_receivedAdvertisement_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_foundDeviceWithDevice_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_lostDeviceWithDevice_, 0, 0);
  v3 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_pairedDevicesChanged_, 0, 0);

  return v2;
}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DB9E8);
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (NSMutableSet)foundDevices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFoundDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObservers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)scanTypes
{
  return self->_scanTypes;
}

- (void)setScanTypes:(unint64_t)a3
{
  self->_scanTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_foundDevices, 0);
}

@end
