@implementation SFAutoUnlockManager

+ (BOOL)mockedAutoUnlockEnabled
{
  return !+[SFAutoUnlockManager mockedPhoneAutoUnlockNoPairedWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoPairedWatch");
}

+ (BOOL)autoUnlockEnabled
{
  int v2;
  __CFString *v3;
  __CFString *v4;
  CFTypeID v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = _os_feature_enabled_impl();
  if (v2)
  {
    v3 = (__CFString *)SCDynamicStoreCopyValue(0, CFSTR("com.apple.sharing:/AutoUnlock/Enabled"));
    v4 = v3;
    if (v3 && (v5 = CFGetTypeID(v3), v5 == CFDictionaryGetTypeID()))
    {
      auto_unlock_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, "Dynamic store enabled state %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), getuid());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[__CFString objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

      }
      else
      {
        v11 = 0;
      }
      auto_unlock_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        +[SFAutoUnlockManager autoUnlockEnabled].cold.1((uint64_t)v7, v11, v13);

    }
    else
    {
      auto_unlock_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = CFSTR("com.apple.sharing:/AutoUnlock/Enabled");
        _os_log_impl(&dword_1A2830000, v12, OS_LOG_TYPE_DEFAULT, "No value at path: %@", buf, 0xCu);
      }

      if (v4)
        CFRelease(v4);
      v11 = 0;
    }
    LOBYTE(v2) = v11 != 0;
  }
  return v2;
}

+ (BOOL)autoUnlockEnabled:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)copySharingPrefValue(CFSTR("AUTestDictionary"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AUTestMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) == 0)
    {
LABEL_4:
      v9 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v10 = objc_msgSend(v7, "isEqual:", CFSTR("1"));

    if (!v10)
      goto LABEL_4;
  }
  auto_unlock_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v14 = v3;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "Using test mode (uid: %u, test dictionary %@)", buf, 0x12u);
  }

  v9 = 1;
LABEL_9:

  return v9;
}

- (SFAutoUnlockManager)init
{
  SFAutoUnlockManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *delegateQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAutoUnlockManager;
  v2 = -[SFAutoUnlockManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.sharing.auto-unlock.delegate-queue", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (double)spinnerDelay
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)copySharingPrefValue(CFSTR("AUSpinnerDelay"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 3.5;
  }

  return v5;
}

+ (BOOL)mockedBluetoothAndWiFiEnabled
{
  return !+[SFAutoUnlockManager mockedPhoneAutoUnlockWiFiOff](SFAutoUnlockManager, "mockedPhoneAutoUnlockWiFiOff");
}

+ (BOOL)bluetoothAndWiFiEnabled
{
  return +[SFAutoUnlockManager mockedBluetoothAndWiFiEnabled](SFAutoUnlockManager, "mockedBluetoothAndWiFiEnabled");
}

+ (void)mockedEnableBluetoothAndWiFi
{
  id v2;

  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 0, CFSTR("phoneAutoUnlockWiFiOff"));

}

+ (void)enableBluetoothAndWiFi
{
  +[SFAutoUnlockManager mockedEnableBluetoothAndWiFi](SFAutoUnlockManager, "mockedEnableBluetoothAndWiFi");
}

- (void)repairCloudPairing
{
  +[SFAutoUnlockManager autoUnlockSupported](SFAutoUnlockManager, "autoUnlockSupported");
}

- (void)mockedEligibleAutoUnlockDevicesWithCompletionHandler:(id)a3
{
  void (**v3)(id, void *, void *);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *, void *))a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setUniqueID:", CFSTR("fake watch unique id"));
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "setBluetoothID:", v6);

    objc_msgSend(v5, "setModelIdentifier:", CFSTR("Watch5,3"));
    objc_msgSend(v5, "setProductName:", CFSTR("watchOS"));
    objc_msgSend(v5, "setProductVersion:", CFSTR("7.5"));
    objc_msgSend(v5, "setProductBuildVersion:", CFSTR("some build in HunterE"));
    objc_msgSend(v5, "setName:", CFSTR("fake watch"));
    objc_msgSend(v5, "setEnclosureColor:", CFSTR("graphite"));
    objc_msgSend(v5, "setDefaultPairedDevice:", 1);
    objc_msgSend(v5, "setModelName:", CFSTR("Apple Watch"));
    objc_msgSend(v5, "setMajorOSVersion:", 7);
    objc_msgSend(v5, "setSupportsApproveWithWatch:", 1);
    objc_msgSend(v5, "setSupportsApproveIcon:", 1);
    objc_msgSend(v5, "setSupportsEncryption:", 1);
    objc_msgSend(v5, "setSupportsAdvertisingUnlocked:", 1);
    objc_msgSend(v5, "setSupportsConnectionCache:", 1);
    objc_msgSend(v5, "setSupportsHEIC:", 1);
    objc_msgSend(v4, "addObject:", v5);

  }
  v7 = +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateErrorCode");
  if (v7 < 1)
  {
    v11 = 0;
  }
  else
  {
    v8 = v7;
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("simulated error");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v3[2](v3, v4, v11);

}

- (void)eligibleAutoUnlockDevicesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *delegateQueue;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;
  _QWORD block[4];
  id v24;

  v4 = a3;
  if (v4)
  {
    if (+[SFAutoUnlockManager autoUnlockSupported](SFAutoUnlockManager, "autoUnlockSupported"))
    {
      auto_unlock_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Client requesting eligible devices", buf, 2u);
      }

      *(_QWORD *)buf = 0;
      v20 = buf;
      v21 = 0x2020000000;
      v22 = 0;
      if (_os_feature_enabled_impl()
        && +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
      {
        -[SFAutoUnlockManager mockedEligibleAutoUnlockDevicesWithCompletionHandler:](self, "mockedEligibleAutoUnlockDevicesWithCompletionHandler:", v4);
      }
      else
      {
        +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_278;
        v16[3] = &unk_1E482EB78;
        v16[4] = self;
        v18 = buf;
        v17 = v4;
        objc_msgSend(v15, "unlockManagerWithCompletionHandler:", v16);

      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke;
      block[3] = &unk_1E482DCC0;
      v24 = v4;
      dispatch_async(delegateQueue, block);

    }
  }
  else
  {
    auto_unlock_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SFAutoUnlockManager eligibleAutoUnlockDevicesWithCompletionHandler:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

void __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), 115, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_278(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD block[4];
  id v17;
  __int128 v18;
  _QWORD v19[5];
  __int128 v20;
  _QWORD v21[5];
  __int128 v22;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E482EB00;
    v21[4] = *(_QWORD *)(a1 + 32);
    v13 = *(_OWORD *)(a1 + 40);
    v7 = (id)v13;
    v22 = v13;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_4;
    v19[3] = &unk_1E482EB50;
    v19[4] = *(_QWORD *)(a1 + 32);
    v14 = *(_OWORD *)(a1 + 40);
    v9 = (id)v14;
    v20 = v14;
    objc_msgSend(v8, "eligibleAutoUnlockDevicesWithCompletionHandler:", v19);

    v10 = (void *)v22;
  }
  else
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_6;
    block[3] = &unk_1E482EAD8;
    v15 = *(_OWORD *)(a1 + 40);
    v12 = (id)v15;
    v18 = v15;
    v17 = v5;
    dispatch_async(v11, block);

    v10 = (void *)v18;
  }

}

void __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E482EAD8;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E482EB28;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_5(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 48) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __70__SFAutoUnlockManager_eligibleAutoUnlockDevicesWithCompletionHandler___block_invoke_6(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)mockedEnableAutoUnlockWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *delegateQueue;
  id v18;
  void *v19;
  int64_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch"))
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v36[0] = CFSTR("Apple Watch Not Found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = 131;
LABEL_7:
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), v8, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchLocked](SFAutoUnlockManager, "mockedPhoneAutoUnlockWatchLocked"))
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    SFLocalizedStringForKey(CFSTR("UNLOCK_WATCH_LOCKED_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = 102;
  }
  else
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockFaceIDDisabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockFaceIDDisabled"))
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("FaceID disabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v13;
      v8 = 205;
      goto LABEL_7;
    }
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchHasWeakPasscode](SFAutoUnlockManager, "mockedPhoneAutoUnlockWatchHasWeakPasscode"))
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      SFLocalizedStringForKey(CFSTR("UNLOCK_PASSCODE_REQUIRED_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      v12 = 108;
    }
    else
    {
      if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchWristDetectionDisabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockWatchWristDetectionDisabled"))
      {
        if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateErrorCode") < 1)goto LABEL_17;
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v20 = +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateErrorCode");
        v25 = *MEMORY[0x1E0CB2D50];
        v26 = CFSTR("Custom error code");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v19;
        v8 = v20;
        goto LABEL_7;
      }
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0CB2D50];
      SFLocalizedStringForKey(CFSTR("UNLOCK_WRIST_DETECTION_REQUIRED_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      v12 = 158;
    }
  }
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), v12, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  if (!v14)
  {
LABEL_17:
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBool:forKey:", 0, CFSTR("phoneAutoUnlockNoPairedWatch"));

    -[SFAutoUnlockManager enabledDevice:](self, "enabledDevice:", v4);
    goto LABEL_18;
  }
  delegateQueue = self->_delegateQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __56__SFAutoUnlockManager_mockedEnableAutoUnlockWithDevice___block_invoke;
  v22[3] = &unk_1E482EBA0;
  v22[4] = self;
  v23 = v14;
  v24 = v4;
  v18 = v14;
  dispatch_async(delegateQueue, v22);

LABEL_18:
}

uint64_t __56__SFAutoUnlockManager_mockedEnableAutoUnlockWithDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onDelegateQueue_notifyDelegateOfEnableError:device:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4
{
  id v6;
  id v7;
  NSObject *delegateQueue;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD block[5];
  id v18;
  _QWORD v19[3];
  char v20;

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  if (!v6)
  {
    delegateQueue = self->_delegateQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_6;
    v12[3] = &unk_1E482EC40;
    v12[4] = self;
    v12[5] = v19;
    dispatch_async(delegateQueue, v12);
    goto LABEL_9;
  }
  if (!+[SFAutoUnlockManager autoUnlockSupported](SFAutoUnlockManager, "autoUnlockSupported"))
  {
    v9 = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke;
    block[3] = &unk_1E482D3A0;
    block[4] = self;
    v18 = v6;
    dispatch_async(v9, block);
    v10 = v18;
LABEL_8:

    goto LABEL_9;
  }
  if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_2;
    v13[3] = &unk_1E482EC18;
    v13[4] = self;
    v16 = v19;
    v14 = v6;
    v15 = v7;
    objc_msgSend(v11, "unlockManagerWithCompletionHandler:", v13);

    v10 = v14;
    goto LABEL_8;
  }
  -[SFAutoUnlockManager mockedEnableAutoUnlockWithDevice:](self, "mockedEnableAutoUnlockWithDevice:", v6);
LABEL_9:
  _Block_object_dispose(v19, 8);

}

void __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), 115, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onDelegateQueue_notifyDelegateOfEnableError:device:", v3, *(_QWORD *)(a1 + 40));

}

void __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];
  _QWORD v16[5];
  id v17;
  _QWORD v18[2];

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_3;
    v16[3] = &unk_1E482EBF0;
    v7 = *(_QWORD *)(a1 + 56);
    v16[4] = *(_QWORD *)(a1 + 32);
    v18[1] = v7;
    v8 = &v17;
    v17 = v5;
    v9 = (id *)v18;
    v18[0] = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enableAutoUnlockWithDevice:passcode:clientProxy:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(NSObject **)(v11 + 16);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_5;
    v13[3] = &unk_1E482EBC8;
    v15[1] = *(_QWORD *)(a1 + 56);
    v13[4] = v11;
    v8 = &v14;
    v14 = v5;
    v9 = (id *)v15;
    v15[0] = *(id *)(a1 + 40);
    dispatch_async(v12, v13);
  }

}

void __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_4;
  v5[3] = &unk_1E482EBC8;
  v8 = *(_QWORD *)(a1 + 56);
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, v5);

}

uint64_t __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_4(uint64_t result)
{
  _QWORD *v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = (_QWORD *)result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfEnableError:device:", v1[5], v1[6]);
    *(_BYTE *)(*(_QWORD *)(v1[7] + 8) + 24) = 1;
  }
  return result;
}

uint64_t __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_5(uint64_t result)
{
  _QWORD *v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = (_QWORD *)result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfEnableError:device:", v1[5], v1[6]);
    *(_BYTE *)(*(_QWORD *)(v1[7] + 8) + 24) = 1;
  }
  return result;
}

void __59__SFAutoUnlockManager_enableAutoUnlockWithDevice_passcode___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v2 = *(void **)(a1 + 32);
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0CB2FE0];
    v7 = *MEMORY[0x1E0CB2D50];
    v8[0] = CFSTR("nil device");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 22, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "onDelegateQueue_notifyDelegateOfEnableError:device:", v6, 0);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)cancelEnablingAutoUnlockForDevice:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3 && +[SFAutoUnlockManager autoUnlockSupported](SFAutoUnlockManager, "autoUnlockSupported"))
  {
    auto_unlock_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling enabling for device %@", buf, 0xCu);

    }
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__SFAutoUnlockManager_cancelEnablingAutoUnlockForDevice___block_invoke;
    v7[3] = &unk_1E482EC68;
    v8 = v3;
    objc_msgSend(v6, "unlockManagerWithCompletionHandler:", v7);

  }
}

void __57__SFAutoUnlockManager_cancelEnablingAutoUnlockForDevice___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint8_t buf[16];

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_296);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelEnablingAutoUnlockForDevice:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    auto_unlock_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling enable failed: missing proxy object", buf, 2u);
    }

  }
}

void __57__SFAutoUnlockManager_cancelEnablingAutoUnlockForDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  auto_unlock_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling enable failed: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)mockedDisableAutoUnlockForDevice:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *delegateQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateErrorCode") < 1)
  {
    v8 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateErrorCode");
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Custom error code");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBool:forKey:", 1, CFSTR("phoneAutoUnlockNoPairedWatch"));

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SFAutoUnlockManager_mockedDisableAutoUnlockForDevice___block_invoke;
  block[3] = &unk_1E482E0F0;
  v14 = v8;
  v15 = v4;
  v11 = v8;
  v12 = v4;
  dispatch_async(delegateQueue, block);

}

uint64_t __56__SFAutoUnlockManager_mockedDisableAutoUnlockForDevice___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 32));
}

- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *delegateQueue;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[3];
  char v26;
  _QWORD block[4];
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (+[SFAutoUnlockManager autoUnlockSupported](SFAutoUnlockManager, "autoUnlockSupported"))
    {
      if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
      {
        -[SFAutoUnlockManager mockedDisableAutoUnlockForDevice:](self, "mockedDisableAutoUnlockForDevice:", v7);
      }
      else if (v6)
      {
        v25[0] = 0;
        v25[1] = v25;
        v25[2] = 0x2020000000;
        v26 = 0;
        +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_2;
        v21[3] = &unk_1E482ECE0;
        v21[4] = self;
        v24 = v25;
        v23 = v7;
        v22 = v6;
        objc_msgSend(v17, "unlockManagerWithCompletionHandler:", v21);

        _Block_object_dispose(v25, 8);
      }
      else
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v29 = *MEMORY[0x1E0CB2D50];
        v30[0] = CFSTR("nil device");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v20);

      }
    }
    else
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke;
      block[3] = &unk_1E482DCC0;
      v28 = v7;
      dispatch_async(delegateQueue, block);

    }
  }
  else
  {
    auto_unlock_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SFAutoUnlockManager disableAutoUnlockForDevice:completionHandler:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

void __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), 115, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[4];
  id v18;
  __int128 v19;
  _QWORD v20[5];
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_3;
    v22[3] = &unk_1E482EB00;
    v22[4] = *(_QWORD *)(a1 + 32);
    v14 = *(_OWORD *)(a1 + 48);
    v7 = (id)v14;
    v23 = v14;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_5;
    v20[3] = &unk_1E482ECB8;
    v9 = *(_QWORD *)(a1 + 40);
    v20[4] = *(_QWORD *)(a1 + 32);
    v15 = *(_OWORD *)(a1 + 48);
    v10 = (id)v15;
    v21 = v15;
    objc_msgSend(v8, "disableAutoUnlockForDevice:completionHandler:", v9, v20);

    v11 = (void *)v23;
  }
  else
  {
    v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_7;
    block[3] = &unk_1E482EAD8;
    v16 = *(_OWORD *)(a1 + 48);
    v13 = (id)v16;
    v19 = v16;
    v18 = v5;
    dispatch_async(v12, block);

    v11 = (void *)v19;
  }

}

void __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_4;
  block[3] = &unk_1E482EAD8;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_4(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_6;
  block[3] = &unk_1E482EC90;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v13 = a2;
  v11 = v5;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_6(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __68__SFAutoUnlockManager_disableAutoUnlockForDevice_completionHandler___block_invoke_7(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)mockedAttemptAutoUnlock
{
  SFAutoUnlockDevice *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *delegateQueue;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString **v25;
  uint64_t *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString **v31;
  uint64_t *v32;
  void *v33;
  void *v34;
  int64_t v35;
  float v36;
  float v37;
  NSObject *v38;
  dispatch_time_t v39;
  NSObject *v40;
  _QWORD v41[5];
  SFAutoUnlockDevice *v42;
  _QWORD block[5];
  id v44;
  uint8_t buf[4];
  double v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  _QWORD v78[2];

  v78[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(SFAutoUnlockDevice);
  -[SFPeerDevice setName:](v3, "setName:", CFSTR("Apple Watch"));
  -[SFAutoUnlockDevice setModelName:](v3, "setModelName:", CFSTR("Apple Watch"));
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice setUniqueID:](v3, "setUniqueID:", v5);

  -[SFAutoUnlockManager beganAttemptWithDevice:](self, "beganAttemptWithDevice:", v3);
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch"))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v77 = *MEMORY[0x1E0CB2D50];
    v78[0] = CFSTR("Apple Watch Not Found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = 131;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoPairedWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoPairedWatch"))
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v75 = *MEMORY[0x1E0CB2D50];
    v76 = CFSTR("No enabled devices");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    v9 = 117;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockInBioLockout](SFAutoUnlockManager, "mockedPhoneAutoUnlockInBioLockout"))
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v73 = *MEMORY[0x1E0CB2D50];
    v74 = CFSTR("Phone in bio lockout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;
    v9 = 207;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoMask](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoMask"))
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v71 = *MEMORY[0x1E0CB2D50];
    v72 = CFSTR("No mask detected");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    v9 = 206;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNeverUnlocked](SFAutoUnlockManager, "mockedPhoneAutoUnlockNeverUnlocked"))
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v69 = *MEMORY[0x1E0CB2D50];
    v70 = CFSTR("Unlock phone with passcode or FaceID first");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v9 = 177;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchHasWeakPasscode](SFAutoUnlockManager, "mockedPhoneAutoUnlockWatchHasWeakPasscode"))
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v67 = *MEMORY[0x1E0CB2D50];
    SFLocalizedStringForKey(CFSTR("UNLOCK_PASSCODE_REQUIRED_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    v20 = 108;
    goto LABEL_18;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchWristDetectionDisabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockWatchWristDetectionDisabled"))
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v65 = *MEMORY[0x1E0CB2D50];
    SFLocalizedStringForKey(CFSTR("UNLOCK_WRIST_DETECTION_REQUIRED_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    v20 = 158;
    goto LABEL_18;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWiFiOff](SFAutoUnlockManager, "mockedPhoneAutoUnlockWiFiOff"))
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v63 = *MEMORY[0x1E0CB2D50];
    v64 = CFSTR("Phone WiFi disabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;
    v9 = 120;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockAWDLUnavailable](SFAutoUnlockManager, "mockedPhoneAutoUnlockAWDLUnavailable"))
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v61 = *MEMORY[0x1E0CB2D50];
    v62 = CFSTR("AWDL network failed to start");
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = &v62;
    v26 = &v61;
LABEL_27:
    objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v23;
    v9 = 192;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchWiFiOff](SFAutoUnlockManager, "mockedPhoneAutoUnlockWatchWiFiOff"))
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v59 = *MEMORY[0x1E0CB2D50];
    v60 = CFSTR("WiFi interface disabled on Watch");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v27;
    v9 = 199;
    goto LABEL_11;
  }
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchAWDLUnavailable](SFAutoUnlockManager, "mockedPhoneAutoUnlockWatchAWDLUnavailable"))
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v57 = *MEMORY[0x1E0CB2D50];
    v58 = CFSTR("Watch AWDL network failed to start");
    v24 = (void *)MEMORY[0x1E0C99D80];
    v25 = &v58;
    v26 = &v57;
    goto LABEL_27;
  }
  if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchLocked](SFAutoUnlockManager, "mockedPhoneAutoUnlockWatchLocked"))
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchOffWrist](SFAutoUnlockManager, "mockedPhoneAutoUnlockWatchOffWrist"))
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v53 = *MEMORY[0x1E0CB2D50];
      v54 = CFSTR("Cannot unlock while Watch not on wrist");
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = &v54;
      v32 = &v53;
    }
    else
    {
      if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchSleepModeOn](SFAutoUnlockManager, "mockedPhoneAutoUnlockWatchSleepModeOn"))
      {
        if (+[SFAutoUnlockManager mockedPhoneAutoUnlockWatchNoMotion](SFAutoUnlockManager, "mockedPhoneAutoUnlockWatchNoMotion"))
        {
          v33 = (void *)MEMORY[0x1E0CB35C8];
          v49 = *MEMORY[0x1E0CB2D50];
          v50 = CFSTR("No motion detected from Watch");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v33;
          v9 = 210;
        }
        else
        {
          if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateErrorCode") < 1)goto LABEL_39;
          v34 = (void *)MEMORY[0x1E0CB35C8];
          v35 = +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateErrorCode](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateErrorCode");
          v47 = *MEMORY[0x1E0CB2D50];
          v48 = CFSTR("Custom error code");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v34;
          v9 = v35;
        }
        goto LABEL_11;
      }
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2D50];
      v52 = CFSTR("Cannot unlock while in sleep mode");
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = &v52;
      v32 = &v51;
    }
    objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v29;
    v9 = 158;
LABEL_11:
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), v9, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v28 = (void *)MEMORY[0x1E0CB35C8];
  v55 = *MEMORY[0x1E0CB2D50];
  SFLocalizedStringForKey(CFSTR("UNLOCK_WATCH_LOCKED_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v28;
  v20 = 102;
LABEL_18:
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), v20, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  if (v14)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke;
    block[3] = &unk_1E482D3A0;
    block[4] = self;
    v44 = v14;
    v16 = v14;
    dispatch_async(delegateQueue, block);

    goto LABEL_42;
  }
LABEL_39:
  +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateLatency](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateLatency");
  v37 = v36;
  auto_unlock_log();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v46 = v37;
    _os_log_impl(&dword_1A2830000, v38, OS_LOG_TYPE_DEFAULT, "delaying unlock for %f sec", buf, 0xCu);
  }

  v39 = dispatch_time(0, (uint64_t)(float)(v37 * 1000000000.0));
  dispatch_get_global_queue(0, 0);
  v40 = objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_320;
  v41[3] = &unk_1E482D3A0;
  v41[4] = self;
  v42 = v3;
  dispatch_after(v39, v40, v41);

LABEL_42:
}

uint64_t __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(_QWORD *)(a1 + 40));
}

void __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_320(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  float v16;
  float v17;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD block[5];
  id v25;
  uint8_t buf[4];
  double v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateDevicesOutOfRange](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateDevicesOutOfRange");
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    SFLocalizedStringForKey(CFSTR("UNLOCK_OUT_OF_RANGE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), 130, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulatePhoneMissedFinalConfirmationToUnlock](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulatePhoneMissedFinalConfirmationToUnlock"))
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2D50];
      v31 = CFSTR("Confirmation failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 136;
    }
    else
    {
      if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateMagnetBreak](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateMagnetBreak"))goto LABEL_10;
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D50];
      v29 = CFSTR("Apple Watch Not Found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v11;
      v10 = 131;
    }
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), v10, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(NSObject **)(v12 + 16);
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_325;
    block[3] = &unk_1E482D3A0;
    block[4] = v12;
    v14 = v7;
    v25 = v14;
    dispatch_async(v13, block);

    goto LABEL_13;
  }
LABEL_10:
  auto_unlock_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2830000, v15, OS_LOG_TYPE_DEFAULT, "unlocked device", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "completedUnlockWithDevice:", *(_QWORD *)(a1 + 40));
  v14 = 0;
LABEL_13:
  +[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateManualReLock](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateManualReLock");
  if (v16 > 0.0)
  {
    v17 = v16;
    auto_unlock_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v17;
      _os_log_impl(&dword_1A2830000, v18, OS_LOG_TYPE_DEFAULT, "delaying relock for %f sec", buf, 0xCu);
    }

    v19 = dispatch_time(0, (uint64_t)(float)(v17 * 1000000000.0));
    dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v22[0] = v3;
    v22[1] = 3221225472;
    v22[2] = __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_326;
    v22[3] = &unk_1E482D3A0;
    v21 = *(void **)(a1 + 40);
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = v21;
    dispatch_after(v19, v20, v22);

  }
}

uint64_t __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_325(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__SFAutoUnlockManager_mockedAttemptAutoUnlock__block_invoke_326(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  auto_unlock_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "re-locking device", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "deviceRequestedRelock:", *(_QWORD *)(a1 + 40));
}

- (void)prewarmAutoUnlock
{
  id v2;

  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unlockManagerWithCompletionHandler:", &__block_literal_global_327);

}

void __40__SFAutoUnlockManager_prewarmAutoUnlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "prewarmAutoUnlock");

  }
}

- (void)completeAutoUnlockWithNotification:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SFAutoUnlockManager_completeAutoUnlockWithNotification___block_invoke;
  v5[3] = &__block_descriptor_33_e60_v24__0___SFUnlockProtocol__NSXPCProxyCreating__8__NSError_16l;
  v6 = a3;
  objc_msgSend(v4, "unlockManagerWithCompletionHandler:", v5);

}

void __58__SFAutoUnlockManager_completeAutoUnlockWithNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "completeAutoUnlockWithNotification:", *(unsigned __int8 *)(a1 + 32));

  }
}

- (void)donateDeviceUnlockedWithMask:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SFAutoUnlockManager_donateDeviceUnlockedWithMask___block_invoke;
  v5[3] = &__block_descriptor_33_e60_v24__0___SFUnlockProtocol__NSXPCProxyCreating__8__NSError_16l;
  v6 = a3;
  objc_msgSend(v4, "unlockManagerWithCompletionHandler:", v5);

}

void __52__SFAutoUnlockManager_donateDeviceUnlockedWithMask___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "donateDeviceUnlockedWithMask:", *(unsigned __int8 *)(a1 + 32));

  }
}

- (void)declinedToEnablePhoneAutoUnlock
{
  id v2;

  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unlockManagerWithCompletionHandler:", &__block_literal_global_330);

}

void __54__SFAutoUnlockManager_declinedToEnablePhoneAutoUnlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "clearPhoneAutoUnlockNotification:", 1);

  }
}

- (void)clearPhoneAutoUnlockBehaviorChangeNotification
{
  id v2;

  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unlockManagerWithCompletionHandler:", &__block_literal_global_333);

}

void __69__SFAutoUnlockManager_clearPhoneAutoUnlockBehaviorChangeNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "clearPhoneAutoUnlockNotification:", 0);

  }
}

- (void)attemptAutoUnlock
{
  NSObject *delegateQueue;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[3];
  char v7;
  _QWORD block[5];

  if (+[SFAutoUnlockManager autoUnlockSupported](SFAutoUnlockManager, "autoUnlockSupported"))
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
    {
      -[SFAutoUnlockManager mockedAttemptAutoUnlock](self, "mockedAttemptAutoUnlock");
    }
    else
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x2020000000;
      v7 = 0;
      +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_2;
      v5[3] = &unk_1E482EDD8;
      v5[4] = self;
      v5[5] = v6;
      objc_msgSend(v4, "unlockManagerWithCompletionHandler:", v5);

      _Block_object_dispose(v6, 8);
    }
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke;
    block[3] = &unk_1E482DF78;
    block[4] = self;
    dispatch_async(delegateQueue, block);
  }
}

void __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), 115, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "onDelegateQueue_notifyDelegateOfAttemptError:", v2);

}

void __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  __int128 v15;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_3;
    v14[3] = &unk_1E482EDB0;
    v15 = *(_OWORD *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attemptAutoUnlockWithClientProxy:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(NSObject **)(v8 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_5;
    block[3] = &unk_1E482ED88;
    v13 = v9;
    block[4] = v8;
    v12 = v5;
    dispatch_async(v10, block);
    v7 = v12;
  }

}

void __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_4;
  block[3] = &unk_1E482ED88;
  v9 = v3;
  v10 = v5;
  block[4] = v4;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_4(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(_QWORD *)(result + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __40__SFAutoUnlockManager_attemptAutoUnlock__block_invoke_5(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(_QWORD *)(result + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)attemptAutoUnlockWithoutNotifyingWatch
{
  NSObject *delegateQueue;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[3];
  char v7;
  _QWORD block[5];

  if (+[SFAutoUnlockManager autoUnlockSupported](SFAutoUnlockManager, "autoUnlockSupported"))
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
    {
      -[SFAutoUnlockManager mockedAttemptAutoUnlock](self, "mockedAttemptAutoUnlock");
    }
    else
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x2020000000;
      v7 = 0;
      +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_2;
      v5[3] = &unk_1E482EDD8;
      v5[4] = self;
      v5[5] = v6;
      objc_msgSend(v4, "unlockManagerWithCompletionHandler:", v5);

      _Block_object_dispose(v6, 8);
    }
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke;
    block[3] = &unk_1E482DF78;
    block[4] = self;
    dispatch_async(delegateQueue, block);
  }
}

void __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), 115, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "onDelegateQueue_notifyDelegateOfAttemptError:", v2);

}

void __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  __int128 v15;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_3;
    v14[3] = &unk_1E482EDB0;
    v15 = *(_OWORD *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attemptAutoUnlockWithoutNotifyingWatchWithClientProxy:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(NSObject **)(v8 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_5;
    block[3] = &unk_1E482ED88;
    v13 = v9;
    block[4] = v8;
    v12 = v5;
    dispatch_async(v10, block);
    v7 = v12;
  }

}

void __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_4;
  block[3] = &unk_1E482ED88;
  v9 = v3;
  v10 = v5;
  block[4] = v4;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_4(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(_QWORD *)(result + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __61__SFAutoUnlockManager_attemptAutoUnlockWithoutNotifyingWatch__block_invoke_5(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(_QWORD *)(result + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)attemptAutoUnlockForSiri
{
  NSObject *delegateQueue;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[3];
  char v7;
  _QWORD block[5];

  if (+[SFAutoUnlockManager autoUnlockSupported](SFAutoUnlockManager, "autoUnlockSupported"))
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
    {
      -[SFAutoUnlockManager mockedAttemptAutoUnlock](self, "mockedAttemptAutoUnlock");
    }
    else
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x2020000000;
      v7 = 0;
      +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_2;
      v5[3] = &unk_1E482EDD8;
      v5[4] = self;
      v5[5] = v6;
      objc_msgSend(v4, "unlockManagerWithCompletionHandler:", v5);

      _Block_object_dispose(v6, 8);
    }
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke;
    block[3] = &unk_1E482DF78;
    block[4] = self;
    dispatch_async(delegateQueue, block);
  }
}

void __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), 115, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "onDelegateQueue_notifyDelegateOfAttemptError:", v2);

}

void __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  __int128 v15;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_3;
    v14[3] = &unk_1E482EDB0;
    v15 = *(_OWORD *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attemptAutoUnlockForSiriWithClientProxy:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(NSObject **)(v8 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_5;
    block[3] = &unk_1E482ED88;
    v13 = v9;
    block[4] = v8;
    v12 = v5;
    dispatch_async(v10, block);
    v7 = v12;
  }

}

void __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_4;
  block[3] = &unk_1E482ED88;
  v9 = v3;
  v10 = v5;
  block[4] = v4;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_4(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(_QWORD *)(result + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __47__SFAutoUnlockManager_attemptAutoUnlockForSiri__block_invoke_5(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(_QWORD *)(result + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)mockedCancelUnlock
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateDevicesOutOfRange](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateDevicesOutOfRange"))
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    SFLocalizedStringForKey(CFSTR("UNLOCK_OUT_OF_RANGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), 130, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulatePhoneMissedFinalConfirmationToUnlock](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulatePhoneMissedFinalConfirmationToUnlock"))
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      v14 = CFSTR("Confirmation failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = 136;
    }
    else
    {
      if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockSimulateMagnetBreak](SFAutoUnlockManager, "mockedPhoneAutoUnlockSimulateMagnetBreak"))
      {
        v6 = 0;
        goto LABEL_9;
      }
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB2D50];
      v12 = CFSTR("Apple Watch Not Found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10;
      v9 = 131;
    }
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("SFAutoUnlockErrorDomain"), v9, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  -[SFAutoUnlockManager failedUnlockWithError:](self, "failedUnlockWithError:", v6);

}

- (void)cancelAutoUnlock
{
  id v3;

  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    -[SFAutoUnlockManager mockedCancelUnlock](self, "mockedCancelUnlock");
  }
  else
  {
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unlockManagerWithCompletionHandler:", &__block_literal_global_334);

  }
}

void __39__SFAutoUnlockManager_cancelAutoUnlock__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelAutoUnlock");

  }
}

+ (NSUserDefaults)userDefaults
{
  if (userDefaults_onceToken != -1)
    dispatch_once(&userDefaults_onceToken, &__block_literal_global_335);
  return (NSUserDefaults *)(id)userDefaults_userDefaults;
}

void __35__SFAutoUnlockManager_userDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.sharing.autounlock"));
  v1 = (void *)userDefaults_userDefaults;
  userDefaults_userDefaults = v0;

}

+ (BOOL)mockedPhoneAutoUnlockEnabled
{
  void *v2;
  char v3;

  if (!IsAppleInternalBuild() || !_os_feature_enabled_impl())
    return 0;
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("phoneAutoUnlockEnabled"));

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockInBioLockout
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled");
  if (v2)
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockInBioLockout"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockFaceIDDisabled
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled");
  if (v2)
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockFaceIDDisabled"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockNeverUnlocked
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled");
  if (v2)
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockNeverUnlocked"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockMaskUnlikely
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled");
  if (v2)
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockMaskUnlikely"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockNoMask
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled");
  if (v2)
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockNoMask"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockWiFiOff
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled");
  if (v2)
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockWiFiOff"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockAWDLUnavailable
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled");
  if (v2)
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockAWDLUnavailable"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockNoWatch
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled");
  if (v2)
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockNoWatch"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockNoPairedWatch
{
  void *v2;
  char v3;

  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    return 0;
  }
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("phoneAutoUnlockNoPairedWatch"));

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchHasWeakPasscode
{
  void *v2;
  char v3;

  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    return 0;
  }
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("phoneAutoUnlockWatchHasWeakPasscode"));

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchWristDetectionDisabled
{
  void *v2;
  char v3;

  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    return 0;
  }
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("phoneAutoUnlockWatchWristDetectionDisabled"));

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchLocked
{
  void *v2;
  char v3;

  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    return 0;
  }
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("phoneAutoUnlockWatchLocked"));

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchOffWrist
{
  void *v2;
  char v3;

  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    return 0;
  }
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("phoneAutoUnlockWatchOffWrist"));

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchWiFiOff
{
  void *v2;
  char v3;

  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    return 0;
  }
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("phoneAutoUnlockWatchWiFiOff"));

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchAWDLUnavailable
{
  void *v2;
  char v3;

  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    return 0;
  }
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("phoneAutoUnlockWatchAWDLUnavailable"));

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchSleepModeOn
{
  void *v2;
  char v3;

  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    return 0;
  }
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("phoneAutoUnlockWatchSleepModeOn"));

  return v3;
}

+ (BOOL)mockedPhoneAutoUnlockWatchNoMotion
{
  void *v2;
  char v3;

  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockNoWatch](SFAutoUnlockManager, "mockedPhoneAutoUnlockNoWatch")|| !+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    return 0;
  }
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("phoneAutoUnlockWatchNoMotion"));

  return v3;
}

+ (float)mockedPhoneAutoUnlockSimulateLatency
{
  float v2;
  void *v3;
  float v4;
  void *v5;
  float v6;

  v2 = 0.0;
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "floatForKey:", CFSTR("phoneAutoUnlockSimulateLatency"));
    if (v4 != 0.0)
    {
      +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "floatForKey:", CFSTR("phoneAutoUnlockSimulateLatency"));
      v2 = v6;

    }
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockSimulateDevicesOutOfRange
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled");
  if (v2)
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockSimulateDevicesOutOfRange"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockSimulatePhoneMissedFinalConfirmationToUnlock
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled");
  if (v2)
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockSimulatePhoneMissedFinalConfirmationToUnlock"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)mockedPhoneAutoUnlockSimulateMagnetBreak
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled");
  if (v2)
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockSimulateMagnetBreak"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (float)mockedPhoneAutoUnlockSimulateManualReLock
{
  float v2;
  void *v3;
  float v4;
  void *v5;
  float v6;

  v2 = 0.0;
  if (+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))
  {
    +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "floatForKey:", CFSTR("phoneAutoUnlockSimulateManualReLock"));
    if (v4 != 0.0)
    {
      +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "floatForKey:", CFSTR("phoneAutoUnlockSimulateManualReLock"));
      v2 = v6;

    }
  }
  return v2;
}

+ (int64_t)mockedPhoneAutoUnlockSimulateErrorCode
{
  void *v2;
  int64_t v3;

  if (!+[SFAutoUnlockManager mockedPhoneAutoUnlockEnabled](SFAutoUnlockManager, "mockedPhoneAutoUnlockEnabled"))return 0;
  +[SFAutoUnlockManager userDefaults](SFAutoUnlockManager, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("phoneAutoUnlockSimulateErrorCode")) != 0;

  return v3;
}

- (void)onDelegateQueue_notifyDelegateOfEnableError:(id)a3 device:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "code") != 118)
  {
    -[SFAutoUnlockManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[SFAutoUnlockManager delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "manager:failedToEnableDevice:error:", self, v6, v10);

    }
  }

}

- (void)onDelegateQueue_notifyDelegateOfAttemptError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SFAutoUnlockManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SFAutoUnlockManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "manager:failedAttemptWithError:", self, v7);

  }
}

- (void)keyDeviceLocked:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SFAutoUnlockManager delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SFAutoUnlockManager_keyDeviceLocked___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __39__SFAutoUnlockManager_keyDeviceLocked___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manager:enablingLockedDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)enabledDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SFAutoUnlockManager delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__SFAutoUnlockManager_enabledDevice___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __37__SFAutoUnlockManager_enabledDevice___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manager:didEnableDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)failedToEnableDevice:(id)a3 error:(id)a4
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
  -[SFAutoUnlockManager delegateQueue](self, "delegateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SFAutoUnlockManager_failedToEnableDevice_error___block_invoke;
  block[3] = &unk_1E482EBA0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

uint64_t __50__SFAutoUnlockManager_failedToEnableDevice_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onDelegateQueue_notifyDelegateOfEnableError:device:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)beganAttemptWithDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SFAutoUnlockManager delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__SFAutoUnlockManager_beganAttemptWithDevice___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __46__SFAutoUnlockManager_beganAttemptWithDevice___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manager:beganAttemptWithDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)completedUnlockWithDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SFAutoUnlockManager delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SFAutoUnlockManager_completedUnlockWithDevice___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__SFAutoUnlockManager_completedUnlockWithDevice___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manager:completedUnlockWithDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)failedUnlockWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SFAutoUnlockManager delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SFAutoUnlockManager_failedUnlockWithError___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __45__SFAutoUnlockManager_failedUnlockWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onDelegateQueue_notifyDelegateOfAttemptError:", *(_QWORD *)(a1 + 40));
}

- (void)deviceRequestedRelock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SFAutoUnlockManager delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SFAutoUnlockManager_deviceRequestedRelock___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__SFAutoUnlockManager_deviceRequestedRelock___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manager:deviceRequestedRelock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)autoUnlockStateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E482EE50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "unlockManagerWithCompletionHandler:", v7);

}

void __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_2;
    v17[3] = &unk_1E482EE00;
    v7 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E482EE28;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v8, "autoUnlockStateWithCompletionHandler:", v15);

    v9 = v18;
  }
  else
  {
    v10 = *(void **)(a1 + 40);
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_5;
    block[3] = &unk_1E482E0F0;
    v14 = v10;
    v13 = v5;
    dispatch_async(v11, block);

    v9 = v14;
  }

}

void __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E482E0F0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "integerValue"), v5);

}

uint64_t __60__SFAutoUnlockManager_autoUnlockStateWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)authPromptInfoWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E482EE50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "unlockManagerWithCompletionHandler:", v7);

}

void __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_2;
    v17[3] = &unk_1E482EE00;
    v7 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v7;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E482EE78;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v8, "authPromptInfoWithCompletionHandler:", v15);

    v9 = v18;
  }
  else
  {
    v10 = *(void **)(a1 + 40);
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_5;
    block[3] = &unk_1E482E0F0;
    v14 = v10;
    v13 = v5;
    dispatch_async(v11, block);

    v9 = v14;
  }

}

void __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E482E0F0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__SFAutoUnlockManager_authPromptInfoWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (SFAutoUnlockManagerDelegate)delegate
{
  return (SFAutoUnlockManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)autoUnlockEnabled
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138412802;
  v4 = CFSTR("com.apple.sharing:/AutoUnlock/Enabled");
  v5 = 2112;
  v6 = a1;
  v7 = 1024;
  v8 = a2;
  _os_log_debug_impl(&dword_1A2830000, log, OS_LOG_TYPE_DEBUG, "Dynamic store path: %@, uid: %@, enabled: %d", (uint8_t *)&v3, 0x1Cu);
}

- (void)eligibleAutoUnlockDevicesWithCompletionHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "eligibleAutoUnlockDevicesWithCompletionHandler: missing completion handler", a5, a6, a7, a8, 0);
}

- (void)disableAutoUnlockForDevice:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "disableAutoUnlockForDevice: missing completion handler", a5, a6, a7, a8, 0);
}

@end
